Rem  Copyright (c) 2006, 2024, Oracle and/or its affiliates.
Rem

Rem    NAME
Rem      apex_install_dictionary_view_data.sql
Rem

Rem    DESCRIPTION
Rem      Insert data into tables wwv_flow_dictionary_views
Rem

Rem    MODIFIED     (MM/DD/YYYY)
Rem      pawolf      05/08/2014 - Moved from apex_install_data.sql

set define '^'

prompt
prompt ...insert into wwv_flow_dictionary_views
prompt

declare
    procedure store_dictionary_view (
        p_view_name             in varchar2,
        p_parent_view_name      in varchar2,
        p_component_type_id     in number   default null,
        p_pk_column_name        in varchar2,
        p_display_expression    in varchar2,
        p_order_expression      in varchar2,
        p_order_seq             in number,
        p_lookup_or_lov_columns in varchar2,
        p_deprecated_columns    in varchar2 default null,
        p_link_url              in varchar2 default null )
    is
        c_lookup_or_lov_columns constant wwv_flow_dictionary_views.lookup_or_lov_columns%type :=
            p_lookup_or_lov_columns ||
            case when p_lookup_or_lov_columns is not null and p_deprecated_columns is not null then ',' end ||
            p_deprecated_columns;

        l_parent_view_id number;
    begin
        ------------------------------------------------------------------------
        -- get parent dictionary view.
        ------------------------------------------------------------------------
        if p_parent_view_name is not null
        then
            select id
              into l_parent_view_id
              from wwv_flow_dictionary_views
             where view_name = p_parent_view_name
            ;
        end if;
        ------------------------------------------------------------------------
        -- let's try an update first.
        ------------------------------------------------------------------------
        update wwv_flow_dictionary_views
           set parent_view_id        = l_parent_view_id,
               component_type_id     = p_component_type_id,
               pk_column_name        = p_pk_column_name,
               display_expression    = p_display_expression,
               order_expression      = p_order_expression,
               order_seq             = p_order_seq,
               lookup_or_lov_columns = c_lookup_or_lov_columns,
               link_url              = p_link_url
         where view_name             = p_view_name
        ;
        ------------------------------------------------------------------------
        -- let's do an insert if nothing has been updated.
        ------------------------------------------------------------------------
        if sql%rowcount = 0
        then
            insert into wwv_flow_dictionary_views (
                view_name,
                parent_view_id,
                component_type_id,
                pk_column_name,
                display_expression,
                order_expression,
                order_seq,
                lookup_or_lov_columns,
                link_url )
            values (
                p_view_name,
                l_parent_view_id,
                p_component_type_id,
                p_pk_column_name,
                p_display_expression,
                p_order_expression,
                p_order_seq,
                c_lookup_or_lov_columns,
                p_link_url );
        end if;
    end store_dictionary_view;
