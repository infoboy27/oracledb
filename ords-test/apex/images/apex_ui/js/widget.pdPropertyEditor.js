/*!
 * Copyright (c) 2020, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This module is part of the page designer and contains the controller logic for the Property Editor.
 **/

/**
 * TODO
 *
 * Rework code to use apex.message.confirm as opposed to confirm
 */

/* global gApexVersion */

(function( model, $, debug, lang, util, pd, nav, server, templateOptionsHelper, env ) {
    "use strict";

    const hasOwnProperty = util.hasOwnProperty,
          EVENT_CHANGE = "change",
          EVENT_CLICK = "click";

    // General globals
    var gIconFont$;

    // General constants
    const
        PE_WIDGET_NAME = "property_editor",
        MODE_MAIN = "main",
        MODE_ATTRIBUTES = "attributes",
        MODE_PRINTING = "printing",
        TAB_NAME_PE_COMP = "peComponentProperties",
        TAB_NAME_PE_ATTR = "peAttributesTabPanel",
        TAB_NAME_PE_PRINTING = "pePrintingTabPanel",
        ATTR_SCOPE = "scope",
        SCOPE_COL = "col",
        ATTR_ROLE = "role",
        ROLE_GROUP = "group",
        ARIA_HIDDEN = "aria-hidden",
        ARIA_LABELLEDBY = "aria-labelledby",
        ARIA_DESCRIBEDBY = "aria-describedby",
        ARIA_HASPOPUP = "aria-haspopup",
        ARIA_LEVEL = "aria-level",
        ARIA_ROLEDESCRIPTION = "aria-roledescription";

    // List of Standard APEX hash substitutions
    const APEX_VALID_HASH_SUBSTITUTIONS = [
        "FLOW_SESSION",
        "FLOW_ID",
        "APP_SESSION",
        "APP_ID",
        "ROWNUM"
    ];
    // List of components using hash substitutions
    const HASH_SYNTAX_COMP_TYPES = [
        model.COMP_TYPE.IR_ATTRIBUTES,
        model.COMP_TYPE.IR_COLUMN,
        model.COMP_TYPE.IR_COLUMN_ACTION,
        model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY,
        model.COMP_TYPE.CLASSIC_RPT_COLUMN,
        model.COMP_TYPE.TAB_FORM_COLUMN
    ];

    // CSS class constants
    var PROPERTY =                                    "a-Property",
        PROPERTY_FIELD =                              PROPERTY + "-field",
        PROPERTY_FIELD_TEXT =                         PROPERTY_FIELD + "--text",
        PROPERTY_FIELD_CONTAINER =                    PROPERTY + "-fieldContainer",
        PROPERTY_SET_ITEMS_HEADER_HEADER =            PROPERTY + "-setItemsHeader-header",
        PROPERTY_SET_ITEMS_TABLE =                    PROPERTY + "-setItemsTable",
        PROPERTY_SET_ITEMS_TABLE_REMOVE_COL =         PROPERTY_SET_ITEMS_TABLE + "-removeCol",
        PROPERTY_STATIC_LOV_VALUES_HEADER_HEADER =    PROPERTY + "-setItemsHeader-header",
        PROPERTY_STATIC_LOV_VALUES_TABLE =            PROPERTY + "-setItemsTable",
        PROPERTY_STATIC_LOV_VALUES_TABLE_REMOVE_COL = PROPERTY_STATIC_LOV_VALUES_TABLE + "-removeCol",
        PROPERTY_EDITOR_MESSAGETEXT =                 "a-PropertyEditor-messageText",
        BUTTON =                                      "a-Button",
        BUTTON_PROPERTY =                             "a-Property-button",
        BUTTON_HOT =                                  BUTTON + "--hot",
        BUTTON_FORCE_WRAP =                           BUTTON + "--forceWrap",
        LINK_DIALOG_ITEM_NAME =                       "linkDlgItemName",
        LINK_DIALOG_ITEM_VALUE =                      "linkDlgItemValue",
        LINK_DIALOG_SET_ITEMS_ROW_DATA =              "linkDlgSetItemsRowData",
        STATIC_LOV_VALUE_DISPLAY =                    "linkDlgItemName",
        STATIC_LOV_VALUE_RETURN =                     "linkDlgItemValue",
        STATIC_LOV_VALUES_ROW_DATA =                  "linkDlgSetItemsRowData",
        ORDERBY_DIALOG_CLAUSE_KEY =                   "orderByDlgClauseKey",
        ORDERBY_DIALOG_CLAUSE_DISPLAY =               "orderByDlgClauseDisplay",
        ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV =       "orderByDlgClauseColsStaticLov",
        ORDERBY_DIALOG_CLAUSE_EXPR =                  "orderByDlgClauseExpr",
        ORDERBY_DIALOG_TABLE_EXPR_WIDTH =             "50%",
        ORDERBY_DIALOG_TABLE_KEY_WIDTH =              "15%",
        ORDERBY_DIALOG_TABLE_DISP_WIDTH =             "25%",
        ORDERBY_DIALOG_TABLE_KEYDISP_WIDTH =          "40%",
        // icons
        ICON =                                        "a-Icon",
        ICON_REMOVE =                                 ICON + " icon-remove",
        ICON_MOVE_UP =                                ICON + " icon-shuttle-up",
        ICON_MOVE_DOWN =                              ICON + " icon-shuttle-down",
        ICON_LOV =                                    ICON + " icon-popup-lov",
        ICON_GO_TO_COMPONENT =                        ICON + " icon-go-to-component",
        ICON_EDIT_DIALOG =                            ICON + " icon-open-in-dialog",
        // utility classes
        VISUALLY_HIDDEN =                             "u-vh",
        DIALOG_FLUSH_BODY =                           "ui-dialog-flushBody",
        IS_CHANGED =                                  "is-changed";

    // Property type constants
    var PROP_TYPE = {
        // xxx APEX specific many are based on the above basic ones with perhaps some extra validation
        // consider separating validation from rendering
        CSS: "CSS",
        JAVASCRIPT: "JAVASCRIPT",
        HTML: "HTML",
        COMPONENT: "COMPONENT",
        LINK: "LINK",
        ITEM: "ITEM",
        FACET: "FACET",
        PAGE: "PAGE",
        CODE_LANGUAGE:            "CODE LANGUAGE",
        MLE_JS:                   "MLE JAVASCRIPT",
        MLE_JS_EXPR_VARCHAR:      "MLE JAVASCRIPT EXPRESSION VARCHAR2",
        MLE_JS_EXPR_BOOLEAN:      "MLE JAVASCRIPT EXPRESSION BOOLEAN",
        MLE_JS_EXPR_CUSTOM:       "MLE JAVASCRIPT EXPRESSION CUSTOM",
        MLE_JS_FUNC_VARCHAR:      "MLE JAVASCRIPT FUNCTION BODY VARCHAR2",
        MLE_JS_FUNC_CLOB:         "MLE JAVASCRIPT FUNCTION BODY CLOB",
        MLE_JS_FUNC_BOOLEAN:      "MLE JAVASCRIPT FUNCTION BODY BOOLEAN",
        MLE_JS_FUNC_CUSTOM:       "MLE JAVASCRIPT FUNCTION BODY CUSTOM",
        MLE_JS_FUNC_SQL:          "MLE JAVASCRIPT FUNCTION BODY SQL",
        PLSQL:                    "PLSQL",
        PLSQL_EXPR_VARCHAR:       "PLSQL EXPRESSION VARCHAR2",
        PLSQL_EXPR_BOOLEAN:       "PLSQL EXPRESSION BOOLEAN",
        PLSQL_EXPR_CUSTOM:        "PLSQL EXPRESSION CUSTOM",
        PLSQL_FUNC_VARCHAR:       "PLSQL FUNCTION BODY VARCHAR2",
        PLSQL_FUNC_CLOB:          "PLSQL FUNCTION BODY CLOB",
        PLSQL_FUNC_BOOLEAN:       "PLSQL FUNCTION BODY BOOLEAN",
        PLSQL_FUNC_CUSTOM:        "PLSQL FUNCTION BODY CUSTOM",
        PLSQL_FUNC_SQL:           "PLSQL FUNCTION BODY SQL",
        SQL:                      "SQL",
        SQL_EXPR:                 "SQL EXPRESSION",
        SQL_EXPR_BOOLEAN:         "SQL EXPRESSION BOOLEAN",
        SQL_EXPR_CUSTOM:          "SQL EXPRESSION CUSTOM",
        SUBSCRIPTION:             "SUBSCRIPTION",
        SUPPORTED_UI:             "SUPPORTED UI",
        OWNER:                    "OWNER",
        TABLE:                    "TABLE",
        GRAPH:                    "GRAPH",
        REST_SOURCE_ID:           "REST SOURCE ID",
        REST_OPERATION_ID:        "REST OPERATION ID",
        COLUMN:                   "COLUMN",
        REGION_COLUMN:            "REGION COLUMN",
        WHERE_CLAUSE:             "WHERE CLAUSE",
        ORDER_BY_CLAUSE:          "ORDER BY CLAUSE",
        ICON:                     "ICON",
        LINK_SET_ITEMS:           "LINK SET ITEMS",
        TEXT_EDITOR:              "TEXT EDITOR",
        FILE_URLS_JAVASCRIPT:     "FILE URLS JAVASCRIPT",
        FILE_URLS_CSS:            "FILE URLS CSS",
        PLACEHOLDER_JSON:         "PLACEHOLDER JSON",
        PLACEHOLDER_JSON_ITEMS:   "PLACEHOLDER JSON ITEMS",
        ORDER_BY_ITEM:            "ORDER BY ITEM",
        ORDER_BY_ITEM_EXPRS:      "ORDER BY ITEM EXPRESSIONS",
        HIDDEN:                   "HIDDEN",
        XML:                      "XML",
        TEMPLATE_OPTIONS:         "TEMPLATE OPTIONS",
        TEMPLATE_OPTIONS_GENERAL: "TEMPLATE OPTIONS GENERAL",
        STATIC_LOV:               "STATIC LOV",
        STATIC_LOV_VALUES:        "STATIC LOV VALUES",
        PLSQL_PACKAGE:            "PLSQL PACKAGE",
        PLSQL_METHOD:             "PLSQL METHOD",
        MEDIA:                    "MEDIA",
        SESSION_STATE_VALUE:      "SESSION STATE VALUE",
        // also need constants for base widget property types where they are excluded from multi-edit
        CHECKBOXES:               "CHECKBOXES",
        POPUP_LOV:                "POPUP LOV",
        RADIOS:                   "RADIOS",
        // and constants for base widget property types that need to be checked for possible different lov values in multi-edit
        SELECT_LIST:              "SELECT LIST",
        SWITCH_BUTTON:            "SWITCH BUTTON"
    };
    var TYPES_EXCLUDED_FROM_MULTI_EDIT = [
        // PROP_TYPE.CHECKBOXES,
        // PROP_TYPE.COLUMN,
        PROP_TYPE.HIDDEN,
        PROP_TYPE.HTML,
        PROP_TYPE.LINK,
        PROP_TYPE.STATIC_LOV,
        PROP_TYPE.OWNER,
        // PROP_TYPE.REGION_COLUMN,
        PROP_TYPE.POPUP_LOV,
        PROP_TYPE.RADIOS,
        PROP_TYPE.TABLE,
        PROP_TYPE.GRAPH,
        PROP_TYPE.PLSQL_PACKAGE,
        PROP_TYPE.PLSQL_METHOD,
        PROP_TYPE.REST_SOURCE_ID,
        PROP_TYPE.REST_OPERATION_ID
        // PROP_TYPE.TEMPLATE_OPTIONS,
        // PROP_TYPE.TEMPLATE_OPTIONS_GENERAL
    ];

    var DATA_PROPERTY_ID = "data-property-id";

    // Specific constants used by property types
    var LINK = {
            PROP:  {
                TYPE:               "linkType",
                APPLICATION:        "linkApp",
                PAGE:               "linkPage",
                URL:                "linkUrl",
                SET_ITEMS:          "linkSetItems",
                CLEAR_CACHE:        "linkClearCache",
                CLEAR_ACTION:       "linkClearAction",
                RESET_PAGE_REGIONS: "linkResetPageRegion",
                RESET_PAGINATION:   "linkResetPagination",
                REQUEST:            "linkRequest",
                ANCHOR:             "linkAnchor",
                SUCCESS_MESSAGE:    "linkSuccessMessage"
            },
            DISPLAY_GROUP: {
                TARGET:             "TARGET",
                SET_ITEMS:          "SET_ITEMS",
                CLEAR_SESSION:      "CLEAR_SESSION_STATE",
                ADVANCED:           "ADVANCED"
            },
            TYPES: {
                PAGE_IN_THIS_APP:   "PAGE_IN_THIS_APP",
                PAGE_IN_DIFF_APP:   "PAGE_IN_DIFF_APP",
                URL:                "URL"
            }
        },
        STATIC_LOV = {
            PROP:  {
                VALUES: "staticLovValues",
                SORT:   "staticLovSort"
            },
            GROUP: {
                VALUES: "VALUES"
            }
        };

    var PLACEHOLDER = {
            PROP:  {
                SET_ITEMS:          "placeholderSetItems"
            },
            DISPLAY_GROUP: {
                ASSIGN_ITEMS:       "ASSIGN_ITEMS"
            }
        };
    var ORDER_BY_ITEM = {
            PROP:  {
                ORDER_BY_EXPRS:     "orderByExpressions",
                ORDER_BY_ITEM:      "orderByItem"
            },
            DISPLAY_GROUP: {
                EXPRESSIONS:        "EXPRESSIONS",
                ITEM:               "ITEM"
            }
        };
    var MEDIA = {
            PROP: {
                SOURCE:                 "source",
                URL:                    "url",
                BLOB_COLUMN:            "blobColumn",
                FILENAME_COLUMN:        "filenameColumn",
                MIME_TYPE_COLUMN:       "mimeTypeColumn",
                LAST_UPDATED_COLUMN:    "lastUpdatedColumn",
                URL_COLUMN:             "urlColumn"
            },
            DISPLAY_GROUP: {
                MEDIA:          "MEDIA"
            },
            SOURCES: {
                URL:            "URL",
                BLOB_COLUMN:    "BLOB_COLUMN",
                URL_COLUMN:     "URL_COLUMN"
            }
        };

    // Values used by the item-picker dialog to differentiate context
    const WF_PARAMS = "wf_params",
        VS_VARS = "vs_vars",
        ACT_VARS = "act_vars";

    var PREF_CODE_EDITOR_DLG_W  = "PE_CODE_EDITOR_DLG_W",
        PREF_CODE_EDITOR_DLG_H  = "PE_CODE_EDITOR_DLG_H",
        PREF_ENABLE_TOOLTIPS    = "ENABLE_TOOLTIPS"; // keep in sync with property name in f4000_p4500.js


    var gCurrentCollapsedGroups = {}; //todo do we still need this with removal of expand / collapse buttons

    // returns the first parent component of the specified type ( typeId ) of the provided component ( start )
    function getParentOfType( start, typeId ) {
        let component = start;
        while ( component && component.typeId !== typeId ) {
            component = component.getParent();
        }
        return component;
    }

    function msg( pKey ) {
        return lang.getMessage( "PD.PE." + pKey );
    }

    function format( pKey ) {
        var pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ));
        return lang.format.apply( this, args );
    }

    function formatNoEscape( pKey ) {
        var pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ));
        return lang.formatNoEscape.apply( this, args );
    }

    function getStaticLovObject( pLovValues ) {

        var SEP_REGEXP =    /^STATIC([2])?(\(([^,]+),([^,]+)\))?:/,
            STATIC_REGEXP = /^STATIC[2]?(\([^,]+,[^,]+\))?:/,
            SORT = "2",
            ROW_SEP = ",",
            DISP_RETURN_SEP = ";";

        var match      = SEP_REGEXP.exec( pLovValues ),
            isSorted   = ( match[ 1 ] === SORT ? "N" : "Y" ),
            rowSep     = match[ 3 ] || ROW_SEP,
            dispRetSep = match[ 4 ] || DISP_RETURN_SEP,
            lovValues  = pLovValues.replace( STATIC_REGEXP, "" ).split( rowSep ),
            lovValue,
            lov = {
                sort:   isSorted,
                values: []
            };

        for ( var i = 0; i < lovValues.length; i++ ) {
            lovValue = lovValues[ i ].split( dispRetSep );
            lov.values.push({
                displayValue: lovValue[ 0 ],
                returnValue:  ( lovValue[ 1 ] ? lovValue[ 1 ] : "" ),
            });
        }

        return lov;
    }

    function getStaticLovString( pSort, pLovValues ) {
        var lValue,
            lRowSep     = ",",
            lDispRetSep = ";",
            i;

        lValue = "STATIC";
        if ( pSort === "N" ) {
            lValue += "2";
        }

        if ( pLovValues.length > 0 ) {
            for ( i = 0; i < pLovValues.length; i++ ) {
                if ( ( pLovValues[ i ].displayValue || pLovValues[ i ].returnValue ).search( /(,|;)/ ) !== -1 ) {
                    lRowSep = "\u0001";
                    lDispRetSep = "\u0002";
                    lValue += "(" + lRowSep + "," + lDispRetSep + ")";
                    break;
                }
            }
            lValue += ":";

            for ( i = 0; i < pLovValues.length; i++ ) {
                lValue += ( i > 0 ? lRowSep : "" );
                if ( pLovValues[ i ].displayValue !== "" && pLovValues[ i ].returnValue !== "" ) {
                    lValue += pLovValues[ i ].displayValue + lDispRetSep + pLovValues[ i ].returnValue;
                } else if ( pLovValues[ i ].displayValue === "" && pLovValues[ i ].returnValue !== "" ) {
                    lValue += "" + lDispRetSep + pLovValues[ i ].returnValue;
                } else {
                    lValue += pLovValues[ i ].displayValue || pLovValues[ i ].returnValue;
                }
            }
        }
        return lValue;
    }

    function renderPropertyButton( pOut, pId, pProp, pText, pValue, pIsDisabled ) {
        const
            lLabelId = pId + "_label",
            lDescriptionId = pId + "_descr",
            lValue = pValue ? pValue : pProp.value;

        pOut.markup( "<span class='u-vh'" )
            .attr( "id", lDescriptionId )
            .attr( ARIA_HIDDEN, "true" )
            .markup( ">" )
            .content( pText )
            .markup( "</span><button" )
            .attr( "type", "button" )
            .attr( "id", pId )
            .attr( ARIA_LABELLEDBY, lLabelId )
            .attr( ARIA_DESCRIBEDBY, lDescriptionId )
            .attr( ARIA_HASPOPUP, "dialog" )
            .attr( "class", BUTTON + " " + BUTTON_PROPERTY + " " + BUTTON_FORCE_WRAP )
            .attr( DATA_PROPERTY_ID, pProp.propertyName )
            .attr( "value", lValue )
            .optionalAttr( "disabled", pIsDisabled )
            .markup( ">" )
            .content( pText )
            .markup( "</button>" );
    }

    /*
     * Start of pdPropertyEditor widget
     */
    $.widget( "apex.pdPropertyEditor", {
        widgetEventPrefix:  "pdpropertyeditor",
        widgetName:         "",
        lastComponents:     null,
        // Default options
        options: {
            mode: ""                    // 'main', 'attributes', or 'printing', others?
        },

        /*
         * Lifecycle methods
         */
        _create: function () {
            var self = this,
                o = this.options;

            /*
             * Controller specific APEX property types
             *
             * TODO: The declaration of custom property types should be *taken out* of the
             *  widget's _create handler, as they should only ever be registered once!
             *  This means they will need a better way to reference the parent Property Editor if need be.
             */
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SUPPORTED_UI, {
                init: function( pElement$, prop /*, lastComponents */ ) {

                    const NOT_CURRENT_VALUE = ":not([value='" + util.escapeCSS( pElement$.val()) + "'])"; // xxx try to avoid escapeCSS
                    const hasUnsupportedOptions = pElement$.find( "[data-is-supported=false]").length > 0;

                    // call base select init
                    this.super( "init", pElement$, prop );

                    let savedOptions = pElement$.html();

                    // Hide all unsupported and legacy components, but not if it's the current selection
                    // Note: We have to keep this code as long as we do have apps including the jQueryMobile UI
                    pElement$.find( "[data-is-supported=false],[data-is-legacy=true]").filter( NOT_CURRENT_VALUE ).remove();

                    // Hide optgroups if there are no options in the optgroup
                    pElement$.find( "optgroup" ).each( function() {
                        if ( $( this ).find( "option" ).length === 0 ) {
                            $( this ).remove();
                        }
                    });

                    if ( hasUnsupportedOptions ) {
                        // Append the "Show Unsupported" option
                        pElement$.append(
                            $( "<option>" )
                                .attr( "value", "$UNSUPPORTED$" )
                                .text( msg( "SHOW_UNSUPPORTED" ) )
                        );
                    } else {
                        // Append the "Show Legacy" option if there are only legacy options
                        pElement$.append(
                            $( "<option>" )
                                .attr( "value", "$LEGACY$" )
                                .text( msg( "SHOW_LEGACY" ) )
                        );
                    }

                    // Register a change event to show legacy components if the user wants to see them
                    pElement$.on( EVENT_CHANGE, function() {
                        if ( [ "$LEGACY$", "$UNSUPPORTED$" ].includes( pElement$.val() ) ) {
                            // Restore the original options and show legacy components
                            pElement$
                                .empty()
                                .append( savedOptions );
                        }
                    });
                }
            }, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.COMPONENT, {

                render: function( out, id, prop, lastComponents ) {

                    // Shared Components which are displayed in the "Page Shared Components" tree
                    var SHARED_COMPONENT_TYPES = [
                        model.COMP_TYPE.LOV,
                        model.COMP_TYPE.LIST,
                        model.COMP_TYPE.BREADCRUMB,
                        model.COMP_TYPE.SEARCH_CONFIG,
                        model.COMP_TYPE.PAGE_TEMPLATE,
                        model.COMP_TYPE.FIELD_TEMPLATE,
                        model.COMP_TYPE.BUTTON_TEMPLATE,
                        model.COMP_TYPE.REGION_TEMPLATE,
                        model.COMP_TYPE.LIST_TEMPLATE,
                        model.COMP_TYPE.BREADCRUMB_TEMPLATE,
                        model.COMP_TYPE.CALENDAR_TEMPLATE,
                        model.COMP_TYPE.REPORT_TEMPLATE,
                        model.COMP_TYPE.AUTHORIZATION,
                        model.COMP_TYPE.BUILD_OPTION,
                        model.COMP_TYPE.AI_CONFIG,
                        model.COMP_TYPE.DATA_LOAD_TABLE,
                        model.COMP_TYPE.DATA_LOAD_DEF,
                        model.COMP_TYPE.WS_REF,
                        model.COMP_TYPE.REPORT_QUERY,
                        model.COMP_TYPE.EMAIL_TEMPLATE ];

                    var lComponentType = model.getComponentType( prop.metaData.lovComponentTypeId ),
                        lButton;

                    // If the component is visible in Page Designer then add the "Go to xxx" button
                    if ( lComponentType.isPageComponent || $.inArray( prop.metaData.lovComponentTypeId, SHARED_COMPONENT_TYPES ) !== -1 ) {
                        lButton = {
                            icon: ICON_GO_TO_COMPONENT,
                            text: formatNoEscape( "GO_TO_COMPONENT", lComponentType.title.singular )
                        };
                    }

                    this.super( "render", out, id, prop, lastComponents, lButton );
                },

                init: function( pElement$, prop, lastComponents ) {

                    var lButton$ = $( "#" + pElement$.attr( "id" ) + "_btn" );

                    function _setButtonState() {

                        // Disable the button if we don't have a value or it's not a numeric component id
                        // For example some authorization schemes are hardcoded and no real components
                        if ( pElement$.val() !== "" && /^[-!]?[0-9]*$/.test( pElement$.val() )) {
                            lButton$.attr( "disabled", false );
                        } else {
                            lButton$.attr( "disabled", true );
                        }

                    } // _setButtonState


                    this.super( "init", pElement$, prop, lastComponents );

                    if ( lButton$.length > 0 ) {

                        // Register a change event to enable/disable the button
                        pElement$.on( EVENT_CHANGE, _setButtonState );
                        _setButtonState();

                        lButton$.on( EVENT_CLICK, function() {

                            var lComponentId = prop.value,
                                lComponent;

                            if ( lComponentId !== "" ) {

                                // Build Options and Authorization use ! or - to negate it, we have to remove that prefix
                                if (  ( prop.metaData.lovComponentTypeId === model.COMP_TYPE.BUILD_OPTION || prop.metaData.lovComponentTypeId === model.COMP_TYPE.AUTHORIZATION )
                                    && /^[-!]/.test( lComponentId ))
                                {
                                    lComponentId = lComponentId.substr( 1 );
                                }

                                lComponent = model.getComponents( prop.metaData.lovComponentTypeId, { id: lComponentId })[ 0 ];
                                pd.goToComponent( lComponent.typeId, lComponent.id );
                            }

                        });

                    }

                }

            }, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SWITCH_BUTTON, {
                render: function( out, id, prop /* , lastComponents */ ) {
                    let self = this;
                    let content = prop.value === "DEVELOPMENT" ? lang.getMessage( "PD.WF.ACTIVATE" ) : prop.value === "ACTIVE" ? lang.getMessage( "PD.WF.DEACTIVATE" ) : "";

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );

                    this.renderBaseInput( out, {
                        id,
                        type: "text",
                        readonly: true, // not readOnly(!)
                        inputClass: "a-Property-field",
                        attributes: this.commonAttributes( prop ),
                        value: self.getDisplayValue( prop )
                    } );

                    this.renderDivClose( out );

                    if ( prop.value !== "INACTIVE" ) {
                        this.renderDivOpen( out, {
                            "class": "a-Property-buttonContainer"
                        });

                        out.markup( "<button" )
                        .attr( "type", "button" )
                        .attr( "id", id + "_btn" )
                        .attr( "class", "a-Button a-Button--small" )
                        .markup( ">" )
                        .content( content )
                        .markup( "</button>");

                        this.renderDivClose( out );
                    }
                },
                getDisplayValue: function( prop ) {
                    let lLovValues, lReadOnlyDisplayValue;

                    if ( prop.value !== "" ) {
                        lLovValues = prop.metaData.lovValues;
                        if ( typeof lLovValues === "function" ) {
                            lLovValues = lLovValues();
                        }
                        if ( lLovValues ) {
                            for ( let i = 0; i < lLovValues.length; i++ ) {
                                if ( lLovValues[ i ].r === prop.value ) {
                                    lReadOnlyDisplayValue = lLovValues[ i ].d;
                                    break;
                                }
                            }
                        }
                    } else {
                        lReadOnlyDisplayValue = prop.value;
                    }
                    return lReadOnlyDisplayValue;
                },
                setValue: function( pElement$, prop, pValue ) {
                    let lov = prop.metaData.lovValues();
                    let lButton$ = $( "#" + util.escapeCSS( pElement$.attr( "id" ) ) + "_btn" );
                    let value = lov.filter( v => v.r === pValue )[0]?.d;
                    if ( value ) {
                        this.super( "setValue", pElement$, prop, value );
                        this.updateButton( pValue, lButton$ );
                    }
                },
                getValue: function( pElement$, pProperty ) {
                    let elValue = $( "input", pElement$ ).val();
                    return pProperty.metaData.lovValues().filter( val => val.d === elValue )[ 0 ].r;
                },
                init: function( pElement$, prop, lastComponents ) {
                    this.super( "init", pElement$, prop, lastComponents );
                    let self = this, lButton$ = $( "#" + util.escapeCSS( pElement$.attr( "id" ) ) + "_btn" );
                    if ( lButton$.length > 0 ) {
                        let component = lastComponents[ 0 ];
                        lButton$.on( EVENT_CLICK, function() {
                            let value = prop.value === "DEVELOPMENT" ? "ACTIVE" : "INACTIVE";
                            pd.validateVersionStateChange( component, value, function() {
                                self.setValue( pElement$, prop, value );
                                pElement$.trigger( "change" );
                            } );
                        } );
                    }
                },
                updateButton: function( value, button$ ) {
                    switch ( value ){
                        case "ACTIVE":
                            button$.text( lang.getMessage( "PD.WF.DEACTIVATE" ) );
                            button$.show();
                            break;
                        case "DEVELOPMENT":
                            button$.text( lang.getMessage( "PD.WF.ACTIVATE" ) );
                            button$.show();
                            break;
                        case "INACTIVE":
                            button$.hide();
                    }
                },
                destroy: function( pElement$, prop ) {
                    this.super( "destroy", pElement$, prop );
                }
            } );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SUBSCRIPTION, {
                render: function( out, id, prop /* , lastComponents */ ) {
                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    if (prop.value) {
                        renderPropertyButton( out, id, prop, lang.getMessage( "PD.UNSUBSCRIBE" ) );
                    } else {
                        renderPropertyButton( out, id, prop, lang.getMessage( "PD.NOT_SUBSCRIBED" ), prop.value, true );
                    }
                    this.renderDivClose( out );
                },
                init: function( pElement$, prop, lastComponents ) {
                    this.super( "init", pElement$, prop, lastComponents );

                    let self = this, lButton$ = self.getButton( pElement$ );
                    if ( lButton$.length > 0 ) {
                        lButton$.on( EVENT_CLICK, function() {
                            pd.openUnsubscribeDialog();
                        } );
                    }
                },
                getButton: function(pElement$) {
                    return $( "#" + util.escapeCSS( pElement$.attr( "id" ) ) );
                },
                destroy: function( pElement$, prop ) {
                    this.super( "destroy", pElement$, prop );
                }
            } );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.LINK, {

                /* Internal helper functions */
                _getButtonText: function( pUrl, pComponent ) {
                    var lLinkObject,
                        lButtonText = msg( "LINK.NO_LINK_DEFINED" );
                    const lValidHashSubstitutions = [];

                    if ( pUrl ) {
                        // if multi-edit, check if values vary, if so, return empty string
                        if ( pUrl !== self.element.propertyEditor( "getValueVariesConstant" ) ) {
                            if ( pComponent && HASH_SYNTAX_COMP_TYPES.includes( pComponent.typeId ) ) {
                                lValidHashSubstitutions.push(...APEX_VALID_HASH_SUBSTITUTIONS);
                            }
                            lLinkObject = pd.splitApexUrl( pUrl, null, lValidHashSubstitutions);
                            lButtonText = lLinkObject.display;
                        } else {
                            lButtonText = "";
                        }
                    }
                    return lButtonText;
                },

                /* Internal functions, storing the widget's metadata */
                _getDisplayGroupTarget: function ( pProperties ) {
                    return {
                        displayGroupId:     LINK.DISPLAY_GROUP.TARGET,
                        displayGroupTitle:  msg( "LINK.DG.TARGET" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getDisplayGroupSetItems: function ( pProperties ) {
                    return {
                        displayGroupId:     LINK.DISPLAY_GROUP.SET_ITEMS,
                        displayGroupTitle:  msg( "LINK.DG.SET_ITEMS" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getDisplayGroupClearSessionState: function ( pProperties ) {
                    return {
                        displayGroupId:     LINK.DISPLAY_GROUP.CLEAR_SESSION,
                        displayGroupTitle:  msg( "LINK.DG.CLEAR_SESSION" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getDisplayGroupAdvanced: function ( pProperties ) {
                    var i, lCollapsed = true;

                    if ( pProperties ) {

                        // Expand display group if any of the properties have a value
                        for ( i = 0; i < pProperties.length; i++ ) {
                            if ( pProperties[ i ].value ) {
                                lCollapsed = false;
                                break;
                            }
                        }
                    }

                    return {
                        displayGroupId:     LINK.DISPLAY_GROUP.ADVANCED,
                        displayGroupTitle:  msg( "LINK.DG.ADVANCED" ),
                        collapsed:          lCollapsed,
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getPropertyLinkType: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.TYPE,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                            prompt:         msg( "TYPE" ),
                            isRequired:     true,
                            lovValues: [
                                { d: msg( "LINK.TYPE.PAGE_IN_THIS_APP" ),   r: LINK.TYPES.PAGE_IN_THIS_APP },
                                { d: msg( "LINK.TYPE.PAGE_IN_DIFF_APP" ),   r: LINK.TYPES.PAGE_IN_DIFF_APP },
                                { d: msg( "LINK.URL" ),                     r: LINK.TYPES.URL     }
                            ],
                            displayGroupId: LINK.DISPLAY_GROUP.TARGET
                        },
                        errors:             [], // array of strings xxx so far we only care about the count > 0
                        warnings:           []  // array of strings xxx so far we only care about the count > 0
                    }, pProperty );

                },
                _getPropertyLinkApp: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.APPLICATION,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.TEXT,
                            prompt:         msg( "APPLICATION" ),
                            isRequired:     true,
                            displayGroupId: LINK.DISPLAY_GROUP.TARGET
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkPage: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.PAGE,
                        value:              "",
                        metaData: {
                            type:           PROP_TYPE.PAGE,
                            prompt:         msg( "LINK.PAGE" ),
                            isRequired:     true,
                            displayGroupId: LINK.DISPLAY_GROUP.TARGET
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkUrl: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.URL,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.TEXT,
                            prompt:         msg( "LINK.URL" ),
                            isRequired:     true,
                            displayGroupId: LINK.DISPLAY_GROUP.TARGET
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkSetItems: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           LINK.PROP.SET_ITEMS,
                        value:                  { names: [], values: [] },
                        metaData: {
                            type:               PROP_TYPE.LINK_SET_ITEMS,
                            prompt:             msg( "LINK.DG.SET_ITEMS" ),
                            displayGroupId:     LINK.DISPLAY_GROUP.SET_ITEMS,
                            originalProperty:   pOriginalProperty
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },
                _getPropertyLinkClearCache: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:               LINK.PROP.CLEAR_CACHE,
                        value:                      "",
                        metaData: {
                            prompt:                 msg( "LINK.CLEAR_CACHE" ),
                            type:                   PROP_TYPE.PAGE,
                            multiValueDelimiter:    ",",
                            displayGroupId:         LINK.DISPLAY_GROUP.CLEAR_SESSION
                        },
                        errors:                     [],
                        warnings:                   []
                    }, pProperty );
                },
                _getPropertyLinkClearAction: function( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.CLEAR_ACTION,
                        value:              "Y",
                        metaData: {
                            prompt:         msg( "LINK.CLEAR_ACTION"),
                            type:           $.apex.propertyEditor.PROP_TYPE.PILL_BUTTONS,
                            lovValues: [
                                {
                                    d: msg( "LINK.CLEAR_ACTION.NONE" ),
                                    r: "NONE"
                                },
                                {
                                    d: msg( "LINK.CLEAR_ACTION.CLEAR_REGIONS" ),
                                    r: "CR"
                                },
                                {
                                    d: msg( "LINK.CLEAR_ACTION.RESET_REGIONS" ),
                                    r: "RR"
                                },
                                {
                                    d: msg( "LINK.CLEAR_ACTION.RESET_PAGINATION" ),
                                    r: "RP"
                                }
                            ],
                            displayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION,
                            isRequired:     true
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkRequest: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.REQUEST,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.TEXT,
                            prompt:         msg( "LINK.REQUEST" ),
                            displayGroupId: LINK.DISPLAY_GROUP.ADVANCED
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkAnchor: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.ANCHOR,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.TEXT,
                            prompt:         msg( "LINK.ANCHOR" ),
                            displayGroupId: LINK.DISPLAY_GROUP.ADVANCED
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyLinkSuccessMessage: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       LINK.PROP.SUCCESS_MESSAGE,
                        value:              "Y",
                        metaData: {
                            prompt:         msg( "LINK.SUCCESS_MESSAGE" ),
                            type:           $.apex.propertyEditor.PROP_TYPE.YES_NO,
                            noValue:        "N",
                            yesValue:       "Y",
                            displayGroupId: LINK.DISPLAY_GROUP.ADVANCED,
                            isRequired:     true
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },

                /* Property type properties and callbacks */
                noLabel: true,
                render: function( out, id, prop , lastComponents ) {

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, this._getButtonText( prop.value, lastComponents[0] ) );
                    this.renderDivClose( out );
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    const lDisplayValue = this._getButtonText( pValue, lastComponents ? lastComponents[0] : undefined );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop, lastComponents ) {
                    const lValidHashSubstitutions = [];
                    var i,
                        LAST_COMPONENT_COLUMNS,
                        LAST_COMPONENT_COLUMN_NAMES = [],
                        that = this,
                        lComponent = lastComponents[ 0 ],
                        LAST_COMPONENT_TYPE_ID = model.getComponentType( lastComponents[ 0 ].typeId ).id;

                    this.addLabelClickHandler( pElement$, prop );
                    this.addTooltipsForErrors( pElement$, prop );

                    // For component types that use # substitution syntax, we need to get the column list to pass to
                    // the URL splitting logic, such that it can determine what are valid substitutions, if the component
                    // uses APEX standard # substitution strings we add them to the list of valid substitutions too
                    if ( HASH_SYNTAX_COMP_TYPES.includes( LAST_COMPONENT_TYPE_ID ) ) {

                        // Get column definitions
                        LAST_COMPONENT_COLUMNS = model.getItemsLov( {
                            type:       "columns",
                            component:  lComponent
                        });

                        for ( i = 0; i < LAST_COMPONENT_COLUMNS.length; i++ ) {
                            LAST_COMPONENT_COLUMN_NAMES.push( LAST_COMPONENT_COLUMNS[ i ].name );
                        }

                        lValidHashSubstitutions.push(...LAST_COMPONENT_COLUMN_NAMES, ...APEX_VALID_HASH_SUBSTITUTIONS);
                    }

                    // the main click handler that launches the link dialog
                    pElement$.closest( "div." + PROPERTY ).on( "click", "#" + pElement$.attr( "id" ), function() {
                        var lLinkDlg$, lLinkType, lLinkUrl,
                            out = util.htmlBuilder(),
                            lLinkValue = pElement$.val(),
                            lLinkObject = pd.splitApexUrl( lLinkValue, null, lValidHashSubstitutions ),
                            lPropertySet = [],
                            lComponentTypeId = model.getComponentType( lastComponents[ 0 ].typeId ).id,
                            lBranchMode = false,
                            lButtonMode = false,
                            lActionMode = false,
                            lChartMode = false,
                            lLinkRequired = prop.metaData.isRequired,
                            lLinkReadOnly = prop.metaData.isReadOnly;

                        // Link property types do not support multi-edit, so we can just look at the first selected to determine
                        // the current component type.
                        if ( [ model.COMP_TYPE.CARD_ACTION,
                               model.COMP_TYPE.REGION_ACTION,
                               model.COMP_TYPE.IR_COLUMN_ACTION,
                               model.COMP_TYPE.REGION_ACTION_MENU_ENTRY,
                               model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ].includes( lComponentTypeId ))
                        {
                            lActionMode = true;
                        } else {
                            switch ( lComponentTypeId ) {
                                case model.COMP_TYPE.BRANCH:
                                    lBranchMode = true;
                                    break;
                                case model.COMP_TYPE.BUTTON:
                                    lButtonMode = true;
                                    break;
                                case model.COMP_TYPE.JET_CHART_SERIES:
                                    lChartMode = true;
                                    break;
                            }
                        }

                        // Buttons, charts, card, region and ir column actions all have have explicit properties that store the link type,
                        // so it needs to be handled differently
                        if ( lButtonMode || lActionMode || lChartMode ) {
                            let typePropName;

                            if ( lButtonMode ) {
                                typePropName = model.PROP.BUTTON_ACTION;
                            } else if ( lActionMode ) {
                                typePropName = model.PROP.ACTION_LINK_TARGET_TYPE;
                            } else if ( lChartMode ) {
                                typePropName = model.PROP.LINK_TARGET_TYPE;
                            }

                            // Note: Use first selected, which is safe to do as links do not yet support multi-edit
                            switch ( lastComponents[ 0 ].getProperty( typePropName ).getValue() ) {
                                case "REDIRECT_URL":
                                    lLinkType = pd.LINK_TYPE.URL;

                                    // where link type is explicitly defined as URL, use the link value as the URL (bug #28642641)
                                    lLinkUrl = lLinkValue;
                                    break;
                                case "REDIRECT_PAGE":
                                    lLinkType = pd.LINK_TYPE.PAGE_IN_THIS_APP;
                                    break;
                                case "REDIRECT_APP":
                                    lLinkType = pd.LINK_TYPE.PAGE_IN_DIFF_APP;
                                    break;
                            }

                        } else {
                            lLinkType = lLinkObject.type;
                            lLinkUrl = lLinkObject.url;
                        }


                        function _getProperty ( pPropertyName ) {
                            var i, j, lProperty;
                            for ( i = 0; i < lPropertySet.length; i++ ) {
                                for ( j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                    if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                        lProperty = lPropertySet[ i ].properties[ j ];
                                        break;
                                    }
                                }
                            }
                            return lProperty;
                        }

                        lPropertySet.push (
                            that._getDisplayGroupTarget( [
                                that._getPropertyLinkType({
                                    value:          lLinkType,
                                    metaData: {
                                        isReadOnly: lLinkReadOnly || lButtonMode || lActionMode || lChartMode,
                                        isRequired: lLinkRequired
                                    }
                                }),
                                that._getPropertyLinkApp({
                                    value:          ( lLinkType === pd.LINK_TYPE.PAGE_IN_DIFF_APP ) ?  lLinkObject.appId : "",
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }),
                                that._getPropertyLinkPage({
                                    value:          lLinkObject.pageId,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }),
                                that._getPropertyLinkUrl({
                                    value:          lLinkUrl,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                })
                            ])
                        );
                        lPropertySet.push (
                            that._getDisplayGroupSetItems( [
                                that._getPropertyLinkSetItems({
                                        value: {
                                            names:  lLinkObject.itemNames,
                                            values: lLinkObject.itemValues
                                        },
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );
                        lPropertySet.push (
                            that._getDisplayGroupClearSessionState( [
                                that._getPropertyLinkClearCache({
                                    value:          lLinkObject.clearCache,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }),
                                that._getPropertyLinkClearAction({
                                    value:          lLinkObject.clearAction,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }),
                            ])
                        );
                        var lDisplayGroupAdvancedProps = [];
                        lDisplayGroupAdvancedProps.push( that._getPropertyLinkRequest({
                            value:          lLinkObject.request,
                            metaData: {
                                isReadOnly: prop.metaData.isReadOnly
                            }
                        }) );
                        lDisplayGroupAdvancedProps.push( that._getPropertyLinkAnchor({
                            value:          lLinkObject.anchor,
                            metaData: {
                                isReadOnly: prop.metaData.isReadOnly
                            }
                        }) );
                        if ( lBranchMode ) {
                            lDisplayGroupAdvancedProps.push( that._getPropertyLinkSuccessMessage({
                                value:          lLinkObject.successMessage,
                                metaData: {
                                    isReadOnly: prop.metaData.isReadOnly
                                }
                            }) );
                        }
                        lPropertySet.push ( that._getDisplayGroupAdvanced( lDisplayGroupAdvancedProps ) );

                        // create dialog div
                        out.markup( "<div" )
                            .attr( "id", "linkDlg" )
                            .attr( "title", formatNoEscape( "LINK.TITLE", prop.metaData.prompt ) ) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "linkDlgPE" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lLinkDlg$ = $( out.toString() ).dialog( {
                            modal:          true,
                            closeText:      lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            minWidth:       400,
                            width:          520,
                            dialogClass:    DIALOG_FLUSH_BODY,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            close: function() {
                                $( "#linkDlgPE" ).propertyEditor( "destroy" );
                                lLinkDlg$.dialog( "destroy" );
                            },
                            open: function() {
                                function _showProperties( pLinkType ) {
                                    var lProperty = {
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    };

                                    switch ( pLinkType ) {
                                        case LINK.TYPES.PAGE_IN_THIS_APP:
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.URL );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.APPLICATION );
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkPage( lProperty ),
                                                prevPropertyName:   LINK.PROP.TYPE,
                                                displayGroup:       that._getDisplayGroupTarget()
                                            });

                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkSetItems( lProperty, prop ),
                                                displayGroup:       that._getDisplayGroupSetItems(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.TARGET
                                            });

                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkClearCache( lProperty ),
                                                displayGroup:       that._getDisplayGroupClearSessionState(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.SET_ITEMS
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkClearAction( lProperty ),
                                                displayGroup:       that._getDisplayGroupClearSessionState(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.SET_ITEMS
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkRequest( lProperty ),
                                                displayGroup:       that._getDisplayGroupAdvanced(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                            });

                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkAnchor( lProperty ),
                                                displayGroup:       that._getDisplayGroupAdvanced(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                            });

                                            if ( lBranchMode ) {
                                                lLinkDlgPE$.propertyEditor( "addProperty", {
                                                    property:           that._getPropertyLinkSuccessMessage( lProperty ),
                                                    prevPropertyName:   LINK.PROP.RESET_PAGINATION,
                                                    displayGroup:       that._getDisplayGroupAdvanced(),
                                                    prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                                });
                                            }
                                            break;
                                        case LINK.TYPES.PAGE_IN_DIFF_APP:
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.URL );
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkApp( lProperty ),
                                                prevPropertyName:   LINK.PROP.TYPE,
                                                displayGroup:       that._getDisplayGroupTarget()
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkPage( lProperty ),
                                                prevPropertyName:   LINK.PROP.APPLICATION,
                                                displayGroup:       that._getDisplayGroupTarget()
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkSetItems( lProperty, prop ),
                                                displayGroup:       that._getDisplayGroupSetItems(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.TARGET
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkClearCache( lProperty ),
                                                displayGroup:       that._getDisplayGroupClearSessionState(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.SET_ITEMS
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkClearAction( lProperty ),
                                                displayGroup:       that._getDisplayGroupClearSessionState(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.SET_ITEMS
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkRequest( lProperty ),
                                                displayGroup:       that._getDisplayGroupAdvanced(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                            });
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkAnchor( lProperty ),
                                                displayGroup:       that._getDisplayGroupAdvanced(),
                                                prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                            });
                                            if ( lBranchMode ) {
                                                lLinkDlgPE$.propertyEditor( "addProperty", {
                                                    property:           that._getPropertyLinkSuccessMessage( lProperty ),
                                                    prevPropertyName:   LINK.PROP.RESET_PAGINATION,
                                                    displayGroup:       that._getDisplayGroupAdvanced(),
                                                    prevDisplayGroupId: LINK.DISPLAY_GROUP.CLEAR_SESSION
                                                });
                                            }
                                            break;
                                        case LINK.TYPES.URL:
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.APPLICATION );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.PAGE );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.SET_ITEMS );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.REQUEST );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.ANCHOR );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.CLEAR_CACHE );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.CLEAR_ACTION );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.SUCCESS_MESSAGE );
                                            lLinkDlgPE$.propertyEditor( "addProperty", {
                                                property:           that._getPropertyLinkUrl( lProperty ),
                                                prevPropertyName:   LINK.PROP.TYPE,
                                                displayGroup:       that._getDisplayGroupTarget()
                                            });
                                            break;
                                        default:
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.APPLICATION );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.PAGE );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.SET_ITEMS );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.REQUEST );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.ANCHOR );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.CLEAR_CACHE );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.CLEAR_ACTION );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.SUCCESS_MESSAGE );
                                            lLinkDlgPE$.propertyEditor( "removeProperty", LINK.PROP.URL );
                                            break;
                                    }
                                }

                                var lLinkDlgPE$ = $( "#linkDlgPE" );
                                lLinkDlgPE$.propertyEditor( {
                                    focusPropertyName: LINK.PROP.TYPE,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false,
                                        lastComponents: lastComponents
                                    },
                                    change: function( pEvent, pData ) {
                                        if ( pData.propertyName === LINK.PROP.TYPE ) {
                                            _showProperties( _getProperty( LINK.PROP.TYPE ).value );
                                        }

                                        // fixes issue where new properties added have stale values in lPropertySet
                                        _getProperty( pData.propertyName ).value = pData.property.value;
                                    }
                                });
                                _showProperties( _getProperty( LINK.PROP.TYPE ).value );

                                $( "#linkDlg" ).dialog({
                                    position: { 'my': 'center', 'at': 'center', of: window  }
                                });
                            },
                            buttons: [
                                {
                                    text:       msg( "CANCEL" ),
                                    click:      function() {
                                        lLinkDlg$.dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "CLEAR" ),
                                    disabled:   lLinkRequired || lLinkReadOnly,
                                    click:      function() {
                                        $( "#linkDlgPE" ).propertyEditor( "updatePropertyValue", LINK.PROP.TYPE, "" );
                                        that.setValue( pElement$, prop, "" );
                                        pElement$.trigger( "change" );
                                        that.setFocus( pElement$ );
                                        lLinkDlg$.dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "OK" ),
                                    "class":      BUTTON_HOT,
                                    disabled:   lLinkReadOnly,
                                    click:      function() {
                                        var lType, lReturnLink,
                                            lErrorProps = [];

                                        // Compute clear cache value
                                        function _getClearCache( pClearCache, pClearAction ) {

                                            // When pClearAction is NONE, we can ignore it and just use what's in pClearCache, otherwise comma-separate pClearAction and pClearCache
                                            return ( pClearAction === "NONE" ? pClearCache : pClearAction + "," + pClearCache );
                                        }
                                        function _addError( pPropertyName, pErrorMsg ) {
                                            var lErrorProp = _getProperty( pPropertyName );
                                            lErrorProp.errors.push( pErrorMsg );
                                            return lErrorProp;
                                        }

                                        lType = _getProperty( LINK.PROP.TYPE ).value;
                                        if ( lType === LINK.TYPES.PAGE_IN_THIS_APP || lType === LINK.TYPES.PAGE_IN_DIFF_APP ) {

                                            if ( lType === LINK.TYPES.PAGE_IN_DIFF_APP && _getProperty( LINK.PROP.APPLICATION ).value === "" ) {
                                                lErrorProps.push( _addError( LINK.PROP.APPLICATION, msg( "IS_REQUIRED" ) ) );
                                            }
                                            // todo look at using validate callback for property type instead
                                            if ( _getProperty( LINK.PROP.PAGE ).value === "" ) {
                                                lErrorProps.push( _addError( LINK.PROP.PAGE, msg( "IS_REQUIRED" ) ) );
                                            }
                                            if ( lErrorProps.length === 0 ) {

                                                lReturnLink =
                                                    "f?p=" +
                                                    (( lType === LINK.TYPES.PAGE_IN_THIS_APP ) ? "&APP_ID." : _getProperty( LINK.PROP.APPLICATION ).value ) +
                                                    ":" + _getProperty( LINK.PROP.PAGE ).value +
                                                    ":&SESSION." +
                                                    ":" + _getProperty( LINK.PROP.REQUEST ).value +
                                                    ":&DEBUG." +
                                                    ":" + _getClearCache(
                                                    _getProperty( LINK.PROP.CLEAR_CACHE ).value,
                                                    _getProperty( LINK.PROP.CLEAR_ACTION ).value ) +
                                                    ":" + ( _getProperty( LINK.PROP.SET_ITEMS ).value.names  || [] ).join( "," ) +
                                                    ":" + ( _getProperty( LINK.PROP.SET_ITEMS ).value.values || [] ).join( "," );

                                                if ( _getProperty( LINK.PROP.ANCHOR ).value ) {
                                                    lReturnLink += "#" + _getProperty( LINK.PROP.ANCHOR ).value;
                                                }
                                                if ( lBranchMode && _getProperty( LINK.PROP.SUCCESS_MESSAGE ).value === "Y" ) {
                                                    lReturnLink += "&success_msg=#SUCCESS_MSG#";
                                                }

                                            }
                                        } else if ( lType === LINK.TYPES.URL ) {

                                            if ( _getProperty( LINK.PROP.URL ).value === "" ) {
                                                lErrorProps.push( _addError( LINK.PROP.URL, msg( "IS_REQUIRED" ) ) );
                                            }
                                            if ( lErrorProps.length === 0 ) {
                                                lReturnLink = _getProperty( LINK.PROP.URL ).value;
                                            }
                                        }

                                        if ( lErrorProps.length === 0 ) {
                                            that.setValue( pElement$, prop, lReturnLink, lastComponents );
                                            pElement$.trigger( "change" );
                                            lLinkDlg$.dialog( "close" );
                                        } else {
                                            for ( var i = 0; i < lErrorProps.length; i++ ) {
                                                $( "#linkDlgPE" ).propertyEditor( "updateProperty", lErrorProps[ i ] );
                                            }
                                            // set focus to first
                                            // error tooltip sufficient?
                                        }
                                    }
                                }
                            ]
                        });
                    });
                }
            } );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.LINK_SET_ITEMS, {
                stacked:        true,
                noLabel:        true,
                labelVisible:   false,
                minHeight:      85,
                maxHeight:      122,
                render: function( out, id, prop /*, lastComponents */ ) {
                    let lLabelId    = id + "_label";
                    out.markup( "<div" )
                        .attr( "id", id )
                        .attr( "class", PROPERTY_FIELD_CONTAINER )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .markup( ">" );

                    out.markup( "<table role='grid'" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE )
                        .attr( ARIA_LABELLEDBY, lLabelId )
                        .markup( ">" )
                        .markup( "<tr>" )
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "NAME" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.NAME_LIST_OF_VALUES" ) )
                        .markup( ">" )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "LINK.VALUE" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.VALUE_LIST_OF_VALUES" ) )
                        .markup( ">" )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.REMOVE" ) )
                        .markup( "</th>" )
                        .markup( "</tr>" );

                    for ( var i = 0; i < prop.value.names.length; i++ ) {
                        this._renderLinkItemsRow( out, {
                            rowId:      i + 1,
                            idPrefix:   id,
                            name:       prop.value.names[ i ],
                            value:      prop.value.values[ i ],
                            readOnly:   prop.metaData.isReadOnly
                        });
                    }

                    // If the property is currently editable, render an additional row for new items
                    if ( !prop.metaData.isReadOnly ) {
                        this._renderLinkItemsRow( out, {
                            rowId:      prop.value.names.length + 1,
                            idPrefix:   id
                        });
                    }
                    out.markup( "</table>" );

                    this.renderDivClose( out );
                },
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:       "name",
                                title:      msg( "NAME" ),
                                alignment:  "left",
                                isRowHeader: true,
                            },
                            {
                                name:      "label",
                                title:     msg( "LABEL" ),
                                alignment: "left"
                            }
                        ],
                        filterLov: function ( pFilters, pRenderLovEntries ) {
                            var lType = "page",
                                lPageId;

                            switch ( pFilters.scope ) {
                                case "application":
                                    lType   = "application";
                                    lPageId = "";
                                    break;
                                case "current_page":
                                    lPageId = model.getCurrentPageId();
                                    break;
                                case "global_page":
                                    lPageId = model.getGlobalPageId();
                                    break;
                                case "target_page":
                                    lPageId = $( "#linkDlg" ).find( "[data-property-id=" + LINK.PROP.PAGE + "]" ).val();
                                    break;
                                case "custom_page":
                                    lPageId = pFilters.customPageNumber;
                                    break;
                                case "columns":
                                    lType   = "columns";
                                    break;

                            }

                            // Link property types do not support multi-edit, so we can just look at the first selected to determine
                            // the current component type.
                            model.getItemsLov( {
                                    type:       lType,
                                    component:  lastComponents[ 0 ],
                                    pageId:     lPageId
                                },
                                function( pLovEntries ){
                                    pRenderLovEntries( pLovEntries, pFilters.search );
                                });
                        },
                        multiValue: false,
                        dialogTitle: formatNoEscape( "PICK", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                    };


                    function openLovDialog( pReturnElement ) {
                        var out = util.htmlBuilder(),
                            lFilters = lOptions.filters;

                        out.markup( "<div" )
                            .attr( "id", "lovDlg" )
                            .attr( "title", lOptions.dialogTitle )
                            .markup( ">" )
                            .markup( "</div>" );

                        $( out.toString() ).lovDialog({
                            modal:             true,
                            minWidth:          520,
                            height:            500,
                            filters:           lFilters,
                            columnDefinitions: lOptions.columnDefinitions,
                            filterLov:         lOptions.filterLov,
                            dialogClass:       DIALOG_FLUSH_BODY,
                            resizable:         false,
                            multiValue:        lOptions.multiValue,
                            valueSelected: function( pEvent, pData ) {

                                var lValue = pData[ lOptions.columnDefinitions[ 0 ].name ],
                                    lReturnElement$ = $( "#" + pReturnElement );

                                if ( pData.valueFormatting && typeof pData.valueFormatting === "function" ) {
                                    lValue = pData.valueFormatting( lValue );
                                }

                                lReturnElement$
                                    .val( lValue )
                                    .trigger( "change" );
                            }
                        });
                    }


                    var that = this,
                        lProperty$ = pElement$.closest( "div." + PROPERTY ),
                        lId = pElement$.attr( "id" );

                    // Only add interactivity if property is editable
                    if ( !prop.metaData.isReadOnly ) {
                        lProperty$
                            .on( "change", "input." + LINK_DIALOG_ITEM_NAME + ":last", function() {
                                var lNewRow = util.htmlBuilder(),
                                    lDeleteButton = util.htmlBuilder(),
                                    lLastNameInput$ = $( this );

                                if ( lLastNameInput$.val() ) {
                                    var lCurrentRow = $( "input." + LINK_DIALOG_ITEM_NAME ).length;
                                    that._renderLinkItemsRow( lNewRow, {
                                        rowId:      lCurrentRow + 1,
                                        idPrefix:   lId
                                    });
                                    that.renderIconButton( lDeleteButton, {
                                        id:     lId + "_rowRemove_" + lCurrentRow,
                                        icon:   ICON_REMOVE,
                                        text:   format( "LINK.REMOVE_ITEM_N", lCurrentRow )
                                    });
                                    lLastNameInput$
                                        .closest( "tr" )
                                        .find( "td:last" )
                                        .html( lDeleteButton.toString())
                                        .end()
                                        .after( lNewRow.toString());
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowRemove_]", function() {
                                var lNewInput$ = $( this )
                                    .closest( "tr" )
                                    .next( "tr" )
                                    .find( ":input:first" );

                                $( this )
                                    .closest( "tr" )
                                    .remove();
                                lNewInput$
                                    .trigger( "change" )
                                    .trigger( "focus" );
                            })
                            .on( "click", "button[id^=" + lId + "_nameLovBtn_]", function() {

                                lOptions.filters = [
                                    {
                                        name:         "scope",
                                        title:        msg( "ITEM_SCOPE" ),
                                        type:         "buttonset",
                                        defaultValue: "target_page",
                                        lov: [
                                            {
                                                display: msg( "TARGET_PAGE" ),
                                                value:   "target_page"
                                            },
                                            {
                                                display: msg( "CURRENT_PAGE" ),
                                                value:   "current_page"
                                            },
                                            {
                                                display: msg( "CUSTOM_PAGE" ),
                                                value:   "custom_page",
                                                filters: [
                                                    {
                                                        name:       "customPageNumber",
                                                        title:      msg( "PAGE_NUMBER" ),
                                                        type:       "text",
                                                        isRequired: true
                                                    }
                                                ]
                                            },
                                            {
                                                display: msg( "GLOBAL_PAGE" ),
                                                value:   "global_page"
                                            },
                                            {
                                                display: msg( "APPLICATION" ),
                                                value:   "application"
                                            }
                                        ]
                                    },
                                    {
                                        name:  "search",
                                        title: msg( "SEARCH" ),
                                        type:  "search"
                                    }
                                ];

                                openLovDialog( $( this ).data( "for" ) );
                            })
                            .on( "click", "button[id^=" + lId + "_valueLovBtn_]", function() {

                                let i, j, lFilter,
                                    lOriginalProperty = prop.metaData.originalProperty;

                                function ampersandPeriodEnquote( pValue ) {
                                    return "&" + model.enquoteIdentifier( pValue ) + ".";
                                    //return "&" + pValue + ".";
                                }

                                lOptions.filters = [
                                    {
                                        name:           "scope",
                                        title:          msg( "ITEM_SCOPE" ),
                                        type:           "buttonset",
                                        defaultValue:   "current_page",
                                        lov: [
                                            {
                                                display: msg( "TARGET_PAGE" ),
                                                value:   "target_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "CURRENT_PAGE" ),
                                                value:   "current_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "CUSTOM_PAGE" ),
                                                value:   "custom_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                },
                                                filters: [
                                                    {
                                                        name:       "customPageNumber",
                                                        title:      msg( "PAGE_NUMBER" ),
                                                        type:       "text",
                                                        isRequired: true
                                                    }
                                                ]
                                            },
                                            {
                                                display: msg( "GLOBAL_PAGE" ),
                                                value:   "global_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "APPLICATION" ),
                                                value:   "application",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            }
                                        ]
                                    },
                                    {
                                        name:  "search",
                                        title: msg( "SEARCH" ),
                                        type:  "search"
                                    }
                                ];

                                for ( i = 0; i < lOptions.filters.length; i++ ) {

                                    lFilter = lOptions.filters[ i ];

                                    if ( lFilter.name === "scope" ) {

                                        // If property being edited has reference scope of 'row', replace 'target_page' filter with 'columns' filter
                                        if ( lOriginalProperty.metaData.referenceScope === "ROW" ) {

                                            lFilter.defaultValue = "columns";

                                            for ( j = 0; j < lFilter.lov.length; j++ ) {

                                                if ( lFilter.lov[ j ].value === "target_page" ) {
                                                    lFilter.lov[ j ] = {
                                                        display:            msg( "COLUMNS" ),
                                                        value:              "columns",
                                                        valueFormatting:    function( pValue ){
                                                            var lFormat, lComponentTypeId;

                                                            // Note: Link doesn't support multi-edit currently, so we can just get the first lastComponents
                                                            lComponentTypeId = model.getComponentType( lastComponents[ 0 ].typeId ).id;

                                                            if ( $.inArray( lComponentTypeId, HASH_SYNTAX_COMP_TYPES ) !== -1 ) {
                                                                lFormat = "#" + pValue + "#";
                                                            } else {
                                                                lFormat = ampersandPeriodEnquote( pValue );
                                                            }
                                                            return lFormat;
                                                        }
                                                    };

                                                    break;

                                                }

                                            }
                                        }
                                    }
                                }

                                openLovDialog( $( this ).data( "for" ) );

                            });
                    }

                    this.addLabelClickHandler( pElement$, prop );
                },
                setFocus: function( pElement$ ) {
                    pElement$.find( ":input:first" ).trigger( "focus" );
                },
                getValue: function ( pProperty$ ) {
                    var lName$, lValue$,
                        lNames = [],
                        lValues = [];
                    pProperty$.find( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).each( function() {
                        lName$ = $( this ).find( ":input." + LINK_DIALOG_ITEM_NAME );
                        lValue$ = $( this ).find( ":input." + LINK_DIALOG_ITEM_VALUE );
                        if ( lName$.val() !== "" ) {
                            lNames.push( lName$.val());
                            lValues.push( lValue$.val());
                        }
                    });
                    return {
                        names: lNames,
                        values: lValues
                    };
                },
                _renderLinkItemsRow: function ( out, pOptions ) {
                    var lItemNameId, lItemValueId,
                        lOptions = $.extend( {
                            rowId:      "",
                            idPrefix:   "",
                            name:       "",
                            value:      "",
                            readOnly:   false
                        }, pOptions );

                    lItemNameId = lOptions.idPrefix + "_name_" + lOptions.rowId;
                    lItemValueId = lOptions.idPrefix + "_value_" + lOptions.rowId;

                    out.markup( "<tr" )
                        .attr( "class", LINK_DIALOG_SET_ITEMS_ROW_DATA )
                        .markup( ">" );
                    out.markup( "<td>" );
                    this.renderBaseInput( out, {
                        id:         lItemNameId,
                        value:      lOptions.name,
                        inputClass: [ LINK_DIALOG_ITEM_NAME, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "LINK.ITEM_N_NAME", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td>" );
                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_nameLovBtn_" + lOptions.rowId,
                        icon:       ICON_LOV,
                        text:       format( "LINK.ITEM_N_NAME_LOV", lOptions.rowId ),
                        dataFor:    lItemNameId,
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td>" );

                    out.markup( "<td>" );
                    this.renderBaseInput( out, {
                        id:         lItemValueId,
                        value:      lOptions.value,
                        inputClass: [ LINK_DIALOG_ITEM_VALUE, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "LINK.ITEM_N_VALUE", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td>" );
                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_valueLovBtn_" + lOptions.rowId,
                        icon:       ICON_LOV,
                        text:       format( "LINK.ITEM_N_VALUE_LOV", lOptions.rowId ),
                        dataFor:    lItemValueId,
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE_REMOVE_COL )
                        .markup( ">" );

                    // If we have an item name, then we also want to render the remove icon for that row
                    if ( lOptions.name ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowRemove_" + lOptions.rowId,
                            icon:       ICON_REMOVE,
                            text:       format( "LINK.REMOVE_ITEM_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "</tr>" );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.ORDER_BY_ITEM, {

                _addItemLOVDisplayValues: function( pOrderByObject, pAddIfNotExists ) {
                    var lOrderByItems, lOrderByItem, lLovType, lLovTypeProp, lLovDefinitionProp, lLovDefinition, i,
                        lOrderByObject = pOrderByObject, lOrderByExists;

                    if ( pOrderByObject.itemName && pOrderByObject.itemName !== "" ) {

                        lOrderByItems = model.getComponents( model.COMP_TYPE.PAGE_ITEM,
                                                             { properties: [{ id: model.PROP.ITEM_NAME, value: pOrderByObject.itemName }] } );

                        if ( lOrderByItems && lOrderByItems.length > 0 ) {
                            lOrderByItem  = lOrderByItems[ 0 ];
                            lLovTypeProp  = lOrderByItem._properties[ model.PROP.LOV_TYPE ];
                            lLovType      = ( lLovTypeProp ? lLovTypeProp._value : "" );

                            if ( lLovType === "STATIC" ) {
                                lLovDefinitionProp = lOrderByItem._properties[ model.PROP.LOV_STATIC_VALUES ];

                                if ( lLovDefinitionProp ) {
                                    lLovDefinition = getStaticLovObject( lLovDefinitionProp._value );

                                    lLovDefinition.values.forEach( function ( pLovValue ) {
                                        //
                                        // walk through the display and return values of the static LOV
                                        // definition and set the display values on this dialog accordingly.
                                        //
                                        lOrderByExists = false;
                                        for (i = 0; i < lOrderByObject.orderBys.length; i++ ) {
                                            if ( lOrderByObject.orderBys[ i ].key === pLovValue.returnValue ) {
                                                lOrderByObject.orderBys[ i ].display = pLovValue.displayValue;
                                                lOrderByExists = true;
                                                break;
                                            }
                                        }
                                        if ( pAddIfNotExists && !lOrderByExists ) {
                                            lOrderByObject.orderBys.push( { key:     pLovValue.returnValue,
                                                                            display: pLovValue.displayValue } );
                                        }
                                    } );
                                }
                            }
                        }
                    }
                    return lOrderByObject;
                },
                _getOrderByObject: function( pValue ) {
                    var lParsedJSON = {},
                        lOrderByObject;

                    if ( pValue && pValue !== "" ) {
                        try {
                            lParsedJSON = JSON.parse( pValue );
                        } catch ( e ) {
                            debug.error( "Invalid Order By JSON; returning empty object.", e );
                        }
                    }

                    lOrderByObject =  $.extend( true, {
                        orderBys: [],
                        itemName: "" }, lParsedJSON );

                    if ( lOrderByObject.itemName !== "" ) {
                        lOrderByObject = this._addItemLOVDisplayValues( lOrderByObject, false );
                    }

                    return lOrderByObject;
                },
                _getButtonText: function( pValue ) {
                    var lOrderByItem      = this._getOrderByObject( pValue ),
                        lOrderByItemDisp  = ( lOrderByItem.itemName !== "" ? lOrderByItem.itemName : msg( "ORDER_BY_ITEM.NO_ITEM" ) ),
                        lButtonText;

                    if ( lOrderByItem.itemName !== "" || lOrderByItem.orderBys.length > 0 ) {
                        if ( lOrderByItem.orderBys.length === 0 ) {
                            lButtonText = format( "ORDER_BY_ITEM.BUTTON_TEXT_0", lOrderByItemDisp );
                        } else if ( lOrderByItem.orderBys.length === 1 ) {
                            lButtonText = format( "ORDER_BY_ITEM.BUTTON_TEXT_1", lOrderByItemDisp );
                        } else {
                            lButtonText = format( "ORDER_BY_ITEM.BUTTON_TEXT_N", lOrderByItemDisp, lOrderByItem.orderBys.length );
                        }
                    } else {
                        lButtonText = msg( "ORDER_BY_ITEM.BUTTON_TEXT_NULL" );
                    }
                    return lButtonText;
                },
                _getDisplayGroupOrderByExpressions: function ( pProperties ) {
                    return {
                        displayGroupId:     ORDER_BY_ITEM.DISPLAY_GROUP.EXPRESSIONS,
                        displayGroupTitle:  msg( "ORDER_BY_ITEM.EXPRESSIONS" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getDisplayGroupOrderByItem: function ( pProperties ) {
                    return {
                        displayGroupId:     ORDER_BY_ITEM.DISPLAY_GROUP.ITEM,
                        displayGroupTitle:  msg( "ORDER_BY_ITEM.ITEM" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getPropertyOrderByExpressions: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS,
                        value:                  pProperty,
                        metaData: {
                            type:               PROP_TYPE.ORDER_BY_ITEM_EXPRS,
                            prompt:             msg( "ORDER_BY_ITEM.EXPRESSIONS" ),
                            displayGroupId:     ORDER_BY_ITEM.DISPLAY_GROUP.EXPRESSIONS,
                            originalProperty:   pOriginalProperty
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },
                _getPropertyOrderByItem: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           ORDER_BY_ITEM.PROP.ORDER_BY_ITEM,
                        value:                  pProperty,
                        noLabel:                true,
                        metaData: {
                            type:               PROP_TYPE.ITEM,
                            textCase:           "UPPER",
                            prompt:             msg( "ORDER_BY_ITEM.PICK_ITEM" ),
                            displayGroupId:     ORDER_BY_ITEM.DISPLAY_GROUP.ITEM,
                            originalProperty:   pOriginalProperty,
                            isRequired:         true
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },
                // Property type properties and callbacks
                noLabel: true,
                render: function( out, id, prop ) {

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, this._getButtonText( prop.value ) );
                    this.renderDivClose( out );
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    var lDisplayValue;
                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    lDisplayValue = this._getButtonText( pValue );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop, lastComponents ) {
                    var that        = this,
                        lDialogId   = "orderByEditDlg",
                        lDialogPEId = lDialogId + "PE";

                    this.addLabelClickHandler( pElement$, prop );
                    this.addTooltipsForErrors( pElement$, prop );

                    // the main click handler that launches the order bys dialog
                    pElement$.closest( "div." + PROPERTY ).on( "click", "#" + pElement$.attr( "id" ), function() {
                        var lOrderByEditDlg$,
                            out = util.htmlBuilder(),
                            lPropertySet = [],
                            lOrderByObject    = that._getOrderByObject( prop.value ),
                            lOrderBysReadOnly = prop.metaData.isReadOnly;

                        function _getProperty ( pPropertyName ) {
                            var lProperty;
                            for ( let i = 0; i < lPropertySet.length; i++ ) {
                                for ( let j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                    if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                        lProperty = lPropertySet[ i ].properties[ j ];
                                        break;
                                    }
                                }
                            }
                            return lProperty;
                        }

                        function orderByItemChanged( pContext, pItemName, pDoSyncToItem ) {
                            var lOrderByItems, lLovTypeProp,
                                lOrderBysFromItem, lOrderBysFromDialog,
                                i,
                                lReturnValueExistsInDialog,
                                lIsStaticInlineLov = true;

                            if ( pItemName && pItemName !== "" ) {
                                //
                                // find the referenced page item
                                lOrderByItems = model.getComponents(
                                                    model.COMP_TYPE.PAGE_ITEM,
                                                    { properties: [ { id: model.PROP.ITEM_NAME, value: pItemName } ] } );

                                if ( lOrderByItems && lOrderByItems.length > 0 ) {

                                    lLovTypeProp = lOrderByItems[ 0 ]._properties[ model.PROP.LOV_TYPE ];
                                    if ( lLovTypeProp && lLovTypeProp._value === "STATIC" ) {
                                        if ( pDoSyncToItem ) {
                                            lOrderBysFromItem   = that._addItemLOVDisplayValues( { itemName: pItemName, orderBys: [] }, true );
                                            lOrderBysFromDialog = _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS );

                                            lOrderBysFromItem.orderBys.forEach( function( pOrderByFromItem ) {
                                                lReturnValueExistsInDialog = false;
                                                for ( i = 0; i < lOrderBysFromDialog.value.length; i++ ) {
                                                    if ( lOrderBysFromDialog.value[ i ].key === pOrderByFromItem.key ) {
                                                        //
                                                        // return value from page item matches key entered into the dialog
                                                        lReturnValueExistsInDialog = true;
                                                        //
                                                        // if a display value was entered into the dialog, we'll keep it,
                                                        // get the value from the LOV otherwise
                                                        if ( !lOrderBysFromDialog.value[ i ].display || lOrderBysFromDialog.value[ i ].display === "" ) {
                                                            lOrderBysFromDialog.value[ i ].display = pOrderByFromItem.display;
                                                        }
                                                    }
                                                }
                                                if ( !lReturnValueExistsInDialog ) {
                                                   lOrderBysFromDialog.value.push( { key:     pOrderByFromItem.key,
                                                                                     display: pOrderByFromItem.display,
                                                                                     expr:    "" } );
                                                }
                                            } );

                                            $( "#" + lDialogPEId ).propertyEditor( "updateProperty", lOrderBysFromDialog );
                                        }
                                    } else {
                                        lIsStaticInlineLov = false;
                                    }
                                }
                            }

                            //
                            // based on whether the page item uses an inline static LOV, we have to show or
                            // hide the Display Value column and the Move Up or Move Down columns of the
                            // Order By expressions table. Also switch the info message which explains
                            // whether changes are synchronized to the page item or not.
                            //
                            // as screen readers struggle to announce aria-live contents when the element
                            // is completely redrawn, we mantain the <div> container manually: if it not exists yet,
                            // create it. Contents will be adjusted afterwards.
                            //
                            if ( $( "#" + lDialogPEId + "_itemInfoMsg" ).length === 0 ) {
                                 $( "#" + lDialogPEId + " div[data-group-id='" + ORDER_BY_ITEM.DISPLAY_GROUP.EXPRESSIONS + "']" ).append(
                                      new util.htmlBuilder().markup( "<div" )
                                                            .attr( "id", lDialogPEId + "_itemInfoMsg" )
                                                            .attr( "aria-live", "polite" )
                                                            .attr( "class", PROPERTY_FIELD_CONTAINER + " " + PROPERTY_EDITOR_MESSAGETEXT )
                                                            .markup( "></div>").toString() );
                            }

                            if ( lIsStaticInlineLov ) {
                                //
                                $( "#" + lDialogPEId + "_keyValHdr").css( "width", ORDERBY_DIALOG_TABLE_KEY_WIDTH );
                                $( pContext ).find( "." + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV ).show();
                                $( "#" + lDialogPEId + "_itemInfoMsg").html( msg( "ORDER_BY_ITEM.INFO_ITEM_INLINE_STATIC_LOV" ) );
                            } else {
                                //
                                $( "#" + lDialogPEId + "_keyValHdr").css( "width", ORDERBY_DIALOG_TABLE_KEYDISP_WIDTH );
                                $( pContext ).find( "." + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV ).hide();
                                $( "div#" + lDialogPEId + "_itemInfoMsg").html( msg( "ORDER_BY_ITEM.INFO_ITEM_SHARED_LOV" ) );
                            }
                        }

                        lPropertySet.push (
                            that._getDisplayGroupOrderByExpressions( [
                                that._getPropertyOrderByExpressions({
                                        value: lOrderByObject.orderBys,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );

                        lPropertySet.push (
                            that._getDisplayGroupOrderByItem( [
                                that._getPropertyOrderByItem({
                                        value: lOrderByObject.itemName,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );
                        // create dialog div
                        out.markup( "<div" )
                            .attr( "id", lDialogId )
                            .attr( "title", msg( "ORDER_BY_ITEM.TITLE" ) )
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", lDialogPEId )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lOrderByEditDlg$ = $( out.toString() ).dialog( {
                            modal:          true,
                            closeText:      lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            minWidth:       400,
                            width:          720,
                            dialogClass:    DIALOG_FLUSH_BODY,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            close: function() {
                                $( "#" + lDialogPEId ).propertyEditor( "destroy" );
                                lOrderByEditDlg$.dialog( "destroy" );
                            },
                            open: function() {
                                var lOrderByEditDlgPE$ = $( "#" +lDialogPEId ),
                                    lOrderItemProp;

                                function _showProperties( pValue ) {
                                    var lProperty = {
                                        value: pValue,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    };

                                    lOrderByEditDlgPE$.propertyEditor( "addProperty", {
                                        property:           that._getPropertyOrderByExpressions( lProperty, prop ),
                                        displayGroup:       that._getDisplayGroupOrderByExpressions()
                                    });
                                }

                                lOrderByEditDlgPE$.propertyEditor( {
                                    focusPropertyName: ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false,
                                        lastComponents: lastComponents
                                    },
                                    change: function( pEvent, pData ) {
                                        if ( pData.propertyName === ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS ) {
                                            _showProperties( _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS ).value );
                                        } else if ( pData.property.propertyName === ORDER_BY_ITEM.PROP.ORDER_BY_ITEM ) {
                                            orderByItemChanged( this, pData.property.value.toUpperCase(), true );
                                        }

                                        // fixes issue where new properties added have stale values in lPropertySet
                                        _getProperty( pData.propertyName ).value = pData.property.value;
                                    }
                                });
                                if ( lOrderByObject.itemName === "" ) {
                                    lOrderItemProp = _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_ITEM );
                                    if ( lOrderByObject.orderBys.length === 0 ) {
                                        lOrderItemProp.value =  "P" + model.getCurrentPageId() + "_ORDER_BY";
                                    } else {
                                        lOrderItemProp.errors.push( msg( "IS_REQUIRED" ) );
                                    }
                                    lOrderByEditDlgPE$.propertyEditor( "updateProperty", lOrderItemProp );
                                    orderByItemChanged( lOrderByEditDlgPE$, lOrderItemProp.value, true );
                                } else {
                                    orderByItemChanged( lOrderByEditDlgPE$, lOrderByObject.itemName, false );
                                }

                                _showProperties( _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS ).value );

                                $( "#" + lDialogId ).dialog({
                                    position: { 'my': 'center', 'at': 'center', of: window  }
                                });
                            },
                            buttons: [
                                         {
                                             text:       msg( "CANCEL" ),
                                             click:      function() {
                                                 lOrderByEditDlg$.dialog( "close" );
                                             }
                                         },
                                         {
                                             text:       msg( "CLEAR" ),
                                             click:      function() {
                                                     var lButtonElem$, lButtonElemId = pElement$.attr( "id" );

                                                     that.setValue( pElement$, prop, "" );
                                                     pElement$.trigger( "change" );
                                                     lOrderByEditDlg$.dialog( "close" );
                                                     //
                                                     // based on the propertys previous error state the change
                                                     // event might lead to a re-rendering of the whole button element,
                                                     // which leads to the pElement$ handle becoming stale. Setting the
                                                     // focus on that element would not work any more.
                                                     // Thus refetch the button element based on its ID and use that
                                                     // for setting the focus back.
                                                     //
                                                     lButtonElem$ = $( "#" + lButtonElemId );
                                                     lButtonElem$.trigger( "focus" );
                                             }
                                         },
                                         {
                                             text:       msg( "OK" ),
                                             "class":    BUTTON_HOT,
                                             disabled:   lOrderBysReadOnly,
                                             click:      function() {
                                                 var lItemName   = _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_ITEM ).value.toUpperCase(),
                                                     lPropValue  = { orderBys: _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS ).value,
                                                                     itemName: lItemName },
                                                     lErrorProps = [],
                                                     lThisError  = {}, lHasErrors = false,
                                                     i,
                                                     lButtonElem$, lButtonElemId = pElement$.attr( "id" );

                                                 function _clearError( pPropertyName ) {
                                                     var lErrorProp = _getProperty( pPropertyName );
                                                     lErrorProp.errors = [];
                                                 }

                                                 function _addError( pPropertyName, pErrorObj ) {
                                                     var lErrorProp = _getProperty( pPropertyName );
                                                     lErrorProp.errors.push( pErrorObj );
                                                     return lErrorProp;
                                                 }

                                                 function syncToPageItem() {
                                                     var lOrderByItems, lOrderByItem, lItemDefaultProp, lItemDefaultTypeProp, lItemDefaultOK = true,
                                                         lLovDefinitionString, lLovType, lLovTypeProp, lStaticLovProp,
                                                         lAppItems,
                                                         lComponentCreateItemIn,
                                                         lTransaction, lMessage,
                                                         lFirstLOVReturnValue = "",
                                                         lLovDefinition       = { sort: "N", values: [] };

                                                     if ( lItemName && lItemName !== "" ) {
                                                         //
                                                         // build the static LOV object with display and return values, and convert to a string
                                                         //
                                                         _getProperty( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS ).value.forEach( function ( pOrderBy ) {
                                                             lFirstLOVReturnValue = ( lFirstLOVReturnValue === "" ? pOrderBy.key : lFirstLOVReturnValue );
                                                             lLovDefinition.values.push(
                                                                 {
                                                                     displayValue: ( ( !pOrderBy.display || pOrderBy.display === "" ) ? pOrderBy.key : pOrderBy.display ),
                                                                     returnValue: pOrderBy.key
                                                                 } );
                                                         } );
                                                         lLovDefinitionString = getStaticLovString( lLovDefinition.sort, lLovDefinition.values );

                                                         lOrderByItems = model.getComponents(
                                                                             model.COMP_TYPE.PAGE_ITEM,
                                                                             { properties: [{ id: model.PROP.ITEM_NAME, value: lItemName }] } );

                                                         if ( lOrderByItems && lOrderByItems.length > 0 ) {
                                                             lOrderByItem              = lOrderByItems[ 0 ];
                                                             lLovTypeProp              = lOrderByItem.getProperty( model.PROP.LOV_TYPE );
                                                             lItemDefaultTypeProp      = lOrderByItem.getProperty( model.PROP.ITEM_DEFAULT_TYPE );

                                                             //
                                                             // check whether the item uses a static default value and whether
                                                             // we have a key corresponding to that value. If there is no key,
                                                             // flag the default to be updated further below.
                                                             //
                                                             if ( lItemDefaultTypeProp && lItemDefaultTypeProp.getValue() === "STATIC_TEXT_WITH_SUBSTITUTIONS" ) {
                                                                 lItemDefaultOK            = false;
                                                                 lItemDefaultProp          = lOrderByItem.getProperty( model.PROP.ITEM_DEFAULT_STATIC_TEXT );

                                                                 if ( lItemDefaultProp ) {
                                                                    lLovDefinition.values.forEach( function ( pLovValue ) {
                                                                         if ( pLovValue.key === lItemDefaultProp.getValue() ) {
                                                                             lItemDefaultOK = true;
                                                                         }
                                                                     } );
                                                                 }
                                                             }

                                                             if ( lLovTypeProp ) { lLovType = lLovTypeProp.getValue(); }

                                                             //
                                                             // we only synchronize display values if the LOV item uses a static LOV
                                                             //
                                                             if ( lLovType === "STATIC" ) {
                                                                 //
                                                                 // now update the static LOV property
                                                                 //
                                                                 lStaticLovProp       = lOrderByItem.getProperty( model.PROP.LOV_STATIC_VALUES );
                                                                 lItemDefaultProp     = lOrderByItem.getProperty( model.PROP.ITEM_DEFAULT_STATIC_TEXT );
                                                                 //
                                                                 // change the static LOV definition of the LOV Page Item
                                                                 //
                                                                 lMessage = model.transaction.message( {
                                                                     action:     model.MESSAGE_ACTION.CHANGE,
                                                                     component:  lOrderByItem,
                                                                     property:   lStaticLovProp
                                                                 } );
                                                                 lTransaction = model.transaction.start( "", lMessage );

                                                                 lStaticLovProp.setValue( lLovDefinitionString );
                                                                 //
                                                                 // if the item has a static default, and there is no corresponding key in
                                                                 // the list of order bys, replace the default with the first key in the
                                                                 // order by list
                                                                 //
                                                                 if ( !lItemDefaultOK && lItemDefaultProp ) {
                                                                     lItemDefaultProp.setValue( lFirstLOVReturnValue );
                                                                 }

                                                                 apex.commandHistory.execute( lTransaction );
                                                             } else {
                                                                 debug.info( "Page Item uses a Shared LOV or a SQL Query. Do nothing." );
                                                             }
                                                         } else {
                                                             //
                                                             // only create a new item, if no app item with the same name exists
                                                             //
                                                             lAppItems = model.getComponents(
                                                                             model.COMP_TYPE.APP_ITEM,
                                                                             { properties: [{ id: model.PROP.ITEM_NAME, value: lItemName }] } );

                                                             if ( !lAppItems || lAppItems.length === 0 ) {

                                                                 if ( lastComponents && lastComponents.length > 0 ) {
                                                                     //
                                                                     // add a "select list" page item with the static LOV definition specified here.
                                                                     //
                                                                     lMessage = model.transaction.message( {
                                                                         action:     model.MESSAGE_ACTION.CREATE,
                                                                         component:  model.COMP_TYPE.PAGE_ITEM
                                                                     } );
                                                                     lTransaction = model.transaction.start( "", lMessage );

                                                                     //
                                                                     // for a JET Chart Series, the Order By Item must be created in the
                                                                     // region container, which is the grandparent: SERIES > CHART > REGION.
                                                                     // have a fallback to stop at the page level at the latest (we should never see that)
                                                                     //
                                                                     lComponentCreateItemIn = lastComponents[0];
                                                                     while ( $.inArray( lComponentCreateItemIn.typeId, [ model.COMP_TYPE.REGION, model.COMP_TYPE.PAGE ] ) === -1 ) {
                                                                        lComponentCreateItemIn = lComponentCreateItemIn.getParent();
                                                                     }

                                                                     //
                                                                     // determine whether the region has a "ORDER_BY_ITEM" slot.
                                                                     // Also check if the region plugin has a "PLUGIN_ORDER_BY_ITEM" slot (takes precedence)
                                                                     // If yes, use that otherwise use the generic "BODY" slot.
                                                                     //
                                                                     const regionId = lComponentCreateItemIn.id;
                                                                     const orderByItemSlot = model.getSlot( {
                                                                        componentTypeId: model.COMP_TYPE.PAGE_ITEM,
                                                                        regionId,
                                                                        slotPlaceholder: [ "PLUGIN_ORDER_BY_ITEM", "ORDER_BY_ITEM" ]
                                                                    } );
                                                                     const slotPlaceholder = orderByItemSlot?.placeholder || "BODY";

                                                                     new model.Component( {
                                                                         typeId:   model.COMP_TYPE.PAGE_ITEM,
                                                                         parentId: regionId,
                                                                         values:   [
                                                                             { id: model.PROP.ITEM_NAME,                    value: lItemName },
                                                                             { id: model.PROP.REGION,                       value: regionId },
                                                                             { id: model.PROP.ITEM_LABEL,                   value: lang.getMessage( "APEXAPP.ITEM.ORDER_BY") },
                                                                             { id: model.PROP.ITEM_TYPE,                    value: "NATIVE_SELECT_LIST" },
                                                                             { id: model.PROP.LOV_TYPE,                     value: "STATIC" },
                                                                             { id: model.PROP.VALUE_REQUIRED,               value: "Y" },
                                                                             { id: model.PROP.SLOT_PLACEHOLDER,             value: slotPlaceholder },
                                                                             { id: model.PROP.LOV_DISPLAY_EXTRA,            value: "N" },
                                                                             { id: model.PROP.ITEM_WARN_ON_UNSAVED_CHANGES, value: "I" },
                                                                             { id: model.PROP.LOV_DISPLAY_NULL,             value: "N" },
                                                                             { id: model.PROP.LOV_STATIC_VALUES,            value: lLovDefinitionString },
                                                                             { id: model.PROP.ITEM_DEFAULT_TYPE,            value: "STATIC_TEXT_WITH_SUBSTITUTIONS" },
                                                                             { id: model.PROP.ITEM_DEFAULT_STATIC_TEXT,     value: lFirstLOVReturnValue }
                                                                         ]
                                                                     } );

                                                                     apex.commandHistory.execute( lTransaction );
                                                                 }
                                                             } else {
                                                                 debug.info( "App item referenced. Do nothing." );
                                                             }
                                                         }
                                                     }
                                                 }

                                                 _clearError( ORDER_BY_ITEM.PROP.ORDER_BY_ITEM );
                                                 _clearError( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS );

                                                 if ( lPropValue.itemName === "" ) {
                                                     lErrorProps.push( _addError( ORDER_BY_ITEM.PROP.ORDER_BY_ITEM, msg( "IS_REQUIRED" ) ) );
                                                 }

                                                 if ( lPropValue.orderBys.length === 0 ) {
                                                     lThisError[ "0" ] = msg( "ORDER_BY_ITEM.CLAUSE_1_IS_REQUIRED" );
                                                     lHasErrors = true;
                                                 } else {
                                                     for ( i = 0; i < lPropValue.orderBys.length; i++ ) {
                                                         if ( lPropValue.orderBys[ i ].expr === "" ) {
                                                             lThisError[ i.toString() ] = format( "ORDER_BY_ITEM.CLAUSE_N_IS_REQUIRED", ( i + 1 ) );
                                                             lHasErrors = true;
                                                         }
                                                     }
                                                 }
                                                 if ( lHasErrors ) {
                                                     lErrorProps.push( _addError( ORDER_BY_ITEM.PROP.ORDER_BY_EXPRS, lThisError ) );
                                                 }

                                                 if ( lErrorProps.length === 0 ) {
                                                     //
                                                     // now sync to the page item
                                                     //
                                                     syncToPageItem();

                                                     //
                                                     // the display name is only needed for this property type, and should not
                                                     // be stored as meta data.
                                                     //
                                                     for ( i = 0; i < lPropValue.orderBys.length; i++ ) {
                                                         delete lPropValue.orderBys[ i ].display;
                                                     }

                                                     that.setValue( pElement$, prop, JSON.stringify(lPropValue) );
                                                     pElement$.trigger( "change" );
                                                     lOrderByEditDlg$.dialog( "close" );

                                                     //
                                                     // based on the properties previous error state the change
                                                     // event might lead to a re-rendering of the whole button element,
                                                     // which leads to the pElement$ handle becoming stale. Setting the
                                                     // focus on that element would not work any more.
                                                     // Thus refetch the button element based on its ID and use that
                                                     // for setting the focus back.
                                                     //
                                                     lButtonElem$ = $( "#" + lButtonElemId );
                                                     lButtonElem$.trigger( "focus" );
                                                 } else {
                                                     for ( i = 0; i < lErrorProps.length; i++ ) {
                                                         $( "#" + lDialogPEId ).propertyEditor( "updateProperty", lErrorProps[ i ] );
                                                     }
                                                     orderByItemChanged( lOrderByEditDlg$, lPropValue.itemName, false );
                                                 }
                                             }
                                         }
                                     ]
                        });
                    });
                }
            } );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.ORDER_BY_ITEM_EXPRS, {
                stacked:        true,
                noLabel:        true,
                labelVisible:   false,
                minHeight:      200,
                maxHeight:      500,
                //
                render: function( out, id, prop /*, lastComponents */ ) {
                    var lLabelId      = id + "_label",
                        lDialogId     = "orderByEditDlg",
                        lDialogPEId   = lDialogId + "PE",
                        self          = this,
                        lRow          = 1,
                        lErrorMessage = "";

                    out.markup( "<div" )
                        .attr( "id", id )
                        .attr( "class", PROPERTY_FIELD_CONTAINER )
                        .attr( ARIA_LABELLEDBY, lLabelId )
                        .attr( ARIA_DESCRIBEDBY, lDialogPEId + "_itemInfoMsg")
                        .attr( ATTR_ROLE, ROLE_GROUP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .markup( ">" );

                    out.markup( "<table" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE )
                        .markup( ">" )
                        .markup( "<caption" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "ORDER_BY_ITEM.EXPRESSIONS" ) )
                        .markup( "</caption>" )
                        .markup( "<tr>" )
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "style", "width: " + ORDERBY_DIALOG_TABLE_EXPR_WIDTH )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "ORDER_BY_ITEM.EXPRESSION" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "ORDER_BY_ITEM.OPEN_CODE_EDITOR" ) )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "id", lDialogPEId + "_keyValHdr" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .attr( "style", "width: " + ORDERBY_DIALOG_TABLE_KEY_WIDTH )
                        .markup( ">" )
                        .content( msg( "ORDER_BY_ITEM.KEY" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER + " " + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                        .attr( "style", "width: " + ORDERBY_DIALOG_TABLE_DISP_WIDTH )
                        .markup( ">" )
                        .content( msg( "ORDER_BY_ITEM.DISPLAY" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.REMOVE" ) )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN + " " + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.MOVE_UP" ) )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN + " " + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.MOVE_DOWN" ) )
                        .markup( "</th>" )
                        .markup( "</tr>" );

                    prop.value.forEach( function( pOrderBy ) {
                        lErrorMessage = "";
                        if ( prop.errors && prop.errors[0] && prop.errors[0][ (lRow - 1).toString() ] ) {
                            lErrorMessage = prop.errors[0][ (lRow - 1).toString() ];
                        }

                        self._renderOrderBysRow( out, {
                            rowId:      lRow,
                            errorMsg:   lErrorMessage,
                            idPrefix:   id,
                            lastRow:    false,
                            expression: pOrderBy.expr,
                            key:        pOrderBy.key,
                            display:    pOrderBy.display,
                            readOnly:   prop.metaData.isReadOnly
                        });
                        lRow = lRow + 1;
                    });

                    //
                    // only add an error message to the row for new order bys, if there was an attempt
                    // to exit the dialog without any order bys at all.
                    //
                    lErrorMessage = "";
                    if ( prop.value.length === 0 && prop.errors && prop.errors[0] ) {
                        lErrorMessage = prop.errors[0]["0"];
                    }

                    // If the property is currently editable, render an additional row for new items
                    if ( !prop.metaData.isReadOnly ) {
                        self._renderOrderBysRow( out, {
                            rowId:      lRow,
                            lastRow:    true,
                            errorMsg:   lErrorMessage,
                            idPrefix:   id
                        });
                    }
                    out.markup( "</table>" );

                    this.renderDivClose( out );
                },
                init: function( pElement$, prop /*, lastComponents */ ) {
                    var that = this,
                        lProperty$ = pElement$.closest( "div." + PROPERTY ),
                        lExprsPropertyId = pElement$.attr( "id" );

                    function swapValue( pInputs1$, pInputs2$, pClass ) {
                        var lInput1$ = pInputs1$.filter( "input." + pClass ),
                            lInput2$ = pInputs2$.filter( "input." + pClass ),
                            lInput1Value = lInput1$.val(),
                            lInput2Value = lInput2$.val();

                        lInput1$.val( lInput2Value );
                        lInput2$.val( lInput1Value );
                    }

                    // Only add interactivity if property is editable
                    if ( !prop.metaData.isReadOnly ) {
                        lProperty$
                            .on( "change", "input." + ORDERBY_DIALOG_CLAUSE_KEY + ":last", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" ),
                                    lNewRow = util.htmlBuilder(),
                                    lMoveDown = util.htmlBuilder(),
                                    lLastNameInput$ = $( this );

                                if ( lLastNameInput$.val() && lNext$.length === 0 ) {
                                    var lMaxRow = $( "input." + ORDERBY_DIALOG_CLAUSE_KEY ).length;
                                    that._renderOrderBysRow( lNewRow, {
                                        rowId:      lMaxRow + 1,
                                        lastRow:    true,
                                        idPrefix:   lExprsPropertyId
                                    });
                                    that.renderIconButton( lMoveDown, {
                                        id:         lExprsPropertyId + "_rowMoveDown_" + lMaxRow,
                                        icon:       ICON_MOVE_DOWN,
                                        text:       format( "ORDER_BY_ITEM.MOVE_DOWN_CLAUSE_N", lMaxRow ),
                                    });
                                    lLastNameInput$
                                        .closest( "tr" )
                                        .find( "td:last" )
                                        .html( lMoveDown.toString())
                                        .end()
                                        .after( lNewRow.toString());

                                    if ( pElement$.find( "." + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV + ":hidden").length > 0 ) {
                                        pElement$.find( "." + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV + ":visible" ).hide();
                                    }
                                }
                            })
                            .on( "change", "input." + ORDERBY_DIALOG_CLAUSE_EXPR, function() {
                                var lThisRow      = $( this ).closest( "tr" ),
                                    lKey$         = $( lThisRow ).find( "input." + ORDERBY_DIALOG_CLAUSE_KEY ),
                                    lDisp$        = $( lThisRow ).find( "input." + ORDERBY_DIALOG_CLAUSE_DISPLAY ),
                                    lClause$      = $( lThisRow ).find( "input." + ORDERBY_DIALOG_CLAUSE_EXPR ),
                                    lKeyExists    = true,
                                    lSuffix       = 0,
                                    lPrefixes, lPrefix;

                                //
                                // based on the ORDER BY clause entered, generate a key and a display value
                                // to prepopulate the input fields
                                //
                                if ( lClause$.val() !== "" ) {
                                    //
                                    // get the first column name or keyword using a REGEXP; ignore quotes, blanks
                                    // and other whitespace
                                    //
                                    lPrefixes = lClause$.val().match( /([_0-9A-Z]+)/gi );
                                    if ( lPrefixes ) {
                                        //
                                        // for clauses with multiple columns or even SQL expressions, we'll
                                        // get multiple matches, but we're only interested in the first one.
                                        //
                                        lPrefix = lPrefixes[ 0 ].toUpperCase();

                                        if ( !lKey$.val() || lKey$.val() === "" ) {
                                            //
                                            // the key must be unique; so let's check whether the key candidate
                                            // is already taken. If that is the case, append a numeric suffix and
                                            // repeat until we have a key which is not used yet.
                                            //
                                            while ( lKeyExists ) {
                                                lKeyExists = false;

                                                $( lThisRow ).parent().find( "input." + ORDERBY_DIALOG_CLAUSE_KEY ).each( function( pIndex, pObject ) {
                                                    if ( $( pObject ).val() === lPrefix + ( lSuffix === 0 ? "" : lSuffix.toString() ) ) {
                                                        lKeyExists = true;
                                                    }
                                                } );

                                                if ( lKeyExists ) { lSuffix += 1; }
                                            }
                                            lKey$.val( lPrefix + ( lSuffix === 0 ? "" : lSuffix.toString() ) ).trigger( "change" );
                                        }
                                        if ( !lDisp$.val() || lDisp$.val() === "" ) {
                                            //
                                            // Format the key and use as display value
                                            //
                                            lDisp$.val(
                                                util.escapeHTML(
                                                    lPrefix
                                                        .replace( /_+/g, "_" ).replace( /^_+/, "" ).replace( /_+$/, "" ).replace( /_/g, " " )
                                                        .toLowerCase()
                                                        .split( " " )
                                                        .map( function( word ) {
                                                                var firstWord = word[ 0 ] || "";
                                                                return word.replace( firstWord, firstWord.toUpperCase() );
                                                        } )
                                                        .join( " " ) ) ).trigger( "change" );
                                        }
                                    }
                                }
                            } )
                            .on( "click", "button[id^=" + lExprsPropertyId + "_rowRemove_]", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" );

                                if ( lNext$.length > 0 ) {
                                    $( this )
                                        .closest( "tr" )
                                        .remove();

                                    lNext$.find( ":input:first" ).trigger( "change" ).trigger( "focus" );
                                } else {
                                    // If it's the last row, just clear the values
                                    $( this )
                                        .closest( "tr" )
                                        .find( "input" )
                                        .val( "" )
                                        .filter( "input." + ORDERBY_DIALOG_CLAUSE_DISPLAY )
                                        .trigger( "change" )
                                        .trigger( "focus" );
                                }
                            })
                            .on( "click", "button[id^=" + lExprsPropertyId + "_rowMoveUp_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lPrevious$ = $( this ).closest( "tr" ).prev( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).find( ":input");

                                if ( lPrevious$.length > 0 ) {
                                    swapValue( lCurrent$, lPrevious$, ORDERBY_DIALOG_CLAUSE_EXPR );
                                    swapValue( lCurrent$, lPrevious$, ORDERBY_DIALOG_CLAUSE_KEY );
                                    swapValue( lCurrent$, lPrevious$, ORDERBY_DIALOG_CLAUSE_DISPLAY );
                                    lPrevious$.filter( "button[id^=" + lExprsPropertyId + "_rowMove]:first" ).trigger( "focus" );
                                    lCurrent$.trigger( "change" );
                                }
                            })
                            .on( "click", "button[id^=" + lExprsPropertyId + "_rowMoveDown_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lNext$ = $( this ).closest( "tr" ).next( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).find( ":input");

                                if ( lNext$.length > 0 ) {
                                    swapValue( lCurrent$, lNext$, ORDERBY_DIALOG_CLAUSE_EXPR );
                                    swapValue( lCurrent$, lNext$, ORDERBY_DIALOG_CLAUSE_KEY );
                                    swapValue( lCurrent$, lNext$, ORDERBY_DIALOG_CLAUSE_DISPLAY );
                                    lNext$.trigger( "change" );
                                    $( this ).closest( "tr" ).next( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).find( "button[id^=" + lExprsPropertyId + "_rowMoveDown_]" ).trigger( "focus" );
                                }
                            })
                            .on ("click", "button[id^=" + lExprsPropertyId + "_rowCodeEditor_]", function() {
                                 var lEditorDlg$, lEditor$,
                                     lSettingsChanged = false,
                                     lButtons         = [],
                                     lCodeEditorId    = "orderByEditDlg-codeEditor",
                                     lActiveExpr$     = $( "#" + lExprsPropertyId + "_expr" + ( $( this ).closest( "tr" ).index() ) ),
                                     out              = util.htmlBuilder();

                                 function updateChangeGeneration() {
                                     gChangeGeneration = lEditor$.codeEditor( "changeGeneration" );
                                     debug.trace( "Editor: update change generation: " + gChangeGeneration );
                                 }

                                 function hasChanged() {
                                     return !lEditor$.codeEditor( "isClean", gChangeGeneration );
                                 }

                                 // Add buttons depending on the property type
                                 lButtons.push({
                                     text:  msg( "CANCEL" ),
                                     click: function() {
                                         lEditorDlg$.dialog( "close" );
                                     }
                                 });

                                 lButtons.push({
                                     text:  msg( "OK" ),
                                     "class": BUTTON_HOT,
                                     click: function() {
                                         lActiveExpr$.val( lEditor$.codeEditor( "getValue" ) ).trigger( "change" );
                                         updateChangeGeneration();
                                         lEditorDlg$.dialog( "close" );
                                     }
                                 });

                                 // open and setup a simple wrapper dialog
                                 out.markup( "<div" )
                                     .attr( "id", "orderByEditDlg" )
                                     .attr( "title", formatNoEscape( "CODE_EDITOR.TITLE", prop.metaData.prompt )) // escaping done by jQueryUI dialog
                                     .markup( ">" )
                                     .markup( "<div" )
                                     .attr( "id", lCodeEditorId )
                                     .markup( "class='resize'>" )
                                     .markup( "</div>" )
                                     .markup( "</div>" );

                                 lEditorDlg$ = $( out.toString()).dialog({
                                     modal:      true,
                                     closeText:  lang.getMessage( "APEX.DIALOG.CLOSE" ),
                                     //
                                     // as we're only editing ORDER BY clauses, we only need a small editor dialog
                                     // window. We also won't store the new editor size as a preference when the
                                     // user resizes this dialog.
                                     //
                                     width:      750,
                                     height:     250,
                                     minWidth:   680,
                                     minHeight:  200,
                                     create: function() {
                                         $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                                     },
                                     beforeClose: function( pEvent ) {
                                         var ok = true;
                                         if ( hasChanged() ) {
                                             // eslint-disable-next-line no-alert
                                             ok = confirm( msg( "EDITOR.UNSAVED_CHANGES" ) );
                                         }
                                         if ( !ok ) {
                                             pEvent.preventDefault();
                                         }
                                     },
                                     close: function() {
                                         if ( lSettingsChanged ) {
                                             gEditorSettings = lEditor$.codeEditor( "getPreferencesString" );
                                             // persist settings
                                             // Can't use savePreference because code editor doesn't use the same prefix as the rest of PE/PD
                                             window.gPreferences[ CODE_EDITOR_PREF_NAME ] = gEditorSettings;

                                             server.process (
                                                 "setPreference", {
                                                     x01: CODE_EDITOR_PREF_NAME,
                                                     x02: gEditorSettings
                                                 }, {
                                                     dataType: "" // don't expect any data back
                                                 }
                                             );
                                             //
                                             // we do not save the editor size as a preference, as the ORDER BY clause
                                             // dialog is much smaller by nature
                                             //
                                         }
                                         lEditorDlg$.dialog( "destroy" ).remove(); // remove causes code editor go get destroyed as well
                                     },
                                     open: function() {
                                         var lValue = lActiveExpr$.val();
                                         lValue = $.isEmptyObject(lValue) ? "" : lValue; // Check if lValue is empty object (meaning VALUE_VARIES was returned)

                                         lEditor$ = $( "#" + lCodeEditorId ).codeEditor( $.extend( {
                                             language:          "sql",
                                             autofocus:         true,
                                             readOnly:          prop.metaData.isReadOnly,
                                             value:             lValue,
                                             codeComplete: function( pOptions, pCallback ) {
                                                 server.process ( "getCodeCompleteList", {
                                                     p_widget_name: pOptions.type,
                                                     x01: pOptions.search,
                                                     x02: pOptions.parent,
                                                     x03: pOptions.grantParent
                                                 }, {
                                                     success: pCallback
                                                 });
                                             },
                                             suggestions:  function() {
                                                 const PAGE_ITEM_TITLE = model.getComponentType( model.COMP_TYPE.PAGE_ITEM ).title.plural;
                                                 var lPageItems = model.getComponents( model.COMP_TYPE.PAGE_ITEM, {}, true ),
                                                     lItemName,
                                                     lItemLabelProp,
                                                     lSuggestions = [];

                                                 for ( let i = 0; i < lPageItems.length; i++ ) {
                                                     lItemName = lPageItems[ i ].getProperty( model.PROP.ITEM_NAME ).getValue();
                                                     lItemLabelProp = lPageItems[ i ].getProperty( model.PROP.ITEM_LABEL );
                                                     lSuggestions.push({
                                                         label:      lItemName + ( lItemLabelProp ? " (" + lItemLabelProp.getValue() + ")" : "" ),
                                                         insertText: lItemName,
                                                         detail:     PAGE_ITEM_TITLE
                                                     });
                                                 }
                                                 return lSuggestions;
                                             },
                                             pageInfo: {
                                                 pageId: model.getCurrentPageId(),
                                                 items: [
                                                     ...model.getComponents( model.COMP_TYPE.PAGE_ITEM, {}, true ),
                                                     ...model.getComponents( model.COMP_TYPE.FACET, {}, true ),
                                                     ...model.getComponents( model.COMP_TYPE.FACET_GROUP_ITEM, {}, true ),
                                                 ].map( item => ({
                                                     name: item.getProperty( model.PROP.ITEM_NAME ).getValue(),
                                                     type: item.getProperty( model.PROP.ITEM_TYPE ).getValue()
                                                 })),
                                                 regions:
                                                     model.getComponents( model.COMP_TYPE.REGION, {}, true )
                                                         .map( region => ({
                                                             staticId: region.getProperty( model.PROP.DOM_STATIC_ID ).getValue(),
                                                             type: region.getProperty( model.PROP.REGION_TYPE ).getValue(),
                                                         }))
                                                         .filter( ( { staticId } ) => staticId && staticId.length && !/^\d+$/.test( staticId ) )
                                             },
                                             validatePageItems: true,
                                             preferencesChanged: function() {
                                                 lSettingsChanged = true;
                                             },
                                             onInitialized: function() {
                                                 updateChangeGeneration();
                                             }
                                         }, $.apex.codeEditor.preferencesObjectFromString( gEditorSettings ) ) );
                                         //
                                         // set initial size to match dialog
                                         //
                                         lEditor$
                                             .height( $( this ).height() )
                                             .width( $( this ).closest( ".ui-dialog" ).width() - 2 );
                                     },
                                     resizeStop: function( event, ui ) {
                                         // when dialog resizes so must the editor widget
                                         lEditor$.height( lEditorDlg$.height() )
                                             .width( ui.size.width - 2 )
                                             .trigger( "resize" );
                                     },
                                     buttons: lButtons
                                 });
                            }); // openDialog
                    }
                    this.addLabelClickHandler( pElement$, prop );
                }, // init
                setFocus: function( pElement$ ) {
                    pElement$.find( ":input:first" ).trigger( "focus" );
                },
                getValue: function ( pProperty$ ) {
                    var lExpr$, lKey$, lDisp$,
                        lObject = [];

                    pProperty$.find( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).each( function() {

                        lExpr$ = $( this ).find( ":input." + ORDERBY_DIALOG_CLAUSE_EXPR );
                        lDisp$ = $( this ).find( ":input." + ORDERBY_DIALOG_CLAUSE_DISPLAY );
                        lKey$ =  $( this ).find( ":input." + ORDERBY_DIALOG_CLAUSE_KEY );

                        //
                        if ( lKey$ && lKey$.val() && lKey$.val() !== "" ) {
                            lObject.push( { key: lKey$.val(), expr: lExpr$.val(), display: lDisp$.val() } );
                        }
                    });
                    return lObject;
                },
                _renderOrderBysRow: function ( out, pOptions ) {
                    var lItemExprId, lItemKeyId, lItemDisplayId,
                        lOptions = $.extend( {
                            rowId:      "",
                            lastRow:    false,
                            idPrefix:   "",
                            errorMsg:   "",
                            name:       "",
                            value:      "",
                            readOnly:   false
                        }, pOptions );

                    lItemExprId    = lOptions.idPrefix + "_expr"     + lOptions.rowId;
                    lItemKeyId     = lOptions.idPrefix + "_key_"     + lOptions.rowId;
                    lItemDisplayId = lOptions.idPrefix + "_display_" + lOptions.rowId;

                    out.markup( "<tr" )
                        .attr( "class", LINK_DIALOG_SET_ITEMS_ROW_DATA )
                        .markup( ">" );
                    out.markup( "<td" )
                       .attr( "style", "vertical-align: bottom" )
                       .markup( ">" );

                    if ( lOptions.errorMsg !== "" ) {
                        out.markup( "<span" )
                            .attr( "class", "a-Icon icon-error" )
                            .attr( ARIA_HIDDEN, true )
                            .markup( "></span>" );
                        out.markup( "<span" )
                            .attr( "class", VISUALLY_HIDDEN )
                            .markup( ">" )
                            .content( lOptions.errorMsg )
                            .markup( "</span>" );
                    }
                    this.renderBaseInput( out, {
                        id:         lItemExprId,
                        value:      lOptions.expression,
                        inputClass: [ ORDERBY_DIALOG_CLAUSE_EXPR, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "ORDER_BY_ITEM.EXPRESSION_N", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                       .attr( "style", "vertical-align: bottom" )
                       .markup( ">" );
                    this.renderIconButton( out, {
                        id:             lOptions.idPrefix + "_rowCodeEditor_" + lOptions.rowId,
                        icon:           ICON_EDIT_DIALOG,
                        text:           format( "ORDER_BY_ITEM.OPEN_CODE_EDITOR_EXPR_N", lOptions.rowId ),
                        disabled:       lOptions.readOnly
                    } );
                    out.markup( "</td>" );

                    out.markup( "<td" )
                       .attr( "style", "vertical-align: bottom" )
                       .markup( ">" );
                    this.renderBaseInput( out, {
                        id:         lItemKeyId,
                        value:      lOptions.key,
                        inputClass: [ ORDERBY_DIALOG_CLAUSE_KEY, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "ORDER_BY_ITEM.KEY_N", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );

                    out.markup( "<td" )
                       .attr( "style", "vertical-align: bottom" )
                       .attr( "class", ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                       .markup( ">" );
                    this.renderBaseInput( out, {
                        id:         lItemDisplayId,
                        value:      lOptions.display,
                        inputClass: [ ORDERBY_DIALOG_CLAUSE_DISPLAY, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "ORDER_BY_ITEM.DISPLAY_N", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "style", "vertical-align: bottom" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE_REMOVE_COL )
                        .markup( ">" );
                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_rowRemove_" + lOptions.rowId,
                        icon:       ICON_REMOVE,
                        text:       format( "ORDER_BY_ITEM.REMOVE_CLAUSE_N", lOptions.rowId ),
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE_REMOVE_COL + " " + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                        .attr( "style", "vertical-align: bottom" )
                        .markup( ">" );
                   // Move Up
                    if ( lOptions.rowId > 1 ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveUp_" + lOptions.rowId,
                            icon:       ICON_MOVE_UP,
                            text:       format( "ORDER_BY_ITEM.MOVE_UP_CLAUSE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "style", "vertical-align: bottom" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE_REMOVE_COL + " " + ORDERBY_DIALOG_CLAUSE_SHOW_STATIC_LOV )
                        .markup( ">" );

                    // Move Down
                    if ( !lOptions.lastRow ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveDown_" + lOptions.rowId,
                            icon:       ICON_MOVE_DOWN,
                            text:       format( "ORDER_BY_ITEM.MOVE_DOWN_CLAUSE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "</td>" );
                    out.markup( "</tr>" );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLACEHOLDER_JSON, {

                _getButtonText: function( pPlaceholdersJsonText ) {
                    var lPlaceHolderJSON, lPlaceholderCount, lButtonText,
                        lEmptyCount       = 0;

                    try {
                        lPlaceHolderJSON = JSON.parse( pPlaceholdersJsonText );
                    } catch ( e ) {
                        lPlaceHolderJSON = {};
                    }
                    lPlaceholderCount = Object.keys( lPlaceHolderJSON ).length;

                    // find empty assignments
                    Object.keys( lPlaceHolderJSON ).forEach( function( key ) {
                                                                 if ( lPlaceHolderJSON[key] === "" ) {
                                                                     lEmptyCount = lEmptyCount + 1;
                                                                 } } );

                    if ( lPlaceholderCount === 0 ) {
                        lButtonText = msg( "TEMPLATE_PLACEHOLDERS.NONE_DEFINED" );
                    } else if ( lPlaceholderCount === 1 && lEmptyCount === 1 ) {
                        lButtonText = msg( "TEMPLATE_PLACEHOLDERS.ONE_EMPTY_PLACEHOLDER" );
                    } else if ( lPlaceholderCount === 1 && lEmptyCount === 0 ) {
                        lButtonText = msg( "TEMPLATE_PLACEHOLDERS.ONE_PLACEHOLDER" );
                    } else {
                        lButtonText = format( 'TEMPLATE_PLACEHOLDERS.PLACEHOLDERS', lPlaceholderCount, lEmptyCount );
                        lEmptyCount = lEmptyCount + 1;
                    }
                    return lButtonText;
                },
                _getDisplayGroupAssignItems: function ( pProperties ) {
                    return {
                        displayGroupId:     PLACEHOLDER.DISPLAY_GROUP.ASSIGN_ITEMS,
                        displayGroupTitle:  msg( "TEMPLATE_PLACEHOLDERS.ASSIGN_ITEMS" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getPropertyPlaceholderJsonItems: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           PLACEHOLDER.PROP.SET_ITEMS,
                        value:                  pProperty,
                        metaData: {
                            type:               PROP_TYPE.PLACEHOLDER_JSON_ITEMS,
                            prompt:             msg( "TEMPLATE_PLACEHOLDERS.ITEMS" ),
                            displayGroupId:     PLACEHOLDER.DISPLAY_GROUP.ASSIGN_ITEMS,
                            originalProperty:   pOriginalProperty
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },

                /* Property type properties and callbacks */
                noLabel: true,
                render: function( out, id, prop /*, lastComponents */ ) {

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, this._getButtonText( prop.value ) );
                    this.renderDivClose( out );
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    var lDisplayValue;

                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    lDisplayValue = this._getButtonText( pValue );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop, lastComponents ) {
                    var that = this;

                    this.addLabelClickHandler( pElement$, prop );
                    this.addTooltipsForErrors( pElement$, prop );

                    // the main click handler that launches the placeholders dialog
                    pElement$.closest( "div." + PROPERTY ).on( "click", "#" + pElement$.attr( "id" ), function() {
                        var lPlaceholderDlg$,
                            out = util.htmlBuilder(),
                            lPropertySet = [],
                            lPlaceHoldersReadOnly = prop.metaData.isReadOnly;


                        function _getProperty ( pPropertyName ) {
                            var lProperty;
                            for ( let i = 0; i < lPropertySet.length; i++ ) {
                                for ( let j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                    if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                        lProperty = lPropertySet[ i ].properties[ j ];
                                        break;
                                    }
                                }
                            }
                            return lProperty;
                        }

                        lPropertySet.push (
                            that._getDisplayGroupAssignItems( [
                                that._getPropertyPlaceholderJsonItems({
                                        value: prop.value,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );

                        // create dialog div
                        out.markup( "<div" )
                            .attr( "id", "placeholderDlg" )
                            .attr( "title", msg( "TEMPLATE_PLACEHOLDERS.TITLE" ) )
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "placeholderDlgPE" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lPlaceholderDlg$ = $( out.toString() ).dialog( {
                            modal:          true,
                            closeText:      lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            minWidth:       400,
                            width:          520,
                            dialogClass:    DIALOG_FLUSH_BODY,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            close: function() {
                                $( "#placeholderDlgPE" ).propertyEditor( "destroy" );
                                lPlaceholderDlg$.dialog( "destroy" );
                            },
                            open: function() {
                                function _showProperties( pValue ) {
                                    var lProperty = {
                                        value: pValue,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    };

                                    lPlaceholderDlgPE$.propertyEditor( "addProperty", {
                                        property:           that._getPropertyPlaceholderJsonItems( lProperty, prop ),
                                        displayGroup:       that._getDisplayGroupAssignItems()
                                    });
                                }

                                var lPlaceholderDlgPE$ = $( "#placeholderDlgPE" );
                                lPlaceholderDlgPE$.propertyEditor( {
                                    focusPropertyName: PLACEHOLDER.PROP.SET_ITEMS,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false,
                                        lastComponents: lastComponents
                                    },
                                    change: function( pEvent, pData ) {
                                        if ( pData.propertyName === PLACEHOLDER.PROP.SET_ITEMS ) {
                                            _showProperties( _getProperty( PLACEHOLDER.PROP.SET_ITEMS ).value );
                                        }

                                        // fixes issue where new properties added have stale values in lPropertySet
                                        _getProperty( pData.propertyName ).value = pData.property.value;
                                    }
                                });
                                _showProperties( _getProperty( PLACEHOLDER.PROP.SET_ITEMS ).value );

                                $( "#placeholderDlg" ).dialog({
                                    position: { 'my': 'center', 'at': 'center', of: window  }
                                });
                            },
                            buttons: [
                                {
                                    text:       msg( "CANCEL" ),
                                    click:      function() {
                                        lPlaceholderDlg$.dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "OK" ),
                                    "class":      BUTTON_HOT,
                                    disabled:   lPlaceHoldersReadOnly,
                                    click:      function() {
                                        var lPropValue = _getProperty( PLACEHOLDER.PROP.SET_ITEMS ).value;

                                        if ( typeof lPropValue === "object" ) {
                                            that.setValue( pElement$, prop, JSON.stringify( lPropValue ) );
                                        } else {
                                            that.setValue( pElement$, prop, lPropValue );
                                        }

                                        pElement$.trigger( "change" );
                                        that.setFocus( pElement$ );
                                        lPlaceholderDlg$.dialog( "close" );
                                    }
                                }
                            ]
                        });
                    });
                }
            } );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLACEHOLDER_JSON_ITEMS, {
                stacked:        true,
                noLabel:        true,
                labelVisible:   false,
                minHeight:      200,
                maxHeight:      500,
                //
                render: function( out, id, prop /*, lastComponents */ ) {
                    var lLabelId    = id + "_label",
                        self        = this,
                        lPropJson, lRow;

                    out.markup( "<div" )
                        .attr( "id", id )
                        .attr( "class", PROPERTY_FIELD_CONTAINER )
                        .attr( ARIA_LABELLEDBY, lLabelId )
                        .attr( ATTR_ROLE, ROLE_GROUP )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .markup( ">" );

                    out.markup( "<table" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE )
                        .markup( ">" )
                        .markup( "<caption" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "TEMPLATE_PLACEHOLDERS.ASSIGN_ITEMS" ) )
                        .markup( "</caption>" )
                        .markup( "<tr>" )
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "TEMPLATE_PLACEHOLDERS.NAME" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_SET_ITEMS_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "TEMPLATE_PLACEHOLDERS.VALUE" ) )
                        .markup( "</th>")
                        .markup( "<th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.VALUE_LIST_OF_VALUES" ) )
                        .markup( ">" )
                        .markup( "</th>" )
                        .markup( "<th" )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "LINK.REMOVE" ) )
                        .markup( "</th>" )
                        .markup( "</tr>" );

                    lPropJson = JSON.parse( prop.value );
                    lRow      = 1;

                    Object.keys(lPropJson).forEach( function(key) {
                        self._renderPlaceholdersRow( out, {
                            rowId:      lRow,
                            idPrefix:   id,
                            name:       key,
                            value:      lPropJson[key],
                            readOnly:   prop.metaData.isReadOnly
                        });
                        lRow = lRow + 1;
                    });

                    // If the property is currently editable, render an additional row for new items
                    if ( !prop.metaData.isReadOnly ) {
                        self._renderPlaceholdersRow( out, {
                            rowId:      lRow,
                            idPrefix:   id
                        });
                    }
                    out.markup( "</table>" );

                    this.renderDivClose( out );
                },
                init: function( pElement$, prop, lastComponents ) {
                    let isWorkflow = lastComponents.some( component => model.isSharedDesignerComponent( component.typeId ) );
                    let lOptions = {
                        columnDefinitions: [
                            {
                                name:        "name",
                                title:       msg( "NAME" ),
                                alignment:   "left",
                                isRowHeader: true,
                            },
                            {
                                name:      "label",
                                title:     msg( "LABEL" ),
                                alignment: "left"
                            }
                        ],
                        filterLov: function ( pFilters, pRenderLovEntries ) {
                            var lType = "page",
                                lPageId, lCompId, currentWorkflow, currentVersion;

                            switch ( pFilters.scope ) {
                                case "application":
                                    lType   = "application";
                                    lPageId = "";
                                    break;
                                case "current_page":
                                    lPageId = model.getCurrentPageId();
                                    break;
                                case "global_page":
                                    lPageId = model.getGlobalPageId();
                                    break;
                                case "custom_page":
                                    lPageId = pFilters.customPageNumber;
                                    break;
                                case WF_PARAMS:
                                    lType   = WF_PARAMS;
                                    currentWorkflow = getParentOfType( lastComponents[0], model.COMP_TYPE.WORKFLOW );
                                    lCompId = currentWorkflow?.id;
                                    break;
                                case VS_VARS:
                                    lType   = VS_VARS;
                                    currentVersion = getParentOfType( lastComponents[0], model.COMP_TYPE.WORKFLOW_VERSION );
                                    lCompId = currentVersion?.id;
                                    break;
                                case ACT_VARS:
                                    lType   = ACT_VARS;
                                    lCompId = lastComponents[0].id;
                                    break;
                            }

                            if ( [ WF_PARAMS, VS_VARS, ACT_VARS ].includes( pFilters.scope ) ) {
                                model.getWorkflowLov( {
                                    type:   lType,
                                    componentId: lCompId
                                }, function( pLovEntries ){
                                    pRenderLovEntries( pLovEntries, pFilters.search );
                                } );
                            } else {
                                // placeholder values property types do not support multi-edit, so we can just look at the
                                // first selected to determine the current component type.
                                model.getItemsLov( {
                                    type:       lType,
                                    component:  lastComponents[ 0 ],
                                    pageId:     lPageId
                                },
                                function( pLovEntries ){
                                    pRenderLovEntries( pLovEntries, pFilters.search );
                                });
                            }


                        },
                        multiValue: false,
                        dialogTitle: formatNoEscape( "PICK", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                    };

                    function openLovDialog( pReturnElement ) {
                        var out = util.htmlBuilder(),
                            lFilters = lOptions.filters;

                        out.markup( "<div" )
                            .attr( "id", "lovDlg" )
                            .attr( "title", lOptions.dialogTitle )
                            .markup( ">" )
                            .markup( "</div>" );

                        $( out.toString() ).lovDialog({
                            modal:             true,
                            minWidth:          520,
                            height:            500,
                            filters:           lFilters,
                            columnDefinitions: lOptions.columnDefinitions,
                            filterLov:         lOptions.filterLov,
                            dialogClass:       DIALOG_FLUSH_BODY,
                            resizable:         false,
                            multiValue:        lOptions.multiValue,
                            valueSelected: function( pEvent, pData ) {

                                var lValue = pData[ lOptions.columnDefinitions[ 0 ].name ],
                                    lReturnElement$ = $( "#" + pReturnElement );

                                if ( pData.valueFormatting && typeof pData.valueFormatting === "function" ) {
                                    lValue = pData.valueFormatting( lValue );
                                }

                                lReturnElement$
                                    .val( lValue )
                                    .trigger( "change" );
                            }
                        });
                    }

                    var that = this,
                        lProperty$ = pElement$.closest( "div." + PROPERTY ),
                        lId = pElement$.attr( "id" );

                    // Only add interactivity if property is editable
                    if ( !prop.metaData.isReadOnly ) {
                        lProperty$
                            .on( "change", "input." + LINK_DIALOG_ITEM_NAME + ":last", function() {
                                var lNewRow = util.htmlBuilder(),
                                    lDeleteButton = util.htmlBuilder(),
                                    lLastNameInput$ = $( this );

                                if ( lLastNameInput$.val() ) {
                                    var lCurrentRow = $( "input." + LINK_DIALOG_ITEM_NAME ).length;
                                    that._renderPlaceholdersRow( lNewRow, {
                                        rowId:      lCurrentRow + 1,
                                        idPrefix:   lId
                                    });
                                    that.renderIconButton( lDeleteButton, {
                                        id:     lId + "_rowRemove_" + lCurrentRow,
                                        icon:   ICON_REMOVE,
                                        text:   format( "LINK.REMOVE_ITEM_N", lCurrentRow )
                                    });
                                    lLastNameInput$
                                        .closest( "tr" )
                                        .find( "td:last" )
                                        .html( lDeleteButton.toString())
                                        .end()
                                        .after( lNewRow.toString());
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowRemove_]", function() {
                                var lNewInput$ = $( this )
                                    .closest( "tr" )
                                    .next( "tr" )
                                    .find( ":input:first" );

                                $( this )
                                    .closest( "tr" )
                                    .remove();
                                lNewInput$
                                    .trigger( "change" )
                                    .trigger( "focus" );
                            })
                            .on( "click", "button[id^=" + lId + "_valueLovBtn_]", function() {

                                function ampersandPeriodEnquote( pValue ) {
                                    return "&" + model.enquoteIdentifier( pValue ) + ".";
                                }

                                lOptions.filters = [
                                    {
                                        name:           "scope",
                                        title:          msg( "ITEM_SCOPE" ),
                                        type:           "buttonset",
                                        defaultValue:   !isWorkflow ? "current_page" : WF_PARAMS,
                                        lov: [
                                            {
                                                display: msg( "CURRENT_PAGE" ),
                                                value:   "current_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "CUSTOM_PAGE" ),
                                                value:   "custom_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                },
                                                filters: [
                                                    {
                                                        name:       "customPageNumber",
                                                        title:      msg( "PAGE_NUMBER" ),
                                                        type:       "text",
                                                        isRequired: true
                                                    }
                                                ]
                                            },
                                            {
                                                display: msg( "GLOBAL_PAGE" ),
                                                value:   "global_page",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "APPLICATION" ),
                                                value:   "application",
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },{
                                                display: msg( "WF.PARAMS" ),
                                                value:   WF_PARAMS,
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "WF.VERSION_VARS" ),
                                                value:   VS_VARS,
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            },
                                            {
                                                display: msg( "WF.ACT_VARS" ),
                                                value:   ACT_VARS,
                                                valueFormatting: function( pValue ){
                                                    return ampersandPeriodEnquote( pValue );
                                                }
                                            }
                                        ]
                                    },
                                    {
                                        name:  "search",
                                        title: msg( "SEARCH" ),
                                        type:  "search"
                                    }
                                ];

                                if ( isWorkflow ) {
                                    prop.metaData.lovComponentScope = "WORKFLOW";
                                }

                                if ( prop.metaData.lovComponentScope === "WORKFLOW" ) {
                                    let lOptionsFilters = lOptions.filters;
                                    for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                                        if ( lOptionsFilters[ i ].name === "scope" ) {
                                            let lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                            for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                                if ( $.inArray( lOptionsFiltersLov[ j ].value, [ WF_PARAMS, VS_VARS, ACT_VARS ] ) === -1 ) {
                                                    lOptionsFiltersLov.splice( j, 1 );
                                                    j -= 1;
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    let lOptionsFilters = lOptions.filters;
                                    for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                                        if ( lOptionsFilters[ i ].name === "scope" ) {
                                            let lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                            for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                                if ( $.inArray( lOptionsFiltersLov[ j ].value, [ WF_PARAMS, VS_VARS, ACT_VARS ] ) > -1 ) {
                                                    lOptionsFiltersLov.splice( j, 1 );
                                                    j -= 1;
                                                }
                                            }
                                        }
                                    }
                                }

                                openLovDialog( $( this ).data( "for" ) );

                            });
                    }

                    this.addLabelClickHandler( pElement$, prop );
                },
                setFocus: function( pElement$ ) {
                    pElement$.find( ":input:first" ).trigger( "focus" );
                },
                getValue: function ( pProperty$ ) {
                    var lName$, lValue$, lObject = {};

                    pProperty$.find( "tr." + LINK_DIALOG_SET_ITEMS_ROW_DATA ).each( function() {

                        lName$ = $( this ).find( ":input." + LINK_DIALOG_ITEM_NAME );
                        lValue$ = $( this ).find( ":input." + LINK_DIALOG_ITEM_VALUE );

                        //
                        // if duplicate placeholders are defined, only the first one is taken
                        // into account.
                        if ( lName$.val() !== "" && !hasOwnProperty( lObject, lName$.val() ) ) {
                            lObject[ lName$.val() ] = lValue$.val();
                        }
                    });

                    return lObject;
                },
                _renderPlaceholdersRow: function ( out, pOptions ) {
                    var lItemNameId, lItemValueId,
                        lOptions = $.extend( {
                            rowId:      "",
                            idPrefix:   "",
                            name:       "",
                            value:      "",
                            readOnly:   false
                        }, pOptions );

                    lItemNameId = lOptions.idPrefix + "_name_" + lOptions.rowId;
                    lItemValueId = lOptions.idPrefix + "_value_" + lOptions.rowId;

                    out.markup( "<tr" )
                        .attr( "class", LINK_DIALOG_SET_ITEMS_ROW_DATA )
                        .markup( ">" );
                    out.markup( "<td>" );
                    this.renderBaseInput( out, {
                        id:         lItemNameId,
                        value:      lOptions.name,
                        inputClass: [ LINK_DIALOG_ITEM_NAME, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "LINK.ITEM_N_NAME", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );

                    out.markup( "<td>" );
                    this.renderBaseInput( out, {
                        id:         lItemValueId,
                        value:      lOptions.value,
                        inputClass: [ LINK_DIALOG_ITEM_VALUE, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "LINK.ITEM_N_VALUE", lOptions.rowId )
                        }
                    });
                    out.markup( "</td>" );
                    out.markup( "<td>" );
                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_valueLovBtn_" + lOptions.rowId,
                        icon:       ICON_LOV,
                        text:       format( "LINK.ITEM_N_VALUE_LOV", lOptions.rowId ),
                        dataFor:    lItemValueId,
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td>" );
                    out.markup( "<td" )
                        .attr( "class", PROPERTY_SET_ITEMS_TABLE_REMOVE_COL )
                        .markup( ">" );

                    // If we have an item name, then we also want to render the remove icon for that row
                    if ( lOptions.name ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowRemove_" + lOptions.rowId,
                            icon:       ICON_REMOVE,
                            text:       format( "LINK.REMOVE_ITEM_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "</tr>" );
                }
            });

            /*
             * Enhanced text area adds external editing of text in a a code mirror based editor
             */
            var DLG_MARGIN = 40,
                CODE_EDITOR_PREF_NAME = "CODE_EDITOR_SETTINGS";

            var gChangeGeneration = -1;

            var gEditorDlgWidth, gEditorDlgHeight, gEditorSettings;

            const createTextMessageButton = function( out, id, addContainer = false ) {
                this.renderIconButton( out, {
                    id:              id + "_messageHelperBtn",
                    icon:            "a-Icon icon-language",
                    text:            msg( "TEXT_MESSAGES" ),
                    ariaDescribedby: id + "_label",
                    ariaControls:    id,
                    isMenuButton:    false,
                    addContainer
                } );
            };

            const createTextMessageDialog = function( prop, el$, lastComponents ) {
                const that = this;
                const dialogEl$ = $( `<div id="lovDlg" title="${util.escapeHTMLAttr( msg( "TEXT_MESSAGES" ) )}"></div>` );
                dialogEl$.lovDialog( {
                    modal: true,
                    minWidth: 520,
                    height: 500,
                    dialogClass: DIALOG_FLUSH_BODY,
                    resizable: true,
                    multiValue: false,
                    resultsDisplay: "table",
                    columnDefinitions: [ {
                        name: "r",
                        title: msg( "MESSAGE_NAME" ),
                        isRowHeader: true,
                    }, {
                        name: "d",
                        title: msg( "MESSAGE_TEXT" ),
                    } ],
                    filters:           [ {
                        name: "search",
                        title: msg( "SEARCH"),
                        type: "search",
                    } ],
                    filterLov: ( filters, renderLovEntries ) => {
                        pd.applicationMessages( null, true ).then( function( messages ) {
                            renderLovEntries( messages, filters.search );
                        } );
                    },
                    valueSelected: ( event, data ) => {
                        let newValue = typeof prop.value === "string" ? prop.value : "";
                        let { r: value, placeholders } = data;
                        if ( value !== "" ) {
                            // parameters are not supported with the "old" syntax
                            if ( placeholders.length > 0 ) {
                                placeholders.forEach( p => {
                                    value = `${value} ${p[1]}=""`;
                                } );
                            }
                            value = `&{${value}}.`;
                            newValue = newValue ? `${newValue}${value}` : value;
                        } else {
                            return;
                        }
                        // set the property value, without updating the preview (that will be done after the change event)
                        that.setValue( el$, prop, newValue, lastComponents, false );
                        el$.trigger( "change" );
                    }
                } );
            };

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.TEXT_EDITOR, {

                render: function( out, id, prop, lastComponents ) {
                    this.super( "render", out, id, prop, lastComponents, true );
                },

                init: function( pElement$, prop, lastComponents ) {
                    var lProperty$,
                        that = this,
                        id = pElement$.attr( "id" ),
                        lModalButton$ = $( "#" + id + "_modalBtn" );

                    const metaData = prop.metaData;
                    if ( model.getCompatibilityMode() >= 24.2
                        && pd.textMessagesPickerEnabled
                        && !metaData.isReadOnly
                        && metaData.isTranslatable
                        && metaData.supportsSubstitution
                     ) {
                        let out = util.htmlBuilder();
                        createTextMessageButton.call( this, out, id );
                        let btn$ = $( out.toString() ).insertBefore( lModalButton$ );
                        btn$.on( "click", () => {
                            createTextMessageDialog.call( this, prop, pElement$, lastComponents );
                        } ); ;
                    }

                    // xxx todo I think opening in text editor should only be allowed when editing a single component
                    // (gLastComponents.length === 1 perhaps the same is true for editing in a dialog. The text editor
                    // does NOT support multi edit!
                    // for now just edit the first component

                    // call base textarea init
                    this.super( "init", pElement$, prop, lastComponents );

                    lModalButton$.on( "click", function openDialog() {
                        var lEditorDlg$, lEditor$, lDlgHeight, lDlgWidth,
                            lValidateFunction, lDialogSaveFunction, lQueryBuilderFunction, // must be undefined
                            lLanguage = "plaintext",
                            lSettingsChanged = false,
                            lButtons = [],
                            lProperty = lastComponents[ 0 ].getProperty( prop.propertyName ), // todo If multiple components are selected should we show errors at all?
                            out = util.htmlBuilder();

                        function updateChangeGeneration() {
                            gChangeGeneration = lEditor$.codeEditor( "changeGeneration" );
                            debug.trace( "Editor: update change generation: " + gChangeGeneration );
                        }

                        function hasChanged() {
                            return !lEditor$.codeEditor( "isClean", gChangeGeneration );
                        }

                        function setEditorValueToElement() {
                            // recompute element reference in case it has become stale. see 34263099
                            $( "#" + pElement$.attr( "id" ) ).val( lEditor$.codeEditor( "getValue" ) ).change();
                        }

                        function showEditorSaveSuccess( response = {} ) {
                            if ( !response.error ) {
                                lEditor$.codeEditor( "showSuccessNotification", lang.getMessage( "PD.CHANGES_SAVED" ) );
                            }
                        }

                        switch ( prop.metaData.type ) {
                            case model.PROP_TYPE.FILE_URLS_JAVASCRIPT:
                                lLanguage = $.apex.codeEditor.LANG_FILE_URLS_JAVASCRIPT;
                                break;
                            case model.PROP_TYPE.FILE_URLS_CSS:
                                lLanguage = $.apex.codeEditor.LANG_FILE_URLS_CSS;
                                break;
                            case model.PROP_TYPE.CSS:
                                lLanguage = $.apex.codeEditor.LANG_CSS;
                                break;
                            case model.PROP_TYPE.HTML:
                                lLanguage = $.apex.codeEditor.LANG_HTML;
                                break;
                            case model.PROP_TYPE.JAVASCRIPT:
                                lLanguage = $.apex.codeEditor.LANG_JAVASCRIPT;
                                break;
                            case model.PROP_TYPE.MLE_JS:
                            case model.PROP_TYPE.MLE_JS_EXPR_VARCHAR:
                            case model.PROP_TYPE.MLE_JS_EXPR_BOOLEAN:
                            case model.PROP_TYPE.MLE_JS_EXPR_CUSTOM:
                            case model.PROP_TYPE.MLE_JS_FUNC_VARCHAR:
                            case model.PROP_TYPE.MLE_JS_FUNC_CLOB:
                            case model.PROP_TYPE.MLE_JS_FUNC_BOOLEAN:
                            case model.PROP_TYPE.MLE_JS_FUNC_CUSTOM:
                            case model.PROP_TYPE.MLE_JS_FUNC_SQL:
                                lLanguage = $.apex.codeEditor.LANG_JAVASCRIPT_MLE_SNIPPET;
                                break;
                            case model.PROP_TYPE.XML:
                                lLanguage = $.apex.codeEditor.LANG_XML;
                                break;
                            case model.PROP_TYPE.SQL:
                                lLanguage = $.apex.codeEditor.LANG_SQL;
                                break;
                            case model.PROP_TYPE.SQL_EXPR:
                            case model.PROP_TYPE.SQL_EXPR_BOOLEAN:
                            case model.PROP_TYPE.SQL_EXPR_CUSTOM:
                            case model.PROP_TYPE.WHERE_CLAUSE:
                            case model.PROP_TYPE.PLSQL:
                            case model.PROP_TYPE.PLSQL_EXPR_VARCHAR:
                            case model.PROP_TYPE.PLSQL_EXPR_BOOLEAN:
                            case model.PROP_TYPE.PLSQL_EXPR_CUSTOM:
                            case model.PROP_TYPE.PLSQL_FUNC_VARCHAR:
                            case model.PROP_TYPE.PLSQL_FUNC_CLOB:
                            case model.PROP_TYPE.PLSQL_FUNC_BOOLEAN:
                            case model.PROP_TYPE.PLSQL_FUNC_CUSTOM:
                            case model.PROP_TYPE.PLSQL_FUNC_SQL:
                                lLanguage = $.apex.codeEditor.LANG_PLSQL;
                                break;
                        }

                        // Add buttons depending on the property type
                        lButtons.push({
                            text:  msg( "CANCEL" ),
                            click: function() {
                                lEditorDlg$.dialog( "close" );
                            }
                        });

                        if ( prop.metaData.type === model.PROP_TYPE.SQL ) {
                            lQueryBuilderFunction = function( editor ) {
                                nav.popup({
                                    url: util.makeApplicationUrl({
                                        appId:      4500,
                                        pageId:     1002,
                                        clearCache: 1002,
                                        itemNames:  [ "P1002_RETURN_INTO", "P1002_POPUP", "P1002_SCHEMA" ],
                                        itemValues: [ editor.baseId, "1", model.getParsingSchema() ]
                                    }),
                                    width:  950,
                                    height: 720
                                });
                            };
                        }

                        if ( ( [ "sql", "plsql" ].includes( lLanguage )   ||
                             ( lLanguage === "html" && prop.metaData.supportsTemplateDirective ) ||
                             ( prop.metaData.type.endsWith( "FUNCTION BODY SQL" ) ) ) &&
                             !prop.metaData.isReadOnly )
                        {
                            lValidateFunction = function( code, callback ) {
                                var lResult = lProperty.validate( code ); // xxx todo this should be async
                                callback( lResult );
                            };
                        }

                        lDialogSaveFunction = function( event, focusElement, run ) {

                            // check if there is a validation function
                            if ( lEditor$.codeEditor( "option", "validateCode") ) {
                                // execute the validation
                                lEditor$.codeEditor( "validateCode" );
                                // stop if any warnings/errors
                                if ( lEditor$.codeEditor( "option", "warnings" ).length || lEditor$.codeEditor( "option", "errors" ).length ) {
                                    return;
                                }
                            }
                            // set the changes to the property editor element
                            setEditorValueToElement();
                            // set the changed flag
                            updateChangeGeneration();
                            // clear the editor notifications
                            lEditor$.codeEditor( "resetNotification" );

                            if ( run ) {
                                apex.actions.invoke( "pd-save-run-page", event , focusElement, { afterSaveCallback: showEditorSaveSuccess } );
                            } else {
                                apex.actions.invoke( "pd-save-page", event, focusElement, {
                                    suppressSuccessMessage: true,
                                    afterSaveCallback: showEditorSaveSuccess
                                } );
                            }

                        };

                        lButtons.push({
                            text:  msg( "OK" ),
                            "class": BUTTON_HOT,
                            click: function() {
                                setEditorValueToElement();
                                updateChangeGeneration();
                                lEditorDlg$.dialog( "close" );
                            }
                        });

                        // open and setup a simple wrapper dialog
                        out.markup( "<div" )
                            .attr( "id", "editorDlg" )
                            .attr( "title", formatNoEscape( "CODE_EDITOR.TITLE", prop.metaData.prompt )) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "editorDlg-codeEditor" )
                            .markup( "class='resize'>" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        // xxx maximize option?
                        // xxx sometimes the property tooltip shows up on top of the dialog
                        lDlgWidth = gEditorDlgWidth;
                        lDlgHeight = gEditorDlgHeight;
                        if ( lDlgWidth > $(window ).width() - DLG_MARGIN ) {
                            lDlgWidth = $(window ).width() - DLG_MARGIN;
                        }
                        if ( lDlgHeight > $(window ).height() - DLG_MARGIN ) {
                            lDlgHeight = $(window ).height() - DLG_MARGIN;
                        }
                        lEditorDlg$ = $( out.toString()).dialog({
                            modal:      true,
                            closeText:  lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            width:      lDlgWidth,
                            height:     lDlgHeight,
                            minWidth:   680,
                            minHeight:  400,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            beforeClose: function( pEvent ) {
                                var ok = true;
                                if ( hasChanged() ) {
                                    // eslint-disable-next-line no-alert
                                    ok = confirm( msg( "EDITOR.UNSAVED_CHANGES" ) );
                                }
                                if ( !ok ) {
                                    pEvent.preventDefault();
                                }
                            },
                            close: function() {
                                var dlg$ = lEditorDlg$.closest( ".ui-dialog" );
                                if ( lSettingsChanged ) {
                                    gEditorSettings = lEditor$.codeEditor( "getPreferencesString" );
                                    // persist settings
                                    // Can't use savePreference because code editor doesn't use the same prefix as the rest of PE/PD
                                    window.gPreferences[ CODE_EDITOR_PREF_NAME ] = gEditorSettings;

                                    server.process (
                                        "setPreference", {
                                            x01: CODE_EDITOR_PREF_NAME,
                                            x02: gEditorSettings
                                        }, {
                                            dataType: "" // don't expect any data back
                                        }
                                    );
                                }
                                // remember last dialog size for next time
                                if ( gEditorDlgWidth !== dlg$.outerWidth() ) {
                                    gEditorDlgWidth = dlg$.outerWidth();
                                    pd.savePreference( PREF_CODE_EDITOR_DLG_W, gEditorDlgWidth );
                                }
                                if ( gEditorDlgHeight !== dlg$.outerHeight() ) {
                                    gEditorDlgHeight = dlg$.outerHeight();
                                    pd.savePreference( PREF_CODE_EDITOR_DLG_H, gEditorDlgHeight );
                                }
                                lEditorDlg$.dialog( "destroy" ).remove(); // remove causes code editor go get destroyed as well
                            },
                            open: function() {
                                let lValue = that.super( "getValue", lProperty$ ); // todo Why do we have to pass in lProperty$ and not pElement$ ?
                                let ai = apex.aiHook?.aiEnabled ? {
                                    ajax: {
                                        // eslint-disable-next-line dot-notation
                                        ajaxId: apex.aiHook.ajaxId[ "codeEditor" ]
                                    }
                                } : null;
                                lValue = $.isEmptyObject(lValue) ? "" : lValue; // Check if lValue is empty object (meaning VALUE_VARIES was returned)

                                lEditor$ = $( "#editorDlg-codeEditor" ).codeEditor( $.extend( {
                                    language:          lLanguage,
                                    autofocus:         true,
                                    readOnly:          prop.metaData.isReadOnly,
                                    errors:            lProperty.errors,
                                    warnings:          lProperty.warnings,
                                    value:             lValue,
                                    ai,
                                    // callbacks
                                    codeComplete: function( pOptions, pCallback ) {

                                        // todo improve this to cache result and use model.getComponents to read local page items
                                        server.process ( "getCodeCompleteList", {
                                            p_widget_name: pOptions.type,
                                            x01: pOptions.search,
                                            x02: pOptions.parent,
                                            x03: pOptions.grantParent
                                        }, {
                                            success: pCallback
                                        });

                                    },
                                    suggestions:  function() {
                                        const PAGE_ITEM_TITLE = model.getComponentType( model.COMP_TYPE.PAGE_ITEM ).title.plural;
                                        var lPageItems = model.getComponents( model.COMP_TYPE.PAGE_ITEM, {}, true ),
                                            lItemName,
                                            lItemLabelProp,
                                            lSuggestions = [];

                                        for ( let i = 0; i < lPageItems.length; i++ ) {
                                            lItemName = lPageItems[ i ].getProperty( model.PROP.ITEM_NAME ).getValue();
                                            lItemLabelProp = lPageItems[ i ].getProperty( model.PROP.ITEM_LABEL );
                                            lSuggestions.push({
                                                label:      lItemName + ( lItemLabelProp ? " (" + lItemLabelProp.getValue() + ")" : "" ),
                                                insertText: lItemName,
                                                detail:     PAGE_ITEM_TITLE
                                            });
                                        }
                                        return lSuggestions;
                                    },
                                    pageInfo: {
                                        pageId: model.getCurrentPageId(),
                                        isPageDesigner: env.APP_ID === "4000" && env.APP_PAGE_ID === "4500",
                                        isGlobalPage: model.isGlobalPage(),
                                        isDialogPage: model.getPageTemplate()?.isDialog,
                                        shortMsgSyntaxSupported: model.getCompatibilityMode() >= 24.2,
                                        applicationMessages: pd.applicationMessages && prop.metaData.supportsSubstitution ? () => {
                                            return new Promise( ( resolve ) => {
                                                pd.applicationMessages( null, true ).then( messages => {
                                                    let result = messages.map( m => ( {
                                                        label:        m.r,
                                                        insertText:   m.r,
                                                        detail:       m.d,
                                                        isJS:         m.isJS,
                                                        placeholders: m.placeholders,
                                                    } ) );
                                                    resolve( result );
                                                } );
                                            } );
                                        } : null,
                                        items: [
                                            ...model.getComponents( model.COMP_TYPE.PAGE_ITEM, {}, true ),
                                            ...model.getComponents( model.COMP_TYPE.FACET, {}, true ),
                                            ...model.getComponents( model.COMP_TYPE.FACET_GROUP_ITEM, {}, true ),
                                        ].map( item => ({
                                            name: item.getProperty( model.PROP.ITEM_NAME ).getValue(),
                                            type: item.getProperty( model.PROP.ITEM_TYPE ).getValue()
                                        })),
                                        regions:
                                            model.getComponents( model.COMP_TYPE.REGION, {}, true )
                                                .map( region => ({
                                                    staticId: region.getPropertyValue( model.PROP.DOM_STATIC_ID ),
                                                    type: region.getProperty( model.PROP.REGION_TYPE ).getValue(),
                                                }))
                                                .filter( ( { staticId } ) => staticId && staticId.length && !/^\d+$/.test( staticId ) )
                                    },
                                    validatePageItems: true,
                                    validateCode: lValidateFunction,
                                    dialogSave: lDialogSaveFunction,
                                    queryBuilder: lQueryBuilderFunction,
                                    preferencesChanged: function() {
                                        lSettingsChanged = true;
                                    },
                                    onInitialized: function() {
                                        updateChangeGeneration();
                                    }
                                }, $.apex.codeEditor.preferencesObjectFromString( gEditorSettings ) ) );
                                // set initial size to match dialog
                                lEditor$
                                    .height( $( this ).height() )
                                    .width( $( this ).closest( ".ui-dialog" ).width() - 2 );
                            },
                            resizeStop: function( event, ui ) {
                                // when dialog resizes so must the editor widget
                                lEditor$.height( lEditorDlg$.height() )
                                    .width( ui.size.width - 2 )
                                    .trigger( "resize" );
                            },
                            buttons: lButtons
                        });
                    }); // openDialog

                    lProperty$ = pElement$.closest( "div." + PROPERTY );

                }
            }, $.apex.propertyEditor.PROP_TYPE.TEXTAREA );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.ITEM, {
                init: function( pElement$, prop, lastComponents ) {
                    let isWorkflow = lastComponents.some( component => model.isSharedDesignerComponent( component.typeId ) );

                    let lOptionsFilters, lOptionsFiltersLov,
                        lOptions = {
                            columnDefinitions: [
                                {
                                    name:        "name",
                                    title:       msg( "NAME" ),
                                    alignment:   "left",
                                    isRowHeader: true,
                                },
                                {
                                    name:      "label",
                                    title:     msg( "LABEL" ),
                                    alignment: "left"
                                }
                            ],
                            filters: [
                                {
                                    name:         "scope",
                                    title:        msg( "ITEM_SCOPE" ),
                                    type:         "buttonset",
                                    defaultValue: !isWorkflow ? "current_page" : WF_PARAMS,
                                    lov: [
                                        {
                                            display: msg( "COLUMNS" ),
                                            value:   "column"
                                        },
                                        {
                                            display: msg( "CURRENT_PAGE" ),
                                            value:   "current_page"
                                        },
                                        {
                                            display: msg( "CUSTOM_PAGE" ),
                                            value:   "custom_page",
                                            filters: [
                                                {
                                                    name:       "customPageNumber",
                                                    title:      msg( "PAGE_NUMBER" ),
                                                    type:       "text",
                                                    isRequired: true
                                                }
                                            ]
                                        },
                                        {
                                            display: msg( "GLOBAL_PAGE" ),
                                            value:   "global_page"
                                        },
                                        {
                                            display: msg( "APPLICATION" ),
                                            value:   "application"
                                        },
                                        {
                                            display: msg( "WF.PARAMS" ),
                                            value:   WF_PARAMS
                                        },
                                        {
                                            display: msg( "WF.VERSION_VARS" ),
                                            value:   VS_VARS
                                        },
                                        {
                                            display: msg( "WF.ACT_VARS" ),
                                            value:   ACT_VARS
                                        }
                                    ]
                                },
                                {
                                    name:  "search",
                                    title: msg( "SEARCH" ),
                                    type:  "search"
                                }
                            ],
                            filterLov: function ( pFilters, pRenderLovEntries ) {
                                var lType = "page",
                                    lPageId, lCompId, currentWorkflow, currentVersion, component;

                                switch ( pFilters.scope ) {
                                    case "application":
                                        lType   = "application";
                                        lPageId = "";
                                        break;
                                    case "current_page":
                                        lPageId = model.getCurrentPageId();
                                        break;
                                    case "global_page":
                                        lPageId = model.getGlobalPageId();
                                        break;
                                    case "custom_page":
                                        lPageId = pFilters.customPageNumber;
                                        break;
                                    case WF_PARAMS:
                                        lType   = WF_PARAMS;
                                        currentWorkflow = getParentOfType( lastComponents[0], model.COMP_TYPE.WORKFLOW );
                                        lCompId = currentWorkflow?.id;
                                        break;
                                    case VS_VARS:
                                        lType   = VS_VARS;
                                        currentVersion = getParentOfType( lastComponents[0], model.COMP_TYPE.WORKFLOW_VERSION );
                                        lCompId = currentVersion?.id;
                                        break;
                                    case ACT_VARS:
                                        lType   = ACT_VARS;
                                        component = lastComponents[ 0 ];
                                        // in case of the following components we must look up the parent activty and use its id
                                        if ( [ model.COMP_TYPE.WF_ACTIVITY_TASK_PARAM, model.COMP_TYPE.WF_ACTIVITY_API_PARAM, model.COMP_TYPE.WF_ACTIVITY_WS_PARAM ].includes( component.typeId ) ) {
                                            lCompId = getParentOfType( component, model.COMP_TYPE.WORKFLOW_ACTIVITY )?.id;
                                        } else {
                                            lCompId = component.id;
                                        }
                                        break;
                                }

                                if ( pFilters.scope === undefined || pFilters.scope === "column" ) {
                                    pRenderLovEntries( prop.metaData.lovValues(), pFilters.search );
                                } else if ( [ WF_PARAMS, VS_VARS, ACT_VARS ].includes( pFilters.scope ) ) {
                                    model.getWorkflowLov( {
                                        type:   lType,
                                        componentId: lCompId
                                    }, function( pLovEntries ){
                                        pRenderLovEntries( pLovEntries, pFilters.search );
                                    } );
                                } else {
                                    model.getItemsLov( {
                                        type:   lType,
                                        pageId: lPageId
                                    }, function( pLovEntries ){
                                        pRenderLovEntries( pLovEntries, pFilters.search );
                                    });
                                }
                            }
                        };

                    // in case of a plug-in we can't use the lovComponentScope to get to know the context
                    // ( should we have a new "component scope"? like "Workflow"?
                    // for now we are checkinkg the lastComponents to see if there's a "workflow-related" component
                    // ( other workaround would be to compare the property-name with the plug-in property ids...)
                    if ( isWorkflow ) {
                        prop.metaData.lovComponentScope = "WORKFLOW";
                    }

                    // For lov component scope PAGE and GLOBAL, remove 'application' and 'custom_page' filters
                    if ( prop.metaData.lovComponentScope === "PAGE_AND_GLOBAL" ) {
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                    if ( [ WF_PARAMS, VS_VARS, ACT_VARS, "application", "custom_page" ].includes( lOptionsFiltersLov[ j ].value ) ) {
                                        lOptionsFiltersLov.splice( j, 1 );
                                        j -= 1;
                                    }
                                }
                            }
                        }
                    // For lov component scope PAGE, remove 'application', 'custom_page' and 'global' filters
                    } else if ( prop.metaData.lovComponentScope === "PAGE" ) {
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                    if ( [ WF_PARAMS, VS_VARS, ACT_VARS, "application", "custom_page", "global_page" ].includes( lOptionsFiltersLov[ j ].value ) ) {
                                        lOptionsFiltersLov.splice( j, 1 );
                                        j -= 1;
                                    }
                                }
                            }
                        }
                    } else if ( prop.metaData.lovComponentScope === "WORKFLOW" ) {
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                    if ( ![ WF_PARAMS, VS_VARS, ACT_VARS ].includes( lOptionsFiltersLov[ j ].value ) ) {
                                        lOptionsFiltersLov.splice( j, 1 );
                                        j -= 1;
                                    }
                                }
                            }
                        }
                    }

                    // For lov component scope COLUMN, remove everything
                    if ( prop.metaData.lovComponentScope === "COLUMN" ) {
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFilters.splice( i, 1 );
                                break;
                            }
                        }
                    } else if ( prop.metaData.referenceScope === "ROW" ) {
                        // If 'column' filter is available, set it as default filter
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFilters[ i ].defaultValue = "column";
                                break;
                            }
                        }
                    } else {
                        // Remove 'column' filter if not available
                        lOptionsFilters = lOptions.filters;
                        for ( let i = 0; i < lOptionsFilters.length; i++ ) {
                            if ( lOptionsFilters[ i ].name === "scope" ) {
                                lOptionsFiltersLov = lOptionsFilters[ i ].lov;
                                for ( let j = 0; j < lOptionsFiltersLov.length; j++ ) {
                                    if ( lOptionsFiltersLov[ j ].value === "column" ) {
                                        lOptionsFiltersLov.splice( j, 1 );
                                        j =- 1;
                                    } else if ( !isWorkflow && [ WF_PARAMS, VS_VARS, ACT_VARS ].includes( lOptionsFiltersLov[ j ].value ) ) {
                                        lOptionsFiltersLov.splice( j, 1 );
                                        j =- 1;
                                    }
                                }
                            }
                        }
                    }

                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.FACET, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                            columnDefinitions: [
                                {
                                    name:        "name",
                                    title:       msg( "NAME" ),
                                    alignment:   "left",
                                    isRowHeader: true,
                                },
                                {
                                    name:      "label",
                                    title:     msg( "LABEL" ),
                                    alignment: "left"
                                }
                            ],
                            filters: [
                                {
                                    name:  "search",
                                    title: msg( "SEARCH" ),
                                    type:  "search"
                                }
                            ],
                            filterLov: function ( pFilters, pRenderLovEntries ) {
                                pRenderLovEntries( prop.metaData.lovValues(), pFilters.search );
                            }
                        };

                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PAGE, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:        "id",
                                title:       msg( "PAGE_NUMBER" ),
                                alignment:   "left",
                            },
                            {
                                name:       "name",
                                title:      msg( "PAGE_NAME" ),
                                alignment:  "left",
                                isRowHeader: true,
                            },
                            {
                                name:       "alias",
                                title:      msg( "PAGE_ALIAS" ),
                                alignment:  "left"
                            }
                        ],
                        filters: [
                            {
                                name:   "search",
                                title:  msg( "SEARCH" ),
                                type:   "search"
                            }
                        ],
                        filterLov: function( pFilters, pRenderLovEntries ) {
                            model.getPagesLov( pFilters, function( pLovValues ) {
                                pRenderLovEntries( pLovValues, pFilters.search );
                            });
                        }
                    };
                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.TABLE, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:        "name",
                                title:       msg( "NAME" ),
                                alignment:   "left",
                                isRowHeader: true,
                            }
                        ],
                        filters: [
                            {
                                name:         "type",
                                title:        msg( "TYPE" ),
                                type:         "buttonset",
                                defaultValue: "TABLE",
                                lov: [
                                    {
                                        display: msg( "TABLES" ),
                                        value:   "TABLE"
                                    },
                                    {
                                        display: msg( "VIEWS" ),
                                        value:   "VIEW"
                                    }
                                ]
                            },
                            {
                                name:  "search",
                                title: msg( "SEARCH" ),
                                type:  "search"
                            }
                        ],
                        filterLov: function( pFilters, pRenderLovEntries ) {
                            prop.metaData.lovValues( function( pLovEntries ){
                                pRenderLovEntries( pLovEntries, pFilters.search );
                            }, pFilters );
                        }
                    };
                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.GRAPH, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:        "name",
                                title:       msg( "NAME" ),
                                alignment:   "left",
                                isRowHeader: true,
                            }
                        ],
                        filters: [
                            {
                                name:         "type",
                                title:        msg( "TYPE" ),
                                type:         "buttonset",
                                defaultValue: "PROPERTY GRAPH",
                                lov: [
                                    {
                                        display: msg( "OWNER_SCHEMA" ),
                                        value:   "PROPERTY GRAPH"
                                    },
                                    {
                                        display: msg( "PUBLIC" ),
                                        value:   "PUBLIC_PROPERTY GRAPH"
                                    }
                                ]
                            },
                            {
                                name:  "search",
                                title: msg( "SEARCH" ),
                                type:  "search"
                            }
                        ],
                        filterLov: function( pFilters, pRenderLovEntries ) {
                            prop.metaData.lovValues( function( pLovEntries ){
                                pRenderLovEntries( pLovEntries, pFilters.search );
                            }, pFilters );
                        }
                    };
                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_PACKAGE, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:        "name",
                                title:       msg( "NAME" ),
                                alignment:   "left",
                                isRowHeader: true,
                            }
                        ],
                        filters: [
                            {
                                name:         "type",
                                title:        msg( "TYPE" ),
                                type:         "buttonset",
                                defaultValue: "PACKAGE",
                                lov: [
                                    {
                                        display: msg( "OWNER_SCHEMA" ),
                                        value:   "PACKAGE"
                                    },
                                    {
                                        display: msg( "PUBLIC" ),
                                        value:   "PUBLIC_PACKAGE"
                                    }
                                ]
                            },
                            {
                                name:  "search",
                                title: msg( "SEARCH" ),
                                type:  "search"
                            }
                        ],
                        filterLov: function( pFilters, pRenderLovEntries ) {
                            prop.metaData.lovValues( function( pLovEntries ){
                                pRenderLovEntries( pLovEntries, pFilters.search );
                            }, pFilters );
                        }
                    };
                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_METHOD, {
                init: function( pElement$, prop, lastComponents ) {
                    var lOptions = {
                        columnDefinitions: [
                            {
                                name:        "name",
                                title:       msg( "NAME" ),
                                alignment:   "left",
                                isRowHeader: true,
                            }
                        ],
                        filters: [
                            {
                                name:         "type",
                                title:        msg( "TYPE" ),
                                type:         "buttonset",
                                defaultValue: "PROCEDURE",
                                lov: [
                                    {
                                        display: msg( "PROCEDURES" ),
                                        value:   "PROCEDURE"
                                    },
                                    {
                                        display: msg( "FUNCTIONS" ),
                                        value:   "FUNCTION"
                                    }
                                ]
                            },
                            {
                                name:  "search",
                                title: msg( "SEARCH" ),
                                type:  "search"
                            }
                        ],
                        filterLov: function( pFilters, pRenderLovEntries ) {
                            prop.metaData.lovValues( function( pLovEntries ){
                                pRenderLovEntries( pLovEntries, pFilters.search );
                            }, pFilters );
                        }
                    };
                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.ICON, {
                init: function( pElement$, prop, lastComponents ) {

                    /*
                     Use the following statement to get the icons:
                     set termout off
                     set verify off
                     set trimspool on
                     set linesize 10000
                     set longchunksize 200000 long 2000000 pages 0
                     spool fa.txt
                     select category || ': "' || icons || '".split( "," ),' as js
                       from (
                           select trim( column_value ) as category, rtrim( xmlagg( xmlelement( e, icon_name, ',' ).extract( '//text()' ) order by icon_name ).getclobval(), ',' ) as icons
                             from wwv_flow_standard_icons, xmltable(( '"' || replace( icon_category, ':', '","' ) || '"' ))
                            where icon_library = 'FONTAPEX'
                            group by trim( column_value )
                            order by 1 )
                     /
                     spool off
                    */
                    const FONTAPEX_SHIPPING_VERSION = '2.4';

                    var isFontAPEX = function( pType ){
                        return pType === 'FONTAPEX' || pType === 'FONTAPEX_LATEST';
                    };

                    var isFontAwesome = function( pType ){
                        return pType === 'FONTAWESOME';
                    };

                    var THEME_ICONS = model.getThemeIcons(),
                        APEX_ICONS = {
                            ACCESSIBILITY: "fa-american-sign-language-interpreting,fa-asl-interpreting,fa-assistive-listening-systems,fa-audio-description,fa-blind,fa-braille,fa-deaf,fa-deafness,fa-hard-of-hearing,fa-low-vision,fa-sign-language,fa-signing,fa-universal-access,fa-volume-control-phone,fa-wheelchair-alt".split(","),
                            AI: "fa-ai-generative,fa-ai-innovation-lightbulb,fa-ai-microchip,fa-ai-prompt,fa-ai-sparkle-enhance-color,fa-ai-sparkle-enlarge,fa-ai-sparkle-eraser,fa-ai-sparkle-generate-audio,fa-ai-sparkle-generate-document,fa-ai-sparkle-generate-image,fa-ai-sparkle-generate-list,fa-ai-sparkle-generate-text,fa-ai-sparkle-improve-text,fa-ai-sparkle-message,fa-ai-sparkle-remove-image-background,fa-ai-sparkle-scan,fa-ai-sparkle-select,fa-ai-sparkle-token,fa-ai-sparkle-zoom-in,fa-ai-sparkle-zoom-out,fa-ai-square,fa-ai,fa-chatbot,fa-dataset,fa-drone,fa-head-ai-sparkle,fa-head-microchip,fa-robot-arm,fa-robot,fa-sparkles".split(","),
                            BUSINESS: "fa-barcode-read,fa-card-holder,fa-cash-register,fa-city,fa-coins,fa-credit-card-front,fa-file-cabinet,fa-hand-coins,fa-hand-money-bag,fa-meeting-room,fa-money-bag,fa-money-check-pen,fa-money-deposit,fa-money-withdrawal,fa-nfc,fa-piggy-bank,fa-projector-screen,fa-projector,fa-receipt-x,fa-receipt,fa-signature,fa-store,fa-strategy,fa-target-arrow,fa-timeline-arrow,fa-timeline,fa-trend-down,fa-trend-up,fa-vault,fa-wallet".split(","),
                            CALENDAR: "fa-calendar-alarm,fa-calendar-arrow-down,fa-calendar-arrow-up,fa-calendar-ban,fa-calendar-chart,fa-calendar-clock,fa-calendar-edit,fa-calendar-heart,fa-calendar-lock,fa-calendar-pointer,fa-calendar-search,fa-calendar-user,fa-calendar-wrench,fa-calendar-day,fa-calendar-month,fa-calendar-today,fa-calendar-week".split(","),
                            CHART: "fa-area-chart,fa-bar-chart,fa-bar-chart-horizontal,fa-box-plot-chart,fa-bubble-chart,fa-combo-chart,fa-dial-gauge-chart,fa-donut-chart,fa-funnel-chart,fa-gantt-chart,fa-line-area-chart,fa-line-chart,fa-pie-chart,fa-pie-chart-0,fa-pie-chart-10,fa-pie-chart-100,fa-pie-chart-15,fa-pie-chart-20,fa-pie-chart-25,fa-pie-chart-30,fa-pie-chart-35,fa-pie-chart-40,fa-pie-chart-45,fa-pie-chart-5,fa-pie-chart-50,fa-pie-chart-55,fa-pie-chart-60,fa-pie-chart-65,fa-pie-chart-70,fa-pie-chart-75,fa-pie-chart-80,fa-pie-chart-85,fa-pie-chart-90,fa-pie-chart-95,fa-polar-chart,fa-pyramid-chart,fa-radar-chart,fa-range-chart-area,fa-range-chart-bar,fa-scatter-chart,fa-stock-chart,fa-x-axis,fa-y-axis,fa-y1-axis,fa-y2-axis".split(","),
                            CURRENCY: "fa-bitcoin,fa-btc,fa-cny,fa-dollar,fa-eur,fa-euro,fa-gbp,fa-ils,fa-inr,fa-jpy,fa-krw,fa-money,fa-rmb,fa-rub,fa-try,fa-usd,fa-yen".split(","),
                            DIRECTIONAL: "fa-angle-double-down,fa-angle-double-left,fa-angle-double-right,fa-angle-double-up,fa-angle-down,fa-angle-left,fa-angle-right,fa-angle-up,fa-arrow-circle-down,fa-arrow-circle-left,fa-arrow-circle-o-down,fa-arrow-circle-o-left,fa-arrow-circle-o-right,fa-arrow-circle-o-up,fa-arrow-circle-right,fa-arrow-circle-up,fa-arrow-down,fa-arrow-down-alt,fa-arrow-down-left-alt,fa-arrow-down-right-alt,fa-arrow-left,fa-arrow-left-alt,fa-arrow-right,fa-arrow-right-alt,fa-arrow-up,fa-arrow-up-alt,fa-arrow-up-left-alt,fa-arrow-up-right-alt,fa-arrows,fa-arrows-alt,fa-arrows-h,fa-arrows-v,fa-box-arrow-in-east,fa-box-arrow-in-ne,fa-box-arrow-in-north,fa-box-arrow-in-nw,fa-box-arrow-in-se,fa-box-arrow-in-south,fa-box-arrow-in-sw,fa-box-arrow-in-west,fa-box-arrow-out-east,fa-box-arrow-out-ne,fa-box-arrow-out-north,fa-box-arrow-out-nw,fa-box-arrow-out-se,fa-box-arrow-out-south,fa-box-arrow-out-sw,fa-box-arrow-out-west,fa-caret-down,fa-caret-left,fa-caret-right,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-caret-up,fa-chevron-circle-down,fa-chevron-circle-left,fa-chevron-circle-right,fa-chevron-circle-up,fa-chevron-down,fa-chevron-left,fa-chevron-right,fa-chevron-up,fa-circle-arrow-in-east,fa-circle-arrow-in-ne,fa-circle-arrow-in-north,fa-circle-arrow-in-nw,fa-circle-arrow-in-se,fa-circle-arrow-in-south,fa-circle-arrow-in-sw,fa-circle-arrow-in-west,fa-circle-arrow-out-east,fa-circle-arrow-out-ne,fa-circle-arrow-out-north,fa-circle-arrow-out-nw,fa-circle-arrow-out-se,fa-circle-arrow-out-south,fa-circle-arrow-out-sw,fa-circle-arrow-out-west,fa-exchange,fa-hand-o-down,fa-hand-o-left,fa-hand-o-right,fa-hand-o-up,fa-long-arrow-down,fa-long-arrow-left,fa-long-arrow-right,fa-long-arrow-up,fa-page-bottom,fa-page-first,fa-page-last,fa-page-top".split(","),
                            EMOJI: "fa-awesome-face,fa-emoji-angry,fa-emoji-astonished,fa-emoji-big-eyes-smile,fa-emoji-big-frown,fa-emoji-cold-sweat,fa-emoji-confounded,fa-emoji-confused,fa-emoji-cool,fa-emoji-cringe,fa-emoji-cry,fa-emoji-delicious,fa-emoji-disappointed,fa-emoji-disappointed-relieved,fa-emoji-expressionless,fa-emoji-fearful,fa-emoji-frown,fa-emoji-grimace,fa-emoji-grin-sweat,fa-emoji-happy-smile,fa-emoji-hushed,fa-emoji-laughing,fa-emoji-lol,fa-emoji-love,fa-emoji-mean,fa-emoji-nerd,fa-emoji-neutral,fa-emoji-no-mouth,fa-emoji-open-mouth,fa-emoji-pensive,fa-emoji-persevere,fa-emoji-pleased,fa-emoji-relieved,fa-emoji-rotfl,fa-emoji-scream,fa-emoji-sleeping,fa-emoji-sleepy,fa-emoji-slight-frown,fa-emoji-slight-smile,fa-emoji-smile,fa-emoji-smirk,fa-emoji-stuck-out-tongue,fa-emoji-stuck-out-tongue-closed-eyes,fa-emoji-stuck-out-tongue-wink,fa-emoji-sweet-smile,fa-emoji-tired,fa-emoji-unamused,fa-emoji-upside-down,fa-emoji-weary,fa-emoji-wink,fa-emoji-worry,fa-emoji-zipper-mouth,fa-hipster,fa-badgerine".split(","),
                            FILE_TYPE: "fa-file,fa-file-archive-o,fa-file-audio-o,fa-file-code-o,fa-file-excel-o,fa-file-image-o,fa-file-o,fa-file-pdf-o,fa-file-powerpoint-o,fa-file-sql-o,fa-file-text,fa-file-text-o,fa-file-video-o,fa-file-word-o".split(","),
                            FLAG: "fa-flag-ad,fa-flag-ae,fa-flag-af,fa-flag-ag,fa-flag-ai,fa-flag-al,fa-flag-am,fa-flag-an,fa-flag-ao,fa-flag-aq,fa-flag-ar,fa-flag-as,fa-flag-at,fa-flag-au,fa-flag-aw,fa-flag-ax,fa-flag-az,fa-flag-ba,fa-flag-bb,fa-flag-bd,fa-flag-be,fa-flag-bf,fa-flag-bg,fa-flag-bh,fa-flag-bi,fa-flag-bj,fa-flag-bl,fa-flag-bm,fa-flag-bn,fa-flag-bo,fa-flag-bq,fa-flag-br,fa-flag-bs,fa-flag-bt,fa-flag-bv,fa-flag-bw,fa-flag-by,fa-flag-bz,fa-flag-ca,fa-flag-cc,fa-flag-cd,fa-flag-cf,fa-flag-cg,fa-flag-ch,fa-flag-ci,fa-flag-ck,fa-flag-cl,fa-flag-cm,fa-flag-cn,fa-flag-co,fa-flag-cr,fa-flag-cu,fa-flag-cv,fa-flag-cw,fa-flag-cx,fa-flag-cy,fa-flag-cz,fa-flag-de,fa-flag-dj,fa-flag-dk,fa-flag-dm,fa-flag-do,fa-flag-dz,fa-flag-ec,fa-flag-ee,fa-flag-eg,fa-flag-eh,fa-flag-er,fa-flag-es,fa-flag-et,fa-flag-eu,fa-flag-fi,fa-flag-fj,fa-flag-fk,fa-flag-fm,fa-flag-fo,fa-flag-fr,fa-flag-ga,fa-flag-gb,fa-flag-gd,fa-flag-ge,fa-flag-gf,fa-flag-gg,fa-flag-gh,fa-flag-gi,fa-flag-gl,fa-flag-gm,fa-flag-gn,fa-flag-gp,fa-flag-gq,fa-flag-gr,fa-flag-gs,fa-flag-gt,fa-flag-gu,fa-flag-gw,fa-flag-gy,fa-flag-hk,fa-flag-hm,fa-flag-hn,fa-flag-hr,fa-flag-ht,fa-flag-hu,fa-flag-ic,fa-flag-id,fa-flag-ie,fa-flag-il,fa-flag-im,fa-flag-in,fa-flag-io,fa-flag-iq,fa-flag-ir,fa-flag-is,fa-flag-it,fa-flag-je,fa-flag-jm,fa-flag-jo,fa-flag-jp,fa-flag-ke,fa-flag-kg,fa-flag-kh,fa-flag-ki,fa-flag-km,fa-flag-kn,fa-flag-kp,fa-flag-kr,fa-flag-kw,fa-flag-ky,fa-flag-kz,fa-flag-la,fa-flag-lb,fa-flag-lc,fa-flag-li,fa-flag-lk,fa-flag-lr,fa-flag-ls,fa-flag-lt,fa-flag-lu,fa-flag-lv,fa-flag-ly,fa-flag-ma,fa-flag-mc,fa-flag-md,fa-flag-me,fa-flag-mf,fa-flag-mg,fa-flag-mh,fa-flag-mk,fa-flag-ml,fa-flag-mm,fa-flag-mn,fa-flag-mo,fa-flag-mp,fa-flag-mq,fa-flag-mr,fa-flag-ms,fa-flag-mt,fa-flag-mu,fa-flag-mv,fa-flag-mw,fa-flag-mx,fa-flag-my,fa-flag-mz,fa-flag-na,fa-flag-nc,fa-flag-ne,fa-flag-nf,fa-flag-ng,fa-flag-ni,fa-flag-nl,fa-flag-no,fa-flag-np,fa-flag-nr,fa-flag-nu,fa-flag-nz,fa-flag-om,fa-flag-pa,fa-flag-pe,fa-flag-pf,fa-flag-pg,fa-flag-ph,fa-flag-pk,fa-flag-pl,fa-flag-pm,fa-flag-pn,fa-flag-pr,fa-flag-ps,fa-flag-pt,fa-flag-pw,fa-flag-py,fa-flag-qa,fa-flag-re,fa-flag-ro,fa-flag-rs,fa-flag-ru,fa-flag-rw,fa-flag-sa,fa-flag-sb,fa-flag-sc,fa-flag-sd,fa-flag-se,fa-flag-sg,fa-flag-sh,fa-flag-si,fa-flag-sj,fa-flag-sk,fa-flag-sl,fa-flag-sm,fa-flag-sn,fa-flag-so,fa-flag-sr,fa-flag-ss,fa-flag-st,fa-flag-sv,fa-flag-sx,fa-flag-sy,fa-flag-sz,fa-flag-tc,fa-flag-td,fa-flag-tf,fa-flag-tg,fa-flag-th,fa-flag-tj,fa-flag-tk,fa-flag-tl,fa-flag-tm,fa-flag-tn,fa-flag-to,fa-flag-tr,fa-flag-tt,fa-flag-tv,fa-flag-tw,fa-flag-tz,fa-flag-ua,fa-flag-ug,fa-flag-um,fa-flag-us-vi,fa-flag-us,fa-flag-uy,fa-flag-uz,fa-flag-va,fa-flag-vc,fa-flag-ve,fa-flag-vg,fa-flag-vi,fa-flag-vn,fa-flag-vu,fa-flag-wf,fa-flag-ws,fa-flag-xk,fa-flag-ye,fa-flag-yt,fa-flag-za,fa-flag-zm,fa-flag-zw".split(","),
                            FORM_CONTROL: "fa-check-square,fa-check-square-o,fa-circle,fa-circle-o,fa-dot-circle-o,fa-minus-square,fa-minus-square-o,fa-plus-square,fa-plus-square-o,fa-square,fa-square-o,fa-square-selected-o,fa-times-square,fa-times-square-o".split(","),
                            GENDER: "fa-genderless,fa-mars,fa-mars-double,fa-mars-stroke,fa-mars-stroke-h,fa-mars-stroke-v,fa-mercury,fa-neuter,fa-transgender,fa-transgender-alt,fa-venus,fa-venus-double,fa-venus-mars".split(","),
                            HAND: "fa-hand-grab-o,fa-hand-lizard-o,fa-hand-o-down,fa-hand-o-left,fa-hand-o-right,fa-hand-o-up,fa-hand-peace-o,fa-hand-pointer-o,fa-hand-scissors-o,fa-hand-spock-o,fa-hand-stop-o,fa-thumbs-down,fa-thumbs-o-down,fa-thumbs-o-up,fa-thumbs-up".split(","),
                            MAPS: "fa-map-pin-triangle,fa-traffic-light-stop,fa-map-pin-heart,fa-map-pin-heart-o,fa-map-pin-circle,fa-map-pin-circle-o,fa-map-markers,fa-map-markers-o,fa-map-marker-slash,fa-map-marker-slash-o,fa-map-marker-shine,fa-map-marker-shine-o,fa-map-marker-face-frown,fa-map-marker-face-frown-o,fa-map-marker-face-meh,fa-map-marker-face-meh-o,fa-map-marker-face-smile,fa-map-marker-face-smile-o,fa-map-marker-camera-o,fa-map-marker-camera,fa-map-marker,fa-map-marker-check-o,fa-map-marker-check,fa-line-map,fa-2d-mode,fa-3d-mode,fa-location,fa-location-slash,fa-map-pin-triangle-o,fa-traffic-light-go,fa-traffic-light,fa-location-circle,fa-location-circle-o,fa-location-arrow".split(","),
                            MEDICAL: "fa-ambulance,fa-h-square,fa-heart,fa-heart-o,fa-heartbeat,fa-hospital-o,fa-medkit,fa-plus-square,fa-stethoscope,fa-user-md,fa-wheelchair,fa-nurse,fa-biohazard,fa-prescription-sheet,fa-radiation,fa-syringe,fa-vial,fa-vials,fa-x-ray,fa-file-medical,fa-file-prescription,fa-medication-pills,fa-medication-pill-bottle,fa-medication-pill,fa-medication,fa-medical-mask,fa-prescription".split(","),
                            NUMBERS: "fa-number-0,fa-number-0-o,fa-number-1,fa-number-1-o,fa-number-2,fa-number-2-o,fa-number-3,fa-number-3-o,fa-number-4,fa-number-4-o,fa-number-5,fa-number-5-o,fa-number-6,fa-number-6-o,fa-number-7,fa-number-7-o,fa-number-8,fa-number-8-o,fa-number-9,fa-number-9-o".split(","),
                            PAYMENT: "fa-credit-card,fa-credit-card-alt,fa-credit-card-terminal".split(","),
                            SPINNER: "fa-circle-o-notch,fa-gear,fa-refresh,fa-spinner".split(","),
                            TEXT_EDITOR: "fa-align-center,fa-align-justify,fa-align-left,fa-align-right,fa-bold,fa-clipboard,fa-clipboard-arrow-down,fa-clipboard-arrow-up,fa-clipboard-ban,fa-clipboard-bookmark,fa-clipboard-chart ,fa-clipboard-check,fa-clipboard-check-alt,fa-clipboard-clock,fa-clipboard-edit,fa-clipboard-heart,fa-clipboard-list,fa-clipboard-lock,fa-clipboard-new,fa-clipboard-plus,fa-clipboard-pointer,fa-clipboard-search,fa-clipboard-user,fa-clipboard-wrench,fa-clipboard-x,fa-columns,fa-copy,fa-cut,fa-eraser,fa-file,fa-file-o,fa-file-text,fa-file-text-o,fa-files-o,fa-font,fa-header,fa-indent,fa-italic,fa-link,fa-list,fa-list-alt,fa-list-ol,fa-list-ul,fa-outdent,fa-paperclip,fa-paragraph,fa-paste,fa-repeat,fa-rotate-left,fa-rotate-right,fa-save,fa-scissors,fa-strikethrough,fa-subscript,fa-superscript,fa-table,fa-text-height,fa-text-width,fa-th,fa-th-large,fa-th-list,fa-underline,fa-undo,fa-unlink".split(","),
                            TRANSPORTATION: "fa-ambulance,fa-bicycle,fa-bus,fa-car,fa-fighter-jet,fa-motorcycle,fa-plane,fa-rocket,fa-ship,fa-space-shuttle,fa-subway,fa-taxi,fa-train,fa-truck,fa-wheelchair".split(","),
                            VIDEO_PLAYER: "fa-arrows-alt,fa-backward,fa-compress,fa-eject,fa-expand,fa-fast-backward,fa-fast-forward,fa-forward,fa-pause,fa-pause-circle,fa-pause-circle-o,fa-play,fa-play-circle,fa-play-circle-o,fa-random,fa-step-backward,fa-step-forward,fa-stop,fa-stop-circle,fa-stop-circle-o".split(","),
                            WEB_APPLICATION: "fa-address-book,fa-address-book-o,fa-address-card,fa-address-card-o,fa-adjust,fa-alert,fa-american-sign-language-interpreting,fa-anchor,fa-apex,fa-apex-square,fa-archive,fa-area-chart,fa-arrows,fa-arrows-h,fa-arrows-v,fa-asl-interpreting,fa-assistive-listening-systems,fa-asterisk,fa-at,fa-audio-description,fa-badge-list,fa-badges,fa-balance-scale,fa-ban,fa-bar-chart,fa-barcode,fa-bars,fa-bath,fa-battery-0,fa-battery-1,fa-battery-2,fa-battery-3,fa-battery-4,fa-battleship,fa-bed,fa-beer,fa-bell,fa-bell-o,fa-bell-slash,fa-bell-slash-o,fa-bicycle,fa-binoculars,fa-birthday-cake,fa-blind,fa-bolt,fa-bomb,fa-book,fa-bookmark,fa-bookmark-o,fa-braille,fa-breadcrumb,fa-briefcase,fa-bug,fa-building,fa-building-o,fa-bullhorn,fa-bullseye,fa-bus,fa-button,fa-button-container,fa-button-group,fa-calculator,fa-calendar,fa-calendar-check-o,fa-calendar-minus-o,fa-calendar-o,fa-calendar-plus-o,fa-calendar-times-o,fa-camera,fa-camera-retro,fa-car,fa-cards,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-carousel,fa-cart-arrow-down,fa-cart-arrow-up,fa-cart-check,fa-cart-edit,fa-cart-empty,fa-cart-full,fa-cart-heart,fa-cart-lock,fa-cart-magnifying-glass,fa-cart-plus,fa-cart-times,fa-cc,fa-certificate,fa-change-case,fa-check,fa-check-circle,fa-check-circle-o,fa-check-square,fa-check-square-o,fa-child,fa-circle,fa-circle-0-8,fa-circle-1-8,fa-circle-2-8,fa-circle-3-8,fa-circle-4-8,fa-circle-5-8,fa-circle-6-8,fa-circle-7-8,fa-circle-8-8,fa-circle-o,fa-circle-o-notch,fa-circle-thin,fa-clock-o,fa-clone,fa-cloud,fa-cloud-arrow-down,fa-cloud-arrow-up,fa-cloud-ban,fa-cloud-bookmark,fa-cloud-chart,fa-cloud-check,fa-cloud-clock,fa-cloud-cursor,fa-cloud-download,fa-cloud-edit,fa-cloud-file,fa-cloud-heart,fa-cloud-lock,fa-cloud-new,fa-cloud-play,fa-cloud-plus,fa-cloud-pointer,fa-cloud-search,fa-cloud-upload,fa-cloud-user,fa-cloud-wrench,fa-cloud-x,fa-code,fa-code-fork,fa-code-group,fa-coffee,fa-collapsible,fa-comment,fa-comment-o,fa-commenting,fa-commenting-o,fa-comments,fa-comments-o,fa-compass,fa-contacts,fa-copyright,fa-creative-commons,fa-credit-card,fa-credit-card-alt,fa-credit-card-terminal,fa-crop,fa-crosshairs,fa-cube,fa-cubes,fa-cutlery,fa-dashboard,fa-database,fa-database-arrow-down,fa-database-arrow-up,fa-database-ban,fa-database-bookmark,fa-database-chart,fa-database-check,fa-database-clock,fa-database-cursor,fa-database-edit,fa-database-file,fa-database-heart,fa-database-lock,fa-database-new,fa-database-play,fa-database-plus,fa-database-pointer,fa-database-search,fa-database-user,fa-database-wrench,fa-database-x,fa-deaf,fa-deafness,fa-design,fa-desktop,fa-diamond,fa-dot-circle-o,fa-download,fa-download-alt,fa-dynamic-content,fa-edit,fa-ellipsis-h,fa-ellipsis-h-o,fa-ellipsis-v,fa-ellipsis-v-o,fa-envelope,fa-envelope-arrow-down,fa-envelope-arrow-up,fa-envelope-ban,fa-envelope-bookmark,fa-envelope-chart,fa-envelope-check,fa-envelope-clock,fa-envelope-cursor,fa-envelope-edit,fa-envelope-heart,fa-envelope-lock,fa-envelope-o,fa-envelope-open,fa-envelope-open-o,fa-envelope-play,fa-envelope-plus,fa-envelope-pointer,fa-envelope-search,fa-envelope-square,fa-envelope-user,fa-envelope-wrench,fa-envelope-x,fa-eraser,fa-exception,fa-exchange,fa-exclamation,fa-exclamation-circle,fa-exclamation-circle-o,fa-exclamation-diamond,fa-exclamation-diamond-o,fa-exclamation-square,fa-exclamation-square-o,fa-exclamation-triangle,fa-exclamation-triangle-o,fa-expand-collapse,fa-external-link,fa-external-link-square,fa-eye,fa-eye-slash,fa-eyedropper,fa-fax,fa-feed,fa-female,fa-fighter-jet,fa-fighter-jet-alt,fa-file-archive-o,fa-file-arrow-down,fa-file-arrow-up,fa-file-audio-o,fa-file-ban,fa-file-bookmark,fa-file-chart,fa-file-check,fa-file-clock,fa-file-code-o,fa-file-cursor,fa-file-edit,fa-file-excel-o,fa-file-heart,fa-file-image-o,fa-file-lock,fa-file-new,fa-file-pdf-o,fa-file-play,fa-file-plus,fa-file-pointer,fa-file-powerpoint-o,fa-file-search,fa-file-sql-o,fa-file-user,fa-file-video-o,fa-file-word-o,fa-file-wrench,fa-file-x,fa-film,fa-filter,fa-fire,fa-fire-extinguisher,fa-fit-to-height,fa-fit-to-size,fa-fit-to-width,fa-flag,fa-flag-checkered,fa-flag-o,fa-flashlight,fa-flask,fa-folder,fa-folder-arrow-down,fa-folder-arrow-up,fa-folder-ban,fa-folder-bookmark,fa-folder-chart,fa-folder-check,fa-folder-clock,fa-folder-cloud,fa-folder-cursor,fa-folder-edit,fa-folder-file,fa-folder-heart,fa-folder-lock,fa-folder-network,fa-folder-new,fa-folder-o,fa-folder-open,fa-folder-open-o,fa-folder-play,fa-folder-plus,fa-folder-pointer,fa-folder-search,fa-folder-user,fa-folder-wrench,fa-folder-x,fa-folders,fa-font-size,fa-font-size-decrease,fa-font-size-increase,fa-format,fa-forms,fa-frown-o,fa-function,fa-futbol-o,fa-gamepad,fa-gavel,fa-gear,fa-gears,fa-gift,fa-glass,fa-glasses,fa-globe,fa-graduation-cap,fa-hand-grab-o,fa-hand-lizard-o,fa-hand-peace-o,fa-hand-pointer-o,fa-hand-scissors-o,fa-hand-spock-o,fa-hand-stop-o,fa-handshake-o,fa-hard-of-hearing,fa-hardware,fa-hashtag,fa-hdd-o,fa-headphones,fa-headset,fa-heart,fa-heart-o,fa-heartbeat,fa-helicopter,fa-hero,fa-history,fa-home,fa-hourglass,fa-hourglass-1,fa-hourglass-2,fa-hourglass-3,fa-hourglass-o,fa-i-cursor,fa-id-badge,fa-id-card,fa-id-card-o,fa-image,fa-inbox,fa-index,fa-industry,fa-info,fa-info-circle,fa-info-circle-o,fa-info-square,fa-info-square-o,fa-key,fa-key-alt,fa-keyboard-o,fa-language,fa-laptop,fa-layers,fa-layout-1col-2col,fa-layout-1col-3col,fa-layout-1row-2row,fa-layout-2col,fa-layout-2col-1col,fa-layout-2row,fa-layout-2row-1row,fa-layout-3col,fa-layout-3col-1col,fa-layout-3row,fa-layout-blank,fa-layout-footer,fa-layout-grid-3x,fa-layout-header,fa-layout-header-1col-3col,fa-layout-header-2row,fa-layout-header-footer,fa-layout-header-nav-left-cards,fa-layout-header-nav-left-right-footer,fa-layout-header-nav-right-cards,fa-layout-header-sidebar-left,fa-layout-header-sidebar-right,fa-layout-list-left,fa-layout-list-right,fa-layout-modal-blank,fa-layout-modal-columns,fa-layout-modal-grid-2x,fa-layout-modal-header,fa-layout-modal-nav-left,fa-layout-modal-nav-right,fa-layout-modal-rows,fa-layout-nav-left,fa-layout-nav-left-cards,fa-layout-nav-left-hamburger,fa-layout-nav-left-hamburger-header,fa-layout-nav-left-header-cards,fa-layout-nav-left-header-header,fa-layout-nav-left-right,fa-layout-nav-left-right-header-footer,fa-layout-nav-right,fa-layout-nav-right-cards,fa-layout-nav-right-hamburger,fa-layout-nav-right-hamburger-header,fa-layout-nav-right-header,fa-layout-nav-right-header-cards,fa-layout-sidebar-left,fa-layout-sidebar-right,fa-layouts-grid-2x,fa-leaf,fa-lemon-o,fa-level-down,fa-level-up,fa-life-ring,fa-lightbulb-o,fa-line-chart,fa-location-arrow-o,fa-lock,fa-lock-check,fa-lock-file,fa-lock-new,fa-lock-password,fa-lock-plus,fa-lock-user,fa-lock-x,fa-low-vision,fa-magic,fa-magnet,fa-mail-forward,fa-male,fa-map,fa-map-marker-o,fa-map-o,fa-map-pin,fa-map-signs,fa-materialized-view,fa-media-list,fa-meh-o,fa-microchip,fa-microphone,fa-microphone-slash,fa-military-vehicle,fa-minus,fa-minus-circle,fa-minus-circle-o,fa-minus-square,fa-minus-square-o,fa-missile,fa-mobile,fa-money,fa-moon-o,fa-motorcycle,fa-mouse-pointer,fa-music,fa-navicon,fa-network-hub,fa-network-triangle,fa-newspaper-o,fa-notebook,fa-object-group,fa-object-ungroup,fa-office-phone,fa-package,fa-padlock,fa-padlock-unlock,fa-paint-brush,fa-paper-plane,fa-paper-plane-o,fa-paw,fa-pencil,fa-pencil-square,fa-pencil-square-o,fa-percent,fa-phone,fa-phone-square,fa-photo,fa-pie-chart,fa-plane,fa-plug,fa-plus,fa-plus-circle,fa-plus-circle-o,fa-plus-square,fa-plus-square-o,fa-podcast,fa-power-off,fa-pragma,fa-print,fa-procedure,fa-puzzle-piece,fa-qrcode,fa-question,fa-question-circle,fa-question-circle-o,fa-question-square,fa-question-square-o,fa-quote-left,fa-quote-right,fa-random,fa-recycle,fa-redo-alt,fa-redo-arrow,fa-refresh,fa-registered,fa-remove,fa-reply,fa-reply-all,fa-retweet,fa-road,fa-rocket,fa-rss,fa-rss-square,fa-save-as,fa-search,fa-search-minus,fa-search-plus,fa-send,fa-send-o,fa-sequence,fa-server,fa-server-arrow-down,fa-server-arrow-up,fa-server-ban,fa-server-bookmark,fa-server-chart,fa-server-check,fa-server-clock,fa-server-edit,fa-server-file,fa-server-heart,fa-server-lock,fa-server-new,fa-server-play,fa-server-plus,fa-server-pointer,fa-server-search,fa-server-user,fa-server-wrench,fa-server-x,fa-shapes,fa-share,fa-share-alt,fa-share-alt-square,fa-share-square,fa-share-square-o,fa-share2,fa-shield,fa-ship,fa-shopping-bag,fa-shopping-basket,fa-shopping-cart,fa-shower,fa-sign-in,fa-sign-language,fa-sign-out,fa-signal,fa-signing,fa-sitemap,fa-sitemap-horizontal,fa-sitemap-vertical,fa-sliders,fa-smile-o,fa-snowflake,fa-soccer-ball-o,fa-sort,fa-sort-alpha-asc,fa-sort-alpha-desc,fa-sort-amount-asc,fa-sort-amount-desc,fa-sort-asc,fa-sort-desc,fa-sort-numeric-asc,fa-sort-numeric-desc,fa-space-shuttle,fa-spinner,fa-spoon,fa-square,fa-square-o,fa-square-selected-o,fa-star,fa-star-half,fa-star-half-o,fa-star-o,fa-sticky-note,fa-sticky-note-o,fa-street-view,fa-suitcase,fa-sun-o,fa-support,fa-synonym,fa-table-arrow-down,fa-table-arrow-up,fa-table-ban,fa-table-bookmark,fa-table-chart,fa-table-check,fa-table-clock,fa-table-cursor,fa-table-edit,fa-table-file,fa-table-heart,fa-table-lock,fa-table-new,fa-table-play,fa-table-plus,fa-table-pointer,fa-table-search,fa-table-user,fa-table-wrench,fa-table-x,fa-tablet,fa-tabs,fa-tachometer,fa-tag,fa-tags,fa-tank,fa-tasks,fa-taxi,fa-television,fa-terminal,fa-thermometer-0,fa-thermometer-1,fa-thermometer-2,fa-thermometer-3,fa-thermometer-4,fa-thumb-tack,fa-thumbs-down,fa-thumbs-o-down,fa-thumbs-o-up,fa-thumbs-up,fa-ticket,fa-tiles-2x2,fa-tiles-3x3,fa-tiles-8,fa-tiles-9,fa-times,fa-times-circle,fa-times-circle-o,fa-times-rectangle,fa-times-rectangle-o,fa-tint,fa-toggle-off,fa-toggle-on,fa-tools,fa-trademark,fa-trash,fa-trash-o,fa-tree,fa-tree-org,fa-trigger,fa-trophy,fa-truck,fa-tty,fa-umbrella,fa-undo-alt,fa-undo-arrow,fa-universal-access,fa-university,fa-unlock,fa-unlock-alt,fa-upload,fa-upload-alt,fa-user,fa-user-arrow-down,fa-user-arrow-up,fa-user-ban,fa-user-chart,fa-user-check,fa-user-circle,fa-user-circle-o,fa-user-clock,fa-user-cursor,fa-user-edit,fa-user-graduate,fa-user-headset,fa-user-heart,fa-user-lock,fa-user-magnifying-glass,fa-user-man,fa-user-play,fa-user-plus,fa-user-pointer,fa-user-secret,fa-user-woman,fa-user-wrench,fa-user-x,fa-users,fa-users-chat,fa-variable,fa-video-camera,fa-volume-control-phone,fa-volume-down,fa-volume-off,fa-volume-up,fa-warning,fa-wheelchair,fa-wheelchair-alt,fa-wifi,fa-window,fa-window-alt,fa-window-alt-2,fa-window-arrow-down,fa-window-arrow-up,fa-window-ban,fa-window-bookmark,fa-window-chart,fa-window-check,fa-window-clock,fa-window-close,fa-window-close-o,fa-window-cursor,fa-window-edit,fa-window-file,fa-window-heart,fa-window-lock,fa-window-maximize,fa-window-minimize,fa-window-new,fa-window-play,fa-window-plus,fa-window-pointer,fa-window-restore,fa-window-search,fa-window-terminal,fa-window-user,fa-window-wrench,fa-window-x,fa-wizard,fa-wrench,fa-text-color,fa-abacus,fa-frown,fa-meh,fa-smile,fa-size-xxl,fa-size-xl,fa-size-l,fa-size-m,fa-size-s,fa-size-xs,fa-heat-map,fa-flag-swallowtail-o,fa-flag-swallowtail,fa-flag-pennant-o,fa-flag-pennant,fa-alarm-clock,fa-alarm-check,fa-alarm-snooze,fa-alarm-plus,fa-alarm-minus,fa-alarm-times,fa-user-slash,fa-users-alt,fa-podium,fa-presentation,fa-analytics,fa-tasks-alt,fa-bug-slash,fa-file-brackets,fa-file-csv-o,fa-file-json-o,fa-file-signature,fa-sort-amount-asc-alt,fa-sort-amount-desc-alt,fa-404,fa-4k,fa-accordion,fa-accessor-more,fa-accessor-one,fa-badge,fa-badge-check,fa-badge-dollar,fa-badge-percent,fa-workflow,fa-database-application,fa-person-running-fast,fa-person-running,fa-person-standing,fa-person-walking".split(",")
                        },
                        AWESOME_ICONS = { /* Note: Fontawesome 4.5.0 icon css classes */
                            BRAND: "fa-500px,fa-adn,fa-amazon,fa-android,fa-angellist,fa-apple,fa-behance,fa-behance-square,fa-bitbucket,fa-bitbucket-square,fa-black-tie,fa-bluetooth,fa-bluetooth-b,fa-btc,fa-buysellads,fa-cc-amex,fa-cc-diners-club,fa-cc-discover,fa-cc-jcb,fa-cc-mastercard,fa-cc-paypal,fa-cc-stripe,fa-cc-visa,fa-chrome,fa-codepen,fa-codiepie,fa-connectdevelop,fa-contao,fa-credit-card-alt,fa-css3,fa-dashcube,fa-delicious,fa-deviantart,fa-digg,fa-dribbble,fa-dropbox,fa-drupal,fa-edge,fa-empire,fa-expeditedssl,fa-facebook,fa-facebook-official,fa-facebook-square,fa-firefox,fa-flickr,fa-fonticons,fa-fort-awesome,fa-forumbee,fa-foursquare,fa-get-pocket,fa-gg,fa-gg-circle,fa-git,fa-git-square,fa-github,fa-github-alt,fa-github-square,fa-google,fa-google-plus,fa-google-plus-square,fa-google-wallet,fa-gratipay,fa-hacker-news,fa-houzz,fa-html5,fa-instagram,fa-internet-explorer,fa-ioxhost,fa-joomla,fa-jsfiddle,fa-lastfm,fa-lastfm-square,fa-leanpub,fa-linkedin,fa-linkedin-square,fa-linux,fa-maxcdn,fa-meanpath,fa-medium,fa-mixcloud,fa-modx,fa-odnoklassniki,fa-odnoklassniki-square,fa-opencart,fa-openid,fa-opera,fa-optin-monster,fa-pagelines,fa-paypal,fa-pied-piper,fa-pied-piper-alt,fa-pinterest,fa-pinterest-p,fa-pinterest-square,fa-product-hunt,fa-qq,fa-rebel,fa-reddit,fa-reddit-alien,fa-reddit-square,fa-renren,fa-safari,fa-scribd,fa-sellsy,fa-share-alt,fa-share-alt-square,fa-shirtsinbulk,fa-simplybuilt,fa-skyatlas,fa-skype,fa-slack,fa-slideshare,fa-soundcloud,fa-spotify,fa-stack-exchange,fa-stack-overflow,fa-steam,fa-steam-square,fa-stumbleupon,fa-stumbleupon-circle,fa-tencent-weibo,fa-trello,fa-tripadvisor,fa-tumblr,fa-tumblr-square,fa-twitch,fa-twitter,fa-twitter-square,fa-usb,fa-viacoin,fa-vimeo,fa-vimeo-square,fa-vine,fa-vk,fa-weibo,fa-weixin,fa-whatsapp,fa-wikipedia-w,fa-windows,fa-wordpress,fa-xing,fa-xing-square,fa-y-combinator,fa-yahoo,fa-yelp,fa-youtube,fa-youtube-play,fa-youtube-square".split( "," ),
                            CHART: "fa-area-chart,fa-bar-chart,fa-line-chart,fa-pie-chart".split( "," ),
                            CURRENCY: "fa-btc,fa-eur,fa-gbp,fa-gg,fa-gg-circle,fa-ils,fa-inr,fa-jpy,fa-krw,fa-money,fa-rub,fa-try,fa-usd".split( "," ),
                            DIRECTIONAL: "fa-angle-double-down,fa-angle-double-left,fa-angle-double-right,fa-angle-double-up,fa-angle-down,fa-angle-left,fa-angle-right,fa-angle-up,fa-arrow-circle-down,fa-arrow-circle-left,fa-arrow-circle-o-down,fa-arrow-circle-o-left,fa-arrow-circle-o-right,fa-arrow-circle-o-up,fa-arrow-circle-right,fa-arrow-circle-up,fa-arrow-down,fa-arrow-left,fa-arrow-right,fa-arrow-up,fa-arrows,fa-arrows-alt,fa-arrows-h,fa-arrows-v,fa-caret-down,fa-caret-left,fa-caret-right,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-caret-up,fa-chevron-circle-down,fa-chevron-circle-left,fa-chevron-circle-right,fa-chevron-circle-up,fa-chevron-down,fa-chevron-left,fa-chevron-right,fa-chevron-up,fa-exchange,fa-hand-o-down,fa-hand-o-left,fa-hand-o-right,fa-hand-o-up,fa-long-arrow-down,fa-long-arrow-left,fa-long-arrow-right,fa-long-arrow-up".split( "," ),
                            FILE_TYPE: "fa-file,fa-file-archive-o,fa-file-audio-o,fa-file-code-o,fa-file-excel-o,fa-file-image-o,fa-file-o,fa-file-pdf-o,fa-file-powerpoint-o,fa-file-text,fa-file-text-o,fa-file-video-o,fa-file-word-o".split( "," ),
                            FORM_CONTROL: "fa-check-square,fa-check-square-o,fa-circle,fa-circle-o,fa-dot-circle-o,fa-minus-square,fa-minus-square-o,fa-plus-square,fa-plus-square-o,fa-square,fa-square-o".split( "," ),
                            GENDER: "fa-genderless,fa-mars,fa-mars-double,fa-mars-stroke,fa-mars-stroke-h,fa-mars-stroke-v,fa-mercury,fa-neuter,fa-transgender,fa-transgender-alt,fa-venus,fa-venus-double,fa-venus-mars".split( "," ),
                            HAND: "fa-hand-lizard-o,fa-hand-o-down,fa-hand-o-left,fa-hand-o-right,fa-hand-o-up,fa-hand-paper-o,fa-hand-peace-o,fa-hand-pointer-o,fa-hand-rock-o,fa-hand-scissors-o,fa-hand-spock-o,fa-thumbs-down,fa-thumbs-o-down,fa-thumbs-o-up,fa-thumbs-up".split( "," ),
                            MEDICAL: "fa-ambulance,fa-h-square,fa-heart,fa-heart-o,fa-heartbeat,fa-hospital-o,fa-medkit,fa-plus-square,fa-stethoscope,fa-user-md,fa-wheelchair".split( "," ),
                            PAYMENT: "fa-cc-amex,fa-cc-diners-club,fa-cc-discover,fa-cc-jcb,fa-cc-mastercard,fa-cc-paypal,fa-cc-stripe,fa-cc-visa,fa-credit-card,fa-credit-card-alt,fa-google-wallet,fa-paypal".split( "," ),
                            SPINNER: "fa-circle-o-notch,fa-cog,fa-refresh,fa-spinner".split( "," ),
                            TEXT_EDITOR: "fa-align-center,fa-align-justify,fa-align-left,fa-align-right,fa-bold,fa-chain-broken,fa-clipboard,fa-columns,fa-eraser,fa-file,fa-file-o,fa-file-text,fa-file-text-o,fa-files-o,fa-floppy-o,fa-font,fa-header,fa-indent,fa-italic,fa-link,fa-list,fa-list-alt,fa-list-ol,fa-list-ul,fa-outdent,fa-paperclip,fa-paragraph,fa-repeat,fa-scissors,fa-strikethrough,fa-subscript,fa-superscript,fa-table,fa-text-height,fa-text-width,fa-th,fa-th-large,fa-th-list,fa-underline,fa-undo".split( "," ),
                            TRANSPORTATION: "fa-ambulance,fa-bicycle,fa-bus,fa-car,fa-fighter-jet,fa-motorcycle,fa-plane,fa-rocket,fa-ship,fa-space-shuttle,fa-subway,fa-taxi,fa-train,fa-truck,fa-wheelchair".split( "," ),
                            VIDEO_PLAYER: "fa-arrows-alt,fa-backward,fa-compress,fa-eject,fa-expand,fa-fast-backward,fa-fast-forward,fa-forward,fa-pause,fa-pause-circle,fa-pause-circle-o,fa-play,fa-play-circle,fa-play-circle-o,fa-random,fa-step-backward,fa-step-forward,fa-stop,fa-stop-circle,fa-stop-circle-o,fa-youtube-play".split( "," ),
                            WEB_APPLICATION: "fa-adjust,fa-anchor,fa-archive,fa-area-chart,fa-arrows,fa-arrows-h,fa-arrows-v,fa-asterisk,fa-at,fa-balance-scale,fa-ban,fa-bar-chart,fa-barcode,fa-bars,fa-battery-empty,fa-battery-full,fa-battery-half,fa-battery-quarter,fa-battery-three-quarters,fa-bed,fa-beer,fa-bell,fa-bell-o,fa-bell-slash,fa-bell-slash-o,fa-bicycle,fa-binoculars,fa-birthday-cake,fa-bluetooth,fa-bluetooth-b,fa-bolt,fa-bomb,fa-book,fa-bookmark,fa-bookmark-o,fa-briefcase,fa-bug,fa-building,fa-building-o,fa-bullhorn,fa-bullseye,fa-bus,fa-calculator,fa-calendar,fa-calendar-check-o,fa-calendar-minus-o,fa-calendar-o,fa-calendar-plus-o,fa-calendar-times-o,fa-camera,fa-camera-retro,fa-car,fa-caret-square-o-down,fa-caret-square-o-left,fa-caret-square-o-right,fa-caret-square-o-up,fa-cart-arrow-down,fa-cart-plus,fa-cc,fa-certificate,fa-check,fa-check-circle,fa-check-circle-o,fa-check-square,fa-check-square-o,fa-child,fa-circle,fa-circle-o,fa-circle-o-notch,fa-circle-thin,fa-clock-o,fa-clone,fa-cloud,fa-cloud-download,fa-cloud-upload,fa-code,fa-code-fork,fa-coffee,fa-cog,fa-cogs,fa-comment,fa-comment-o,fa-commenting,fa-commenting-o,fa-comments,fa-comments-o,fa-compass,fa-copyright,fa-creative-commons,fa-credit-card,fa-crop,fa-crosshairs,fa-cube,fa-cubes,fa-cutlery,fa-database,fa-desktop,fa-diamond,fa-dot-circle-o,fa-download,fa-ellipsis-h,fa-ellipsis-v,fa-envelope,fa-envelope-o,fa-envelope-square,fa-eraser,fa-exchange,fa-exclamation,fa-exclamation-circle,fa-exclamation-triangle,fa-external-link,fa-external-link-square,fa-eye,fa-eye-slash,fa-eyedropper,fa-fax,fa-female,fa-fighter-jet,fa-file-archive-o,fa-file-audio-o,fa-file-code-o,fa-file-excel-o,fa-file-image-o,fa-file-pdf-o,fa-file-powerpoint-o,fa-file-video-o,fa-file-word-o,fa-film,fa-filter,fa-fire,fa-fire-extinguisher,fa-flag,fa-flag-checkered,fa-flag-o,fa-flask,fa-folder,fa-folder-o,fa-folder-open,fa-folder-open-o,fa-frown-o,fa-futbol-o,fa-gamepad,fa-gavel,fa-gift,fa-glass,fa-globe,fa-graduation-cap,fa-hand-lizard-o,fa-hand-paper-o,fa-hand-peace-o,fa-hand-pointer-o,fa-hand-rock-o,fa-hand-scissors-o,fa-hand-spock-o,fa-hashtag,fa-hdd-o,fa-headphones,fa-heart,fa-heart-o,fa-heartbeat,fa-history,fa-home,fa-hourglass,fa-hourglass-end,fa-hourglass-half,fa-hourglass-o,fa-hourglass-start,fa-i-cursor,fa-inbox,fa-industry,fa-info,fa-info-circle,fa-key,fa-keyboard-o,fa-language,fa-laptop,fa-leaf,fa-lemon-o,fa-level-down,fa-level-up,fa-life-ring,fa-lightbulb-o,fa-line-chart,fa-location-arrow,fa-lock,fa-magic,fa-magnet,fa-male,fa-map,fa-map-marker,fa-map-o,fa-map-pin,fa-map-signs,fa-meh-o,fa-microphone,fa-microphone-slash,fa-minus,fa-minus-circle,fa-minus-square,fa-minus-square-o,fa-mobile,fa-money,fa-moon-o,fa-motorcycle,fa-mouse-pointer,fa-music,fa-newspaper-o,fa-object-group,fa-object-ungroup,fa-paint-brush,fa-paper-plane,fa-paper-plane-o,fa-paw,fa-pencil,fa-pencil-square,fa-pencil-square-o,fa-percent,fa-phone,fa-phone-square,fa-picture-o,fa-pie-chart,fa-plane,fa-plug,fa-plus,fa-plus-circle,fa-plus-square,fa-plus-square-o,fa-power-off,fa-print,fa-puzzle-piece,fa-qrcode,fa-question,fa-question-circle,fa-quote-left,fa-quote-right,fa-random,fa-recycle,fa-refresh,fa-registered,fa-reply,fa-reply-all,fa-retweet,fa-road,fa-rocket,fa-rss,fa-rss-square,fa-search,fa-search-minus,fa-search-plus,fa-server,fa-share,fa-share-alt,fa-share-alt-square,fa-share-square,fa-share-square-o,fa-shield,fa-ship,fa-shopping-bag,fa-shopping-basket,fa-shopping-cart,fa-sign-in,fa-sign-out,fa-signal,fa-sitemap,fa-sliders,fa-smile-o,fa-sort,fa-sort-alpha-asc,fa-sort-alpha-desc,fa-sort-amount-asc,fa-sort-amount-desc,fa-sort-asc,fa-sort-desc,fa-sort-numeric-asc,fa-sort-numeric-desc,fa-space-shuttle,fa-spinner,fa-spoon,fa-square,fa-square-o,fa-star,fa-star-half,fa-star-half-o,fa-star-o,fa-sticky-note,fa-sticky-note-o,fa-street-view,fa-suitcase,fa-sun-o,fa-tablet,fa-tachometer,fa-tag,fa-tags,fa-tasks,fa-taxi,fa-television,fa-terminal,fa-thumb-tack,fa-thumbs-down,fa-thumbs-o-down,fa-thumbs-o-up,fa-thumbs-up,fa-ticket,fa-times,fa-times-circle,fa-times-circle-o,fa-tint,fa-toggle-off,fa-toggle-on,fa-trademark,fa-trash,fa-trash-o,fa-tree,fa-trophy,fa-truck,fa-tty,fa-umbrella,fa-university,fa-unlock,fa-unlock-alt,fa-upload,fa-user,fa-user-plus,fa-user-secret,fa-user-times,fa-users,fa-video-camera,fa-volume-down,fa-volume-off,fa-volume-up,fa-wheelchair,fa-wifi,fa-wrench".split( "," )
                        },
                        CUSTOM_ICONS = ( THEME_ICONS.custom ? THEME_ICONS.custom.split( "," ) : [] );

                    var lOptions = {
                            columnDefinitions: [
                                {
                                    name:        "d",
                                    title:       msg( "NAME" ),
                                    alignment:   "left",
                                    isRowHeader: true,
                                }
                            ],
                            filters: [
                                {
                                    name:  "search",
                                    title: msg( "SEARCH" ),
                                    type:  "search"
                                }
                            ],
                            filterLov: function( pFilters, pRenderLovEntries ) {

                                var lLovEntries  = [],
                                    filtersType  = pFilters.type,
                                    lCategory;

                                function addLovEntry( pClasses, pDisplayClass ) {
                                    lLovEntries.push({
                                        r:            pClasses,
                                        d:            pDisplayClass || pClasses,
                                        preview:      '<span class="fa ' + util.escapeHTMLAttr( pClasses ) + '"></span>'
                                    });
                                }

                                function addIcons( pIcons, pIsSpinner, pIconStyle ) {
                                    for ( var i = 0; i < pIcons.length; i++ ) {
                                        if ( !pIconStyle || pIconStyle === "default" ) {
                                            addLovEntry( pIcons[ i ] );
                                        } else {
                                            if ( pIconStyle === "small" ) {
                                                addLovEntry( "fa-sm " + pIcons[ i ], pIcons[ i ] );
                                            } else if ( pIconStyle === "large" ) {
                                                addLovEntry( "fa-lg " + pIcons[ i ], pIcons[ i ] );
                                            }
                                        }
                                    }
                                }

                                if ( isFontAPEX( filtersType ) ) {

                                    if ( pFilters.category === "" ) {
                                        for ( lCategory in APEX_ICONS ) {
                                            if ( hasOwnProperty( APEX_ICONS, lCategory )) {
                                                addIcons( APEX_ICONS[ lCategory ], ( lCategory === "SPINNER" ), pFilters.style );
                                            }
                                        }
                                    } else {
                                        addIcons( APEX_ICONS[ pFilters.category ], ( pFilters.category === "SPINNER" ), pFilters.style);
                                    }

                                    pRenderLovEntries( lLovEntries, pFilters.search );

                                } else if ( isFontAwesome( filtersType ) ) {

                                    if ( pFilters.category === "" ) {
                                        for ( lCategory in AWESOME_ICONS ) {
                                            if ( hasOwnProperty( AWESOME_ICONS, lCategory )) {
                                                addIcons( AWESOME_ICONS[ lCategory ], ( lCategory === "SPINNER" ));
                                            }
                                        }
                                    } else {
                                        addIcons( AWESOME_ICONS[ pFilters.category ], ( pFilters.category === "SPINNER" ));
                                    }

                                    pRenderLovEntries( lLovEntries, pFilters.search );

                                } else if ( filtersType === "CUSTOM" ) {

                                    addIcons( CUSTOM_ICONS, false );

                                    pRenderLovEntries( lLovEntries, pFilters.search );

                                } else if ( !filtersType || filtersType === "UTILIZED" ) {

                                    prop.metaData.lovValues( function( pLovEntries ){

                                        for ( var i = 0; i < pLovEntries.length; i++ ) {
                                            addLovEntry( pLovEntries[ i ].r );
                                        }

                                        pRenderLovEntries( lLovEntries, pFilters.search );
                                    }, pFilters );

                                }
                            },
                            resizable: true,
                            resultsDisplay: isFontAPEX( THEME_ICONS.library ) ? "grid" : "table"
                        },
                        lTypeFilter = {
                            name:         "type",
                            title:        msg( "TYPE" ),
                            type:         "buttonset",
                            defaultValue: "",
                            lov:          []
                        },
                        lStyleFilter,
                        lCategoryFilter,
                        lIcons,
                        lIconsName,
                        lIconsUrl,
                        lFilters = [],
                        themeIconLib = THEME_ICONS.library;


                    //
                    // Initialize the available icon selection based on the theme icon configuration
                    //

                    // The theme does have a custom list of icon css classes
                    if ( CUSTOM_ICONS.length > 0 ) {

                        // Add "Custom" as new selection of the "type" buttonset
                        lTypeFilter.lov.push({
                            display: msg( "CUSTOM" ),
                            value:   "CUSTOM"
                        });
                        lTypeFilter.defaultValue = "CUSTOM";
                    }

                    // The theme uses the fontawesome icon library
                    if ( $.inArray( themeIconLib, [ "FONTAPEX", "FONTAPEX_LATEST", "FONTAWESOME" ]) !== -1 ) {

                        if ( isFontAwesome( themeIconLib ) ) {
                            // FontAwesome icons are safe, we can preview them in the dialog
                            lOptions.columnDefinitions.push({
                                name:      "preview",
                                title:     msg( "PREVIEW" ),
                                alignment: "center",
                                width:     "20%",
                                escape:    false
                            });
                        }

                        // add Font APEX style
                        if ( isFontAPEX( themeIconLib ) ) {

                            // add a new column that passes the display value only
                            lStyleFilter = {
                                name:         "style",
                                title:        msg( "ICON.STYLE" ),
                                type:         "select",
                                defaultValue: "default",
                                isRequired:   true,
                                lov:          [{
                                    display: msg( "ICON.DEFAULT" ),
                                    value:   "default"
                                },
                                    {
                                        display: msg( "ICON.SMALL" ),
                                        value:   "small"
                                    },
                                    {
                                        display: msg( "ICON.LARGE" ),
                                        value:   "large"
                                    }]
                            };
                        }

                        // Add all FA categories to the category select list
                        lCategoryFilter = {
                            name:         "category",
                            title:        msg( "CATEGORY" ),
                            type:         "select",
                            defaultValue: "",
                            lov:          []
                        };

                        if ( isFontAPEX( themeIconLib ) ) {
                            var version = themeIconLib.toUpperCase().indexOf( 'LATEST' ) > -1 ? 'latest' : FONTAPEX_SHIPPING_VERSION;
                            lIcons     = APEX_ICONS;
                            lIconsName = "Font APEX";
                            lIconsUrl  = env.APEX_FILES + "libraries/font-apex/" + version + "/css/font-apex.min.css";

                        } else if ( isFontAwesome( themeIconLib ) ) {
                            lIcons     = AWESOME_ICONS;
                            lIconsName = "Font Awesome";
                            lIconsUrl  = env.APEX_FILES + "libraries/font-awesome/4.5.0/css/font-awesome.min.css";
                        }

                        for ( var lCategory in lIcons ) {
                            if ( hasOwnProperty( lIcons, lCategory )) {
                                lCategoryFilter.lov.push({
                                    display: msg( "FA." + lCategory ),
                                    value:   lCategory
                                });
                            }
                        }

                        if ( lStyleFilter ) {
                            lFilters.push( lStyleFilter );
                        }

                        lFilters.push( lCategoryFilter );

                        // Add "Font xxx" as new selection of the "type" buttonset
                        lTypeFilter.lov.unshift({
                            display: lIconsName,
                            value:   themeIconLib,
                            filters: lFilters
                        });
                        lTypeFilter.defaultValue = themeIconLib;

                        // Dynamically load icon library CSS file if it hasn't been loaded yet so that we are able to preview the icons
                        if ( !gIconFont$ ) {
                            gIconFont$ = $( '<link rel="stylesheet" type="text/css" href="' + lIconsUrl + '" />' ).appendTo( "head" );
                        }

                    }

                    // If we have at least one type entry, we add a "Utilized" selection and add the "type" buttonset
                    // to the search filters. We want to avoid that we only have the "Utilized" selection if fontawesome
                    // and custom icons are not used.
                    if ( lTypeFilter.lov.length > 0 ) {
                        lTypeFilter.lov.push({
                            display: msg( "UTILIZED" ),
                            value:   "UTILIZED"
                        });
                        lOptions.filters.unshift( lTypeFilter );
                    }


                    this.super( "init", pElement$, prop, lastComponents, lOptions );
                }
            }, $.apex.propertyEditor.PROP_TYPE.COMBOBOX );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.CODE_LANGUAGE, {
                init: function( pElement$, prop, lastComponents ) {
                    this.super( "init", pElement$, prop, lastComponents );

                    // Use the picked language the next time as default language when a code language property gets displayed
                    pElement$.on( "change", function( pEvent ) {
                        const CODE_LANGUAGE_PREF_NAME = "CODE_LANGUAGE",
                              CURRENT_PREF_VALUE = window.gPreferences[ CODE_LANGUAGE_PREF_NAME ] || "PLSQL";
                        let currentLanguage = pEvent.target.value;

                        // persist current language
                        // Can't use savePreference because code language doesn't use the same prefix as the rest of PE/PD
                        if ( currentLanguage !== "SQL" && CURRENT_PREF_VALUE !== currentLanguage ) {
                            window.gPreferences[ CODE_LANGUAGE_PREF_NAME ] = currentLanguage;
                            server.process (
                                "setPreference", {
                                    x01: CODE_LANGUAGE_PREF_NAME,
                                    x02: currentLanguage
                                }, {
                                    dataType: "", // don't expect any data back
                                    queue: {
                                        name: "setPreference_CODE_LANGUAGE",
                                        action: "lazyWrite"
                                    }
                                }
                            );
                        }
                    });
                }
            }, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MEDIA, {
                _msgWrongDataType: msg( "VAL.COLUMN_HAS_WRONG_DATA_TYPE" ),
                _getMediaObject: function( pMedia ) {
                    var lParsedJSON = {},
                        lMediaObject;

                    if ( pMedia && pMedia !== "" ) {
                        try {
                            lParsedJSON = JSON.parse( pMedia );
                        } catch ( e ) {
                            debug.error( "Invalid Media JSON; returning empty object.", e );
                        }
                    }

                    lMediaObject =  $.extend( true, {
                        source: "",
                        url: "",
                        blobColumn: "",
                        filenameColumn: "",
                        mimeTypeColumn: "",
                        lastUpdatedColumn: "" }, lParsedJSON );

                    return lMediaObject;
                },
                _getButtonText: function ( pMedia ) {
                    var lMediaObject    = this._getMediaObject( pMedia ),
                        lButtonText;

                    switch ( lMediaObject.source ) {
                        case MEDIA.SOURCES.URL:
                            lButtonText = lMediaObject.url;
                            break;
                        case MEDIA.SOURCES.BLOB_COLUMN:
                            lButtonText = lMediaObject.blobColumn;
                            break;
                        case MEDIA.SOURCES.URL_COLUMN:
                            lButtonText = lMediaObject.urlColumn;
                            break;
                        default:
                            lButtonText = msg( "MEDIA.NO_MEDIA_DEFINED" );
                            break;
                    }

                    return lButtonText;
                },
                _validateDataType( pColumnName, pLovValues, pExpectedDataType ) {
                    var lErrors = [],
                        lActualDataType;

                    if ( pColumnName ) {
                        lActualDataType = pLovValues().find( value => {
                            return value.r === pColumnName;
                        } )?.dataType;

                        if ( !model.isMatchingDataType( lActualDataType, [ pExpectedDataType ] ) ) {
                            lErrors.push( this._msgWrongDataType );
                        }
                    }
                    return lErrors;
                },
                _isValueInLovGroup( pValue, pGroup, pLovValues ) {
                    var lGroup = pLovValues.find( value => {
                        return value.group === pGroup;
                    } );

                    if ( lGroup ) {
                        return lGroup.values.some( value => {
                            return value.r === pValue;
                        } );
                    } else {
                        return false;
                    }
                },
                _filterMatchingDataType( pLovValues, pDataType ) {

                    var lIsValid,
                        lLovValues = [],
                        lWrongDataTypeLov = [];

                    pLovValues().forEach( function ( value ) {
                        lIsValid = model.isMatchingDataType( value.dataType, [ pDataType ] );

                        if ( lIsValid ) {
                            lLovValues.push( value );
                        } else {
                            value.d += " (" + value.dataType.toLowerCase() + ")";
                            lWrongDataTypeLov.push( value );
                        }
                    } );

                    if ( lWrongDataTypeLov.length > 0 ) {
                        lLovValues.push( {
                            group:  format( "LOV.COLUMN_WRONG_DATA_TYPE" ),
                            values: lWrongDataTypeLov
                        } );
                    }

                    return lLovValues;
                },
                _getDisplayGroupMedia: function ( pProperties ) {
                    return {
                        displayGroupId:     MEDIA.DISPLAY_GROUP.MEDIA,
                        displayGroupTitle:  msg( "MEDIA.MEDIA_ATTRIBUTES" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getPropertyMediaSource: function ( pProperty, pOriginalProperty ) {
                    let lovs = [ { d: msg( "MEDIA.SOURCE.URL" ), r: MEDIA.SOURCES.URL } ];
                    if ( pOriginalProperty.metaData?.referenceScope === "ROW" ) {
                        lovs.push(
                            { d: msg( "MEDIA.SOURCE.BLOB_COLUMN" ), r: MEDIA.SOURCES.BLOB_COLUMN },
                            { d: msg( "MEDIA.SOURCE.URL_COLUMN" ),  r: MEDIA.SOURCES.URL_COLUMN }
                        );
                    }
                    return $.extend( true, {
                        propertyName:           MEDIA.PROP.SOURCE,
                        value:                  "",
                        metaData: {
                            type:               $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                            prompt:             msg( "MEDIA.SOURCE" ),
                            isRequired:         true,
                            nullText:           msg( "MEDIA.NO_MEDIA" ),
                            lovValues:          lovs,
                            displayGroupId:     MEDIA.DISPLAY_GROUP.MEDIA
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },
                _getPropertyMediaUrl: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       MEDIA.PROP.URL,
                        value:              "",
                        metaData: {
                            type:           $.apex.propertyEditor.PROP_TYPE.TEXT,
                            prompt:         msg( "MEDIA.URL" ),
                            isRequired:     true,
                            displayGroupId: MEDIA.DISPLAY_GROUP.MEDIA
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },
                _getPropertyColumn(  pProperty, pOriginalProperty, pName, pIsRequired, pDataType ) {
                    return $.extend( true, {
                        propertyName:       MEDIA.PROP[ pName ],
                        value:              "",
                        metaData: {
                            type:               $.apex.propertyEditor.PROP_TYPE.SELECT_LIST,
                            prompt:             msg( "MEDIA." + pName ),
                            isRequired:         pIsRequired,
                            displayGroupId:     MEDIA.DISPLAY_GROUP.MEDIA,
                            lovValues:          this._filterMatchingDataType( pOriginalProperty.metaData.lovValues, pDataType )
                        },
                        errors:             this._validateDataType( pProperty.value, pOriginalProperty.metaData.lovValues, pDataType ),
                        warnings:           []
                    }, pProperty );
                },

                /* Property type properties and callbacks */
                noLabel: true,
                render: function( out, id, prop , lastComponents ) {
                    let lastComponent = lastComponents?.length ? lastComponents[ 0 ] : null;
                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, this._getButtonText( prop.value, lastComponent ) );
                    this.renderDivClose( out );
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    var lDisplayValue;
                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    lDisplayValue = this._getButtonText( pValue );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop, lastComponents ) {
                    var that        = this,
                        lDialogId   = "mediaDlg",
                        lDialogPEId = lDialogId + "PE";

                    this.addLabelClickHandler( pElement$, prop );
                    this.addTooltipsForErrors( pElement$, prop );

                    // the main click handler that launches the media dialog
                    pElement$.closest( "div." + PROPERTY ).on( "click", "#" + pElement$.attr( "id" ), function() {
                        var lMediaEditDlg$,
                            out = util.htmlBuilder(),
                            lPropertySet = [],
                            lMediaObject = that._getMediaObject( prop.value );

                        function _getProperty ( pPropertyName ) {
                            var lProperty;
                            for ( let i = 0; i < lPropertySet.length; i++ ) {
                                for ( let j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                    if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                        lProperty = lPropertySet[ i ].properties[ j ];
                                        break;
                                    }
                                }
                            }
                            return lProperty;
                        }

                        function _addError( pProperty, pErrorMsg ) {
                            pProperty.errors.push( pErrorMsg );
                            return pProperty;
                        }

                        // Set the default source
                        if  ( lMediaObject.source === "" ) {
                            if ( prop.metaData.lovValues().some( function ( value ) {
                                return value.dataType === "BLOB";
                            } )  ) {
                                lMediaObject.source = MEDIA.SOURCES.BLOB_COLUMN;
                            }
                        }

                        lPropertySet.push (
                            that._getDisplayGroupMedia( [
                                that._getPropertyMediaSource({
                                    value: lMediaObject.source,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly,
                                        isRequired: prop.metaData.isRequired
                                    }
                                }, prop ),
                                that._getPropertyMediaUrl({
                                    value: lMediaObject.url,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop ),
                                that._getPropertyColumn({
                                    value: lMediaObject.blobColumn,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop, "BLOB_COLUMN", true, "BLOB" ),
                                that._getPropertyColumn({
                                    value: lMediaObject.filenameColumn,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop, "FILENAME_COLUMN", false, "VARCHAR2" ),
                                that._getPropertyColumn({
                                    value: lMediaObject.mimeTypeColumn,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop, "MIME_TYPE_COLUMN", false, "VARCHAR2" ),
                                that._getPropertyColumn({
                                    value: lMediaObject.lastUpdatedColumn,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop, "LAST_UPDATED_COLUMN", false, "DATE" ),
                                that._getPropertyColumn({
                                    value: lMediaObject.urlColumn,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                }, prop, "URL_COLUMN", false, "VARCHAR2" )
                            ])
                        );

                        // create dialog div
                        out.markup( "<div" )
                            .attr( "id", lDialogId )
                            .attr( "title", msg( "MEDIA.TITLE" ) )
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", lDialogPEId )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lMediaEditDlg$ = $( out.toString() ).dialog( {
                            modal:          true,
                            closeText:      lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            minWidth:       400,
                            width:          500,
                            dialogClass:    DIALOG_FLUSH_BODY,
                            create: function() {
                                $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                            },
                            close: function() {
                                $( "#" + lDialogPEId ).propertyEditor( "destroy" );
                                $( "#" + lDialogId ).dialog( "destroy" );
                            },
                            open: function() {
                                var lMediaDlgPE$ = $( "#" + lDialogPEId );

                                function _showProperties( pSource ) {
                                    var lProperty = {
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    };
                                    var lPrevPropertyName = MEDIA.PROP.SOURCE;

                                    function _addProperty( pProp ) {

                                        lMediaDlgPE$.propertyEditor( "addProperty", {
                                            property:           pProp,
                                            prevPropertyName:   lPrevPropertyName,
                                            displayGroup:       that._getDisplayGroupMedia()
                                        });
                                    }

                                    function _addColumnProperty( pColumnName, pIsRequired, pDataType ) {
                                        _addProperty( that._getPropertyColumn( lProperty, prop, pColumnName, pIsRequired, pDataType ) );
                                        lPrevPropertyName = MEDIA.PROP[ pColumnName ];
                                    }

                                    function _removeProperties( ...pNames ) {
                                        pNames.forEach( pName => {
                                            lMediaDlgPE$.propertyEditor( "removeProperty", pName );
                                        });
                                    }

                                    switch ( pSource ) {
                                        case MEDIA.SOURCES.URL:
                                            _addProperty( that._getPropertyMediaUrl( lProperty, prop ) );

                                            _removeProperties(
                                                MEDIA.PROP.BLOB_COLUMN,
                                                MEDIA.PROP.FILENAME_COLUMN,
                                                MEDIA.PROP.MIME_TYPE_COLUMN,
                                                MEDIA.PROP.LAST_UPDATED_COLUMN,
                                                MEDIA.PROP.URL_COLUMN );

                                            break;
                                        case MEDIA.SOURCES.URL_COLUMN:
                                            _addColumnProperty( "URL_COLUMN", true, "VARCHAR2" );

                                            _removeProperties(
                                                MEDIA.PROP.URL,
                                                MEDIA.PROP.BLOB_COLUMN,
                                                MEDIA.PROP.FILENAME_COLUMN,
                                                MEDIA.PROP.MIME_TYPE_COLUMN,
                                                MEDIA.PROP.LAST_UPDATED_COLUMN );

                                            break;
                                        case MEDIA.SOURCES.BLOB_COLUMN:

                                            _removeProperties(
                                                MEDIA.PROP.URL,
                                                MEDIA.PROP.URL_COLUMN );

                                            _addColumnProperty( "BLOB_COLUMN", true, "BLOB" );
                                            _addColumnProperty( "FILENAME_COLUMN", false, "VARCHAR2" );
                                            _addColumnProperty( "MIME_TYPE_COLUMN", false, "VARCHAR2" );
                                            _addColumnProperty( "LAST_UPDATED_COLUMN", false, "DATE" );

                                            break;
                                        default:
                                            _removeProperties(
                                                MEDIA.PROP.URL,
                                                MEDIA.PROP.BLOB_COLUMN,
                                                MEDIA.PROP.FILENAME_COLUMN,
                                                MEDIA.PROP.MIME_TYPE_COLUMN,
                                                MEDIA.PROP.LAST_UPDATED_COLUMN,
                                                MEDIA.PROP.URL_COLUMN );
                                            break;
                                    }
                                }

                                lMediaDlgPE$.propertyEditor( {
                                    focusPropertyName: MEDIA.PROP.SOURCE,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false,
                                        lastComponents: lastComponents
                                    },
                                    change: function( pEvent, pData ) {
                                        if ( pData.propertyName === MEDIA.PROP.SOURCE ) {
                                            _showProperties( _getProperty( MEDIA.PROP.SOURCE ).value );
                                        }

                                        // fixes issue where new properties added have stale values in lPropertySet
                                        _getProperty( pData.propertyName ).value = pData.property.value;
                                    }
                                });

                                _showProperties( _getProperty( MEDIA.PROP.SOURCE ).value );

                                $( "#" + lDialogId ).dialog({
                                    position: { 'my': 'center', 'at': 'center', of: window  }
                                });
                            },
                            buttons: [
                                {
                                    text:  msg( "CANCEL" ),
                                    click: function() {
                                        $( "#" + lDialogId ).dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "CLEAR" ),
                                    disabled:   prop.metaData.isRequired || prop.metaData.isReadOnly,
                                    click:      function() {
                                        $( "#" + lDialogPEId ).propertyEditor( "updatePropertyValue", MEDIA.PROP.SOURCE, "" );
                                        that.setValue( pElement$, prop, "" );
                                        pElement$.trigger( "change" );
                                        that.setFocus( pElement$ );
                                        $( "#" + lDialogId ).dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "OK" ),
                                    class:      BUTTON_HOT,
                                    disabled:   prop.metaData.isReadOnly,
                                    click: function() {
                                        var lErrorProps = [],
                                            lSource = _getProperty( MEDIA.PROP.SOURCE ),
                                            lProp,
                                            lProps,
                                            lMediaDlgPE$ = $( "#" + lDialogPEId ),
                                            lPropValue = {
                                                source: lSource.value
                                            };

                                        const
                                            COLUMN_WRONG_DATA_TYPE = lang.getMessage(
                                                                         "MODEL.LOV.COLUMN_WRONG_DATA_TYPE" ),
                                            IS_REQUIRED = msg( "IS_REQUIRED" );

                                        function _validateColumnValue( pProp, pValue, pIsRequired ){
                                            if ( pIsRequired && pValue === "" ) {
                                                lErrorProps.push(  _addError( pProp, IS_REQUIRED ) );
                                            } else if ( pValue && that._isValueInLovGroup( pValue,  COLUMN_WRONG_DATA_TYPE, pProp.metaData.lovValues ) ) {
                                                lErrorProps.push(  _addError( pProp, that._msgWrongDataType ) );
                                            }
                                        }

                                        lSource.errors = [];

                                        switch ( lPropValue.source ) {
                                            case MEDIA.SOURCES.URL:
                                                lProp = _getProperty( MEDIA.PROP.URL );
                                                lProp.errors = [];

                                                lPropValue.url = lProp.value;
                                                if ( lPropValue.url === "" ) {
                                                    lErrorProps.push(  _addError( lProp, IS_REQUIRED ) );
                                                }
                                                break;
                                            case MEDIA.SOURCES.URL_COLUMN:
                                                lProp = _getProperty( MEDIA.PROP.URL_COLUMN );
                                                lProp.errors = [];

                                                lPropValue.urlColumn = lProp.value;
                                                _validateColumnValue( lProp, lPropValue.urlColumn, true );
                                                break;
                                            case MEDIA.SOURCES.BLOB_COLUMN:
                                                lProps = {
                                                    blobColumn:         _getProperty( MEDIA.PROP.BLOB_COLUMN ),
                                                    filenameColumn:     _getProperty( MEDIA.PROP.FILENAME_COLUMN ),
                                                    mimeTypeColumn:     _getProperty( MEDIA.PROP.MIME_TYPE_COLUMN ),
                                                    lastUpdatedColumn:  _getProperty( MEDIA.PROP.LAST_UPDATED_COLUMN )
                                                };

                                                lProps.blobColumn.errors        = [];
                                                lProps.filenameColumn.errors    = [];
                                                lProps.mimeTypeColumn.errors    = [];
                                                lProps.lastUpdatedColumn.errors = [];

                                                lPropValue.blobColumn           = lProps.blobColumn.value;
                                                lPropValue.filenameColumn       = lProps.filenameColumn.value;
                                                lPropValue.mimeTypeColumn       = lProps.mimeTypeColumn.value;
                                                lPropValue.lastUpdatedColumn    = lProps.lastUpdatedColumn.value;

                                                _validateColumnValue( lProps.blobColumn, lPropValue.blobColumn, true );
                                                _validateColumnValue( lProps.filenameColumn, lPropValue.filenameColumn, false );
                                                _validateColumnValue( lProps.mimeTypeColumn, lPropValue.mimeTypeColumn, false );
                                                _validateColumnValue( lProps.lastUpdatedColumn, lPropValue.lastUpdatedColumn, false );
                                                break;
                                            default:
                                                if ( prop.metaData.isRequired ) {
                                                    lErrorProps.push( _addError( lSource, msg( "IS_REQUIRED" ) ) );
                                                }
                                                break;
                                        }

                                        if ( lErrorProps.length === 0 ) {
                                            that.setValue( pElement$, prop, JSON.stringify( lPropValue ) );
                                            pElement$.trigger( "change" );
                                            lMediaEditDlg$.dialog( "close" );
                                        } else {
                                            for ( var i = 0; i < lErrorProps.length; i++ ) {
                                                lMediaDlgPE$.propertyEditor( "updateProperty", lErrorProps[ i ] );
                                            }
                                        }
                                    }
                                }
                            ]
                        } );

                    } );
                }
            } );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.CSS,                   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.JAVASCRIPT,            null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.HTML,                  null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL,                 null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_EXPR_VARCHAR,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_EXPR_BOOLEAN,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_EXPR_CUSTOM,     null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_FUNC_VARCHAR,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_FUNC_CLOB,       null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_FUNC_BOOLEAN,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_FUNC_CUSTOM,     null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.PLSQL_FUNC_SQL,        null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS,                null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_EXPR_VARCHAR,   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_EXPR_BOOLEAN,   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_EXPR_CUSTOM,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_FUNC_VARCHAR,   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_FUNC_CLOB,      null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_FUNC_BOOLEAN,   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_FUNC_CUSTOM,    null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.MLE_JS_FUNC_SQL,       null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SQL,                   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SQL_EXPR,              null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SQL_EXPR_BOOLEAN,      null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SQL_EXPR_CUSTOM,       null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.WHERE_CLAUSE,          null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.ORDER_BY_CLAUSE,       null, $.apex.propertyEditor.PROP_TYPE.TEXT );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.XML,                   null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.FILE_URLS_JAVASCRIPT,  null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.FILE_URLS_CSS,         null, PROP_TYPE.TEXT_EDITOR );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.SESSION_STATE_VALUE,   null, PROP_TYPE.COLUMN );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.TEMPLATE_OPTIONS_GENERAL, {

                init: function( pElement$, prop, lastComponents ) {

                    var lDefaultCheckboxes$ = $(),
                        i;

                    function _setDefaultOptions( ) {

                        var lChecked = $( this ).prop( "checked" );

                        if ( lChecked ) {
                            lDefaultCheckboxes$.prop( "checked", true );
                        }

                        lDefaultCheckboxes$.prop( "disabled", lChecked );

                    } // _setDefaultOptions


                    // call base checkboxes
                    this.super( "init", pElement$, prop, lastComponents );

                    this.checkboxes$      = pElement$.find( "input[type=checkbox]" );
                    this.defaultCheckbox$ = this.checkboxes$.filter( "[value='#DEFAULT#']" );

                    // Get all default template options checkboxes
                    for ( i = 0; i < prop.metaData.defaultTemplateOptions.length; i++ ) {
                        lDefaultCheckboxes$ =
                            lDefaultCheckboxes$.add( this.checkboxes$.filter( "[value='" + util.escapeCSS( prop.metaData.defaultTemplateOptions[ i ]) + "']" ));
                    }

                    this.defaultCheckbox$
                        .on( "click setdefaultcheckboxes", _setDefaultOptions )
                        .trigger( "setdefaultcheckboxes" );
                },
                getValue: function( /* pProperty$ */ ) {
                    var lValues = [];

                    // ignore default options
                    this.checkboxes$.filter( ":checked:not(:disabled)" ).each( function() {
                        lValues.push( this.value );
                    });
                    return lValues.join( ":" );
                },
                setValue: function( pElement$, prop, value, lastComponents ) {
                    this.super( "setValue", pElement$, prop, value, lastComponents );
                    this.defaultCheckbox$.trigger( "setdefaultcheckboxes" );
                }

            }, $.apex.propertyEditor.PROP_TYPE.CHECKBOXES );

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.TEMPLATE_OPTIONS, {

                _getProperties: function( pProperty$, prop, lastComponents ) {
                    return templateOptionsHelper.getProperties( this.templateOptions[ lastComponents[ 0 ].typeId ], this.getValue( pProperty$ ).split( ":" ), prop.metaData.isReadOnly, prop);
                },

                _getDisplayValue: function( prop, propValue, lastComponents ) {
                    var lValuesMap,
                        lDisplayValues = [],
                        lValue = propValue,
                        isEmptyVal = $.isEmptyObject( lValue ),
                        lValues,
                        displayVal;

                    if ( lastComponents ) {

                        if ( !this.templateOptions ) {
                            this.templateOptions = {};
                        }

                        // Need to store template options for the specific type, for components that have template options at both region, and
                        // attribute level (eg classic reports, lists) (bug #31974095).
                        //
                        // Note: Safe to use lastComponents[ 0 ], because we only support editing multiple template options for components of the same
                        // type (and referencing the same template)
                        this.templateOptions[ lastComponents[ 0 ].typeId ] = model.getTemplateOptions( lastComponents[ 0 ].getProperty( prop.propertyName ) );
                    }

                    if ( isEmptyVal && lastComponents.length > 1 ) {

                        displayVal = msg( "PROPERTY.VALUE_VARIES" );

                    } else {

                        lValues = lValue.split( ":" );

                        if ( lValue === "" ) {
                            displayVal = msg( "TEMPLATE_OPTIONS.NONE_SELECTED" );
                        } else {

                            lValuesMap = this.templateOptions[ lastComponents[ 0 ].typeId ].valuesMap;

                            for ( var i = 0; i < lValues.length; i++ ) {
                                if ( hasOwnProperty( lValuesMap, lValues[ i ] )) {
                                    lDisplayValues.push( lValuesMap[ lValues[ i ] ].d );
                                } else {
                                    lDisplayValues.push( formatNoEscape( "LOV.UNKNOWN_LOOKUP", lValues[ i ] ));
                                }
                            }

                            displayVal = lDisplayValues.join( ", " );
                        }

                    }

                    return displayVal;
                },

                /* Property type properties and callbacks */
                noLabel: true,
                render: function( out, id, prop, lastComponents ) {
                    const
                        lDisplayValue = this._getDisplayValue( prop, prop.value, lastComponents ),
                        // If the template options just contain the #DEFAULT# entry then there is no need to open
                        // the dialog. This will give developers a immediate feedback if options are available
                        lIsDisabled = ( this.templateOptions[ lastComponents[ 0 ].typeId ].values.length < 2 );
                    let lValueInDom = prop.value;

                    if ( $.isEmptyObject( lValueInDom ) && prop.metaData && prop.metaData.multiSelectData ) {
                        // unique values from all selected components
                        if ( prop.metaData.multiSelectData.domValues ) {
                            lValueInDom = prop.metaData.multiSelectData.domValues;
                        } else {
                            lValueInDom = Object.keys( prop.metaData.multiSelectData.indeterminateMap ).join( ':' );
                        }
                    }

                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, lDisplayValue, lValueInDom, lIsDisabled );
                    this.renderDivClose( out );
                },
                init: function( pElement$, prop, lastComponents ) {
                    var that                = this,
                        aProperty$          = pElement$.closest( "div." + PROPERTY ),
                        md                  = prop.metaData,
                        isMultiSelected     = md.multiSelectData,
                        // A reliable way to look for "Template" select list
                        // and determine "Template Options" visibility. Bug 30922515
                        templatePropId      = md.parentProperty.id,
                        templateSelect$     = $( "[data-property-id='" + templatePropId + "']" ).closest( ".a-Property" ),
                        hasNoCommonParent   = templateSelect$.length === 0,
                        isTemplateVaries    = templateSelect$.hasClass( 'is-variable' );

                    if ( isMultiSelected && ( hasNoCommonParent || isTemplateVaries ) ) {
                        aProperty$.hide();

                    } else {

                        that.addLabelClickHandler( pElement$, prop );
                        that.addTooltipsForErrors( pElement$, prop );
                        // the main click handler that launches the link dialog
                        aProperty$.on( "click", "#" + pElement$.attr( "id" ), function() {

                            var lDialog$,
                                lProperties = that._getProperties( pElement$.closest( "div." + PROPERTY ), prop, lastComponents ), //todo change to use lElement$
                                out         = util.htmlBuilder();

                            // create dialog div
                            out.markup( "<div" )
                                .attr( "id", "templateOptionsDlg" )
                                .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                                .markup( ">" )
                                .markup( "<div" )
                                .attr( "id", "templateOptionsDlgPE" )
                                .markup( ">" )
                                .markup( "</div>" )
                                .markup( "</div>" );

                            lDialog$ = $( out.toString() ).dialog({
                                modal:       true,
                                closeText:   lang.getMessage( "APEX.DIALOG.CLOSE" ),
                                minWidth:    400,
                                width:       520,
                                dialogClass: DIALOG_FLUSH_BODY,
                                create: function() {
                                    $( this ).closest( ".ui-dialog" ).attr( "aria-modal", true );
                                },
                                close: function() {
                                    $( "#templateOptionsDlgPE" ).propertyEditor( "destroy" );
                                    lDialog$.dialog( "destroy" );
                                },
                                open: function() {
                                    var lDialogPE$ = $( "#templateOptionsDlgPE" );
                                    lDialogPE$.propertyEditor( {
                                        focusPropertyName: "general",
                                        hideDisplayGroups: ( lProperties.advanced.length === 0 ),
                                        data: {
                                            propertySet: [
                                                {
                                                    displayGroupId:    "common",
                                                    displayGroupTitle: msg( "TEMPLATE_OPTIONS.COMMON" ),
                                                    properties:        lProperties.common
                                                },
                                                {
                                                    displayGroupId:    "advanced",
                                                    displayGroupTitle: msg( "TEMPLATE_OPTIONS.ADVANCED" ),
                                                    properties:        lProperties.advanced
                                                }
                                            ]
                                        },
                                        change: function( /* pEvent, pData */ ) {
                                        }
                                    });

                                    $( "#templateOptionsDlg" ).dialog({
                                        position: { 'my': 'center', 'at': 'center', of: window }
                                    });
                                },
                                buttons: [
                                    {
                                        text:  msg( "CANCEL" ),
                                        click: function() {
                                            lDialog$.dialog( "close" );
                                        }
                                    },
                                    {
                                        text:     msg( "OK" ),
                                        "class":    BUTTON_HOT,
                                        disabled: prop.metaData.isReadOnly,
                                        click:    function() {
                                            var lDialogPE$ = $( "#templateOptionsDlgPE" ),
                                                lValues = templateOptionsHelper.getValuesFromDialog( lProperties, lDialogPE$),
                                                //
                                                multiSelectData = prop.metaData.multiSelectData,
                                                components,
                                                propertyId,
                                                indeterminateMap,
                                                indeterminateValues = [],
                                                i;

                                            if ( multiSelectData ) {
                                                components = multiSelectData.components;
                                                indeterminateMap = multiSelectData.indeterminateMap;
                                                propertyId = prop.propertyName === 'general' ? prop.propertyId : prop.propertyName;// todo doc

                                                var getIndeterminateValues = function(){
                                                    var indeterminateValues = [];

                                                    lDialogPE$
                                                        .find( 'select.is-variable > option' )
                                                        .each(function(){
                                                            var optionValue;
                                                            // find option value of an select entry
                                                            optionValue = $( this ).attr( 'value' );

                                                            if ( indeterminateMap[ optionValue ] === false ) {
                                                                indeterminateValues.push( optionValue );
                                                            }

                                                        });

                                                    lDialogPE$
                                                        .find( 'input' )    // checkboxes
                                                        .each(function(){
                                                            var cb$ = $( this );
                                                            if ( cb$.prop( 'indeterminate' ) ) {
                                                                indeterminateValues.push( cb$.val() );
                                                            }
                                                        });

                                                    return indeterminateValues;
                                                };

                                                indeterminateValues = getIndeterminateValues();

                                                for ( i = 0; i < components.length; i++ ){
                                                    components[ i ].getProperty( propertyId )._indeterminateValues = indeterminateValues;
                                                }

                                                // store values to be used as button value.
                                                multiSelectData.domValues = lValues.concat( indeterminateValues ).join( ":" );
                                                prop.hasIndeterminate = indeterminateValues.length > 0;
                                            }

                                            // and store the concatenated result in our "Template Options" property
                                            that.setValue( pElement$, prop, lValues.join( ":" ) , lastComponents );
                                            pElement$.trigger( "change" );

                                            that.setFocus( pElement$ );
                                            lDialog$.dialog( "close" );
                                        }
                                    }
                                ]
                            });
                        });
                    }
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {

                    var lDisplayValue;
                    this.super( "setValue", pElement$, prop, pValue );
                    // update the button text accordingly
                    if ( !prop.hasIndeterminate ) {
                        lDisplayValue = this._getDisplayValue( prop, pValue, lastComponents );
                        pElement$
                            .text( lDisplayValue )
                            .attr( "title", lDisplayValue );
                    }
                }
            });


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.STATIC_LOV, {

                _getLov: function( pLovValues ) {
                    return getStaticLovObject( pLovValues );
                },

                /* Internal helper functions */
                _getButtonText: function( pLovValues ) {

                    var lButtonText = msg( "LINK.NO_LINK_DEFINED" ),
                        lov = this._getLov( pLovValues );

                    if ( lov.values.length > 0 ) {
                        for ( var i = 0; i < lov.values.length; i++ ) {
                            if ( i === 0 ) {
                                lButtonText = "";
                            } else {
                                lButtonText += ", ";
                            }
                            lButtonText += lov.values[ i ].displayValue || lov.values[ i ].returnValue;
                        }
                    }
                    return lButtonText;
                },

                /* Internal functions, storing the widget's metadata */
                _getDisplayGroupValues: function ( pProperties ) {
                    return {
                        displayGroupId:     STATIC_LOV.GROUP.VALUES,
                        displayGroupTitle:  msg( "STATIC_LOV.GROUP.VALUES" ),
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getDisplayGroupSort: function ( pProperties ) {
                    return {
                        displayGroupId:     STATIC_LOV.GROUP.SORT,
                        displayGroupTitle:  msg( "STATIC_LOV.GROUP.SORT" ),
                        collapsed:          true,
                        properties:         ( pProperties ) ? pProperties : []
                    };
                },
                _getPropertyValues: function ( pProperty, pOriginalProperty ) {
                    return $.extend( true, {
                        propertyName:           STATIC_LOV.PROP.VALUES,
                        value:                  [],
                        metaData: {
                            type:               PROP_TYPE.STATIC_LOV_VALUES,
                            prompt:             msg( "STATIC_LOV.PROP.VALUES" ),
                            displayGroupId:     STATIC_LOV.GROUP.VALUES,
                            originalProperty:   pOriginalProperty
                        },
                        errors:                 [],
                        warnings:               []
                    }, pProperty );
                },
                _getPropertySort: function ( pProperty ) {
                    return $.extend( true, {
                        propertyName:       STATIC_LOV.PROP.SORT,
                        value:              "Y",
                        metaData: {
                            prompt:         msg( "STATIC_LOV.PROP.SORT" ),
                            type:           $.apex.propertyEditor.PROP_TYPE.YES_NO,
                            noValue:        "N",
                            yesValue:       "Y",
                            displayGroupId: STATIC_LOV.GROUP.SORT,
                            isRequired:     true
                        },
                        errors:             [],
                        warnings:           []
                    }, pProperty );
                },

                /* Property type properties and callbacks */
                noLabel: true,
                render: function( out, id, prop /*, lastComponents */ ) {
                    this.renderDivOpen( out, { "class": PROPERTY_FIELD_CONTAINER } );
                    renderPropertyButton( out, id, prop, this._getButtonText( prop.value ) );
                    this.renderDivClose( out );
                },
                setValue: function( pElement$, prop, pValue, lastComponents ) {
                    var lDisplayValue;

                    this.super( "setValue", pElement$, prop, pValue, lastComponents );

                    // update the button text accordingly
                    lDisplayValue = this._getButtonText( pValue );
                    pElement$
                        .text( lDisplayValue )
                        .attr( "title", lDisplayValue );

                },
                init: function( pElement$, prop /*, lastComponents */ ) {
                    var that = this;

                    this.addLabelClickHandler( pElement$, prop );
                    this.addTooltipsForErrors( pElement$, prop );

                    // the main click handler that launches the lov dialog
                    pElement$.closest( "div." + PROPERTY ).on( "click", "#" + pElement$.attr( "id" ), function() {
                        var lStaticLovDlg$,
                            out = util.htmlBuilder(),
                            lValue = pElement$.val(),
                            lStaticLovObject = that._getLov( lValue ),
                            lPropertySet = [],
                            lIsReadOnly = prop.metaData.isReadOnly;

                        function _getProperty ( pPropertyName ) {
                            var i, j, lProperty;
                            for ( i = 0; i < lPropertySet.length; i++ ) {
                                for ( j = 0; j < lPropertySet[ i ].properties.length; j++ ) {
                                    if ( lPropertySet[ i ].properties[ j ].propertyName === pPropertyName ) {
                                        lProperty = lPropertySet[ i ].properties[ j ];
                                        break;
                                    }
                                }
                            }
                            return lProperty;
                        }

                        lPropertySet.push (
                            that._getDisplayGroupValues( [
                                that._getPropertyValues({
                                        value: lStaticLovObject.values,
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    },
                                    prop )
                            ])
                        );

                        lPropertySet.push (
                            that._getDisplayGroupSort( [
                                that._getPropertySort({
                                    value: lStaticLovObject.sort,
                                    metaData: {
                                        isReadOnly: prop.metaData.isReadOnly
                                    }
                                })
                            ])
                        );

                        // create dialog div
                        out.markup( "<div" )
                            .attr( "id", "staticLovDlg" )
                            .attr( "title", prop.metaData.prompt ) // escaping done by jQueryUI dialog
                            .markup( ">" )
                            .markup( "<div" )
                            .attr( "id", "staticLovDlgPE" )
                            .markup( ">" )
                            .markup( "</div>" )
                            .markup( "</div>" );

                        lStaticLovDlg$ = $( out.toString() ).dialog( {
                            modal:          true,
                            closeText:      lang.getMessage( "APEX.DIALOG.CLOSE" ),
                            minWidth:       400,
                            width:          520,
                            dialogClass:    DIALOG_FLUSH_BODY,
                            create: function() {
                                const dialog$ = $( this ).closest( ".ui-dialog" );
                                dialog$.attr( "aria-modal", true );
                                dialog$.find( ".ui-dialog-title" )
                                    .attr( ATTR_ROLE, "heading" )
                                    .attr( ARIA_LEVEL, "1" )
                                    .attr( ARIA_ROLEDESCRIPTION, lang.getMessage( "APEX.DIALOG.TITLE" ) );
                                dialog$.children( ".ui-dialog-buttonpane" )
                                    .attr( ATTR_ROLE, "region" )
                                    .attr( "aria-label", msg( "ACTIONS" ) );
                            },
                            close: function() {
                                $( "#staticLovDlgPE" ).propertyEditor( "destroy" );
                                lStaticLovDlg$.dialog( "destroy" );
                            },
                            open: function() {
                                var lStaticLovDlgPE$ = $( "#staticLovDlgPE" );
                                /*
                                    // TODO still needed?
                                    lProperty = {
                                        metaData: {
                                            isReadOnly: prop.metaData.isReadOnly
                                        }
                                    };
                                */

                                lStaticLovDlgPE$.propertyEditor( {
                                    focusPropertyName: STATIC_LOV.PROP.VALUES,
                                    data: {
                                        propertySet:    lPropertySet,
                                        multiEdit:      false
                                    }
                                });

                                /*
                                // TODO why do we need this?
                                lStaticLovDlgPE$.propertyEditor( "addProperty", {
                                    property:           that._getPropertyValues( lProperty, prop ),
                                    displayGroup:       that._getDisplayGroupValues()
                                });

                                lStaticLovDlgPE$.propertyEditor( "addProperty", {
                                    property:           that._getPropertySort( lProperty ),
                                    displayGroup:       that._getDisplayGroupSort(),
                                    prevDisplayGroupId: STATIC_LOV.GROUP.VALUES
                                });
                                */

                                $( "#staticLovDlg" ).dialog({
                                    position: { 'my': 'center', 'at': 'center', of: window  }
                                });
                            },
                            buttons: [
                                {
                                    text:       msg( "CANCEL" ),
                                    click:      function() {
                                        lStaticLovDlg$.dialog( "close" );
                                    }
                                },
                                {
                                    text:       msg( "OK" ),
                                    "class":    BUTTON_HOT,
                                    disabled:   lIsReadOnly,
                                    click:      function() {
                                        var lValue,
                                            lLovValues,
                                            lErrorProp;

                                        lLovValues = _getProperty( STATIC_LOV.PROP.VALUES ).value;
                                        lValue     = getStaticLovString( _getProperty( STATIC_LOV.PROP.SORT ).value, lLovValues );

                                        if ( lLovValues.length > 0 ) {
                                            that.setValue( pElement$, prop, lValue );
                                            pElement$.trigger( "change" );
                                            that.setFocus( pElement$ );
                                            lStaticLovDlg$.dialog( "close" );
                                        } else {
                                            lErrorProp = _getProperty( STATIC_LOV.PROP.VALUES, msg( "IS_REQUIRED" ) );
                                            lErrorProp.errors.push( msg( "IS_REQUIRED" ) );
                                            $( "#staticLovDlgPE" ).propertyEditor( "updateProperty", lErrorProp );
                                        }
                                    }
                                }
                            ]
                        });
                    });
                }
            } );


            $.apex.propertyEditor.addPropertyType( PROP_TYPE.STATIC_LOV_VALUES, {
                stacked:        true,
                noLabel:        true,
                labelVisible:   false,
                minHeight:      122,
                maxHeight:      200,
                render:     function( out, id, prop /*, lastComponents */ ) {
                    const lLabelId    = id + "_label";

                    // The accessible content of this container is the grid only, thus no need to add role=group
                    // and aria-label to this DIV, nothing to group here.
                    out.markup( "<div" )
                        .attr( "id", id )
                        .attr( "class", PROPERTY_FIELD_CONTAINER )
                        .attr( DATA_PROPERTY_ID, prop.propertyName )
                        .markup( ">" );

                    out.markup( "<table role='grid'" )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_TABLE )
                        .attr( ARIA_LABELLEDBY, lLabelId )
                        .markup( "><thead><tr><th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.VALUE.DISPLAY" ) )
                        .markup( "</th><th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_HEADER_HEADER )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.VALUE.RETURN" ) )
                        .markup( "</th><th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.REMOVE" ) )
                        .markup( "</th><th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.MOVE_UP" ) )
                        .markup( "</th><th" )
                        .attr( ATTR_SCOPE, SCOPE_COL )
                        .attr( "class", VISUALLY_HIDDEN )
                        .markup( ">" )
                        .content( msg( "STATIC_LOV.MOVE_DOWN" ) )
                        .markup( "</th></tr></thead><tbody>" );

                    for ( var i = 0; i < prop.value.length; i++ ) {
                        this._renderRow( out, {
                            rowId:        i + 1,
                            idPrefix:     id,
                            returnValue:  prop.value[ i ].returnValue,
                            displayValue: prop.value[ i ].displayValue,
                            readOnly:     prop.metaData.isReadOnly,
                            lastRow:      false
                        });
                    }

                    // If the property is currently editable, render an additional row for new STATIC_LOV entries
                    if ( !prop.metaData.isReadOnly ) {
                        this._renderRow( out, {
                            rowId:      prop.value.length + 1,
                            idPrefix:   id,
                            lastRow:    true
                        });
                    }
                    out.markup( "</tbody></table>" );

                    this.renderDivClose( out );
                },
                init: function( pElement$, prop /*, lastComponents */ ) {

                    var that = this,
                        lProperty$ = pElement$.closest( "div." + PROPERTY ),
                        lId = pElement$.attr( "id" );

                    function swapValue( pInputs1$, pInputs2$, pClass ) {
                        var lInput1$ = pInputs1$.filter( "input." + pClass ),
                            lInput2$ = pInputs2$.filter( "input." + pClass ),
                            lInput1Value = lInput1$.val(),
                            lInput2Value = lInput2$.val();

                        lInput1$.val( lInput2Value );
                        lInput2$.val( lInput1Value );
                    }

                    // Only add interactivity if property is editable
                    if ( !prop.metaData.isReadOnly ) {
                        lProperty$
                            .on( "change", "input", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" ),
                                    lNewRow = util.htmlBuilder(),
                                    lMoveDown = util.htmlBuilder(),
                                    lInput$ = $( this );

                                if ( lInput$.val() && lNext$.length === 0 ) {
                                    var lMaxRow = $( "input." + STATIC_LOV_VALUE_DISPLAY ).length;
                                    that._renderRow( lNewRow, {
                                        rowId:      lMaxRow + 1,
                                        idPrefix:   lId,
                                        lastRow:    true
                                    });
                                    that.renderIconButton( lMoveDown, {
                                        id:         lId + "_rowMoveDown_" + lMaxRow,
                                        icon:       ICON_MOVE_DOWN,
                                        text:       format( "STATIC_LOV.MOVE_DOWN_VALUE_N", lMaxRow ),
                                    });
                                    lInput$
                                        .closest( "tr" )
                                        .find( "td:last" )
                                        .html( lMoveDown.toString())
                                        .end()
                                        .after( lNewRow.toString());
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowRemove_]", function() {
                                var lNext$ = $( this ).closest( "tr" ).next( "tr" );

                                if ( lNext$.length > 0 ) {
                                    $( this )
                                        .closest( "tr" )
                                        .remove();

                                    lNext$.find( ":input:first" ).trigger( "change" ).trigger( "focus" );
                                } else {
                                    // If it's the last row, just clear the values
                                    $( this )
                                        .closest( "tr" )
                                        .find( "input" )
                                        .val( "" )
                                        .filter( "input." + STATIC_LOV_VALUE_DISPLAY )
                                        .trigger( "change" )
                                        .trigger( "focus" );
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowMoveUp_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lPrevious$ = $( this ).closest( "tr" ).prev( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( ":input");

                                if ( lPrevious$.length > 0 ) {
                                    swapValue( lCurrent$, lPrevious$, STATIC_LOV_VALUE_DISPLAY );
                                    swapValue( lCurrent$, lPrevious$, STATIC_LOV_VALUE_RETURN );
                                    lPrevious$.filter( "button[id^=" + lId + "_rowMove]:first" ).trigger( "focus" );
                                    lCurrent$.trigger( "change" );
                                }
                            })
                            .on( "click", "button[id^=" + lId + "_rowMoveDown_]", function() {
                                var lCurrent$ = $( this ).closest( "tr" ).find( ":input" ),
                                    lNext$ = $( this ).closest( "tr" ).next( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( ":input");

                                if ( lNext$.length > 0 ) {
                                    swapValue( lCurrent$, lNext$, STATIC_LOV_VALUE_DISPLAY );
                                    swapValue( lCurrent$, lNext$, STATIC_LOV_VALUE_RETURN );
                                    lNext$.trigger( "change" );
                                    $( this ).closest( "tr" ).next( "tr." + STATIC_LOV_VALUES_ROW_DATA ).find( "button[id^=" + lId + "_rowMoveDown_]" ).trigger( "focus" );
                                }
                            });
                    }

                    this.addLabelClickHandler( pElement$, prop );
                },
                setFocus: function( pElement$ ) {
                    pElement$.find( ":input:first" ).trigger( "focus" );
                },
                getValue:   function ( pProperty$ ) {
                    var lReturnValue$, lDisplayValue$,
                        lValues = [];
                    pProperty$.find( "tr." + STATIC_LOV_VALUES_ROW_DATA ).each( function() {
                        lDisplayValue$ = $( this ).find( ":input." + STATIC_LOV_VALUE_DISPLAY );
                        lReturnValue$ = $( this ).find( ":input." + STATIC_LOV_VALUE_RETURN );
                        if ( lDisplayValue$.val() !== "" || lReturnValue$.val() !== "" ) {
                            lValues.push({
                                displayValue: lDisplayValue$.val(),
                                returnValue:  lReturnValue$.val()
                            });
                        }
                    });
                    return lValues;
                },
                _renderRow: function ( out, pOptions ) {
                    let lValueDisplayId, lValueReturnId,
                        lOptions = $.extend( {
                            rowId:        "",
                            idPrefix:     "",
                            returnValue:  "",
                            displayValue: "",
                            readOnly:     false,
                            lastRow:      false
                        }, pOptions );

                    lValueReturnId  = lOptions.idPrefix + "_return_" + lOptions.rowId;
                    lValueDisplayId = lOptions.idPrefix + "_display_" + lOptions.rowId;

                    out.markup( "<tr" )
                        .attr( "class", STATIC_LOV_VALUES_ROW_DATA )
                        .markup( ">" );
                    out.markup( "<th scope='row'>" );
                    this.renderBaseInput( out, {
                        id:         lValueDisplayId,
                        value:      lOptions.displayValue,
                        inputClass: [ STATIC_LOV_VALUE_DISPLAY, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "STATIC_LOV.VALUE_N_DISPLAY", lOptions.rowId )
                        }
                    });
                    out.markup( "</td><td>" );
                    this.renderBaseInput( out, {
                        id:         lValueReturnId,
                        value:      lOptions.returnValue,
                        inputClass: [ STATIC_LOV_VALUE_RETURN, PROPERTY_FIELD, PROPERTY_FIELD_TEXT ],
                        readonly:   lOptions.readOnly,
                        attributes: {
                            "aria-label": format( "STATIC_LOV.VALUE_N_RETURN", lOptions.rowId )
                        }
                    });
                    out.markup( "</td><td" )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_TABLE_REMOVE_COL )
                        .markup( ">" );

                    this.renderIconButton( out, {
                        id:         lOptions.idPrefix + "_rowRemove_" + lOptions.rowId,
                        icon:       ICON_REMOVE,
                        text:       format( "STATIC_LOV.REMOVE_VALUE_N", lOptions.rowId ),
                        disabled:   lOptions.readOnly
                    });
                    out.markup( "</td><td" )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_TABLE_REMOVE_COL )
                        .markup( ">" );

                    // Move Up
                    if ( lOptions.rowId > 1 ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveUp_" + lOptions.rowId,
                            icon:       ICON_MOVE_UP,
                            text:       format( "STATIC_LOV.MOVE_UP_VALUE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td><td" )
                        .attr( "class", PROPERTY_STATIC_LOV_VALUES_TABLE_REMOVE_COL )
                        .markup( ">" );

                    // Move Down
                    if ( !lOptions.lastRow ) {
                        this.renderIconButton( out, {
                            id:         lOptions.idPrefix + "_rowMoveDown_" + lOptions.rowId,
                            icon:       ICON_MOVE_DOWN,
                            text:       format( "STATIC_LOV.MOVE_DOWN_VALUE_N", lOptions.rowId ),
                            disabled:   lOptions.readOnly
                        });
                    }
                    out.markup( "</td>" );
                    out.markup( "</tr>" );
                }
            });

            $.apex.propertyEditor.addPropertyType( PROP_TYPE.OWNER,              null, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.COLUMN,             null, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.REST_OPERATION_ID,  null, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.REST_SOURCE_ID,     null, $.apex.propertyEditor.PROP_TYPE.SELECT_LIST );
            $.apex.propertyEditor.addPropertyType( PROP_TYPE.REGION_COLUMN,      null, PROP_TYPE.COLUMN );

            // overriding the core "text" property to include the "application message lookup dialog" and the "message preview" feature
            $.apex.propertyEditor.addPropertyType( "TEXT", {
                render: function( out, id, prop, lastComponents, options ) {
                    this.renderDivOpen( out, {
                      "class": PROPERTY_FIELD_CONTAINER
                    } );
                    this.renderText( out, id, prop, { ...options, hasPreview: pd.textMessagesPickerEnabled && this._hasMessageHelper( prop ) } );
                    // render the message preview container if supported
                    if ( this._hasMessageHelper( prop ) ) {
                      out.markup( "<div" );
                      out.attr( "class", "a-Property-textMessages" );
                      out.attr( "data-id", `${this._getDataId( prop )}` );
                      out.attr( "id", id + "_preview" );
                      out.markup( ">" );
                      out.markup( "</div>" );
                    }
                    this.renderDivClose( out );    // close PROPERTY_FIELD_CONTAINER
                    this._renderMessageHelperButton( out, id, prop, true );
                    this.renderQuickPickButton( out, id, prop, true );
                },
                _hasMessageHelper: function( prop ) {
                    const metaData = prop.metaData;
                    return ( pd.applicationMessages && metaData.isTranslatable && metaData.supportsSubstitution && metaData.type === "TEXT" );
                },
                _renderMessageHelperButton: function( out, id, prop ) {
                    if ( this._hasMessageHelper( prop )
                        && model.getCompatibilityMode() >= 24.2
                        && pd.textMessagesPickerEnabled
                        && !prop.metaData.isReadOnly
                    ) {
                        createTextMessageButton.call( this, out, id, true );
                    }
                },
                _renderPreview: function( prop, value ) {
                    pd.applicationMessages( value ).then( ( messages ) => {
                        if ( messages.length > 0 ) {
                            const previewEl$ = $( `[data-id="${this._getDataId( prop )}"]` );
                            let previewValue = util.escapeHTML( value );
                            messages.forEach( message => {
                                let textReplacement = `<mark>${util.escapeHTML( message.d )}</mark>`;
                                if ( message.placeholders.length > 0 ) {
                                    message.placeholders.forEach( p => {
                                        let [ fullPlaceholder, placeholder ] = p;
                                        // by default, we use the full placeholder ("%placeholder") in the preview
                                        let placeholderSubst = fullPlaceholder;
                                        // but if there's a parameter for that placeholder, we use the provided value
                                        if ( Object.hasOwn( message.parameters, placeholder ) ) {
                                            let placeholderValue = message.parameters[ placeholder];
                                            // if there's no value provided, we use "{placeholdername}"
                                            placeholderSubst = placeholderValue || `{${placeholder}}`;
                                        }
                                        textReplacement = textReplacement.replace( fullPlaceholder, `<strong>${util.escapeHTML( placeholderSubst )}</strong>` );
                                    } );
                                }
                                previewValue = previewValue.replace( util.escapeHTML( message.full ), textReplacement );
                            } );
                            // prefix the content with a hidden "Preview" text for screen readers
                            previewValue = formatNoEscape( "HIDDEN_PREVIEW_PREFIX", previewValue );

                            if ( previewEl$.length > 0 ) {
                                this._showMessagePreviewContainer( prop );
                                previewEl$.html( previewValue );
                            }

                            return previewValue;
                        } else {
                            this._hideMessagePreviewContainer( prop );
                        }
                    } );
                },
                _getDataId: function( prop ) {
                    return `msgHelperContainer_${prop.propertyName}`;
                },
                _hideMessagePreviewContainer: function( prop ) {
                    $( `[data-id="${this._getDataId( prop )}"]`).empty().hide();
                },
                _showMessagePreviewContainer: function( prop ) {
                    $( `[data-id="${this._getDataId( prop )}"]`).show();
                },
                _initMessageHelper: function( element$, prop, lastComponents ) {
                    if ( this._hasMessageHelper( prop ) ) {
                        this._renderPreview( prop, prop.value );
                        if ( !prop.metaData.isReadOnly ) {
                            if ( pd.textMessagesPickerEnabled ) {
                                const dialogBtn$ = $( `#${util.escapeCSS( element$.attr( "id" ) )}_messageHelperBtn` );
                                dialogBtn$.on( "click", () => {
                                    createTextMessageDialog.call( this, prop, element$, lastComponents );
                                } );
                            }

                            element$.on( "change", ( e ) => {
                                let value = e.target.value;
                                if ( !value ) {
                                    this._hideMessagePreviewContainer( prop );
                                } else {
                                    this._renderPreview( prop, value );
                                }
                            } );
                        }
                    }
                },
                setValue: function( element$, prop, value, lastComponents, updatePreview = true ) {
                    this.super( "setValue", element$, prop, value );
                    if ( updatePreview && this._hasMessageHelper( prop ) ) {
                        this._renderPreview( prop, value );
                    }
                },
                init: function( pElement$, prop, lastComponents ) {
                    this.initQuickPicks( pElement$, prop );
                    this._initMessageHelper( pElement$, prop, lastComponents );
                    this.super( "init", pElement$, prop );
                },
                destroy: function( pElement$, prop ) {
                    this.removeQuickPick( pElement$, prop );
                    this.super( "destroy", pElement$, prop );
                }
            } );

            this.widgetName = PE_WIDGET_NAME + "_" + o.mode;

            gEditorDlgWidth = parseInt( pd.getPreference( PREF_CODE_EDITOR_DLG_W ), 10 );
            if ( isNaN( gEditorDlgWidth ) ) {
                gEditorDlgWidth = 900;
            }
            gEditorDlgHeight = parseInt( pd.getPreference( PREF_CODE_EDITOR_DLG_H ), 10 );
            if ( isNaN( gEditorDlgHeight ) ) {
                gEditorDlgHeight = 600;
            }

            // Note: gPreference is a global emitted directly from page 4500 during rendering
            // Can't use getPreference because code editor doesn't use the same prefix as the rest of PE/PD
            gEditorSettings = window.gPreferences[CODE_EDITOR_PREF_NAME] || "";  // empty string will use code editor widget defaults

            //pe$ = this.element; //$( "#pe" );

            this.element.propertyEditor({
                showAll: true,
                expand: function( pEvent, pData ) {
                    delete gCurrentCollapsedGroups[ pData.displayGroupId ];
                },
                collapse: function( pEvent, pData ) {
                    gCurrentCollapsedGroups[ pData.displayGroupId ] = true;
                },
                searchable: true,
                change: function( pEvent, pData ) {
                    var i,
                        propertyName = pData.propertyName,
                        lProperty,
                        lPropertyValue = pData.property.value,
                        lValueToSave,
                        lMessage = model.transaction.message( {
                            action:     model.MESSAGE_ACTION.CHANGE,
                            component:  self.lastComponents[ 0 ],
                            property:   self.lastComponents[ 0 ].getProperty( propertyName ),
                            count:      self.lastComponents.length
                        }),
                        lTransaction = model.transaction.start( self.widgetName, lMessage ),
                        lMode = self.options.mode,
                        lGroups;

                    for ( i = 0; i < self.lastComponents.length; i++ ) {
                        lProperty = self.lastComponents[ i ].getProperty( propertyName );

                        if ( lProperty._indeterminateValues ) {
                            lValueToSave = self._getValueAfterMultiSelect( lPropertyValue, lProperty );
                        } else {
                            lValueToSave = lPropertyValue;
                        }

                        lProperty.setValue( lValueToSave );
                    }

                    apex.commandHistory.execute( lTransaction );

                    //Update group menu after change detected as
                    //some property changes add or remove other properties.
                    lGroups = self._getPropertyGroups( self.lastComponents, self.lastComponents[ 0 ].typeId );
                    self._updateGoToGroupMenu( lMode, lGroups, self );

                }
            });


            // Property help
            this.element.on( "propertyeditoractivate", function( pEvent, pProperty ) {
                var out = apex.util.htmlBuilder(),
                    helpText = pProperty.metaData.helpText;

                if ( typeof helpText === "function" ) {
                    helpText = helpText();
                }

                out.markup( "<h3>" ).content( pProperty.metaData.prompt ).markup( "</h3>" );
                if ( helpText.charAt(0) !== "<" ) {
                    helpText = "<p>" + helpText + "</p>";
                }
                out.markup( helpText );
                if ( !pProperty.metaData.isCustomPluginAttribute ) {
                    pd.setHelpText( out.toString(), "P1_COMPONENT_TYPE_ID,P1_PROPERTY_ID,P1_APEX_VERSION:" + self.lastComponents[ 0 ].typeId + "," + pProperty.propertyName + "," + gApexVersion );
                } else {
                    pd.setHelpText( out.toString() );
                }
            }).on( "propertyeditordeactivate", function() {
                pd.clearHelpText();
            });

            // Update tooltip disabled options on create
            this.element.on( "tooltipcreate", function( pEvent ) {
                setTimeout( () => {
                    // pEvent.target's tooltip could have already been destroyed which could cause tooptip initialization error
                    // Added filter to make sure pEvent.target is still a tooltip
                    $( pEvent.target ).filter(':data(ui-tooltip)').tooltip( "option", "disabled", !pd.getBoolPref( PREF_ENABLE_TOOLTIPS, false ) );
                }, 0 );
            });


            $( document ).on( "selectionChanged", function( pEvent, pWidget, pComponents, pPropertyId ) {
                self._selectionChanged( pComponents, pPropertyId );
            });

            $( document ).on( "modelCleared", function() {
                self._clearPropertyEditor();
            });



        },

        //todo destroy?

        /*
         * Private functions
         */

        /*
         * Returns the value for a property
         * If multiple components and the values vary, then return the PE widget constant VALUE_VARIES.
         */
        _getPropertyValue: function ( pComponents, pPropertyId ) {
            let propertyValue;

            for ( let i = 0; i < pComponents.length; i++ ) {
                let property = pComponents[ i ].getProperty ( pPropertyId );

                // Check if the property exists first, if not go to the next component in the loop
                if ( property ) {
                    // Set propertyValue if it hasn't been defined yet, otherwise compare values
                    if ( propertyValue === undefined ) {
                        propertyValue = property.getValue();
                    } else {
                        if ( propertyValue !== property.getValue() ) {
                            propertyValue = this.element.propertyEditor ( "getValueVariesConstant" );

                            // As soon as we have a value that varies, stop checking further components
                            break;
                        }
                    }
                }
            }
            return propertyValue;
        },

        /*
         * Returns an object which contains the original components,
         * and value matching status (checked or indeterminate in multi-select state)
         * return original components to store indeterminate value after selections are made
         * so the multi-select results can be traced back.
         {

         }
         */
        _prepareMultiSelectMap: function ( pComponents, pPropertyId ) {
            var i,
                j,
                lProperty,
                lPropertyValue,
                lCountKey,
                isDetermined = false, //
                componentsCount = pComponents.length,
                checkboxValues = '',
                currentVal = '',
                allValuesArray = [],
                occurrenceCounts = {},
                valueMatchingStatus = {},
                lData = {};

            for ( i = 0; i < componentsCount; i++ ) {
                lProperty = pComponents[ i ].getProperty ( pPropertyId );
                lPropertyValue = lProperty.getValue ();

                checkboxValues = checkboxValues + ':' + lPropertyValue;
                // store old value in property of each component when they got multi-selected.
                // so we can use them to compare with new values in multi-select state.
                lProperty._originalValBeforeMultiSelect = lPropertyValue;
            }

            allValuesArray = checkboxValues.split ( ':' );

            for ( j = 0; j < allValuesArray.length; j++ ) {
                currentVal = allValuesArray[ j ];
                if ( currentVal ) {
                    occurrenceCounts[ currentVal ] = occurrenceCounts[ currentVal ] ? occurrenceCounts[ currentVal ] + 1 : 1;
                }
            }

            for ( lCountKey in occurrenceCounts ) {
                if ( hasOwnProperty ( occurrenceCounts, lCountKey ) ) {
                    isDetermined = occurrenceCounts[ lCountKey ] === componentsCount;
                    valueMatchingStatus[ lCountKey ] = !isDetermined;
                }
            }

            lData = {
                indeterminateMap: valueMatchingStatus,
                components: pComponents
            };

            return lData;
        },

        // Look through notification properties, and return an array of properties that are relevant based on
        // events passed in pEvents
        _getEventSpecificProperties: function ( pProperties, pEvents ) {
            var lKey, i,
                lEvents = [],
                lReturnProperties = [];
            for ( lKey in pProperties ) {
                if ( hasOwnProperty ( pProperties, lKey ) ) {
                    lEvents = pProperties[ lKey ];
                    for ( i = 0; i < lEvents.length; i++ ) {

                        // Store property if it's event matches, and if it hasn't already been added
                        if ( ($.inArray ( lEvents[ i ], pEvents ) > -1) && $.inArray ( lKey, lReturnProperties ) === -1 ) {
                            lReturnProperties.push ( lKey );
                        }
                    }
                }
            }
            return lReturnProperties;
        },

        _getValueAfterMultiSelect: function ( pMultiSelectValues, pProperty ) {
            var valuesInMultiSelect = pMultiSelectValues.split ( ':' ),
                originalValues = pProperty._originalValBeforeMultiSelect.split ( ':' ),
                indeterminateValues = pProperty._indeterminateValues || [],
                indeterminateVal,
                i;

            // if indeterminateValues value is contained in oldValue, we know it was an selected value in this property.
            for ( i = 0; i < indeterminateValues.length; i++ ) {
                indeterminateVal = indeterminateValues[ i ];
                if ( $.inArray ( indeterminateVal, originalValues ) > -1 ) {
                    if ( $.inArray ( indeterminateVal, valuesInMultiSelect ) === -1 ) {
                        valuesInMultiSelect.push ( indeterminateVal );
                    }
                }
            }

            return valuesInMultiSelect.join ( ':' );
        },

        // transforms a property from the client data model into a Property Editor format property
        _toPEProperty: function ( pProperty, pComponents ) {

            var i, j, k, lLovValues, lPeValue,
                self = this,
                lMasterLovValues = [],
                lAllLovValues = [],
                lPropertyMetaData = pProperty ? pProperty.getMetaData () : {},
                lValues = this._getPropertyValue ( pComponents, pProperty.id ),
                isCheckbox = lPropertyMetaData.type === PROP_TYPE.CHECKBOXES,
                isTemplateOption = lPropertyMetaData.type === PROP_TYPE.TEMPLATE_OPTIONS,
                isVaries = lValues === this.element.propertyEditor ( "getValueVariesConstant" ),
                TYPES_TO_CHECK_LOV_VALUES = [
                    PROP_TYPE.SELECT_LIST,
                    PROP_TYPE.COMPONENT,
                    PROP_TYPE.SUPPORTED_UI,
                    PROP_TYPE.CHECKBOXES,
                    PROP_TYPE.TEMPLATE_OPTIONS
                ];

            var getPeValue = function () {
                var val;

                if ( isCheckbox ) {
                    if ( isVaries ) {
                        val = lValues;
                    } else {
                        if ( pProperty._originalValBeforeMultiSelect ) {
                            val = self._getValueAfterMultiSelect ( lValues, pProperty );
                        } else {
                            val = lValues;
                        }
                    }
                } else {
                    val = lValues;
                }

                return val;
            };

            if ( pComponents.length > 1 ) {

                if ( $.inArray ( lPropertyMetaData.type, TYPES_TO_CHECK_LOV_VALUES ) !== -1 ) {

                    // loop through all components selected, and build array of all lov value arrays
                    for ( i = 0; i < pComponents.length; i++ ) {
                        lLovValues = {
                            values: pComponents[ i ].getProperty ( pProperty.id ).getMetaData ().lovValues (),
                            map: {}
                        };
                        // build a lookup map for a quicker check if a lov value exists
                        for ( j = 0; j < lLovValues.values.length; j++ ) {
                            lLovValues.map[ lLovValues.values[ j ].r ] = true;
                        }
                        lAllLovValues.push ( lLovValues );
                    }

                    // Sort arrays to get the shortest array at the beginning. The first array is used as the master, so
                    // by sorting we reduce the number of comparisons we have to make.
                    lAllLovValues.sort ( function ( a, b ) {
                        return a.values.length - b.values.length;
                    } );

                    // Store first array (which is also now the shortest), which will be used as the master list
                    lMasterLovValues = lAllLovValues[ 0 ].values;

                    // Now let's go through each subsequent array, and remove items from the master array if they are not found
                    for ( j = 1; j < lAllLovValues.length; j++ ) {

                        for ( k = 0; k < lMasterLovValues.length; k++ ) {

                            // If we don't find a match, remove from the master array
                            if ( !hasOwnProperty ( lAllLovValues[ j ].map, lMasterLovValues[ k ].r ) ) {
                                lMasterLovValues.splice ( k, 1 );
                                k -= 1; // k stays the same for next iteration
                            }

                        }
                    }

                    // Update the metadata with the new master lov values array
                    lPropertyMetaData.lovValues = lMasterLovValues;

                    // Multi-select support for checkboxes and Template Options
                    if ( isVaries ) {
                        if ( isCheckbox || isTemplateOption ) {
                            lPropertyMetaData.multiSelectData = this._prepareMultiSelectMap ( pComponents, pProperty.id );
                        }
                    }

                }
            }

            lPeValue = getPeValue ();

            return {
                metaData: lPropertyMetaData,
                propertyName: pProperty.id,
                errors: pProperty.errors,
                warnings: pProperty.warnings,
                value: lPeValue,
                oldValue: lPeValue,
                hasChanged: pProperty.hasChanged
            };
        },

        _setPropertyEditorTitle: function ( pComponentTypeTitle ) {
            var lTab$,
                lPETitle = "",
                lMode = this.options.mode;

            // Only 'main' mode uses dynamic titles, so ignore other modes
            if ( lMode === MODE_MAIN ) {
                if ( pComponentTypeTitle ) {
                    lPETitle = pComponentTypeTitle;
                } else {
                    lPETitle = formatNoEscape ( "TITLE" );
                }
                lTab$ = pd.getTab ( TAB_NAME_PE_COMP );
                lTab$.find ( ".ui-tabs-anchor" ).text ( lPETitle );
            }

        },

        _clearPropertyEditor: function () {

            this.lastComponents = null;

            this.element.propertyEditor ( "option", {
                data: {
                    propertySet: [],
                    propertyValues: []
                }
            } );

            pd.clearHelpText ();

            this._setPropertyEditorTitle ();

            // Bug 34157197
            // Based on implementation, a tab is considered active when it has
            // 1. classes .ui-tabs-active and .ui-state-active
            // 2. aria-selected=true
            // 3. aria-expanded=true
            // 4. is visible
            const isActiveSelector = "li.ui-tabs-active.ui-state-active[aria-selected=true][aria-expanded=true]:visible";

            // If at least one of the three property editor tabs is active, then reactivate the component tab
            if ( pd.getTab( TAB_NAME_PE_COMP ).is( isActiveSelector ) ||
                 pd.getTab( TAB_NAME_PE_ATTR ).is( isActiveSelector ) ||
                 pd.getTab( TAB_NAME_PE_PRINTING ).is( isActiveSelector ) ) {
                pd.activateTab( TAB_NAME_PE_COMP );
            } else if (pd.getTab( TAB_NAME_PE_COMP ).parent().has(isActiveSelector).length === 0) {
                // If none of the three tabs are active
                // Check if there is zero active tab in the same group as TAB_NAME_PE_COMP and activate it
                pd.activateTab( TAB_NAME_PE_COMP );
            }

            // disable all PE toolbar buttons
            this.element.prev().find ( "button" ).each ( function () {
                $ ( this ).prop ( "disabled", true );
            } );

            model.unobserver ( this.widgetName, {} );

        },

        _getCurrentModeComponents: function( pComponents ) {
            var i, lRegionType, lComponentTypeId, lTempComponents, lFilterParentId, lTempFilterComponents,
                lComponents = [],
                lMode = this.options.mode,
                REGION_COMP_TYPE_MAP = {
                    NATIVE_CALENDAR: {
                        attributes: model.COMP_TYPE.CLASSIC_CALENDAR
                    },
                    NATIVE_IR: {
                        attributes: model.COMP_TYPE.IR_ATTRIBUTES,
                        printing:   model.COMP_TYPE.IR_PRINT_ATTR
                    },
                    NATIVE_IG: {
                        attributes: model.COMP_TYPE.IG_ATTRIBUTES,
                        printing:   model.COMP_TYPE.IG_PRINT
                    },
                    NATIVE_JET_CHART: {
                        attributes: model.COMP_TYPE.JET_CHART
                    },
                    NATIVE_SQL_REPORT: {
                        attributes: model.COMP_TYPE.CLASSIC_REPORT,
                        printing:   model.COMP_TYPE.CLASSIC_RPT_PRINT
                    },
                    NATIVE_TABFORM: {
                        attributes: model.COMP_TYPE.TABULAR_FORM,
                        printing:   model.COMP_TYPE.TAB_FORM_PRINT
                    },
                    NATIVE_CARDS: {
                        attributes: model.COMP_TYPE.CARD
                    },
                    NATIVE_MAP_REGION: {
                        attributes: model.COMP_TYPE.MAP_REGION
                    }
                };

            if ( lMode === MODE_MAIN ) {
                return pComponents;
            } else {

                /*
                 * 'Attributes' and 'Printing' modes...
                 */

                // Loop over selected components
                for ( i = 0; i < pComponents.length; i++ ) {

                    // If this is a region, we need to get the components specific to the mode
                    if ( pComponents[ i ].typeId === model.COMP_TYPE.REGION ) {

                        // First we need the region type (eg 'NATIVE_CSS_CALENDAR', 'NATIVE_IR', etc.)
                        lRegionType = pComponents[ i ].getProperty ( model.PROP.REGION_TYPE ).getValue ();

                        // If the region type is in our mappings, use this to get the component type
                        if ( REGION_COMP_TYPE_MAP[ lRegionType ] && REGION_COMP_TYPE_MAP[ lRegionType ][ lMode ] ) {
                            lComponentTypeId = REGION_COMP_TYPE_MAP[ lRegionType ][ lMode ];
                        } else {

                            // If the region type is not in our mappings, and the mode is 'attributes', just use the general
                            // region plugin attribute component type. Otherwise, return an empty lComponents
                            if ( lMode === MODE_ATTRIBUTES ) {
                                lComponentTypeId = model.COMP_TYPE.REGION_PLUGIN_ATTR;
                            }
                        }

                        if ( lComponentTypeId ) {

                            if ( lComponentTypeId === model.COMP_TYPE.IR_PRINT_ATTR ) {

                                // IR_PRINT_ATTR is the only type where it is not a child of the region, but a child of IR_ATTRIBUTES.
                                // We therefore have to first get the IR_ATTRIBUTES component, then use that as the parent filter ID
                                lTempFilterComponents = model.getComponents ( model.COMP_TYPE.IR_ATTRIBUTES, { parentId: pComponents[ i ].id } );
                                if ( lTempFilterComponents.length > 0 ) {
                                    lFilterParentId = lTempFilterComponents[ 0 ].id;
                                }

                            } else {

                                // Otherwise just use the region ID as the parent ID filter
                                lFilterParentId = pComponents[ i ].id;
                            }
                            lTempComponents = model.getComponents ( lComponentTypeId, { parentId: lFilterParentId } );
                            if ( lTempComponents.length > 0 ) {

                                // Note: Safe to just use 1st, because we have filtered by type ID and parent component ID
                                lComponents.push ( lTempComponents[ 0 ] );
                            }
                        }
                    } else {

                        // As soon as we know this is not a region, we can just return an empty array
                        return [];
                    }
                }
            }
            return lComponents;
        },


        // Render property editor for selected component(s)
        _selectionChanged: function ( pComponents, pPropertyId ) {
            var i, lComponentTypeId, lModeComponents,
                lComponentTypeTitle = "",
                lMode = this.options.mode;

            if ( pComponents.length > 0 ) {

                lModeComponents = this._getCurrentModeComponents( pComponents, lMode );

                // if _getCurrentModeComponents returns no components, we know that the current component type does not have properties for the current mode
                if ( lModeComponents.length > 0 ) {

                    // attributes and printing tabs are only shown when relevant (main is always shown)
                    if ( lMode === MODE_ATTRIBUTES ) {
                        pd.getTab( "peAttributesTabPanel" ).show();
                    } else if ( lMode === MODE_PRINTING ) {
                        pd.getTab( "pePrintingTabPanel" ).show();
                    }

                    for ( i = 0; i < lModeComponents.length; i++ ) {
                        if ( i === 0 ) {
                            lComponentTypeTitle = model.getComponentType ( lModeComponents[ i ].typeId ).title.singular;
                            lComponentTypeId = lModeComponents[ i ].typeId;
                        } else {
                            if ( lModeComponents[ i ].typeId === lModeComponents[ i - 1 ].typeId ) {
                                lComponentTypeTitle = model.getComponentType ( lModeComponents[ i ].typeId ).title.plural;
                                lComponentTypeId = lModeComponents[ i ].typeId;
                            } else {
                                lComponentTypeTitle = msg ( "MULTIPLE_TYPES" );

                                // as soon as we know we have different component types, exit out
                                break;
                            }
                        }
                    }

                    this.lastComponents = lModeComponents;
                    this._selectComponents ( lModeComponents, pPropertyId );
                    this._setPropertyEditorTitle ( lComponentTypeTitle, lComponentTypeId );


                    // enable all PE toolbar buttons
                    this.element.prev().find ( "button" ).each ( function () {
                        $ ( this ).prop ( "disabled", false );
                    } );
                } else {

                    // attributes and printing tabs are only shown when relevant (main is always shown)
                    if ( lMode === MODE_ATTRIBUTES ) {
                        pd.getTab( "peAttributesTabPanel" ).hide();
                    } else if ( lMode === MODE_PRINTING ) {
                        pd.getTab( "pePrintingTabPanel" ).hide();
                    }
                    this._clearPropertyEditor();
                }


            } else {
                pd.getTab( "peAttributesTabPanel" ).hide();
                pd.getTab( "pePrintingTabPanel" ).hide();
                this._clearPropertyEditor();
            }

        },

        _getPropertyGroups: function ( pComponents, pComponentType ) {

            var i, j,
                lPropertyId,
                lProperty,
                lGroupId,
                lComponent,
                lExclude,
                lProperties,
                lPropertyMetaData = {},
                lGroups = [],
                lGroupsMap = {};

            // For Shared Components we only want to show the "Name" property
            if ( pComponentType.isSharedComponent ) {
                lProperties = [ model.getDisplayProperty( pComponents[ 0 ] ) ];
            } else {
                lProperties = pComponents[ 0 ].getProperties ();
            }

            // create array of property metadata, indexed by property ID
            for ( i = 0; i < lProperties.length; i++ ) {
                lPropertyMetaData[ lProperties[ i ].id ] = lProperties[ i ].getMetaData ();
            }

            // then sorting our properties, by referencing the meta data display sequence, using the property ID as the index
            lProperties.sort ( function ( a, b ) {
                return (lPropertyMetaData[ a.id ].displaySeq - lPropertyMetaData[ b.id ].displaySeq);
            } );

            // Multi-edit specifics; only keep common properties
            if ( pComponents.length > 1 ) {

                for ( i = 0; i < lProperties.length; i++ ) {
                    lProperty = lProperties[ i ];
                    lExclude = false;

                    // first if this property is unique, or its type is not eligible for multi-edit, set the exclude flag
                    if ( lPropertyMetaData[ lProperty.id ].isUnique || $.inArray ( lPropertyMetaData[ lProperty.id ].type, TYPES_EXCLUDED_FROM_MULTI_EDIT ) > -1 ) {
                        lExclude = true;
                    }

                    // if the exclude flag is not yet set, check if any of the current components do not have this property
                    if ( !lExclude ) {
                        for ( j = 1; j < pComponents.length; j++ ) {
                            lComponent = pComponents[ j ];
                            // if component doesn't have property then exclude this property and no need to look at any other components
                            if ( !lComponent.getProperty ( lProperty.id ) ) {
                                lExclude = true;
                                break;
                            }
                        }
                    }

                    if ( lExclude ) {
                        // remove property and the metadata
                        delete lPropertyMetaData[ lProperty.id ];
                        lProperties.splice ( i, 1 );
                        i -= 1; // i stays the same for next iteration
                    }
                }

            }

            // Build a list of display groups and properties in the order of the property sequence.
            // The first reference of a display group by a property defines it's overall display order.
            for ( i = 0; i < lProperties.length; i++ ) {
                lProperty = lProperties[ i ];
                lPropertyId = lProperty.id;
                lGroupId = lPropertyMetaData[ lPropertyId ].displayGroupId;

                // Exclude HIDDEN property types, these should not be passed to the property editor
                if ( lPropertyMetaData[ lPropertyId ].type !== PROP_TYPE.HIDDEN ) {

                    // If it's a new group which we haven't stored yet, add it in sequence to our group array
                    if ( !hasOwnProperty ( lGroupsMap, lGroupId ) ) {

                        lGroups.push ( {
                            displayGroupId: lGroupId,
                            displayGroupTitle: model.getDisplayGroup ( lGroupId ).title,
                            collapsed: !!gCurrentCollapsedGroups[ lGroupId ],
                            properties: []
                        } );
                        lGroupsMap[ lGroupId ] = lGroups.length - 1;
                    }

                    // Add the property as next displayed property to it's group
                    lGroups[ lGroupsMap[ lGroupId ] ].properties.push ( this._toPEProperty ( lProperty, pComponents ) );
                }
            }

            return lGroups;
        },

        //This code was copied from _selectComponents to make it reusable.
        _updateGoToGroupMenu: function( pMode, pGroups, pSelf ) {
            var k,
                peGoToGroupMenu,
                peGoToGroup$,
                peGoToGroupMenuItems = [];

            // go to group
            peGoToGroupMenuItems.push({
                type: "action",
                labelKey: "PD.PE.EXPAND_ALL",
                action: function () {
                    pSelf.element.propertyEditor( "expandAll" );
                }
                },
                { type: "separator" }
            );

            for ( k = 0; k < pGroups.length; k++ ) {
                peGoToGroupMenuItems.push({
                    type: "action",
                    label: pGroups[ k ].displayGroupTitle,
                    value: pGroups[ k ].displayGroupId,
                    action: function () {
                        pSelf.element.propertyEditor( "goToGroup", this.value );

                        // return true so the menu doesn't handle focus
                        return true;
                    }
                });
            }

            peGoToGroupMenu = { items: peGoToGroupMenuItems };

            //todo hard-coded
            if ( pMode === MODE_MAIN ){
                peGoToGroup$ = $( "#pe_goto_group_menu" );
            } else if ( pMode === MODE_ATTRIBUTES ) {
                peGoToGroup$ = $( "#pe_attributes_goto_group_menu" );
            } else if ( pMode === MODE_PRINTING ) {
                peGoToGroup$ = $( "#pe_printing_goto_group_menu" );
            }

            peGoToGroup$.menu( peGoToGroupMenu );

        },

        _selectComponents: function ( pComponents, pPropertyId ) {

            var i, j,
                lPropertyId,
                lProperty,
                lGroupId,
                lComponent,
                lExclude,
                lProperties,
                lComponentType,
                lComponentTypeEditFunction,
                lPropertyMetaData  = {},
                lGroups    = [],
                lGroupsMap = {},
                self = this,
                lMode = this.options.mode;

            lComponentType = model.getComponentType( pComponents[ 0 ].typeId );

            // For Shared Components we only want to show the "Name" property
            if ( lComponentType.isSharedComponent && !lComponentType.isSharedDesigner ) {
                lProperties = [ model.getDisplayProperty( pComponents[ 0 ] ) ];
            } else {
                lProperties = pComponents[ 0 ].getProperties();
            }

            // create array of property metadata, indexed by property ID
            for ( i = 0; i < lProperties.length; i++ ) {
                lPropertyMetaData[ lProperties[ i ].id ] = lProperties[ i ].getMetaData();
            }

            // then sorting our properties, by referencing the meta data display sequence, using the property ID as the index
            lProperties.sort( function( a, b ) {
                return ( lPropertyMetaData[ a.id ].displaySeq - lPropertyMetaData[ b.id ].displaySeq );
            });

            // Multi-edit specifics; only keep common properties
            if ( pComponents.length > 1 ) {

                for ( i = 0; i < lProperties.length; i++ ) {
                    lProperty = lProperties[ i ];
                    lExclude = false;

                    // first if this property is unique, or its type is not eligible for multi-edit, set the exclude flag
                    if ( lPropertyMetaData[ lProperty.id ].isUnique || $.inArray( lPropertyMetaData[ lProperty.id ].type, TYPES_EXCLUDED_FROM_MULTI_EDIT ) > -1 ) {
                        lExclude = true;
                    }

                    // if the exclude flag is not yet set, check if any of the current components do not have this property
                    if ( !lExclude ) {
                        for ( j = 1; j < pComponents.length; j++ ) {
                            lComponent = pComponents[ j ];
                            // if component doesn't have property then exclude this property and no need to look at any other components
                            if ( !lComponent.getProperty( lProperty.id )) {
                                lExclude = true;
                                break;
                            }
                        }
                    }

                    if ( lExclude ) {
                        // remove property and the metadata
                        delete lPropertyMetaData[ lProperty.id ];
                        lProperties.splice(i, 1);
                        i -= 1; // i stays the same for next iteration
                    }
                }

            }

            // Build a list of display groups and properties in the order of the property sequence.
            // The first reference of a display group by a property defines it's overall display order.
            for ( i = 0; i < lProperties.length; i++ ) {
                lProperty   = lProperties[ i ];
                lPropertyId = lProperty.id;
                lGroupId    = lPropertyMetaData[ lPropertyId ].displayGroupId;

                // Exclude HIDDEN property types, these should not be passed to the property editor
                if ( lPropertyMetaData[ lPropertyId ].type !== PROP_TYPE.HIDDEN ) {

                    // If it's a new group which we haven't stored yet, add it in sequence to our group array
                    if ( !hasOwnProperty( lGroupsMap, lGroupId )) {

                        lGroups.push({
                            displayGroupId:    lGroupId,
                            displayGroupTitle: model.getDisplayGroup( lGroupId ).title,
                            collapsed:         !!gCurrentCollapsedGroups[lGroupId],
                            properties:        []
                        });
                        lGroupsMap[ lGroupId ] = lGroups.length - 1;
                    }

                    // Add the property as next displayed property to it's group
                    lGroups[ lGroupsMap[ lGroupId ]].properties.push( this._toPEProperty ( lProperty, pComponents ));
                }
            }

            this._updateGoToGroupMenu( lMode, lGroups, self );

            // Edit Component logic, for component edits external to the PE (components from global page, shared components)
            if ( pComponents.length === 1 ) {
                lComponent = pComponents[ 0 ];
                if ( lComponentType.isSharedComponent && !lComponentType.isSharedDesigner ) {
                    lComponentTypeEditFunction = function() {
                        nav.redirect( decodeURIComponent( lComponentType.editUrl )
                            .replace( /%session%/g, apex.env.APP_SESSION )
                            .replace( /%pk_value%/g, lComponent.id )
                            .replace( /%application_id%/g, model.getCurrentAppId() )
                            .replace( /%page_id%/g, model.getCurrentPageId() ) );
                    };
                }
                if ( lComponent.isOnGlobalPage() ) {
                    lComponentTypeEditFunction = function() {
                        pd.setPageSelection( model.getCurrentAppId(), lComponent.pageId, lComponent.typeId, lComponent.id, function() {} );
                    };
                }
            }

            // Set widget options for newly selected component
            this.element.propertyEditor( "option", {
                focusPropertyName:  pPropertyId,
                externalEdit:       lComponentTypeEditFunction,
                // set general options prior to setting the data (because that does the refresh)
                data: {
                    propertySet:    lGroups,
                    lastComponents: pComponents
                }
            });


            // Add observers for all the displayed components
            model.unobserver( this.widgetName, {} );

            if ( lMode === MODE_MAIN ) {
                model.observer (
                    this.widgetName, {
                        components: [
                            { typeId: model.COMP_TYPE.REGION_PLUGIN_ATTR },
                            { typeId: model.COMP_TYPE.IR_ATTRIBUTES },
                            { typeId: model.COMP_TYPE.IR_PRINT_ATTR },
                            { typeId: model.COMP_TYPE.CLASSIC_RPT_PRINT },
                            { typeId: model.COMP_TYPE.IG_ATTRIBUTES },
                            { typeId: model.COMP_TYPE.IG_PRINT },
                            { typeId: model.COMP_TYPE.CLASSIC_CALENDAR },
                            { typeId: model.COMP_TYPE.CHART },
                            { typeId: model.COMP_TYPE.MAP_CHART },
                            { typeId: model.COMP_TYPE.JET_CHART },
                            { typeId: model.COMP_TYPE.TABULAR_FORM },
                            { typeId: model.COMP_TYPE.TAB_FORM_PRINT },
                            { typeId: model.COMP_TYPE.CARD },
                            { typeId: model.COMP_TYPE.MAP_REGION }
                        ],
                        events: [ model.EVENT.CREATE, model.EVENT.DELETE ]
                    },
                    function( pNotifications ) {

                        debug.trace ( "%s: CREATE/DELETE component notification received", self.widgetName, pNotifications );

                        // Check it's parent is the current component
                        if ( pNotifications[ 0 ].component.parentId  === pComponents[ 0 ].id ) {
                            let lFocusPropertyId;

                            // If the currently focused prop is "Region Type", then a change of this select list is what caused this observer notification.
                            // We should therefore set focus back to this prop after rebuilding the property editor.
                            // See #34021265
                            if ( self.element.propertyEditor( "hasFocus", model.PROP.REGION_TYPE ) ) {
                                lFocusPropertyId = model.PROP.REGION_TYPE;
                            }

                            $( document ).trigger( "selectionChanged", [ self.widgetName, pComponents, lFocusPropertyId ] );
                        }
                    },
                    true
                );

                //todo may not need to change selection for attributes / printing nodes?
                // also this fires in FB, but not on 20.2 dev for some reason (test case switching region type from static to url)
                // may not be necessary, responsibility of the tree
                model.observer (
                    this.widgetName,
                    {
                        components: pComponents,
                        events: [ model.EVENT.DELETE ]
                    },
                    function ( pNotifications ) {

                        var i, j;

                        debug.trace ( "%s: DELETE component notification received", self.widgetName, pNotifications );

                        // loop through current selected components
                        for ( j = 0; j < self.lastComponents.length; j++ ) {

                            // check if it has been deleted by looping through deleted components
                            for ( i = 0; i < pNotifications.length; i++ ) {
                                if ( pNotifications[ i ].component.typeId === self.lastComponents[ j ].typeId ) {
                                    self.lastComponents.splice ( j, 1 );
                                    j -= 1;
                                    break;
                                }
                            }
                        }

                        self._selectionChanged ( self.lastComponents );

                    },
                    true
                );
            }

            model.observer (
                this.widgetName, {
                    components: pComponents,
                    events: [
                        model.EVENT.CHANGE ]
                },
                function ( pNotifications ) {

                    var i, lPropertyId,
                        len = pNotifications.length,
                        notif,
                        lProperties = {},
                        lComponents = [];

                    debug.trace ( "%s: CHANGE component notification received", self.widgetName, pNotifications );

                    // first we have to loop through the notifications, to build up a complete list of components changed.
                    for ( i = 0; i < len; i++ ) {
                        notif = pNotifications[ i ];
                        lComponents.push ( notif.component );

                        for ( lPropertyId in notif.properties ) {

                            if ( hasOwnProperty ( notif.properties, lPropertyId ) ) {

                                if ( $.inArray ( model.EVENT.CHANGE, notif.properties[ lPropertyId ] ) !== -1 ) {
                                    lProperties[ lPropertyId ] = true;
                                }
                            }
                        }
                    }
                    for ( lPropertyId in lProperties ) {
                        if ( hasOwnProperty ( lProperties, lPropertyId ) ) {
                            self.element.propertyEditor ( "updatePropertyValue", lPropertyId, self._getPropertyValue ( lComponents, lPropertyId ), true );

                            // 1) Add is-changed flag on redo.
                            // 2) Remove this flag on undo, if the hasChanged is false.
                            if ( notif.action === 'redo' ) {
                                self.element.find ( "[data-property-id=" + lPropertyId + "]" ).closest( ".a-Property" ).addClass ( IS_CHANGED );
                            } else if ( notif.action === 'undo' ) {
                                if ( notif.component.getProperty ( lPropertyId ) !== undefined ) {
                                    // need to check undefined because radio YES/NO attribute somehow returns two components obj,
                                    // and the second one is undefined, causing error when call getProperty() on it.
                                    if ( !notif.component.getProperty ( lPropertyId ).hasChanged ) {
                                        self.element.find ( "[data-property-id=" + lPropertyId + "]" ).closest( ".a-Property" ).removeClass ( IS_CHANGED );
                                    }
                                }
                            }

                        }
                    }
                },
                true
            );
            model.observer (
                this.widgetName, {
                    components: pComponents,
                    events: [
                        model.EVENT.ADD_PROP,
                        model.EVENT.REMOVE_PROP ]
                },
                function ( pNotifications ) {

                    var lComponentType, lProperties, lProperty, lExclude, lComponent, i, j, k, m, n, lPropertyToAdd,
                        lPropertiesToAdd, lPropertiesToRemove, lDisplayGroupId, lPropertyId,
                        lPropertyMetaData = {},
                        lComponents = [],
                        lDisplayGroupArray = [];

                    debug.trace ( "%s: ADD_PROP/REMOVE_PROP notification received", self.widgetName, pNotifications );

                    // first we have to loop through the notifications, to build up a complete list of components changed.
                    for ( i = 0; i < pNotifications.length; i++ ) {
                        lComponents.push ( pNotifications[ i ].component );
                    }

                    lPropertiesToAdd = self._getEventSpecificProperties ( pNotifications[ 0 ].properties, [ model.EVENT.ADD_PROP ] );

                    lComponentType = model.getComponentType ( pComponents[ 0 ].typeId );

                    // For Shared Components we only want to show the "Name" property
                    if ( lComponentType.isSharedComponent && !lComponentType.isSharedDesigner ) {
                        lProperties = [ model.getDisplayProperty( pComponents[ 0 ] ) ];
                    } else {
                        lProperties = pComponents[ 0 ].getProperties ();
                    }
                    // create array of property metadata, indexed by property ID
                    for ( j = 0; j < lProperties.length; j++ ) {
                        lPropertyMetaData[ lProperties[ j ].id ] = lProperties[ j ].getMetaData ();
                    }

                    // then sorting our properties, by referencing the meta data display sequence, using the property ID as the index
                    lProperties.sort ( function ( a, b ) {
                        return (lPropertyMetaData[ a.id ].displaySeq - lPropertyMetaData[ b.id ].displaySeq);
                    } );

                    if ( pComponents.length > 1 ) {
                        // go through all components and only keep the properties in common
                        for ( k = 0; k < lProperties.length; k++ ) {
                            lProperty = lProperties[ k ];

                            lExclude = false;

                            // first if this property is unique, or its type is not eligible for multi-edit, set the exclude flag
                            if ( lPropertyMetaData[ lProperty.id ].isUnique || $.inArray ( lPropertyMetaData[ lProperty.id ].type, TYPES_EXCLUDED_FROM_MULTI_EDIT ) > -1 ) {
                                lExclude = true;
                            }

                            // if the exclude flag is not yet set, check if any of the current components do not have this property
                            if ( !lExclude ) {
                                for ( m = 1; m < pComponents.length; m++ ) {
                                    lComponent = pComponents[ m ];
                                    // if component doesn't have property then exclude this property and no need to look at any other components
                                    if ( !lComponent.getProperty ( lProperty.id ) ) {
                                        lExclude = true;
                                        break;
                                    }
                                }
                            }

                            if ( lExclude ) {
                                // remove property and the metadata
                                delete lPropertyMetaData[ lProperty.id ];
                                lProperties.splice ( k, 1 );
                                k -= 1; // k stays the same for next iteration
                            }
                        }
                    }

                    // now that we know all the properties that should be displayed from the model, look for our
                    // new property in the lProperties array, then use that
                    // to get the previous property, display group and previous display group
                    for ( n = 0; n < lProperties.length; n++ ) {
                        lPropertyId = lProperties[ n ].id;

                        // exclude HIDDEN properties
                        if ( lPropertyMetaData[ lPropertyId ].type !== PROP_TYPE.HIDDEN ) {
                            let prevPropertyId;
                            // get the previous non-hidden property
                            for ( let j = n - 1; j >= 0; j-- ) {
                                if ( lPropertyMetaData[ lProperties[ j ].id ].type !== PROP_TYPE.HIDDEN ) {
                                    prevPropertyId = lProperties[ j ].id;
                                    break;
                                }
                            }

                            lDisplayGroupId = lPropertyMetaData[ lPropertyId ].displayGroupId;

                            // build array of unique display groups to get easy access to previous display group
                            if ( n === 0 ) {
                                lDisplayGroupArray.push ( lDisplayGroupId );
                            } else {
                                // if this isn't the first iteration, check the previous group, if it's different, add to array
                                if ( lDisplayGroupId !== lPropertyMetaData[ prevPropertyId ]?.displayGroupId ) {
                                    lDisplayGroupArray.push ( lDisplayGroupId );
                                }
                            }

                            // loop over properties to add and check if this property is to be added
                            for ( i = 0; i < lPropertiesToAdd.length; i++ ) {
                                if ( lPropertyId === lPropertiesToAdd[ i ] ) {
                                    // store property to add
                                    lPropertyToAdd = pNotifications[ 0 ].component.getProperty ( lPropertiesToAdd[ i ] );

                                    self.element.propertyEditor ( "addProperty", {
                                        property: self._toPEProperty ( lPropertyToAdd, lComponents ),
                                        prevPropertyName: prevPropertyId,
                                        displayGroup: {
                                            displayGroupId: lPropertyMetaData[ lProperties[ n ].id ].displayGroupId,
                                            displayGroupTitle: model.getDisplayGroup ( lDisplayGroupId ).title,
                                            properties: []
                                        },
                                        prevDisplayGroupId: lDisplayGroupArray[ lDisplayGroupArray.length - 2 ]
                                    } );

                                    // exit loop, we have found our new property
                                    break;
                                }
                            }
                        }
                    }

                    // properties to remove
                    lPropertiesToRemove = self._getEventSpecificProperties ( pNotifications[ 0 ].properties, [ model.EVENT.REMOVE_PROP ] );
                    for ( i = 0; i < lPropertiesToRemove.length; i++ ) {
                        self.element.propertyEditor ( "removeProperty", lPropertiesToRemove[ i ] );
                    }

                },
                true
            );
            model.observer (
                this.widgetName, {
                    components: pComponents,
                    events: [
                        model.EVENT.ERRORS,
                        model.EVENT.NO_ERRORS,
                        model.EVENT.WARNINGS,
                        model.EVENT.NO_WARNINGS,
                        model.EVENT.META_DATA ]
                },
                function ( pNotifications ) {
                    let lComponentProperties = [], lAffectedProperties,
                        lComponents = [];

                    debug.trace ( "%s: ERRORS/NO_ERRORS/WARNINGS/NO_WARNINGS/META_DATA notification received", self.widgetName, pNotifications );

                    // first we have to loop through the notifications, to build up a complete list of components changed.
                    // at the same time, we create a list of the event specific properties of the components
                    for ( let i = 0; i < pNotifications.length; i++ ) {
                        lComponents.push ( pNotifications[ i ].component );
                        // get the event specific property ids of each notification
                        lComponentProperties.push( ...self._getEventSpecificProperties( pNotifications[i].properties, [model.EVENT.ERRORS, model.EVENT.NO_ERRORS, model.EVENT.WARNINGS, model.EVENT.NO_WARNINGS, model.EVENT.META_DATA]));
                    }

                    // keep only unique values
                    lAffectedProperties = Array.from( new Set( lComponentProperties ) );

                    // we store only the "common" properties, ie. can be found in every component
                    for ( let i = 0; i < lComponents.length; i++ ) {
                        // get all property ids of a component
                        let lPropertyIds = lComponents[i].getProperties().reduce( ( acc, curr ) => acc = [ ...acc, curr.id ], [] );
                        // remove the id from the array if the component does not have such property
                        lAffectedProperties = lAffectedProperties.filter( prop => lPropertyIds.includes( prop ) );
                    }

                    for ( let i = 0; i < lAffectedProperties.length; i++ ) {
                        const
                            lProperty = pNotifications[ 0 ].component.getProperty ( lAffectedProperties[ i ] ),
                            lPEProperty = self._toPEProperty ( lProperty, lComponents );

                        // push the updating action to the end of the execution queue
                        // in case Tab was hit, this will give the the next element the chance to receive focus
                        setTimeout( () => {
                            self.element.propertyEditor ( "updateProperty", lPEProperty );
                        }, 0 );
                    }
                },
                true
            );
        }
    });     // end of pdPropertyEditor widget

})( window.pe, apex.jQuery, apex.debug, apex.lang, apex.util, window.pageDesigner, apex.navigation, apex.server, apex.templateOptionsHelper, apex.env );
