/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * This file contains utility functions, page initialization code for the Designer Pages
 * ( namely, Page Designer( 4500 ) and Workflow Designer ( 9600 ) ). The code here should be generic and functioning on both pages
 *  without issue. Any additional code, specific for the given designer page must come from an different source ( eg. f4000_p4500.js / f4000_p9600.js )
 *
 * It has a strong dependency on the designer context ( ie. page structure, global variables, model, etc ),
 * it's intended to ONLY use on the above mentioned pages.
 *
 * *** IMPORTANT ***
 * At the moment, it contains code mostly extracted from f4000_p4500.js ( ie. meaning copied here ),
 * with no, or just small adjustments. In the future, the Page Designer ( p4500 ) has to be updated to use this file, too
 * and the shared code must be removed from f4000_p45000.js.
 * *****************
 *
 * Duplicated functions:
 * Global, ie. available through the pageDesigner namespace:
 * - pd.splitApexUrl
 * - pd.msg
 * - pd.format
 * - pd.formatNoEscape
 * - pd.tooltipContentForComponent
 *      - besides the render logic, it contains config for all type of components ( page & workflow designer ).
 *        consider to pass the config as param
 * - pd.getComponentIconClass
 * - pd.isNever
 * - pd.isConditional
 * - pd.observerIsConditional
 *      - with and additional property ( model.PROP.STATE )
 * - pd.goToComponent
 *      - extended with the Workflow Tree and changed to use the designerTree
 * - pd.showSuccess
 * - pd.showError
 * - pd.showNotification
 * - pd.hideNotification
 * - pd.setHelpText
 * - pd.clearHelpText
 * - pd.getPreference
 *      - added a logic in there to differentiate between the contexts - we use different prefix in the page ( PD ) and workflow ( SD ) designer
 *         consider moving it to the page specific files
 * - pd.savePreference
 * - pd.saveBoolPref
 * - pd.getBoolPref
 * - pd.getTab
 * - pd.getTabsLayout
 * - pd.storeTabsLayout
 * - pd.loadTabsLayout
 * - pd.activateTab
 * - pd.parseSelectionHash
 * - pd.getRefByCompProps
 *      - it's defined in f4000_p4500.tree.js
 * Local functions:
 * - enableTooltips
 * - storeTabsLabelWidth
 * - updateTabs
 * - expandSplitterIfNeeded
 * - ajax
 *      - with some minor logic
 * - moveTab
 * - keyboardMoveTab
 * - openMsgDialog
 *
 * The followings are sub-functions of the initToolbar function ( f4000_p4500 ). We don't( /can't ) use the whole initToolbar
 * function, as it does way more than we need, but some of its functions we want to use, so we define them here locally:
 * ( after the restructuring f4000_p4500.js can use them too ):
 * - doSave
 *      - added some extra logic to it ( pd: disable grid-layout, wd: disable diagram-builder )
 * - setCreateMenuActions
 * - setUpActions
 *      - this function does not exists in f4000_p4500.js, it's created here and contains the apex-actions definitions from initToolbar and from the global scope that can be used in both places
 *      - list of actions:
 *          - M_EXPAND_RESTORE
 *          - M_GO_HELP
 *          - M_GO_HELP
 *          - M_GO_MESSAGES
 *          - M_GO_SEARCH
 *          - M_UNDO
 *          - M_REDO
 *          - M_TWO_COLUMN
 *          - M_THREE_COLUMN
 *          - pd-reset-tab-layout
 *              - small additional logic
 *          - pd-enable-tooltips
 *          - M_SAVE_PAGE
 *          - M_SAVE_AND_RUN_PAGE
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint semi: "error" */
/* global pe,gTeamDevEnabled */
window.pageDesigner = {};

