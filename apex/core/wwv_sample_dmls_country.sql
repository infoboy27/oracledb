Rem  Copyright (c) 2020, 2023, Oracle and/or its affiliates.
Rem
Rem    NAME
Rem      wwv_sample_dmls_country.sql
Rem
Rem    DESCRIPTION
Rem      Insert Sample datasets during APEX installation
Rem
Rem    IMPORTANT: If DML lengh > 4000, DML cannot exceed 255 chars per line.
Rem               When DML > 4000, install uses varchar2 255 array to execute DDL.
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem    dpeake       01/10/2020 - Created

set define '^'
prompt ...Oracle APEX Sample installation of datasets

prompt
prompt ...insert into wwv_sample_dmls - Country
prompt

declare
  l_clob clob;
begin
    -- Insert into JSON Table
    delete from wwv_sample_json
    where wwv_sample_dataset_id = 6;

    -- English JSON
    l_clob :=q'~{
"application": {
  "name": "Demonstration - Countries",
  "appShortDescription": "Generated based on a Sample Dataset!",
  "appDescription": "This application was generated directly from Sample Datasets. Go to SQL Workshop, Utilities, Sample Datasets to install tables and then create an application based on those tables.",
  "features": {
    "progressiveWebApp": true,
    "pushNotifications": true,
    "accessControl": true,
    "activityReporting": true,
    "configurationOptions": true,
    "feedback": true,
    "helpPages": true,
    "themeSelection": true
    },
  "appearance": {
    "themeStyle": "Vista",
    "navigation": "MEGA",
    "icon": "app-icon-shield",
    "iconBackgroundClass": "app-color-8",
    "iconColorHEX": "#6E8598"
    },
  "settings": {
    "baseTablePrefix": "EBA_",
    "primaryLanguage": "en",
    "authentication": "Oracle APEX"
    },
  "pages": [
    {
      "page": "1",
      "pageType": "blank",
      "pageName": "Home",
      "pageIcon": "fa-home",
      "pageIsHomePage": true,
      "help": ""
    }
    ,
    {
      "page": "2",
      "pageType": "dashboard",
      "pageName": "Dashboard",
      "pageIcon": "fa-dashboard",
      "help": "",
      "dashboardWidgets": [
      {
        "name": "Regions",
        "type": "pie",
        "table": "EBA_COUNTRIES_V",
        "labelColumn": "REGION",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ,
      {
        "name": "Organization Regions",
        "type": "pie",
        "table": "EBA_COUNTRIES_V",
        "labelColumn": "ORGNAIZATION_REGION",
        "valueColumn": "allColumns",
        "valueDerivation": "count"
      }
      ]
    }
    ,
    {
      "page": "3",
      "pageType": "facetedSearch",
      "pageName": "Countries Search",
      "pageIcon": "fa-table-search",
      "fsReportType": "CR",
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRIES",
      "includeFormWithReport": false,
      "table": "EBA_COUNTRIES",
      "titleColumn": "",
      "descriptionColumn": "",
      "additionalTextColumn": "",
      "facetColumns": "POPULATION,AREA_KM2,REGION_ID,ORGANIZATION_REGION_ID",
      "help": ""
    }
    ,
    {
      "page": "4",
      "pageType": "interactiveReport",
      "pageName": "Countries Report",
      "pageIcon": "fa-table",
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRIES",
      "includeFormWithReport": true,
      "foreignKeyRelationships": [
        {
          "foreignKeyColumn": "INTERMEDIATE_REGION_ID",
          "detailTable": "EBA_COUNTRY_INTERMEDIATES",
          "detailTableKeyColumn": "ID",
          "detailTableDisplayColumn": "NAME"
        }
        ,
        {
          "foreignKeyColumn": "ORGANIZATION_REGION_ID",
          "detailTable": "EBA_COUNTRY_ORGANIZATIONS",
          "detailTableKeyColumn": "ID",
          "detailTableDisplayColumn": "NAME"
        }
        ,
        {
          "foreignKeyColumn": "REGION_ID",
          "detailTable": "EBA_COUNTRY_REGIONS",
          "detailTableKeyColumn": "ID",
          "detailTableDisplayColumn": "NAME"
        }
        ,
        {
          "foreignKeyColumn": "SUB_REGION_ID",
          "detailTable": "EBA_COUNTRY_SUB_REGIONS",
          "detailTableKeyColumn": "ID",
          "detailTableDisplayColumn": "NAME"
        }
      ],
      "help": ""
    }
    ,
    {
      "page": "5",
      "pageType": "interactiveReport",
      "pageName": "Country Regions",
      "pageIcon": "fa-table",
      "pageIsAdministrative": true,
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRY_REGIONS",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "NAME",
      "drillDownLinkKey": "ID",
      "linkToPage": "4",
      "linkToKey": "REGION_ID",
      "help": ""
    }
    ,
    {
      "page": "6",
      "pageType": "interactiveReport",
      "pageName": "Country Sub Regions",
      "pageIcon": "fa-table",
      "pageIsAdministrative": true,
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRY_SUB_REGIONS",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "NAME",
      "drillDownLinkKey": "ID",
      "linkToPage": "4",
      "linkToKey": "SUB_REGION_ID",
      "help": ""
    }
    ,
    {
      "page": "7",
      "pageType": "interactiveReport",
      "pageName": "Country Intermediate Regions",
      "pageIcon": "fa-table",
      "pageIsAdministrative": true,
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRY_INTERMEDIATES",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "NAME",
      "drillDownLinkKey": "ID",
      "linkToPage": "4",
      "linkToKey": "INTERMEDIATE_REGION_ID",
      "help": ""
    }
    ,
    {
      "page": "8",
      "pageType": "interactiveReport",
      "pageName": "Country Organization Regions",
      "pageIcon": "fa-table",
      "pageIsAdministrative": true,
      "reportImplementation": "TABLE",
      "table": "EBA_COUNTRY_ORGANIZATIONS",
      "includeFormWithReport": true,
      "drillDownLinkColumn": "CODE",
      "drillDownLinkKey": "ID",
      "linkToPage": "4",
      "linkToKey": "ORGANIZATION_ID",
      "help": ""
    }
    ],
  "generalSettings": {
    "builtWithLove": false,
    "learnAppDefaults": false,
    "version": "Release 1.0",
    "logging": true,
    "debugging": true
    },
  "securitySettings": {
    "deepLinking": false,
    "maximumSessionSeconds": "",
    "maximumSessionIdleSeconds": ""
    }
  }
}~';

    insert into wwv_sample_json (wwv_sample_dataset_id, language_cd, create_app_wizard_json)
    values (  6, 'en', l_clob);

    commit;

    -- Insert into DML Table
    delete from wwv_sample_dmls
    where wwv_sample_dataset_id = 6;

    l_clob :=q'~declare
