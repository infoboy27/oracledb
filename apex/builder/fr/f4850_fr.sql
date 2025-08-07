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
,p_default_application_id=>4852
,p_default_id_offset=>0
,p_default_owner=>'APEX_240200'
);
end;
/
 
prompt APPLICATION 4852 - Oracle APEX RESTful Services
--
-- Application Export:
--   Application:     4852
--   Name:            Oracle APEX RESTful Services
--   Exported By:     APEX_240200
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                     29
--       Items:                   88
--       Validations:             19
--       Processes:               35
--       Regions:                 78
--       Buttons:                 84
--       Dynamic Actions:         42
--     Shared Components:
--       Logic:
--         Items:                 11
--         Processes:             12
--         Computations:          10
--         Build Options:          2
--       Navigation:
--         Lists:                  6
--         Breadcrumbs:            1
--           Entries:             25
--         NavBar Entries:         3
--       Security:
--         Authentication:         1
--         Authorization:         12
--       User Interface:
--         Templates:
--           Page:                 9
--           Region:              31
--           Label:               10
--           List:                12
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           2
--           Button:              11
--           Report:              10
--         LOVs:                   8
--         Shortcuts:              2
--         Plug-ins:              14
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
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Oracle APEX RESTful Services')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'A128000154831713252')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt_last_reset=>'20250422175108'
,p_bookmark_checksum_function=>'SH1'
,p_compatibility_mode=>'24.2'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'fr'
,p_flow_language_derived_from=>'SESSION'
,p_date_format=>'&DATE_FORMAT.'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(540039604917681918.4852)
,p_populate_roles=>'A'
,p_application_tab_set=>1
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
,p_browser_frame=>'S'
,p_deep_linking=>'Y'
,p_security_scheme=>wwv_flow_imp.id(803273801918815227)
,p_authorize_public_pages_yn=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'wwv_flow_error_dev.internal_error_handler'
,p_substitution_string_01=>'MSG_LANGUAGE'
,p_substitution_value_01=>'Langue'
,p_substitution_string_02=>'MSG_USER'
,p_substitution_value_02=>'Utilisateur'
,p_substitution_string_03=>'MSG_COMPANY'
,p_substitution_value_03=>'Espace de travail : &COMPANY.'
,p_substitution_string_04=>'DELETE_MSG'
,p_substitution_value_04=>'Voulez-vous effectuer cette action de suppression ?'
,p_substitution_string_05=>'PRODUCT_NAME'
,p_substitution_value_05=>'Oracle APEX'
,p_substitution_string_06=>'HELP'
,p_substitution_value_06=>'Aide'
,p_substitution_string_07=>'EDIT'
,p_substitution_value_07=>'Modifier'
,p_substitution_string_08=>'MSG_COPYRIGHT'
,p_substitution_value_08=>unistr('Copyright &copy; 1999, 2024, Oracle et/ou ses affili\00E9s.')
,p_substitution_string_09=>'DATE_FORMAT'
,p_substitution_value_09=>'dd/mm/rr'
,p_substitution_string_10=>'CLOSE'
,p_substitution_value_10=>'Fermer'
,p_substitution_string_11=>'CONFIRM'
,p_substitution_value_11=>'Confirmer'
,p_substitution_string_12=>'MSG_JSCRIPT'
,p_substitution_value_12=>unistr('JavaScript doit \00EAtre activ\00E9 lorsque vous ex\00E9cutez ce produit.')
,p_substitution_string_13=>'TOP'
,p_substitution_value_13=>'Haut'
,p_substitution_string_14=>'MSG_WORKSPACE'
,p_substitution_value_14=>'Espace de travail'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_version_scn=>2514321
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(4852)
,p_theme_id=>3
,p_home_url=>'f?p=&APP_ID.:500:&SESSION.'
,p_login_url=>'f?p=4550:1:&SESSION.'
,p_theme_style_by_user_pref=>false
,p_global_page_id=>.4852
,p_navigation_list_id=>wwv_flow_imp.id(719172975581246435.4852)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(719752075880969362.4852)
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
 p_id=>wwv_flow_imp.id(5403642708844576.4852)
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
prompt --application/shared_components/navigation/lists/restful_serivice_list
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(510815015887059019.4852)
,p_name=>'RESTful Serivice List'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558466
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(510815684261079572.4852)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Services RESTful bas\00E9s sur ORDS')
,p_list_item_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.::P0_SELECTED_NODE:RS-10:'
,p_list_item_icon=>'icon-rest-services'
,p_list_text_01=>unistr('Cr\00E9ez et g\00E9rez des services RESTful \00E0 l''aide du r\00E9f\00E9rentiel bas\00E9 sur ORDS.')
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_5_administration_header
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(697672714234539780.4852)
,p_name=>'APEX 5 - Administration (Header)'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558466
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697672931942539782.4852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=4350:1:&APP_SESSION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697673242694539782.4852)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('G\00E9rer un service')
,p_security_scheme=>wwv_flow_imp.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697673887665539782.4852)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>unistr('G\00E9rer un service')
,p_list_item_link_target=>'f?p=4350:21:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697674127826539782.4852)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'------'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697674400346539783.4852)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Faire une demande de service'
,p_list_item_link_target=>'f?p=4350:96:&SESSION.::NO:49::'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''SERVICE_REQUESTS_ENABLED'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_security_scheme=>wwv_flow_imp.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697674737416539784.4852)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>unistr('D\00E9finir des pr\00E9f\00E9rences d''espace de travail')
,p_list_item_link_target=>'f?p=4350:17:&SESSION.::NO:RP::'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697675002004539785.4852)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>unistr('D\00E9finir un message d''espace de travail')
,p_list_item_link_target=>'f?p=4350:35:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(180645360524520817.4852)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>unistr('D\00E9finir une banni\00E8re d''environnement')
,p_list_item_link_target=>'f?p=4350:105:&SESSION.:::105:P105_LAST_APP_ID,P105_LAST_PAGE_ID:&APP_ID.,&APP_PAGE_ID.'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697675352821539785.4852)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Utilisation d''espace de travail'
,p_list_item_link_target=>'f?p=4350:101:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2200213592368934.4852)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>unistr('G\00E9rer les liens d''extension')
,p_list_item_link_target=>'f?p=4350:110:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(697673509734539782.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697675698018539786.4852)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('G\00E9rer les utilisateurs et les groupes')
,p_list_item_link_target=>'f?p=4350:55:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(852575108977939507)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697675965880539786.4852)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Surveiller l''activit\00E9')
,p_list_item_link_target=>'f?p=4350:22:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(10759203169791179)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697676290030539786.4852)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tableaux de bord'
,p_list_item_link_target=>'f?p=4350:33:&SESSION.'
,p_security_scheme=>wwv_flow_imp.id(10759203169791179)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1250965925147232831.4852)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Changer mon mot de passe'
,p_list_item_link_target=>'f?p=4350:3:&SESSION.::&DEBUG.:3#pwd'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_authentication_dev.can_edit_builder_users'
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(10759203169791179)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_5_help
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(697677732086541316.4852)
,p_name=>'APEX 5 - Help'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558466
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697677972603541317.4852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Documentation'
,p_list_item_link_target=>'&SYSTEM_HELP_URL.'
,p_list_text_01=>'helpLinkDocLib'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2105957308761058240.4852)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Forum de discussion'
,p_list_item_link_target=>'https://apex.oracle.com/forum'
,p_list_text_01=>'helpLinkForum'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2185502966910586903.4852)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'En savoir plus sur Oracle APEX'
,p_list_item_link_target=>'https://apex.oracle.com'
,p_list_text_01=>'helpLinkOTN'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697678894738541317.4852)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(697679129392541317.4852)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'A propos de'
,p_list_item_link_target=>'f?p=4350:9:&SESSION.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
end;
/
prompt --application/shared_components/navigation/lists/apex_shared_navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(719172975581246435.4852)
,p_name=>'APEX Shared Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>117449631
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'App Builder'
,p_list_item_link_target=>'f?p=4000:1500:&SESSION.::&DEBUG.::::'
,p_list_item_icon_alt_attribute=>'Analyse descendante d''App Builder'
,p_list_text_01=>'tab-app-builder'
,p_security_scheme=>wwv_flow_imp.id(6685808796641112)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID in ( 4000, 4020 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2363340054227534.4852)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Cr\00E9er')
,p_list_item_link_target=>'f?p=4000:56:&SESSION.::&DEBUG.:56,103,104,106,130,131,35,227,3020,3000,3001:FB_FLOW_ID,FB_FLOW_PAGE_ID::'
,p_parent_list_item_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2363786792227534.4852)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Importer'
,p_list_item_link_target=>'f?p=4000:460:&SESSION.::&DEBUG.:460:P460_FILE_TYPE:FLOW_EXPORT:'
,p_parent_list_item_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2364131272227534.4852)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Exporter'
,p_list_item_link_target=>'f?p=4000:4900:&SESSION.::&DEBUG.:4900:FB_FLOW_ID,FB_FLOW_PAGE_ID::'
,p_parent_list_item_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2364508428227534.4852)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Utilitaires d''espace de travail'
,p_parent_list_item_id=>wwv_flow_imp.id(2362945842227534.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2365358906227535.4852)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Tous les utilitaires d''espace de travail'
,p_list_item_link_target=>'f?p=4000:182:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2365729367227535.4852)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2366142205227535.4852)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>unistr('Th\00E8mes d''espace de travail')
,p_list_item_link_target=>'f?p=4000:763:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2366555524227535.4852)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Groupes d''applications'
,p_list_item_link_target=>'f?p=4000:722:&SESSION.::&DEBUG.:RP'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2366943029227535.4852)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Vues &PRODUCT_NAME.'
,p_list_item_link_target=>'f?p=4000:714:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2367351165227535.4852)
,p_list_item_display_sequence=>150
,p_list_item_link_text=>'Etats inter-applications'
,p_list_item_link_target=>'f?p=4000:9009:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2364980531227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'SQL Workshop'
,p_list_item_link_target=>'f?p=4500:3002:&SESSION.'
,p_list_item_icon_alt_attribute=>'Analyse descendante de SQL Workshop'
,p_list_text_01=>'tab-sql-workshop'
,p_security_scheme=>wwv_flow_imp.id(6685907847641114)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>'( :APP_ID = 4500 and :APP_PAGE_ID not in ( ''1000'',''8000'',''35'', ''900'' ) ) or :APP_ID in ( 4850, 4300 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2368143098227535.4852)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>'Navigateur d''objet'
,p_list_item_link_target=>'f?p=4500:2000:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2368555703227536.4852)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>'Commandes SQL'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2368912227227536.4852)
,p_list_item_display_sequence=>180
,p_list_item_link_text=>'Scripts SQL'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_display_sequence=>190
,p_list_item_link_text=>'Utilitaires'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2369711120227536.4852)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Tous les utilitaires'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2370173370227536.4852)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2370526553227536.4852)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>unistr('Atelier de donn\00E9es')
,p_list_item_link_target=>'f?p=4300:1:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2370960105227536.4852)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>unistr('G\00E9n\00E9rateur de donn\00E9es')
,p_list_item_link_target=>'f?p=4500:4000:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_security_scheme=>wwv_flow_imp.id(1757106315018737)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2371332357227536.4852)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>unistr('Concepteur de requ\00EAtes')
,p_list_item_link_target=>'f?p=4500:1002:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2371763285227536.4852)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>'Quick SQL'
,p_list_item_link_target=>'f?p=4500:1100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2372197440227537.4852)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>unistr('Ensembles de donn\00E9es \00E9chantillon')
,p_list_item_link_target=>'f?p=4300:100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2372592623227537.4852)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>unistr('G\00E9n\00E9rer du DDL')
,p_list_item_link_target=>'f?p=4500:12:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2372986400227537.4852)
,p_list_item_display_sequence=>300
,p_list_item_link_text=>unistr('Valeurs par d\00E9faut d''interface utilisateur')
,p_list_item_link_target=>'f?p=4500:813:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2373396922227537.4852)
,p_list_item_display_sequence=>310
,p_list_item_link_text=>unistr('Comparaison de sch\00E9mas')
,p_list_item_link_target=>'f?p=4500:1350:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2373793183227537.4852)
,p_list_item_display_sequence=>320
,p_list_item_link_text=>unistr('M\00E9thodes sur les tables')
,p_list_item_link_target=>'f?p=4500:120:&SESSION.:'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2374164216227537.4852)
,p_list_item_display_sequence=>330
,p_list_item_link_text=>'Corbeille'
,p_list_item_link_target=>'f?p=4500:1070:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2374559018227537.4852)
,p_list_item_display_sequence=>340
,p_list_item_link_text=>'Etats sur les objets'
,p_list_item_link_target=>'f?p=4500:1042:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2374987311227537.4852)
,p_list_item_display_sequence=>350
,p_list_item_link_text=>unistr('A propos de la base de donn\00E9es')
,p_list_item_link_target=>'f?p=4500:36:&SESSION.'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''ALLOW_DB_MONITOR'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2375357946227538.4852)
,p_list_item_display_sequence=>360
,p_list_item_link_text=>unistr('Moniteur de base de donn\00E9es')
,p_list_item_link_target=>'f?p=4500:11:&SESSION.'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'wwv_flow_platform.get_preference(''ALLOW_DB_MONITOR'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_parent_list_item_id=>wwv_flow_imp.id(2369350947227536.4852)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2375792217227538.4852)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>'Services RESTful'
,p_list_item_link_target=>'f?p=4850:100:&SESSION.'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_security_scheme=>wwv_flow_imp.id(803273801918815227)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2376160133227538.4852)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'SQL Developer Web'
,p_list_item_link_target=>'f?p=4500:64:&SESSION.::&DEBUG.:64:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2367727565227535.4852)
,p_security_scheme=>wwv_flow_imp.id(11405847061717473)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('D\00E9veloppement d''\00E9quipe')
,p_list_item_link_target=>'f?p=4600:1:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon_alt_attribute=>unistr('Analyse descendante de d\00E9veloppement d''\00E9quipe')
,p_list_text_01=>'tab-team-dev'
,p_security_scheme=>wwv_flow_imp.id(6686010157641115)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID in ( 4600, 4650 )'
,p_list_item_current_language=>'PLSQL'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2376980226227538.4852)
,p_list_item_display_sequence=>370
,p_list_item_link_text=>unistr('Libell\00E9s')
,p_list_item_link_target=>'f?p=4600:300:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2377378636227538.4852)
,p_list_item_display_sequence=>380
,p_list_item_link_text=>'Jalons'
,p_list_item_link_target=>'f?p=4600:200:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2377769869227538.4852)
,p_list_item_display_sequence=>390
,p_list_item_link_text=>unistr('Mod\00E8les')
,p_list_item_link_target=>'f?p=4600:1000:&SESSION.::&DEBUG.:RP:::'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2378193610227538.4852)
,p_list_item_display_sequence=>400
,p_list_item_link_text=>'Utilitaires'
,p_list_item_link_target=>'f?p=4600:2000:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2378514150227539.4852)
,p_list_item_display_sequence=>410
,p_list_item_link_text=>'-----'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2378966648227539.4852)
,p_list_item_display_sequence=>420
,p_list_item_link_text=>'Informations en retour'
,p_list_item_link_target=>'f?p=4650:8012:&SESSION.::&DEBUG.::::'
,p_parent_list_item_id=>wwv_flow_imp.id(2376592988227538.4852)
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2379380397227539.4852)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Galerie'
,p_list_item_link_target=>'f?p=4750:50:&SESSION.'
,p_list_text_01=>'tab-apps'
,p_security_scheme=>wwv_flow_imp.id(852581401782939524)
,p_list_item_current_type=>'EXPRESSION'
,p_list_item_current_for_pages=>':APP_ID = 4750'
,p_list_item_current_language=>'PLSQL'
);
end;
/
prompt --application/shared_components/navigation/lists/icon_navigation
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(873550610677863830.4852)
,p_name=>'icon navigation'
,p_list_status=>'PUBLIC'
,p_version_scn=>75558471
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873550831158863831.4852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Navigateur d''objet'
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_list_item_icon=>'htmldb/icons/ob_browser.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873551124330863831.4852)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Commandes SQL'
,p_list_item_link_target=>'f?p=4500:1003:&SESSION.'
,p_list_item_icon=>'htmldb/icons/sqlcmd.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873551403588863831.4852)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Scripts SQL'
,p_list_item_link_target=>'f?p=4500:1004:&SESSION.'
,p_list_item_icon=>'htmldb/icons/sqlscrpt.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873831932541898524.4852)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>unistr('Concepteur de requ\00EAtes')
,p_list_item_link_target=>'f?p=4500:1001:&SESSION.'
,p_list_item_icon=>'htmldb/icons/qbuilder.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873551715997863831.4852)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Utilitaires'
,p_list_item_link_target=>'f?p=4500:1005:&SESSION.'
,p_list_item_icon=>'htmldb/icons/shared_comp_small.gif'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(873552006687863831.4852)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Services RESTful'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'htmldb/icons/dbservice.png'
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
 p_id=>wwv_flow_imp.id(1151865522478153.4852)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>7007820
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1371013842453400.4852)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>7007816
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1377425574781254.4852)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>16260271
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1402136295183079.4852)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>243440322
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(3289592544139230.4852)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>117643766
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(14859207420941042.4852)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>6539585
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(99845214131888905.4852)
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
 p_id=>wwv_flow_imp.id(118481691977833028.4852)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(123214470474478467.4852)
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
 p_id=>wwv_flow_imp.id(124390119781989299.4852)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>37165931336889
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(176129453438506820.4852)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>7007823
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1765073360593712056.4852)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1831780697822994156.4852)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>1088662545
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1917672636565940088.4852)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>7007824
);
end;
/
prompt --application/shared_components/security/authorizations/flow_data_generator
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(1757106315018737.4852)
,p_name=>'Flow: DATA_GENERATOR'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'DATA_GENERATOR'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 utiliser le g\00E9n\00E9rateur de donn\00E9es dans SQL Workshop')
,p_version_scn=>2609100
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/extension_links_exist
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(5000735077191350.4852)
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
prompt --application/shared_components/security/authorizations/apex_5_0_app_builder_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(6685808796641112.4852)
,p_name=>'APEX 5.0 App Builder Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 effectuer cette op\00E9ration')
,p_version_scn=>2609100
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/apex_5_0_sql_workshop_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(6685907847641114.4852)
,p_name=>'APEX 5.0 SQL Workshop Enabled'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'SQL'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 effectuer cette op\00E9ration')
,p_version_scn=>2609100
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/apex_5_0_team_development_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(6686010157641115.4852)
,p_name=>'APEX 5.0 Team development enabled'
,p_scheme_type=>'NATIVE_EXISTS'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'from wwv_flow_companies w, wwv_flow_fnd_user u',
'where nvl(w.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'' and ',
'      w.PROVISIONING_COMPANY_ID = :flow_security_group_id and',
'      u.security_group_id = :flow_security_group_id and',
'      u.USER_NAME = upper(:app_user) and',
'      nvl(u.ALLOW_TEAM_DEVELOPMENT_YN,''Y'') = ''Y'''))
,p_error_message=>unistr('Le d\00E9veloppement d''\00E9quipe n''est pas activ\00E9 pour cet espace de travail')
,p_version_scn=>2609100
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/dashboard_access
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(10759203169791179.4852)
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
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 acc\00E9der aux tableaux de bord ni \00E0 la surveillance de l''activit\00E9.')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/sql_developer_web_enabled
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(11405847061717473.4852)
,p_name=>'SQL Developer Web enabled'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    return wwv_flow_listener.sql_developer_web_enabled;',
'end;'))
,p_error_message=>unistr('Le lien SQL Developer Web n''est pas activ\00E9 pour cette instance.')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/ords_access_allowed
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(538579044595390057.4852)
,p_name=>'ORDS_ACCESS_ALLOWED'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_min_ver_met varchar2(10) := ''FALSE'';',
'begin ',
'    l_min_ver_met := wwv_flow_rest_ws.ords_min_ver_met(p_current_version => wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema));',
'    --',
'    if l_min_ver_met = ''TRUE'' then ',
'       return TRUE; ',
'    else',
'       return FALSE;',
'    end if;',
'end;'))
,p_error_message=>unistr('La section ORDS de REST Workshop n''est pas disponible. Cela est probablement d\00FB \00E0 une version insuffisante d''ORDS.')
,p_version_scn=>75558471
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_restful
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(803273801918815227.4852)
,p_name=>'Flow: RESTFUL'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'RESTFUL'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 effectuer cette op\00E9ration')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_admin
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(852575108977939507.4852)
,p_name=>'Flow: ADMIN'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'ADMIN'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 administrer les applications')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/flow_edit
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(852581401782939524.4852)
,p_name=>'Flow: EDIT'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_attribute_01=>'EDIT'
,p_error_message=>unistr('Vous n''\00EAtes pas autoris\00E9 \00E0 modifier les applications')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/security/authorizations/sso_authentication
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(873288123790839255.4852)
,p_name=>'SSO authentication'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return wwv_flow_authentication_dev.get_internal_authentication not in (''APEX'',''CLOUD_IDM'',''LDAP'',''DB'');'
,p_error_message=>unistr('Le SSO du g\00E9n\00E9rateur n''est pas activ\00E9')
,p_version_scn=>2609103
,p_caching=>'BY_USER_BY_SESSION'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(872399403957776718.4852)
,p_icon_sequence=>1
,p_icon_image=>'Workspace &COMPANY.'
,p_icon_subtext=>'Espace de travail &COMPANY.'
,p_icon_target=>'#'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(873191312015835823.4852)
,p_icon_sequence=>2
,p_icon_subtext=>'( <span style="text-decoration:underline;">Changer d''espace de travail</span> )'
,p_icon_target=>'f?p=4550:20'
,p_icon_image_alt=>'Changer d''espace de travail'
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
,p_security_scheme=>wwv_flow_imp.id(873288123790839255)
);
wwv_flow_imp_shared.create_icon_bar_item(
 p_id=>wwv_flow_imp.id(6685705047641105.4852)
,p_icon_sequence=>99
,p_icon_subtext=>unistr('( <span style="text-decoration:underline;">D\00E9connexion</span> )')
,p_icon_target=>'&LOGOUT_URL.'
,p_icon_image_alt=>unistr('D\00E9connexion')
,p_icon_height=>32
,p_icon_width=>32
,p_icon_height2=>24
,p_icon_width2=>24
,p_nav_entry_is_feedback_yn=>'N'
,p_begins_on_new_line=>'NO'
,p_cell_colspan=>1
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_schemas_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(387283337600871893.4852)
,p_process_sequence=>5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_SCHEMAS Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_SCHEMAS'');',
'    -- Loop through and fill the collection',
'    for m in (select id, parsing_schema, type, pattern, status, auto_rest_auth, ops_allowed, pre_hook',
'               from USER_ORDS_SCHEMAS)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_SCHEMAS'',',
'               p_n001 => m.id,                  ',
'               p_c001 => m.parsing_schema,              ',
'               p_c002 => m.type,           ',
'               p_c003 => m.pattern,',
'               p_c004 => m.status,',
'               p_c005 => m.auto_rest_auth,',
'               p_n002 => m.ops_allowed,',
'               p_c006 => m.pre_hook',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'                p_function_body   => l_plsql,',
'                p_language        => wwv_flow_code_exec.c_plsql,',
'                p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'            );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible d''extraire les sch\00E9mas ORDS disponibles.')
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_modules_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342554284537280704.4852)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_MODULES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_MODULES'');',
'    -- Loop through and fill the collection',
'    for m in (select id, name, uri_prefix, items_per_page, status, comments, pre_hook, schema_id, created_by, created_on, updated_by, updated_on, origins_allowed',
'               from USER_ORDS_MODULES)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_MODULES'',',
'               p_n001 => m.id,                  ',
'               p_c001 => m.name,              ',
'               p_c002 => m.uri_prefix,           ',
'               p_n002 => m.items_per_page,',
'               p_c003 => m.status,',
'               p_c004 => m.comments, ',
'               p_c005 => m.pre_hook,',
'               p_c006 => m.origins_allowed,',
'               p_n005 => m.schema_id,',
'               p_c049 => m.created_by,',
'               p_d001 => m.created_on,',
'               p_c050 => m.updated_by,',
'               p_d002 => m.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_templates_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342554481588284030.4852)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_TEMPLATES collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_TEMPLATES'');',
'    -- Loop through and fill the collection',
'    for t in (select id, module_id, uri_template, priority, etag_type, etag_query, comments, schema_id, created_by, created_on, updated_by, updated_on',
'               from USER_ORDS_TEMPLATES)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_TEMPLATES'',',
'               p_n001 => t.id, ',
'               p_n002 => t.module_id,',
'               p_c001 => t.uri_template, ',
'               p_n003 => t.priority,',
'               p_c002 => t.etag_type,',
'               p_c003 => t.etag_query,',
'               p_c004 => t.comments,',
'               p_n005 => t.schema_id,',
'               p_c049 => t.created_by,',
'               p_d001 => t.created_on,',
'               p_c050 => t.updated_by,',
'               p_d002 => t.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_handlers_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342555258750286853.4852)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_HANDLERS Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_HANDLERS'');',
'    -- Loop through and fill the collection',
'    for h in (select id, template_id, source_type, method, mimes_allowed, items_per_page, source, comments, schema_id, created_by, created_on, updated_by, updated_on',
'               from USER_ORDS_HANDLERS)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_HANDLERS'',',
'               p_n001 => h.id, ',
'               p_n002 => h.template_id, ',
'               p_c001 => h.source_type,',
'               p_c002 => h.method,',
'               p_c003 => h.mimes_allowed,',
'               p_n003 => h.items_per_page,',
'               p_clob001 => h.source,',
'               p_c004 => h.comments,',
'               p_n005 => h.schema_id,',
'               p_c049 => h.created_by,',
'               p_d001 => h.created_on,',
'               p_c050 => h.updated_by,',
'               p_d002 => h.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLCODE ||'' : ''||SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;    ',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_parameters_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342902393800317708.4852)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_PARAMETERS Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_PARAMETERS'');',
'    -- Loop through and fill the collection',
'    for p in (select id, handler_id, name,bind_variable_name, source_type, access_method, param_type, comments, schema_id, created_by, created_on, updated_by, updated_on',
'               from USER_ORDS_PARAMETERS)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_PARAMETERS'',',
'               p_n001 => p.id, ',
'               p_n002 => p.handler_id, ',
'               p_c001 => p.name,',
'               p_c002 => p.bind_variable_name,',
'               p_c003 => p.source_type,',
'               p_c004 => p.access_method,',
'               p_c005 => p.param_type,',
'               p_c006 => p.comments,',
'               p_n005 => p.schema_id,',
'               p_c049 => p.created_by,',
'               p_d001 => p.created_on,',
'               p_c050 => p.updated_by,',
'               p_d002 => p.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'   ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_privileges_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342902617244328148.4852)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_PRIVILEGES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_PRIVILEGES'');',
'    -- Loop through and fill the collection',
'    for p in (select id, label, name, comments, description, schema_id, created_by, created_on, updated_by, updated_on',
'               from USER_ORDS_PRIVILEGES)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_PRIVILEGES'',',
'               p_n001 => p.id, ',
'               p_c001 => p.label,',
'               p_c002 => p.name,',
'               p_c003 => p.comments,',
'               p_c004 => p.description,',
'               p_n005 => p.schema_id,',
'               p_c049 => p.created_by,',
'               p_d001 => p.created_on,',
'               p_c050 => p.updated_by,',
'               p_d002 => p.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'    ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_roles_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(342902880674332236.4852)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_ROLES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_ROLES'');',
'    -- Loop through and fill the collection',
'    for p in (select id, name, schema_id, created_by, created_on, updated_by, updated_on',
'               from USER_ORDS_ROLES)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_ROLES'',',
'               p_n001 => p.id, ',
'               p_c001 => p.name,',
'               p_n005 => p.schema_id,',
'               p_c049 => p.created_by,',
'               p_d001 => p.created_on,',
'               p_c050 => p.updated_by,',
'               p_d002 => p.updated_on',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_enabled_objects_collections
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(387286517798930675.4852)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_ENABLED_OBJECTS collections'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_ENABLED_OBJECTS'');',
'    -- Loop through and fill the collection',
'    for m in (select id, schema_id, parsing_schema, parsing_object, object_alias, type, status, auto_rest_auth, ops_allowed, type_path, pre_hook',
'               from USER_ORDS_ENABLED_OBJECTS)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_ENABLED_OBJECTS'',',
'               p_n001 => m.id, ',
'               p_n002 => m.schema_id,',
'               p_c001 => m.parsing_schema,',
'               p_c002 => m.parsing_object,',
'               p_c003 => m.object_alias,',
'               p_c004 => m.type,',
'               p_c005 => m.status,',
'               p_c006 => m.auto_rest_auth,',
'               p_n003 => m.ops_allowed,',
'               p_c007 => m.type_path,',
'               p_c008 => m.pre_hook',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_privilege_roles_collection
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(395762687572540683.4852)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_PRIVILEGE_ROLES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_PRIVILEGE_ROLES'');',
'    -- Loop through and fill the collection',
'    for m in (select privilege_id, privilege_name, role_id, role_name',
'               from USER_ORDS_privilege_roles)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_PRIVILEGE_ROLES'',',
'               p_n001 => m.privilege_id, ',
'               p_c001 => m.privilege_name,',
'               p_n002 => m.role_id,',
'               p_c002 => m.role_name',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_privilege_modules
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(395763036035566814.4852)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_PRIVILEGE_MODULES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_PRIVILEGE_MODULES'');',
'    -- Loop through and fill the collection',
'    for m in (select privilege_id, privilege_name, module_id, module_name',
'               from USER_ORDS_privilege_modules)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_PRIVILEGE_MODULES'',',
'               p_n001 => m.privilege_id, ',
'               p_c001 => m.privilege_name,',
'               p_n002 => m.module_id,',
'               p_c002 => m.module_name',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/load_ords_privilege_mappings
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(395763867379598393.4852)
,p_process_sequence=>100
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_PRIVILEGE_MAPPINGS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_PRIVILEGE_MAPPINGS'');',
'    -- Loop through and fill the collection',
'    for m in (select rowid ID, privilege_id, name, pattern',
'               from USER_ORDS_PRIVILEGE_MAPPINGS)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_PRIVILEGE_MAPPINGS'',',
'               p_n001 => m.privilege_id,',
'               p_c003 => m.id,',
'               p_c001 => m.name,',
'               p_c002 => m.pattern',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'        ',
'if l_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_return);',
'END IF;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_process_when_type=>'FUNCTION_BODY'
,p_process_when2=>'PLSQL'
,p_version_scn=>37165770887418
);
end;
/
prompt --application/shared_components/logic/application_processes/spotlightindex
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(234081675618075338.4852)
,p_process_sequence=>999
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'spotlightIndex'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_spotlight_dev.emit_spotlight_search_index(',
'    p_app_id          => wwv_flow.g_x01,',
'    p_advanced_search => wwv_flow.g_x02);'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>36494068
);
end;
/
prompt --application/shared_components/logic/application_items/active_node
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(1534926119072175978.4852)
,p_name=>'ACTIVE_NODE'
,p_data_type=>'NUMBER'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/company
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(872498331315784584.4852)
,p_name=>'COMPANY'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/fsp_after_login_url
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(6688329890650779.4852)
,p_name=>'FSP_AFTER_LOGIN_URL'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_apex_path
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(89358894262340782.4852)
,p_name=>'G_APEX_PATH'
,p_protection_level=>'I'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_http_host
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(619028059341783290.4852)
,p_name=>'G_HTTP_HOST'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'HTTP Host from the CGI ENV'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_ords_pages
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(342543249375838636.4852)
,p_name=>'G_ORDS_PAGES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'List of pages where we want the ORDS tree to appear'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_protocol
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(619027817002780643.4852)
,p_name=>'G_PROTOCOL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'The Protocol (http or https) that is being used to access APEX (and therefore ORDS RESTful services)'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_schema_alias
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(619028934552791108.4852)
,p_name=>'G_SCHEMA_ALIAS'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'Schema alias - used to build ORDS URLS'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/g_script_name
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(619028747767787342.4852)
,p_name=>'G_SCRIPT_NAME'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_item_comment=>'SCRIPT_NAME from cgi_env - Used to build ORDS URLS'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/min_ords_version
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(511289752140240918.4852)
,p_name=>'MIN_ORDS_VERSION'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_items/repo_ords_version
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(511289541307239726.4852)
,p_name=>'REPO_ORDS_VERSION'
,p_scope=>'GLOBAL'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
,p_version_scn=>37165770887406
);
end;
/
prompt --application/shared_components/logic/application_computations/g_schema_alias
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(619030612276813903.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_SCHEMA_ALIAS'
,p_computation_point=>'AFTER_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select c003',
'    from wwv_flow_collections',
'   where collection_name = ''ORDS_SCHEMAS'';',
''))
,p_computation_error_message=>unistr('Impossible d''extraire l''alias de sch\00E9ma pour le sch\00E9ma actuellement s\00E9lectionn\00E9')
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/min_ords_version
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(511290384160259564.4852)
,p_computation_sequence=>3
,p_computation_item=>'MIN_ORDS_VERSION'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_min_ords_version  varchar2(255);',
'BEGIN ',
'    l_min_ords_version := wwv_flow_rest_ws.c_ords_major||''.''||',
'                          wwv_flow_rest_ws.c_ords_minor||''.''||',
'                          wwv_flow_rest_ws.c_ords_patch||''.''||',
'                          wwv_flow_rest_ws.c_ords_day||''.0.0'';',
'    return l_min_ords_version;',
'',
'END;',
''))
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/company
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(872544309629787776.4852)
,p_computation_sequence=>10
,p_computation_item=>'COMPANY'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow.get_company_name'
,p_compute_when=>'COMPANY'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_computation_error_message=>'Impossible de calculer le nom de l''espace de travail.'
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/p0_schema
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(538556025090330445.4852)
,p_computation_sequence=>1
,p_computation_item=>'P0_SCHEMA'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'wwv_flow_user_api.get_default_schema'
,p_compute_when=>'P0_SCHEMA'
,p_compute_when_type=>'ITEM_IS_NULL'
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/repo_ords_version
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(511290164367246038.4852)
,p_computation_sequence=>2
,p_computation_item=>'REPO_ORDS_VERSION'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'    l_schema    VARCHAR2(32767);',
'    l_ords_installed     NUMBER;',
'',
'BEGIN ',
'-- Check to see if there is an ORDS_METADATA SCHEMA ',
'select count(*)',
'  into l_ords_installed',
'  from all_users',
' where username = ''ORDS_METADATA'';',
'--',
'IF l_ords_installed > 0 THEN  ',
'    l_schema := nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema);',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'  l_schema  varchar2(255) := ''||l_schema||'';',
'  l_version varchar2(255);',
'BEGIN',
'  l_version := ords_metadata.ords.installed_version;  ',
'RETURN l_version;',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN ''0.0.0.0.0.0'';',
'END;  ',
'#'';',
'',
'--',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => l_schema',
'        );',
'        ',
'ELSE ',
'  l_return := ''0.0.0.0.0.0'';',
'END IF;',
'',
'return l_return;',
'END;'))
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/g_apex_path
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(89361147421350155.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_APEX_PATH'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'WWV_FLOW_UTILITIES.HOST_URL(''APEX_PATH'');'
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/g_ords_pages
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(342543645888848725.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_ORDS_PAGES'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>':100:110:120:130:140:150:160:170:180:190:200:194:195:'
,p_computation_comment=>'Make sure that each page is surrounded by : (i.e. :100:200:300: ) This is used to make sure that 100 and 1000 aren''t both caught by the pattern matching as the same thing.'
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/g_http_host
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(619029707519802116.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_HTTP_HOST'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sys.owa_util.get_cgi_env(''HTTP_HOST'')'
,p_computation_error_message=>unistr('Impossible de calculer l''\00E9l\00E9ment HTTP_HOST')
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/g_protocol
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(619030458629806194.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_PROTOCOL'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sys.owa_util.get_cgi_env(''REQUEST_PROTOCOL'')'
,p_computation_error_message=>unistr('Impossible de calculer l''\00E9l\00E9ment REQUEST PROTOCOL.')
,p_version_scn=>37165770887460
);
end;
/
prompt --application/shared_components/logic/application_computations/g_script_name
begin
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(619030852128818077.4852)
,p_computation_sequence=>10
,p_computation_item=>'G_SCRIPT_NAME'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'sys.owa_util.get_cgi_env(''SCRIPT_NAME'')'
,p_computation_error_message=>unistr('Impossible de calculer l''\00E9l\00E9ment SCRIPT NAME.')
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
prompt --application/shared_components/user_interface/lovs/auth_yn
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1603815196424841.4852)
,p_lov_name=>'AUTH_YN'
,p_lov_query=>'.'||wwv_flow_imp.id(1603815196424841)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558473
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1604148177424849.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Oui'
,p_lov_return_value=>'ENABLED'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1604573368424849.4852)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Non'
,p_lov_return_value=>'DISABLED'
,p_lov_disp_cond_type=>'ALWAYS'
);
end;
/
prompt --application/shared_components/user_interface/lovs/database_schemas
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(948796511932598687.4852)
,p_lov_name=>'DATABASE SCHEMAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /* APEX4850L1 */ wwv_flow_escape.html(upper(c.schema)) d, upper(c.schema) v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>75558473
);
end;
/
prompt --application/shared_components/user_interface/lovs/file_export_types
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(914883828990434889.4852)
,p_lov_name=>'FILE EXPORT TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(914883828990434889)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558473
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(914884011226434892.4852)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Fichier XML'
,p_lov_return_value=>'XML'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(914884227962434893.4852)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Script SQL'
,p_lov_return_value=>'SQL'
);
end;
/
prompt --application/shared_components/user_interface/lovs/handler_security
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(793284611321304933.4852)
,p_lov_name=>'HANDLER_SECURITY'
,p_lov_query=>'.'||wwv_flow_imp.id(793284611321304933)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558473
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(793284832075304933.4852)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Public'
,p_lov_return_value=>'NONE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(793285017364304933.4852)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>unistr('S\00E9curis\00E9')
,p_lov_return_value=>'SECURE'
);
end;
/
prompt --application/shared_components/user_interface/lovs/i18n_iana_charset
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1671084505895948418.4852)
,p_lov_name=>'I18N_IANA_CHARSET'
,p_lov_query=>'.'||wwv_flow_imp.id(1671084505895948418)||'.'
,p_location=>'STATIC'
,p_version_scn=>2609040
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671093901719948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode - UTF-16 Little Endian'
,p_lov_return_value=>'utf-16le'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671094124464948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode - UTF-16 Big Endian'
,p_lov_return_value=>'utf-16be'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671094300393948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'US-ASCII'
,p_lov_return_value=>'us-ascii'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671094520466948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arabe - ISO-8859-6'
,p_lov_return_value=>'iso-8859-6'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671094700871948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Arabe - Windows 1256'
,p_lov_return_value=>'windows-1256'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671094921688948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Chinois - Big5'
,p_lov_return_value=>'big5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671095110740948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Chinois - GBK'
,p_lov_return_value=>'gbk'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671095331933948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrillique - ISO-8859-5'
,p_lov_return_value=>'iso-8859-5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671095502169948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrillique - KOI8-R'
,p_lov_return_value=>'koi8-r'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671095705442948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrillique - KOI8-U'
,p_lov_return_value=>'koi8-u'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671095932299948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Cyrillique - Windows 1251'
,p_lov_return_value=>'windows-1251'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671096121544948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe de l''Est - ISO-8859-2'
,p_lov_return_value=>'iso-8859-2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671096329393948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe de l''Est - Windows 1250'
,p_lov_return_value=>'windows-1250'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671096502409948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Grec - ISO-8859-7'
,p_lov_return_value=>'iso-8859-7'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671096725054948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Grec - Windows 1253'
,p_lov_return_value=>'windows-1253'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671096913527948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('H\00E9breu - ISO-8859-8-i')
,p_lov_return_value=>'iso-8859-8-i'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671097100860948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('H\00E9breu - Windows 1255')
,p_lov_return_value=>'windows-1255'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671097315673948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Japonais - EUC'
,p_lov_return_value=>'euc-jp'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671097520272948439.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Japonais - Shift JIS'
,p_lov_return_value=>'shift_jis'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671097709314948440.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Cor\00E9en - EUC')
,p_lov_return_value=>'euc-kr'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671097923215948440.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe du Nord - ISO-8859-4'
,p_lov_return_value=>'iso-8859-4'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671098132735948440.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe du Nord - Windows 1257'
,p_lov_return_value=>'windows-1257'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671098331088948440.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe du Sud - ISO-8859-3'
,p_lov_return_value=>'iso-8859-3'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671098518496948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>unistr('Tha\00EF - TIS-620')
,p_lov_return_value=>'tis-620'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671098727107948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Turc - ISO-8859-9'
,p_lov_return_value=>'iso-8859-9'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671098918742948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Turc - Windows 1254'
,p_lov_return_value=>'windows-1254'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671099131511948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Unicode - UTF-8'
,p_lov_return_value=>'utf-8'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671099313041948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Vietnamien - Windows 1258'
,p_lov_return_value=>'windows-1258'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671099521679948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe de l''Ouest - ISO-8859-1'
,p_lov_return_value=>'iso-8859-1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1671099704494948441.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Europe de l''Ouest - Windows 1252'
,p_lov_return_value=>'windows-1252'
);
end;
/
prompt --application/shared_components/user_interface/lovs/parameter_source_no_conditions
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1423989032583278480.4852)
,p_lov_name=>'PARAMETER_SOURCE_NO_CONDITIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(1423989032583278480)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558474
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1423989323415278482.4852)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>unistr('En-t\00EAte HTTP')
,p_lov_return_value=>'HEADER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1423989504373278483.4852)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>unistr('Corps de la r\00E9ponse')
,p_lov_return_value=>'RESPONSE'
,p_lov_disp_cond2=>'OUT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1423989720951278484.4852)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'URI'
,p_lov_return_value=>'URI'
,p_lov_disp_cond2=>'IN'
);
end;
/
prompt --application/shared_components/user_interface/lovs/rest_object_types
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(1608252484457866.4852)
,p_lov_name=>'REST_OBJECT_TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(1608252484457866)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558476
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1608540766457868.4852)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Table'
,p_lov_return_value=>'TABLE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1608927477457868.4852)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Vue'
,p_lov_return_value=>'VIEW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609328143457869.4852)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Package'
,p_lov_return_value=>'PACKAGE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1609749705457869.4852)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>unistr('Proc\00E9dure')
,p_lov_return_value=>'PROCEDURE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1610140210457869.4852)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Fonction'
,p_lov_return_value=>'FUNCTION'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(1610532182457869.4852)
,p_lov_disp_sequence=>6
,p_lov_disp_value=>unistr('Vue mat\00E9rialis\00E9e')
,p_lov_return_value=>'MVIEW'
);
end;
/
prompt --application/shared_components/user_interface/lovs/source_type
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(317434812233598482.4852)
,p_lov_name=>'SOURCE_TYPE'
,p_lov_query=>'.'||wwv_flow_imp.id(317434812233598482)||'.'
,p_location=>'STATIC'
,p_version_scn=>75558476
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(317435304805598483.4852)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>unistr('Requ\00EAte')
,p_lov_return_value=>'QUERY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(317435514983598483.4852)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>unistr('Requ\00EAte sur une ligne')
,p_lov_return_value=>'QUERY_1_ROW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(317435726705598483.4852)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'PL/SQL'
,p_lov_return_value=>'PLSQL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(317435916084598483.4852)
,p_lov_disp_sequence=>5
,p_lov_disp_value=>'Support'
,p_lov_return_value=>'MEDIA'
);
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
 p_id=>wwv_flow_imp.id(6687412253641141.4852)
,p_name=>' Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(3411803447424676.4852)
,p_parent_id=>wwv_flow_imp.id(381633302716441851.4852)
,p_short_name=>'Activer AutoREST pour l''objet'
,p_link=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:::'
,p_page_id=>194
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(3412145738428569.4852)
,p_parent_id=>wwv_flow_imp.id(381633302716441851.4852)
,p_short_name=>unistr('Modifier la d\00E9finition de l''objet compatible')
,p_link=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:::'
,p_page_id=>195
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6690617516703988.4852)
,p_short_name=>'Page d''accueil'
,p_link=>'f?p=4100:1:&SESSION.'
,p_page_id=>99999
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(325184318717294081.4852)
,p_short_name=>'<span class="u-VisuallyHidden">SQL Workshop</span><span class="a-Icon icon-breadcrumb-previous" title="SQL Workshop"></span>'
,p_link=>'f?p=4500:3002:&SESSION.'
,p_page_id=>99998
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(342528825537616663.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>'Modules'
,p_link=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:::'
,p_page_id=>110
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(344951402392612486.4852)
,p_parent_id=>wwv_flow_imp.id(342528825537616663.4852)
,p_short_name=>unistr('D\00E9finition de module')
,p_link=>'f?p=&APP_ID.:120:&SESSION.'
,p_page_id=>120
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358073020837129150.4852)
,p_parent_id=>wwv_flow_imp.id(344951402392612486.4852)
,p_short_name=>unistr('Mod\00E8le de ressource')
,p_link=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:::'
,p_page_id=>130
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358791994314621921.4852)
,p_parent_id=>wwv_flow_imp.id(358073020837129150.4852)
,p_short_name=>'Gestionnaire de ressources'
,p_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
,p_page_id=>140
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358828713671891802.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>unistr('Privil\00E8ges')
,p_link=>'f?p=&APP_ID.:150:&SESSION.'
,p_page_id=>150
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358835567773896740.4852)
,p_parent_id=>wwv_flow_imp.id(358828713671891802.4852)
,p_short_name=>unistr('D\00E9finition de privil\00E8ge')
,p_link=>'f?p=&APP_ID.:160:&SESSION.'
,p_page_id=>160
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358836167207899890.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>unistr('R\00F4les')
,p_link=>'f?p=&APP_ID.:170:&SESSION.'
,p_page_id=>170
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(358839507350906219.4852)
,p_parent_id=>wwv_flow_imp.id(358836167207899890.4852)
,p_short_name=>unistr('D\00E9finition de r\00F4le')
,p_link=>'f?p=&APP_ID.:180:&SESSION.'
,p_page_id=>180
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(381633302716441851.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>'Objets compatibles'
,p_link=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:::'
,p_page_id=>190
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(388804142472871280.4852)
,p_short_name=>'0'
,p_link=>'f?p=&FLOW_ID.:0:&SESSION.'
,p_page_id=>0
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(413824715640010611.4852)
,p_parent_id=>wwv_flow_imp.id(315395905415249299.4852)
,p_short_name=>unistr('Mod\00E8le de ressource')
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(413930227369017548.4852)
,p_parent_id=>wwv_flow_imp.id(415722322040309103.4852)
,p_short_name=>unistr('Param\00E8tre de gestionnaire de ressources')
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(415722322040309103.4852)
,p_parent_id=>wwv_flow_imp.id(413824715640010611.4852)
,p_short_name=>'Gestionnaire de ressources'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_parent_id=>wwv_flow_imp.id(325184318717294081.4852)
,p_short_name=>'Services RESTful'
,p_link=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::'
,p_page_id=>100
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(533276487619496213.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>'Exporter les services RESTful ORDS'
,p_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:::'
,p_page_id=>108
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(533287497265532718.4852)
,p_parent_id=>wwv_flow_imp.id(510823694272243103.4852)
,p_short_name=>'Importer les services RESTful ORDS'
,p_link=>'f?p=&APP_ID.:109:&SESSION.'
,p_page_id=>109
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1481433909665180242.4852)
,p_parent_id=>wwv_flow_imp.id(1481503026042187892.4852)
,p_short_name=>unistr('D\00E9tails des privil\00E8ges de service RESTful')
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1504612710885657958.4852)
,p_parent_id=>wwv_flow_imp.id(1504438624052636603.4852)
,p_short_name=>'Inscription client'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1647082920975488070.4852)
,p_parent_id=>wwv_flow_imp.id(1646510922571380988.4852)
,p_short_name=>unistr('Cr\00E9er/modifier des approbations de service RESTful')
,p_link=>'f?p=&FLOW_ID.:15:&SESSION.'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1655767024290367492.4852)
,p_parent_id=>wwv_flow_imp.id(1646510922571380988.4852)
,p_short_name=>unistr('Mettre \00E0 jour plusieurs approbations')
,p_link=>'f?p=&FLOW_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1746949323661635358.4852)
,p_parent_id=>wwv_flow_imp.id(415722322040309103.4852)
,p_short_name=>'Tester le gestionnaire de ressources'
,p_link=>'f?p=&FLOW_ID.:8:&SESSION.'
,p_page_id=>8
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/apex_5_0_sql_workshop_iframe_page
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(366073392769530321.4852)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - SQL Workshop iFrame Page.fr'
,p_internal_name=>'APEX_5.0_SQL_WORKSHOP_IFRAME_PAGE'
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
'<body class="sql-workshop-iframe-page a-Dialog-page #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #ONLOAD#>',
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
'<br />',
'<br />',
'<pre>#MESSAGE#</pre>',
'<a href="#BACK_LINK#">#RETURN_TO_APPLICATION#</a>'))
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
,p_dialog_js_init_code=>'apex.navigation.dialog(#PAGE_URL#,{title:#TITLE#,height:#DIALOG_HEIGHT#,width:#DIALOG_WIDTH#,maxWidth:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,#DIALOG_ATTRIBUTES#},#DIALOG_CSS_CLASSES#,#TRIGGERING_ELEMENT#);'
,p_dialog_js_close_code=>'apex.navigation.dialog.close(#IS_MODAL#,#TARGET#);'
,p_dialog_js_cancel_code=>'apex.navigation.dialog.cancel(#IS_MODAL#);'
,p_dialog_height=>'480'
,p_dialog_width=>'800'
,p_dialog_max_width=>'1200'
,p_dialog_css_classes=>'a-Dialog--uiDialog'
,p_dialog_browser_frame=>'MODAL'
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293522748506987031.4852)
,p_page_template_id=>wwv_flow_imp.id(366073392769530321.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293523244561987032.4852)
,p_page_template_id=>wwv_flow_imp.id(366073392769530321.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293523720016987032.4852)
,p_page_template_id=>wwv_flow_imp.id(366073392769530321.4852)
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
 p_id=>wwv_flow_imp.id(719669719239933042.4852)
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
 p_id=>wwv_flow_imp.id(293502379720977330.4852)
,p_page_template_id=>wwv_flow_imp.id(719669719239933042.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293502817536977330.4852)
,p_page_template_id=>wwv_flow_imp.id(719669719239933042.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293503334713977331.4852)
,p_page_template_id=>wwv_flow_imp.id(719669719239933042.4852)
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
 p_id=>wwv_flow_imp.id(719670183563933079.4852)
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
 p_id=>wwv_flow_imp.id(2570191502702164.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2570614480702164.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2571146822702165.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2571620641702165.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2572108049702165.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Edit Screen Header'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2572654173702165.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Position 5'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2573102679702165.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2573654900702166.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2574195653702166.4852)
,p_page_template_id=>wwv_flow_imp.id(719670183563933079.4852)
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
 p_id=>wwv_flow_imp.id(719672364834933087.4852)
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
 p_id=>wwv_flow_imp.id(2474601000706120.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2475169088706120.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2475611811706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2476151620706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2476696789706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2477154162706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2477618677706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2478145492706121.4852)
,p_page_template_id=>wwv_flow_imp.id(719672364834933087.4852)
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
 p_id=>wwv_flow_imp.id(719672816683933088.4852)
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
 p_id=>wwv_flow_imp.id(1603833000131889.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1604384948131889.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Page Header (Position 3)'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1604870604131889.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Page Header (Position 4)'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1605327511131889.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Right Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1605873375131889.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'After Body'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1606380918131890.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Page Header (Position 1)'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1606871992131890.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
,p_name=>'Page Header (Position 2)'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1607305838131890.4852)
,p_page_template_id=>wwv_flow_imp.id(719672816683933088.4852)
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
 p_id=>wwv_flow_imp.id(719674293388933089.4852)
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
 p_id=>wwv_flow_imp.id(115238313884289473.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115238819154289473.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115239345128289473.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115239825331289474.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115240343269289474.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115240856286289474.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(115241304133289474.4852)
,p_page_template_id=>wwv_flow_imp.id(719674293388933089.4852)
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
 p_id=>wwv_flow_imp.id(719674703062933090.4852)
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
 p_id=>wwv_flow_imp.id(1566521031875398.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1567058895875398.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1567565284875398.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1568086590875399.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 3'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1568506799875399.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1569098618875399.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1569579169875399.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1570079140875399.4852)
,p_page_template_id=>wwv_flow_imp.id(719674703062933090.4852)
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
 p_id=>wwv_flow_imp.id(719678839350933097.4852)
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
 p_id=>wwv_flow_imp.id(293552241934992219.4852)
,p_page_template_id=>wwv_flow_imp.id(719678839350933097.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293552745320992220.4852)
,p_page_template_id=>wwv_flow_imp.id(719678839350933097.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(293553247808992220.4852)
,p_page_template_id=>wwv_flow_imp.id(719678839350933097.4852)
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
prompt --application/shared_components/user_interface/templates/page/apex_5_0_restful_web_services
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_theme_id=>3
,p_name=>'[x] APEX 5.0 - RESTful Web Services.fr'
,p_internal_name=>'APEX_5.0_RESTFUL_WEB_SERVICES'
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
'<body #ONLOAD# class="a-Page--webservices #PAGE_CSS_CLASSES#">',
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
'#REGION_POSITION_02#',
'</header>',
'#REGION_POSITION_09#',
'  <div id="main" class="a-Body">',
'    <aside class="a-Side a-Side--left a-Side--large">',
'        #REGION_POSITION_03#',
'    </aside>',
'    <main class="a-Main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        #BODY#',
'    </main>',
'  </div>',
'#REGION_POSITION_04#'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<footer class="a-Footer">',
'  <div class="a-Footer-info">',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-user" aria-label="&MSG_USER." title="&MSG_USER.">',
'        <span class="u-vh">&MSG_USER.</span>',
'      </span>',
'      &USER.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-workspace" aria-label="&MSG_WORKSPACE." title="&MSG_WORKSPACE.">',
'        <span class="u-vh">&MSG_WORKSPACE.</span>',
'      </span>',
'      &COMPANY.',
'    </span>',
'    <span class="a-Footer-attribute">',
'      <span role="img" class="a-Icon icon-language" aria-label="&MSG_LANGUAGE." title="&MSG_LANGUAGE.">',
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
 p_id=>wwv_flow_imp.id(1508258746265609.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1508761101265609.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Position 1'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1509264259265610.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Position 2'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1509796212265610.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Left Side Bar'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1510254994265610.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Position 4'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1510750789265610.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Position 7'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1511226708265610.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
,p_name=>'Page Position 8'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1511700177265611.4852)
,p_page_template_id=>wwv_flow_imp.id(754939123056928433.4852)
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
prompt --application/shared_components/user_interface/templates/button/apex_4_2_next_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(232195217185455150.4852)
,p_template_name=>'APEX 4.2 - Next Button'
,p_internal_name=>'APEX_4.2_NEXT_BUTTON'
,p_template=>'<button class="aButton nextButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" class="nextBlack" alt=""/></span></button>'
,p_hot_template=>'<button class="aButton hotButton nextButton" onclick="#LINK#" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#" type="button"><span>#LABEL!HTML#<img src="#IMAGE_PREFIX#f_spacer.gif" class="nextWhite" alt=""/></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_4_1_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(302280313173718795.4852)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button_2
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(388776568320789175.4852)
,p_template_name=>'APEX 5.0 - Icon Menu Button (2)'
,p_internal_name=>'APEX_5.0_ICON_MENU_BUTTON_2'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" '
||'aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_only_button_2
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(388776713638789177.4852)
,p_template_name=>'APEX 5.0 - Icon Only Button (2)'
,p_internal_name=>'APEX_5.0_ICON_ONLY_BUTTON_2'
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
 p_id=>wwv_flow_imp.id(629187503480957071.4852)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(719734705014947853.4852)
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
 p_id=>wwv_flow_imp.id(719734932326947858.4852)
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
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_badge_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(719735277951947858.4852)
,p_template_name=>'APEX 5.0 - Icon Badge Button'
,p_internal_name=>'APEX_5.0_ICON_BADGE_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><span class="a-But'
||'ton-badge"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#"></span><spa'
||'n class="a-Button-badge"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_badge_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(719735508683947859.4852)
,p_template_name=>'APEX 5.0 - Icon Badge Menu Button'
,p_internal_name=>'APEX_5.0_ICON_BADGE_MENU_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#">'
||'</span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#"></span><span class="a-Button-badge"></span><span class="a-Icon icon-menu-drop-down"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_menu_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(719735863923947860.4852)
,p_template_name=>'APEX 5.0 - Icon Menu Button'
,p_internal_name=>'APEX_5.0_ICON_MENU_BUTTON'
,p_template=>'<button class="a-Button a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_CSS_CLASSES#" '
||'aria-hidden="true"></span><span class="a-Icon icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="a-Button a-Button--hot a-Button--noLabel a-Button--iconTextButton #BUTTON_CSS_CLASSES#" onclick="#JAVASCRIPT#" type="button" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#" id="#BUTTON_ID#" #BUTTON_ATTRIBUTES#><span class="a-Icon #ICON_'
||'CSS_CLASSES#" aria-hidden="true"></span><span class="a-Icon  icon-menu-drop-down" aria-hidden="true"></span></button>'
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>3
);
end;
/
prompt --application/shared_components/user_interface/templates/button/apex_5_0_icon_only_button
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(719736129383947861.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_div_with_id_c_htmldbhid
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6673713929641045.4852)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'APEX 4.0 - Div  with ID (c:htmldbHID)'
,p_internal_name=>'APEX_4.0_DIV_WITH_ID_C:HTMLDBHID'
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
 p_id=>wwv_flow_imp.id(140674116975344331.4852)
,p_plug_template_id=>wwv_flow_imp.id(6673713929641045.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140674233773344331.4852)
,p_plug_template_id=>wwv_flow_imp.id(6673713929641045.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_div_with_id_and_region_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6673907217641045.4852)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'[x] APEX 4.0 - Div with ID and Region Attributes'
,p_internal_name=>'APEX_4.0_DIV_WITH_ID_AND_REGION_ATTRIBUTES'
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
 p_id=>wwv_flow_imp.id(60422622946125964.4852)
,p_plug_template_id=>wwv_flow_imp.id(6673907217641045.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60423119023125964.4852)
,p_plug_template_id=>wwv_flow_imp.id(6673907217641045.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_hide_and_show_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6674010598641046.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="hide-show-region" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="hide-show-top">',
'    <div class="hide-show-title"><h3 data-apex-heading>',
'      <a href="#" onclick="htmldb_ToggleTableBody(''i#REGION_STATIC_ID#'',''body#REGION_STATIC_ID#''); return false;">',
'        <img src="#IMAGE_PREFIX#htmldb/builder/rollup_plus_dgray.gif" class="pseudoButtonActive" id="i#REGION_STATIC_ID#" alt="" />',
'        #TITLE#',
'      </a></h3>    ',
'    </div>',
'  </div>',
'  <div class="hide-show-body" style="display:none;" id="body#REGION_STATIC_ID#">#BODY#</div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Hide and Show Region'
,p_internal_name=>'APEX_4.0_HIDE_AND_SHOW_REGION'
,p_theme_id=>3
,p_theme_class_id=>1
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1775265128450028.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674010598641046.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1775770319450028.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674010598641046.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_rounded_corner_gray_top
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion sideNavRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Rounded Corner (Gray Top)'
,p_internal_name=>'APEX_4.0_ROUNDED_CORNER_GRAY_TOP'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1848353680453657.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1848879495453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1849336538453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1849869003453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1850307837453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1850833331453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1851317658453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1851824488453658.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1852315975453659.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1852835367453659.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1853329671453659.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1853822624453659.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674313033641046.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_rounded_corner_large
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion altHeading #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Rounded Corner Large'
,p_internal_name=>'APEX_4.0_ROUNDED_CORNER_LARGE'
,p_plug_table_bgcolor=>'#FFFFFF'
,p_theme_id=>3
,p_theme_class_id=>9
,p_plug_heading_bgcolor=>'#FFFFFF'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>'class="htmldbInstruct"'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1906420638457193.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1906935665457193.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1907430907457193.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1907903455457193.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1908420465457193.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1908929278457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1909404879457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1909922467457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1910468502457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1910954695457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1911458178457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1911953679457194.4852)
,p_plug_template_id=>wwv_flow_imp.id(6674714399641047.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_sidebar_gray_header
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion sideRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Sidebar (Gray Header)'
,p_internal_name=>'APEX_4.0_SIDEBAR_GRAY_HEADER'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>3
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2117357412463807.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2117886683463807.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2118344291463807.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2118876369463807.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2119327491463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2119808220463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2120300051463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2120879941463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2121369093463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2121855235463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2122384173463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2122881769463808.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675116240641047.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_sidebar_navigation
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion sideRegion sideNavRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    <h1 data-apex-heading>#TITLE#</h1>',
'    <span class="aButtonContainer">',
'      #EDIT##CLOSE##CREATE##CREATE2##EXPAND##HELP##DELETE##COPY##PREVIOUS##NEXT#',
'    </span>',
'  </div>',
'  <div class="aRegionContent clearfix">',
'    #BODY#',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Sidebar Navigation'
,p_internal_name=>'APEX_4.0_SIDEBAR_NAVIGATION'
,p_plug_table_bgcolor=>'#F7F7E7'
,p_theme_id=>3
,p_theme_class_id=>2
,p_plug_heading_bgcolor=>'#F7F7E7'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_form_table_attr=>' '
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2161863929465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2162365553465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2162861821465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2163316115465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2163892643465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2164345874465578.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2164803624465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2165314173465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2165851988465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2166306889465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2166824150465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2167386711465579.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675215817641047.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_top_bar
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion buttonRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    #BODY#',
'    <span class="aButtonContainer">',
'      #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#',
'    </span>',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Top Bar'
,p_internal_name=>'APEX_4.0_TOP_BAR'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <table class="TopBarUIFix" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" width="100%"><tbody class="GreenBar"><tr><td valign="middle" class="L">#BODY#</td><td width="30" class="C"><br /></td><td valign="middle" class='
||'"R" align="right"><span style="margin-right:10px;">#CLOSE#</span>#COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#</td></tr></tbody></table>',
''))
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60558272285153029.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60558732016153029.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60559278753153030.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60559721741153030.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60560218356153030.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60560717042153030.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60561222266153031.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60561758871153031.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60562229825153031.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60562720847153031.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(60563285137153032.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675304951641047.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_0_top_bar_100
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aRegion buttonRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="aRegionHeading">',
'    #BODY#',
'    <span class="aButtonContainer">',
'      #CLOSE##COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#',
'    </span>',
'  </div>',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.0 - Top Bar (100%)'
,p_internal_name=>'APEX_4.0_TOP_BAR_100%'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <table class="TopBarUIFix" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" width="100%"><tbody class="GreenBar"><tr><td valign="middle" class="L">#BODY#</td><td width="30" class="C"><br /></td><td valign="middle" class='
||'"R" align="right"><span style="margin-right:10px;">#CLOSE#</span>#COPY##DELETE##CHANGE##EDIT##PREVIOUS##NEXT##CREATE##EXPAND#</td></tr></tbody></table>',
''))
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92542637104295519.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92543100539295520.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92543610650295520.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92544168709295520.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92544681159295520.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92545110433295521.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92545614367295521.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92546195338295521.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92546661721295522.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92547181796295522.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(92547613296295522.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675421676641048.4852)
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
prompt --application/shared_components/user_interface/templates/region/breadcrumb_region
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6675929305641049.4852)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_ID#">#BODY#</div>'
,p_page_plug_template_name=>'Breadcrumb Region'
,p_internal_name=>'BREADCRUMB_REGION'
,p_theme_id=>3
,p_theme_class_id=>6
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
,p_template_comment=>'Use this region template to contain breadcrumb menus.  Breadcrumb menus are implemented using breadcrumbs.  Breadcrumb menus are designed to displayed in #REGION_POSITION_01#'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140681790204344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675929305641049.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140681815817344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6675929305641049.4852)
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
prompt --application/shared_components/user_interface/templates/region/gray_box_worksheet
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_layout=>'TABLE'
,p_template=>'<table class="htmldbGBR" cellspacing="0" cellpadding="0" border="0" summary="" id="#REGION_STATIC_ID#"><thead><tr><th class="T">#TITLE#</th><th class="BT">#CLOSE#&nbsp;#EDIT##EXPAND##HELP##DELETE##COPY##CREATE#<img src="#IMAGE_PREFIX#up_arrow.gif" al'
||'t="&TOP." class="pb" onclick="uF()"/></th></tr></thead><tbody><tr><td colspan="2" class="B">#BODY#</td></tr></tbody></table>'
,p_page_plug_template_name=>'Gray Box (worksheet)'
,p_internal_name=>'GRAY_BOX_WORKSHEET'
,p_theme_id=>3
,p_theme_class_id=>0
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140681987562344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682031025344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682161525344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682283638344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682371490344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682442114344323.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682530989344322.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682663541344322.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140682773381344322.4852)
,p_plug_template_id=>wwv_flow_imp.id(6676416472641049.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_div_with_id_class_and_region_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(113301184647876699.4852)
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
 p_id=>wwv_flow_imp.id(113305455748876705.4852)
,p_plug_template_id=>wwv_flow_imp.id(113301184647876699.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(113305923175876706.4852)
,p_plug_template_id=>wwv_flow_imp.id(113301184647876699.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(113306436865876706.4852)
,p_plug_template_id=>wwv_flow_imp.id(113301184647876699.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(113306928871876706.4852)
,p_plug_template_id=>wwv_flow_imp.id(113301184647876699.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_4_2_wizard_body
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(348176930747494218.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<section class="aWizardRegion" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</section>'))
,p_page_plug_template_name=>'[x] APEX 4.2 - Wizard Body'
,p_internal_name=>'APEX_4.2_WIZARD_BODY'
,p_theme_id=>3
,p_theme_class_id=>12
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(93624536808534562.4852)
,p_plug_template_id=>wwv_flow_imp.id(348176930747494218.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(93625068391534562.4852)
,p_plug_template_id=>wwv_flow_imp.id(348176930747494218.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_div_with_id_class_and_region_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(388770208095784265.4852)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>#PREVIOUS##BODY##NEXT#</div>'
,p_page_plug_template_name=>'APEX 5 - Div with ID, Class, and Region Attributes'
,p_internal_name=>'APEX_5_DIV_WITH_ID,_CLASS,_AND_REGION_ATTRIBUTES'
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
 p_id=>wwv_flow_imp.id(140683924010344321.4852)
,p_plug_template_id=>wwv_flow_imp.id(388770208095784265.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140684047317344321.4852)
,p_plug_template_id=>wwv_flow_imp.id(388770208095784265.4852)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140684104810344321.4852)
,p_plug_template_id=>wwv_flow_imp.id(388770208095784265.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140684243185344321.4852)
,p_plug_template_id=>wwv_flow_imp.id(388770208095784265.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_alert
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(410842408391417181.4852)
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
 p_id=>wwv_flow_imp.id(2617072110486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2617595324486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2618072189486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2618565349486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2619046393486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2619563193486638.4852)
,p_plug_template_id=>wwv_flow_imp.id(410842408391417181.4852)
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
 p_id=>wwv_flow_imp.id(719684836837942735.4852)
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
 p_id=>wwv_flow_imp.id(2354692042232397.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2355192094232397.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2355631194232397.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2356183961232397.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2356695430232398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2357139797232398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2357635471232398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2358162041232398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2358637990232398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719684836837942735.4852)
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
 p_id=>wwv_flow_imp.id(719691677138942761.4852)
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
 p_id=>wwv_flow_imp.id(2885761300491394.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2886251874491394.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2886770517491394.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2887202398491394.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2887703800491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2888281550491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2888744692491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2889250396491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2889771794491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2890297412491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2890704980491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2891290368491395.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2891791894491396.4852)
,p_plug_template_id=>wwv_flow_imp.id(719691677138942761.4852)
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
 p_id=>wwv_flow_imp.id(719702549794942779.4852)
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
 p_id=>wwv_flow_imp.id(2952916730493397.4852)
,p_plug_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2953445489493398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2953930689493398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(2954494553493398.4852)
,p_plug_template_id=>wwv_flow_imp.id(719702549794942779.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_page_anchors
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719704379601942780.4852)
,p_layout=>'TABLE'
,p_template=>'<div class="a-PageAnchors #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>#BODY#</div>'
,p_page_plug_template_name=>'[x] APEX 5.0 - Page Anchors'
,p_internal_name=>'APEX_5.0_PAGE_ANCHORS'
,p_plug_table_bgcolor=>'white'
,p_theme_id=>3
,p_theme_class_id=>0
,p_plug_heading_bgcolor=>'white'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_form_table_attr=>' '
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(135735792018120570.4852)
,p_plug_template_id=>wwv_flow_imp.id(719704379601942780.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(135736286198120570.4852)
,p_plug_template_id=>wwv_flow_imp.id(719704379601942780.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_page_designer_column
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719705012309942781.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-PageColumn #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-PageColumn-header">',
'    <h2 class="a-PageColumn-heading" data-apex-heading>#TITLE#</h2>',
'  </div>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Page Designer Column'
,p_internal_name=>'APEX_5.0_PAGE_DESIGNER_COLUMN'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3761160737621370.4852)
,p_plug_template_id=>wwv_flow_imp.id(719705012309942781.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3761601340621370.4852)
,p_plug_template_id=>wwv_flow_imp.id(719705012309942781.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_page_designer_column_body
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719705787384942781.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-PageColumn-body #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Page Designer Column (Body)'
,p_internal_name=>'APEX_5.0_PAGE_DESIGNER_COLUMN_BODY'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140688193927344317.4852)
,p_plug_template_id=>wwv_flow_imp.id(719705787384942781.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140688257850344317.4852)
,p_plug_template_id=>wwv_flow_imp.id(719705787384942781.4852)
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
 p_id=>wwv_flow_imp.id(719706437830942782.4852)
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
 p_id=>wwv_flow_imp.id(3162429461501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3162907182501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3163449319501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3163984228501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3164486659501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3164952862501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3165464143501008.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3165938751501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3166406378501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3166956667501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3167451193501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3167933022501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3168462724501009.4852)
,p_plug_template_id=>wwv_flow_imp.id(719706437830942782.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region_hidden_heading
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719716763420942796.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Region #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <h2 class="u-VisuallyHidden" data-apex-heading>#TITLE#</h2>',
'  <div class="a-Region-body">',
'  #BODY#',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'[x] APEX 5.0 - Region (Hidden Heading)'
,p_internal_name=>'APEX_5.0_REGION_HIDDEN_HEADING'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3200959697502851.4852)
,p_plug_template_id=>wwv_flow_imp.id(719716763420942796.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3201485008502851.4852)
,p_plug_template_id=>wwv_flow_imp.id(719716763420942796.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_region_with_icon
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Region a-Region--hasIcon #REGION_CSS_CLASSES#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Region-header">',
'    <div class="a-Region-headerItems  a-Region-headerItems--title">',
'      <h2 id="#REGION_STATIC_ID#_TITLE" class="a-Region-title" data-apex-heading>#TITLE#</h2>',
'    </div>',
'    <div class="a-Region-headerItems  a-Region-headerItems--buttons">',
'      #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'    </div>',
'  </div>',
'  <div class="a-Region-body">',
'    <div class="a-RegionMedia">',
'      <div class="a-RegionMedia-graphic">',
'        <span aria-hidden="true" class="a-Icon a-Icon--regionIcon #ICON_CSS_CLASSES#"></span>',
'      </div>',
'      <div class="a-RegionMedia-content">',
'        #BODY#',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Region with Icon'
,p_internal_name=>'APEX_5.0_REGION_WITH_ICON'
,p_theme_id=>3
,p_theme_class_id=>21
,p_preset_template_options=>'a-Region--noPadding'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_region_title_dom_id=>'#REGION_STATIC_ID#_TITLE'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1704730428423915.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1705244050423915.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1705796699423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1706217239423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1706763944423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1707233711423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1707723814423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1708259059423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1708718681423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1709284452423916.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1709707735423917.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1710260128423917.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(1710746882423917.4852)
,p_plug_template_id=>wwv_flow_imp.id(719717435785942797.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_toolbar
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719728426095942807.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="toolbar" aria-label="#TITLE!ATTR#" class="a-Toolbar #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  <div class="a-Toolbar-items a-Toolbar-items--left">#PREVIOUS#</div>',
'  <div class="a-Toolbar-items a-Toolbar-items--right">#NEXT#</div>',
'  #BODY#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar'
,p_internal_name=>'APEX_5.0_TOOLBAR'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(68614213761251734.4852)
,p_plug_template_id=>wwv_flow_imp.id(719728426095942807.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(68614724238251735.4852)
,p_plug_template_id=>wwv_flow_imp.id(719728426095942807.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(68615259883251735.4852)
,p_plug_template_id=>wwv_flow_imp.id(719728426095942807.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(68615746855251735.4852)
,p_plug_template_id=>wwv_flow_imp.id(719728426095942807.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_toolbar_items_left
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Toolbar-items a-Toolbar-items--left #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar Items (Left)'
,p_internal_name=>'APEX_5.0_TOOLBAR_ITEMS_LEFT'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140647978458344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648003460344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648101731344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648247973344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648352618344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648445011344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648515862344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648679845344358.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648703446344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648863722344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140648971842344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649036076344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649113033344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729116465942807.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_toolbar_items_right
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Toolbar-items a-Toolbar-items--right #REGION_CSS_CLASSES#" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  #PREVIOUS##EXPAND##EDIT##CHANGE##DELETE##COPY##HELP##NEXT##CREATE##CREATE2##CLOSE#',
'</div>'))
,p_page_plug_template_name=>'APEX 5.0 - Toolbar Items (Right)'
,p_internal_name=>'APEX_5.0_TOOLBAR_ITEMS_RIGHT'
,p_theme_id=>3
,p_theme_class_id=>21
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649255147344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649387395344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649406902344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649570368344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649656675344357.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649775442344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649842353344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140649926878344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140650010315344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140650120034344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140650229710344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140650386139344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(140650479481344356.4852)
,p_plug_template_id=>wwv_flow_imp.id(719729865365942808.4852)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/apex_5_0_wizard_body_hide_show
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(719730593079942808.4852)
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
 p_id=>wwv_flow_imp.id(3339497315506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3339983885506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3340419154506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3340970759506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3341450718506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Create2'
,p_placeholder=>'CREATE2'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3341915328506021.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3342458073506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3342936234506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Expand'
,p_placeholder=>'EXPAND'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3343451247506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3343997451506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3344423729506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3344928842506022.4852)
,p_plug_template_id=>wwv_flow_imp.id(719730593079942808.4852)
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
 p_id=>wwv_flow_imp.id(719731261318942809.4852)
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
 p_id=>wwv_flow_imp.id(3368933039508597.4852)
,p_plug_template_id=>wwv_flow_imp.id(719731261318942809.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3369469353508597.4852)
,p_plug_template_id=>wwv_flow_imp.id(719731261318942809.4852)
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
 p_id=>wwv_flow_imp.id(719731990154942810.4852)
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
 p_id=>wwv_flow_imp.id(3395481328510525.4852)
,p_plug_template_id=>wwv_flow_imp.id(719731990154942810.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3395924646510525.4852)
,p_plug_template_id=>wwv_flow_imp.id(719731990154942810.4852)
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
prompt --application/shared_components/user_interface/templates/region/apex_5_0_div_with_id_class_and_region_attributes_002
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(725723925684227744.4852)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#" class="#REGION_CSS_CLASSES#" #REGION_ATTRIBUTES#>',
'<h1 class="u-VisuallyHidden" data-apex-heading>#TITLE#</h1>#PREVIOUS##BODY##NEXT#</div>'))
,p_page_plug_template_name=>'[x] APEX 5.2 - H1 Region with Attributes'
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
 p_id=>wwv_flow_imp.id(3428757899517369.4852)
,p_plug_template_id=>wwv_flow_imp.id(725723925684227744.4852)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3429251406517369.4852)
,p_plug_template_id=>wwv_flow_imp.id(725723925684227744.4852)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3429785331517369.4852)
,p_plug_template_id=>wwv_flow_imp.id(725723925684227744.4852)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(3430222480517370.4852)
,p_plug_template_id=>wwv_flow_imp.id(725723925684227744.4852)
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
prompt --application/shared_components/user_interface/templates/list/apex_4_0_pull_down_tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(6681909853641062.4852)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="current">',
'    <a class="nosub" href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a>',
'</div>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="non-current">',
'    <a class="nosub" href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a>',
'</div>',
''))
,p_list_template_name=>'APEX 4.0 - Pull Down Tabs'
,p_internal_name=>'APEX_4.0_PULL_DOWN_TABS'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div id="tabs" class="dhtmlMenuLG">'
,p_list_template_after_rows=>'</div>'
,p_before_sub_list=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul id="S#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="aTabs dhtmlSubMenu pulldown-tabs" style="display:none;">',
''))
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>'
,p_sub_list_item_noncurrent=>'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)" title="#TEXT_ESC_SC#">#TEXT#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="current">',
'    <a href="#LINK#" title="#TEXT_ESC_SC#" class="link_text">#TEXT#</a>',
'    <a href="#" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false); return false;" class="link_icon">',
'        <img src="#IMAGE_PREFIX#apex/builder/down_dark_12x12.gif" width="12" height="12" class="dhtmlMenu" alt="#IMAGE_ALT#"/>',
'    </a>',
'</div>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#LIST_ITEM_ID#" class="non-current">',
'    <a href="#LINK#" title="#TEXT_ESC_SC#" class="link_text">#TEXT#</a>',
'    <a href="#" onclick="app_AppMenuMultiOpenBottom3(this,''S#LIST_ITEM_ID#'',''#LIST_ITEM_ID#'',false); return false;" class="link_icon">',
'        <img src="#IMAGE_PREFIX#apex/builder/down_dark_12x12.gif" width="12" height="12" class="dhtmlMenu" alt="#IMAGE_ALT#"/>',
'    </a>',
'</div>',
''))
,p_sub_templ_curr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')" title="#TEXT_ESC_SC#"><span>#TEXT#</span><img class="htmldbMIMG" alt="" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></'
||'li>'
,p_sub_templ_noncurr_w_child=>'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')" title="#TEXT_ESC_SC#"><span>#TEXT#</span><img class="htmldbMIMG" alt="" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></'
||'li>'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(6683027032641069.4852)
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
,p_list_template_name=>'[x] APEX 5.0 - Links List (2)'
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_navigation_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(388773697797786787.4852)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#IMAGE#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'APEX 5.0 - Navigation List (2)'
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
 p_id=>wwv_flow_imp.id(388773934841786788.4852)
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
 p_id=>wwv_flow_imp.id(719740035822969345.4852)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_links_list_002
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(719740644210969351.4852)
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
 p_id=>wwv_flow_imp.id(719744974422969355.4852)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_navigation_list_002
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(719752075880969362.4852)
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
prompt --application/shared_components/user_interface/templates/list/apex_5_0_sub_tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(719752749945969363.4852)
,p_list_template_current=>'<li class="a-Tabs-item is-active" aria-current="page"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_noncurrent=>'<li class="a-Tabs-item"><a href="#LINK#" class="a-Tabs-link">#TEXT#</a></li>'
,p_list_template_name=>'APEX 5.0 - Sub Tabs'
,p_internal_name=>'APEX_5.0_SUB_TABS'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-TabsContainer a-TabsContainer--subTabs">',
'  <ul class="a-Tabs a-Tabs--subTabButtons">'))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  </ul>',
'</div>'))
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aSubTabs"><ul>',
'<li class="active"><a href="#LINK#" title="#TEXT_ESC_SC#"><span>#TEXT#</span></a></li>'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_5_0_wizard_progress
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(719753408696969364.4852)
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
prompt --application/shared_components/user_interface/templates/list/run_edit_page
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(873644613350880195.4852)
,p_list_template_current=>'<a href="#LINK#" title="#TEXT_ESC_SC#" class="runediticons"><img src="#IMAGE_PREFIX##IMAGE#" alt="#TEXT#" title="#TEXT#" /></a>'
,p_list_template_noncurrent=>'<a href="#LINK#" title="#TEXT_ESC_SC#" class="runediticons"><img src="#IMAGE_PREFIX##IMAGE#" alt="#TEXT#" title="#TEXT#" /></a>'
,p_list_template_name=>'Run / Edit Page'
,p_internal_name=>'RUN_/_EDIT_PAGE'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<table summary="" cellpadding="0" cellspacing="0" border="0" id="htmldbRunEdit"><tr><td class="htmldbRunEdit">&PAGE.&nbsp;&FB_FLOW_PAGE_ID.</td><td>'
,p_list_template_after_rows=>'</td></tr></table>'
,p_list_template_comment=>'run edit page with icons shown in the top right corner'
);
end;
/
prompt --application/shared_components/user_interface/templates/list/apex_4_0_mike_region_tabbed_navigation
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(1655476716389340490.4852)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="current"><div class="tbl"><a href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a></div><div class="tbr"><img alt="" src="#IMAGE_PREFIX#1px_trans.gif"></div></div>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="non-current"><div class="tbl"><a href="#LINK#" title="#TEXT_ESC_SC#">#TEXT#</a></div><div class="tbr"><img alt="" src="#IMAGE_PREFIX#1px_trans.gif"></div></div>',
''))
,p_list_template_name=>'APEX 4.0 MIKE Region Tabbed Navigation'
,p_internal_name=>'APEX_4.0_MIKE_REGION_TABBED_NAVIGATION'
,p_theme_id=>3
,p_theme_class_id=>0
,p_list_template_before_rows=>'<div id="subtabs" style="padding-left:6px;">'
,p_list_template_after_rows=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/dhtml_automatic_ppr_pagination_report_100
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(6679518318641053.4852)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report 100%'
,p_internal_name=>'DHTML_AUTOMATIC_PPR_PAGINATION_REPORT_100%'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#">#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="htmldbStandard3"  border="0" summary="" id="#REGION_ID#" href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:" style="width:100%;">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'#CSV_LINK#',
'',
'<script>',
'<!--',
'init_htmlPPRReport(''#REGION_ID#'');',
'',
'//-->',
'</script>',
'</htmldb:#REGION_ID#>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#">#COLUMN_HEADER#</th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/dhtml_automatic_ppr_pagination_report_from_4999
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(6679925011641056.4852)
,p_row_template_name=>'(DHTML) Automatic PPR Pagination Report from 4999'
,p_internal_name=>'DHTML_AUTOMATIC_PPR_PAGINATION_REPORT_FROM_4999'
,p_row_template1=>'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#"><div class="of">#COLUMN_VALUE#</div></td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" cellspacing="0" class="htmldbStandard3"  border="0" summary="" id="#REGION_ID#" htmldb:href="p=&APP_ID.:&APP_PAGE_ID.:&SESSION.:pg_R_#REGION_ID#:NO:">',
'<tbody>'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</tbody>',
'<tfoot>#PAGINATION#</tfoot>',
'</table>',
'<span class="htmldbCSV">#CSV_LINK#</span>',
'',
'<script>',
'<!--',
'init_htmlPPRReport(''#REGION_ID#'');',
'',
'//-->',
'</script>',
'</htmldb:#REGION_ID#>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#"><div class="of">#COLUMN_HEADER#</div></th>'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#TEXT#',
''))
,p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-left:5px;"><img src="#IMAGE_PREFIX#jtfunexe.gif" alt="" /></a>'
,p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" style="margin-right:5px;"><img src="#IMAGE_PREFIX#jtfupree.gif" alt=""/></a>'
,p_row_style_mouse_over=>'#CCCCCC'
,p_row_style_checked=>'#CCCCCC'
,p_theme_id=>3
,p_theme_class_id=>7
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/apex_4_0_standard_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_row_template_name=>'APEX 4.0 - Standard Report'
,p_internal_name=>'APEX_4.0_STANDARD_REPORT'
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
 p_id=>wwv_flow_imp.id(410824020274284659.4852)
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_portlet_row_template
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(410824639895284680.4852)
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_vertical_report
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_row_template_name=>'APEX 5.0 - Vertical Report'
,p_internal_name=>'APEX_5.0_VERTICAL_REPORT'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<tr>',
'  <td class="a-Report-cell a-Report-cell--header" scope="row">#COLUMN_HEADER#</td>',
'  <td class="a-Report-cell">#COLUMN_VALUE#</td>',
'</tr>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="a-Report a-Report--vertical a-Report--staticRowColors #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES#>',
'  <div class="a-Report-wrap">',
'    <table class="a-Report-pagination">#TOP_PAGINATION#</table>',
'    <div class="a-Report-tableWrap">',
'    <table class="a-Report-report" summary="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    </table>',
'    </div>',
'    <div class="a-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="a-Report-pagination a-Report-pagination a-Report-pagination--bottom">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>' '
,p_row_template_after_last=>' '
,p_row_template_table_attr=>'OMIT'
,p_row_template_type=>'GENERIC_COLUMNS'
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
prompt --application/shared_components/user_interface/templates/report/apex_5_0_badge_list_named_column
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(719756401064973260.4852)
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
 p_id=>wwv_flow_imp.id(719765686149973274.4852)
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
 p_id=>wwv_flow_imp.id(719766306083973274.4852)
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
 p_id=>wwv_flow_imp.id(719768854998973277.4852)
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
prompt --application/shared_components/user_interface/templates/label/apex_4_0_top_bar_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(6683302430641069.4852)
,p_template_name=>'APEX 4.0 - Top Bar Label'
,p_internal_name=>'APEX_4.0_TOP_BAR_LABEL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="apex-ga-label" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>0
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_optional
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(6683429755641072.4852)
,p_template_name=>'FormField_Optional'
,p_internal_name=>'FORMFIELD_OPTIONAL'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><a class="htmldbLabelOptional" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'',''&CLOSE.'')" tabindex="999">'
,p_template_body2=>'</a></label>'
,p_theme_id=>3
,p_theme_class_id=>1
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_optional_no_link
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(6683514682641072.4852)
,p_template_name=>'FormField_Optional No Link'
,p_internal_name=>'FORMFIELD_OPTIONAL_NO_LINK'
,p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#"><span class="htmldbLabelOptional">'
,p_template_body2=>'</span></label>'
,p_theme_id=>3
,p_theme_class_id=>3
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/formfield_required
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(6683627983641072.4852)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_dynamic_attribute
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(719737144024952633.4852)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_hidden_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(719737202731952639.4852)
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
prompt --application/shared_components/user_interface/templates/label/apex_5_0_optional_label
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(719737377976952639.4852)
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
 p_id=>wwv_flow_imp.id(719737479015952640.4852)
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
 p_id=>wwv_flow_imp.id(719737577300952641.4852)
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
 p_id=>wwv_flow_imp.id(719737671382952642.4852)
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
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumbs_c_htmldbbreadcrumb
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(6685028533641078.4852)
,p_name=>'Breadcrumbs (c:htmldbBreadcrumb) '
,p_internal_name=>'BREADCRUMBS_C:HTMLDBBREADCRUMB_'
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
prompt --application/shared_components/user_interface/templates/breadcrumb/apex_5_0_breadcrumbs
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(388777204236790831.4852)
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
 p_id=>wwv_flow_imp.id(6685219659641084.4852)
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
 p_id=>wwv_flow_imp.id(6685118440641079.4852)
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
 p_id=>wwv_flow_imp.id(72334735125547461.4852)
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
 p_id=>wwv_flow_imp.id(204025807133792433.4852)
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
 p_id=>wwv_flow_imp.id(556403468587125379.4852)
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
 p_id=>wwv_flow_imp.id(556403733815126066.4852)
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
 p_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(410842861136417204.4852)
,p_theme_id=>3
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(604902705499438118.4852)
,p_theme_id=>3
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(697251294722708867.4852)
,p_theme_id=>101
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(698694776128187820.4852)
,p_theme_id=>101
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(698695498474187821.4852)
,p_theme_id=>101
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(698696193838187821.4852)
,p_theme_id=>101
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(698697787201187821.4852)
,p_theme_id=>101
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719685315860942741.4852)
,p_theme_id=>101
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719686065595942753.4852)
,p_theme_id=>101
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719687083065942754.4852)
,p_theme_id=>101
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719693321199942765.4852)
,p_theme_id=>101
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719694346985942765.4852)
,p_theme_id=>101
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719696520421942771.4852)
,p_theme_id=>101
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_theme_id=>101
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_theme_id=>101
,p_name=>'BADGE_LAYOUT'
,p_display_name=>'Badge Layout'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_theme_id=>101
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_theme_id=>3
,p_name=>'HEIGHT'
,p_display_name=>'Height'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746524032352832160.4852)
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
 p_id=>wwv_flow_imp.id(746524354430832160.4852)
,p_theme_id=>3
,p_name=>'FORM_LABEL_WIDTH'
,p_display_name=>'Form Label Width'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746524636021832160.4852)
,p_theme_id=>3
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Not Part of Button Set'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746525736498832161.4852)
,p_theme_id=>3
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746526003025832161.4852)
,p_theme_id=>3
,p_name=>'FORM_LABEL_POSITION'
,p_display_name=>'Form Label Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746526303910832162.4852)
,p_theme_id=>3
,p_name=>'BUTTON_SIZE'
,p_display_name=>'Button Size'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Button Size'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746526607241832162.4852)
,p_theme_id=>3
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing left'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Left Spacing'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746526976589832162.4852)
,p_theme_id=>3
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default Right Spacing'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746527492206832162.4852)
,p_theme_id=>3
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Icon on Right'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(746527712264832162.4852)
,p_theme_id=>3
,p_name=>'BUTTON_TYPE'
,p_display_name=>'Button Type'
,p_display_sequence=>1
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_theme_id=>3
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_theme_id=>3
,p_name=>'REGION_PADDING'
,p_display_name=>'Region Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Padding'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750700275488419640.4852)
,p_theme_id=>3
,p_name=>'REGION_POSITION'
,p_display_name=>'Region Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Position'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_theme_id=>3
,p_name=>'REGION_STYLE'
,p_display_name=>'Region Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Style'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_theme_id=>3
,p_name=>'REGION_OVERFLOW'
,p_display_name=>'Region Overflow'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default Behavior'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(750721754465422866.4852)
,p_theme_id=>3
,p_name=>'DISPLAY'
,p_display_name=>'Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(787120436131949721.4852)
,p_theme_id=>3
,p_name=>'ALTERNATING_TABLE_ROWS'
,p_display_name=>'Alternating Table Rows'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Enable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(787120733611949723.4852)
,p_theme_id=>3
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Disable'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_theme_id=>3
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default Border'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(787121853109949723.4852)
,p_theme_id=>3
,p_name=>'REPORT_WIDTH'
,p_display_name=>'Report Width'
,p_display_sequence=>1
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(1021077947236574443.4852)
,p_theme_id=>3
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default - No Icons'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1547536185426808.4852)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden to Assistive Tech'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
,p_help_text=>'By default, region title is hidden but accessible, use this option to remove the header from accessible interface'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2352228697083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2352553339083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2352995183083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2353365707083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2353743351083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2354144013083137.4852)
,p_theme_id=>3
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(2351912479072652.4852)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410825804183284695.4852)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(787120733611949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410826226966284700.4852)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410826663105284701.4852)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410827025024284701.4852)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410827468202284702.4852)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(787121853109949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410827865197284702.4852)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(410825361296284681.4852)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410843276773417204.4852)
,p_theme_id=>3
,p_name=>'ERROR'
,p_display_name=>'Error'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--danger'
,p_group_id=>wwv_flow_imp.id(410842861136417204.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410843608096417205.4852)
,p_theme_id=>3
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(750721754465422866.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410844086444417207.4852)
,p_theme_id=>3
,p_name=>'INFORMATIONAL'
,p_display_name=>'Informational'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--info'
,p_group_id=>wwv_flow_imp.id(410842861136417204.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410844477602417207.4852)
,p_theme_id=>3
,p_name=>'REMOVE_ICON'
,p_display_name=>'Remove Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--noIcon'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410844862990417208.4852)
,p_theme_id=>3
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--success'
,p_group_id=>wwv_flow_imp.id(410842861136417204.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410845297101417208.4852)
,p_theme_id=>3
,p_name=>'USE_COLORED_BACKGROUND'
,p_display_name=>'Use Colored Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--colorBG'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410845655793417209.4852)
,p_theme_id=>3
,p_name=>'USE_DEFAULT_ICONS'
,p_display_name=>'Use Default Icons'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--defaultIcons'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410846061900417209.4852)
,p_theme_id=>3
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--warning'
,p_group_id=>wwv_flow_imp.id(410842861136417204.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(410846435114417209.4852)
,p_theme_id=>3
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(410842408391417181.4852)
,p_css_classes=>'a-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(750721754465422866.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719749095572969359.4852)
,p_theme_id=>101
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--cols a-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719749378327969359.4852)
,p_theme_id=>101
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--cols a-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719749632408969359.4852)
,p_theme_id=>101
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--cols a-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719749999172969359.4852)
,p_theme_id=>101
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--cols a-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719750270888969359.4852)
,p_theme_id=>101
,p_name=>'SPANHORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(719745438780969357.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719750521283969360.4852)
,p_theme_id=>101
,p_name=>'HIDEBADGE'
,p_display_name=>'Hide Badge'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--noBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719750827622969360.4852)
,p_theme_id=>101
,p_name=>'HIDEDESCRIPTION'
,p_display_name=>'Hide Description'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--noDesc'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719751139188969360.4852)
,p_theme_id=>101
,p_name=>'HIDETITLE'
,p_display_name=>'Hide Title'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--noTitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719751444164969360.4852)
,p_theme_id=>101
,p_name=>'HIDEICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--noIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719751746273969360.4852)
,p_theme_id=>101
,p_name=>'SLIMLIST'
,p_display_name=>'Slim List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719744974422969355.4852)
,p_css_classes=>'a-MediaList--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719761756589973270.4852)
,p_theme_id=>101
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719762074209973270.4852)
,p_theme_id=>101
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719762347743973271.4852)
,p_theme_id=>101
,p_name=>'STACKEDVERTICALLY'
,p_display_name=>'Stacked Vertically'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719762657912973271.4852)
,p_theme_id=>101
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719762981452973271.4852)
,p_theme_id=>101
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719763261799973271.4852)
,p_theme_id=>101
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719763565151973271.4852)
,p_theme_id=>101
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719763866645973271.4852)
,p_theme_id=>101
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(719759344431973269.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719764136152973271.4852)
,p_theme_id=>101
,p_name=>'2COLUMNNGRID'
,p_display_name=>'2 Columnn Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719764457918973271.4852)
,p_theme_id=>101
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719764796759973272.4852)
,p_theme_id=>101
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719765079854973272.4852)
,p_theme_id=>101
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--cols a-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719765336086973272.4852)
,p_theme_id=>101
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719756401064973260.4852)
,p_css_classes=>'a-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(719756857955973266.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747447930745062680.4852)
,p_theme_id=>3
,p_name=>'LARGELEFT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(746526607241832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747448195284062681.4852)
,p_theme_id=>3
,p_name=>'LARGERIGHT'
,p_display_name=>'Large'
,p_display_sequence=>1
,p_css_classes=>'a-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(746526976589832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747448314100062681.4852)
,p_theme_id=>3
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746527492206832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747448512100062681.4852)
,p_theme_id=>3
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>3
,p_css_classes=>'a-Button--large'
,p_group_id=>wwv_flow_imp.id(746526303910832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747448789732062681.4852)
,p_theme_id=>3
,p_name=>'SMALLLEFT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(746526607241832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747448938441062681.4852)
,p_theme_id=>3
,p_name=>'SMALLRIGHT'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--padRight'
,p_group_id=>wwv_flow_imp.id(746526976589832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747449123999062681.4852)
,p_theme_id=>3
,p_name=>'INNERBUTTON'
,p_display_name=>'Inner Button'
,p_display_sequence=>2
,p_css_classes=>'a-Button--pill'
,p_group_id=>wwv_flow_imp.id(746524636021832160.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747449340190062681.4852)
,p_theme_id=>3
,p_name=>'LASTBUTTON'
,p_display_name=>'Last Button'
,p_display_sequence=>3
,p_css_classes=>'a-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(746524636021832160.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747449571553062681.4852)
,p_theme_id=>3
,p_name=>'FIRSTBUTTON'
,p_display_name=>'First Button'
,p_display_sequence=>1
,p_css_classes=>'a-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(746524636021832160.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747449731770062681.4852)
,p_theme_id=>3
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>1
,p_css_classes=>'a-Button--primary'
,p_group_id=>wwv_flow_imp.id(746527712264832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747449891888062681.4852)
,p_theme_id=>3
,p_name=>'REGIONHEADERBUTTON'
,p_display_name=>'Button in Region Header'
,p_display_sequence=>1
,p_css_classes=>'a-Button--regionHeader'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450089546062681.4852)
,p_theme_id=>3
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>1
,p_css_classes=>'a-Button--small'
,p_group_id=>wwv_flow_imp.id(746526303910832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450122219062681.4852)
,p_theme_id=>3
,p_name=>'STRONGBUTTONLABEL'
,p_display_name=>'Strong Button Label'
,p_display_sequence=>1
,p_css_classes=>'a-Button--strongLabel'
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450323348062681.4852)
,p_theme_id=>3
,p_name=>'AUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form--autoWidthLabels'
,p_group_id=>wwv_flow_imp.id(746524354430832160.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450579040062682.4852)
,p_theme_id=>3
,p_name=>'FIXEDWIDTH'
,p_display_name=>'Fixed'
,p_display_sequence=>10
,p_css_classes=>'a-Form--fixedLabels'
,p_group_id=>wwv_flow_imp.id(746524354430832160.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450779854062682.4852)
,p_theme_id=>3
,p_name=>'LABELSABOVE'
,p_display_name=>'Labels Above'
,p_display_sequence=>1
,p_css_classes=>'a-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(746526003025832161.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747450942414062682.4852)
,p_theme_id=>3
,p_name=>'ALIGNLABELSLEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_css_classes=>'a-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(746524032352832160.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747451165030062682.4852)
,p_theme_id=>3
,p_name=>'LABELAUTOWIDTH'
,p_display_name=>'Auto Width'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--autoLabelWidth'
,p_group_id=>wwv_flow_imp.id(746525736498832161.4852)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747451224088062682.4852)
,p_theme_id=>3
,p_name=>'STRETCHFORMFIELD'
,p_display_name=>'Stretch Form Field'
,p_display_sequence=>1
,p_css_classes=>'a-Form-fieldContainer--stretch'
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747451425091062682.4852)
,p_theme_id=>3
,p_name=>'FIXEDLARGE'
,p_display_name=>'Fixed (Large Width)'
,p_display_sequence=>30
,p_css_classes=>'a-Form-fixedLabelsLarge'
,p_group_id=>wwv_flow_imp.id(746524354430832160.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747451600479062682.4852)
,p_theme_id=>3
,p_name=>'FIXEDMEDIUM'
,p_display_name=>'Fixed (Medium Width)'
,p_display_sequence=>20
,p_css_classes=>'a-Form-fixedLabelsMed'
,p_group_id=>wwv_flow_imp.id(746524354430832160.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747451867827062682.4852)
,p_theme_id=>3
,p_name=>'180PX'
,p_display_name=>'180px'
,p_display_sequence=>10
,p_css_classes=>'h180'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747452046306062685.4852)
,p_theme_id=>3
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>20
,p_css_classes=>'h240'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747452223243062685.4852)
,p_theme_id=>3
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>30
,p_css_classes=>'h320'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747452449216062685.4852)
,p_theme_id=>3
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>50
,p_css_classes=>'h480'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747452689227062685.4852)
,p_theme_id=>3
,p_name=>'540PX'
,p_display_name=>'540px'
,p_display_sequence=>60
,p_css_classes=>'h540'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(747452829858062685.4852)
,p_theme_id=>3
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>70
,p_css_classes=>'h640'
,p_group_id=>wwv_flow_imp.id(746522780970832157.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946063015083320.4852)
,p_theme_id=>3
,p_name=>'REGIONCONTAINSITEMSTEXT'
,p_display_name=>'Region Contains Items / Text'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--withItems'
,p_template_types=>'REGION'
,p_help_text=>'Check this option if this region contains items or text.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946286739083320.4852)
,p_theme_id=>3
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946482307083320.4852)
,p_theme_id=>3
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946616505083322.4852)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946893486083322.4852)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754946959496083322.4852)
,p_theme_id=>3
,p_name=>'WIZARDDIALOG'
,p_display_name=>'Used for Wizard Dialog'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--wizard'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754947190105083322.4852)
,p_theme_id=>3
,p_name=>'VISIBLE'
,p_display_name=>'Visible'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--showTitle'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(754947398925083322.4852)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719684836837942735.4852)
,p_css_classes=>'a-ButtonRegion--accessibleTitle'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add a visually hidden heading which is accessible for screen readers, but otherwise not visible to users.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787120568119949722.4852)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(787120436131949721.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787120860598949723.4852)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(787120733611949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787121118010949723.4852)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787121347377949723.4852)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787121505745949723.4852)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787121668141949723.4852)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787121959886949723.4852)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(6680513762641056.4852)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(787121853109949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787125838975949728.4852)
,p_theme_id=>3
,p_name=>'DISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(787120436131949721.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126056332949729.4852)
,p_theme_id=>3
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(787120733611949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126250641949729.4852)
,p_theme_id=>3
,p_name=>'NOBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126475470949729.4852)
,p_theme_id=>3
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126699665949729.4852)
,p_theme_id=>3
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(787121012780949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126737679949729.4852)
,p_theme_id=>3
,p_name=>'INLINEBORDERS'
,p_display_name=>'Inline Borders'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--inline'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(787126986708949729.4852)
,p_theme_id=>3
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719768854998973277.4852)
,p_css_classes=>'a-Report--stretch'
,p_group_id=>wwv_flow_imp.id(787121853109949723.4852)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(940696364380341577.4852)
,p_theme_id=>3
,p_name=>'SLIMPROGRESSLIST'
,p_display_name=>'Slim Progress List'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719753408696969364.4852)
,p_css_classes=>'a-WizardSteps--slim'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1019608729798657537.4852)
,p_theme_id=>3
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(388773934841786788.4852)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1019608842503657537.4852)
,p_theme_id=>3
,p_name=>'ADD_SLIDE_ANIMATION'
,p_display_name=>'Add Slide Animation'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(388773934841786788.4852)
,p_css_classes=>'js-slide'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1199562177116032430.4852)
,p_theme_id=>3
,p_name=>'LEFT'
,p_display_name=>'Left'
,p_display_sequence=>1
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_css_classes=>'a-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(746527492206832162.4852)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525660373773182102.4852)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525660453236182102.4852)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525660576207182102.4852)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525660668772182102.4852)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525660853485182102.4852)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(1021077947236574443.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525661000539182102.4852)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(6683027032641069.4852)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(1021077947236574443.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525663443196182118.4852)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525663555494182118.4852)
,p_theme_id=>3
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--showBadge'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525663691914182118.4852)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525663701680182118.4852)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525663988048182118.4852)
,p_theme_id=>3
,p_name=>'FORTOPLEVELONLY'
,p_display_name=>'For top level only'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(1021077947236574443.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1525664122904182118.4852)
,p_theme_id=>3
,p_name=>'FORALLITEMS'
,p_display_name=>'For all items'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(719740644210969351.4852)
,p_css_classes=>'a-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(1021077947236574443.4852)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1544816183566477996.4852)
,p_theme_id=>3
,p_name=>'SHOWRIGHTARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719766306083973274.4852)
,p_css_classes=>'a-LinksList--showArrow'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1544816239334477996.4852)
,p_theme_id=>3
,p_name=>'USEBRIGHTHOVERS'
,p_display_name=>'Use Bright Hovers'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719766306083973274.4852)
,p_css_classes=>'a-LinksList--brightHover'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1544816346635477997.4852)
,p_theme_id=>3
,p_name=>'DONOTWRAPTEXT'
,p_display_name=>'Do not wrap text'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(719766306083973274.4852)
,p_css_classes=>'a-LinksList--nowrap'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554808167201408361.4852)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554808376461408362.4852)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554808538958408362.4852)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554808702062408362.4852)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554808992281408362.4852)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(750700275488419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554809198122408362.4852)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554809350418408362.4852)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554809541904408363.4852)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554809723181408363.4852)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554809868131408363.4852)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554810080669408363.4852)
,p_theme_id=>3
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719706437830942782.4852)
,p_css_classes=>'a-Region--simple'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554831128435526790.4852)
,p_theme_id=>3
,p_name=>'RESPONSIVEICONCOLUMNS'
,p_display_name=>'Responsive Icon Columns'
,p_display_sequence=>2
,p_region_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_css_classes=>'a-IRR-region--responsiveIconView'
,p_template_types=>'REGION'
,p_help_text=>'Automatically increases number of icon columns to show based on screen resolution.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554831281587526791.4852)
,p_theme_id=>3
,p_name=>'ICONLABELSRIGHT'
,p_display_name=>'Icon Labels on Right'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_css_classes=>'a-IRR-region--iconLabelsRight'
,p_template_types=>'REGION'
,p_help_text=>'Shows labels in Icon View to the right of the icon.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554831398178526791.4852)
,p_theme_id=>3
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'Remove Outer Borders'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719702549794942779.4852)
,p_css_classes=>'a-IRR-region--noOuterBorders'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554838902558542255.4852)
,p_theme_id=>3
,p_name=>'FLUSHREGION'
,p_display_name=>'Flush Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--flush'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554839044958542255.4852)
,p_theme_id=>3
,p_name=>'STACKEDREGION'
,p_display_name=>'Stacked Region'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--stacked'
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554839293090542255.4852)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554839447434542255.4852)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554839629067542255.4852)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(750700275488419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554839801508542255.4852)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554840011745542255.4852)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554840202523542255.4852)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554840441586542256.4852)
,p_theme_id=>3
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>.1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(750721754465422866.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554840668183542256.4852)
,p_theme_id=>3
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719691677138942761.4852)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(750721754465422866.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554860289631550796.4852)
,p_theme_id=>3
,p_name=>'REMOVE_TOP_BORDER'
,p_display_name=>'Remove Top Border'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--noTopBorder'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554860417345550796.4852)
,p_theme_id=>3
,p_name=>'ACCESSIBLEHEADING'
,p_display_name=>'Hidden (Accessible)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--accessibleHeader'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554860625063550796.4852)
,p_theme_id=>3
,p_name=>'AUTOSCROLL'
,p_display_name=>'Scroll'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--scrollAuto'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554860834521550796.4852)
,p_theme_id=>3
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(750700521792419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554861036468550796.4852)
,p_theme_id=>3
,p_name=>'DEFAULTPADDING'
,p_display_name=>'Default Padding'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--paddedBody'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554861239925550796.4852)
,p_theme_id=>3
,p_name=>'HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(750698972347419636.4852)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554861401068550796.4852)
,p_theme_id=>3
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--noPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554861664175550796.4852)
,p_theme_id=>3
,p_name=>'SCROLLWITHSHADOWS'
,p_display_name=>'Scroll (with Shadows)'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--shadowScroll'
,p_group_id=>wwv_flow_imp.id(750701252020419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554861870266550796.4852)
,p_theme_id=>3
,p_name=>'SIDEBAR'
,p_display_name=>'Sidebar'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--sideRegion'
,p_group_id=>wwv_flow_imp.id(750700275488419640.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1554862010703550796.4852)
,p_theme_id=>3
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(719717435785942797.4852)
,p_css_classes=>'a-Region--slimPadding'
,p_group_id=>wwv_flow_imp.id(750699786949419639.4852)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
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
 p_id=>wwv_flow_imp.id(693462905220662747.4852)
,p_build_option_name=>'Enable APEX Internal Feedback'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
,p_default_on_export=>'EXCLUDE'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(865700153074085752.4852)
,p_build_option_name=>'Enable check for duplicate null modules'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>37165770887393
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Used to control whether the warning dialog appears telling people about duplicate null Module URIs in the APEX REST metadata.'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121158354775667743)
,p_name=>'RFS.DELETE_HANDLER'
,p_message_language=>'fr'
,p_message_text=>'Voulez-vous supprimer ce gestionnaire et tous ses enfants ?'
,p_is_js_message=>true
,p_version_scn=>2566380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121158108403667743)
,p_name=>'RFS.DELETE_MODULE'
,p_message_language=>'fr'
,p_message_text=>'Voulez-vous supprimer ce module et tous ses enfants ?'
,p_is_js_message=>true
,p_version_scn=>2566380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121158030476667743)
,p_name=>'RFS.DELETE_PRIVILEGE'
,p_message_language=>'fr'
,p_message_text=>unistr('Voulez-vous supprimer ce privil\00E8ge et tous ses enfants ?')
,p_is_js_message=>true
,p_version_scn=>2566380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121158482610667743)
,p_name=>'RFS.DELETE_ROLE'
,p_message_language=>'fr'
,p_message_text=>unistr('Voulez-vous supprimer ce r\00F4le ?')
,p_is_js_message=>true
,p_version_scn=>2566380
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(121158203143667743)
,p_name=>'RFS.DELETE_TEMPLATE'
,p_message_language=>'fr'
,p_message_text=>unistr('Voulez-vous supprimer ce mod\00E8le et tous ses enfants ?')
,p_is_js_message=>true
,p_version_scn=>2566380
);
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(315392728012249274.4852)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_version_scn=>75558529
,p_shortcut=>'Voulez-vous effectuer cette action de suppression ?'
);
end;
/
prompt --application/shared_components/user_interface/shortcuts/ok_to_get_next_prev_pk_value
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(1420362217001980473.4852)
,p_shortcut_name=>'OK_TO_GET_NEXT_PREV_PK_VALUE'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_version_scn=>75558529
,p_shortcut=>unistr('Etes-vous s\00FBr de vouloir quitter cette page sans l''enregistrer ?')
);
end;
/
prompt --application/shared_components/security/authentications/internal_authentication
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(540039604917681918.4852)
,p_name=>'Internal Authentication'
,p_scheme_type=>'PLUGIN_COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_invalid_session_type=>'LOGIN'
,p_logout_url=>'f?p=4550:8:&SESSION.'
,p_cookie_name=>'ORA_WWV_USER_&INSTANCE_ID.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>2609098
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_saml
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(44507630272251872.4852)
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
,p_version_scn=>2609089
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_apex
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(113747616193665437.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'
,p_display_name=>'Comptes Oracle APEX INTERNAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.APEX'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_apex'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609089
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_social
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'
,p_display_name=>unistr('Connexion par r\00E9seau social INTERNAL')
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SOCIAL'),'')
,p_api_version=>2
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_social'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_social'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_social'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_social'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_social'
,p_substitute_attributes=>true
,p_version_scn=>2609089
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416933091514942582.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_display_sequence=>10
,p_display_value=>'OpenID Connect Provider'
,p_return_value=>'OPENID_CONNECT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416933503377942582.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_display_sequence=>20
,p_display_value=>'Generic OAuth2 Provider'
,p_return_value=>'OAUTH2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416934060074942582.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_display_sequence=>30
,p_display_value=>'Google'
,p_return_value=>'GOOGLE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416934535596942583.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_display_sequence=>40
,p_display_value=>'Facebook'
,p_return_value=>'FACEBOOK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416935071738942583.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Discovery URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OPENID_CONNECT'
,p_examples=>'https://accounts.example.com/.well-known/openid-configuration'
,p_help_text=>'Enter the OpenID Connect provider''s discovery URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416935445226942583.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Authorization Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s authorization endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416935842479942583.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Token Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s token endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416936276777942584.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'User Info Endpoint URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_help_text=>'Enter the OAuth2 provider''s user info endpoint URL.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416936674071942584.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416937075963942584.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416937436673942584.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416937832520942585.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416938292150942585.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
 p_id=>wwv_flow_imp.id(416938678110942585.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>65
,p_prompt=>'Token Authentication Method'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'BASIC_AND_CLID'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(416932648907942581.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'OAUTH2'
,p_lov_type=>'STATIC'
,p_help_text=>'Enter how the credential''s client ID and client secret should be passed to the server.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416939096466942586.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416938678110942585.4852)
,p_display_sequence=>10
,p_display_value=>'Basic Authentication'
,p_return_value=>'BASIC'
,p_help_text=>'Send client id and client secret in a Basic Authentication header.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416939571441942586.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416938678110942585.4852)
,p_display_sequence=>20
,p_display_value=>'Basic Authentication and Client ID in Body'
,p_return_value=>'BASIC_AND_CLID'
,p_help_text=>'Send client id and client secret in a Basic Authentication header, but also send client it in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416940042351942586.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416938678110942585.4852)
,p_display_sequence=>30
,p_display_value=>'Client ID and Client Secret in Body'
,p_return_value=>'BODY'
,p_help_text=>'Send client id and client secret in the request body.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(416940590575942587.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(416938678110942585.4852)
,p_display_sequence=>40
,p_display_value=>'Client ID in Body'
,p_return_value=>'CLID'
,p_help_text=>'Only send client id in the request body.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(416941017222942587.4852)
,p_plugin_id=>wwv_flow_imp.id(118613601621937846.4852)
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
prompt --application/shared_components/plugins/item_type/com_oracle_apex_group_select_list
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(156397842989136966.4852)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.GROUP_SELECT_LIST'
,p_display_name=>unistr('Liste de s\00E9lection de groupe')
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.GROUP_SELECT_LIST'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- The render procedure is responsible for the rendering of the actual HTML control',
'-- of the new widget. APEX still takes care of the table cell for the layout,',
'-- the label, pre- and post element text. Only the html code between the pre- and',
'-- post element text is rendered by the plug-in. The render procedure has a',
'-- defined interface which every plug-in has to implement. It''s designed in a way',
'-- that future enhancements to the interface will not break existing plug-ins.',
'function render_group_selectlist (',
'    p_item                in wwv_flow_plugin_api.t_page_item,',
'    p_plugin              in wwv_flow_plugin_api.t_plugin,',
'    p_value               in varchar2,',
'    p_is_readonly         in boolean,',
'    p_is_printer_friendly in boolean )',
'    return wwv_flow_plugin_api.t_page_item_render_result',
'is',
'    -- value without the lov null value',
'    l_value             varchar2(32767) := case when p_value = p_item.lov_null_value then null else p_value end;',
'',
'    l_name              varchar2(30);',
'    l_display_value     varchar2(32767);',
'    l_is_selected       boolean := false;',
'    l_value_found       boolean := false;',
'    l_column_value_list wwv_flow_plugin_util.t_column_value_list;',
'    l_group_value       varchar2(4000);',
'    l_last_group_value  varchar2(4000);',
'    l_open_group        boolean := false;',
'    l_result            wwv_flow_plugin_api.t_page_item_render_result;',
'    ',
'    procedure print_option_local (',
'        p_display_value in varchar2,',
'        p_return_value  in varchar2,',
'        p_compare_value in varchar2 )',
'    is',
'        l_is_selected boolean := false;',
'    begin',
'        if not l_value_found and',
'           (  p_return_value = p_compare_value',
'           or p_return_value is null and p_compare_value is null',
'           )',
'        then',
'            l_value_found := true;',
'            l_is_selected := true;',
'        end if;',
'        -- add list entry',
'        wwv_flow_plugin_util.print_option (',
'            p_display_value => p_display_value,',
'            p_return_value  => p_return_value,',
'            p_is_selected   => l_is_selected,',
'            p_attributes    => p_item.element_option_attributes );',
'    end print_option_local;',
'begin',
'    -- During plug-in development it''s very helpful to have some debug information',
'    if wwv_flow.g_debug then',
'        wwv_flow_plugin_util.debug_page_item (',
'            p_plugin              => p_plugin,',
'            p_page_item           => p_item,',
'            p_value               => p_value,',
'            p_is_readonly         => p_is_readonly,',
'            p_is_printer_friendly => p_is_printer_friendly );',
'    end if;',
'',
'    -- Based on the flags we normally generate different HTML code, but that',
'    -- depends on the plug-in.',
'    if p_is_readonly or p_is_printer_friendly then',
'        wwv_flow_plugin_util.print_hidden_if_readonly (',
'            p_item_name           => p_item.name,',
'            p_value               => p_value,',
'            p_is_readonly         => p_is_readonly,',
'            p_is_printer_friendly => p_is_printer_friendly );',
'',
'        -- get the display value',
'        l_display_value := wwv_flow_plugin_util.get_display_data (',
'                               p_sql_statement     => p_item.lov_definition,',
'                               p_min_columns       => 3, -- LOV requires 3 column',
'                               p_max_columns       => 3,',
'                               p_component_name    => p_item.name,',
'                               p_display_column_no => 1,',
'                               p_search_column_no  => 2,',
'                               p_search_string     => l_value,',
'                               p_display_extra     => p_item.lov_display_extra );',
'',
'        -- emit display span with the value',
'        wwv_flow_plugin_util.print_display_only (',
'            p_item_name        => p_item.name,',
'            p_display_value    => l_display_value,',
'            p_show_line_breaks => false,',
'            p_escape           => true,',
'            p_attributes       => p_item.element_attributes );',
'    else',
'        -- If a page item saves state, we have to call the get_input_name_for_page_item',
'        -- to render the internal hidden p_arg_names field. It will also return the',
'        -- HTML field name which we have to use when we render the HTML input field.',
'        l_name := wwv_flow_plugin_api.get_input_name_for_page_item(false);',
'        sys.htp.prn(''<select name="''||l_name||''" id="''||p_item.name||''" ''||',
'                  coalesce(p_item.element_attributes, ''class="group_selectlist"'')||''>'');',
'',
'        -- add display null entry',
'        if p_item.lov_display_null then',
'            --wwv_flow_utilities.add_null_value_entry(''ITEM'', l_name, p_item.lov_null_value);',
'            -- add list entry',
'            print_option_local (',
'                    p_display_value => p_item.lov_null_text,',
'                    p_return_value  => p_item.lov_null_value,',
'                    p_compare_value => nvl(l_value, p_item.lov_null_value) );',
'        end if;',
'',
'        -- get all values',
'        l_column_value_list := wwv_flow_plugin_util.get_data (',
'                                   p_sql_statement      => p_item.lov_definition,',
'                                   p_min_columns        => 3,',
'                                   p_max_columns        => 3,',
'                                   p_component_name     => p_item.name );',
'',
'        -- loop through the result',
'        for i in 1 .. l_column_value_list(1).count /* display value */',
'        loop',
'            l_group_value := l_column_value_list(3)(i); /* group column */',
'            -- has the group changed?',
'            if (l_group_value <> l_last_group_value) or',
'               (l_group_value is     null and l_last_group_value is not null) or',
'               (l_group_value is not null and l_last_group_value is     null)',
'            then',
'                if l_open_group then',
'                    sys.htp.p(''</optgroup>'');',
'                    l_open_group := false;',
'                end if;',
'                if l_group_value is not null then',
'                    sys.htp.p (''<optgroup label="''||wwv_flow_escape.html(l_group_value)||''">'');',
'                    l_open_group := true;',
'                end if;',
'                l_last_group_value := l_group_value;',
'            end if;',
'            -- add list entry',
'            print_option_local (',
'                p_display_value => l_column_value_list(1)(i),',
'                p_return_value  => l_column_value_list(2)(i),',
'                p_compare_value => l_value );',
'        end loop;',
'',
'        if l_open_group then',
'            sys.htp.p(''</optgroup>'');',
'        end if;',
'        -- Show at least the value if it hasn''t been found in the database',
'        if not l_value_found and l_value is not null and p_item.lov_display_extra then',
'            print_option_local (',
'                p_display_value => l_value,',
'                p_return_value  => l_value,',
'                p_compare_value => l_value );',
'        end if;',
'        -- close our select list',
'        sys.htp.p(''</select>'');',
'       ',
'        wwv_flow_javascript.add_onload_code (',
'            p_code => ''apex.builder.plugin.groupSelectList(''||',
'                wwv_flow_javascript.add_value(''#''||p_item.name)||',
'                ''{''||',
'                wwv_flow_javascript.add_attribute(''nullValue'',      p_item.lov_null_value, false, false)||',
'                ''});'' );',
'        ',
'        -- Tell APEX that this field is navigable',
'        l_result.is_navigable := true;',
'    end if;',
'    return l_result;',
'end render_group_selectlist;'))
,p_api_version=>1
,p_render_function=>'render_group_selectlist'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:QUICKPICK:SOURCE:ELEMENT:HEIGHT:ELEMENT_OPTION:ENCRYPT:LOV:LOV_DISPLAY_NULL'
,p_substitute_attributes=>true
,p_version_scn=>2609089
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'http://www.oracleapex.info/'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(156398003741136975.4852)
,p_plugin_id=>wwv_flow_imp.id(156397842989136966.4852)
,p_name=>'LOV'
,p_sql_min_column_count=>3
,p_sql_max_column_count=>3
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select e.ename as d,',
'       e.empno as r,',
'       d.dname as grp',
'  from emp e,',
'       dept d',
' where d.deptno = e.deptno',
' order by d.dname, e.ename',
'</pre>'))
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_cloud_idm
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356674103679447686.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'
,p_display_name=>'Oracle Cloud Identity Management INTERNAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.CLOUD_IDM'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_cloud'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_cloud'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_cloud'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_cloud'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_cloud'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609091
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_db
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356677018501447690.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.DB'
,p_display_name=>unistr('Comptes de base de donn\00E9es INTERNAL')
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.DB'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_db'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609091
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_header
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356714620431447729.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'
,p_display_name=>unistr('Variable d''en-t\00EAte HTTP INTERNAL')
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.HEADER'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_header'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_header'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_header'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_header'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_header'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609093
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308179378006529852.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
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
 p_id=>wwv_flow_imp.id(308179785548529852.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
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
 p_id=>wwv_flow_imp.id(308180171279529852.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(308179785548529852.4852)
,p_display_sequence=>10
,p_display_value=>'Redirect to Built-In URL'
,p_return_value=>'BUILTIN_URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308180673653529852.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(308179785548529852.4852)
,p_display_sequence=>20
,p_display_value=>'Redirect to URL'
,p_return_value=>'URL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308181139483529853.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(308179785548529852.4852)
,p_display_sequence=>30
,p_display_value=>'Display Error'
,p_return_value=>'ERROR'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308181630111529853.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(308179785548529852.4852)
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
 p_id=>wwv_flow_imp.id(308182058997529854.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Error Message'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_display_length=>60
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_imp.id(308179785548529852.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'ERROR'
,p_help_text=>'Specifies the error message to be displayed if the HTTP header variable does not contain a value or the HTTP header variable does not exist.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308182453203529854.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
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
 p_id=>wwv_flow_imp.id(308182847836529855.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(308182453203529854.4852)
,p_display_sequence=>10
,p_display_value=>'Each Request'
,p_return_value=>'ALWAYS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(308183372544529856.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(308182453203529854.4852)
,p_display_sequence=>20
,p_display_value=>'After Login'
,p_return_value=>'CALLBACK'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(308183800057529856.4852)
,p_plugin_id=>wwv_flow_imp.id(356714620431447729.4852)
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
 p_id=>wwv_flow_imp.id(356785826007447783.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'
,p_display_name=>'Annuaire LDAP INTERNAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.LDAP'),'')
,p_api_version=>1
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_ldap'
,p_standard_attributes=>'INVALID_SESSION:LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609093
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Saisissez le nom utilisateur et le mot de passe permettant l''authentification par rapport \00E0 l''annuaire LDAP identifi\00E9 dans la page de connexion. N''oubliez pas que, pour les mots de passe, il peut y avoir distinction entre les majuscules et les min')
||'uscules.</p>',
''))
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356786126109447783.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356786512722447783.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356786924086447785.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356787310773447789.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356786924086447785.4852)
,p_display_sequence=>10
,p_display_value=>'SSL'
,p_return_value=>'SSL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356787811096447789.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356786924086447785.4852)
,p_display_sequence=>20
,p_display_value=>'SSL with Authentication'
,p_return_value=>'SSL_AUTH'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356788327860447789.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356786924086447785.4852)
,p_display_sequence=>30
,p_display_value=>'No SSL'
,p_return_value=>'NO_SSL'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356788802127447789.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356789212920447789.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356789604423447789.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Search Filter'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>40
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(356789212920447789.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'N'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Enter the search filter when not using an exact distinguished name (DN). Use <strong>%LDAP_USER%</strong> as a place-holder for the username. For example:',
'</p>',
'<p><pre>cn=%LDAP_USER%</pre></p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(356790016159447790.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356790429871447790.4852)
,p_plugin_id=>wwv_flow_imp.id(356785826007447783.4852)
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
 p_id=>wwv_flow_imp.id(356790826964447790.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356790429871447790.4852)
,p_display_sequence=>10
,p_display_value=>'Standard'
,p_return_value=>'STD'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356791330010447790.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356790429871447790.4852)
,p_display_sequence=>20
,p_display_value=>'Only special characters'
,p_return_value=>'ONLY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(356791830303447791.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(356790429871447790.4852)
,p_display_sequence=>30
,p_display_value=>'No Escaping'
,p_return_value=>'NO'
);
end;
/
prompt --application/shared_components/plugins/authentication_type/com_oracle_apex_authn_internal_sso
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(356820723668447809.4852)
,p_plugin_type=>'AUTHENTICATION TYPE'
,p_name=>'COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'
,p_display_name=>'Oracle Application Server Single Sign-On INTERNAL'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('AUTHENTICATION TYPE','COM.ORACLE.APEX.AUTHN.INTERNAL.SSO'),'')
,p_api_version=>1
,p_ajax_function=>'wwv_flow_authentication_dev.plugin_callback_osso'
,p_session_sentry_function=>'wwv_flow_authentication_dev.plugin_sentry_osso'
,p_invalid_session_function=>'wwv_flow_authentication_dev.plugin_invalid_session_osso'
,p_authentication_function=>'wwv_flow_authentication_dev.plugin_authenticate_osso'
,p_post_logout_function=>'wwv_flow_authentication_dev.plugin_post_logout_osso'
,p_standard_attributes=>'LOGIN_PAGE'
,p_substitute_attributes=>true
,p_version_scn=>2609093
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
prompt --application/shared_components/plugins/process_type/com_oracle_apex_proc_internal_run_as
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(358049287019022430.4852)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'COM.ORACLE.APEX.PROC.INTERNAL.RUN_AS'
,p_display_name=>unistr('Ex\00E9cuter PLSQL en tant que PARSE_AS INTERNAL')
,p_supported_component_types=>'APEX_APPLICATION_PAGE_PROC'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','COM.ORACLE.APEX.PROC.INTERNAL.RUN_AS'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function  run_plsql_as_parse_as_exec (',
'    p_process in wwv_flow_plugin_api.t_process,',
'    p_plugin  in wwv_flow_plugin_api.t_plugin )',
'    return wwv_flow_plugin_api.t_process_exec_result',
'IS',
'-- VARIABLES',
'    l_return       wwv_flow_plugin_api.t_process_exec_result;',
'    l_exec_return  varchar2(32767); -- return from dynamic exec',
'    L_SQL          varchar2(32767); -- SQL STATEMENT',
'    l_plsql        varchar2(32767) := p_process.attribute_01; -- PL/SQL to Run',
'    l_parse_as     varchar2(32767) := p_process.attribute_02; -- Parse As Schema',
'',
'BEGIN',
'-- DEBUG',
'IF wwv_flow.g_debug then ',
'   wwv_flow_plugin_util.debug_process( p_plugin => p_plugin,',
'                                   p_process => p_process);',
'END IF;',
'--',
'-- Initialize the return message;',
'--',
'   l_return.success_message := p_process.success_message;',
'--',
'-- START',
'--',
'l_exec_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(l_parse_as, wwv_flow_user_api.get_default_schema)',
'        );',
'        ',
'if l_exec_return != ''SUCCESS'' then ',
'  RAISE_APPLICATION_ERROR (-20000, l_exec_return);',
'END IF;    ',
'--',
'-- END',
'--',
'RETURN l_return;',
'  EXCEPTION',
'    WHEN OTHERS THEN',
'      RAISE; ',
'END;'))
,p_api_version=>2
,p_execution_function=>'run_plsql_as_parse_as_exec'
,p_substitute_attributes=>true
,p_version_scn=>75558533
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(358049433955022432.4852)
,p_plugin_id=>wwv_flow_imp.id(358049287019022430.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'PL/SQL '
,p_attribute_type=>'PLSQL'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(358049808170022434.4852)
,p_plugin_id=>wwv_flow_imp.id(358049287019022430.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Parse As Schama'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_display_length=>20
,p_max_length=>255
,p_is_translatable=>false
,p_examples=>'&P0_SCHEMA.'
,p_help_text=>'Enter the name for the Pares As schema to run this PL/SQL as.'
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_clob_code_editor
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.CLOB_CODE_EDITOR'
,p_display_name=>'Editeur de code CLOB'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.CLOB_CODE_EDITOR'),'')
,p_api_version=>1
,p_render_function=>'wwv_flow_f4000_plugins.render_clob_code_editor'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_clob_code_editor'
,p_standard_attributes=>'SOURCE_SQL:NO_DATA_FOUND_MESSAGE:INIT_JAVASCRIPT_CODE:AI_ENABLED_ALWAYS'
,p_substitute_attributes=>true
,p_version_scn=>120172118
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Language'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2201610910587369.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2202153211587369.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>20
,p_display_value=>'HTML'
,p_return_value=>'HTMLMIXED'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2202655563587369.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>30
,p_display_value=>'CSS'
,p_return_value=>'CSS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2203136240587369.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>40
,p_display_value=>'JavaScript'
,p_return_value=>'JAVASCRIPT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2203691440587369.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>42
,p_display_value=>'JSON'
,p_return_value=>'json'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2204195789587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>45
,p_display_value=>'DDL'
,p_return_value=>'DDL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2204686847587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>50
,p_display_value=>'PL/SQL Block'
,p_return_value=>'PLSQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2205195001587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>70
,p_display_value=>'PL/SQL Expression'
,p_return_value=>'PLSQL_EXPRESSION'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2205695011587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>80
,p_display_value=>'PL/SQL Function Body'
,p_return_value=>'PL/SQL_FUNCTION_BODY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2206121556587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>90
,p_display_value=>'Based on Page Item'
,p_return_value=>'PAGE_ITEM'
,p_help_text=>'The language will be dynamically set by the value of a Page Item.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2206637548587370.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>100
,p_display_value=>'MLE - JavaScript - Module'
,p_return_value=>'mle-javascript-module'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2207146604587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_display_sequence=>110
,p_display_value=>'MLE - JavaScript - Snippet'
,p_return_value=>'mle-javascript-snippet'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Height'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2208076937587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>1
,p_display_value=>'5'
,p_return_value=>'5'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2208506341587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>2
,p_display_value=>'10'
,p_return_value=>'10'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2209087204587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>3
,p_display_value=>'20'
,p_return_value=>'20'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2209505188587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>10
,p_display_value=>'30'
,p_return_value=>'30'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2210024362587371.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>20
,p_display_value=>'60'
,p_return_value=>'60'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2210598956587372.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>25
,p_display_value=>'80'
,p_return_value=>'80'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2211090047587372.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2207641956587371.4852)
,p_display_sequence=>30
,p_display_value=>'Automatic'
,p_return_value=>'AUTO'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211593526587372.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Read Only'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2211970838587372.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>15
,p_static_id=>'attribute_04'
,p_prompt=>'Return Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL_EXPRESSION,PLSQL_FUNCTION_BODY'
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2212336518587372.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211970838587372.4852)
,p_display_sequence=>10
,p_display_value=>'VARCHAR2'
,p_return_value=>'VARCHAR2'
,p_help_text=>'VARCHAR2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2212831715587372.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2211970838587372.4852)
,p_display_sequence=>20
,p_display_value=>'BOOLEAN'
,p_return_value=>'BOOLEAN'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2213340029587372.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Remote Database ID item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_common=>false
,p_is_translatable=>false
,p_help_text=>'Specify the an item containing the ID of the remote database to use for code validation.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2213705323587373.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>15
,p_static_id=>'attribute_06'
,p_prompt=>'Page Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(2201224266587369.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Choose a page item whose value will decide the language (mode) of the editor.</p>',
'<p>An event listener will further be placed on this item, so that when its value changes, the editor will change accordingly.</p>',
'<p>Possible values for this item are the exact language identifiers the Monaco Editor supports, such as: <code>javascript</code>, <code>html</code>, <code>css</code>, <code>json</code>, <code>sql</code> or others.</p>',
'<p>Note that changing the language will not change the editor''s value, so an extra Set Value dynamic action will be required to clear the contents.</p>'))
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(2215037215587374.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(2215405363587374.4852)
,p_plugin_id=>wwv_flow_imp.id(358990304554564248.4852)
,p_name=>'SOURCE_SQL'
,p_is_required=>false
,p_sql_min_column_count=>1
,p_sql_max_column_count=>1
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select clob_content',
'from demo_scripts'))
);
end;
/
prompt --application/shared_components/plugins/region_type/com_oracle_apex_simple_staus
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.ORACLE.APEX.SIMPLE_STAUS'
,p_display_name=>'Badge de statut simple'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.ORACLE.APEX.SIMPLE_STAUS'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function simple_status( p_region              in wwv_flow_plugin_api.t_region,',
'                        p_plugin              in wwv_flow_plugin_api.t_plugin,',
'                        p_is_printer_friendly in boolean ) return wwv_flow_plugin_api.t_region_render_result is',
'    l_retval         wwv_flow_plugin_api.t_region_render_result;',
'    --',
'    --',
'    c_result_alias    constant varchar2(255)  := p_region.attribute_01;',
'    c_label_alias     constant varchar2(255)  := p_region.attribute_02;',
'    c_status_alias    constant varchar2(255)  := p_region.attribute_03;',
'    c_link            constant varchar2(4000) := p_region.attribute_04;',
'    c_link_label      constant varchar2(255)  := p_region.attribute_05;',
'    --',
'    l_column_value_list wwv_flow_plugin_util.t_column_value_list2;',
'    l_label_column_number    pls_integer;',
'    l_result_column_number   pls_integer;',
'    l_status_column_number  pls_integer;',
'    --',
'    l_app_id            varchar2(255) := :APP_ID;',
'    l_session_id        varchar2(255) := :APP_SESSION;',
'    l_label             varchar2(255);',
'    l_result            varchar2(20);',
'    l_status            varchar2(255);',
'    l_link              varchar2(4000);',
'',
'BEGIN',
'    -- Get data from the ',
'    l_column_value_list := wwv_flow_plugin_util.get_data2(',
'        p_sql_statement  => p_region.source,',
'        p_min_columns    => 3,',
'        p_max_columns    => null,',
'        p_component_name => p_region.name',
'    );',
'',
'    l_label_column_number := wwv_flow_plugin_util.get_column_no (',
'        p_attribute_label   => ''LABEL'',',
'        p_column_alias      => c_label_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => wwv_flow_plugin_util.c_data_type_varchar2',
'    );',
'    l_result_column_number := wwv_flow_plugin_util.get_column_no (',
'        p_attribute_label   => ''RESULT'',',
'        p_column_alias      => c_result_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => wwv_flow_plugin_util.c_data_type_varchar2',
'    );',
'    l_status_column_number := wwv_flow_plugin_util.get_column_no (',
'        p_attribute_label   => ''STATUS'',',
'        p_column_alias      => c_status_alias,',
'        p_column_value_list => l_column_value_list,',
'        p_is_required       => true,',
'        p_data_type         => wwv_flow_plugin_util.c_data_type_varchar2',
'    );',
'',
'    for l_row_number in 1 .. l_column_value_list(1).value_list.count loop',
'        l_label  := l_column_value_list(l_label_column_number).value_list(l_row_number).varchar2_value;',
'        l_result := l_column_value_list(l_result_column_number).value_list(l_row_number).varchar2_value;',
'        l_status := l_column_value_list(l_status_column_number).value_list(l_row_number).varchar2_value;',
'    end loop;',
'',
'    -- Generate ',
'    sys.htp.p(''<div class="a-IconPanel">'');',
'    sys.htp.p(''  <span class="a-IconPanel-icon a-Icon'');',
'      if  l_result = ''SUCCESS'' then',
'        sys.htp.prn(''icon-status-success" aria-label="''||wwv_flow_lang.system_message(''REST_WS.SIMPLE_STATUS_SUCCESS'')||''"'');',
'      elsif l_result = ''FAILURE'' then',
'        sys.htp.prn(''icon-status-failure" aria-label="''||wwv_flow_lang.system_message(''REST_WS.SIMPLE_STATUS_FAILURE'')||''"'');',
'      else ',
'        sys.htp.prn(''icon-status-warning" aria-label="''||wwv_flow_lang.system_message(''REST_WS.SIMPLE_STATUS_WARNING'')||''"'');',
'      end if;',
'    sys.htp.p(''></span>'');',
'    sys.htp.p(''  <span class="a-IconPanel-setting">''||wwv_flow_plugin_util.escape(l_label, TRUE)||''</span>'');',
'    sys.htp.p(''  <span class="a-IconPanel-status">''||wwv_flow_plugin_util.escape(l_status, TRUE)||''</span>'');',
'   -- sys.htp.p(''          <span class="a-IconPanel-actions">'');',
'   -- sys.htp.p(''            <a href="''||htmldb_util.prepare_url(c_link)||''">'');',
'   -- sys.htp.p(''              <button class="a-Button" type="button">''||wwv_flow_plugin_util.escape(c_link_label, TRUE)||''</button>'');',
'   -- sys.htp.p(''            </a>'');',
'   -- sys.htp.p(''          </span>'');',
'    sys.htp.p(''  </span>'');',
'    sys.htp.p(''  </span>'');',
'    sys.htp.p(''</div>'');',
'    ',
'    return l_retval;    ',
'END;'))
,p_api_version=>1
,p_render_function=>'simple_status'
,p_standard_attributes=>'SOURCE_LOCATION:ORDER_BY'
,p_substitute_attributes=>true
,p_version_scn=>1088654318
,p_subscribe_plugin_settings=>true
,p_help_text=>'<p>La fonction de statut simple permet d''afficher un simple statut vert/rouge en fonction d''une valeur TRUE ou FALSE.</p>'
,p_version_identifier=>'5.2.0'
,p_files_version=>2
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(460317866107496515.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Result'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Result value must be one of the following: SUCCESS, FAILURE, WARNING'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(460319023465506482.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Label'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(460320220356509585.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Status'
,p_attribute_type=>'REGION SOURCE COLUMN'
,p_is_required=>true
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(460321404029511456.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Link'
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(460325854825654129.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Link Label'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(430010795499639591.4852)
,p_plugin_id=>wwv_flow_imp.id(430010507045639589.4852)
,p_name=>'SOURCE_LOCATION'
,p_depending_on_has_to_exist=>true
);
end;
/
prompt --application/shared_components/plugins/authorization_type/com_oracle_apex_developer_authorization
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(852575313487939509.4852)
,p_plugin_type=>'AUTHORIZATION TYPE'
,p_name=>'COM.ORACLE.APEX.DEVELOPER_AUTHORIZATION'
,p_display_name=>unistr('Autorisation du d\00E9veloppeur')
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
,p_version_scn=>2609095
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_plugin_id=>wwv_flow_imp.id(852575313487939509.4852)
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
 p_id=>wwv_flow_imp.id(1738572536758000.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>10
,p_display_value=>'ADMIN: Ability to manage flow developer privileges'
,p_return_value=>'ADMIN'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1739064234758001.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>20
,p_display_value=>'EDIT: Ability change all attributes of specified flow(s)'
,p_return_value=>'EDIT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1739594445758001.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>30
,p_display_value=>'HELP: Ability edit help page for a given company'
,p_return_value=>'HELP'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1740003805758001.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>40
,p_display_value=>'BROWSE: Access to Oracle data dictionary browser'
,p_return_value=>'BROWSE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1740461698758001.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>50
,p_display_value=>'CREATE: Ability to create new flows'
,p_return_value=>'CREATE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1740925138758002.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>60
,p_display_value=>'MONITOR: Ability to monitor flow activity'
,p_return_value=>'MONITOR'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1741474065758002.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>70
,p_display_value=>'DB_MONITOR: Ability to monitor Oracle database attributes'
,p_return_value=>'DB_MONITOR'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1741922226758002.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>80
,p_display_value=>'SQL: Ability to issues SQL statements'
,p_return_value=>'SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1742425607758002.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>90
,p_display_value=>'USER_MANAGER: Manage user accounts for cookie based authentication'
,p_return_value=>'USER_MANAGER'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1742980062758003.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>100
,p_display_value=>'DATA_LOADER: Data Workshop'
,p_return_value=>'DATA_LOADER'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1743456807758003.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>110
,p_display_value=>'RESTFUL: Ability to enable RESTful Services'
,p_return_value=>'RESTFUL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1743979435758004.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>130
,p_display_value=>'EDIT or SQL'
,p_return_value=>'EDIT:SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(1738056349758000.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(1737639399757999.4852)
,p_display_sequence=>140
,p_display_value=>'DATA_GENERATOR: Ability to access Data Generator in SQL Workshop'
,p_return_value=>'DATA_GENERATOR'
);
end;
/
prompt --application/shared_components/plugins/item_type/com_oracle_apex_code_editor
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'COM.ORACLE.APEX.CODE_EDITOR'
,p_display_name=>'Editeur de code'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','COM.ORACLE.APEX.CODE_EDITOR'),'')
,p_api_version=>2
,p_render_function=>'wwv_flow_f4000_plugins.render_code_editor'
,p_ajax_function=>'wwv_flow_f4000_plugins.ajax_code_editor'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:HEIGHT:ENCRYPT:INIT_JAVASCRIPT_CODE:SESSION_STATE_CLOB:AI_ENABLED_ALWAYS'
,p_substitute_attributes=>true
,p_version_scn=>120171691
,p_subscribe_plugin_settings=>true
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Language'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2141524190583343.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2142005223583343.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>20
,p_display_value=>'HTML'
,p_return_value=>'HTMLMIXED'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2142555502583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>30
,p_display_value=>'CSS'
,p_return_value=>'CSS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2143065811583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>40
,p_display_value=>'JavaScript'
,p_return_value=>'JAVASCRIPT'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2143572488583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>42
,p_display_value=>'JSON'
,p_return_value=>'json'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2144091431583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>43
,p_display_value=>'YAML'
,p_return_value=>'yaml'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2144567266583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>45
,p_display_value=>'DDL'
,p_return_value=>'DDL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2145018542583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>50
,p_display_value=>'PL/SQL Block'
,p_return_value=>'PLSQL'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2145528248583344.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>60
,p_display_value=>'PL/SQL Functions/Procedures'
,p_return_value=>'PLSQL_FUNCTIONS'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2146024988583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>70
,p_display_value=>'PL/SQL Expression'
,p_return_value=>'PLSQL_EXPRESSION'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2146569255583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>80
,p_display_value=>'PL/SQL Function Body'
,p_return_value=>'PLSQL_FUNCTION_BODY'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2147099134583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>90
,p_display_value=>'Based on Page Item'
,p_return_value=>'PAGE_ITEM'
,p_help_text=>'The language will be dynamically set by the value of a Page Item.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2147559128583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>100
,p_display_value=>'MLE - JavaScript - Module'
,p_return_value=>'mle-javascript-module'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2148074836583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>105
,p_display_value=>'MLE - JavaScript - Snippet'
,p_return_value=>'mle-javascript-snippet'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2148515599583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>110
,p_display_value=>'File URLs - JavaScript'
,p_return_value=>'file-urls-javascript'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2149036724583345.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_display_sequence=>120
,p_display_value=>'File URLs - CSS'
,p_return_value=>'file-urls-css'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2149591098583346.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Return Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'VARCHAR2'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL_EXPRESSION,PLSQL_FUNCTION_BODY'
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2149940964583346.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2149591098583346.4852)
,p_display_sequence=>10
,p_display_value=>'VARCHAR2'
,p_return_value=>'VARCHAR2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(2150483085583346.4852)
,p_plugin_attribute_id=>wwv_flow_imp.id(2149591098583346.4852)
,p_display_sequence=>20
,p_display_value=>'BOOLEAN'
,p_return_value=>'BOOLEAN'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2150938868583346.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attribute_03'
,p_prompt=>'Show Query Builder'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PAGE_ITEM'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2151333373583346.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attribute_04'
,p_prompt=>'Adjustable Height'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'If Yes the user can adjust the height of the code editor.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2151775295583346.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attribute_05'
,p_prompt=>'Remote  Database ID item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_common=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'Specify a page item containing the remote database ID to use for code validation.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2152174226583346.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>15
,p_static_id=>'attribute_06'
,p_prompt=>'Page Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(2141146980583343.4852)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGE_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Choose a page item whose value will decide the language (mode) of the editor.</p>',
'',
'<p>An event listener will be placed on this item, so when its value changes, the editor will change accordingly.</p>',
'',
'<p>Possible values for this item are the exact language identifiers the Monaco Editor supports, such as: <code>javascript</code>, <code>html</code>, <code>css</code>, <code>json</code>, <code>sql</code> or others.</p>',
'',
'<p>Note that changing the language will not change the editor''s value, so an extra Set Value dynamic action will be required to clear the contents.</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(2152550792583347.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attribute_07'
,p_prompt=>'Diff Editor'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When in diff mode, the value is expected to be a stringified JSON of type <code>{"original":"...","modified":"..."}</code></p>',
'<p>Set the session state data type to CLOB when dealing with large values.</p>',
'<p>The original value is not editable. The modified value is editable by default, but this can be changed via the item''s Read Only flag.</p>'))
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(2153851808583348.4852)
,p_plugin_id=>wwv_flow_imp.id(2638440060724883493.4852)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
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
 p_id=>.4852
,p_name=>'ZERO'
,p_alias=>'ZERO'
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54182919367062219.4852)
,p_plug_name=>'JavaScript for Spinner on Tree Click'
,p_region_name=>'ordsTreeCSS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BEFORE_FOOTER'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'    document.onload = function() {',
'',
'        var $wP;',
'',
'        $( "#Tree_tree" ).treeView({',
'                activateNode: function( event ) {',
'                        $wP = apex.widget.waitPopup();',
'                }',
'        });',
'        //$("[role=''treeitem'']").click(function(){',
'        //    $wP = apex.widget.waitPopup();',
'        //});',
'        ',
'        // Dans le code suivant : ',
unistr('        //Le code dans la premi\00E8re m\00E9thode setTimeout a un d\00E9lai de 1 ms. Cela permet d''ajouter la fonction \00E0 la file d''attente d''IU. '),
unistr('        //Comme setTimeout est ex\00E9cut\00E9 de mani\00E8re asynchrone, l''interpr\00E9teur JavaScript continue en appelant directement l''instruction RETURN, '),
unistr('        //ce qui d\00E9clenche l''ouverture de la bo\00EEte de dialogue modale des navigateurs. Cela bloque la file d''attente d''IU et le code provenant de la premi\00E8re m\00E9thode setTimeout '),
unistr('        //n''est pas ex\00E9cut\00E9 tant que la bo\00EEte de dialogue n''est pas ferm\00E9e. Si l''utilisateur appuie sur Annuler, une autre m\00E9thode setTimeout est d\00E9clench\00E9e et '),
unistr('        //activ\00E9e en 1 seconde. Si l''utilisateur clique sur OK, il est redirig\00E9 et la deuxi\00E8me m\00E9thode setTimeout n''est jamais activ\00E9e.'),
'',
'        $(window).bind(''beforeunload'', function() {',
'            setTimeout(function() { ',
'                setTimeout(function() {',
'                    $wP.remove();',
'                }, 500);',
'            }, 1);',
'            return ; ',
'        });',
'',
'    };',
'</script>'))
,p_translate_title=>'N'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388765343250781060.4852)
,p_plug_name=>'APEX 5 - Header'
,p_region_css_classes=>'a-Header apex-sql-workshop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388765545527781060.4852)
,p_plug_name=>'APEX 5 - Header Left'
,p_parent_plug_id=>wwv_flow_imp.id(388765343250781060.4852)
,p_region_css_classes=>'a-Header-col a-Header-col--left'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
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
 p_id=>wwv_flow_imp.id(79232049637259810.4852)
,p_plug_name=>'Navigation Tabs Landmark'
,p_parent_plug_id=>wwv_flow_imp.id(388765545527781060.4852)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_landmark_type=>'navigation'
,p_landmark_label=>'&PRODUCT_NAME.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6690019401688459.4852)
,p_plug_name=>'APEX Tabs'
,p_region_name=>'a_Header_menu'
,p_parent_plug_id=>wwv_flow_imp.id(79232049637259810.4852)
,p_region_css_classes=>'a-Header-tabsContainer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display: none;"'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_imp.id(719172975581246435.4852)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(388773697797786787.4852)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388765715263781060.4852)
,p_plug_name=>'APEX 5 - Logo'
,p_parent_plug_id=>wwv_flow_imp.id(388765545527781060.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(',
'    ''<a href="'' ||',
'    wwv_flow_utilities.prepare_url(',
'        ''f?p=4100:1:'' || :APP_SESSION || ''::'' || :DEBUG ) ||',
'    ''" class="a-Header-logo"'' ||',
'    wwv_flow_plugin_util.get_html_attr(',
'        p_name  => ''title'',',
'        p_value => wwv_flow_lang.system_message( ''HOME_NAV'' ) ) ||',
'    ''><span role="img" aria-labelledby="labelApexLogo" class="a-Header-apexLogo"><span id="labelApexLogo" class="u-vh">'' ||',
'    wwv_flow_escape.html(',
'        wwv_flow_lang.system_message( ''HOME_NAV'' ) ) ||',
'    ''</span></span></a>'' );'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_landmark_label=>'Logo'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388765918985781061.4852)
,p_plug_name=>'APEX 5 - Home Link'
,p_parent_plug_id=>wwv_flow_imp.id(388765545527781060.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388766163882781061.4852)
,p_plug_name=>'APEX 5 - Header Right'
,p_parent_plug_id=>wwv_flow_imp.id(388765343250781060.4852)
,p_region_css_classes=>'a-Header-col a-Header-col--right'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_landmark_label=>'Barre de navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388766385158781061.4852)
,p_plug_name=>'APEX 5 - Search'
,p_parent_plug_id=>wwv_flow_imp.id(388766163882781061.4852)
,p_region_css_classes=>'a-Header-search'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<div class="a-SearchBox a-SearchBox--noGoButton a-SearchBox--autoExpand a-SearchBox--fill">'');',
'sys.htp.p(''  <div class="a-SearchBox-field">'');',
'sys.htp.p(''    <span class="a-SearchBox-icon"><span class="a-Icon icon-search"></span></span>'');',
'sys.htp.p(''    <label for="P0_SEARCH" class="visuallyhidden">Search</label>'');',
'sys.htp.p(''    <input type="text" class="a-SearchBox-input" id="P0_SEARCH" placeholder="''||wwv_flow_lang.system_message(''WWV_FLOW_QUICK_FLOW.SEARCH'')||''">'');',
'sys.htp.p(''  </div>'');',
'sys.htp.p(''</div>'');'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_plug_name=>'APEX 5 - Header Navigation Links'
,p_parent_plug_id=>wwv_flow_imp.id(388766163882781061.4852)
,p_region_css_classes=>'a-Header-navLinks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2401695610991813.4852)
,p_plug_name=>'APEX 5 - Extensions Menu'
,p_region_name=>'extensionsMenu'
,p_parent_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_list_id=>wwv_flow_imp.id(5403642708844576.4852)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(388773934841786788.4852)
,p_translate_title=>'N'
,p_plug_required_role=>wwv_flow_imp.id(5000735077191350)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388802482283857068.4852)
,p_plug_name=>'APEX 5 - Administration Menu'
,p_region_name=>'adminMenu'
,p_parent_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(697672714234539780.4852)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(388773934841786788.4852)
,p_translate_title=>'N'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(486772471745301734.4852)
,p_plug_name=>'APEX 5 - Help Menu'
,p_region_name=>'helpMenu'
,p_parent_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_list_id=>wwv_flow_imp.id(697677732086541316.4852)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(388773934841786788.4852)
,p_translate_title=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388766724611781061.4852)
,p_plug_name=>'APEX 5 - Header Account'
,p_parent_plug_id=>wwv_flow_imp.id(388766163882781061.4852)
,p_region_css_classes=>'a-Header-account'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>80
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
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_landmark_label=>'Compte'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388766982392781062.4852)
,p_plug_name=>'APEX 5 - Control Bar'
,p_region_css_classes=>'a-ControlBar apex-sql-workshop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_07'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_landmark_type=>'region'
,p_landmark_label=>unistr('Barre de contr\00F4le')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388767112596781062.4852)
,p_plug_name=>'APEX 5 - Control Bar Left'
,p_parent_plug_id=>wwv_flow_imp.id(388766982392781062.4852)
,p_region_css_classes=>'a-ControlBar-col a-ControlBar-col--noPadding'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388803868206871278.4852)
,p_plug_name=>'APEX 5 - Breadcrumb'
,p_parent_plug_id=>wwv_flow_imp.id(388767112596781062.4852)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_menu_id=>wwv_flow_imp.id(6687412253641141.4852)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(388777204236790831.4852)
,p_translate_title=>'N'
,p_landmark_type=>'navigation'
,p_landmark_label=>'Chemin de navigation'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(388767384999781062.4852)
,p_plug_name=>'APEX 5 - Control Bar Right'
,p_parent_plug_id=>wwv_flow_imp.id(388766982392781062.4852)
,p_region_css_classes=>'a-ControlBar-col'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>110
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(334841282133279702.4852)
,p_plug_name=>unistr('Sch\00E9ma')
,p_region_name=>'apex-control-icons'
,p_parent_plug_id=>wwv_flow_imp.id(388767384999781062.4852)
,p_region_css_classes=>'a-Form a-Form--small a-Form--schemaSelect'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'BELOW'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(521638462089366446.4852)
,p_plug_name=>'CSS Override for ORDS Side'
,p_region_name=>'ordsTreeCSS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.a-Side--large {',
'    width: 400px;',
'    min-width: 400px;',
'}',
'</style>'))
,p_translate_title=>'N'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1070722020037074959.4852)
,p_plug_name=>unistr('D\00E9finitions de service RESTful ORDS')
,p_region_name=>'Tree'
,p_region_css_classes=>'a-PageDesigner-treeWrap a-TreeView--ords'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(113301184647876699.4852)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with nodes as ',
'(',
'-- MAIN PARENT NODE',
'SELECT 1 as seq, -10 as ID, wwv_flow_lang.system_message(''REST_WS.TREE_TITLE'') as name, -99 as node, ''RS'' as type, ''RS''||-10 as tree_id',
'from sys.dual',
'UNION',
'-- MODULES NODE',
'select 2 as seq, -3 as ID, wwv_flow_lang.system_message(''REST_WS.TREE_MODULES'') as name, -10 as node, ''MD'' as type, ''MD''||-3 as tree_id',
'from sys.dual',
'UNION',
'-- Individual Modules',
'select 3 as seq, n001 as ID, c001 as name, -3 as node, ''MM'' as type, ''MM''||n001 as tree_id',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_MODULES''',
'',
'UNION',
'-- Individual Templates',
'select 4 as seq, n001 as ID ,  c001 as name , n002 as node, ''MT'' as type, ''MT''||n001 as tree_id',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_TEMPLATES''',
'UNION ',
'-- Individual Handlers',
'select 5 as seq, n001 as ID , c002 as name, n002 as node, ''TH'' as type, ''TH''||n001 as tree_id',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_HANDLERS''',
'UNION ',
'-- Individual Parmeters',
'select 6 as seq, n001 as ID, c001 as name, n002 as node, ''HP'' as type, ''HP''||n001 as tree_id',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_PARAMETERS''',
'UNION',
'-- PRIVILEGE NODE',
'SELECT 7 as seq, -2 as ID, wwv_flow_lang.system_message(''REST_WS.TREE_PRIVILEGES'') as name, -10 as node, ''PR'' as type, ''PR''||-2 as tree_id',
'from sys.dual',
'UNION ',
'-- Individual Privileges',
'select 8 as seq, n001 as ID, c002 as name, -2 as node, ''PP'' as type, ''PP''||n001 as tree_id',
'from wwv_flow_collections ',
' where collection_name = ''ORDS_PRIVILEGES''',
'UNION',
'-- ROLES NODE',
'SELECT 9 as seq, -1 as ID, wwv_flow_lang.system_message(''REST_WS.TREE_ROLES'') as name, -10 as node, ''RO'' as type, ''RO''||-1 as tree_id',
'from sys.dual',
'UNION ',
'-- Individual Roles',
'select 10 as seq, n001 as ID, c001 as name, -1 as node, ''RR'' as type, ''RR''||n001 as tree_id',
'from wwv_flow_collections ',
' where collection_name = ''ORDS_ROLES''',
'UNION ',
'-- OBJECTS NODE',
'SELECT 0 as seq, 0 as ID, wwv_flow_lang.system_message(''REST_WS.TREE_ENABLED_OBJECTS'') as name, -10 as node, ''OB'' as type, ''OB''||0 as tree_id',
'from sys.dual',
'',
')',
'select ',
'        case when connect_by_isleaf = 1 then 0 ',
'              when level = 1 then 1 ',
'              else -1 ',
'        end as status,',
'        level,',
'        name as title,',
'        case when type = ''RS'' then ''icon-rest-services''',
'             when type = ''MD'' then ''icon-rest-modules''',
'             when type = ''MM''  then ''icon-rest-module''',
'             when type = ''MT''  then ''icon-rest-template''',
'             when type = ''TH''  then ''icon-rest-handler''',
'             when type = ''HP''  then ''icon-rest-parameter''',
'             when type = ''PR'' then ''icon-rest-privileges''',
'             when type = ''PP''  then ''icon-rest-privilege''',
'             when type = ''RO'' then ''icon-rest-roles''',
'             when type = ''RR''  then ''icon-rest-role''',
'             when type = ''OB''  then ''icon-rest-object''',
'             else null',
'       end as icon, ',
'       tree_id as value,',
'       name as tooltip,',
'        case when type = ''RS'' then htmldb_util.prepare_url(''f?p=''||:app_id||'':100:''||:app_session||'':::100:P0_SELECTED_NODE:''||tree_id)',
'             when type = ''MD'' then htmldb_util.prepare_url(''f?p=''||:app_id||'':110:''||:app_session||''::110:RP,RIR:P0_SELECTED_NODE:''||tree_id)',
'             when type = ''MM''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':120:''||:app_session||'':::120:P0_SELECTED_NODE,P120_MODULE_ID:''||tree_id||'',''||id)',
'             when type = ''MT''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':130:''||:app_session||'':::130:P0_SELECTED_NODE,P130_TEMPLATE_ID:''||tree_id||'',''||id)',
'             when type = ''TH''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':140:''||:app_session||'':::140:P0_SELECTED_NODE,P140_HANDLER_ID:''||tree_id||'',''||id)',
'             when type = ''HP''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':140:''||:app_session||'':::140:P0_SELECTED_NODE,P140_HANDLER_ID:''||tree_id||'',''||node)',
'             when type = ''PR'' then htmldb_util.prepare_url(''f?p=''||:app_id||'':150:''||:app_session||'':::150:P0_SELECTED_NODE:''||tree_id)',
'             when type = ''PP''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':160:''||:app_session||'':::160:P0_SELECTED_NODE,P160_PRIVILEGE_ID:''||tree_id||'',''||id)',
'             when type = ''RO'' then htmldb_util.prepare_url(''f?p=''||:app_id||'':170:''||:app_session||'':::170:P0_SELECTED_NODE:''||tree_id)',
'             when type = ''RR''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':180:''||:app_session||'':::180:P0_SELECTED_NODE,P180_ROLE_ID:''||tree_id||'',''||id)',
'             when type = ''OB''  then htmldb_util.prepare_url(''f?p=''||:app_id||'':190:''||:app_session||'':::RP,RIR:P0_SELECTED_NODE:''||tree_id)',
'             else null',
'       end as link',
'from nodes',
'connect by prior ID = node',
'start with node = -99',
'order siblings by seq, upper(title)'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_plug_display_when_cond2=>'PLSQL'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.makeNodeAdapter = function(data, types, hasIdentity) {',
'        var a,',
'            ids = apex.storage.getScopedSessionStorage( { usePageId: false, useAppId: true} ).getItem("_rwsTreeState");',
'        if ( ids ) {',
'            ids = ids.split(":");',
'        }',
'        a = $.apex.treeView.makeDefaultNodeAdapter( data, types, hasIdentity, ids );',
'        return a;',
'    }',
'    return options;',
'}'))
,p_landmark_type=>'navigation'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'hierarchy_level_column', 'LEVEL',
  'icon_css_class_column', 'ICON',
  'icon_type_css_class', 'a-Icon',
  'link_column', 'LINK',
  'node_label_column', 'TITLE',
  'node_status_column', 'STATUS',
  'node_value_column', 'VALUE',
  'selected_node_page_item', 'P0_SELECTED_NODE',
  'tooltip_column', 'TOOLTIP',
  'tree_hierarchy', 'LEVEL',
  'tree_tooltip', 'DB')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(388782753453839938.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(388765918985781061.4852)
,p_button_name=>'Home'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(388776713638789177.4852)
,p_button_image_alt=>'Page d''accueil'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4100:1:&SESSION.::&DEBUG.::::'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-home'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(735034467047168739.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'UPGRADE_AVAILABLE'
,p_button_static_id=>'header-upgradeAvailable'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Mise \00E0 niveau disponible')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4000:78:&SESSION.:UPGRADE_AVAILABLE:&DEBUG.:78::'
,p_button_condition=>'wwv_flow_cloud_db_services.get_upgrade_status().state = ''SCHEDULED'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-utilities-build-interval'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(735034318803168738.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'UPGRADE_IN_PROGRESS'
,p_button_static_id=>'header-upgradeInProgress'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Mise \00E0 niveau en cours')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4000:78:&SESSION.:UPGRADE_IN_PROGRESS:&DEBUG.:78::'
,p_button_condition=>'wwv_flow_cloud_db_services.get_upgrade_status().state = ''RUNNING'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-ig-refresh u-Animate-spin'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3773582590058301548.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'SPOTLIGHT'
,p_button_static_id=>'header-spotlightSearch'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:a-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>'Rechercher'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-search'
,p_button_cattributes=>'data-action="spotlight-search" data-no-update="true"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2401741729991814.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'Extensions'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(388776568320789175.4852)
,p_button_image_alt=>'Extensions'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-extension'
,p_button_cattributes=>'data-menu="extensionsMenu_menu"'
,p_security_scheme=>wwv_flow_imp.id(5000735077191350)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(388782965786839939.4852)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'Administration'
,p_button_static_id=>'header-adminMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(388776568320789175.4852)
,p_button_image_alt=>'Administration'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-gears-alt'
,p_button_cattributes=>'data-menu="adminMenu_menu"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(388783141974839939.4852)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'Feedback'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(388776713638789177.4852)
,p_button_image_alt=>'Informations en retour'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=4750:11001:&SESSION.::&DEBUG.:RP,11001:P11001_APPLICATION_ID,P11001_PAGE_ID:&APP_ID.,&APP_PAGE_ID.:'
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-comments'
,p_required_patch=>wwv_flow_imp.id(693462905220662747.4852)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(388783358311839939.4852)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(388766531252781061.4852)
,p_button_name=>'Help'
,p_button_static_id=>'header-helpMenu'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(388776568320789175.4852)
,p_button_image_alt=>'Aide'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'a-Button--noUI a-Button--navLink'
,p_icon_css_classes=>'icon-help'
,p_button_cattributes=>'data-menu="helpMenu_menu"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(243401953198037106.4852)
,p_name=>'P0_EXPANDED_NODES'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1070722020037074959.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(334841331685279703.4852)
,p_name=>'P0_SCHEMA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(334841282133279702.4852)
,p_prompt=>unistr('Sch\00E9ma')
,p_source=>'wwv_flow_user_api.get_default_schema'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DATABASE SCHEMAS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /* APEX4850L1 */ wwv_flow_escape.html(upper(c.schema)) d, upper(c.schema) v',
'from   wwv_flow_company_schemas c,',
'       wwv_flow_fnd_user u',
'where  c.security_group_id = :flow_security_group_id and',
'       u.security_group_id = :flow_security_group_id and',
'       u.user_name = :flow_user and',
'       (u.ALLOW_ACCESS_TO_SCHEMAS is null or',
'        instr('':''||u.ALLOW_ACCESS_TO_SCHEMAS||'':'','':''||c.schema||'':'')>0)',
'order by 1'))
,p_cHeight=>1
,p_tag_css_classes=>'a-Form-select'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WORKSPACE_SCHEMA'
,p_help_text=>unistr('Identifie le nom du propri\00E9taire de sch\00E9ma de base de donn\00E9es.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(370120781439653727.4852)
,p_name=>'P0_SELECTED_NODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1070722020037074959.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619047997355969825.4852)
,p_name=>'Navigate on Change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P0_SCHEMA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619048054572969826.4852)
,p_event_id=>wwv_flow_imp.id(619047997355969825.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.navigation.redirect(''f?p=4850:100:''+ $v(''pInstance'')+'':::100:P0_SELECTED_NODE,P0_SCHEMA:RS-10,''+$v(''P0_SCHEMA''));'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(243402045691037107.4852)
,p_name=>'SAVE Expanded Items'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'unload'
,p_display_when_type=>'FUNCTION_BODY'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'    if instr(:G_ORDS_PAGES,'':''||:APP_PAGE_ID||'':'') != 0 then ',
'        return true;',
'    else',
'         return false;',
'    end if;',
'end;'))
,p_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(243402154992037108.4852)
,p_event_id=>wwv_flow_imp.id(243402045691037107.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var ids = apex.region("Tree").call("getExpandedNodeIds").join(":");',
'apex.storage.getScopedSessionStorage({usePageId: false, useAppId: true}).setItem("_rwsTreeState", ids);'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(323943861698682003.4852)
,p_name=>'Set tree focus'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(323943941558682004.4852)
,p_event_id=>wwv_flow_imp.id(323943861698682003.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const treeRegion = apex.region( "Tree" );',
'',
'if ( treeRegion ) {',
'    const currentSelection = treeRegion.call( "getSelection" );',
'    if ( currentSelection ) {',
'        treeRegion.call( "setSelection", currentSelection, true );  ',
'    }',
'}'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(340329744285995117.4852)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load ORDS_MODULES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_plsql     VARCHAR2(32767);',
'    l_return    VARCHAR2(32767);',
'BEGIN ',
'',
'    --',
'    -- Build the PL/SQL to fill the collecitons from the ORDS_METADATA Schema',
'    -- ',
'    -- First the ORDS Modules',
'    l_plsql := ',
'q''#',
'DECLARE',
'    l_seq    number;',
'BEGIN',
'    -- Create/Truncate the collection',
'    WWV_FLOW_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(''ORDS_MODULES'');',
'    -- Loop through and fill the collection',
'    for m in (select id, name, uri_prefix, items_per_page, status, comments, pre_hook, schema_id, created_by, created_on, updated_by, updated_on, origins_allowed',
'               from USER_ORDS_MODULES)',
'    LOOP',
'        l_seq := wwv_flow_collection.add_member(',
'               p_collection_name => ''ORDS_MODULES'',',
'               p_n001 => m.id,                  ',
'               p_c001 => m.name,              ',
'               p_c002 => m.uri_prefix,           ',
'               p_n002 => m.items_per_page,',
'               p_c003 => m.status,',
'               p_c004 => m.comments, ',
'               p_c005 => m.pre_hook,',
'               p_n003 => m.schema_id,',
'               p_c006 => m.created_by,',
'               p_d001 => m.created_on,',
'               p_c007 => m.updated_by,',
'               p_d002 => m.updated_on,',
'               p_c008 => m.origins_allowed',
'               );',
'    END LOOP;',
'RETURN ''SUCCESS'';',
'EXCEPTION ',
'    WHEN OTHERS THEN ',
'        RETURN SQLERRM;',
'END;  ',
'#'';',
'',
'l_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'            p_function_body   => l_plsql,',
'            p_language        => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema => nvl(:P0_SCHEMA, wwv_flow_user_api.get_default_schema)',
'        );',
'    ',
'END;',
'    '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>340329744285995117.4852
);
end;
/
prompt --application/pages/page_00100
begin
wwv_flow_imp_page.create_page(
 p_id=>100.4852
,p_name=>'Services RESTful ORDS'
,p_alias=>'ORDS-RESTFUL-SERVICES'
,p_step_title=>'Services RESTful ORDS'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
''))
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
,p_help_text=>'No help is available for this page.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395803830429090628.4852)
,p_plug_name=>unistr('Le sch\00E9ma n''est pas inscrit aupr\00E8s d''ORDS.')
,p_region_template_options=>'#DEFAULT#:a-Alert--colorBG:a-Alert--warning:a-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(410842408391417181.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>'wwv_flow_lang.system_message_p(''REST_WS.NOT_ORDS_ENABLED'');'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''X''',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_plug_name=>'Dashboard'
,p_region_name=>'ordsDashboard'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(725723925684227744.4852)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'BELOW'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''X''',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395802139138090611.4852)
,p_plug_name=>'Objets compatibles'
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_css_classes=>'u-Height h220'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_session           varchar2(255) := :APP_SESSION;',
'   l_security_group_id number := :FLOW_SECURITY_GROUP_ID;',
'   l_count             number := 0;',
'begin',
'',
'-- milestones',
'for c1 in (',
' select /* APEX4850100ENOBJ */',
'           count(*) c',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_ENABLED_OBJECTS''',
') loop',
'  l_count := c1.c;',
'',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=4850:190:''||l_session||'':::RIR:P0_SELECTED_NODE:OB0"  class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(l_count,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''REST_WS.ENABLED_OBJECT_COUNT_LABEL'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_column_width=>'apex-col--leftBorder'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395804032743090630.4852)
,p_plug_name=>'Statut de module'
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(395804155777090631.4852)
,p_region_id=>wwv_flow_imp.id(395804032743090630.4852)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>unistr('Aucun module d\00E9fini')
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395804241869090632.4852)
,p_chart_id=>wwv_flow_imp.id(395804155777090631.4852)
,p_seq=>10
,p_name=>unistr('Publi\00E9')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    wwv_flow_lang.system_message(''REST_WS.PUBLISHED'') name,',
'    COUNT(*) the_value',
'FROM',
'    wwv_flow_collections',
'WHERE',
'    collection_name = ''ORDS_MODULES''',
'    AND   c003 = ''PUBLISHED''',
''))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#60CCB5'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,RIR:IREQ_PUBLISHED_STATUS,P0_SELECTED_NODE:PUBLISHED,MD-3'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395804528626090635.4852)
,p_chart_id=>wwv_flow_imp.id(395804155777090631.4852)
,p_seq=>20
,p_name=>unistr('Non publi\00E9')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wwv_flow_lang.system_message(''REST_WS.UNPUBLISHED'') name,',
'    COUNT(*) the_value',
'FROM',
'    wwv_flow_collections',
'WHERE',
'    collection_name = ''ORDS_MODULES''',
'    AND   c003 = ''NOT_PUBLISHED''',
''))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#EC7A71'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,RIR:IREQ_PUBLISHED_STATUS,P0_SELECTED_NODE:NOT_PUBLISHED,MD-3'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395804659971090636.4852)
,p_plug_name=>unistr('S\00E9curit\00E9 des modules')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_column_width=>'apex-col--leftBorder apex-col--bottomBorder'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(395804743932090637.4852)
,p_region_id=>wwv_flow_imp.id(395804659971090636.4852)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>unistr('Aucun module d\00E9fini')
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395804822621090638.4852)
,p_chart_id=>wwv_flow_imp.id(395804743932090637.4852)
,p_seq=>10
,p_name=>unistr('S\00E9curis\00E9')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wwv_flow_lang.system_message(''REST_WS.SECURED'') name,',
'    COUNT(*) the_value',
'FROM',
'    wwv_flow_collections m',
'WHERE m.collection_name = ''ORDS_MODULES''',
'  and  wwv_flow_rest_ws.module_is_protected(m.n001) = ''F'''))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#50CCB5'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,RIR:P0_SELECTED_NODE,IREQ_PROTECTED_FILTER:MD-3,F'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395804984412090639.4852)
,p_chart_id=>wwv_flow_imp.id(395804743932090637.4852)
,p_seq=>20
,p_name=>unistr('Non s\00E9curis\00E9')
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wwv_flow_lang.system_message(''REST_WS.UNSECURED'') name,',
'    COUNT(*) the_value',
'FROM',
'    wwv_flow_collections m',
'WHERE m.collection_name = ''ORDS_MODULES''',
'  and  wwv_flow_rest_ws.module_is_protected(m.n001) = ''N'''))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#EC7A71'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,RIR:P0_SELECTED_NODE,IREQ_PROTECTED_FILTER:MD-3,N'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(54184436014062234.4852)
,p_chart_id=>wwv_flow_imp.id(395804743932090637.4852)
,p_seq=>30
,p_name=>'Partially_Secured'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wwv_flow_lang.system_message(''REST_WS.PARTIALLY_SECURED'') name,',
'    COUNT(*) the_value',
'FROM',
'    wwv_flow_collections m',
'WHERE m.collection_name = ''ORDS_MODULES''',
'  and  wwv_flow_rest_ws.module_is_protected(m.n001) = ''P'''))
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#F4D26F'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,RIR:P0_SELECTED_NODE,IREQ_PROTECTED_FILTER:MD-3,P'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395805169489090641.4852)
,p_plug_name=>unistr('Privil\00E8ges')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_css_classes=>'u-Height h220'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_session           varchar2(255) := :APP_SESSION;',
'   l_security_group_id number := :FLOW_SECURITY_GROUP_ID;',
'   l_count             number := 0;',
'begin',
'',
'-- milestones',
'for c1 in (',
' select /* APEX4850100SVCCNT */',
'           count(*) c',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_PRIVILEGES''',
') loop',
'  l_count := c1.c;',
'',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=4850:150:''||l_session||'':::RIR:P0_SELECTED_NODE:PR-2"  class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(l_count,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''REST_WS.PRIVILEGE_COUNT_LABEL'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_column_width=>'apex-col--leftBorder'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395805203518090642.4852)
,p_plug_name=>unistr('R\00F4les')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_css_classes=>'u-Height h220'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_session           varchar2(255) := :APP_SESSION;',
'   l_security_group_id number := :FLOW_SECURITY_GROUP_ID;',
'   l_count             number := 0;',
'begin',
'',
'-- milestones',
'for c1 in (',
' select /* APEX4850100SVCCNT */',
'           count(*) c',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_ROLES''',
') loop',
'  l_count := c1.c;',
'',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=4850:170:''||l_session||'':::RIR:P0_SELECTED_NODE:RO-1"  class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(l_count,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''REST_WS.ROLE_COUNT_LABEL'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_column_width=>'apex-col--leftBorder'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395805380789090643.4852)
,p_plug_name=>'Alias d''objet'
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
,p_plug_column_width=>'apex-col--leftBorder apex-col--bottomBorder'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(395805426455090644.4852)
,p_region_id=>wwv_flow_imp.id(395805380789090643.4852)
,p_chart_type=>'pie'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'none'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'Objets compatibles RESTful introuvables'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395805523114090645.4852)
,p_chart_id=>wwv_flow_imp.id(395805426455090644.4852)
,p_seq=>10
,p_name=>'Avec alias'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''REST_WS.ALIASED'') name, ',
'        count(*) the_value',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_ENABLED_OBJECTS''',
'   and upper(c002) != upper(c003)'))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#60CCB5'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:190:&SESSION.:IR_REPORT_ALIASED:&DEBUG.:RP,RIR:P0_SELECTED_NODE:OB0'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(395805625562090646.4852)
,p_chart_id=>wwv_flow_imp.id(395805426455090644.4852)
,p_seq=>20
,p_name=>'Sans alias'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select wwv_flow_lang.system_message(''REST_WS.UNALIASED'') name, ',
'        count(*) the_value',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_ENABLED_OBJECTS''',
'   and upper(c002) = upper(c003)',
' '))
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'THE_VALUE'
,p_items_label_column_name=>'NAME'
,p_color=>'#EC7A71'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:190:&SESSION.:IR_REPORT_UNALIASED:&DEBUG.:RP,RIR:P0_SELECTED_NODE:OB0'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411295240347027815.4852)
,p_plug_name=>'Modules'
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_css_classes=>'u-Height h220'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   l_session           varchar2(255) := :APP_SESSION;',
'   l_security_group_id number := :FLOW_SECURITY_GROUP_ID;',
'   l_count             number := 0;',
'begin',
'',
'-- milestones',
'for c1 in (',
' select /* APEX4850100SVCCNT */',
'           count(*) c',
'   from  wwv_flow_collections ',
' where collection_name = ''ORDS_MODULES''',
') loop',
'  l_count := c1.c;',
'',
'  sys.htp.p(''<div class="a-BadgeChart a-BadgeChart--justGageLike">'');',
'  sys.htp.p(''  <a href="f?p=4850:110:''||l_session||'':::RIR:P0_SELECTED_NODE:MD-3"  class="a-BadgeChart-link">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-value">''||to_char(l_count,''999G999G999G990'')||'' </span> '');',
'  sys.htp.p(''  </a>'');',
'  sys.htp.p(''  <div class="a-BadgeChart-text">'');',
'  sys.htp.p(''    <span class="a-BadgeChart-label">''||wwv_flow_lang.system_message(''REST_WS.MODULE_COUNT_LABEL'')||''</span>'');',
'  sys.htp.p(''    <span class="a-BadgeChart-desc">'');',
'  sys.htp.p(''    </span>'');',
'  sys.htp.p(''  </div>'');',
'  sys.htp.p(''</div>'');',
'',
'end loop;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411295301244027816.4852)
,p_plug_name=>unistr('Acc\00E8s au sch\00E9ma')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select decode(c004, ''ENABLED'',''SUCCESS'',''FAILURE'') result,',
'       wwv_flow_lang.system_message(''REST_WS.SCHEMA_ACCESS_LABEL'') label,',
'       decode(c004, ''ENABLED'', UPPER(wwv_flow_lang.system_message(''REST_WS.ENABLED'')),UPPER(wwv_flow_lang.system_message(''REST_WS.DISABLED'')))  status',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SIMPLE_STAUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RESULT',
  'attribute_02', 'LABEL',
  'attribute_03', 'STATUS',
  'attribute_04', 'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP::',
  'attribute_05', 'Configure')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411295479703027817.4852)
,p_plug_name=>unistr('Acc\00E8s aux m\00E9tadonn\00E9es')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select decode(c005, ''ENABLED'',''SUCCESS'',''WARNING'') result,',
'       wwv_flow_lang.system_message(''REST_WS.METADATA_ACCESS_LABEL'') label,',
'       decode(c005, ''ENABLED'', UPPER(wwv_flow_lang.system_message(''REST_WS.ENABLED'')),UPPER(wwv_flow_lang.system_message(''REST_WS.DISABLED'')))  status',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SIMPLE_STAUS'
,p_plug_column_width=>'apex-col--leftBorder'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RESULT',
  'attribute_02', 'LABEL',
  'attribute_03', 'STATUS',
  'attribute_04', 'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP::',
  'attribute_05', 'Configure')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411295559201027818.4852)
,p_plug_name=>unistr('Sch\00E9ma avec alias')
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case',
'          when  upper(c001) = upper(c003) then ''WARNING''',
'          else  ''SUCCESS''',
'          end result,',
'         wwv_flow_lang.system_message(''REST_WS.SCHEMA_ALIAS_LABEL'') label,',
'       c003 status',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SIMPLE_STAUS'
,p_plug_column_width=>'apex-col--leftBorder'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RESULT',
  'attribute_02', 'LABEL',
  'attribute_03', 'STATUS',
  'attribute_04', 'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP::',
  'attribute_05', 'Configure')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_plug_name=>'Button Bar'
,p_parent_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(411298371719027846.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'DROP_REST_SERVICES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('D\00E9sinscrire le sch\00E9ma d''ORDS')
,p_button_position=>'DELETE'
,p_button_redirect_url=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182366961062213.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(395805169489090641.4852)
,p_button_name=>'ADD_PRIVILEGE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Ajouter un privil\00E8ge')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.:RP,160::'
,p_icon_css_classes=>'icon-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182482115062214.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(395805203518090642.4852)
,p_button_name=>'ADD_ROLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Ajouter un r\00F4le')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180::'
,p_icon_css_classes=>'icon-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182897696062218.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(395802139138090611.4852)
,p_button_name=>'VIEW_OBJECTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>'Visualiser les objets compatibles'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:RP,190:P0_SELECTED_NODE:OB0'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(693723825032042149.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(411295240347027815.4852)
,p_button_name=>'ADD_MODULE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>'Ajouter un module'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP,120::'
,p_icon_css_classes=>'icon-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182523224062215.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(411295240347027815.4852)
,p_button_name=>'VIEW_MODULES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>'Visualiser les modules'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,110:P0_SELECTED_NODE:MD-3'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182609179062216.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(395805169489090641.4852)
,p_button_name=>'VIEW_PRIVILEGES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Visualiser les privil\00E8ges')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP,150:P0_SELECTED_NODE:PR-2'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(54182709832062217.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(395805203518090642.4852)
,p_button_name=>'VIEW_ROLES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--regionHeader'
,p_button_template_id=>wwv_flow_imp.id(719736129383947861.4852)
,p_button_image_alt=>unistr('Visualiser les r\00F4les')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP,170:P0_SELECTED_NODE:RO-1'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521637037513366432.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'RESET_SAMPLE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('R\00E9initialiser le service \00E9chantillon')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''x'' ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c002 = ''/hr/'''))
,p_button_condition_type=>'EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521637230858366434.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'INSTALL_SAMPLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Installer le service \00E9chantillon')
,p_button_position=>'EDIT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''x'' ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c002 = ''/hr/'''))
,p_button_condition_type=>'NOT_EXISTS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(370128398086680753.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(395803830429090628.4852)
,p_button_name=>'ENABLE_SCHEMA'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Inscrire le sch\00E9ma aupr\00E8s d''ORDS')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521633997504366401.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'IMPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--iconLeft:a-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>'Importer'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:RP,109::'
,p_icon_css_classes=>'icon-upload'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(411298548428027848.4852)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'EXPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>'Exporter'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:RP,108::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''X'' ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'icon-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619046299163969808.4852)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(411298470130027847.4852)
,p_button_name=>'CONFIGURE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--iconLeft:a-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>'Configurer'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:RP,105::'
,p_icon_css_classes=>'icon-util'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(334840708680272021.4852)
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(411298276648027845.4852)
,p_name=>'ORDS_VERSION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1386162789082360524.4852)
,p_prompt=>'Version ORDS'
,p_source=>'wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#:a-Form-fieldContainer--autoLabelWidth'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(334838669419272019.4852)
,p_name=>'Handler - Source Type'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_SOURCE_TYPE'
,p_condition_element=>'P100_SOURCE_TYPE'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(334839012878272020.4852)
,p_name=>'Template - Etag Type'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_ETAG_TYPE'
,p_condition_element=>'P100_ETAG_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(334839404182272020.4852)
,p_name=>'Mime Type Allowed - Visibility'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_METHOD'
,p_condition_element=>'P100_METHOD'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'POST,PUT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(334839863378272020.4852)
,p_name=>'GET Method Settings'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P100_METHOD'
,p_condition_element=>'P100_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'GET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(521637113860366433.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'install Sample Service'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'   l_exec_return        varchar2(32767);',
'   l_fnd                boolean := FALSE;',
'   l_owner              varchar2(255) := v(''P0_SCHEMA'');',
'   l_service_definition varchar2(32767) :=',
'q''!',
'BEGIN',
'  ORDS.DEFINE_MODULE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_base_path      => ''/hr/'',',
'      p_items_per_page => 25,',
'      p_status         => ''PUBLISHED'',',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno, ename, deptno, job from emp ',
'	where ((select job from emp where ename = :empname) IN (''''PRESIDENT'''', ''''MANAGER'''')) ',
'    OR  ',
'    (deptno = (select deptno from emp where ename = :empname)) ',
'order by deptno, ename',
''');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
'  prevdeptno     number;',
'  total_rows     number;',
'  deptloc        varchar2(20);',
'  deptname       varchar2(20);',
'  ',
'  CURSOR         getemps is select * from emp ',
'                             start with ename = :empname',
'                           connect by prior empno = mgr',
'                             order siblings by deptno, ename;',
'BEGIN',
'  sys.htp.htmlopen;',
'  sys.htp.headopen;',
'  sys.htp.title(''''Hierarchical Department Report for Employee ''''||wwv_flow_escape.html(:empname));',
'  sys.htp.headclose;',
'  sys.htp.bodyopen;',
' ',
'  for l_employee in getemps ',
'  loop',
'      if l_employee.deptno != prevdeptno or prevdeptno is null then',
'          select dname, loc ',
'            into deptname, deptloc ',
'            from dept ',
'           where deptno = l_employee.deptno;',
'           ',
'          if prevdeptno is not null then',
'              sys.htp.print(''''</ul>'''');',
'          end if;',
'',
'          sys.htp.print(''''Department '''' || wwv_flow_escape.html(deptname) || '''' located in '''' || wwv_flow_escape.html(deptloc) || ''''<p/>'''');',
'          sys.htp.print(''''<ul>'''');',
'      end if;',
'',
'      sys.htp.print(''''<li>'''' || wwv_flow_escape.html(l_employee.ename) || '''', ''''  || wwv_flow_escape.html(l_employee.empno) || '''', '''' || ',
'                        wwv_flow_escape.html(l_employee.job) || '''', '''' || wwv_flow_escape.html(l_employee.sal) || ''''</li>'''');',
'',
'      prevdeptno := l_employee.deptno;',
'      total_rows := getemps%ROWCOUNT;',
'      ',
'  end loop;',
'',
'  if total_rows > 0 then',
'      sys.htp.print(''''</ul>'''');',
'  end if;',
'',
'  sys.htp.bodyclose;',
'  sys.htp.htmlclose;',
'END;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno',
'  from (',
'       select emp.*',
'            , row_number() over (order by empno) rn',
'         from emp',
'       ) tmp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin ',
' sys.htp.p(''''{"version": "23.1"}'''');',
'end;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/item'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp',
'where empno = :id'');',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''PUT'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin',
'    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno',
'    where empno = :id;',
'    :status := 200;',
'    :location := :id;',
'exception',
'    when others then',
'        :status := 400;',
'        sys.htp.p( sys.htf.escape_sc(sqlerrm) );',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-FORWARD'',',
'      p_bind_variable_name => ''location'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''ID'',',
'      p_bind_variable_name => ''id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-STATUS-CODE'',',
'      p_bind_variable_name => ''status'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_method         => ''POST'',',
'      p_source_type    => ''plsql/block'',',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
' new_id integer;',
' current_date date;',
'BEGIN',
'    select sysdate into current_date from dual;',
'    insert into emp ',
'     (empno, ename, job, mgr, hiredate, sal, comm, deptno)',
'    VALUES',
'     (null, :ename, :ejob, :mgr, current_date, :sal, :comm, :deptno)',
'    returning empno into new_id;',
'    :status_code := 201;',
'    :forward_location := ''''../employees/''''||new_id;',
'exception',
'  WHEN VALUE_ERROR',
'        THEN',
'            :errmsg := ''''SALARY must be a number.'''';',
'            :status_code := 400;',
' when others then ',
'	:status_code := 400;',
'	:errmsg := sqlerrm;',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''ErrorMessage'',',
'      p_bind_variable_name => ''errmsg'',',
'      p_source_type        => ''RESPONSE'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpName'',',
'      p_bind_variable_name => ''ename'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpJob'',',
'      p_bind_variable_name => ''ejob'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpMgr'',',
'      p_bind_variable_name => ''mgr'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpSal'',',
'      p_bind_variable_name => ''sal'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpComm'',',
'      p_bind_variable_name => ''comm'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpDept'',',
'      p_bind_variable_name => ''deptno'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'COMMIT;',
'',
'END;',
'!'';',
'',
'BEGIN',
'    -- Install EMP & DEPT Tables if none exist',
'    for c2 in (select null',
'                 from sys.dba_tables',
'                where owner = l_owner',
'                  and table_name in (''EMP'',''DEPT'') ) loop',
'        l_fnd := true;',
'        exit;',
'    end loop;',
'',
'    if l_fnd then',
'        -- Remove existing tables, to ensure examples work with clean seed data - bug #21153228',
'        wwv_flow_provisioning.remove_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    end if;',
'    wwv_flow_provisioning.install_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    --',
'    l_exec_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'                         p_function_body   => l_service_definition,',
'                         p_language        => wwv_flow_code_exec.c_plsql,',
'                         p_parse_as_schema => l_owner );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible d''installer le service RESTful \00E9chantillon.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(521637230858366434.4852)
,p_process_success_message=>unistr('Service RESTful \00E9chantillon install\00E9.')
,p_internal_uid=>521637113860366433.4852
);
end;
/
prompt --application/pages/page_00102
begin
wwv_flow_imp_page.create_page(
 p_id=>102.4852
,p_name=>unistr('R\00E9initialiser le service \00E9chantillon')
,p_alias=>'RESET-SAMPLE-SERVICE'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('R\00E9initialiser le service \00E9chantillon')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'350'
,p_dialog_width=>'600'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(865350638512614236.4852)
,p_plug_name=>'ACTIONS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(967562983280037569.4852)
,p_plug_name=>'Avertissement '
,p_region_template_options=>'#DEFAULT#:a-Alert--warning:a-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(410842408391417181.4852)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_lang.system_message_p(''REST_WS.RESET_SAMPLE_WARNING'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(865350727512614237.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(865350638512614236.4852)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(865350850483614238.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(865350638512614236.4852)
,p_button_name=>'RESET_SERVICE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('R\00E9initialiser le service \00E9chantillon')
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(865350908058614239.4852)
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(865351066425614240.4852)
,p_name=>'Close'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(865350727512614237.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(865351141182614241.4852)
,p_event_id=>wwv_flow_imp.id(865351066425614240.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50135611810683253.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reset Sample Service'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'   l_exec_return        varchar2(32767);',
'   l_fnd                boolean := FALSE;',
'   l_owner              varchar2(255) := v(''P0_SCHEMA'');',
'   l_service_definition varchar2(32767) :=',
'q''!',
'BEGIN',
'  ORDS.DEFINE_MODULE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_base_path      => ''/hr/'',',
'      p_items_per_page => 25,',
'      p_status         => ''PUBLISHED'',',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno, ename, deptno, job from emp ',
'	where ((select job from emp where ename = :empname) IN (''''PRESIDENT'''', ''''MANAGER'''')) ',
'    OR  ',
'    (deptno = (select deptno from emp where ename = :empname)) ',
'order by deptno, ename',
''');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
'  prevdeptno     number;',
'  total_rows     number;',
'  deptloc        varchar2(20);',
'  deptname       varchar2(20);',
'  ',
'  CURSOR         getemps is select * from emp ',
'                             start with ename = :empname',
'                           connect by prior empno = mgr',
'                             order siblings by deptno, ename;',
'BEGIN',
'  sys.htp.htmlopen;',
'  sys.htp.headopen;',
'  sys.htp.title(''''Hierarchical Department Report for Employee ''''||wwv_flow_escape.html(:empname));',
'  sys.htp.headclose;',
'  sys.htp.bodyopen;',
' ',
'  for l_employee in getemps ',
'  loop',
'      if l_employee.deptno != prevdeptno or prevdeptno is null then',
'          select dname, loc ',
'            into deptname, deptloc ',
'            from dept ',
'           where deptno = l_employee.deptno;',
'           ',
'          if prevdeptno is not null then',
'              sys.htp.print(''''</ul>'''');',
'          end if;',
'',
'          sys.htp.print(''''Department '''' || wwv_flow_escape.html(deptname) || '''' located in '''' || wwv_flow_escape.html(deptloc) || ''''<p/>'''');',
'          sys.htp.print(''''<ul>'''');',
'      end if;',
'',
'      sys.htp.print(''''<li>'''' || wwv_flow_escape.html(l_employee.ename) || '''', ''''  || wwv_flow_escape.html(l_employee.empno) || '''', '''' || ',
'                        wwv_flow_escape.html(l_employee.job) || '''', '''' || wwv_flow_escape.html(l_employee.sal) || ''''</li>'''');',
'',
'      prevdeptno := l_employee.deptno;',
'      total_rows := getemps%ROWCOUNT;',
'      ',
'  end loop;',
'',
'  if total_rows > 0 then',
'      sys.htp.print(''''</ul>'''');',
'  end if;',
'',
'  sys.htp.bodyclose;',
'  sys.htp.htmlclose;',
'END;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno',
'  from (',
'       select emp.*',
'            , row_number() over (order by empno) rn',
'         from emp',
'       ) tmp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin ',
' sys.htp.p(''''{"version": "23.1"}'''');',
'end;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/item'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp',
'where empno = :id'');',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''PUT'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin',
'    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno',
'    where empno = :id;',
'    :status := 200;',
'    :location := :id;',
'exception',
'    when others then',
'        :status := 400;',
'        sys.htp.p( sys.htf.escape_sc(sqlerrm) );',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-FORWARD'',',
'      p_bind_variable_name => ''location'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''ID'',',
'      p_bind_variable_name => ''id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-STATUS-CODE'',',
'      p_bind_variable_name => ''status'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_method         => ''POST'',',
'      p_source_type    => ''plsql/block'',',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
' new_id integer;',
' current_date date;',
'BEGIN',
'    select sysdate into current_date from dual;',
'    insert into emp ',
'     (empno, ename, job, mgr, hiredate, sal, comm, deptno)',
'    VALUES',
'     (null, :ename, :ejob, :mgr, current_date, :sal, :comm, :deptno)',
'    returning empno into new_id;',
'    :status_code := 201;',
'    :forward_location := ''''../employees/''''||new_id;',
'exception',
'  WHEN VALUE_ERROR',
'        THEN',
'            :errmsg := ''''SALARY must be a number.'''';',
'            :status_code := 400;',
' when others then ',
'	:status_code := 400;',
'	:errmsg := sqlerrm;',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''ErrorMessage'',',
'      p_bind_variable_name => ''errmsg'',',
'      p_source_type        => ''RESPONSE'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpName'',',
'      p_bind_variable_name => ''ename'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpJob'',',
'      p_bind_variable_name => ''ejob'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpMgr'',',
'      p_bind_variable_name => ''mgr'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpSal'',',
'      p_bind_variable_name => ''sal'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpComm'',',
'      p_bind_variable_name => ''comm'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpDept'',',
'      p_bind_variable_name => ''deptno'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'COMMIT;',
'',
'END;',
'!'';',
'',
'BEGIN',
'    -- Install EMP & DEPT Tables if none exist',
'    for c2 in (select null',
'                 from sys.dba_tables',
'                where owner = l_owner',
'                  and table_name in (''EMP'',''DEPT'') ) loop',
'        l_fnd := true;',
'        exit;',
'    end loop;',
'',
'    if l_fnd then',
'        -- Remove existing tables, to ensure examples work with clean seed data - bug #21153228',
'        wwv_flow_provisioning.remove_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    end if;',
'    wwv_flow_provisioning.install_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    --',
'    l_exec_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'                         p_function_body   => l_service_definition,',
'                         p_language        => wwv_flow_code_exec.c_plsql,',
'                         p_parse_as_schema => l_owner );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible de r\00E9initialiser le service RESTful \00E9chantillon.<br/>#SQLERRM_TEXT#')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(865350850483614238.4852)
,p_process_success_message=>unistr('Service RESTful \00E9chantillon r\00E9initialis\00E9.')
,p_internal_uid=>50135611810683253.4852
);
end;
/
prompt --application/pages/page_00105
begin
wwv_flow_imp_page.create_page(
 p_id=>105.4852
,p_name=>unistr('Attributs de sch\00E9ma ORDS')
,p_alias=>'ORDS-SCHEMA-ATTRIBUTES'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Attributs de sch\00E9ma ORDS')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
,p_dialog_height=>'350'
,p_dialog_width=>'600'
,p_dialog_chained=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_plug_name=>unistr('Activer le sch\00E9ma')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(411294717631027810.4852)
,p_plug_name=>'Actions'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--accessibleTitle'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(411294685201027809.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(411294717631027810.4852)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(411294516512027808.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(411294717631027810.4852)
,p_button_name=>'ENABLE_SCHEMA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Enregistrer les attributs de sch\00E9ma')
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(411295133235027814.4852)
,p_branch_name=>'Page 100'
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(411293837089027801.4852)
,p_name=>'P105_ENABLE_REST_ACCESS'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_item_default=>'Y'
,p_prompt=>unistr('Activer l''acc\00E8s RESTful')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Active ou d\00E9sactive l''acc\00E8s aux services REST d\00E9finis dans le sch\00E9ma. La d\00E9sactivation de l''acc\00E8s est sans effet sur la d\00E9finition du module. Elle restreint seulement l''acc\00E8s.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(411293975785027802.4852)
,p_name=>'P105_SCHEMA_ALIAS'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
' 	l_alias_default wwv_flow_companies.path_prefix%TYPE;',
'',
'BEGIN ',
'',
'-- start with a NULL default',
'l_alias_default := null;',
'',
'-- IF and only IF we are working with the default schema ',
'if :P0_SCHEMA = wwv_flow_user_api.get_default_schema then ',
'	-- get the current value of he path_prefix ',
'	select lower(path_prefix)',
'	  into l_alias_default',
'	  from wwv_flow_companies ',
'	 where provisioning_company_id = wwv_flow_imp.get_security_group_id;',
'end if;',
'',
'-- If the value is still null then either this is not the default schema or the PATH_PREFIX is not set.',
'-- Set the default to the lower case schema name.',
'if l_alias_default is null then ',
'    l_alias_default := lower(:P0_SCHEMA);',
'end if;',
'',
'RETURN l_alias_default;',
'',
'END;',
''))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('Alias de sch\00E9ma')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>50
,p_cMaxlength=>266
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('D\00E9finit l''alias <em>respectant les majuscules/minuscules</em> du sch\00E9ma en cours qui sera utilis\00E9 pour la formation de l''URL faisant r\00E9f\00E9rence \00E0 tout service RESTful pr\00E9sent dans le sch\00E9ma.<br/>'),
'<br/>',
unistr('<strong>Oracle recommande de choisir un alias de sch\00E9ma diff\00E9rent du nom de sch\00E9ma afin d''\00E9viter les attaques potentielles par injection SQL ou par scriptage inter-site.</strong><br/>'),
'<br/>',
'Exemple : <br/><br/>',
'<pre>',
'http://example.com/ords/<strong>mySchema</strong>/hr/employees/{ID}',
'|_________________|____|________|_|_________|____|',
'           |        |     |     |     |      |',
unistr('           |        |     |     |     |       - Variable attach\00E9e'),
'           |        |     |     |     | ',
unistr('           |        |     |     |      - Mod\00E8le d''URI'),
'           |        |     |     |',
'           |        |     |      - Chemin de base de module',
'           |        |     |',
unistr('           |        |      - <strong>Alias de sch\00E9ma</strong>'),
'           |        |      ',
'           |         - Alias ORDS',
'           |               ',
'            - URL de serveur               ',
' </pre>',
'',
unistr('Remarque : lors de la modification de l''alias du sch\00E9ma par d\00E9faut de l''espace de travail, le pr\00E9fixe de chemin au niveau de l''espace de travail est d\00E9fini sur la m\00EAme valeur.')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(411294086525027803.4852)
,p_name=>'P105_AUTH_REQUIRED'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_item_default=>'N'
,p_prompt=>unistr('Autorisation obligatoire pour acc\00E9der aux m\00E9tadonn\00E9es')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('D\00E9termine si Oracle REST Data Services requiert une autorisation utilisateur pour octroyer l''acc\00E8s au catalogue de m\00E9tadonn\00E9es ORDS de ce sch\00E9ma.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(411294135265027804.4852)
,p_name=>'AUTH_NAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_item_default=>'Required Role Name: oracle.dbtools.role.autorest.&P0_SCHEMA.'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619048141801969827.4852)
,p_name=>'P105_INSTALL_SAMPLE_SERVICE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_item_default=>'Y'
,p_prompt=>unistr('Installer le service \00E9chantillon')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''X''',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_SCHEMAS''',
'   and c001 = :P0_SCHEMA'))
,p_display_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('V\00E9rifie si le service RESTful oracle.example.hr \00E9chantillon est install\00E9. ')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619048356251969829.4852)
,p_name=>'P105_DEFAULT_SCHEMA_WARNING'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(395806081109090650.4852)
,p_source=>'wwv_flow_lang.system_message(''APEX.REST.DEFAULT_SCHEMA_WARNING'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P0_SCHEMA = wwv_flow_user_api.get_default_schema then ',
'   return true;',
'else',
'   return false;',
'end if;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(865351598258614245.4852)
,p_validation_name=>'Check for unique PATH_PREFIX'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'-- Only run this check if this is the default schema',
'if :P0_SCHEMA = wwv_flow_user_api.get_default_schema then ',
'    -- First check to see if there is an APEX PATH_PREFIX that already exists.',
'    for c1 in (select 1',
'                 from wwv_flow_companies',
'                where path_prefix = upper(:P105_SCHEMA_ALIAS)',
'                 and provisioning_company_id <> :flow_security_group_id ) loop',
'       return wwv_flow_lang.system_message(''REST_WS.DUPLICATE_PATH_PREFIX'') ;',
'       exit;',
'    end loop;',
'end if;',
'',
'return null;',
'',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(411294516512027808.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(96155933912907401.4852)
,p_validation_name=>'Check for ASCII Alphanumeric'
,p_validation_sequence=>20
,p_validation=>'P105_SCHEMA_ALIAS'
,p_validation_type=>'ITEM_IS_ALPHANUMERIC'
,p_error_message=>unistr('#LABEL# ne doit contenir que des caract\00E8res alphab\00E9tiques et num\00E9riques.')
,p_when_button_pressed=>wwv_flow_imp.id(411294516512027808.4852)
,p_associated_item=>wwv_flow_imp.id(411293975785027802.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(411294202145027805.4852)
,p_name=>'Hide/Show Auth Name'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_AUTH_REQUIRED'
,p_condition_element=>'P105_AUTH_REQUIRED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(411294346994027806.4852)
,p_event_id=>wwv_flow_imp.id(411294202145027805.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'AUTH_NAME'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(411294476501027807.4852)
,p_event_id=>wwv_flow_imp.id(411294202145027805.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'AUTH_NAME'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(411294875777027811.4852)
,p_name=>'Close'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(411294685201027809.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(411294997347027812.4852)
,p_event_id=>wwv_flow_imp.id(411294875777027811.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(54184746281062237.4852)
,p_name=>'toLowerCase'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P105_SCHEMA_ALIAS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54184828101062238.4852)
,p_event_id=>wwv_flow_imp.id(54184746281062237.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P105_SCHEMA_ALIAS'
,p_attribute_01=>'$x(''P105_SCHEMA_ALIAS'').value = $v(''P105_SCHEMA_ALIAS'').toLowerCase();'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(411295047939027813.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable Schema'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_enable_access varchar2(20);',
'    l_auth_required  varchar2(20);',
'    l_security_group_id number;',
'',
'BEGIN ',
'select decode(:P105_ENABLE_REST_ACCESS, ''Y'',''TRUE'',''FALSE''),',
'       decode(:P105_AUTH_REQUIRED, ''Y'',''TRUE'',''FALSE'')',
'  into l_enable_access,',
'       l_auth_required',
'  from sys.dual;',
'',
'wwv_flow_rest_ws.enable_schema (p_schema => :P0_SCHEMA, ',
'                                p_enable_access => l_enable_access, ',
'                                p_schema_alias => lower(:P105_SCHEMA_ALIAS), ',
'                                p_auth_required => l_auth_required);',
'--',
'-- If this is the default schema for the workspace, change the workspace level Base Path to match the schema alias.',
'--',
'if :P0_SCHEMA = wwv_flow_user_api.get_default_schema then ',
'    ',
'    update wwv_flow_companies ',
'       set path_prefix = :P105_SCHEMA_ALIAS',
'     where provisioning_company_id = wwv_flow_imp.get_security_group_id;',
'   ',
'end if;',
'',
'EXCEPTION',
'    WHEN DUP_VAL_ON_INDEX THEN',
'    wwv_flow_error_api.add_error(',
'      p_message => wwv_flow_lang.system_message(''REST_WS.DUPLICATE_SCHEMA_ALIAS'')',
'    , p_display_location => wwv_flow_error_api.c_inline_in_notification',
'    );',
'',
'',
'END;                             '))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible d''activer le sch\00E9ma pour les services RESTful ORDS.<br/>#SQLERRM#')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(411294516512027808.4852)
,p_process_success_message=>unistr('Sch\00E9ma activ\00E9 pour une utilisation avec les services RESTful ORDS ')
,p_internal_uid=>411295047939027813.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1964389068403904.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'install Sample Service'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'   l_exec_return        varchar2(32767);',
'   l_fnd                boolean := FALSE;',
'   l_owner              varchar2(255) := v(''P0_SCHEMA'');',
'   l_service_definition varchar2(32767) :=',
'q''!',
'BEGIN',
'  ORDS.DEFINE_MODULE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_base_path      => ''/hr/'',',
'      p_items_per_page => 25,',
'      p_status         => ''PUBLISHED'',',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsec/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno, ename, deptno, job from emp ',
'	where ((select job from emp where ename = :empname) IN (''''PRESIDENT'''', ''''MANAGER'''')) ',
'    OR  ',
'    (deptno = (select deptno from emp where ename = :empname)) ',
'order by deptno, ename',
''');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empsecformat/:empname'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
'  prevdeptno     number;',
'  total_rows     number;',
'  deptloc        varchar2(20);',
'  deptname       varchar2(20);',
'  ',
'  CURSOR         getemps is select * from emp ',
'                             start with ename = :empname',
'                           connect by prior empno = mgr',
'                             order siblings by deptno, ename;',
'BEGIN',
'  sys.htp.htmlopen;',
'  sys.htp.headopen;',
'  sys.htp.title(''''Hierarchical Department Report for Employee ''''||wwv_flow_escape.html(:empname));',
'  sys.htp.headclose;',
'  sys.htp.bodyopen;',
' ',
'  for l_employee in getemps ',
'  loop',
'      if l_employee.deptno != prevdeptno or prevdeptno is null then',
'          select dname, loc ',
'            into deptname, deptloc ',
'            from dept ',
'           where deptno = l_employee.deptno;',
'           ',
'          if prevdeptno is not null then',
'              sys.htp.print(''''</ul>'''');',
'          end if;',
'',
'          sys.htp.print(''''Department '''' || wwv_flow_escape.html(deptname) || '''' located in '''' || wwv_flow_escape.html(deptloc) || ''''<p/>'''');',
'          sys.htp.print(''''<ul>'''');',
'      end if;',
'',
'      sys.htp.print(''''<li>'''' || wwv_flow_escape.html(l_employee.ename) || '''', ''''  || wwv_flow_escape.html(l_employee.empno) || '''', '''' || ',
'                        wwv_flow_escape.html(l_employee.job) || '''', '''' || wwv_flow_escape.html(l_employee.sal) || ''''</li>'''');',
'',
'      prevdeptno := l_employee.deptno;',
'      total_rows := getemps%ROWCOUNT;',
'      ',
'  end loop;',
'',
'  if total_rows > 0 then',
'      sys.htp.print(''''</ul>'''');',
'  end if;',
'',
'  sys.htp.bodyclose;',
'  sys.htp.htmlclose;',
'END;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select empno "$uri", rn, empno, ename, job, hiredate, mgr, sal, comm, deptno',
'  from (',
'       select emp.*',
'            , row_number() over (order by empno) rn',
'         from emp',
'       ) tmp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''version/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin ',
' sys.htp.p(''''{"version": "23.1"}'''');',
'end;'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/item'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp',
'where empno = :id'');',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''employees/:id'',',
'      p_method         => ''PUT'',',
'      p_source_type    => ''plsql/block'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''begin',
'    update emp set ename = :ename, job = :job, hiredate = :hiredate, mgr = :mgr, sal = :sal, comm = :comm, deptno = :deptno',
'    where empno = :id;',
'    :status := 200;',
'    :location := :id;',
'exception',
'    when others then',
'        :status := 400;',
'        sys.htp.p( sys.htf.escape_sc(sqlerrm) );',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-FORWARD'',',
'      p_bind_variable_name => ''location'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''ID'',',
'      p_bind_variable_name => ''id'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''employees/:id'',',
'      p_method             => ''PUT'',',
'      p_name               => ''X-APEX-STATUS-CODE'',',
'      p_bind_variable_name => ''status'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''empinfo/'',',
'      p_method         => ''GET'',',
'      p_source_type    => ''json/collection'',',
'      p_items_per_page => 25,',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''select * from emp'');',
'',
'  ORDS.DEFINE_TEMPLATE(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_priority       => 0,',
'      p_etag_type      => ''HASH'',',
'      p_etag_query     => NULL,',
'      p_comments       => NULL);',
'',
'  ORDS.DEFINE_HANDLER(',
'      p_module_name    => ''oracle.example.hr'',',
'      p_pattern        => ''emp_post_example/'',',
'      p_method         => ''POST'',',
'      p_source_type    => ''plsql/block'',',
'      p_mimes_allowed  => '''',',
'      p_comments       => NULL,',
'      p_source         => ',
'''DECLARE',
' new_id integer;',
' current_date date;',
'BEGIN',
'    select sysdate into current_date from dual;',
'    insert into emp ',
'     (empno, ename, job, mgr, hiredate, sal, comm, deptno)',
'    VALUES',
'     (null, :ename, :ejob, :mgr, current_date, :sal, :comm, :deptno)',
'    returning empno into new_id;',
'    :status_code := 201;',
'    :forward_location := ''''../employees/''''||new_id;',
'exception',
'  WHEN VALUE_ERROR',
'        THEN',
'            :errmsg := ''''SALARY must be a number.'''';',
'            :status_code := 400;',
' when others then ',
'	:status_code := 400;',
'	:errmsg := sqlerrm;',
'end;'');',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''ErrorMessage'',',
'      p_bind_variable_name => ''errmsg'',',
'      p_source_type        => ''RESPONSE'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''OUT'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpName'',',
'      p_bind_variable_name => ''ename'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpJob'',',
'      p_bind_variable_name => ''ejob'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''STRING'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpMgr'',',
'      p_bind_variable_name => ''mgr'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpSal'',',
'      p_bind_variable_name => ''sal'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpComm'',',
'      p_bind_variable_name => ''comm'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'  ORDS.DEFINE_PARAMETER(',
'      p_module_name        => ''oracle.example.hr'',',
'      p_pattern            => ''emp_post_example/'',',
'      p_method             => ''POST'',',
'      p_name               => ''EmpDept'',',
'      p_bind_variable_name => ''deptno'',',
'      p_source_type        => ''HEADER'',',
'      p_param_type         => ''INT'',',
'      p_access_method      => ''IN'',',
'      p_comments           => NULL);',
'',
'COMMIT;',
'',
'END;',
'!'';',
'',
'BEGIN',
'    -- Install EMP & DEPT Tables if none exist',
'    for c2 in (select null',
'                 from sys.dba_tables',
'                where owner = l_owner',
'                  and table_name in (''EMP'',''DEPT'') ) loop',
'        l_fnd := true;',
'        exit;',
'    end loop;',
'',
'    if l_fnd then',
'        -- Remove existing tables, to ensure examples work with clean seed data - bug #21153228',
'        wwv_flow_provisioning.remove_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    end if;',
'    wwv_flow_provisioning.install_demo_tables( p_security_group_id => wwv_flow_security.g_security_group_id, p_schema => :P0_SCHEMA);',
'    --',
'    l_exec_return := wwv_flow_code_exec.get_func_body_result_varchar2(',
'                         p_function_body   => l_service_definition,',
'                         p_language        => wwv_flow_code_exec.c_plsql,',
'                         p_parse_as_schema => l_owner );',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible d''installer le service RESTful \00E9chantillon.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P105_INSTALL_SAMPLE_SERVICE'
,p_process_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_process_when2=>'Y'
,p_process_success_message=>unistr(' et service RESTful \00E9chantillon install\00E9.')
,p_internal_uid=>1964389068403904.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(411295716068027820.4852)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch row for ORDS_SCHEMAS Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'    for c in (select c003 schema_alias, ',
'                     c004 status, ',
'                     c005 auto_rest_auth',
'                from wwv_flow_collections ',
'               where collection_name = ''ORDS_SCHEMAS''',
'                 and c001 = :P0_SCHEMA)',
'    LOOP',
'    if c.status = ''ENABLED'' then ',
'        :P105_ENABLE_REST_ACCESS := ''Y'';',
'    else ',
'        :P105_ENABLE_REST_ACCESS := ''N'';',
'    end if;',
'    --',
'    :P105_SCHEMA_ALIAS := lower(nvl(c.schema_alias, :P0_SCHEMA));',
'    --',
'    if c.auto_rest_auth = ''ENABLED'' then ',
'        :P105_AUTH_REQUIRED := ''Y'';',
'    else',
'        :P105_AUTH_REQUIRED := ''N'';',
'    end if;',
'    ',
'    END LOOP;',
'END;',
'   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>411295716068027820.4852
);
end;
/
prompt --application/pages/page_00107
begin
wwv_flow_imp_page.create_page(
 p_id=>107.4852
,p_name=>unistr('D\00E9sinscrire le sch\00E9ma')
,p_alias=>'DE-REGISTER-SCHEMA'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('D\00E9sinscrire le sch\00E9ma')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
,p_dialog_height=>'350'
,p_dialog_width=>'600'
,p_dialog_chained=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(917428488645386798.4852)
,p_plug_name=>'Avertissement'
,p_region_template_options=>'#DEFAULT#:a-Alert--warning:a-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(410842408391417181.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_lang.system_message_p(''REST_WS.DROP_REST_WARNING'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(932917125167323958.4852)
,p_plug_name=>'Actions'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--accessibleTitle'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521623582306296155.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(932917125167323958.4852)
,p_button_name=>'Cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521623103706296154.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(932917125167323958.4852)
,p_button_name=>'DREGISTER_SCHEMA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('D\00E9sinscrire le sch\00E9ma')
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(521629030825296177.4852)
,p_branch_name=>'Page 100'
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(521627533825296176.4852)
,p_name=>'Hide/Show Auth Name'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P107_AUTH_REQUIRED'
,p_condition_element=>'P107_AUTH_REQUIRED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(521628056777296176.4852)
,p_event_id=>wwv_flow_imp.id(521627533825296176.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'AUTH_NAME'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(521628597446296177.4852)
,p_event_id=>wwv_flow_imp.id(521627533825296176.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'AUTH_NAME'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(521626604079296175.4852)
,p_name=>'Close'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(521623582306296155.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(521627100322296176.4852)
,p_event_id=>wwv_flow_imp.id(521626604079296175.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(521625822919296174.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DROP_SCHEMA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    wwv_flow_rest_ws.drop_rest(:P0_SCHEMA);',
'',
'-- Clear out collections so they are empty ',
'   wwv_flow_collection.delete_collection(''ORDS_SCHEMAS'');',
'   wwv_flow_collection.delete_collection(''ORDS_MODULES'');',
'   wwv_flow_collection.delete_collection(''ORDS_TEMPLATES'');',
'   wwv_flow_collection.delete_collection(''ORDS_HANDLERS'');',
'   wwv_flow_collection.delete_collection(''ORDS_PARAMETERS'');',
'   wwv_flow_collection.delete_collection(''ORDS_PRIVILEGES'');',
'   wwv_flow_collection.delete_collection(''ORDS_ROLES'');',
'   wwv_flow_collection.delete_collection(''ORDS_ENABLED_OBJECTS'');',
'   wwv_flow_collection.delete_collection(''ORDS_PRIVILEGE_ROLES'');',
'   wwv_flow_collection.delete_collection(''ORDS_PRIVILEGE_MODULES'');',
'   wwv_flow_collection.delete_collection(''ORDS_PRIVILEGE_MAPPINGS'');',
'-- ',
'  :P105_SCHEMA_ALIAS := null;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Impossible de d\00E9sactiver le sch\00E9ma.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(521623103706296154.4852)
,p_process_success_message=>unistr('Sch\00E9ma d\00E9sactiv\00E9 pour une utilisation avec les services RESTful ORDS.')
,p_internal_uid=>521625822919296174.4852
);
end;
/
prompt --application/pages/page_00108
begin
wwv_flow_imp_page.create_page(
 p_id=>108.4852
,p_name=>'Exporter les services RESTful ORDS'
,p_alias=>'EXPORT-ORDS-RESTFUL-SERVICES'
,p_step_title=>'Exporter les services RESTful ORDS'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(719674703062933090.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(521634858019366410.4852)
,p_plug_name=>'Exporter les services RESTful ORDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719731990154942810.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_plug_name=>'Export RESTful Service Definitions'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:800px;"'
,p_plug_template=>wwv_flow_imp.id(719731261318942809.4852)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_translate_title=>'N'
,p_plug_header=>unistr('Exportez les m\00E9tadonn\00E9es de service RESTful bas\00E9 sur ORDS au format de fichier de script SQL. Vous pouvez importer le script SQL dans cette instance ou toute autre instance ORDS compatible.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1465859648625102030.4852)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--accessibleTitle'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(532943232357778080.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1465859648625102030.4852)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP,108::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(532942855566778079.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1465859648625102030.4852)
,p_button_name=>'EXPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Exporter'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521634672804366408.4852)
,p_name=>'P108_MODULES'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_prompt=>'Service RESTful'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r',
'from ',
'(select 1 ord1, upper(c001) ord2, c001 d, c001 r ',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_MODULES''',
'union ',
'select 0 ord1, ''ALL SERVICES'' ord2, ''All Services'' d ,''ALL'' r',
'  from sys.dual',
'order by ord1 asc, ord2 asc)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('S\00E9lectionner un service')
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521634799000366409.4852)
,p_name=>'P108_MODULE_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_prompt=>'Nombre de services RESTful disponibles pour l''export'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(*)',
'from wwv_flow_collections',
'where collection_name = ''ORDS_MODULES'''))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Identifie le nombre de services RESTful d\00E9finis dans le sch\00E9ma en cours.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521636728407366429.4852)
,p_name=>'P108_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Sch\00E9ma')
,p_source=>'P0_SCHEMA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(532950998098899104.4852)
,p_name=>'P108_FILE_CHARSET'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('Jeu de caract\00E8res de fichier :')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_imp.id(1671084505895948418)||'.'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Le fichier d''export sera encod\00E9 dans le jeu de caract\00E8res indiqu\00E9.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'LOV',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865350335067614233.4852)
,p_name=>'P108_INCLUDE_ENABLE_SCHEMA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_item_default=>'Y'
,p_prompt=>unistr('Inclure l''option Activer le sch\00E9ma')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (wwv_flow_rest_ws.ords_is_183_plus(wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema)) = ''TRUE'') then ',
'    RETURN TRUE;',
'else',
'    RETURN FALSE;',
'end if;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Exporte la d\00E9finition pour Activer le sch\00E9ma. L''option Activer le sch\00E9ma permet de contr\00F4ler si l''acc\00E8s \00E0 Oracle REST Data Services est autoris\00E9 pour l''objet ou le sch\00E9ma indiqu\00E9.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865350453730614234.4852)
,p_name=>'P108_INCLUDE_PRIVILEGES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(928751631834883775.4852)
,p_item_default=>'Y'
,p_prompt=>unistr('Inclure les privil\00E8ges')
,p_display_as=>'NATIVE_YES_NO'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (wwv_flow_rest_ws.ords_is_183_plus(wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema)) = ''TRUE'') then ',
'    RETURN TRUE;',
'else',
'    RETURN FALSE;',
'end if;'))
,p_display_when2=>'PLSQL'
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Exporte les d\00E9finitions de privil\00E8ge associ\00E9es au module (inclut des mod\00E8les de ressource, des r\00F4les et un module prot\00E9g\00E9).')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(521634388040366405.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    l_clob                     clob;',
'    l_str_length               pls_integer;',
'    l_str                      varchar2(32767);',
'    l_offset                   pls_integer := 1;',
'    l_include_enable_schema    varchar2(10);',
'    l_include_privileges       varchar2(20);',
'',
'BEGIN',
'    l_clob := NULL;',
'    --',
'    if :P108_INCLUDE_ENABLE_SCHEMA = ''Y'' THEN ',
'        l_include_enable_schema := ''TRUE'';',
'    else ',
'        l_include_enable_schema := ''FALSE'';',
'    end if;',
'    --',
'    if :P108_INCLUDE_PRIVILEGES = ''Y'' THEN ',
'        l_include_privileges := ''TRUE'';',
'    else',
'        l_include_privileges := ''FALSE'';',
'    end if;',
'    --',
'    if :P108_MODULES = ''ALL'' then',
'      if (wwv_flow_rest_ws.ords_is_183_plus(wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema)) = ''TRUE'') then ',
'        l_clob := wwv_flow_code_exec.get_func_body_result_clob(',
'            p_function_body     => ''',
'        BEGIN',
'            return ords_metadata.ords_export.export_schema(p_include_enable_schema => ''||l_include_enable_schema||'', p_include_privs => ''||l_include_privileges||'');',
'        END;'',',
'            p_language          => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema   => nvl(:P0_SCHEMA,wwv_flow_user_api.get_default_schema));',
'',
'      else ',
'        l_clob := wwv_flow_code_exec.get_func_body_result_clob(',
'            p_function_body     => ''',
'        BEGIN',
'            return ords_metadata.ords_export.export_schema;',
'        END;'',',
'            p_language          => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema   => nvl(:P0_SCHEMA,wwv_flow_user_api.get_default_schema));',
'      end if;',
'    else ',
'      if (wwv_flow_rest_ws.ords_is_183_plus(wwv_flow_rest_ws.get_ords_version(wwv_flow_user_api.get_default_schema)) = ''TRUE'') then',
'        l_clob := wwv_flow_code_exec.get_func_body_result_clob(',
'            p_function_body     => ''',
'        BEGIN',
'            return ords_metadata.ords_export.export_module(p_module_name => ''''''||:P108_MODULES||'''''', p_include_enable_schema => ''||l_include_enable_schema||'', p_include_privs => ''||l_include_privileges||'');',
'        END;'',',
'            p_language          => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema   => nvl(:P0_SCHEMA,wwv_flow_user_api.get_default_schema));',
'      else',
'        l_clob := wwv_flow_code_exec.get_func_body_result_clob(',
'            p_function_body     => ''',
'        BEGIN',
'            return ords_metadata.ords_export.export_module(p_module_name => ''''''||:P108_MODULES||'''''');',
'        END;'',',
'            p_language          => wwv_flow_code_exec.c_plsql,',
'            p_parse_as_schema   => nvl(:P0_SCHEMA,wwv_flow_user_api.get_default_schema));',
'      end if;',
'    end if;',
'    --',
'',
'    sys.htp.init;',
'    wwv_flow.g_page_text_generated   := true;',
'    wwv_flow.g_unrecoverable_error   := true;',
'',
'    wwv_flow_utilities.print_download_header(',
'        p_mime_type       => ''application/x-sql'',',
'        p_file_name       => ''ORDS_REST_''||:P0_SCHEMA||''_''||:P108_MODULES||''_''||to_char(sysdate, ''yyyy_mm_dd'')||''.sql'',',
'        p_is_attachment   => true);',
'',
'    sys.owa_util.http_header_close;',
'    ',
'    l_str_length  := nvl(sys.dbms_lob.getlength(l_clob),0);',
'    LOOP',
'        l_offset   := l_offset + nvl(length(l_str),0);',
'        EXIT WHEN l_offset >= l_str_length;',
'        l_str := sys.dbms_lob.substr(l_clob,4000,l_offset);',
'        sys.htp.prn(l_str);',
'    END LOOP;',
'',
' END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(532942855566778079.4852)
,p_internal_uid=>521634388040366405.4852
);
end;
/
prompt --application/pages/page_00109
begin
wwv_flow_imp_page.create_page(
 p_id=>109.4852
,p_name=>'Importer les services RESTful ORDS'
,p_alias=>'IMPORT-ORDS-RESTFUL-SERVICES'
,p_step_title=>'Importer les services RESTful ORDS'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(719674703062933090.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1054917940458899121.4852)
,p_plug_name=>'Importer les services RESTful ORDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719731990154942810.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1462034714274416486.4852)
,p_plug_name=>'Import RESTful Service Definitions'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:800px;"'
,p_plug_template=>wwv_flow_imp.id(719731261318942809.4852)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_translate_title=>'N'
,p_plug_header=>unistr('Importez des d\00E9finitions de service RESTful bas\00E9 sur ORDS \00E0 partir d''un script SQL g\00E9n\00E9r\00E9 par SQL Developer ou &PRODUCT_NAME..')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1999142731064634741.4852)
,p_plug_name=>'Wizard Buttons'
,p_region_template_options=>'#DEFAULT#:a-ButtonRegion--withItems:a-ButtonRegion--noUI:a-ButtonRegion--accessibleTitle'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(533284472661532714.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1999142731064634741.4852)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP,108::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(533284064988532714.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(1999142731064634741.4852)
,p_button_name=>'IMPORT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Importer'
,p_button_position=>'CREATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(521636612133366428.4852)
,p_branch_action=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP,109::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521636853113366430.4852)
,p_name=>'P109_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1462034714274416486.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('Sch\00E9ma')
,p_source=>'P0_SCHEMA'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533286069458532717.4852)
,p_name=>'P109_FILE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1462034714274416486.4852)
,p_prompt=>'Importer un fichier'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533286474521532717.4852)
,p_name=>'P109_FILE_CHARSET'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1462034714274416486.4852)
,p_item_default=>'nvl(lower(trim(sys.owa_util.get_cgi_env(''REQUEST_IANA_CHARSET''))),''utf-8'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('Jeu de caract\00E8res de fichier :')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'I18N_IANA_CHARSET'
,p_lov=>'.'||wwv_flow_imp.id(1671084505895948418)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Le fichier d''export sera encod\00E9 dans le jeu de caract\00E8res indiqu\00E9.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(521636367736366425.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check PRIV'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wwv_flow_sw_api.check_priv (',
'    p_schema => :P0_SCHEMA',
'    );'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Aucun privil\00E8ge sur le sch\00E9ma s\00E9lectionn\00E9.')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>521636367736366425.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(521636566576366427.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Length of Script'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_length number;',
'BEGIN',
'',
'select dbms_lob.getlength(blob_content)',
'      into l_length',
'      from wwv_flow_file_objects$',
'     where name = :P109_FILE;',
'--',
'IF l_length > 32767 then ',
'   -- Delete the script so it doesn''t hang around',
'   delete from wwv_flow_file_objects$',
'    where name = :P109_FILE;',
'   -- Raise an error to the user.',
'   raise_application_error( -20850, wwv_flow_lang.system_message(''REST_WS.SCRIPT_TOO_LONG''));',
'END IF;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>521636566576366427.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54184980787062239.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check if Script is APEX EXPORT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_blob blob;',
'    l_clob clob;',
'BEGIN',
'    -- Get the file content to execute.',
'    select blob_content',
'      into l_blob',
'      from wwv_flow_file_objects$',
'     where name = :P109_FILE;',
'    -- Convert the BLOB to a CLOB using the characterset chosen',
'    l_clob := wwv_flow_utilities.blob_to_clob (',
'                          p_blob    => l_blob,',
'                          p_charset => :P109_CHARSET );',
'',
'   if instr(l_clob,''wwv_flow_imp'',1,1) > 0 or ',
'      instr(l_clob,''wwv_flow_api'',1,1) > 0 ',
'   then',
'       raise_application_error( -20851, wwv_flow_lang.system_message(''REST_WS.WRONG_SCRIPT_TYPE''));',
'   END IF;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>54184980787062239.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(533294511104607661.4852)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPLOAD AND EXECUTE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_clob    clob;',
'    l_blob    blob;',
'BEGIN',
'    -- Get the file content to execute.',
'    select blob_content',
'      into l_blob',
'      from wwv_flow_file_objects$',
'     where name = :P109_FILE;',
'    -- Convert the BLOB to a CLOB using the characterset chosen',
'    l_clob := wwv_flow_utilities.blob_to_clob (',
'                          p_blob    => l_blob,',
'                          p_charset => :P109_CHARSET );',
'    -- Strip Trailing slash from the end of the file or it won''t execute.',
'    l_clob := rtrim (l_clob, ''/ '');',
'    -- Execut the script using the selected Parse As Schema',
'    wwv_flow_rest_ws.install_in_schema (',
'        p_code   => l_clob,',
'        p_schema => nvl(:P0_SCHEMA,wwv_flow_user_api.get_default_schema));',
'   -- Delete uploaded file from wwv_flow_file_objects$',
'   delete from wwv_flow_file_objects$',
'    where name = :P109_FILE;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Impossible de traiter l''import.<BR/>',
'#SQLERRM_TEXT#'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(533284064988532714.4852)
,p_process_success_message=>unistr('Services RESTful ORDS import\00E9s.')
,p_internal_uid=>533294511104607661.4852
);
end;
/
prompt --application/pages/page_00110
begin
wwv_flow_imp_page.create_page(
 p_id=>110.4852
,p_name=>'Modules'
,p_alias=>'MODULES'
,p_step_title=>'Modules'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(243332167743719621.4852)
,p_plug_name=>unistr('L\00E9gende')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br><div style="line-height:25px">',
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<strong>L\00E9gende :</strong>'),
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span> Module enti\00E8rement prot\00E9g\00E9 par un privil\00E8ge '),
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-warning" aria-hidden="true" style="background-color:#F4d26f;color:#fff;border-radius:26px;width:26px;height:26px;padding:4px;"></span> Module en partie prot\00E9g\00E9 par un privil\00E8ge '),
unistr(' &nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span> Module non prot\00E9g\00E9 par un privil\00E8ge '),
'</div>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(345304595186156444.4852)
,p_plug_name=>'Modules'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001 id,',
'       c001 name, ',
'       c002 uri_prefix,',
'       n002 items_per_page,',
'       c003 published_status,',
'       case when length(c004) > 50 then ',
'                substr(c004,1,50)||'' ...''',
'            else ',
'                 c004',
'            end comments,',
'       c005 pre_hook,',
'       c006 origins_allowed,',
'       n005 schema_id,',
'       c049 created_by,',
'       d001 created_on,',
'       c050 updated_by,',
'       d002 updated_on, ',
'       case  wwv_flow_rest_ws.module_is_protected(n001)',
'       when ''F'' then ''<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'       when ''P'' then ''<span class="a-Icon icon-status-warning" aria-hidden="true" style="background-color:#F4d26f;color:#fff;border-radius:26px;width:26px;height:26px;padding:4px;"></span>''',
'       when ''N'' then ''<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'       end protected, ',
'       wwv_flow_rest_ws.module_is_protected(n001) protected_filter',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_MODULES'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(345304742814156446.4852)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('Aucun module RESTful n''est actuellement d\00E9fini pour le sch\00E9ma s\00E9lectionn\00E9.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'DOUG'
,p_internal_uid=>345304742814156446
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345304827635156447.4852)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345304993730156448.4852)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nom'
,p_column_link=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:120:P120_MODULE_ID,P0_SELECTED_NODE:#ID#,MM#ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345305017259156449.4852)
,p_db_column_name=>'URI_PREFIX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Pr\00E9fixe d''URI')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(345305179932156450.4852)
,p_db_column_name=>'ITEMS_PER_PAGE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Nombre de questions par page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349777972537459201.4852)
,p_db_column_name=>'PUBLISHED_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>unistr('Statut Publi\00E9')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778024950459202.4852)
,p_db_column_name=>'COMMENTS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Commentaires'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778198420459203.4852)
,p_db_column_name=>'PRE_HOOK'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Point d''ancrage pr\00E9alable')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778217011459204.4852)
,p_db_column_name=>'ORIGINS_ALLOWED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Origines autoris\00E9es')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778340747459205.4852)
,p_db_column_name=>'SCHEMA_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('ID du sch\00E9ma')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778492918459206.4852)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Cr\00E9ation par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778529053459207.4852)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Cr\00E9ation le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778668565459208.4852)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Mis \00E0 jour par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349778794416459209.4852)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Mis \00E0 jour le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54183910735062229.4852)
,p_db_column_name=>'PROTECTED'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>unistr('Prot\00E9g\00E9 par privil\00E8ge')
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54184565506062235.4852)
,p_db_column_name=>'PROTECTED_FILTER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('Filtre prot\00E9g\00E9')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(349792885320463043.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3497929'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:URI_PREFIX:ITEMS_PER_PAGE:PUBLISHED_STATUS:COMMENTS:ORIGINS_ALLOWED:CREATED_ON:UPDATED_ON::PROTECTED:PROTECTED_FILTER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(345304648811156445.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(345304595186156444.4852)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un module')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP,120::'
,p_icon_css_classes=>'icon-right-chevron'
);
end;
/
prompt --application/pages/page_00120
begin
wwv_flow_imp_page.create_page(
 p_id=>120.4852
,p_name=>unistr('D\00E9finition de module')
,p_alias=>'MODULE-DEFINITION'
,p_step_title=>unistr('D\00E9finition de module')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(243332224074719622.4852)
,p_plug_name=>'LEGEND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br><div style="line-height:26px">',
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<strong>L\00E9gende :</strong>'),
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px"></span> Mod\00E8le enti\00E8rement prot\00E9g\00E9 par un privil\00E8ge '),
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px"></span> Mod\00E8le non prot\00E9g\00E9 par un privil\00E8ge '),
'</div>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_plug_name=>unistr('D\00E9finition de module')
,p_region_name=>'ords_module_definition'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(521637980963366441.4852)
,p_plug_name=>'Button Holder'
,p_parent_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719684836837942735.4852)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_translate_title=>'N'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P120_MODULE_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(349779837571459220.4852)
,p_plug_name=>unistr('Mod\00E8les de ressource')
,p_region_name=>'ords_module_templates'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001 id,',
'       n002 module_id,',
'       c001 uri_template,',
'       n003 priority,',
'       c002 etag_type,',
'       c003 etag_query,',
'       case when length(c004) > 50 then ',
'                substr(c004,1,50)||'' ...''',
'            else ',
'                 c004',
'            end comments,',
'       n005 schema_id,',
'       c049 created_by,',
'       d001 created_on,',
'       c050 updated_by,',
'       d002 updated_on,',
'       case  wwv_flow_rest_ws.template_is_protected(n001)',
'       when ''F'' then ''<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'       when ''P'' then ''<span class="a-Icon icon-status-warning" aria-hidden="true" style="background-color:#F4d26f;color:#fff;border-radius:26px;width:26px;height:26px;padding:4px;"></span>''',
'       when ''N'' then ''<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'       end protected',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_TEMPLATES''',
'and n002 = :P120_MODULE_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P120_MODULE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(349780070697459222.4852)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aucun mod\00E8le n''est actuellement d\00E9fini pour le module s\00E9lectionn\00E9.'),
''))
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'DOUG'
,p_internal_uid=>349780070697459222
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780177693459223.4852)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780220087459224.4852)
,p_db_column_name=>'MODULE_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'ID de module'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780360621459225.4852)
,p_db_column_name=>'URI_TEMPLATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>unistr('Mod\00E8le d''URI')
,p_column_link=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:130:P130_TEMPLATE_ID,P0_SELECTED_NODE:#ID#,MT#ID#'
,p_column_linktext=>'#URI_TEMPLATE#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780420292459226.4852)
,p_db_column_name=>'PRIORITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>unistr('Priorit\00E9')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780547255459227.4852)
,p_db_column_name=>'ETAG_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type d''ETag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780682662459228.4852)
,p_db_column_name=>'ETAG_QUERY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Requ\00EAte d''ETag')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780752550459229.4852)
,p_db_column_name=>'COMMENTS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Commentaires'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780838961459230.4852)
,p_db_column_name=>'SCHEMA_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('ID du sch\00E9ma')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349780906782459231.4852)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Cr\00E9ation par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349781072272459232.4852)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Cr\00E9ation le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349781180416459233.4852)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Mis \00E0 jour par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(349781224629459234.4852)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Mis \00E0 jour le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54184173558062231.4852)
,p_db_column_name=>'PROTECTED'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Prot\00E9g\00E9 par privil\00E8ge')
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(349830769421520089.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3498308'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'URI_TEMPLATE:PRIORITY:ETAG_TYPE:ETAG_QUERY:COMMENTS:CREATED_ON:UPDATED_ON::PROTECTED'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(349779573726459217.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,120:P0_SELECTED_NODE:MD-3'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(349779964301459221.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(349779837571459220.4852)
,p_button_name=>'CREATE_TEMPLATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>unistr('Cr\00E9er un mod\00E8le')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP,130:P130_MODULE_ID:&P120_MODULE_ID.'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(521637866351366440.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(521637980963366441.4852)
,p_button_name=>'GEN_DOC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('G\00E9n\00E9rer un document SWAGGER')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(349779454075459216.4852)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_button_name=>'CREATE_MODULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un module')
,p_button_position=>'CREATE'
,p_button_condition=>'P120_MODULE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(349779742733459219.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_button_name=>'UPDATE_MODULE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE2'
,p_button_condition=>'P120_MODULE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(349779602666459218.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_button_name=>'DELETE_MODULE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P120_MODULE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(395801668524090606.4852)
,p_branch_name=>'Branch to 120'
,p_branch_action=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE_MODULE,UPDATE_MODULE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(619047465418969820.4852)
,p_branch_name=>'Branch to 110'
,p_branch_action=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE:MD-3&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'DELETE_MODULE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(342536924115632643.4852)
,p_name=>'P120_MODULE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349778931181459211.4852)
,p_name=>'P120_MODULE_NAME'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_prompt=>'Nom de module'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Nom du module de service RESTful. Ce nom doit \00EAtre unique dans le sch\00E9ma propri\00E9taire.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349779001981459212.4852)
,p_name=>'P120_URI_PREFIX'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_prompt=>'Chemin de base'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Chemin de base <em>respectant les majuscules/minuscules</em> utilis\00E9 pour acc\00E9der \00E0 ce service RESTful. Ce chemin de base du module est ajout\00E9 \00E0 la fin du chemin de serveur de l''espace de travail. Le chemin de base doit \00EAtre unique dans le sch\00E9ma. <b')
||'r/>',
'<br/>',
'Exemple : <br/><br/>',
'<pre>',
'http://example.com/ords/mySchema<strong>/hr/</strong>employees/:id',
'|_________________|____|________|_|_________|____|',
'           |        |     |     |     |      |',
unistr('           |        |     |     |     |       - Variable attach\00E9e'),
'           |        |     |     |     | ',
unistr('           |        |     |     |      - Mod\00E8le d''URI'),
'           |        |     |     |',
'           |        |     |      - <strong>Chemin de base de module</strong>',
'           |        |     |',
unistr('           |        |      - Alias de sch\00E9ma'),
'           |        |      ',
'           |         - Alias ORDS',
'           |               ',
'            - URL de serveur               ',
' </pre>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349779143830459213.4852)
,p_name=>'P120_IS_PUBLISHED'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_item_default=>'Y'
,p_prompt=>unistr('Est publi\00E9')
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Rendez ce service RESTful disponible.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349779258055459214.4852)
,p_name=>'P120_PAGINATION_SIZE'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_item_default=>'25'
,p_prompt=>'Taille de pagination'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Nombre d''enregistrements \00E0 renvoyer dans un appel du service.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '10000',
  'min_value', '0',
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(349779390521459215.4852)
,p_name=>'P120_ORIGINS_ALLOWED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_prompt=>unistr('Origines autoris\00E9es')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Liste des pr\00E9fixes d''URL s\00E9par\00E9s par des virgules qui sont autoris\00E9s \00E0 acc\00E9der \00E0 ce module. Si la liste est vide, aucune restriction ne s''applique.<br/><br/>'),
'',
unistr('Une origine est d\00E9finie par le protocole, le nom d''h\00F4te et le port d''un site Web. Par exemple, <strong>https://example.com</strong> est une origine et <strong>https://another.example.com</strong> en est une autre car le nom d''h\00F4te est diff\00E9rent. De l')
||unistr('a m\00EAme fa\00E7on, <strong>http://example.com</strong> est une origine diff\00E9rente de <strong>https://example.com</strong> car le protocole diff\00E8re. Enfin, <strong>http://example.com</strong> est une origine diff\00E9rente de <strong>http://example.com:8080</s')
||unistr('trong> car le port n''est pas le m\00EAme.')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358043076068998601.4852)
,p_name=>'P120_STATUS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358044051699998611.4852)
,p_name=>'P120_COMMENTS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_prompt=>'Commentaires'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521638353736366445.4852)
,p_name=>'P120_DOC_URL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(521637980963366441.4852)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_path    varchar2(32767) := '''';',
'  l_swagger varchar2(32767);',
'begin',
'',
'  l_swagger := wwv_flow_platform.get_preference( p_preference_name => ''SWAGGER_UI_URL'' );',
'  ',
'  if l_swagger is not null then ',
'    l_path := l_path ||l_swagger||''?url='';',
'  end if;',
'',
'  l_path := l_path || :G_APEX_PATH || :G_SCHEMA_ALIAS || ''/open-api-catalog'' || :P120_URI_PREFIX;',
'',
'  return l_path;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521638629904366448.4852)
,p_name=>'P120_URI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(349778848692459210.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('URL compl\00E8te')
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--small" onclick="void(0);" aria-label="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD_ARIA." type="button"  title="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD." data-clipboard-source="#P120_URI" styl'
||'e="margin-left:5px;"><span class="a-Icon icon-copy" aria-hidden="true"></span></button>',
''))
,p_source=>'&G_APEX_PATH.&G_SCHEMA_ALIAS.<font color="#EE0000">&P120_URI_PREFIX.</font>'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P120_MODULE_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(381674957633069425.4852)
,p_validation_name=>'Valid Characters Only'
,p_validation_sequence=>10
,p_validation=>'P120_MODULE_NAME'
,p_validation2=>'^([a-zA-Z0-9/_\. \-]*)$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#LABEL# ne doit contenir que des caract\00E8res alphab\00E9tiques, des chiffres, des tirets, des traits de soulignement, des points et des espaces.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(349778931181459211.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619046825635969814.4852)
,p_validation_name=>'CREATE - Name is Unique'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c001 = :P120_module_name'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('#LABEL# existe d\00E9j\00E0. #LABEL# doit \00EAtre unique au sein du sch\00E9ma. ')
,p_validation_condition=>'CREATE_MODULE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(349778931181459211.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619047030576969816.4852)
,p_validation_name=>'UPDATE - Name is Unique'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c001 = :P120_module_name',
'   and n001 != :P120_MODULE_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('#LABEL# existe d\00E9j\00E0. #LABEL# doit \00EAtre unique au sein du sch\00E9ma. ')
,p_validation_condition=>'UPDATE_MODULE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(349778931181459211.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619046929551969815.4852)
,p_validation_name=>'CREATE - Base Path is unique'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c002 = :P120_URI_PREFIX'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('#LABEL# existe d\00E9j\00E0. #LABEL# doit \00EAtre unique au sein du sch\00E9ma.')
,p_validation_condition=>'CREATE_MODULE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(349779001981459212.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619047183534969817.4852)
,p_validation_name=>'UPDATE - Base Path is unique'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and c002 = :P120_URI_PREFIX',
'   and n001 != :P120_MODULE_ID'))
,p_validation_type=>'NOT_EXISTS'
,p_error_message=>unistr('#LABEL# existe d\00E9j\00E0. #LABEL# doit \00EAtre unique au sein du sch\00E9ma.')
,p_validation_condition=>'UPDATE_MODULE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(349779001981459212.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(349782578465459247.4852)
,p_name=>'Process Delete'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(349779602666459218.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(349782877063459250.4852)
,p_event_id=>wwv_flow_imp.id(349782578465459247.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.confirm(apex.lang.getMessage(''RFS.DELETE_MODULE''),''DELETE_MODULE'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(521638080826366442.4852)
,p_name=>'Show SWAGGER'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(521637866351366440.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(521638159086366443.4852)
,p_event_id=>wwv_flow_imp.id(521638080826366442.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.open($v(''P120_DOC_URL''));',
'',
''))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(342537341309632647.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch row from ORDS_MODULE Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_id                number;',
'    l_name              varchar2(4000);',
'    l_uri_prefix        varchar2(4000);',
'    l_items_per_page    number;',
'    l_published_status  varchar2(4000);',
'    l_origins_allowed   varchar2(4000);',
'    l_comments          varchar2(4000);',
'    ',
'BEGIN',
'   select ',
'       n001 id,',
'       c001 name, ',
'       c002 uri_prefix,',
'       n002 items_per_page,',
'       c003 published_status,',
'       c006 origins_allowed,',
'       c004 comments',
'  INTO ',
'       l_id,',
'       l_name,',
'       l_uri_prefix,',
'       l_items_per_page,',
'       l_published_status,',
'       l_origins_allowed,',
'       l_comments',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_MODULES''',
'   and (n001 = :P120_MODULE_ID ',
'        OR',
'        c001 = :P120_MODULE_NAME);',
'   ',
'   :P120_MODULE_ID       := l_id;',
'   :P120_MODULE_NAME     := l_name;',
'   if substr(l_uri_prefix,1,1) = ''/'' then ',
'       :P120_URI_PREFIX      := l_uri_prefix;',
'   else ',
'       :P120_URI_PREFIX    := ''/''||l_uri_prefix;',
'   end if;',
'   :P120_STATUS          := l_published_status;',
'   :P120_IS_PUBLISHED    := case l_published_status ',
'                            when ''PUBLISHED'' then ''Y''',
'                            else ''N''',
'                            end;',
'   :P120_PAGINATION_SIZE := l_items_per_page;',
'   :P120_ORIGINS_ALLOWED := l_origins_allowed;',
'   :P120_COMMENTS        := l_comments;',
'--',
'   :P0_SELECTED_NODE     := ''MM''||l_id;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P120_MODULE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>342537341309632647.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(349782047840459242.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Value of P120_STATUS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P120_IS_PUBLISHED = ''Y'' then ',
'   :P120_STATUS := ''PUBLISHED'';',
'else ',
'    :P120_STATUS := ''NOT_PUBLISHED'';',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>349782047840459242.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(395801788790090607.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process_module_changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_rest_ws.process_rest_ws_request(p_request=> :REQUEST, p_parse_as => :P0_SCHEMA);',
'  -- Force a value into module id (even though its wrong) to force loading the record on return to page',
'  :P120_MODULE_ID := -1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>395801788790090607.4852
);
end;
/
prompt --application/pages/page_00130
begin
wwv_flow_imp_page.create_page(
 p_id=>130.4852
,p_name=>unistr('Mod\00E8le de ressource')
,p_alias=>'RESOURCE-TEMPLATE'
,p_step_title=>unistr('Mod\00E8le de ressource')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_plug_name=>unistr('Mod\00E8le de ressource')
,p_region_name=>'ords_template_definition'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(708529628674941072.4852)
,p_plug_name=>'Gestionnaires de ressources'
,p_region_name=>'ords_template_handlers'
,p_region_template_options=>'a-Region--noPadding:a-Region--sideRegion'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001 id,',
'       n002 template_id,',
'       c001 source_type,',
'       c002 method,',
'       c003 mimes_allowed,',
'       n003 items_per_page,',
'       case ',
'           when dbms_lob.getlength(clob001) > 50 then',
'                substr(clob001,1,50)||'' ...''',
'           else ',
'                clob001',
'       end source,',
'       case when length(c004) > 50 then ',
'                substr(c004,1,50)||'' ...''',
'            else ',
'                 c004',
'            end comments,',
'       n005 schema_id, ',
'       c049 created_by,',
'       d001 created_on,',
'       c050 updated_by,',
'       d002 updated_on  ',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_HANDLERS''',
'and n002 = :P130_TEMPLATE_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P130_TEMPLATE_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(708529861800941074.4852)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Aucun mod\00E8le n''est actuellement d\00E9fini pour le module s\00E9lectionn\00E9.'),
''))
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'DOUG'
,p_internal_uid=>708529861800941074
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358750096972481861.4852)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358752404367481866.4852)
,p_db_column_name=>'COMMENTS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Commentaires'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358752810833481866.4852)
,p_db_column_name=>'SCHEMA_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('ID de sch\00E9ma')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358753260953481866.4852)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Cr\00E9ation par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358753605576481867.4852)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Cr\00E9ation le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358754037494481867.4852)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Mis \00E0 jour par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358754486787481867.4852)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Mis \00E0 jour le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358044647463998617.4852)
,p_db_column_name=>'TEMPLATE_ID'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('ID de mod\00E8le')
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358044703088998618.4852)
,p_db_column_name=>'SOURCE_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Type de source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358044823056998619.4852)
,p_db_column_name=>'METHOD'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>unistr('M\00E9thode HTTP')
,p_column_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:140:P140_HANDLER_ID,P0_SELECTED_NODE:#ID#,TH#ID#'
,p_column_linktext=>'#METHOD#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358044978011998620.4852)
,p_db_column_name=>'MIMES_ALLOWED'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>unistr('Types MIME autoris\00E9s')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(358045008942998621.4852)
,p_db_column_name=>'ITEMS_PER_PAGE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Nombre de questions par page'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(411297122721027834.4852)
,p_db_column_name=>'SOURCE'
,p_display_order=>180
,p_column_identifier=>'T'
,p_column_label=>'Source'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(708580560525001941.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3587548'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'METHOD:ITEMS_PER_PAGE:MIMES_ALLOWED:COMMENTS:CREATED_ON:UPDATED_ON:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(358091863089242250.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE,P120_MODULE_ID:MM&P130_MODULE_ID.,&P130_MODULE_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(358755262474481876.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(708529628674941072.4852)
,p_button_name=>'CREATE_HANDLER'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:a-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_image_alt=>unistr('Cr\00E9er un gestionnaire')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:P140_MODULE_ID,P140_TEMPLATE_ID:&P130_MODULE_ID.,&P130_TEMPLATE_ID.'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(358091494079242250.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_button_name=>'CREATE_TEMPLATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un mod\00E8le')
,p_button_position=>'CREATE'
,p_button_condition=>'P130_TEMPLATE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(358092646976242251.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_button_name=>'UPDATE_TEMPLATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE2'
,p_button_condition=>'P130_TEMPLATE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(358092202296242251.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_button_name=>'DELETE_TEMPLATE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P130_TEMPLATE_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(358117541424396782.4852)
,p_branch_name=>'Branch to Page 120'
,p_branch_action=>'f?p=&APP_ID.:120:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE,P120_MODULE_ID:MM&P130_MODULE_ID.,&P130_MODULE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(358092202296242251.4852)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(619047686202969822.4852)
,p_branch_name=>'Branch to Page 120'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE_TEMPLATE,UPDATE_TEMPLATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358043156051998602.4852)
,p_name=>'P130_ETAG_TYPE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_item_default=>'HASH'
,p_prompt=>unistr('Type de balise d''entit\00E9 HTTP')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Secure Hash;HASH,Query;QUERY,None;NONE'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Type de balise d''entit\00E9 \00E0 utiliser pour identifier de mani\00E8re unique la version de ressource.'),
'<br/>',
'<ul>',
unistr('<li><strong>Hachage s\00E9curis\00E9 :</strong> g\00E9n\00E8re l''ID de version \00E0 l''aide d''un hachage s\00E9curis\00E9.</li>'),
unistr('<li><strong>Requ\00EAte :</strong> utilise une requ\00EAte indiqu\00E9e par l''utilisateur pour identifier de mani\00E8re unique la version de ressource.</li>'),
unistr('<li><strong>Aucun :</strong> n''utilise aucune balise d''entit\00E9.</li>'),
'</ul>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358043237764998603.4852)
,p_name=>'P130_PRIORITY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_item_default=>'0'
,p_prompt=>unistr('Priorit\00E9')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:0,1,2,3,4,5,6,7,8,9'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Priorit\00E9 qui sera octroy\00E9e \00E0 ce mod\00E8le en cas de collisions de ressources. 0 est la valeur la plus faible, 9 la plus \00E9lev\00E9e. ')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358043325916998604.4852)
,p_name=>'P130_ETAG_QUERY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_prompt=>unistr('Requ\00EAte d''ETag')
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358043865640998609.4852)
,p_name=>'P130_TEMPLATE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358044103570998612.4852)
,p_name=>'P130_COMMENTS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_prompt=>'Commentaires'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358045290840998623.4852)
,p_name=>'P130_MODULE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_prompt=>'Module de service RESTful'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
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
 p_id=>wwv_flow_imp.id(358045405212998625.4852)
,p_name=>'P130_MODULE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358093447685242264.4852)
,p_name=>'P130_URI_PATTERN'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_prompt=>unistr('Mod\00E8le d''URI')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>600
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Mod\00E8le d''URI <em>respectant les majuscules/minuscules</em> utilis\00E9 pour acc\00E9der \00E0 la ressource sp\00E9cifique. Le mod\00E8le d''URI de la ressource est ajout\00E9 \00E0 la fin du chemin de serveur et du chemin de base de module. <br/>'),
'<br/>',
unistr('Le mod\00E8le d''URI peut \00E9galement inclure une variable attach\00E9e ajout\00E9e apr\00E8s une barre oblique. Cela permet de transmettre une valeur au service dans le cadre de l''URI. La syntaxe de la variable attach\00E9e ajoute un pr\00E9fixe au nom de variable \00E0 l''aide d''')
||'un signe deux-points (:)<BR/>',
'<br/>',
'Exemple : <br/><br/>',
'<pre>',
'http://example.com/ords/mySchema/hr/<strong>employees/:id</strong>',
'|_________________|____|________|_|_________|____|',
'           |        |     |     |     |      |',
unistr('           |        |     |     |     |       - <strong>Variable attach\00E9e</strong>'),
'           |        |     |     |     | ',
unistr('           |        |     |     |      - <strong>Mod\00E8le d''URI</strong>'),
'           |        |     |     |',
'           |        |     |      - Chemin de base de module',
'           |        |     |',
unistr('           |        |      - Alias de sch\00E9ma'),
'           |        |      ',
'           |         - Alias ORDS',
'           |               ',
'            - URL de serveur               ',
' </pre>',
'<br/>',
unistr('<strong>Remarque :</strong> les param\00E8tres <strong>PAGE</strong>, <strong>LIMIT</strong> et <strong>OFFSET</strong> sont limit\00E9s car ils sont utilis\00E9s par ORDS pour la pagination.')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(521638788660366449.4852)
,p_name=>'P130_URI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('URL compl\00E8te')
,p_post_element_text=>'<button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--small" onclick="void(0);" aria-label="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD_ARIA." type="button"  title="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD." data-clipboard-source="#P130_URI" styl'
||'e="margin-left:5px;"><span class="a-Icon icon-copy" aria-hidden="true"></span></button>'
,p_source=>'&G_APEX_PATH.&G_SCHEMA_ALIAS.&P130_MODULE_BASE_PATH.<font color="#EE0000">&P130_URI_PATTERN.</font>'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P130_TEMPLATE_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619045630941969802.4852)
,p_name=>'P130_MODULE_BASE_PATH'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(707870035522701452.4852)
,p_prompt=>'Chemin de base de module'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(411295932193027822.4852)
,p_validation_name=>'Validate URI'
,p_validation_sequence=>10
,p_validation=>'RETURN wwv_flow_rest_ws.validate_uri(:P130_URI_PATTERN);'
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_validation_condition=>'CREATE_TEMPLATE,UPDATE_TEMPLATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(358093447685242264.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(358043492907998605.4852)
,p_name=>'Hide/Show Query'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P130_ETAG_TYPE'
,p_condition_element=>'P130_ETAG_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'QUERY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358043519701998606.4852)
,p_event_id=>wwv_flow_imp.id(358043492907998605.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P130_ETAG_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358043615009998607.4852)
,p_event_id=>wwv_flow_imp.id(358043492907998605.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P130_ETAG_QUERY'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(358148364203965601.4852)
,p_name=>'Process Delete'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(358092202296242251.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358149251094965603.4852)
,p_event_id=>wwv_flow_imp.id(358148364203965601.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.confirm(apex.lang.getMessage(''RFS.DELETE_TEMPLATE''),''DELETE_TEMPLATE'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(358135449087847330.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch row from ORDS_TEMPLATES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_template_id       number;',
'    l_module_id         number;',
'    l_uri_pattern       varchar2(4000);',
'    l_priority          number;',
'    l_etag_type         varchar2(4000);',
'    l_etag_query        varchar2(4000);',
'    l_comments          varchar2(4000);',
'BEGIN',
'   select ',
'       n001 template_id,',
'       n002 module_id,',
'       c001 uri_pattern, ',
'       n003 priority,',
'       c002 etag_type,',
'       c003 etag_query,',
'       c004 comments',
'  INTO ',
'       l_template_id,',
'       l_module_id,',
'       l_uri_pattern,',
'       l_priority,  ',
'       l_etag_type, ',
'       l_etag_query,',
'       l_comments  ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_TEMPLATES''',
'   and (    n001 = :P130_TEMPLATE_ID',
'         OR (     c001 = :P130_URI_PATTERN',
'              AND n002 = :P130_MODULE_ID ) )',
'   and rownum = 1;',
'  ',
'   :P130_TEMPLATE_ID     := l_template_id;',
'   :P130_MODULE_ID       := l_module_id;',
'   :P130_URI_PATTERN     := l_uri_pattern;',
'   :P130_PRIORITY        := l_priority;',
'   :P130_etag_type       := l_etag_type;',
'   :P130_etag_query      := l_etag_query;',
'   :P130_comments        := l_comments;',
'   --',
'   :P0_SELECTED_NODE := ''MT''||l_template_id;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'P130_TEMPLATE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>358135449087847330.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(358045304011998624.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Module Name and Base Path'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 module_name, ',
'       case when substr(c002,1,1) = ''/'' then c002',
'            else ''/''||c002',
'       end base_path ',
'  into :P130_MODULE_NAME,',
'       :P130_MODULE_BASE_PATH',
'  from wwv_flow_collections',
' where COLLECTION_NAME= ''ORDS_MODULES''',
'   and n001 = :P130_MODULE_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P130_MODULE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>358045304011998624.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(395801931891090609.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process_template_changes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_rest_ws.process_rest_ws_request(p_request=> :REQUEST, p_parse_as => :P0_SCHEMA);',
'  -- Set Template ID to -1 to force a refresh of the details when we are creating a new Template.',
'  :P130_TEMPLATE_ID := -1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>395801931891090609.4852
);
end;
/
prompt --application/pages/page_00140
begin
wwv_flow_imp_page.create_page(
 p_id=>140.4852
,p_name=>'Gestionnaire de ressources'
,p_alias=>'RESOURCE-HANDLER'
,p_step_title=>'Gestionnaire de ressources'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var g_run = false;',
'htmldb_null_script=''The Source may not be empty.'';',
'htmldb_max_script_size=''Maximum Script size of 32767 exceeded.'';',
'',
'function gStoreScript(req, run, cb) {',
'  var plsqlCode, scriptLength, ',
'      saveNew = false,',
'      maxLength = $v("P140_MAX_LENGTH");',
'',
'  function doSave() {',
'    apex.builder.plugin.codeEditor.saveProcess("#codeEditor_widget", "STORE_SCRIPT", "f01")',
'      .always(function() {',
'          cb(saveNew);',
'      });',
'  }',
'',
'  plsqlCode = $("#codeEditor_widget").codeEditor("getValue");',
'  scriptLength = plsqlCode.length;',
'',
'  if (!plsqlCode) {',
'    alert(htmldb_null_script);',
'    return false;',
'  }',
'',
'  if (scriptLength > maxLength) {',
'    alert(htmldb_max_script_size);',
'    return false;',
'  }',
'',
'  if (req == ''SAVE'' || req == ''CREATE'') {',
'',
'      doSave()',
'      return true;',
'  }',
'}'))
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_plug_name=>'Gestionnaire de ressources'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_plug_name=>'FORMAT'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--noBorder:a-Region--hideHeader:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(358904551627530223.4852)
,p_plug_name=>'OTHER'
,p_region_name=>'other_region_items'
,p_region_template_options=>'#DEFAULT#:a-Region--noTopBorder:a-Region--noPadding:a-Region--noBorder:a-Region--hideHeader:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(358905213997530230.4852)
,p_plug_name=>'Source'
,p_region_name=>'codeEditor'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>40
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select clob001 ',
'  from wwv_flow_collections',
' where COLLECTION_NAME = ''ORDS_HANDLERS''',
'   and n001 = :P140_HANDLER_ID'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.CLOB_CODE_EDITOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'PLSQL',
  'attribute_02', '20',
  'attribute_03', 'N',
  'attribute_04', 'VARCHAR2')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(359175352067742002.4852)
,p_plug_name=>unistr('Param\00E8tres')
,p_region_name=>'parameters'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001 id,',
'       c001 name,',
'       c002 bind_variable_name,',
'       c003 source_type,',
'       c004 access_method,',
'       c005 param_type,',
'       c006 comments',
'  from wwv_flow_collections',
' where COLLECTION_NAME = ''ORDS_PARAMETERS''',
'   and n002 = :P140_HANDLER_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P140_HANDLER_ID'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359175554518742004.4852)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359175621703742005.4852)
,p_name=>'NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nom'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('Nom du param\00E8tre, tel qu''il appara\00EEt dans le mod\00E8le d''URI ou l''en-t\00EAte HTTP. Utilis\00E9 pour mettre en correspondance des noms qui ne sont pas des noms de param\00E8tres SQL valides.')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359175776444742006.4852)
,p_name=>'BIND_VARIABLE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BIND_VARIABLE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Variable attach\00E9e')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('Nom du param\00E8tre, tel qu''il est d\00E9sign\00E9 dans le code SQL. Si la valeur NULL est sp\00E9cifi\00E9e, le param\00E8tre n''est pas li\00E9.')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359175879349742007.4852)
,p_name=>'SOURCE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SOURCE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type de source'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''HTTP HEADER'' d,',
'       ''HEADER'' r',
'  from sys.dual',
'UNION',
'select ''URI'' d,',
'       ''URI'' r',
'  from sys.dual',
'where :ACCESS_METHOD = ''IN''',
'UNION',
'select ''RESPONSE'' d,',
'       ''RESPONSE'' r',
'  from sys.dual',
'where :ACCESS_METHOD = ''OUT''',
''))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ACCESS_METHOD'
,p_ajax_items_to_submit=>'ACCESS_METHOD'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('Identifie si le param\00E8tre provient du mod\00E8le d''URI ou de l''en-t\00EAte HTTP. Valeurs valides : HEADER, RESPONSE, URI.')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359175902308742008.4852)
,p_name=>'ACCESS_METHOD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCESS_METHOD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('M\00E9thode d''acc\00E8s')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:IN;IN,OUT;OUT,IN/OUT;INOUT'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>unistr('Indique si le param\00E8tre est une valeur d''entr\00E9e, une valeur de sortie, ou les deux. Valeurs valides : IN, OUT, INOUT.')
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359176028902742009.4852)
,p_name=>'PARAM_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAM_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Type de donn\00E9es')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:STRING;STRING,INTEGER;INT,LONG;LONG,DOUBLE;DOUBLE,BOOLEAN;BOOLEAN,TIMESTAMP;TIMESTAMP,RESULTSET;RESULTSET'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Type de donn\00E9es natif du param\00E8tre. Valeurs valides : STRING, INT, DOUBLE, BOOLEAN, LONG, TIMESTAMP.</p>'),
'',
unistr('<p><strong>Remarque :</strong> les types de donn\00E9es ne sont <strong><I>pas</I></strong> des types de donn\00E9es Oracle. STRING repr\00E9sente des cha\00EEnes de toute longueur. INT, DOUBLE, LONG repr\00E9sentent des valeurs num\00E9riques dont la pr\00E9cision varie. BOOLE')
||unistr('AN repr\00E9sente une valeur True ou False logique.</p>')))
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359176171968742010.4852)
,p_name=>'COMMENTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMMENTS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Commentaires'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_help_text=>'Texte de commentaire.'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359176263401742011.4852)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(359176396795742012.4852)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(359175469963742003.4852)
,p_internal_uid=>359175469963742003
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('Aucun param\00E8tre d\00E9fini')
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(359189423622765512.4852)
,p_interactive_grid_id=>wwv_flow_imp.id(359175469963742003.4852)
,p_static_id=>'11559'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(359189561157765512.4852)
,p_report_id=>wwv_flow_imp.id(359189423622765512.4852)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(359177630131742025.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE,P130_TEMPLATE_ID:MT&P140_TEMPLATE_ID.,&P140_TEMPLATE_ID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(359177342683742022.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_button_name=>'CREATE_HANDLER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un gestionnaire')
,p_button_position=>'CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P140_HANDLER_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(359177472235742023.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_button_name=>'UPDATE_HANDLER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE2'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P140_HANDLER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(359177528743742024.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_button_name=>'DELETE_HANDLER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P140_HANDLER_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619045789122969803.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(358905213997530230.4852)
,p_button_name=>'SOURCE_HELP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719735277951947858.4852)
,p_button_image_alt=>'Aide de la source'
,p_button_position=>'HELP'
,p_button_redirect_url=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'icon-help'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619045845793969804.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(359175352067742002.4852)
,p_button_name=>'PARAMETERS_HELP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719735277951947858.4852)
,p_button_image_alt=>unistr('Aide relative aux param\00E8tres')
,p_button_position=>'HELP'
,p_button_redirect_url=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'icon-help'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(381672726867069403.4852)
,p_branch_name=>'Branch to 130'
,p_branch_action=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE,P130_TEMPLATE_ID:MT&P140_TEMPLATE_ID.,&P140_TEMPLATE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(359177528743742024.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(619047708251969823.4852)
,p_branch_name=>'Branch to 140'
,p_branch_action=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'UPDATE_HANDLER,CREATE_HANDLER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358045687642998627.4852)
,p_name=>'P140_TEMPLATE_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358045728205998628.4852)
,p_name=>'P140_MODULE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358045857977998629.4852)
,p_name=>'P140_METHOD'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_prompt=>unistr('M\00E9thode')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r ',
'from ',
'(select 1 ord, ''GET'' d, ''GET''r',
'  from sys.dual',
' UNION ',
' select 2 ord, ''POST'' d, ''POST''r',
'  from sys.dual',
' UNION ',
' select 3 ord, ''PUT'' d, ''PUT''r',
'  from sys.dual',
' UNION ',
' select 4 ord, ''DELETE'' d, ''DELETE''r',
'  from sys.dual',
') a',
'where a.d not in (',
'SELECT c002',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_HANDLERS''',
'   and n002 = :P140_TEMPLATE_ID)',
'order by ord asc'))
,p_cHeight=>1
,p_read_only_when=>'P140_HANDLER_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Identifie la m\00E9thode HTTP \00E0 utiliser pour le gestionnaire de ressources. Les quatre options sont les suivantes :<p/>'),
'<ul>',
unistr('<li><strong>GET</strong> : extrait la repr\00E9sentation d''une ressource</li>'),
unistr('<li><strong>POST</strong> : cr\00E9e une ressource ou ajoute une ressource \00E0 une collection</li>'),
unistr('<li><strong>PUT</strong> : met \00E0 jour une ressource existante</li>'),
'<li><strong>DELETE</strong> : supprime une ressource existante</li>',
'</ul>',
unistr('<p>Un seul gestionnaire est autoris\00E9 pour chaque m\00E9thode HTTP.</p>'),
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358045950760998630.4852)
,p_name=>'P140_SOURCE_TYPE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_prompt=>'Type de source'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.GROUP_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Collection Query'' d, ''collection'' r, null grp',
'  from dual ',
'UNION ALL',
'select ''Collection Query Item'' d, ''item'' r, null grp',
'  from dual ',
'UNION ALL',
'select ''PL/SQL'' d, ''plsql'' r, null grp',
'  from dual ',
'UNION ALL',
'select ''Media Resource'' d, ''media'' r, null grp',
'  from dual ',
'UNION ALL',
'select  ''Query'' d, ''query'' r, ''Desupported'' grp',
'  from dual ',
'UNION ALL',
'select  ''Query One Row'' d, ''onerow'' r, ''Desupported'' grp',
'  from dual ',
'UNION ALL',
'select  ''Feed'' d, ''feed'' r, ''Desupported'' grp',
'  from dual '))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('D\00E9finit l''impl\00E9mentation de la source de la m\00E9thode HTTP s\00E9lectionn\00E9e.<p/>'),
'Les options sont les suivantes :<p/>',
'<ul>',
unistr('<li><strong>Requ\00EAte de collecte :</strong> ex\00E9cute une requ\00EAte SQL et transforme l''ensemble de r\00E9sultats en repr\00E9sentation JSON ORDS standard. Disponible lorsque la m\00E9thode HTTP est GET. Format des r\00E9sultats : JSON</li>'),
unistr('<li><strong>El\00E9ment de requ\00EAte de collecte :</strong> ex\00E9cute une requ\00EAte SQL qui renvoie une ligne de donn\00E9es dans une repr\00E9sentation JSON ORDS standard. Disponible lorsque la m\00E9thode HTTP est GET. Format des r\00E9sultats : JSON</li>'),
unistr('<li><strong>PL/SQL :</strong> ex\00E9cute un bloc PL/SQL anonyme et transforme les param\00E8tres OUT ou IN/OUT en repr\00E9sentation JSON. La fonction htp.p peut \00E9galement \00EAtre utilis\00E9e pour \00E9mettre une repr\00E9sentation JSON personnalis\00E9e. Format des r\00E9sultats : ')
||'JSON</li>',
unistr('<li><strong>Ressource de support :</strong> ex\00E9cute une requ\00EAte SQL conforme \00E0 un format sp\00E9cifique et transforme l''ensemble de r\00E9sultats en repr\00E9sentation binaire avec un en-t\00EAte HTTP Content-Type associ\00E9 identifiant le type de support Internet de l')
||unistr('a repr\00E9sentation. Le format de la requ\00EAte SQL doit \00EAtre le suivant : <p/><br/><i>SELECT ''content_type'', column FROM . . .</i><br/><br/>'),
unistr('o\00F9 <i>''content_type''</i> est une cha\00EEne transmise au navigateur \00E0 utiliser pour identifier les donn\00E9es entrantes, par exemple <i>''image/jpeg''</i>, et <i>column</i> est le nom de la colonne contenant la source des donn\00E9es renvoy\00E9es. Le type de source ')
||unistr('de ressource de support est g\00E9n\00E9ralement utilis\00E9 pour les objets de support, comme les images, o\00F9 les donn\00E9es sont g\00E9r\00E9es directement par le destinataire effectuant l''appel.</p>'),
'</ul>',
'<br/>',
'<p/>',
unistr('<strong>Remarque :</strong> les options suivantes sont consid\00E9r\00E9es comme n''\00E9tant plus prises en charge car elles repr\00E9sentent des options propres aux services REST bas\00E9s sur APEX.<p/>'),
'<ul>',
unistr('<li><strong>Requ\00EAte :</strong> ex\00E9cute une requ\00EAte SQL et transforme l''ensemble de r\00E9sultats en repr\00E9sentation CSV ou JSON (JavaScript Object Notation) ORDS h\00E9rit\00E9, en fonction du format s\00E9lectionn\00E9. Disponible lorsque la m\00E9thode HTTP est GET. Format')
||unistr(' des r\00E9sultats : JSON ou CSV</li>'),
unistr('<li><strong>Requ\00EAte sur une ligne :</strong> ex\00E9cute une requ\00EAte SQL qui renvoie une ligne de donn\00E9es dans une repr\00E9sentation JSON ORDS h\00E9rit\00E9. Disponible lorsque la m\00E9thode HTTP est GET. Format des r\00E9sultats : JSON</li>'),
unistr('<li><strong>Flux</strong> : ex\00E9cute une requ\00EAte SQL et transforme les r\00E9sultats en repr\00E9sentation de flux JSON. Chaque \00E9l\00E9ment du flux contient le r\00E9capitulatif d''une ressource et un lien hypertexte vers une repr\00E9sentation compl\00E8te de la ressource. L')
||unistr('a premi\00E8re colonne de chaque ligne de l''ensemble de r\00E9sultats doit \00EAtre un identificateur unique de la ligne et sert de lien hypertexte au format <em>path/to/feed/{id}</em>, la valeur de la premi\00E8re colonne \00E9tant utilis\00E9e comme valeur pour <em>{id}</')
||unistr('em>. Les autres colonnes de la ligne sont suppos\00E9es r\00E9sumer la ressource et sont incluses dans le flux. Un mod\00E8le de ressource distinct pour la repr\00E9sentation compl\00E8te de la ressource doit \00E9galement \00EAtre d\00E9fini. Format des r\00E9sultats : JSON</li>'),
'',
'</ul>',
''))
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358046019038998631.4852)
,p_name=>'P140_FORMAT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_item_default=>'json'
,p_prompt=>'Format'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:JSON;json,CSV;csv'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>S\00E9lectionnez le format \00E0 utiliser pour l''ensemble de r\00E9sultats.</p>'),
'<p>Les options disponibles sont les suivantes :',
'<ul>',
unistr('    <li><strong>JSON :</strong> la sortie est transform\00E9e en format de document JavaScript Object Notation</li>'),
unistr('    <li><strong>CSV :</strong> la sortie est transform\00E9e en repr\00E9sentation de valeurs s\00E9par\00E9es par des virgules</li>'),
'</ul>',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358046193262998632.4852)
,p_name=>'P140_MIME_TYPES_ALLOWED'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(358904551627530223.4852)
,p_prompt=>unistr('Types MIME autoris\00E9s')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>80
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Liste des types MIME s\00E9par\00E9s par des virgules, accept\00E9s par le gestionnaire. Applicable uniquement \00E0 PUT et POST.<br/>'),
'<br/>',
'Exemple :<br/>',
'<br/>',
'application/json</br>',
'text/csv <br/>',
'...'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358046204754998633.4852)
,p_name=>'P140_ITEMS_PER_PAGE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(358904551627530223.4852)
,p_prompt=>'Taille de pagination'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Saisissez la taille de la fen\00EAtre de pagination.</p>'),
unistr('<p>La pagination pour une m\00E9thode GET d''op\00E9ration HTTP de gestionnaire de ressources correspond au nombre de lignes \00E0 renvoyer sur chaque page d''un ensemble de r\00E9sultats au format JSON, \00E0 partir d''une requ\00EAte de base de donn\00E9es. Lorsque cette valeur ')
||unistr('n''est pas indiqu\00E9e, le param\00E8tre du module de ressource est appliqu\00E9.</p>'),
unistr('<p>Remarque : des liens seront indiqu\00E9s pour obtenir les prochains et les pr\00E9c\00E9dents ensembles d''enregistrements. Ces liens utilisent les variables <code>:row_offset</code> et <code>:row_count</code> dans la source pour impl\00E9menter la pagination indi')
||unistr('qu\00E9e.</p>')))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '10000',
  'min_value', '0',
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358046342741998634.4852)
,p_name=>'P140_MODULE_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_prompt=>'Module de service RESTful'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
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
 p_id=>wwv_flow_imp.id(358046419296998635.4852)
,p_name=>'P140_MODULE_BASE_PATH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_prompt=>'Chemin de base de module'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
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
 p_id=>wwv_flow_imp.id(358046849970998639.4852)
,p_name=>'P140_SOURCE_TYPE_PLSQL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_item_default=>'PL/SQL'
,p_prompt=>'Type de source'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358047101854998642.4852)
,p_name=>'P140_FORMAT_JSON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_item_default=>'JSON'
,p_prompt=>'Format'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358902388021530201.4852)
,p_name=>'P140_FORMAT_BINARY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_item_default=>'Binary Representation'
,p_prompt=>'Format'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358904995250530227.4852)
,p_name=>'P140_HANDLER_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(358905029352530228.4852)
,p_name=>'P140_COMMENTS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(358904551627530223.4852)
,p_prompt=>'Commentaires'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(359179769296742046.4852)
,p_name=>'P140_MAX_LENGTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(358905213997530230.4852)
,p_source=>'32767'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619047399820969819.4852)
,p_name=>'P140_URI_TEMPLATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_prompt=>unistr('Mod\00E8le d''URI')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
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
 p_id=>wwv_flow_imp.id(662196643155087013.4852)
,p_name=>'P140_URI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(358045544097998626.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('URL compl\00E8te')
,p_post_element_text=>'<button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--small" onclick="void(0);" aria-label="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD_ARIA." type="button"  title="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD." data-clipboard-source="#P140_URI" styl'
||'e="margin-left:5px;"><span class="a-Icon icon-copy" aria-hidden="true"></span></button>'
,p_source=>'&G_APEX_PATH.&G_SCHEMA_ALIAS.&P140_MODULE_BASE_PATH.&P140_URI_TEMPLATE.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when=>'P140_HANDLER_ID'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(411296062415027823.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(359175352067742002.4852)
,p_validation_name=>'Validate Param Name'
,p_validation_sequence=>10
,p_validation=>'NAME'
,p_validation2=>'^([-a-zA-Z0-9_\.]*)$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#COLUMN_HEADER# ne peut contenir que des caract\00E8res alphab\00E9tiques, des chiffres, des tirets, des traits de soulignement et des points.')
,p_associated_column=>'NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(411296102786027824.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(359175352067742002.4852)
,p_validation_name=>'Validate Bind Variable Name'
,p_validation_sequence=>20
,p_validation=>'BIND_VARIABLE_NAME'
,p_validation2=>'^([a-zA-Z0-9_]*)$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('#COLUMN_HEADER# ne peut contenir que des caract\00E8res alphab\00E9tiques, des chiffres et des traits de soulignement.')
,p_associated_column=>'BIND_VARIABLE_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_name=>'Toggle Items METHOD=GET'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_METHOD'
,p_condition_element=>'P140_METHOD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'GET'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358902553955530203.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_SOURCE_TYPE,P140_ITEMS_PER_PAGE'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358902657141530204.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_SOURCE_TYPE,P140_ITEMS_PER_PAGE'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358904237955530220.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358904380671530221.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(358904035641530218.4852)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358902762912530205.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_SOURCE_TYPE_PLSQL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358902843634530206.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_SOURCE_TYPE_PLSQL'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(359179660607742045.4852)
,p_event_id=>wwv_flow_imp.id(358902408339530202.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_SOURCE_TYPE'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'plsql'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(358902927743530207.4852)
,p_name=>'Toggle Items METHOD in PUT,POST'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_METHOD'
,p_condition_element=>'P140_METHOD'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'PUT,POST'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358903033381530208.4852)
,p_event_id=>wwv_flow_imp.id(358902927743530207.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_MIME_TYPES_ALLOWED'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358903175300530209.4852)
,p_event_id=>wwv_flow_imp.id(358902927743530207.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P140_MIME_TYPES_ALLOWED'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(358903407006530212.4852)
,p_name=>'Change of SOURCE TYPE'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P140_SOURCE_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(358904432601530222.4852)
,p_event_id=>wwv_flow_imp.id(358903407006530212.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($(''#P140_METHOD'').find(":selected").val() == ''GET''|| $(''#P140_METHOD'').val() == ''GET'') {',
'   if  ($(''#P140_SOURCE_TYPE'').find(":selected").val() == ''query'') {',
'       $x_Show(''P140_FORMAT'');',
'       $x_Hide(''P140_FORMAT_JSON'');',
'       $x_Hide(''P140_FORMAT_BINARY'');',
'   } else if ($(''#P140_SOURCE_TYPE'').find(":selected").val() == ''media'') {',
'       $x_Show(''P140_FORMAT_BINARY'');',
'       $x_Hide(''P140_FORMAT_JSON'');',
'       $x_Hide(''P140_FORMAT'');',
'   } else {',
'       $x_Show(''P140_FORMAT_JSON'');',
'       $x_Hide(''P140_FORMAT_BINARY'');',
'       $x_Hide(''P140_FORMAT'');',
'   }  ',
'    ',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(359179962554742048.4852)
,p_name=>'Save'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(359177472235742023.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(359180039959742049.4852)
,p_event_id=>wwv_flow_imp.id(359179962554742048.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'gStoreScript(''SAVE'', false, function(saveNew) {',
'      apex.submit(''UPDATE_HANDLER'');',
'});',
''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(359180132867742050.4852)
,p_name=>'CREATE'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(359177342683742022.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(381672523658069401.4852)
,p_event_id=>wwv_flow_imp.id(359180132867742050.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'gStoreScript(''CREATE'', false, function() {',
'      apex.submit(''CREATE_HANDLER'');',
'});'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(395744443646448605.4852)
,p_name=>'Process Delete'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(359177528743742024.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(395745334271448644.4852)
,p_event_id=>wwv_flow_imp.id(395744443646448605.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.confirm(apex.lang.getMessage(''RFS.DELETE_HANDLER''),''DELETE_HANDLER'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(358960799518334105.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch row from ORDS_HANDLERS Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_handler_id          number;',
'    l_template_id         number;',
'    l_source_type         varchar2(255);',
'    l_method              varchar2(10);',
'    l_mimes_allowed       varchar2(255);',
'    l_items_per_page      number;',
'    l_comments            varchar2(4000);',
'    l_module_id           number;',
'BEGIN',
'',
'-- Get the Handler information from the collection',
'   select ',
'       n001 handler_id,',
'       n002 template_id,',
'       c001 source_type, ',
'       c002 method,',
'       c003 mimes_allowed,',
'       n003 items_per_page,',
'       c004 comments',
'  INTO ',
'      l_handler_id,',
'      l_template_id,   ',
'      l_source_type,   ',
'      l_method,        ',
'      l_mimes_allowed, ',
'      l_items_per_page,',
'      l_comments    ',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_HANDLERS''',
'   and (n001 = :P140_HANDLER_ID',
'        OR',
'        (c002 = :P140_METHOD',
'         and',
'         n002 = :P140_TEMPLATE_ID)',
'       );',
'  ',
'-- Assign the values to the page items',
'   :P140_HANDLER_ID      := l_handler_id;',
'   :P140_TEMPLATE_ID     := l_template_id;',
'   :P140_METHOD          := l_method;',
'   :P140_SOURCE_TYPE     := case l_source_type',
'                            when ''json/collection'' then ''collection''',
'                            when ''json/item'' then ''item''',
'                            when ''json/query''then ''query''',
'                            when ''csv/query'' then ''query''',
'                            when ''json/query;type=single'' then ''onerow''',
'                            when ''json/query;type=feed'' then ''feed''',
'                            when ''plsql/block'' then ''plsql''',
'                            when ''resource/lob''then ''media''',
'                            end;',
'   :P140_FORMAT          := case l_source_type ',
'                            when ''csv/query'' then ''csv''',
'                            else ''json''',
'                            end;',
'   :P140_MIME_TYPES_ALLOWED   := l_mimes_allowed;',
'   :P140_ITEMS_PER_PAGE  := l_items_per_page;',
'   :P140_COMMENTS        := l_comments;',
'   ',
'-- Now we need to get the MODULE name',
'select n001 id',
'  into l_module_id ',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES''',
'   and n001 = (select n002 ',
'                 from wwv_flow_collections',
'                where collection_name = ''ORDS_TEMPLATES''',
'                  and n001 = l_template_id);',
'           ',
':P140_MODULE_ID := l_module_id;',
'-- ',
':P0_SELECTED_NODE := ''TH''||l_handler_id;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P140_HANDLER_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>358960799518334105.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(381691470012193485.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Module Name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select c001 module_name, ',
'       case when substr(c002,1,1) = ''/'' then c002',
'            else ''/''||c002',
'       end base_path ',
'  into :P140_MODULE_NAME,',
'       :P140_MODULE_BASE_PATH',
'  from wwv_flow_collections',
' where COLLECTION_NAME= ''ORDS_MODULES''',
'   and n001 = :P140_MODULE_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P140_MODULE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>381691470012193485.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(381672938639069405.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Template Name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001',
'  into :P140_URI_TEMPLATE',
'  from wwv_flow_collections',
' where COLLECTION_NAME= ''ORDS_TEMPLATES''',
'   and n001 = :P140_TEMPLATE_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P140_TEMPLATE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>381672938639069405.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(381676227444069438.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create CHANGED_PARAMS collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'wwv_flow_collection.create_or_truncate_collection(''CHANGED_PARAMS'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>381676227444069438.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(359176414738742013.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(359175352067742002.4852)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Parameters - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_collection.add_member(p_collection_name => ''CHANGED_PARAMS'',',
'                             p_n001            => :ID,',
'                             p_c001            => :NAME,',
'                             p_c002            => :BIND_VARIABLE_NAME,',
'                             p_c003            => :SOURCE_TYPE,',
'                             p_c004            => :ACCESS_METHOD,',
'                             p_c005            => :PARAM_TYPE,',
'                             p_c006            => :COMMENTS,',
'                             p_c007            => :APEX$ROW_STATUS);',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_only_for_changed_rows=>'N'
,p_internal_uid=>359176414738742013.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(395802048748090610.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Changed Handler'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_rest_ws.process_rest_ws_request(p_request=> :REQUEST, p_parse_as => :P0_SCHEMA);',
'  -- Set Handler ID to -1 to force refresh of details after creating new handler',
'  :P140_HANDLER_ID := -1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>395802048748090610.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(359179889405742047.4852)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'STORE_SCRIPT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_code        clob := empty_clob;',
'begin    ',
'    sys.dbms_lob.createtemporary( l_code, false, sys.dbms_lob.SESSION );',
'',
'    htmldb_collection.create_or_truncate_collection(',
'        p_collection_name => ''HANDLER_SOURCE'');',
'',
'    for i in 1..wwv_flow.g_f01.count loop   	   ',
'        sys.dbms_lob.writeappend(l_code,length(wwv_flow.g_f01(i)),wwv_flow.g_f01(i));        ',
'    end loop;',
'',
'',
'    htmldb_collection.add_member(',
'        p_collection_name => ''HANDLER_SOURCE'',',
'        p_clob001         => l_code);',
'',
'    sys.owa_util.status_line(204, ''No Content'');',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>359179889405742047.4852
);
end;
/
prompt --application/pages/page_00141
begin
wwv_flow_imp_page.create_page(
 p_id=>141.4852
,p_name=>'Aide de la source'
,p_alias=>'SOURCE-HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Aide de la source'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(619046063443969806.4852)
,p_plug_name=>'Help'
,p_region_css_classes=>'padding-md'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Saisissez l''impl\00E9mentation source pour la m\00E9thode HTTP s\00E9lectionn\00E9e. L''impl\00E9mentation peut \00EAtre une simple instruction SQL ou un bloc PL/SQL complexe. Les impl\00E9mentations source peuvent r\00E9f\00E9rencer des valeurs provenant de l''URL, des en-t\00EAtes HTTP ou ')
||unistr('du corps HTTP \00E0 l''aide d''une syntaxe standard de variable attach\00E9e. <br/>'),
'<br/>',
unistr('Par exemple, l''impl\00E9mentation d''une m\00E9thode GET avec l''URI suivant :<br/>'),
'<pre>http://example.com/ords/mySchema/hr/employees/:id</pre>',
unistr('peut avoir l''impl\00E9mentation source ci-dessous, qui r\00E9f\00E9rence l''ID transmis sur l''URL :<br/>'),
'<pre>select * from emp',
'where empno = :id</pre>',
unistr('Autrement, l''impl\00E9mentation d''une m\00E9thode PUT avec le m\00EAme URI : '),
'<pre>http://example.com/ords/mySchema/hr/employees/:id</pre>',
unistr('et les d\00E9finitions de param\00E8tre ci-dessous :<br/>'),
'<br />',
'<div class="a-Report">',
'  <table class="a-Report-report">',
'    <tr>',
'      <th scope="col" class="a-Report-colHead u-tL">Nom</th>',
unistr('      <th scope="col" class="a-Report-colHead u-tL">Variable attach\00E9e</th>'),
'      <th scope="col" class="a-Report-colHead u-tL">Type de source</th>',
unistr('      <th scope="col" class="a-Report-colHead u-tL">M\00E9thode d''acc\00E8s</th>'),
unistr('      <th scope="col" class="a-Report-colHead u-tL">Type de donn\00E9es</th>'),
'    </tr>',
'    <tr>',
'      <td class="a-Report-cell">ID</td>',
'      <td class="a-Report-cell">id</td>',
unistr('      <td class="a-Report-cell">En-t\00EAte HTTP</td>'),
'      <td class="a-Report-cell">IN</td>',
'      <td class="a-Report-cell">STRING</td>',
'    </tr>',
'    <tr>',
'      <td class="a-Report-cell">X-APEX-FORWARD</td>',
'      <td class="a-Report-cell">emplacement</td>',
unistr('      <td class="a-Report-cell">En-t\00EAte HTTP</td>'),
'      <td class="a-Report-cell">OUT</td>',
'      <td class="a-Report-cell">STRING</td>',
'    </tr>',
'    <tr>',
'      <td class="a-Report-cell">X-APEX-STATUS-CODE</td>',
'      <td class="a-Report-cell">statut</td>',
unistr('      <td class="a-Report-cell">En-t\00EAte HTTP</td>'),
'      <td class="a-Report-cell">out</td>',
'      <td class="a-Report-cell">INTEGER</td>',
'    </tr>',
'  </table>',
'</div>',
'<br />',
unistr('peut avoir l''impl\00E9mentation source suivante :'),
'<pre>begin',
'    update emp set ename    = :ename,',
'                   job      = :job,',
'                   hiredate = :hiredate,',
'                   mgr      = :mgr,',
'                   sal      = :sal,',
'                   comm     = :comm,',
'                   deptno   = :deptno',
'             where empno = :id;',
'    --',
'    :status := 200;',
'    :location := :id;',
'    --',
'exception',
'    when others then',
'        :status := 400;',
'end;',
'</pre>',
unistr('<strong>Remarque :</strong> les valeurs r\00E9f\00E9renc\00E9es par des variables attach\00E9es qui ne sont pas transmises sur l''URL, ni dans l''en-t\00EAte HTTP, sont transmises dans le corps HTTP dans un format correspondant \00E0 celui d\00E9sign\00E9 dans la d\00E9finition de m\00E9thod')
||'e, par exemple un package JSON comme suit :',
'<pre>',
'{ "empno": 7369,',
'  "ename": "SMITH",',
'  "job": "CLERK",',
'  "hiredate": "1980-12-17T08:00:00Z",',
'  "mgr": 7902,',
'  "sal": 800,',
'  "deptno": 20',
'}',
'</pre>'))
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00142
begin
wwv_flow_imp_page.create_page(
 p_id=>142.4852
,p_name=>unistr('Aide relative aux param\00E8tres')
,p_alias=>'PARAMETERS-HELP'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Aide relative aux param\00E8tres')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1238579473182356650.4852)
,p_plug_name=>'Help'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:20px;"'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Les param\00E8tres de gestionnaire de module sont utilis\00E9s pour transmettre des valeurs vers le gestionnaire de services et \00E0 partir de celui-ci. Les attributs d''un param\00E8tre sont les suivants : <br/>'),
'<br/>',
'<ul>',
unistr('<li><strong>Nom :</strong> nom du param\00E8tre, tel qu''il appara\00EEt dans le mod\00E8le d''URI ou l''en-t\00EAte HTTP. Utilis\00E9 pour mettre en correspondance les noms qui ne sont pas des noms de param\00E8tre SQL valides.</li>'),
unistr('<li><strong>Variable attach\00E9e :</strong> nom du param\00E8tre, tel qu''il sera r\00E9f\00E9renc\00E9 dans le code SQL. Si une valeur NULL est indiqu\00E9e, le param\00E8tre n''est pas li\00E9.</li>'),
unistr('<li><strong>Type de source :</strong> indique si le param\00E8tre provient du mod\00E8le d''URI ou de l''en-t\00EAte HTTP. Valeurs valides : <em>HEADER</em>, <em>RESPONSE</em>, <em>URI</em>.</li>'),
unistr('<li><strong>M\00E9thode d''acc\00E8s :</strong> indique si le param\00E8tre est une valeur d''entr\00E9e, une valeur de sortie ou les deux. Valeurs valides : <em>IN</em>, <em>OUT</em>, <em>INOUT</em>.</li>'),
unistr('<li><strong>Type de donn\00E9es :</strong> type de donn\00E9es natif du param\00E8tre. Valeurs valides : <em>STRING</em>, <em>INT</em>, <em>DOUBLE</em>, <em>BOOLEAN</em>, <em>LONG</em>, <em>TIMESTAMP</em>.</li> '),
'<ul>',
unistr('<li><strong>Remarque :</strong> il ne s''agit pas de types de donn\00E9es Oracle. <em>STRING</em> repr\00E9sente des cha\00EEnes de toute longueur. <em>INT</em>, <em>DOUBLE</em> et <em>LONG</em> repr\00E9sentent des valeurs num\00E9riques dont la pr\00E9cision varie. <em>BOO')
||unistr('LEAN</em> repr\00E9sente une valeur True ou False logique. </li>'),
'</ul>',
'<li><strong>Commentaires</strong> : texte en commentaire.</li>',
'',
'</ul>'))
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00150
begin
wwv_flow_imp_page.create_page(
 p_id=>150.4852
,p_name=>unistr('Privil\00E8ges')
,p_alias=>'PRIVILEGES'
,p_step_title=>unistr('Privil\00E8ges')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1131851655240154104.4852)
,p_plug_name=>unistr('Privil\00E8ges')
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with PRIVS as ',
'(select n001 id,',
'        c001 label,',
'        c002 name,',
'        c003 comments,',
'        c004 description,',
'        n005 schema_id, ',
'        c049 created_by,',
'        d001 created_on,',
'        c050 updated_by,',
'        d002 updated_on',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_PRIVILEGES''), ',
'SCHEMAS as ',
'(select n001 schema_id, ',
'        c001 parsing_schema',
'   from wwv_flow_collections ',
'  where collection_name = ''ORDS_SCHEMAS'')',
'select id,',
'       label,',
'       name,',
'       comments,',
'       description,',
'       case when s.parsing_schema = :P0_SCHEMA ',
'            then s.parsing_schema',
'            else ''ORDS''',
'       end as owner,',
'       created_by,',
'       created_on,',
'       updated_by,',
'       updated_on',
'  from privs p, ',
'       schemas s',
' where p.schema_id = s.schema_id (+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1131851802868154106.4852)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('Aucun privil\00E8ge n''est actuellement d\00E9fini pour le sch\00E9ma s\00E9lectionn\00E9.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'DOUG'
,p_internal_uid=>1131851802868154106
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395755754156398137.4852)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nom'
,p_column_link=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.:RP,160:P160_PRIVILEGE_ID,P0_SELECTED_NODE:#ID#,PP#ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395756115047398138.4852)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Cr\00E9ation par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395756538900398138.4852)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Cr\00E9ation le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395756953953398139.4852)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Mis \00E0 jour par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395757329765398140.4852)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Mis \00E0 jour le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395754993271398131.4852)
,p_db_column_name=>'ID'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(395755322848398136.4852)
,p_db_column_name=>'OWNER'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Propri\00E9taire')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(381676507070069441.4852)
,p_db_column_name=>'LABEL'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>unistr('Libell\00E9')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(381676694689069442.4852)
,p_db_column_name=>'COMMENTS'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Commentaires'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(381676780732069443.4852)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1136339945374460703.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3957577'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:LABEL:DESCRIPTION:OWNER:COMMENTS:CREATED_ON:UPDATED_ON:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(395758122953398151.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1131851655240154104.4852)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un privil\00E8ge')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.:RP,160::'
,p_icon_css_classes=>'icon-right-chevron'
);
end;
/
prompt --application/pages/page_00160
begin
wwv_flow_imp_page.create_page(
 p_id=>160.4852
,p_name=>unistr('D\00E9finition de privil\00E8ge')
,p_alias=>'PRIVILEGE-DEFINITION'
,p_step_title=>unistr('D\00E9finition de privil\00E8ge')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(381677034101069446.4852)
,p_plug_name=>unistr('Modules prot\00E9g\00E9s')
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P160_OWNER != :P0_SCHEMA'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_plug_name=>unistr('D\00E9finition de privil\00E8ge')
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding:a-Form--fixedLabels'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P160_OWNER != :P0_SCHEMA'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_plug_name=>unistr('Ressources prot\00E9g\00E9es')
,p_region_name=>'resources'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c002 pattern, ',
'       c003 guid',
'  from wwv_flow_collections',
' where COLLECTION_NAME = ''ORDS_PRIVILEGE_MAPPINGS''',
'   and n001 = :P160_PRIVILEGE_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P160_HANDLER_ID'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P160_OWNER != :P0_SCHEMA'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(54181888002062208.4852)
,p_name=>'GUID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GUID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(381677342199069449.4852)
,p_name=>'PATTERN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PATTERN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Mod\00E8le')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_width=>20
,p_is_required=>true
,p_max_length=>255
,p_enable_filter=>false
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Les mod\00E8les doivent respecter les r\00E8gles suivantes : '),
'<ul>',
'    <li>Commencer par une barre oblique (/)</li>',
unistr('    <li>Contenir uniquement des caract\00E8res alphanum\00E9riques, des barres obliques et des caract\00E8res g\00E9n\00E9riques (*)</li>'),
unistr('    <li>Ne pas contenir deux barres obliques cons\00E9cutives</li>'),
unistr('    <li>Possibilit\00E9 de se terminer par un caract\00E8re alphanum\00E9rique, une barre oblique ou un caract\00E8re g\00E9n\00E9rique (*)</li>'),
unistr('    <li>Lorsqu''ils se terminent par un caract\00E8re g\00E9n\00E9rique (*), ce dernier doit imm\00E9diatement \00EAtre pr\00E9c\00E9d\00E9 d''une barre oblique</li>'),
'</ul>'))
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(754959349340534395.4852)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(754959482734534396.4852)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(754958555902534387.4852)
,p_internal_uid=>754958555902534387
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>false
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_no_data_found_message=>unistr('Aucune ressource d\00E9finie')
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>500
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(754972509561557896.4852)
,p_interactive_grid_id=>wwv_flow_imp.id(754958555902534387.4852)
,p_static_id=>'11569'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(754972647096557896.4852)
,p_report_id=>wwv_flow_imp.id(754972509561557896.4852)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(395766226376639315.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE:PR-2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(395765029209639312.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_button_name=>'CREATE_PRIVILEGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un privil\00E8ge')
,p_button_position=>'CREATE'
,p_button_condition=>'P160_PRIVILEGE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(395765464381639315.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_button_name=>'UPDATE_PRIVILEGE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE2'
,p_button_condition=>':P160_PRIVILEGE_ID is not null and :P160_OWNER = :P0_SCHEMA'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(395765881363639315.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_button_name=>'DELETE_PRIVILEGE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P160_PRIVILEGE_ID is not null and :P160_OWNER = :P0_SCHEMA'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(396038619409226442.4852)
,p_branch_name=>'Branch to 150'
,p_branch_action=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE:PR-2&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(395765881363639315.4852)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(54182215451062212.4852)
,p_branch_name=>'Branch to 160'
,p_branch_action=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE_PRIVILEGE,UPDATE_PRIVILEGE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(381676824131069444.4852)
,p_name=>'P160_DESCRIPTION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_prompt=>'Description'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>76
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('D\00E9crit le privil\00E8ge de service RESTful.'),
'',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(381676947697069445.4852)
,p_name=>'P160_ROLES'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_prompt=>unistr('R\00F4les')
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 d, n001 r',
'  from wwv_flow_collections',
'where collection_name = ''ORDS_ROLES'''))
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Identifie les r\00F4les affect\00E9s \00E0 ce privil\00E8ge.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'MOVE')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(381677291558069448.4852)
,p_name=>'P160_MODULES'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(381677034101069446.4852)
,p_prompt=>'Modules'
,p_display_as=>'NATIVE_SHUTTLE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 d, n001 r',
'  from wwv_flow_collections',
' where collection_name = ''ORDS_MODULES'''))
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_controls', 'MOVE')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395766671285639327.4852)
,p_name=>'P160_PRIVILEGE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395767058056639330.4852)
,p_name=>'P160_PRIVILEGE_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_prompt=>'Nom'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Identifie le nom du privil\00E8ge de service RESTful.'),
'',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395768361178639334.4852)
,p_name=>'P160_LABEL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_prompt=>'Titre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Identifie le titre du privil\00E8ge de service RESTful.'),
'',
''))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395801133782090601.4852)
,p_name=>'P160_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_item_default=>':P0_SCHEMA'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>unistr('Propri\00E9taire')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(395801355469090603.4852)
,p_name=>'P160_COMMENTS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(753810267963637937.4852)
,p_prompt=>'Commentaires'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>76
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619049340062969839.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_validation_name=>'PATTERN Starts with slash'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_error_text  varchar2(32767);',
'    l_char        varchar2(32767);',
'BEGIN',
'-- Must start with /',
'    l_char := substr (:PATTERN, 1,1);',
'    if l_char != ''/'' then',
'',
'       l_error_text := ''PATTERN must start with a forward slash.'';',
'    end if;',
'--',
' return l_error_text;',
'',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_associated_column=>'PATTERN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619049442339969840.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_validation_name=>'PATTERN doens''t have double slash'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_error_text  varchar2(32767);',
'    l_number      number;',
'BEGIN',
'-- Must not have two slashes together',
'   l_number := instr(:PATTERN, ''//'');',
'   if l_number > 0 then',
'       l_error_text := ''PATTERN may not have two consecutive forward slashes.'';',
'   end if;',
'return l_error_text;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PATTERN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619049560081969841.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_validation_name=>'PATTERN Wildcard must be last character preceeded by slash'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_error_text  varchar2(32767);',
'    l_number      number;',
'    l_char        varchar2(1);',
'BEGIN',
'-- Wildcard must be the last character.',
'   l_number := instr(:PATTERN, ''*'');',
'   if l_number != 0 then',
'      if l_number != length(:PATTERN) then',
'         l_error_text :=  ''Wildcard character in PATTERN must only appear as the last character of the string.'';',
'      else ',
'         l_char := substr(:PATTERN, length(:PATTERN)-1, 1);',
'         if l_char != ''/'' then ',
'           l_error_text := ''Wildcard character at the end of PATTERN must be preceeded by a forward slash.'';',
'         end if;',
'     end if;',
'  end if;',
'return l_error_text;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PATTERN'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(619049753717969843.4852)
,p_tabular_form_region_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_validation_name=>'PATTERN limit values'
,p_validation_sequence=>40
,p_validation=>'PATTERN'
,p_validation2=>'^[a-zA-Z0-9/\*]*$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Le champ PATTERN peut uniquement contenir des caract\00E8res alphanum\00E9riques, des barres obliques et des caract\00E8res g\00E9n\00E9riques (*).')
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(396036693176218956.4852)
,p_name=>'Process Delete'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(395765881363639315.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(396037418507219011.4852)
,p_event_id=>wwv_flow_imp.id(396036693176218956.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.confirm(apex.lang.getMessage("RFS.DELETE_PRIVILEGE"),''DELETE_PRIVILEGE'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(395796072041932817.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch data from ORDS_PRIVILEGES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_label         varchar2(255);',
'    l_name          varchar2(255);',
'    l_comments      varchar2(4000);',
'    l_description   varchar2(4000);',
'    l_roles         varchar2(32767);',
'    l_modules       varchar2(32767);',
'    l_owner         varchar2(255);',
'    l_id            number;',
'BEGIN',
'-- Get the PRIVILEGE information from the collection',
'    SELECT ',
'       n001 id,',
'       c001 label,',
'       c002 name,',
'       c003 comments, ',
'       c004 description',
'    INTO ',
'       l_id,',
'       l_label,      ',
'       l_name,       ',
'       l_comments,   ',
'       l_description ',
'   FROM wwv_flow_collections ',
'  WHERE collection_name = ''ORDS_PRIVILEGES''',
'    AND (n001 = :P160_PRIVILEGE_ID',
'         OR',
'         c002 = :P160_PRIVILEGE_NAME);',
'    ',
'   ',
'-- Get the roles assigned to the privilege and prepare as colon delimted string',
'    l_roles := '''';',
'    FOR r in (select n002',
'                from wwv_flow_collections ',
'               where collection_name = ''ORDS_PRIVILEGE_ROLES''',
'                 and n001 = l_id)',
'    LOOP',
'        l_roles := l_roles ||r.n002||'':'';',
'    END LOOP;',
'    l_roles := rtrim(l_roles,'':'');',
'',
'-- Get the modules assigned to the privilege and prepare as colon delimted string',
'    l_modules := '''';',
'    FOR r in (select n002',
'                from wwv_flow_collections ',
'               where collection_name = ''ORDS_PRIVILEGE_MODULES''',
'                 and n001 = l_id)',
'    LOOP',
'        l_modules := l_modules ||r.n002||'':'';',
'    END LOOP;',
'    l_modules := rtrim(l_modules,'':'');',
'    ',
'-- Get the Owner',
'    with privs as ',
'    (select n005 schema_id',
'       from wwv_flow_collections',
'      where collection_name = ''ORDS_PRIVILEGES''',
'        and n001 = l_id), ',
'    SCHEMAS AS',
'    (select n001 id, ',
'            c001 parsing_schema',
'       from wwv_flow_collections ',
'      where collection_name = ''ORDS_SCHEMAS'')',
'    select nvl(parsing_schema, ''ORDS'')',
'      into l_owner',
'      from privs p, ',
'           schemas s',
'     where p.schema_id = s.id (+);',
'  ',
'-- Assign the values to the page items',
'    :P160_PRIVILEGE_ID   := l_id;',
'    :P160_PRIVILEGE_NAME := l_name;',
'    :P160_LABEL          := l_label;',
'    :P160_DESCRIPTION    := l_description;',
'    :P160_ROLES          := l_roles;',
'    :P160_MODULES        := l_modules;',
'    :P160_OWNER          := l_owner;',
'--',
'   :P0_SELECTED_NODE     := ''PP''||l_id;',
'',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P160_PRIVILEGE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>395796072041932817.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(396059992550270007.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create CHANGED_PATTERNS collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin ',
'wwv_flow_collection.create_or_truncate_collection(''CHANGED_PATTERNS'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>396059992550270007.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(395801267702090602.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(754958438006534386.4852)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Privileges - Save Interactive Grid Data'
,p_attribute_01=>'PLSQL_CODE'
,p_attribute_04=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_collection.add_member(p_collection_name => ''CHANGED_PATTERNS'',',
'                             p_c001            => :PATTERN,',
'                             p_c002            => :APEX$ROW_STATUS,',
'                             p_c003            => :GUID);',
'end;'))
,p_attribute_05=>'N'
,p_attribute_06=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>395801267702090602.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(406428517546062976.4852)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Changed Privilege'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_rest_ws.process_rest_ws_request(p_request=> :REQUEST, p_parse_as => :P0_SCHEMA);',
'  -- Set ID to -1 to force proper reload of data',
'  :P160_PRIVILEGE_ID := -1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>406428517546062976.4852
);
end;
/
prompt --application/pages/page_00170
begin
wwv_flow_imp_page.create_page(
 p_id=>170.4852
,p_name=>unistr('R\00F4les')
,p_alias=>'ROLES'
,p_step_title=>unistr('R\00F4les')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(736097002077755984.4852)
,p_plug_name=>unistr('R\00F4les')
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ROLES as ',
'(select n001 id,',
'        c001 name, ',
'        n005 schema_id,',
'        c049 created_by,',
'        d001 created_on,',
'        c050 updated_by,',
'        d002 updated_on',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_ROLES''), ',
'SCHEMAS as ',
'(select n001 schema_id, ',
'        c001 parsing_schema',
'   from wwv_flow_collections ',
'  where collection_name = ''ORDS_SCHEMAS'')',
'select id, ',
'       name,',
'       case when s.parsing_schema = :P0_SCHEMA ',
'            then s.parsing_schema',
'            else ''ORDS''',
'       end as owner,',
'       created_by,',
'       created_on,',
'       updated_by,',
'       updated_on',
'  from roles r, ',
'       schemas s',
' where r.schema_id = s.schema_id (+)'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(736097149705755986.4852)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>unistr('Aucun r\00F4le n''est actuellement d\00E9fini pour le sch\00E9ma s\00E9lectionn\00E9.')
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'DOUG'
,p_internal_uid=>736097149705755986
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(390793138040599557.4852)
,p_db_column_name=>'NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Nom'
,p_column_link=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180:P180_ROLE_ID,P0_SELECTED_NODE:#ID#,RR#ID#'
,p_column_linktext=>'#NAME#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(390796350491599562.4852)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>unistr('Cr\00E9ation par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(390796714171599563.4852)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>unistr('Cr\00E9ation le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(390797124570599563.4852)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>unistr('Mis \00E0 jour par')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(390797515537599563.4852)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>unistr('Mis \00E0 jour le')
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(381675133607069427.4852)
,p_db_column_name=>'ID'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(381675238531069428.4852)
,p_db_column_name=>'OWNER'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Propri\00E9taire')
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(740585292212062583.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3907979'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:OWNER:CREATED_ON:UPDATED_ON:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(390798364751599576.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(736097002077755984.4852)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un r\00F4le')
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180::'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(381675586267069431.4852)
,p_branch_name=>'CREATE_ROLE'
,p_branch_action=>'f?p=&APP_ID.:200:&SESSION.:CREATE_ROLE:&DEBUG.:RP:P200_NAVIGATE_TO:170'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
end;
/
prompt --application/pages/page_00180
begin
wwv_flow_imp_page.create_page(
 p_id=>180.4852
,p_name=>unistr('D\00E9finition de r\00F4le')
,p_alias=>'ROLE-DEFINITION'
,p_step_title=>unistr('D\00E9finition de r\00F4le')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_plug_name=>unistr('D\00E9finition de r\00F4le')
,p_region_name=>'ords_role_definition'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(390831701893828739.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP,180:P0_SELECTED_NODE:RO-1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(390831368388828733.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_button_name=>'CREATE_ROLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un r\00F4le')
,p_button_position=>'CREATE'
,p_button_condition=>'P180_ROLE_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(390832533652828740.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_button_name=>'UPDATE_ROLE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE2'
,p_button_condition=>':P180_ROLE_ID is not null and :P180_OWNER = :P0_SCHEMA'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(390832153252828739.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_button_name=>'DELETE_ROLE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P180_ROLE_ID is not null and :P180_OWNER = :P0_SCHEMA'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(381675694429069432.4852)
,p_branch_name=>'Branch to 170'
,p_branch_action=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:RP:P0_SELECTED_NODE:RO-1&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(381675313482069429.4852)
,p_name=>'P180_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_item_default=>'&P0_SCHEMA.'
,p_prompt=>unistr('Propri\00E9taire')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(390832983586828750.4852)
,p_name=>'P180_ROLE_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(390833353141828755.4852)
,p_name=>'P180_ROLE_NAME'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(740609943315287943.4852)
,p_prompt=>unistr('Nom de r\00F4le')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>90
,p_cMaxlength=>255
,p_read_only_when=>'P180_OWNER'
,p_read_only_when2=>'&P0_SCHEMA.'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(719737577300952641.4852)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(390970924476375252.4852)
,p_name=>'Process Delete'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(390832153252828739.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(390971842237375270.4852)
,p_event_id=>wwv_flow_imp.id(390970924476375252.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.confirm(apex.lang.getMessage(''RFS.DELETE_ROLE''),''DELETE_ROLE'');'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(390848132685848930.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch row from ORDS_ROLES Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    l_name        varchar2(4000);',
'    l_owner       varchar2(4000);',
'BEGIN',
'-- Get Role',
'   select ',
'       c001 name',
'  INTO ',
'       l_name',
'  from wwv_flow_collections ',
' where collection_name = ''ORDS_ROLES''',
'   and n001 = :P180_ROLE_ID;',
'',
'-- Get Owner',
'with roles as ',
'(select n005 schema_id',
'   from wwv_flow_collections',
'  where collection_name = ''ORDS_ROLES''',
'    and n001 = :P180_ROLE_ID), ',
'SCHEMAS AS',
'(select n001 id, ',
'        c001 parsing_schema',
'   from wwv_flow_collections ',
'  where collection_name = ''ORDS_SCHEMAS'')',
'select nvl(parsing_schema, ''ORDS'')',
'  into l_owner',
'  from roles r, ',
'       schemas s',
' where r.schema_id = s.id (+);',
'',
'-- Set Values   ',
'   :P180_ROLE_NAME     := l_name;',
'   :P180_OWNER         := l_owner;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P180_ROLE_ID'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_internal_uid=>390848132685848930.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(406429417843073826.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Changed Role'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'  wwv_flow_rest_ws.process_rest_ws_request(p_request=> :REQUEST, p_parse_as => :P0_SCHEMA);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>406429417843073826.4852
);
end;
/
prompt --application/pages/page_00190
begin
wwv_flow_imp_page.create_page(
 p_id=>190.4852
,p_name=>'Objets compatibles'
,p_alias=>'ENABLED_OBJECTS'
,p_step_title=>'Objets compatibles'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(243332078070719620.4852)
,p_plug_name=>'LEGEND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</br><div style="line-height:26px">',
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<strong>L\00E9gende :</strong>'),
unistr('&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span> Le nom d''objet et l''alias sont diff\00E9rents '),
'&nbsp;&nbsp;&nbsp;&nbsp;<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span> Le nom d''objet et l''alias sont identiques',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_plug_name=>'Objets compatibles'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c001 parsing_schema, ',
'       c002 parsing_object,',
'       c003 object_alias,',
'       case c004',
'            when ''TABLE'' then wwv_flow_lang.system_message(''WIZARD.FORM.TABLE'')',
'            when ''VIEW'' then wwv_flow_lang.system_message(''view_in_builder'')',
'            when ''PACKAGE'' then wwv_flow_lang.system_message(''WWV_FLOW_F4000_PLUGINS.CODE_COMPLETE.PACKAGE'')',
'            when ''PROCEDURE'' then wwv_flow_lang.system_message(''CA.PROCEDURE'')',
'            when ''FUNCTION'' then wwv_flow_lang.system_message(''CA.FUNCTION'')',
'            when ''MVIEW'' then wwv_flow_lang.system_message(''MATERIALIZED_VIEW'')',
'       end type,',
'       c005 status,',
'       c006 auto_rest_auth,',
'       n003 ops_allowed,',
'       c007 type_path,',
'       c008 pre_hook, ',
'      case  when upper(c002) = upper(c003) then ''<span class="a-Icon icon-status-failure" aria-hidden="true" style="background-color:#ec7a71;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'            else  ''<span class="a-Icon icon-status-success" aria-hidden="true" style="background-color:#60ccb5;color:#fff;border-radius:26px;width:26px;height:26px;padding:5px;"></span>''',
'      end aliased',
'from wwv_flow_collections ',
'where collection_name = ''ORDS_ENABLED_OBJECTS'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Objets compatibles'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(4402214405520520.4852)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_owner=>'COSTROWS'
,p_internal_uid=>4402214405520520
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402511102520523.4852)
,p_db_column_name=>'PARSING_SCHEMA'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>unistr('Sch\00E9ma d''analyse')
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402640331520524.4852)
,p_db_column_name=>'PARSING_OBJECT'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Objet en cours d''analyse'
,p_column_link=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.::P195_DB_OBJECT,P195_DB_OBJECT_ALIAS,P195_OBJECT_TYPE,P195_SCHEMA,P195_AUTH_REQUIRED,P195_HOLD:#PARSING_OBJECT#,#OBJECT_ALIAS#,#TYPE#,#PARSING_SCHEMA#,#AUTO_REST_AUTH#,#AUTO_REST_AUTH#'
,p_column_linktext=>'#PARSING_OBJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402737107520525.4852)
,p_db_column_name=>'OBJECT_ALIAS'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Alias d''objet'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402819347520526.4852)
,p_db_column_name=>'TYPE'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402945105520527.4852)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Statut'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4403009837520528.4852)
,p_db_column_name=>'AUTO_REST_AUTH'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Autorisation AutoREST'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4403188333520529.4852)
,p_db_column_name=>'OPS_ALLOWED'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>unistr('Op\00E9rations autoris\00E9es')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4403227710520530.4852)
,p_db_column_name=>'TYPE_PATH'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Chemin de type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4403356832520531.4852)
,p_db_column_name=>'PRE_HOOK'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>unistr('Point d''ancrage pr\00E9alable')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4403450108520532.4852)
,p_db_column_name=>'ALIASED'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Avec alias'
,p_allow_filtering=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1606130693443833.4852)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16062'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARSING_SCHEMA:PARSING_OBJECT:OBJECT_ALIAS:TYPE:STATUS:AUTO_REST_AUTH:OPS_ALLOWED:TYPE_PATH:PRE_HOOK:ALIASED'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1969709891446923.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_button_name=>'OBJECT_HELP'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719735277951947858.4852)
,p_button_image_alt=>unistr('Aide relative \00E0 l''objet compatible')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:191:&SESSION.::&DEBUG.:RP::'
,p_button_css_classes=>'a-Button--noUI'
,p_icon_css_classes=>'icon-help'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4400332604520501.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_button_name=>'CREATE_DEFAULT_REST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734932326947858.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er un objet AutoREST')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:RP,194:P194_SCHEMA:&P0_SCHEMA.'
,p_icon_css_classes=>'icon-right-chevron'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12408694425203644.4852)
,p_name=>'P190_SCHEMA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12408735514203645.4852)
,p_name=>'P190_OBJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12408820760203646.4852)
,p_name=>'P190_OBJECT_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12408926331203647.4852)
,p_name=>'P190_OBJECT_ALIAS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(732598982916206029.4852)
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_name=>'DELETE_ROW'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.delete-irrow'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12408490507203642.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>'Voulez-vous supprimer ce service REST ?'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12409289532203650.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'set_schema'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SCHEMA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).parent().data(''parsing_schema'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25403717120759301.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'set_object'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SCHEMA,P190_OBJECT'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).parent().data(''parsing_object'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25403896898759302.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'set_object_type'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SCHEMA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).parent().data(''type'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25403932196759303.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'set_object_alias'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SCHEMA'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).parent().data(''object_alias'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12408520416203643.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'REMOVE_REST'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WWV_FLOW_REST_WS.ENABLE_OBJECT(P_ENABLED => ''FALSE'', P_SCHEMA => :P190_SCHEMA, P_OBJECT => :P190_OBJECT, P_OBJECT_TYPE => :P190_OBJECT_TYPE, P_OBJECT_ALIAS => :P190_OBJECT_ALIAS,  P_AUTO_REST_AUTH => ''FALSE'');',
''))
,p_attribute_02=>'P190_SCHEMA'
,p_attribute_03=>'P190_SCHEMA'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25404086450759304.4852)
,p_event_id=>wwv_flow_imp.id(12408396014203641.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'REFRESH_PAGE'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(732598982916206029.4852)
);
end;
/
prompt --application/pages/page_00191
begin
wwv_flow_imp_page.create_page(
 p_id=>191.4852
,p_name=>'Aide relative aux objets compatibles'
,p_alias=>'ENABLED-OBJECTS-HELP'
,p_page_mode=>'MODAL'
,p_step_title=>'Aide relative aux objets compatibles'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(538579044595390057)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(621014881928408304.4852)
,p_plug_name=>'Help'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:20px;"'
,p_plug_template=>wwv_flow_imp.id(388770208095784265.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Cette page r\00E9pertorie les objets de base de donn\00E9es (comme les tables, les vues, les packages, etc.) ayant \00E9t\00E9 automatiquement rendus compatibles REST via SQL Workshop, SQL Developer ou l''API <strong>ORDS.ENABLE_OBJECT</strong> API.<br/> '),
'<br/>',
unistr('La colonne avec un alias associ\00E9 \00E0 une couleur et la l\00E9gende sous l''\00E9tat permettent de voir en un coup d''oeil si l''alias et le nom de l''objet sont diff\00E9rents. Pour des raisons de s\00E9curit\00E9, il est toujours conseill\00E9 de fournir un alias diff\00E9rent du no')
||'m d''objet. </br>',
'</br>',
unistr('Pour plus d''informations sur AutoREST, reportez-vous \00E0 la section sur l''activation automatique d''objets de sch\00E9ma pour l''acc\00E8s REST du guide d''installation, de configuration et de d\00E9veloppement de REST Data Services.')))
,p_translate_title=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00192
begin
wwv_flow_imp_page.create_page(
 p_id=>192.4852
,p_name=>unistr('Activer REST pour l''objet de base de donn\00E9es')
,p_alias=>'REST-ENABLE-DB-OBJECT'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Activer REST pour l''objet de base de donn\00E9es')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
end;
/
prompt --application/pages/page_00193
begin
wwv_flow_imp_page.create_page(
 p_id=>193.4852
,p_name=>unistr('D\00E9sactiver REST pour l''objet de base de donn\00E9es')
,p_alias=>'REST-DISABLE-DB-OBJECT'
,p_page_mode=>'MODAL'
,p_step_title=>unistr('D\00E9sactiver REST pour l''objet de base de donn\00E9es')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
end;
/
prompt --application/pages/page_00194
begin
wwv_flow_imp_page.create_page(
 p_id=>194.4852
,p_name=>'Activer AutoREST pour l''objet'
,p_alias=>'AUTOREST-ENABLE'
,p_step_title=>'Activer AutoREST pour l''objet'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_plug_name=>'Activer AutoREST pour l''objet'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1645917154218454.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1645540290218454.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_button_name=>'Apply_REST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Cr\00E9er')
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1660471531405402.4852)
,p_branch_name=>'Branch_to_190'
,p_branch_action=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.::P0_SELECTED_NODE:OB0&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1625396414048250.4852)
,p_name=>'P194_OBJECT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_item_default=>'TABLE'
,p_prompt=>'Type d''objet'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'REST_OBJECT_TYPES'
,p_lov=>'.'||wwv_flow_imp.id(1608252484457866)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('S\00E9lectionnez le type d''objet de base de donn\00E9es pour lequel activer AutoREST :')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1626948047052871.4852)
,p_name=>'P194_DB_OBJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_prompt=>'Objet'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name d, object_name r from sys.dba_objects ',
'where owner = (select wwv_flow_user_api.get_default_schema from sys.dual) ',
'and object_type = :P194_OBJECT_TYPE',
'order by object_name'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>unistr('- S\00E9lectionner -')
,p_lov_cascade_parent_items=>'P194_OBJECT_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('S\00E9lectionnez l''objet pour lequel activer AutoREST.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1627759733055176.4852)
,p_name=>'P194_DB_OBJECT_ALIAS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_use_cache_before_default=>'NO'
,p_item_default=>'P194_DB_OBJECT'
,p_item_default_type=>'ITEM'
,p_prompt=>'Alias d''objet'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Saisissez l''alias \00E0 utiliser pour l''objet s\00E9lectionn\00E9. Il remplacera le nom d''objet dans l''URL AutoREST. L''alias par d\00E9faut est le nom d''objet. Pour des raisons de s\00E9curit\00E9, il est toujours conseill\00E9 de fournir un alias diff\00E9rent du nom d''objet sous-')
||'jacent.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1628550968057415.4852)
,p_name=>'P194_AUTH_REQUIRED'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_item_default=>'DISABLED'
,p_prompt=>'Autorisation obligatoire'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'AUTH_YN'
,p_lov=>'.'||wwv_flow_imp.id(1603815196424841)||'.'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_css_classes=>'apex-button-group'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Indique si les utilisateurs externes tentant d''acc\00E9der \00E0 l''objet compatible AutoREST doivent disposer du r\00F4le associ\00E9. Le nom du r\00F4le est affich\00E9 si l''option Autorisation obligatoire est d\00E9finie sur <strong>Oui</strong>.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1629342284059808.4852)
,p_name=>'P194_AUTH_ROLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_use_cache_before_default=>'NO'
,p_item_default=>'null'
,p_prompt=>unistr('R\00F4le d''autorisation')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>unistr('R\00F4le d''autorisation ORDS requis pour acc\00E9der \00E0 l''objet enti\00E8rement compatible REST.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1630170403061357.4852)
,p_name=>'P194_SCHEMA'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1630461330063824.4852)
,p_name=>'P194_ERROR_TEXT'
,p_item_sequence=>90
,p_use_cache_before_default=>'NO'
,p_item_default=>'P194_DB_OBJECT'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('R\00F4le d''autorisation ORDS requis pour acc\00E9der \00E0 l''objet enti\00E8rement compatible REST.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(176007678850486201.4852)
,p_name=>'P194_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1617615511544329.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>unistr('URL compl\00E8te')
,p_post_element_text=>'<button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--small" onclick="void(0);" aria-label="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD_ARIA." type="button"  title="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD." data-clipboard-source="#P194_URL" styl'
||'e="margin-left:5px;"><span class="a-Icon icon-copy" aria-hidden="true"></span></button>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1632693595071795.4852)
,p_validation_name=>'Check for ASCII'
,p_validation_sequence=>10
,p_validation=>'P194_DB_OBJECT_ALIAS'
,p_validation_type=>'ITEM_IS_ALPHANUMERIC'
,p_error_message=>unistr('L''alias d''objet ne peut contenir que des caract\00E8res alphanum\00E9riques ASCII')
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1632906661072884.4852)
,p_validation_name=>'Object Alias Not NULL'
,p_validation_sequence=>20
,p_validation=>'P194_DB_OBJECT_ALIAS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# ne peut pas \00EAtre NULL')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(1645540290218454.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(176009147092486216.4852)
,p_validation_name=>'DB Object Not NULL'
,p_validation_sequence=>30
,p_validation=>'P194_DB_OBJECT'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('#LABEL# ne peut pas \00EAtre NULL')
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(1645540290218454.4852)
,p_associated_item=>wwv_flow_imp.id(1626948047052871.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1633253991074301.4852)
,p_validation_name=>'Check Unique Alias'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if wwv_flow_dynamic_exec.do_rows_exist (',
'        p_sql_statement   => ''Select * from ords_metadata.user_ords_enabled_objects where object_alias = :P194_DB_OBJECT_ALIAS'',',
'        p_parse_as_schema => :P0_SCHEMA ) then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Le champ #LABEL# doit \00EAtre unique')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_imp.id(1627759733055176.4852)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_name=>'CHANGE_DB_OBJECT'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P194_DB_OBJECT'
,p_condition_element=>'P194_DB_OBJECT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176009555195486220.4852)
,p_event_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'HIDE_REST_OF_PAGE'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_DB_OBJECT_ALIAS,P194_AUTH_ROLE,P194_AUTH_REQUIRED,P194_URL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1631560449066261.4852)
,p_event_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'SET_OBJECT_ALIAS'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_DB_OBJECT_ALIAS'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'apex.item( "P194_DB_OBJECT" ).getValue().toLowerCase()'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1632032389066261.4852)
,p_event_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'SET_AUTH_ROLE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_AUTH_ROLE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P194_AUTH_ROLE").value = ''oracle.dbtools.role.autorest.''+$v( "P194_SCHEMA" ) +''.''+$v( "P194_DB_OBJECT" );'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008907259486214.4852)
,p_event_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'SET_URL'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_URL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P194_URL").value = ''&G_APEX_PATH.'' + ''&G_SCHEMA_ALIAS.'' + ''/'' + $v( "P194_DB_OBJECT_ALIAS" ) + ''/'';'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176009427215486219.4852)
,p_event_id=>wwv_flow_imp.id(1631185770066260.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_name=>'SHOW_REST_OF_PAGE'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_DB_OBJECT_ALIAS,P194_AUTH_REQUIRED,P194_URL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1617785201544330.4852)
,p_name=>'CHANGE_AUTH_REQUIRED'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P194_AUTH_REQUIRED'
,p_condition_element=>'P194_AUTH_REQUIRED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ENABLED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1617850109544331.4852)
,p_event_id=>wwv_flow_imp.id(1617785201544330.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SHOW_THE_AUTH_ROLE'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_AUTH_ROLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1660540345405403.4852)
,p_event_id=>wwv_flow_imp.id(1617785201544330.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'HIDE_THE_AUTH_ROLE'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_AUTH_ROLE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176007710335486202.4852)
,p_name=>'Change_Alias'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P194_DB_OBJECT_ALIAS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176007819760486203.4852)
,p_event_id=>wwv_flow_imp.id(176007710335486202.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_URL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P194_URL").value = ''&G_APEX_PATH.'' + ''&G_SCHEMA_ALIAS.'' + ''/'' + $v( "P194_DB_OBJECT_ALIAS" ) + ''/'';'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176007968792486204.4852)
,p_name=>'SET_URL_ON_PAGE_LOAD'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008008118486205.4852)
,p_event_id=>wwv_flow_imp.id(176007968792486204.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SET_URL_VALUE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_URL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P194_URL").value = ''&G_APEX_PATH.'' + ''&G_SCHEMA_ALIAS.'' + ''/'' + $v( "P194_DB_OBJECT_ALIAS" ) + ''/'';'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176009249980486217.4852)
,p_name=>'SET_AUTH_ON_PAGE_LOAD'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176009381957486218.4852)
,p_event_id=>wwv_flow_imp.id(176009249980486217.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SET_AUTH_REQ_VALUE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_AUTH_REQUIRED'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'DISABLED'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176008119243486206.4852)
,p_name=>'Show_URL'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(1645540290218454.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008377682486208.4852)
,p_event_id=>wwv_flow_imp.id(176008119243486206.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_01=>'Apply_REST'
,p_attribute_02=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008241468486207.4852)
,p_event_id=>wwv_flow_imp.id(176008119243486206.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P194_URL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1660323077405401.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Commit_To_DB'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'if :P194_AUTH_REQUIRED = ''ENABLED'' then',
'    :P194_AUTH_REQUIRED := ''TRUE'';',
'else',
'    :P194_AUTH_REQUIRED := ''FALSE'';',
'end if;',
'',
'WWV_FLOW_REST_WS.ENABLE_OBJECT(',
'    P_ENABLED => ''TRUE'',',
'    P_SCHEMA => upper(:P0_SCHEMA),',
'    P_OBJECT => :P194_DB_OBJECT,',
'    P_OBJECT_TYPE => upper(:P194_OBJECT_TYPE),',
'    P_OBJECT_ALIAS => :P194_DB_OBJECT_ALIAS,',
'    P_AUTO_REST_AUTH => :P194_AUTH_REQUIRED',
'  );',
'  ',
'EXCEPTION WHEN OTHERS THEN ',
'    if SQLCODE = -20003 then ',
'        htmldb_util.set_session_state(''P194_ERROR_TEXT'' , wwv_flow_lang.system_message(''SQL_WS.OB.INVALID_ALIAS''));',
'    elsif SQLCODE = -20006 then ',
'        htmldb_util.set_session_state(''P194_ERROR_TEXT'' , wwv_flow_lang.system_message(''SQL_WS.OB.DUPLICATE_ALIAS''));',
'    else ',
'        htmldb_util.set_session_state(''P194_ERROR_TEXT'' , SQLERRM) ;',
'    end if;',
'    raise;',
' ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1645540290218454.4852)
,p_process_success_message=>unistr('D\00E9finition AutoREST cr\00E9\00E9e')
,p_internal_uid=>1660323077405401.4852
);
end;
/
prompt --application/pages/page_00195
begin
wwv_flow_imp_page.create_page(
 p_id=>195.4852
,p_name=>unistr('Modifier la d\00E9finition de l''objet compatible')
,p_alias=>'EDIT-ENABLED-OBJECT-DEFINITION'
,p_step_title=>unistr('Modifier la d\00E9finition de l''objet compatible')
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(344911404961486242)
,p_step_template=>wwv_flow_imp.id(754939123056928433.4852)
,p_page_template_options=>'#DEFAULT#'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_plug_name=>unistr('Modifier la d\00E9finition de l''objet compatible')
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1687681372052575.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_button_name=>'Cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1687203434052574.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_button_name=>'Apply_REST'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Appliquer les modifications'
,p_button_position=>'CREATE'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1619035862544343.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_button_name=>'Delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Supprimer'
,p_button_position=>'DELETE'
,p_confirm_message=>unistr('Voulez-vous supprimer cette d\00E9finition d''objet de base de donn\00E9es AutoREST ?')
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1694761291052589.4852)
,p_branch_name=>'Branch_to_190'
,p_branch_action=>'f?p=&APP_ID.:190:&SESSION.::&DEBUG.::P0_SELECTED_NODE:OB0&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1618827280544341.4852)
,p_name=>'P195_HOLD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_use_cache_before_default=>'NO'
,p_item_default=>'null'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1682489197052568.4852)
,p_name=>'P195_OBJECT_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_item_default=>'TABLE'
,p_prompt=>'Type d''objet'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'REST_OBJECT_TYPES'
,p_lov=>'.'||wwv_flow_imp.id(1608252484457866)||'.'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Type d''objet de base de donn\00E9es \00E0 modifier.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1683377411052570.4852)
,p_name=>'P195_DB_OBJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_item_default=>'<select>'
,p_prompt=>'Objet'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name d, object_name r from sys.dba_objects ',
'where owner = (select wwv_flow_user_api.get_default_schema from sys.dual) ',
'and object_type = :P195_OBJECT_TYPE'))
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Objet \00E0 modifier.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1684204170052571.4852)
,p_name=>'P195_DB_OBJECT_ALIAS'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alias d''objet'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Saisissez l''alias \00E0 utiliser pour l''objet s\00E9lectionn\00E9. Il remplacera le nom d''objet dans l''URL AutoREST. L''alias par d\00E9faut est le nom d''objet. Pour des raisons de s\00E9curit\00E9, il est toujours conseill\00E9 de fournir un alias diff\00E9rent du nom d''objet sous-')
||'jacent.'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'send_on_page_submit', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1685108203052571.4852)
,p_name=>'P195_AUTH_REQUIRED'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_prompt=>'Autorisation obligatoire'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'AUTH_YN'
,p_lov=>'.'||wwv_flow_imp.id(1603815196424841)||'.'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_css_classes=>'apex-button-group'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Indique si les utilisateurs externes tentant d''acc\00E9der \00E0 l''objet compatible AutoREST doivent disposer du r\00F4le associ\00E9. Le nom du r\00F4le est affich\00E9 si l''option Autorisation obligatoire est d\00E9finie sur <strong>Oui</strong>.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1686022565052572.4852)
,p_name=>'P195_AUTH_ROLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_use_cache_before_default=>'NO'
,p_item_default=>'null'
,p_prompt=>unistr('R\00F4le d''autorisation')
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_help_text=>unistr('R\00F4le d''autorisation ORDS requis pour acc\00E9der \00E0 l''objet enti\00E8rement compatible REST.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1688024845052584.4852)
,p_name=>'P195_SCHEMA'
,p_item_sequence=>70
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1688477630052584.4852)
,p_name=>'P195_ERROR_TEXT'
,p_item_sequence=>90
,p_use_cache_before_default=>'NO'
,p_item_default=>'P195_DB_OBJECT'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_help_text=>unistr('R\00F4le d''autorisation ORDS requis pour acc\00E9der \00E0 l''objet enti\00E8rement compatible REST.')
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(176008440964486209.4852)
,p_name=>'P195_URL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(3299453450596877.4852)
,p_use_cache_before_default=>'NO'
,p_item_default=>'null'
,p_prompt=>unistr('URL compl\00E8te')
,p_post_element_text=>'<button class="a-Button a-Button--noLabel a-Button--withIcon a-Button--small" onclick="void(0);" aria-label="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD_ARIA." type="button"  title="&APP_TEXT$REST_WS_COPY_TO_CLIPBOARD." data-clipboard-source="#P195_URL" styl'
||'e="margin-left:5px;"><span class="a-Icon icon-copy" aria-hidden="true"></span></button>'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(719737377976952639.4852)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'N',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(1689477297052585.4852)
,p_validation_name=>'Check for ASCII'
,p_validation_sequence=>10
,p_validation=>'P195_DB_OBJECT_ALIAS'
,p_validation_type=>'ITEM_IS_ALPHANUMERIC'
,p_error_message=>unistr('L''alias d''objet ne peut contenir que des caract\00E8res alphanum\00E9riques ASCII')
,p_always_execute=>'Y'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1693254974052588.4852)
,p_name=>'Set2Yes'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P195_AUTH_REQUIRED'
,p_condition_element=>'P195_AUTH_REQUIRED'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'ENABLED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1693732104052588.4852)
,p_event_id=>wwv_flow_imp.id(1693254974052588.4852)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'HIDE_AUTH_ROLE'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_ROLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1694273041052589.4852)
,p_event_id=>wwv_flow_imp.id(1693254974052588.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SHOW_AUTH_ROLE'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_ROLE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1618372815544336.4852)
,p_name=>'SetAuthRequired'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1618484665544337.4852)
,p_event_id=>wwv_flow_imp.id(1618372815544336.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SET_AUTH_TRUE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_REQUIRED'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'ENABLED'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P195_AUTH_REQUIRED'
,p_client_condition_expression=>'ENABLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1618576578544338.4852)
,p_event_id=>wwv_flow_imp.id(1618372815544336.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_name=>'SET_AUTH_FALSE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_REQUIRED'
,p_attribute_01=>'STATIC_ASSIGNMENT'
,p_attribute_02=>'DISABLED'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P195_AUTH_REQUIRED'
,p_client_condition_expression=>'ENABLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176009000665486215.4852)
,p_event_id=>wwv_flow_imp.id(1618372815544336.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_name=>'SET_AUTH_FALSE_HIDE_ROLE'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_ROLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P195_AUTH_REQUIRED'
,p_client_condition_expression=>'ENABLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1618944473544342.4852)
,p_event_id=>wwv_flow_imp.id(1618372815544336.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_name=>'SET_ROLE_VALUE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_AUTH_ROLE'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P195_AUTH_ROLE").value = ''oracle.dbtools.role.autorest.''+$v( "P195_SCHEMA" ) +''.''+$v( "P195_DB_OBJECT" );'
,p_attribute_09=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176008550736486210.4852)
,p_name=>'SET_URL'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008612449486211.4852)
,p_event_id=>wwv_flow_imp.id(176008550736486210.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'SET_URL_VALUE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_URL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P195_URL").value = ''&G_APEX_PATH.'' + ''&G_SCHEMA_ALIAS.'' + ''/'' + $v( "P195_DB_OBJECT_ALIAS" ) + ''/'';'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(176008720489486212.4852)
,p_name=>'Change_Alias'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P195_DB_OBJECT_ALIAS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(176008893952486213.4852)
,p_event_id=>wwv_flow_imp.id(176008720489486212.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SET_URL_ON_CHANGE'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P195_URL'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'document.getElementById("P195_URL").value = ''&G_APEX_PATH.'' + ''&G_SCHEMA_ALIAS.'' + ''/'' + $v( "P195_DB_OBJECT_ALIAS" ) + ''/'';'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1619188215544344.4852)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'REMOVE_AUTOREST_SERVICE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P195_AUTH_REQUIRED = ''ENABLED'' then',
'    :P195_AUTH_REQUIRED := ''TRUE'';',
'else',
'    :P195_AUTH_REQUIRED := ''FALSE'';',
'end if;',
'',
'WWV_FLOW_REST_WS.ENABLE_OBJECT(',
'    P_ENABLED => ''FALSE'',',
'    P_SCHEMA => :P0_SCHEMA,',
'    P_OBJECT => :P195_DB_OBJECT,',
'    P_OBJECT_TYPE => upper(:P195_OBJECT_TYPE),',
'    P_OBJECT_ALIAS => :P195_DB_OBJECT_ALIAS,',
'    P_AUTO_REST_AUTH => :P195_AUTH_REQUIRED',
'  );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1619035862544343.4852)
,p_process_success_message=>unistr('D\00E9finition AutoREST supprim\00E9e')
,p_internal_uid=>1619188215544344.4852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1690594479052586.4852)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Commit_To_DB'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
'',
'',
'if :P195_AUTH_REQUIRED = ''ENABLED'' then',
'    :P195_AUTH_REQUIRED := ''TRUE'';',
'else',
'    :P195_AUTH_REQUIRED := ''FALSE'';',
'end if;',
'',
'WWV_FLOW_REST_WS.ENABLE_OBJECT(',
'    P_ENABLED => ''TRUE'',',
'    P_SCHEMA => upper(:P0_SCHEMA),',
'    P_OBJECT => :P195_DB_OBJECT,',
'    P_OBJECT_TYPE => upper(:P195_OBJECT_TYPE),',
'    P_OBJECT_ALIAS => :P195_DB_OBJECT_ALIAS,',
'    P_AUTO_REST_AUTH => :P195_AUTH_REQUIRED',
'  );',
'  ',
'EXCEPTION WHEN OTHERS THEN ',
'    if SQLCODE = -20003 then ',
'        htmldb_util.set_session_state(''P195_ERROR_TEXT'' , wwv_flow_lang.system_message(''SQL_WS.OB.INVALID_ALIAS''));',
'    elsif SQLCODE = -20006 then ',
'        htmldb_util.set_session_state(''P195_ERROR_TEXT'' , wwv_flow_lang.system_message(''SQL_WS.OB.DUPLICATE_ALIAS''));',
'        WWV_FLOW_REST_WS.ENABLE_OBJECT(',
'            P_ENABLED => ''FALSE'',',
'            P_SCHEMA => :P0_SCHEMA,',
'            P_OBJECT => :P195_DB_OBJECT,',
'            P_OBJECT_TYPE => upper(:P195_OBJECT_TYPE),',
'            P_OBJECT_ALIAS => :P195_DB_OBJECT_ALIAS,',
'            P_AUTO_REST_AUTH => :P195_AUTH_REQUIRED',
'        );',
'    else ',
'        htmldb_util.set_session_state(''P195_ERROR_TEXT'' , SQLERRM) ;',
'    end if;',
'    raise;',
' ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(1687203434052574.4852)
,p_process_success_message=>unistr('D\00E9finition AutoREST mise \00E0 jour')
,p_internal_uid=>1690594479052586.4852
);
end;
/
prompt --application/pages/page_00201
begin
wwv_flow_imp_page.create_page(
 p_id=>201.4852
,p_name=>'Etape 1'
,p_alias=>'STEP-1'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 1'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39412993965426767.4852)
,p_plug_name=>'Etape 1'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39413305811426768.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39412993965426767.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39413665614426768.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39412993965426767.4852)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39415271831426771.4852)
,p_branch_action=>'f?p=&APP_ID.:202:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39413665614426768.4852)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39413766738426768.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39413305811426768.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39414512683426770.4852)
,p_event_id=>wwv_flow_imp.id(39413766738426768.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
end;
/
prompt --application/pages/page_00202
begin
wwv_flow_imp_page.create_page(
 p_id=>202.4852
,p_name=>'Etape 2'
,p_alias=>'STEP-2'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 2'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39416202615426771.4852)
,p_plug_name=>'Etape 2'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39416602622426772.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39416202615426771.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39416874856426772.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39416202615426771.4852)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Pr\00E9c\00E9dent')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39416903774426772.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39416202615426771.4852)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39419236214426773.4852)
,p_branch_action=>'f?p=&APP_ID.:203:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39416903774426772.4852)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39418578043426773.4852)
,p_branch_action=>'f?p=&APP_ID.:201:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39416874856426772.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39417049166426772.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39416602622426772.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39417865297426772.4852)
,p_event_id=>wwv_flow_imp.id(39417049166426772.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
end;
/
prompt --application/pages/page_00203
begin
wwv_flow_imp_page.create_page(
 p_id=>203.4852
,p_name=>'Etape 3'
,p_alias=>'STEP-3'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 3'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39420254750426774.4852)
,p_plug_name=>'Etape 3'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39420673885426774.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39420254750426774.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39420843054426774.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39420254750426774.4852)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Pr\00E9c\00E9dent')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39420913418426774.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39420254750426774.4852)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39423225541426776.4852)
,p_branch_action=>'f?p=&APP_ID.:204:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39420913418426774.4852)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39422544662426775.4852)
,p_branch_action=>'f?p=&APP_ID.:202:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39420843054426774.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39421052657426774.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39420673885426774.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39421877559426775.4852)
,p_event_id=>wwv_flow_imp.id(39421052657426774.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
end;
/
prompt --application/pages/page_00204
begin
wwv_flow_imp_page.create_page(
 p_id=>204.4852
,p_name=>'Etape 4'
,p_alias=>'STEP-4'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 4'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39424227891426776.4852)
,p_plug_name=>'Etape 4'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39424646860426777.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39424227891426776.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39424871278426777.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39424227891426776.4852)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Pr\00E9c\00E9dent')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39424929330426777.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39424227891426776.4852)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39427262517426778.4852)
,p_branch_action=>'f?p=&APP_ID.:205:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39424929330426777.4852)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39426517116426778.4852)
,p_branch_action=>'f?p=&APP_ID.:203:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39424871278426777.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39425086689426777.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39424646860426777.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39425824245426777.4852)
,p_event_id=>wwv_flow_imp.id(39425086689426777.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
end;
/
prompt --application/pages/page_00205
begin
wwv_flow_imp_page.create_page(
 p_id=>205.4852
,p_name=>'Etape 5'
,p_alias=>'STEP-5'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 5'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39428255828426779.4852)
,p_plug_name=>'Etape 5'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39428606587426779.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39428255828426779.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39428856108426779.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39428255828426779.4852)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Pr\00E9c\00E9dent')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39428991853426779.4852)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(39428255828426779.4852)
,p_button_name=>'NEXT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Suivant'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39431242110426781.4852)
,p_branch_action=>'f?p=&APP_ID.:206:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39428991853426779.4852)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39430530185426780.4852)
,p_branch_action=>'f?p=&APP_ID.:204:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39428856108426779.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39429037880426779.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39428606587426779.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39429862599426780.4852)
,p_event_id=>wwv_flow_imp.id(39429037880426779.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
end;
/
prompt --application/pages/page_00206
begin
wwv_flow_imp_page.create_page(
 p_id=>206.4852
,p_name=>'Etape 6'
,p_alias=>'STEP-6'
,p_page_mode=>'MODAL'
,p_step_title=>'Etape 6'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(39432245855426781.4852)
,p_plug_name=>'Etape 6'
,p_region_template_options=>'#DEFAULT#:a-Region--noPadding'
,p_plug_template=>wwv_flow_imp.id(719706437830942782.4852)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39432607199426782.4852)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(39432245855426781.4852)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>'Annuler'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39432894103426782.4852)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(39432245855426781.4852)
,p_button_name=>'PREVIOUS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_image_alt=>unistr('Pr\00E9c\00E9dent')
,p_button_position=>'TOP'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(39432718560426782.4852)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(39432245855426781.4852)
,p_button_name=>'FINISH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(719734705014947853.4852)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Terminer'
,p_button_position=>'TOP'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(39434560821426783.4852)
,p_branch_action=>'f?p=&APP_ID.:205:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_VALIDATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(39432894103426782.4852)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(39433042698426782.4852)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(39432607199426782.4852)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(39433888620426782.4852)
,p_event_id=>wwv_flow_imp.id(39433042698426782.4852)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(39435340919426783.4852)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>39435340919426783.4852
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
