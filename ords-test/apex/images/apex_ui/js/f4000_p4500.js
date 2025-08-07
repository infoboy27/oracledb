/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This is the main controller for the page designer. It contains initialization logic for tabs and accordions,
 * resize, global undo/redo, dev toolbar integration etc. It also has some utility functions in namespace pageDesigner
 * that can be used by the other controllers.
 **/

/* global pe,gTeamDevEnabled,gIsInternal,gIsReadOnly,gLanguage,gApexVersion */

window.pageDesigner = {};

( function( model, $, util, lang, nav, pd, server, storage, apexActions, apexItem, commandHistory, env ) {
    "use strict";

    // BEGIN common page designer constants and functions
    var gStaticData,
        gTeamDevCounters,
        gMainSplitterOptions = null, // remember splitter options for switching between 2 and 3 column modes
        gTabsConfig = {}, // map: tab name -> { tags: <tab-set-id>, index: <tab-index> }
        // keep in sync with what server generates and tab names below
        gTabsDefaultLayout =
            "0:renderTree_container,0:dynActTree_container,0:procTree_container,0:sharedComp_container" +
            ",1:grid_layout,1:search,1:help" +
            ",2:peComponentProperties,2:peAttributesTabPanel,2:pePrintingTabPanel",
        // Store the widths of the tabs for toggle tab label on resize
        gTabWidths = {},
        gApplicationMessages = new Map();

    var C_PROCESSING = "is-processing",
        C_PE_FILTER = "a-Property-field--filter",
        SEL_ICON = ".a-Icon",
        A_ARIA_CONTROLS = "aria-controls",
        A_LABEL = "aria-label",
        A_TITLE = "title",
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
        M_GO_RENDERING = "pd-goto-rendering-tree",
        M_GO_DA = "pd-goto-dynamic-actions-tree",
        M_GO_PROCESSING = "pd-goto-processing-tree",
        M_GO_SHARED = "pd-goto-shared-components-tree",
        M_GO_LAYOUT = "pd-goto-grid-layout",
        M_GO_PE_MAIN = "pd-goto-property-editor-tab-main",
        M_GO_PE_ATTRIBUTES = "pd-goto-property-editor-tab-attributes",
        M_GO_PE_PRINTING = "pd-goto-property-editor-tab-printing",
        M_GO_SEARCH = "pd-page-search",
        M_GO_G_REGIONS = "pd-goto-gallery-regions",
        M_GO_G_ITEMS = "pd-goto-gallery-items",
        M_GO_G_BUTTONS = "pd-goto-gallery-buttons",
        M_GO_MESSAGES = "pd-goto-messages",
        M_NEXT_PAGE = "pd-goto-next-page",
        M_PREV_PAGE = "pd-goto-prev-page",
        M_SHOW_SHORTCUTS = "pd-show-shortcuts",
        M_ADVISOT = "pd-advisor",
        M_CREATE_PAGE = "pd-create-page",
        M_CREATE_COPY_PAGE = "pd-create-copy-page",
        M_CREATE_SHARED = "pd-create-shared-component",
        M_CREATE_BREADCRUMB = "pd-create-breadcrumb-region",
        M_TWO_COLUMN = "pd-two-column",
        M_THREE_COLUMN = "pd-three-column",
        M_TEXT_MESSAGES_PICKER = "pd-enable-text-messages-picker",
        // preferences
        PREF_TAB_LAYOUT_2 = "TAB_LAYOUT_2",
        PREF_TAB_LAYOUT_3 = "TAB_LAYOUT_3",
        PREF_TWO_COLUMN_MODE = "TWO_COLUMN_MODE",
        PREF_ENABLE_TOOLTIPS = "ENABLE_TOOLTIPS",
        PREF_ENABLE_LAYOUT_VIEW = "ENABLE_LAYOUT_VIEW",
        PREF_ENABLE_TEXT_MESSAGES_PICKER = "ENABLE_TEXT_MESSAGES_PICKER",
        // these tab names must match what is used in the tab nav for aria-controls
        TAB_NAME_LAYOUT = "grid_layout",
        TAB_NAME_SEARCH = "search",
        TAB_NAME_HELP = "help",
        TAB_NAME_RENDERING = "renderTree_container",
        TAB_NAME_DA = "dynActTree_container",
        TAB_NAME_PROCESSING = "procTree_container",
        TAB_NAME_SHAREDCOMP = "sharedComp_container",
        TAB_NAME_PE_COMP = "peComponentProperties",
        TAB_NAME_PE_ATTR = "peAttributesTabPanel",
        TAB_NAME_PE_PRINTING = "pePrintingTabPanel",
        TAB_SETS = [
            "#trees",       // 0 - this is the left side tab set for historical reasons called trees
            "#editor_tabs", // 1 - this is the middle tab set for historical reasons called editor_tabs
            "#peTabs"       // 2 - this is the right side tab set for historical reasons called peTabs
        ];

    const SEL_TAB_CONTAINER = ".a-TabsContainer";

    const EVENT_CLICK = "click";

    const hasOwnProperty = util.hasOwnProperty;

    // APEX-4565 Fix for tabs when used on a page with base element (Friendly URLs)
    $.widget( "ui.tabs", $.ui.tabs, {
        _isLocal: () => true
    } );

    function checkDisplayCurrentPage() {
        if ( model.getCurrentPageId() !== ( $( "#go_to_page" ).val() ).trim() ) {
            $( "#go_to_page" ).val( model.getCurrentPageId() );
        }
    }

    function ajax( pName, pData, pOptions ) {
        // Always set FB_FLOW_ID with every request because a new app could have been opened in another tab (bug# 28285763)
        pData.p_arg_names = [ "FB_FLOW_ID" ];
        pData.p_arg_values = [ $v( "P4500_CURRENT_APP" ) ];
        return server.process( pName, pData, pOptions );
    }

    // extend the global pageDesigner object
    pd.COMMENTED_OUT_ID = undefined;
    pd.textMessagesPickerEnabled = false;

    // common CSS classes
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


    pd.msg = function ( pKey ) {
        return lang.getMessage( "PD." + pKey );
    };

    pd.format = function ( pKey ) {
        var pattern = pd.msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.format.apply( this, args );
    };

    pd.formatNoEscape = function( pKey ) {
        var pattern = pd.msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    };

    pd.tooltipContentForComponent = function( pComponent ) {
        var typeId = pComponent.typeId,
            out    = util.htmlBuilder(),
            targetProp;

        function addProperty( pPropertyId, pIgnoreValue, pValue ) {
            var property = pComponent.getProperty( pPropertyId ),
                value = pValue;

            if ( property && ( pIgnoreValue === undefined || property.getValue() !== pIgnoreValue ) ) {
                if ( !value ) {
                    value = property.getDisplayValue();
                }

                if ( value !== "" ) {
                    out.markup( "<li><span class='tt-label'>" )
                        .content( property.getMetaData().prompt )
                        .markup( ": </span><span class='tt-value'>" )
                        .content( value ) // todo we should limited that to a max length. What would be a good value?
                        .markup( "</span></li>" );
                }
            }
        }


        function addGenericProperties() {
            var lProperty = pComponent.getProperty( model.PROP.CONDITION_TYPE );

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
            var lProperty = pComponent.getProperty( model.PROP.JS_CONDITION );

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
            var lProperty = pComponent.getProperty( model.PROP.WHEN_TYPE );

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
            var lProperty = pComponent.getProperty( model.PROP.AFFECTED_TYPE );

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

            var lRegionId = pComponent.getProperty( model.PROP.VALIDATION_REGION ).getValue();

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

    pd.isNever = function( component ) {
        // check if Server-side Condition is "NEVER"
        let property = component.getProperty( model.PROP.CONDITION_TYPE );
        if ( property && property.getValue() === "NEVER" ) {
            return true;
        }
        // check if the Build Option is "Commented Out" ( it's available )
        if ( pd.COMMENTED_OUT_ID ) {
            property = component.getProperty( model.PROP.BUILD_OPTION );
            if ( property && property.getValue() === pd.COMMENTED_OUT_ID ) {
                return true;
            }
        }
        return false;
    };

    pd.isConditional = function( pComponent ) {

        function hasValue( pPropertyId ) {
            var property = pComponent.getProperty( pPropertyId );
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
                properties: [ model.PROP.CONDITION_TYPE, model.PROP.AUTHORIZATION_SCHEME, model.PROP.BUILD_OPTION, model.PROP.WHEN_BUTTON_PRESSED ]
            },
            pFunction );
    };


    pd.isDisplayed = function( pComponent ) {

        var lConditionType,
            lIsDisplayed = true;

        // Don't show global page components if they are not visible on the current page
        if ( pComponent.isOnGlobalPage() ) {

            lConditionType = pComponent.getPropertyValue( model.PROP.CONDITION_TYPE );

            if ( lConditionType === "CURRENT_PAGE_EQUALS_CONDITION" ) {
                lIsDisplayed = ( pComponent.getProperty( model.PROP.CONDITION_PAGE ).getValue() === model.getCurrentPageId() );
            } else if ( lConditionType === "CURRENT_PAGE_NOT_EQUAL_CONDITION" ) {
                lIsDisplayed = ( pComponent.getProperty( model.PROP.CONDITION_PAGE ).getValue() !== model.getCurrentPageId() );
            } else if ( lConditionType === "CURRENT_PAGE_IN_CONDITION" ) {
                lIsDisplayed = ( $.inArray( model.getCurrentPageId(), pComponent.getProperty( model.PROP.CONDITION_PAGES ).getValue().split( "," ) ) !== -1 );
            } else if ( lConditionType === "CURRENT_PAGE_NOT_IN_CONDITION" ) {
                lIsDisplayed = ( $.inArray( model.getCurrentPageId(), pComponent.getProperty( model.PROP.CONDITION_PAGES ).getValue().split( "," ) ) === -1 );
            }
        }

        return lIsDisplayed;
    };

    // Splits APEX URL into constituent parts
    pd.LINK_TYPE = {
        PAGE_IN_THIS_APP: "PAGE_IN_THIS_APP",
        PAGE_IN_DIFF_APP: "PAGE_IN_DIFF_APP",
        URL:              "URL"
    };

    pd.splitApexUrl = function( pUrl, pPrefixWithGoto, pValidHashSubstitutions ) {
        var lSuccessMsgPos, lRegExpResult, lUrl, lAnchorStart, j, m, lSubMatch, i, lClearCacheValues, lClearCacheValue,
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


    // Allow other pages that the builder opens to change the page and/or selection
    // Used by dev toolbar
    // All fields but app-id are optional.
    pd.setPageSelection = function( pAppId, pPageId, pTypeId, pComponentId, pCallback ) {
        var result = "OK",
            deferred;

        if ( !pAppId || pAppId !==  model.getCurrentAppId() ) {
            result = "APP_NOT_CHANGED";
        } else {
            if ( pPageId && pPageId !== model.getCurrentPageId() ) {

                deferred = pd.goToPage( pPageId );
                $.when( deferred )
                    .done( function() {
                        if ( pTypeId && pComponentId ) {
                            if ( !pd.goToComponent( pTypeId, pComponentId ) ) {
                                result = "COMPONENT_NOT_SELECTED";
                            }
                        }
                        pCallback( result );
                    } )
                    .fail( function( reason ) {
                        if ( reason === "user-abort" ) {
                            pCallback( "PAGE_CHANGE_ABORTED" );
                        } else {
                            pCallback( "PAGE_NOT_CHANGED" );
                        }
                    } );

                return;
            } else {
                if ( pTypeId && pComponentId ) {
                    if ( !pd.goToComponent( pTypeId, pComponentId ) ) {
                        result = "COMPONENT_NOT_SELECTED";
                    }
                }
            }
        }
        pCallback( result );
    };

    /*
     * Changes the current page to the specified one.
     */
    pd.goToPage = function( pPageId, pPreventHideNotification, pUpdateUrl = true ) {

        let lWorkspaceData,
            lSharedData,
            lSpinner$,
            lPageData,
            lContainer$ = $( "#a_PageDesigner" ),
            lDeferred = $.Deferred(),
            // array of open dialogs on the page; note: ui-dialog-instances is internal,
            // we use it to get a reliable information of the "active" dialog instances
            lDialogs = $( document ).data( "ui-dialog-instances" );

        function rejectRedirect( deferred ) {
            checkDisplayCurrentPage();
            deferred.reject( "user-abort" );
            return deferred.promise();
        }

        if ( model.hasChanged() ) {
            // eslint-disable-next-line no-alert
            if ( !window.confirm( pd.msg( "BEFORE_AJAX_UNSAVED_CHANGES" ) ) ) {
                return rejectRedirect( lDeferred );
            }
        }

        if ( lDialogs?.length ) {
            // try to close the dialogs (dialogs with unsaved changes won't close and show an alert)
            lDialogs.forEach( dialog => {
                dialog.close();
            } );

            // if we still have (open) dialogs, stop
            if ( lDialogs.length ) {
                return rejectRedirect( lDeferred );
            }
        }

        // Clear data of the current page
        $( document ).trigger( "selectionChanged", [ "controller", []] );

        model.clear();
        $( document ).trigger( "modelCleared", {
            preventHideNotification: pPreventHideNotification
        } );

        // Load new page
        $( "#go_to_page" ).val( pPageId );

        // When moving to a different page, update the URL parameter to reflect
        // the new page. This is useful when reloading page designer, so that
        // the correct fb_flow_page_id is reloaded.
        if ( pUpdateUrl ) {
            // Get the current URL of Page Designer
            let url = new URL( window.location.href );
            // Get the URL parameters of Page Designer
            let params = new URLSearchParams( url.search );

            // Set the fb_flow_page_id parameter to the new page
            params.set( "fb_flow_page_id", pPageId );

            // Update the URL
            url.search = params.toString();

            // Replace the current URL with the new URL and
            // decode URI lessen the visual impact
            window.history.replaceState( {}, "", decodeURIComponent( url.toString() ) );
        }

        util.delayLinger.start( "main", function(){
            lSpinner$ = util.showSpinner( lContainer$ );
            lContainer$.addClass( C_PROCESSING );
        } );

        if ( !gStaticData ) {
            gStaticData = $.ajax( {
                dataType: "json",
                type:     "GET",
                url:      env.APEX_FILES + "apex_ui/js/staticData/pd_static_data_" + gLanguage + ".json?v=" + gApexVersion
            } );
        }
        lWorkspaceData = ajax( "getWorkspaceData", {}, {
            type: "GET"
        } );
        lSharedData = ajax( "getSharedData", {}, {
            type: "GET"
        } );

        lPageData = ajax( "getPageData", {
            x01: pPageId
        }, {
            type: "GET"
        } );

        // todo add some error handling
        $.when( gStaticData, lWorkspaceData, lSharedData, lPageData )
            .done( function( pStaticData, pWorkspaceData, pSharedData, pPageData ) {

                var pageData,
                    pageId,
                    workingCopyDiffs;

                if ( $.isEmptyObject( pPageData[ 0 ] ) ) {
                    pd.showError( pd.msg( "PAGE_DOES_NOT_EXIST" ) );
                } else {

                    pageData = pPageData[ 0 ][ model.COMP_TYPE.PAGE ][ 0 ];
                    pageId = pageData.pageId;
                    // Update the Go to Page input field with the returned page# just in case a page alias has been entered
                    $( "#go_to_page" ).val( pageId );

                    model.initModelConfig( pStaticData[ 0 ], pWorkspaceData[ 0 ], pSharedData[ 0 ] );
                    model.setComponentData( pPageData[ 0 ] );

                    model.setCurrentAppId( $v( "P4500_CURRENT_APP" ) );
                    model.setCurrentPageId( pageId );

                    // Get Page Info for title and breadcrumb updates
                    const appId = model.getCurrentAppId();
                    const pageName = pageData.properties[ pe.PROP.NAME ];

                    // Update document title with current page information
                    const documentTitle = pd.formatNoEscape( "HTML.TITLE", appId, pageId, pageName );
                    document.title = documentTitle;

                    // Update breadcrumb label with current page information
                    const breadcrumbLabel = pd.formatNoEscape( "BREADCRUMB.PAGE_NAME", pageId, pageName );
                    $( '.a-Breadcrumb-item.is-active .a-Breadcrumb-label' ).text( breadcrumbLabel );

                    $( document ).trigger( "modelReady" );

                    // Get team development and page comment count
                    ajax( "getAdditionalData", {
                        x01: pageId
                    }, {
                        type: "GET",
                        success: function( pData ) {
                            var lTotal, lTitle;

                            if ( pData.prevPageId ) {
                                apexActions.lookup( M_PREV_PAGE ).pageId = pData.prevPageId;
                                apexActions.enable( M_PREV_PAGE );
                            }
                            if ( pData.nextPageId ) {
                                apexActions.lookup( M_NEXT_PAGE ).pageId = pData.nextPageId;
                                apexActions.enable( M_NEXT_PAGE );
                            }

                            if ( gTeamDevEnabled ) {
                                lTotal = pData.teamDev.features + pData.teamDev.bugs + pData.teamDev.todos + pData.teamDev.feedback + pData.teamDev.issues;
                                lTitle = pd.format( "TEAM_DEV_BADGE_TITLE", lTotal );
                                if ( lTotal === 0 ) {
                                    lTotal = "";
                                    $( "#menu-team-dev" ).hide();
                                } else {
                                    $( "#menu-team-dev" )
                                        .show()
                                        .prop( P_DISABLED, false )
                                        .attr( A_LABEL, lTitle )
                                        .attr( A_TITLE, lTitle )
                                        .find( ".a-Button-badge" ).text( lTotal );
                                }
                                gTeamDevCounters = pData.teamDev;
                            }
                        }
                    } );

                    // Select the page node as starting node
                    $( document ).trigger( "selectionChanged", [ "controller", model.getComponents( model.COMP_TYPE.PAGE, { id: model.getCurrentPageId()} )] );

                    // Trigger page search
                    apexItem("P4500_LOCAL_SEARCH").element.trigger( "change" );

                    // Show or hide the working copy diffs button if there are existing changes or locks
                    workingCopyDiffs = pageData.workingCopyPageChanges > 0 ||
                                       pageData.workingCopyPageLocks   > 0;
                    if ( workingCopyDiffs ) {
                        $( "#page-diffs-button" )?.show();
                    } else {
                        $( "#page-diffs-button" )?.hide();
                    }

                    lDeferred.resolve();
                }
            } )
            .fail( function() {
                lDeferred.reject();
            } )
            .always( function() {
                util.delayLinger.finish( "main", function(){
                    lSpinner$.remove();
                    lContainer$.removeClass( C_PROCESSING );
                } );
            } );

        return lDeferred.promise();

    };


    pd.goToComponent = function( typeId, componentId, propertyId ) {
        let components = model.getComponents( typeId, { id: componentId } ),
            // the "ui-dialog-instances" is an *internal* detail which contains a list of active dialogs
            dialogs = $( document ).data( "ui-dialog-instances" );

        if ( components.length !== 1 ) {
            return false;
        } else if ( dialogs?.length ) {
            // try to close the dialogs (dialogs with unsaved changes won't close and show an alert)
            dialogs.forEach( dialog => {
                dialog.close();
            } );

            // if we still have (open) dialogs, stop
            if ( dialogs.length ) {
                // returning false would trigger the error handler -> refresh of the designer
                return true;
            }
        }
        $( document ).trigger( "selectionChanged", [ "controller", components, propertyId ] );
        // make sure the right tab panel is selected
        $( "#PDrenderingTree, #PDdynamicActionTree, #PDprocessingTree, #PDsharedCompTree" ).each( function() {
            var node, tree$ = $( this );

            node = tree$.treeView( "getSelectedNodes" )[0];
            if ( node && node.data.componentId === componentId ) {
                // from the tree find the tab it is in. The id is the tab name to activate
                activateTab( tree$.closest( ".ui-tabs-panel" )[0].id );
                // select again to make sure it is scrolled into view and focus, but don't change the focus if we want
                // to set focus to a specific property
                tree$.treeView( "setSelectedNodes", [ node ], ( propertyId === undefined ), true );
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
        var lMessage$ = $( "#pdNotificationMessage" );
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

        var help$ = $( "#help-container" );

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
        var help$ = $( "#help-container" ),
            markup = pd.msg( "HELP.DEFAULT" );

        help$.html( markup );
    };


    pd.getPreference = function( pName ) {
        var lName = "PD_" + pName;

        // Note: gPreferences is a global emitted directly from page 4500 during rendering
        return ( hasOwnProperty( window.gPreferences, lName ) ) ? window.gPreferences[ lName ] : null;
    };

    pd.savePreference = function( pName, pValue ) {
        var lName = "PD_" + pName,
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
        var lValue = pd.getPreference( pName );
        if ( lValue === null ) {
            lValue = pDefaultValue;
        } else {
            lValue = ( lValue === "Y" );
        }
        return lValue;
    };

    function enableTooltips( enable ) {
        setTimeout( () => {
            $( document ).find( ":data(ui-tooltip):not(.a-Gallery,.a-ControlBar)" ).tooltip( "option", "disabled", !enable );
        }, 0 );
    }

    // store the tab width to speed up, so next time just look up.
    function storeTabsLabelWidth( tabSetId, tabs$ ) {
        var tabsWidthSum = 0;

        tabs$.each( function(){
            var tab$   = $( this ),
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

            var tabSet$ = $( tabSetId ),
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
        var tabName,
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
    pd.getTabsLayout = getTabsLayout;

    function storeTabsLayout() {
        var columnMode,
            mainContent$ = $( "#sp_main_content" ),
            layout = getTabsLayout();

        if ( mainContent$.hasClass( "a-Splitter" ) ) {
            columnMode = PREF_TAB_LAYOUT_3;
        } else {
            columnMode = PREF_TAB_LAYOUT_2;
        }
        pd.savePreference( columnMode, layout );
    }
    pd.storeTabsLayout = storeTabsLayout;

    function loadTabsLayout( layout, skipActivateTabs ) {
        var i, layoutTabs, tab, useThreeColumns,
            tabSets = [],
            allTabs$ = $(),
            mainContent$ = $( "#sp_main_content" ),
            tempTabs = {};

        if ( !layout ) {
            layout = gTabsDefaultLayout;
        }

        // init info about tab sets
        TAB_SETS.forEach( function( tabSetId ) {
            var tabPanels$ = $( tabSetId ), // this is the tab widget but also the place where panels are appended
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
            var tab$ = $( this ),
                name = tab$.attr( A_ARIA_CONTROLS ),
                panel$ = $( "#" + name );

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
            var activeTab = 0;

            tabSet.panels.tabs( REFRESH );
            if ( !skipActivateTabs ) {
                if ( tabSet.panels.children( "#" + tabSet.activeName ).length ) {
                    activeTab = tabSet.tabs.children( "[aria-controls=" + tabSet.activeName + "]" ).index();
                }
                tabSet.panels.tabs( OPTION, ACTIVE, activeTab );
            }
        } );

        getTabsLayout();
    }
    pd.loadTabsLayout = loadTabsLayout;

    function activateTab( tabName ) {
        var tabCfg = gTabsConfig[ tabName ];

        if ( tabCfg.tabs === TAB_SETS[0] ) {
            // the first (left) tab set is in a splitter so make sure it is expanded
            expandSplitterIfNeeded( "sp_main_content" );
        } else if ( tabCfg.tabs === TAB_SETS[2] ) {
            // the last (right) tab set is in a splitter so make sure it is expanded
            expandSplitterIfNeeded( "sp_right_content" );
        }
        $( tabCfg.tabs ).tabs( OPTION, ACTIVE, tabCfg.index );
    }
    pd.activateTab = activateTab;

    function toggleEditorTab( pTabId, pValue ) {
        var tabSetId  = TAB_SETS[ 1 ], // #editor_tabs
            tabSet$   = $( tabSetId ),
            tabIdFull = '#' + pTabId,
            tab       = "[aria-controls='" + pTabId + "']",
            tabCont$  = $( tabIdFull + "," +  tab ),
            pPrefName = PREF_ENABLE_LAYOUT_VIEW;

        var savePref = function() {
            var isTabVisible  = $( tab ).is( ':visible' ),
                isContAvailable = $( tabIdFull ).length > 0;

            pd.saveBoolPref( pPrefName, pValue );
            pd.storeTabsLayout();

            if ( isTabVisible && isContAvailable ) {
                tabSet$.tabs( 'option', 'active', 0 );
            }

            updateTabs();
        };

        var addTab = function( pData ){

            var tabSetId  = pData.tabSetId,
                tabId     = pData.tabId,
                tabName,
                icon,
                //
                tabSet    = $( tabSetId ).tabs(),
                ul        = tabSet.find( "ul.ui-tabs-nav" ).first(),
                tabIdFull = '#' + tabId,
                hasNoTab  = $( tabIdFull ).length === 0;

            if ( hasNoTab ) {

                tabName = 'Layout';
                icon    = 'icon-pd-layout';

                $( "<li aria-controls='" + tabId + "'><a href='" + tabIdFull + "'><span title='" + tabName + "' class='a-Icon " + icon + "'></span><span class='a-Tabs-label'>" + tabName + "</span></a></li>" )
                    .prependTo( ul );

                tabSet.tabs( "refresh" );
            }
        };

        var removeTab = function( tabSetId ){
            tabCont$.remove();
            $( tabSetId ).tabs( 'refresh' );
        };

        if ( pValue ) {

            addTab( {
                        tabSetId: tabSetId,
                        tabId:    pTabId
            } );

            savePref();

            // Reload required to bring tab back on page
            apex.message.confirm( pd.msg( 'ENABLE_VIEW_WARN' ), function( okPressed ) {
                if( okPressed ) {

                    location.reload();
                }
            } );
        } else {
            removeTab( tabSetId );
            savePref();
        }
    }

    /**
     * Return the tab$ (nav tab) for the given tabName
     * @param tabName
     */
    pd.getTab = function( tabName ) {
        var tabCfg = gTabsConfig[ tabName ];
        return $( tabCfg.tabs ).find( ".ui-tabs-nav" ).first().children().eq( tabCfg.index );
    };

    pd.openUnsubscribeDialog = function() {
        unsubscribeDialog$.dialog( {
            modal: true,
            dialogClass: "ui-dialog--pageDesignerMsg",
            width: 480,
            minWidth: 320,
            minHeight: 320,
            title: pd.msg( "UNSUBSCRIBE" ),
            buttons: [ {
                    text: pd.msg( "CANCEL" ),
                    click:  function() {
                        unsubscribeDialog$.dialog( "close" );
                    }
                }, {
                    text: pd.msg( "UNSUBSCRIBE" ),
                    class: "a-Button--hot",
                    click:  function() {
                        model.unsubscribePage()
                            .fail(function(pReason) {
                                unsubscribeDialog$.dialog( "close" );
                                pd.showError( pReason );
                            })
                            .done(function() {
                                unsubscribeDialog$.dialog( "close" );
                                pd.goToPage( model.getCurrentPageId() );
                            });
                    }
            }]
        } );
    };

    pd.applicationMessages = function( value, all ) {
        const getMessageObj = ( m ) => ( {
            d: m.message,
            r: m.messageKey,
            isJS: m.isJS,
            // we are intentionally being more restrictive with the placeholder names (only alphanumeric plus underscore)
            // (from "Hello %name!" most likely only "name" would be used - even though "name!" is the whole placeholder key)
            placeholders: [ ...m.message.matchAll( /%([\w]+)/g ) ],
        } );
        const getMatchedMessages = messages => {
            return messages.flatMap( m => {
                let messageData = gApplicationMessages.get( m.messageKey );
                if ( messageData ) {
                    return [ { ...messageData, full: m.message, parameters: m.parameters } ];
                }
                return [];
            } );
        };
        let messages = [];
        return new Promise( resolve => {
            if ( all ) {
                ajax( "getApplicationMessages", {} ).then( ( data ) => {
                    data?.messages.forEach( m =>  {
                        gApplicationMessages.set( m.messageKey, getMessageObj( m ) );
                    } );
                    resolve( Array.from( gApplicationMessages ).map( ( [ , value ] ) => value ) );
                } );
            } else {
                let stringValue = typeof value === "string" ? value : "";
                messages = util.getTextMessagesFromTemplate( stringValue ) || [];
                // pre 24.2, messages using the "new" syntax are not considered messages, they are displayed as plain strings,
                // therefore we don't want to process them/treat them differently in the preview
                if ( model.getCompatibilityMode() < 24.2 ) {
                    messages = messages.filter( m => m.message.includes( "APP_TEXT$" ) );
                }
                let notInCacheMessages = messages.filter( m => !gApplicationMessages.get( m.messageKey ) );
                if ( notInCacheMessages.length > 0 ) {
                    ajax( "getApplicationMessages", {
                        f01: notInCacheMessages.map( u => u.messageKey )
                    } ).then( ( data ) => {
                        // store the new message data in memory
                        data?.messages.forEach( m =>  {
                            gApplicationMessages.set( m.messageKey, getMessageObj( m ) );
                        } );
                        // if the message is not in the response, it means that the message does not exist
                        // in this case only the message key is displayed
                        const nonExistentMessages = notInCacheMessages.filter( m => !data?.messages.some( dm => dm.messageKey === m.messageKey ) ).map( m => ( {
                            ...getMessageObj( m ),
                            d: m.messageKey,
                            full: m.message,
                            parameters: m.parameters
                        } ) );
                        resolve( [ ...getMatchedMessages( messages ), ...nonExistentMessages ] );
                    } );
                } else {
                    resolve( getMatchedMessages( messages ) );
                }
            };
        } );
    };

    // END common page designer constants and functions

    var pe$ = $( "#peMain" ),
        peAttributes$ = $( "#peAttributes" ),
        pePrinting$ = $( "#pePrinting" ),
        msgDialog$ = $( '#pdMessagesDialog' ),
        unsubscribeDialog$ = $( '#pdUnsubscribeDialog' );

    function parseSelectionHash( hash ) {
        var parts,
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

    function expandSplitterIfNeeded( splitRegionId ) {
        var s$ = $( "#" + splitRegionId + ".a-Splitter" );
        if ( s$.length ) {
            if ( s$.splitter( OPTION, "collapsed" ) ) {
                s$.splitter( OPTION, "collapsed", false );
            }
        }
    }

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

    // $$$ TODO We might want to move all the toolbar related code into it's own f4000_p4500.toolbar.js file
    // related todo consider converting all the toolbars to use toolbar widget
    function initToolbar() {
        var lTeamMenu$, lSpinner$,
            lCreateMenu$    = $( "#createMenu_menu" ),
            lLockButton$ = $( "#button-lock" ),
            lLockDialog$ = $( "#lockDialog" ),
            lRunDialogOpenMsg$ = $( "#runDialogOpenMsg" ),
            lRunDialogFocusMsg$ = $( "#runDialogFocusMsg" ),
            msgButton$ = $( '#pdShowMessagesBtn' );

        function doSave( pCallback ) {
            var lContainer$ = $( "#a_PageDesigner" ),
                lButtons = [M_UNDO, M_REDO, M_SAVE_PAGE, M_SAVE_RUN_PAGE];

            util.delayLinger.start( "main", function(){
                lSpinner$ = util.showSpinner( lContainer$ );
                lContainer$.addClass( C_PROCESSING );
            } );
            // disable all controls that can affect the model
            lButtons.forEach( function( actionName ) {
                apexActions.disable( actionName );
            } );
            $( ".a-TreeView" ).treeView( DISABLE );
            $( "#glv" ).gridlayout( DISABLE );
            pe$.propertyEditor( DISABLE );
            // tell model to save the changes
            model.saveChanges( function( pResponse ) {
                // done
                // enable all controls that were disabled around save
                lButtons.forEach( function( actionName ) {
                    apexActions.enable( actionName );
                } );
                $( ".a-TreeView" ).treeView( ENABLE );
                $( "#glv" ).gridlayout( ENABLE );
                pe$.propertyEditor( ENABLE );
                util.delayLinger.finish( "main", function(){
                    lSpinner$.remove();
                    lContainer$.removeClass( C_PROCESSING );
                } );
                pCallback( pResponse );
            } );
            pe$.find( "." + pd.CSS.IS_CHANGED ).removeClass( pd.CSS.IS_CHANGED );
        }

        function setCreateMenuActions ( pMenuItems ) {
            var i, item;
            for ( i = 0; i < pMenuItems.length; i++ ) {
                if ( hasOwnProperty( pMenuItems[ i ], "menu" ) ) {
                    setCreateMenuActions( pMenuItems[ i ].menu.items );
                } else {
                    let actionName;
                    item = pMenuItems[ i ];
                    // if it is an action then update the action function on the action not the menu item
                    if ( typeof item.action === "string" ) {
                        actionName = item.action;
                        // clone the original action
                        item = { ...apexActions.lookup( item.action ) };
                    }
                    item.action = function( event, focusElement, args ) {
                        if ( model.hasChanged() ) {
                            // eslint-disable-next-line no-alert
                            if ( window.confirm( pd.msg( "BEFORE_AJAX_UNSAVED_CHANGES" ) ) ) {
                                if ( actionName ) {
                                    apexActions.invoke( actionName, event, focusElement, args );
                                } else {
                                    nav.redirect( this.href );
                                }
                                return true;
                            }
                        } else {
                            if ( actionName ) {
                                apexActions.invoke( actionName, event, focusElement, args );
                            } else {
                                nav.redirect( this.href );
                            }
                            return true;
                        }
                    };
                }
            }
        }

        // initialize global command error handler
        commandHistory.setErrorHandler( function( pOperation, pCommand ) {
            var lOperationLabel = {
                "execute": "CMD.EXECUTE_FAILED",
                "undo": "CMD.UNDO_FAILED",
                "redo": "CMD.REDO_FAILED"
            };
            pd.showError( pd.format( lOperationLabel[ pOperation ], pCommand.label() ) );
        } );

        /*
         * Toolbar actions
         */
        apexActions.add( [
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
                    var layout = pd.getPreference( PREF_TAB_LAYOUT_2 );
                    if ( !layout ) {
                        layout = gTabsDefaultLayout.replace( /0:/g, "1:" ); // the default with tabs from left set moved to middle set
                    }
                    loadTabsLayout( layout );
                    pd.saveBoolPref( PREF_TWO_COLUMN_MODE, true );
                    apexActions.disable( M_TWO_COLUMN );
                    apexActions.enable( M_THREE_COLUMN );
                }
            },
            {
                name: M_THREE_COLUMN,
                action: function() {
                    var layout = pd.getPreference( PREF_TAB_LAYOUT_3 );
                    if ( !layout ) {
                        layout = gTabsDefaultLayout;
                    }
                    // make sure there is at least one tab in the left column
                    if ( layout.indexOf( "0:" ) < 0 ) {
                        layout = layout.replace( /^1:/, "0:" ); // pick the first tab
                    }
                    loadTabsLayout( layout );
                    pd.saveBoolPref( PREF_TWO_COLUMN_MODE, false );
                    apexActions.disable( M_THREE_COLUMN );
                    apexActions.enable( M_TWO_COLUMN );
                }
            },
            {
                name: "pd-reset-tab-layout",
                action: function() {
                    loadTabsLayout( gTabsDefaultLayout );
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
                    activateTab( TAB_NAME_PE_COMP );
                    activateTab( TAB_NAME_LAYOUT );
                    activateTab( TAB_NAME_RENDERING );
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
                name: M_TEXT_MESSAGES_PICKER,
                set: function( value ) {
                    pd.saveBoolPref( PREF_ENABLE_TEXT_MESSAGES_PICKER, value );
                    pd.textMessagesPickerEnabled = value;
                    pe$.propertyEditor( REFRESH );
                },
                get: function() {
                    return pd.getBoolPref( PREF_ENABLE_TEXT_MESSAGES_PICKER, false );
                }
            },
            {
                name: "pd-show-layout-view",
                set: function( value ) {
                    toggleEditorTab( TAB_NAME_LAYOUT, value );
                },
                get: function() {
                    return pd.getBoolPref( PREF_ENABLE_LAYOUT_VIEW, true );
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
                    var runWindowGotFocus,
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
                        var pageComponent = model.getComponents( model.COMP_TYPE.PAGE )[0],
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

        $( document ).on( "commandHistoryChange", function() {
            var lLabel, action;

            action = apexActions.lookup( M_UNDO );
            if ( !action.origLabel ) {
                action.origLabel = action.label;
            }
            action.disabled = !commandHistory.canUndo();
            if ( commandHistory.canUndo() ) {
                lLabel = lang.formatMessageNoEscape( "PD.UNDO", commandHistory.undoLabel() );
                action.label = action.title = lLabel;
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
                lLabel = lang.formatMessageNoEscape( "PD.REDO", commandHistory.redoLabel() );
                action.label = action.title = lLabel;
            } else {
                action.label = action.title = action.origLabel;
            }
            apexActions.update( M_REDO );
        } ).trigger( "commandHistoryChange" );

        // Begin lock button handling

        function updateLockButton() {
            var title,
                lockState = model.getPageLockState();

            if ( !lockState ) {
                title = pd.msg( "PAGE_UNLOCKED" );
                lLockButton$
                    .attr( A_TITLE, title )
                    .attr( A_LABEL, title )
                    .removeClass( "is-locked is-locked-by-self" )
                    .find( SEL_ICON )[ 0 ].className = "a-Icon icon-unlock";
            } else if ( lockState.isLockedByCurrentUser ) {
                title = pd.msg( "PAGE_LOCKED_BY_YOU" );
                lLockButton$
                    .attr( A_TITLE, title )
                    .attr( A_LABEL, title )
                    .removeClass( "is-locked" )
                    .addClass( "is-locked-by-self" )
                    .find( SEL_ICON )[ 0 ].className = "a-Icon icon-lock";
            } else {
                title = pd.format( "PAGE_LOCKED_BY", lockState.owner );
                lLockButton$
                    .attr( A_TITLE, title )
                    .attr( A_LABEL, title )
                    .removeClass( "is-locked-by-self" )
                    .addClass( " is-active is-locked" )
                    .find( SEL_ICON )[0].className = "a-Icon icon-lock-user";
            }
        }

        lLockButton$
            .attr( P_DISABLED, true )
            .on( EVENT_CLICK, function() {

            var title, buttons,
                isReadOnlyComment = false,
                lockState = model.getPageLockState();

            buttons = [
                {
                    text: pd.msg( "CANCEL" ),
                    click:  function() {
                        lLockDialog$.dialog( "close" );
                    }
                }
            ];

            $( "#lockDialogIntroUnlocked, #lockDialogIntroLocked, #lockDialogIntroOwned" ).hide();
            apexItem( "P4500_DLG_LOCK_OWNER" ).hide();
            if ( !lockState || lockState.isLockedByCurrentUser ) {

                buttons.push( {
                    click: function() {
                        lLockDialog$.dialog( "close" );
                        model.lockPage( $v( "P4500_DLG_LOCK_COMMENT" ) )
                            .fail( function( pReason ) {
                                pd.showError( pReason ); // todo consider using a modal dialog
                            } ).always( function() {
                                updateLockButton();
                            } );
                    }
                } );

                if ( !lockState ) {
                    title = pd.msg( "LOCK_PAGE" );
                    buttons[ 1 ].text  = pd.msg( "LOCK" );
                    buttons[ 1 ].class = "a-Button--hot";
                    $( "#lockDialogIntroUnlocked" ).show();
                } else {
                    title = pd.msg( "UNLOCK_PAGE" );
                    buttons[ 1 ].text = pd.msg( "APPLY_CHANGES" );
                    $( "#lockDialogIntroOwned" ).show();

                    buttons.push( {
                        text: pd.msg( "UNLOCK" ),
                        "class": "a-Button--hot",
                        click: function() {
                            lLockDialog$.dialog( "close" );
                            model.unlockPage()
                                .fail( function( pReason ) {
                                    pd.showError( pReason ); // todo consider using a modal dialog
                                } ).always( function() {
                                    updateLockButton();
                                } );
                        }
                    } );
                }

            } else {
                title = pd.msg( "PAGE_LOCKED" );
                $( "#lockDialogIntroLocked" ).show();
                apexItem( "P4500_DLG_LOCK_OWNER" ).show();
                $s( "P4500_DLG_LOCK_OWNER", lockState.owner );
                isReadOnlyComment = true;
                buttons[ 0 ].text = pd.msg( "OK" );
            }
            $( "#P4500_DLG_LOCK_COMMENT" )
                .val( lockState.comment )
                .attr( "readOnly", isReadOnlyComment );

            lLockDialog$.dialog( {
                modal: true,
                title: title,
                closeText: lang.getMessage( "APEX.DIALOG.CLOSE" ),
                dialogClass: "ui-dialog--pageDesignerLock",
                width: 600,
                height: 340,
                minHeight: 340,
                minWidth: 600,
                create: function() {
                    $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                },
                buttons: buttons
            } );

        } );
        // End lock button handling

        // Message button handling
        msgButton$.on( EVENT_CLICK, function(){
            openMsgDialog();
        } );

        $( "#pdMessages" )
            .peMessagesView( {
                badge: msgButton$.find( "span.a-Button-badge" ),
                button: msgButton$,
                noMsgHandler: function(){
                    if ( msgDialog$.hasClass( "ui-dialog-content" ) ) {
                        // Check for dialog is a must as dialog may not be initialized
                        msgDialog$.dialog( "close" );
                    }
                }
            } );
        // End message button handling

        // fix up menu - the team dev sub menu is conditional
        lCreateMenu$.on( "menucreate", function() {
            var teamDevMenu = lCreateMenu$.menu( "find", "teamDev" );

            if ( teamDevMenu ) {
                teamDevMenu.hide = !gTeamDevEnabled;
            }
            // Add custom menu item actions, because here we want to override the default navigation by 'href', so we can
            // check for unsaved changes.
            setCreateMenuActions( lCreateMenu$.menu( OPTION ).items );
        } );

        /* todo to be implement in 5.2
         * The settings menu was removed but now it is back
        {
            type: "radioGroup",
            set: function ( pValue ) {
                pd.settingsState.componentTitle = pValue;
                $( document ).trigger( "settingsStateChanged", [ "componentTitle" ]);
            },
            get: function () {
                return pd.settingsState.componentTitle;
            },
            choices: [
                { labelKey: "PD.SHOW_LABELS", value: pd.SETTINGS.COMPONENT_TITLE.LABEL },
                { labelKey: "PD.SHOW_NAMES",  value: pd.SETTINGS.COMPONENT_TITLE.NAME  }
            ]
        },
        */

        if ( gTeamDevEnabled ) {
            lTeamMenu$ = $( "<div id='teamDevMenu'></div>" ).appendTo( "body" );

            lTeamMenu$.menu( {
                menubar: false,
                items: [ // Note: All labels are replaced by the beforeOpen callback
                    {
                        type: "action",
                        labelKey: "PD.FEEDBACK_ENTRIES",
                        action: function () {
                            nav.redirect( util.makeApplicationUrl( {appId: "4650", pageId: "8000", request: "BUILDER", clearCache: "RIR",
                                itemNames: [ "IR_APPLICATION_ID", "IR_PAGE_ID", "IRLT_FEEDBACK_STATUS_ID" ],
                                itemValues: [ model.getCurrentAppId(), model.getCurrentPageId(), "3" ]} ) );
                        }
                    },
                    {
                        type: "action",
                        labelKey: "PD.ISSUES",
                        action: function () {
                            nav.redirect( util.makeApplicationUrl( {appId: "4600", pageId: "1",
                                itemNames: [ "P1_APPLICATION_ID", "P1_PAGE_ID" ],
                                itemValues: [ model.getCurrentAppId(), model.getCurrentPageId() ]} ) );
                        }
                    }
                ],
                beforeOpen: function( pEvent, pMenu ) {
                    var i, lLabel,
                        lItems = pMenu.menu.items,
                        lLabels = [ ["FEEDBACK_ENTRIES_N", "feedback"], ["ISSUES_N","issues"] ];

                    for ( i = 0; i < lLabels.length; i++ ) {
                        lLabel = lLabels[i];
                        if ( gTeamDevCounters[lLabel[1]] !== undefined ) {
                            lItems[i].label = pd.format( lLabel[0], gTeamDevCounters[lLabel[1]] );
                            delete lItems[i].labelKey;
                        }
                    }
                }
            } );

        }

        // Bind events to go to page elements
        $( "#go_to_page" ).on( "keypress", function( pEvent ) {
            if ( pEvent.which === 13 ) {
                pd.goToPage( $( "#go_to_page" ).val() );
            }
        } ).on( "focus", function( ) {
            this.select();
        } );

        /*
         * The goto page field lets you change the page but it is also the main place that tells you what page you are on.
         * When you changes the number but don't soon cause going to the new page it looks like you are on a page
         * that you are not actually on. We can't put any time limit on how long someone takes to press Go after the
         * field looses focus. But we can assume if they put focus back in the main page designer area that they have
         * "gone back to work" and it is time to make sure the field reflects the current page.
         */
        $( "#a_PageDesigner" ).on( "focusin", function() {
            checkDisplayCurrentPage();
        } );

        $( "#go_to_page_button" ).on( EVENT_CLICK, function() {
            pd.goToPage( $( "#go_to_page" ).val() );
        } );

        $( "#go_to_page_lov" ).on( "click", function() {
            var out = util.htmlBuilder(),
                lPageFinderLovDialogOptions = {
                    columnDefinitions: [
                        {
                            name:  "id",
                            title: pd.msg( "PAGE_NUMBER" )
                        },
                        {
                            name:        "name",
                            title:       pd.msg( "PAGE_NAME" ),
                            isRowHeader: true,
                        },
                        {
                            name:  "alias",
                            title: pd.msg( "PAGE_ALIAS" )
                        },
                        {
                            name:  "group",
                            title: pd.msg( "GROUP" )
                        }
                    ],
                    filters: [
                        {
                            name:         "show",
                            title:        pd.msg( "PAGE_PICKER.SHOW" ),
                            type:         "buttonset",
                            defaultValue: "all",
                            lov: [
                                {
                                    display: pd.msg( "ALL_PAGES" ),
                                    value:   "all"
                                },
                                {
                                    display: pd.msg( "PAGE_PICKER.RECENTLY_EDITED" ),
                                    value:   "recent"
                                }
                            ]
                        },
                        {
                            name:   "search",
                            title:  pd.msg( "SEARCH" ),
                            type:   "search"
                        }
                    ],
                    filterLov: function( pFilters, pRenderLovEntries ) {

                        var lFilters = {};

                        if ( pFilters.show === "current_group" ) {
                            lFilters = {
                                show: "group_id",
                                id:   model.getComponents( model.COMP_TYPE.PAGE, { id: model.getCurrentPageId() } )[ 0 ].getProperty( model.PROP.PAGE_GROUP ).getValue()
                            };
                        } else if ( pFilters.show === "recent" ) {
                            lFilters = {
                                show: "recent"
                            };
                        }

                        model.getPagesLov( lFilters, function( pLovValues ) {
                            pRenderLovEntries( pLovValues, pFilters.search );
                        }, 'Y', 'Y' );
                    }
                };

            if ( model.getCurrentPageId() !== undefined ) {

                // Check if the current page has a page group, if so add filter for current group / all groups
                if ( model.getComponents( model.COMP_TYPE.PAGE, { id: model.getCurrentPageId() } )[ 0 ].getProperty( model.PROP.PAGE_GROUP ).getValue() ) {
                    lPageFinderLovDialogOptions.filters[ 0 ].lov.unshift( {
                        display: pd.msg( "CURRENT_GROUP" ),
                        value:   "current_group"
                    } );
                }
            }

            out.markup( "<div" )
                .attr( "id", "goToPageDlg" )
                .attr( A_TITLE, pd.msg( "PAGE_FINDER" ) )
                .markup( ">" )
                .markup( "</div>" );

            $( out.toString() ).lovDialog( {
                modal:             true,
                minWidth:          750,
                height:            500,
                filters:           lPageFinderLovDialogOptions.filters,
                columnDefinitions: lPageFinderLovDialogOptions.columnDefinitions,
                filterLov:         lPageFinderLovDialogOptions.filterLov,
                dialogClass:       pd.CSS.DIALOG_FLUSH_BODY,
                resizable:         false,
                multiValue:        false,
                valueSelected: function( pEvent, pData ) {

                    pd.goToPage( pData.id );

                }
            } );
        } );

        // get the initial value of the "Text Message Dialog" menu entry; it'll be used in the Property Editor
        // to hide/show the "globe buttons"
        pd.textMessagesPickerEnabled = pd.getBoolPref( PREF_ENABLE_TEXT_MESSAGES_PICKER, false );

        $( document ).on( "modelReady", function(){

            // enable lock button
            if ( !model.isPageReadOnly() || model.getPageLockState() ) {
                lLockButton$.attr( P_DISABLED, false );
                updateLockButton();
            }

            // enable save and run buttons
            [M_SAVE_PAGE, M_SAVE_RUN_PAGE].forEach( function(  actionName ) {
                apexActions.enable( actionName );
            } );

            // get the "Commented Out" Build Option's id
            let commentedOutBuilOption = model.getComponents( model.COMP_TYPE.BUILD_OPTION, {
                properties: [ {
                    id: model.PROP.NAME,
                    value: lang.getMessage( "APEXAPP.BUILD_OPTION.COMMENTED_OUT" )
                } ]
            } );
            pd.COMMENTED_OUT_ID = commentedOutBuilOption.length ? commentedOutBuilOption[ 0 ].id : undefined;

            // hide the text-message-picker menu entry and disable the action below 24.2
            if ( model.getCompatibilityMode() < 24.2 ) {
                apexActions.disable( M_TEXT_MESSAGES_PICKER );
            }

            $( document ).one( "modelCleared", function(){
                // clear command history
                commandHistory.clear();
                $( document ).trigger( "commandHistoryChange" );

                // disable lock, save and run buttons
                lLockButton$.attr( P_DISABLED, true );
                [M_NEXT_PAGE, M_PREV_PAGE, M_SAVE_PAGE, M_SAVE_RUN_PAGE].forEach( function( actionName ) {
                    apexActions.disable( actionName );
                } );

                // disable team development
                if ( gTeamDevEnabled ) {
                    $( "#menu-team-dev" )
                        .hide()
                        .prop( P_DISABLED, true )
                        .find( ".a-Button-badge" ).text( "" );
                    gTeamDevCounters = {};
                }

                pd.COMMENTED_OUT_ID = undefined;

            } );

            // enable or disable based on preference after all tooltips created
            enableTooltips( pd.getBoolPref( PREF_ENABLE_TOOLTIPS, false ) );

        } );

    }

    function initSearch() {

        var lSearch$ = $( "#search-container" ).peSearch();

        $( "#P4500_LOCAL_SEARCH,#P4500_MATCH_CASE,#P4500_IS_REGEXP" ).on( "change", function() {

            var lValue    = $v( "P4500_LOCAL_SEARCH" ),
                lModifier = ( ( $v( "P4500_MATCH_CASE" ) === "Y" ) ? "" : "i" ) + "g",
                lIsRegExp = ( $v( "P4500_IS_REGEXP" ) === "Y" );

            if ( lValue !== "" ) {
                if ( lIsRegExp ) {
                    lValue = new RegExp( lValue, lModifier );
                } else {
                    lValue = new RegExp( util.escapeRegExp( lValue ), lModifier );
                }

                lSearch$.peSearch( "search", lValue );
            } else {
                lSearch$.peSearch( "clear" );
            }
        } );

        $( "#CLEAR_PAGE_SEARCH" ).on( "click", function() {
            $s( "P4500_LOCAL_SEARCH", "", "", true );
            $s( "P4500_MATCH_CASE",   "", "", true );
            $s( "P4500_IS_REGEXP",    "", "", true );
            lSearch$.peSearch( "clear" );
        } );

        $( document ).on( "pageSearch", function( pEvent, pSearchText ) {

            // Make the Page Search tab the active tab
            activateTab( TAB_NAME_SEARCH );
            // Set the search values provided by the caller
            $s( "P4500_MATCH_CASE", "", "", true );
            $s( "P4500_IS_REGEXP",  "", "", true );
            $s( "P4500_LOCAL_SEARCH", pSearchText ); // will trigger the change event and issue the query

        } );
    }

    // when dom ready
    $( function() {
        var sessionStorage = storage.getScopedSessionStorage( {
                useAppId : false,
                prefix: "ORA_WWV_apex.builder.pageDesigner"
            } );
        var gKeys = $.ui.keyCode;

        $( "#sp_main" ).show(); // to avoid incomplete visual layout the main content of the page is hidden until now
        initToolbar();
        initSearch();
        model.init( {
            isInternal: gIsInternal,
            isReadOnly: gIsReadOnly
        } );

        // run initModel after the ready event so that modelReady will always fire after ready
        setTimeout( function() {

            // Call goToPage and
            // pass true for pPreventHideNotification to prevent hiding any notification (bug #20554286)
            // pass false for pUpdateUrl to omit changing the URL on the initial page load
            var lDeferred = pd.goToPage( $( "#go_to_page" ).val(), true, false );

            $.when( lDeferred ).done( function() {

                // look for a initial component to select
                var lSelection = parseSelectionHash( window.location.hash );
                if ( lSelection ) {
                    pd.goToComponent( lSelection.typeId, lSelection.componentId );
                }

            } );

        }, 0 );

        /*
         * Navigation and other global actions
         */
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
                    var self = this;

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
                name: M_GO_RENDERING,
                label: pd.msg( "ACTION.GOTO_RENDERING" ),
                action: function() {
                    activateTab( TAB_NAME_RENDERING );
                    $( "#PDrenderingTree" ).treeView( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_DA,
                label: pd.msg( "ACTION.GOTO_DA" ),
                action: function() {
                    activateTab( TAB_NAME_DA );
                    $( "#PDdynamicActionTree" ).treeView( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_PROCESSING,
                label: pd.msg( "ACTION.GOTO_PROCESSING" ),
                action: function() {
                    activateTab( TAB_NAME_PROCESSING );
                    $( "#PDprocessingTree" ).treeView( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_SHARED,
                label: pd.msg( "ACTION.GOTO_SHARED" ),
                action: function() {
                    activateTab( TAB_NAME_SHAREDCOMP );
                    $( "#PDsharedCompTree" ).treeView( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_LAYOUT,
                label: pd.msg( "ACTION.GOTO_GLV" ),
                action: function() {
                    activateTab( TAB_NAME_LAYOUT );
                    $( "#glv" ).gridlayout( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_PE_MAIN,
                label: pd.msg( "ACTION.GOTO_PE_MAIN" ),
                action: function() {
                    activateTab( TAB_NAME_PE_COMP );
                    pe$.propertyEditor( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_PE_ATTRIBUTES,
                label: pd.msg( "ACTION.GOTO_PE_ATTRIBUTES" ),
                action: function() {

                    // Attributes tab is conditionally displayed, so only activate / focus if it is currently visible
                    if ( pd.getTab( TAB_NAME_PE_ATTR ).is( ":visible" ) ) {
                        activateTab( TAB_NAME_PE_ATTR );
                        peAttributes$.propertyEditor( "focus" );
                    }
                    return true;
                }
            },
            {
                name: M_GO_PE_PRINTING,
                label: pd.msg( "ACTION.GOTO_PE_PRINTING" ),
                action: function() {

                    // Printing tab is conditionally displayed, so only activate / focus if it is currently visible
                    if ( pd.getTab( TAB_NAME_PE_PRINTING ).is( ":visible" ) ) {
                        activateTab( TAB_NAME_PE_PRINTING );
                        pePrinting$.propertyEditor( "focus" );
                    }
                    return true;
                }
            },
            {
                name: M_GO_G_REGIONS,
                label: pd.msg( "ACTION.GOTO_REGIONS" ),
                action: function() {
                    activateTab( TAB_NAME_LAYOUT );
                    expandSplitterIfNeeded( "sp_glv_content" );
                    $( "#gallery-tabs" ).tabs( OPTION, ACTIVE, 0 );
                    $( "#cg-regions .a-Gallery.a-IconList" ).iconList( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_G_ITEMS,
                label: pd.msg( "ACTION.GOTO_ITEMS" ),
                action: function() {
                    activateTab( TAB_NAME_LAYOUT );
                    expandSplitterIfNeeded( "sp_glv_content" );
                    $( "#gallery-tabs" ).tabs( OPTION, ACTIVE, 1 );
                    $( "#cg-items .a-Gallery.a-IconList" ).iconList( "focus" );
                    return true;
                }
            },
            {
                name: M_GO_G_BUTTONS,
                label: pd.msg( "ACTION.GOTO_BUTTONS" ),
                action: function() {
                    activateTab( TAB_NAME_LAYOUT );
                    expandSplitterIfNeeded( "sp_glv_content" );
                    $( "#gallery-tabs" ).tabs( OPTION, ACTIVE, 2 );
                    $( "#cg-buttons .a-Gallery.a-IconList" ).iconList( "focus" );
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
                    var target$ = $( event.target ),
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
                name: M_NEXT_PAGE,
                label: null,   // label comes from button
                title: null,
                disabled: true,
                pageId: null,
                action: function() {
                    pd.goToPage( this.pageId );
                }
            },
            {
                name: M_PREV_PAGE,
                label: null,   // label comes from button
                title: null,
                disabled: true,
                pageId: null,
                action: function() {
                    pd.goToPage( this.pageId );
                }
            },
            {
                name: M_SHOW_SHORTCUTS,
                label: pd.msg( "KBD_SHORTCUTS" ),
                action: function() {
                    var i, j, sc, action, keys,
                        names = [],
                        actions = {},
                        out = util.htmlBuilder(),
                        shortcuts = apexActions.listShortcuts( true );

                    // group shortcuts by action
                    for ( i = 0; i < shortcuts.length; i++ ) {
                        sc = shortcuts[i];
                        action = actions[sc.actionName];
                        if ( !action ) {
                            names.push( sc.actionName );
                            action = {
                                actionLabel: sc.actionLabel,
                                shortcuts: []
                            };
                            actions[sc.actionName] = action;
                        }
                        action.shortcuts.push( sc.shortcutDisplay );
                    }
                    // sort by actionLabel
                    names.sort( function( a, b ) {
                        if ( actions[a].actionLabel > actions[b].actionLabel ) {
                            return 1;
                        } else if ( actions[a].actionLabel < actions[b].actionLabel ) {
                            return -1;
                        } // else
                        return 0;
                    } );

                    out.markup( "<div" )
                        .attr( "id", "shortcutDlg" )
                        .attr( A_TITLE, pd.msg( "KBD_SHORTCUTS" ) )
                        .markup( " tabindex='0'>" )
                        .markup( "<ul class='a-AVPList a-AVPList--shortcuts'>" );

                    for ( i = 0; i < names.length; i++ ) {
                        action = actions[names[i]];
                        out.markup( "<li class='a-AVPList-item'><span class='a-AVPList-label'>" )
                            .content( action.actionLabel )
                            .markup( "</span><span class='a-AVPList-value'>" );
                        keys = action.shortcuts;
                        for ( j = 0; j < keys.length; j++ ) {
                            out.markup( keys[j] );
                        }
                        out.markup( "</span></li>" );
                    }
                    // todo post 5.0 global or common shortcuts not covered by actions
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
                    return true; // dialog has focus
                }
            }
        ] );

        $( "#helpMenu_menu" ).on( "menucreate", function() {
            var keyboardShortcutsMenu = $( "#helpMenu_menu" ).menu( "find", "keyboardShortcuts" );
            if ( keyboardShortcutsMenu ) {
                keyboardShortcutsMenu.hide   = false;
                keyboardShortcutsMenu.action = M_SHOW_SHORTCUTS;
            }
        } );

        pd.clearHelpText();

        var splitterChangeTimer = null;

        // the pd-expand-restore action state must be kept in sync with the collective splitter state
        $( "body" ).on( "splitterchange splittercreate", function() {
            var action = apexActions.lookup( M_EXPAND_RESTORE );
            // splitter changes often happen in bunches so wait a bit and just update once
            if ( !splitterChangeTimer ) {
                splitterChangeTimer = setTimeout( function() {
                    splitterChangeTimer = null;
                    action.updateState();
                }, 100 );
            }
        } );

        /*
         * Developer Toolbar integration
         */
        apex.builder.nameBuilderWindow();

        $( SEL_TAB_CONTAINER )
            .tabs( {
                heightStyle: "fill",
                activate: function( event, ui ) {
                    var tabs$, tabsId, activeTab;

                    if ( ui.newPanel.is( ".resize" ) ) {
                        ui.newPanel.resize();
                    }

                    // Remember current tab in SESSION storage to restore it when navigating back to Page Designer.
                    // This is useful when someone navigates to Shared Components and then back to Page Designer.
                    tabs$ = ui.newTab.parents( ".ui-tabs" );
                    tabsId = tabs$.attr( "id" );
                    activeTab = tabs$.tabs( OPTION, ACTIVE );

                    sessionStorage.setItem( tabsId, activeTab );
                }
            } )
            .on ( "resize", function() {
                updateTabs();
            } );

        // Hack so that tab widget ignores space key when moving tabs
        $( ".ui-tabs" ).each( function() {
            var origHandlePageNav,
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
            var layout;

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
                if ( layout.indexOf( ":peAttributesTabPanel" ) < 0 || layout.indexOf( ":pePrintingTabPanel" ) < 0 ) {
                    layout = gTabsDefaultLayout;
                }

                loadTabsLayout( layout, true );
            } else {
                // must be in 3 column mode
                apexActions.disable( M_THREE_COLUMN );
            }
            // make sure internal structure (gTabsConfig) matches tabs as they are
            getTabsLayout();

            // restore active tabs from client storage
            $( SEL_TAB_CONTAINER )
                .each( function() {
                    var tabs$ = $( this ),
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

        function moveTab( event, ui ) {
            var panel$, prev$,
                tabsNav$ = $( event.target ),
                tabs$ = tabsNav$.closest( ".ui-tabs" );

            ui.item.removeClass( "ui-tabs-active ui-state-active ui-state-hover ui-state-focus" );
            if ( ui.sender ) {
                // need to move tab panel as well
                panel$ = $( "#" + ui.item.attr( A_ARIA_CONTROLS ) );
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
            var len, tabsNav$, tabs$, tab$, tabSetIndex, index, panel$, nextTabs$,
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
                    tabSetIndex = TAB_SETS.indexOf ( "#" + tabs$[0].id );
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
                            panel$ = $( "#" + tab$.attr( A_ARIA_CONTROLS ) );

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

        apex.theme.pageResizeInit();

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

        // Add tooltips for buttons with titles because many show keyboard shortcuts which keyboard users will
        // want to know about and without a mouse they don't get title tooltips
        $( ".a-ControlBar,.a-PageDesigner" ).tooltip( {
            item: "button[title]",
            show: apex.tooltipManager.defaultShowOption()
        } );

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

        // things to do after other parts of page designer have initialized
        setTimeout( function() {
            var i, labelPrefix,
                addBinding = function( n, s ) {
                    var b = {
                        name: n,
                        shortcut: s
                    };
                    return b;
                },
                bindings = [
                addBinding( "spotlight-search",  "Ctrl+Quote" ),
                addBinding( M_UNDO,              "Ctrl+Z" ),
                addBinding( M_REDO,              "Ctrl+Y" ),
                addBinding( M_SAVE_PAGE,         "Alt+F7" ),
                addBinding( M_SAVE_RUN_PAGE,     "Alt+F8" ),
                addBinding( M_EXPAND_RESTORE,    "Alt+F11" ),
                addBinding( M_GO_HELP,           "Alt+F1" ),
                addBinding( M_GO_RENDERING,      "Ctrl+/,R" ),
                addBinding( M_GO_DA,             "Ctrl+/,A" ),
                addBinding( M_GO_PROCESSING,     "Ctrl+/,P" ),
                addBinding( M_GO_SHARED,         "Ctrl+/,S" ),
                addBinding( M_GO_LAYOUT,         "Ctrl+/,L" ),
                addBinding( M_GO_PE_MAIN,        "Ctrl+/,E,M" ),
                addBinding( M_GO_PE_ATTRIBUTES,  "Ctrl+/,E,A" ),
                addBinding( M_GO_PE_PRINTING,    "Ctrl+/,E,P" ),
                addBinding( M_GO_G_REGIONS,      "Ctrl+/,G,R" ),
                addBinding( M_GO_G_ITEMS,        "Ctrl+/,G,I" ),
                addBinding( M_GO_G_BUTTONS,      "Ctrl+/,G,B" ),
                addBinding( M_GO_MESSAGES,       "Ctrl+/,M" ),
                addBinding( M_GO_SEARCH,         "Ctrl+/,F" ),
                addBinding( M_NEXT_PAGE,         "Alt+Shift+Page Down" ),
                addBinding( M_PREV_PAGE,         "Alt+Shift+Page Up" ),
                addBinding( M_SHOW_SHORTCUTS,    "Alt+Shift+F1" ),
                addBinding( "glv-disp-from-page",   "Ctrl+/,D,T" ),
                addBinding( "glv-disp-from-region", "Ctrl+/,D,H" ),
                addBinding( "glv-hide-empty",       "Ctrl+/,D,E" ),
                addBinding( M_ADVISOT,           "Ctrl+/,U,A" ),
                addBinding( M_CREATE_PAGE,       "Ctrl+/,C,P" ),
                addBinding( M_CREATE_COPY_PAGE,  "Ctrl+/,C,C" ),
                addBinding( M_CREATE_SHARED,     "Ctrl+/,C,S" ),
                addBinding( M_CREATE_BREADCRUMB, "Ctrl+/,C,B" )
                ];

            // configure shortcuts after all actions have been added

            [M_UNDO, M_REDO].forEach( function(el) {
                var a = apexActions.lookup( el );
                a.contextLabel = a.label;
            } );
            labelPrefix = $( "#menu-create" ).attr( A_LABEL );
            [M_CREATE_PAGE, M_CREATE_COPY_PAGE, M_CREATE_SHARED, M_CREATE_BREADCRUMB].forEach( function(el) {
                var a = apexActions.lookup( el );
                if ( a ) {
                    a.contextLabel = labelPrefix + ": " + a.label;
                }
            } );
            labelPrefix = $( "#menu-utilities" ).attr( A_LABEL );
            [M_ADVISOT].forEach( function(el) {
                var a = apexActions.lookup( el );
                a.contextLabel = labelPrefix + ": " + a.label;
            } );

            for ( i = 0; i < bindings.length; i++ ) {
                bindings[i].type = "global";
            }
            apexActions.setShortcutKeyBindings( bindings );
        }, 1 );

        // Initialize all the pdPropertyEditor widgets with their corresponding modes
        pe$.pdPropertyEditor( {
            mode: "main"
        } );

        peAttributes$.pdPropertyEditor( {
            mode: "attributes"
        } );

        pePrinting$.pdPropertyEditor( {
            mode: "printing"
        } );

    } );

    // register global JavaScript autocomplete based on "Function and Global Variable Declaration"
    $( () => {
        // register code:
        const registerGlobalCode = () => {
            const globalCodeId = "page-global";
            const prop = model.getComponents( model.COMP_TYPE.PAGE )[0].getProperty( model.PROP.JS_FUNCTION_AND_GLOBAL_VARIABLE_DECLARATION );

            // only register the code if this property exists (does not exist for example in global pages)
            if ( prop ) {
                const code = prop.getValue();
                // by using the same codeId, the code will get updated appropriately
                $.apex.codeEditor.registerJavaScriptContextCode( globalCodeId, code, $.apex.codeEditor.LANG_JAVASCRIPT );
            }
        };

        // on attribute change
        model.observer( "codeEditorIntellisense", {
            components: [{
                typeId: model.COMP_TYPE.PAGE
            }],
            properties: [
                pe.PROP.JS_FUNCTION_AND_GLOBAL_VARIABLE_DECLARATION
            ],
            events: [
                "change"
            ]
        }, registerGlobalCode );

        // on load and on page change
        $( document ).on( "modelReady", registerGlobalCode );
    } );

} )( pe, apex.jQuery, apex.util, apex.lang, apex.navigation, window.pageDesigner, apex.server, apex.storage,
    apex.actions, apex.item, apex.commandHistory, apex.env );
