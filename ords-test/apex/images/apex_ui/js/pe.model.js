/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * todo documentation
 *
 * todo The properties GRID_COLUMN and GRID_COLUMN_SPAN should show a warning if the currently used grid column isn't available anymore
 **/

/**
 * @namespace
 **/
window.pe = ( function( $, util, locale, lang, server, debug ) {
    "use strict";

    // Constants for component types and properties we use in our code
    // Note: Keep them in sync with apex_install_pe_data.sql!
    var COMP_TYPE = {
            APPLICATION:             "1000",

            THEME:                   "2000",

            PAGE_TEMPLATE:           "2510",
            FIELD_TEMPLATE:          "2520",
            BUTTON_TEMPLATE:         "2530",
            REGION_TEMPLATE:         "2540",
            LIST_TEMPLATE:           "2550",
            BREADCRUMB_TEMPLATE:     "2560",
            CALENDAR_TEMPLATE:       "2570",
            REPORT_TEMPLATE:         "2580",

            APP_ITEM:                "3010",
            APP_COMPUTATION:         "3020",
            APP_PROCESS:             "3030",
            BUILD_OPTION:            "3040",
            AUTHENTICATION:          "3050",
            AUTHORIZATION:           "3060",

            WEB_SRC_MODULE:          "3080",
            WEB_SRC_MOD_PARAM:       "3082",
            WEB_SRC_OPERATION:       "3088",
            WEB_SRC_OPER_PARAM:      "3090",

            AI_CONFIG:               "3400",
            BREADCRUMB:              "3510",
            LIST:                    "3520",
            LOV:                     "3530",
            WS_REF:                  "3540",
            WS_REF_OPER:             "3541",
            WS_REF_OPER_P_I:         "3545",
            WS_REF_OPER_P_O:         "3546",
            WS_REF_OPER_P_A:         "3547",
            WS_REF_OPER_P_H:         "3548",
            DATA_LOAD_TABLE:         "3550", // Legacy
            TAB_SET:                 "3560",
            REPORT_QUERY:            "3580",
            EMAIL_TEMPLATE:          "3630",
            DATA_LOAD_DEF:           "3640",
            TASK_DEFINITION:         "3700",
            TASK_DEF_PARAM:          "3705",
            SEARCH_CONFIG:           "3910",
//            PLUGIN:                "1", // todo to be changed to real number

            PAGE:                    "5000",
            REGION:                  "5110",
            PAGE_ITEM:               "5120",
            BUTTON:                  "5130",
            DA_EVENT:                "5140",
            DA_ACTION:               "5150",
            META_TAG:                "5160",
            VALIDATION:              "5510",
            PAGE_COMPUTATION:        "5520",
            PAGE_PROCESS:            "5530",
            PAGE_PROC_WS_PARAM:      "5531",
            BRANCH:                  "5540",

            REGION_PLUGIN_ATTR:      "7000",
            IR_ATTRIBUTES:           "7010",
            IR_SAVED_REPORT:         "7020",
            IR_COLUMN_GROUP:         "7030",
            IR_COLUMN:               "7040",
            IR_PRINT_ATTR:           "7050",

            PAGE_PROC_WS_P_I:        "7110",
            PAGE_PROC_WS_P_O:        "7120",
            PAGE_PROC_WS_P_A:        "7130",
            PAGE_WS_PARAM:           "7150",
            PAGE_PROC_API_PARAM:     "7152",
            REGION_WS_PARAM:         "7160",

            CLASSIC_REPORT:          "7310",
            CLASSIC_RPT_COLUMN:      "7320",
            CLASSIC_RPT_PRINT:       "7330",

            TABULAR_FORM:            "7410",
            TAB_FORM_COLUMN:         "7420",
            TAB_FORM_PRINT:          "7430",

            CLASSIC_CALENDAR:        "7610",

            REGION_COLUMN:           "7710",
            REGION_TMPL_COLUMN:      "7720",

            JET_CHART:               "7810",
            JET_CHART_SERIES:        "7820",
            JET_CHART_AXES:          "7830",
            JET_CHART_WS_PARAM:      "7840",

            IG_ATTRIBUTES:           "7910",
            IG_SAVED_REPORT:         "7920",
            IG_COLUMN_GROUP:         "7930",
            IG_COLUMN:               "7940",
            IG_PRINT:                "7950",
            FACET:                   "8010",
            FACET_GROUP:             "8020",
            FACET_GROUP_ITEM:        "8030",
            SFILTER:                 "8050",
            SFILTER_GROUP:           "8051",
            SFILTER_GROUP_ITEM:      "8052",
            CARD:                    "8110",
            CARD_ACTION:             "8120",
            MAP_REGION:              "8210",
            MAP_LAYER:               "8220",
            MAP_LAYER_WS_PARAM:      "8230",
            PAGE_PROCESS_TASK_PARAM: "8400",
            SEARCH_REGION_SOURCE:    "8520",
            REGION_ACTION:           "8610",
            IR_COLUMN_ACTION:        "8615",
            REGION_ACTION_MENU_ENTRY:"8710",
            IR_COL_ACTION_MENU_ENTRY:"8715",
            WORKFLOW:                "8800",
            WORKFLOW_PARAM:          "8810",
            WORKFLOW_VERSION:        "8820",
            WORKFLOW_ACTIVITY:       "8830",
            WORKFLOW_VARIABLE:       "8840",
            WORKFLOW_ACT_VAR:        "8850",
            WORKFLOW_PARTICIP:       "8860",
            WORKFLOW_TRANS:          "8870",
            WORKFLOW_BRANCH:         "8880",
            PAGE_PROCESS_WF_PARAM:   "8900",
            WF_ACTIVITY_TASK_PARAM:  "8950",
            WF_ACTIVITY_API_PARAM:   "9000",
            WF_ACTIVITY_WS_PARAM:    "9050",
            WF_ACTIVITY_WF_PARAM:    "9100"
        },
        PROP = {
            NAME:                   "1",
            ERROR_MESSAGE:          "6",
            PAGE_GROUP:             "9",
            PAGE_MODE:             "10",
            PAGE_TEMPLATE:         "11",
            STANDARD_TAB_SET:      "12",
            TITLE:                 "13",
            JS_FUNCTION_AND_GLOBAL_VARIABLE_DECLARATION: "16",
            AUTHORIZATION_SCHEME:         "24",
            PAGE_AUTHENTICATION:          "25",
            HIDDEN_REQUIRED_VALUE_TYPE:   "31",
            API_DIRECTION:                "34",
            IGNORE_OUTPUT:                "35",
            API_DATA_TYPE:                "36",
            API_CUSTOM_DATA_TYPE:         "37",
            BUILD_OPTION:                 "38",
            HIDDEN_VALUE_TYPE:            "42",
            ENABLE_META_TAGS:             "43",
            COMPUTATION_ITEM_NAME:        "51",
            COMPUTATION_TYPE:             "52",
            COMPUTATION_STATIC_VALUE:     "53",
            COMPUTATION_SQL_STATEMENT:    "54",
            COMPUTATION_ITEM_VALUE:       "58",
            COMPUTATION_PREFERENCE_VALUE: "59",
            EXECUTION_SEQUENCE:    "60",
            COMPUTATION_POINT:     "61",
            EVENT:                 "62",
            CUSTOM_EVENT:          "63",
            WHEN_TYPE:             "64",
            WHEN_REGION:           "65",
            WHEN_BUTTON:           "66",
            WHEN_ITEMS:            "67",
            WHEN_DOM_OBJECT:       "68",
            WHEN_JQUERY_SELECTOR:  "69",
            JS_CONDITION:          "70",
            WHEN_IG_REGION:        "71",
            API_VALUE_TYPE_BASIC:  "72",
            API_VALUE_TYPE_BLOB:   "73",
            API_VALUE_TYPE_CUSTOM: "74",
            DA_EXECUTION_TYPE:         "79",
            DA_EXECUTION_IMMEDIATE:    "81",
            DA_ACTION_TYPE:            "82",
            FIRE_WHEN_EVENT_RESULT_IS: "83",
            FIRE_ON_PAGE_LOAD:         "84",
            AFFECTED_TYPE:             "85",
            AFFECTED_REGION:           "86",
            AFFECTED_BUTTON:           "87",
            AFFECTED_ITEMS:            "88",
            AFFECTED_DOM_OBJECT:       "89",
            AFFECTED_JQUERY_SELECTOR:  "90",
            ITEM_TYPE:               "93",
            REGION_TYPE:             "94",
            PAGE_PROCESS_TYPE:       "95",
            ITEM_NAME:               "96",
            DISPLAY_SEQUENCE:        "97",
            REGION:                  "98",
            ITEM_LABEL:              "99",
            LABEL_ALIGNMENT:         "100",
            FIELD_TEMPLATE:          "101",
            VALUE_REQUIRED:          "103",
            GRID_NEW_GRID:           "104",
            GRID_NEW_ROW:            "105",
            GRID_COLUMN:             "106",
            GRID_NEW_COLUMN:         "107",
            GRID_COLUMN_SPAN:        "108",
            GRID_ROW_SPAN:           "109",
            GRID_COLUMN_ATTRIBUTES:  "110",
            FORMAT_MASK:             "111",
            FORMAT_MASK_DATE:        "112",
            LOV_DISPLAY_EXTRA:       "115",
            LOV_DISPLAY_NULL:        "116",
            LOV_SQL:                 "122",
            ELEMENT_FIELD_ALIGNMENT: "123",
            ELEMENT_WIDTH:           "124",
            ELEMENT_MAX_CHARACTERS:  "125",
            ELEMENT_HEIGHT:          "126",
            CUSTOM_ATTRIBUTES:       "129",
            SOURCE_USED:             "133",
            SOURCE_TYPE:             "134",
            TASK_VALUE_TYPE:         "140",
            SOURCE_DB_COLUMN:        "141",
            ITEM_MAINTAIN_SESSION_STATE:   "144",
            ITEM_DEFAULT_TYPE:             "145",
            ITEM_DEFAULT_STATIC_TEXT:      "146",
            READ_ONLY_HTML_ATTRIBUTES:     "171",
            SESSION_STATE_PROTECTION:      "172",
            BUTTON_NAME:                   "176",
            BUTTON_LABEL:                  "177",
            HAS_DEFAULT:                   "178",
            ALIGNMENT:                     "179",
            STATIC_ID:                     "180",
            DOM_STATIC_ID:                 "181",
            BUTTON_TEMPLATE:               "182",
            BUTTON_IS_HOT:                 "183",
            COLUMN_NAME_UPPER:             "186",
            BUTTON_TARGET:                 "187",
            PARENT_REGION:                 "190",
            SLOT_PLACEHOLDER:              "191",
            PROCESS_POINT:                 "192",
            REGION_SQL:                    "193",
            REGION_PLUGIN_PLAIN:           "194",
            PLSQL_CODE:                    "198",
            REGION_HTML_CODE:              "214",
            REGION_TEMPLATE:               "217",
            ITEM_DISPLAY_POSITION:         "218",
            REGION_DISPLAY_SELECTOR:       "219",
            REGION_IMAGE:                  "220",
            REGION_FUNCTION_RETURNING_SQL: "225",
            BRANCH_TYPE:               "226",
            BRANCH_POINT:              "227",
            TARGET:                    "228",
            BRANCH_PAGE_NUMBER:        "229",
            BRANCH_ITEM:               "230",
            WHEN_BUTTON_PRESSED:       "234",
            MENU_ENTRY_TYPE:           "238",
            HIDDEN_PLUGIN_NAME:        "239",
            ACTION_POSITION:           "240",
            TEMPLATE_COMPONENT_TYPE:   "243",
            ALWAYS_EXECUTE:            "245",
            ASSOCIATED_ITEM:           "247",
            ASSOCIATED_COLUMN:         "248",
            EXECUTE_CONDITION:         "250",
            VALIDATION_REGION:         "251",
            BUTTON_ACTION:             "252",
            DIALOG_TEMPLATE:           "254",
            OVERWRITE_NAVIGATION_LIST: "255",
            NAVIGATION_LIST:           "256",
            NAVIGATION_LIST_TEMPLATE:  "257",
            REGION_ACTION_PARENT_MENU: "258",
            ACTION_TEMPLATE:        "259",
            HIDDEN_TEMPLATE_ID:     "260",
            COLUMN_NAME:            "267",
            COLUMN_TYPE:            "268",
            IR_COLUMN_DISPLAY_TYPE: "271",
            COLUMN_HEADING:         "272",
            HEADING_ALIGNMENT:      "275",
            COLUMN_ALIGNMENT:       "276",
            ALLOW_USERS_TO_HIDE:           "277",
            ALLOW_USERS_TO_SORT:           "278",
            ALLOW_USERS_TO_FILTER:         "279",
            ALLOW_USERS_TO_HIGHLIGHT:      "280",
            ALLOW_USERS_TO_CONTROL_BREAK:  "281",
            ALLOW_USERS_TO_AGGREGATE:      "282",
            ALLOW_USERS_TO_COMPUTE:        "283",
            ALLOW_USERS_TO_CHART:          "284",
            ALLOW_USERS_TO_GROUP_BY:       "285",
            IR_COLUMN_FILTER_TYPE:         "286",
            HTML_EXPRESSION:               "289",
            LINK_TEXT:                     "290",
            IR_COLUMN_ACTION_PARENT_MENU:  "296",
            WHEN_NO_DATA_FOUND_MESSAGE:    "297",
            HIDDEN_COLUMNS_HAVE_GROUPS:    "301",
            DOWNLOAD_FORMATS:              "308",
            LINK_ICON:                     "319",
            SHOW_DOWNLOAD:                 "352",
            PROCESS_REGION:                "370",
            DA_EVENT:                      "371",
            LOV_TYPE:                      "373",
            LOV_STATIC_VALUES:             "374",
            TZ_DEPENDENT:                  "375",
            CHART_TITLE:                   "380",
            CHANGED_BY:                    "381",
            CHANGED_ON:                    "382",
            ALLOW_USERS_TO_PIVOT:          "383",
            HAS_GENERIC_COLUMNS:           "390",
            GENERIC_COLUMN_COUNT:          "391",
            CLASSIC_REPORT_COLUMN_TYPE:    "398",
            COLUMN_SORT_SEQUENCE:          "406",
            DISABLE_SORT_COLUMN:           "408",
            INCLUDE_IN_EXPORT_PRINT:       "409",
            HEADINGS_TYPE:                 "427",
            HEADING_TYPE_PLSQL_FUNCTION_BODY: "428",
            NUMBER_OF_ROWS_TYPE:            "433",
            NUMBER_OF_ROWS:                 "434",
            NUMBER_OF_ROWS_ITEM:            "435",
            TAB_FORM_COLUMN_TYPE:           "452",
            HIDDEN_TEMPLATE_COMPONENT_TYPE: "456",
            BRANCH_ACCEPT_REQUEST:          "465",
            QUERY_COLUMN_ID:                "466",
            DERIVED_COLUMN:                 "467",
            SERIES_CHART_TYPE:              "474",
            SOURCE_GRAPH_OWNER:             "475",
            SOURCE_GRAPH_NAME:              "476",
            SOURCE_GRAPH_MATCH_CLAUSE:      "477",
            SOURCE_GRAPH_WHERE_CLAUSE:      "478",
            SOURCE_GRAPH_COLUMNS_CLAUSE:    "479",
            SOURCE_GRAPH_STATIC_ORDER_BY:   "480",
            SOURCE_GRAPH_ORDER_BY:          "481",
            SOURCE_GRAPH_ORDER_BY_ITEM:     "482",
            CHART_HEIGHT:                   "545",
            VALUE_DECIMAL_PLACES:           "588",
            PRINT_PAGE_SIZE:                "700",
            PRINT_ORIENTATION:              "701",
            PRINT_UNITS:                    "702",
            PRINT_WIDTH:                    "703",
            PRINT_HEIGHT:                   "704",
            PRINT_PAGE_HEADER_TEXT:         "712",
            ENABLE_PRINTING:                "729",
            PLUGIN_ATTR_REGION_TYPE:        "737",
            HIDDEN_REGION_TYPE:             "737",
            IS_VISIBLE:                     "738",
            COMPUTATION_SQL_COLON:          "744",
            IS_GLOBAL_PAGE:                 "749",
            PARAMETER_ID:                   "753",
            PAGE_NAVIGATION_TYPE:           "754",
            AFFECTED_JAVASCRIPT_EXPRESSION: "755",
            WHEN_JAVASCRIPT_EXPRESSION:     "756",
            NAVIGATION_LIST_POSITION:       "757",
            GRID_LABEL_COLUMN_SPAN:         "760",
            GRID_COLUMN_CSS_CLASSES:        "763",
            JS_COND_VALUE:                  "766",
            JS_COND_LIST:                   "767",
            MASTER_REGION:                  "769",
            IS_EDITABLE:                    "770",
            PAGINATION_TYPE:                "783",
            SHOW_TOTAL_ROW_COUNT:           "784",
            ENABLE_DOWNLOAD:                "791",
            IG_DOWNLOAD_FORMATS:            "792",
            ALTERNATIVE_LABEL:              "804",
            COLUMN_FILTER:                  "807",
            FILTER_LOV_TYPE:                "811",
            GRID_ROW_CSS_CLASSES:           "814",
            COLUMN_SOURCE_TYPE:             "815",
            SOURCE_SQL_EXPRESSION:          "817",
            DATA_TYPE:                      "818",
            IS_QUERY_ONLY:                  "819",
            IS_PRIMARY_KEY:                 "820",
            MASTER_COLUMN:                  "821",
            ENABLE_SORT_GROUP:              "822",
            EXECUTE_READONLY:               "828",
            JET_CHART_TYPE:                 "829",
            IS_GROUP:                       "832",
            JET_GAUGE_ORIENTATION:          "838",
            VALUE_FORMAT_TYPE:              "847",
            VALUE_FORMAT_SCALING:           "850",
            LEGEND_RENDERED:                "857",
            CHART_MAX_WIDTH:                "862",
            JET_SERIES_TYPE_COMBO:          "864",
            DATA_SOURCE_TYPE:               "866",
            DATA_SOURCE_QUERY:              "867",
            DATA_SOURCE_FUNC_RETURN_SQL:    "868",
            LINK_TARGET_TYPE:               "870",
            RELOAD_ON_SUBMIT:               "915",
            JET_SERIES_TYPE_RANGE:          "934",
            JET_SERIES_TYPE_POLAR:          "936",
            JET_SERIES_TYPE_RADAR:          "937",
            JET_SERIES_TYPE_COLUMN_MAPPING: "932",
            ASSIGNED_TO_Y2:                 "907",
            ITEMS_LABEL_RENDERED:           "908",
            FILTER_DATA_TYPE:               "938",
            ITEM_WARN_ON_UNSAVED_CHANGES:   "940",
            INIT_JAVASCRIPT_FUNCTION:       "943",
            WHEN_COLUMNS:                   "944",
            JS_CONDITION_ELEMENT_TYPE:      "945",
            JS_CONDITION_ITEM_WHEN_IG:      "946",
            JS_CONDITION_COLUMN_WHEN_IG:    "947",
            AFFECTED_COLUMNS:               "948",
            IG_REGION:                      "949",
            JS_CONDITION_ITEM:              "950",
            JS_CONDITION_WHEN_IG:           "951",
            JS_COND_VALUE_WHEN_IG:          "952",
            JS_COND_LIST_WHEN_IG:           "953",
            SOURCE_LOCATION:                "957",
            SOURCE_REMOTE_DATABASE:         "958",
            SOURCE_QUERY_TYPE:              "959",
            SOURCE_QUERY_OWNER:             "960",
            SOURCE_QUERY_TABLE:             "961",
            SOURCE_QUERY_WHERE:             "962",
            SOURCE_QUERY_ORDER_BY:          "963",
            SOURCE_SQL_QUERY:               "964",
            SOURCE_WEB_SRC_QUERY:           "967",
            SOURCE_WEB_SRC_ARRAY_COL:       "969",
            JET_SERIES_TYPE_BOX_PLOT:         "973",
            OPTIMIZER_HINT:                   "975",
            SOURCE_INCLUDE_ROWID_COLUMN:      "978",
            JET_AXIS_SCALE:                   "983",
            DIRECTION:                        "998",
            IS_STATIC:                        "1000",
            PARAMETER_REQUIRED:               "1001",
            PARAMETER_VALUE:                  "1002",
            DATABASE_OPERATION:               "1003",
            WEB_SRC_PARAM:                    "1004",
            VALUE_TYPE:                       "1005",
            OUT_VALUE_TYPE:                   "1008",
            VALUE_STATIC_VALUE:               "1006",
            VALUE_ITEM:                       "1009",
            HTTP_METHOD:                      "1013",
            PLSQL_PROCESS_LOCATION:           "1014",
            CHILD_SOURCE_LOCATION:            "1032",
            SOURCE_POST_PROCESSING:           "1034",
            POST_PROC_WHERE:                  "1035",
            POST_PROC_ORDER_BY:               "1036",
            POST_PROC_SQL_QUERY:              "1041",
            DATA_SOURCE_REGION:               "1060",
            DATA_SOURCE_COLUMN:               "1061",
            PROCESS_DATA_SOURCE_REGION:       "1062",
            SOURCE_FILTERED_REGION:           "1090",
            FACET_LOV_TYPE:                   "1091",
            FC_ZERO_COUNT_ENTRIES:            "1094",
            FC_SORT_BY_TOP_COUNTS:            "1103",
            DEPENDING_ON_FACET:               "1104",
            WEB_SRC_HAS_LOCAL_TABLE:          "1111",
            WEB_SRC_USE_LOCAL_TABLE:          "1112",
            WEB_SRC_HAS_ARRAY_COLUMNS:        "2382",
            DOC_SRC_HAS_ARRAY_COLUMNS:        "53520011",
            ICON_SOURCE_TYPE:                 "1151",
            MEDIA_SOURCE_TYPE:                "1163",
            FACET_GROUP:                      "1172",
            HIDDEN_PARENT_REGION:             "1173",
            DEPENDING_ON_FACET_GRP_ITEM:      "1175",
            FC_SHOW_CHART:                    "1176",
            CARD_ACTION_TYPE:                 "1180",
            ACTION_LINK_TARGET_TYPE:          "1182",
            CARD_USES_BLOB_COLUMN:            "1184",
            //
            MULTI_VALUE_SEPARATOR:            "1222",
            //
            SUGGESTIONS_TYPE:                 "1226",
            SFILTER_GROUP:                    "1233",
            //
            SOURCE_QUERY_ORDER_BY_TYPE:       "1238",
            SOURCE_QUERY_ORDER_BY_ITEM:       "1239",
            SOURCE_QUERY_STATIC_ORDER_BY:     "1246",
            PLSQL_REMOTE_DATABASE:            "1248",
            SOURCE_REMOTE_DATABASE_TYPE:      "1331",
            IDENTIFICATION_STATIC_ID:         "1413",
            WEB_SRC_PARAM_TYPE:               "1416",
            TASK_DEF_PARAM:                   "1522",
            COLUMN_MAPPING_PK_COLUMN:         "1532",
            REGION_IMAGE_URL:                 "1603",
            REGION_IMAGE_ALT_TEXT:            "1604",
            REGION_IMAGE_ATTRIBUTES:          "1605",
            DUE_ON_TYPE:                      "1660",
            DUE_ON_INTERVAL_VALUE:            "1661",
            DUE_ON_SCHEDULER_VALUE:           "1662",
            DUE_ON_QUERY_VALUE:               "1663",
            NAME_HIDDEN:                      "1665",
            USE_LANDMARK:                     "1669",
            LANDMARK_TYPE:                    "1670",
            //
            META_TAG_NAME:                    "1672",
            META_TAG_VALUE:                   "1673",
            //
            SIMPLE_SOURCE_QUERY_TYPE:         "1718",
            PARENT_PROCESS:                   "1759",
            //
            PAGE_ITEM_DATA_TYPE:                    "1757",
            REGION_COLUMN_SESSION_STATE_DATA_TYPE:  "1758",
            //
            WEB_SRC_PARAM_DATA_TYPE:                "1768",
            //
            WF_IDENTIFICATION_STATIC_ID:      "2000",
            WORKFLOW_VALUE_TYPE:              "2001",
            WORKFLOW_PARAM:                   "2002",
            WORKFLOW_DATA_TYPE:               "2003",
            STATE:                            "2004",
            WORKFLOW_PARTICIPANT_TYPE:        "2005",
            FROM_WORKFLOW_ACTIVITY:           "2006",
            TO_WORKFLOW_ACTIVITY:             "2007",
            TRANSITION_TYPE:                  "2008",
            WORKFLOW_VERSION:                 "2009",
            SWITCH_TYPE:                      "2010",
            WHEN:                             "2011",
            OPERATOR:                         "2012",
            COMPARE_VALUE:                    "2013",
            DIAGRAM:                          "2015",
            PARAMETER_VALUE_TYPE:             "2021",
            WF_SOURCE_QUERY_TYPE:             "2024",
            WF_SOURCE_QUERY_OWNER:            "2025",
            WF_SOURCE_QUERY_TABLE:            "2026",
            WF_SOURCE_SQL_QUERY:              "2027",
            PARAMETER_DEFAULT_VALUE:          "2202",
            VALUE_PARENT_COLUMN:              "2381",
            //
            MULTI_VALUE_SEPARATOR_OPTIONAL:   "2361",
            MULTI_VALUE_SEPARATOR_ALWAYS:     "2362",
            MULTI_VALUE_TYPE_OPTIONAL:        "2363",
            //
            PAGE_SUBSCRIBED_FROM:             "2392",
            //
            HIDDEN_SOURCE_LOCATION:           "2421",
            //
            READ_ONLY_TYPE:                         "5050",
            //
            COMPUTATION_EXPRESSION_LANG:            "5200",
            COMPUTATION_SQL_EXPRESSION_VARCHAR2:    "5201",
            COMPUTATION_PLSQL_EXPRESSION_VARCHAR2:  "5202",
            COMPUTATION_JS_EXPRESSION_VARCHAR2:     "5203",
            COMPUTATION_JAVA_EXPRESSION_VARCHAR2:   "5204",
            COMPUTATION_PYTHON_EXPRESSION_VARCHAR2: "5205",
            COMPUTATION_FUNC_BODY_LANG:             "5220",
            COMPUTATION_PLSQL_FUNC_BODY_VARCHAR2:   "5221",
            COMPUTATION_JS_FUNC_BODY_VARCHAR2:      "5222",
            COMPUTATION_JAVA_FUNC_BODY_VARCHAR2:    "5223",
            COMPUTATION_PYTHON_FUNC_BODY_VARCHAR2:  "5224",
            //
            LOV_FUNC_BODY_LANG:       "5320",
            LOV_PLSQL_FUNC_BODY_SQL:  "5321",
            LOV_JS_FUNC_BODY_SQL:     "5322",
            LOV_JAVA_FUNC_BODY_SQL:   "5323",
            LOV_PYTHON_FUNC_BODY_SQL: "5324",
            //
            SOURCE_QUERY_FUNC_BODY_LANG:       "5360",
            SOURCE_QUERY_PLSQL_FUNC_BODY_SQL:  "5361",
            SOURCE_QUERY_JS_FUNC_BODY_SQL:     "5362",
            SOURCE_QUERY_JAVA_FUNC_BODY_SQL:   "5363",
            SOURCE_QUERY_PYTHON_FUNC_BODY_SQL: "5364",
            //
            POST_PROC_FUNC_BODY_LANG:                   "5380",
            POST_PROC_PLSQL_FUNC_BODY_SQL:              "5381",
            POST_PROC_JS_FUNC_BODY_SQL:                 "5382",
            POST_PROC_JAVA_FUNC_BODY_SQL:               "5383",
            POST_PROC_PYTHON_FUNC_BODY_SQL:             "5384",
            //
            VALIDATION_TYPE:               "5400",
            VAL_SQL_STATEMENT:             "5401",
            VAL_ITEM:                      "5402",
            VAL_VALUE:                     "5403",
            VAL_REGULAR_EXPRESSION:        "5404",
            VAL_FUNC_BODY_LANG_ERROR:      "5405",
            VAL_PLSQL_FUNC_BODY_ERROR:     "5406",
            VAL_JS_FUNC_BODY_ERROR:        "5407",
            VAL_JAVA_FUNC_BODY_ERROR:      "5408",
            VAL_PYTHON_FUNC_BODY_ERROR:    "5409",
            VAL_PLSQL:                     "5425",
            VAL_EXPRESSION_LANG:           "5426",
            VAL_SQL_EXPRESSION_BOOLEAN:    "5427",
            VAL_PLSQL_EXPRESSION_BOOLEAN:  "5428",
            VAL_JS_EXPRESSION_BOOLEAN:     "5429",
            VAL_JAVA_EXPRESSION_BOOLEAN:   "5430",
            VAL_PYTHON_EXPRESSION_BOOLEAN: "5431",
            VAL_FUNC_BODY_LANG:            "5446",
            VAL_PLSQL_FUNC_BODY_BOOLEAN:   "5447",
            VAL_JS_FUNC_BODY_BOOLEAN:      "5448",
            VAL_JAVA_FUNC_BODY_BOOLEAN:    "5449",
            VAL_PYTHON_FUNC_BODY_BOOLEAN:  "5450",
            //
            REGION_VALIDATION_TYPE:               "5500",
            REGION_VAL_SQL_STATEMENT:             "5501",
            REGION_VAL_COLUMN:                    "5502",
            REGION_VAL_VALUE:                     "5503",
            REGION_VAL_REGULAR_EXPRESSION:        "5504",
            REGION_VAL_FUNC_BODY_LANG_ERROR:      "5505",
            REGION_VAL_PLSQL_FUNC_BODY_ERROR:     "5506",
            REGION_VAL_JS_FUNC_BODY_ERROR:        "5507",
            REGION_VAL_JAVA_FUNC_BODY_ERROR:      "5508",
            REGION_VAL_PYTHON_FUNC_BODY_ERROR:    "5509",
            REGION_VAL_PLSQL:                     "5525",
            REGION_VAL_EXPRESSION_LANG:           "5526",
            REGION_VAL_SQL_EXPRESSION_BOOLEAN:    "5527",
            REGION_VAL_PLSQL_EXPRESSION_BOOLEAN:  "5528",
            REGION_VAL_JS_EXPRESSION_BOOLEAN:     "5529",
            REGION_VAL_JAVA_EXPRESSION_BOOLEAN:   "5530",
            REGION_VAL_PYTHON_EXPRESSION_BOOLEAN: "5531",
            REGION_VAL_FUNC_BODY_LANG:            "5546",
            REGION_VAL_PLSQL_FUNC_BODY_BOOLEAN:   "5547",
            REGION_VAL_JS_FUNC_BODY_BOOLEAN:      "5548",
            REGION_VAL_JAVA_FUNC_BODY_BOOLEAN:    "5549",
            REGION_VAL_PYTHON_FUNC_BODY_BOOLEAN:  "5550",
            //
            CONDITION_TYPE:                      "5100",
            CONDITION_SQL_STATEMENT:             "5101",
            CONDITION_VALUE1:                    "5102",
            CONDITION_ITEM1:                     "5103",
            CONDITION_LIST:                      "5104",
            CONDITION_PREFERENCE:                "5105",
            CONDITION_PAGE:                      "5106",
            CONDITION_PAGES:                     "5107",
            CONDITION_TEXT:                      "5108",
            CONDITION_VALUE2:                    "5109",
            CONDITION_ITEM2:                     "5110",
            CONDITION_TEXT2:                     "5111",
            CONDITION_EXPRESSION_LANG:           "5112",
            CONDITION_SQL_EXPRESSION_BOOLEAN:    "5113",
            CONDITION_PLSQL_EXPRESSION_BOOLEAN:  "5114",
            CONDITION_JS_EXPRESSION_BOOLEAN:     "5115",
            CONDITION_JAVA_EXPRESSION_BOOLEAN:   "5116",
            CONDITION_PYTHON_EXPRESSION_BOOLEAN: "5117",
            CONDITION_FUNC_BODY_LANG:            "5132",
            CONDITION_PLSQL_FUNC_BODY_BOOLEAN:   "5133",
            CONDITION_JS_FUNC_BODY_BOOLEAN:      "5134",
            CONDITION_JAVA_FUNC_BODY_BOOLEAN:    "5135",
            CONDITION_PYTHON_FUNC_BODY_BOOLEAN:  "5136",
            //
            SOURCE_SNIPPET_LANG: "5660",
            SOURCE_PLSQL_CODE:   "5661",
            SOURCE_JS_CODE:      "5662",
            SOURCE_JAVA_CODE:    "5663",
            SOURCE_PYTHON_CODE:  "5664",
            //
            WF_CONDITION_TYPE:   "7000",
            //
            //
            SOURCE_DUALITY_VIEW:                        "53520005",
            SOURCE_DUALITY_VIEW_ARRAY_COL:              "53520009",
            //
            DUALITYVIEW_SOURCE_POST_PROCESSING:         "53520012",
            DUALITYVIEW_POST_PROC_WHERE:                "53520013",
            DUALITYVIEW_POST_PROC_ORDER_BY:             "53520014",
            DUALITYVIEW_POST_PROC_SQL_QUERY:            "53520015",
            //
            DUALITYVIEW_POST_PROC_FUNC_BODY_LANG:       "53520100",
            DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL:  "53520101",
            DUALITYVIEW_POST_PROC_JS_FUNC_BODY_SQL:     "53520102",
            DUALITYVIEW_POST_PROC_JAVA_FUNC_BODY_SQL:   "53520103",
            DUALITYVIEW_POST_PROC_PYTHON_FUNC_BODY_SQL: "53520104",
            //
            //
            SOURCE_JSON_COLLECTION:                     "53520006",
            SOURCE_JSON_COLLECTION_ARRAY_COL:           "53520010",
            //
            JSONCOLL_SOURCE_POST_PROCESSING:            "53520019",
            JSONCOLL_POST_PROC_WHERE:                   "53520020",
            JSONCOLL_POST_PROC_ORDER_BY:                "53520021",
            JSONCOLL_POST_PROC_SQL_QUERY:               "53520022",
            //
            JSONCOLL_POST_PROC_FUNC_BODY_LANG:          "53520120",
            JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL:     "53520121",
            JSONCOLL_POST_PROC_JS_FUNC_BODY_SQL:        "53520122",
            JSONCOLL_POST_PROC_JAVA_FUNC_BODY_SQL:      "53520123",
            JSONCOLL_POST_PROC_PYTHON_FUNC_BODY_SQL:    "53520124",
            //
            //
            // Plug-in Attributes
            //
            FORM_FETCH_TABLE_NAME:         "361800327927635543",
            FORM_PROCESS_TABLE_NAME:       "723641536018615468"
        },
        SOURCE_LOCATION_PROPS = [
            PROP.POST_PROC_SQL_QUERY,
            PROP.POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.POST_PROC_JS_FUNC_BODY_SQL,
            PROP.POST_PROC_JAVA_FUNC_BODY_SQL,
            PROP.POST_PROC_PYTHON_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_SQL_QUERY,
            PROP.JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_JS_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_JAVA_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_PYTHON_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_SQL_QUERY,
            PROP.DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_JS_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_JAVA_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_PYTHON_FUNC_BODY_SQL,
            //
            PROP.SOURCE_QUERY_TABLE,
            PROP.SOURCE_GRAPH_COLUMNS_CLAUSE,
            PROP.SOURCE_SQL_QUERY,
            PROP.SOURCE_WEB_SRC_QUERY,
            PROP.SOURCE_DUALITY_VIEW,
            PROP.SOURCE_JSON_COLLECTION,
            PROP.SOURCE_QUERY_PLSQL_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JS_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JAVA_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_PYTHON_FUNC_BODY_SQL,
            PROP.REGION_SQL,
            PROP.REGION_FUNCTION_RETURNING_SQL ],
        SOURCE_POST_PROC_FUNC_BODY_SQL_PROPS = [
            PROP.SOURCE_QUERY_PLSQL_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JS_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JAVA_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_PYTHON_FUNC_BODY_SQL,
            PROP.POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.POST_PROC_JS_FUNC_BODY_SQL,
            PROP.POST_PROC_JAVA_FUNC_BODY_SQL,
            PROP.POST_PROC_PYTHON_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_JS_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_JAVA_FUNC_BODY_SQL,
            PROP.JSONCOLL_POST_PROC_PYTHON_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_SQL_QUERY,
            PROP.DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_JS_FUNC_BODY_SQL,
            PROP.DUALITYVIEW_POST_PROC_JAVA_FUNC_BODY_SQL ],
        SOURCE_FUNC_BODY_SQL_PROPS = [
            PROP.SOURCE_QUERY_PLSQL_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JS_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_JAVA_FUNC_BODY_SQL,
            PROP.SOURCE_QUERY_PYTHON_FUNC_BODY_SQL ],
        SOURCE_SNIPPET_PROPS = [
            PROP.SOURCE_PLSQL_CODE,
            PROP.SOURCE_JS_CODE,
            PROP.SOURCE_JAVA_CODE,
            PROP.SOURCE_PYTHON_CODE,
            PROP.PLSQL_CODE ],
        // List of component types that are now displayed as PE tabs, and not as distinct nodes in the tree
        NO_NODE_COMP_TYPES = [
            COMP_TYPE.CLASSIC_CALENDAR,
            COMP_TYPE.IR_ATTRIBUTES,
            COMP_TYPE.IR_PRINT_ATTR,
            COMP_TYPE.IG_ATTRIBUTES,
            COMP_TYPE.IG_PRINT,
            COMP_TYPE.JET_CHART,
            COMP_TYPE.CLASSIC_REPORT,
            COMP_TYPE.CLASSIC_RPT_PRINT,
            COMP_TYPE.TABULAR_FORM,
            COMP_TYPE.REGION_PLUGIN_ATTR ],
        EXTRA_ITEM_TYPE_COMP_TYPES = [
            COMP_TYPE.IG_COLUMN,
            COMP_TYPE.FACET,
            COMP_TYPE.FACET_GROUP_ITEM,
            COMP_TYPE.SFILTER,
            COMP_TYPE.SFILTER_GROUP_ITEM ],
        EXTRA_PROCESS_TYPE_COMP_TYPES = [
            COMP_TYPE.WORKFLOW_ACTIVITY
        ],
        UNSORTABLE_COLUMN_DATA_TYPES = [
            "CLOB",
            "BLOB",
            "SDO_GEOMETRY",
            "BFILE",
            "ANYDATA" ];

    // Observer events
    var EVENT = {
        CREATE:        "create",
        CHANGE:        "change",
        DELETE:        "delete",
        ERRORS:        "errors",
        NO_ERRORS:     "no_errors",
        WARNINGS:      "warnings",
        NO_WARNINGS:   "no_warnings",
        ADD_PROP:      "add_property",
        REMOVE_PROP:   "remove_property",
        META_DATA:     "meta_data",
        GRID:          "grid",
        DISPLAY_TITLE: "display_title",
        VALIDATE_COMPONENT:  "validate_component"
    };

    var CALLBACK_ACTION = {
        CREATED:  "created",
        CHANGED:  "changed",
        REMOVED:  "removed",
        VALIDATE: "validate",
        VALIDATE_COMPONENT: "component_validated",
        PARENT_UPDATE: "parent_updated",
        INIT: "init"
    };

    // Used for the status of a component in our gComponents array
    var STATUS = {
        CREATED:   "c",
        UPDATED:   "u",
        DELETED:   "d",
        UNCHANGED: ""
    };

    var PROP_TYPE = {
        COMPONENT:          "COMPONENT",
        COMBOBOX:           "COMBOBOX",
        COLOR:              "COLOR",
        CHECKBOXES:         "CHECKBOXES",
        CSS:                "CSS",
        JAVASCRIPT:         "JAVASCRIPT",
        HTML:               "HTML",
        ICON:               "ICON",
        INTEGER:            "INTEGER",
        LINK:               "LINK",
        NUMBER:             "NUMBER",
        ITEM:               "ITEM",
        FACET:              "FACET",
        PAGE:               "PAGE",
        PLSQL:              "PLSQL",
        PLSQL_EXPR_VARCHAR: "PLSQL EXPRESSION VARCHAR2",
        PLSQL_EXPR_BOOLEAN: "PLSQL EXPRESSION BOOLEAN",
        PLSQL_EXPR_CUSTOM:  "PLSQL EXPRESSION CUSTOM",
        PLSQL_FUNC_VARCHAR: "PLSQL FUNCTION BODY VARCHAR2",
        PLSQL_FUNC_CLOB:    "PLSQL FUNCTION BODY CLOB",
        PLSQL_FUNC_BOOLEAN: "PLSQL FUNCTION BODY BOOLEAN",
        PLSQL_FUNC_CUSTOM:  "PLSQL FUNCTION BODY CUSTOM",
        PLSQL_FUNC_SQL:     "PLSQL FUNCTION BODY SQL",
        CODE_LANGUAGE:       "CODE LANGUAGE",
        MLE_JS:              "MLE JAVASCRIPT",
        MLE_JS_EXPR_VARCHAR: "MLE JAVASCRIPT EXPRESSION VARCHAR2",
        MLE_JS_EXPR_BOOLEAN: "MLE JAVASCRIPT EXPRESSION BOOLEAN",
        MLE_JS_EXPR_CUSTOM:  "MLE JAVASCRIPT EXPRESSION CUSTOM",
        MLE_JS_FUNC_VARCHAR: "MLE JAVASCRIPT FUNCTION BODY VARCHAR2",
        MLE_JS_FUNC_CLOB:    "MLE JAVASCRIPT FUNCTION BODY CLOB",
        MLE_JS_FUNC_BOOLEAN: "MLE JAVASCRIPT FUNCTION BODY BOOLEAN",
        MLE_JS_FUNC_CUSTOM:  "MLE JAVASCRIPT FUNCTION BODY CUSTOM",
        MLE_JS_FUNC_SQL:     "MLE JAVASCRIPT FUNCTION BODY SQL",
        SELECT_LIST:        "SELECT LIST",
        SQL:                "SQL",
        SQL_EXPR:           "SQL EXPRESSION",
        SQL_EXPR_BOOLEAN:   "SQL EXPRESSION BOOLEAN",
        SQL_EXPR_CUSTOM:    "SQL EXPRESSION CUSTOM",
        SUBSCRIPTION:       "SUBSCRIPTION",
        TEXT:               "TEXT",
        TEXTAREA:           "TEXTAREA",
        TEXT_EDITOR:        "TEXT EDITOR",
        FILE_URLS_JAVASCRIPT: "FILE URLS JAVASCRIPT",
        FILE_URLS_CSS:      "FILE URLS CSS",
        SUPPORTED_UI:       "SUPPORTED UI",
        YES_NO:             "YES NO",
        PILL_BUTTONS:       "PILL BUTTONS",
        OWNER:              "OWNER",
        TABLE:              "TABLE",
        COLUMN:             "COLUMN",
        REGION_COLUMN:      "REGION COLUMN",
        WHERE_CLAUSE:       "WHERE CLAUSE",
        ORDER_BY_CLAUSE:    "ORDER BY CLAUSE",
        ORDER_BY_ITEM:      "ORDER BY ITEM",
        REST_SOURCE_ID:     "REST SOURCE ID",
        REST_OPERATION_ID:  "REST OPERATION ID",
        TEMPLATE_OPTIONS:   "TEMPLATE OPTIONS",
        PLACEHOLDER_JSON:   "PLACEHOLDER JSON",
        PLSQL_PACKAGE:      "PLSQL PACKAGE",
        PLSQL_METHOD:       "PLSQL METHOD",
        GRAPH:              "GRAPH",
        MEDIA:              "MEDIA",
        SESSION_STATE_VALUE:"SESSION STATE VALUE",
        WORKFLOW_ITEM:      "WORKFLOW ITEM",
        SWITCH_BUTTON:      "SWITCH BUTTON"
    };

    var PROP_TYPES_RETURNING_SQL = [
        PROP_TYPE.SQL,
        PROP_TYPE.PLSQL_FUNC_SQL,
        PROP_TYPE.MLE_JS_FUNC_SQL
    ];

    var PROP_TYPES_EXP_FUNC_CUSTOM = [
        PROP_TYPE.SQL_EXPR_CUSTOM,
        PROP_TYPE.PLSQL_EXPR_CUSTOM,
        PROP_TYPE.PLSQL_FUNC_CUSTOM,
        PROP_TYPE.MLE_JS_EXPR_CUSTOM,
        PROP_TYPE.MLE_JS_FUNC_CUSTOM
    ];

    var MESSAGE_ACTION = {
        CHANGE:     "CHANGE_ATTRIBUTE",
        CREATE:     "CREATE",
        DELETE:     "DELETE",
        DUPLICATE:  "DUPLICATE",
        MOVE:       "MOVE"
    };

    var LOCATION = {
        WEB_SOURCE:      "WEB_SOURCE",
        DUALITY_VIEW:    "DUALITY_VIEW",
        JSON_COLLECTION: "JSON_COLLECTION" };

    var CATEGORY = {
        NATIVE:         "NATIVE",
        APPLICATION:    "APPLICATION",
        THEME:          "THEME"
    };

    // Map of plug-in properties which are set by _setDynamicProperties and where the value specifies the related plug-in standard attribute
    var PLUGIN_DYNAMIC_PROPERTIES_MAP = {};
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_LOCATION ]                            = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_QUERY_TABLE ]                         = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_GRAPH_NAME ]                          = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_SQL_QUERY ]                           = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_QUERY_PLSQL_FUNC_BODY_SQL ]           = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_QUERY_JS_FUNC_BODY_SQL ]              = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_QUERY_JAVA_FUNC_BODY_SQL ]            = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_QUERY_PYTHON_FUNC_BODY_SQL ]          = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_WEB_SRC_QUERY ]                       = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_DUALITY_VIEW ]                        = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.SOURCE_JSON_COLLECTION ]                     = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.POST_PROC_SQL_QUERY ]                        = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.POST_PROC_PLSQL_FUNC_BODY_SQL ]              = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.POST_PROC_JS_FUNC_BODY_SQL ]                 = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.POST_PROC_JAVA_FUNC_BODY_SQL ]               = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.POST_PROC_PYTHON_FUNC_BODY_SQL ]             = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.DUALITYVIEW_POST_PROC_SQL_QUERY ]            = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL ]  = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.DUALITYVIEW_POST_PROC_JS_FUNC_BODY_SQL ]     = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.DUALITYVIEW_POST_PROC_JAVA_FUNC_BODY_SQL ]   = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.DUALITYVIEW_POST_PROC_PYTHON_FUNC_BODY_SQL ] = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.JSONCOLL_POST_PROC_SQL_QUERY ]               = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL ]     = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.JSONCOLL_POST_PROC_JS_FUNC_BODY_SQL ]        = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.JSONCOLL_POST_PROC_JAVA_FUNC_BODY_SQL ]      = "SOURCE_LOCATION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.JSONCOLL_POST_PROC_PYTHON_FUNC_BODY_SQL ]    = "SOURCE_LOCATION";

    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.REGION_SQL ]           = "SOURCE_SQL";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.PLSQL_CODE ]           = "SOURCE_PLSQL";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.REGION_HTML_CODE ]     = "SOURCE_HTML";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.REGION_PLUGIN_PLAIN ]  = "SOURCE_PLAIN";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.REGION_FUNCTION_RETURNING_SQL ] = "SOURCE_PLSQL_FUNCTION";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_TYPE ] = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.FACET_LOV_TYPE ] = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_SQL ]  = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_PLSQL_FUNC_BODY_SQL ]  = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_JS_FUNC_BODY_SQL ]     = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_JAVA_FUNC_BODY_SQL ]   = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.LOV_PYTHON_FUNC_BODY_SQL ] = "LOV";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.INIT_JAVASCRIPT_FUNCTION ] = "INIT_JAVASCRIPT_CODE";
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.AFFECTED_TYPE ]  = "REQUIRED"; // Plug-in feature
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.PROCESS_REGION ] = "REGION_REQUIRED"; // Plug-in feature
    PLUGIN_DYNAMIC_PROPERTIES_MAP[ PROP.PROCESS_DATA_SOURCE_REGION ] = "REGION_REQUIRED"; // Plug-in feature

    var RELEASE_NOTES_DEPRECATED_FEATURES = "1.1";

    // Array of internal names of the regions (native or plugins) which support faceted search. It is extended during mergePlugins
    // TODO remove hardcoded NATIVE_SQL_REPORT and NATIVE_MAP_REGION once they've been converted to the "Support Faceted Search" attribute
    var gFacetedSearchRegionTypes = [
        "NATIVE_SQL_REPORT",
        "NATIVE_MAP_REGION"
    ];

    var gDisplayGroups,
        gProperties,
        gTypes,
        gPluginCategories,
        gEvents,
        gActionTemplates = {},
        gActionPositions = {},
        gFormatMasks,
        gSharedComponents,
        gComponents = {},
        gBaseComponents = {},
        gObservers = [],
        gInstanceParameters = {};

    var gOptions = {
            isInternal: false,
            isReadOnly: false
        },
        gCurrentAppId,
        gCurrentPageId,
        gCurrentApp;

    var gIsPageReadOnly = true;

    var hasOwnProperty = util.hasOwnProperty;

    var TEMPLATE_DIRECTIVE_TYPE = {
        C: "CLIENT",
        S: "SERVER"
    };

    var MEDIA_SOURCE = {
        URL: "URL",
        BLOB_COLUMN: "BLOB_COLUMN",
        URL_COLUMN: "URL_COLUMN"
    };

    function isSharedDesignerComponent( id ) {
        return gTypes[ id ]?.isSharedDesignerComponent === true;
    }

    function ajax( pName, pData, pOptions ) {
        // Always set FB_FLOW_ID with every request because a new app could have been opened in another tab (bug# 28285763)
        pData.p_arg_names = [ "FB_FLOW_ID" ];
        pData.p_arg_values = [ gCurrentAppId ];
        return server.process( pName, pData, pOptions );
    }

    function format( pKey ) {
        var pattern = lang.getMessage( "MODEL." + pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.format.apply( this, args );
    }

    function formatNoEscape( pKey ) {
        var pattern = lang.getMessage( "MODEL." + pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    }

    function formatPostfix( pKey, pValue, pResult ) {
        if ( pResult ) {
            return formatNoEscape( pKey, pValue );
        } else {
            return pValue;
        }
    }

    function forEachAttribute( pObject, pFunction ) {
        for ( var lKey in pObject ) {
            if ( hasOwnProperty( pObject, lKey ) ) {
                pFunction( lKey, pObject[ lKey ] );
            }
        }
    }

    function simpleExtend( pObject, pExtendWith ) {
        for ( let i in pExtendWith ) {
            if ( hasOwnProperty( pExtendWith, i ) && !hasOwnProperty( pObject, i ) ) {
                pObject[ i ] = pExtendWith[ i ];
            }
        }
        for ( let i in pObject ) {
            if ( hasOwnProperty( pObject, i ) && pObject[ i ] === undefined ) {
                delete pObject[ i ];
            }
        }
    }

    function enquoteIdentifier( pName ){
        // Only enquote the name if it's case sensitive or contains special characters
        if ( /^[ABCDEFGHIJKLMNOPQRSTUVWXYZ]+[ABCDEFGHIJKLMNOPQRSTUVWXYZ0-9_$]*$/.test( pName ) ) {
            return pName;
        } else {
            return '"' + pName + '"';
        }
    }

    /**
     * Method to merge plug-in meta data into the global properties and component type properties meta data.
     */
    function mergePlugins ( pPlugins, pTitlePostfix, pThemeId ) {

        function setFeatureDependency ( pType, pName, pFeatures, pFeaturesProperties ) {

            let lFeature,
                lPropertyId,
                lDependingOnValues;

            if ( pFeaturesProperties ) {
                for ( let i = 0; i < pFeatures.length; i++ ) {
                    lFeature = pFeatures[ i ];

                    // The component type config contains all the properties that are depending on
                    // a specific feature. Set the necessary dependency.
                    if ( hasOwnProperty( pFeaturesProperties, lFeature ) ) {
                        for ( let j = 0; j < pFeaturesProperties[ lFeature ].length; j++ ) {
                            lPropertyId = pFeaturesProperties[ lFeature ][ j ];
                            lDependingOnValues = pType.properties[ lPropertyId ].dependingOn[ 0 ].values;
                            if ( !lDependingOnValues.includes( pName ) ){
                                lDependingOnValues.push( pName );
                            }
                        }
                    }
                }
            }

            // Special case for item type plug-ins. If the item type doesn't have a special format mask (date or number)
            // we will show the standard format mask instead.
            if (  ( pType.id === COMP_TYPE.PAGE_ITEM || pType.id === COMP_TYPE.IG_COLUMN )
                && !pFeatures.includes( "FORMAT_MASK_DATE" )
                && !pFeatures.includes( "FORMAT_MASK_NUMBER" )
               )
            {
                pType.properties[ PROP.FORMAT_MASK ].dependingOn[ 0 ].values.push( pName );
            }
        } // setFeatureDependency

        function addActions( pParentType, pType, pPlugin ) {
            let lDummyTemplate = {
                id:       "0",
                type:     "LINK",
                features: [ "LINK_URL", "LINK_ATTR" ]
            };

            function addTemplate ( pTemplate ) {
                setFeatureDependency (
                    pType,
                    pTemplate.id,
                    pTemplate.features,
                    pType.properties[ PROP.HIDDEN_TEMPLATE_ID ].featuresProperties );

                gActionTemplates[ pTemplate.id ] = pTemplate;
            } // addTemplate

            // Initialize actionTemplates of the parent (region, ir column )
            // if it hasn't been done so far. It has to be the parent, because
            // no plug-ins are configured for REGION_ACTION, IR_COLUMN_ACTION
            pParentType.actionTemplates = pParentType.actionTemplates || {};
            pParentType.actionTemplates[ pPlugin.name ] = pPlugin.actionTemplates;

            for ( let i = 0; i < pPlugin.actionTemplates.length; i++ ) {
                addTemplate( pPlugin.actionTemplates[ i ] );
            }

            // Initialize actionPositions of the parent (region, ir column )
            // if it hasn't been done so far. It has to be the parent, because
            // no plug-ins are configured for REGION_ACTION, IR_COLUMN_ACTION
            pParentType.actionPositions = pParentType.actionPositions || {};
            pParentType.actionPositions[ pPlugin.name ] = pPlugin.actionPositions;

            for ( let i = 0; i < pPlugin.actionPositions.length; i++ ) {
                setFeatureDependency (
                    pType,
                    pPlugin.actionPositions[ i ].id,
                    pPlugin.actionPositions[ i ].features,
                    pType.properties[ PROP.ACTION_POSITION ].featuresProperties );

                gActionPositions[ pPlugin.actionPositions[ i ].id ] = pPlugin.actionPositions[ i ];

                // For positions of type LINK we create a dummy template so that our
                // dependencies on HIDDEN_TEMPLATE_ID do work
                if ( pPlugin.actionPositions[ i ].type === "LINK" ) {
                    if ( !hasOwnProperty( gActionTemplates, lDummyTemplate.id ) ) {
                        gActionTemplates[ lDummyTemplate.id ] = lDummyTemplate;
                    }

                    setFeatureDependency (
                        pType,
                        lDummyTemplate.id,
                        lDummyTemplate.features,
                        pType.properties[ PROP.HIDDEN_TEMPLATE_ID ].featuresProperties );
                }
            }
        } // addActions

        function merge( pPlugins, pTitlePostfix, pTypeId, pAddCompEvents ) {

            let lType       = gTypes[ pTypeId ],
                lPluginType = lType.pluginType,
                lAttribute,
                lReferenceScope,
                lTitlePostfix;

            // initialize types if it hasn't been done so far
            lPluginType.plugins = lPluginType.plugins || {};

            // don't populate plug-ins if the component type doesn't contain the property used to
            // select the plugin. This can be the case if it just contains the absolutely necessary properties.
            if ( pPlugins === undefined || !lPluginType.typePropertyId ) {
                return;
            }

            for ( let i = 0; i < pPlugins.length; i++ ) {

                // Skip plug-ins for inactive themes
                if ( pPlugins[ i ].themeId && pPlugins[ i ].themeId !== pThemeId ) {
                    continue;
                }

                if ( [ CATEGORY.NATIVE, CATEGORY.APPLICATION, CATEGORY.THEME ].includes( pPlugins[ i ].category ) ) {
                    lTitlePostfix = "%0";
                } else {
                    lTitlePostfix = pTitlePostfix;
                }

                // Add the plug-in to the list of available types for that component type. It will be used for
                // SUPPORTED UI property type
                lPluginType.plugins[ pPlugins[ i ].name ] = {
                    name:           pPlugins[ i ].name,
                    title:          lang.formatNoEscape( lTitlePostfix, pPlugins[ i ].title ),
                    category:       pPlugins[ i ].category,
                    componentTypes: pPlugins[ i ].componentTypes,
                    templateTypes:  pPlugins[ i ].templateTypes,
                    attributes:     pPlugins[ i ].attributes,
                    features:       pPlugins[ i ].features || [],
                    stdAttributes:  pPlugins[ i ].stdAttributes || {},
                    hasActions:     ( hasOwnProperty( pPlugins[ i ], "actionPositions" ) && pPlugins[ i ].actionPositions.length > 0 ),
                    slots:          pPlugins[ i ].slots,
                    defaultSlotButton: pPlugins[ i ].defaultSlotButton,
                    defaultSlotItem:   pPlugins[ i ].defaultSlotItem,
                    defaultSlotRegion: pPlugins[ i ].defaultSlotRegion,
                    aboutUrl:       pPlugins[ i ].aboutUrl,
                    helpText:       pPlugins[ i ].helpText || format( "HELP.NO_TEXT" ),
                    isQuickPick:    ( pPlugins[ i ].isQuickPick ),
                    isDeprecated:   ( pPlugins[ i ].isDeprecated ),
                    isLegacy:       ( pPlugins[ i ].isLegacy ),
                    isRequired:     (  $.inArray( "SOURCE_REQUIRED", pPlugins[ i ].features ) !== -1 // regions
                    || $.inArray( "LOV_REQUIRED",    pPlugins[ i ].features ) !== -1 // items
                    || $.inArray( "REQUIRED",        pPlugins[ i ].features ) !== -1 // da actions
                    || $.inArray( "REGION_REQUIRED", pPlugins[ i ].features ) !== -1 // process
                    ),
                    themeId:        pPlugins[ i ].themeId,
                    cloudOnly:       ( pPlugins[ i ].cloudOnly ),
                };

                // if attributeGroups exist, merge them into gDisplayGroups
                if ( hasOwnProperty( pPlugins[ i ], "attributeGroups" ) ) {
                    Object.assign( gDisplayGroups,pPlugins[ i ].attributeGroups );
                }

                // Add dependencies for all standard attributes
                if ( hasOwnProperty( pPlugins[ i ], "features" ) ) {
                    setFeatureDependency (
                        lType,
                        pPlugins[ i ].name,
                        pPlugins[ i ].features,
                        lType.properties[ lType.pluginType.typePropertyId ].featuresProperties );
                }

                // Region type plug-ins are used by component types REGION, REGION PLUGIN ATTRIBUTES and REGION COLUMN, but
                // attributes should only show up in the dedicated REGION PLUGIN ATTRIBUTES and REGION COLUMN component types
                if ( pTypeId !== COMP_TYPE.REGION ) {

                    for ( let j = 0; j < pPlugins[ i ].attributes.length; j++ ) {

                        simpleExtend( pPlugins[ i ].attributes[ j ], {
                            scope:        "COMPONENT",
                            defaultValue: "",
                            helpText:     ""
                        } );
                        lAttribute = pPlugins[ i ].attributes[ j ];

                        if (  ( pTypeId !== COMP_TYPE.REGION_COLUMN && lAttribute.scope === "COMPONENT" )
                           || ( pTypeId === COMP_TYPE.REGION_COLUMN && lAttribute.scope === "COLUMN" )
                           || ( pTypeId === COMP_TYPE.REGION_PLUGIN_ATTR && lAttribute.scope === "REPORT" )
                           || ( pTypeId === COMP_TYPE.REGION_PLUGIN_ATTR && lAttribute.scope === "REPORT_GROUP" ) )
                        {
                            // Item Type plug-in  attributes are already added by component type page items
                            if ( !EXTRA_ITEM_TYPE_COMP_TYPES.includes( pTypeId ) && !EXTRA_PROCESS_TYPE_COMP_TYPES.includes( pTypeId ) ) {

                                gProperties[ lAttribute.id ] = {
                                    id:                    lAttribute.id,
                                    name:                  pTypeId + "_" + pPlugins[ i ].name + "_" + ( lAttribute.staticId || lAttribute.mappingNo ),
                                    prompt:                lAttribute.prompt,
                                    type:                  lAttribute.type,
                                    multiValueDelimiter:   lAttribute.multiValueDelimiter,
                                    displayLen:            lAttribute.displayLen,
                                    maxLen:                lAttribute.maxLen,
                                    textCase:              lAttribute.textCase,
                                    unit:                  lAttribute.unit,
                                    hasPlSqlCheck:         false,
                                    sqlMinColumns:         lAttribute.sqlMinColumns,
                                    sqlMaxColumns:         lAttribute.sqlMaxColumns,
                                    dataTypes:             lAttribute.dataTypes || {},
                                    displayGroupId:        lAttribute.displayGroupId,
                                    lovType:               lAttribute.lovType,
                                    lovComponentTypeId:    lAttribute.lovComponentTypeId,
                                    lovComponentScope:     lAttribute.lovComponentScope,
                                    lovValues:             lAttribute.lovValues,
                                    isSearchable:          lAttribute.isSearchable,
                                    deprecatedValues:      lAttribute.deprecatedValues,
                                    examples:              lAttribute.examples,
                                    helpText:              lAttribute.helpText,
                                    isTranslatable:        lAttribute.isTranslatable,
                                    isCustomPluginAttribute: ( /^(PLUGIN|TMPL)/.test( pPlugins[ i ].name ) )
                                };

                                if ( hasOwnProperty( lAttribute, "componentTypes" ) ) {
                                    gProperties[ lAttribute.id ].componentTypes = lAttribute.componentTypes;
                                }

                                if ( gProperties[ lAttribute.id ].type === PROP_TYPE.YES_NO ) {
                                    gProperties[ lAttribute.id ].yesValue = "Y";
                                    gProperties[ lAttribute.id ].noValue  = "N";
                                }
                            }

                            // Some plug-in attributes have to be a little bit more intelligent to also show
                            // IG / IR columns where appropriate
                            lReferenceScope = lAttribute.referenceScope;
                            if ( PROP_TYPE.ITEM === lAttribute.type ) {
                                if ( pTypeId === COMP_TYPE.IG_COLUMN ) {
                                    lReferenceScope = "ROW";
                                } else if ( pTypeId === COMP_TYPE.DA_ACTION ) {
                                    lReferenceScope = "DEPENDS";
                                }
                            } else if (  /^(TMPL)/.test( pPlugins[ i ].name )
                                      && [ PROP_TYPE.TEXT,
                                           PROP_TYPE.TEXTAREA,
                                           PROP_TYPE.TEXT_EDITOR,
                                           PROP_TYPE.HTML,
                                           PROP_TYPE.LINK,
                                           PROP_TYPE.MEDIA,
                                           PROP_TYPE.SESSION_STATE_VALUE
                                        ].includes( lAttribute.type ) ) {
                                lReferenceScope = "DEPENDS";
                            }

                            lType.properties[ lAttribute.id ] = {
                                propertyId:                lAttribute.id,
                                displaySeq:                lPluginType.attributesSeqOffset + lAttribute.displaySeq,
                                isRequired:                lAttribute.isRequired,
                                isReadOnly:                false,
                                isCommon:                  lAttribute.isCommon,
                                nullText:                  lAttribute.nullText,
                                referenceOnDelete:         lAttribute.referenceOnDelete,
                                referenceScope:            lReferenceScope,
                                supportsSubstitution:      lAttribute.supportsSubstitution,
                                supportsTemplateDirective: lAttribute.supportsTemplateDirective,
                                defaultValue:              lAttribute.defaultValue,
                                accessibilityHelpText:     lAttribute.accessibilityHelpText,
                                dependingOn:  [{
                                    id:         lPluginType.typePropertyId,
                                    hasToExist: true,
                                    type:       "EQUALS",
                                    expression: pPlugins[ i ].name }
                                ]
                            };

                            if ( lAttribute.parentAttribute ) {
                                lType.properties[ lAttribute.id ].parentProperty = lAttribute.parentAttribute;
                            }

                            // If it's template component attribute of scope "REPORT", we have to make it dependent
                            // on the TEMPLATE_COMPONENT_TYPE attribute
                            if ( /^(TMPL)/.test( pPlugins[ i ].name ) && [ "REPORT", "REPORT_GROUP" ].includes( lAttribute.scope ) ) {
                                lType.properties[ lAttribute.id ].dependingOn.push( {
                                    id:         PROP.TEMPLATE_COMPONENT_TYPE,
                                    hasToExist: true,
                                    type:       "EQUALS",
                                    expression: "REPORT"
                                } );
                            }

                            if ( /^(TMPL)/.test( pPlugins[ i ].name ) && lAttribute.scope === "REPORT_GROUP" ) {
                                lType.properties[ lAttribute.id ].dependingOn.push( {
                                    id:         PROP.HIDDEN_COLUMNS_HAVE_GROUPS,
                                    hasToExist: true,
                                    type:       "EQUALS",
                                    expression: "Y"
                                } );
                            }

                            // If the plug-in has additional dependencies, add them to our array
                            if ( lAttribute.dependingOn ) {
                                lType.properties[ lAttribute.id ].dependingOn.push( lAttribute.dependingOn );
                            }
                        }
                    }

                    // For Dynamic Templates we also have to initialize REGION_ACTION and IR_COLUMN_ACTION which
                    // are based on the plug-ins action templates and positions
                    if ( /^(TMPL)/.test( pPlugins[ i ].name )) {
                        if ( pTypeId === COMP_TYPE.REGION_PLUGIN_ATTR ) {
                            addActions( gTypes[ COMP_TYPE.REGION ], gTypes[ COMP_TYPE.REGION_ACTION ], pPlugins[ i ] );
                        } else if ( pTypeId === COMP_TYPE.IR_COLUMN ) {
                            addActions( lType, gTypes[ COMP_TYPE.IR_COLUMN_ACTION ], pPlugins[ i ] );
                        }
                    }

                    if ( pAddCompEvents) {
                        for ( var j = 0; j < pPlugins[ i ].events.length; j++ ) {
                            gEvents.component.push({
                                r:       pPlugins[ i ].events[ j ].r,
                                d:       pPlugins[ i ].events[ j ].d + " [" + pPlugins[ i ].title + "]"
                            } );
                        }
                    }
                }

                if ( pTypeId === COMP_TYPE.REGION && pPlugins[ i ].features && pPlugins[ i ].features.includes( "SUPPORTS_EXTERNAL_FILTERING" ) ) {
                    gFacetedSearchRegionTypes.push( pPlugins[ i ].name );
                }
            }
        } // merge

        for ( let lTypeId in pPlugins ) {
            if ( hasOwnProperty( pPlugins, lTypeId ) ) {
                merge(
                    pPlugins[ lTypeId ],
                    pTitlePostfix,
                    lTypeId,
                    ( !EXTRA_ITEM_TYPE_COMP_TYPES.includes( lTypeId ) && !EXTRA_PROCESS_TYPE_COMP_TYPES.includes( lTypeId ) )// Region type plug-in events are already added by REGION PLUGIN ATTRIBUTES and PAGE ITEMS
                );
                // Region type plug-ins are used for component types REGION, REGION PLUGIN ATTRIBUTES and REGION COLUMN,
                // but we only transmit them once
                if ( lTypeId === COMP_TYPE.REGION ) {
                    merge( pPlugins[ lTypeId ], pTitlePostfix, COMP_TYPE.REGION_PLUGIN_ATTR, false );
                    merge( pPlugins[ lTypeId ], pTitlePostfix, COMP_TYPE.REGION_COLUMN, true );
                }
            }
        }

    } // mergePlugins


    /*
     * todo documentation
     */
    function initializeArrays() {

        // Initialize attributes which might not be initialized because they are missing in the communication
        for ( let i in gTypes ) {
            if ( hasOwnProperty( gTypes, i ) ) {

                gTypes[ i ].id = i;
                simpleExtend( gTypes[ i ], {
                    parentId:                   null,
                    isOneToOneRelation:         false,
                    isPageComponent:            false,
                    isSharedComponent:          false,
                    isSharedDesignerComponent:  false,
                    refByProperties:            [],
                    childComponentTypes:        []
                } );
                gComponents[ i ] = {};

                for ( let j in gTypes[ i ].properties ) {
                    if ( hasOwnProperty( gTypes[ i ].properties, j ) ) {

                        gTypes[ i ].properties[ j ].propertyId = j;
                        simpleExtend( gTypes[ i ].properties[ j ], {
                            defaultValue:     "",
                            helpText:         "",
                            dependingOn:      [],
                            refByChilds:      [],
                            refByDependingOn: []
                        } );
                    }
                }
            }
        }

        for ( let i in gProperties ) {
            if ( hasOwnProperty( gProperties, i ) ) {

                gProperties[ i ].id = i;
                simpleExtend( gProperties[ i ], {
                    helpText:            "",
                    hasPlSqlCheck:       false,
                    isQueryOnly:         false,
                    isInternal:          false,
                    isSearchable:        true,
                    dataTypes:           {},
                    refByComponentTypes: []
                } );

                // Create a lookup map for our static LOVs
                if ( hasOwnProperty( gProperties[ i ], "lovValues" ) ) {
                    gProperties[ i ].lovValuesMap = {};
                    for ( let j = 0; j < gProperties[ i ].lovValues.length; j++ ) {
                        gProperties[ i ].lovValuesMap[ gProperties[ i ].lovValues[ j ].r ] = j;
                    }
                }

            }
        }

        // Generate a lookup map for our events
        forEachAttribute( gEvents, function( pAttr, pEvent ) {

            if ( pAttr !== "lookupMap" ) {
                for ( let i = 0; i < pEvent.length; i++ ) {
                    gEvents.lookupMap[ pEvent[ i ].r ] = pEvent[ i ];
                }
            }

        } );

    } // initializeArrays


    /**
     * Method which adds gross references between component types and properties to make it easier and faster to navigate
     * between those to arrays.
     */
    function generateCrossReferences() {

        var lTypePropertyDef,
            lId,
            lPropertyId;

        function addRefByChild ( pParentTypeId, pParentPropertyId ) {
            if ( gTypes[ pParentTypeId ].properties[ pParentPropertyId ] ) {
                gTypes[ pParentTypeId ].properties[ pParentPropertyId ].refByChilds.push( {
                    typeId: lId,
                    id:     lPropertyId
                } );
            }
        }

        // Store the dependency that a component type is used as LOV for a property in the component type, or if a
        // page item, facet, smart filter property reference exists. This is used when we create/update/delete a component
        // to immediately know which properties we have to check
        for ( let i in gProperties ) {
            if ( hasOwnProperty( gProperties, i ) ) {
                if ( gProperties[ i ].lovType === "COMPONENT" ) {
                    gTypes[ gProperties[ i ].lovComponentTypeId ].refByProperties.push( i );
                } else if ( [ PROP_TYPE.ITEM, PROP_TYPE.ORDER_BY_ITEM, PROP_TYPE.SESSION_STATE_VALUE ].includes( gProperties[ i ].type ) ) {
                    gTypes[ COMP_TYPE.PAGE_ITEM ].refByProperties.push( i );
                } else if ( gProperties[ i ].type === PROP_TYPE.FACET ) {
                    gTypes[ COMP_TYPE.FACET ]             .refByProperties.push( i );
                    gTypes[ COMP_TYPE.FACET_GROUP_ITEM ]  .refByProperties.push( i );
                    gTypes[ COMP_TYPE.SFILTER ]           .refByProperties.push( i );
                    gTypes[ COMP_TYPE.SFILTER_GROUP_ITEM ].refByProperties.push( i );
                }
            }
        }

        for ( lId in gTypes ) {
            if ( hasOwnProperty( gTypes, lId ) ) {

                // Store which child component types the current component has
                if ( gTypes[ lId ].parentId !== null ) {
                    gTypes[ gTypes[ lId ].parentId ].childComponentTypes.push( lId );
                }

                // Store the dependency that a property is used by
                //
                // 1) a component type
                // 2) has child properties
                // 3) is depending on
                //
                // in the property as well, this will allow a faster lookup if we have to scan all component types which use a specific property.
                for ( lPropertyId in gTypes[ lId ].properties ) {
                    if ( hasOwnProperty( gTypes[ lId ].properties, lPropertyId ) ) {
                        lTypePropertyDef = gTypes[ lId ].properties[ lPropertyId ];

                        // Property is used by a component type
                        gProperties[ lPropertyId ].refByComponentTypes.push( lId );

                        // Property is a child of a parent property
                        if ( lTypePropertyDef.parentProperty && lTypePropertyDef.parentProperty.id ) {

                            addRefByChild( lTypePropertyDef.parentProperty.typeId, lTypePropertyDef.parentProperty.id );

                            // The column mapping of JET Chart Series references CHILD_SOURCE_LOCATION which is just a select list to
                            // identify the type of data source. That's why we actually add the parent dependency to the properties
                            // which contain the available columns in the series and on region level too (in case it's REGION_SOURCE)
                            if ( lTypePropertyDef.parentProperty.id === PROP.CHILD_SOURCE_LOCATION ) {
                                for ( let i = 0; i < SOURCE_LOCATION_PROPS.length; i++ ) {
                                    addRefByChild( COMP_TYPE.REGION, SOURCE_LOCATION_PROPS[ i ] );
                                    if ( lTypePropertyDef.parentProperty.typeId === COMP_TYPE.MAP_LAYER ) {
                                        addRefByChild( COMP_TYPE.MAP_LAYER, SOURCE_LOCATION_PROPS[ i ] );
                                    } else {
                                        addRefByChild( COMP_TYPE.JET_CHART_SERIES, SOURCE_LOCATION_PROPS[ i ] );
                                    }
                                }
                            }

                            // Same for plug-ins
                            if ( lTypePropertyDef.parentProperty.id === PROP.REGION_SQL ) {
                                for ( let i = 0; i < SOURCE_LOCATION_PROPS.length; i++ ) {
                                    addRefByChild( COMP_TYPE.REGION, SOURCE_LOCATION_PROPS[ i ] );
                                }
                            }
                        }

                        // Property is depending on another property
                        for ( let i = 0; i < lTypePropertyDef.dependingOn.length; i++ ) {
                            gTypes[ lId ].properties[ lTypePropertyDef.dependingOn[ i ].id ].refByDependingOn.push( {
                                propertyId: lPropertyId,
                                hasToExist: lTypePropertyDef.dependingOn[ i ].hasToExist
                            } );
                        }
                    }
                }
            }
        }

    } // generateCrossReferences


    /*
     * todo
     */
    function getNewComponentId() {

        var LOCAL_STORAGE_ID = "ORA_WWV_apex.builder.pageDesigner.model.componentIds";

        var lIds,
            lNewComponentId;

        // We use local storage as a pool of new component ids. Using local storage has the advantage that we will not
        // waste those ids, event if we navigate away from the current page.
        lIds = localStorage[ LOCAL_STORAGE_ID ];
        if ( lIds === undefined ) {
            lIds = [];
        } else {
            lIds = lIds.split( "," );
        }

        // Do we need to fetch new ids?
        if ( lIds.length === 0 ) {
            ajax (
                "getNewComponentId", {
                    x01: 50
                }, {
                    success: function( pData ) {
                        lIds = pData;
                    },
                    async: false // this is by intention, because we need the result within the current transaction
                } );
        }

        // Get the next id and write the remaining ids back into our store
        lNewComponentId = lIds[ 0 ];
        lIds = lIds.slice( 1 );
        if ( lIds.length === 0 ) {
            delete localStorage[ LOCAL_STORAGE_ID ];
        } else {
            localStorage[ LOCAL_STORAGE_ID ] = lIds.join( "," );
        }

        return lNewComponentId;

    } // getNewComponentId


    /*
     * todo
     */
    function getTheme() {

        return gSharedComponents.themes[ gSharedComponents.userInterface.themeId ];

    } // getTheme


    /**
     * Function returns the page template of the current page.
     *
     * @return {Object}
     *
     * @function getPageTemplate
     * @memberOf pe
     **/
    function getPageTemplate() {

        var lPage = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ],
            lTheme,
            lTemplateId;

        // Get the used page/dialog template of the current page. If no template is defined on page level,
        // we have to get theme default
        lTheme = getTheme();

        if ( isGlobalPage() ) {
            lTemplateId = lTheme.defaultTemplates.page;
        } else {
            if ( lPage.getProperty( PROP.PAGE_MODE ).getValue() === "NORMAL" ) {
                lTemplateId = ( lPage.getProperty( PROP.PAGE_TEMPLATE ).getValue() || lTheme.defaultTemplates.page );
            } else {
                lTemplateId = ( lPage.getProperty( PROP.DIALOG_TEMPLATE ).getValue() || lTheme.defaultTemplates.dialog );
            }
        }

        return lTheme.templates[ COMP_TYPE.PAGE_TEMPLATE ][ lTemplateId ];

    } // getPageTemplate

    /**
     * Returns the Template Component Type (PARTIAL, REPORT or REGION_ONLY) of the passed in region.
     *
     * @param {Object} component - The region component
     * @returns {String} The Template Component Type (PARTIAL, REPORT or REGION_ONLY) of the passed in region.
     *
     * @function getTemplateComponentType
     */
    function getTemplateComponentType( component ) {

        const regionType = component.getPropertyValue( PROP.REGION_TYPE );

        if ( regionType.startsWith( "TMPL" ) ) {
            return component.getChilds( COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ]?.getPropertyValue( PROP.TEMPLATE_COMPONENT_TYPE );
        }

    } // getTemplateComponentType


    /**
     * Retrieves a plugin object for a given region type.
     *
     * @param {String} regionType - The type of the region for which to find the plugin.
     * @returns {Object} The plugin object matching the region type.
     *
     * @function getRegionPlugin
     */
    function getRegionPlugin( regionType ) {
        return gTypes[ COMP_TYPE.REGION ].pluginType.plugins[ regionType ];
    } // getRegionPlugin

    /**
     * Retrieves region and plugin slots based on the provided parameters
     *
     * @param {String} regionId The region ID
     * @param {String} regionType The region type
     * @param {String} templateComponentType The template component type
     * @param {string} regionTemplateId The region template id in case regionId is not set yet (e.g. gallery to glv)
     * @param {String} supportedItemType The item type being added to the region
     * @param {String} supportedRegionType The region type being added to the region
     *
     * @return {Array} An array of slots for the specified region. Returns an empty array if no slots are found.
     *
     * @function _getRegionSlots
     */
    function _getRegionSlots( { regionId, regionType, templateComponentType, regionTemplateId, supportedItemType, supportedRegionType } ) {

        let slots = [];
        let regionSlots = [];
        let pluginSlots = [];

        const regionPlugin = getRegionPlugin( regionType );

        // If the region plugin can't be found, early exit
        if ( !regionPlugin ) {
            return slots;
        }

        // Filter plugin slots based on regionType and templateComponentType
        if ( regionPlugin && Array.isArray( regionPlugin.slots ) ) {
            pluginSlots = regionPlugin.slots;

            // Filter the pluginSlots by the supported item type
            if ( supportedItemType ) {
                pluginSlots = pluginSlots.filter( slot => !slot.supportedItemTypes || slot.supportedItemTypes?.includes( supportedItemType ) );
            }

            // Filter the pluginSlots by the supported region type
            if ( supportedRegionType ) {
                pluginSlots = pluginSlots.filter( slot => !slot.supportedRegionTypes || slot.supportedRegionTypes?.includes( supportedRegionType ) );
            }

            // Filter and sort the plugin slots that are used in the report container
            if ( templateComponentType === "REPORT" ) {
                pluginSlots = pluginSlots.filter( slot => slot.positionInReport > 0 );
                pluginSlots.sort( ( a, b ) => a.positionInReport - b.positionInReport );
            }

            // Filter and sort the plugin slots that are used in the partial
            if ( [ "PARTIAL", "REGION_ONLY" ].includes( templateComponentType ) ) {
                pluginSlots = pluginSlots.filter( slot => slot.positionInPartial > 0 );
                pluginSlots.sort( ( a, b ) => a.positionInPartial - b.positionInPartial );
            }

            // Both region slots and plugin slots can be used simultaneously
            // Identify these as plugin slots for future identification and filtering
            pluginSlots = pluginSlots.map( slot => ( { ...slot, origin: "plugin" } ) );
        }

        // Second, if the region supports region template, we find the slots defined in the region template
        if ( regionPlugin.features.includes( "REGION_TEMPLATE" ) ) {
            const regionTemplate = getRegionTemplate( { regionId, regionTemplateId } );
            if ( regionTemplate && Array.isArray( regionTemplate.slots ) ) {
                regionSlots = regionTemplate.slots;
                // Both region slots and plugin slots can be used simultaneously
                // Identify these as region slots for future identification and filtering
                // Note: We use .sort on pluginSlots, but we don't do it for regionSlots
                // because region slots are pre-sorted on the server
                regionSlots = regionSlots.map( slot => ( { ...slot, origin: "region" } ) );
            }
        }

        // If both plugin slots and region slots are co-exist
        // add a prefix to help distinguish the two types of slots
        if ( regionSlots.length > 0 && pluginSlots.length > 0 ) {

            // Next, we need to inject plugin slots right after the BODY region slot, so first find the index
            const bodySlotIndex = regionSlots.findIndex( slot => slot.placeholder === "BODY" );

            // BODY region slot was found, so inject all plugin slots after the BODY region slot index
            if ( bodySlotIndex !== -1 ) {
                slots = regionSlots;
                slots.splice( bodySlotIndex + 1, 0, ...pluginSlots );
            } else {
                // No BODY region slot was found, so just concatenate plugin slots and region slots (respectively)
                slots = [ ...pluginSlots, ...regionSlots ];
            }

        } else if ( regionSlots.length > 0 ) {
            // Only region slots were found, so return region slots
            slots = regionSlots;
        } else if ( pluginSlots.length > 0 ) {
            // Only plugin slots were found, so return plugin slots
            slots = pluginSlots;
        }

        return slots;

    } // _getRegionSlots


    /**
     * Checks if a given plugin is a template component with slots by filtering on origin === "plugin"
     *
     * @param {Object} options The options object that contains data needed to get slots.
     *
     * @return {Boolean} Returns true if the plugin has one or more slots defined, false otherwise.
     *
     * @function _hasTemplateComponentSlots
     */
    function _hasTemplateComponentSlots( options ) {
        return getSlots( options ).some( slot => slot.origin === "plugin" );
    } // _hasTemplateComponentSlots

    /**
     * Function returns the field template of the passed in field template id.
     *
     * @return {Object}
     *
     * @function getFieldTemplate
     **/
    function getFieldTemplate( pId ) {

        var lTemplates = getTheme().templates[ COMP_TYPE.FIELD_TEMPLATE ];

        if ( hasOwnProperty( lTemplates, pId ) ) {
            return lTemplates[ pId ];
        } else {
            // Return the "No Template" template if the template id doesn't exist
            return lTemplates[ "" ];
        }

    } // getFieldTemplate


    /**
     * Function returns the template options for the current property.
     *
     * @return {Object}
     *
     * @function getTemplateOptions
     **/
    function getTemplateOptions( pProperty ) {

        var TYPE_ID       = pProperty.component.typeId,
            THEME_OPTIONS = getTheme().options || [];

        var lTemplateProperty,
            lTemplate,
            lTemplateType,
            lOptions = [],
            lOptionsMap = {};

        // Page/Dialog Templates do have there own default logic
        if (  TYPE_ID === COMP_TYPE.PAGE && [ PROP.PAGE_TEMPLATE, PROP.DIALOG_TEMPLATE ].includes( gTypes[ pProperty.component.typeId ].properties[ pProperty.id ].parentProperty.id ) ) {
            lTemplateType = "PAGE";
            lTemplate     = getPageTemplate();
        } else {
            lTemplateProperty = pProperty.component.getProperty( gTypes[ pProperty.component.typeId ].properties[ pProperty.id ].parentProperty.id );

            if ( lTemplateProperty && lTemplateProperty.getValue() !== "" ) {
                lTemplate = getTheme().templates[ gProperties[ lTemplateProperty.id ].lovComponentTypeId ][ lTemplateProperty.getValue() ];

                switch ( gProperties[ lTemplateProperty.id ].lovComponentTypeId ) {
                    case COMP_TYPE.REGION_TEMPLATE:     lTemplateType = "REGION"; break;
                    case COMP_TYPE.REPORT_TEMPLATE:     lTemplateType = "REPORT"; break;
                    case COMP_TYPE.BREADCRUMB_TEMPLATE: lTemplateType = "BREADCRUMB"; break;
                    case COMP_TYPE.LIST_TEMPLATE:       lTemplateType = "LIST"; break;
                    case COMP_TYPE.FIELD_TEMPLATE:      lTemplateType = "FIELD"; break;
                    case COMP_TYPE.BUTTON_TEMPLATE:     lTemplateType = "BUTTON"; break;
                }
            }

        }

        // Return no template options if the component references a non existing template
        if ( lTemplate === undefined ) {

            return {
                values:        [],
                valuesMap:     {},
                defaultValues: [],
                presetValues:  [],
                groups:        {}
            };

        } else {

            // Add template specific options
            if ( lTemplate && hasOwnProperty( lTemplate, "options" ) ) {

                lOptions = lOptions.concat( lTemplate.options );
            }

            // Add global template options
            for ( let i = 0; i < THEME_OPTIONS.length; i++ ) {
                if ( $.inArray( lTemplateType, THEME_OPTIONS[ i ].types ) !== -1 ) {
                    lOptions.push( THEME_OPTIONS[ i ] );
                }
            }

            // Add the "Default" entry at the beginning of the array
            lOptions.unshift( {
                r: "#DEFAULT#",
                d: format( "LOV.TEMPLATE_OPTIONS.DEFAULT" ),
                description: format( "LOV.TEMPLATE_OPTIONS.DEFAULT.DESC" )
            } );

            // create a lookup map
            for ( let i = 0; i < lOptions.length; i++ ) {
                lOptionsMap[ lOptions[ i ].r ] = lOptions[ i ];
            }

            return {
                values:        lOptions,
                valuesMap:     lOptionsMap,
                defaultValues: lTemplate.defaultOptions || [],
                presetValues:  lTemplate.presetOptions  || [],
                groups:        getTheme().optionGroups  || []
            };
        }

    } // getTemplateOptions


    /**
     *
     * returns the first workflow version parent of a component
     *
     * @param {object} component model component
     * @returns {object}
     */
    function getWorkflowVersion( component ) {
        let comp = component;
        while ( comp && comp.typeId !== COMP_TYPE.WORKFLOW_VERSION ) {
            comp = comp.getParent();
        }
        return comp;
    }

    function isMatchingDataType( pColumnType, pValidTypes ) {

        // Because we automatically add ROWID, we will only support that column if the valid data types really require that type
        if ( pColumnType === "ROWID" && $.inArray( pColumnType, pValidTypes ) === -1 ) {
            return false;
        }

        // Are all data types allowed?
        return (  pValidTypes.length === 0
            // Data type not available
        || pColumnType === undefined
            // if VARCHAR2 is allowed, the column can be of any data type except BLOB or BFILE
        || (  $.inArray( "VARCHAR2", pValidTypes ) >= 0
        && $.inArray( pColumnType, [ "BLOB", "BFILE" ] ) === -1
        )
            // If DATE is allowed, the column can be a DATE or any TIMESTAMP data type
        || (  $.inArray( "DATE", pValidTypes ) >= 0
        && $.inArray( pColumnType, [ "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ" ] ) >= 0
        )
            // Is the column of the allowed data types?
        || $.inArray( pColumnType, pValidTypes ) >= 0 );
    } // isMatchingDataType


    function isValidPlugin( pComponent, pPlugin, pCheckOptions ) {

        return (  ( !pPlugin.componentTypes || $.inArray( pComponent.typeId, pPlugin.componentTypes ) !== -1 )
               && ( !pCheckOptions.isDeprecated || !pPlugin.isDeprecated )
               && ( !pCheckOptions.isLegacy || !pPlugin.isLegacy )
               );
    } // isValidPlugin


    function isGlobalPage() {

        return ( gCurrentPageId === gCurrentApp.globalPageId );

    } // isGlobalPage

    /**
     * Current Theme Font Library is Font APEX
     *
     * @return {Boolean}
     *
     * @function isFontAPEX
     **/
    function isFontAPEX() {

        return [ 'FONTAPEX', 'FONTAPEX_LATEST' ].includes( getTheme()?.icons?.library );

    } // isFontAPEX

    function hasMetaTags() {

        const enableMetaTags = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ].getProperty( PROP.ENABLE_META_TAGS );

        const metaTagsCount = getComponents( COMP_TYPE.META_TAG ).length;

        return (enableMetaTags && enableMetaTags.getValue() === "Y") || metaTagsCount > 0;

    } // hasMetaTags


    function replaceDefaultPlaceholders( pProperty, pDefaultValue ) {

        const CURRENT_CODE_LANGUAGE = window.gPreferences.CODE_LANGUAGE || "PLSQL";
        var lValue = pDefaultValue;

        function replacePlaceholder( pPlaceholder, pFunction ) {

            if ( lValue.indexOf( pPlaceholder ) !== -1 ) {
                lValue = lValue.replace( pPlaceholder, pFunction() );
            }
        }

        // Replace placeholder values
        if ( lValue.indexOf( "#" ) !== -1 ) {
            // Wrapping the value into a function will make sure that it's only evaluated if the placeholder exists
            replacePlaceholder( "#PAGE_ID#",                     function(){ return gCurrentPageId; } );
            replacePlaceholder( "#PLEASE_CHANGE#",               function(){ return format( "PLACEHOLDER.PLEASE_CHANGE" ); } );
            replacePlaceholder( "#PRINT_LINK_TEXT#",             function(){ return format( "PLACEHOLDER.PRINT_LINK_TEXT" ); } );
            replacePlaceholder( "#DEFAULT_REGION_TEMPLATE#",     function(){ return getTheme().defaultTemplates.region; } );
            replacePlaceholder( "#DEFAULT_FIELD_TEMPLATE#",      function(){ return getTheme().defaultTemplates.field; } );
            replacePlaceholder( "#DEFAULT_BUTTON_TEMPLATE#",     function(){ return getTheme().defaultTemplates.button; } );
            replacePlaceholder( "#DEFAULT_REPORT_TEMPLATE#",     function(){ return getTheme().defaultTemplates.report; } );
            replacePlaceholder( "#DEFAULT_LIST_TEMPLATE#",       function(){ return getTheme().defaultTemplates.list; } );
            replacePlaceholder( "#DEFAULT_NAV_LIST_TEMPLATE#",   function(){ return gCurrentApp.navList.templateId || ""; } );
            replacePlaceholder( "#DEFAULT_BREADCRUMB_TEMPLATE#", function(){ return getTheme().defaultTemplates.breadcrumb; } );
            replacePlaceholder( "#DEFAULT_CALENDAR_TEMPLATE#",   function(){ return getTheme().defaultTemplates.calendar; } );
            replacePlaceholder( "#DEFAULT_NAV_LIST_POSITION#",   function(){ return gCurrentApp.navList.position || ""; } );
            replacePlaceholder( "#CURRENT_COLUMN_NAME#",         function(){
                var lColumnName = pProperty.component.getProperty( PROP.COLUMN_NAME ).getValue();

                if ( $.inArray( pProperty.component.typeId, [ COMP_TYPE.IR_COLUMN, COMP_TYPE.CLASSIC_RPT_COLUMN, COMP_TYPE.TAB_FORM_COLUMN ] ) !== -1 ) {
                    return lColumnName;
                } else {
                    return enquoteIdentifier( lColumnName );
                }
            } );
            replacePlaceholder( "#PRESET_TEMPLATE_OPTIONS#",     function(){
                var lPresetValues = getTemplateOptions( pProperty ).presetValues;
                if ( lPresetValues.length > 0 ) {
                    return ":" + lPresetValues.join( ":" );
                } else {
                    return "";
                }
            } );
            replacePlaceholder( "#LINK_ICON#",     function(){
                let defaultValue = `<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">`;
                if ( isFontAPEX() ) {
                    // Get "Edit" message
                    const editMessageCode = "EDIT";
                    const editMessage = util.escapeHTMLAttr( lang.getMessage( editMessageCode ) );
                    // Build the default value
                    defaultValue = `<span role="img" aria-label="${ editMessage }" class="fa fa-edit" title="${ editMessage }"></span>`;
                }
                return defaultValue;
            } );
        } else if ( gProperties[ pProperty.id ].type === PROP_TYPE.CODE_LANGUAGE ) {
            // Always use saved preference value if it's supported on the current system, otherwise
            // fallback to the default value (which is already in lValue)
            // todo: 1) change PD configuration and don't set a default unless we want to have something other than PL/SQL
            //       2) change the code below to only assign the preference if no default has been specified
            if ( hasOwnProperty( gSharedComponents.codeLanguages, CURRENT_CODE_LANGUAGE ) ) {
                lValue = CURRENT_CODE_LANGUAGE;
            }
        }

        return lValue;

    } // replaceDefaultPlaceholders


    // Returns the first available display property of a component
    function getDisplayProperty( pComponent ) {

        const DISPLAY_PROPERTY_IDS = gTypes[ pComponent.typeId ].displayPropertyIds || [];

        let displayProperty;

        for ( let i = 0; i < DISPLAY_PROPERTY_IDS.length; i++ ) {
            displayProperty = pComponent.getProperty( DISPLAY_PROPERTY_IDS[ i ] );
            if ( displayProperty ) { break; }
        }

        return displayProperty;

    } // getDisplayProperty


    function convertComponentsToLovValues( pComponents, pDisplayPropertyId, pReturnPropertyId, pDataTypePropertyId ) {

        var lDisplayProperty,
            lDataTypeProperty,
            lName,
            lLabel,
            lDataType,
            lLovValues = [];

        for ( let i = 0; i < pComponents.length; i++ ) {
            lDisplayProperty  = pComponents[ i ].getProperty( pDisplayPropertyId );
            lDataTypeProperty = pComponents[ i ].getProperty( pDataTypePropertyId );
            lName     = pComponents[ i ].getProperty( pReturnPropertyId ).getValue();
            lLabel    = ( lDisplayProperty ) ? lDisplayProperty.getValue() : ""; // does not exist for hidden items/columns
            lDataType = ( lDataTypeProperty ) ? lDataTypeProperty.getValue() : "";
            lLovValues.push( {
                name:     lName,
                r:        lName,
                label:    lLabel,
                d:        lLabel,
                dataType: lDataType
            } );
        }

        return lLovValues;

    } // convertComponentsToLovValues


    function getSqlColumnLovValues( pComponent, pPropertyIds, pIncludeAutoRowid ) {

        let i, lProperty,
            lLovValues = [];

        // Go through the array of provided properties to find the first the one which is supported for the current component
        for ( i = 0; i < pPropertyIds.length; i++ ) {

            lProperty = pComponent.getProperty( pPropertyIds[ i ] );
            if ( lProperty ) {
                lLovValues = lProperty.getColumns( pIncludeAutoRowid );
                break;
            }

        }

        return lLovValues;

    } // getSqlColumnLovValues


    // Returns all region columns if the region type does support them. If region columns are not stored in a separate
    // table, then the function will return the columns returned by the SQL query/table/... of the region.
    // See getRegionSqlColumns if you always want to get the SQL columns.
    function getRegionColumns( pRegionId, pIncludeAutoRowid ) {

        var TYPE_MAP = {
            "NATIVE_TABFORM":    COMP_TYPE.TAB_FORM_COLUMN,
            "NATIVE_SQL_REPORT": COMP_TYPE.CLASSIC_RPT_COLUMN,
            "NATIVE_IR":         COMP_TYPE.IR_COLUMN,
            "NATIVE_IG":         COMP_TYPE.IG_COLUMN
        };

        var lComponents,
            lRegion,
            lType,
            lParentId,
            lLovValues = [];

        lComponents = getComponents( COMP_TYPE.REGION, { id: pRegionId } );

        if ( lComponents.length > 0 ) {

            lRegion = lComponents[ 0 ];
            lType   = lRegion._properties[ PROP.REGION_TYPE ]._value;

            if ( hasOwnProperty( TYPE_MAP, lType ) ) {

                if ( lType === "NATIVE_IR" ) {
                    lParentId = lRegion.getChilds( COMP_TYPE.IR_ATTRIBUTES )[ 0 ].id;
                } else {
                    lParentId = lRegion.id;
                }
                lComponents = getComponents( TYPE_MAP[ lType ], { parentId: lParentId } );
                lLovValues  = convertComponentsToLovValues( lComponents, PROP.COLUMN_HEADING, PROP.COLUMN_NAME );

                // Are we dealing with a region type plug-in with 'Region Columns'?
            } else if ( $.inArray( "COLUMNS", gTypes[ COMP_TYPE.REGION ].pluginType.plugins[ lType ].features ) !== -1 ) {

                lComponents = getComponents( COMP_TYPE.REGION_COLUMN, { parentId: lRegion.id } );
                lLovValues  = convertComponentsToLovValues( lComponents, PROP.COLUMN_HEADING, PROP.COLUMN_NAME );

                // template components
            } else if ( lType.startsWith( "TMPL_" ) ) {

                lComponents = getComponents( COMP_TYPE.REGION_TMPL_COLUMN, { parentId: lRegion.id } );
                lLovValues  = convertComponentsToLovValues( lComponents, PROP.COLUMN_NAME_UPPER, PROP.COLUMN_NAME_UPPER, PROP.DATA_TYPE );

            } else {

                lLovValues = getSqlColumnLovValues( lRegion, SOURCE_LOCATION_PROPS, pIncludeAutoRowid );

            }
        }

        return lLovValues;

    } // getRegionColumns

    // Function which returns all columns returned by the SQL query/table/... of the region.
    // This is different to getRegionColumns which returns the region columns!
    function getRegionSqlColumns( pRegionId, pIncludeAutoRowid ) {

        var lComponents,
            lLovValues = [];

        lComponents = getComponents( COMP_TYPE.REGION, { id: pRegionId } );

        if ( lComponents.length > 0 ) {

            lLovValues = getSqlColumnLovValues( lComponents[ 0 ], SOURCE_LOCATION_PROPS, pIncludeAutoRowid );

        }

        return lLovValues;


    } // getRegionSqlColumns


    /*
     * Returns a unique property value for the specified property id. If the specified start value is already in use,
     * it will append a unique number and return the new value.
     * if there's no startValue, we have to return an empty string, becuse the "required error" flag is already set.
     * and the return value would be something like _1/2/..
     */
    function getUniquePropertyValue( pParentId, pTypeId, pPropertyId, pStartValue ) {

        let lCheckUniqueness = gTypes[ pTypeId ].properties[ pPropertyId ].checkUniqueness,
            lFilter          = { properties: [{ id: pPropertyId, value: "" }]};

        if ( !pStartValue ) {
            return "";
        }
        // Restrict our component query based on the scope of uniqueness. APPLICATION, WORKSPACE and INSTANCE will just be
        // checked on the server
        if ( lCheckUniqueness === "PARENT" ) {
            lFilter.parentId = pParentId;
        } else if ( lCheckUniqueness === "PAGE" ) {
            lFilter.pageId = gCurrentPageId;
        } else if ( lCheckUniqueness === "WORKFLOW" ) {
            // store the current workflow version id
            let version = getWorkflowVersion( this );
            // restrict the result to the current workflow version
            lFilter.filterFunction = function(){
                let component = getWorkflowVersion( this );
                return version.id === component.id;
            };
        }

        // Check if the current value is already in use, if yes try to find a unique value by adding a sequence starting with 2
        lFilter.properties[ 0 ].value = pStartValue;
        for ( let i = 1; i < 10000; i++ ) {
            if (  (  pPropertyId === PROP.ITEM_NAME
                  && getComponents( COMP_TYPE.PAGE_ITEM,          lFilter, false ).length === 0
                  && getComponents( COMP_TYPE.FACET,              lFilter, false ).length === 0
                  && getComponents( COMP_TYPE.FACET_GROUP_ITEM,   lFilter, false ).length === 0
                  && getComponents( COMP_TYPE.SFILTER,            lFilter, false ).length === 0
                  && getComponents( COMP_TYPE.SFILTER_GROUP_ITEM, lFilter, false ).length === 0 )
                || ( lFilter.filterFunction && pPropertyId === PROP.WF_IDENTIFICATION_STATIC_ID
                    && getComponents( COMP_TYPE.WORKFLOW_VARIABLE,  lFilter, false ).length === 0
                    && getComponents( COMP_TYPE.WORKFLOW_ACT_VAR,   lFilter, false ).length === 0 )
                || ( pPropertyId !== PROP.ITEM_NAME
                    && ( pPropertyId !== PROP.WF_IDENTIFICATION_STATIC_ID || pPropertyId === PROP.WF_IDENTIFICATION_STATIC_ID && !lFilter.filterFunction )
                    && getComponents( pTypeId, lFilter, false ).length === 0 ) )
            {
                // Found a unique value, update our property with that value
                return lFilter.properties[ 0 ].value;
            }
            lFilter.properties[ 0 ].value = pStartValue + "_" + i;
        }
        throw new Error( `Unable to generate a unique value for property '${ gProperties[ pPropertyId ].prompt }' (${ pPropertyId })!` );
    } // getUniquePropertyValue

    /*
     * Returns the parent region id for regions
     * Returns the region id for items and buttons
     */
    function getParentRegionId( component ) {
        let parentRegionId = "";

        if ( component.typeId === COMP_TYPE.REGION ) {
            parentRegionId = component.getProperty( PROP.PARENT_REGION ).getValue();
        } else if ( component.typeId === COMP_TYPE.PAGE_ITEM ) {
            parentRegionId = component.getProperty( PROP.REGION ).getValue();
        } else if ( component.typeId === COMP_TYPE.BUTTON ) {
            parentRegionId = component.getProperty( PROP.REGION ).getValue();
        }

        return parentRegionId;
    } // getParentRegionId

    /**
     * Retrieves page, region or plugin slots based on the provided parameters
     *
     * @param {Object} component The region component
     * @param {String} regionId The region ID
     * @param {String} regionType The region type
     * @param {String} templateComponentType The template component type
     * @param {string} regionTemplateId The region template id in case regionId is not set yet (e.g. gallery to glv)
     * @param {String} supportedItemType The item type being added to the region
     * @param {String} supportedRegionType The region type being added to the region
     *
     * @return {Array} An array of slots for the provided parameters. Returns an empty array if no slots are found.
     *
     * @function getSlots
     */
    function getSlots( options ) {

        const { componentTypeId, regionTemplateId, supportedItemType, supportedRegionType } = options;
        let { componentTypes, regionId, component, regionType, templateComponentType } = options;

        // Initialize slots to an empty array
        let slots = [];

        // Overwrite component based on regionId if needed
        if ( regionId && !component ) {
            component = gComponents[ COMP_TYPE.REGION ][ regionId ];
        }

        // Overwrite regionType based on component if needed
        if ( component && !regionType ) {
            regionType = component.getPropertyValue( PROP.REGION_TYPE );
        }

        // Overwrite templateComponentType based on component if needed
        if ( component && !templateComponentType ) {
            templateComponentType = getTemplateComponentType( component );
        }

        // Overwrite regionId based on component if needed
        if ( component && !regionId ) {
            regionId = component.id;
        }

        // If we have regionType or regionId, then get region slots
        if ( regionType || regionId ) {
            slots = _getRegionSlots( { regionId, regionType, templateComponentType, regionTemplateId, supportedItemType, supportedRegionType } );
        } else {
            // Otherwise get page slots
            const pageTemplate = getPageTemplate();
            if ( pageTemplate && Array.isArray( pageTemplate.slots ) ) {
                // Identify these as page slots for future identification and filtering
                slots = pageTemplate.slots.map( slot => ( { ...slot, origin: "page" } ) );
            }
        }

        // Ensure componentTypes is always an array even when it's passed a single componentTypeId
        componentTypes = Array.isArray( componentTypes ) ? componentTypes : [ componentTypeId ];

        // Filter slots for regions
        if ( componentTypes.includes( COMP_TYPE.REGION ) ) {
            slots = slots.filter( slot => slot.hasRegionSupport );
        }

        // Filter slots for items
        if ( componentTypes.includes( COMP_TYPE.PAGE_ITEM ) ) {
            slots = slots.filter( slot => slot.hasItemSupport );
        }

        // Filter slots for buttons
        if ( componentTypes.includes( COMP_TYPE.BUTTON ) ) {
            slots = slots.filter( slot => slot.hasButtonSupport );
        }

        return slots;

    } // getSlots

    /**
     * Retrieves a single slot based on the provided parameters
     *
     * @param {Object} component The region component
     * @param {String} regionId The region ID
     * @param {Array} componentTypes Array of component types that the slot must support
     * @param {Array} componentTypeId A single component type that the slot must support
     * @param {String|Array} slotPlaceholder The slot placeholder to return. If not provided, get the default slot
     *
     * @return {Array} A single slot for the provided parameters. Returns undefined if no slot is found.
     *
     * @function getSlot
     */
    function getSlot( options ) {
        const { regionId, componentTypeId } = options;
        // Ensure componentTypes is always an array even when it's passed a single componentTypeId
        options.componentTypes = Array.isArray( options.componentTypes ) ? options.componentTypes : [ componentTypeId ];
        const slots = getSlots( options );

        let slotPlaceholder = options.slotPlaceholder;

        // If no slotPlaceholder is provided, we need to determine what the default slotPlaceholder should be
        if ( !slotPlaceholder ) {

            // Find the default placeholder when the region is a plugin with slots
            if ( _hasTemplateComponentSlots( options ) ) {

                let slot;

                if ( regionId && !options.component) {
                    options.component = gComponents[ COMP_TYPE.REGION ][ regionId ];
                }

                const regionType = options.component.getPropertyValue( PROP.REGION_TYPE );
                const regionPlugin = getRegionPlugin( regionType );

                // Get the default region slot for this plugin
                if ( options.componentTypes.includes( COMP_TYPE.REGION ) && regionPlugin?.defaultSlotRegion ) {
                    slot = slots.find( slot => slot.placeholder === regionPlugin.defaultSlotRegion );
                }
                    // Get the default item slot for this plugin
                if ( options.componentTypes.includes( COMP_TYPE.PAGE_ITEM ) && regionPlugin?.defaultSlotItem ) {
                    slot = slots.find( slot => slot.placeholder === regionPlugin.defaultSlotItem );
                }
                    // Get the default button slot for this plugin
                if ( options.componentTypes.includes( COMP_TYPE.BUTTON ) && regionPlugin?.defaultSlotButton ) {
                    slot = slots.find( slot => slot.placeholder === regionPlugin.defaultSlotButton );
                }

                // if the default slot is not available, return the 1st eligible slot
                slotPlaceholder = slot ? slot.placeholder : slots.filter( slot => slot.origin === "plugin" )[0].placeholder;

            } else {
                // if adding a region inside a parent region, and the parent region is a regular region
                // with no plugin slots (like a template component with slots)
                // then assume it's the child region should go in the sub region slot of the parent region
                slotPlaceholder = options.componentTypes.length === 1 &&
                                  options.componentTypes.includes( COMP_TYPE.REGION ) &&
                                  regionId ? "SUB_REGIONS" : "BODY";
            }
        }

        if ( slotPlaceholder ) {
            // Ensure slotPlaceholder is treated as an array even if it's a single value.
            // This allows to look for multiple slot placeholders.
            const placeholders = Array.isArray( slotPlaceholder ) ? slotPlaceholder : [ slotPlaceholder ];

            // Find the first slot that matches any value in the placeholders array.
            const defaultSlot = slots.find( slot => placeholders.includes( slot.placeholder ) );

            // Bug 36909105: default slot could still be undefined when the SUB_REGION or the BODY slot doesn't meet the
            // required criteria.
            // For example, the BODY slot of the item container template only supports items
            if ( defaultSlot ) {
                return defaultSlot;
            }
        }

        // Sort slots based on priority: non-legacy and non-deprecated come first
        slots.sort( ( slotA, slotB ) => {

            if ( ( slotA.isLegacy || slotA.isDeprecated ) && !( slotB.isLegacy || slotB.isDeprecated ) ) {
                return 1;
            } else if ( !( slotA.isLegacy || slotA.isDeprecated ) && ( slotB.isLegacy || slotB.isDeprecated ) ) {
                return -1;
            }

            return 0;

        } );

        // Return the first slot in the sorted array
        return slots[0];

    } // getSlot

    /*
     * Checks an ORDER BY ITEM property if it's valid, if not the errors are pushed into the errors array
     */
    function addOrderByItemErrors( isRequired, value, errors ) {
        try {
            let orderByItem = JSON.parse( value || "{}" );
            // 1) Order by Clauses specified but no Order By Item
            // 2) Attribute is required, but no Order By Clauses specified
            if (
                  ( orderByItem.orderBys && orderByItem.orderBys.length > 0 && ( !orderByItem.itemName || orderByItem.itemName === "" ))
               || ( isRequired && ( !orderByItem.orderBys || orderByItem.orderBys.length === 0 ))
               )
            {
                errors.push( format( "VAL.IS_REQUIRED" ) );
            }
        } catch ( e ) {
            errors.push( format( "VAL.IS_REQUIRED" ) );
        }
    } // addOrderByItemErrors

    /*
     * Returns a getComponents filter to search for an ORDER BY ITEM property and compare it against an itemName
     */
    function getOrderByItemFilter( propertyDef, itemName ) {
        return {
            filterFunction: function (){
                let property = this.getProperty( propertyDef.id ),
                    orderByItem;
                if ( property && property._value !== "" ) {
                    try {
                        orderByItem = JSON.parse( property._value );
                        return ( orderByItem.itemName.toLowerCase() === itemName.toLowerCase() );
                    }
                    catch ( e ) {
                        debug.error( "Invalid Order By Item JSON", e );
                    }
                }
                return false;
            }
        };
    } // getOrderByItemFilter

    /*
     * Updates and ORDER BY ITEM property and sets a new item name.
     */
    function setOrderByItemName( property, itemName ) {
        let orderByItem = JSON.parse( property.getValue() );
        orderByItem.itemName = itemName;
        property.setValue( JSON.stringify( orderByItem ) );
    } // getOrderByItemFilter

    /*
     * Checks an MEDIA property if it's valid, if not the errors are pushed into the errors array
     */
    function addMediaErrors( pProperty, pValue, pErrors ) {
        let lMedia = JSON.parse( pValue || "{}" );

        function checkColumn( pColumn, pDataTypes, pName, pIsRequired ) {
            if ( pColumn ) {
                const lError = pProperty._checkColumn( pColumn, pDataTypes );
                if ( lError === format( "VAL.COLUMN_HAS_WRONG_DATA_TYPE" ) ) {
                    pErrors.push( format( "MEDIA.COLUMN_HAS_WRONG_DATA_TYPE", format( "MEDIA." + pName ) ) );
                }
            } else if ( pIsRequired ) {
                pErrors.push( format( "VAL.IS_REQUIRED" ) );
            }
        }

        switch ( lMedia.source ) {
            case MEDIA_SOURCE.BLOB_COLUMN:

                checkColumn( lMedia.filenameColumn, [ "VARCHAR2" ], "FILENAME_COLUMN" );
                checkColumn(  lMedia.mimeTypeColumn, [ "VARCHAR2" ], "MIME_TYPE_COLUMN" );
                checkColumn( lMedia.lastUpdatedColumn, [ "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ" ], "LAST_UPDATED_COLUMN" );
                checkColumn( lMedia.blobColumn, [ "BLOB" ], "BLOB_COLUMN", true );
                break;

            case MEDIA_SOURCE.URL_COLUMN:

                checkColumn( lMedia.urlColumn, [ "VARCHAR2" ], "URL_COLUMN", true );
                break;

            case MEDIA_SOURCE.URL:

                if ( !lMedia.url && pProperty._isRequired ) {
                    pErrors.push( format( "VAL.IS_REQUIRED" ) );
                }
                break;

            default:

                if ( !lMedia && pProperty._isRequired ) {
                    pErrors.push( format( "VAL.IS_REQUIRED" ) );
                }
        }
    } // addMediaErrors

    /*
     * todo documentation
     */
    function Property( pOptions ) {

        let lPropertyId      = pOptions.propertyId,
            lPropertyDef     = gProperties[ lPropertyId ],
            lTypePropertyDef = gTypes[ pOptions.component.typeId ].properties[ lPropertyId ],
            lNewProperty     = lPropertyId;

        this.component = pOptions.component;

        if ( lNewProperty instanceof Property ) {

            //
            // Duplicate existing property
            //
            lNewProperty = $.extend( true, {}, lNewProperty );

            for ( let i in lNewProperty ) {
                if ( hasOwnProperty( lNewProperty, i ) && i !== "component" ) {
                    this[ i ] = lNewProperty[ i ];
                }
            }
            // The duplicated property should appear as a new unchanged property, all pending changes of the original
            // property should be ignored
            this.hasChanged = false;

            // Don't duplicate the value of the static ID properties, because in most cases it has to be unique and would
            // just result in errors on the page. Unless the property configured to be unqique; im that case we do not
            // need to clear the value, the getUniquePropertyValue will make sure the value is correct
            if ( pOptions.isDuplicated && [ PROP.DOM_STATIC_ID, PROP.STATIC_ID, PROP.IDENTIFICATION_STATIC_ID ].includes( this.id ) ) {
                let isUnique = gTypes[ this.component.typeId ].properties[ this.id ].checkUniqueness;
                if ( !isUnique ) {
                    this._value     = "";
                    this.hasChanged = true;
                    if ( this._isRequired ) {
                        this.errors.push( format( "VAL.IS_REQUIRED" ) );
                    }
                }
            }

        } else {

            //
            // New property
            //
            this.id          = lPropertyId;
            this._isRequired = lTypePropertyDef.isRequired;
            this._isReadOnly = lTypePropertyDef.isReadOnly;
            if ( PROP_TYPES_RETURNING_SQL.includes( lPropertyDef.type ) ) {
                this._sqlMinColumns = lPropertyDef.sqlMinColumns;
                this._sqlMaxColumns = lPropertyDef.sqlMaxColumns;
            }

            // Some of the meta data attributes are depending on the plug-in definition
            this._setDynamicProperties();

            //
            this.hasChanged           = false;
            this.errors               = [];
            this.warnings             = [];
            this._columns             = [];
            this._parameters          = [];
            this._hasOrderBy          = false;
            this._wsmHasLocalTableFor = false;
            this._wsmHasArrayColumns  = false;
            this._databaseType        = false;

            if ( hasOwnProperty( pOptions, "server" ) ) {
                if ( $.type( pOptions.server ) === "object" ) {
                    this._value        = pOptions.server.value;
                    this._columns      = pOptions.server.columns || [];
                    this._parameters   = pOptions.server.parameters || [];
                    this._hasOrderBy   = pOptions.server.hasOrderBy;
                    this._databaseType = pOptions.server.databaseType;
                } else {
                    this._value = pOptions.server;
                }
            } else {

                // If a plug-in explicitly doesn't want to set a default, don't fall back to property default, only if the caller has
                // also specified that a default should be used
                if ( ( pOptions.defaultValue || this._defaultValue ) === "" ) {
                    this._value = "";
                } else {
                    this._value = replaceDefaultPlaceholders( this, this._defaultValue || pOptions.defaultValue || lTypePropertyDef.defaultValue );
                }
                this._columns      = pOptions.columns || [];
                this._parameters   = pOptions.parameters || [];
                this._hasOrderBy   = pOptions.hasOrderBy;
                this._databaseType = pOptions.databaseType;

                // Set text case
                if ( lPropertyDef.textCase === "UPPER" ) {
                    this._value = this._value.toUpperCase();
                } else if ( lPropertyDef.textCase === "LOWER" ) {
                    this._value = this._value.toLowerCase();
                }

                // Some plug-in types allow to set a default value based on the configuration
                this._setDynamicDefaultValue();

                // Set the property and component to invalid if it's a required property and no value has been specified
                if ( this._isRequired && this._value === "" ) {
                    this.errors.push( format( "VAL.IS_REQUIRED" ) );

                // ORDER BY ITEM is a JSON object which needs multiple checks
                } else if ( lPropertyDef.type === PROP_TYPE.ORDER_BY_ITEM ) {
                    addOrderByItemErrors( this._isRequired, this._value, this.errors );
                }
            }
        }
    } // Property

    /*
     * Gets the region template object for valid region templates
     * Based on either regionTemplateId or regionId
     */
    function getRegionTemplate( { regionId, regionTemplateId } ) {

        const templates = getTheme().templates[ COMP_TYPE.REGION_TEMPLATE ];

        if ( regionId ) {
            const regionTemplateProp = gComponents[ COMP_TYPE.REGION ][ regionId ].getProperty( PROP.REGION_TEMPLATE );

            if ( regionTemplateProp ) {
                regionTemplateId = regionTemplateProp.getValue();
            }
        }

        // Return the template if we can find the regionTemplateId
        if ( hasOwnProperty( templates, regionTemplateId ) ) {
            return templates[ regionTemplateId ];
        } else if ( regionTemplateId && regionTemplateId !== "" ) {
            // Return the "No Template" template if the region template id
            // is not found in the list of templates and region template id
            // still returns a value
            return templates[ "" ];
        }

    } // getRegionTemplate

    /*
     * todo
     */
    Property.prototype._setDynamicProperties = function() {

        var lPluginType = gTypes[ this.component.typeId ].pluginType,
            lPlugin,
            lStdAttributeName;

        // For some properties the plug-in defines if it should be required or not
        if ( lPluginType && hasOwnProperty( this.component._properties, lPluginType.typePropertyId ) ) {
            lPlugin = lPluginType.plugins[ this.component._properties[ lPluginType.typePropertyId ]._value ];
            if ( lPlugin ) {

                // set required flag for region image property only if the selected region template is not null and uses the image url substitution string
                if ( this.id === PROP.REGION_IMAGE_URL && this.component._properties[ PROP.REGION_TEMPLATE ]?._value !== "" ) {
                    const regionTemplateId  = this.component._properties[ PROP.REGION_TEMPLATE ]._value;
                    const regionTemplate    = getRegionTemplate( { regionTemplateId } );

                    // check the template exists
                    if ( regionTemplate ) {
                        this._isRequired = regionTemplate.hasRegionImageUrl;
                    } else {
                        this._isRequired = false;
                    }
                }

                // Is the current property one which can be modified by a plug-in?
                if ( hasOwnProperty( PLUGIN_DYNAMIC_PROPERTIES_MAP, this.id ) ) {

                    lStdAttributeName = PLUGIN_DYNAMIC_PROPERTIES_MAP[ this.id ];

                    // Is it one of the properties where we have to set the required flag?
                    if ( $.inArray( this.id, lPluginType.requiredProperties ) !== -1 ) {
                        if ( this.id === PROP.AFFECTED_TYPE || this.id === PROP.PROCESS_REGION || this.id === PROP.PROCESS_DATA_SOURCE_REGION ) {
                            this._isRequired = ( $.inArray( lStdAttributeName, lPlugin.features ) !== -1 );
                        } else {
                            this._isRequired = (  lPlugin.stdAttributes
                                               && hasOwnProperty( lPlugin.stdAttributes, lStdAttributeName )
                                               && lPlugin.stdAttributes[ lStdAttributeName ].isRequired
                                               );
                        }
                    }
                    // Set additional dynamic attributes
                    if (  lPlugin.stdAttributes && hasOwnProperty( lPlugin.stdAttributes, lStdAttributeName ) && this.id !== PROP.LOV_TYPE && this.id !== PROP.FACET_LOV_TYPE ){
                        // Make sure that the property default value isn't used if the dynamic property isn't required and not specified on plug-in level
                        if ( !this._isRequired && !lPlugin.stdAttributes[ lStdAttributeName ].defaultValue ) {
                            this._defaultValue = "";
                        } else {
                            this._defaultValue = lPlugin.stdAttributes[ lStdAttributeName ].defaultValue;
                        }
                        this._sqlMinColumns = lPlugin.stdAttributes[ lStdAttributeName ].sqlMinColumns;
                        this._sqlMaxColumns = lPlugin.stdAttributes[ lStdAttributeName ].sqlMaxColumns;
                        this._examples      = lPlugin.stdAttributes[ lStdAttributeName ].examples;
                        this._helpText      = lPlugin.stdAttributes[ lStdAttributeName ].helpText;
                    }
                }
            }
        }

    }; // _setDynamicProperties


    /*
     * Most default values come from the server-side, but some properties have
     * default values that have to be evaluated on the client-side, making them
     * dynamic default values
     */
    Property.prototype._setDynamicDefaultValue = function() {

        var lPluginType = gTypes[ this.component.typeId ].pluginType,
            lPlugin;

        // For some properties the plug-in defines the value
        if ( lPluginType && hasOwnProperty( this.component._properties, lPluginType.typePropertyId ) ) {
            lPlugin = lPluginType.plugins[ this.component._properties[ lPluginType.typePropertyId ]._value ];
            if ( lPlugin && this.component.typeId === COMP_TYPE.DA_ACTION ) {
                if ( this.id === PROP.AFFECTED_TYPE ) {

                    // Check that the current affected type it's still a valid value for the current plug-in
                    if ( this._value !== "" && $.inArray( this._value, lPlugin.features ) === -1 ) {
                        this._value = "";
                    }

                } else if ( this.id === PROP.FIRE_ON_PAGE_LOAD ) {

                    // Default the property "Fire on Page Load" based on the plug-in configuration
                    if ( $.inArray( "ONLOAD", lPlugin.features ) !== -1 ) {
                        this._value = "Y";
                    } else {
                        this._value = "N";
                    }
                }
            }
        }

        // if the component does not have a source location, set the default value to N(Once)
        if ( this.id === PROP.EXECUTE_CONDITION
            && [ COMP_TYPE.REGION_ACTION, COMP_TYPE.REGION_ACTION_MENU_ENTRY ].includes( this.component.typeId )
            && this.getMetaData().referenceScope === "COMPONENT"
        ) {
            this._value = "N";
        }

    }; // _setDynamicDefaultValue


    /*
     * todo
     */
    Property.prototype._isVisible = function() {

        var lPropertyDef = gProperties[ this.id ],
            lComponent   = this.component,
            lTypePropDef = gTypes[ lComponent.typeId ].properties[ this.id ],
            lIsVisible,
            lDependingOn,
            lDependingOnValue,
            lDependingOnValues,
            i;

        function getRegionPropVisibility( pPropId ) {
            // get current template object
            const regionTemplate = getRegionTemplate( { regionTemplateId: lDependingOnValue } );

            // check if current template exists and set lIsVisible
            if ( regionTemplate ) {
                switch ( pPropId ) {
                    // region image properties follow a specific set of conditions based on the template that defines visibility
                    case PROP.REGION_IMAGE:            return ( !regionTemplate.hasRegionImage && !regionTemplate.hasRegionImageUrl );
                    case PROP.REGION_IMAGE_URL:        return ( regionTemplate.hasRegionImage || regionTemplate.hasRegionImageUrl );
                    case PROP.REGION_IMAGE_ALT_TEXT:   return ( regionTemplate.hasRegionImageAltText );
                    case PROP.REGION_IMAGE_ATTRIBUTES: return ( regionTemplate.hasRegionImageAttributes );
                    case PROP.USE_LANDMARK:            return ( regionTemplate.hasRegionLandmarkAttributes );
                    // all other properties that only depend on region template being not null
                    default:                           return true;
                }
            } else {
                return false;
            }
        }

        // Check if the property should be visible or not
        if (// 1) If the property is just there because of legacy issues,
            //    remove it if the current value isn't one of the legacy values where the property should still be displayed.
               (  hasOwnProperty( lPropertyDef, "deprecatedValues" )
               && lPropertyDef.deprecatedValues[ 0 ] !== "$NOT_NULL$"
               && !lPropertyDef.deprecatedValues.includes( this._value )
               )
            // 2) If the property is deprecated and doesn't contain a value
            || ( hasOwnProperty( lPropertyDef, "deprecatedValues" )
               && lPropertyDef.deprecatedValues[ 0 ] === "$NOT_NULL$"
               && this._value === ""
               )
            // 3) Does the DB version match, if not only remove it if it doesn't contain a value
            || (  hasOwnProperty( lPropertyDef, "minDbVersion" )
               && lPropertyDef.minDbVersion > gSharedComponents.dbVersion
               && this._value === ""
               )
            // 4) Does it match to the component type of the current component?
            || ( lPropertyDef.componentTypes && lPropertyDef.componentTypes.length > 0 && $.inArray( lComponent.typeId, lPropertyDef.componentTypes ) === -1 )
            // 5) Is it an internal attribute only used for workspace 10 apps?
            || ( lPropertyDef.isInternal && !gOptions.isInternal )
           )
        {
            lIsVisible = false;
        } else {

            if ( lTypePropDef.dependingOn.length === 0 ) {

                lIsVisible = true;

            } else {

                for ( i = 0; i < lTypePropDef.dependingOn.length; i ++ ) {

                    lDependingOn = lTypePropDef.dependingOn[ i ];

                    // Does the depending property exist in our value array? If not, the depending on check can never be true
                    // that's why we can immediately continue. Depending on the "Has to Exist" we treat it still as a successful
                    // dependency check if it equals FALSE.
                    if ( !hasOwnProperty( lComponent._properties, lDependingOn.id ) ) {

                        lIsVisible = ( lDependingOn.hasToExist === false );

                    } else {

                        lDependingOnValue = lComponent._properties[ lDependingOn.id ]._value;

                        if ( gProperties[ lDependingOn.id ].type === "CHECKBOXES" ) {
                            // Checkboxes can store multiple values separated by colons, that's why we have to
                            // compare all values against the expression

                            lDependingOnValues = ( lDependingOnValue === "" ? [] : lDependingOnValue.split( ":" ) );

                            switch( lDependingOn.type ) {
                                case "EQUALS":      lIsVisible = ( $.inArray( lDependingOn.expression, lDependingOnValues ) !== -1 ); break;
                                case "NOT_EQUALS":  lIsVisible = ( $.inArray( lDependingOn.expression, lDependingOnValues ) === -1 ); break;
                                case "NULL":        lIsVisible = ( lDependingOnValues.length === 0 ); break;
                                case "NOT_NULL":    lIsVisible = ( lDependingOnValues.length > 0 ); break;
                                case "IN_LIST":
                                    lIsVisible = false;
                                    // Check if any of the values in the value array equals any of
                                    // the values in the depending on expression array
                                    for ( let pValue of lDependingOnValues ) {
                                        lIsVisible = ( $.inArray( ( pValue === "" ? "$NULL$" : pValue ), lDependingOn.values ) !== -1 );
                                        // If result is true, then exit iterator.
                                        if ( lIsVisible ) { break; }
                                    }
                                    break;
                                case "NOT_IN_LIST":
                                    lIsVisible = ( lDependingOnValues.length > 0 );
                                    // Check if any of the values in the value array do not
                                    // equal any the values in the depending on expression array.
                                    for ( let pValue of lDependingOnValues ) {
                                        lIsVisible = ( $.inArray( pValue, lDependingOn.values ) === -1 );
                                        if ( !lIsVisible ) { break; }
                                    }
                                    break;
                            }

                        } else {

                            if ( lDependingOn.type === "IN_LIST_LIKE" ) {

                                lIsVisible = false;
                                // Check if any of the expression values matches the depending on value
                                for ( let pValue of lDependingOn.values ) {
                                    lIsVisible = ( lDependingOnValue.search( pValue ) === 0 );
                                    // If result is true, then exit iterator.
                                    if ( lIsVisible ) { break; }
                                }

                            } else if ( lDependingOn.type === "NOT_IN_LIST_LIKE" ) {

                                lIsVisible = true;
                                // Check if all of the expression values do NOT match the depending on value
                                for ( let pValue of lDependingOn.values ) {
                                    lIsVisible = ( lDependingOnValue.search( pValue ) === -1 );
                                    if ( !lIsVisible ) { break; }
                                }

                            } else {

                                switch( lDependingOn.type ) {
                                    case "EQUALS":      lIsVisible = ( lDependingOnValue === lDependingOn.expression ); break;
                                    case "NOT_EQUALS":  lIsVisible = ( lDependingOnValue !== lDependingOn.expression ); break;
                                    case "LIKE":        lIsVisible = ( lDependingOnValue.search( lDependingOn.expression ) === 0 ); break;
                                    case "NOT_LIKE":    lIsVisible = ( lDependingOnValue.search( lDependingOn.expression ) === -1 ); break;
                                    case "NULL":        lIsVisible = ( lDependingOnValue === "" ); break;
                                    case "NOT_NULL":
                                        // handle visibility for all properties depending on region template being not null
                                        if ( lDependingOn.id === PROP.REGION_TEMPLATE && lDependingOnValue !== "" ) {
                                            lIsVisible = getRegionPropVisibility( this.id );
                                        } else {
                                            lIsVisible = ( lDependingOnValue !== "" );
                                        }
                                        break;
                                    case "IN_LIST":     lIsVisible = ( $.inArray( ( lDependingOnValue === "" ? "$NULL$" : lDependingOnValue ), lDependingOn.values ) !==-1 ); break;
                                    case "NOT_IN_LIST": lIsVisible = ( $.inArray( lDependingOnValue, lDependingOn.values ) ===-1 && lDependingOnValue !== "" ); break;
                                }
                            }
                        }

                    }

                    // As soon as one of the dependency checks evaluates to false, we are done and don't have to check
                    // the other dependencies
                    if ( !lIsVisible ) {
                        break;
                    }
                }
            }
        }

        return lIsVisible;

    }; // _isVisible


    /*
     * todo
     */
    Property.prototype.getValue = function() {

        return this._value;

    }; // getValue


    /*
     * todo
     */
    Property.prototype.getDisplayValue = function() {

        let lPropertyDef     = gProperties[ this.id ],
            lType            = gTypes[ this.component.typeId ],
            lTypePropertyDef = lType.properties[ this.id ],
            lValue           = this._value;

        if ( lValue !== "" ) {

            if ( lPropertyDef.type === PROP_TYPE.YES_NO ) {

                return ( lValue === lPropertyDef.yesValue ) ? format( "LOV.YES" ) : format( "LOV.NO" );

            } else if ( lPropertyDef.type === PROP_TYPE.SUPPORTED_UI ) {

                if ( lPropertyDef.lovType === "PLUGINS" ) {

                    if ( hasOwnProperty( lType.pluginType.plugins, lValue ) ) {
                        return lType.pluginType.plugins[ lValue ].title;
                    }

                } else if ( lPropertyDef.lovType === "EVENTS" ) {

                    if ( hasOwnProperty( gEvents.lookupMap, lValue ) ) {
                        return gEvents.lookupMap[ lValue ].d;
                    }
                }

            } else if ( lPropertyDef.type === PROP_TYPE.COMBOBOX ) {

                return lValue;

            } else if ( lPropertyDef.lovType === "COMPONENT" ) {

                // For Build Options and Authorizations, check for "NOT"
                if (  lPropertyDef.lovComponentTypeId === COMP_TYPE.BUILD_OPTION
                    || lPropertyDef.lovComponentTypeId === COMP_TYPE.AUTHORIZATION )
                {
                    if ( lValue === "MUST_NOT_BE_PUBLIC_USER" ) {
                        return format( "LOV.MUST_NOT_BE_PUBLIC_USER" );
                        // Check if our ID starts with ! or - to negate it
                    } else if ( /^(!|-)/.test( lValue ) ) {
                        lValue = lValue.substr( 1 );
                        if ( hasOwnProperty( gComponents [ lPropertyDef.lovComponentTypeId ], lValue ) ) {
                            return formatNoEscape( "LOV.NOT_W_ARGUMENT", gComponents [ lPropertyDef.lovComponentTypeId ][ lValue ].getDisplayTitle() );
                        }
                    }
                }

                if ( hasOwnProperty( gComponents [ lPropertyDef.lovComponentTypeId ], lValue ) ) {
                    return gComponents [ lPropertyDef.lovComponentTypeId ][ lValue ].getDisplayTitle();
                }

            } else if ( lPropertyDef.lovType === "STATIC" ) {

                if ( hasOwnProperty( lPropertyDef.lovValuesMap, lValue ) ) {
                    return lPropertyDef.lovValues[ lPropertyDef.lovValuesMap[ lValue ]].d;
                }

            } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_TEMPLATES" ) {

                if ( hasOwnProperty( gActionTemplates, lValue )) {
                    return gActionTemplates[ lValue ].title;
                }

            } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_POSITIONS" ) {

                if ( hasOwnProperty( gActionPositions, lValue )) {
                    return gActionPositions[ lValue ].title;
                }

            } else if ( lPropertyDef.lovType === "SLOTS" ) {

                const regionId = getParentRegionId( this.component );
                const slot = getSlot( { componentTypeId:this.component.typeId, regionId, slotPlaceholder: lValue } );
                return slot?.name || formatNoEscape( "LOV.UNKNOWN_LOOKUP", lValue );

            } else if ( lPropertyDef.lovType === "TEMPLATE_OPTIONS" ) {

                let lTemplateOptionsMap = getTemplateOptions( this ).valuesMap,
                    lValues             = lValue.split( ":" ),
                    lDisplayValues      = [];

                for ( let i = 0; i < lValues.length; i++ ) {
                    if ( hasOwnProperty( lTemplateOptionsMap, lValues[ i ] ) ) {
                        lDisplayValues.push( lTemplateOptionsMap[ lValues[ i ] ].d );
                    } else {
                        lDisplayValues.push( formatNoEscape( "LOV.UNKNOWN_LOOKUP", lValues[ i ] ) );
                    }
                }
                return lDisplayValues.join( ", " );

            } else {
                return lValue;
            }

            return formatNoEscape( "LOV.UNKNOWN_LOOKUP", lValue );

        } else {

            if ( lTypePropertyDef.nullText ) {
                return ( lTypePropertyDef.nullText );
            } else {
                return lValue;
            }
        }

    }; // getDisplayValue


    /*
     * todo
     */
    Property.prototype.getMetaData = function() {

        function isRowScope( pTypeId, pPropertyId, pDependingOnPropertyId, pForEachRowPropertyId ) {
            let lProperty, lEachRowProperty;
            if ( lSelf.component.typeId === pTypeId ) {
                lProperty = lSelf.component.getProperty( pPropertyId );
                if ( lProperty && lProperty.getValue() !== "" ) {
                    lEachRowProperty = lSelf.component.getProperty( pForEachRowPropertyId );
                    // We also have to check the 'Execute Condition' property if the current property
                    // is a condition property
                    return !(  lTypePropertyDef.dependingOn.length > 0
                            && lTypePropertyDef.dependingOn[ 0 ].id === pDependingOnPropertyId
                            && ( !lEachRowProperty || lEachRowProperty.getValue() === "N"  )
                            );
                }
            }
            return false;
        } // isRowScope

        var lSelf              = this,
            lPropertyDef       = gProperties[ this.id ],
            lType              = gTypes[ this.component.typeId ],
            lTypePropertyDef   = lType.properties[ this.id ],
            lReferenceScope    = lTypePropertyDef.referenceScope,
            lIsReadOnly        = ( this.component.isReadOnly() || this._isReadOnly );

        // If the reference scope is depending on the value of another property, check to see if it's actually ROW based
        if ( lReferenceScope === "DEPENDS" ) {
            lReferenceScope = "COMPONENT";
            if (  isRowScope( COMP_TYPE.VALIDATION,               PROP.VALIDATION_REGION, PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.PAGE_PROCESS,             PROP.PROCESS_REGION,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.IG_COLUMN,                PROP.READ_ONLY_TYPE,    PROP.READ_ONLY_TYPE, PROP.EXECUTE_READONLY )
               || isRowScope( COMP_TYPE.CARD_ACTION,              PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.REGION_ACTION,            PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.REGION_ACTION_MENU_ENTRY, PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.IR_COLUMN_ACTION,         PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.IR_COL_ACTION_MENU_ENTRY, PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || isRowScope( COMP_TYPE.MAP_LAYER,                PROP.CONDITION_TYPE,    PROP.CONDITION_TYPE, PROP.EXECUTE_CONDITION )
               || ( lSelf.component.typeId === COMP_TYPE.DA_ACTION && lSelf.component.getProperty( PROP.IG_REGION ).getValue() !== "" )
            )
            {
                lReferenceScope = "ROW";

            } else if ( lSelf.component.typeId === COMP_TYPE.PAGE_PROC_API_PARAM ) {
                let editRegionId = lSelf.component.getParent().getProperty( PROP.PROCESS_REGION ).getValue(),
                    editRegion;
                if ( editRegionId !== "" ) {
                    editRegion = getComponents( COMP_TYPE.REGION, { id: editRegionId }, false )[ 0 ];
                    // Only a row based region type like IG, Tabular Form, ... should support referencing columns
                    if ( editRegion.getProperty( PROP.REGION_TYPE ).getValue() !== "NATIVE_FORM" ) {
                        lReferenceScope = "ROW";
                    }
                }
            } else if ( [ COMP_TYPE.REGION_PLUGIN_ATTR, COMP_TYPE.REGION_ACTION, COMP_TYPE.REGION_ACTION_MENU_ENTRY ].includes( lSelf.component.typeId ) ) {
                // The behavior of these properties depends on the parent region's source value
                // Has a data source been defined for the parent region?
                // - Yes: Return the columns
                // - No: Return the page items
                let component = this.component;
                while ( component && component.typeId !== COMP_TYPE.REGION ) {
                    component = component.getParent();
                }
                if ( component?.getProperty( PROP.SOURCE_LOCATION )?.getValue() ) {
                    lReferenceScope = "ROW";
                }
            }
        }

        //  Page Mode should also be read-only if no dialog page templates are available.
        if ( this.id === PROP.PAGE_MODE && getTheme().defaultTemplates.dialog === "" ) {
            lIsReadOnly = true;
        }

        return {
            type:                      lPropertyDef.type,
            multiValueDelimiter:       lPropertyDef.multiValueDelimiter,
            prompt:                    lPropertyDef.prompt,
            unit:                      lPropertyDef.unit,
            displayLen:                lPropertyDef.displayLen,
            maxLen:                    lPropertyDef.maxLen,
            textCase:                  lPropertyDef.textCase,
            displayGroupId:            lPropertyDef.displayGroupId,
            yesValue:                  lPropertyDef.yesValue,
            noValue:                   lPropertyDef.noValue,
            isDeprecated:              hasOwnProperty( lPropertyDef, "deprecatedValues" ),
            lovComponentScope:         lPropertyDef.lovComponentScope,
            lovComponentTypeId:        lPropertyDef.lovComponentTypeId,
            // not everybody needs the help text, that's why we defer the generation
            helpText:                  function(){ return lSelf._getHelpText(); },
            //
            displaySeq:                lTypePropertyDef.displaySeq,
            isCommon:                  lTypePropertyDef.isCommon,
            isUnique:                  hasOwnProperty( lTypePropertyDef, "checkUniqueness" ),
            referenceScope:            lReferenceScope,
            defaultValue:              lTypePropertyDef.defaultValue,
            supportsSubstitution:      lTypePropertyDef.supportsSubstitution,
            supportsTemplateDirective: lTypePropertyDef.supportsTemplateDirective,
            customDataType:            lTypePropertyDef.customDataType,
            //
            isReadOnly:                lIsReadOnly,
            isRequired:                this._isRequired,
            isTranslatable:            ( lPropertyDef.isTranslatable || false ),
            // not everybody needs the lov and quickpick values, that's why we defer the generation
            lovValues:                 function( pCallback, pFilters ) { return lSelf._getLovValues( pCallback, pFilters ); },
            quickPicks:                function() { return lSelf._getQuickPicks( lReferenceScope ); },
            nullText:                  lTypePropertyDef.nullText,
            //
            parentProperty:            lTypePropertyDef.parentProperty,
            isCustomPluginAttribute:   lPropertyDef.isCustomPluginAttribute
        };

    }; // getMetaData


    Property.prototype._getLovValues = function( pCallback, pFilters ) {

        var lSelf            = this,
            lPropertyDef     = gProperties[ this.id ],
            lType            = gTypes[ this.component.typeId ],
            lTypePropertyDef = lType.properties[ this.id ],
            lFilter          = {},
            lComponents,
            lComponent,
            lFeatures,
            lColumns,
            lGridColumnNo,
            lGridColumnSpan,
            lMinGridColumns = 1,
            lMaxGridColumns,
            lLovValue,
            lRegionId,
            lRegionPropertyId,
            lIsDialog,
            lPageTemplates,
            lCategoryMap      = {},
            lLovValues        = [],
            lWrongDataTypeLov = [];

        function addNotEntries( pComponents, pPrefix ) {
            for ( let i = 0; i < pComponents.length; i++ ) {
                lLovValues.push( {
                    r: pPrefix + pComponents[ i ].id,
                    d: formatNoEscape( "LOV.NOT_W_ARGUMENT", pComponents[ i ].getDisplayTitle() )
                } );
            }
        }

        function getSupportedUiLovValues( pLovValues ) {

            var lResultLovValues = [];

            for ( let i = 0; i < pLovValues.length; i++ ) {
                lResultLovValues.push( {
                    r:           pLovValues[ i ].r,
                    d:           pLovValues[ i ].d,
                    isQuickPick: pLovValues[ i ].isQuickPick,
                    isSupported: true,
                    isLegacy:    false
                } );
            }
            return lResultLovValues;
        }

        function getRegionLovValues( pComponents ) {

            function addLovValues( pLovValues, pRegions, pPrefix ) {

                // Sort the regions by display title
                pRegions.sort( function( a, b ) {
                    return a.d.localeCompare( b.d );
                } );

                for ( let i = 0; i < pRegions.length; i++ ) {

                    // If the current property is the "Parent Region" or "Master Region" property, don't show the
                    // current region or it's children in the LOV to avoid recursions (bug #21546558)
                    if (  !( lSelf.id === PROP.PARENT_REGION && pRegions[ i ].r === lSelf.component.id )
                       && !( lSelf.id === PROP.MASTER_REGION && pRegions[ i ].r === lSelf.component.id )
                       )
                    {
                        pLovValues.push( {
                            r: pRegions[ i ].r,
                            d: pPrefix + pRegions[ i ].d
                        } );

                        // Do we have regions which are referencing that region? Add them as sub regions
                        if ( hasOwnProperty( lParentRegionMap, pRegions[ i ].r ) ) {
                            addLovValues( pLovValues, lParentRegionMap[ pRegions[ i ].r ], pPrefix + ".." );
                        }
                    }
                }
            }

            var lParentId,
                lMapKey,
                lRegionMap = {},
                lParentRegionMap = { "": [] },
                lLovValues = [];

            for ( let i = 0; i < pComponents.length; i++ ) {

                lParentId = pComponents[ i ].getProperty( PROP.PARENT_REGION ).getValue();

                if ( pComponents[ i ].isOnGlobalPage() && lParentId === "" ) {
                    lMapKey = "global";
                } else {
                    lMapKey = lParentId;
                }
                if ( !hasOwnProperty( lParentRegionMap, lMapKey ) ) {
                    lParentRegionMap[ lMapKey ] = [];
                }
                lParentRegionMap[ lMapKey ].push( {
                    r: pComponents[ i ].id,
                    d: pComponents[ i ].getDisplayTitle()
                } );
                lRegionMap[ pComponents[ i ].id ] = true;
            }

            // Check if all our parent regions do actually have a parent region themselves, if not re-map them to the root
            // This can happen if a tabular form region is a sub region and we only query tabular forms (bug #20715402)
            for ( lMapKey in lParentRegionMap ) {
                if ( hasOwnProperty( lParentRegionMap, lMapKey ) && lMapKey !== "" && lMapKey !== "global" && !hasOwnProperty( lRegionMap, lMapKey ) ) {
                    lParentRegionMap[ "" ] = lParentRegionMap[ "" ].concat( lParentRegionMap[ lMapKey ] );
                }
            }

            addLovValues( lLovValues, lParentRegionMap[ "" ], "" );

            // Add global regions
            if ( hasOwnProperty( lParentRegionMap, "global" ) ) {
                addLovValues( lLovValues, lParentRegionMap.global, "" );
            }

            return lLovValues;
        } // getRegionLovValues


        if ( lPropertyDef.type === PROP_TYPE.SUPPORTED_UI ) {

            if ( lPropertyDef.lovType === "PLUGINS" ) {

                let unsupportedPlugins = [];
                let legacyPlugins = [];
                const legacyTextMessage = lang.getMessage( "PD.PE.PLUGIN.GROUP.LEGACY" );
                const unsupportedTextMessage = lang.getMessage( "PD.PE.PLUGIN.GROUP.UNSUPPORTED" );
                forEachAttribute( lType.pluginType.plugins, function( pPluginName, pPlugin ) {

                    // Only show a deprecated or legacy plug-in if it's currently in use
                    if ( lSelf._value === pPluginName || isValidPlugin( lSelf.component, pPlugin, { isDeprecated: true } ) ) {
                        // Hide Cloud-specific plug-in if the APEX instance is not running in a cloud environment.
                        // The "Server Side Geocoding" process type for example should only be displayed in an APEX ADB installation since it
                        // uses a Spatial function that is only available in ADB instances.
                        if ( pPlugin.cloudOnly && !gSharedComponents.isCloud ) {
                            return;
                        }

                        let isSupported = true;
                        if ( [ COMP_TYPE.REGION, COMP_TYPE.PAGE_ITEM ].includes( lSelf.component.typeId ) ) {
                            const component = lSelf.component;
                            const regionId = getParentRegionId( component );
                            const slotPlaceholder = component.getPropertyValue( PROP.SLOT_PLACEHOLDER );
                            const slot = getSlot( { componentTypeId: component.typeId, regionId, slotPlaceholder} );

                            if ( slot ) {
                                if ( component.typeId === COMP_TYPE.PAGE_ITEM && slot.supportedItemTypes ) {
                                    isSupported = slot.supportedItemTypes.includes( pPluginName );
                                }

                                if ( component.typeId === COMP_TYPE.REGION && slot.supportedRegionTypes ) {
                                    isSupported = slot.supportedRegionTypes.includes( pPluginName );
                                }
                            }
                        }

                        lLovValue    = {
                            r:           pPluginName,
                            d:           pPlugin.title,
                            isSupported,
                            isLegacy:    pPlugin.isLegacy
                        };

                        if ( pPlugin.category !== undefined && isSupported && !pPlugin.isLegacy ) {
                            if ( !hasOwnProperty( lCategoryMap, pPlugin.category ) ) {
                                lCategoryMap[ pPlugin.category ] = lLovValues.length;
                                lLovValues.push( {
                                    group:  gPluginCategories[ pPlugin.category ],
                                    values: []
                                } );
                            }
                            lLovValues[ lCategoryMap[ pPlugin.category ] ].values.push( lLovValue );
                        } else {
                            // Add plugin to legacy group or unsupported group
                            if ( pPlugin.isLegacy ) {
                                legacyPlugins.push( lLovValue );
                            } else if ( !isSupported ) {
                                unsupportedPlugins.push( lLovValue );
                            } else {
                                lLovValues.push( lLovValue );
                            }
                        }
                    }

                } );

                if ( unsupportedPlugins.length > 0 ) {
                    lLovValues.push( {
                        group: unsupportedTextMessage,
                        values: unsupportedPlugins
                    } );
                }

                if ( legacyPlugins.length > 0 ) {
                    lLovValues.push( {
                        group: legacyTextMessage,
                        values: legacyPlugins
                    } );
                }

                // Sort the values of all category groups
                forEachAttribute( lCategoryMap, function( i, pCategory ) {
                    // Sort the types of the component by title
                    lLovValues[ pCategory ].values.sort( function( a, b ) {
                        return a.d.localeCompare( b.d );
                    } );
                } );

                // Sort the main list
                lLovValues.sort( function( a, b ) {
                    let attr1 = ( hasOwnProperty( a, "d" ) ) ? "d" : "group";
                    let attr2 = ( hasOwnProperty( b, "d" ) ) ? "d" : "group";
                    let value1 = a[ attr1 ];
                    let value2 = b[ attr2 ];
                    // Alway put Unsupported and Legacy groups to the end of the list
                    const unsupportedLegacyOrderMap = {};
                    unsupportedLegacyOrderMap[ unsupportedTextMessage ] = 1;
                    unsupportedLegacyOrderMap[ legacyTextMessage ] = 2;
                    if ( value1 in unsupportedLegacyOrderMap && value2 in unsupportedLegacyOrderMap ) {
                        return unsupportedLegacyOrderMap[ value1 ] - unsupportedLegacyOrderMap[ value2 ];
                    } else if ( value1 in unsupportedLegacyOrderMap ) {
                        return 1;
                    } else if ( value2 in unsupportedLegacyOrderMap ) {
                        return -1;
                    }

                    return value1.localeCompare( value2 );
                } );

            } else if ( lPropertyDef.lovType === "EVENTS" ) {

                lLovValues.push( {
                    group:  format( "LOV.BROWSER_EVENTS" ),
                    values: getSupportedUiLovValues( gEvents.browser )
                } );
                lLovValues.push( {
                    group:  format( "LOV.APEX_EVENTS" ),
                    values: getSupportedUiLovValues( gEvents.apex )
                } );
                if ( gEvents.component.length > 0 ) {
                    lLovValues.push( {
                        group:  format( "LOV.COMPONENT_EVENTS" ),
                        values: getSupportedUiLovValues( gEvents.component )
                    } );
                }
                lLovValues.push( {
                    group:  format( "LOV.CUSTOM_EVENT" ),
                    values: getSupportedUiLovValues( gEvents.custom )
                } );
            }

        } else if ( lPropertyDef.type === PROP_TYPE.OWNER ) {

            lLovValues = gSharedComponents.schemas;

        } else if ( [ PROP_TYPE.TABLE, PROP_TYPE.GRAPH, PROP_TYPE.PLSQL_PACKAGE, PROP_TYPE.PLSQL_METHOD ].includes( lPropertyDef.type )) {
            //
            // re-fetch the component to get current settings for schema and remote server id
            lComponents = getComponents( lSelf.component.typeId, { id: lSelf.component.id }, false );
            lComponent  = ( ( lComponents && lComponents.length > 0 ) ? lComponents[ 0 ] : lSelf.component );

            let lOwner,
                lPackage,
                lParentTypePropertyDef,
                lParentProperty;

            if ( [ PROP_TYPE.TABLE, PROP_TYPE.GRAPH, PROP_TYPE.PLSQL_PACKAGE ].includes( lPropertyDef.type )) {
                lOwner = lComponent._properties[ lTypePropertyDef.parentProperty.id ]._value;
            } else {
                // Is it a method of a package or a stand-alone procedure/function?
                lParentProperty = gProperties[ lTypePropertyDef.parentProperty.id ];
                lParentTypePropertyDef = lType.properties[ lTypePropertyDef.parentProperty.id ];
                if ( lParentProperty.type === PROP_TYPE.PLSQL_PACKAGE ) {
                    lOwner   = lComponent._properties[ lParentTypePropertyDef.parentProperty.id ]._value;
                    lPackage = lComponent._properties[ lParentTypePropertyDef.propertyId ]._value;
                } else {
                    lOwner = lComponent._properties[ lParentTypePropertyDef.propertyId ]._value;
                }
            }

            ajax(
                "getDbObjects", {
                    x01: pFilters.type,
                    x02: lOwner,
                    x03: lPackage,
                    x04: ( hasOwnProperty( lComponent._properties, PROP.SOURCE_REMOTE_DATABASE ) ? lComponent._properties[ PROP.SOURCE_REMOTE_DATABASE ]._value : "" ) // remote server id
                }, {
                    success: pCallback
                }
            );
            return; // callback called by pCallback

        } else if ( [ PROP_TYPE.COLUMN, PROP_TYPE.REGION_COLUMN, PROP_TYPE.SESSION_STATE_VALUE ].includes( lPropertyDef.type ) ) {

            // Return page items for SESSION_STATE_VALUE if reference scope is COMPONENT
            if ( lPropertyDef.type === PROP_TYPE.SESSION_STATE_VALUE
                && this.component.typeId === COMP_TYPE.REGION_PLUGIN_ATTR
                && this.getMetaData()?.referenceScope === "COMPONENT"
            ) {
                // we want to use the item name as the display value
                return getItemsLov( { type: "page", pageId: gCurrentPageId } ).map( entry => {
                    entry.d = entry.r;
                    return entry;
                } );
            }

            lColumns = this._getAvailableColumns( true );

            // First show all columns which have a valid data type and then all the other columns in it's own group
            // Display the columns in the order of the SQL statement/Region Columns
            for ( let i = 0; i < lColumns.length; i++ ) {
                if ( isMatchingDataType( lColumns[ i ].type, lPropertyDef.dataTypes ) ) {

                    lLovValues.push( {
                        r: lColumns[ i ].name,
                        d: lColumns[ i ].name
                    } );

                    // Don't include our auto added ROWID if ROWID's are not supported for this property
                } else if ( lColumns[ i ].name !== "ROWID" && lColumns[ i ].type ) {

                    lWrongDataTypeLov.push( {
                        r: lColumns[ i ].name,
                        d: lColumns[ i ].name + " (" + lColumns[ i ].type.toLowerCase() + ")"
                    } );
                }
            }

            // If the column name is defined as "1", "2", ... we fallback into a legacy
            // behavior and show it as an absolute column positioning
            if ( lSelf._value.substr( 0, 1 ) === '"' ) {
                lLovValues.push( {
                    r: lSelf._value,
                    d: format( "LOV.ABSOLUTE_COLUMN_NO", lSelf._value.substr( 1, 1 ) )
                } );
            }

            if ( lWrongDataTypeLov.length > 0 ) {
                lLovValues.push( {
                    group:  format( "LOV.COLUMN_WRONG_DATA_TYPE" ),
                    values: lWrongDataTypeLov
                } );
            }

        } else if ( lPropertyDef.type === PROP_TYPE.MEDIA ) {

            if ( this.component.typeId === COMP_TYPE.REGION_PLUGIN_ATTR ) {

                // Plug-in attributes should always return the defined region columns
                // and not the SQL columns
                lLovValues = getRegionColumns( this.component.getParent().id );

            } else {

                // IR Column should return all SQL columns
                lColumns = this._getAvailableColumns();

                for ( let i = 0; i < lColumns.length; i++ ) {
                    lLovValues.push( {
                        r:          lColumns[ i ].name,
                        d:          lColumns[ i ].name,
                        dataType:   lColumns[ i ].type
                    } );
                }
            }

        } else if ( lPropertyDef.type === PROP_TYPE.ITEM ) {

            if (  lPropertyDef.lovComponentScope === "COLUMN"
               || [ COMP_TYPE.IG_COLUMN, COMP_TYPE.DA_ACTION, COMP_TYPE.VALIDATION,
                    COMP_TYPE.PAGE_PROCESS, COMP_TYPE.PAGE_PROC_API_PARAM, COMP_TYPE.IR_COLUMN,
                    COMP_TYPE.REGION_ACTION, COMP_TYPE.REGION_ACTION_MENU_ENTRY,
                    COMP_TYPE.IR_COLUMN_ACTION, COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ].includes( this.component.typeId )
               )
            {

                // The parent property points to a region
                if ( lTypePropertyDef.parentProperty ) {
                    lRegionId = this.component._properties[ lTypePropertyDef.parentProperty.id ]._value;
                } else if ( this.component.typeId === COMP_TYPE.IG_COLUMN ) {
                    // get region id of IG column
                    lRegionId = this.component.parentId;
                } else if ( this.component.typeId === COMP_TYPE.PAGE_PROC_API_PARAM ) {
                    // "Editable Region" property of the process
                    lRegionId = this.component.getParent().getProperty( PROP.PROCESS_REGION ).getValue();
                } else if ( this.component.typeId === COMP_TYPE.IR_COLUMN ) {
                    // get region id of IR column
                    lRegionId = this.component.getParent().parentId;
                } else if ( this.component.typeId === COMP_TYPE.IR_COLUMN_ACTION ) {
                    // get region id of IR column
                    lRegionId = this.component.getParent().getParent().parentId;
                } else if ( this.component.typeId === COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ) {
                    // get region id of IR column
                    lRegionId = this.component.getParent().getParent().getParent().parentId;
                } else if ( this.component.typeId === COMP_TYPE.REGION_ACTION ) {
                    lRegionId = this.component.parentId;
                } else if ( this.component.typeId === COMP_TYPE.REGION_ACTION_MENU_ENTRY ) {
                    lRegionId = this.component.getParent().parentId;
                } else {
                    // get the region id from dedicated region properties
                    if ( this.component.typeId === COMP_TYPE.DA_ACTION ) {
                        lRegionPropertyId = PROP.IG_REGION;
                    } else if ( this.component.typeId === COMP_TYPE.VALIDATION ) {
                        lRegionPropertyId = PROP.VALIDATION_REGION;
                    } else if ( this.component.typeId === COMP_TYPE.PAGE_PROCESS ) {
                        lRegionPropertyId = PROP.PROCESS_REGION;
                    }
                    lRegionId = this.component.getProperty( lRegionPropertyId ).getValue();
                }
                lLovValues = getRegionColumns( lRegionId );

            } else if ( [ COMP_TYPE.CARD_ACTION, COMP_TYPE.MAP_LAYER ].includes( this.component.typeId ) ) {
                // item lov for card action and map layer are columns of their parent
                lLovValues = getItemsLov( { type: "columns", component: lSelf.component } );
            } else {
                getItemsLov( pFilters, pCallback );
                return; // callback called by pCallback
            }

        } else if ( lPropertyDef.type === PROP_TYPE.FACET ) {

            lLovValues = getItemsLov( { type: "facet", component: lSelf.component }, pCallback );

        } else if ( lPropertyDef.type === PROP_TYPE.PAGE ) {

            getPagesLov( pFilters, pCallback );
            return; // callback called by pCallback

        } else if ( lPropertyDef.lovType ) {

            if ( lPropertyDef.lovType === "COMPONENT" ) {

                if ( lPropertyDef.lovComponentScope === "PARENT" ) {
                    lFilter = {parentId: lSelf.component.parentId, excludeGlobalPage: true};
                } else if ( lPropertyDef.lovComponentScope === "REGION" ) {
                    if ( this.id === PROP.FACET_GROUP || this.id === PROP.SFILTER_GROUP ) {
                        lFilter = {parentId: this.component._properties[PROP.HIDDEN_PARENT_REGION]._value, excludeGlobalPage: true};
                    } else if ( this.id === PROP.DEPENDING_ON_FACET_GRP_ITEM || this.id === PROP.DEPENDING_ON_SFILTER_GRP_ITEM ) {
                        lFilter.properties = [{
                            id:    PROP.HIDDEN_PARENT_REGION,
                            value: this.component._properties[PROP.HIDDEN_PARENT_REGION]._value
                        }];
                    } else if ( this.id === PROP.DEPENDING_ON_FACET || this.id === PROP.DEPENDING_ON_SFILTER ) {
                        lFilter = {parentId: lSelf.component.parentId, excludeGlobalPage: true};
                    }
                } else if ( lPropertyDef.lovComponentScope === "PAGE" ) {
                    lFilter = {excludeGlobalPage: true};
                } else if ( lPropertyDef.lovComponentScope === "PAGE_AND_GLOBAL" ) {
                    lFilter = {};
                } else if ( lPropertyDef.lovComponentScope === "REST_SOURCE" ) {

                    // for the REST Operation LOV we need to look up the "REST Source ID" property and
                    // to filter by its value.
                    for ( let lPropId in this.component._properties ) {
                        if ( gProperties[ lPropId ] && gProperties[ lPropId ].type === PROP_TYPE.REST_SOURCE_ID ) {
                            lFilter = {parentId: this.component._properties[lPropId]._value, excludeGlobalPage: true};
                        }
                    }
                } else if ( lPropertyDef.lovComponentScope === "THEME" ) {
                    lFilter = {parentId: getTheme().id};

                    // Do we have to restrict the page templates?
                    if ( ( lPropertyDef.id === PROP.PAGE_TEMPLATE || lPropertyDef.id === PROP.DIALOG_TEMPLATE )
                        && lTypePropertyDef.parentProperty
                        && lTypePropertyDef.parentProperty.id === PROP.PAGE_MODE ) {
                        lIsDialog = ( ["MODAL", "NON_MODAL"].includes( lSelf.component._properties[PROP.PAGE_MODE]._value ) );
                        lPageTemplates = getTheme().templates[COMP_TYPE.PAGE_TEMPLATE];

                        // Only include those page templates which can be used for the current page mode
                        lFilter.filterFunction = function (){
                            return ( lPageTemplates[this.id].isDialog === lIsDialog );
                        };
                    }

                } else if ( lPropertyDef.lovComponentScope === "WF_VERSION" ) {
                    let parent = this.component.getParent();
                    if ( parent ) {
                        lFilter = { parentId: parent.parentId };
                    }
                }

                if ( lPropertyDef.id === PROP.SOURCE_WEB_SRC_ARRAY_COL ) {
                    lFilter = {parentId: this.component._properties[PROP.SOURCE_WEB_SRC_QUERY]._value, excludeGlobalPage: true};
                }

                if ( lPropertyDef.id === PROP.SOURCE_DUALITY_VIEW_ARRAY_COL ) {
                    lFilter = {parentId: this.component._properties[PROP.SOURCE_DUALITY_VIEW]._value, excludeGlobalPage: true};
                }
                if ( lPropertyDef.id === PROP.SOURCE_JSON_COLLECTION_ARRAY_COL ) {
                    lFilter = {parentId: this.component._properties[PROP.SOURCE_JSON_COLLECTION]._value, excludeGlobalPage: true};
                }


                if ( lPropertyDef.id === PROP.PARENT_PROCESS ) {
                    let self = this;

                    lFilter.filterFunction = function() {
                        let processType        = this.getProperty( PROP.PAGE_PROCESS_TYPE ).getValue(),
                            filterForComponent = self.component;

                        function isChildOf( parentComponent, childComponent ) {
                            let childParentProp;

                            if ( parentComponent.id === childComponent.getProperty( PROP.PARENT_PROCESS ).getValue() ) {
                                return true;
                            }

                            childParentProp = childComponent.getProperty( PROP.PARENT_PROCESS );
                            if ( childParentProp && childParentProp.getValue() !== "" ) {
                                let childParentId        = childParentProp.getValue(),
                                    childParentComponent = getComponents( COMP_TYPE.PAGE_PROCESS, { id: childParentId } )[ 0 ];

                                return isChildOf( filterForComponent, childParentComponent );
                            }
                        }

                        return processType === "NATIVE_EXECUTION_CHAIN" && !isChildOf( filterForComponent, this );
                    };
                }

                // Restrict the Editable Region select list attribute of Validations and Page Processes
                // Processes   support: NATIVE_TABFORM, editable NATIVE_IG, NATIVE_FORM
                // Validations support: NATIVE_TABFORM, editable NATIVE_IG              (see 31193604)
                if ( lPropertyDef.id === PROP.VALIDATION_REGION || lPropertyDef.id === PROP.PROCESS_REGION ) {
                    lFilter.filterFunction = function (){

                        var lType = this.getProperty( PROP.REGION_TYPE ).getValue();

                        return ( lType === "NATIVE_TABFORM"
                            || ( lType === "NATIVE_FORM" && lPropertyDef.id === PROP.PROCESS_REGION )
                            || ( lType === "NATIVE_IG"
                                && this.getChilds( COMP_TYPE.IG_ATTRIBUTES, {
                                    properties: [{
                                        id:    PROP.IS_EDITABLE,
                                        value: "Y"
                                    }]
                                } ).length > 0
                            )
                        );
                    };
                }

                // do not show "end" activities as "from" and "start" as "to"
                if ( lPropertyDef.id === PROP.FROM_WORKFLOW_ACTIVITY ) {
                    lFilter.filterFunction = function() {
                        return this.getProperty( PROP.PAGE_PROCESS_TYPE ).getValue() !== "NATIVE_WORKFLOW_END";
                    };
                }

                // Restrict the "Data Source Region" to Form Regions only
                if ( lPropertyDef.id === PROP.DATA_SOURCE_REGION || lPropertyDef.id === PROP.PROCESS_DATA_SOURCE_REGION ) {
                    lFilter.filterFunction = function (){

                        var lType = this.getProperty( PROP.REGION_TYPE ).getValue();

                        return ( lType === "NATIVE_FORM" );
                    };
                }

                // Master Detail relationships are currently only available for Interactive Grids
                if ( lPropertyDef.id === PROP.MASTER_REGION ) {
                    lFilter.properties = [{
                        id:    PROP.REGION_TYPE,
                        value: "NATIVE_IG"
                    }];
                }

                // We want to get the columns of the Master region which has been specified for the current IG region
                if ( [ PROP.MASTER_COLUMN, PROP.VALUE_PARENT_COLUMN ].includes( lPropertyDef.id ) ) {
                    lFilter.parentId = lSelf.component.getParent().getProperty( PROP.MASTER_REGION ).getValue();
                    lFilter.properties = [
                        {id: PROP.COLUMN_SOURCE_TYPE, value: "DB_COLUMN"},
                        {id: PROP.DATA_TYPE, value: new RegExp( "(VARCHAR2|NUMBER|DATE|TIMESTAMP)" )} // includes all TIMESTAMP data types!
                    ];
                }

                // Faceted Search/Smart Filters is currently available for all region types
                // (with data source defined)
                if ( lPropertyDef.id === PROP.SOURCE_FILTERED_REGION ) {
                    lFilter.filterFunction = function (){
                        return (
                            gFacetedSearchRegionTypes.includes( this.getProperty( PROP.REGION_TYPE ).getValue() )
                            && this.getPropertyValue( PROP.SOURCE_LOCATION ) !== ""
                        );
                    };
                }

                // If Dynamic Action Selection Type is "Column(s)", filter on editable IG regions only
                if ( lPropertyDef.id === PROP.WHEN_IG_REGION ) {
                    lFilter.properties = [{
                        id:    PROP.REGION_TYPE,
                        value: "NATIVE_IG"
                    }];
                    lFilter.filterFunction = function (){
                        return this.getChilds( COMP_TYPE.IG_ATTRIBUTES, {
                                    properties: [{
                                        id:    PROP.IS_EDITABLE,
                                        value: "Y"
                                    }]
                                } ).length > 0;
                    };
                }

                // Only allow "Sub Menu" entries as parent menus
                if ( [ PROP.REGION_ACTION_PARENT_MENU, PROP.IR_COLUMN_ACTION_PARENT_MENU ].includes( lPropertyDef.id )) {
                    lFilter.properties = [
                        {id: PROP.MENU_ENTRY_TYPE, value: "SUB_MENU" }
                    ];
                }

                // Get all components of that type and add it to our lov list,
                // but don't include ourselves to avoid recursions (for example: Parent Region)
                lComponents = getComponents( lPropertyDef.lovComponentTypeId, lFilter, false );
                if ( lPropertyDef.lovComponentTypeId === COMP_TYPE.REGION ) {

                    // For regions we build a hierarchy
                    lLovValues = getRegionLovValues( lComponents );

                } else {

                    for ( let i = 0; i < lComponents.length; i++ ) {
                        if ( !( lComponents[i].typeId === this.component.typeId && lComponents[i].id === this.component.id ) ) {
                            lLovValues.push( {
                                r: lComponents[i].id,
                                d: lComponents[i].getDisplayTitle()
                            } );
                        }
                    }

                    // Sort the components by display title
                    lLovValues.sort( function ( a, b ){
                        return a.d.localeCompare( b.d );
                    } );

                    // For Build Options add "NOT" entries after the existing entries
                    if ( lPropertyDef.lovComponentTypeId === COMP_TYPE.BUILD_OPTION ) {
                        addNotEntries( lComponents, "-" );

                        // For Authorizations, add "Must not be public user" and "NOT" entries
                    } else if ( lPropertyDef.lovComponentTypeId === COMP_TYPE.AUTHORIZATION ) {
                        lLovValues.push( {
                            r: "MUST_NOT_BE_PUBLIC_USER",
                            d: format( "LOV.MUST_NOT_BE_PUBLIC_USER" )
                        } );
                        addNotEntries( lComponents, "!" );
                    }

                }

            } else if ( lPropertyDef.lovType === "STATIC" ) {

                // Restrict the static LOV for "Affected Element Type" to just those defined by the plug-in
                if ( lSelf.id === PROP.AFFECTED_TYPE ) {

                    lFeatures = lType.pluginType.plugins[lSelf.component.getProperty( PROP.DA_ACTION_TYPE ).getValue()].features;

                    // For backward compatibility where DOM Object is still used
                    if ( lSelf._value === "DOM_OBJECT" ) {
                        lFeatures.push( "DOM_OBJECT" );
                    }
                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        // Only add the affected element type if it is supported by the current action plug-in
                        if ( $.inArray( lPropertyDef.lovValues[i].r, lFeatures ) !== -1 ) {
                            lLovValues.push( lPropertyDef.lovValues[i] );
                        }
                    }

                } else if ( lSelf.id === PROP.VALUE_TYPE ) {

                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        // The 'Parent Column' option should only be available if the parent is a region
                        // and the MASTER REGION property is set.

                        if ( lPropertyDef.lovValues[i].r !== "PARENT_COLUMN" ) {
                            lLovValues.push( lPropertyDef.lovValues[i] );
                        } else {
                            let lRESTRegionComp = getComponents( COMP_TYPE.REGION, {id: lSelf.component.parentId } )[0];

                            if (    lRESTRegionComp
                                 && lRESTRegionComp.getProperty( PROP.MASTER_REGION )
                                && lRESTRegionComp.getProperty( PROP.MASTER_REGION ).getValue() !== "" )
                            {
                                lLovValues.push( lPropertyDef.lovValues[i] );
                            }
                        }
                    }

                } else if ( lSelf.id === PROP.FACET_LOV_TYPE ) {

                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        // The 'Range' facet type doesn't support 'Distinct Values', filter it out
                        if ( !( lPropertyDef.lovValues[i].r === "DISTINCT" && lSelf.component.getProperty( PROP.ITEM_TYPE ).getValue() === "NATIVE_RANGE" ) ) {
                            lLovValues.push( lPropertyDef.lovValues[i] );
                        }
                    }

                } else if ( lSelf.id === PROP.TEMPLATE_COMPONENT_TYPE ) {

                    const regionType = lSelf.component.getProperty( PROP.HIDDEN_REGION_TYPE ).getValue(),
                          templateTypes = gTypes[ COMP_TYPE.REGION ].pluginType.plugins[ regionType ].templateTypes;

                    // Only show those types that are really supported by the current template component
                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        if ( templateTypes.includes( lPropertyDef.lovValues[ i ].r )) {
                            lLovValues.push( lPropertyDef.lovValues[ i ] );
                        }
                    }

                } else if ( lPropertyDef.type === PROP_TYPE.CODE_LANGUAGE ) {

                    // Just return those languages which are supported by the current installation
                    // If the current value is not supported, we will still show it to avoid data corruption
                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        if ( hasOwnProperty( gSharedComponents.codeLanguages, lPropertyDef.lovValues[ i ].r ) || lSelf._value === lPropertyDef.lovValues[ i ].r ) {
                            lLovValues.push( lPropertyDef.lovValues[ i ] );
                        }
                    }

                } else if ( lPropertyDef.id === PROP.OPERATOR ) {
                    let NOT_SUPPORTED = [ "IS_NULL", "NOT_NULL", "OTHERWISE" ];
                    lLovValues = lSelf.component.typeId === COMP_TYPE.WORKFLOW_TRANS ? lPropertyDef.lovValues.filter( v => !NOT_SUPPORTED.includes( v.r ) ) : lPropertyDef.lovValues;
                } else if ( lPropertyDef.id === PROP.TRANSITION_TYPE ) {
                    lLovValues = lPropertyDef.lovValues;
                    let activity = lSelf.component.getParent();
                    if ( activity ) {
                        let isWait = activity.getProperty( PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_WORKFLOW_WAIT";
                        let dueOnTypeProp = activity.getProperty( PROP.DUE_ON_TYPE );
                        if ( isWait || ( dueOnTypeProp && dueOnTypeProp.getValue() === "" ) ) {
                            lLovValues = lLovValues.filter( v => v.r !== "TIMEOUT" );
                        }
                    }
                } else if ( lSelf.id === PROP.LANDMARK_TYPE ) {
                    lLovValues = JSON.parse(JSON.stringify(lPropertyDef.lovValues));
                    const defaultLandmarkType = gComponents[ COMP_TYPE.REGION ][ lSelf.component.id ] ?
                                                    getRegionTemplate( {
                                                        regionId: lSelf.component.id
                                                    } ).defaultLandmarkType
                                                    : null;

                    lLovValues.forEach(function (value, i) {
                        if (value.r === defaultLandmarkType) {
                            const lLovValue = {
                                r: value.r,
                                d: lang.formatMessage( "PD.TEMPLATE_DEFAULT", value.d ),
                                helpText: value.helpText
                            };
                            lLovValues[i] = lLovValue;
                        }
                    });
                } else {

                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        if (   // 1) Don't show it if it's deprecated, but do still show it if it's the current selection
                               ( !lPropertyDef.lovValues[i].isDeprecated || lSelf._value === lPropertyDef.lovValues[i].r )
                               // 2) Don't show it if it's just for the Builder and the current App isn't the Builder
                            && !( lPropertyDef.lovValues[i].isInternal && !gOptions.isInternal )
                               // 3) Don't show it if the min DB version doesn't match, but do still show it if it's
                               //    the current selection
                            && (  !lPropertyDef.lovValues[i].minDbVersion
                               || lSelf._value === lPropertyDef.lovValues[i].r
                               || lPropertyDef.lovValues[i].minDbVersion <= gSharedComponents.dbVersion
                               )
                           )
                        {
                            lLovValues.push( lPropertyDef.lovValues[i] );
                        }
                    }

                }

            } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_TEMPLATES" ) {

                // Only add action positions of the current plug-in, the plug-in meta data
                // can be read from the parent component type (region, ir column)
                let pluginName = lSelf.component._properties[ lTypePropertyDef.parentProperty.id ]._value,
                    parentType = gTypes[ lType.parentId ];

                for ( let i = 0; i < parentType.actionTemplates[ pluginName ].length; i++ ) {
                    lLovValues.push({
                        r: parentType.actionTemplates[ pluginName ][ i ].id,
                        d: parentType.actionTemplates[ pluginName ][ i ].title
                    });
                }

            } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_POSITIONS" ) {

                // Only add action positions of the current plug-in, the plug-in meta data
                // can be read from the parent component type (region, ir column)
                let pluginName = lSelf.component._properties[ lTypePropertyDef.parentProperty.id ]._value,
                    parentType = gTypes[ lType.parentId ];

                for ( let i = 0; i < parentType.actionPositions[ pluginName ].length; i++ ) {
                    lLovValues.push({
                        r: parentType.actionPositions[ pluginName ][ i ].id,
                        d: parentType.actionPositions[ pluginName ][ i ].title
                    });
                }

            } else if ( lPropertyDef.lovType === "SLOTS" ) {

                const parentRegionId = getParentRegionId( this.component );
                const slots = getSlots( { componentTypeId: this.component.typeId, regionId: parentRegionId } );

                let pageSlots = [];
                let regionSlots = [];
                let pluginSlots = [];
                let unsupportedSlots = [];
                const slotGroups = { page: pageSlots, region: regionSlots, plugin: pluginSlots, unsupported: unsupportedSlots };

                const parentRegion = parentRegionId && getComponents( COMP_TYPE.REGION, { id: parentRegionId } )[0];
                const isNotNativeIR = parentRegion && parentRegion.getProperty( PROP.REGION_TYPE ).getValue() !== "NATIVE_IR";
                const itemType   = lSelf.component.typeId === COMP_TYPE.PAGE_ITEM ?
                                   lSelf.component.getPropertyValue( PROP.ITEM_TYPE ) :
                                   undefined;
                const regionType = lSelf.component.typeId === COMP_TYPE.REGION ?
                                   lSelf.component.getPropertyValue( PROP.REGION_TYPE ) :
                                   undefined;

                for ( const slot of slots ) {
                    const isRightOfIRSearchBar = slot.placeholder === "RIGHT_OF_IR_SEARCH_BAR";

                    if ( isRightOfIRSearchBar && isNotNativeIR ) {
                        // Skip "Right of IR Search Bar" if not in an IR region
                        continue;
                    }

                    let isSupported = true;
                    if ( itemType && slot.supportedItemTypes ) {
                        isSupported = slot.supportedItemTypes.includes( itemType );
                    }

                    if ( regionType && slot.supportedRegionTypes ) {
                        isSupported = slot.supportedRegionTypes.includes( regionType );
                    }

                    if ( !slot.isDeprecated || lSelf._value === slot.placeholder ) {
                        const lovValue = {
                            r: slot.placeholder,
                            d: formatPostfix("POSTFIX.LEGACY", slot.name, slot.isLegacy),
                            isDeprecated: slot.isDeprecated,
                            isLegacy: slot.isLegacy
                        };
                        const slotGroup  = isSupported ? slot.origin : "unsupported";

                        slotGroups[ slotGroup ]?.push(lovValue);
                    }
                }

                const hasMultipleGroups = Object.values( slotGroups ).filter( arr => arr.length > 0 ).length > 1;

                // if there are multiple slot origins or if any of the slots are unsupported,
                // then we want to display the slot LOV with groups
                if ( hasMultipleGroups || unsupportedSlots.length > 0 ) {
                    // Group name text messages
                    const groupNameMap = {
                        page: "PD.SLOTS.GROUP.PAGE",
                        region: "PD.SLOTS.GROUP.REGION",
                        plugin: "PD.SLOTS.GROUP.PLUGIN",
                        unsupported : "PD.PE.PLUGIN.GROUP.UNSUPPORTED"
                    };

                    Object.entries( slotGroups ).forEach( ( [ origin, slots ] ) => {
                        if ( slots.length > 0 ) {
                            const groupNameKey = groupNameMap[ origin ];
                            const group = lang.getMessage( groupNameKey );
                            lLovValues.push( { group, values: slots } );
                        }
                    });
                } else {
                    // There is only one group, so just join into a single array
                    lLovValues = [ ...lLovValues, ...pageSlots, ...regionSlots, ...pluginSlots, ...unsupportedSlots ];
                }

            } else if ( lPropertyDef.lovType === "GRID_COLUMNS" ) {

                lMaxGridColumns = lSelf.component._grid.maxColumns;
                if ( lSelf.id === PROP.GRID_COLUMN_SPAN || lSelf.id === PROP.GRID_LABEL_COLUMN_SPAN ) {

                    lGridColumnNo = parseInt( lSelf.component._properties[PROP.GRID_COLUMN].getValue(), 10 );
                    if ( lGridColumnNo > 0 ) {
                        lMaxGridColumns -= ( lGridColumnNo - 1 );
                    }

                    if ( lSelf.id === PROP.GRID_LABEL_COLUMN_SPAN ) {
                        // The label column span can't use more columns than the overall span of the page item minus 1
                        lGridColumnSpan = parseInt( lSelf.component._properties[PROP.GRID_COLUMN_SPAN].getValue(), 10 );
                        if ( lGridColumnSpan > 0 ) {
                            lMaxGridColumns = lGridColumnSpan;
                        }
                        lMinGridColumns = 0;
                        lMaxGridColumns -= 1;
                    }
                }

                for ( let i = lMinGridColumns; i <= lMaxGridColumns; i++ ) {
                    lLovValues.push( {
                        r: i + "",
                        d: i + ""
                    } );
                }

            } else if ( lPropertyDef.lovType.indexOf( "FORMAT_MASKS" ) !== -1 ) {

                if ( lPropertyDef.lovType === "DATE_FORMAT_MASKS" ) {
                    lLovValues = gFormatMasks.dates;
                } else if ( lPropertyDef.lovType === "NUMBER_FORMAT_MASKS" ) {
                    lLovValues = gFormatMasks.numbers;
                } else if ( lPropertyDef.lovType === "CHART_FORMAT_MASKS" ) {
                    lLovValues = gFormatMasks.chart;
                } else {
                    lLovValues = gFormatMasks.dates;
                    if ( gFormatMasks.since ) {
                        lLovValues = lLovValues.concat( gFormatMasks.since );
                    }
                    lLovValues = lLovValues.concat( gFormatMasks.numbers );
                    /* Combobox doesn't support groups yet
                     lLovValues.push({
                     group:  format( "LOV.DATE_FORMAT_MASKS" ),
                     values: gFormatMasks.dates
                     });
                     lLovValues.push({
                     group:  format( "LOV.NUMBER_FORMAT_MASKS" ),
                     values: gFormatMasks.numbers
                     });
                     */
                }

            } else if ( lPropertyDef.lovType === "DISTINCT" ) {

                ajax(
                    "getDistinctValues", {
                        x01: this.component.typeId,
                        x02: this.id
                    }, {
                        success: function ( pData ){

                            var lComponents = getComponents( lSelf.component.typeId, {} ),
                                lDistinctValues = {};

                            function addDistinctValue( pValue ){
                                var lValues;

                                if ( pValue !== "" ) {
                                    // If the property supports multiple values, we actually want to have the single values and
                                    // not the combined value for our list of values
                                    if ( gProperties[lSelf.id].multiValueDelimiter ) {
                                        lValues = pValue.split( gProperties[lSelf.id].multiValueDelimiter );
                                        for ( let i = 0; i < lValues.length; i++ ) {
                                            lDistinctValues[lValues[i]] = "";
                                        }
                                    } else {
                                        lDistinctValues[pValue] = "";
                                    }
                                }
                            } // addDistinctValue


                            // Get distinct values for current page
                            for ( let i = 0; i < lComponents.length; i++ ) {
                                if ( hasOwnProperty( lComponents[i]._properties, lSelf.id ) ) {
                                    addDistinctValue( lComponents[i]._properties[lSelf.id]._value );
                                }
                            }

                            // Add all distinct server values
                            for ( let i = 0; i < pData.length; i++ ) {
                                addDistinctValue( pData[i] );
                            }

                            // Build the final lov values array
                            for ( var lValue in lDistinctValues ) {
                                if ( hasOwnProperty( lDistinctValues, lValue ) ) {
                                    lLovValues.push( {
                                        d: lValue,
                                        r: lValue
                                    } );
                                }
                            }
                            lLovValues.sort( function ( a, b ){
                                return a.d.localeCompare( b.d );
                            } );

                            pCallback( lLovValues );
                        }
                    }
                );
                return; // callback called by pCallback

            } else if ( lPropertyDef.lovType === "TEMPLATE_OPTIONS" ) {

                lLovValues = getTemplateOptions( lSelf ).values;

            }
        }

        if ( typeof pCallback === "function" ) {
            pCallback( lLovValues );
        } else {
            return lLovValues;
        }

    }; // _getLovValues


    Property.prototype._getQuickPicks = function( pReferenceScope ) {

        var lSelf            = this,
            lPropertyDef     = gProperties[ this.id ],
            lType            = gTypes[ this.component.typeId ],
            lTypePropertyDef = lType.properties[ this.id ],
            lColumns,
            lSubstitution,
            lQuickPicks      = [];

        function addQuickPick( pValue ) {

            var lReturnValue;

            if ( pValue.icon ) {
                lQuickPicks.push( {
                    r:   pValue.r,
                    d:   pValue.d || pValue.r,
                    seq: pValue.seq,
                    icon: pValue.icon
                } );
            } else if ( pValue.i ) {
                if ( pValue.isLegacy ) {
                    lReturnValue = '<img src="#APEX_FILES#' + ( pValue.dir || "" ) + pValue.i + '.gif" alt="">';
                } else {
                    lReturnValue = '<img src="#APEX_FILES#app_ui/img/icons/' + pValue.i + '.png" class="' + pValue.i + '" alt="">';
                }

                lQuickPicks.push( {
                    r: lReturnValue,
                    d: pValue.i + ( pValue.isLegacy ? ".gif" : ".png" ),
                    icon: "icon-" + pValue.i
                } );
            } else if ( pValue.columnName ) {
                lQuickPicks.push( {
                    r: pValue.substitution.prefix + ( pValue.substitution.enquote ? enquoteIdentifier( pValue.columnName ) : pValue.columnName ) + pValue.substitution.postfix,
                    d: pValue.columnName
                } );
            } else {
                lQuickPicks.push( {
                    r:   pValue.r,
                    d:   pValue.d || pValue.r,
                    seq: pValue.seq
                } );
            }
        }

        function addEvents( pLovValues ) {
            for ( let i = 0; i < pLovValues.length; i++ ) {
                if ( pLovValues[ i ].isQuickPick ) {
                    addQuickPick( pLovValues[ i ] );
                }
            }
        }


        if ( lPropertyDef.type === PROP_TYPE.SUPPORTED_UI ) {

            if ( lPropertyDef.lovType === "PLUGINS" ) {
                let isSupported = true;
                let slot;
                if ( [ COMP_TYPE.REGION, COMP_TYPE.PAGE_ITEM ].includes( lSelf.component.typeId ) ) {
                    slot = getSlot( {  componentTypeId: lSelf.component.typeId,
                                       regionId: getParentRegionId( lSelf.component ),
                                       slotPlaceholder :  lSelf.component.getPropertyValue( PROP.SLOT_PLACEHOLDER ) } );

                }
                forEachAttribute( lType.pluginType.plugins, function( pPluginName, pPlugin ) {
                    if ( slot ) {
                        if ( lSelf.component.typeId === COMP_TYPE.PAGE_ITEM && slot.supportedItemTypes ) {
                            isSupported = slot.supportedItemTypes.includes( pPluginName );
                        }

                        if ( lSelf.component.typeId === COMP_TYPE.REGION && slot.supportedRegionTypes ) {
                            isSupported = slot.supportedRegionTypes.includes( pPluginName );
                        }
                    }
                    if ( pPlugin.isQuickPick &&
                        isValidPlugin( lSelf.component, pPlugin, { ui: true, isDeprecated: true, isLegacy: true } ) &&
                        isSupported ) {
                            addQuickPick( {
                                r: pPluginName,
                                d: pPlugin.title
                            } );
                    }

                } );

                lQuickPicks.sort( function( a, b ) {
                    return a.d.localeCompare( b.d );
                } );

            } else if ( lPropertyDef.lovType === "EVENTS" ) {

                addEvents( gEvents.browser );
                addEvents( gEvents.apex );
                addEvents( gEvents.component );

            } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_POSITIONS" ) {

                // Only add action positions of the current plug-in, the plug-in meta data
                // can be read from the parent component type (region, ir column)
                let pluginName = lSelf.component._properties[ lTypePropertyDef.parentProperty.id ]._value,
                    parentType = gTypes[ lType.parentId ];

                for ( let i = 0; i < parentType.actionPositions[ pluginName ].length; i++ ) {
                    if ( parentType.actionPositions[ pluginName ][ i ].isQuickPick ) {
                        addQuickPick({
                            r: parentType.actionPositions[ pluginName ][ i ].id,
                            d: parentType.actionPositions[ pluginName ][ i ].title
                        });
                    }
                }
            }

        } else if ( lPropertyDef.type === PROP_TYPE.CODE_LANGUAGE ) {

            // No quick pick for Code Language Select List. (Bug #32002259)

        } else if ( lPropertyDef.lovType ) {

            if ( lPropertyDef.lovType === "STATIC" ) {

                // Restrict the static LOV for "Affected Element Type" to just those defined by the plug-in
                if ( lSelf.id === PROP.AFFECTED_TYPE ) {

                    // todo no quick picks for affected type for now

                } else {
                    for ( let i = 0; i < lPropertyDef.lovValues.length; i++ ) {
                        if ( lPropertyDef.lovValues[ i ].isQuickPick && !lPropertyDef.lovValues[ i ].isDeprecated ) {
                            addQuickPick( lPropertyDef.lovValues[ i ] );
                        }
                    }
                }

            } else if ( lPropertyDef.lovType === "SLOTS" ) {

                const parentRegionId = getParentRegionId( this.component );

                const slots = getSlots( { componentTypeId: this.component.typeId, regionId: parentRegionId } );

                for ( const slot of slots ) {
                    if ( slot.isQuickPick ) {
                        addQuickPick( {
                            r: slot.placeholder,
                            d: slot.name
                        } );
                    }
                }

            } else if ( lPropertyDef.lovType.indexOf( "FORMAT_MASKS" ) !== -1 ) {

                // todo no quickpicks for format masks for now

            }

        } else {

            if ( $.inArray( lType.id, [
                    COMP_TYPE.CARD,
                    COMP_TYPE.CARD_ACTION,
                    COMP_TYPE.MAP_REGION,
                    COMP_TYPE.MAP_LAYER,
                    COMP_TYPE.IR_ATTRIBUTES,
                    COMP_TYPE.IR_COLUMN,
                    COMP_TYPE.IR_COLUMN_ACTION,
                    COMP_TYPE.IR_COL_ACTION_MENU_ENTRY,
                    COMP_TYPE.IG_ATTRIBUTES,
                    COMP_TYPE.IG_COLUMN,
                    COMP_TYPE.CLASSIC_RPT_COLUMN,
                    COMP_TYPE.TAB_FORM_COLUMN,
                    COMP_TYPE.VALIDATION,
                    COMP_TYPE.PAGE_PROCESS,
                    COMP_TYPE.REGION_PLUGIN_ATTR,
                    COMP_TYPE.REGION_ACTION,
                    COMP_TYPE.REGION_ACTION_MENU_ENTRY,
                    COMP_TYPE.REGION_TMPL_COLUMN,
                    COMP_TYPE.REGION_COLUMN ] ) !== -1 )
            {

                if ( [ COMP_TYPE.IR_ATTRIBUTES, COMP_TYPE.CLASSIC_RPT_COLUMN, COMP_TYPE.TAB_FORM_COLUMN,
                       COMP_TYPE.IR_COLUMN, COMP_TYPE.IR_COLUMN_ACTION, COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ].includes( lType.id ) )
                {
                    lSubstitution = {
                        prefix:  "#",
                        postfix: "#",
                        enquote: false };
                } else {
                    lSubstitution = {
                        prefix:  "&",
                        postfix: ".",
                        enquote: true };
                }

                if ( lPropertyDef.id === PROP.LINK_TEXT ) {

                    addQuickPick( {
                        columnName:   lSelf.component.getProperty([ PROP.COLUMN_NAME, PROP.COLUMN_NAME_UPPER ]).getValue(),
                        substitution: lSubstitution
                    } );
                }

                if ( lPropertyDef.id === PROP.LINK_ICON || lPropertyDef.id === PROP.LINK_TEXT ) {

                    if ( isFontAPEX() ) {
                        addQuickPick( {
                            r: replaceDefaultPlaceholders( this, "#LINK_ICON#" ),
                            d: "fa-edit",
                            icon: "icon-edit-app"
                        } );
                    }
                    addQuickPick( { i: "apex-edit-pencil" } );
                    addQuickPick( { i: "apex-edit-pencil-alt" } );
                    addQuickPick( { i: "apex-edit-page" } );
                    addQuickPick( { i: "apex-edit-view" } );
                    // in Bug 20501314 decided to remove legacy images from quick picks
                } else {

                    // Should we show the region columns as quick pick?
                    if (  lTypePropertyDef.supportsSubstitution
                        // region plugin attributes properties(of the followwing types) always get quick-picks, regardless the reference scope
                        && ( pReferenceScope === "ROW"
                            || ( this.component.typeId === COMP_TYPE.REGION_PLUGIN_ATTR
                                && this.component.getProperty( PROP.TEMPLATE_COMPONENT_TYPE )?.getValue()
                                && lPropertyDef.isCustomPluginAttribute
                            ) )
                        && [ PROP_TYPE.TEXT, PROP_TYPE.TEXTAREA, PROP_TYPE.TEXT_EDITOR, PROP_TYPE.HTML ].includes( lPropertyDef.type ) )
                    {
                        // if the reference scope is component, we show the page items (currently only for the region plugin attributes)
                        if ( pReferenceScope === "COMPONENT" ) {
                            lColumns  = getItemsLov( { type: "page", pageId: gCurrentPageId, component: lSelf.component } );
                        } else {
                            lColumns  = getItemsLov( { type: "columns", component: lSelf.component } );
                        }

                        // the columns might not be available at this moment yet, but we do want to render the quick-pick button
                        // so we add a dummy entry ("-") to ensure that the menu contains at least one entry
                        if ( !lColumns.length ) {
                            addQuickPick( {
                                d: lang.getMessage( "PE.QUICK_PICK_NOT_AVAILABLE" ),
                                r: "-"
                            } );
                        } else {
                            lColumns.forEach( column => {
                                addQuickPick( {
                                    columnName:   column.name,
                                    substitution: lSubstitution
                                } );
                            });
                        }
                    }
                }
            }
        }

        return lQuickPicks;

    }; // _getQuickPicks


    Property.prototype._getHelpText = function() {

        var lSelf             = this,
            lPropertyDef      = gProperties[ this.id ],
            lType             = gTypes[ this.component.typeId ],
            lTypePropertyDef  = lType.properties[ this.id ],
            lHelpText;

        function getPluginsHelpText( pPrefix ) {
            let lPlugins,
                lHtml = "<dl>";

            lPlugins = $.map( lType.pluginType.plugins, function( pPluginDef, pPluginName ) {
                if ( pPrefix.test( pPluginName ) && isValidPlugin( lSelf.component, pPluginDef, { ui: true, isDeprecated: true, isLegacy: true } ) ) {
                    return pPluginDef;
                }
            } ).sort( function( a, b ) {
                return a.title.localeCompare( b.title );
            } );

            for ( let i = 0; i < lPlugins.length; i++ ) {
                // We do a safe whitelist escaping of lPlugins[ i ].helpText on the server side
                lHtml += "<dt>" + util.escapeHTML( lPlugins[ i ].title ) + "</dt>";
                lHtml += "<dd>" + lPlugins[ i ].helpText;
                if ( lPlugins[ i ].aboutUrl ) {
                    lHtml += " " + format( "HELP.ABOUT_PLUGIN", lPlugins[ i ].aboutUrl );
                }
                lHtml += "</dd>";
            }
            lHtml += "</dl>";

            return lHtml;
        } // getPluginsHelpText

        function getLovHelpText() {
            var lLovValues = lSelf.getMetaData().lovValues(),
                lHtml;

            lHtml = "<p>" + format( "HELP.AVAILABLE_OPTIONS" ) + "</p><dl>";

            if ( lTypePropertyDef.nullText ) {
                lHtml += "<dt>" + lTypePropertyDef.nullText + "</dt>";
                if ( lTypePropertyDef.nullHelpText ) {
                    lHtml += "<dd>" + lTypePropertyDef.nullHelpText + "</dd>";
                }
            }

            for ( let i = 0; i < lLovValues.length; i++ ) {
                // We do a safe whitelist escaping of lLovValues[ i ].helpText on the server side
                lHtml += "<dt>" + util.escapeHTML( lLovValues[ i ].d ) + "</dt>";
                if ( lLovValues[ i ].helpText || lLovValues[ i ].isDeprecated ) {
                    lHtml += "<dd>";
                    if ( lLovValues[ i ].helpText ) {
                        lHtml += lLovValues[ i ].helpText;
                    }
                    if ( lLovValues[ i ].isDeprecated ) {
                        lHtml += "<p><em>" + format( "HELP.DEPRECATED.LOV_VALUE", RELEASE_NOTES_DEPRECATED_FEATURES ) + "</em></p>";
                    }
                    lHtml += "</dd>";
                }
            }
            lHtml += "</dl>";

            return lHtml;
        } // getLovHelpText

        function getTemplateOptionsHelpText() {

            function emitLovValues( pLovValues ) {
                for ( let i = 0; i < pLovValues.length; i++ ) {
                    lHtml += "<dt>" + util.escapeHTML( pLovValues[ i ].name ) + "</dt>";
                    if ( pLovValues[ i ].helpText ) {
                        lHtml += "<dd>" + pLovValues[ i ].helpText + "</dd>"; // whitelist escaping done on server
                    }
                }
            } // emitLovValues

            var lTemplateOptions = getTemplateOptions( lSelf ),
                lGroupId,
                lGroupIdx,
                lGroups           = [],
                lGroupsMap        = {},
                lGeneralLovValues = [],
                lHtml,
                i;

            // Build a list of "general" template options and one for each group
            for ( i = 0; i < lTemplateOptions.values.length; i++ ) {

                if ( lTemplateOptions.values[ i ].groupId ) {
                    lGroupId = lTemplateOptions.values[ i ].groupId;
                    if ( !hasOwnProperty( lGroupsMap, lGroupId ) ) {
                        lGroups.push( {
                            title:     lTemplateOptions.groups[ lGroupId ].title,
                            seq:       lTemplateOptions.groups[ lGroupId ].seq,
                            helpText:  lTemplateOptions.groups[ lGroupId ].helpText,
                            lovValues: []
                        } );
                        lGroupIdx = lGroups.length - 1;
                        lGroupsMap[ lGroupId ] = lGroupIdx;
                    } else {
                        lGroupIdx = lGroupsMap[ lGroupId ];
                    }
                    lGroups[ lGroupIdx ].lovValues.push( {
                        name:     lTemplateOptions.values[ i ].d,
                        helpText: lTemplateOptions.values[ i ].helpText
                    } );

                } else {

                    lGeneralLovValues.push( {
                        name:     lTemplateOptions.values[ i ].d,
                        helpText: lTemplateOptions.values[ i ].helpText
                    } );

                }
            }

            // Sort result based on sequence and if they are equal, use title as second sort option
            lGroups.sort( function( a, b ) {
                if ( a.seq === b.seq ) {
                    return a.title.localeCompare( b.title );
                } else {
                    return a.seq - b.seq;
                }
            } );

            lHtml = "<p>" + format( "HELP.AVAILABLE_OPTIONS" ) + "</p><dl>";

            emitLovValues( lGeneralLovValues );

            for ( i = 0; i < lGroups.length; i++ ) {
                lHtml += "<dt>" + util.escapeHTML( lGroups[ i ].title ) + "</dt><dd>";
                if ( lGroups[ i ].helpText ) {
                    lHtml += "<p>" + lGroups[ i ].helpText + "</p>"; // whitelist escaping done on server
                }
                lHtml += "<dl>";
                emitLovValues( lGroups[ i ].lovValues );
                lHtml += "</dl></dd>";
            }

            lHtml += "</dl>";

            return lHtml;

        } // getTemplateOptionsHelpText

        function getPluginActions( pAttribute ) {
            // Only add action positions/templates of the current plug-in, the plug-in meta data
            // can be read from the parent component type (region, ir column)
            let pluginName = lSelf.component._properties[ lTypePropertyDef.parentProperty.id ]._value,
                parentType = gTypes[ lType.parentId ],
                html = "<dl>";

            if ( hasOwnProperty( parentType[ pAttribute ], pluginName )) {
                for ( let i = 0; i < parentType[ pAttribute ][ pluginName ].length; i++ ) {
                    // We do a safe whitelist escaping of actionTemplates/actionPositions[ i ].helpText on the server side
                    html += "<dt>" + util.escapeHTML( parentType[ pAttribute ][ pluginName ][ i ].title ) + "</dt>";
                    if ( parentType[ pAttribute ][ pluginName ][ i ].helpText ) {
                        html += "<dd>" + parentType[ pAttribute ][ pluginName ][ i ].helpText + "</dd>";
                    }
                }
            }
            html += "</dl>";

            return html;
        } // getPluginActions

        // Generate the help text
        lHelpText = "<p>" + ( this._helpText || lTypePropertyDef.helpText || lPropertyDef.helpText ) + "</p>";

        //
        if ( lType.pluginType && this.id === lType.pluginType.typePropertyId ) {
            lHelpText = lHelpText
                .replace( /#NATIVE_PLUGINS#/, getPluginsHelpText( /^NATIVE/ ) )
                .replace( /#CUSTOM_PLUGINS#/, getPluginsHelpText( /^(PLUGIN|TMPL)/ ) );
        }

        // Add a warning if the attribute is deprecated
        if ( lPropertyDef.deprecatedValues ) {
            lHelpText += "<p><em>" + format( "HELP.DEPRECATED.ATTRIBUTE", RELEASE_NOTES_DEPRECATED_FEATURES ) + "</em></p>";
        }

        // Add available lov options to help text
        if ( lPropertyDef.lovType === "STATIC" ) {
            if ( /#LOV_VALUES#/.test( lHelpText ) ) {
                lHelpText = lHelpText.replace( /#LOV_VALUES#/, getLovHelpText() );
            } else {
                lHelpText += getLovHelpText();
            }
        } else if ( lPropertyDef.lovType === "TEMPLATE_OPTIONS" ) {

            lHelpText += getTemplateOptionsHelpText();

        } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_TEMPLATES" ) {

            lHelpText += getPluginActions( "actionTemplates" );

        } else if ( lPropertyDef.lovType === "PLUGIN_ACTION_POSITIONS" ) {

            lHelpText += getPluginActions( "actionPositions" );
        }

        if ( this._examples !== undefined || lTypePropertyDef.examples !== undefined || lPropertyDef.examples !== undefined ) {
            // We do a safe whitelist escaping of examples on the server side
            lHelpText += "<h4>" + format( "HELP.EXAMPLES" ) + "</h4><p>" + ( this._examples || lTypePropertyDef.examples || lPropertyDef.examples ) + "</p>";
        }

        // Generate the accessibility help text
        if (lTypePropertyDef.accessibilityHelpText ) {
            // We do a safe whitelist escaping of the accessibility help text on the server side
            lHelpText += "<h4>" + format( "HELP.ACCESSIBILITY_HELP_TEXT" ) + " <span class=\"a-Icon icon-accessibility\" aria-hidden=\"true\"></span></h4><p>" + ( lTypePropertyDef.accessibilityHelpText ) + "</p>";
        }

        // Don't show the extended information for all property types, for select list type properties it doesn't add value
        if ( ![ PROP_TYPE.CHECKBOXES, PROP_TYPE.LINK, PROP_TYPE.COMPONENT,
                PROP_TYPE.SELECT_LIST, PROP_TYPE.SUPPORTED_UI, PROP_TYPE.CODE_LANGUAGE,
                PROP_TYPE.SUBSCRIPTION, PROP_TYPE.YES_NO, PROP_TYPE.PILL_BUTTONS,
                PROP_TYPE.OWNER, PROP_TYPE.TABLE, PROP_TYPE.GRAPH, PROP_TYPE.COLUMN, PROP_TYPE.REGION_COLUMN,
                PROP_TYPE.REST_OPERATION_ID,
                PROP_TYPE.PLSQL_PACKAGE, PROP_TYPE.PLSQL_METHOD,
                PROP_TYPE.TEMPLATE_OPTIONS, PROP_TYPE.SESSION_STATE_VALUE, PROP_TYPE.SWITCH_BUTTON ].includes( lPropertyDef.type ) )
        {
            lHelpText += "<h4>" + format( "HELP.ADDITIONAL_INFO" ) +"</h4>";
            lHelpText += "<ul><li>" + format( "HELP.TYPE" ) + ": ";
            if ( PROP_TYPES_EXP_FUNC_CUSTOM.includes( lPropertyDef.type )) {
                let lCustomDataType = lTypePropertyDef.customDataType;

                if ( !lCustomDataType ) {
                    // Todo: This is a hard-coded dependency which should be made configurable in
                    // wwv_pe_comp_properties. The data type to use is data driven and not pre-configured.
                    // We first look into the "Custom Data Type" property and if it's not defined
                    // (because it's not a custom data type), we take the value from the always existing
                    // "Data Type".
                    lCustomDataType = lSelf.component.getPropertyValue( [ PROP.API_CUSTOM_DATA_TYPE, PROP.API_DATA_TYPE, PROP.WEB_SRC_PARAM_DATA_TYPE, PROP.WORKFLOW_DATA_TYPE ] );
                }
                lHelpText += format( "HELP.PROP_TYPE." + lPropertyDef.type, lCustomDataType );
            } else {
                lHelpText += format( "HELP.PROP_TYPE." + lPropertyDef.type );
            }
            if ( lPropertyDef.multiValueDelimiter ) {
                lHelpText += " (" + format( "HELP.MULTIPLE.TEXT", format( "HELP.MULTIPLE." + lPropertyDef.multiValueDelimiter ) ) + ")";
            }
            lHelpText += "</li>";

            if (   lPropertyDef.type.substr( 0, 3 ) === "SQL"
                || lPropertyDef.type.substr( 0, 3 ) === "MLE"
                || lPropertyDef.type.substr( 0, 5 ) === "PLSQL"
                || lPropertyDef.type === PROP_TYPE.WHERE_CLAUSE ) {
                lHelpText += "<li>" + format( "HELP.BIND_VARIABLES" ) + ": " + format( "HELP.REF_SCOPE." + lSelf.getMetaData().referenceScope ) + "</li>";
            }

            if ( lTypePropertyDef.supportsSubstitution ) {
                lHelpText += "<li>" + format( "HELP.SUBSTITUTIONS" ) + ": " + format( "HELP.REF_SCOPE." + lSelf.getMetaData().referenceScope ) + "</li>";
            }

            if ( lTypePropertyDef.supportsTemplateDirective ) {
                lHelpText += "<li>" + format( "HELP.TEMPLATE_DIRECTIVE_" + TEMPLATE_DIRECTIVE_TYPE[ lTypePropertyDef.supportsTemplateDirective ] ) + "</li>";
            }

            if ( $.inArray( lPropertyDef.type, PROP_TYPES_RETURNING_SQL ) !== -1 ) {

                if ( this._sqlMinColumns !== undefined ) {
                    lHelpText += "<li>" + format( "HELP.MIN_COLUMNS" ) + ": " + this._sqlMinColumns + "</li>";
                }
                if ( this._sqlMaxColumns > 0 && this._sqlMaxColumns < 999 ) {
                    lHelpText += "<li>" + format( "HELP.MAX_COLUMNS" ) + ": " + this._sqlMaxColumns + "</li>";
                }

            } else if ( lPropertyDef.type === PROP_TYPE.INTEGER || lPropertyDef.type === PROP_TYPE.NUMBER ) {

                if ( lPropertyDef.minValue !== undefined ) {
                    lHelpText += "<li>" + format( "HELP.MIN_VALUE" ) + ": " + lPropertyDef.minValue + "</li>";
                }
                if ( lPropertyDef.maxValue !== undefined ) {
                    lHelpText += "<li>" + format( "HELP.MAX_VALUE" ) + ": " + lPropertyDef.maxValue + "</li>";
                }
            }

            if ( lPropertyDef.restrictedChars !== undefined ) {
                lHelpText += "<li>" + format( "HELP.RESTRICTED_CHARS_LABEL" ) + ": " + format( "HELP.RESTRICTED_CHARS." + lPropertyDef.restrictedChars ) + "</li>";
            }
            lHelpText += "</ul>";
        }

        // set documentation url
        lHelpText = lHelpText.replace( /#SYSTEM_HELP_URL#/, gSharedComponents.systemHelpUrl );

        return lHelpText;

    }; // _getHelpText


    Property.prototype.getColumns = function( pIncludeAutoRowid ) {

        var lColumns = [];

        if ( this.errors.length === 0 && this.warnings.length === 0 ) {

            if ( pIncludeAutoRowid ) {
                lColumns = this._columns;
            } else {
                // Don't add the column of the SQL statement if it's the ROWID column (first column) which we
                // have automatically add to the SQL statement.
                // todo how can we distinguish if the developer has added that column or if it was done by the engine?
                for ( let i = 0; i < this._columns.length; i++ ) {
                    if ( !( this._columns[ i ].name === "ROWID" && i === 0 ) ) {
                        lColumns.push( this._columns[ i ] );
                    }
                }
            }
        }
        return lColumns;

    }; // getColumns


    // Returns the "described" parameters of a property of type PLSQL METHOD
    Property.prototype.getParameters = function() {

        if ( this.errors.length === 0 && this._parameters.length > 0 ) {
            // always get the first parameter set if the API is overloaded
            return this._parameters[ 0 ];
        } else {
            return [];
        }

    }; // getParameters


    Property.prototype.wsmHasLocalTableFor = function( pArrayColumnId ) {

        return (    this.errors.length === 0
                 && this._wsmHasLocalTableFor
                 && (    ( pArrayColumnId === "" && this._wsmHasLocalTableFor.length === 0 )
                      || this._wsmHasLocalTableFor.includes( pArrayColumnId ) ) );

    }; // wsmHasLocalTableFor

    Property.prototype.wsmHasArrayColumns = function() {

        return ( this.errors.length === 0 && this._wsmHasArrayColumns );

    }; // wsmHasArrayColumns

    Property.prototype.databaseType = function() {

        return ( this.errors.length === 0 && this._databaseType );

    }; // databaseType


    Property.prototype.hasOrderBy = function() {

        return ( this.errors.length === 0 && this._hasOrderBy );

    }; // hasOrderBy


    Property.prototype._getAvailableColumns = function( pIncludeAutoRowid ) {

        var lTypePropertyDef = gTypes[ this.component.typeId ].properties[ this.id ],
            lPropertyDef     = gProperties[ this.id ],
            lParentProperty  = lTypePropertyDef.parentProperty,
            lComponent       = this.component,
            lColumns         = [],
            lValue;

        if ( hasOwnProperty( lTypePropertyDef, "parentProperty" ) ) {
            // Get columns from the specified component/property
            while ( lComponent !== undefined ) {
                if ( lComponent.typeId === lParentProperty.typeId ) {
                    // If the parent is a region, we have to get the columns from the specified region
                    if ( gProperties[ lParentProperty.id ].lovComponentTypeId === COMP_TYPE.REGION ) {
                        if ( lPropertyDef.type === PROP_TYPE.REGION_COLUMN ) {
                            lColumns = getRegionColumns( this.component._properties[ lParentProperty.id ]._value );
                        } else {
                            lColumns = getRegionSqlColumns( this.component._properties[ lParentProperty.id ]._value, pIncludeAutoRowid );
                        }
                        break;
                    } else if ( lParentProperty.id === PROP.CHILD_SOURCE_LOCATION ) {
                        lValue = lComponent._properties[ lParentProperty.id ].getValue();
                        if ( lValue === "REGION_SOURCE" ) {
                            lColumns = getRegionSqlColumns( this.component.getParent().parentId, pIncludeAutoRowid );
                        } else {
                            lColumns = getSqlColumnLovValues( lComponent, SOURCE_LOCATION_PROPS, pIncludeAutoRowid );
                        }
                        break;
                    } else if ( lParentProperty.id === PROP.REGION_SQL ) {
                        if ( lPropertyDef.type === PROP_TYPE.REGION_COLUMN ) {
                            lColumns = getRegionColumns( lComponent.id );
                        } else {
                            lColumns = getRegionSqlColumns( lComponent.id, pIncludeAutoRowid );
                        }
                        break;
                    } else {
                        lColumns = lComponent._properties[ lParentProperty.id ].getColumns( pIncludeAutoRowid );
                        break;
                    }
                } else {
                    lComponent = lComponent.getParent();
                }
            }
        }

        return lColumns;

    }; // _getAvailableColumns


    /*
     * todo
     */
    Property.prototype._checkColumn = function( pColumnName, pDataTypes ) {

        // Get the columns of the parent property
        var lColumns = this._getAvailableColumns( true );

        for ( let i = 0; i < lColumns.length; i++ ) {
            if ( lColumns[ i ].name === pColumnName ) {
                if ( isMatchingDataType( lColumns[ i ].type, pDataTypes || gProperties[ this.id ].dataTypes ) ) {
                    return "";
                } else {
                    return format( "VAL.COLUMN_HAS_WRONG_DATA_TYPE" );
                }
            }
        }
        return format( "VAL.COLUMN_NOT_FOUND" );
    }; // _checkColumn


    /*
     * Validates the passed property value based on the property configuration
     */
    Property.prototype.validate = function( pValue ) {

        // Regular Expression Patterns &ABC. or &"ABC".
        // ABC can also be multi byte but no linefeed, additional quotes or ampersands are allowed.
        // Spaces are allowed in the name because the reference could also be a tabular form column alias.
        var SUBSTITUTION_SYNTAX = /^&((\w+)|("[^\n\r"&]+"))\.$/,
        // Keep the regular expressions in sync with htmldb_util.has_restricted_chars
            RESTRICTED_CHARS = {
                "US_ONLY":                        /[^a-zA-Z0-9 ]/,
                "US_ONLY_NO_SPACE":               /[^a-zA-Z0-9]/,
                "US_ONLY_UNDERSCORE_NO_SPACE":    /[^a-zA-Z0-9_]/,
                "DOM_STATIC_ID":                  /[<>'"\s]/, // https://html.spec.whatwg.org/multipage/dom.html#the-id-attribute
                "WEB_SAFE":                       /[<>"]/,
                // eslint-disable-next-line no-useless-escape
                "NO_SPECIAL_CHAR":                /[&<>"\/;,*|=%]|(--)/,
                // eslint-disable-next-line no-useless-escape
                "NO_SPECIAL_CHAR_NL":             /[&<>"\/;,*|=%\n\r]|(--)/,
                "SAFE_COMPONENT_NAME":            /[ :&,.+?^'"\n\r]/,
                "SAFE_COMPONENT_NAME_NO_NUMBER":  /[ :&,.+?^'"\n\r]|(^0$|^-?[1-9]\d*(\.\d+)?$)/
            },
            SEPARATORS = {
                decimal: locale.getDecimalSeparator(),
                group:   locale.getGroupSeparator()
            };

        var lValue           = pValue,
            lSelf            = this,
            lType            = gTypes[ this.component.typeId ],
            lTypeProperties  = lType.properties,
            lTypePropertyDef = lTypeProperties[ this.id ],
            lPropertyDef     = gProperties[ this.id ],
            lParentProperty,
            lParentTypePropertyDef,
            lNumericValue,
            lGenericColumnCount,
            lError,
            lFilter,
            lFilters,
            lComponents,
            lLocation,
            lQueryType,
            lOwner,
            lObjectName,
            lSqlQuery,
            lFunctionBody,
            lFunctionBodyLanguage,
            lWebSourceQueryId = "",
            lWebSourceArrayId = "",
            lIncludeRowidColumn = "N",
            lMatchClause,
            lColumnsClause,
            lOptimizerHint,
            lRemoteDatabaseId,
            lPackageName,
            lCustomDataType,
            lResult = {
                errors:              [],
                warnings:            [],
                columns:             [],
                parameters:          [],
                wsmHasLocalTableFor: false,
                wsmHasArrayColumns:  false,
                databaseType:        false,
                hasOrderBy:          false
            };

        function addWarningError( pValidationResult ) {
            if ( pValidationResult.error ) {
                lResult.errors.push( pValidationResult.error );
            }
            if ( pValidationResult.warning ) {
                lResult.warnings.push( pValidationResult.warning );
            }
        } // addWarningError

        // 1) If the property is required, does it have a value?
        if ( this._isRequired && lValue.trim() === "" ) {
            // todo we should not allow to set a required and unique column to null -> or if it's the display column
            lResult.errors.push( format( "VAL.IS_REQUIRED" ) );
        } else {
            // No validation is necessary if an empty value has been provided.
            // The only exception is the `PROP.SOURCE_LOCATION` property, because for Template Component plug-ins
            // it is set to _isRequired = false, but in `pe.callback.js` we do want to perform a validation check
            // if it should be required depending on some settings. That's why we always want to fire the callbacks
            // regardless if it's empty.
            let trimmedValue = lValue.trim();
            if ( trimmedValue !== "" || ( this.id === PROP.SOURCE_LOCATION && trimmedValue === "" ) ) {

                // 2) If restricted characters have been defined, does the value contain one of those?
                if ( lPropertyDef.restrictedChars && RESTRICTED_CHARS[ lPropertyDef.restrictedChars ].test( lValue ) ) {

                    lResult.errors.push( format( "VAL." + lPropertyDef.restrictedChars, lPropertyDef.prompt, lValue.match( RESTRICTED_CHARS[ lPropertyDef.restrictedChars ] )[0] ) );

                } else {

                    // 3) Check if substitution syntax was used for a number or integer property
                    if (  ( lPropertyDef.type === PROP_TYPE.NUMBER || lPropertyDef.type === PROP_TYPE.INTEGER )
                        && ( lTypePropertyDef.supportsSubstitution && SUBSTITUTION_SYNTAX.test( lValue ) )
                    )
                    {

                        // 4) Check maximum length
                    } else if ( lValue.length > lPropertyDef.maxLen ) {

                        lResult.errors.push( format( "VAL.VALUE_TOO_LONG", ( lValue.length - lPropertyDef.maxLen ) ) );

                    } else {
                        if ( lPropertyDef.type === PROP_TYPE.ORDER_BY_ITEM ) {
                            // ORDER BY ITEM is a JSON object which needs multiple checks
                            addOrderByItemErrors( this._isRequired, lValue, lResult.errors );
                        } else if ( lPropertyDef.type === PROP_TYPE.MEDIA ) {
                            // MEDIA is a JSON object which needs multiple checks
                            addMediaErrors( this, lValue, lResult.errors );
                        } else if ( lPropertyDef.type === PROP_TYPE.NUMBER || lPropertyDef.type === PROP_TYPE.INTEGER ) {
                            // 5) Check all other property types
                            if ( lPropertyDef.type === PROP_TYPE.NUMBER ) {
                                // Number only understands a dot as decimal separator, that's why we have convert the
                                // current value first
                                if ( SEPARATORS.decimal !== "." ) {
                                    lValue = lValue.replace( new RegExp( util.escapeRegExp( SEPARATORS.group   ), "g" ), "!" ); /* don't allow group separators */
                                    lValue = lValue.replace( new RegExp( util.escapeRegExp( SEPARATORS.decimal ), "g" ), "." );
                                }
                                lNumericValue = Number( lValue );
                                lError        = format( "VAL.MUST_BE_NUMERIC" );
                            } else {
                                lNumericValue = parseInt( lValue, 10 );
                                lError        = format( "VAL.MUST_BE_INTEGER" );
                            }

                            // eslint-disable-next-line eqeqeq
                            if ( isNaN( lNumericValue ) || lNumericValue != lValue ) {

                                lResult.errors.push( lError );

                            } else if ( lPropertyDef.minValue !== undefined || lPropertyDef.maxValue !== undefined ) {

                                if ( lNumericValue < lPropertyDef.minValue ) {
                                    lResult.errors.push( format( "VAL.VALUE_LESS_MIN_VALUE", lPropertyDef.minValue ) );
                                } else if ( lNumericValue > lPropertyDef.maxValue ) {
                                    lResult.errors.push( format( "VAL.VALUE_GREATER_MAX_VALUE", lPropertyDef.maxValue ) );
                                }
                            }

                        } else if (  SOURCE_FUNC_BODY_SQL_PROPS.includes( lSelf.id )
                                  && lSelf.component.getProperty( PROP.GENERIC_COLUMN_COUNT ) )
                        {

                            lGenericColumnCount = lSelf.component.getProperty( PROP.GENERIC_COLUMN_COUNT ).getValue();
                            lResult.columns     = [];
                            lResult.hasOrderBy  = false;

                            for ( let i = 1; i <= lGenericColumnCount; i++ ) {
                                lResult.columns.push( {
                                    name:       "COL" + ( i < 10 ? "0" : "" ) + i,
                                    type:       "VARCHAR2",
                                    isRequired: false,
                                    maxLen:     4000
                                } );
                            }

                        } else if (  [ /* declarative table, graph, ... */
                                       PROP_TYPE.TABLE, PROP_TYPE.GRAPH, PROP_TYPE.WHERE_CLAUSE, PROP_TYPE.ORDER_BY_CLAUSE,
                                       /* sql */
                                       PROP_TYPE.SQL, PROP_TYPE.SQL_EXPR, PROP_TYPE.SQL_EXPR_BOOLEAN,
                                       PROP_TYPE.SQL_EXPR_CUSTOM,
                                       /* pl/sql */
                                       PROP_TYPE.PLSQL, PROP_TYPE.PLSQL_EXPR_VARCHAR, PROP_TYPE.PLSQL_EXPR_BOOLEAN,
                                       PROP_TYPE.PLSQL_EXPR_CUSTOM,
                                       PROP_TYPE.PLSQL_FUNC_VARCHAR, PROP_TYPE.PLSQL_FUNC_CLOB, PROP_TYPE.PLSQL_FUNC_BOOLEAN,
                                       PROP_TYPE.PLSQL_FUNC_CUSTOM, PROP_TYPE.PLSQL_FUNC_SQL,
                                       PROP_TYPE.PLSQL_PACKAGE, PROP_TYPE.PLSQL_METHOD,
                                       /* MLE JavaScript returning SQL */
                                       PROP_TYPE.MLE_JS_FUNC_SQL ].includes( lPropertyDef.type )
                                  || this.id === PROP.SOURCE_WEB_SRC_QUERY
                                  || this.id === PROP.SOURCE_DUALITY_VIEW
                                  || this.id === PROP.SOURCE_JSON_COLLECTION
                                  || this.id === PROP.SOURCE_GRAPH_MATCH_CLAUSE
                                  || this.id === PROP.SOURCE_GRAPH_COLUMNS_CLAUSE
                                  || lPropertyDef.hasPlSqlCheck
                                  /* Server-side Template Directives */
                                  || (    lPropertyDef.type === PROP_TYPE.HTML
                                       && lValue.includes( "{" )
                                       && lTypePropertyDef.supportsTemplateDirective ) )
                        {
                            // todo we should also check uniqueness for types APPLICATION, WORKSPACE and INSTANCE

                            // If it's a TABLE or GRAPH property type, we also have to get the "table/graph owner" property from our parent
                            if ( [ PROP_TYPE.TABLE, PROP_TYPE.GRAPH ].includes( lPropertyDef.type )) {
                                lOwner = this.component._properties[ lTypePropertyDef.parentProperty.id ]._value;
                            }

                            // If it's one of the source location properties, we also have to get the remote server
                            if (  [ PROP.SOURCE_SQL_QUERY,
                                    PROP.SOURCE_QUERY_TABLE,
                                    PROP.SOURCE_QUERY_WHERE,
                                    PROP.SOURCE_QUERY_STATIC_ORDER_BY,
                                    PROP.SOURCE_QUERY_ORDER_BY ].includes( lSelf.id )
                               || SOURCE_FUNC_BODY_SQL_PROPS.includes( lSelf.id ))
                            {
                                lLocation         = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                lQueryType        = this.component.getPropertyValue( PROP.SOURCE_QUERY_TYPE );
                                lRemoteDatabaseId = this.component.getPropertyValue( PROP.SOURCE_REMOTE_DATABASE );
                                lObjectName       = this.component.getPropertyValue( [ PROP.SOURCE_QUERY_TABLE, PROP.SOURCE_GRAPH_NAME ]);
                                lSqlQuery         = this.component.getPropertyValue( PROP.SOURCE_SQL_QUERY );
                                lFunctionBody     = this.component.getPropertyValue( SOURCE_FUNC_BODY_SQL_PROPS );
                                if ( lQueryType ) {
                                    lIncludeRowidColumn = this.component.getPropertyValue( PROP.SOURCE_INCLUDE_ROWID_COLUMN );
                                }
                                lOptimizerHint = this.component.getPropertyValue( PROP.OPTIMIZER_HINT );

                            } else if ( [ PROP.SOURCE_GRAPH_NAME,
                                          PROP.SOURCE_GRAPH_MATCH_CLAUSE,
                                          PROP.SOURCE_GRAPH_WHERE_CLAUSE,
                                          PROP.SOURCE_GRAPH_COLUMNS_CLAUSE,
                                          PROP.SOURCE_GRAPH_STATIC_ORDER_BY,
                                          PROP.SOURCE_GRAPH_ORDER_BY ].includes( lSelf.id ))
                            {
                                // To get a valid graph query we have to lookup multiple properties
                                lLocation         = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                lQueryType        = "GRAPH";
                                lRemoteDatabaseId = this.component.getPropertyValue( PROP.SOURCE_REMOTE_DATABASE );
                                lOwner            = this.component.getPropertyValue( PROP.SOURCE_GRAPH_OWNER );
                                lObjectName       = this.component.getPropertyValue( PROP.SOURCE_GRAPH_NAME );
                                lMatchClause      = this.component.getPropertyValue( PROP.SOURCE_GRAPH_MATCH_CLAUSE );
                                lColumnsClause    = this.component.getPropertyValue( PROP.SOURCE_GRAPH_COLUMNS_CLAUSE );
                                lOptimizerHint    = this.component.getPropertyValue( PROP.OPTIMIZER_HINT );

                                // To start validating graph properties, graph name, match and columns clause
                                // have to have a value, otherwise we are not able to validate graph properties at all.
                                // Set the validated property to OK, it will implicitely be validated if the last
                                // of those three properties is entered. This is done with the resetChildProperties
                                // mechanism and the "Special for Graph" in _setValue.
                                if (  ( lObjectName    === "" && lSelf.id !== PROP.SOURCE_GRAPH_NAME )
                                   || ( lMatchClause   === "" && lSelf.id !== PROP.SOURCE_GRAPH_MATCH_CLAUSE )
                                   || ( lColumnsClause === "" && lSelf.id !== PROP.SOURCE_GRAPH_COLUMNS_CLAUSE )
                                   )
                                {
                                    return lResult;
                                }

                            } else if ( lSelf.id === PROP.SOURCE_WEB_SRC_QUERY ) {
                                lLocation         = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                lWebSourceQueryId = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_QUERY );
                                lWebSourceArrayId = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_ARRAY_COL );

                            } else if ( lSelf.id === PROP.SOURCE_DUALITY_VIEW ) {
                                lLocation         = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                lWebSourceQueryId = this.component.getPropertyValue( PROP.SOURCE_DUALITY_VIEW );
                                lWebSourceArrayId = this.component.getPropertyValue( PROP.SOURCE_DUALITY_VIEW_ARRAY_COL );

                            } else if ( lSelf.id === PROP.SOURCE_JSON_COLLECTION ) {
                                lLocation         = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                lWebSourceQueryId = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION );
                                lWebSourceArrayId = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION_ARRAY_COL );

                            } else if ( [ PROP.POST_PROC_WHERE,
                                          PROP.POST_PROC_ORDER_BY,
                                          PROP.POST_PROC_SQL_QUERY,
                                          PROP.POST_PROC_PLSQL_FUNC_BODY_SQL,
                                          PROP.POST_PROC_JS_FUNC_BODY_SQL,
                                          PROP.POST_PROC_JAVA_FUNC_BODY_SQL,
                                          PROP.POST_PROC_PYTHON_FUNC_BODY_SQL,
                                          PROP.DUALITYVIEW_POST_PROC_WHERE,
                                          PROP.DUALITYVIEW_POST_PROC_ORDER_BY,
                                          PROP.DUALITYVIEW_POST_PROC_SQL_QUERY,
                                          PROP.DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL,
                                          PROP.DUALITYVIEW_POST_PROC_JS_FUNC_BODY_SQL,
                                          PROP.DUALITYVIEW_POST_PROC_JAVA_FUNC_BODY_SQL,
                                          PROP.DUALITYVIEW_POST_PROC_PYTHON_FUNC_BODY_SQL,
                                          PROP.JSONCOLL_POST_PROC_WHERE,
                                          PROP.JSONCOLL_POST_PROC_ORDER_BY,
                                          PROP.JSONCOLL_POST_PROC_SQL_QUERY,
                                          PROP.JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL,
                                          PROP.JSONCOLL_POST_PROC_JS_FUNC_BODY_SQL,
                                          PROP.JSONCOLL_POST_PROC_JAVA_FUNC_BODY_SQL ].includes( this.id ))
                            {
                                lLocation           = this.component.getPropertyValue( [ PROP.SOURCE_LOCATION, PROP.CHILD_SOURCE_LOCATION ] );
                                if ( lLocation === LOCATION.WEB_SOURCE ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_QUERY );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_ARRAY_COL );
                                } else if ( lLocation === LOCATION.DUALITY_VIEW ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_DUALITY_VIEW );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_DUALITY_VIEW_ARRAY_COL );
                                } else if ( lLocation === LOCATION.JSON_COLLECTION ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION_ARRAY_COL );
                                }
                                lQueryType          = "";
                                lObjectName         = "";
                                lSqlQuery           = "";
                                lFunctionBody       = "";

                            } else if ( lPropertyDef.type === PROP_TYPE.WHERE_CLAUSE ) {

                                // If it's a "where clause" property type belonging to a table, we also have to get
                                // the "table owner" and "table name" property from our parents
                                lQueryType          = "TABLE";
                                lOwner              = this.component._properties[ lTypeProperties[ lTypePropertyDef.parentProperty.id ].parentProperty.id ]._value;
                                lObjectName         = this.component._properties[ lTypePropertyDef.parentProperty.id ]._value;
                                lIncludeRowidColumn = "Y";

                            } else if ( lPropertyDef.type === PROP_TYPE.ORDER_BY_CLAUSE ) {
                                // If it's a "order by clause" property type, we also have to get the "table owner" and "table name" property from our parent
                                lQueryType          = "TABLE";
                                lOwner              = this.component._properties[ lTypeProperties[ lTypePropertyDef.parentProperty.id ].parentProperty.id ]._value;
                                lObjectName         = this.component._properties[ lTypePropertyDef.parentProperty.id ]._value;
                                lIncludeRowidColumn = "Y";

                            } else if ( this.id === PROP.PLSQL_CODE ) {
                                lLocation         = this.component.getPropertyValue( PROP.PLSQL_PROCESS_LOCATION );
                                lRemoteDatabaseId = this.component.getPropertyValue( PROP.PLSQL_REMOTE_DATABASE );

                            } else if ( lPropertyDef.type === PROP_TYPE.PLSQL_PACKAGE ) {
                                lOwner = this.component._properties[ lTypePropertyDef.parentProperty.id ]._value;

                            } else if ( lPropertyDef.type === PROP_TYPE.PLSQL_METHOD ) {
                                // Is it a method of a package or a stand-alone procedure/function?
                                lParentProperty        = gProperties[ lTypePropertyDef.parentProperty.id ];
                                lParentTypePropertyDef = lType.properties[ lTypePropertyDef.parentProperty.id ];
                                if ( lParentProperty.type === PROP_TYPE.PLSQL_PACKAGE ) {
                                    lOwner       = this.component._properties[ lParentTypePropertyDef.parentProperty.id ]._value;
                                    lPackageName = this.component._properties[ lParentTypePropertyDef.propertyId ]._value;
                                } else {
                                    lOwner = this.component._properties[ lParentTypePropertyDef.propertyId ]._value;
                                }

                            } else if ( PROP_TYPES_EXP_FUNC_CUSTOM.includes( lPropertyDef.type )) {

                                if ( lTypePropertyDef.customDataType ) {
                                    lCustomDataType = lTypePropertyDef.customDataType;
                                } else {
                                    // Todo: This is a hard-coded dependency which should be made configurable in
                                    // wwv_pe_comp_properties. The data type to use is data driven and not pre-configured.
                                    // We first look into the "Custom Data Type" property and if it's not defined
                                    // (because it's not a custom data type), we take the value from the always existing
                                    // "Data Type".
                                    lCustomDataType = this.component.getPropertyValue([ PROP.API_CUSTOM_DATA_TYPE, PROP.API_DATA_TYPE, PROP.WEB_SRC_PARAM_DATA_TYPE, PROP.WORKFLOW_DATA_TYPE ]);
                                }
                            } else if ( lSelf.id === PROP.SOURCE_SQL_EXPRESSION
                                      && [ COMP_TYPE.IG_COLUMN, COMP_TYPE.REGION_TMPL_COLUMN ].includes( this.component.typeId ) ) {
                                // if it's a "SQL EXPRESSION" property type for the IG_COLUMN/REGION_TMPL_COLUMN component types,
                                // we have to get source properties form parent region.
                                let lParentComponent = this.component.getParent();

                                lLocation             = lParentComponent.getPropertyValue( [ PROP.SOURCE_LOCATION ] );
                                lQueryType            = lParentComponent.getPropertyValue( [ PROP.SOURCE_QUERY_TYPE, PROP.SOURCE_POST_PROCESSING, PROP.DUALITYVIEW_SOURCE_POST_PROCESSING, PROP.JSONCOLL_SOURCE_POST_PROCESSING ] );
                                lOwner                = lParentComponent.getPropertyValue( [ PROP.SOURCE_QUERY_OWNER, PROP.SOURCE_GRAPH_OWNER ] );
                                lObjectName           = lParentComponent.getPropertyValue( [ PROP.SOURCE_QUERY_TABLE, PROP.SOURCE_GRAPH_NAME ] );
                                lSqlQuery             = lParentComponent.getPropertyValue( [ PROP.SOURCE_SQL_QUERY, PROP.POST_PROC_SQL_QUERY, PROP.DUALITYVIEW_POST_PROC_SQL_QUERY, PROP.JSONCOLL_POST_PROC_SQL_QUERY ] );
                                lFunctionBody         = lParentComponent.getPropertyValue( SOURCE_POST_PROC_FUNC_BODY_SQL_PROPS );
                                lFunctionBodyLanguage = lParentComponent.getPropertyValue( [ PROP.SOURCE_QUERY_FUNC_BODY_LANG, PROP.POST_PROC_FUNC_BODY_LANG, PROP.DUALITYVIEW_POST_PROC_FUNC_BODY_LANG, PROP.JSONCOLL_POST_PROC_FUNC_BODY_LANG ] );

                                if ( lLocation === LOCATION.WEB_SOURCE ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_QUERY );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_ARRAY_COL );
                                } else if ( lLocation === LOCATION.DUALITY_VIEW ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_WEB_SRC_QUERY );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_DUALITY_VIEW_ARRAY_COL );
                                } else if ( lLocation === LOCATION.JSON_COLLECTION ) {
                                    lWebSourceQueryId   = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION );
                                    lWebSourceArrayId   = this.component.getPropertyValue( PROP.SOURCE_JSON_COLLECTION_ARRAY_COL );
                                }

                                lRemoteDatabaseId     = lParentComponent.getPropertyValue( PROP.SOURCE_REMOTE_DATABASE );
                                lMatchClause          = lParentComponent.getPropertyValue( PROP.SOURCE_GRAPH_MATCH_CLAUSE );
                                lColumnsClause        = lParentComponent.getPropertyValue( PROP.SOURCE_GRAPH_COLUMNS_CLAUSE );
                            }
                            // Do the validation on the server, because we have to check SQL, PLSQL and table names and also have to get the available columns
                            // of the SQL statement/table
                            ajax (
                                "validateProperty", {
                                    x01: this.id,
                                    x02: lPropertyDef.type,
                                    x03: this._sqlMinColumns,
                                    x04: this._sqlMaxColumns,
                                    x05: lValue,
                                    x06: lLocation,
                                    x07: lQueryType,
                                    x08: lOwner,
                                    x09: lObjectName || lSqlQuery || lFunctionBody, // only one will be populated
                                    x10: ( [ LOCATION.WEB_SOURCE, LOCATION.DUALITY_VIEW, LOCATION.JSON_COLLECTION ].includes ( lLocation ) ? lWebSourceArrayId : lIncludeRowidColumn ),
                                    x11: lOptimizerHint,
                                    x12: lRemoteDatabaseId,
                                    x13: lPackageName,
                                    x14: lCustomDataType,
                                    x15: lMatchClause,
                                    x16: lColumnsClause,
                                    x17: lFunctionBodyLanguage,
                                    x18: lWebSourceQueryId,
                                    x19: gCurrentPageId
                                }, {
                                    success: function( pData ) {
                                        lResult.columns             = pData.columns || [];
                                        lResult.parameters          = pData.parameters || [];
                                        lResult.hasOrderBy          = pData.hasOrderBy;
                                        lResult.wsmHasLocalTableFor = pData.webSourceHasLocalTableFor;
                                        lResult.wsmHasArrayColumns  = pData.webSourceHasArrayColumns;
                                        lResult.databaseType        = pData.databaseType;

                                        if ( pData.result !== "OK" ) {
                                            // - By default we show everything as a warning, but if it's a SQL, TABLE, GRAPH or
                                            //   SOURCE_GRAPH_COLUMNS property
                                            //   which is used by other properties (i.e. column properties) we have to show it as
                                            //   an error, because we will not be able to populate those properties
                                            // - In addition, if it's very likely the result of a PL/SQL validation function, we
                                            //   should also handle it as a serious error
                                            if (  (  (  [ PROP_TYPE.TABLE, PROP_TYPE.GRAPH ].includes( lPropertyDef.type )
                                                     || PROP_TYPES_RETURNING_SQL.includes( lPropertyDef.type )
                                                     || lPropertyDef.id === PROP.SOURCE_GRAPH_MATCH_CLAUSE
                                                     || lPropertyDef.id === PROP.SOURCE_GRAPH_COLUMNS_CLAUSE
                                                     )
                                                  && lTypePropertyDef.refByChilds.length > 0
                                                  )
                                               || SOURCE_FUNC_BODY_SQL_PROPS.includes( lSelf.id )
                                               || [ PROP.REGION_FUNCTION_RETURNING_SQL, PROP.SOURCE_WEB_SRC_QUERY ].includes( lSelf.id )
                                               || lPropertyDef.hasPlSqlCheck )
                                            {
                                                lResult.errors.push( pData.result );
                                            } else {
                                                lResult.warnings.push( pData.result );
                                            }
                                        }
                                    },
                                    async: false // this is by intention, because we need the result within the current transaction
                                } );

                        } else if ( [ PROP_TYPE.COLUMN, PROP_TYPE.REGION_COLUMN, PROP_TYPE.SESSION_STATE_VALUE ].includes( lPropertyDef.type ) ) {
                            let parent = this.component.getParent();
                            let source = parent?.getProperty( PROP.SOURCE_LOCATION );
                            if ( !( lPropertyDef.type === PROP_TYPE.SESSION_STATE_VALUE && this.component.typeId === COMP_TYPE.REGION_PLUGIN_ATTR && !source?.getValue() ) ) {
                                // Check if it's a valid column and if the column data type matches with our configuration
                                lError = this._checkColumn( lValue );
                                if ( lError !== "" ) {
                                    lResult.errors.push( lError );
                                }
                            }
                        }

                        // Check uniqueness of property
                        if ( lTypePropertyDef.checkUniqueness ) { // todo
                            lFilter = { properties: [{ id: this.id, value: lValue }]};

                            // Restrict our component query based on the scope of uniqueness. APPLICATION, WORKSPACE and INSTANCE will just be
                            // checked on the server
                            if ( lTypePropertyDef.checkUniqueness === "PARENT" ) {
                                lFilter.parentId = this.component.parentId;
                                // todo do we have to have a dependency on the parent property? I think this is needed to revalidate unique properties if a component is moved to a different parent
                            } else if ( lTypePropertyDef.checkUniqueness === "PAGE" ) {
                                lFilter.pageId = gCurrentPageId;
                            } else if ( lTypePropertyDef.checkUniqueness === "WORKFLOW" ) {
                                // store the current workflow version id
                                let version = getWorkflowVersion( this.component );
                                // restrict the result to the current workflow version
                                lFilter.filterFunction = function(){
                                    let component = getWorkflowVersion( this );
                                    return version.id === component.id;
                                };
                            }

                            lComponents = getComponents( this.component.typeId, lFilter );
                            if ( lComponents.length > 0 && lComponents[ 0 ].id !== this.component.id ) {
                                lResult.errors.push( format( "VAL.MUST_BE_UNIQUE" ) );
                            } else if ( this.id === PROP.ITEM_NAME ) {
                                // Item names (used for page items, facets and smart filters) have to be unique within those component types
                                lFilters = [];
                                if ( this.component.typeId !== COMP_TYPE.PAGE_ITEM ) {
                                    lFilters.push( { typeId: COMP_TYPE.PAGE_ITEM, filter: lFilter } );
                                }
                                if ( this.component.typeId !== COMP_TYPE.FACET ) {
                                    lFilters.push( { typeId: COMP_TYPE.FACET, filter: lFilter } );
                                }
                                if ( this.component.typeId !== COMP_TYPE.FACET_GROUP_ITEM ) {
                                    lFilters.push( { typeId: COMP_TYPE.FACET_GROUP_ITEM, filter: lFilter } );
                                }
                                if ( this.component.typeId !== COMP_TYPE.SFILTER ) {
                                    lFilters.push( { typeId: COMP_TYPE.SFILTER, filter: lFilter } );
                                }
                                if ( this.component.typeId !== COMP_TYPE.SFILTER_GROUP_ITEM ) {
                                    lFilters.push( { typeId: COMP_TYPE.SFILTER_GROUP_ITEM, filter: lFilter } );
                                }
                                if ( getComponentsAdvanced( lFilters, false ).length > 0 ) {
                                    lResult.errors.push( format( "VAL.MUST_BE_UNIQUE" ) );
                                }
                            } else if ( this.id === PROP.WF_IDENTIFICATION_STATIC_ID ) {
                                lFilters = [];
                                if ( this.component.typeId !== COMP_TYPE.WORKFLOW_VARIABLE ) {
                                    lFilters.push( { typeId: COMP_TYPE.WORKFLOW_VARIABLE, filter: lFilter } );
                                }

                                if ( this.component.typeId !== COMP_TYPE.WORKFLOW_PARAM ) {
                                    lFilters.push( { typeId: COMP_TYPE.WORKFLOW_PARAM, filter: lFilter } );
                                }

                                if ( this.component.typeId !== COMP_TYPE.WORKFLOW_ACT_VAR ) {
                                    lFilters.push( { typeId: COMP_TYPE.WORKFLOW_ACT_VAR, filter: lFilter } );
                                }
                                if ( getComponentsAdvanced( lFilters, false ).length > 0 ) {
                                    lResult.errors.push( format( "VAL.MUST_BE_UNIQUE" ) );
                                }
                            }
                        }

                        // Let a plug-in/component type know about changed property values, this will allow to perform custom validations
                        if ( lResult.errors.length === 0 ) {
                            addWarningError( this.component._callPluginCallback( {
                                action:   CALLBACK_ACTION.VALIDATE,
                                property: this,
                                value:    lValue,
                                sql:      {
                                    columns:     lResult.columns,
                                    parameters:  lResult.parameters,
                                    hasOrderBy:  lResult.hasOrderBy,
                                    hasWarnings: ( lResult.warnings.length > 0 )
                        }
                            } ) );
                        }
                        if ( lResult.errors.length === 0 ) {
                            addWarningError( this.component._callComponentTypeCallback( {
                                action:   CALLBACK_ACTION.VALIDATE,
                                property: this,
                                value:    lValue,
                                sql:      {
                                    columns:     lResult.columns,
                                    parameters:  lResult.parameters,
                                    hasOrderBy:  lResult.hasOrderBy,
                                    hasWarnings: ( lResult.warnings.length > 0 )
                                }
                            } ) );
                        }
                    }
                }
            }
        }

        return lResult;

    }; // validate


    /*
     * todo documentation
     */
    Property.prototype._setValue = function( pValue, pOptions ) {

        var lSelf            = this,
            lComponent       = this.component,
            lValue           = pValue + "", // Let's make sure that we always get a string
            lOldValue        = this._value,
            lOptions,
            lType            = gTypes[ lComponent.typeId ],
            lPluginType      = lType.pluginType,
            lTypeProperties  = lType.properties,
            lTypePropertyDef = lTypeProperties[ this.id ],
            lPropertyDef     = gProperties[ lSelf.id ],
            lValidationResult,
            lSeq             = undefined,
            lParentId        = undefined;

        /*
         * Auto corrects the property value based on the property configuration
         */
        function autoCorrect() {

            // 1) Auto trim value
            if ( [ PROP_TYPE.NUMBER, PROP_TYPE.INTEGER, PROP_TYPE.LINK, PROP_TYPE.ITEM, PROP_TYPE.FACET,
                   PROP_TYPE.PAGE, PROP_TYPE.TABLE, PROP_TYPE.GRAPH,
                   PROP_TYPE.PLSQL_PACKAGE, PROP_TYPE.PLSQL_METHOD ].includes( lPropertyDef.type ) )
            {
                lValue = lValue.trim();
            }

            // 2) Set text case
            if ( lPropertyDef.textCase === "UPPER" ) {
                lValue = lValue.toUpperCase();
            } else if ( lPropertyDef.textCase === "LOWER" ) {
                lValue = lValue.toLowerCase();
            }

            // 3) If the Media type property has no source value, clear it!
            if ( lPropertyDef.type === PROP_TYPE.MEDIA && lValue ) {
                let source = JSON.parse( lValue ).source;
                if ( !source ) {
                    lValue = "";
                }
            }

        } // autoCorrect


        /*
         * This method checks if the children properties should be added or removed based on the current property value.
         */
        function addOrRemoveChildren( pPropertyId ) {

            let lPropertyId;

            /*
             * Removes the the passed in property and all it's children and grand children, ...
             */
            function removeProperty( pPropertyId ) {

                delete lComponent._properties[ pPropertyId ];

                // Remove all children as well
                for ( let i = 0; i < lTypeProperties[ pPropertyId ].refByDependingOn.length; i++ ) {

                    // Some properties to have a "soft check" where the dependency condition is ignored
                    // in case the referenced property doesn't exist. We are not allowed to clear those properties
                    // immediately
                    if ( lTypeProperties[ pPropertyId ].refByDependingOn[ i ].hasToExist ) {
                        removeProperty( lTypeProperties[ pPropertyId ].refByDependingOn[ i ].propertyId );
                    }
                }
            } // removeProperty


            for ( let i = 0; i < lTypeProperties[ pPropertyId ].refByDependingOn.length; i++ ) {

                lPropertyId = lTypeProperties[ pPropertyId ].refByDependingOn[ i ].propertyId;

                if ( hasOwnProperty( lComponent._properties, lPropertyId ) ) {
                    // If the property already exists, recreate it with the current value
                    lComponent._properties[ lPropertyId ] = new Property( {
                        component:    lComponent,
                        propertyId:   lPropertyId,
                        defaultValue: lComponent._properties[ lPropertyId ]._value,
                        columns:      lComponent._properties[ lPropertyId ]._columns,
                        parameters:   lComponent._properties[ lPropertyId ]._parameters,
                        hasOrderBy:   lComponent._properties[ lPropertyId ]._hasOrderBy,
                        databaseType: lComponent._properties[ lPropertyId ]._databaseType
                    } );
                } else {
                    // If the child property doesn't exist yet, create it
                    if ( lPropertyId === PROP.GRID_LABEL_COLUMN_SPAN || lPropertyId === PROP.READ_ONLY_HTML_ATTRIBUTES ) {
                        // Grid properties do have additional checks, use the grid API to create it
                        // No need to include PROP.LABEL_ALIGNMENT and PROP.ELEMENT_FIELD_ALIGNMENT because they are taken care of by the
                        // dependency to ITEM_TYPE which will trigger a resetGridProperties
                        lComponent._setGridProperties( true );
                    } else {
                        lComponent._properties[ lPropertyId ] = new Property( {
                            component:  lComponent,
                            propertyId: lPropertyId
                        } );
                    }
                }

                // Check if the child property should be visible, if yes do the same check for it's children.
                // Otherwise remove the property and all it's children.
                // Note: we have to do this additional check if the property exists, because grid properties might
                //       not have been created
                if ( hasOwnProperty( lComponent._properties, lPropertyId ) && lComponent._properties[ lPropertyId ]._isVisible() ) {
                    addOrRemoveChildren( lPropertyId );
                } else {
                    removeProperty( lPropertyId );
                }
            }
        } // addOrRemoveChildren


        /*
         * Reset all child properties.
         * For properties of type "Column" or "Region Column" we check if the referenced column isn't valid anymore after changing the
         * parent property containing a SQL statement or table name.
         * For all other properties we just reset the value.
         */
        function resetChildProperties() {

            function resetChildProperty( pComponent, pChildPropertyId ) {

                var lProperty,
                    lSetFunction,
                    lMedia;

                function columnStillValid( pName, pDataTypes, pDeleteAll ) {
                    if (    lMedia[ pName ]
                        &&  lProperty._checkColumn( lMedia[ pName ], pDataTypes ) === format( "VAL.COLUMN_NOT_FOUND" ) ) {
                        if ( pDeleteAll ) {
                            lMedia = {};
                        } else {
                            delete lMedia[ pName ];
                        }
                    }
                }

                // Check if the child property is really in use for that component
                if ( hasOwnProperty( pComponent._properties, pChildPropertyId ) ) {

                    lProperty = pComponent._properties[ pChildPropertyId ];

                    if ( pComponent === lComponent ) {
                        // If we update the current component, we don't want to trigger a new transaction update, because
                        // we already did that
                        lSetFunction = "_setValue";
                    } else {
                        // It's a child component we update, write a transaction record
                        lSetFunction = "setValue";
                    }

                    if ( [ PROP_TYPE.COLUMN, PROP_TYPE.REGION_COLUMN, PROP_TYPE.SESSION_STATE_VALUE ].includes( gProperties[ pChildPropertyId ].type ) ) {

                        // Verify it the specified column is still valid, if not clear it
                        if ( lProperty._value !== "" && lProperty._checkColumn( lProperty._value ) === format( "VAL.COLUMN_NOT_FOUND" ) ) {
                            lProperty[ lSetFunction ]( "", lOptions );
                        } else {
                            // Trigger a validation for that column to show for example a wrong data type or required message
                            lProperty[ lSetFunction ]( lProperty._value, lOptions );
                        }

                    } else if (  lValue !== "" /* new value of the parent property */
                              && (  [ PROP_TYPE.WHERE_CLAUSE, PROP_TYPE.ORDER_BY_CLAUSE, PROP_TYPE.ORDER_BY_ITEM ].includes( gProperties[ pChildPropertyId ].type )
                                 || pChildPropertyId === PROP.SOURCE_GRAPH_COLUMNS_CLAUSE )
                              )
                    {
                        // For the above properties it's better to keep them (eg. parent table name is replaced by a view or match clause is modified),
                        // but we have to trigger a validation for that property to show errors and to update depending properties
                        lProperty[ lSetFunction ]( lProperty._value, { forceSetValue: true } );

                    } else if ( gProperties[ pChildPropertyId ].type === PROP_TYPE.MEDIA ) {
                        lMedia = JSON.parse( lProperty._value || "{}" );

                        switch ( lMedia.source ) {
                            case MEDIA_SOURCE.BLOB_COLUMN:

                                // Remove column mappings when the column is not found
                                columnStillValid( "filenameColumn", [ "VARCHAR2" ] );
                                columnStillValid( "mimeTypeColumn", [ "VARCHAR2" ] );
                                columnStillValid( "lastUpdatedColumn", [ "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ" ] );
                                columnStillValid( "blobColumn", [ "BLOB" ], true );
                                break;
                            case MEDIA_SOURCE.URL_COLUMN:
                                columnStillValid( "urlColumn", [ "VARCHAR2" ], true );
                        }

                        // Trigger a validation for that column to show for example a wrong data type or required message
                        lProperty[ lSetFunction ]( JSON.stringify( lMedia ), lOptions );

                    } else if ( lOptions.keepChildValues ) {
                        // Trigger a validation for that property to show errors and to update depending properties
                        lProperty[ lSetFunction ]( lProperty._value, lOptions );

                    } else {
                        // For all other property types, just reset the value with the default
                        lProperty[ lSetFunction ]( replaceDefaultPlaceholders( lProperty, gTypes[ pComponent.typeId ].properties[ pChildPropertyId ].defaultValue ), lOptions );
                    }
                }
            }


            var lChilds;

            // As long as the parent property has an error or warnings, don't clear the children. We want to avoid that
            // if an invalid SQL statement has been entered, all children are immediately cleared.
            // The exception of this rule is in the case of an "Is Required" error. Because it would look odd if someone
            // changes the table owner, the table name is cleared but the column names would still be displayed because
            // there is a "is required" error on the table name.
            if (  ( lSelf.errors.length === 0 && lSelf.warnings.length === 0 )
               || ( lSelf.errors.length === 1 && lSelf.errors[ 0 ] === format( "VAL.IS_REQUIRED" ) )
               )
            {
                for ( let i = 0; i < lTypePropertyDef.refByChilds.length; i++ ) {
                    if ( lTypePropertyDef.refByChilds[ i ].typeId === lComponent.typeId ) {

                        // Reset property within the same component
                        resetChildProperty( lComponent, lTypePropertyDef.refByChilds[ i ].id );

                    } else {

                        // Reset property in a child component
                        lChilds = lComponent.getChildrenUntil( lTypePropertyDef.refByChilds[ i ].typeId );
                        for ( let j = 0; j < lChilds.length; j++ ) {
                            resetChildProperty( lChilds[ j ], lTypePropertyDef.refByChilds[ i ].id );
                        }
                    }
                }
            }

        } // resetChildProperties


        function resetGridProperties() {

            if (  [ PROP.GRID_NEW_GRID, PROP.GRID_NEW_ROW, PROP.GRID_COLUMN, PROP.GRID_NEW_COLUMN, PROP.GRID_COLUMN_SPAN ].includes( lSelf.id )
                || ( lComponent.typeId === COMP_TYPE.REGION             && [ PROP.PARENT_REGION, PROP.SLOT_PLACEHOLDER, PROP.REGION_TEMPLATE, PROP.REGION_TYPE  ].includes( lSelf.id ) )
                || ( lComponent.typeId === COMP_TYPE.PAGE_ITEM          && [ PROP.REGION, PROP.SLOT_PLACEHOLDER, PROP.ITEM_TYPE, PROP.FIELD_TEMPLATE ].includes( lSelf.id ) )
                || ( lComponent.typeId === COMP_TYPE.BUTTON             && [ PROP.REGION, PROP.SLOT_PLACEHOLDER ].includes( lSelf.id ) )
                || ( lComponent.typeId === COMP_TYPE.REGION_PLUGIN_ATTR && [ PROP.TEMPLATE_COMPONENT_TYPE ].includes( lSelf.id ) )
            ) {

                lComponent._setGridProperties();

            } else if ( lComponent.typeId === COMP_TYPE.PAGE && [ PROP.PAGE_TEMPLATE, PROP.DIALOG_TEMPLATE ].includes( lSelf.id ) ) {

                setPageGridProperties();

            }

        } // resetGridProperties

        function renameItemReferences( pOldName, pNewName ) {

            var SEARCH_VALUE_ESCAPED = util.escapeRegExp( pOldName );

            var lRefPropertyDef,
                lSearchRegExp,
                lFilter,
                lRefComponents = [],
                lRefProperty,
                i, j, k;

            // Get all properties which are referencing page items/facet/smart filter with a weak property type = ITEM/FACET
            for ( i = 0; i < gTypes[ lType.id ].refByProperties.length; i++ ) {
                lRefPropertyDef = gProperties[ gTypes[ lType.id ].refByProperties[ i ]];

                if ( [ PROP_TYPE.ITEM, PROP_TYPE.FACET, PROP_TYPE.SESSION_STATE_VALUE ].includes( lRefPropertyDef.type ) ) {
                    if ( lRefPropertyDef.multiValueDelimiter ) {
                        lSearchRegExp = new RegExp( "(^|" + lRefPropertyDef.multiValueDelimiter + "|\\s)" + SEARCH_VALUE_ESCAPED + "($|" + lRefPropertyDef.multiValueDelimiter + "|\\s)", "i" );
                        lFilter = { properties: [{ id: lRefPropertyDef.id, value: lSearchRegExp }]};
                    } else {
                        lSearchRegExp = new RegExp( "^" + SEARCH_VALUE_ESCAPED + "$", "i" );
                        lFilter = { properties: [{ id: lRefPropertyDef.id, value: lSearchRegExp }]};
                    }

                    for ( j = 0; j < lRefPropertyDef.refByComponentTypes.length; j++ ) {

                        lTypePropertyDef = gTypes[ lRefPropertyDef.refByComponentTypes[ j ]].properties[ lRefPropertyDef.id ];
                        lRefComponents = getComponents( lRefPropertyDef.refByComponentTypes[ j ], lFilter, false );
                        for ( k = 0; k < lRefComponents.length; k++ ) {
                            lRefProperty = lRefComponents[ k ].getProperty( lRefPropertyDef.id );
                            if ( lRefPropertyDef.multiValueDelimiter ) {
                                lRefProperty.setValue( lRefProperty.getValue().replace( lSearchRegExp, "$1" + pNewName + "$2" ) );
                            } else {
                                lRefProperty.setValue( pNewName );
                            }
                        }
                    }
                } else if ( lRefPropertyDef.type === PROP_TYPE.ORDER_BY_ITEM ) {

                    lFilter = getOrderByItemFilter( lRefPropertyDef, pOldName );
                    for ( j = 0; j < lRefPropertyDef.refByComponentTypes.length; j++ ) {

                        lTypePropertyDef = gTypes[ lRefPropertyDef.refByComponentTypes[ j ]].properties[ lRefPropertyDef.id ];
                        lRefComponents = getComponents( lRefPropertyDef.refByComponentTypes[ j ], lFilter, false );
                        for ( k = 0; k < lRefComponents.length; k++ ) {
                            lRefProperty = lRefComponents[ k ].getProperty( lRefPropertyDef.id );
                            setOrderByItemName( lRefProperty, pNewName );
                        }
                    }
                }
            }
        } // renameItemReferences


        pOptions = $.extend( {
            checkReadOnly:   true,
            keepChildValues: false
        }, pOptions );
        lOptions = $.extend( {}, {}, pOptions );

        // Perform several integrity checks before we do anything
        if ( pOptions.checkReadOnly ) {
            if ( gIsPageReadOnly ) {
                throw new Error( "Page is read only!" );
            } else if ( lComponent.isReadOnly() ) {
                throw new Error( "Component is read only!" );
            } else if ( lSelf._isReadOnly ) {
                throw new Error( `Property '${ lSelf.getMetaData().prompt }' (${ lSelf.id }) is read only for this component!` );
            }
        }

        // Don't change the value/validate the value if it hasn't changed and we haven't had errors/warnings before
        if ( lValue === lSelf._value && lSelf.errors.length === 0 && lSelf.warnings.length === 0 && !lOptions.forceSetValue ) {
            return;
        // If the value hasn't changed, all child properties should also keep the values. But we still want to re-validate them
        } else if ( lOptions.keepChildValues || ( lValue === lSelf._value && lOptions.forceSetValue ) ) {
            lOptions.keepChildValues = true;
        }

        // Let's auto correct and validate the property value
        autoCorrect();
        lValidationResult = this.validate( lValue );

        // If a different plug-in has been selected, call the remove callback of the old plug-in.
        // This will allow the plug-in to remove child components from the model
        if ( lPluginType && lSelf.id === lPluginType.typePropertyId && lValue !== lOldValue ) {
            this.component._callPluginCallback( { action: CALLBACK_ACTION.REMOVED } );
        }

        // Update property
        lSelf._value               = lValue;
        lSelf.hasChanged           = true;
        lSelf.errors               = lValidationResult.errors;
        lSelf.warnings             = lValidationResult.warnings;
        lSelf._columns             = lValidationResult.columns;
        lSelf._parameters          = lValidationResult.parameters;
        lSelf._hasOrderBy          = lValidationResult.hasOrderBy;
        lSelf._wsmHasLocalTableFor = lValidationResult.wsmHasLocalTableFor;
        lSelf._wsmHasArrayColumns  = lValidationResult.wsmHasArrayColumns;
        lSelf._databaseType        = lValidationResult.databaseType;

        // Replicate the sequence into our dedicated "seq" attribute for faster sort operations, but only
        // if that property doesn't have an error. Otherwise we keep with the value we currently have.
        if ( lSelf.errors.length === 0 && lSelf.id === lType.seqPropertyId ) {
            lSeq = parseInt( lValue, 10 );
        }

        // Replicate the parent property value into our dedicated "parentId" attribute for standardized access
        if ( lSelf.id === lType.parentPropertyId ) {
            lParentId = lValue;
        }

        lComponent._setHasChanged( {
            seq:      lSeq,
            parentId: lParentId
        } );

        // Add/Remove child properties
        addOrRemoveChildren( lSelf.id );

        // Reset child properties. For example in the case if the region SQL has been changed or a parent table property.
        resetChildProperties();

        // Special for Graph: Validating a graph query requires multiple properties to work together, that's why if we
        // can validate the SOURCE_GRAPH_COLUMNS_CLAUSE, the parent property are implicitely validated too and we can
        // remove any pending errors or warnings
        if (  lSelf.id === PROP.SOURCE_GRAPH_COLUMNS_CLAUSE
           && lValue   !== ""
           && lSelf.errors.length   === 0
           && lSelf.warnings.length === 0 )
        {
            lComponent._properties[ PROP.SOURCE_GRAPH_MATCH_CLAUSE ].errors = [];
            lComponent._properties[ PROP.SOURCE_GRAPH_NAME ].errors = [];
        }

        // Rename all references of the changed item name
        if ( lSelf.id === PROP.ITEM_NAME ) {
            renameItemReferences( lOldValue, lValue );
        }

        // Check if we have to reset some of the grid properties
        resetGridProperties();

        // Update error/warnings. Do it as last step of _setValue, because on of the reset/addOrRemove function might
        // have changed other properties of the component as well
        lComponent._setHasChanged();

    }; // _setValue


    Property.prototype.setValue = function( pValue, pOptions = {} ) {

        let lOldValue;
        let options = { checkReadOnly: true };
        if ( typeof pOptions === "boolean" ) {
            options.forceSetValue = pOptions;
        } else {
            options = { ...options, ...pOptions };
        }

        // Perform several integrity checks before we do anything
        if ( this.component._status === STATUS.DELETED ) {
            throw new Error( "Component has been deleted!" );
        }

        // Remember current state of component which is going to be modified so that we are able to undo our operation
        addToTransaction( this.component, OPERATION.CHANGE );

        lOldValue = this._value;

        // Now it's time to set the property values the developer has specified
        this._setValue( pValue, options );

        // Let a plug-in/component type know about changed property values, this will allow to refresh child components
        // For example if the SQL statement changes, update the report columns
        this.component._callPluginCallback( { property: this, oldValue: lOldValue } );
        this.component._callComponentTypeCallback( { property: this, oldValue: lOldValue } );

        // in some special cases, based on a property value different child components required/allowed
        let componentErrors = this.component._callComponentTypeCallback( { action: CALLBACK_ACTION.VALIDATE_COMPONENT } )?.error;
        if ( componentErrors?.length ) {
            this.component._errors = componentErrors;
        }

        return this;
    }; // setValue


    /*
     * todo
     */
    Property.prototype._setUniqueValue = function() {

        var lCheckUniqueness = gTypes[ this.component.typeId ].properties[ this.id ].checkUniqueness,
            lFilter          = { properties: [{ id: this.id, value: "" }]},
            lValue           = this.getValue();

        // Restrict our component query based on the scope of uniqueness. APPLICATION, WORKSPACE and INSTANCE will just be
        // checked on the server
        if ( lCheckUniqueness === "PARENT" ) {
            lFilter.parentId = this.component.parentId;
        } else if ( lCheckUniqueness === "PAGE" ) {
            lFilter.pageId = gCurrentPageId;
        }

        // Check if the current value is already in use, if yes try to find a unique value by adding a sequence starting with 2
        lFilter.properties[ 0 ].value = lValue;
        for ( let i = 1; i < 10000; i++ ) {
            if (  ( this.id === PROP.ITEM_NAME && getComponents( COMP_TYPE.PAGE_ITEM,          lFilter, false ).length === 0
                                               && getComponents( COMP_TYPE.FACET,              lFilter, false ).length === 0
                                               && getComponents( COMP_TYPE.FACET_GROUP_ITEM,   lFilter, false ).length === 0
                                               && getComponents( COMP_TYPE.SFILTER,            lFilter, false ).length === 0
                                               && getComponents( COMP_TYPE.SFILTER_GROUP_ITEM, lFilter, false ).length === 0 )
               || ( this.id !== PROP.ITEM_NAME && getComponents( this.component.typeId, lFilter, false ).length === 0 ) )
            {
                // Found a unique value, update our property with that value
                this._value = lFilter.properties[ 0 ].value;
                return;
            }
            lFilter.properties[ 0 ].value = lValue + "_" + i;
        }
        throw new Error( `Unable to generate a unique value for property '${ this.getMetaData().prompt }' (${ this.id })!` );
    }; // _setUniqueValue

    Property.prototype.disable = function() {
        this._isReadOnly = true;
    };

    Property.prototype.enable = function() {
        this._isReadOnly = false;
    };

    Property.prototype.isReadOnly = function() {
        return this._isReadOnly;
    };

    /*
     * todo documentation
     */
    function Component( pOptions ) {

        /*
         {
         component: <Component>,
         previousComponent: <Component>,
         isDetached: true/false, -- don't add component instance to component array. This is only used for history.
         typeId: <xxx>,
         parentId: <xxx>,
         values: <xxx>
         }
         */

        var lType,
            lNewComponent;

        //
        // Duplicate existing component
        //
        if ( pOptions.component instanceof Component ) {

            // Duplicate our existing component
            lNewComponent = $.extend( true, {}, pOptions.component );

            // Copy all the attributes of the new component to the this object
            for ( let i in lNewComponent ) {
                if ( hasOwnProperty( lNewComponent, i ) ) {
                    if ( i === "_properties" ) {
                        // Duplicate the properties and get new instances of them
                        this._properties = {};
                        for ( let lPropertyId in lNewComponent._properties ) {
                            if ( hasOwnProperty( lNewComponent._properties, lPropertyId ) ) {
                                this._properties[ lPropertyId ] = new Property( {
                                    component:    this,
                                    propertyId:   lNewComponent._properties[ lPropertyId ],
                                    isDuplicated: pOptions.isDuplicated
                                } );
                            }
                        }
                    } else {
                        // Just copy the component attribute
                        this[ i ] = lNewComponent[ i ];
                    }
                }
            }

            if ( pOptions.isDetached ) {
                return;
            }

            lType = gTypes[ this.typeId ];

            if ( lType.isOneToOneRelation ) {
                this.id = pOptions.parentId;
            } else {
                this.id = getNewComponentId();
            }
            this._status     = STATUS.CREATED;
            this.seq         = 0;
            this._isReadOnly = false;
            this._errors     = [];

        } else {

            lType = gTypes[ pOptions.typeId ];

            this.id          = "";
            this.parentId    = "";
            this._status     = STATUS.UNCHANGED;
            this.typeId      = pOptions.typeId;
            this.seq         = 0;
            this._isReadOnly = false;
            this._properties = {};
            this._errors     = [];

            //
            // If we call Component with the data from the server, we just want to get a Component instance.
            //
            if ( $.isPlainObject( pOptions.component ) ) {

                this.id       = pOptions.component.id;
                this.parentId = pOptions.component.parentId;
                this.pageId   = pOptions.component.pageId;
                this._lock    = pOptions.component.lock || false;
                this.workingCopyPageChanges = pOptions.component.workingCopyPageChanges;
                this.workingCopyPageLocks   = pOptions.component.workingCopyPageLocks;

                // Initialize properties set on server
                for ( let lPropertyId in pOptions.component.properties ) {
                    if ( hasOwnProperty( pOptions.component.properties, lPropertyId ) ) {
                        this._properties[ lPropertyId ] = new Property( {
                            component:  this,
                            propertyId: lPropertyId,
                            server:     pOptions.component.properties[ lPropertyId ]
                        } );

                        // Replicate the sequence into our dedicated "seq" attribute for faster sort operations
                        if ( lPropertyId === lType.seqPropertyId ) {
                            this.seq = parseInt( pOptions.component.properties[ lPropertyId ], 10 ); // todo do sequences contain decimal digits?
                        }
                    }
                }

                // Initialize all properties of that component type which are not included in the server communication because they where empty
                for ( let lPropertyId in lType.properties ) {
                    if ( hasOwnProperty( lType.properties, lPropertyId ) && !hasOwnProperty( this._properties, lPropertyId ) ) {
                        this._properties[ lPropertyId ] = new Property( {
                            component:  this,
                            propertyId: lPropertyId,
                            server:     ""
                        } );
                    }
                }

                // Some properties are depending on each other, remove all properties which are not valid in the current context
                this._cleanProperties();

                if ( pOptions.isDetached ) {
                    return;
                }

            } else {

                //
                // Create new component from scratch
                //
                if ( lType.isOneToOneRelation ) {
                    this.id = pOptions.parentId;
                } else {
                    this.id = getNewComponentId();
                }
                this._status = STATUS.CREATED;

                // Register the new component as component of the current page
                if ( lType.isPageComponent ) {
                    this.pageId = gCurrentPageId;
                }

                // Initialize all properties of that component type with their default values
                for ( let lPropertyId in lType.properties ) {
                    if ( hasOwnProperty( lType.properties, lPropertyId ) ) {
                        this._properties[ lPropertyId ] = new Property( {
                            component:  this,
                            propertyId: lPropertyId
                        } );
                    }
                }

                // Some properties are depending on each other, remove all properties which are not valid in the current context
                this._cleanProperties();
            }
        }

        // For new components which do not come from the server, perform some post processing
        if ( this._status === STATUS.CREATED ) {

            lType = gTypes[ this.typeId ];

            // Set parent if it has been specified
            if ( pOptions.parentId ) {
                this.parentId = pOptions.parentId;
                if ( lType.parentPropertyId ) {
                    this._properties[ lType.parentPropertyId ]._setValue( this.parentId, {
                        checkReadOnly: false,
                        // A duplicate copies a component as is and only fixes parent references to point to the new parent,
                        // no need to reset properties where the parent property is specified as "parent", because the child value
                        // will still be valid. For example "Button Position" specifies region as parent property and it normally
                        // gets defaulted to "BOX_BOTTOM" when the region property changes, because that's the only safe button
                        // position. But in case of a duplicate, the existing button position will also be available in the
                        // duplicated region (bug #27782465)
                        keepChildValues: ( pOptions.component instanceof Component )
                    } );
                }
            } else {
                // Default it to the current page/application
                if ( lType.parentId === COMP_TYPE.PAGE ) {
                    this.parentId = gCurrentPageId;
                } else if ( lType.parentId === COMP_TYPE.APPLICATION ) {
                    this.parentId = gCurrentAppId;
                }
            }

            // Mark all properties as changed. In addition
            // check unique properties and generate a new unique value by adding a postfix
            for ( let lPropertyId in this._properties ) {
                if ( hasOwnProperty( this._properties, lPropertyId ) ) {
                    // Is the property the unique identifier? In that case we have to generate a unique value
                    if ( hasOwnProperty( lType.properties[ lPropertyId ], "checkUniqueness" ) ) {
                        // call the function in the component context
                        this._properties[ lPropertyId ]._value = getUniquePropertyValue.call( this, this.parentId, this.typeId, lPropertyId, this._properties[ lPropertyId ]._value );
                    }
                }
            }

            // Initialize the grid properties for this new component
            this._setGridProperties();

            // Now it's time to set the property values the developer has specified
            this._setProperties( pOptions.values, { checkReadOnly: false, ignoreIfNotExists: pOptions.ignorePropertyIfNotExists } );

            // if the sequence hasn't been set by the caller, calculate it based on the previous component and the hierarchy
            // we are in
            if ( this.seq === 0 && lType.seqPropertyId ) {
                this._move( pOptions.previousComponent );
            }

            // Remember newly created component so that we are able to undo our operation
            addToTransaction( this, OPERATION.CREATE );

            // Call the "created" callback of the used plug-in and component type, but only for components created from
            // scratch (not duplicated). This will allow a plug-in/component type to create child components in the model
            // For duplicated components we just call the "changed" callback
            if ( !hasOwnProperty( pOptions, "component" ) ) {
                this._callPluginCallback( { action: CALLBACK_ACTION.CREATED } );
                this._callComponentTypeCallback( { action: CALLBACK_ACTION.CREATED } );
            } else {
                this._callPluginCallback( { properties: pOptions.values } );
                this._callComponentTypeCallback( { properties: pOptions.values } );
            }
        }

        // Store the new component in our component store
        gComponents[ this.typeId ][ this.id ] = this;

    } // Component


    /*
     * todo
     */
    Component.prototype._callPluginCallback = function( pOptions ) {

        var lType       = gTypes[ this.typeId ],
            lPluginType = lType.pluginType,
            lAction     = pOptions.action,
            lPlugin,
            lPluginDef,
            lComponents,
            lResult;

        if ( lPluginType ) {
            // If it's a validation callback, the plug-in type property isn't stored yet, used the passed value
            if ( pOptions.action === CALLBACK_ACTION.VALIDATE && pOptions.property.id === lPluginType.typePropertyId ) {
                lPlugin = lPluginType.plugins[ pOptions.value ];
            } else {
                lPlugin = lPluginType.plugins[ this._properties[ lPluginType.typePropertyId ]._value ];
            }

            if ( lPlugin ) {

                // if no action has been defined, find out if it's a CREATED or CHANGED action by looking at the
                // changed property/properties
                if ( lAction === undefined ) {
                    if ( pOptions.property && pOptions.property.id === lPluginType.typePropertyId ) {

                        lAction = CALLBACK_ACTION.CREATED;

                    } else if ( pOptions.properties ) {

                        for ( let i = 0; i < pOptions.properties.length; i++ ) {
                            if ( pOptions.properties[ i ].id === lPluginType.typePropertyId ) {
                                lAction = CALLBACK_ACTION.CREATED;
                                break;
                            }
                        }
                    }
                    // If action is still undefined, it has to be a changed callback
                    if ( lAction === undefined ) {
                        lAction = CALLBACK_ACTION.CHANGED;
                    }
                }

                // Always remove and re-create the region plug-in attributes if a region type plug-in changes
                if ( lType.id === COMP_TYPE.REGION && ( lAction === CALLBACK_ACTION.CREATED || lAction === CALLBACK_ACTION.REMOVED ) ) {

                    // Don't create the plug-in attributes for Classic Reports and Tabular Forms. They do have there own "Attributes" component
                    if ( lAction === CALLBACK_ACTION.CREATED && ![ "NATIVE_SQL_REPORT", "NATIVE_TABFORM" ].includes( lPlugin.name ) ) {

                        // Only add the "Attributes" node if the plug-in has custom or standard attributes or
                        // if it's a template component, a breadcrumb or a list which do have dedicated attributes
                        // in REGION PLUGIN ATTRIBUTES
                        lPluginDef = gTypes[ COMP_TYPE.REGION_PLUGIN_ATTR ].pluginType.plugins[ lPlugin.name ];

                        if (  lPluginDef.attributes.length > 0
                            || lPluginDef.features.includes( "FETCHED_ROWS" )
                            || lPluginDef.features.includes( "NO_DATA_FOUND_MESSAGE" )
                            || lPluginDef.features.includes( "NO_DATA_FOUND_ICON" )
                            || lPluginDef.features.includes( "COLUMN_HEADING" )
                            || lPluginDef.features.includes( "INIT_JAVASCRIPT_CODE" )
                            || lPluginDef.features.includes( "EDITABLE" )
                            || lPluginDef.features.includes( "LAZY_LOADING" )
                            || lPluginDef.features.includes( "LAZY_LOADING_ALWAYS" )
                            || lPlugin.name === "NATIVE_BREADCRUMB"
                            || lPlugin.name === "NATIVE_LIST"
                            // template components will create REGION_PLUGIN_ATTR in pe.callbacks / templateComponentPlugin
                           )
                        {
                            new Component( {
                                typeId:   COMP_TYPE.REGION_PLUGIN_ATTR,
                                parentId: this.id,
                                values:   [{
                                    id:    PROP.HIDDEN_REGION_TYPE,
                                    value: lPlugin.name
                                }, {
                                    id:    PROP.HIDDEN_SOURCE_LOCATION,
                                    value: this.getPropertyValue( PROP.SOURCE_LOCATION )
                                }]
                            } );
                        }

                    } else if ( lAction === CALLBACK_ACTION.REMOVED ) {

                        lComponents = this.getChilds( COMP_TYPE.REGION_PLUGIN_ATTR );
                        if ( lComponents.length === 1 ) {
                            lComponents[ 0 ].remove();
                        }

                    }
                }

                // Call the plug-in specific callback if one is defined
                if ( typeof lPlugin.callback === "function" ) {

                    if ( lAction === CALLBACK_ACTION.VALIDATE ) {
                        lResult = lPlugin.callback.apply( this, [ lAction, pOptions.property, pOptions.value, pOptions.sql ] );
                    } else if ( lAction === CALLBACK_ACTION.CREATED || lAction === CALLBACK_ACTION.REMOVED ) {
                        lPlugin.callback.apply( this, [ lAction ] );
                    } else if ( lAction === CALLBACK_ACTION.CHANGED && pOptions.property ) {
                        lPlugin.callback.apply( this, [ lAction, pOptions.property, pOptions.oldValue ] );
                    }

                    // If multiple properties have been changed, fire a "changed" callback for all non-plugin type properties
                    if ( pOptions.properties ) {
                        for ( let i = 0; i < pOptions.properties.length; i++ ) {
                            if ( pOptions.properties[ i ].id !== lPluginType.typePropertyId ) {
                                lPlugin.callback.apply( this, [
                                    CALLBACK_ACTION.CHANGED,
                                    this.getProperty( pOptions.properties[ i ].id ),
                                    pOptions.properties[ i ].oldValue
                                ] );
                            }
                        }
                    }
                }

            }
        }

        return lResult || {};

    }; // _callPluginCallback


    /*
     * todo
     */
    Component.prototype._callComponentTypeCallback = function( pOptions ) {

        var lResult;

        var lType = gTypes[ this.typeId ];

        if ( typeof lType.callback === "function" ) {
            if ( pOptions.action === CALLBACK_ACTION.VALIDATE ) {
                lResult = lType.callback.apply( this, [ pOptions.action, pOptions.property, pOptions.value, pOptions.sql ] );
            } else if ( pOptions.action === CALLBACK_ACTION.VALIDATE_COMPONENT && lType.actions.includes( CALLBACK_ACTION.VALIDATE_COMPONENT ) ) {
                lResult = lType.callback.apply( this, [ pOptions.action, pOptions.property, pOptions.value ] );
            } else if ( pOptions.action === CALLBACK_ACTION.INIT && lType.actions.includes( CALLBACK_ACTION.INIT ) ) {
                lType.callback.apply( this, [ pOptions.action ] );
            } else if ( pOptions.action === CALLBACK_ACTION.PARENT_UPDATE && lType.actions.includes( CALLBACK_ACTION.PARENT_UPDATE ) ) {
                lType.callback.apply( this, [ pOptions.action ] );
            } else if ( pOptions.action ) {
                lType.callback.apply( this, [ pOptions.action ] );
            } else if ( pOptions.property ) {
                lType.callback.apply( this, [ CALLBACK_ACTION.CHANGED, pOptions.property, pOptions.oldValue ] );
            } else if ( Array.isArray( pOptions.properties ) ) {
                for ( let i = 0; i < pOptions.properties.length; i++ ) {
                    lType.callback.apply( this, [
                        CALLBACK_ACTION.CHANGED,
                        this.getProperty( pOptions.properties[ i ].id ),
                        pOptions.properties[ i ].oldValue
                    ] );
                }
            }
        }

        return lResult || {};

    }; // _callComponentTypeCallback


    /*
     * todo
     */
    Component.prototype.isOnGlobalPage = function() {

        return ( this.pageId === gCurrentApp.globalPageId && this.pageId !== gCurrentPageId );

    }; // isOnGlobalPage


    /*
     * todo
     */
    Component.prototype.isReadOnly = function() {

        // Components of the global page are always read only if we are editing a different page
        return ( gIsPageReadOnly || this._isReadOnly || this.isOnGlobalPage() || gTypes[ this.typeId ].isSharedComponent );

    }; // isReadOnly


    /*
     * todo
     */
    Component.prototype.hasChanged = function() {

        return ( this._status !== STATUS.UNCHANGED );

    }; // hasChanged


    /*
     * todo
     */
    Component.prototype.hasErrors = function() {

        for ( let lPropertyId in this._properties ) {
            if ( hasOwnProperty( this._properties, lPropertyId ) ) {
                if ( this._properties[ lPropertyId ].errors.length > 0 ) {
                    return true;
                }
            }
        }
        return !!this._errors.length;

    }; // hasErrors


    /*
     * todo
     */
    Component.prototype.hasWarnings = function() {

        for ( let lPropertyId in this._properties ) {
            if ( hasOwnProperty( this._properties, lPropertyId ) ) {
                if ( this._properties[ lPropertyId ].warnings.length > 0 ) {
                    return true;
                }
            }
        }
        return false;

    }; // hasWarnings


    /*
     * todo
     */
    Component.prototype._setHasChanged = function( pOptions ) {

        var lSelf = this;

        pOptions = pOptions || {};

        // Update component
        if ( pOptions.status === STATUS.DELETED ) {
            lSelf._status = STATUS.DELETED;
        } else if ( lSelf._status === STATUS.UNCHANGED ) {
            lSelf._status = STATUS.UPDATED;
        }
        if ( pOptions.seq !== undefined ) {
            lSelf.seq = pOptions.seq;
        }
        if ( pOptions.parentId !== undefined ) {
            lSelf.parentId = pOptions.parentId;
        }

    }; // _setHasChanged


    /*
     * todo documentation
     */
    Component.prototype._deleteProperty = function( pPropertyId ) {

        var lTypePropertyDef = gTypes[ this.typeId ].properties[ pPropertyId ];

        delete this._properties[ pPropertyId ];

        for ( let i = 0; i < lTypePropertyDef.refByDependingOn.length; i++ ) {
            // Some properties do have a "soft check" where the dependency condition is ignored
            // in case the referenced property doesn't exist. We are not allowed to remove those properties
            // immediately
            if ( lTypePropertyDef.refByDependingOn[ i ].hasToExist ) {
                this._deleteProperty( lTypePropertyDef.refByDependingOn[ i ].propertyId );
            }
        }

    }; // _deleteProperty


    /*
     * todo documentation
     */
    Component.prototype._cleanProperties = function() {

        for ( var lKey in this._properties ) {
            if ( hasOwnProperty( this._properties, lKey ) ) {
                if ( !this._properties[ lKey ]._isVisible() ) {
                    this._deleteProperty( lKey );
                }
            }
        }

    }; // _cleanProperties


    Component.prototype._getGridParams = function() {

        let pageTemplate  = getPageTemplate(),
            regionId = "",
            regionGridParams,
            slotPlaceholder,
            result = {};

        function getRegionGridParams( pRegionId ) {

            var lRegion             = getComponents( COMP_TYPE.REGION, { id: pRegionId } )[ 0 ],
                regionGridParams   = $.extend( {}, lRegion._grid ),
                lColumnNo,
                lColumnSpanProperty,
                lColumnSpan;

            if ( regionGridParams.hasGridSupport && !pageTemplate.alwaysUseMaxColumns ) {

                lColumnNo           = lRegion._properties[ PROP.GRID_COLUMN ].getValue();
                lColumnSpanProperty = lRegion._properties[ PROP.GRID_COLUMN_SPAN ];

                if ( pageTemplate.grid.hasColumnSpan && lColumnSpanProperty ) {
                    lColumnSpan = lColumnSpanProperty.getValue();
                }

                if ( lColumnSpan > 0 ) {
                    // If the region has a column span then the child components can never use more columns than it's parent
                    regionGridParams.maxColumns = parseInt( lColumnSpan, 10 );
                    debug.trace( "_getGridParams: Region %O uses column span, reduce max columns to %i", lRegion, regionGridParams.maxColumns );
                } else if ( lColumnNo > 0 ) {
                    // If the region has an absolutely positioned column it will reduce the available grid columns for child components
                    regionGridParams.maxColumns -= ( parseInt( lColumnNo, 10 ) - 1 );
                    debug.trace( "_getGridParams: Region %O uses column positioning, reduce max columns to %i", lRegion, regionGridParams.maxColumns );
                }
            }

            return regionGridParams;
        } // getRegionGridParams

        let slot;

        if ( [ COMP_TYPE.REGION, COMP_TYPE.PAGE_ITEM, COMP_TYPE.BUTTON ].includes( this.typeId ) ) {

            slotPlaceholder = this._properties[ PROP.SLOT_PLACEHOLDER ]._value;

            if ( this.typeId === COMP_TYPE.REGION && this._properties[ PROP.PARENT_REGION ]._value !== "" ) {
                regionId = this._properties[ PROP.PARENT_REGION ]._value;
            }

            if ( [ COMP_TYPE.PAGE_ITEM, COMP_TYPE.BUTTON ].includes( this.typeId ) && this._properties[ PROP.REGION ]._value !== "" ) {
                regionId = this._properties[ PROP.REGION ]._value;
            }

            slot = getSlot( { regionId, slotPlaceholder, componentTypeId : this.typeId } );

        }

        // We haven't found a slot because the page template has been switched, assume it's a slot
        // with grid support and maximum available columns. This default is necessary to not clear any existing grid settings
        if ( slot === undefined ) {

            slot = {
                hasGridSupport:      true,
                hasRegionSupport:    true,
                hasItemSupport:      true,
                hasButtonSupport:    true,
                maxFixedGridColumns: pageTemplate.grid.maxColumns,
                isUnknown:           true
            };

            debug.warn( "_getGridParams: Component %O uses unknown slot %s! Fallback to default values", this, slotPlaceholder );

        } else if ( pageTemplate.grid.alwaysUseMaxColumns || slot.maxFixedGridColumns === undefined ) {

            slot.maxFixedGridColumns = pageTemplate.grid.maxColumns;

        }

        if ( slot.isUnknown ) {
            result.isUnknown = true;
        }

        if ( regionId ) {

            regionGridParams = getRegionGridParams( regionId );

            // If the top level page slot defines that there is no grid support, that will always overwrite any slot setting
            result.pageSlotHasGridSupport = regionGridParams.pageSlotHasGridSupport;
            result.hasGridSupport = ( regionGridParams.pageSlotHasGridSupport ) ? slot.hasGridSupport : false;
            result.hasRegionSupport = slot.hasRegionSupport;
            result.hasItemSupport = slot.hasItemSupport;
            result.hasButtonSupport = slot.hasButtonSupport;

            // The maximum columns for fixed grids is defined by the slot or the
            // parent container. But only if the grid template setting alwaysUseMaxColumns = false.
            //
            // When will alwaysUseMaxColumns = true be used for a fixed grid?
            // For example the Fluid Twitter Bootstrap needs that, because each grid container has 12 grid columns.
            // Not like normal fixed grids where we only have 12 grid columns for the whole page.
            if ( pageTemplate.grid.type === "FIXED" && !pageTemplate.grid.alwaysUseMaxColumns ) {

                // The defined maxColumns can be a positive absolute value or a negative value.
                // If it's negative it's used to reduce the number of fixed grid columns by the available columns in
                // the parent container but don't get below 0.
                // If it's positive absolute value we use the smaller value.
                if ( slot.maxFixedGridColumns < 0 ) {
                    result.maxColumns = Math.max( regionGridParams.maxColumns + slot.maxFixedGridColumns, 0 );
                } else if ( slot.maxFixedGridColumns > 0 ) {
                    result.maxColumns = Math.min( slot.maxFixedGridColumns, regionGridParams.maxColumns );
                } else {
                    result.maxColumns = regionGridParams.maxColumns;
                }

                // Do we have at least two columns to be able to use a grid?
                if ( result.maxColumns < 2 ) {
                    result.hasGridSupport = false;
                    debug.warn( "_getGridParams: Component %O, disable grid support because there are no more grid columns available!", this );
                }

            } else {
                result.maxColumns = pageTemplate.grid.maxColumns;
            }

        } else {

            result.pageSlotHasGridSupport = slot.hasGridSupport;
            result.hasGridSupport         = slot.hasGridSupport;
            result.hasRegionSupport       = slot.hasRegionSupport;
            result.hasItemSupport         = slot.hasItemSupport;
            result.hasButtonSupport       = slot.hasButtonSupport;

            if ( result.hasGridSupport ) {
                result.maxColumns = slot.maxFixedGridColumns;
            }
        }

        debug.trace( "_getGridParams: Component %O returned grid params %O", this, result );

        return result;

    }; // _getGridParams

    /*
     * todo documentation
     */
    Component.prototype._setGridProperties = function( pNoTransaction ) {

        var lSelf          = this,
            lPageTemplate  = getPageTemplate(),
            lFieldTemplate,
            lIsNewRow      = false,
            lIsNewColumn   = false,
            lShowItemProps = false;

        function createDeleteProperty( pPropertyId, pCreateOrDelete ) {

            if ( pCreateOrDelete ) {
                if ( !hasOwnProperty( lSelf._properties, pPropertyId ) ) {
                    lSelf._properties[ pPropertyId ] = new Property( {
                        component:  lSelf,
                        propertyId: pPropertyId
                    } );
                }

                // Page Item grid properties do have a plug-in dependency if they should be visible at all
                if ( !lSelf._properties[ pPropertyId ]._isVisible() ) {
                    lSelf._deleteProperty( pPropertyId );
                }

            } else {
                lSelf._deleteProperty( pPropertyId );
            }
        }

        function getValue( pPropertyId ) {
            var lProperty = lSelf._properties[ pPropertyId ];
            if ( lProperty ) {
                return lProperty.getValue();
            } else {
                return "";
            }
        }

        function setChildComponents( pTypeId, pPropertyId ) {
            var lComponents = getComponents( pTypeId, { properties: [{ id: pPropertyId, value: lSelf.id }]} );
            for ( let i = 0; i < lComponents.length; i++ ) {

                // Because we are touching a different component, we have to add it to our transaction
                if ( pNoTransaction === undefined && !lComponents[ i ].isOnGlobalPage() ) {
                    addToTransaction( lComponents[ i ], OPERATION.CHANGE );
                    lComponents[ i ]._setHasChanged();
                }
                lComponents[ i ]._setGridProperties( pNoTransaction );
            }
        }

        if ( [ COMP_TYPE.REGION, COMP_TYPE.PAGE_ITEM, COMP_TYPE.BUTTON ].includes( this.typeId ) ) {

            this._grid = this._getGridParams();

            if ( this._grid.hasGridSupport ) {

                createDeleteProperty( PROP.GRID_NEW_GRID, lPageTemplate.grid.hasNewGrid );
                createDeleteProperty( PROP.GRID_NEW_ROW,  ( !lPageTemplate.grid.hasNewGrid || getValue( PROP.GRID_NEW_GRID ) === "N" ) );

                lIsNewRow =
                    (  getValue( PROP.GRID_NEW_GRID   ) === "Y"
                    || getValue( PROP.GRID_NEW_ROW    ) === "Y"
                    );

                createDeleteProperty( PROP.GRID_ROW_CSS_CLASSES, ( lIsNewRow && lPageTemplate.grid.hasRowCssClasses ) );
                createDeleteProperty( PROP.GRID_COLUMN,          true );
                createDeleteProperty( PROP.GRID_NEW_COLUMN,      ( getValue( PROP.GRID_COLUMN ) === "" && getValue( PROP.GRID_NEW_ROW ) === "N" ) );

                lIsNewColumn =
                    (  getValue( PROP.GRID_NEW_GRID   ) === "Y"
                    || getValue( PROP.GRID_NEW_ROW    ) === "Y"
                    || getValue( PROP.GRID_COLUMN     ) !== ""
                    || getValue( PROP.GRID_NEW_COLUMN ) === "Y"
                    );

                createDeleteProperty( PROP.GRID_COLUMN_SPAN,        ( lIsNewColumn && lPageTemplate.grid.hasColumnSpan ) );
                createDeleteProperty( PROP.GRID_COLUMN_CSS_CLASSES, ( lIsNewColumn && lPageTemplate.grid.hasColumnCssClasses ) );
                createDeleteProperty( PROP.GRID_COLUMN_ATTRIBUTES,  ( lIsNewColumn && lPageTemplate.grid.hasColumnAttributes ) );

            } else {

                this._deleteProperty( PROP.GRID_NEW_GRID );
                this._deleteProperty( PROP.GRID_NEW_ROW );
                this._deleteProperty( PROP.GRID_ROW_CSS_CLASSES );
                this._deleteProperty( PROP.GRID_COLUMN );
                this._deleteProperty( PROP.GRID_NEW_COLUMN );
                this._deleteProperty( PROP.GRID_COLUMN_SPAN );
                this._deleteProperty( PROP.GRID_COLUMN_CSS_CLASSES );
                this._deleteProperty( PROP.GRID_COLUMN_ATTRIBUTES );

            }

            // Handle page item and button specific grid properties
            if ( this.typeId === COMP_TYPE.PAGE_ITEM || this.typeId === COMP_TYPE.BUTTON ) {
                lShowItemProps = ( this._grid.hasGridSupport && lIsNewColumn && lPageTemplate.grid.type === "TABLE" );
                createDeleteProperty( PROP.GRID_ROW_SPAN,           lShowItemProps );
                createDeleteProperty( PROP.ELEMENT_FIELD_ALIGNMENT, lShowItemProps );

                if ( this.typeId === COMP_TYPE.PAGE_ITEM ) {
                    createDeleteProperty( PROP.LABEL_ALIGNMENT,           lShowItemProps );
                    createDeleteProperty( PROP.READ_ONLY_HTML_ATTRIBUTES, ( lShowItemProps && lPageTemplate.grid.hasColumnAttributes ) );

                    lFieldTemplate = getFieldTemplate( getValue( PROP.FIELD_TEMPLATE ) );
                    createDeleteProperty( PROP.GRID_LABEL_COLUMN_SPAN, ( this._grid.hasGridSupport && lIsNewColumn && lFieldTemplate.hasLabelColumnSpan ) );

                }
            }

            // Update all child regions, page items and buttons
            if ( this.typeId === COMP_TYPE.REGION ) {
                setChildComponents( COMP_TYPE.REGION,    PROP.PARENT_REGION );
                setChildComponents( COMP_TYPE.PAGE_ITEM, PROP.REGION );
                setChildComponents( COMP_TYPE.BUTTON,    PROP.REGION );
            }
        }

    }; // _setGridProperties


    Component.prototype._setProperties = function( pValues, pOptions ) {

        var lProperty;

        pValues = pValues || [];

        // Set all property values in the order they have been specified
        // Note: The sequential processing is important in the case of dependencies!
        for ( let i = 0; i < pValues.length; i++ ) {

            // Perform several integrity checks before we do anything
            if ( !hasOwnProperty( gProperties, pValues[ i ].id ) ) {

                throw new Error( `Property ${ pValues[ i ].id } doesn't exist!` );
            } else if ( !hasOwnProperty( this._properties, pValues[ i ].id ) ) {
                if ( !pOptions.ignoreIfNotExists ) {
                    throw new Error( `Property '${ gProperties[ pValues[ i ].id ].prompt }' (${ pValues[ i ].id }) not available for this component!` );
                }
            } else {
                lProperty = this._properties[ pValues[ i ].id ];

                pValues[ i ].oldValue = lProperty._value;
                lProperty._setValue( pValues[ i ].value, pOptions );
            }
        }
    }; // _setProperties


    // Returns the property associated with the passed property id.
    // If pIds is an array of property ids, the first found property will be returned
    Component.prototype.getProperty = function( pIds ) {

        if ( Array.isArray( pIds ) ) {
            let property;

            for ( let i = 0; i < pIds.length; i++ ) {
                property = this._properties[ pIds[ i ] ];
                if ( property ) {
                    return property;
                }
            }
            return undefined;
        } else {
            return this._properties[ pIds ];
        }

    }; // getProperty


    Component.prototype.getProperties = function() {

        var lProperties = [];

        forEachAttribute( this._properties, function( i, pProperty ) {
            lProperties.push( pProperty );
        } );

        return lProperties;

    }; // getProperties


    // Returns the value of the first available property, if no property is found it will return "" without
    // raising an error
    Component.prototype.getPropertyValue = function( pIds ) {
        let property = this.getProperty( pIds );

        if ( property ) {
            return property.getValue();
        }

        return "";
    }; // getPropertyValue


    Component.prototype.duplicate = function( pValues ) {

        let lNewComponents = {};

        function _duplicate( pComponent, pValues, pParentId ) {

            let lType            = gTypes[ pComponent.typeId ],
                lChildComponents = [],
                lNewComponent;

            // Duplicate the existing component
            lNewComponent = new Component( {
                component:         pComponent,
                previousComponent: pComponent,
                values:            pValues,
                parentId:          ( pParentId || pComponent.parentId ),
                isDuplicated:      true
            } );

            // Remember the new component and the original component id, we need it later to fix references which
            // should point to the new component
            if ( !hasOwnProperty( lNewComponents, lNewComponent.typeId ) ) {
                lNewComponents[ lNewComponent.typeId ] = [];
            }
            lNewComponents[ lNewComponent.typeId ].push( {
                component:             lNewComponent,
                copiedFromComponentId: pComponent.id
            } );

            // Duplicate all child components
            // todo: we should also duplicate components like Validations, Dynamic Actions which are not directly children
            //       of the component, but look like they are if they only reference a single page item, region, ...
            for ( let i = 0; i < lType.childComponentTypes.length; i++ ) {
                // Don't copy saved IR/IG, because they are considered user data (bug #20108980)
                if ( lType.childComponentTypes[ i ] !== COMP_TYPE.IR_SAVED_REPORT && lType.childComponentTypes[ i ] !== COMP_TYPE.IG_SAVED_REPORT ) {

                    // pass nothing (undefined) for getComponents > 3rd param (for sorting), such that sequence is respected (bug #30377039)
                    lChildComponents = getComponents( lType.childComponentTypes[ i ], { parentId: pComponent.id } );
                    for ( let j = 0; j < lChildComponents.length; j++ ) {
                        _duplicate( lChildComponents[ j ], undefined, lNewComponent.id );
                    }
                }
            }
        } // _duplicate

        // After duplicating a component and it's sub components, some references still have to be changed to the newly
        // duplicated components. For example, an IG or IR column which reference a Column Group would still point to
        // the Column Group of the original IG or IR, but it should actually use the new Column Group of the
        // duplicated IG/IR.
        function _fixReferences() {
            let lTypeId,
                lRefPropertyDefs,
                lRefPropertyDef,
                lRefTypeId,
                i, j, k;

            for ( lTypeId in lNewComponents ) {
                if ( hasOwnProperty( lNewComponents, lTypeId ) ) {

                    // Get all properties which are referencing the component type
                    lRefPropertyDefs = gTypes[ lTypeId ].refByProperties;
                    for ( i = 0; i < lRefPropertyDefs.length; i++ ) {
                        lRefPropertyDef = gProperties[ lRefPropertyDefs[ i ]];

                        // Where is the property used? Only look at those component types which have actually been
                        // duplicated
                        for ( j = 0; j < lRefPropertyDef.refByComponentTypes.length; j++ ) {
                            lRefTypeId = lRefPropertyDef.refByComponentTypes[ j ];
                            if ( hasOwnProperty( lNewComponents, lRefTypeId ) ) {

                                // Now let's have a look if one of our components is referenced in a component of
                                // that referenced component type
                                for ( k = 0; k < lNewComponents[ lTypeId ].length; k++ ) {
                                    // Find all components ONLY WITHIN our newly created components where the
                                    // property value equals to original component id, those have to be changed
                                    lNewComponents[ lRefTypeId ].forEach( function ( pEntry ){
                                        if ( hasOwnProperty( pEntry.component._properties, lRefPropertyDef.id )
                                            && pEntry.component._properties[ lRefPropertyDef.id ]._value === lNewComponents[ lTypeId ][ k ].copiedFromComponentId ) {
                                            // Change the reference to the new component, we directly set the value because we don't want to fire
                                            // callbacks or re-initialize depending properties
                                            // todo: item name references should also be fixed (eg. Items to Submit)
                                            pEntry.component._properties[ lRefPropertyDef.id ]._value = lNewComponents[ lTypeId ][ k ].component.id;
                                        }
                                    } );
                                }
                            }
                        }
                    }
                }
            }
        } // _fixReferences

        // Perform several integrity checks before we do anything
        if ( this._status === STATUS.DELETED ) {
            throw new Error( "Component has been deleted!" );
        }

        _duplicate( this, pValues );
        _fixReferences();

        return lNewComponents[ this.typeId ][ 0 ].component;

    }; // duplicate


    Component.prototype.remove = function() {

        this._remove( false );

    }; // remove


    Component.prototype._remove = function( pChildDelete ) {

        var lType            = gTypes[ this.typeId ],
            lSelf            = this,
            lChildComponents = [],
            lRefComponents   = [],
            lPropertyDef,
            lTypePropertyDef,
            lFilter,
            lSearchValue,
            lItemName,
            lItemNameEscaped,
            lRefProperty,
            lComponentChecked = false,
            referenceErrorMessage = false,
            lPropertyType;

        function removeItem( pItemNameEscaped, pValue, pMultiValueDelimiter ) {
            var lItems  = pValue.split( pMultiValueDelimiter ),
                lRegExp = new RegExp( "^\\s*" + pItemNameEscaped + "\\s*$", "i" ), // ignore white spaces! (use double escaping for \s because of JS escaping)
                i;

            for ( i = 0; i < lItems.length; i++ ) {
                if ( lRegExp.test( lItems[ i ] ) ) {
                    lItems.splice( i, 1 );
                    break;
                }
            }
            return lItems.join( pMultiValueDelimiter );
        } // removePageItem

        // Perform several integrity checks before we do anything
        if ( this._status === STATUS.DELETED || this._deleteInProgress ) {
            return; // it has already been delete, no need to do it again
        } else if ( gIsPageReadOnly ) {
            throw new Error( "Page is read only!" );
        } else if ( this.isReadOnly() && ( this.typeId && !isSharedDesignerComponent( this.typeId ) ) ) {
            throw new Error( "Component is read only!" );
        }

        // Remember current state of component which is going to be modified so that we are able to undo our operation
        addToTransaction( this, OPERATION.DELETE );

        // set attribute that should prevent recursion (bug 33476120)
        this._deleteInProgress = true;

        // Delete all child components
        for ( let i = 0; i < lType.childComponentTypes.length; i++ ) {
            lChildComponents = getComponents( lType.childComponentTypes[ i ], { parentId: this.id }, false );
            for ( let j = 0; j < lChildComponents.length; j++ ) {
                lChildComponents[ j ]._remove( true );
            }
        }

        // Check all components which do reference the deleted component and process them based on their LOV delete configuration
        //   NULL    = set the relationship to NULL
        //   CASCADE = delete the component
        //   <null>  = raise an error

        // Build Options and Authorization use ! or - to negate it, we have to find those references as well
        if ( this.typeId === COMP_TYPE.BUILD_OPTION || this.typeId === COMP_TYPE.AUTHORIZATION ) {
            lSearchValue = new RegExp( "^[-!]?" + util.escapeRegExp( this.id ) + "$" );
        } else {
            lSearchValue = this.id;
        }
        if ( $.inArray( this.typeId, [ COMP_TYPE.PAGE_ITEM, COMP_TYPE.FACET, COMP_TYPE.FACET_GROUP_ITEM, COMP_TYPE.SFILTER, COMP_TYPE.SFILTER_GROUP_ITEM ]) !== -1 ) {
            lItemName        = this.getProperty( PROP.ITEM_NAME ).getValue();
            lItemNameEscaped = util.escapeRegExp( lItemName );
        }

        for ( let i = 0; i < lType.refByProperties.length; i++ ) {
            lPropertyDef = gProperties[ lType.refByProperties[ i ]];

            if ( lPropertyDef.lovType === "COMPONENT" ) {
                lFilter = { properties: [{ id: lPropertyDef.id, value: lSearchValue }]};
            } else if ( [ PROP_TYPE.ITEM, PROP_TYPE.FACET, PROP_TYPE.SESSION_STATE_VALUE ].includes( lPropertyDef.type ) ) {
                if ( lPropertyDef.multiValueDelimiter ) {
                    lFilter = { properties: [{ id: lPropertyDef.id, value: new RegExp( "(^|" + lPropertyDef.multiValueDelimiter + "|\\s)" + lItemNameEscaped + "($|" + lPropertyDef.multiValueDelimiter + "|\\s)", "i" ) }]};
                } else {
                    lFilter = { properties: [{ id: lPropertyDef.id, value: new RegExp( "^" + lItemNameEscaped + "$", "i" ) }]};
                }
            } else if ( lPropertyDef.type === PROP_TYPE.ORDER_BY_ITEM ) {
                lFilter = getOrderByItemFilter( lPropertyDef, lItemName );
            }

            lPropertyDef.refByComponentTypes.forEach( function ( refType ) {
                lPropertyType = gTypes[ refType ];

                // Only check the component type if it wasn't already checked as part of the child component types
                if ( ( lPropertyType.parentId !== lSelf.typeId && !lPropertyType.parentPropertyId ) || ( lPropertyType.parentPropertyId !== lPropertyDef.id ) ) {

                    lTypePropertyDef = lPropertyType.properties[ lPropertyDef.id ];
                    lRefComponents = getComponents( refType, lFilter, false );
                    for ( var k = 0; k < lRefComponents.length; k++ ) {
                        if ( lTypePropertyDef.referenceOnDelete === "WEAK_NULL" || lTypePropertyDef.referenceOnDelete === "DB_NULL" ) {
                            lRefProperty = lRefComponents[ k ].getProperty( lPropertyDef.id );
                            // can't update a read only component, would result in an error
                            if ( lRefComponents[ k ].isReadOnly() || lRefProperty.isReadOnly() ) {
                                continue;
                            }
                            if ( ( [ PROP_TYPE.ITEM, PROP_TYPE.FACET ].includes( lPropertyDef.type ) ) && lPropertyDef.multiValueDelimiter ) {
                                lRefProperty.setValue( removeItem( lItemNameEscaped, lRefProperty.getValue(), lPropertyDef.multiValueDelimiter ) );

                            } else if ( lPropertyDef.type === PROP_TYPE.ORDER_BY_ITEM ) {
                                setOrderByItemName( lRefProperty, "" );

                            } else {
                                lRefProperty.setValue( "" );
                            }

                        } else if ( lTypePropertyDef.referenceOnDelete === "WEAK_CASCADE" || lTypePropertyDef.referenceOnDelete === "DB_CASCADE" ) {

                            if ( ( [ PROP_TYPE.ITEM, PROP_TYPE.FACET ].includes( lPropertyDef.type ) ) && lPropertyDef.multiValueDelimiter ) {

                                // Remove our page item from the list, if nothing remains remove the component
                                lRefProperty = lRefComponents[ k ].getProperty( lPropertyDef.id );
                                lRefProperty.setValue( removeItem( lItemNameEscaped, lRefProperty.getValue(), lPropertyDef.multiValueDelimiter ) );
                                if ( lRefProperty.getValue() === "" ) {
                                    lRefComponents[ k ]._remove( true );
                                }

                            } else {
                                lRefComponents[ k ]._remove( true );
                            }

                        } else {
                            throw new Error( formatNoEscape( "DEL.REFERENCE_EXISTS", lRefComponents[ k ].getDisplayTitle() ) );
                        }
                    }

                    // check if the component is used anywhere else in the application, if:
                    // 1. no referenceOnDelete behavior is defined
                    // 2. the component to be deleted and the referencing component type are not in the same context
                    //  -> e.g. if both are pageComponents, there's no need to check it on the server, all the data is in the model already
                    // 3. the check was not done yet
                    if ( !lTypePropertyDef.referenceOnDelete
                    && ( ( lType.isPageComponent && !lPropertyType.isPageComponent ) || ( lType.isSharedDesignerComponent && !lPropertyType.isSharedDesignerComponent ) )
                    && !lComponentChecked ) {
                        lComponentChecked = true;
                        ajax (
                            "isComponentInUse", {
                                x01: gCurrentAppId,
                                x02: lSelf.typeId,
                                x03: lSelf.id,
                            }, {
                                success: function( pData ) {
                                    if ( pData.references?.length
                                        // does the reference has the type we are looking for?
                                        && pData.references.some( ref => ref.componentType?.toString() === lPropertyType.id?.toString() )
                                     ) {
                                        referenceErrorMessage = formatNoEscape( "SHARED_COMPONENT_REFERENCE", pData.references[ 0 ].componentName, pData.references[ 0 ].page );
                                    }
                                },
                                error: function() {
                                    debug.info( "Error while calling isComponentUse" );
                                },
                                async: false // this is by intention, because we need the result within the current transaction
                            } );
                    }

                    if ( referenceErrorMessage ) {
                        lSelf._deleteInProgress = false;
                        throw new Error( formatNoEscape( "DEL.REFERENCE_EXISTS", referenceErrorMessage ) );
                    }
                }
            } );
        }

        // 1) If the component did just exist in the client side model, we will immediately delete it as it would have never existed.
        // 2) If it's a cascading delete of children, we just remove it from the client side model, because the server side logic
        //    will automatically take care of it, no need to send deletes for children.
        // 3) If the deleted component was queried from the database and is not a children, we have to mark it for deletion
        //    to synchronize it back to the server.
        if ( this._status === STATUS.CREATED || pChildDelete ) {
            delete gComponents[ this.typeId ][ this.id ];
        } else {
            this._setHasChanged( { status: STATUS.DELETED } );
        }

        // cleanup temporary _deleteInProgress attribute
        delete this._deleteInProgress;

        // Call the "removed" callback of the used plug-in.
        // This will allow a plug-in to remove child components in the model.
        lSelf._callPluginCallback( { action: CALLBACK_ACTION.REMOVED } );

        // Call the "remove" callback of the component type.
        lSelf._callComponentTypeCallback( { action: CALLBACK_ACTION.REMOVED } );

    }; // _remove


    Component.prototype.move = function( { previousComponent, values } ) {
        // Perform several integrity checks before we do anything
        if ( this._status === STATUS.DELETED ) {
            throw new Error( "Component has already been deleted!" );
        } else if ( gIsPageReadOnly ) {
            throw new Error( "Page is read only!" );
        } else if ( this.isReadOnly() ) {
            throw new Error( "Component is read only!" );
        }

        // Remember current state of component which is going to be modified so that we are able to undo our operation
        addToTransaction( this, OPERATION.CHANGE );

        // update the parent/hierarchy properties first and then move the component to the new position
        this._setProperties( values );
        this._move( previousComponent );

        // Let a plug-in know about changed property values, this will allow to refresh child components
        // For example if the SQL statement changes, update the report columns
        this._callPluginCallback( { properties: values } );
        this._callComponentTypeCallback( { properties: values } );

    }; // move


    Component.prototype._move = function( pPreviousComponent ) {

        var INCREMENT_BY = 10;

        var lSeqPropertyId     = gTypes[ this.typeId ].seqPropertyId,
            lPreviousComponent = pPreviousComponent,
            lSiblings,
            lLastSeq,
            lUpdate = true,
            i;

        // Get all siblings and include our own component
        // Note: If _move is called from Component, the new component will not be returned by
        //       getSiblings, because it's not yet in our component store
        lSiblings = this.getSiblings( true );

        if ( lSiblings.length > 0 && lPreviousComponent ) {

            // If we have a previous component, let's first check if it's really a sibling
            if ( lPreviousComponent instanceof Component ) {

                // Let's find our starting sequence based on our previous component
                for ( i = 0; i < lSiblings.length; i++ ) {
                    if ( lSiblings[ i ].id === lPreviousComponent.id && lSiblings[ i ].typeId === lPreviousComponent.typeId ) {
                        this.seq = lPreviousComponent.seq + INCREMENT_BY;
                        lUpdate  = false;
                        break;
                    }
                }

            }

            // If previous component is "last" we want to move our component to the end,
            // we also fallback to the last component if a non existing previous component has been passed
            if ( lPreviousComponent === "last" || lUpdate ) {
                if ( lSiblings[ lSiblings.length - 1 ].id !== this.id ) {
                    lPreviousComponent = lSiblings[ lSiblings.length - 1 ];
                    this.seq = lPreviousComponent.seq + INCREMENT_BY;
                    lUpdate  = false;
                }
            }

        }

        // No previous component found or it was undefined, let's move the current component to the beginning
        if ( lUpdate ) {
            lPreviousComponent = undefined;
            this.seq           = INCREMENT_BY;
        }

        // Let's first update our current component
        lLastSeq = this.seq;
        this._properties[ lSeqPropertyId ]?._setValue( this.seq, { checkReadOnly: false } );

        // And then adjust the sequence of all siblings
        for ( i = 0; i < lSiblings.length; i++ ) {
            if ( lUpdate ) {
                // If it's a read-only component (i.e. from global page), we have to reset our sequence to start from that value
                // or if it does not have a sequence property
                if ( lSiblings[ i ].isReadOnly() || !lSiblings[ i ].getProperty( lSeqPropertyId ) ) {
                    lLastSeq = lSiblings[ i ].seq;
                } else {
                    // Increment the last sequence
                    lLastSeq += INCREMENT_BY;

                    // Only update component sequence if this component if not the "moved" component
                    if ( lSiblings[ i ].id !== this.id ) {
                        lSiblings[ i ].getProperty( lSeqPropertyId ).setValue( lLastSeq );
                    }
                }
            } else if ( lSiblings[ i ].id === lPreviousComponent.id ) {
                // Start incrementing sequences of components after the "moved" component
                lUpdate = true;
            }
        }

    }; // _move


    Component.prototype.getSiblings = function( pIncludeSelf ) {

        var lFilters = [],
            lSiblingsFilter,
            lFilterPropertyId,
            lSiblings;

        // Components which are displayed in a slot, have to fetch all components for that slot, not
        // just the component of the current type!
        if ( [ COMP_TYPE.REGION, COMP_TYPE.PAGE_ITEM, COMP_TYPE.BUTTON, COMP_TYPE.FACET, COMP_TYPE.FACET_GROUP, COMP_TYPE.SFILTER, COMP_TYPE.SFILTER_GROUP ].includes( this.typeId ) ) {

            if ( this.typeId === COMP_TYPE.FACET || this.typeId === COMP_TYPE.FACET_GROUP ) {
                lFilters.push( {
                    typeId: COMP_TYPE.FACET,
                    filter: {
                        parentId: this.parentId
                    }
                } );
                lFilters.push( {
                    typeId: COMP_TYPE.FACET_GROUP,
                    filter: {
                        parentId: this.parentId
                    }
                } );

            } else if ( this.typeId === COMP_TYPE.SFILTER || this.typeId === COMP_TYPE.SFILTER_GROUP ) {
                lFilters.push({
                    typeId: COMP_TYPE.SFILTER,
                    filter: {
                        parentId: this.parentId
                    }
                });
                lFilters.push({
                    typeId: COMP_TYPE.SFILTER_GROUP,
                    filter: {
                        parentId: this.parentId
                    }
                });

            } else {
                let parentRegionId = "";

                if ( this.typeId === COMP_TYPE.REGION ) {
                    parentRegionId = this._properties[PROP.PARENT_REGION]._value;
                } else if ( this.typeId === COMP_TYPE.PAGE_ITEM ) {
                    parentRegionId = this._properties[PROP.REGION]._value;
                } else if ( this.typeId === COMP_TYPE.BUTTON ) {
                    parentRegionId = this._properties[PROP.REGION]._value;
                }

                lFilters.push( {
                    typeId: COMP_TYPE.REGION,
                    filter: {
                        properties: [ {
                            id:    PROP.PARENT_REGION,
                            value: parentRegionId
                        }, {
                            id:    PROP.SLOT_PLACEHOLDER,
                            value: this._properties[PROP.SLOT_PLACEHOLDER]._value
                        } ]
                    }
                } );

                lFilters.push( {
                    typeId: COMP_TYPE.PAGE_ITEM,
                    filter: {
                        properties: [ {
                            id:    PROP.REGION,
                            value: parentRegionId
                        }, {
                            id:    PROP.SLOT_PLACEHOLDER,
                            value: this._properties[PROP.SLOT_PLACEHOLDER]._value
                        } ]
                    }
                } );

                lFilters.push( {
                    typeId: COMP_TYPE.BUTTON,
                    filter: {
                        properties: [ {
                            id:    PROP.REGION,
                            value: parentRegionId
                        }, {
                            id:    PROP.SLOT_PLACEHOLDER,
                            value: this._properties[PROP.SLOT_PLACEHOLDER]._value
                        } ]
                    }
                } );
            }

            // Recalculate the sequence of the siblings which are located after the new component
            lSiblings = getComponentsAdvanced( lFilters );

        } else {

            // All components which are not displayed in a slot
            lSiblingsFilter = {
                parentId:   this.parentId,
                properties: []
            };

            if ( this.typeId === COMP_TYPE.PAGE_COMPUTATION || this.typeId === COMP_TYPE.APP_COMPUTATION ) {
                lFilterPropertyId = PROP.COMPUTATION_POINT;
            } else if ( this.typeId === COMP_TYPE.APP_PROCESS ) {
                lFilterPropertyId = PROP.PROCESS_POINT;
            } else if ( this.typeId === COMP_TYPE.PAGE_PROCESS ) {
                //
                // if the process is child of an execution chain, we look for siblings within there.
                //
                if ( this.getProperty( PROP.PARENT_PROCESS ) && this.getProperty( PROP.PARENT_PROCESS ).getValue() !== "" ) {
                    lFilterPropertyId = PROP.PARENT_PROCESS;
                //
                // otherwise (page level processes), look for siblings by process point
                //
                } else {
                    lFilterPropertyId = PROP.PROCESS_POINT;
                }
            } else if ( this.typeId === COMP_TYPE.BRANCH ) {
                lFilterPropertyId = PROP.BRANCH_POINT;
            } else if ( this.typeId === COMP_TYPE.DA_ACTION ) {
                lFilterPropertyId = PROP.FIRE_WHEN_EVENT_RESULT_IS;
            }

            if ( lFilterPropertyId ) {
                lSiblingsFilter.properties.push( {
                    id:    lFilterPropertyId,
                    value: this._properties[ lFilterPropertyId ]._value
                } );
            }

            // Recalculate the sequence of the siblings which are located after the new component
            lSiblings = getComponents( this.typeId, lSiblingsFilter );

        }

        if ( !pIncludeSelf ) {
            for ( let i = 0; i < lSiblings.length; i++ ) {
                if ( lSiblings[ i ].id === this.id ) {
                    lSiblings.splice( i, 1 );
                    break;
                }
            }
        }

        return lSiblings;

    }; // getSiblings

    /**
     * return the direct parent component, or if typeId is provided, the first ancestor of that type
     *
     * @param {string} typeId component type id
     * @returns {object} model component
     */
    Component.prototype.getParent = function( typeId ) {
        if ( !typeId ) {
            if ( this.parentId ) {
                return getComponents( gTypes[ this.typeId ].parentId, { id: this.parentId }, false )[ 0 ];
            } else {
                return undefined;
            }
        } else {
            let component = this;
            while ( component && component.typeId !== typeId ) {
                component = component.getParent();
            }
            return component;
        }
    }; // getParent

    Component.prototype.getAllChildren = function() {
        let result = [];
        this._getAllChildrenTypes().forEach( componentType => {
            result.push( ...this.getChildrenUntil( componentType ) );
        } );
        return result;
    }; // getAllChildren

    Component.prototype._getAllChildrenTypes = function() {
        let childTypes = [];
        function getChildTypes( id ){
            let types = gTypes[ id ].childComponentTypes;

            if ( types.length ) {
                childTypes.push( ...types );
                types.forEach( getChildTypes );
            }
        }
        getChildTypes( this.typeId );
        return childTypes;
    }; //  _getAllChildrenTypes

    Component.prototype.getChilds = function( pTypeId, pFilter, pSort ) {

        var lFilter = $.extend( true, {}, pFilter );

        // Return all child components of the specified type
        lFilter.parentId = this.id;
        return getComponents( pTypeId, lFilter, pSort );

    }; // getChilds


    Component.prototype.getChildrenUntil = function( pTypeId, pFilter, pSort ) {

        var lSelf   = this,
            lFilter = $.extend( true, {}, pFilter ),
            lComponents,
            lAllComponents = [];

        function getNextChildTypeId ( pTypeId ) {
            if ( gTypes[ pTypeId ].parentId === null ) {
                throw new Error( `Component Type Id ${ pTypeId } is not a child type of component type id ${ lSelf.typeId }` );
            } else if ( gTypes[ pTypeId ].parentId === lSelf.typeId ) {
                return pTypeId;
            } else {
                return getNextChildTypeId( gTypes[ pTypeId ].parentId );
            }
        }

        // Return all child components of the specified type
        lFilter.parentId = lSelf.id;

        // Is the requested type a direct child of the parent?
        if ( gTypes[ pTypeId ].parentId === lSelf.typeId ) {

            return getComponents( pTypeId, lFilter, pSort );

        } else {

            // If not, get the children which get us closer to that type
            lComponents = getComponents( getNextChildTypeId( pTypeId ), lFilter, pSort );
            for ( let i = 0; i < lComponents.length; i++ ) {
                lAllComponents = lAllComponents.concat( lComponents[ i ].getChildrenUntil( pTypeId, lFilter, pSort ) );
            }
            return lAllComponents;
        }

    }; // getChildrenUntil


    Component.prototype.getDisplayTitle = function() {

        let displayProperty = getDisplayProperty( this );

        if ( displayProperty ) {
            return formatPostfix( "POSTFIX.GLOBAL_PAGE", displayProperty.getDisplayValue(), this.isOnGlobalPage() );
        } else {
            return "";
        }

    }; // getDisplayTitle


    Component.prototype.setDisplayTitle = function( pTitle ) {

        let displayProperty = getDisplayProperty( this );

        return displayProperty.setValue( pTitle );

    }; // setDisplayTitle


    Component.prototype._copyToGlobal = function() {

        var lSelf = this,
            lComponent = gComponents[ this.typeId ][ this.id ];

        // Note: Because someone (ie. Property Editor) could store a reference to the component
        //       we should restore just the attributes of it, otherwise it would be a new object
        //       and everybody who holds a reference would point to a different object.
        forEachAttribute( lSelf, function( pAttributeName ) {
            if ( pAttributeName === "_properties" ) {
                // Duplicate the properties and get new instances of them
                lComponent._properties = {};
                forEachAttribute( lSelf._properties, function( pPropertyId, pProperty ) {
                    lComponent._properties[ pPropertyId ] = new Property( {
                        component:  lComponent,
                        propertyId: pProperty
                    } );
                } );
            } else {
                // we also have to copy the readOnly state and apply it on the child components too
                if ( pAttributeName === "_isReadOnly" ) {
                    let isReadOnly = lSelf.isReadOnly();
                    lSelf.getAllChildren().forEach( component => isReadOnly ? component.disable() : component.enable()  );
                }
                // Just copy the component attribute
                lComponent[ pAttributeName ] = lSelf[ pAttributeName ];
            }
        } );
    };

    Component.prototype.disable = function() {
        this._isReadOnly = true;
    };

    Component.prototype.enable = function() {
        this._isReadOnly = false;
    };

    function setPageGridProperties( pNoTransaction ) {

        function setGridProperties( pTypeId, pPropertyId ) {

            var lComponents = getComponents( pTypeId, { properties: [{ id: pPropertyId, value: "" }]}, false );
            for ( let i = 0; i < lComponents.length; i++ ) {

                // Because we are touching a different component, we have to add it to our transaction
                if ( pNoTransaction === undefined && !lComponents[ i ].isOnGlobalPage() ) {
                    addToTransaction( lComponents[ i ], OPERATION.CHANGE );
                }
                lComponents[ i ]._setGridProperties( pNoTransaction );
            }
        }

        // Get all regions which are not sub regions
        setGridProperties( COMP_TYPE.REGION, PROP.PARENT_REGION );

        // Get all page items which are not associated to a region
        setGridProperties( COMP_TYPE.PAGE_ITEM, PROP.REGION );

        // Get all buttons which are not associated to a region
        setGridProperties( COMP_TYPE.BUTTON, PROP.REGION );
    } // setPageGridProperties

    /*
     * todo documentation
     */
    function getComponents( pTypeId, pFilter, pSort ) {

        var lIsPageComponent = gTypes[ pTypeId ].isPageComponent,
            lComponents = [],
            lComponent,
            lFound;
        pFilter = pFilter || {};

        for ( var lId in gComponents[ pTypeId ] ) {
            if ( hasOwnProperty( gComponents[ pTypeId ], lId ) ) {

                lComponent = gComponents[ pTypeId ][ lId ];

                // Don't include deleted components
                if ( lComponent._status === STATUS.DELETED ) {
                    continue;
                }

                // If an id has been specified, check if it matches with the component id
                // Note: Make sure that pFilter.id is a string!
                if ( hasOwnProperty( pFilter, "id" ) && pFilter.id !== undefined && lId !== pFilter.id + "" ) {
                    continue;
                }

                // If a parent has been specified, check if it matches with the components parent
                // Note: Make sure that pFilter.parentId is a string!
                if ( hasOwnProperty( pFilter, "parentId" ) && pFilter.parentId !== undefined && lComponent.parentId !== pFilter.parentId + "" ) {
                    continue;
                }

                if ( hasOwnProperty( pFilter, "pageId" ) && pFilter.pageId !== undefined ) {
                    if ( lComponent.pageId !== pFilter.pageId ) {
                        continue;
                    }
                } else {
                    if ( lIsPageComponent && lComponent.pageId !== gCurrentPageId && !( !pFilter.excludeGlobalPage && lComponent.isOnGlobalPage() ) && !isSharedDesignerComponent( pTypeId ) ) {
                        continue;
                    }
                }
                if ( hasOwnProperty( pFilter, "hasChanged" ) && pFilter.hasChanged !== undefined && lComponent.hasChanged() !== pFilter.hasChanged ) {
                    continue;
                }

                if ( hasOwnProperty( pFilter, "hasErrors" ) && pFilter.hasErrors !== undefined && lComponent.hasErrors() !== pFilter.hasErrors ) {
                    continue;
                }

                if ( hasOwnProperty( pFilter, "hasWarnings" ) && pFilter.hasWarnings !== undefined && lComponent.hasWarnings() !== pFilter.hasWarnings ) {
                    continue;
                }

                // If we are still in the game, compare all filters with the property values of the currently processed component
                if ( pFilter.properties && pFilter.properties.length > 0 ) {
                    lFound = false;
                    for ( let i = 0; i < pFilter.properties.length; i++ ) {
                        // Check if all filters match for the current component, if not we are done with this component and don't have to check
                        // other filter values
                        lFound = false;
                        if ( hasOwnProperty( lComponent._properties, pFilter.properties[ i ].id ) ) {
                            if ( pFilter.properties[ i ].value instanceof RegExp ) {
                                // Use match instead of test, because the regular expression could contain the global modifier.
                                // See http://stackoverflow.com/questions/1520800/why-regexp-with-global-flag-in-javascript-give-wrong-results
                                lFound = !!lComponent._properties[ pFilter.properties[ i ].id ]._value.match( pFilter.properties[ i ].value );
                            } else {
                                lFound = ( lComponent._properties[ pFilter.properties[ i ].id ]._value === pFilter.properties[ i ].value );
                            }
                        }
                        if ( !lFound ) {
                            break;
                        }
                    }
                    if ( !lFound ) {
                        continue;
                    }
                }

                // Filter components with a filter function which gets the currently processed component as "this"
                if ( typeof pFilter.filterFunction === "function" ) {
                    if ( !pFilter.filterFunction.apply( lComponent ) ) {
                        continue;
                    }
                }

                // Add the component to our result set if all checks passed
                lComponents.push( lComponent );
            }
        }

        if ( pSort === true || pSort === undefined ) {

            if ( gTypes[ pTypeId ].seqPropertyId ) {
                // Sort result based on sequence and if they are equal, use id as second sort option
                lComponents.sort( function( a, b ) {
                    if ( a.seq === b.seq ) {
                        return ( String( a.id ).padStart( 36, '0' ) > String( b.id ).padStart( 36, '0' ) ) ? 1 : -1;
                    } else {
                        return a.seq - b.seq;
                    }
                } );
            } else {
                // No sequence available, order by display title of the component
                lComponents.sort( function( a, b ) {
                    return a.getDisplayTitle().localeCompare( b.getDisplayTitle() );
                } );
            }
        } else if ( typeof pSort === "function" ) {
            lComponents.sort( pSort );
        }

        return lComponents;

    } // getComponents


    function getComponentsAdvanced( pFilters, pSort ) {

        var lComponents = [];

        for ( let i = 0; i < pFilters.length; i++ ) {
            lComponents = lComponents.concat( getComponents( pFilters[ i ].typeId, pFilters[ i ].filter, false ) );
        }

        if ( pSort === true || pSort === undefined ) {

            lComponents.sort( function( a, b ) {

                if ( gTypes[ a.typeId ].seqPropertyId && gTypes[ b.typeId ].seqPropertyId ) {
                    // Sort result based on sequence and if they are equal, use id as second sort option
                    if ( a.seq === b.seq ) {
                        return ( String( a.id ).padStart( 36, '0' ) > String( b.id ).padStart( 36, '0' ) ) ? 1 : -1;
                    } else {
                        return a.seq - b.seq;
                    }
                } else {
                    // No sequence available, order by display title of the component
                    return a.getDisplayTitle().localeCompare( b.getDisplayTitle() );
                }
            } );
        } else if ( typeof pSort === "function" ) {
            lComponents.sort( pSort );
        }

        return lComponents;

    } // getComponentsAdvanced


    /*
     * todo documentation
     */
    function fullTextSearch( pText, pSource ) {

        var lProperty,
            lText,
            lHits = [];

        // If it's not already a regular expression, create a case insensitive regular expression with the passed text
        if ( pText instanceof RegExp ) {
            lText = pText;
        } else if ( pText !== "" && pText !== undefined ) {
            lText = new RegExp( util.escapeRegExp( pText ), "i" );
        } else {
            return [];
        }


        if ( hasOwnProperty( pSource, "typeId" ) ) {

            forEachAttribute( gComponents[ pSource.typeId ], function( pId, pComponent ) {

                // todo Do we only want to include components of the current page or from the global page as well

                // Don't include deleted components
                if ( pComponent._status !== STATUS.DELETED ) {
                    // Check if one of the properties of the current component contains the search string and if yes,
                    // add that property to our result
                    forEachAttribute( pComponent._properties, function( pPropertyId, pProperty ) {
                        if ( gProperties[ pPropertyId ].isSearchable ) {
                            // Use match instead of test, because the regular expression could contain the global modifier.
                            // See http://stackoverflow.com/questions/1520800/why-regexp-with-global-flag-in-javascript-give-wrong-results
                            if ( pProperty._value.match( lText ) ) {
                                lHits.push( pProperty );
                            }
                        }
                    } );
                }
            } );

        } else if ( hasOwnProperty( pSource, "properties" ) ) {

            // Check if one of the properties of the passed properties contains the search string and if yes,
            // add that property to our result
            for ( let i = 0; i < pSource.properties.length; i++ ) {
                lProperty = pSource.properties[ i ];
                if ( gProperties[ lProperty.id ].isSearchable ) {
                    // Use match instead of test, because the regular expression could contain the global modifier.
                    // See http://stackoverflow.com/questions/1520800/why-regexp-with-global-flag-in-javascript-give-wrong-results
                    if ( lProperty._value.match( lText ) ) {
                        lHits.push( lProperty );
                    }
                }
            }

        }


        // Sort result by component title and property display sequence
        lHits.sort( function( a, b ) {

            var aTitle = a.component.getDisplayTitle(),
                bTitle = b.component.getDisplayTitle();

            if ( aTitle === bTitle ) {
                return gTypes[ a.component.typeId ].properties[ a.id ].displaySeq - gTypes[ b.component.typeId ].properties[ b.id ].displaySeq;
            } else {
                return aTitle.localeCompare( bTitle );
            }

        } );

        return lHits;

    } // fullTextSearch


    /*
     * todo documentation
     */
    function displayTitleSearch( pText, pComponentTypeId ) {

        var lText,
            lHits = [];

        // If it's not already a regular expression, create a case insensitive regular expression with the passed text
        if ( pText instanceof RegExp ) {
            lText = pText;
        } else if ( pText !== "" && pText !== undefined ) {
            lText = new RegExp( util.escapeRegExp( pText ), "i" );
        } else {
            return [];
        }

        forEachAttribute( gComponents[ pComponentTypeId ], function( pId, pComponent ) {

            // todo Do we only want to include components of the current page or from the global page as well

            // Don't include deleted components
            if ( pComponent._status !== STATUS.DELETED ) {
                // Use match instead of test, because the regular expression could contain the global modifier.
                // See http://stackoverflow.com/questions/1520800/why-regexp-with-global-flag-in-javascript-give-wrong-results
                if ( pComponent.getDisplayTitle().match( lText ) ) {
                    lHits.push( pComponent );
                }
            }
        } );

        // Sort result by component title
        lHits.sort( function( a, b ) {
            var aTitle = a.getDisplayTitle(),
                bTitle = b.getDisplayTitle();
            return aTitle.localeCompare( bTitle );
        } );

        return lHits;

    } // displayTitleSearch

    function getItemsLov( pFilters, pCallback ) {


        var lComponent,
            lComponents,
            lLovValues = [];

        if ( pFilters.type === "application" ) {

            lComponents = getComponents( COMP_TYPE.APP_ITEM );
            for ( let i = 0; i < lComponents.length; i++ ) {
                lLovValues.push( {
                    name: lComponents[ i ].getProperty( PROP.ITEM_NAME ).getValue()
                } );
            }

        } else if ( pFilters.type === "page" ) {

            if ( pFilters.pageId === gCurrentPageId || pFilters.pageId === gCurrentApp.globalPageId ) {

                lComponents = getComponents( COMP_TYPE.PAGE_ITEM, { pageId: pFilters.pageId } );
                lLovValues  = convertComponentsToLovValues( lComponents, PROP.ITEM_LABEL, PROP.ITEM_NAME );

            } else {

                // substitution strings cannot be used at design time
                // only requesting items from the server for valid page numbers
                // (bug #22859957)
                if ( !isNaN( pFilters.pageId ) ) {
                    ajax (
                        "getPageItems", {
                            x01: pFilters.pageId
                        }, {
                            success: function( pData ) {
                                for ( var lItemName in pData ) {
                                    if ( hasOwnProperty( pData, lItemName ) ) {
                                        lLovValues.push( {
                                            name:  lItemName,
                                            label: pData[ lItemName ]
                                        } );
                                    }
                                }
                                lLovValues.sort( function( a, b ) {
                                    return a.name.localeCompare( b.name );
                                } );
                                pCallback( lLovValues );
                            }
                        }
                    );
                } else {
                    pCallback ( lLovValues );
                }
                return;
            }

        } else if ( pFilters.type === "facet" ) {

            lComponents = getComponents(
                              pFilters.component.typeId, {
                                  pageId: gCurrentPageId,
                                  filterFunction: function() {
                                      return ( !pFilters.component || pFilters.component.id !== this.id );
                                  }
                              });
            lLovValues  = convertComponentsToLovValues( lComponents, PROP.ITEM_LABEL, PROP.ITEM_NAME );

        } else if ( pFilters.type === "columns" ) {

            lComponent = pFilters.component;

            if ( [
                COMP_TYPE.CARD,
                COMP_TYPE.REGION_PLUGIN_ATTR,
                COMP_TYPE.REGION_COLUMN,
                COMP_TYPE.REGION_ACTION,
                COMP_TYPE.IR_ATTRIBUTES,
                COMP_TYPE.IG_ATTRIBUTES,
                COMP_TYPE.CLASSIC_REPORT,
                COMP_TYPE.CLASSIC_RPT_COLUMN,
                COMP_TYPE.TABULAR_FORM,
                COMP_TYPE.TAB_FORM_COLUMN ].includes( lComponent.typeId ) )
            {

                lLovValues = getRegionColumns( lComponent.parentId );

            } else if ( lComponent.typeId === COMP_TYPE.CARD_ACTION ) {

                lLovValues = getRegionColumns( lComponent.getParent().parentId, true );

            } else if ( lComponent.typeId === COMP_TYPE.REGION_ACTION_MENU_ENTRY ) {

                lLovValues = getRegionColumns( lComponent.getParent().parentId );

            } else if ( lComponent.typeId === COMP_TYPE.IR_COLUMN ) {

                lLovValues = getRegionColumns( lComponent.getParent().parentId );

            } else if ( lComponent.typeId === COMP_TYPE.IR_COLUMN_ACTION ) {

                lLovValues = getRegionColumns( lComponent.getParent().getParent().parentId );

            } else if ( lComponent.typeId === COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ) {

                lLovValues = getRegionColumns( lComponent.getParent().getParent().getParent().parentId );

            } else if ( lComponent.typeId === COMP_TYPE.IG_COLUMN ) {

                lLovValues = getRegionColumns( lComponent.parentId );

            } else if ( lComponent.typeId === COMP_TYPE.VALIDATION ) {

                lLovValues = getRegionColumns( lComponent.getProperty( PROP.VALIDATION_REGION ).getValue() );

            } else if ( lComponent.typeId === COMP_TYPE.PAGE_PROCESS ) {

                lLovValues = getRegionColumns( lComponent.getProperty( PROP.PROCESS_REGION ).getValue() );

            } else if ( $.inArray( lComponent.typeId, [
                           COMP_TYPE.JET_CHART_SERIES,
                           COMP_TYPE.MAP_LAYER  ] ) !== -1 )
            {
                if ( lComponent._properties[ PROP.CHILD_SOURCE_LOCATION ].getValue() === "REGION_SOURCE" ) {
                    lLovValues = getRegionSqlColumns( lComponent.getParent().parentId, true );
                } else {
                    lLovValues = getSqlColumnLovValues( lComponent, SOURCE_LOCATION_PROPS, true );
                }
            }
        }

        if ( pCallback ) {
            pCallback( lLovValues );
        } else {
            return lLovValues;
        }

    } // getItemsLov


    function getPagesLov( pFilters, pCallback, pIncludeGlobal, pIncludePatterns ) {

        ajax (
            "getPages", {
                x01: ( pIncludeGlobal ) ? "Y" : "N",
                x02: ( pFilters.show ? pFilters.show : "" ),
                x03: ( pFilters.id ? pFilters.id : "" ),
                x04: ( pIncludePatterns ) ? "Y" : "N"
            }, {
                success: pCallback
            }
        );

    } // getPagesLov

    function getWorkflowLov( pFilters, pCallback ) {
        let lComponents, lLovValues = [];

        if ( pFilters.type === "wf_params" ) {
            lComponents = getComponents( COMP_TYPE.WORKFLOW_PARAM, { parentId: pFilters.componentId } );
            lComponents.forEach( ( component ) => {
                lLovValues.push( {
                    name: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                    label: component.getProperty( PROP.ITEM_LABEL ).getValue(),
                    r: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                } );
            } );
        } else if ( pFilters.type === "vs_vars" ) {
            lComponents = getComponents( COMP_TYPE.WORKFLOW_VARIABLE, { parentId: pFilters.componentId } );
            lComponents.forEach( ( component ) => {
                lLovValues.push( {
                    name: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                    label: component.getProperty( PROP.ITEM_LABEL ).getValue(),
                    r: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                } );
            } );
        } else if ( pFilters.type === "act_vars" ) {
            lComponents = getComponents( COMP_TYPE.WORKFLOW_ACT_VAR, { parentId: pFilters.componentId } );
            lComponents.forEach( ( component ) => {
                lLovValues.push( {
                    name: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                    label: component.getProperty( PROP.ITEM_LABEL ).getValue(),
                    r: component.getProperty( PROP.WF_IDENTIFICATION_STATIC_ID ).getValue(),
                } );
            } );
        }

        if ( pCallback ) {
            pCallback( lLovValues );
        } else {
            return lLovValues;
        }
    } // getWorkflowLov

    function getEmailPlaceholders( pId/* , pCallback */ ) {

        let lPlaceholders;

        ajax (
            "getEmailPlaceholders", {
                x01: pId
            }, {
                success: function( pData ) {
                        lPlaceholders = pData.placeholders;
                },
                async: false // this is by intention, because we need the result within the current transaction
            }
        );

        return lPlaceholders;

    } // getEmailPlaceholders


    /*
     * Transaction handling
     * todo documentation
     */
    var OPERATION = {
        CREATE: "create",
        DELETE: "delete",
        CHANGE: "change"
    };
    var gCurrentTransaction = null; // holds current transaction or null if none

    function checkPending() {
        if ( !gCurrentTransaction ) {
            throw new Error( "Start a Transaction first!" );
        }
    }

    function checkFinished() {
        if ( gCurrentTransaction ) {
            throw new Error( "Finish pending Transaction first!" );
        }
    }

    /**
     * Adds the given component to the transaction log.
     * @param {pComponent} Component to be stored.
     * @param {pOperation} Operation which is performed for the specified component
     */
    function addToTransaction( pComponent, pOperation ) {

        var lComponents;

        checkPending();

        lComponents = gCurrentTransaction.components;

        // Store old component in our transaction history, but only if it isn't already stored
        if ( hasOwnProperty( lComponents, pComponent.typeId ) && hasOwnProperty( lComponents[ pComponent.typeId ], pComponent.id ) ) {
            // Component is already in history buffer
            if ( pOperation === OPERATION.DELETE ) {
                // If the component is deleted and it has been created in the same transaction,
                // remove it from our transaction, because we don't want to restore it in an undo
                if ( lComponents[ pComponent.typeId ][ pComponent.id ].operation === OPERATION.CREATE ) {
                    delete lComponents[ pComponent.typeId ][ pComponent.id ];
                } else {
                    // If we have done a modification in the same transaction and do now delete the component,
                    // that's the operation we actually want to remember for an undo
                    lComponents[ pComponent.typeId ][ pComponent.id ].operation = pOperation;
                }
            }
        } else {
            if ( !hasOwnProperty( lComponents, pComponent.typeId ) ) {
                lComponents[ pComponent.typeId ] = {};
            }
            lComponents[ pComponent.typeId ][ pComponent.id ] = {
                oldComponent: null,
                newComponent: null,
                operation:    pOperation
            };
            if ( pOperation !== OPERATION.CREATE ) {
                lComponents[ pComponent.typeId ][ pComponent.id ].oldComponent = new Component( {
                    component:  pComponent,
                    isDetached: true
                } );
            }
        }
    }

    var transaction = ( function () {

        var transaction = {

            /**
             * Iterates over the modified components and calls a function for each entry
             */
            _forEach: function( pFunction ) {

                for ( var lTypeId in this.components ) {
                    if ( hasOwnProperty( this.components, lTypeId ) ) {
                        for ( var lId in this.components[ lTypeId ] ) {
                            if ( hasOwnProperty( this.components[ lTypeId ], lId ) ) {
                                pFunction.call( this.components[ lTypeId ][ lId ], lTypeId, lId );
                            }
                        }
                    }
                }
            },


            /**
             * Performs the operation specified as pOperation
             */
            _restore: function( pTypeId, pId, pOperation, pNewComponent, pAction ) {

                var lOldComponent = null;

                // Needed to compare it later in getNotifications
                if ( hasOwnProperty( gComponents[ pTypeId ], pId ) ) {
                    lOldComponent = new Component( {
                        component:  gComponents[ pTypeId ][ pId ],
                        isDetached: true
                    } );
                }

                if ( pOperation === OPERATION.CREATE ) {

                    if ( pNewComponent._status === STATUS.CREATED || !hasOwnProperty( gComponents[ pTypeId ], pId ) ) {

                        // Add the component back to our component store, but create a copy, otherwise
                        // any future changes would affect the component stored in the history!
                        gComponents[ pTypeId ][ pId ] = new Component( {
                            component:  pNewComponent,
                            isDetached: true
                        } );

                    } else {

                        // Just restore the original status of the component
                        gComponents[ pTypeId ][ pId ]._status = pNewComponent._status;
                    }

                } else if ( pOperation === OPERATION.DELETE ) {

                    if ( lOldComponent._status === STATUS.CREATED ) {

                        // Remove the newly created component from our component store
                        delete gComponents[ pTypeId ][ pId ];

                    } else {

                        // Just mark it as deleted
                        gComponents[ pTypeId ][ pId ]._status = STATUS.DELETED;
                    }

                } else {

                    // Update the component back to our component store, but create a copy, otherwise
                    // any future changes would affect the component stored in the history!
                    pNewComponent._copyToGlobal();
                }

                return getNotifications( lOldComponent, gComponents[ pTypeId ][ pId ] || null, pAction );

            }, // _restore

            /**
             * Undo this transaction.
             */
            _undo: function () {

                var that = this,
                    lNotifications = [];

                // Restore created/updated/deleted components
                this._forEach( function( pTypeId, pId ) {

                    var lUndoOperation;

                    // Revert operation for undo
                    switch ( this.operation ) {
                        case OPERATION.CREATE: lUndoOperation = OPERATION.DELETE; break;
                        case OPERATION.DELETE: lUndoOperation = OPERATION.CREATE; break;
                        case OPERATION.CHANGE: lUndoOperation = OPERATION.CHANGE; break;
                    }

                    lNotifications = lNotifications.concat( that._restore( pTypeId, pId, lUndoOperation, this.oldComponent, 'undo' ) );
                } );

                return lNotifications;
            },

            /**
             * Finishes a transaction and fires all the pending notifications
             * @throws {string} error message if there is no pending transaction
             */
            execute: function() {

                var lNotifications = [];

                checkPending();

                // todo provide default label

                // Generate notifications for all created/deleted or changed components
                this._forEach( function( pTypeId, pId ) {

                    // After all modifications have been performed, remember the new state of the component
                    // which is later used by undo/redo
                    if ( this.operation !== OPERATION.DELETE ) {
                        this.newComponent = new Component( {
                            component:  gComponents[ pTypeId ][ pId ],
                            isDetached: true
                        } );
                    }
                    lNotifications = lNotifications.concat( getNotifications( this.oldComponent, this.newComponent ) );
                } );

                sendNotifications( lNotifications );

                // Remove the pending transaction
                gCurrentTransaction = null;
            }, // _execute

            /**
             * Undo this transaction.
             * @throws {string} error message if there is a pending transaction
             */
            undo: function () {

                checkFinished();
                sendNotifications( this._undo() );
            },

            /**
             * Redo this transaction.
             * @throws {string} error message if there is a pending transaction
             */
            redo: function () {

                var that = this,
                    lNotifications = [];

                checkFinished();

                // Redo the transaction again
                this._forEach( function( pTypeId, pId ) {
                    lNotifications = lNotifications.concat( that._restore( pTypeId, pId, this.operation, this.newComponent, 'redo' ) );
                } );

                sendNotifications( lNotifications );
            },

            /**
             * Cancels a pending transaction and rollbacks (undoes) all changes done so far
             * @throws {string} error message if there is no pending transaction
             */
            cancel: function() {

                checkPending();
                this._undo();

                // Remove the pending transaction
                gCurrentTransaction = null;
            }, // cancel

            /**
             * Return the label for this transaction
             * @return {String}
             */
            label: function () {
                return this._label;
            }

        };

        /*
         * PUBLIC APIs
         */
        return {

            /**
             * Starts and returns a new transaction.
             * @param {pWidget}
             * @param {pLabel}
             * @throws {string} error message if there is a pending transaction
             */
            start: function( pWidget, pLabel ) {
                var that;

                if ( gIsPageReadOnly ) {
                    throw new Error( "Page is read only!" );
                }

                checkFinished();

                that = Object.create( transaction );
                that._label = pLabel || ""; // todo add code to create a default label probably in execute
                that.widget = pWidget; // todo currently not used but it may be useful to not send notifications to the source of the change???
                that.components = {};
                gCurrentTransaction = that;
                return that;
            }, // start

            /**
             * Builds the transaction message for the current action, component(s) and property affected
             *
             * @param  {Object} pOptions    Containing the following properties:
             *                              action :    The current action (eg CHANGE, CREATE, DELETE, DUPLICATE, MOVE )
             *                              component:  The current component, could also be the component type ID, if component is not yet known
             *                              property:   The current property
             *                              count:      The count of components affected
             * @return {String}             The localized and formatted message text.
             *
             * @function message
             **/
            message: function ( pOptions ) {

                var MULTIPLE_SUFFIX = ".MULTIPLE";

                var lComponentTxt,
                    lTypeId,
                    lMessage,
                    lOptions = $.extend( {
                        action:     "",
                        component:  null,
                        property:   null,
                        count:      1
                    }, pOptions ),
                    lKey = "TRANSACTION." + lOptions.action;

                switch( lOptions.action ) {
                    case MESSAGE_ACTION.CHANGE:
                        if ( lOptions.count === 1 ) {
                            lComponentTxt = lOptions.component.getDisplayTitle();
                        } else {
                            lComponentTxt = formatNoEscape( "MULTIPLE_COMPONENTS" );
                        }
                        lMessage = formatNoEscape( lKey, lComponentTxt, lOptions.property.getMetaData().prompt );
                        break;

                    case MESSAGE_ACTION.CREATE:
                        if ( lOptions.count === 1 ) {

                            // lOptions.component can be the typeId, in cases where the full component is not yet available
                            if ( typeof lOptions.component === "string" ) {
                                lTypeId = lOptions.component;
                            } else {
                                lTypeId = lOptions.component.typeId;
                            }
                            lComponentTxt = gTypes[ lTypeId ].title.singular;
                        } else {
                            lComponentTxt = formatNoEscape( "MULTIPLE_COMPONENTS" );    //todo improve to use component plural, if all components are the same
                        }
                        lMessage = formatNoEscape( lKey, lComponentTxt );
                        break;

                    // default applies to 'DELETE', 'DUPLICATE' and 'MOVE'
                    default:
                        if ( lOptions.count === 1 ) {
                            lComponentTxt = lOptions.component.getDisplayTitle();
                        } else {
                            lKey += MULTIPLE_SUFFIX;
                            lComponentTxt = lOptions.count;
                        }
                        lMessage = formatNoEscape( lKey, lComponentTxt );
                        break;

                }

                return lMessage;

            } // message
        };
    } )();


    function getNotifications( pOldComponent, pNewComponent, pAction ) {

        var lTypeDef,
            lNewProperty,
            lChildPropertyId,
            lChildTypeId,
            lChildComponentTypes = {},
            lChildComponents,
            lNotification,
            lNotifications = [],
            lPropertyEvents;

        function addComponentPropertyNotification( pComponent, pPropertyId, pEvent ) {
            if ( hasOwnProperty( pComponent._properties, pPropertyId ) || pEvent === EVENT.REMOVE_PROP ) {
                // Add property to our property notification if we haven't done it so far
                if ( !hasOwnProperty( lNotification.properties, pPropertyId ) ) {
                    lNotification.properties[ pPropertyId ] = [];
                }
                lNotification.properties[ pPropertyId ].push( pEvent );
            }
        }

        function addPropertyNotification( pPropertyId, pEvent ) {
            addComponentPropertyNotification( pNewComponent, pPropertyId, pEvent );
        }

        function addNewErrorsOrWarnings( pEvent, pComponentAttr, pPropertyAttr ) {

            if ( pNewComponent[ pComponentAttr ]() ) {
                lNotification.events.push( pEvent );

                // Check which properties have an error/warning for the new component
                for ( let lPropertyId in pNewComponent._properties ) {
                    if ( hasOwnProperty( pNewComponent._properties, lPropertyId ) ) {
                        if ( pNewComponent._properties[ lPropertyId ][ pPropertyAttr ].length > 0 ) {
                            addPropertyNotification( lPropertyId, pEvent );
                        }
                    }
                }

                // check if there's an error on the component level
                if ( pNewComponent._errors?.length ) {
                    lNotification.errors = pNewComponent._errors;
                }
            }
        }

        function addPropertyErrorsOrWarnings( pEventTrue, pEventFalse, pPropertyAttr, pPropertyId ) {
            // Have the errors/warnings changed?
            if ( pNewComponent._properties[ pPropertyId ][ pPropertyAttr ].join() !== pOldComponent._properties[ pPropertyId ][ pPropertyAttr ].join() ) {
                if ( pNewComponent._properties[ pPropertyId ][ pPropertyAttr ].length === 0 ) {
                    lPropertyEvents.push( pEventFalse );
                } else {
                    lPropertyEvents.push( pEventTrue );
                }
            }
        }

        function addComponentErrorsOrWarnings( pEventTrue, pEventFalse, pComponentAttr ) {
            // Check if the component has changed it's error/warning state
            if ( pNewComponent[ pComponentAttr ]() !== pOldComponent[ pComponentAttr ]() ) {
                if ( pNewComponent[ pComponentAttr ]() ) {
                    lNotification.events.push( pEventTrue );
                } else {
                    lNotification.events.push( pEventFalse );
                }
            }
        }

        function addParentNotifications( start ) {
            let component = start;
            while ( component ) {
                let notification = {
                    component: component,
                    events: [ EVENT.VALIDATE_COMPONENT ],
                    action: "",
                    properties: {},
                    errors: [],
                    data: { lNotification }
                };

                let errors = component._callComponentTypeCallback( {
                    action: CALLBACK_ACTION.VALIDATE_COMPONENT,
                    property: component.typeId,
                    value: component.id
                } )?.error;

                if ( errors ) {
                    component._errors = errors;
                    notification.errors = errors;
                }

                lNotifications.push( notification );

                component = component.getParent();
            }
        }

        function notifyChildren( start ) {
            start.getAllChildren().forEach( child => {
                child._callComponentTypeCallback( {
                    action: CALLBACK_ACTION.PARENT_UPDATE,
                    property: child.typeId,
                    value: child.id
                } );
                lNotifications.push( {
                    component: child,
                    events: [ EVENT.META_DATA ],
                    action: pAction || "",
                    properties: child.getProperties().reduce( ( acc, curr ) => {
                        if ( gProperties[ curr.id ].type !== "HIDDEN" ) {
                            acc[ curr.id ] = [ EVENT.META_DATA ];
                        }
                        return acc;
                    }, {} ),
                    errors: [],
                    data: { lNotification }
                } );
            } );
        }

        lNotification = {
            component:  {},
            events:     [],
            properties: {},
            action:     pAction || "" // undo or redo
        };


        if ( pOldComponent === null || pOldComponent._status === STATUS.DELETED ) {

            lNotification.component = pNewComponent;
            lNotification.events.push( EVENT.CREATE );

            addNewErrorsOrWarnings( EVENT.ERRORS,   "hasErrors",   "errors" );
            addNewErrorsOrWarnings( EVENT.WARNINGS, "hasWarnings", "warnings" );

        } else if ( pNewComponent === null || pNewComponent._status === STATUS.DELETED ) {

            lNotification.component = pOldComponent;
            lNotification.events.push( EVENT.DELETE );

        } else {

            lNotification.component = pNewComponent;
            lNotification.events.push( EVENT.CHANGE );

            lTypeDef = gTypes[ pNewComponent.typeId ];

            // Does the changed component have properties which haven't been displayed before?
            // Has one of the property values changed?
            // Is one of the properties invalid?
            for ( let lPropertyId in pNewComponent._properties ) {
                if ( hasOwnProperty( pNewComponent._properties, lPropertyId ) ) {

                    lNewProperty    = pNewComponent._properties[ lPropertyId ];
                    lPropertyEvents = lNotification.properties[ lPropertyId ] || [];

                    // Does the old component have that property?
                    if ( !hasOwnProperty( pOldComponent._properties, lPropertyId ) ) {
                        lPropertyEvents.push( EVENT.ADD_PROP );

                        if ( lNewProperty.errors.length > 0 ) {
                            lPropertyEvents.push( EVENT.ERRORS );
                        }

                        if ( lNewProperty.warnings.length > 0 ) {
                            lPropertyEvents.push( EVENT.WARNINGS );
                        }

                        // If it's a property which has an impact on the GLV, send the GRID event
                        if ( pNewComponent.typeId === COMP_TYPE.PAGE && ( lPropertyId === PROP.PAGE_TEMPLATE || lPropertyId === PROP.DIALOG_TEMPLATE ) ) {
                            lNotification.events.push( EVENT.GRID );
                        }

                    } else {
                        // Has the value changed or have errors/warnings been added/removed?

                        if ( lNewProperty._value !== pOldComponent._properties[ lPropertyId ]._value ) {
                            lPropertyEvents.push( EVENT.CHANGE );

                            // If the property which is used as display property of the component has been changed,
                            // we have to raise the extra DISPLAY_TITLE event
                            if ( lTypeDef.displayPropertyIds.includes( lPropertyId )) {

                                lNotification.events.push( EVENT.DISPLAY_TITLE );

                                // If it's a property which has an impact on the GLV, send the GRID event
                            } else if (  ( pNewComponent.typeId === COMP_TYPE.PAGE && ( lPropertyId === PROP.PAGE_TEMPLATE || lPropertyId === PROP.DIALOG_TEMPLATE ) )
                                      || ( pNewComponent.typeId === COMP_TYPE.REGION && ( lPropertyId === PROP.REGION_TEMPLATE || lPropertyId === PROP.REGION_TYPE ) )
                                      || ( pNewComponent.typeId === COMP_TYPE.REGION_PLUGIN_ATTR && lPropertyId === PROP.TEMPLATE_COMPONENT_TYPE )
                                      )
                            {
                                lNotification.events.push( EVENT.GRID );
                            }

                            // If a different plug-in has been picked, send the meta data changed event for
                            // all properties which do depend on the plug-in configuration
                            if ( lTypeDef.pluginType && lPropertyId === lTypeDef.pluginType.typePropertyId ) {
                                for ( let i = 0; i < lTypeDef.pluginType.requiredProperties.length; i++ ) {
                                    addPropertyNotification( lTypeDef.pluginType.requiredProperties[ i ], EVENT.META_DATA );
                                }
                                // Send a notification for all LOV properties, because the number of required columns could have changed
                                addPropertyNotification( PROP.LOV_SQL,                  EVENT.META_DATA );
                                addPropertyNotification( PROP.LOV_PLSQL_FUNC_BODY_SQL,  EVENT.META_DATA );
                                addPropertyNotification( PROP.LOV_JS_FUNC_BODY_SQL,     EVENT.META_DATA );
                                addPropertyNotification( PROP.LOV_JAVA_FUNC_BODY_SQL,   EVENT.META_DATA );
                                addPropertyNotification( PROP.LOV_PYTHON_FUNC_BODY_SQL, EVENT.META_DATA );
                                addPropertyNotification( PROP.SLOT_PLACEHOLDER,         EVENT.META_DATA );
                            }


                            // If the current property is one of the relevant grid properties which has an impact on the number
                            // of displayed grid columns, we have to send the meta data changed notification, because the LOVs of
                            // "Grid Column" and "Grid Span" have to be updated
                            if (   [
                                COMP_TYPE.REGION,
                                COMP_TYPE.PAGE_ITEM,
                                COMP_TYPE.BUTTON
                            ].includes( pNewComponent.typeId ) && [
                                PROP.REGION,
                                PROP.PARENT_REGION,
                                PROP.SLOT_PLACEHOLDER,
                                PROP.GRID_COLUMN,
                                PROP.GRID_COLUMN_SPAN
                            ].includes( lPropertyId ) ) {
                                addPropertyNotification( PROP.GRID_COLUMN,            EVENT.META_DATA );
                                addPropertyNotification( PROP.GRID_COLUMN_SPAN,       EVENT.META_DATA );
                                addPropertyNotification( PROP.GRID_LABEL_COLUMN_SPAN, EVENT.META_DATA );
                            }
                        }

                        // Have the errors/warnings changed?
                        addPropertyErrorsOrWarnings ( EVENT.ERRORS,   EVENT.NO_ERRORS,   "errors"   , lPropertyId );
                        addPropertyErrorsOrWarnings ( EVENT.WARNINGS, EVENT.NO_WARNINGS, "warnings" , lPropertyId );

                        // If the current property has child properties (i.e. in case of property types OWNER, TABLE, COLUMN)
                        // we have to send the meta data changed notification, because the LOVs of those child properties have changed
                        //
                        // Note: This is done outside of the "value has changed" statement, because a property
                        //       might just be re-validated after an error -> _columns is now populated
                        if (  lTypeDef.properties[ lPropertyId ].refByChilds.length > 0
                           && (  lNewProperty._value !== pOldComponent._properties[ lPropertyId ]._value
                              || lNewProperty._columns.length > 0
                              )
                           )
                        {
                            for ( let i = 0; i < lTypeDef.properties[ lPropertyId ].refByChilds.length; i++ ) {
                                if ( lTypeDef.properties[ lPropertyId ].refByChilds[ i ].typeId === pNewComponent.typeId ) {
                                    lChildPropertyId = lTypeDef.properties[ lPropertyId ].refByChilds[ i ].id;
                                    addPropertyNotification( lChildPropertyId, EVENT.META_DATA );
                                } else {
                                    // Remember dependent properties of child component types. We will create additional notifications
                                    // for those components at the end.
                                    // For example: Column Mapping properties in "Attributes" of Cards
                                    lChildTypeId = lTypeDef.properties[ lPropertyId ].refByChilds[ i ].typeId;
                                    if ( !hasOwnProperty( lChildComponentTypes, lChildTypeId ) ) {
                                        lChildComponentTypes[ lChildTypeId ] = [];
                                    }
                                    lChildComponentTypes[ lChildTypeId ].push( lTypeDef.properties[ lPropertyId ].refByChilds[ i ].id );
                                }
                            }
                        }
                    }

                    // Add property to our change notification if something has changed (add_prop, remove_prop, change, ...)
                    if ( lPropertyEvents.length > 0 ) {
                        lNotification.properties[ lPropertyId ] = lPropertyEvents;
                    }
                }
            }

            // Does the old component have properties which are not visible anymore in the new component?
            for ( let lPropertyId in pOldComponent._properties ) {
                if ( hasOwnProperty( pOldComponent._properties, lPropertyId ) ) {
                    if ( !hasOwnProperty( pNewComponent._properties, lPropertyId ) ) {
                        addPropertyNotification( lPropertyId, EVENT.REMOVE_PROP );
                    }
                }
            }

            // Check if the component has changed it's error/warning state
            addComponentErrorsOrWarnings( EVENT.ERRORS,   EVENT.NO_ERRORS,   "hasErrors" );
            addComponentErrorsOrWarnings( EVENT.WARNINGS, EVENT.NO_WARNINGS, "hasWarnings" );
        }

        // Add the primary component notification
        lNotifications.push( lNotification );

        // Do we have Child Components (for example: Cards Attributes, ...) which do have dependent properties?
        // Because for those we do have to send a meta data update notification.
        for ( let lChildTypeId in lChildComponentTypes ) {
            if ( hasOwnProperty( lChildComponentTypes, lChildTypeId ) ) {
                lChildComponents = getComponents( lChildTypeId, { parentId: pNewComponent.id }, false );
                for ( let i = 0; i < lChildComponents.length; i++ ) {
                    lNotification = {
                        component:  lChildComponents[ i ],
                        events:     [],
                        properties: {},
                        action:     ""
                    };
                    // Add a "Meta Data" update for all dependent properties
                    for ( let j = 0; j < lChildComponentTypes[ lChildTypeId ].length; j++ ) {
                        lChildPropertyId = lChildComponentTypes[ lChildTypeId ][ j ];
                        addComponentPropertyNotification( lChildComponents[ i ], lChildPropertyId, EVENT.META_DATA );
                    }
                    lNotifications.push( lNotification );
                }
            }
        }

        // call validation on the parent components with "VALIDATE_COMPONENT"
        let targetComponent = lNotification.component;
        addParentNotifications( targetComponent.getParent() );

        notifyChildren( targetComponent );

        if ( targetComponent.typeId === COMP_TYPE.WORKFLOW_VERSION && lTypeDef && hasOwnProperty( lNotification.properties, PROP.STATE ) ) {
            Object.keys( lTypeDef.properties ).forEach( ( id ) => {
                if ( gProperties[ id ].type !== "HIDDEN" ) {
                    addComponentPropertyNotification( targetComponent, id, EVENT.META_DATA );
                }
            } );
        }

        // in case of a transition or a branch we send out the notifiction both to the "from" and "to" activities
        if ( [ COMP_TYPE.WORKFLOW_TRANS, COMP_TYPE.WORKFLOW_BRANCH ].includes( targetComponent.typeId ) ) {
            [ PROP.FROM_WORKFLOW_ACTIVITY, PROP.TO_WORKFLOW_ACTIVITY ].forEach( ( type ) => {
                let propValue = targetComponent.getProperty( type )?.getValue();
                if ( propValue ) {
                    let parent = getComponents( COMP_TYPE.WORKFLOW_ACTIVITY, { id: propValue } );
                    if ( parent.length ) {
                        addParentNotifications( parent[ 0 ] );
                    }
                }
            } );
        }

        return lNotifications;

    } // getNotifications


    function sendNotifications( pNotifications ) {

        function send() {

            var lObservers = gObservers.slice(),// create an independent copy, because some of the callbacks could modify the observer array
                i, j, k,
                lSend,
                lNotification,
                lFilter;

            for ( i = 0; i < pNotifications.length; i++ ) {
                lNotification = pNotifications[ i ];

                for ( j = 0; j < lObservers.length; j++ ) {

                    lFilter = lObservers[ j ].filter;
                    lSend   = false;

                    // Filter by component(s) or by component type
                    if ( lFilter.component ) {
                        if ( lFilter.component instanceof Component ) {
                            if (  lFilter.component.typeId === lNotification.component.typeId
                                && lFilter.component.id     === lNotification.component.id ) {
                                lSend = true;
                            }
                        } else if ( lFilter.component.typeId === lNotification.component.typeId ) {
                            lSend = true;
                        } else if ( $.inArray( lNotification.component.typeId, lFilter.component.typeIds ) !== -1 ) { // todo should be removed in favor of the array
                            lSend = true;
                        }
                    } else if ( lFilter.components ) {
                        for ( k = 0; k < lFilter.components.length; k++ ) {
                            if ( lFilter.components[ k ] instanceof Component ) {
                                if (  lFilter.components[ k ].typeId === lNotification.component.typeId
                                    && lFilter.components[ k ].id     === lNotification.component.id ) {
                                    lSend = true;
                                    break;
                                }
                            } else if ( lFilter.components[ k ].typeId === lNotification.component.typeId ) {
                                lSend = true;
                                break;
                            }
                        }
                    } else {
                        lSend = true;
                    }

                    // Is one of the specified properties in our notification?
                    if ( lSend && lFilter.properties.length > 0 ) {
                        lSend = false;
                        for ( k = 0; k < lFilter.properties.length; k++ ) {
                            if ( hasOwnProperty( lNotification.properties, lFilter.properties[ k ] ) ) {
                                lSend = true;
                                break;
                            }
                        }
                    }

                    // Is one of the specified events in our notification?
                    if ( lSend && lFilter.events.length > 0 ) {
                        lSend = false;
                        for ( k = 0; k < lFilter.events.length; k++ ) {
                            // Check component level first
                            if ( $.inArray( lFilter.events[ k ], lNotification.events ) !== -1 ) {
                                lSend = true;
                                break;
                            }
                            // Check the events of each property
                            for ( let lPropertyId in lNotification.properties ) {
                                if ( hasOwnProperty( lNotification.properties, lPropertyId ) ) {
                                    if ( $.inArray( lFilter.events[ k ], lNotification.properties[ lPropertyId ] ) !== -1 ) {
                                        lSend = true;
                                        break;
                                    }
                                }
                            }
                            if ( lSend ) {
                                break;
                            }
                        }
                    }

                    // If the observer filter criteria matched to our notification,
                    // queue notification or call the callback and pass the notification as first parameter
                    if ( lSend ) {
                        if ( lObservers[ j ].sendInBulk ) {
                            lObservers[ j ].pendingNotifications.push( lNotification );
                        } else {
                            lObservers[ j ].callback.call( this, lNotification );
                        }
                    }
                }
            }

            // Send bulk notification for all observers requesting bulk notification
            for ( let i = 0; i < lObservers.length; i++ ) {
                if ( lObservers[ i ].sendInBulk && lObservers[ i ].pendingNotifications.length > 0 ) {
                    lObservers[ i ].callback.call( this, lObservers[ i ].pendingNotifications );
                    lObservers[ i ].pendingNotifications = [];
                }
            }

        } // send

        function removeObsoletes() {
            // If a component has been deleted we also want to delete it from our observer list so that the component
            // can be garbage collected
            for ( let i = 0; i < gObservers.length; i++ ) {
                if ( gObservers[ i ].filter.component instanceof Component && gObservers[ i ].filter.component._status === STATUS.DELETED ) {
                    gObservers.splice( i, 1 );
                    i =- 1;
                }
            }
        } // removeObsoletes

        send();
        removeObsoletes();
    } // sendNotifications


    /**
     * Returns true if the model has a pending change.
     *
     * @return {boolean}
     *
     * @function hasChanged
     * @memberOf pe
     **/
    function hasChanged() {

        for ( var lTypeId in gTypes ) {
            if ( hasOwnProperty( gTypes, lTypeId ) ) {
                // If the model has loaded a page, just check page components
                // If we have loaded shared components then ignore page components
                if (  (  gTypes[ lTypeId ].isPageComponent && gCurrentPageId !== undefined )
                    || (  lTypeId === COMP_TYPE.PAGE        && gCurrentPageId !== undefined )
                    || ( !gTypes[ lTypeId ].isPageComponent && gCurrentPageId === undefined )
                    || ( gTypes[ lTypeId ].isSharedDesignerComponent )
                )
                {
                    // todo We could optimize this check by setting a hasChanged flag on type/global level
                    for ( var lId in gComponents[ lTypeId ] ) {
                        if ( hasOwnProperty( gComponents[ lTypeId ], lId ) && gComponents[ lTypeId ][ lId ].hasChanged() ) {
                            return true;
                        }
                    }
                }
            }
        }

        return false;

    } // hasChanged


    /**
     * todo
     *
     * @return {boolean}
     *
     * @function saveChanges
     * @memberOf pe
     **/
    function saveChanges( pCallback ) {

        var lChangedComponents = {}, // index by typeId
            lHasChanged = false,
            lChangedComponent,
            lComponent;

        function addGridProperties( pChangedComponent, pComponentProperties, pAttribute ) {

            var GRID_PROPERTIES = [ PROP.GRID_NEW_GRID, PROP.GRID_NEW_ROW, PROP.GRID_ROW_CSS_CLASSES, PROP.GRID_COLUMN, PROP.GRID_NEW_COLUMN, PROP.GRID_COLUMN_SPAN, PROP.GRID_ROW_SPAN, PROP.GRID_COLUMN_CSS_CLASSES, PROP.GRID_COLUMN_ATTRIBUTES, PROP.GRID_LABEL_COLUMN_SPAN, PROP.LABEL_ALIGNMENT, PROP.ELEMENT_FIELD_ALIGNMENT, PROP.READ_ONLY_HTML_ATTRIBUTES ];

            if ( hasOwnProperty( lComponent, "_grid" ) ) {

                lChangedComponent[ pAttribute ] = [];

                for ( let i = 0; i < GRID_PROPERTIES.length; i++ ) {
                    if ( hasOwnProperty( pComponentProperties, GRID_PROPERTIES[ i ] ) ) {
                        pChangedComponent[ pAttribute ].push( GRID_PROPERTIES[ i ] );
                    }
                }
            }
        }


        for ( var lTypeId in gTypes ) {
            if ( hasOwnProperty( gTypes, lTypeId ) ) {
                // If the model has loaded a page, just check page components
                // If we have loaded shared components then ignore page components
                if (  ( gTypes[ lTypeId ].isSharedDesignerComponent || gTypes[ lTypeId ].isPageComponent && gCurrentPageId !== undefined  )
                    || (  lTypeId === COMP_TYPE.PAGE        && gCurrentPageId !== undefined )
                    || ( !gTypes[ lTypeId ].isPageComponent && gCurrentPageId === undefined )
                )
                {
                    for ( var lId in gComponents[ lTypeId ] ) {
                        if ( !hasOwnProperty( gComponents[ lTypeId ], lId ) ) {
                            continue;
                        }
                        lComponent = gComponents[ lTypeId ][ lId ];
                        if ( gComponents[ lTypeId ][ lId ].hasChanged() || lComponent.hasErrors() ) {

                            if ( lComponent.hasErrors() && lComponent._status !== STATUS.DELETED ) {
                                pCallback( {
                                    error: format( "SAVE.FIX_ERRORS" )
                                } );
                                return;
                            }

                            if ( !hasOwnProperty( lChangedComponents, lTypeId ) ) {
                                lChangedComponents[ lTypeId ] = {
                                    c: [],
                                    u: [],
                                    d: []
                                };
                            }

                            lChangedComponent = {
                                id:       lComponent.id,
                                parentId: lComponent.parentId,
                                pageId:   lComponent.pageId
                            };

                            if ( debug.getLevel() !== debug.LOG_LEVEL.OFF ) {
                                lChangedComponent.displayTitle = lComponent.getDisplayTitle();
                            }

                            // Handling of grid properties is complex and doesn't follow a simple depending-on logic, that's
                            // why it's hard for the server to automatically clear those properties. We have to provide
                            // the grid properties to the server, because the property change record just
                            // contains new or changed properties, but not removed properties.
                            addGridProperties( lChangedComponent, lComponent._properties, "gridProperties" );

                            if ( lComponent._status === STATUS.CREATED ) {

                                lChangedComponent.properties = {};
                                for ( let lPropertyId in lComponent._properties ) {
                                    if ( hasOwnProperty( lComponent._properties, lPropertyId ) ) {
                                        lChangedComponent.properties[ lPropertyId ] = lComponent._properties[ lPropertyId ]._value;
                                    }
                                }

                            } else if ( lComponent._status === STATUS.UPDATED ) {

                                addGridProperties( lChangedComponent, gBaseComponents[ lTypeId ][ lId ], "oldGridProperties" );

                                lChangedComponent.properties = {};
                                for ( let lPropertyId in lComponent._properties ) {
                                    if ( hasOwnProperty( lComponent._properties, lPropertyId ) ) {

                                        if ( !hasOwnProperty( gBaseComponents[ lTypeId ][ lId ], lPropertyId ) ) {
                                            // New property which didn't exist before
                                            lChangedComponent.properties[ lPropertyId ] = lComponent._properties[ lPropertyId ]._value;

                                        } else if ( gBaseComponents[ lTypeId ][ lId ][ lPropertyId ] !== lComponent._properties[ lPropertyId ]._value ) {
                                            // Changed property value
                                            lChangedComponent.properties[ lPropertyId ] = {
                                                oldValue: gBaseComponents[ lTypeId ][ lId ][ lPropertyId ],
                                                newValue: lComponent._properties[ lPropertyId ]._value
                                            };
                                        }
                                    }
                                }

                                // check if deprecated region_image property originally existed and was removed from the view
                                // this allows it to it get cleared properly in wwv_flow_property_dev.plb is_visible
                                if ( hasOwnProperty( gBaseComponents[ lTypeId ][ lId ], PROP.REGION_IMAGE ) &&
                                     !hasOwnProperty( lComponent._properties, PROP.REGION_IMAGE ) )
                                {
                                        // add region image to changed component properties
                                        lChangedComponent.properties[ PROP.REGION_IMAGE ] = {
                                            oldValue: gBaseComponents[ lTypeId ][ lId ][ PROP.REGION_IMAGE ],
                                            newValue: ""
                                        };
                                }

                                // todo only transmit components where properties.length > 0 or grid properties have changed!
                            }

                            lChangedComponents[ lTypeId ][ lComponent._status ].push( lChangedComponent );
                            lHasChanged = true;
                        }
                    }
                }
            }
        }

        if ( lHasChanged ) {

            debug.trace( "saveChanges: modified components %0", lChangedComponents );

            ajax (
                "writePageData", {
                    x01: gCurrentAppId,
                    x02: gCurrentPageId,
                    f01: JSON.stringify( lChangedComponents )
                }, {
                    success: function( pData ) {
                        saveChangesResponse( pData, lChangedComponents, pCallback );
                    },
                    error: function( pjqXHR, pTextStatus, pError ) {
                        pCallback( {
                            error: pError
                        } );
                    }
                } );

        } else {
            pCallback( {
                error: "NO_CHANGES"
            } );
        }

    } // saveChanges


    function saveChangesResponse( pData, pChangedComponents, pCallback ) {

        var lNotifications = [];

        function errors( pComponent ) {

            var lOldComponent,
                lPropertyId,
                lErrors;

            lErrors = {};
            lOldComponent = new Component( {
                component:  gComponents[ pComponent.typeId ][ pComponent.id ],
                isDetached: true
            } );

            // Get a list of error messages for each property of the current component
            for ( let i = 0; i < pComponent.errors.length; i++ ) {
                if ( hasOwnProperty( pComponent.errors[ i ], "propertyId" ) ) {
                    lPropertyId = pComponent.errors[ i ].propertyId;
                } else {
                    // Error messages on component level should be added to the identifying property of the component
                    lPropertyId = getDisplayProperty( pComponent ).id;
                }
                if ( !hasOwnProperty( lErrors, lPropertyId ) ) {
                    lErrors[ lPropertyId ] = [];
                }
                lErrors[ lPropertyId ].push( pComponent.errors[ i ].message );
            }

            // Add all property error messages to our global component array
            forEachAttribute( lErrors, function( pPropertyId, pError ) {
                if ( hasOwnProperty( gComponents[ pComponent.typeId ][ pComponent.id ]._properties, pPropertyId ) ) {
                    gComponents[ pComponent.typeId ][ pComponent.id ]._properties[ pPropertyId ].errors = pError;
                } else {
                    throw new Error( `Error reported for property id ${ pPropertyId } which doesn't exist for current component!` );
                }
            } );

            // Restore a deleted component if it has errors, otherwise we wouldn't be able to display the error message
            if ( gComponents[ pComponent.typeId ][ pComponent.id ]._status === STATUS.DELETED ) {
                gComponents[ pComponent.typeId ][ pComponent.id ]._status = STATUS.UNCHANGED;
            }

            lNotifications = lNotifications.concat( getNotifications( lOldComponent, gComponents[ pComponent.typeId ][ pComponent.id ] ) );
        } // errors


        function refreshComponent( pTypeId, pComponents ) {

            var lComponent,
                lOldComponent,
                lNewComponent;

            for ( let i = 0; i < pComponents.length; i++ ) {
                lComponent = pComponents[ i ];

                lOldComponent = new Component( {
                    component:  gComponents[ pTypeId ][ lComponent.id ],
                    isDetached: true
                } );

                lNewComponent = new Component( {
                    typeId:     pTypeId,
                    component:  lComponent,
                    isDetached: true
                } );
                lNewComponent._setGridProperties( true );

                // Update the component list with the newest server values
                lNewComponent._copyToGlobal();

                // Store the new baseline for the component property values
                saveBaseComponent( gComponents[ pTypeId ][ lComponent.id ] );

                // Let everybody know about changed server side property values
                lNotifications = lNotifications.concat( getNotifications( lOldComponent, gComponents[ pTypeId ][ lComponent.id ] ) );
            }
        } // refreshComponent


        function deleteComponents( pTypeId, pComponents ) {

            for ( let i = 0; i < pComponents.length; i++ ) {
                // If we have successfully deleted the component from the server, it's time to remove it from the client as well
                if ( gComponents[ pTypeId ][ pComponents[ i ].id ]._status === STATUS.DELETED ) {

                    delete gComponents[ pTypeId ][ pComponents[ i ].id ];
                    // todo remove baseComponents entry
                }
            }

        }

        if ( pData.errors ) {

            errors( pData );

        } else {

            // refresh all created/updated components with the server side properties
            forEachAttribute( pData, refreshComponent );

            // remove all deleted components from our internal arrays
            forEachAttribute( pChangedComponents, function( pTypeId, pData ) {
                if ( hasOwnProperty( pData, STATUS.DELETED ) ) {
                    deleteComponents( pTypeId, pData[ STATUS.DELETED ] );
                }
            } );

            // Bug 34479092 - Page property "Enable Meta Tags" is not always in sync with the correct data due to the
            // order in which meta tags and page properties are fetched, so the following makes sure the page property
            // ENABLE_META_TAGS is enabled when the page is public and that there is at least one meta tag defined,
            // assuming the current page is not the global page.
            if ( !isGlobalPage() ) {
                const page = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ];
                const pageIsPublic = page.getProperty( PROP.PAGE_AUTHENTICATION ).getValue() === "Y";
                const metaTagsCount = getComponents( COMP_TYPE.META_TAG ).length;

                if ( pageIsPublic ) {
                    if ( metaTagsCount > 0 ) {
                        page.getProperty( PROP.ENABLE_META_TAGS )._value = "Y";
                    } else {
                        page.getProperty( PROP.ENABLE_META_TAGS )._value = "N";
                    }
                }
            }
        }
        sendNotifications( lNotifications );

        if ( pData.errors ) {
            pCallback( {
                error: format( "SAVE.FAILED" )
            } );
        } else {
            pCallback( {} );
        }

    } // saveChangesResponse


    function saveBaseComponent( pComponent ) {

        function savePropertyValue( pPropertyId, pProperty ) {
            gBaseComponents[ pComponent.typeId ][ pComponent.id ][ pPropertyId ] = pProperty._value;
        }

        gBaseComponents[ pComponent.typeId ][ pComponent.id ] = {};

        // Copy all property values
        forEachAttribute( gComponents[ pComponent.typeId ][ pComponent.id ]._properties, savePropertyValue );

    } // saveBaseComponent

    function saveBaseComponents() {

        function saveComponent( pId, pComponent ) {
            saveBaseComponent( pComponent );
        }

        // Remember the base line of all component types and components
        forEachAttribute( gComponents, function( pTypeId, pComponents ) {
            gBaseComponents[ pTypeId ] = {};
            forEachAttribute( pComponents, saveComponent );
        } );

    } // saveBaseComponents


    /*
     * Attempt to lock the current page on behalf of the current user with the given comment.
     * The page must not currently be locked by anyone.
     * Returns a deferred. If the page is successfully locked the deferred is resolved with no arguments.
     * If the page cannot be locked the deferred is rejected with the reason as parameter.
     */
    function lockPage( pComment ) {

        var lDeferred = $.Deferred();

        ajax (
            "lockPage", {
                x01: gCurrentAppId,
                x02: gCurrentPageId,
                x03: pComment
            }, {
                success: function( pData ) {
                    gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ]._lock = pData;

                    if ( pData.isLockedByCurrentUser ) {
                        gIsPageReadOnly = false;
                        lDeferred.resolve( pData );
                    } else {
                        // If the user has already started to modify the page, we have to continue to allow that.
                        // The user wouldn't be happy if we discard all his changes, because he could also ask the other
                        // user to unlock the page and they try a save again.
                        gIsPageReadOnly = !hasChanged();
                        lDeferred.reject( format( "LOCKED.BY_OTHER_USER", pData.owner ) );
                    }
                }
            } );

        return lDeferred.promise();

    } // lockPage


    /*
     * Attempt to unlock the current page on behalf of the current user.
     * The current user must have the lock on the current page.
     * Returns a deferred. If the page is successfully unlocked the deferred is resolved with no arguments.
     * If the page cannot be unlocked the deferred is rejected with the reason as parameter.
     */
    function unlockPage() {

        var lDeferred = $.Deferred(),
            lLockState = getPageLockState();

        if ( !lLockState ) {

            lDeferred.reject( "Page is already unlocked!" ); // todo NLS do we really have to translate this? -> Implementation error

        } else if ( !lLockState.isLockedByCurrentUser ) {

            lDeferred.reject( "Page not locked by current user!" ); // todo NLS do we really have to translate this? -> Implementation error

        } else {

            ajax (
                "unlockPage", {
                    x01: gCurrentAppId,
                    x02: gCurrentPageId
                }, {
                    success: function( pData ) {
                        if ( pData.status === "OK" ) {
                            gIsPageReadOnly = false;
                            gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ]._lock = false;
                            lDeferred.resolve();
                        } else {
                            // If the user has already started to modify the page, we have to continue to allow that.
                            gIsPageReadOnly = !hasChanged();
                            lDeferred.reject( pData.reason );
                        }
                    }
                }
            );

        }

        return lDeferred.promise();

    } // unlockPage


    function getPageLockState() {

        return gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ]._lock;

    } // getPageLockState

    function unsubscribePage() {

        let lDeferred = $.Deferred();

        ajax (
            "unsubscribePage", {
                x01: gCurrentAppId,
                x02: gCurrentPageId
            }, {
                success: function( pData ) {
                    if ( pData.status === "OK" ) {
                        lDeferred.resolve();
                    } else {
                        lDeferred.reject( pData.reason );
                    }
                }
            }
        );

        return lDeferred.promise();

    } // unsubscribePage

    function setComponentTypesUrls( pComponentTypes ) {

        // Set the session specific create/edit/copyUrls (because of checksums) for component types
        for ( let i in pComponentTypes ) {
            if ( hasOwnProperty( pComponentTypes, i ) ) {
                gTypes[ i ].createUrl = pComponentTypes[ i ].createUrl;
                gTypes[ i ].editUrl   = pComponentTypes[ i ].editUrl;
                gTypes[ i ].copyUrl   = pComponentTypes[ i ].copyUrl;
            }
        }

    } // setComponentTypesUrls


    /**
     * todo documentation
     *
     * @return {Object}
     *
     * { ... },
     *
     * @function setComponentData
     * @memberOf pe
     **/
    function setComponentData( pData ) {

        for ( var lTypeId in pData ) {
            if ( hasOwnProperty( pData, lTypeId ) ) {

                // Copy all components
                for ( let i = 0; i < pData[ lTypeId ].length; i++ ) {

                    // Add the final component to our component store
                    new Component( {
                        typeId:    lTypeId,
                        component: pData[ lTypeId ][ i ]
                    } );
                }
            }
        }

    } // setComponentData

    /*
     * PUBLIC APIs
     */
    return {
        COMP_TYPE,
        PROP,
        SOURCE_LOCATION_PROPS,
        NO_NODE_COMP_TYPES,
        UNSORTABLE_COLUMN_DATA_TYPES,
        SOURCE_SNIPPET_PROPS,
        LOCATION,
        PROP_TYPE,
        EVENT,
        CALLBACK_ACTION,
        MESSAGE_ACTION,
        Component,
        getComponents,
        getComponentsAdvanced,
        getDisplayProperty,
        fullTextSearch,
        displayTitleSearch,
        getItemsLov,
        getPagesLov,
        getEmailPlaceholders,
        transaction,
        hasChanged,
        saveChanges,
        getPageLockState,
        lockPage,
        unlockPage,
        unsubscribePage,
        getTemplateOptions,
        getTheme,
        getRegionTemplate,
        getParentRegionId,
        enquoteIdentifier,
        setComponentData,
        getUniquePropertyValue,
        isMatchingDataType,
        getWorkflowLov,
        isSharedDesignerComponent,
        getPageTemplate,
        getRegionPlugin,
        getSlots,
        getSlot,
        getTemplateComponentType,
        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function setComponentData
         * @memberOf pe
         **/
        initModelConfig: function( pStaticData, pWorkspaceData, pSharedData ) {

            function setStaticData( pData ) {

                pData = $.extend( true, {
                    displayGroups:    {},
                    properties:       {},
                    componentTypes:   {},
                    plugins:          {},
                    pluginCategories: {},
                    events: {
                        browser:   [],
                        apex:      [],
                        component: [],
                        custom:    [],
                        lookupMap: {}
                    },
                    text: {},
                    formatMasks: {
                        numbers: [],
                        dates:   []
                    }
                }, pData );

                gDisplayGroups      = pData.displayGroups;
                gProperties         = pData.properties;
                gTypes              = pData.componentTypes;
                gPluginCategories   = pData.pluginCategories;
                gEvents             = pData.events;
                gFormatMasks        = pData.formatMasks;
                gInstanceParameters = pWorkspaceData.instanceParameters;

                // Merge the native plug-ins into our property configuration
                mergePlugins( pData.plugins, "%0" );

            } // setStaticData

            function setWorkspaceComponentData( pData ) {

                // Set the session specific create/edit/copyUrls (because of checksums) for component types
                setComponentTypesUrls( pData.componentTypes );

            } // setWorkspaceComponentData

            function setSharedComponentData( pData ) {

                $.extend( true, { plugins: {}}, pData );

                gSharedComponents = pData;

                // Set the session specific create/edit/copyUrls (because of checksums) for component types
                setComponentTypesUrls( gSharedComponents.componentTypes );

                // Initialize some of the possible null values
                simpleExtend( gSharedComponents.userInterface, {
                    globalPageId: ""
                } );

                // Merge the application plug-ins into our property configuration
                mergePlugins( pData.plugins, lang.getMessage( "MODEL.POSTFIX.PLUGIN" ), pData.userInterface.themeId );

                // Region and Field templates contain a default "No Template" template. But because JSON doesn't support an
                // empty object attribute name we have to map it on the server to "0", but we actually want to store it under "".
                for ( let i in gSharedComponents.themes ) {
                    if ( hasOwnProperty( gSharedComponents.themes, i ) ) {

                        gSharedComponents.themes[ i ].templates[ COMP_TYPE.REGION_TEMPLATE ][ "" ] = gSharedComponents.themes[ i ].templates[ COMP_TYPE.REGION_TEMPLATE ][ "0" ];
                        delete gSharedComponents.themes[ i ].templates[ COMP_TYPE.REGION_TEMPLATE ][ "0" ];

                        gSharedComponents.themes[ i ].templates[ COMP_TYPE.FIELD_TEMPLATE ][ "" ] = gSharedComponents.themes[ i ].templates[ COMP_TYPE.FIELD_TEMPLATE ][ "0" ];
                        delete gSharedComponents.themes[ i ].templates[ COMP_TYPE.FIELD_TEMPLATE ][ "0" ];

                        // Make sure that we always have a default value, this will simplify the code using those defaults.
                        simpleExtend( gSharedComponents.themes[ i ].defaultTemplates, {
                            page:       "",
                            dialog:     "",
                            region:     "",
                            field:      "",
                            button:     "",
                            report:     "",
                            ir:         "",
                            list:       "",
                            breadcrumb: "",
                            calendar:   ""
                        } );
                    }
                }

            } // setSharedComponentData

            setStaticData( pStaticData );
            setWorkspaceComponentData( pWorkspaceData );
            setSharedComponentData( pSharedData );

            // After the static and shared component data has been loaded, generate additional lookup arrays
            initializeArrays();
            generateCrossReferences();

            $( document ).trigger( "modelConfigLoaded" );

            setComponentData( pWorkspaceData.components );
            setComponentData( pSharedData.components );

        }, // initModelConfig

        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function setComponentTypeCallback
         * @memberOf pe
         **/
        setComponentTypeCallback: function( pComponentTypeId, pCallback, pExtraActions = [] ) {
            const DEFAULT_ACTIONS = [ CALLBACK_ACTION.CHANGED, CALLBACK_ACTION.CREATED, CALLBACK_ACTION.REMOVED, CALLBACK_ACTION.VALIDATE ];
            gTypes[ pComponentTypeId ].actions = [ ...DEFAULT_ACTIONS, ...pExtraActions ];
            gTypes[ pComponentTypeId ].callback = pCallback;

        }, // setComponentTypeCallback

        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function setPluginCallback
         * @memberOf pe
         **/
        setPluginCallback: function( pComponentTypeId, pPluginName, pCallback ) {

            gTypes[ pComponentTypeId ].pluginType.plugins[ pPluginName ].callback = pCallback;

        }, // setPluginCallback


        /**
         * Function returns the navigation list template id of the current page.
         *
         * @return {Object}
         *
         * @function getNavListTemplateId
         * @memberOf pe
         **/
        getNavListTemplateId: function() {

            var lPage = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ],
                lTemplateId = "";

            if ( !isGlobalPage() && lPage.getProperty( PROP.PAGE_NAVIGATION_TYPE ).getValue() === "L" ) {

                // Get the used navigation list template of the current page. If no template is defined on page level,
                // we have to get it from the user interface
                if ( lPage.getProperty( PROP.NAVIGATION_LIST_TEMPLATE ) ) {
                    lTemplateId = lPage.getProperty( PROP.NAVIGATION_LIST_TEMPLATE ).getValue();
                } else if ( gCurrentApp.navList ) {
                    lTemplateId = gCurrentApp.navList.templateId || "";
                }
            }
            return lTemplateId;

        }, // getNavListTemplateId,


        /**
         * Function returns the navigation list id of the current page.
         *
         * @return {Object}
         *
         * @function getNavListId
         * @memberOf pe
         **/
        getNavListId: function() {

            var lPage = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ],
                lId = "";

            if ( !isGlobalPage() && lPage.getProperty( PROP.PAGE_NAVIGATION_TYPE ).getValue() === "L" ) {

                // Get the used navigation list of the current page. If no list is defined on page level,
                // we have to get it from the user interface
                if ( lPage.getProperty( PROP.NAVIGATION_LIST ) ) {
                    lId = lPage.getProperty( PROP.NAVIGATION_LIST ).getValue();
                } else if ( gCurrentApp.navList ) {
                    lId = gCurrentApp.navList.listId || "";
                }
            }
            return lId;

        }, // getNavListId,


        /**
         * Function returns the navigation bar list id of the current user interface.
         *
         * @return {Object}
         *
         * @function getNavBarListId
         * @memberOf pe
         **/
        getNavBarListId: function() {

            if ( !isGlobalPage() && gCurrentApp.navBar && gCurrentApp.navBar.type === "LIST" ) {

                return gCurrentApp.navBar.listId || "";
            } else {
                return "";
            }

        }, // getNavBarListId,


        /**
         * Function returns the tab set id of the current page.
         *
         * @return {Object}
         *
         * @function getTabSetId
         * @memberOf pe
         **/
        getTabSetId: function() {

            var lPage = gComponents[ COMP_TYPE.PAGE ][ gCurrentPageId ],
                lId = "";

            if ( !isGlobalPage() && lPage.getProperty( PROP.PAGE_NAVIGATION_TYPE ).getValue() === "T" ) {

                lId = lPage.getProperty( PROP.STANDARD_TAB_SET ).getValue();

            }
            return lId;

        }, // getTabSetId,

        /**
         * Function returns an instance parameter value
         * @param {Number} pName name of the instance parameter
         *
         * @return {String}
         *
         * @function getInstanceParameter
         * @memberOf pe
         **/
        getInstanceParameter(pName) {

            return gInstanceParameters[pName];

        }, // getInstanceParameter

        /**
         * Function returns all button templates of the current theme.
         *
         * @return {Object}
         *
         * @function getButtonTemplates
         * @memberOf pe
         **/
        getButtonTemplates: function() {

            return getTheme().templates[ COMP_TYPE.BUTTON_TEMPLATE ];

        }, // getButtonTemplates


        /**
         * Function returns the icon configuration of the current theme.
         *
         * @return {Object}
         *
         * @function getThemeIcons
         * @memberOf pe
         **/
        getThemeIcons: function() {

            return getTheme().icons || {};

        }, // getThemeIcons

        /**
         * Function returns the parsing schema of the current application.
         *
         * @return {String}
         *
         * @function getParsingSchema
         * @memberOf pe
         **/
        getParsingSchema: function() {

            return gSharedComponents.parsingSchema;

        }, // getParsingSchema

        /**
         * Function returns the primary language of the current application.
         *
         * @return {String}
         *
         * @function getPrimaryLanguage
         * @memberOf pe
         **/
        getPrimaryLanguage: function() {

            return gSharedComponents.primaryLanguage;

        }, // getPrimaryLanguage

        /**
         * Function returns the Compatibility Mode of the current application.
         *
         * @return {Number}
         *
         * @function getCompatibilityMode
         * @memberOf pe
         **/
        getCompatibilityMode: function() {

            return parseFloat( gSharedComponents.compatibilityMode );

        }, // getCompatibilityMode

        /**
         * Function returns the display group identified by pId.
         *
         * @param {Number} pId Id of the display group which should be returned
         *
         * @return {Object}
         *
         * { name: <name of display group>,
         *   title: <title of display group> },
         *
         * @function getDisplayGroup
         * @memberOf pe
         **/
        getDisplayGroup: function( pId ) {

            return gDisplayGroups[ pId ];

        }, // getDisplayGroup


        /**
         * Function returns the component type identified by pTypeId.
         *
         * @param {Number} pTypeId Id of the component type which should be returned
         *
         * @return {Object}
         *
         * { name: <name of component type>,
         *   title: {
         *     singular: <singular title>,
         *     plural:   <plural title>
         *   }
         * },
         *
         * @function getComponentType
         * @memberOf pe
         **/
        getComponentType: function( pTypeId ) {

            return gTypes[ pTypeId ];

        }, // getComponentType


        /**
         * Function returns the property identified by pPropertyId.
         *
         * @param {Number} pPropertyId Id of the property id which should be returned
         *
         * @return {Object}
         *
         * @function getProperty
         * @memberOf pe
         **/
        getProperty: function( pPropertyId ) {

            return gProperties[ pPropertyId ];

        }, // getProperty


        /**
         * Function returns the plug-in property identified by Plugin Name and Attribute No.
         *
         * @param {String} pComponentTypeId Component Type Id of the plug-in. For example COMP_TYPE.REGION, ...
         * @param {String} pName Name of the plug-in
         * @param {Number|String} pAttribute static-id or attribute# of the plug-in Custom Attribute
         *
         * @return {Object}
         *
         * @function getPluginProperty
         * @memberOf pe
         **/
        getPluginProperty: function( pComponentTypeId, pPlugin, pAttributeNo ) {

            var lName,
                lComponentTypeId;

            if ( pComponentTypeId === COMP_TYPE.REGION ) {
                // Region type plug-ins have stored their properties in the region plugin attributes type.
                lComponentTypeId = COMP_TYPE.REGION_PLUGIN_ATTR;
            } else if ( EXTRA_ITEM_TYPE_COMP_TYPES.includes( pComponentTypeId ) ) {
                // Interactive Grid column or Facet / Smart Filter plug-ins are item type plug-ins which are stored for page items
                lComponentTypeId = COMP_TYPE.PAGE_ITEM;
            } else if ( EXTRA_PROCESS_TYPE_COMP_TYPES.includes( pComponentTypeId ) ) {
                lComponentTypeId = COMP_TYPE.PAGE_PROCESS;
            } else {
                lComponentTypeId = pComponentTypeId;
            }
            lName = lComponentTypeId + "_" + pPlugin + "_" + pAttributeNo;

            // todo should be optimized to have a lookup map
            for ( let lPropertyId in gProperties ) {
                if ( hasOwnProperty( gProperties, lPropertyId ) ) {
                    if ( gProperties[ lPropertyId ].name === lName ) {
                        return gProperties[ lPropertyId ];
                    }
                }
            }
            return undefined;

        }, // getPluginProperty

        /**
         * Function returns true if the plug-in has plug-in actions configured.
         *
         * @param {String} pComponentTypeId Component Type Id of the plug-in. For example COMP_TYPE.REGION, ...
         * @param {String} pName Name of the plug-in
         *
         * @return {Boolean}
         *
         * @function hasPluginActions
         * @memberOf pe
         **/
        hasPluginActions: function( pComponentTypeId, pPlugin ) {

            let pluginType = gTypes[ pComponentTypeId ].pluginType;

            return (  pluginType
                   && hasOwnProperty( pluginType.plugins, pPlugin )
                   && pluginType.plugins[ pPlugin ].hasActions );

        }, // hasPluginActions


        /**
         * Function returns the meta data of a plugin action position.
         *
         * @param {String} pId Id of the position.
         *
         * @return {Object}
         *
         * @function getPluginActionPosition
         * @memberOf pe
         **/
        getPluginActionPosition: function( pId ) {

            if ( hasOwnProperty( gActionPositions, pId )) {
                return gActionPositions[ pId ];
            }

            return {};

        }, // getPluginActionPosition


        /**
         * Function returns the type of the action position currently used by the passed component.
         *
         * @param {Object} pComponent Component object which has to be of component type REGION_ACTION
         *                            or IR_COLUMN_ACTION.
         *
         * @return {String}
         *
         * @function getActionPositionType
         * @memberOf pe
         **/
        getActionPositionType: function( pComponent ) {

            let templateId = pComponent._properties[ PROP.HIDDEN_TEMPLATE_ID ]._value;

            if ( hasOwnProperty( gActionTemplates, templateId )) {
                return gActionTemplates[ templateId ].type;
            }

            return "";

        }, // getActionPositionType


        /**
         * Function returns the LOV display title of a LOV identified by component type, property and LOV value.
         *
         * @param {Number} pComponentTypeId Id of the component type
         * @param {Number} pPropertyId Id of the property
         * @param {Number} pLovValue LOV return value which is used to lookup the display title
         *
         * @return {String}
         *
         * @function getLovTitle
         * @memberOf pe
         **/
        getLovTitle: function( pComponentTypeId, pPropertyId, pLovValue ) {

            var lTitle       = gTypes[ pComponentTypeId ].properties[ pPropertyId ].nullText || "",
                lPropertyDef = gProperties[ pPropertyId ];

            if ( lPropertyDef.lovType === "STATIC" ) {

                if ( hasOwnProperty( lPropertyDef.lovValuesMap, pLovValue ) ) {
                    lTitle = lPropertyDef.lovValues[ lPropertyDef.lovValuesMap[ pLovValue ]].d;
                }

            } else if ( lPropertyDef.lovType === "EVENTS" ) {

                if ( hasOwnProperty( gEvents.lookupMap, pLovValue ) ) {
                    lTitle = gEvents.lookupMap[ pLovValue ].d;
                }

            }

            return lTitle;

        }, // getLovTitle

        /**
         * Function returns the property which stores the columns of a source location (for example: SQL query, table, web source, ...)
         *
         * @param {Number} pComponent Component object which holds source location properties (for example: region, jet chart series)
         *
         * @return {Property}
         *
         * @function getSourceLocationProperty
         * @memberOf pe
         **/
        getSourceLocationProperty: function( pComponent ) {

            let i, lProperty;

            // Go through the array of provided properties to find the first the one which is supported for the current component
            for ( i = 0; i < SOURCE_LOCATION_PROPS.length; i++ ) {

                lProperty = pComponent.getProperty( SOURCE_LOCATION_PROPS[ i ] );
                if ( lProperty ) {
                    return lProperty;
                }

            }
        }, // getSourceLocationProperty

        /**
         * Function returns the components which have an attribute which has an error. todo
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function getInvalidComponents
         * @memberOf pe
         **/
        getErrorComponents: function() {

            var lResults = {},
                lComponents;

            // Check each component type if it contains invalid components
            for ( let i in gTypes ) {
                if ( hasOwnProperty( gTypes, i ) ) {
                    lComponents = getComponents( i, { hasErrors: true } );

                    // Only add the component type if we have a hit for that type
                    if ( lComponents.length > 0 ) {
                        lResults[ i ] = lComponents;
                    }
                }
            }

            return lResults;

        }, // getErrorComponents


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function observer
         * @memberOf pe
         **/
        observer: function( pWidget, pFilter, pCallback, pSendInBulk ) {

            gObservers.push( {
                widget:               pWidget,
                filter:               $.extend( {}, { properties: [], events: []}, pFilter ),
                callback:             pCallback,
                sendInBulk:           pSendInBulk,
                pendingNotifications: []
            } );

        }, // observer


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function unobserver
         * @memberOf pe
         **/
        unobserver: function( pWidget, pFilter, pCallback ) {

            var lFilter,
                lRemove;

            for ( let i = 0; i < gObservers.length; i++ ) {
                if ( gObservers[ i ].widget === pWidget ) {

                    lFilter = gObservers[ i ].filter;

                    // Filter by component or by component type
                    if ( hasOwnProperty( pFilter, "component" ) ) {
                        if ( pFilter.component instanceof Component && lFilter.component instanceof Component ) {
                            if (  pFilter.component.typeId === lFilter.component.typeId
                                && pFilter.component.id     === lFilter.component.id ) {
                                lRemove = true;
                            }
                        } else if ( pFilter.component.typeId === lFilter.component.typeId ) {
                            lRemove = true;
                        }
                    } else {
                        lRemove = true;
                    }

                    // If properties have been specified we check them, otherwise we remove the observer independent of the set properties
                    if ( lRemove && hasOwnProperty( pFilter, "properties" ) ) {
                        lRemove = ( lFilter.properties.join( "," ) === pFilter.properties.join( "," ) );
                    }

                    // If events have been specified we check them, otherwise we remove the observer independent of the set events
                    if ( lRemove && hasOwnProperty( pFilter, "events" ) ) {
                        lRemove = ( lFilter.events.join( "," ) === pFilter.events.join( "," ) );
                    }

                    // If a callback function has been specified, we can check that as well
                    if ( lRemove && pCallback ) {
                        lRemove = ( gObservers[ i ].callback === pCallback );
                    }

                    if ( lRemove ) {
                        gObservers.splice( i, 1 );
                        i =- 1;
                    }
                }
            }
        }, // unobserver


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function setCurrentPageId
         * @memberOf pe
         **/
        setCurrentAppId: function( pAppId ) {

            gCurrentAppId = pAppId;

        }, // setCurrentAppId


        /**
         * todo documentation
         *
         * @return {String}
         *
         * { ... },
         *
         * @function getCurrentAppId
         * @memberOf pe
         **/
        getCurrentAppId: function() {

            return gCurrentAppId;

        }, // getCurrentAppId


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function setCurrentPageId
         * @memberOf pe
         **/
        setCurrentPageId: function( pPageId ) {

            var lPageLock = gComponents[ COMP_TYPE.PAGE ][ pPageId ]._lock;
            var subscriptionReference = gComponents[ COMP_TYPE.PAGE ][ pPageId ]._properties[ PROP.PAGE_SUBSCRIBED_FROM ]?._value;

            gCurrentPageId = pPageId + "";
            gCurrentApp = gSharedComponents.userInterface;
            if ( !gOptions.isReadOnly && ( lPageLock === false || lPageLock.isLockedByCurrentUser ) && !subscriptionReference ) {
                gIsPageReadOnly = false;
            } else {
                gIsPageReadOnly = true;
            }

            setPageGridProperties( true );

            // todo should that be really here?
            saveBaseComponents();

        }, // setCurrentPageId


        /**
         * todo documentation
         *
         * @return {String}
         *
         * { ... },
         *
         * @function getCurrentPageId
         * @memberOf pe
         **/
        getCurrentPageId: function() {

            return gCurrentPageId;

        }, // getCurrentPageId


        /**
         * todo documentation
         *
         * @return {String}
         *
         * { ... },
         *
         * @function getGlobalPageId
         * @memberOf pe
         **/
        getGlobalPageId: function() {

            return gCurrentApp.globalPageId;

        }, // getGlobalPageId


        /**
         * Returns true if the currently is a global page.
         *
         * @return {boolean}
         *
         * @function isGlobalPage
         * @memberOf pe
         **/
        isGlobalPage: isGlobalPage,


        /**
         * Returns true if the current page has meta tags
         *
         * @return {boolean}
         *
         * @function hasMetaTags
         * @memberOf pe
         **/
        hasMetaTags: hasMetaTags,


        /**
         * Returns true if the current page is read only. This could be because somebody else locked it or because
         * we don't have the necessary privileges.
         *
         * @return {boolean}
         *
         * @function isPageReadOnly
         * @memberOf pe
         **/
        isPageReadOnly: function() {

            return gIsPageReadOnly;

        }, // isPageReadOnly


        /**
         * Function returns the an array of all region types that supports faceted search.
         * This is just a wrapper of the internal function that's still required for functionality
         *
         * @param {Number} pRegionId ID of the region
         * @param {Boolean} pIncludeAutoRowid Define wether Auto Row ID should be included
         *
         * @return {Array}
         *
         * @function getRegionColumns
         * @memberOf pe
         **/
        getRegionColumns: getRegionColumns,


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function clear
         * @memberOf pe
         **/
        clear: function() {

            gDisplayGroups    = undefined;
            gProperties       = undefined;
            gTypes            = undefined;
            gPluginCategories = undefined;
            gEvents           = undefined;
            gFormatMasks      = undefined;
            gSharedComponents = undefined;
            gComponents       = {};
            gBaseComponents   = {};
            gCurrentAppId     = undefined;
            gCurrentPageId    = undefined;
            gCurrentApp       = undefined;
            gIsPageReadOnly   = true;
            gActionTemplates  = {};
            gActionPositions  = {};

            // Remove all observers which listen for specific components
            for ( let i = 0; i < gObservers.length; i++ ) {
                if ( gObservers[ i ].filter.component instanceof Component ) {
                    gObservers.splice( i, 1 );
                    i =- 1;
                }
            }

        }, // clear


        /**
         * todo documentation
         *
         * @return {Object}
         *
         * { ... },
         *
         * @function init
         * @memberOf pe
         **/
        init: function( pOptions ) {

            gOptions = pOptions;

        }, // init


        /**
         * For internal use and debugging.
         * @ignore
         */
        getAll: function() {

            return {
                displayGroups:    gDisplayGroups,
                properties:       gProperties,
                componentTypes:   gTypes,
                pluginCategories: gPluginCategories,
                sharedComponents: gSharedComponents,
                components:       gComponents,
                baseComponents:   gBaseComponents,
                observers:        gObservers
            };

        }
    };

} )( apex.jQuery, apex.util, apex.locale, apex.lang, apex.server, apex.debug );