type t_eba_country_regions is table of eba_country_regions%rowtype index by binary_integer;
l_eba_country_regions t_eba_country_regions;
procedure r (  p_id    in number
             , p_name  in varchar2
            ) is
  begin
    l_eba_country_regions(l_eba_country_regions.count + 1).id := p_id;
    l_eba_country_regions(l_eba_country_regions.count).name   := p_name;
  end r;
begin
r (10,'America');
r (20,'Europe');
r (30,'Asia');
r (40,'Oceania');
r (50,'Africa');
forall i in indices of l_eba_country_regions
  insert into eba_country_regions values l_eba_country_regions(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  6, 'en', 'Insert Country Regions', 10, l_clob);

    l_clob :=q'~declare
type t_eba_country_sub_regions is table of eba_country_sub_regions%rowtype index by binary_integer;
l_eba_country_sub_regions t_eba_country_sub_regions;
procedure s (  p_id    in number
             , p_name  in varchar2
            ) is
  begin
    l_eba_country_sub_regions(l_eba_country_sub_regions.count + 1).id := p_id;
    l_eba_country_sub_regions(l_eba_country_sub_regions.count).name   := p_name;
  end s;
begin
s (10,'Latin America and the Caribbean');
s (20,'Polynesia');
s (30,'Southern Asia');
s (40,'Northern Africa');
s (50,'Micronesia');
s (60,'Eastern Asia');
s (70,'Southern Europe');
s (80,'Northern America');
s (90,'Australia and New Zealand');
s (100,'South-eastern Asia');
s (110,'Central Asia');
s (120,'Northern Europe');
s (130,'Melanesia');
s (140,'Eastern Europe');
s (150,'Western Europe');
s (160,'Sub-Saharan Africa');
s (170,'Western Asia');
forall i in indices of l_eba_country_sub_regions
  insert into eba_country_sub_regions values l_eba_country_sub_regions(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  6, 'en', 'Insert Country Sub Regions', 20, l_clob);

    l_clob :=q'~declare
type t_eba_country_intermediates is table of eba_country_intermediates%rowtype index by binary_integer;
l_eba_country_intermediates t_eba_country_intermediates;
procedure i (  p_id    in number
             , p_name  in varchar2
            ) is
  begin
    l_eba_country_intermediates(l_eba_country_intermediates.count + 1).id := p_id;
    l_eba_country_intermediates(l_eba_country_intermediates.count).name   := p_name;
  end i;
begin
i (10,'Western Africa');
i (20,'Central America');
i (30,'Southern Africa');
i (40,'South America');
i (50,'Eastern Africa');
i (60,'Caribbean');
i (70,'Channel Islands');
i (80,'Middle Africa');
forall i in indices of l_eba_country_intermediates
  insert into eba_country_intermediates values l_eba_country_intermediates(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  6, 'en', 'Insert Country Intermediate Regions', 30, l_clob);

    l_clob :=q'~declare
type t_eba_country_organizations is table of eba_country_organizations%rowtype index by binary_integer;
l_eba_country_organizations t_eba_country_organizations;
procedure o (  p_id    in number
             , p_code  in varchar2
             , p_name  in varchar2
            ) is
  begin
    l_eba_country_organizations(l_eba_country_organizations.count + 1).id := p_id;
    l_eba_country_organizations(l_eba_country_organizations.count).code   := p_code;
    l_eba_country_organizations(l_eba_country_organizations.count).name   := p_name;
  end o;
begin
o (10,'NA','North America');
o (20,'EMEA','Europe, Middle East, and Africa');
o (30,'APAC','  Asia Pacific');
o (40,'LAD',' Latin America');
forall i in indices of l_eba_country_organizations
  insert into eba_country_organizations values l_eba_country_organizations(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  6, 'en', 'Insert Country Organization Regions', 40, l_clob);

    l_clob :=q'~declare