begin
    ----------------------------------------------------------------------------
    -- Note:
    --   p_lookup_or_lov_columns should contain all the columns which are
    --   Yes/No flags, LOV columns with static values or columns joined from
    --   another table. For example template name.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATIONS',
        p_parent_view_name      => NULL,
        p_pk_column_name        => 'APPLICATION_ID',
        p_display_expression    => 'APPLICATION_ID||'' - ''||APPLICATION_NAME',
        p_order_expression      => 'TO_CHAR(APPLICATION_ID, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'APPLICATION_GROUP,LOGGING,APPLICATION_PRIMARY_LANGUAGE,LANGUAGE_DERIVED_FROM,AUTHENTICATION_SCHEME_TYPE,MEDIA_TYPE,AUTHENTICATION_SCHEME,FLOW_STATUS_CODE,AVAILABILITY_STATUS,DEBUGGING,EXACT_SUBSTITUTIONS,BUILD_STATUS,PUBLISH,FRIENDLY_URL,AUTHORIZATION_SCHEME,SESSION_STATE_PROTECTION,AUTO_TIME_ZONE,CONTENT_DELIVERY_NETWORK,JAVASCRIPT_FILE_URLS,INCLUDE_LEGACY_JAVASCRIPT,DEFAULT_ERROR_DISPLAY_LOCATION,BROWSER_CACHE,BROWSER_FRAME,REFERRER_POLICY,COMPATIBILITY_MODE,AUTHORIZE_PUBLIC_PAGES,AUTHORIZE_BATCH_JOB,LOGO_TYPE,PRINT_REMOTE_SERVER_STATIC_ID,PRINT_REMOTE_SERVER_NAME,PRINT_CREDENTIAL_STATIC_ID,PRINT_CREDENTIAL_NAME,IS_PWA,PWA_IS_INSTALLABLE,PWA_MANIFEST_DISPLAY,PWA_MANIFEST_ORIENTATION,PWA_IS_PUSH_ENABLED,PWA_PUSH_CREDENTIAL_STATIC_ID,PWA_PUSH_CREDENTIAL_NAME,TOKENIZE_ROW_SEARCH,NAVIGATION_LIST,NAVIGATION_LIST_POSITION,NAVIGATION_LIST_TEMPLATE,NAV_LIST_TEMPLATE_OPTIONS,NAV_BAR_TYPE,NAV_BAR_TEMPLATE_OPTIONS,NAV_BAR_LIST,NAV_BAR_LIST_TEMPLATE,INCLUDE_LEGACY_JAVASCRIPT,INCLUDE_JQUERY_MIGRATE,THEME_STYLE_BY_USER_PREF,BUILT_WITH_LOVE,AUTO_DISMISS_SUCCESS_MSG,PASS_ECID,ACCESSIBLE_READ_ONLY',
        p_deprecated_columns    => 'VPD,THEME_NUMBER,HOME_LINK,LOGIN_URL,PAGE_TEMPLATE,ERROR_PAGE_TEMPLATE,CONTENT_DELIVERY_NETWORK,JAVASCRIPT_FILE_URLS,INCLUDE_LEGACY_JAVASCRIPT',
        p_link_url              => 'f?p=4000:4001:%session%::::F4000_P1_FLOW,FB_FLOW_ID:%pk_value%,%pk_value%' );
    ----------------------------------------------------------------------------
    -- Page.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_component_type_id     => 5000,
        p_pk_column_name        => 'PAGE_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||PAGE_NAME',
        p_order_expression      => 'TO_CHAR(PAGE_ID, ''0000000000'')',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'TAB_SET,PAGE_FUNCTION,ALLOW_DUPLICATE_SUBMISSIONS,INCLUDE_APEX_CSS_JS_YN,FOCUS_CURSOR,PAGE_TEMPLATE,AUTHORIZATION_SCHEME,BUILD_OPTION,PAGE_REQUIRES_AUTHENTICATION,PAGE_ACCESS_PROTECTION,PAGE_GROUP,FORM_AUTOCOMPLETE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,CACHED,CACHE_CONDITION_TYPE,BROWSER_CACHE,PAGE_MODE,OVERWRITE_NAVIGATION_LIST,NAVIGATION_LIST,NAVIGATION_LIST_TEMPLATE,NAVIGATION_LIST_POSITION,NAV_LIST_TEMPLATE_OPTIONS,RELOAD_ON_SUBMIT,RELOAD_ON_SUBMIT_CODE,WARN_ON_UNSAVED_CHANGES,IS_PAGE_PATTERN,DIALOG_RESIZABLE',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_REGIONS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'PARENT_REGION_NAME,TEMPLATE,NEW_GRID,NEW_GRID_ROW,NEW_GRID_COLUMN,DISPLAY_REGION_SELECTOR,DISPLAY_COLUMN,DISPLAY_POSITION,DISPLAY_POSITION_CODE,DISPLAY_ITEM_POSITION,DISPLAY_ITEM_POSITION_CODE,LOCATION_CODE,LOCATION,QUERY_TYPE_CODE,QUERY_TYPE,FUNCTION_BODY_LANGUAGE,ORDER_BY_TYPE_CODE,ORDER_BY_TYPE,SOURCE_POST_PROCESSING,INCLUDE_ROWID_COLUMN,USE_LOCAL_SYNC_TABLE,REMOTE_DATABASE_NAME,WEB_SOURCE_MODULE_NAME,EXTERNAL_ORDER_BY_TYPE_CODE,EXTERNAL_ORDER_BY_TYPE,TEMPLATE_COMPONENT_TYPE_CODE,TEMPLATE_COMPONENT_TYPE,BREADCRUMB_TEMPLATE,LIST_TEMPLATE_OVERRIDE,SOURCE_TYPE,SOURCE_TYPE_PLUGIN_NAME,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,CONDITION_TYPE,CONDITION_TYPE_CODE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,REPORT_TEMPLATE,HEADINGS_TYPE,PAGINATION_SCHEME,PAGINATION_DISPLAY_POSITION,AJAX_ENABLED,REST_ENABLED,STRIP_HTML,REPORT_COLUMN_SOURCE_TYPE,CUSTOMIZATION,BUILD_OPTION,REGION_CACHING,CACHE_WHEN,BREAK_DISPLAY_FLAG,ENABLE_CSV_OUTPUT,TRANSLATE_REGION_TITLE,FIXED_HEADER,IS_EDITABLE,EDIT_OPERATIONS,ADD_AUTHORIZATION_SCHEME,UPDATE_AUTHORIZATION_SCHEME,DELETE_AUTHORIZATION_SCHEME,LOST_UPDATE_CHECK_TYPE,ADD_ROW_IF_EMPTY,LAZY_LOADING,LANDMARK_TYPE,AI_ENABLED,AI_CONFIG_NAME,AI_REMOTE_SERVER_NAME,LANDMARK_TYPE_CODE,ROW_SELECTION_TYPE,ROW_SELECTION_TYPE_CODE,DUALITY_VIEW_NAME,DUALITY_VIEW_ID,JSON_SOURCE_NAME,JSON_SOURCE_ID',
        p_deprecated_columns    => 'SOURCE_TYPE_CODE,DISPLAY_COLUMN,ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15,ATTRIBUTE_16,ATTRIBUTE_17,ATTRIBUTE_18,ATTRIBUTE_19,ATTRIBUTE_20,ATTRIBUTE_21,ATTRIBUTE_22,ATTRIBUTE_23,ATTRIBUTE_24,ATTRIBUTE_25',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_REG_COLS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7710,
        p_pk_column_name        => 'REGION_COLUMN_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,SOURCE_TYPE,SOURCE_TYPE_CODE,DATA_TYPE,IS_PRIMARY_KEY,IS_QUERY_ONLY,ITEM_TYPE,IS_VISIBLE,HEADING_ALIGNMENT,VALUE_ALIGNMENT,LOV_TYPE,LOV_TYPE_CODE,LOV_LANGUAGE,LOV_DISPLAY_EXTRA,LOV_DISPLAY_NULL,INCLUDE_IN_EXPORT,ESCAPE_ON_HTTP_OUTPUT,CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,AUTHORIZATION_SCHEME_ID,USE_AS_ROW_HEADER,IS_GROUP',
        p_order_seq             => 1,
        p_deprecated_columns    => 'ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15,ATTRIBUTE_16,ATTRIBUTE_17,ATTRIBUTE_18,ATTRIBUTE_19,ATTRIBUTE_20,ATTRIBUTE_21,ATTRIBUTE_22,ATTRIBUTE_23,ATTRIBUTE_24,ATTRIBUTE_25',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_ITEMS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 5120,
        p_pk_column_name        => 'ITEM_ID',
        p_display_expression    => 'ITEM_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,DISPLAY_AS,DISPLAY_AS_CODE,ITEM_DATA_TYPE,DISPLAY_POSITION,DISPLAY_POSITION_CODE,ITEM_SOURCE_DATA_TYPE,IS_REQUIRED,IS_PRIMARY_KEY,IS_QUERY_ONLY,STANDARD_VALIDATIONS,REGION,DATA_SOURCE_REGION,SOURCE_USED,ITEM_DEFAULT_TYPE,ITEM_DEFAULT_LANGUAGE,ITEM_LABEL_TEMPLATE,ITEM_SOURCE_TYPE,SOURCE_LANGUAGE,ENCRYPT_SESSION_STATE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,LOV_LANGUAGE,LOV_NAMED_LOV,LOV_DISPLAY_EXTRA,LOV_DISPLAY_NULL,LOV_QUERY_RESULT_TRANSLATED,LOV_OPTIMIZE_REFRESH,NEW_GRID,NEW_GRID_ROW,NEW_GRID_COLUMN,LABEL_ALIGNMENT,ITEM_ALIGNMENT,CONDITION_TYPE,CONDITION_TYPE,MAINTAIN_SESSION_STATE,ITEM_PROTECTION_LEVEL,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,BUILD_OPTION,SHOW_QUICK_PICKS,BUTTON_EXECUTE_VALIDATIONS,WARN_ON_UNSAVED_CHANGES,WARN_ON_UNSAVED_CHANGES_CODE,AI_ENABLED,AI_CONFIG_NAME,AI_REMOTE_SERVER_NAME',
        p_deprecated_columns    => 'BEGINS_ON_NEW_ROW,BEGINS_ON_NEW_CELL,COLUMN_SPAN,ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15,ATTRIBUTE_16,ATTRIBUTE_17,ATTRIBUTE_18,ATTRIBUTE_19,ATTRIBUTE_20,ATTRIBUTE_21,ATTRIBUTE_22,ATTRIBUTE_23,ATTRIBUTE_24,ATTRIBUTE_25',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_RPT_COLS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7320, -- this will work for classic report columns, but not for legacy tabular forms, but it's ok.
        p_pk_column_name        => 'REGION_REPORT_COLUMN_ID',
        p_display_expression    => 'COLUMN_ALIAS',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,USE_AS_ROW_HEADER,PAGE_CHECKSUM,COLUMN_ALIGNMENT,HEADING_ALIGNMENT,DEFAULT_SORT_DIRECTION,SORTABLE_COLUMN,SUM_COLUMN,COLUMN_IS_HIDDEN,COLUMN_FIELD_TEMPLATE,IS_REQUIRED,STANDARD_VALIDATIONS,CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,DISPLAY_AS,DISPLAY_AS_CODE,NAMED_LIST_OF_VALUES,LOV_LANGUAGE,LOV_SHOW_NULLS,LOV_DISPLAY_EXTRA_VALUES,PRIMARY_KEY_COLUMN_SOURCE_TYPE,DERIVED_COLUMN,COLUMN_DEFAULT_TYPE,INCLUDE_IN_EXPORT,BUILD_OPTION',
        p_order_seq             => 2,
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_BUTTONS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 5130,
        p_pk_column_name        => 'BUTTON_ID',
        p_display_expression    => 'BUTTON_NAME',
        p_order_expression      => 'TO_CHAR(BUTTON_SEQUENCE, ''0000000000'')',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION,BUTTON_TEMPLATE,IS_HOT_BUTTON,DISPLAY_POSITION,DISPLAY_POSITION_CODE,ALIGNMENT,EXECUTE_VALIDATIONS,CONDITION_TYPE,CONDITION_TYPE_CODE,DATABASE_ACTION,BUILD_OPTION,AUTHORIZATION_SCHEME,BUTTON_POSITION,BUTTON_ACTION,BUTTON_ACTION_CODE,WARN_ON_UNSAVED_CHANGES,WARN_ON_UNSAVED_CHANGES_CODE,CONFIRM_ENABLED,CONFIRM_STYLE,SHOW_PROCESSING',
        p_deprecated_columns    => 'IMAGE_NAME,IMAGE_ATTRIBUTES',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_IR',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'REGION_NAME,PAGINATION_SCHEME,PAGINATION_DISPLAY_POSITION,LAZY_LOADING,BUTTON_TEMPLATE,SHOW_FINDER_DROP_DOWN,SHOW_DISPLAY_ROW_COUNT,SHOW_SEARCH_BAR,SHOW_SEARCH_TEXTBOX,SHOW_ACTIONS_MENU,SHOW_REPORTS_AS_TABS,SHOW_SELECT_COLUMNS,SHOW_ROWS_PER_PAGE,SHOW_FILTER,SHOW_SORT,SHOW_CONTROL_BREAK,SHOW_HIGHLIGHT,SHOW_COMPUTE,SHOW_AGGREGATE,SHOW_NOTIFY,SHOW_CHART,SHOW_GROUP_BY,SHOW_PIVOT,SHOW_FLASHBACK,SHOW_SAVE,SHOW_SAVE_PUBLIC,SAVE_PUBLIC_AUTH_SCHEME,SHOW_RESET,SHOW_DOWNLOAD,SHOW_HELP,DOWNLOAD_AUTH_SCHEME,DOWNLOAD_AUTH_SCHEME_ID,DOWNLOAD_FORMATS,DETAIL_LINK_TYPE,DETAIL_LINK_CHECKSUM_TYPE,DETAIL_LINK_CONDITION_TYPE,DETAIL_LINK_COND_TYPE_CODE,DETAIL_LINK_AUTH_SCHEME,ICON_VIEW_ENABLED_YN,ICON_VIEW_USE_CUSTOM,DETAIL_VIEW_ENABLED_YN,FIXED_HEADER',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_IR_COL',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_IR',
        p_component_type_id     => 7040,
        p_pk_column_name        => 'COLUMN_ID',
        p_display_expression    => 'COLUMN_ALIAS',
        p_order_expression      => 'TO_CHAR(DISPLAY_ORDER, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'COLUMN_GROUP,COLUMN_LINK_CHECKSUM_TYPE,USE_AS_ROW_HEADER,ALLOW_SORTING,ALLOW_FILTERING,ALLOW_HIGHLIGHTING,ALLOW_CTRL_BREAKS,ALLOW_AGGREGATIONS,ALLOW_COMPUTATIONS,ALLOW_CHARTING,ALLOW_GROUP_BY,ALLOW_PIVOT,ALLOW_HIDE,SYNCHRONIZE_FORM_LABEL,COLUMN_TYPE,DISPLAY_TEXT_AS,HEADING_ALIGNMENT,COLUMN_ALIGNMENT,RICH_TEXT_FORMAT,TZ_DEPENDENT,FILTER_LOV_SOURCE,NAMED_LOV,FILTER_DATE_RANGES,DISPLAY_CONDITION_TYPE,DISPLAY_CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,BUILD_OPTION,IS_PRIMARY_KEY',
        p_deprecated_columns    => 'ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15,ATTRIBUTE_16,ATTRIBUTE_17,ATTRIBUTE_18,ATTRIBUTE_19,ATTRIBUTE_20,ATTRIBUTE_21,ATTRIBUTE_22,ATTRIBUTE_23,ATTRIBUTE_24,ATTRIBUTE_25',
        p_link_url              => null);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_IGS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7910,
        p_pk_column_name        => 'INTERACTIVE_GRID_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'IS_EDITABLE,ADD_AUTHORIZATION_SCHEME,UPDATE_AUTHORIZATION_SCHEME,DELETE_AUTHORIZATION_SCHEME,LOST_UPDATE_CHECK_TYPE,ADD_ROW_IF_EMPTY,SUBMIT_CHECKED_ROWS,LAZY_LOADING,REQUIRES_FILTER,SELECT_FIRST_ROW,FIXED_ROW_HEIGHT,PAGINATION_TYPE,SHOW_TOTAL_ROW_COUNT,SHOW_TOOLBAR,ENABLE_SAVE_PUBLIC_REPORT,PUBLIC_REPORT_AUTH_SCHEME,ENABLE_SUBSCRIPTIONS,ENABLE_DOWNLOAD,DOWNLOAD_AUTH_SCHEME,DOWNLOAD_AUTH_SCHEME_ID,ENABLE_FLASHBACK,DEFINE_CHART_VIEW,ENABLE_MAIL_DOWNLOAD,FIXED_HEADER,SHOW_ICON_VIEW,ICON_VIEW_USE_CUSTOM,ICON_VIEW_ICON_TYPE,SHOW_DETAIL_VIEW',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_IG_COLUMNS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7940,
        p_pk_column_name        => 'COLUMN_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'SOURCE_TYPE,IS_QUERY_ONLY,IS_VISIBLE,USE_AS_ROW_HEADER,HEADING_ALIGNMENT,VALUE_ALIGNMENT,USE_GROUP_FOR,STRETCH,IS_REQUIRED,LOV_TYPE,LOV_LANGUAGE,LOV_DISPLAY_EXTRA,LOV_DISPLAY_NULL,AJAX_OPTIMIZE_REFRESH,ENABLE_FILTER,FILTER_IS_REQUIRED,FILTER_TEXT_CASE,FILTER_EXACT_MATCH,FILTER_DATE_RANGES,FILTER_LOV_TYPE,FILTER_LOV_LANGUAGE,ENABLE_SORT_GROUP,ENABLE_CONTROL_BREAK,ENABLE_HIDE,ENABLE_PIVOT,IS_PRIMARY_KEY,DEFAULT_TYPE,DEFAULT_LANGUAGE,DUPLICATE_VALUE,INCLUDE_IN_EXPORT,CONDITION_TYPE,CONDITION_TYPE_CODE,READ_ONLY_CONDITION_TYPE,READ_ONLY_CONDITION_TYPE_CODE,READONLY_FOR_EACH_ROW,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,RESTRICTED_CHARACTERS,BUILD_OPTION',
        p_deprecated_columns    => 'ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15,ATTRIBUTE_16,ATTRIBUTE_17,ATTRIBUTE_18,ATTRIBUTE_19,ATTRIBUTE_20,ATTRIBUTE_21,ATTRIBUTE_22,ATTRIBUTE_23,ATTRIBUTE_24,ATTRIBUTE_25',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_IG_COL_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7930,
        p_pk_column_name        => 'GROUP_ID',
        p_display_expression    => 'HEADING',
        p_order_expression      => 'HEADING',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => null,
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_COMP',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5520,
        p_pk_column_name        => 'COMPUTATION_ID',
        p_display_expression    => 'ITEM_NAME||'' ''||COMPUTATION_POINT',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')||COMPUTATION_POINT',
        p_order_seq             => 6,
        p_lookup_or_lov_columns => 'PAGE_NAME,COMPUTATION_POINT,COMPUTATION_TYPE,COMPUTATION_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_VAL',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5510,
        p_pk_column_name        => 'VALIDATION_ID',
        p_display_expression    => 'VALIDATION_NAME',
        p_order_expression      => 'TO_CHAR(VALIDATION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 7,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,VALIDATION_TYPE,VALIDATION_TYPE_CODE,ALWAYS_EXECUTE,CONDITION_TYPE,CONDITION_TYPE_CODE,EXEC_COND_FOR_EACH_ROW,ONLY_FOR_CHANGED_ROWS,WHEN_BUTTON_PRESSED,ERROR_DISPLAY_LOCATION,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_PROC',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5530,
        p_pk_column_name        => 'PROCESS_ID',
        p_display_expression    => 'PROCESS_NAME',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')||PROCESS_POINT',
        p_order_seq             => 8,
        p_lookup_or_lov_columns => 'PAGE_NAME,PROCESS_POINT,PROCESS_POINT_CODE,REGION_NAME,PROCESS_TYPE,PROCESS_TYPE_PLUGIN_NAME,PROCESS_SOURCE_LANGUAGE,ERROR_DISPLAY_LOCATION,WHEN_BUTTON_PRESSED,CONDITION_TYPE,CONDITION_TYPE_CODE,EXEC_COND_FOR_EACH_ROW,ONLY_FOR_CHANGED_ROWS,RUN_PROCESS,BUILD_OPTION,AUTHORIZATION_SCHEME,EXECUTION_CHAIN_ID,EXECUTION_CHAIN_NAME,INTERNAL_UID',
        p_deprecated_columns    => 'PROCESS_TYPE_CODE,RUNTIME_WHERE_CLAUSE',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_BRANCHES',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5540,
        p_pk_column_name        => 'BRANCH_ID',
        p_display_expression    => 'NVL(BRANCH_NAME, PROCESS_SEQUENCE||'' ''||INITCAP(REPLACE(BRANCH_POINT, ''_'', '' '')))',
        p_order_expression      => 'TO_CHAR(PROCESS_SEQUENCE, ''0000000000'')||BRANCH_POINT',
        p_order_seq             => 9,
        p_lookup_or_lov_columns => 'PAGE_NAME,BRANCH_POINT,WHEN_BUTTON_PRESSED,BRANCH_TYPE,BRANCH_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,SAVE_STATE_BEFORE_BRANCH,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_DA',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5140,
        p_pk_column_name        => 'DYNAMIC_ACTION_ID',
        p_display_expression    => 'DYNAMIC_ACTION_NAME',
        p_order_expression      => 'TO_CHAR(DYNAMIC_ACTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 10,
        p_lookup_or_lov_columns => 'PAGE_NAME,WHEN_SELECTION_TYPE,WHEN_SELECTION_TYPE_CODE,WHEN_REGION,WHEN_BUTTON,WHEN_CONDITION,WHEN_CONDITION_ELEMENT_TYPE,WHEN_EVENT_SCOPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME,NUMBER_OF_ACTIONS,EXECUTION_TYPE,EXECUTION_TYPE_CODE,EXECUTION_IMMEDIATE',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_DA_ACTS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_DA',
        p_component_type_id     => 5150,
        p_pk_column_name        => 'ACTION_ID',
        p_display_expression    => 'COALESCE(ACTION_PD_NAME, ACTION_NAME)',
        p_order_expression      => 'TO_CHAR(ACTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,DYNAMIC_ACTION_NAME,ACTION_CODE,DYNAMIC_ACTION_EVENT_RESULT,EXECUTE_ON_PAGE_INIT,AFFECTED_ELEMENTS_TYPE,AFFECTED_ELEMENTS_TYPE_CODE,AFFECTED_REGION,AFFECTED_BUTTON,STOP_EXECUTION_ON_ERROR,WAIT_FOR_RESULT,AI_ENABLED,AI_CONFIG_NAME,AI_REMOTE_SERVER_NAME,CLIENT_CONDITION_TYPE,CLIENT_CONDITION_TYPE_CODE,CLIENT_CONDITION_ELEMENT_TYPE,SERVER_CONDITION_TYPE,SERVER_CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME_ID,AUTHORIZATION_SCHEME,BUILD_OPTION,BUILD_OPTION_ID',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_CALENDARS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5110,
        p_pk_column_name        => 'REGION_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'PAGE_NAME,DATE_FORMAT,DISPLAY_TYPE,BEGIN_AT_START_OF_INTERVAL,TIME_FORMAT,LIST_VIEW_DAYS_DISPLAY,OPEN_LINK_IN,DRAG_DROP_AUTHORIZATION_SCHEME',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_CHARTS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 7810,
        p_pk_column_name        => 'CHART_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 11,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,CHART_TYPE,ANIMATION_ON_DISPLAY,ANIMATION_ON_DATA_CHANGE,ORIENTATION,DATA_CURSOR,DATA_CURSOR_BEHAVIOR,HIDE_AND_SHOW_BEHAVIOR,HOVER_BEHAVIOR,STACK,STACK_FONT_FAMILY,STACK_FONT_STYLE,STACK_FONT_SIZE,SPARK_CHART,DIAL_INDICATOR,DIAL_BACKGROUND,VALUE_FORMAT_TYPE,VALUE_FORMAT_SCALING,ZOOM_AND_SCROLL,ZOOM_DIRECTION,INITIAL_ZOOMING,TOOLTIP_RENDERED,SHOW_SERIES_NAME,SHOW_GROUP_NAME,SHOW_VALUE,SHOW_LABEL,LEGEND_RENDERED,LEGEND_POSITION,LEGEND_FONT_FAMILY,LEGEND_FONT_STYLE,LEGEND_FONT_SIZE,OVERVIEW_RENDERED,TIME_AXIS_TYPE,STOCK_RENDER_AS,PIE_SELECTION_EFFECT,VALUE_TEXT_TYPE',
        p_link_url              => 'f?p=4000:4500:%session%::NO:RP,1:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P1_PAGE:%application_id%,%page_id%,%application_id%' /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_CHART_S',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_CHARTS',
        p_component_type_id     => 7820,
        p_pk_column_name        => 'SERIES_ID',
        p_display_expression    => 'SERIES_NAME',
        p_order_expression      => 'TO_CHAR(SERIES_SEQ, ''0000000000'')',
        p_order_seq             => 12,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,SERIES_TYPE,DATA_SOURCE_TYPE,FUNCTION_BODY_LANGUAGE,ORDER_BY_TYPE_CODE,ORDER_BY_TYPE,LINE_STYLE,LINE_TYPE,MARKER_RENDERED,MARKER_SHAPE,ITEMS_LABEL_RENDERED,ITEMS_LABEL_POSITION,ITEMS_LABEL_FONT_FAMILY,ITEMS_LABEL_FONT_STYLE,ITEMS_LABEL_FONT_SIZE,LINK_TARGET_TYPE,AUTHORIZATION_SCHEME,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,SOURCE_POST_PROCESSING,INCLUDE_ROWID_COLUMN,USE_LOCAL_SYNC_TABLE,EXTERNAL_ORDER_BY_TYPE_CODE,EXTERNAL_ORDER_BY_TYPE,AGGREGATE_FUNCTION',
        p_link_url              => 'f?p=4000:4500:%session%::NO:RP,1:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P1_PAGE:%application_id%,%page_id%,%application_id%' /* can edit only from PD */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_CHART_A',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_CHARTS',
        p_component_type_id     => 7830,
        p_pk_column_name        => 'AXIS_ID',
        p_display_expression    => 'AXIS',
        p_order_expression      => 'AXIS',
        p_order_seq             => 13,
        p_lookup_or_lov_columns => 'PAGE_NAME,AXIS,TITLE_FONT_FAMILY,TITLE_FONT_STYLE,TITLE_FONT_SIZE,AXIS_FORMAT_TYPE,IS_RENDERED,AXIS_FORMAT_SCALING,AXIS_SCALING,AXIS_BASELINE_SCALING,AXIS_POSITION,AXIS_MAJOR_TICK_RENDERED,AXIS_MINOR_TICK_RENDERED,AXIS_TICK_LABEL_RENDERED,AXIS_TICK_LABEL_POSITION,TICK_LABEL_FONT_FAMILY,TICK_LABEL_FONT_STYLE,TICK_LABEL_FONT_SIZE',
        p_link_url              => 'f?p=4000:4500:%session%::NO:RP,1:FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P1_PAGE:%application_id%,%page_id%,%application_id%' /* can edit only from PD */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_FILTERS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 8010,
        p_pk_column_name        => 'ITEM_ID',
        p_display_expression    => 'ITEM_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,ITEM_NAME,ITEM_TYPE,LABEL,ITEM_DEFAULT_TYPE,ITEM_DEFAULT,SHOW_LABEL,IS_COLLAPSIBLE,IS_INITIAL_COLLAPSED,HAS_CLIENT_SIDE_FILTERING,SORT_BY_TOP_COUNTS,SHOW_SELECTED_FIRST,ZERO_COUNT_ENTRIES,SHOW_COUNTS,COMPUTE_COUNTS,ITEM_SOURCE_DATA_TYPE,REGION,ITEM_DEFAULT_TYPE,ENCRYPT_SESSION_STATE,LOV_NAMED_LOV,LOV_DISPLAY_NULL,LOV_SORT_DIRECTION,LOV_CASCADE_PARENT_REQUIRED,DEPENDING_ON_CONDITION_TYPE,CONDITION_TYPE,ESCAPE_ON_HTTP_OUTPUT,AUTHORIZATION_SCHEME,BUILD_OPTION,FACET_GROUP,SHOW_CHART,INITIAL_CHART,ACTIONS_FILTER,IS_TOGGLEABLE,IS_INITIAL_TOGGLED,MULTI_VALUE_TYPE_CODE,MULTI_VALUE_TYPE,MULTI_VALUE_TRIM_SPACE,MULTI_VALUE_FILTER_COMBINATION,SUGGESTIONS_TYPE,SUGGESTIONS_LANGUAGE,DISPLAY_AS',
        p_link_url              => null /* can edit only from PD */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_CARDS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 8110,
        p_pk_column_name        => 'CARD_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,LAYOUT_TYPE,CARD_APPEARANCE,ICON_SOURCE_TYPE,ICON_POSITION,MEDIA_SOURCE_TYPE,MEDIA_DISPLAY_POSITION,MEDIA_APPEARANCE,MEDIA_SIZING,TITLE_ADV_FORMATTING,SUB_TITLE_ADV_FORMATTING,BODY_ADV_FORMATTING,SECOND_BODY_ADV_FORMATTING,MEDIA_ADV_FORMATTING',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_CARD_ACTIONS',
        p_parent_view_name      => 'APEX_APPL_PAGE_CARDS',
        p_component_type_id     => 8120,
        p_pk_column_name        => 'ACTION_ID',
        p_display_expression    => 'ACTION_TYPE',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,ACTION_TYPE,POSITION,LINK_TARGET_TYPE,BUTTON_DISPLAY_TYPE,IS_HOT,CONDITION_TYPE,EXEC_COND_FOR_EACH_ROW,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_COMP_ACTIONS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 8610,
        p_pk_column_name        => 'COMPONENT_ACTION_ID',
        p_display_expression    => 'POSITION_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,IR_COLUMN_ALIAS,POSITION_NAME,TEMPLATE_NAME,LINK_TARGET_TYPE_CODE,LINK_TARGET_TYPE,BUTTON_DISPLAY_TYPE_CODE,BUTTON_DISPLAY_TYPE,IS_HOT,SHOW_AS_DISABLED,CONDITION_TYPE,EXEC_COND_FOR_EACH_ROW,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_MENU_ENTRIES',
        p_parent_view_name      => 'APEX_APPL_PAGE_COMP_ACTIONS',
        p_component_type_id     => 8710,
        p_pk_column_name        => 'MENU_ENTRY_ID',
        p_display_expression    => 'NVL(LABEL, ''---'')',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'PAGE_NAME,ACTION_POSITION_NAME,MENU_ENTRY_TYPE_CODE,MENU_ENTRY_TYPE,LINK_TARGET_TYPE_CODE,LINK_TARGET_TYPE,CONDITION_TYPE,EXEC_COND_FOR_EACH_ROW,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_FILTER_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 8010,
        p_pk_column_name        => 'ITEM_GROUP_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION,SHOW_LABEL,IS_COLLAPSIBLE,IS_INITIAL_COLLAPSED,SORT_BY_TOP_COUNTS,SHOW_SELECTED_FIRST,ZERO_COUNT_ENTRIES,SHOW_COUNTS,COMPUTE_COUNTS,SHOW_CHART,INITIAL_CHART,IS_TOGGLEABLE,IS_INITIAL_TOGGLED,REGION,AUTHORIZATION_SCHEME,BUILD_OPTION,SUGGESTIONS_TYPE,SUGGESTIONS_LANGUAGE,DISPLAY_AS',
        p_link_url              => null /* can edit only from PD */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_MAPS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 8210,
        p_pk_column_name        => 'MAP_ID',
        p_display_expression    => 'REGION_NAME',
        p_order_expression      => 'REGION_NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,BACKGROUND_MAP_TYPE,BACKGROUND_MAP_TYPE_CODE,NAVIGATION_BAR_TYPE,NAVIGATION_BAR_TYPE_CODE,NAVIGATION_BAR_POSITION,NAVIGATION_BAR_POSITION_CODE,INITIAL_POS_TYPE,INITIAL_POS_TYPE_CODE,INITIAL_POS_FROM_BROWSER,INITIAL_POS_GEOMETRY_TYPE,INITIAL_POS_GEOMETRY_TYPE_CODE,LAYER_MESSAGES_POSITION,LAYER_MESSAGES_POSITION_CODE,SHOW_LEGEND,LEGEND_POSITION,LEGEND_POSITION_CODE,MAP_FEATURES,UNIT_SYSTEM,UNIT_SYSTEM_CODE',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_MAP_LAYERS',
        p_parent_view_name      => 'APEX_APPL_PAGE_MAPS',
        p_component_type_id     => 8220,
        p_pk_column_name        => 'LAYER_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'PAGE_NAME,REGION_NAME,LOCATION,LOCATION_CODE,QUERY_TYPE,QUERY_TYPE_CODE,FUNCTION_BODY_LANGUAGE,SOURCE_POST_PROCESSING,SOURCE_POST_PROCESSING_CODE,INCLUDE_ROWID_COLUMN,HAS_SPATIAL_INDEX,REMOTE_DATABASE_NAME,CACHE_MODE,WEB_SOURCE_MODULE_NAME,USE_LOCAL_SYNC_TABLE,LAYER_TYPE,LAYER_TYPE_CODE,GEOMETRY_COLUMN_DATA_TYPE,GEOMETRY_COLUMN_DATA_TYPE_CODE,ALLOWED_GEOMETRY_TYPE,FILL_COLOR_IS_SPECTRUM,COLOR_SPECTRUM_TYPE,COLOR_SPECTRUM_TYPE_CODE,STROKE_STYLE,STROKE_STYLE_CODE,POINT_DISPLAY_TYPE,POINT_DISPLAY_TYPE_CODE,POINT_ICON_SOURCE_TYPE,POINT_ICON_SOURCE_TYPE_CODE,FEATURE_CLUSTERING,TOOLTIP_ADV_FORMATTING,INFO_WINDOW_ADV_FORMATTING,LINK_TARGET_TYPE,LINK_TARGET_TYPE_CODE,DISPLAY_IN_LEGEND,ALLOW_HIDE,CONDITION_TYPE,EXEC_COND_FOR_EACH_ROW,AUTHORIZATION_SCHEME,BUILD_OPTION,POLYGON_EXTRUDE_UNIT,DUALITY_VIEW_NAME,DUALITY_VIEW_ID,JSON_SOURCE_NAME,JSON_SOURCE_ID',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_SEARCH_SOURCES',
        p_parent_view_name      => 'APEX_APPLICATION_PAGE_REGIONS',
        p_component_type_id     => 8520,
        p_pk_column_name        => 'SEARCH_SOURCE_ID',
        p_display_expression    => 'SEARCH_CONFIG_LABEL',
        p_order_expression      => 'DISPLAY_SEQUENCE',
        p_order_seq             => 64,
        p_lookup_or_lov_columns => 'SEARCH_SOURCE_ID,SEARCH_CONFIG_ID,CONDITION_TYPE,USE_AS_INITIAL_RESULT,USE_AS_INITIAL_RESULT_CODE',
        p_link_url              => null /* can edit only from PD */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PAGE_META_TAGS',
        p_parent_view_name      => 'APEX_APPLICATION_PAGES',
        p_component_type_id     => 5160,
        p_pk_column_name        => 'META_TAG_ID',
        p_display_expression    => 'META_TAG_NAME',
        p_order_expression      => 'META_TAG_NAME',
        p_order_seq             => 65,
        p_lookup_or_lov_columns => null,
        p_link_url              => null /* can edit only from PD */ );
    ----------------------------------------------------------------------------
    -- Shared Components.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_SETTINGS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PLUGIN_SETTING_ID',
        p_display_expression    => 'PLUGIN',
        p_order_expression      => 'PLUGIN',
        p_order_seq             => 14,
        p_lookup_or_lov_columns => 'PLUGIN_TYPE,PLUGIN,PLUGIN_CODE',
        p_link_url              => 'f?p=4000:4446:%session%::NO:4446:P4446_ID,FB_FLOW_ID,FB_FLOW_PAGE_ID:%pk_value%,%application_id%,%page_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_COMPUTATIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_COMPUTATION_ID',
        p_display_expression    => 'COMPUTATION_ITEM||'' ''||COMPUTATION_POINT',
        p_order_expression      => 'TO_CHAR(COMPUTATION_SEQUENCE, ''0000000000'')||COMPUTATION_POINT',
        p_order_seq             => 15,
        p_lookup_or_lov_columns => 'COMPUTATION_POINT,COMPUTATION_TYPE,COMPUTATION_LANGUAGE,AUTHORIZATION_SCHEME,BUILD_OPTION,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:4304:%session%::::F4000_P4304_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PROCESSES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_PROCESS_ID',
        p_display_expression    => 'PROCESS_NAME',
        p_order_expression      => 'TO_CHAR(PROCESS_SEQUENCE, ''0000000000'')||PROCESS_POINT',
        p_order_seq             => 16,
        p_lookup_or_lov_columns => 'PROCESS_POINT,PROCESS_TYPE,PROCESS_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4309:%session%::::F4000_P4309_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_ITEMS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_ITEM_ID',
        p_display_expression    => 'ITEM_NAME',
        p_order_expression      => 'ITEM_NAME',
        p_order_seq             => 17,
        p_lookup_or_lov_columns => 'DATA_TYPE,SESSION_STATE_PROTECTION,ESCAPE_ON_HTTP_OUTPUT,BUILD_OPTION',
        p_link_url              => 'f?p=4000:4303:%session%::NO::F4000_P4303_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BREADCRUMBS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'BREADCRUMB_ID',
        p_display_expression    => 'BREADCRUMB_NAME',
        p_order_expression      => 'BREADCRUMB_NAME',
        p_order_seq             => 18,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:104:%session%::NO:RP,104:P104_MENU_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BC_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_BREADCRUMBS',
        p_pk_column_name        => 'BREADCRUMB_ENTRY_ID',
        p_display_expression    => 'ENTRY_LABEL',
        p_order_expression      => 'ENTRY_LABEL',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => 'f?p=4000:104:%session%::NO:RP,104:P104_ID,P104_MENU_ID:%pk_value%,%parent_pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LISTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LIST_ID',
        p_display_expression    => 'LIST_NAME',
        p_order_expression      => 'LIST_NAME',
        p_order_seq             => 19,
        p_lookup_or_lov_columns => 'BUILD_OPTION,LIST_TYPE,LIST_TYPE_CODE,LIST_LANGUAGE',
        p_deprecated_columns    => 'TEMPLATE',
        p_link_url              => 'f?p=4000:4050:%session%::NO:RP,4050:F4000_P4050_LIST_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LIST_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_LISTS',
        p_pk_column_name        => 'LIST_ENTRY_ID',
        p_display_expression    => 'ENTRY_TEXT',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'LIST_NAME,PARENT_ENTRY_TEXT,CURRENT_FOR_PAGES_TYPE,CURRENT_FOR_PAGES_TYPE_CODE,CURRENT_FOR_PAGES_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,COUNT_CLICKS,TRANSLATE_ATTRIBUTES,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4052:%session%::NO:RP,4050,4052:F4000_P4052_ID,F4000_P4050_LIST_ID,FB_FLOW_ID:%pk_value%,%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_RPT_QUERIES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'REPORT_QUERY_ID',
        p_display_expression    => 'REPORT_QUERY_NAME',
        p_order_expression      => 'REPORT_QUERY_NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'REPORT_LAYOUT_NAME',
        p_link_url              => 'f?p=4000:1116:%session%::NO:1116,1117,1112:P1116_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_RPT_QRY_STMTS',
        p_parent_view_name      => 'APEX_APPLICATION_RPT_QUERIES',
        p_pk_column_name        => 'REPORT_QUERY_STMT_ID',
        p_display_expression    => 'REPORT_QUERY_STMT_ID',
        p_order_expression      => 'REPORT_QUERY_STMT_ID',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'REPORT_QUERY_NAME',
        p_link_url              => '#' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_RPT_QRY_SOURCES',
        p_parent_view_name      => 'APEX_APPLICATION_RPT_QUERIES',
        p_pk_column_name        => 'REPORT_QUERY_SRC_ID',
        p_display_expression    => 'REPORT_QUERY_SRC_ID',
        p_order_expression      => 'REPORT_QUERY_SRC_ID',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'REPORT_QUERY_NAME',
        p_link_url              => '#' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_RPT_LAYOUTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'REPORT_LAYOUT_ID',
        p_display_expression    => 'REPORT_LAYOUT_NAME',
        p_order_expression      => 'REPORT_LAYOUT_NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => '',
        p_link_url              => 'f?p=4000:1405:%session%::NO:1405:P1405_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LOVS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LOV_ID',
        p_display_expression    => 'LIST_OF_VALUES_NAME',
        p_order_expression      => 'LIST_OF_VALUES_NAME',
        p_order_seq             => 20,
        p_lookup_or_lov_columns => 'LOV_TYPE,IS_SUBSCRIBED,SUBSCRIBED_FROM,LOCATION,USE_LOCAL_SYNC_TABLE,LOCATION_CODE,REMOTE_DATABASE_NAME,WEB_SOURCE_MODULE_NAME,SOURCE_POST_PROCESSING,CACHE_MODE,SOURCE_TYPE,SOURCE_TYPE_CODE,FUNCTION_BODY_LANGUAGE,DEFAULT_SORT_DIRECTION,DEFAULT_SORT_DIRECTION_CODE,GROUP_SORT_DIRECTION,GROUP_SORT_DIRECTION_CODE,DUALITY_VIEW_NAME,DUALITY_VIEW_ID,JSON_SOURCE_NAME,JSON_SOURCE_ID',
        p_link_url              => 'f?p=4000:4111:%session%::NO:4111:F4000_P4111_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LOV_ENTRIES',
        p_parent_view_name      => 'APEX_APPLICATION_LOVS',
        p_pk_column_name        => 'LOV_ENTRY_ID',
        p_display_expression    => 'DISPLAY_VALUE',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'LIST_OF_VALUES_NAME,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION',
        p_link_url              => 'f?p=4000:4113:%session%::NO:RP,4113,4111:F4000_P4113_ID,F4000_P4111_ID,FB_FLOW_ID:%pk_value%,%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_LOV_COLS',
        p_parent_view_name      => 'APEX_APPLICATION_LOVS',
        p_pk_column_name        => 'LOV_COLUMN_ID',
        p_display_expression    => 'QUERY_COLUMN_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'LIST_OF_VALUES_NAME,IS_SEARCHABLE_CODE,IS_SEARCHABLE,IS_DEFAULT_SORT_CODE,IS_DEFAULT_SORT,DEFAULT_SORT_DIRECTION_CODE,DEFAULT_SORT_DIRECTION',
        p_link_url              => '' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_NAV_BAR',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'NAV_BAR_ID',
        p_display_expression    => 'ICON_SUBTEXT',
        p_order_expression      => 'ICON_SUBTEXT',
        p_order_seq             => 21,
        p_lookup_or_lov_columns => 'BEGINS_ON_NEW_LINE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:4308:%session%::::F4000_P4308_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PARENT_TABS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PARENT_TAB_ID',
        p_display_expression    => 'TAB_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 22,
        p_lookup_or_lov_columns => 'CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:331:%session%::NO::FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TABS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'TAB_ID',
        p_display_expression    => 'TAB_NAME',
        p_order_expression      => 'TO_CHAR(DISPLAY_SEQUENCE, ''0000000000'')',
        p_order_seq             => 23,
        p_lookup_or_lov_columns => 'PARENT_TABSET,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,AUTHORIZATION_SCHEME',
        p_link_url              => 'f?p=4000:4305:%session%::::F4000_P4305_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_AUTH',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'AUTHENTICATION_SCHEME_ID',
        p_display_expression    => 'AUTHENTICATION_SCHEME_NAME',
        p_order_expression      => 'AUTHENTICATION_SCHEME_NAME',
        p_order_seq             => 24,
        p_lookup_or_lov_columns => 'IS_CURRENT_AUTHENTICATION,IS_SUBSCRIBED,CODE_LANGUAGE,SCHEME_TYPE,SCHEME_TYPE_CODE,INVALID_SESSION_TYPE,COOKIE_SECURE',
        p_link_url              => 'f?p=4000:4495:%session%::::P4495_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_AUTHORIZATION',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'AUTHORIZATION_SCHEME_ID',
        p_display_expression    => 'AUTHORIZATION_SCHEME_NAME',
        p_order_expression      => 'AUTHORIZATION_SCHEME_NAME',
        p_order_seq             => 25,
        p_lookup_or_lov_columns => 'SCHEME_TYPE,SCHEME_TYPE_CODE,CACHING,IS_SUBSCRIBED',
        p_link_url              => 'f?p=4000:4008:%session%::NO::F4000_P4008_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SHORTCUTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SHORTCUT_ID',
        p_display_expression    => 'SHORTCUT_NAME',
        p_order_expression      => 'SHORTCUT_NAME',
        p_order_seq             => 26,
        p_lookup_or_lov_columns => 'SHORTCUT_TYPE,SHORTCUT_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:4048:%session%::NO::F4000_P4048_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_WEB_SERVICES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'WEB_SERVICE_ID',
        p_display_expression    => 'WEB_SERVICE_NAME',
        p_order_expression      => 'WEB_SERVICE_NAME',
        p_order_seq             => 27,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,SOAP_VERSION',
        p_link_url              => NULL /* doesn't work */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TREES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_TREE_ID',
        p_display_expression    => 'TREE_NAME',
        p_order_expression      => 'TREE_NAME',
        p_order_seq             => 28,
        p_lookup_or_lov_columns => 'TREE_TYPE',
        p_link_url              => 'f?p=4000:27:%session%::NO::F4000_P27_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGINS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'PLUGIN_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 29,
        p_lookup_or_lov_columns => 'PLUGIN_TYPE,CATEGORY,SUPPORTED_COMPONENT_TYPES,SUPPORTED_DATA_TYPES,SUBSCRIBED_FROM,SUBSCRIBE_PLUGIN_SETTINGS,STANDARD_ATTRIBUTES,SUBSTITUTE_ATTRIBUTES,IS_TEMPLATE_TRANSLATABLE,DEFAULT_ESCAPE_MODE',
        p_deprecated_columns    => 'ATTRIBUTE_01,ATTRIBUTE_02,ATTRIBUTE_03,ATTRIBUTE_04,ATTRIBUTE_05,ATTRIBUTE_06,ATTRIBUTE_07,ATTRIBUTE_08,ATTRIBUTE_09,ATTRIBUTE_10,ATTRIBUTE_11,ATTRIBUTE_12,ATTRIBUTE_13,ATTRIBUTE_14,ATTRIBUTE_15',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ATTRIBUTES',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_ATTRIBUTE_ID',
        p_display_expression    => 'PROMPT',
        p_order_expression      => 'PROMPT',
        p_order_seq             => 30,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,ATTRIBUTE_SCOPE,ATTRIBUTE_TYPE,IS_REQUIRED,IS_COMMON,SHOW_IN_WIZARD,COLUMN_DATA_TYPES,SUPPORTED_COMPONENT_TYPES,IS_TRANSLATABLE,DEPENDING_ON_ALWAYS_EVAL,DEPENDING_ON_CONDITION_TYPE,REFERENCE_SCOPE,ESCAPE_MODE,ATTRIBUTE_GROUP_TITLE,IMPORTANT_FOR_ACCESSIBILITY',
        p_link_url              => 'f?p=4000:4415:%session%::NO::P4415_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ATTR_GROUPS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_ATTRIBUTE_GROUP_ID',
        p_display_expression    => 'TITLE',
        p_order_expression      => 'TITLE',
        p_order_seq             => 30,
        p_lookup_or_lov_columns => 'PLUGIN_NAME',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ATTR_VALUES',
        p_parent_view_name      => 'APEX_APPL_PLUGIN_ATTRIBUTES',
        p_pk_column_name        => 'PLUGIN_ATTRIBUTE_VALUE_ID',
        p_display_expression    => 'DISPLAY_VALUE',
        p_order_expression      => 'DISPLAY_VALUE',
        p_order_seq             => 31,
        p_lookup_or_lov_columns => 'PLUGIN_ATTRIBUTE_PROMPT,IS_QUICK_PICK',
        p_link_url              => 'f?p=4000:4416:%session%::NO::P4416_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_STD_ATTRS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_STD_ATTRIBUTE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 30,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,NAME,IS_REQUIRED,SUPPORTED_COMPONENT_TYPES,DEPENDING_ON_CONDITION_TYPE',
        p_link_url              => 'f?p=4000:4411:%session%::NO::P4411_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_FILES',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 31,
        p_lookup_or_lov_columns => 'PLUGIN_NAME',
        p_link_url              => 'f?p=4000:118:%session%::NO:118:FB_FLOW_ID,P118_SCOPE,P118_APP_ID,P118_PLUGIN_ID,P118_ID:%application_id%,PLUGIN,%application_id%,%parent_pk_value%,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_EVENTS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_EVENT_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 32,
        p_lookup_or_lov_columns => 'PLUGIN_NAME',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ACT_TEMPLATES',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_ACTION_TEMPLATE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 33,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,TYPE_CODE,TYPE,IS_TEMPLATE_TRANSLATABLE',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_ACT_POSITIONS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_ACTION_POSITION_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 34,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,IS_QUICK_PICK,TYPE_CODE,TYPE',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PLUGIN_SLOTS',
        p_parent_view_name      => 'APEX_APPL_PLUGINS',
        p_pk_column_name        => 'PLUGIN_SLOT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 35,
        p_lookup_or_lov_columns => 'PLUGIN_NAME,HAS_GRID_SUPPORT,HAS_REGION_SUPPORT,HAS_ITEM_SUPPORT,HAS_BUTTON_SUPPORT,GLV_NEW_ROW,SUPPORTED_REGION_TYPES,SUPPORTED_ITEM_TYPES',
        p_link_url              => 'f?p=4000:4410:%session%::NO::P4410_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANSLATIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'TRANSLATION_ENTRY_ID',
        p_display_expression    => 'TRANSLATABLE_MESSAGE',
        p_order_expression      => 'TRANSLATABLE_MESSAGE',
        p_order_seq             => 33,
        p_lookup_or_lov_columns => 'LANGUAGE_CODE,IS_JS_MESSAGE',
        p_link_url              => 'f?p=4000:4009:%session%::NO::F4000_P4009_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANS_DYNAMIC',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'MESSAGE_ID',
        p_display_expression    => 'FROM_MESSAGE',
        p_order_expression      => 'FROM_MESSAGE',
        p_order_seq             => 34,
        p_lookup_or_lov_columns => 'LANGUAGE_CODE',
        p_link_url              => 'f?p=4000:4757:%session%::NO::F4000_P4757_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TRANS_REPOS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'ID',
        p_display_expression    => 'FROM_STRING||'' - ''||ATTRIBUTE_DESCRIPTION',
        p_order_expression      => 'FROM_STRING||'' - ''||ATTRIBUTE_DESCRIPTION',
        p_order_seq             => 35,
        p_lookup_or_lov_columns => 'FROM_STRING,ATTRIBUTE_DESCRIPTION,LANGUAGE_CODE',
        p_link_url              => 'f?p=4000:704:%session%::NO::P704_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_BUILD_OPTIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'BUILD_OPTION_ID',
        p_display_expression    => 'BUILD_OPTION_NAME',
        p_order_expression      => 'BUILD_OPTION_NAME',
        p_order_seq             => 36,
        p_lookup_or_lov_columns => 'BUILD_OPTION_STATUS,STATUS_ON_EXPORT,ON_UPGRADE_KEEP_STATUS',
        p_link_url              => 'f?p=4000:4911:%session%::NO:4911:F4000_P4911_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'LOAD_TABLE_ID',
        p_display_expression    => 'TABLE_NAME',
        p_order_expression      => 'TABLE_NAME',
        p_order_seq             => 37,
        p_lookup_or_lov_columns => 'IS_UK1_CASE_SENSITIVE,IS_UK2_CASE_SENSITIVE,IS_UK3_CASE_SENSITIVE,COLUMN_NAMES_LOV_ID,SKIP_VALIDATION',
        p_link_url              => 'f?p=4000:1801:%session%::NO:1801:P1801_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLE_LOOKUPS',
        p_parent_view_name      => 'APEX_APPL_LOAD_TABLES',
        p_pk_column_name        => 'LOOKUP_ID',
        p_display_expression    => 'LOAD_COLUMN_NAME',
        p_order_expression      => 'LOAD_COLUMN_NAME',
        p_order_seq             => 38,
        p_lookup_or_lov_columns => 'INSERT_NEW_VALUE',
        p_link_url              => 'f?p=4000:1802:%session%::NO:1802:P1802_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_LOAD_TABLE_RULES',
        p_parent_view_name      => 'APEX_APPL_LOAD_TABLES',
        p_pk_column_name        => 'RULE_ID',
        p_display_expression    => 'RULE_NAME',
        p_order_expression      => 'RULE_NAME',
        p_order_seq             => 39,
        p_lookup_or_lov_columns => 'RULE_TYPE',
        p_link_url              => 'f?p=4000:1804:%session%::NO:1804:P1804_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_STATIC_FILES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 40,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:118:%session%::NO:118:FB_FLOW_ID,P118_SCOPE,P118_APP_ID,P118_ID:%application_id%,APP,%application_id%,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_CONCATENATED_FILES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'CONCATENATED_FILE_ID',
        p_display_expression    => 'COMBINED_FILE_URL',
        p_order_expression      => 'COMBINED_FILE_URL',
        p_order_seq             => 41,
        p_lookup_or_lov_columns => 'BUILD_OPTION',
        p_link_url              => 'f?p=4000:209:%session%::NO:209:P209_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_DEVELOPER_COMMENTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'COMMENT_ID',
        p_display_expression    => 'DEVELOPER_COMMENT',
        p_order_expression      => 'DEVELOPER_COMMENT',
        p_order_seq             => 42,
        p_lookup_or_lov_columns => 'PAGES',
        p_link_url              => 'f?p=4000:1236:%session%::NO:RP,1236:P1236_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SETTINGS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'APPLICATION_SETTING_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 43,
        p_lookup_or_lov_columns => 'IS_REQUIRED,ON_UPGRADE_KEEP_VALUE',
        p_link_url              => 'f?p=4000:4851:%session%::::F4000_P4851_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_ACL_ROLES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'ROLE_ID',
        p_display_expression    => 'ROLE_NAME',
        p_order_expression      => 'ROLE_NAME',
        p_order_seq             => 44,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:2320:%session%::::F4000_P2320_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_ACL_USERS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'ID',
        p_display_expression    => 'USER_NAME',
        p_order_expression      => 'USER_NAME',
        p_order_seq             => 45,
        p_lookup_or_lov_columns => 'ROLE_STATIC_IDS,ROLE_NAMES',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_ACL_USER_ROLES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'USER_ROLE_ID',
        p_display_expression    => 'USER_NAME',
        p_order_expression      => 'USER_NAME',
        p_order_seq             => 45,
        p_lookup_or_lov_columns => 'ROLE_STATIC_ID,ROLE_NAME,ROLE_DESC',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_EMAIL_TEMPLATES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'EMAIL_TEMPLATE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 46,
        p_lookup_or_lov_columns => 'TEMPLATE_DIRECTIVES_SUPPORTED',
        p_link_url              => 'f?p=4000:4861:%session%::NO:RP,4861:F4000_P4861_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_AUTOMATIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'AUTOMATION_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 47,
        p_lookup_or_lov_columns => 'TRIGGER_TYPE_CODE,TRIGGER_TYPE,POLLING_STATUS_CODE,POLLING_STATUS,RESULT_TYPE_CODE,RESULT_TYPE,LOCATION_CODE,LOCATION,QUERY_TYPE_CODE,QUERY_TYPE,FUNCTION_BODY_LANGUAGE,SOURCE_POST_PROCESSING_CODE,SOURCE_POST_PROCESSING,INCLUDE_ROWID_COLUMN,REMOTE_DATABASE_NAME,WEB_SOURCE_MODULE_NAME,USE_LOCAL_SYNC_TABLE,COMMIT_EACH_ROW,ERROR_HANDLING_TYPE_CODE,ERROR_HANDLING_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE,BUILD_OPTION,DUALITY_VIEW_NAME,DUALITY_VIEW_ID,JSON_SOURCE_NAME,JSON_SOURCE_ID',
        p_link_url              => 'f?p=4000:7021:%session%::NO:RP,7021:P7021_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_AUTOMATION_ACTIONS',
        p_parent_view_name      => 'APEX_APPL_AUTOMATIONS',
        p_pk_column_name        => 'AUTOMATION_ACTION_ID',
        p_display_expression    => 'ACTION_NAME',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 48,
        p_lookup_or_lov_columns => 'AUTOMATION_NAME,ACTION_TYPE_CODE,ACTION_TYPE,LOCATION_CODE,LOCATION,REMOTE_DATABASE_NAME,ACTION_CLOB_LANGUAGE,WEB_SOURCE_MODULE_NAME,STOP_EXECUTION_ON_ERROR,CONDITION_TYPE_CODE,CONDITION_TYPE,EXEC_COND_FOR_EACH_ROW,BUILD_OPTION',
        p_link_url              => 'f?p=4000:7022:%session%::NO:RP,7022:P7022_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TASKDEFS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'TASK_DEF_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 63,
        p_lookup_or_lov_columns => 'ACTION_TABLE_OWNER,ACTION_TABLE_NAME,DUE_ON_TYPE_CODE,DUE_ON_TYPE,DUE_ON_LANGUAGE,EXPIRATION_POLICY_CODE,EXPIRATION_POLICY,TASK_TYPE,TASK_TYPE_CODE,INITIATOR_CAN_COMPLETE',
        p_link_url              => 'f?p=4000:9502:%session%::NO:RP,9502:P9502_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TASKDEF_ACTIONS',
        p_parent_view_name      => 'APEX_APPL_TASKDEFS',
        p_pk_column_name        => 'TASK_DEF_ACTION_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 64,
        p_lookup_or_lov_columns => 'TASK_DEF_NAME,ACTION_TYPE_CODE,ACTION_TYPE,ON_EVENT_CODE,ON_EVENT,OUTCOME_CODE,OUTCOME,LOCATION_CODE,LOCATION,REMOTE_DATABASE_NAME,ACTION_CLOB_LANGUAGE,WEB_SOURCE_MODULE_NAME,STOP_EXECUTION_ON_ERROR,LOG_MESSAGE_TYPE,CONDITION_TYPE_CODE,CONDITION_TYPE,BUILD_OPTION',
        p_link_url              => 'f?p=4000:9506:%session%::NO:RP,9506:P9506_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TASKDEF_PARAMS',
        p_parent_view_name      => 'APEX_APPL_TASKDEFS',
        p_pk_column_name        => 'PARAMETER_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'LABEL',
        p_order_seq             => 65,
        p_lookup_or_lov_columns => 'TASK_DEF_NAME,DATA_TYPE,IS_REQUIRED,IS_VISIBLE,IS_UPDATABLE',
        p_link_url              => 'f?p=4000:9502:%session%::NO:RP,9502:P9502_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TASKDEF_COMP_PARAMS',
        p_parent_view_name      => 'APEX_APPL_TASKDEF_PARAMS',
        p_pk_column_name        => 'COMPONENT_PARAMETER_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_expression      => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_seq             => 66,
        p_lookup_or_lov_columns => 'COMPONENT_TYPE,COMPONENT_NAME,PARAM_TYPE,VALUE_TYPE,VALUE_LANGUAGE',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TASKDEF_PARTICIPANTS',
        p_parent_view_name      => 'APEX_APPL_TASKDEFS',
        p_pk_column_name        => 'PARTICIPANT_ID',
        p_display_expression    => 'PARTICIPANT_TYPE||'' - ''||VALUE_TYPE||'' - ''||VALUE',
        p_order_expression      => 'PARTICIPANT_TYPE||'' - ''||VALUE_TYPE||'' - ''||VALUE',
        p_order_seq             => 67,
        p_lookup_or_lov_columns => 'TASK_DEF_NAME,PARTICIPANT_TYPE,VALUE_TYPE,VALUE_LANGUAGE',
        p_link_url              => 'f?p=4000:9502:%session%::NO:RP,9502:P9502_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%');
    store_dictionary_view(
        p_view_name             => 'APEX_APPL_DATA_LOADS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'DATA_LOAD_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 49,
        p_lookup_or_lov_columns => 'TARGET_TYPE_CODE,TARGET_TYPE,DATA_PROFILE_ID,LOADING_METHOD_CODE,LOADING_METHOD,ERROR_HANDLING_CODE,ERROR_HANDLING,IS_SUBSCRIBED',
        p_link_url              => 'f?p=4000:1820:%session%::NO:1820:P1820_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Themes.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEMES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'THEME_NUMBER',
        p_display_expression    => 'THEME_NAME',
        p_order_expression      => 'THEME_NAME',
        p_order_seq             => 36,
        p_lookup_or_lov_columns => 'UI_TYPE_NAME,NAVIGATION_TYPE,NAVIGATION_TYPE_CODE,IS_LOCKED,IS_CURRENT,NAVIGATION_TYPE,DEFAULT_NAV_LIST_POSITION,CURRENT_THEME_STYLE,DEFAULT_PAGE_TEMPLATE,DEFAULT_DIALOG_TEMPLATE,DEFAULT_BUTTON_TEMPLATE,DEFAULT_REGION_TEMPLATE,DEFAULT_CHART_RG_TEMPLATE,DEFAULT_FORM_RG_TEMPLATE,DEFAULT_REPORT_REGION_TEMPLATE,DEFAULT_TABULAR_FORM_TEMPLATE,DEFAULT_WIZARD_TEMPLATE,DEFAULT_BREADCRUMB_RG_TEMPLATE,DEFAULT_REPORT_ROW_TEMPLATE,DEFAULT_ITEM_LABEL_TEMPLATE,DEFAULT_BREADCRUMB_TEMPLATE,DEFAULT_CALENDAR_TEMPLATE,DEFAULT_LIST_TEMPLATE,DEFAULT_TOP_NAV_LIST_TEMPLATE,DEFAULT_SIDE_NAV_LIST_TEMPLATE,DEFAULT_OPTION_LABEL,DEFAULT_REQUIRED_LABEL,DEFAULT_IRR_TEMPLATE,DEFAULT_HEADER_TEMPLATE,DEFAULT_FOOTER_TEMPLATE,DEFAULT_DIALOGBTNR_TEMPLATE,DEFAULT_DIALOGR_TEMPLATE,ICON_LIBRARY,DEFAULT_NAV_BAR_LIST_TEMPLATE,NAV_BAR_TYPE,NAV_BAR_TYPE_CODE',
        p_link_url              => 'f?p=4000:267:%session%::NO:RP,267:P267_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEME_STYLES',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'THEME_STYLE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:177:%session%::NO:RP,177:P177_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_THEME_FILES',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'THEME_FILE_ID',
        p_display_expression    => 'FILE_NAME',
        p_order_expression      => 'FILE_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM',
        p_link_url              => 'f?p=4000:118:%session%::NO:118:FB_FLOW_ID,P118_SCOPE,P118_APP_ID,P118_THEME_ID,P118_ID:%application_id%,THEME,%application_id%,%parent_pk_value%,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMPLATE_OPTIONS',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_OPTION_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,IS_ADVANCED',
        p_link_url              => '' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMPLATE_OPT_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_OPT_GROUP_ID',
        p_display_expression    => 'DISPLAY_NAME',
        p_order_expression      => 'DISPLAY_NAME',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,SUBSCRIBED_FROM,IS_ADVANCED',
        p_link_url              => '' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_BC',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'BREADCRUMB_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:289:%session%::NO:289:F4000_P289_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_BUTTON',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'BUTTON_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 4,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:204:%session%::NO:204:F4000_P204_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_CALENDAR',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'CALENDAR_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:697:%session%::NO:697:F4000_P697_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_LABEL',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'LABEL_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 6,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:85:%session%::NO:85:F4000_P85_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_LIST',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'LIST_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 7,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:4655:%session%::NO:4655:F4000_P4655_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_PAGE',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'PAGE_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 8,
        p_lookup_or_lov_columns => 'GRID_TYPE,GRID_TYPE_CODE,GRID_ALWAYS_USE_MAX_COLUMNS,GRID_HAS_COLUMN_SPAN,GRID_ALWAYS_EMIT,GRID_EMIT_EMPTY_LEADING_COLS,GRID_EMIT_EMPTY_TRAILING_COLS,THEME_CLASS,IS_POPUP,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE,MOBILE_PAGE_TEMPLATE,DIALOG_BROWSER_FRAME',
        p_deprecated_columns    => 'HAS_EDIT_LINKS,TEMPLATE_ID,MULTICOLUMN_REGION_TABLE_ATTR',
        p_link_url              => 'f?p=4000:4307:%session%::NO:4307:F4000_P4307_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMP_PAGE_DP',
        p_parent_view_name      => 'APEX_APPLICATION_TEMP_PAGE',
        p_pk_column_name        => 'PAGE_TMPL_DISPLAY_POINT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'HAS_GRID_SUPPORT,HAS_REGION_SUPPORT,HAS_ITEM_SUPPORT,HAS_BUTTON_SUPPORT,GLV_NEW_ROW',
        p_link_url              => 'f?p=4000:4307:%session%::NO:4307:F4000_P4307_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_POPUPLOV',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_ID',
        p_display_expression    => '''Popup LOV''',
        p_order_expression      => '''Popup LOV''',
        p_order_seq             => 9,
        p_lookup_or_lov_columns => 'THEME_CLASS,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:251:%session%::NO:251:F4000_P251_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_REGION',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'REGION_TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 10,
        p_lookup_or_lov_columns => 'LAYOUT,THEME_CLASS,DEFAULT_LABEL_ALIGNMENT,DEFAULT_FIELD_ALIGNMENT,DEFAULT_BUTTON_POSITION,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATABLE',
        p_link_url              => 'f?p=4000:4653:%session%::NO:4653:F4000_P4653_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_TEMP_REGION_DP',
        p_parent_view_name      => 'APEX_APPLICATION_TEMP_REGION',
        p_pk_column_name        => 'REGION_TMPL_DISPLAY_POINT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => 'HAS_GRID_SUPPORT,HAS_REGION_SUPPORT,HAS_ITEM_SUPPORT,HAS_BUTTON_SUPPORT,GLV_NEW_ROW',
        p_link_url              => 'f?p=4000:4653:%session%::NO:4653:F4000_P4653_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_TEMP_REPORT',
        p_parent_view_name      => 'APEX_APPLICATION_THEMES',
        p_pk_column_name        => 'TEMPLATE_ID',
        p_display_expression    => 'TEMPLATE_NAME',
        p_order_expression      => 'TEMPLATE_NAME',
        p_order_seq             => 11,
        p_lookup_or_lov_columns => 'THEME_CLASS,TEMPLATE_TYPE,COL_TEMPLATE_DISPLAY_COND1,COL_TEMPLATE_DISPLAY_COND2,COL_TEMPLATE_DISPLAY_COND3,COL_TEMPLATE_DISPLAY_COND4,IS_SUBSCRIBED,SUBSCRIBED_FROM,TRANSLATE_THIS_TEMPLATE',
        p_link_url              => 'f?p=4000:258:%session%::NO:258:F4000_P258_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOWS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'WORKFLOW_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 1,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:9600:%session%::NO:RP,9600:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_VERSIONS',
        p_parent_view_name      => 'APEX_APPL_WORKFLOWS',
        p_pk_column_name        => 'VERSION_ID',
        p_display_expression    => 'WORKFLOW_VERSION',
        p_order_expression      => 'WORKFLOW_VERSION',
        p_order_seq             => 2,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,STATE,STATE_CODE,QUERY_TYPE,QUERY_TYPE_CODE',
        p_component_type_id     => 8820,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_PARAMS',
        p_parent_view_name      => 'APEX_APPL_WORKFLOWS',
        p_pk_column_name        => 'PARAM_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'LABEL',
        p_order_seq             => 3,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,DATA_TYPE,DATA_TYPE_CODE,IS_REQUIRED,DIRECTION,DIRECTION_CODE',
        p_component_type_id     => 8810,
        p_link_url              => null /* can edit only from Workflow Designer */ );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_COMP_PARAMS',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_PARAMS',
        p_pk_column_name        => 'COMPONENT_PARAMETER_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_expression      => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_seq             => 4,
        p_lookup_or_lov_columns => 'COMPONENT_TYPE,COMPONENT_NAME,PARAM_TYPE,VALUE_TYPE,VALUE_LANGUAGE,IGNORE_OUTPUT,PARAM_NAME,VALUE_TYPE_CODE',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_PARTICIPANT',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_VERSIONS',
        p_pk_column_name        => 'PARTICIPANT_ID',
        p_display_expression    => 'PARTICIPANT_TYPE||'' - ''||VALUE_TYPE||'' - ''||VALUE',
        p_order_expression      => 'PARTICIPANT_TYPE||'' - ''||VALUE_TYPE||'' - ''||VALUE',
        p_order_seq             => 5,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,WORKFLOW_VERSION,PARTICIPANT_TYPE,PARTICIPANT_TYPE_CODE,VALUE_TYPE,VALUE_TYPE_CODE,VALUE_LANGUAGE',
        p_component_type_id     => 8860,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_VARIABLES',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_VERSIONS',
        p_pk_column_name        => 'VARIABLE_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'LABEL',
        p_order_seq             => 6,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,WORKFLOW_VERSION,DATA_TYPE,DATA_TYPE_CODE,IS_REQUIRED',
        p_component_type_id     => 8840,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_ACTIVITIES',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_VERSIONS',
        p_pk_column_name        => 'ACTIVITY_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 7,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,WORKFLOW_VERSION,DUE_ON_TYPE,DUE_ON_LANGUAGE,ACTIVITY_TYPE,ACTIVITY_TYPE_CODE,LOCATION,LOCATION_CODE,REMOTE_DATABASE_NAME,WEB_SOURCE_MODULE_NAME,EMAIL_TEMPLATE_NAME,ACTIVITY_CODE_LANGUAGE,DUE_ON_TYPE_CODE,PARENT_ACTIVITY_NAME,',
        p_component_type_id     => 8830,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_TRANSITIONS',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_ACTIVITIES',
        p_pk_column_name        => 'TRANSITION_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 8,
        p_lookup_or_lov_columns => 'FROM_ACTIVITY_NAME,TO_ACTIVITY_NAME,TRANSITION_TYPE,TRANSITION_TYPE_CODE,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_component_type_id     => 8870,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_BRANCHES',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_ACTIVITIES',
        p_pk_column_name        => 'BRANCH_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 9,
        p_lookup_or_lov_columns => 'FROM_ACTIVITY_NAME,TO_ACTIVITY_NAME,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_component_type_id     => 8880,
        p_link_url              => null /* can edit only from Workflow Designer */);
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WORKFLOW_ACT_VARS',
        p_parent_view_name      => 'APEX_APPL_WORKFLOW_ACTIVITIES',
        p_pk_column_name        => 'VARIABLE_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'LABEL',
        p_order_seq             => 10,
        p_lookup_or_lov_columns => 'WORKFLOW_NAME,WORKFLOW_VERSION,WORKFLOW_ACTIVITY,DATA_TYPE,DATA_TYPE_CODE,IS_REQUIRED,VALUE_TYPE,VALUE_TYPE_CODE,VALUE_LANGUAGE',
        p_component_type_id     => 8850,
        p_link_url              => null /* can edit only from Workflow Designer */);

    ----------------------------------------------------------------------------
    -- Misc.
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUBSTITUTIONS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUBSTITUTION_STRING',
        p_display_expression    => 'SUBSTITUTION_STRING',
        p_order_expression      => 'SUBSTITUTION_STRING',
        p_order_seq             => 39,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:4001:%session%::NO:2:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_PAGE_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'GROUP_ID',
        p_display_expression    => 'PAGE_GROUP_NAME',
        p_order_expression      => 'PAGE_GROUP_NAME',
        p_order_seq             => 40,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:521:%session%::NO:521,RP:P521_ID,FB_FLOW_ID:%parent_pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_WORKSPACE_PREFERENCES',
        p_parent_view_name      => null,
        p_pk_column_name        => 'PREFERENCE_ID',
        p_display_expression    => 'USER_NAME||'' - ''||PREFERENCE_NAME||'' - ''||PREFERENCE_ID',
        p_order_expression      => 'USER_NAME||'' - ''||PREFERENCE_NAME||'' - ''||PREFERENCE_ID',
        p_order_seq             => 63,
        p_lookup_or_lov_columns => null,
        p_link_url              => null );
    ----------------------------------------------------------------------------
    -- Supporting Objects
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJECTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUPPORTING_OBJECT_ID',
        p_display_expression    => 'SUPPORTING_OBJECT_ID',
        p_order_expression      => 'TO_CHAR(SUPPORTING_OBJECT_ID)',
        p_order_seq             => 50,
        p_lookup_or_lov_columns => 'INCLUDE_IN_APPLICATION_EXPORT',
        p_link_url              => 'f?p=4000:567:%session%::NO:567,RP:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_BOPT',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'INSTALL_BUILD_OPTION_ID',
        p_display_expression    => 'BUILD_OPTION',
        p_order_expression      => 'BUILD_OPTION',
        p_order_seq             => 51,
        p_lookup_or_lov_columns => 'BUILD_OPTION,DEFAULT_STATUS',
        p_link_url              => 'f?p=4000:511:%session%::NO:511,RP:FB_FLOW_ID:%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_CHCK',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'CHECK_ID',
        p_display_expression    => 'CHECK_NAME',
        p_order_expression      => 'TO_CHAR(CHECK_SEQUENCE, ''0000000000'')',
        p_order_seq             => 52,
        p_lookup_or_lov_columns => 'CHECK_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:376:%session%::NO:RP,376:P376_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPLICATION_SUPP_OBJ_SCR',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SUPPORTING_OBJECT_SCRIPT_ID',
        p_display_expression    => 'SCRIPT_NAME||''(''||SCRIPT_TYPE||'')''',
        p_order_expression      => 'TO_CHAR(EXECUTION_SEQUENCE, ''0000000000'')',
        p_order_seq             => 53,
        p_lookup_or_lov_columns => 'SCRIPT_TYPE,CONDITION_TYPE,CONDITION_TYPE_CODE',
        p_link_url              => 'f?p=4000:865:%session%::NO:865,RP:P865_SCRIPT_ID,P865_MODE,FB_FLOW_ID:%pk_value%,EDIT,%application_id%' );
    ----------------------------------------------------------------------------
    -- Web Sources and Data profiles
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_DATA_PROFILES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'DATA_PROFILE_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 54,
        p_lookup_or_lov_columns => 'IS_SINGLE_ROW,HAS_HEADER_ROW,USE_RAW_SELECTORS',
        p_link_url              => 'f?p=4000:1925:%session%::NO:1925,RP:P1925_DATA_PROFILE_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_DATA_PROFILE_COLS',
        p_parent_view_name      => 'APEX_APPL_DATA_PROFILES',
        p_pk_column_name        => 'DATA_PROFILE_COLUMN_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'SEQUENCE',
        p_order_seq             => 55,
        p_lookup_or_lov_columns => 'COLUMN_TYPE,COLUMN_SELECTOR_TYPE,TRANSFORM_TYPE,IS_PRIMARY_KEY,IS_HIDDEN,DATA_TYPE,REMOTE_DATA_TYPE,IS_FILTERABLE',
        p_link_url              => 'f?p=4000:1926:%session%::NO:1926,RP:P1925_DATA_PROFILE_ID,P1926_DATA_PROFILE_COLUMN_ID:%parent_pk_value%,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_DUALITY_VIEWS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SOURCE_ID',
        p_display_expression    => 'SOURCE_NAME',
        p_order_expression      => 'SOURCE_NAME',
        p_order_seq             => 56,
        p_lookup_or_lov_columns => 'SOURCE_ID,LOCATION,LOCATION_CODE,REMOTE_DATABASE_NAME,REMOTE_DATABASE_ID,CACHE_MODE,CACHE_MODE_CODE,DATA_PROFILE_ID',
        p_link_url              => 'f?p=4000:7110:%session%::NO:7110,RP:P7100_SOURCE_TYPE,P7110_ID:DUALITY_VIEW,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_JSON_SOURCES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SOURCE_ID',
        p_display_expression    => 'SOURCE_NAME',
        p_order_expression      => 'SOURCE_NAME',
        p_order_seq             => 57,
        p_lookup_or_lov_columns => 'SOURCE_ID,LOCATION,LOCATION_CODE,REMOTE_DATABASE_NAME,REMOTE_DATABASE_ID,CACHE_MODE,CACHE_MODE_CODE,DATA_PROFILE_ID',
        p_link_url              => 'f?p=4000:7110:%session%::NO:7110,RP:P7100_SOURCE_TYPE,P7110_ID:JSON_TABLE,%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_SERVERS',
        p_parent_view_name      => null,
        p_pk_column_name        => 'REMOTE_SERVER_ID',
        p_display_expression    => 'REMOTE_SERVER_NAME',
        p_order_expression      => 'REMOTE_SERVER_NAME',
        p_order_seq             => 58,
        p_lookup_or_lov_columns => 'IS_SUBSCRIBED,CREDENTIAL_ID',
        p_link_url              => 'f?p=4000:1932:%session%::NO:1932,RP:P1932_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_MODULES',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'MODULE_ID',
        p_display_expression    => 'MODULE_NAME',
        p_order_expression      => 'MODULE_NAME',
        p_order_seq             => 59,
        p_lookup_or_lov_columns => 'MODULE_ID,REMOTE_SERVER_NAME,REMOTE_SERVER_ID,REMOTE_SERVER_STATIC_ID,AUTH_SERVER_NAME,AUTH_SERVER_STATIC_ID,CREDENTIAL_ID,CREDENTIAL_NAME,CREDENTIAL_STATIC_ID,WEB_SOURCE_TYPE,WEB_SOURCE_TYPE_CODE,OPERATIONS_COUNT,DATA_PROFILE_ID,DATA_PROFILE_NAME,DATA_FORMAT,SYNC_IS_ACTIVE,SYNC_TYPE,PASS_ECID,SYNC_RATELIMIT_EXCEED_ACTION,IS_SUBSCRIBED',
        p_link_url              => 'f?p=4000:1921:%session%::NO:1921,RP:P1921_WEB_SRC_MODULE_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_OPERATIONS',
        p_parent_view_name      => 'APEX_APPL_WEB_SRC_MODULES',
        p_pk_column_name        => 'OPERATION_ID',
        p_display_expression    => 'MODULE_NAME||'' - ''||SERVICE_OPERATION||'' (''||DATABASE_OPERATION||'')''',
        p_order_expression      => 'SERVICE_OPERATION',
        p_order_seq             => 60,
        p_lookup_or_lov_columns => 'CACHE_MODE,MODULE_ID,AUTHORIZATION_SCHEME_ID,ALLOW_FETCH_ALL_ROWS',
        p_link_url              => 'f?p=4000:1922:%session%::NO:1922,RP:P1922_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_PARAMETERS',
        p_parent_view_name      => 'APEX_APPL_WEB_SRC_OPERATIONS',
        p_pk_column_name        => 'PARAMETER_ID',
        p_display_expression    => 'NAME||'' (''||DIRECTION||'')''',
        p_order_expression      => 'NAME',
        p_order_seq             => 61,
        p_lookup_or_lov_columns => 'IS_REQUIRED,DIRECTION,IS_STATIC,IS_ARRAY,OMIT_WHEN_NULL,IS_QUERY_PARAM,PARAM_TYPE,MODULE_ID,DATA_TYPE',
        p_link_url              => 'f?p=4000:1922:%session%::NO:1922,RP:P1922_ID:%parent_pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_WORKSPACE_RESTENABLED_SQL',
        p_parent_view_name      => null,
        p_pk_column_name        => 'REMOTE_SERVER_ID',
        p_display_expression    => 'REMOTE_SERVER_NAME',
        p_order_expression      => 'REMOTE_SERVER_NAME',
        p_order_seq             => 62,
        p_lookup_or_lov_columns => 'CREDENTIAL_ID',
        p_link_url              => 'f?p=4000:1601:%session%::NO:1601,RP:P1601_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_WORKSPACE_CREDENTIALS',
        p_parent_view_name      => null,
        p_pk_column_name        => 'CREDENTIAL_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 63,
        p_lookup_or_lov_columns => 'CREDENTIAL_TYPE_CODE,CREDENTIAL_TYPE,PROMPT_ON_INSTALL,DB_CREDENTIAL_IS_INSTANCE',
        p_link_url              => 'f?p=4000:1621:%session%::NO:1621,RP:P1621_ID:%pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_COMP_PARAMS',
        p_parent_view_name      => 'APEX_APPL_WEB_SRC_PARAMETERS',
        p_pk_column_name        => 'COMPONENT_PARAMETER_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_expression      => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME',
        p_order_seq             => 64,
        p_lookup_or_lov_columns => 'COMPONENT_TYPE,COMPONENT_NAME,PARAM_TYPE,DIRECTION,VALUE_TYPE,DATA_TYPE,VALUE_LANGUAGE,IGNORE_OUTPUT',
        p_link_url              => null );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_WEB_SRC_SYNC_STEPS',
        p_parent_view_name      => 'APEX_APPL_WEB_SRC_MODULES',
        p_pk_column_name        => 'SYNC_STEP_ID',
        p_display_expression    => 'MODULE_NAME||'' - ''||STATIC_ID',
        p_order_expression      => 'EXECUTION_SEQUENCE',
        p_order_seq             => 65,
        p_lookup_or_lov_columns => 'MODULE_NAME,IS_ACTIVE',
        p_link_url              => 'f?p=4000:1951:%session%::NO:1951,RP:P1951_WEB_SRC_MODULE_ID:%parent_pk_value%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_SEARCH_CONFIGS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'SEARCH_CONFIG_ID',
        p_display_expression    => 'LABEL||'' - ''||STATIC_ID',
        p_order_expression      => 'LABEL',
        p_order_seq             => 66,
        p_lookup_or_lov_columns => 'SEARCH_TYPE,SEARCH_TYPE_CODE,LOCATION_CODE,LOCATION,LIST_ID,LIST_NAME,REMOTE_DATABASE_NAME,REMOTE_DATABASE_ID,WEB_SOURCE_MODULE_NAME,WEB_SOURCE_MODULE_ID,QUERY_TYPE_CODE,QUERY_TYPE,LINK_TARGET_TYPE,LINK_TARGET_TYPE_CODE,ICON_SOURCE_TYPE,ICON_SOURCE_TYPE_CODE,AUTHORIZATION_SCHEME,AUTHORIZATION_SCHEME_ID,BUILD_OPTION,BUILD_OPTION_ID,SOURCE_POST_PROCESSING_CODE,SOURCE_POST_PROCESSING,FUNCTION_BODY_LANGUAGE,IS_SUBSCRIBED,SUBSCRIBED_FROM,SUBSCRIBED_FROM_ID,CONDITION_TYPE',
        p_link_url              => 'f?p=4000:3120:%session%::NO:3120,RP:P3120_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_INVOKE_API_PARAMS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'COMPONENT_PARAMETER_ID',
        p_display_expression    => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME||'' - ''||NAME',
        p_order_expression      => 'PAGE_ID||'' - ''||COMPONENT_TYPE||'' - ''||COMPONENT_NAME||'' - ''||DISPLAY_SEQUENCE',
        p_order_seq             => 67,
        p_lookup_or_lov_columns => 'COMPONENT_TYPE,COMPONENT_NAME,IS_FUNCTION_RESULT,DIRECTION,HAS_DEFAULT,IGNORE_OUTPUT,VALUE_TYPE_CODE,VALUE_TYPE,VALUE_LANGUAGE',
        p_link_url              => null );
    ----------------------------------------------------------------------------
    -- PWA Shortcuts
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PWA_SHORTCUTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_component_type_id     => 3210,
        p_pk_column_name        => 'PWA_SHORTCUT_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'DISPLAY_SEQUENCE',
        p_order_seq             => 68,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:508:%session%::NO::F4000_P508_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- PWA Screenshots
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_PWA_SCREENSHOTS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_component_type_id     => 3220,
        p_pk_column_name        => 'PWA_SCREENSHOT_ID',
        p_display_expression    => 'LABEL',
        p_order_expression      => 'DISPLAY_SEQUENCE',
        p_order_seq             => 69,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:519:%session%::NO::F4000_P519_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Map Backgrounds
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_MAP_BACKGROUNDS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'MAP_BACKGROUND_ID',
        p_display_expression    => 'NAME',
        p_order_expression      => 'NAME',
        p_order_seq             => 70,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:6120:%session%::NO:6120,RP:P6120_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- Component Groups
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_COMPONENT_GROUPS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'COMPONENT_GROUP_ID',
        p_display_expression    => 'COMPONENT_GROUP_NAME',
        p_order_expression      => 'COMPONENT_GROUP_NAME',
        p_order_seq             => 71,
        p_lookup_or_lov_columns => null,
        p_link_url              => 'f?p=4000:6201:%session%::NO:6201,RP:P6201_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    ----------------------------------------------------------------------------
    -- AI Config
    ----------------------------------------------------------------------------
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_AI_CONFIGS',
        p_parent_view_name      => 'APEX_APPLICATIONS',
        p_pk_column_name        => 'CONFIG_ID',
        p_display_expression    => 'CONFIG_NAME',
        p_order_expression      => 'CONFIG_NAME',
        p_order_seq             => 72,
        p_lookup_or_lov_columns => 'REMOTE_SERVER_NAME',
        p_link_url              => 'f?p=4000:3504:%session%::NO:3504,RP:P3504_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
    store_dictionary_view (
        p_view_name             => 'APEX_APPL_AI_CONFIG_RAG_SRCS',
        p_parent_view_name      => 'APEX_APPL_AI_CONFIGS',
        p_pk_column_name        => 'RAG_SOURCE_ID',
        p_display_expression    => 'RAG_NAME',
        p_order_expression      => 'RAG_NAME',
        p_order_seq             => 73,
        p_lookup_or_lov_columns => 'CONFIG_NAME,RAG_TYPE_CODE,RAG_TYPE,FUNCTION_BODY_LANGUAGE,CONDITION_TYPE,CONDITION_TYPE_CODE,AUTHORIZATION_SCHEME,BUILD_OPTION',
        p_link_url              => 'f?p=4000:3505:%session%::NO:3505,RP:P3505_ID,FB_FLOW_ID:%pk_value%,%application_id%' );
end;
/
commit;