( function( model, $, apexActions, apexItem, server, env, pd, lang, util, commandHistory, nav, storage ) {
    "use strict";

    let pe$ = $( "#peMain" );
    // map: tab name -> { tags: <tab-set-id>, index: <tab-index> }
    let gTabsDefaultLayout;
    let gMainSplitterOptions = null;
    let gTabsConfig = {};
    // Store the widths of the tabs for toggle tab label on resize
    let gTabWidths = {};
    let msgDialog$ = $( "#pdMessagesDialog" );
    let lSpinner$;

    const isWorkflowDesigner = env.APP_PAGE_ID === "9600";
    // action names
    const C_PROCESSING = "is-processing",
        C_PE_FILTER = "a-Property-field--filter",
        A_ARIA_CONTROLS = "aria-controls",
        A_LABEL = "aria-label",
        OPTION = "option",
        ACTIVE = "active",
        REFRESH = "refresh",
        DISABLE = "disable",
        ENABLE = "enable",
        P_DISABLED = "disabled",
        // action names
        M_UNDO = "pd-undo",
        M_REDO = "pd-redo",
        M_SAVE_PAGE = "pd-save-page",
        M_SAVE_RUN_PAGE = "pd-save-run-page",
        M_EXPAND_RESTORE = "pd-expand-restore",
        M_GO_HELP = "pd-goto-help",
        M_GO_SEARCH = "pd-page-search",
        M_GO_MESSAGES = "pd-goto-messages",
        M_NEXT_PAGE = "pd-goto-next-page",
        M_PREV_PAGE = "pd-goto-prev-page",
        M_ADVISOR = "pd-advisor",
        M_CREATE_PAGE = "pd-create-page",
        M_CREATE_COPY_PAGE = "pd-create-copy-page",
        M_CREATE_SHARED = "pd-create-shared-component",
        M_CREATE_BREADCRUMB = "pd-create-breadcrumb-region",
        M_TWO_COLUMN = "pd-two-column",
        M_THREE_COLUMN = "pd-three-column",
        // preferences
        PREF_TAB_LAYOUT_2 = "TAB_LAYOUT_2",
        PREF_TAB_LAYOUT_3 = "TAB_LAYOUT_3",
        PREF_TWO_COLUMN_MODE = "TWO_COLUMN_MODE",
        PREF_ENABLE_TOOLTIPS = "ENABLE_TOOLTIPS",
        // these tab names must match what is used in the tab nav for aria-controls
        TAB_NAME_LAYOUT = isWorkflowDesigner ? "grid_diagram" :"grid_layout",
        TAB_NAME_SEARCH = "search",
        TAB_NAME_HELP = "help",
        TAB_NAME_RENDERING = "renderTree_container",
        TAB_NAME_WORKFLOW = "workflowTree_container",
        TAB_NAME_DIAGRAM = "grid_diagram",
        TAB_NAME_PE_COMP = "peComponentProperties",
        TAB_SETS = [
            "#trees",       // 0 - this is the left side tab set for historical reasons called trees
            "#editor_tabs", // 1 - this is the middle tab set for historical reasons called editor_tabs
            "#peTabs"       // 2 - this is the right side tab set for historical reasons called peTabs
        ];
    const SEL_TAB_CONTAINER = ".a-TabsContainer";
    const PD_DEF_TABS_LAYOUT = "0:renderTree_container,0:dynActTree_container,0:procTree_container,0:sharedComp_container" +
        ",1:grid_layout,1:search,1:help" +
        ",2:peComponentProperties,2:peAttributesTabPanel,2:pePrintingTabPanel";
    const SD_DEF_TABS_LAYOUT = "0:workflowTree_container,0:sharedComp_container" +
        ",1:grid_diagram,1:search,1:help" +
        ",2:peComponentProperties";

    const EVENT_CLICK = "click";

    const createMenu$ = $( "#createMenu_menu" ),
     lockButton$ = $( "#button-lock" ),
     lRunDialogOpenMsg$ = $( "#runDialogOpenMsg" ),
     lRunDialogFocusMsg$ = $( "#runDialogFocusMsg" ),
     msgButton$ = $( "#pdShowMessagesBtn" );

    const gKeys = $.ui.keyCode;
    const hasOwnProperty = util.hasOwnProperty;

    // APEX-4565 Fix for tabs when used on a page with base element (Friendly URLs)
    $.widget( "ui.tabs", $.ui.tabs, {
        _isLocal: () => true
    } );

    pd.checkDisplayCurrentPage = function() {
        if ( model.getCurrentPageId() !== ( $( "#go_to_page" ).val() ).trim() ) {
            $( "#go_to_page" ).val( model.getCurrentPageId() );
        }
    };

    pd.CSS = {
        IS_ERROR:           "is-error",
        IS_WARNING:         "is-warning",
        IS_CONDITIONAL:     "is-conditional",
        IS_NEVER:           "is-never",
        DIALOG_FLUSH_BODY:  "ui-dialog-flushBody",
        IS_CHANGED:         "is-changed"
    };

    // common constants for settings menu options
    pd.SETTINGS = {
        COMPONENT_TITLE: {
            LABEL: "l",
            NAME:  "n"
        }
    };

    // current state of the settings menu
    pd.settingsState = {
        componentTitle: pd.SETTINGS.COMPONENT_TITLE.NAME
    };

     // Splits APEX URL into constituent parts
     pd.LINK_TYPE = {
        PAGE_IN_THIS_APP: "PAGE_IN_THIS_APP",
        PAGE_IN_DIFF_APP: "PAGE_IN_DIFF_APP",
        URL:              "URL"
    };

    pd.splitApexUrl = function( pUrl, pPrefixWithGoto, pValidHashSubstitutions ) {
        let lSuccessMsgPos, lRegExpResult, lUrl, lAnchorStart, j, m, lSubMatch, i, lClearCacheValues, lClearCacheValue,
            lPrefix = "LINK." + ( pPrefixWithGoto ? "GOTO_" : "" ),
            lValidHashSubstitutions = ( pValidHashSubstitutions ) ? pValidHashSubstitutions : [],
            lURLObject = {
                type:               pd.LINK_TYPE.PAGE_IN_THIS_APP,
                display:            "",
                appId:              "",
                pageId:             "",
                session:            "&SESSION.",
                request:            "",
                debug:              "&DEBUG.",
                clearCache:         "",
                clearAction:        "NONE",
                itemNames:          "",
                itemValues:         "",
                printerFriendly:    "NO",
                url:                "",
                successMessage:     "Y",
                anchor:             ""
                // wwv_flow_builder.split_url also defines:
                // report_column
            },
            HASH_SUBS_RE =/#([^#]*)#|#([^#]*)/g,
            RESERVED_SUBS_RE = /([\w]+![\w]+)/g,
            URL_RE =/f\?p=([^:]*):?([^:]*)?:?([^:]*)?:?([^:]*)?:?([^:]*)?:?([^:]*)?:?([^:]*)?:?(\\.+\\*|[^:]*)?/i;

        if ( pUrl ) {
            if ( pUrl.toLowerCase().indexOf( "f?p=" ) === 0 ) {

                /*
                 * First lets see if the link sets the success message, as this is just tagged on to the end of the url
                 * irrespective of colons, so needs to be done before we split by colon.
                 */
                lSuccessMsgPos = pUrl.toLowerCase().indexOf( "&success_msg=#success_msg#" );
                if ( lSuccessMsgPos > -1 ) {
                    lUrl = pUrl.substr( 0, lSuccessMsgPos );
                    lURLObject.successMessage = "Y";
                } else {
                    lUrl = pUrl;
                    lURLObject.successMessage = "N";
                }

                /*
                 * Now let's see if the link contains an anchor.
                 *
                 * The regular expression will match all the '#text#', and the '#text' occurrences in the URL.
                 * We loop over these matches and assert that an anchor is found as soon as we hit one that isn't in the
                 * valid hash substitution list. If no valid hash substitution list is passed (because this is not for
                 * a component type that uses hash-based subs), then the first match will be used.
                 *
                 * Example 1: f?p=100:1:&SESSION.#anchor
                 *              Reg exp matches '#anchor'; not substitution, beginning of this marks anchor start
                 *
                 * Example 2: f?p=100:1:&SESSION.::&DEBUG:::P1_ITEM1:#ENAME##anchor
                 *              Reg exp matches '#ENAME#' and '#anchor'; #ENAME# is valid sub, '#anchor' not sub, marks start
                 *
                 * Example 3: f?p=100:1:&SESSION.::&DEBUG:::P1_ITEM1:#ENAME##anchor_#EMPNO#
                 *              Reg exp matches '#ENAME#', '#anchor_#' and '#'; 1st non-sub is '#anchor_', marks start
                 *
                 * Example 4: f?p=100:1:&SESSION.::&DEBUG:::P1_ITEM1:&ENAME.#anchor
                 *              Reg exp matches just '#anchor'; not substitution, marks start.
                 *
                 */
                while ( !lAnchorStart &&
                    ( m = HASH_SUBS_RE.exec( lUrl ) ) ) {
                    lSubMatch = false;
                    for ( j = 0; j < lValidHashSubstitutions.length; j++ ) {
                        // Added regex check for #COLUMN![RAW,HTML,ATTR,etc]# to mark them as valid substitutions.
                        if ( m[ 1 ] === lValidHashSubstitutions[ j ] || RESERVED_SUBS_RE.test( m[ 1 ] ) ) {
                            lSubMatch = true;
                            break;
                        }
                    }

                    // If there is no valid sub match, we assume this is the start of the anchor
                    if ( !lSubMatch ) {
                        lAnchorStart = m.index;

                        // Substring from the last one + 1, to get the anchor text without the HASH
                        lURLObject.anchor = lUrl.substr( lAnchorStart + 1 );

                        // And trim the URL to no longer include the anchor
                        lUrl = lUrl.substr( 0, lAnchorStart );
                    }
                }
                lRegExpResult = URL_RE.exec( lUrl );
                if ( lRegExpResult ) {
                    lURLObject.appId = lRegExpResult[1];
                    lURLObject.pageId = lRegExpResult[2];
                    lURLObject.session = lRegExpResult[3];
                    lURLObject.request = lRegExpResult[4];
                    lURLObject.debug = lRegExpResult[5];
                    lURLObject.clearCache = lRegExpResult[6];
                    lURLObject.itemNames = lRegExpResult[7];
                    lURLObject.itemValues = lRegExpResult[8];
                    lURLObject.printerFriendly = lRegExpResult[9];
                }

                if ( lURLObject.clearCache ) {

                    // split the clear cache values into an array, so they're easier to check for known clear actions
                    lClearCacheValues = lURLObject.clearCache.split( "," );

                    for ( i = 0; i < lClearCacheValues.length; i++ ) {
                        lClearCacheValue = lClearCacheValues[ i ];

                        // if values is in the list of known clear actions, set that to clearAction
                        if ( $.inArray( lClearCacheValue, [ "NONE", "CR", "RR", "RP" ] ) > -1 ) {

                            lURLObject.clearAction = lClearCacheValue;

                            // remove this from the array lClearCacheValues
                            lClearCacheValues.splice( i, 1 );
                        }
                    }

                    // re-join the clearCache string, with any action identifier now removed
                    lURLObject.clearCache = lClearCacheValues.join( "," );
                }

                if ( lURLObject.itemNames ) {
                    lURLObject.itemNames = lURLObject.itemNames.split( "," );
                }
                if ( lURLObject.itemValues ) {
                    // Replaced lURLObject.itemValues = lURLObject.itemValues.split( "," ); to avoid splitting comma-separated strings that do not require so...
                    // (like this the ones with this format \#DEPTNO#, 10, 30 \)
                    lURLObject.itemValues = lURLObject.itemValues.match( /(\\[^\\]*\\)|[^,]*/g ).filter( function( elt,
                        idx, arr ){
                            return elt !== "" || idx === 0 || ( idx > 0 && arr[ idx - 1 ] === "" );
                        } ).map( function( elt ) {
                            return elt.replace( /(^\\(.*)\\$)/,"$1" );
                        } );
                }

                if ( lURLObject.appId ) {
                    if ( ( lURLObject.appId.toLowerCase().indexOf( "&flow_id." ) === 0 ) ||
                         ( lURLObject.appId.toLowerCase().indexOf( "&app_id." )  === 0 ) ||
                         ( lURLObject.appId.toLowerCase().indexOf( "#flow_id#" ) === 0 ) ||
                         ( lURLObject.appId.toLowerCase().indexOf( "#app_id#" )  === 0 ) )
                    {
                        lURLObject.type    = pd.LINK_TYPE.PAGE_IN_THIS_APP;
                        lURLObject.display = pd.formatNoEscape( lPrefix + "PAGE_N", lURLObject.pageId );
                    } else if ( lURLObject.appId ) {
                        lURLObject.type    = pd.LINK_TYPE.PAGE_IN_DIFF_APP;
                        lURLObject.display = pd.formatNoEscape( lPrefix + "APPLICATION_N", lURLObject.appId, lURLObject.pageId );
                    }
                }
            } else {
                lURLObject.url     = pUrl;
                lURLObject.type    = pd.LINK_TYPE.URL;
                // remove "https://" and "www."
                lURLObject.display = pUrl.replace( /^(https?:\/\/)(www.)?/i, "" );
                if ( pPrefixWithGoto ) {
                    lURLObject.display = pd.formatNoEscape( lPrefix + "URL", lURLObject.display );
                }
            }
        }
        return lURLObject;
    };

    pd.msg = function ( pKey ) {
        return lang.getMessage( "PD." + pKey );
    };

    pd.format = function ( pKey ) {
        let pattern = pd.msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.format.apply( this, args );
    };

    pd.formatNoEscape = function( pKey ) {
        let pattern = pd.msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    };

    pd.tooltipContentForComponent = function( pComponent ) {
        let typeId = pComponent.typeId,
            out    = util.htmlBuilder(),
            targetProp;

        function addProperty( pPropertyId, pIgnoreValue, pValue ) {
            let property = pComponent.getProperty( pPropertyId ),
                value = pValue;

            if ( property && ( pIgnoreValue === undefined || property.getValue() !== pIgnoreValue ) ) {
                if ( !value ) {
                    value = property.getDisplayValue();
                }

                if ( value !== "" ) {
                    createDataRow( property.getMetaData().prompt, value );
                }
            }
        }

        function createDataRow( prompt, value ) {
            out.markup( "<li><span class='tt-label'>" )
                    .content( prompt )
                    .markup( ": </span><span class='tt-value'>" )
                    .content( value ) // todo we should limited that to a max length. What would be a good value?
                    .markup( "</span></li>" );
        }


        function addGenericProperties() {
            let lProperty = pComponent.getProperty( model.PROP.CONDITION_TYPE );

            addProperty( model.PROP.WHEN_BUTTON_PRESSED );

            if ( lProperty && lProperty.getValue() !== "" ) {
                addProperty( model.PROP.CONDITION_TYPE );
                addProperty( model.PROP.CONDITION_SQL_STATEMENT );
                addProperty( model.PROP.CONDITION_VALUE1 );
                addProperty( model.PROP.CONDITION_ITEM1 );
                addProperty( model.PROP.CONDITION_LIST );
                addProperty( model.PROP.CONDITION_PREFERENCE );
                addProperty( model.PROP.CONDITION_PAGE );
                addProperty( model.PROP.CONDITION_PAGES );
                addProperty( model.PROP.CONDITION_TEXT );
                addProperty( model.PROP.CONDITION_VALUE2 );
                addProperty( model.PROP.CONDITION_ITEM2 );
                addProperty( model.PROP.CONDITION_TEXT2 );
                addProperty( model.PROP.CONDITION_SQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.CONDITION_PLSQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.CONDITION_JS_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.CONDITION_JAVA_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.CONDITION_PYTHON_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.CONDITION_PLSQL_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.CONDITION_JS_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.CONDITION_JAVA_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.CONDITION_PYTHON_FUNC_BODY_BOOLEAN );
            }

            addProperty( model.PROP.AUTHORIZATION_SCHEME );
            addProperty( model.PROP.PAGE_AUTHENTICATION );
            addProperty( model.PROP.ENABLE_META_TAGS );
            addProperty( model.PROP.BUILD_OPTION );
        }


        function addGridProperties() {

            addProperty( model.PROP.GRID_NEW_GRID,    "N" );
            addProperty( model.PROP.GRID_NEW_ROW,     "N" );
            addProperty( model.PROP.GRID_COLUMN,      "" ); // Because null value will return Automatic
            addProperty( model.PROP.GRID_NEW_COLUMN,  "N" );
            addProperty( model.PROP.GRID_COLUMN_SPAN, "" ); // Because null value will return Automatic
        }


        function addDaJsCondProperties() {
            let lProperty = pComponent.getProperty( model.PROP.JS_CONDITION );

            if ( lProperty && lProperty.getValue() !== "" ) {
                addProperty( model.PROP.JS_CONDITION );
                addProperty( model.PROP.JS_CONDITION_ITEM );
                addProperty( model.PROP.JS_COND_VALUE );
                addProperty( model.PROP.JS_COND_LIST );
            } else {
                lProperty = pComponent.getProperty( model.PROP.JS_CONDITION_WHEN_IG );
                if ( lProperty && lProperty.getValue() !== "" ) {
                    addProperty( model.PROP.JS_CONDITION_WHEN_IG );
                    addProperty( model.PROP.JS_CONDITION_ITEM_WHEN_IG );
                    addProperty( model.PROP.JS_CONDITION_COLUMN_WHEN_IG );
                    addProperty( model.PROP.JS_COND_VALUE_WHEN_IG );
                    addProperty( model.PROP.JS_COND_LIST_WHEN_IG );
                }
            }
        }

        function addDaEventProperties() {
            let lProperty = pComponent.getProperty( model.PROP.WHEN_TYPE );

            addProperty( model.PROP.EVENT );
            addProperty( model.PROP.CUSTOM_EVENT );

            if ( lProperty && lProperty.getValue() !== "" ) {
                addProperty( model.PROP.WHEN_REGION );
                addProperty( model.PROP.WHEN_IG_REGION );
                addProperty( model.PROP.WHEN_COLUMNS );
                addProperty( model.PROP.WHEN_BUTTON );
                addProperty( model.PROP.WHEN_ITEMS );
                addProperty( model.PROP.WHEN_DOM_OBJECT );
                addProperty( model.PROP.WHEN_JQUERY_SELECTOR );
                addProperty( model.PROP.WHEN_JAVASCRIPT_EXPRESSION );
            }
            // Client-Side Condition properties
            addDaJsCondProperties();
        }

        function addDaActionProperties() {
            let lProperty = pComponent.getProperty( model.PROP.AFFECTED_TYPE );

            if ( lProperty && lProperty.getValue() !== "" ) {
                addProperty( model.PROP.AFFECTED_REGION );
                addProperty( model.PROP.AFFECTED_BUTTON );
                addProperty( model.PROP.AFFECTED_ITEMS );
                addProperty( model.PROP.AFFECTED_COLUMNS );
                addProperty( model.PROP.AFFECTED_DOM_OBJECT );
                addProperty( model.PROP.AFFECTED_JQUERY_SELECTOR );
                addProperty( model.PROP.AFFECTED_JAVASCRIPT_EXPRESSION );
                if ( lProperty.getValue() === "TRIGGERING_ELEMENT" || lProperty.getValue() === "EVENT_SOURCE"  ) {
                    addProperty( model.PROP.AFFECTED_TYPE );
                }
            }
            addProperty( model.PROP.FIRE_ON_PAGE_LOAD );
            // Client-Side Condition properties
            addDaJsCondProperties();
        }

        function addComputationProperties() {

            addProperty( model.PROP.COMPUTATION_STATIC_VALUE );
            addProperty( model.PROP.COMPUTATION_SQL_STATEMENT );
            addProperty( model.PROP.COMPUTATION_SQL_COLON );
            addProperty( model.PROP.COMPUTATION_SQL_EXPRESSION_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_PLSQL_EXPRESSION_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_JS_EXPRESSION_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_JAVA_EXPRESSION_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_PYTHON_EXPRESSION_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_FUNC_BODY_LANG );
            addProperty( model.PROP.COMPUTATION_PLSQL_FUNC_BODY_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_JS_FUNC_BODY_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_JAVA_FUNC_BODY_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_PYTHON_FUNC_BODY_VARCHAR2 );
            addProperty( model.PROP.COMPUTATION_ITEM_VALUE );
            addProperty( model.PROP.COMPUTATION_PREFERENCE_VALUE );
        }

        function addValidationProperties() {

            let lRegionId = pComponent.getProperty( model.PROP.VALIDATION_REGION ).getValue();

            if ( lRegionId === "" ) {
                addProperty( model.PROP.VALIDATION_TYPE );
                addProperty( model.PROP.VAL_SQL_STATEMENT );
                addProperty( model.PROP.VAL_ITEM );
                addProperty( model.PROP.VAL_VALUE );
                addProperty( model.PROP.VAL_REGULAR_EXPRESSION );
                addProperty( model.PROP.VAL_PLSQL_FUNC_BODY_ERROR );
                addProperty( model.PROP.VAL_JS_FUNC_BODY_ERROR );
                addProperty( model.PROP.VAL_JAVA_FUNC_BODY_ERROR );
                addProperty( model.PROP.VAL_PYTHON_FUNC_BODY_ERROR );
                addProperty( model.PROP.VAL_PLSQL );
                addProperty( model.PROP.VAL_SQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.VAL_PLSQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.VAL_JS_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.VAL_JAVA_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.VAL_PYTHON_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.VAL_FUNC_BODY_LANG );
                addProperty( model.PROP.VAL_PLSQL_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.VAL_JS_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.VAL_JAVA_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.VAL_PYTHON_FUNC_BODY_BOOLEAN );
            } else {
                addProperty( model.PROP.VALIDATION_REGION );
                addProperty( model.PROP.REGION_VALIDATION_TYPE );
                addProperty( model.PROP.REGION_VAL_SQL_STATEMENT );
                addProperty( model.PROP.REGION_VAL_COLUMN );
                addProperty( model.PROP.REGION_VAL_VALUE );
                addProperty( model.PROP.REGION_VAL_REGULAR_EXPRESSION );
                addProperty( model.PROP.REGION_VAL_PLSQL_FUNC_BODY_ERROR );
                addProperty( model.PROP.REGION_VAL_JS_FUNC_BODY_ERROR );
                addProperty( model.PROP.REGION_VAL_JAVA_FUNC_BODY_ERROR );
                addProperty( model.PROP.REGION_VAL_PYTHON_FUNC_BODY_ERROR );
                addProperty( model.PROP.REGION_VAL_PLSQL );
                addProperty( model.PROP.REGION_VAL_SQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_PLSQL_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_JS_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_JAVA_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_PYTHON_EXPRESSION_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_FUNC_BODY_LANG );
                addProperty( model.PROP.REGION_VAL_PLSQL_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_JS_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_JAVA_FUNC_BODY_BOOLEAN );
                addProperty( model.PROP.REGION_VAL_PYTHON_FUNC_BODY_BOOLEAN );
            }
            addProperty( model.PROP.ALWAYS_EXECUTE );
        }

        if ( typeId ===  model.COMP_TYPE.PAGE ) {
            addProperty( model.PROP.TITLE );
        } else if ( typeId === model.COMP_TYPE.REGION ) {
            addProperty( model.PROP.REGION_TYPE );
            addGridProperties();
        } else if ( typeId === model.COMP_TYPE.PAGE_ITEM ) {
            addProperty( model.PROP.ITEM_LABEL );
            addProperty( model.PROP.ITEM_TYPE );
            addGridProperties();
        } else if ( typeId === model.COMP_TYPE.BUTTON ) {
            addProperty( model.PROP.BUTTON_LABEL );
            targetProp = pComponent.getProperty( model.PROP.BUTTON_TARGET );
            if ( targetProp ) {
                addProperty( model.PROP.BUTTON_TARGET, "", pd.splitApexUrl( targetProp.getValue() ).display );
            } else {
                addProperty( model.PROP.BUTTON_ACTION );
            }
            addGridProperties();
        } else if ( typeId === model.COMP_TYPE.DA_EVENT ) {
            addDaEventProperties();
        } else if ( typeId === model.COMP_TYPE.DA_ACTION ) {
            addDaActionProperties();
        } else if ( typeId === model.COMP_TYPE.VALIDATION ) {
            addValidationProperties();
        } else if ( typeId === model.COMP_TYPE.PAGE_PROCESS ) {
            addProperty( model.PROP.PAGE_PROCESS_TYPE );
        } else if ( typeId === model.COMP_TYPE.PAGE_COMPUTATION ) {
            addComputationProperties();
        } else if ( typeId === model.COMP_TYPE.BRANCH ) {
            addProperty( model.PROP.BRANCH_TYPE );
            targetProp = pComponent.getProperty( model.PROP.TARGET );
            if ( targetProp ) {
                addProperty( model.PROP.TARGET, "", pd.splitApexUrl( targetProp.getValue() ).display );
            } else {
                addProperty( model.PROP.BRANCH_PAGE_NUMBER );
                addProperty( model.PROP.BRANCH_ACCEPT_REQUEST );
                addProperty( model.PROP.BRANCH_ITEM );
            }
        } else if ( typeId === model.COMP_TYPE.IR_COLUMN ) {
            addProperty( model.PROP.COLUMN_HEADING );
            addProperty( model.PROP.IR_COLUMN_DISPLAY_TYPE );
        } else if ( typeId === model.COMP_TYPE.CLASSIC_RPT_COLUMN ) {
            addProperty( model.PROP.COLUMN_HEADING );
            addProperty( model.PROP.CLASSIC_REPORT_COLUMN_TYPE );
        } else if ( typeId === model.COMP_TYPE.TAB_FORM_COLUMN ) {
            addProperty( model.PROP.COLUMN_HEADING );
            addProperty( model.PROP.TAB_FORM_COLUMN_TYPE );
        } else if ( typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ) {
            addProperty( model.PROP.PAGE_PROCESS_TYPE );
        } else if ( typeId === model.COMP_TYPE.WORKFLOW_TRANS || typeId === model.COMP_TYPE.WORKFLOW_BRANCH ) {
            addProperty( model.PROP.TRANSITION_TYPE );
            let toActivity, toActivityName = "", sourceActivity = pComponent.getParent();
            let toActivityId = pComponent.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
            if ( toActivityId ) {
                toActivity = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, { id: toActivityId } )[ 0 ];
                if ( toActivity ) {
                    toActivityName = toActivity.getProperty( model.PROP.NAME ).getValue();
                }
            }
            createDataRow( pd.msg( "WF.FROM" ), sourceActivity.getProperty( model.PROP.NAME ).getValue() );
            createDataRow( pd.msg( "WF.TO" ), toActivityName );

            if ( typeId === model.COMP_TYPE.WORKFLOW_BRANCH ) {
                let switchTypeProperty = model.getPluginProperty(  model.COMP_TYPE.PAGE_PROCESS , "NATIVE_WORKFLOW_SWITCH", 1 ).id;
                let conditionType = sourceActivity.getProperty( switchTypeProperty ).getValue();
                createDataRow( pd.msg( "WF.CONDITION_TYPE" ), conditionType );
            }
        }

        addGenericProperties();

        if ( out.toString() ) {
            return "<ul class='tt-list'>" + out.toString() + "</ul>";
        } else {
            return null;
        }

    };

    /**
     * Get a component specific icon class.
     * @param {String} type One of: region, item, button
     * @param {String} componentType for regions and items this is the type/plugin name such as NATIVE_CHECKBOX for buttons it is normal or hot
     * @param {String} templateComponentType for a template component region. Supported values are REPORT, PARTIAL and REGION_ONLY
     * @return {String}
     */
    pd.getComponentIconClass = function( type, componentType, templateComponentType ) {

        let iconClass;

        if ( componentType.startsWith( "PLUGIN_" ) ) {
            iconClass = "icon-" + type + "-plugin icon-" + type + "-";
        } else if ( componentType.startsWith( "TMPL" ) ) {
            iconClass = "icon-" + type;
            // normalize theme prefix to not include theme#
            componentType = componentType.replace( /^TMPL_THEME(_[\d]+)\$/, "TMPL_THEME-" );

            if ( templateComponentType ) {
                iconClass += "-tmpl-" + templateComponentType.toLowerCase().replaceAll( "_", "-" ) + " icon-";
            } else {
                iconClass += "-tmpl icon-";
            }
        } else {
            iconClass = "icon-" + type + "-";
        }

        return iconClass + componentType.toLowerCase().replaceAll( "_", "-" );
    };

    pd.isNever = function( pComponent ) {
        let lProperty = pComponent.getProperty( model.PROP.CONDITION_TYPE );
        return ( lProperty && lProperty.getValue() === "NEVER" );
    };

    pd.isConditional = function( pComponent ) {
        function hasValue( pPropertyId ) {
            let property = pComponent.getProperty( pPropertyId );
            return ( property && property.getValue() !== "" );
        }
        return ( hasValue( model.PROP.CONDITION_TYPE ) || hasValue( model.PROP.AUTHORIZATION_SCHEME ) || hasValue( model.PROP.BUILD_OPTION ) || hasValue( model.PROP.WHEN_BUTTON_PRESSED ) );
    };

    pd.observerIsConditional = function( pWidget, pComponentsFilter, pFunction ) {
        model.observer(
            pWidget,
            {
                components: pComponentsFilter,
                events:     [ model.EVENT.CHANGE ],
                properties: [ model.PROP.CONDITION_TYPE, model.PROP.AUTHORIZATION_SCHEME, model.PROP.BUILD_OPTION, model.PROP.WHEN_BUTTON_PRESSED, model.PROP.STATE ]
            },
            pFunction );
    };

    pd.goToComponent = function( typeId, componentId, propertyId ) {
        let components = model.getComponents( typeId, { id: componentId } );

        if ( components.length !== 1 ) {
            return false;
        }
        $( document ).trigger( "selectionChanged", [ "controller", components, propertyId ] );
        // make sure the right tab panel is selected
        $( "#workflowTree, #PDrenderingTree, #PDdynamicActionTree, #PDprocessingTree, #PDsharedCompTree" ).each( function() {
            let node, tree$ = $( this );

            node = tree$.designerTree( "getSelectedNodes" )[0];
            if ( node && node.data.componentId === componentId ) {
                // from the tree find the tab it is in. The id is the tab name to activate
                activateTab( tree$.closest( ".ui-tabs-panel" )[0].id );
                // select again to make sure it is scrolled into view and focus, but don't change the focus if we want
                // to set focus to a specific property
                tree$.designerTree( "setSelectedNodes", [ node ], ( propertyId === undefined ), true );
                return false; // no need to check any others
            }
        } );
        return true;
    };

    /*
     * Show a success notification
     */
    pd.showSuccess = function ( pMsg ) {
        $( "#pdNotificationState" ).addClass( "is-success" );
        $( "#pdNotificationIcon" )
            .addClass( "icon-check" )
            .attr( A_LABEL, lang.getMessage( "APEXDEV.ICON_LABEL.SUCCESS" ) );
        $( "#pdNotificationTitle" )
            .html( lang.getMessage( "APEX.SUCCESS_MESSAGE_HEADING" ) );
        pd.showNotification( pMsg );
    };

    /*
     * Show an error notification
     */
    pd.showError = function ( pMsg ) {
        $( "#pdNotificationState" ).addClass( "is-error" );
        $( "#pdNotificationIcon" )
            .addClass( "icon-error" )
            .attr( A_LABEL, lang.getMessage( "APEXDEV.ICON_LABEL.WARNING" ) );
        $( "#pdNotificationTitle" )
            .html( lang.getMessage( "APEX.ERROR_MESSAGE_HEADING" ) );
        pd.showNotification( pMsg );
    };

    /*
     * Base show notification logic
     */
    pd.showNotification = function ( pMsg ) {
        let lMessage$ = $( "#pdNotificationMessage" );
        if ( pMsg ) {
            lMessage$.text( pMsg );
        }
        $( "#pdNotification" )
            .addClass( "is-displayed" )
            .fadeIn( "slow" );

        // setup handlers to hide notification
        $( document )
            .on( "commandHistoryChange.forMsg", function() {

                // for command history change, we need to also check if the model has changed,
                // otherwise the handler gets triggered on page load (this also means we can't use 'one').
                if ( model.hasChanged() ) {
                    pd.hideNotification();
                }

            } )
            .on( "modelCleared.forMsg", function( event, data ) {

                // for model cleared, check if we should prevent hiding the notification (for example in the
                // case where a success message has been displayed during initial page load) (bug #20554286)
                if ( !data.preventHideNotification ) {
                    pd.hideNotification();
                }

            } );

    };

    pd.hideNotification = function () {
        $( "#pdNotification" )
            .removeClass( "is-displayed" )
            .fadeOut( "slow", function() {
                $( "#pdNotificationMessage" ).text( "" );
                $( "#pdNotificationState" ).removeClass( "is-error is-success" );
                $( "#pdNotificationIcon" ).removeClass( "icon-error icon-check" );
            } );

        // remove handlers that hide notification
        $( document ).off( ".forMsg" );
    };

    pd.setHelpText = function( markup /*, feedbackParams*/ ) {

        let help$ = $( "#help-container" );

        /* pawolf: not yet available, see bug #25800434
        // Add a feedback link if we are able to identify the help text
        if ( feedbackParams ) {
            markup += '<div class="a-HelpFeedback"><a class="a-Button a-Button--small a-Button--noUI" rel="noopener noreferrer" href="https://apex.oracle.com/pls/apex/f?p=apex_help_feedback:1:::::' +
                feedbackParams + '&p_lang=' + gBuilderLang + '" target="_blank">' + pd.msg( "HELP.FEEDBACK" ) + '</a></div>';
        }
        */

        help$.html( markup );

    };

    pd.clearHelpText = function() {
        let help$ = $( "#help-container" ),
            markup = pd.msg( "HELP.DEFAULT" );

        help$.html( markup );
    };

    pd.getPreference = function( pName ) {
        let lPrefix = isWorkflowDesigner ? "WD_" : "PD_";
        let lName = lPrefix + pName;

        // Note: gPreferences is a global emitted directly from page 4500 during rendering

        // Note: gPreferences is a global emitted directly from page 4500 during rendering
        return ( hasOwnProperty( window.gPreferences, lName ) ) ? window.gPreferences[ lName ] : null;
    };

    pd.savePreference = function( pName, pValue ) {
        // @todo should we use different prefix? would this change the page designer setting? if yes, would that be bad?
        let lPrefix = isWorkflowDesigner ? "WD_" : "PD_";
        let lName = lPrefix + pName,
            lOldValue = window.gPreferences[ lName ];

        // Note: gPreferences is a global emitted directly from page 4500 during rendering
        window.gPreferences[ lName ] = pValue;

        // persist the preference setting if the value has changed
        if ( lOldValue !== pValue ) {
            ajax(
                "setPreference", {
                    x01: lName,
                    x02: pValue
                }, {
                    dataType: "" // don't expect any data back
                }
            );
        }
    };

    pd.saveBoolPref = function( pName, pValue ) {
        pd.savePreference( pName, pValue ? "Y" : "N" );
    };

    pd.getBoolPref = function( pName, pDefaultValue ) {
        let lValue = pd.getPreference( pName );
        if ( lValue === null ) {
            lValue = pDefaultValue;
        } else {
            lValue = ( lValue === "Y" );
        }
        return lValue;
    };

    pd.getTab = function( tabName ) {
        let tabCfg = gTabsConfig[ tabName ] || {};
        return $( tabCfg.tabs ).find( ".ui-tabs-nav" ).first().children().eq( tabCfg.index );
    };

    pd.getTabsDefaultConfig = function() {
        return isWorkflowDesigner ? SD_DEF_TABS_LAYOUT : PD_DEF_TABS_LAYOUT;
    };

    pd.addBinding = function ( name, shortcut ) {
        return { name, shortcut, type: "global" };
    };

    pd.getRefByCompProps = function( pComponentTypeId ) {

        let lType = model.getComponentType( pComponentTypeId ),
            lRefProperty,
            lRefType,
            lResult = [];

        // Find all properties which are using the current component type as LOV
        for ( let i = 0; i < lType.refByProperties.length; i++ ) {

            // Find all the component types which are using that property
            lRefProperty = model.getProperty( lType.refByProperties[ i ] );
            for ( let j = 0; j < lRefProperty.refByComponentTypes.length; j++ ) {

                // Only scan page level component types
                lRefType = model.getComponentType( lRefProperty.refByComponentTypes[ j ] );
                if ( lRefType.isPageComponent || lRefType.isSharedDesignerComponent || lRefType.id === model.COMP_TYPE.PAGE ) {
                    lResult.push( {
                        typeId:     lRefType.id,
                        propertyId: lRefProperty.id
                    } );
                }
            }
        }
        return lResult;
    };

    /**
     * helper function for the tree initializations
     *
     * @param {function} dataFunction    provides the tree data
     * @param {object}   pExpandedState  state of the nodes
     * @param {object}   treeRules       tree configuration
     * @returns
     */
    pd.getTreeNodeAdapter = function( dataFunction, pExpandedState, treeRules ) {

        function getInitialExpandedNodeIds( pData ) {
            let lNodeIds = [];
            function isExpanded( pData ) {
                // if user had previously expanded a node then it stays expanded
                if ( pExpandedState && pExpandedState[pData.id] === true ) {
                    return true;
                }
                // otherwise if the metadata determines that the node should be expanded it becomes expanded
                //    unless the user has previously collapsed it
                if ( ( pData.state && pData.state.opened ) && ( !pExpandedState || pExpandedState[pData.id] !== false ) ) {
                    return true;
                }
                return false;
            }
            function add( pNodes ) {
                for ( let i = 0; i < pNodes.length; i++ ) {
                    if ( isExpanded( pNodes[ i ] ) ) {
                        lNodeIds.push( pNodes[ i ].id );
                    }
                    if ( pNodes[ i ].children ) {
                        add( pNodes[ i ].children );
                    }
                }
            }
            if ( isExpanded( pData ) ) {
                lNodeIds.push( pData.id );
            }
            add( pData.children );

            return lNodeIds;
        }

        let data = dataFunction();
        let nodeAdapter = $.apex.treeView.makeDefaultNodeAdapter( data, treeRules, true, getInitialExpandedNodeIds( data ) );

        nodeAdapter.sortCompare = null;

        nodeAdapter.defaultGetIcon = nodeAdapter.getIcon;
        nodeAdapter.getIcon = function( n ) {
            let component;

            if ( n.data && n.data.typeId && n.data.componentId ) {
                const components = model.getComponents( n.data.typeId, { id: n.data.componentId } );
                if ( components.length === 1) {
                    component = components[ 0 ];
                }
            }
            if ( n.data && component ) {
                if ( n.data.typeId === model.COMP_TYPE.REGION ) {
                    const regionType = component.getProperty( model.PROP.REGION_TYPE ).getValue();
                    const templateComponentType = model.getTemplateComponentType( component );
                    return pd.getComponentIconClass( "region", regionType, templateComponentType );
                } else if ( n.data.typeId === model.COMP_TYPE.PAGE_ITEM ) {
                    return pd.getComponentIconClass( "item", component.getProperty( model.PROP.ITEM_TYPE ).getValue() );
                } else if ( $.inArray( n.data.typeId, [ model.COMP_TYPE.FACET, model.COMP_TYPE.FACET_GROUP_ITEM, model.COMP_TYPE.SFILTER, model.COMP_TYPE.SFILTER_GROUP_ITEM ]) !== -1 ) {
                    return pd.getComponentIconClass( "item", component.getProperty( model.PROP.ITEM_TYPE ).getValue() );
                } else if ( n.data.typeId === model.COMP_TYPE.BUTTON ) {
                    return pd.getComponentIconClass( "button", component.getProperty( model.PROP.BUTTON_IS_HOT ).getValue() === "Y" ? "hot" : "normal" );
                } else if ( n.data.typeId === model.COMP_TYPE.DA_ACTION ) {
                    return pd.getComponentIconClass( "dynamic-action", component.getProperty( model.PROP.DA_ACTION_TYPE ).getValue() );
                } else if ( n.data.typeId === model.COMP_TYPE.CARD_ACTION ) {
                    return pd.getComponentIconClass( "card-action", component.getProperty( model.PROP.CARD_ACTION_TYPE ).getValue() );
                } else if ( [ model.COMP_TYPE.REGION_ACTION, model.COMP_TYPE.IR_COLUMN_ACTION ].includes( n.data.typeId )) {
                    const actionPositionType = model.getActionPositionType( component );
                    return pd.getComponentIconClass( "component-action", actionPositionType === "template" ? "button" : actionPositionType );
                } else if ( [ model.COMP_TYPE.REGION_ACTION_MENU_ENTRY, model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ].includes( n.data.typeId )) {
                    return pd.getComponentIconClass( "menu", component.getProperty( model.PROP.MENU_ENTRY_TYPE ).getValue() );
                } else if ( n.data.typeId === model.COMP_TYPE.CLASSIC_RPT_COLUMN ) {
                    return pd.getComponentIconClass( "col", component.getProperty( model.PROP.CLASSIC_REPORT_COLUMN_TYPE ).getValue() );
                } else if ( n.data.typeId === model.COMP_TYPE.IR_COLUMN ) {
                    return pd.getComponentIconClass( "col", component.getProperty( model.PROP.IR_COLUMN_DISPLAY_TYPE ).getValue() );
                } else if ( n.data.typeId === model.COMP_TYPE.IG_COLUMN ) {
                    // We only show the item type specific icons if the IG is editable
                    const igAttributes = component.getParent().getChilds( model.COMP_TYPE.IG_ATTRIBUTES, {} )[ 0 ];
                    if ( igAttributes.getProperty( model.PROP.IS_EDITABLE ).getValue() === "Y" ) {
                        return pd.getComponentIconClass( "item", component.getProperty( model.PROP.ITEM_TYPE ).getValue() );
                    }
                } else if ( n.data.typeId === model.COMP_TYPE.JET_CHART_AXES ) {
                    return "icon-" + component.getProperty( model.PROP.NAME ).getValue().toLowerCase() + "-axis";
                //
                // special tree icon for process chains
                //
                } else if (    n.data.typeId === model.COMP_TYPE.PAGE_PROCESS
                            && component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_EXECUTION_CHAIN" ) {
                    return "icon-tree-process-chain";
                } else if ( n.data.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ) {
                    return pd.getComponentIconClass( "activity",component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() );
                } else if (  [ model.COMP_TYPE.WORKFLOW_BRANCH, model.COMP_TYPE.WORKFLOW_TRANS ].includes( n.data.typeId ) ) {
                    let componentParentActivity = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, { id: component.parentId } )[ 0 ];
                    let nodeParentActivity = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, { id: n._parent._parent.data.componentId } )[ 0 ];
                    return componentParentActivity?.id === nodeParentActivity?.id ? "icon-up-arrow" : "icon-down-arrow";
                }
            }
            return this.defaultGetIcon( n );
        };

        nodeAdapter.extraCheck = function( pResult, pRule, pNode, pOperation, pChildren ) {
            let components, component, i;
            if ( pResult ) {
                if ( $.inArray( pRule, [ "canDelete", "canRename", "canDrag", "canDuplicate" ] ) !== -1 ) {

                    if ( pNode.data && pNode.data.typeId && pNode.data.componentId ) {
                        components = model.getComponents( pNode.data.typeId, { id: pNode.data.componentId } );
                        if ( components.length === 1) {
                            component = components[ 0 ];
                        }
                    }
                    // @todo double check, prevents the deletion of an inactive version
                    return ( component && /* !component.isReadOnly() && */  !model.isPageReadOnly() );

                } else if ( pRule === "canAdd" && model.isPageReadOnly() ) {
                    return false;

                    // Make sure children can only be moved within parent
                } else if (  pRule === "canAdd" && pOperation === "move"
                          && $.inArray( pNode.type, [ pd.WF_TREE_NODE_TYPE.WF_TRANSITIONS, pd.WF_TREE_NODE_TYPE.WF_OUTGOING_LINKS, pd.WF_TREE_NODE_TYPE.WF_ACTIVITIES,  ] ) !== -1
                          && pChildren
                          )
                {
                    for ( i = 0; i < pChildren.length; i++ ) {
                        if ( pChildren[ i ]._parent && pChildren[ i ]._parent !== pNode ) {
                            return false;
                        }
                    }
                } else if ( pRule === "canAdd"
                           && pOperation === "move"
                           && ( pNode.type === "facet_group_items" || pNode.type === "sfilter_group_items" )
                           && pChildren )
                {
                    // Make sure facet groups/smart filter grups can only be moved within parent Faceted Search/Smart Filter region
                    for ( i = 0; i < pChildren.length; i++ ) {
                        if ( pChildren[ i ]._parent && pChildren[ i ]._parent._parent._parent !== pNode._parent._parent ) {
                            return false;
                        }
                    }
                }
            }
            return pResult;
        };

        // custom render function to include status icon
        nodeAdapter.renderNodeContent = function( node, out, options, state ) {
            let icon, c, statusIcon;

            if ( options.nodeSelector > 0 ) {
                // simulate a checkbox PD trees are always multi select
                out.markup( "<span class='u-selector'></span>" );
            }
            icon = this.getIcon( node );
            if ( icon !== null ) {
                out.markup( "<span" ).attr( "class", "a-Icon " + icon ).markup( "></span>" );
            }
            c = this.getClasses( node );
            if ( c ) {
                if ( c.indexOf( pd.CSS.IS_ERROR ) >= 0 ) {
                    statusIcon = "icon-error";
                } else if ( c.indexOf( pd.CSS.IS_WARNING ) >= 0 ) {
                    statusIcon = "icon-warning";
                }
                // TODO ACC consider including status indication in visually hidden label text
            }
            out.markup( "<span role='treeitem' class='a-TreeView-label' tabIndex='-1'" )
                .attr( "aria-level", state.level )
                .optionalAttr( "aria-selected", state.selected ? "true" : "false" )
                .optionalAttr( "aria-disabled", state.disabled ? "true" : null )
                .optionalAttr( "aria-expanded", state.hasChildren === false ? null : state.expanded ? "true" : "false" )
                .optionalAttr( "aria-owns", state.owns )
                .markup( ">" );

            if ( statusIcon ) {
                out.markup( "<span class='a-Icon " )
                    .attr( statusIcon )
                    .markup( "'></span>" );
            }
            out.content( this.getLabel( node ) )
                .markup( "</span>" );
        };

        return function(){ return nodeAdapter;};
    };

    /**
     * returns the shared component structure with the provided component types
     *
     * @param {array} compTypes array of component type objects
     * @returns
     */
    pd.getSharedData = function( compTypes ) {
        let addNode = $.apex.designerTree.addNode,
            addHeaderNode = $.apex.designerTree.addHeaderNode;

        function formatNoEscape( pKey ) {
            function msg( pKey ) {
                return lang.getMessage( "PD.TREE." + pKey );
            }
            let pattern = msg( pKey ),
                args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
            return lang.formatNoEscape.apply( this, args );
        }

        function addSharedComponents( pHeaderNode, pComponentType, pOmitIfEmpty ) {

            let lType = model.getComponentType( pComponentType.typeId ),
                lRefByCompProps,
                lComponents,
                lProperty,
                lValue,
                lAddSharedComponent,
                lUsedSharedComponents,
                lHeaderNode;

            lHeaderNode = addHeaderNode( pHeaderNode, {
                title:       pComponentType.title || ( pComponentType.titleTypeId ? model.getComponentType( pComponentType.titleTypeId ).title.singular : lType.title.plural ),
                type:        pComponentType.type + "s",
                isOpen:      false,
                omitIfEmpty: pOmitIfEmpty,
                data:        {
                    typeId: pComponentType.typeId
                }
            } );

            // Find all properties which are using the current component type as LOV
            lRefByCompProps = pd.getRefByCompProps( pComponentType.typeId );
            lUsedSharedComponents = {};
            for ( let i = 0; i < lRefByCompProps.length; i++ ) {

                // Find all shared components which are used by one of the page level components
                lComponents = model.getComponents( lRefByCompProps[ i ].typeId, {} );
                for ( let j = 0; j < lComponents.length; j++ ) {

                    lAddSharedComponent = false;

                    if (  lRefByCompProps[ i ].typeId === model.COMP_TYPE.PAGE
                       && $.inArray( lRefByCompProps[ i ].propertyId, [ model.PROP.PAGE_TEMPLATE, model.PROP.DIALOG_TEMPLATE, model.PROP.NAVIGATION_LIST, model.PROP.TAB_SET ] ) !== -1 )
                    {

                        if ( lComponents[ j ].getProperty( lRefByCompProps[ i ].propertyId ) && ( lRefByCompProps[ i ].propertyId === model.PROP.PAGE_TEMPLATE || lRefByCompProps[ i ].propertyId === model.PROP.DIALOG_TEMPLATE ) ) {

                            lAddSharedComponent = true;
                            lValue = model.getPageTemplate().id;

                        }
                        /* Ignore NAVIGATION_LIST, NAVIGATION_LIST and TAB_SET references, they are handled in the caller */

                    } else {

                        // Does the property exists for the current component?
                        lProperty = lComponents[ j ].getProperty( lRefByCompProps[ i ].propertyId );
                        if ( lProperty ) {
                            lValue = lProperty.getValue();
                            if ( lValue !== "" ) {

                                // Build Options and Authorization use ! or - to negate it, we have to remove that prefix
                                if (  ( pComponentType.typeId === model.COMP_TYPE.BUILD_OPTION || pComponentType.typeId === model.COMP_TYPE.AUTHORIZATION )
                                    && /^[-!]/.test( lValue ) )
                                {
                                    lValue = lValue.substr( 1 );
                                }

                                lAddSharedComponent = true;

                            }
                        }

                    }

                    if ( lAddSharedComponent && lValue !== "" ) {
                        if ( !Object.prototype.hasOwnProperty.call( lUsedSharedComponents, lValue ) ) {
                            lUsedSharedComponents[ lValue ] = {};
                        }
                        if ( !Object.prototype.hasOwnProperty.call( lUsedSharedComponents[ lValue ], lRefByCompProps[ i ].typeId ) ) {
                            lUsedSharedComponents[ lValue ][ lRefByCompProps[ i ].typeId ] = [];
                        }
                        lUsedSharedComponents[ lValue ][ lRefByCompProps[ i ].typeId ].push( lComponents[ j ] );
                    }
                }
            }

            // Emit all the found shared components and show the referencing page level components as well
            // Todo this should be ordered by name
            for ( let lId in lUsedSharedComponents ) {
                if ( Object.prototype.hasOwnProperty.call( lUsedSharedComponents, lId ) ) {

                    addNode( lHeaderNode, {
                        header: false,
                        component: {
                            type:   pComponentType.type,
                            typeId: pComponentType.typeId,
                            isOpen: false,
                            filter: {
                                id: lId,
                                properties: []
                            },
                            addSubComponents: function( pComponentNode ) {

                                let lRefByType,
                                    lHeaderNode;

                                for ( let lTypeId in lUsedSharedComponents[ lId ] ) {
                                    if ( Object.prototype.hasOwnProperty.call( lUsedSharedComponents[ lId ], lTypeId ) ) {

                                        lRefByType = model.getComponentType( lTypeId );

                                        lHeaderNode = addHeaderNode( pComponentNode, {
                                            title: formatNoEscape( "REFERENCED_BY", ( lUsedSharedComponents[ lId ][ lRefByType.id ].length === 1 ) ? lRefByType.title.singular : lRefByType.title.plural ),
                                            type: "references",
                                            isOpen: true,
                                            omitIfEmpty: false
                                        } );

                                        for ( let k = 0; k < lUsedSharedComponents[ lId ][ lRefByType.id ].length; k++ ) {
                                            addNode( lHeaderNode, {
                                                header: false,
                                                component: {
                                                    type:    "referenced_by",
                                                    typeId:  lRefByType.id,
                                                    isPlain: true,
                                                    filter: {
                                                        id: lUsedSharedComponents[ lId ][ lRefByType.id ][ k ].id,
                                                        properties: []
                                                    }
                                                }
                                            } );
                                        }
                                    }
                                }
                            } // addSubComponents
                        }
                    } );
                }
            }

            return lHeaderNode;

        } // addSharedComponents


        function addSharedCompTypes( pHeaderNode, pSharedCompTypes, pOmitIfEmpty ) {

            let lHeaderNode, lId, isOpen = false;

            for ( let i = 0; i < pSharedCompTypes.length; i++ ) {

                // Special handling for global navigation lists which are "special" lists which should appear with there
                // own entries in the Shared Components
                if ( $.inArray( pSharedCompTypes[ i ].type, [ "navigation_menu_list", "navigation_bar_list", "nav_list_template", "tab_set" ] ) !== -1 ) {

                    if ( pSharedCompTypes[ i ].type === "navigation_menu_list" ) {

                        lId    = model.getNavListId();
                        isOpen = true;

                    } else if ( pSharedCompTypes[ i ].type === "navigation_bar_list" ) {

                        lId    = model.getNavBarListId();
                        isOpen = true;

                    } else if ( pSharedCompTypes[ i ].type === "nav_list_template" ) {

                        lId = model.getNavListTemplateId();

                    } else if ( pSharedCompTypes[ i ].type === "tab_set" ) {

                        lId = model.getTabSetId();

                    }

                    if ( lId ) {
                        addNode( pHeaderNode, {
                            header: {
                                title:       pSharedCompTypes[ i ].title,
                                type:        pSharedCompTypes[ i ].type + "s",
                                isOpen:      isOpen,
                                omitIfEmpty: true,
                                data:        {
                                    typeId: pSharedCompTypes[ i ].typeId
                                }
                            },
                            component: {
                                type:   pSharedCompTypes[ i ].type,
                                typeId: pSharedCompTypes[ i ].typeId,
                                isOpen: false,
                                filter: {
                                    id: lId,
                                    properties: []
                                }
                            }
                        } );
                    }

                } else if ( Object.prototype.hasOwnProperty.call( pSharedCompTypes[ i ], "typeId" ) ) {

                    lHeaderNode = addSharedComponents( pHeaderNode, pSharedCompTypes[ i ], pOmitIfEmpty );

                } else {

                    lHeaderNode = addHeaderNode( pHeaderNode, {
                        title:       pSharedCompTypes[ i ].title,
                        type:        pSharedCompTypes[ i ].type + "s",
                        isOpen:      true,
                        omitIfEmpty: pOmitIfEmpty
                    } );

                }

                if ( pSharedCompTypes[ i ].children ) {
                    addSharedCompTypes( lHeaderNode, pSharedCompTypes[ i ].children, true );
                }
            }
        } // addSharedCompTypes


        let lTreeData = {
                id:       "sd",
                children: [],
                state:    {},
                commands: {
                    omitIfEmpty: false
                }
            };


        addSharedCompTypes( lTreeData, compTypes, false );

        $.apex.designerTree.postProcessNodes( lTreeData );

        return lTreeData;

    };

    pd.getTabsLayout = getTabsLayout;

    pd.storeTabsLayout = storeTabsLayout;

    pd.loadTabsLayout = loadTabsLayout;

    pd.activateTab = activateTab;

    pd.parseSelectionHash = parseSelectionHash;

    function parseSelectionHash( hash ) {
        let parts,
            isValid = /^[0-9:]+$/,
            selection = null;

        if ( hash.charAt( 0 )  === "#" ) {
            hash = hash.substring( 1 );
        }
        if ( isValid.test( hash ) ) {
            parts = hash.split( ":" );
            if ( parts.length === 2 ) {
                selection = {
                    typeId: parts[0],
                    componentId: parts[1]
                };
            }
        }
        return selection;
    }

    function enableTooltips( enable ) {
        setTimeout( () => {
            $( document ).find( ":data(ui-tooltip):not(.a-Gallery,.a-ControlBar)" ).tooltip( "option", "disabled", !enable );
        }, 0 );
    }

    // store the tab width to speed up, so next time just look up.
    function storeTabsLabelWidth( tabSetId, tabs$ ) {
        let tabsWidthSum = 0;

        tabs$.each( function(){
            let tab$   = $( this ),
                label$ = tab$.find( ".a-Tabs-label" ),
                icon$  = tab$.find( ".a-Icon" ),
                labelW = label$.length > 0 ? label$.width() : 0,
                iconW  = icon$.length > 0 ? icon$.width() : 0;

            tabsWidthSum += labelW + iconW;
        } );

        gTabWidths[ tabSetId ] = tabsWidthSum;
    }

    function updateTabs() {
        // check if any tab sets contain just one tab and also if the tabs are not wide enough
        TAB_SETS.forEach( function( tabSetId ) {

            let tabSet$ = $( tabSetId ),
                tabNav$ = tabSet$.find( ".ui-tabs-nav" ).first(),
                tabs$ = tabNav$.children(),
                tabSetWidth = tabSet$.width(),
                totalLabelWdith = gTabWidths[ tabSetId ];

            if ( totalLabelWdith === undefined ) {
                storeTabsLabelWidth( tabSetId, tabs$ );
            }

            tabNav$
                .toggleClass( "ui-tabs--iconOnly", totalLabelWdith > tabSetWidth )
                .toggleClass( "ui-tabs--single",   tabs$.length === 1 );
        } );
    }

    function getTabsLayout() {
        let tabName,
            layout = "";

        gTabsConfig = {};
        TAB_SETS.forEach( function( tabSetId, i ) {
            $( tabSetId ).find( ".ui-tabs-nav" ).first().children().each( function( ti, tab ) {
                tabName = $( tab ).attr( A_ARIA_CONTROLS );
                gTabsConfig[tabName] = { tabs: tabSetId, index: ti };
                if ( layout ) {
                    layout += ",";
                }
                layout += i + ":" + tabName;
            } );
        } );

        updateTabs();
        return layout;
    }

    function storeTabsLayout() {
        let columnMode,
            mainContent$ = $( "#sp_main_content" ),
            layout = getTabsLayout();

        if ( mainContent$.hasClass( "a-Splitter" ) ) {
            columnMode = PREF_TAB_LAYOUT_3;
        } else {
            columnMode = PREF_TAB_LAYOUT_2;
        }
        pd.savePreference( columnMode, layout );
    }

    function loadTabsLayout( layout, skipActivateTabs ) {
        let i, layoutTabs, tab, useThreeColumns,
            tabSets = [],
            allTabs$ = $(),
            mainContent$ = $( "#sp_main_content" ),
            tempTabs = {};

        if ( !layout ) {
            layout = pd.getTabsDefaultConfig();
        }

        // init info about tab sets
        TAB_SETS.forEach( function( tabSetId ) {
            let tabPanels$ = $( tabSetId ), // this is the tab widget but also the place where panels are appended
                tabs$ = tabPanels$.children().first().children( ".ui-tabs-nav" );
            tabSets.push( {
                tabs: tabs$,
                panels: tabPanels$,
                activeName: tabs$.children().eq( tabPanels$.tabs( OPTION, ACTIVE ) ).attr( A_ARIA_CONTROLS )
            } );
            allTabs$ = allTabs$.add( tabs$.children() );
        } );

        // remove all the tabs
        allTabs$.each( function() {
            let tab$ = $( this ),
                name = tab$.attr( A_ARIA_CONTROLS ),
                panel$ = $( "#" + util.escapeCSS( name ) );

            tab$.remove() // do this so that event handlers are cleaned up
                .removeClass( "ui-tabs-active ui-state-active ui-state-hover ui-state-focus" )
                .removeAttr( "role" );
            panel$.detach()// don't cleanup event handlers widgets etc. e.g. trees stay trees
                .removeClass( "ui-tabs-panel" )
                .removeAttr( "role" );
            tempTabs[name] = { t: tab$, p: panel$ };
        } );

        useThreeColumns = layout.indexOf( "0:" ) >= 0;
        // If new layout uses 3 columns and not in 3 column mode (Indicated by sp_main_content being a splitter)
        if ( useThreeColumns && !mainContent$.hasClass( "a-Splitter" ) && gMainSplitterOptions ) {
            // restore splitter
            $( "#left_col" ).show();
            mainContent$.splitter( gMainSplitterOptions );
        } else if ( !useThreeColumns && mainContent$.hasClass( "a-Splitter" ) ) { // else if new layout uses 2 columns and not in 2 column mode
            // save the top level splitter config because it is optional depending on if in two or three column mode
            // it gets destroyed and recreated as needed. This maintains the last used settings as well
            gMainSplitterOptions = $( "#sp_main_content" ).splitter( OPTION );
            // remove splitter
            $( "#left_col" ).hide();
            mainContent$.splitter( "destroy" ).addClass( "resize" ).trigger( "resize" );
            // as the tabs of the left pane have moved to the center pane, we wish to keep the active tab of the left pane. see 34032488
            tabSets[ 1 ].activeName = tabSets[ 0 ].activeName;
        }

        layoutTabs = layout.split( "," );
        for ( i = 0; i < layoutTabs.length; i++ ) {
            tab = layoutTabs[i].split( ":" ); // returns [ tabsetindex, tabname ]
            if ( tempTabs[ tab[1] ] ) {
                tabSets[ tab[0] ].tabs.append( tempTabs[ tab[1] ].t );
                tabSets[ tab[0] ].panels.append( tempTabs[ tab[1] ].p );
            }
        }

        tabSets.forEach( function( tabSet ) {
            let activeTab = 0;

            tabSet.panels.tabs( REFRESH );
            if ( !skipActivateTabs ) {
                if ( tabSet.activeName && tabSet.panels.children( "#" + util.escapeCSS( tabSet.activeName ) ).length ) {
                    activeTab = tabSet.tabs.children( "[aria-controls=" + util.escapeCSS( tabSet.activeName ) + "]" ).index();
                }
                tabSet.panels.tabs( OPTION, ACTIVE, activeTab );
            }
        } );

        getTabsLayout();
    }

    function activateTab( tabName ) {
        let tabCfg = gTabsConfig[ tabName ];

        if ( tabCfg.tabs === TAB_SETS[0] ) {
            // the first (left) tab set is in a splitter so make sure it is expanded
            expandSplitterIfNeeded( "sp_main_content" );
        } else if ( tabCfg.tabs === TAB_SETS[2] ) {
            // the last (right) tab set is in a splitter so make sure it is expanded
            expandSplitterIfNeeded( "sp_right_content" );
        }
        $( tabCfg.tabs ).tabs( OPTION, ACTIVE, tabCfg.index );
    }

    // sub functions of initToolbar
    function doSave( pCallback ) {
        let lContainer$ = $( "#a_PageDesigner" ),
            lButtons = [ M_UNDO, M_REDO, M_SAVE_PAGE, M_SAVE_RUN_PAGE ];

        util.delayLinger.start( "main", function(){
            lSpinner$ = util.showSpinner( lContainer$ );
            lContainer$.addClass( C_PROCESSING );
        } );
        // disable all controls that can affect the model
        lButtons.forEach( function( actionName ) {
            apexActions.disable( actionName );
        } );
        if ( isWorkflowDesigner ) {
            $( ".a-TreeView" ).designerTree( DISABLE );
            $( "#app" )[ 0 ].diagramBuilder?.setReadOnly( true );
        } else {
            $( ".a-TreeView" ).treeView( DISABLE );
            $( "#glv" ).gridlayout( DISABLE );
        }
        pe$.propertyEditor( DISABLE );
        // tell model to save the changes
        model.saveChanges( function( pResponse ) {
            // done
            // enable all controls that were disabled around save
            lButtons.forEach( function( actionName ) {
                apexActions.enable( actionName );
            } );
            if ( isWorkflowDesigner ) {
                $( ".a-TreeView" ).designerTree( ENABLE );
                $( "#app" )[ 0 ].diagramBuilder?.setReadOnly( false );
            } else {
                $( ".a-TreeView" ).treeView( ENABLE );
                $( "#glv" ).gridlayout( ENABLE );
            }
            pe$.propertyEditor( ENABLE );
            util.delayLinger.finish( "main", function(){
                lSpinner$.remove();
                lContainer$.removeClass( C_PROCESSING );
            } );
            pCallback( pResponse );
        } );
        pe$.find( "." + pd.CSS.IS_CHANGED ).removeClass( pd.CSS.IS_CHANGED );
    }

    function setCreateMenuActions ( menuItems ) {
        let item;
        for ( let i = 0; i < menuItems.length; i++ ) {
            if ( hasOwnProperty( menuItems[ i ], "menu" ) ) {
                setCreateMenuActions( menuItems[ i ].menu.items );
            } else {
                item = menuItems[ i ];
                // if it is an action then update the action function on the action not the menu item
                if ( typeof item.action === "string" ) {
                    item = apexActions.lookup( item.action );
                }
                item.action = function() {
                    if ( model.hasChanged() ) {
                        // eslint-disable-next-line no-alert
                        if ( window.confirm( pd.msg( "BEFORE_AJAX_UNSAVED_CHANGES" ) ) ) {
                            nav.redirect( this.href );
                            return true;
                        }
                    } else {
                        nav.redirect( this.href );
                        return true;
                    }
                };
            }
        }
    }

    function expandSplitterIfNeeded( splitRegionId ) {
        let s$ = $( "#" + util.escapeCSS( splitRegionId ) + ".a-Splitter" );
        if ( s$.length ) {
            if ( s$.splitter( OPTION, "collapsed" ) ) {
                s$.splitter( OPTION, "collapsed", false );
            }
        }
    }

    function ajax( pName, pData, pOptions ) {
        // Always set FB_FLOW_ID with every request because a new app could have been opened in another tab (bug# 28285763)
        pData.p_arg_names = [ "FB_FLOW_ID" ];
        pData.p_arg_values = isWorkflowDesigner ? [ $v( "P9600_CURRENT_APP" ) ] : [ $v( "P4500_CURRENT_APP" ) ];
        return server.process( pName, pData, pOptions );
    }

    function moveTab( event, ui ) {
        let panel$, prev$,
            tabsNav$ = $( event.target ),
            tabs$ = tabsNav$.closest( ".ui-tabs" );

        ui.item.removeClass( "ui-tabs-active ui-state-active ui-state-hover ui-state-focus" );
        if ( ui.sender ) {
            // need to move tab panel as well
            panel$ = $( "#" + util.escapeCSS( ui.item.attr( A_ARIA_CONTROLS ) ) );
            // and remove and reinsert tab to clear handlers from former tab set
            prev$ = ui.item.prev();
            ui.item.remove();
            if ( prev$.length ) {
                prev$.after( ui.item );
            } else {
                tabsNav$.prepend( ui.item );
            }
            tabs$.append( panel$ );
            ui.sender.closest( ".ui-tabs" ).tabs( REFRESH );
        }
        tabs$.tabs( REFRESH );
        // activate the tab that was moved
        tabs$.tabs( OPTION, ACTIVE, ui.item.index() );
        storeTabsLayout();
    }

    function keyboardMoveTab( event ) {
        let len, tabsNav$, tabs$, tab$, tabSetIndex, index, panel$, nextTabs$,
            nextTabsNav$ = null,
            dir = null,
            kc = event.which;

        if ( event.shiftKey ) {
            // no need to be dir aware in builder
            if ( kc === gKeys.UP || kc === gKeys.LEFT ) {
                dir = -1;
            } else if ( kc === gKeys.DOWN || kc === gKeys.RIGHT ) {
                dir = 1;
            }
            if ( dir ) {
                tab$ = $( event.target );
                tabsNav$ = tab$.closest( ".ui-tabs-nav" );
                len = tabsNav$.children().length;
                tabs$ = tabsNav$.closest( ".ui-tabs" );
                tabSetIndex = TAB_SETS.indexOf ( "#" + util.escapeCSS( tabs$[0].id ) );
                index = tab$.index();
                index += dir;
                if ( index >= 0 && index < len ) {
                    // move within tab set
                    if ( dir > 0 ) {
                        tab$.next().after( tab$ );
                    } else {
                        tab$.prev().before( tab$ );
                    }
                } else {
                    tabSetIndex += dir;
                    if ( tabSetIndex >= 0 && tabSetIndex < TAB_SETS.length ) {
                        // move between tab sets
                        nextTabsNav$ = $( TAB_SETS[tabSetIndex] ).find( ".ui-tabs-nav" ).first();
                        nextTabs$ = nextTabsNav$.closest( ".ui-tabs" );
                        // need to move tab panel as well
                        panel$ = $( "#" + util.escapeCSS( tab$.attr( A_ARIA_CONTROLS ) ) );

                        tab$.remove();
                        if ( dir < 0 ) {
                            nextTabsNav$.append( tab$ );
                        } else {
                            nextTabsNav$.prepend( tab$ );
                        }
                        index = tab$.index();
                        nextTabs$.append( panel$ );
                        tabs$.tabs( REFRESH ); // refresh the tabset that tab moved from
                        tabs$ = nextTabs$;
                    } else {
                        // at one end or the other - don't wrap
                        return;
                    }
                }
                tabs$.tabs( REFRESH );
                // activate the tab that was moved
                tabs$.tabs( OPTION, ACTIVE, index );
                tab$.trigger( "focus" );
                storeTabsLayout();
                return false;
            }
        }
    }

    pd.getShortcutsMenuListMarkup = function( names, actions ) {
        let out = util.htmlBuilder();
        out.markup( "<div" )
            .attr( "id", "shortcutDlg" )
            .markup( "<ul class='a-AVPList a-AVPList--shortcuts'>" );

        for ( let i = 0; i < names.length; i++ ) {
            let action = actions[ names[ i ] ];
            out.markup( "<li class='a-AVPList-item'><span class='a-AVPList-label'>" )
                .content( action.actionLabel )
                .markup( "</span><span class='a-AVPList-value'>" );
            let keys = action.shortcuts;
            for ( let j = 0; j < keys.length; j++ ) {
                out.markup( keys[ j ] );
            }
            out.markup( "</span></li>" );
        }

        out.markup( "</ul></div>" );

        $( out.toString() ).dialog( {
            modal: true,
            closeText: lang.getMessage( "APEX.DIALOG.CLOSE" ),
            minWidth: 300,
            width: 550,
            height: 380,
            create: function() {
                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
            },
            close: function() {
                $( this ).dialog( "destroy" ).remove();
            },
            open: function() {
                this.focus();
            },
            buttons: [
                { text: pd.msg( "OK" ), click: function() {
                    $( this ).dialog( "close" );
                }}
            ]
        } );
    };

    function openMsgDialog() {
        msgDialog$.dialog( {
            modal: false,
            dialogClass: "ui-dialog--pageDesignerMsg",
            width: 480,
            minWidth: 320,
            minHeight: 320,
            title: pd.msg( "MESSAGES" ),
            buttons: [ {
                text: pd.msg( "OK" ),
                click:  function() {
                    msgDialog$.dialog( "close" );
                }
            }]
        } );

        $( "#pdMessages" ).find( ".a-AlertMessages-message" ).first().each( function() {
            this.focus();
        } );
    }

    function setUpActions() {
         // set up the actions. mostly used by the toolbar
         apexActions.add( [
            {
                name: M_EXPAND_RESTORE,
                onLabel: pd.msg( "RESTORE" ),
                offLabel: pd.msg( "EXPAND" ),
                get: function() {
                    return this.isCenterExpanded;
                },
                set: function( value ) {
                    this.isCenterExpanded = value;
                    // the top level splitter is optional so use .a-Splitter to make sure it is a splitter before expand/collapse
                    $( "#sp_main_content.a-Splitter, #sp_glv_content:visible, #sp_right_content" ).splitter( OPTION, "collapsed", this.isCenterExpanded );
                },
                isCenterExpanded : false,
                updateState: function() {
                    let self = this;

                    this.isCenterExpanded = true;
                    // the top level splitter is optional so use .a-Splitter to make sure it is a splitter before using it as such
                    $( "#sp_main_content.a-Splitter, #sp_glv_content:visible, #sp_right_content" ).each( function() {
                        if ( !$( this ).splitter( OPTION, "collapsed" ) ) {
                            self.isCenterExpanded = false;
                            return false;
                        }
                    } );
                    this.icon = this.isCenterExpanded ? "icon-restore" : "icon-maximize";
                    apexActions.update( this.name );
                }
            },
            {
                name: M_GO_HELP,
                label: pd.msg( "ACTION.GOTO_HELP" ),
                action: function() {
                    activateTab( TAB_NAME_HELP );
                    $( "#help-container" )[0].focus();
                    return true;
                }
            },
            {
                name: M_GO_MESSAGES,
                label: pd.msg( "ACTION.GOTO_MSGS" ),
                action: function() {
                    openMsgDialog();
                    return true;
                }
            },
            {
                name: M_GO_SEARCH,
                label: pd.msg( "ACTION.PAGE_SEARCH" ),
                action: function( event ) {
                    let target$ = $( event.target ),
                        pe$ = target$.closest( ".a-PropertyEditor" );

                    // first try to search in property editor
                    if ( pe$.length ) {
                        pe$.parent().find( "." + C_PE_FILTER ).trigger( "focus" );
                    } else {
                        // else search the whole page
                        activateTab( TAB_NAME_SEARCH );
                        $( "#P4500_LOCAL_SEARCH" ).trigger( "focus" );
                    }
                    return true;
                }
            },
            {
                name: M_UNDO,
                label: null, // take label and title from button title
                title: null,
                icon: "icon-undo",
                action: function() {
                    commandHistory.undo();
                }
            },
            {
                name: M_REDO,
                label: null, // take label and title from button title
                title: null,
                icon: "icon-redo",
                action: function() {
                    commandHistory.redo();
                }
            },
            {
                name: M_TWO_COLUMN,
                action: function() {
                    let layout = pd.getPreference( PREF_TAB_LAYOUT_2 );
                    if ( !layout ) {
                        layout = pd.getTabsDefaultConfig().replace( /0:/g, "1:" ); // the default with tabs from left set moved to middle set
                    }
                    pd.loadTabsLayout( layout );
                    pd.saveBoolPref( PREF_TWO_COLUMN_MODE, true );
                    apexActions.disable( M_TWO_COLUMN );
                    apexActions.enable( M_THREE_COLUMN );
                }
            },
            {
                name: M_THREE_COLUMN,
                action: function() {
                    let layout = pd.getPreference( PREF_TAB_LAYOUT_3 );
                    if ( !layout ) {
                        layout = pd.getTabsDefaultConfig();
                    }
                    // make sure there is at least one tab in the left column
                    if ( layout.indexOf( "0:" ) < 0 ) {
                        layout = layout.replace( /^1:/, "0:" ); // pick the first tab
                    }
                    pd.loadTabsLayout( layout );
                    pd.saveBoolPref( PREF_TWO_COLUMN_MODE, false );
                    apexActions.disable( M_THREE_COLUMN );
                    apexActions.enable( M_TWO_COLUMN );
                }
            },
            {
                name: "pd-reset-tab-layout",
                action: function() {
                    pd.loadTabsLayout( pd.getTabsDefaultConfig() );
                    pd.saveBoolPref( PREF_TWO_COLUMN_MODE, false );
                    pd.savePreference( PREF_TAB_LAYOUT_2, "" );
                    pd.savePreference( PREF_TAB_LAYOUT_3, "" );
                    apexActions.disable( M_THREE_COLUMN );
                    apexActions.enable( M_TWO_COLUMN );
                    expandSplitterIfNeeded( "sp_main_content" );
                    expandSplitterIfNeeded( "sp_right_content" );
                    expandSplitterIfNeeded( "sp_glv_content" );
                    $( "#sp_main_content"  ).splitter( "option", "position", 290 );
                    $( "#sp_right_content" ).splitter( "option", "position", 290 );
                    $( "#sp_glv_content"   ).splitter( "option", "position", 200 );
                    pd.activateTab( TAB_NAME_PE_COMP );
                    pd.activateTab( isWorkflowDesigner ? TAB_NAME_DIAGRAM : TAB_NAME_LAYOUT );
                    pd.activateTab( isWorkflowDesigner ? TAB_NAME_WORKFLOW : TAB_NAME_RENDERING );
                }
            },
            {
                name: "pd-enable-tooltips",
                set: function( value ) {
                    pd.saveBoolPref( PREF_ENABLE_TOOLTIPS, value );
                    enableTooltips( value );
                },
                get: function() {
                    return pd.getBoolPref( PREF_ENABLE_TOOLTIPS, false );
                }
            },
            {
                name: M_SAVE_PAGE,
                label: null, // take label from button
                disabled: true,
                action: function( event, focusElement, options ) {
                    const o = $.extend( {
                        suppressSuccessMessage: false,
                        afterSaveCallback: null
                    }, options );

                    if ( $( event.target ).closest( ".a-Property" ).length ) {
                        // when in property editor need to save field first
                        pe$.propertyEditor( "saveProperty" );
                    }
                    doSave( function( pResponse ) {
                        // todo: As long as there is a bug with undo/redo after a save, we just clear the history
                        commandHistory.clear();
                        $( document ).trigger( "commandHistoryChange" );

                        if ( pResponse.error ) {
                            if ( pResponse.error !== "NO_CHANGES" ) {
                                pd.showError( pResponse.error );
                            }
                        } else {
                            if ( !o.suppressSuccessMessage ) {
                                pd.showSuccess( pd.msg( "CHANGES_SAVED" ) );
                            }
                        }

                        if ( o.afterSaveCallback ) {
                            o.afterSaveCallback( pResponse );
                        }
                    } );
                }
            },
            {
                name: M_SAVE_RUN_PAGE,
                label: null, // take label and title from button title
                title: null,
                icon: "icon-run-page",
                disabled: true,
                action: function( event, focusElement, options ) {
                    const o = $.extend( {
                        suppressSuccessMessage: false,
                        afterSaveCallback: null
                    }, options );
                    let runWindowGotFocus,
                        appId = model.getCurrentAppId(),
                        pageId = model.getCurrentPageId(),
                        runTimerId = null;

                    function getAppURL() {
                        return util.makeApplicationUrl( {
                            pageId: "RUN_PAGE",
                            request: "BRANCH_TO_PAGE_ACCEPT",
                            debug: "NO",
                            itemNames: [ "FB_FLOW_ID", "FB_FLOW_PAGE_ID", "F4000_P1_FLOW" ],
                            itemValues: [ appId, pageId, appId ]
                        } );
                    }

                    function runWarningDialog( dlg$, focusOnly ) {
                        dlg$.dialog( {
                            modal: true,
                            title: focusOnly ? pd.msg( "FOCUS_PAGE" ) : pd.msg( "RUN_PAGE" ),
                            closeText: lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            dialogClass: "ui-dialog--pageDesignerAlert",
                            width: 400,
                            height: 240,
                            minWidth: 400,
                            minHeight: 240,
                            position: { my: "right top", at: "right-20 bottom+20", of: focusElement },
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            buttons: [ {
                                text:  pd.msg( "TRY_AGAIN" ),
                                "class": "a-Button--hot",
                                click: function() {
                                    dlg$.dialog( "close" );
                                    if ( focusOnly ) {
                                        nav.openInNewWindow( "", apex.builder.getAppUnderTestWindowName( appId ) );
                                    } else {
                                        runPage();
                                    }
                                }
                            }]
                        } );
                    }

                    function checkRunPageFocus() {
                        runWindowGotFocus = false;
                        $( window ).on( "blur.runcheck", function() {
                            $( window ).off( ".runcheck" );
                            runWindowGotFocus = true;
                        } );
                        runTimerId = setTimeout( function() {
                            runTimerId = null;
                            if ( !runWindowGotFocus ) {
                                runWarningDialog( lRunDialogFocusMsg$, true );
                            }
                            $( window ).off( ".runcheck" );
                        }, 800 ); // .8 sec should be more than enough time for a window to get focus
                    }

                    function runPage() {
                        let pageComponent = model.getComponents( model.COMP_TYPE.PAGE )[0],
                            options = {},
                            runMode = $v( "P0_WINDOW_MGMT_MODE" ) || "FOCUS"; // values NONE, BROWSER, FOCUS

                        if ( model.isGlobalPage() ) {
                            pd.showSuccess( pd.msg( "CHANGES_SAVED_GLOBAL_PAGE" ) );
                        } else if ( pageComponent.getProperty( model.PROP.PAGE_MODE ).getValue() === "NORMAL" ) {
                            if ( runMode === "NONE" || /^4\d\d\d$/.test( appId ) ) {
                                nav.redirect( getAppURL() );
                            } else {
                                if ( runMode === "BROWSER" ) {
                                    options.favorTabbedBrowsing = true;
                                    // no need to check for focus because user doesn't care
                                } else {
                                    // assume FOCUS
                                    checkRunPageFocus();
                                }
                                if ( !apex.builder.launchAppUnderTest( getAppURL(), appId, options ) ) {
                                    clearTimeout( runTimerId );
                                    $( window ).off( ".runcheck" );
                                    runWarningDialog( lRunDialogOpenMsg$ );
                                }
                            }
                        } else {
                            pd.showSuccess( pd.msg( "CHANGES_SAVED_DIALOG_PAGE" ) );
                        }
                    }

                    if ( $( event.target ).closest( ".a-Property" ).length ) {
                        // when in property editor need to save field first
                        pe$.propertyEditor( "saveProperty" );
                    }

                    if ( model.hasChanged() ) {
                        doSave( function( pResponse ) {
                            // todo: As long as there is a bug with undo/redo after a save, we just clear the history
                            commandHistory.clear();
                            $( document ).trigger( "commandHistoryChange" );

                            if ( pResponse.error ) {
                                if ( pResponse.error !== "NO_CHANGES" ) {
                                    pd.showError( pResponse.error );
                                }
                            } else {
                                runPage();
                            }

                            if ( o.afterSaveCallback ) {
                                o.afterSaveCallback( pResponse );
                            }
                        } );
                    } else {
                        runPage();
                    }
                }
            }
        ] );
    }

    $( function() {
        let sessionStorage = storage.getScopedSessionStorage( {
            useAppId : false,
            prefix: "ORA_WWV_apex.builder.pageDesigner"
        } );
        let splitterChangeTimer = null;
        gTabsDefaultLayout = pd.getTabsDefaultConfig();

        // show the main container of the page
        $( "#sp_main" ).show();

        setUpActions();

        // init toolbar code
        commandHistory.setErrorHandler( function( pOperation, pCommand ) {
            let lOperationLabel = {
                "execute": "CMD.EXECUTE_FAILED",
                "undo": "CMD.UNDO_FAILED",
                "redo": "CMD.REDO_FAILED"
            };
            pd.showError( pd.format( lOperationLabel[ pOperation ], pCommand.label() ) );
        } );

        // set up the undo/redo action(&buttons)
        $( document ).on( "commandHistoryChange", function() {
            let label, action;

            action = apexActions.lookup( M_UNDO );
            if ( !action.origLabel ) {
                action.origLabel = action.label;
            }
            action.disabled = !commandHistory.canUndo();
            if ( commandHistory.canUndo() ) {
                label = lang.formatMessageNoEscape( "PD.UNDO", commandHistory.undoLabel() );
                action.label = action.title = label;
            } else {
                action.label = action.title = action.origLabel;
            }
            apexActions.update( M_UNDO );

            action = apexActions.lookup( M_REDO );
            if ( !action.origLabel ) {
                action.origLabel = action.label;
            }
            action.disabled = !commandHistory.canRedo();
            if ( commandHistory.canRedo() ) {
                label = lang.formatMessageNoEscape( "PD.REDO", commandHistory.redoLabel() );
                action.label = action.title = label;
            } else {
                action.label = action.title = action.origLabel;
            }
            apexActions.update( M_REDO );
        } ).trigger( "commandHistoryChange" );

        // Message button handling
        msgButton$.on( EVENT_CLICK, openMsgDialog );

        // initialize the error message widget
        $( "#pdMessages" ).peMessagesView( {
            badge: msgButton$.find( "span.a-Button-badge" ),
            button: msgButton$,
            noMsgHandler: function(){
                if ( msgDialog$.hasClass( "ui-dialog-content" ) ) {
                    // Check for dialog is a must as dialog may not be initialized
                    msgDialog$.dialog( "close" );
                }
            }
        } );

        // fix up menu - the team dev sub menu is conditional
        createMenu$.on( "menucreate", function() {
            let teamDevMenu = createMenu$.menu( "find", "teamDev" );

            if ( teamDevMenu ) {
                teamDevMenu.hide = !gTeamDevEnabled;
            }
            // Add custom menu item actions, because here we want to override the default navigation by 'href', so we can
            // check for unsaved changes.
            setCreateMenuActions( createMenu$.menu( OPTION ).items );
        } );

        pd.clearHelpText();

        // the pd-expand-restore action state must be kept in sync with the collective splitter state
        $( "body" ).on( "splitterchange splittercreate", function() {
            let action = apexActions.lookup( M_EXPAND_RESTORE );
            // splitter changes often happen in bunches so wait a bit and just update once
            if ( !splitterChangeTimer ) {
                splitterChangeTimer = setTimeout( function() {
                    splitterChangeTimer = null;
                    action.updateState();
                }, 100 );
            }
        } );

         // create the tabs
         $( SEL_TAB_CONTAINER ).tabs( {
            heightStyle: "fill",
            activate: function( event, ui ) {
                if ( ui.newPanel.is( ".resize" ) ) {
                    ui.newPanel.resize();
                }
                let tabs$ = ui.newTab.parents( ".ui-tabs" );
                let tabsId = tabs$.attr( "id" );
                let activeTab = tabs$.tabs( OPTION, ACTIVE );
                sessionStorage.setItem( tabsId, activeTab );
            }
        } ).on ( "resize", function() {
            updateTabs();
        } );

        // Hack so that tab widget ignores space key when moving tabs
        $( ".ui-tabs" ).each( function() {
            let origHandlePageNav,
                tab = $( this ).data( "ui-tabs" );

            origHandlePageNav = tab._handlePageNav;
            tab._handlePageNav = function( event ) {
                if ( event.shiftKey ) {
                    return true;
                } // else
                return origHandlePageNav.call( tab, event );
            };
        } );

        // make sure internal structure (gTabsConfig) matches tabs as they are
        getTabsLayout();

         // The splitters have not yet been initialized so delay setting 2/3 column mode, tab layout and initial active tabs
        setTimeout( function() {
            let layout;

            // page is rendered in 3 column mode with default tab layout
            // set column mode and/or restore tabs from preferences if needed
            if ( pd.getBoolPref( PREF_TWO_COLUMN_MODE, false ) || pd.getPreference( PREF_TAB_LAYOUT_3 ) ) {
                if ( pd.getBoolPref( PREF_TWO_COLUMN_MODE, false ) ) {
                    layout = pd.getPreference( PREF_TAB_LAYOUT_2 );
                    // todo xxx remove this hack to fix up saved settings from before PE tabset was included
                    if ( layout && layout.indexOf( "2:" ) < 0 ) {
                        layout = gTabsDefaultLayout.replace( /0:/g, "1:" ); // the default with tabs from left set moved to middle set
                    }
                    if ( !layout ) {
                        layout = gTabsDefaultLayout.replace( /0:/g, "1:" ); // the default with tabs from left set moved to middle set
                    }
                    apexActions.disable( M_TWO_COLUMN );
                } else {
                    layout = pd.getPreference( PREF_TAB_LAYOUT_3 );
                    // todo xxx remove this hack to fix up saved settings from before PE tabset was included
                    if ( layout && layout.indexOf( "2:" ) < 0 ) {
                        layout = gTabsDefaultLayout;
                    }
                    if ( !layout ) {
                        layout = gTabsDefaultLayout;
                    }
                    apexActions.disable( M_THREE_COLUMN );
                }

                // with new PE attributes and printing tabs, check that they are included in the layout, and if not fallback to default
                if ( !isWorkflowDesigner && ( layout.indexOf( ":peAttributesTabPanel" ) < 0 || layout.indexOf( ":pePrintingTabPanel" ) < 0 ) ) {
                    layout = gTabsDefaultLayout;
                }

                loadTabsLayout( layout, true );
            } else {
                // must be in 3 column mode
                apexActions.disable( M_THREE_COLUMN );
            }
            // make sure internal structure (gTabsConfig) matches tabs as they are
            // getTabsLayout();

            // restore active tabs from client storage
            $( SEL_TAB_CONTAINER )
                .each( function() {
                    let tabs$ = $( this ),
                        tabsId = tabs$.attr( "id" ),
                        activeTab = sessionStorage.getItem( tabsId );

                    // Restore active tab if we have stored it in SESSION storage, if we don't have an active tab because
                    // we are calling Page Designer after login, we check if the developer has used Component View last.
                    if ( activeTab ) {
                        tabs$.tabs( OPTION, ACTIVE, activeTab );
                    } else if ( tabsId === "editor_tabs" ) {
                        activateTab( TAB_NAME_LAYOUT );
                    }
                } );
        }, 1 );

         // tabs constrol
        // set up each tab set for sorting and connect with the other tab sets
        // using first() to exclude gallery tabs to be sortable
        $( "#editor_tabs" ).find( ".ui-tabs-nav" ).first().sortable( {
            axis: "x",
            connectWith: "#trees > .a-Tabs-toolbar > .ui-tabs-nav, #peTabs > .a-Tabs-toolbar > .ui-tabs-nav",
            update: moveTab
        } ).on( "dblclick", function() {
            apexActions.toggle( M_EXPAND_RESTORE );
        } ).on( "keydown", keyboardMoveTab );

        $( "#trees" ).find( ".ui-tabs-nav" ).sortable( {
            axis: "x",
            connectWith: "#editor_tabs > .a-Tabs-toolbar > .ui-tabs-nav, #peTabs > .a-Tabs-toolbar > .ui-tabs-nav",
            update: moveTab
        } ).on( "keydown", keyboardMoveTab );

        $( "#peTabs" ).find( ".ui-tabs-nav" ).sortable( {
            axis: "x",
            connectWith: "#editor_tabs > .a-Tabs-toolbar > .ui-tabs-nav, #trees > .a-Tabs-toolbar > .ui-tabs-nav",
            update: moveTab
        } ).on( "keydown", keyboardMoveTab );

        // Give help tab a specific class
        $( "#editor_tabs [aria-controls=help]" ).addClass( "ui-tabs-helpTab" );

        // warn on unsaved changes
        $( window ).on( "beforeunload", function() {
            if ( model.hasChanged() ) {
                return pd.msg( "BEFORE_PAGE_UNLOAD_UNSAVED_CHANGES" );
            }
        } );

         // handler to hide notification
         $( "#pdNotificationClose" ).on( "click", function() {
            pd.hideNotification();
        } );

        apex.theme.pageResizeInit();

        // setup handler for displaying partial key sequences
        $( document.body ).append( "<div id='apexActionKeyDisplay' style='display:none;'></div>" );
        apexActions.partialShortcutInput = function( seq ) {
            seq = seq || "";
            setTimeout( function() {
                $( "#apexActionKeyDisplay" ).text( seq )[ seq ? "show" : "hide"]();
            }, seq ? 1 : 800 );
        };

        // Standard event handler for closed dialogs
        apex.gPageContext$.on( "apexafterclosedialog", function( event, data ) {

            // Some "Create" dialogs do set a new page number which allows us to open that page in Page Designer
            if ( data.FB_FLOW_ID && data.FB_FLOW_PAGE_ID ) {

                if ( data.successMessage ) {
                    pd.showSuccess( data.successMessage.text );
                } else {
                    pd.hideNotification();
                }
                pd.goToPage( data.FB_FLOW_PAGE_ID, ( data.successMessage ) );
            }
        } );

        let labelPrefix, bindings = [
            pd.addBinding( "spotlight-search",  "Ctrl+Quote" ),
            pd.addBinding( M_UNDO,              "Ctrl+Z" ),
            pd.addBinding( M_REDO,              "Ctrl+Y" ),
            pd.addBinding( M_SAVE_PAGE,         "Alt+F7" ),
            pd.addBinding( M_EXPAND_RESTORE,    "Alt+F11" ),
            pd.addBinding( M_GO_HELP,           "Alt+F1" ),
            pd.addBinding( M_GO_MESSAGES,       "Ctrl+/,M" ),
            pd.addBinding( M_GO_SEARCH,         "Ctrl+/,F" ),
            pd.addBinding( M_ADVISOR,           "Ctrl+/,U,A" ),
        ];

        [ M_UNDO, M_REDO ].forEach( function( el ) {
            let a = apexActions.lookup( el );
            a.contextLabel = a.label;
        } );
        labelPrefix = $( "#menu-create" ).attr( A_LABEL );
        [ M_CREATE_PAGE, M_CREATE_COPY_PAGE, M_CREATE_SHARED, M_CREATE_BREADCRUMB, M_ADVISOR ].forEach( function( el ) {
            let a = apexActions.lookup( el );
            if ( a ) {
                a.contextLabel = labelPrefix + ": " + a.label;
            }
        } );
        labelPrefix = $( "#menu-utilities" ).attr( A_LABEL );

        apexActions.setShortcutKeyBindings( bindings );

        $( document ).on( "modelReady", function(){

            // enable save and run buttons
            [ M_SAVE_PAGE, M_SAVE_RUN_PAGE ].forEach( function(  actionName ) {
                apexActions.enable( actionName );
            } );

            $( document ).one( "modelCleared", function(){
                // clear command history
                commandHistory.clear();
                $( document ).trigger( "commandHistoryChange" );

                // disable lock, save and run buttons
                lockButton$.attr( P_DISABLED, true );
                [ M_NEXT_PAGE, M_PREV_PAGE, M_SAVE_PAGE, M_SAVE_RUN_PAGE ].forEach( function( actionName ) {
                    apexActions.disable( actionName );
                } );

            } );

            // Add tooltips for buttons with titles because many show keyboard shortcuts which keyboard users will
            // want to know about and without a mouse they don't get title tooltips
            $( ".a-ControlBar,.a-PageDesigner" ).tooltip( {
                item: "button[title]",
                show: apex.tooltipManager.defaultShowOption()
            } );

            // enable or disable based on preference after all tooltips created
            enableTooltips( pd.getBoolPref( PREF_ENABLE_TOOLTIPS, false ) );
        } );
    } );

})( pe, apex.jQuery, apex.actions, apex.item, apex.server, apex.env, window.pageDesigner, apex.lang, apex.util, apex.commandHistory, apex.navigation, apex.storage );