type t_eba_countries is table of eba_countries%rowtype index by binary_integer;
l_eba_countries t_eba_countries;
procedure c (  p_country_id              in number
             , p_name                    in varchar2
             , p_nationality             in varchar2
             , p_country_code            in varchar2
             , p_iso_alpha2              in varchar2
             , p_capital                 in varchar2
             , p_population              in number
             , p_area_km2                in number
             , p_region_id               in number
             , p_sub_region_id           in number
             , p_intermediate_region_id  in number
             , p_organization_region_id  in number
            ) is
  begin
    l_eba_countries(l_eba_countries.count + 1).country_id         := p_country_id;
    l_eba_countries(l_eba_countries.count).name                   := p_name;
    l_eba_countries(l_eba_countries.count).nationality            := p_nationality;
    l_eba_countries(l_eba_countries.count).country_code           := p_country_code;
    l_eba_countries(l_eba_countries.count).iso_alpha2             := p_iso_alpha2;
    l_eba_countries(l_eba_countries.count).capital                := p_capital;
    l_eba_countries(l_eba_countries.count).population             := p_population;
    l_eba_countries(l_eba_countries.count).area_km2               := p_area_km2;
    l_eba_countries(l_eba_countries.count).region_id              := p_region_id;
    l_eba_countries(l_eba_countries.count).sub_region_id          := p_sub_region_id;
    l_eba_countries(l_eba_countries.count).intermediate_region_id := p_intermediate_region_id;
    l_eba_countries(l_eba_countries.count).organization_region_id := p_organization_region_id;
  end c;
begin
c (1,'Afghanistan','Afghan','AFG','AF','Kabul',38041754,652230,30,30,null,30);
c (2,'Albania','Albanian','ALB','AL','Tirana',2880917,28748,20,70,null,20);
c (3,'Algeria','Algerian','DZA','DZ','Algiers',43053054,2381741,50,40,null,20);
c (4,'American Samoa','American Samoan','ASM','AS','Pago Pago',55312,199,40,20,null,30);
c (5,'Andorra','Andorran','AND','AD','Andorra la Vella',77142,468,20,70,null,20);
c (6,'Angola','Angolan','AGO','AO','Luanda',31825295,1246700,50,160,80,20);
c (7,'Anguilla','Anguillan','AIA','AI','The Valley',14869,91,10,10,60,40);
c (8,'Antarctica','Antarctic','ATA','AQ','McMurdo Station',1106,14200000,40,null,null,30);
c (9,'Antigua and Barbuda','Antiguan or Barbudan','ATG','AG','St. John''s',97118,442,10,10,60,40);
c (10,'Argentina','Argentine','ARG','AR','Buenos Aires',44780677,2780400,10,10,40,40);
c (11,'Armenia','Armenian','ARM','AM','Yerevan',2957731,29743,30,170,null,30);
c (12,'Aruba','Aruban','ABW','AW','Oranjestad',106314,180,10,10,60,40);
c (13,'Australia','Australian','AUS','AU','Canberra',25203198,7692024,40,90,null,30);
c (14,'Austria','Austrian','AUT','AT','Vienna',8955102,83871,20,150,null,20);
c (15,'Azerbaijan','Azerbaijani','AZE','AZ','Baku',10047718,86600,30,170,null,30);
c (16,'Bahamas','Bahamian','BHS','BS','Nassau',389482,13943,10,10,60,40);
c (17,'Bahrain','Bahraini','BHR','BH','Manama',1641172,765,30,170,null,30);
c (18,'Bangladesh','Bangladeshi','BGD','BD','Dhaka',163046161,147570,30,30,null,30);
c (19,'Barbados','Barbadian','BRB','BB','Bridgetown',287025,430,10,10,60,40);
c (20,'Belarus','Belarusian','BLR','BY','Minsk',9452411,207600,20,140,null,20);
c (21,'Belgium','Belgian','BEL','BE','Brussels',11539328,30528,20,150,null,20);
c (22,'Belize','Belizean','BLZ','BZ','Belmopan',390353,22966,10,10,20,40);
c (23,'Benin','Beninese','BEN','BJ','Porto-Novo',11801151,112622,50,160,10,20);
c (24,'Bermuda','Bermudian','BMU','BM','Hamilton',62506,54,10,80,null,40);
c (25,'Bhutan','Bhutanese','BTN','BT','Thimphu',763092,38394,30,30,null,30);
c (26,'Bolivia (Plurinational State of)','Bolivian','BOL','BO','Sucre',11513100,1098581,10,10,40,40);
c (27,'Bonaire, Sint Eustatius and Saba','Sint Eustatius and Saba','BES','BQ','Kralendijk',25711,328,10,10,null,40);
c (28,'Bosnia and Herzegovina','Bosnian or Herzegovinian','BIH','BA','Sarajevo',3301000,51209,20,70,null,20);
c (29,'Botswana','Motswana','BWA','BW','Gaborone',2303697,582000,50,160,30,20);
c (30,'Bouvet Island','Bouvet Island','BVT','BV','',0,49,10,10,40,40);
c (31,'Brazil','Brazilian','BRA','BR',unistr('Bras\00CClia'),211049527,8515767,10,10,40,40);
c (32,'British Indian Ocean Territory','BIOT','IOT','IO','Point Marianne',4000,60,50,160,50,20);
c (33,'Brunei Darussalam','Bruneian','BRN','BN','Bandar Seri Begawan',433285,5765,30,100,null,30);
c (34,'Bulgaria','Bulgarian','BGR','BG','Sofia',7000119,110879,20,140,null,20);
c (35,'Burkina Faso',unistr('Burkinab\00C8'),'BFA','BF','Ouagadougou',20321378,272967,50,160,10,20);
c (36,'Burundi','Burundian','BDI','BI','Bujumbura',11530580,27834,50,160,50,20);
c (37,'Cabo Verde','Cabo Verdean','CPV','CV','Praia',549935,4033,50,160,10,20);
c (38,'Cambodia','Cambodian','KHM','KH','Phnom Penh',16486542,181035,30,100,null,30);
c (39,'Cameroon','Cameroonian','CMR','CM',unistr('Yaound\00C8'),25876380,475442,50,160,80,20);
c (40,'Canada','Canadian','CAN','CA','Ottawa',37411047,9984670,10,80,null,10);
c (41,'Cayman Islands','Caymanian','CYM','KY','George Town',64948,264,10,10,60,40);
c (42,'Central African Republic','Central African','CAF','CF','Bangui',4745185,622984,50,160,80,20);
c (43,'Chad','Chadian','TCD','TD','N''Djamena',15946876,1284000,50,160,80,20);
c (44,'Chile','Chilean','CHL','CL','Santiago',18952038,756102,10,10,40,40);
c (45,'China','Chinese','CHN','CN','Beijing',1433783686,9706961,30,60,null,30);
c (46,'Christmas Island','Christmas Island','CXR','CX','Flying Fish Cove',1843,135,40,90,null,30);
c (47,'Cocos (Keeling) Islands','Cocos Island','CCK','CC','West Island',544,14,40,90,null,30);
c (48,'Colombia','Colombian','COL','CO','Bogota',50339443,1141748,10,10,40,40);
c (49,'Comoros','Comoran','COM','KM','Moroni',850886,1862,50,160,50,20);
c (50,'Congo','Congolese','COG','CG','Brazzaville',5380508,342000,50,160,80,20);
c (51,'Congo, Democratic Republic of the','Congolese','COD','CD','Kinshasa',86790567,2344858,50,160,null,20);
c (52,'Cook Islands','Cook Island','COK','CK','Avarua',17548,236,40,20,null,30);
c (53,'Costa Rica','Costa Rican','CRI','CR',unistr('San Jos\00C8'),5047561,51100,10,10,20,40);
c (54,'Croatia','Croatian','HRV','HR','Zagreb',4130304,56594,20,70,null,20);
c (55,'Cuba','Cuban','CUB','CU','Havana',11333483,109884,10,10,60,40);
c (56,unistr('Cura\00E7ao'),unistr('Cura\00E7aoan'),'CUW','CW','Willemstad',163424,444,10,10,60,40);
c (57,'Cyprus','Cypriot','CYP','CY','Nicosia',1198575,9251,30,170,null,30);
c (58,'Czechia','Czech','CZE','CZ','Prague',10689209,78865,20,140,null,20);
c (59,unistr('C\00F4te d''Ivoire'),'Ivorian','CIV','CI','Yamoussoukro',25716544,322463,50,160,10,20);
c (60,'Denmark','Danish','DNK','DK','Copenhagen',5771876,43094,20,120,null,20);
c (61,'Djibouti','Djiboutian','DJI','DJ','Djibouti',973560,23200,50,160,50,20);
c (62,'Dominica','Dominican','DMA','DM','Roseau',71808,751,10,10,60,40);
c (63,'Dominican Republic','Dominican','DOM','DO','Santo Domingo',10738958,48671,10,10,60,40);
c (64,'Ecuador','Ecuadorian','ECU','EC','Quito',17373662,276841,10,10,40,40);
c (65,'Egypt','Egyptian','EGY','EG','Cairo',100388073,1002450,50,40,null,20);
c (66,'El Salvador','Salvadoran','SLV','SV','San Salvador',6453553,21041,10,10,20,40);
c (67,'Equatorial Guinea','Equatorial Guinean','GNQ','GQ','Malabo',1355986,28051,50,160,80,20);
c (68,'Eritrea','Eritrean','ERI','ER','Asmara',3497117,117600,50,160,50,20);
c (69,'Estonia','Estonian','EST','EE','Tallinn',1325648,45227,20,120,null,20);
c (70,'Eswatini','Swazi','SWZ','SZ','Mbabane',1148130,17364,50,160,30,20);
c (71,'Ethiopia','Ethiopian','ETH','ET','Addis Ababa',112078730,1104300,50,160,50,20);
c (72,'Falkland Islands (Malvinas)','Falkland Island','FLK','FK','Stanley',3377,12173,10,10,40,40);
c (73,'Faroe Islands','Faroese','FRO','FO',unistr('T\00DBrshavn'),48678,1393,20,120,null,20);
c (74,'Fiji','Fijian','FJI','FJ','Suva',889953,18272,40,130,null,30);
c (75,'Finland','Finnish','FIN','FI','Helsinki',5532156,338424,20,120,null,20);
c (76,'France','French','FRA','FR','Paris',65129728,551695,20,150,null,20);
c (77,'French Guiana','French Guianese','GUF','GF','Cayenne',290832,83534,10,10,40,40);
c (78,'French Polynesia','French Polynesian','PYF','PF','Papeete',279287,4167,40,20,null,30);
c (79,'French Southern Territories','French Southern Territories','ATF','TF','Saint Pierre',150,439780,50,160,50,20);
c (80,'Gabon','Gabonese','GAB','GA','Libreville',2172579,267668,50,160,80,20);
c (81,'Gambia','Gambian','GMB','GM','Banjul',2347706,10689,50,160,10,20);
c (82,'Georgia','Georgian','GEO','GE','Tbilisi',3996765,69700,30,170,null,30);
c (83,'Germany','German','DEU','DE','Berlin',83517045,357114,20,150,null,20);
c (84,'Ghana','Ghanaian','GHA','GH','Accra',30417856,238533,50,160,10,20);
c (85,'Gibraltar','Gibraltar','GIB','GI','Gibraltar',33701,6,20,70,null,20);
c (86,'Greece','Greek','GRC','GR','Athens',10473455,131990,20,70,null,20);
c (87,'Greenland','Greenlandic','GRL','GL','Nuuk',56672,2166086,10,80,null,20);
c (88,'Grenada','Grenadian','GRD','GD','St. George''s',112003,344,10,10,60,40);
c (89,'Guadeloupe','Guadeloupe','GLP','GP','Basse Terre',400056,1628,10,10,60,40);
c (90,'Guam','Guamanian','GUM','GU',unistr('Hag\00C2t\00D2a'),167294,549,40,50,null,30);
c (91,'Guatemala','Guatemalan','GTM','GT','Guatemala City',17581472,108889,10,10,20,40);
c (92,'Guernsey','Channel Island','GGY','GG','St. Peter Port',63026,65,20,120,70,20);
c (93,'Guinea','Guinean','GIN','GN','Conakry',12771246,245857,50,160,10,20);
c (94,'Guinea-Bissau','Bissau-Guinean','GNB','GW','Bissau',1920922,36125,50,160,10,20);
c (95,'Guyana','Guyanese','GUY','GY','Georgetown',782766,214969,10,10,40,40);
c (96,'Haiti','Haitian','HTI','HT','Port-au-Prince',11263077,27750,10,10,60,40);
c (97,'Heard Island and McDonald Islands','Heard Island or McDonald Islands','HMD','HM','',0,368,40,90,null,30);
c (98,'Holy See','Vatican','VAT','VA','Vatican City',799,.44,20,70,null,20);
c (99,'Honduras','Honduran','HND','HN','Tegucigalpa',9746117,112492,10,10,20,40);
c (100,'Hong Kong','Hong Kong','HKG','HK','City of Victoria',7436154,1104,30,60,null,30);
c (101,'Hungary','Hungarian','HUN','HU','Budapest',9684679,93028,20,140,null,20);
c (102,'Iceland','Icelandic','ISL','IS',unistr('Reykjav\00CCk'),339031,103000,20,120,null,20);
c (103,'India','Indian','IND','IN','New Delhi',1366417754,3287590,30,30,null,30);
c (104,'Indonesia','Indonesian','IDN','ID','Jakarta',270625568,1904569,30,100,null,30);
c (105,'Iran (Islamic Republic of)','Iranian','IRN','IR','Tehran',82913906,1648195,30,30,null,30);
c (106,'Iraq','Iraqi','IRQ','IQ','Baghdad',39309783,438317,30,170,null,30);
c (107,'Ireland','Irish','IRL','IE','Dublin',4882495,70273,20,120,null,20);
c (108,'Isle of Man','Manx','IMN','IM','Douglas',84584,572,20,120,null,20);
c (109,'Israel','Israeli','ISR','IL','Jerusalem',8519377,20770,30,170,null,30);
c (110,'Italy','Italian','ITA','IT','Rome',60550075,301336,20,70,null,20);
c (111,'Jamaica','Jamaican','JAM','JM','Kingston',2948279,10991,10,10,60,40);
c (112,'Japan','Japanese','JPN','JP','Tokyo',126860301,377930,30,60,null,30);
c (113,'Jersey','Channel Island','JEY','JE','St. Helier',100000,120,20,120,70,20);
c (114,'Jordan','Jordanian','JOR','JO','Amman',10101694,89342,30,170,null,30);
c (115,'Kazakhstan','Kazakhstani','KAZ','KZ','Astana',18551427,2724900,30,110,null,30);
c (116,'Kenya','Kenyan','KEN','KE','Nairobi',52573973,580367,50,160,50,20);
c (117,'Kiribati','I-Kiribati','KIR','KI','Tarawa',117606,811,40,50,null,30);
c (118,'Kuwait','Kuwaiti','KWT','KW','Kuwait City',4207083,17818,30,170,null,30);
c (119,'Kyrgyzstan','Kyrgyzstani','KGZ','KG','Bishkek',6415850,199951,30,110,null,30);
c (120,'Laos, People''s Democratic Republic','Lao','LAO','LA','Vientiane',7169455,236800,30,100,null,30);
c (121,'Latvia','Latvian','LVA','LV','Riga',1906743,64559,20,120,null,20);
c (122,'Lebanon','Lebanese','LBN','LB','Beirut',6855713,10452,30,170,null,30);
c (123,'Lesotho','Basotho','LSO','LS','Maseru',2125268,30355,50,160,30,20);
c (124,'Liberia','Liberian','LBR','LR','Monrovia',4937374,111369,50,160,10,20);
c (125,'Libya','Libyan','LBY','LY','Tripoli',6777452,1759540,50,40,null,20);
c (126,'Liechtenstein','Liechtenstein','LIE','LI','Vaduz',38019,160,20,150,null,20);
c (127,'Lithuania','Lithuanian','LTU','LT','Vilnius',2759627,65300,20,120,null,20);
c (128,'Luxembourg','Luxembourg','LUX','LU','Luxembourg',615729,2586,20,150,null,20);
c (129,'Macau','Macanese','MAC','MO','Macao',640445,30,30,60,null,30);
c (130,'Madagascar','Malagasy','MDG','MG','Antananarivo',26969307,587041,50,160,50,20);
c (131,'Malawi','Malawian','MWI','MW','Lilongwe',18628747,118484,50,160,50,20);
c (132,'Malaysia','Malaysian','MYS','MY','Kuala Lumpur',31949777,330803,30,100,null,30);
c (133,'Maldives','Maldivian','MDV','MV',unistr('Mal\00C8'),530953,300,30,30,null,30);
c (134,'Mali','Malian','MLI','ML','Bamako',19658031,1240192,50,160,10,20);
c (135,'Malta','Maltese','MLT','MT','Valletta',440372,316,20,70,null,20);
c (136,'Marshall Islands','Marshallese','MHL','MH','Majuro',58791,181,40,50,null,30);
c (137,'Martinique','Martiniquais','MTQ','MQ','Fort-de-France Bay',375554,1128,10,10,60,40);
c (138,'Mauritania','Mauritanian','MRT','MR','Nouakchott',4525696,1030700,50,160,10,20);
c (139,'Mauritius','Mauritian','MUS','MU','Port Louis',1269668,2040,50,160,50,20);
c (140,'Mayotte','Mahoran','MYT','YT','Mamoudzou',266150,374,50,160,50,20);
c (141,'Mexico','Mexican','MEX','MX','Mexico City',127575529,1964375,10,10,20,40);
c (142,'Micronesia (Federated States of)','Micronesian','FSM','FM','Palikir',113815,702,40,50,null,30);
c (143,'Moldova, Republic of','Moldovan','MDA','MD','Chisinau',4043263,33846,20,140,null,20);
c (144,'Monaco',unistr('Mon\00C8gasque'),'MCO','MC','Monaco',38964,2.02,20,150,null,20);
c (145,'Mongolia','Mongolian','MNG','MN','Ulaanbaatar',3225167,1564110,30,60,null,30);
c (146,'Montenegro','Montenegrin','MNE','ME','Podgorica',627987,13812,20,70,null,20);
c (147,'Montserrat','Montserratian','MSR','MS','Plymouth',4989,102,10,10,60,40);
c (148,'Morocco','Moroccan','MAR','MA','Rabat',36471769,446550,50,40,null,20);
c (149,'Mozambique','Mozambican','MOZ','MZ','Maputo',30366036,801590,50,160,50,20);
c (150,'Myanmar','Burmese','MMR','MM','Naypyidaw',54045420,676578,30,100,null,30);
c (151,'Namibia','Namibian','NAM','NA','Windhoek',2494530,825615,50,160,30,20);
c (152,'Nauru','Nauruan','NRU','NR','Yaren',10756,21,40,50,null,30);
c (153,'Nepal','Nepali','NPL','NP','Kathmandu',28608710,147181,30,30,null,30);
c (154,'Netherlands','Dutch','NLD','NL','Amsterdam',17097130,41850,20,150,null,20);
c (155,'New Caledonia','New Caledonian','NCL','NC',unistr('Noum\00C8a'),282750,18575,40,130,null,30);
c (156,'New Zealand','New Zealander','NZL','NZ','Wellington',4783063,270467,40,90,null,30);
c (157,'Nicaragua','Nicaraguan','NIC','NI','Managua',6545502,130373,10,10,20,40);
c (158,'Niger','Nigerien','NER','NE','Niamey',23310715,1267000,50,160,10,20);
c (159,'Nigeria','Nigerian','NGA','NG','Abuja',200963599,923768,50,160,10,20);
c (160,'Niue','Niuean','NIU','NU','Alofi',1615,260,40,20,null,30);
c (161,'Norfolk Island','Norfolk Island','NFK','NF','Kingston',1748,35,40,90,null,30);
c (162,'North Korea (Democratic People''s Republic of)','North Korean','PRK','KP','Pyongyang',25666161,120538,30,60,null,30);
c (163,'North Macedonia','Macedonian','MKD','MK','Skopje',2083459,25713,20,70,null,20);
c (164,'Northern Mariana Islands','Northern Marianan','MNP','MP','Saipan',57216,464,40,50,null,30);
c (165,'Norway','Norwegian','NOR','NO','Oslo',5378857,323802,20,120,null,20);
c (166,'Oman','Omani','OMN','OM','Muscat',4974986,309500,30,170,null,30);
c (167,'Pakistan','Pakistani','PAK','PK','Islamabad',216565318,881912,30,30,null,30);
c (168,'Palau','Palauan','PLW','PW','Ngerulmud',18008,459,40,50,null,30);
c (169,'Palestine, State of','Palestinian','PSE','PS','Ramallah',4981420,6220,30,170,null,30);
c (170,'Panama','Panamanian','PAN','PA','Panama City',4246439,75417,10,10,20,40);
c (171,'Papua New Guinea','Papua New Guinean','PNG','PG','Port Moresby',8776109,462840,40,130,null,30);
c (172,'Paraguay','Paraguayan','PRY','PY',unistr('Asunci\00DBn'),7044636,406752,10,10,40,40);
c (173,'Peru','Peruvian','PER','PE','Lima',32510453,1285216,10,10,40,40);
c (174,'Philippines','Filipino','PHL','PH','Manila',108116615,342353,30,100,null,30);
c (175,'Pitcairn','Pitcairn Island','PCN','PN','Adamstown',68,43,40,20,null,30);
c (176,'Poland','Polish','POL','PL','Warsaw',37887768,312679,20,140,null,20);
c (177,'Portugal','Portuguese','PRT','PT','Lisbon',10226187,92090,20,70,null,20);
c (178,'Puerto Rico','Puerto Rican','PRI','PR','San Juan',2933408,8870,10,10,60,40);
c (179,'Qatar','Qatari','QAT','QA','Doha',2832067,11586,30,170,null,30);
c (180,'Romania','Romanian','ROU','RO','Bucharest',19364557,238391,20,140,null,20);
c (181,'Russian Federation','Russian','RUS','RU','Moscow',145872256,17098242,20,140,null,20);
c (182,'Rwanda','Rwandan','RWA','RW','Kigali',12626950,26338,50,160,50,20);
c (183,unistr('R\00E9union'),unistr('R\00C8unionese'),'REU','RE','Saint-Denis',888927,2511,50,160,50,20);
c (184,unistr('Saint Barth\00E9lemy'),unistr('Saint-Barth\00E9lemois'),'BLM','BL','Gustavia',9847,21,10,10,60,40);
c (185,'Saint Helena, Ascension and Tristan da Cunha','Ascension and Tristan da Cunha','SHN','SH','Jamestown',5633,394,50,160,null,20);
c (186,'Saint Kitts and Nevis','Kittitian or Nevisian','KNA','KN','Basseterre',52823,261,10,10,60,40);
c (187,'Saint Lucia','Saint Lucian','LCA','LC','Castries',182790,616,10,10,60,40);
c (188,'Saint Martin (French part)','Saint-Martinoise','MAF','MF','Marigot',38002,53,10,10,60,40);
c (189,'Saint Pierre and Miquelon','Saint-Pierrais or Miquelonnais','SPM','PM','St. Pierre',5822,242,10,80,null,40);
c (190,'Saint Vincent and the Grenadines','Saint Vincentian','VCT','VC','Kingstown',110589,389,10,10,60,40);
c (191,'Samoa','Samoan','WSM','WS','Apia',197097,2842,40,20,null,30);
c (192,'San Marino','Sammarinese','SMR','SM','San Marino',33860,61,20,70,null,20);
c (193,'Sao Tome and Principe',unistr('S\201Eo Tom\00C8an'),'STP','ST','Sao Tome',215056,964,50,160,80,20);
c (194,'Saudi Arabia','Saudi','SAU','SA','Riyadh',34268528,2149690,30,170,null,30);
c (195,'Senegal','Senegalese','SEN','SN','Dakar',16296364,196722,50,160,10,20);
c (196,'Serbia','Serbian','SRB','RS','Belgrade',8772235,88361,20,70,null,20);
c (197,'Seychelles','Seychellois','SYC','SC','Victoria',97739,452,50,160,50,20);
c (198,'Sierra Leone','Sierra Leonean','SLE','SL','Freetown',7813215,71740,50,160,10,20);
c (199,'Singapore','Singaporean','SGP','SG','Singapore',5804337,710,30,100,null,30);
c (200,'Sint Maarten (Dutch part)','Sint Maarten','SXM','SX','Philipsburg',42388,34,10,10,60,40);
c (201,'Slovakia','Slovak','SVK','SK','Bratislava',5457013,49037,20,140,null,20);
c (202,'Slovenia','Slovenian','SVN','SI','Ljubljana',2078654,20273,20,70,null,20);
c (203,'Solomon Islands','Solomon Island','SLB','SB','Honiara',669823,28896,40,130,null,30);
c (204,'Somalia','Somali','SOM','SO','Mogadishu',15442905,637657,50,160,50,20);
c (205,'South Africa','South African','ZAF','ZA','Pretoria',58558270,1221037,50,160,30,20);
c (206,'South Georgia and the South Sandwich Islands','South Georgia or South Sandwich Islands','SGS','GS','Grytviken',30,3903,10,10,40,40);
c (207,'South Korea (Republic of)','South Korean','KOR','KR','Seoul',51225308,100210,30,60,null,30);
c (208,'South Sudan','South Sudanese','SSD','SS','Juba',11062113,619745,50,160,50,20);
c (209,'Spain','Spanish','ESP','ES','Madrid',46736776,505992,20,70,null,20);
c (210,'Sri Lanka','Sri Lankan','LKA','LK','Sri Jayawardenapura Kotte',21323733,65610,30,30,null,30);
c (211,'Sudan','Sudanese','SDN','SD','Khartoum',42813238,1886068,50,40,null,20);
c (212,'Suriname','Surinamese','SUR','SR','Paramaribo',581372,163820,10,10,40,40);
c (213,'Svalbard and Jan Mayen','Svalbard','SJM','SJ','Longyearbyen',2667,61399,20,120,null,20);
c (214,'Sweden','Swedish','SWE','SE','Stockholm',10036379,450295,20,120,null,20);
c (215,'Switzerland','Swiss','CHE','CH','Bern',8591365,41284,20,150,null,20);
c (216,'Syrian Arab Republic','Syrian','SYR','SY','Damascus',17070135,185180,30,170,null,30);
c (217,'Taiwan (Province of China)','Taiwanese','TWN','TW','Taipei',23773876,36193,30,60,null,30);
c (218,'Tajikistan','Tajikistani','TJK','TJ','Dushanbe',9321018,143100,30,110,null,30);
c (219,'Tanzania (United Republic of)','Tanzanian','TZA','TZ','Dodoma',58005463,945087,50,160,null,20);
c (220,'Thailand','Thai','THA','TH','Bangkok',69625582,513120,30,100,null,30);
c (221,'Timor-Leste','Timorese','TLS','TL','Dili',1293119,14874,30,100,null,30);
c (222,'Togo','Togolese','TGO','TG',unistr('Lom\00C8'),8082366,56785,50,160,10,20);
c (223,'Tokelau','Tokelauan','TKL','TK','Nukunonu',1340,12,40,20,null,30);
c (224,'Tonga','Tongan','TON','TO',unistr('Nuku\00F8alofa'),104494,747,40,20,null,30);
c (225,'Trinidad and Tobago','Trinidadian or Tobagonian','TTO','TT','Port of Spain',1394973,5130,10,10,60,40);
c (226,'Tunisia','Tunisian','TUN','TN','Tunis',11694719,163610,50,40,null,20);
c (227,'Turkey','Turkish','TUR','TR','Ankara',83429615,783562,30,170,null,30);
c (228,'Turkmenistan','Turkmen','TKM','TM','Ashgabat',5942089,488100,30,110,null,30);
c (229,'Turks and Caicos Islands','Turks and Caicos Island','TCA','TC','Cockburn Town',38191,948,10,10,60,40);
c (230,'Tuvalu','Tuvaluan','TUV','TV','Funafuti',11646,26,40,20,null,30);
c (231,'Uganda','Ugandan','UGA','UG','Kampala',44269594,241550,50,160,50,20);
c (232,'Ukraine','Ukrainian','UKR','UA','Kiev',43993638,603500,20,140,null,20);
c (233,'United Arab Emirates','Emirati','ARE','AE','Abu Dhabi',9770529,83600,30,170,null,30);
c (234,'United Kingdom of Great Britain and Northern Ireland','British','GBR','GB','London',67530172,242900,20,120,null,20);
c (235,'United States Minor Outlying Islands','American','UMI','UM','',300,34,40,50,null,30);
c (236,'United States of America','American','USA','US','Washington, D.C.',329064917,9372610,10,80,null,10);
c (237,'Uruguay','Uruguayan','URY','UY','Montevideo',3461734,181034,10,10,40,40);
c (238,'Uzbekistan','Uzbekistani','UZB','UZ','Tashkent',32981716,447400,30,110,null,30);
c (239,'Vanuatu','Ni-Vanuatu','VUT','VU','Port Vila',299882,12189,40,130,null,30);
c (240,'Venezuela (Bolivarian Republic of)','Venezuelan','VEN','VE','Caracas',28515829,916445,10,10,40,40);
c (241,'Vietnam','Vietnamese','VNM','VN','Hanoi',96462106,331212,30,100,null,30);
c (242,'Virgin Islands (British)','British Virgin Island','VGB','VG','Road Town',30030,151,10,10,60,40);
c (243,'Virgin Islands (U.S.)','U.S. Virgin Island','VIR','VI','Charlotte Amalie',104578,347,10,10,60,40);
c (244,'Wallis and Futuna','Wallis and Futuna','WLF','WF','Mata-Utu',11432,142,40,20,null,30);
c (245,'Western Sahara','Sahrawi','ESH','EH',unistr('La\00E2youne'),582463,266000,50,40,null,20);
c (246,'Yemen','Yemeni','YEM','YE','Sana\002Ca',29161922,527968,30,170,null,30);
c (247,'Zambia','Zambian','ZMB','ZM','Lusaka',17861030,752612,50,160,50,20);
c (248,'Zimbabwe','Zimbabwean','ZWE','ZW','Harare',14645468,390757,50,160,50,20);
c (249,unistr('\00C5land Islands'),unistr('\00C5land Island'),'ALA','AX','Mariehamn',29789,1580,20,120,null,20);
forall i in indices of l_eba_countries
  insert into eba_countries values l_eba_countries(i);
end;~';
    insert into wwv_sample_dmls (wwv_sample_dataset_id, language_cd, dml_name, install_seq, dml)
    values (  6, 'en', 'Insert Countries', 50, l_clob);

    commit;
end;
/
