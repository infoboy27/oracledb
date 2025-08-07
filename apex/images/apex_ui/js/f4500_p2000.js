/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This is the main controller for the SQL Workshop Object Browser.
 * Page 2000 initializes the main controller code by calling the objectBrowser.initialize function.
 * Rough TOC
 * - Constants, variables, utility initialization functions
 * - View types implementations
 * - Dialogs support functions used by objectBrowserDialogs.js
 * - Object Browser Interface public functions in objectBrowser namespace
 **/
/* global Prism */
// eslint-disable-next-line no-unused-vars
const objectBrowser = ( function( $, apexModel, util, lang, apexMessage,
                                  server, storage, apexActions, debug, item, navigation, theme ) {
    "use strict";

    const ARIA_LABEL = "aria-label",
        ARIA_LABELED_BY = "aria-labelledby";

    const ACTION = "action",
        SEPARATOR_MI = { type: "separator" },
        TB_BUTTON = "BUTTON",
        TB_MENU = "MENU",
        OPTION = "option",
        REFRESH = "refresh",
        FOCUS = "focus",
        HIDE = "hide",
        SHOW = "show",
        SEL_VIEW_PREFIX = ".ob-view-",
        SEL_VT_GRID = ".ob-vtype-grid",
        SEL_GRID_VIEW = ".a-GV",
        SEL_VT_NVP = ".ob-vtype-nvp",
        SEL_VT_EDITOR = ".ob-vtype-editor";

    const ID_DATA = "DATA",
        ID_ENV_IMPORTS = "ENV_IMPORTS";

    const SKEY_PREFIX = "ORA_WWV_apex.objectBrowser",
        SKEY_OPEN_TABS = "openTabs",
        SKEY_VIEW_STATE = "viewState",
        SKEY_LAST_SCHEMA = "lastSchema",
        SKEY_TREE_EXPANSION_STATE = "treeExpansionState",
        SKEY_TREE_SELECTION = "treeSelection",
        SKEY_FILTER = "objectFilter";

    const OBJECTS_TREE_MODEL = "objectsTree";

    const sessionStorage = storage.getScopedSessionStorage( {prefix: SKEY_PREFIX, useAppId: false} ),
        viewTypesMap = new Map(),
        objectTypeDefMap = new Map(),
        objectsTreeTypes = {},
        objectTypeActions = [],
        viewToActionsMap = new Map(), // the actions for each view
        lastViewByType = new Map(), // for each type remember the last used view
        viewStateMap = new Map();

    const CODE_EDITOR_PREF_NAME = "CODE_EDITOR_SETTINGS",
        DEFAULT_ACTIONS_COL_WIDTH = 42,
        MAX_VISIBLE_DATA_COLUMNS = 30,
        INVALID = "INVALID",
        DIR_NODE_SUFFIX = "_DIR";

    const keys = $.ui.keyCode;

    const objectEntries = Object.entries,
        isArray = Array.isArray,
        toInteger = ( numStr )  => {
            return parseInt( numStr, 10 );
        };

    let currentObjectTypeDef = null,
        currentTabState = null,
        previousType = null,
        previousTypeView = null; // when a new object instance/view is activated this is the previous instance type and view.

    let gEditorSettings,
        gGridRegionId,
        gGridAjaxIdentifier,
        gCodeRegionId,
        gCodeAjaxIdentifier,
        gLinks;

    const gSchemaItem = item( "P2000_OB_SCHEMA" ); // this is the parsing schema

    // fix for tabs when used on a page with base and don't care about "remote" tabs
    $.widget( "ui.tabs", $.ui.tabs, {
        _isLocal: function() {
            return true;
        }
    } );

    // This was once tabsMgr multiDocTabs (from apex_ui/js/multiDocTabs.js)
    // This odd interface only makes sense if you understand that OB was once a true IDE and supported tabbed
    // multi document architecture.
    // Note that tabPanel$ is not a tab panel anymore. It is just the div that contains all the open object
    // view content. It is the same as docBody$. Don't confuse it with specific view content which is a tab panel
    // in the tab set that was once a toolbar radio group (action choices).
    const doc = ( function() {
        let currentDoc = null,
            noDoc$ = null,
            docArea$ = null,
            toolbar$ = null,
            viewTabs$ = null,
            docBody$ = null,
            docTitle$ = null;

        function renderIcon( icon, iconLabel ) {
            const out = util.htmlBuilder();

            out.markup( `<span` )
                .attr( "class", "a-Icon " + icon );
            if ( iconLabel ) {
                out.markup( ` role="img"` )
                    .attr( ARIA_LABEL, iconLabel );
            }
            out.markup( "></span>" );
            return out.toString();
        }

        function updateTitleState( docDescriptor ) {
            const error = docDescriptor.hasErrors || false;

            docTitle$.toggleClass( "is-error", error );
            docArea$.attr( ARIA_LABELED_BY, "obObjectDocLabel" + ( error ? " obObjectDocStatus" : "" ) );
            docTitle$.toggleClass( "is-changed", docDescriptor.getIsChanged() );
        }

        function updateTitle( docDescriptor ) {
            docTitle$.find( ".b-OB-docHeader-icon" ).html( renderIcon( docDescriptor.icon, docDescriptor.iconLabel ) );
            // path is no longer used
            docTitle$.find( ".b-OB-docHeader-label" ).text( docDescriptor.name );
        }

        return {
            /*
             * Expected from the server:
             * #obMain
             *  #obObjectDoc
             *    #obObjectDocTitle // content kept intact, can have .is-error and .is-changed state classes
             *      .b-OB-docHeader .b-OB-docHeader-icon
             *      #obObjectDocLabel or .b-OB-docHeader .b-OB-docHeader-label
             *    #obObjectDocToolbar // content replaced
             *    #obObjectDocBody // content replaced
             *  #<whatever the cards region id is> // found with $("#obObjectDoc").next()
             */
            init: function( elementId, options ) {
                viewTabs$ = docArea$ = $( "#" + elementId );
                docTitle$ = $( "#obObjectDocTitle" );
                toolbar$ = $( "#obObjectDocToolbar" );
                docBody$ = $( "#obObjectDocBody" );
                noDoc$ = docArea$.next();
                // add dummy tab, tab panel markup so that tabs widget can be initialized. Specific view tabs
                // are set on openDocument
                const tabBar$ = $( "#obObjectDocTabs" );
                tabBar$.html( `<ul><li><a href="#ob_temp_tab">L</a></li></ul>` );
                docBody$.append( `<div id="ob_temp_tab"></div>` );
                viewTabs$.tabs( {
                    heightStyle: "content", // want "fill" behavior but tabs
                                            // doesn't like the panels wrapped in a div; sets height to 0
                    activate: function( event, ui ) {
                        let viewId = ui.newPanel.prop( "id" );

                        if ( viewId ) {
                            viewId = viewId.replace( "ob_view_", "" );
                            apexActions.set( "change-view", viewId );
                        }
                    }
                } );

                options.initToolbar( toolbar$ );

                // handle tabs resize ui-tabs.resize
                // need this because tabs added after page loads so the handler in theme.js doesn't kick in
                // which is good because different resize logic is needed
                viewTabs$.on( "resize", function( event ) {
                    if ( event.target !== this ) {
                        return;
                    }
                    // update size of docBody$ and panels
                    let w = $(event.target).width(),
                        h = $(event.target).height();

                    h = h - docBody$.position().top;
                    docBody$.add( docBody$.children() ).width( w ).height( h );

                    // refreshing tabs doesn't help. already sized panels so resize doc in active panel
                    currentDoc.resize();
                    event.stopPropagation();
                });

            },
            syncViewTabs: function( viewId ) {
                const curIndex = viewTabs$.tabs( "option", "active" ),
                    tabs$ = viewTabs$.find( ".ui-tabs-nav" ).first().children(),
                    newIndex = tabs$.index( tabs$.filter( `[aria-controls="ob_view_${viewId}"]` ) );

                if ( curIndex !== newIndex ) {
                    viewTabs$.tabs( "option", "active", newIndex );
                }
            },
            /**
             *
             * @param {object} docDescriptor
             * @param {string} docDescriptor.id
             * @param {string} docDescriptor.name
             * @param {string} docDescriptor.type
             * @param {string} docDescriptor.icon
             * @param {function} docDescriptor.renderUI
             * @param {function} docDescriptor.initUI
             * @param {function} docDescriptor.activate
             * @param {function} docDescriptor.resize
             */
            openDocument: function( docDescriptor ) {
                const content = docDescriptor.renderUI();

                function open() {
                    noDoc$.hide();
                    docArea$.show();

                    updateTitle( docDescriptor );
                    updateTitleState( docDescriptor );

                    currentDoc = docDescriptor;
                    docArea$.parent().trigger( "resize" );
                    docBody$.html( content );
                    docDescriptor.initUI( docBody$ );
                    docDescriptor.activate( apexActions, toolbar$, viewTabs$ );
                    // todo consider if should focus after open
                }

                if ( !currentDoc ) {
                    open();
                } else {
                    this.checkAndCloseDoc().then( ( closed ) => {
                        if ( closed ) {
                            open();
                        }
                    } );
                }
            },
            closeDocument: function() {
                if ( currentDoc ) {
                    currentDoc.destroyUI( docBody$ );
                }
                docArea$.hide();
                noDoc$.show();
                noDoc$.trigger( "resize" );
                currentDoc = null;
            },
            checkAndCloseDoc: function() {
                return new Promise( ( resolve ) => {
                    let warningMessage = currentDoc && currentDoc.checkRemove();

                    if ( warningMessage ) {
                        apexMessage.confirm( warningMessage, ok => {
                            if ( ok ) {
                                currentDoc.clear();
                                this.closeDocument();
                            }
                            resolve( ok );
                        } );
                        return;
                    }
                    this.closeDocument();
                    resolve( true );
                } );
            },
            renameDocument: function( docDescriptor ) {
                currentDoc = docDescriptor;
                updateTitle( docDescriptor );
                updateTitleState( docDescriptor );
            },
            // replaces getAllDocDescriptors and findDocDescriptor
            getDocDescriptor: function() {
                return currentDoc;
            },
            updateDocState: function() {
                updateTitleState( currentDoc );
            }
        };
    } )();

    function getSchema() {
        // in this case the display value is what we want. The value is only for persisting state
        return gSchemaItem.displayValueFor( gSchemaItem.getValue() );
    }

    function getSchemaId() {
        return gSchemaItem.getValue();
    }

    function getSchemaIdFromSchema( schema ) {
        let id = null;

        gSchemaItem.element.children( OPTION ).each( function() {
            const opt$ = $( this );

            if ( opt$.text().trim() === schema ) {
                id = opt$.attr( "value" );
                return false; // break
            }
        } );
        return id;
    }

    function getActionMessage( key ) {
        return lang.getMessage( "OB.ACTION_" + key );
    }

    function getMessage( key ) {
        return lang.getMessage( "OB." + key );
    }

    function getTypeDef( type ) {
        return objectTypeDefMap.get( type );
    }

    function typeDisplayName( typeName ) {
        return typeName
            .toLowerCase()
            .split( "_" )
            .map( part => part.substring( 0, 1 ).toUpperCase() + part.substring( 1 ) )
            .join( " " );
    }

    function makeObjectDocDescriptor( objType, objOwner, objName, objId, schema, schemaId, hasErrors = false ) {
        const typeDef = getTypeDef( objType );

        return {
            id: objId,
            path: schema + ".",
            name: objName,
            title: schema + "." + objName, // todo think should the title include the object type?
            type: objType,
            icon: typeDef.icon,
            iconLabel: typeDisplayName( objType ),
            hasErrors: hasErrors,

            getIsChanged: function() {
                // currently, only editor views can have pending changes
                // and only editor views make use of the data property
                for ( const [, data] of this.data ) {
                    if( data.isChanged ) {
                        return true;
                    }
                }
                return false;
            },

            renderUI: function() {
                return typeDef.renderUI( this );
            },
            initUI: function( tabPanel$ ) {
                typeDef.initUI( this, tabPanel$ );
            },
            destroyUI: function( tabPanel$ ) {
                typeDef.destroyUI( this, tabPanel$ );
            },
            activate: function( actions, toolbar$, tabs$ ) {
                if ( currentObjectTypeDef && currentTabState ) {
                    previousTypeView = currentObjectTypeDef.type + "_" + currentTabState.currentViewId;
                }
                currentObjectTypeDef = typeDef;
                currentTabState = this;

                // for accessibility let the toolbar label reflect the type of object
                toolbar$.attr( ARIA_LABEL, lang.formatMessage( "OB.TB_LABEL", this.iconLabel ) );

                // activate the object ui
                typeDef.activate( this, actions, toolbar$, tabs$ );
            },
            loadViewData: function( viewId, progressView$, callback ) {
                typeDef.loadViewData( this, viewId, progressView$, callback, true );
            },
            resize: function() {
                typeDef.resize( this );
            },
            checkRemove: function() {
                return typeDef.checkRemove( this );
            },
            clear: function() {
                return typeDef.clear( this );
            },

            // object browser specific stuff
            save: function() {
                return typeDef.save( this );
            },
            getViewReadOnly: function( viewId ) {
                return typeDef.getViewReadOnly( this, viewId );
            },
            setViewReadOnly: function( viewId, readOnly ) {
                typeDef.setViewReadOnly( this, viewId, readOnly );
            },
            getViewIsChanged: function( viewId ) {
                return typeDef.getViewIsChanged( this, viewId );
            },
            clearViewChanges: function( viewId ) {
                return typeDef.clearViewChanges( this, viewId );
            },
            currentViewId: null,
            // modelId: is model id of current view if there is one
            // modelIds: is like modelId but for when the view has multiple models
            getCurrentView: function() {
                return this.tabPanel$.children( SEL_VIEW_PREFIX + this.currentViewId );
            },
            owner: objOwner,
            schema: schema,
            schemaId: schemaId, // This is only used to persist open tabs!
            initializedViews: new Set(), // viewId
            staleViews: new Set(),
            staleObjects: new Set(),
            models: new Map(), // viewId -> model
            columns: new Map(), // viewId -> columns
            /*
             * used by the editor view to store initialValue for hasChanged and readOnly flag
             * viewId -> { initialValue, readOnly }
             */
            data: new Map()
        };
    }

    function getObjectsTree() {
        return $( "#objectsTree" );
    }

    function getNodeAdapter( tree$ ) {
        return tree$.treeView( "getNodeAdapter" );
    }

    function selectInTree( id ) {
        const tree$ = getObjectsTree(),
            treeAdapter = getNodeAdapter( tree$ ),
            node = treeAdapter.getRecord( id );

        if ( node ) {
            const parent = treeAdapter.parent( node );

            if ( parent && parent.type && parent.type.endsWith( DIR_NODE_SUFFIX ) ) {
                // make sure parent is expanded
                // most of the time the selected nodes parent is expanded (how could it not be when saving state)
                // but in the case of going to a specific object from the URL the parent could be collapsed which
                // causes the selection to fail.
                tree$.treeView( "expand", tree$.treeView( "getTreeNode", parent ) );
            }
            tree$.treeView( "setSelectedNodes", [node] );
        }
    }

    function openAndSelectInTree( type, label, owner, id, schema, hasError = false ) {
        // open in tab
        doc.openDocument( makeObjectDocDescriptor( type, owner, label, id, schema, getSchemaIdFromSchema( schema ), hasError ) );
        // and select node
        selectInTree( id );
    }

    function updateInvalidState( success, objectInstance, objId, objSchema ) {
        objectInstance.hasErrors = !success;
        doc.updateDocState();

        // update tree valid state
        if ( objSchema === getSchema() ) {
            const tree$ = getObjectsTree(),
                treeAdapter = getNodeAdapter( tree$ ),
                node = treeAdapter.getRecord( objId ),
                wasSuccess = node.status !== INVALID;

            // if state changed update
            if ( success !== wasSuccess ) {
                if ( success ) {
                    delete node.classes;
                    // using set value causes the node UI to be updated
                    treeAdapter.setValue( node, "status", "VALID" );
                } else {
                    node.classes = "is-error";
                    // using set value causes the node UI to be updated
                    treeAdapter.setValue( node, "status", INVALID );
                }
            }
        }
    }

    function getGridRowContextRecord( contextElement, grid$ ) {
        let record = null,
            row$ = $( contextElement ).closest( ".a-GV-row" );

        if ( row$.length > 0 ) {
            record = grid$.grid( "getRecords", [row$] )[0];
        }
        return record;
    }

    function defineActions() {
        //
        // Global actions
        //
        apexActions.add( [
            {
                name: "refresh-view",
                label: getActionMessage( "REFRESH" ),
                icon: "icon-ob-refresh",
                action: function() {
                    if ( currentObjectTypeDef ) {
                        currentObjectTypeDef.refreshData( currentTabState );
                    }
                }
            },
            {
                name: "change-view",
                label: getActionMessage( "CHANGE_VIEW" ),
                get: function() {
                    return currentObjectTypeDef ? currentObjectTypeDef.getActiveView( currentTabState ) : "NONE";
                },
                set: function( value ) {
                    if ( currentObjectTypeDef ) {
                        if ( value !== currentTabState.currentViewId ) {
                            if ( currentTabState.currentViewId ) {
                                previousTypeView = currentObjectTypeDef.type + "_" + currentTabState.currentViewId;
                            }
                            currentObjectTypeDef.activateView( currentTabState, value );
                            doc.syncViewTabs( value );
                        }
                    }
                },
                choices: []
            },
            {
                name: "open-object",
                labelKey: "OB.ACTION_OPEN_OBJECT",
                action: function( event, el, args ) {
                    if ( args && args.id && args.label && args.type ) {
                        let type = args.type.replace( " ", "_" ),
                            owner = args.owner,
                            schema = args.owner,
                            schemaId = getSchemaIdFromSchema( schema );

                        if ( !schemaId ) {
                            apexMessage.alert( lang.formatMessage( "OB.NO_SCHEMA", schema ) );
                            return;
                        }
                        if ( type === "PACKAGE_BODY" ) {
                            type = "PACKAGE";
                        }
                        // todo consider ability to go to a specific view
                        // todo think object status (hasErrors) isn't known at this point and object may not be in the
                        //   tree so can't get it from there in all cases. Need to get this from the object itself.
                        doc.openDocument( makeObjectDocDescriptor( type, owner, args.label, args.id, schema, schemaId ) );
                        return true;
                    }
                }
            },
            {
                name: "goto-error",
                labelKey: "OB.ACTION_GOTO_ERROR",
                action: function( event, el, args ) {
                    if ( args && args.view && args.line && args.column ) {
                        let view = args.view,
                            line = args.line,
                            column = args.column;

                        if ( view && line && column ) {
                            apexActions.set( "change-view", view );

                            line = toInteger( line );
                            column = toInteger( column );

                            const viewId = currentTabState.currentViewId,
                                editor$ = currentTabState.getCurrentView().find( ".a-MonacoEditor" ),
                                state = viewStateMap.get( currentTabState.id + "_" + viewId );

                            // if editor text not loaded yet then gotoPosition won't work. Set saved state
                            if ( state ) {
                                state.l = line;
                                state.c = column;
                            }
                            editor$.codeEditor( "gotoPosition", line, column , true );
                        }
                        return true;
                    }
                }
            },
            {
                name: "copy-query",
                label: getActionMessage( "COPY" ), // using null doesn't work because button not yet rendered
                action: function() {
                    // grid already handles copy to clipboard and apex.clipboard does not support nested handlers
                    // so no point in using apex.clipboard.addHandler
                    apex.clipboard.copy();
                }
            },
            {
                name: "run-query",
                label: getActionMessage( "RUN" ),
                action: function( event, el, args ) {
                    if ( args && args.url ) {
                        navigation.redirect( args.url.replaceAll( "%26", "&" ) );
                    }
                }
            },
            {
                name: "choose-columns",
                label: getActionMessage( "COLUMNS" ),
                icon: "icon-ob-columns",
                hide: true,
                action: function() {
                    return openDialog( "dialogColumns", {
                        grid$: currentTabState.getCurrentView().find( SEL_GRID_VIEW )
                    } );
                }
            },
            {
                name: "filter",
                label: getActionMessage( "FILTER" ),
                icon: "icon-ob-filter",
                hide: true,
                action: function() {
                    return openDialog( "dialogFilter", {
                        grid$: currentTabState.getCurrentView().find( SEL_GRID_VIEW )
                    } );
                }
            },
            {
                name: "download-excel",
                label: getActionMessage( "DL_EXCEL" ),
                icon: "icon-ob-download",
                hide: true,
                action: function() {
                    if ( currentObjectTypeDef ) {
                        currentObjectTypeDef.download( currentTabState, "XLSX" );
                    }
                }
            },
            {
                name: "download-text",
                label: getActionMessage( "DL_TEXT" ),
                icon: "icon-ob-download",
                hide: true,
                action: function() {
                    if ( currentObjectTypeDef ) {
                        currentObjectTypeDef.download( currentTabState, "TEXT" );
                    }
                }
            },
            // todo future consider download-pdf, doubtful since CSV was removed
            {
                name: "create-current-object-type",
                label: null, // the label is updated dynamically later
                contextLabelKey: "OB.ACTION_CREATE_CURRENT",
                hide: true,
                action: function( event, el, args ) {
                    if ( this.createActionName ) {
                        return apexActions.invoke( this.createActionName, event, el, args );
                    }
                }
            },
            // TODO refactor. the mle-env-import- actions and their handlers are virtually the same as their IG counterparts
            //  aside from tha label and model name
            {
                name: "mle-env-import-row-delete",
                labelKey: "OB.ACTION_DROP_IMPORT",
                icon: "icon-ig-delete",
                action: function ( menu, el ) {
                    const model = currentTabState.models.get( ID_ENV_IMPORTS ),
                        grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW ),
                        record = getGridRowContextRecord( el, grid$ );

                    if ( record ) {
                        model.deleteRecords( [record] );
                    }
                }
            },
            {
                name: "mle-env-import-row-revert",
                labelKey: "APEX.IG.REVERT_CHANGES",
                icon: "icon-ig-revert",
                action: function ( menu, el ) {
                    const model = currentTabState.models.get( ID_ENV_IMPORTS ),
                        grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW ),
                        record = getGridRowContextRecord( el, grid$ );

                    if ( record ) {
                        // put focus back before doing revert so it will refocus after dom is replaced
                        grid$.grid( FOCUS );
                        model.revertRecords( [record] );
                    }
                }
            },
            // mle-env-import-selection-add-row defined in table data actions so that it can be added to the toolbar
            {
                name: "mle-env-import-selection-delete",
                labelKey:  "OB.ACTION_DROP_IMPORT", // TODO needs pluralized label
                icon: "icon-ig-delete",
                action: function() {
                    const model = currentTabState.models.get( ID_ENV_IMPORTS ),
                        grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW );

                    if ( !model || !grid$[0] ) {
                        return;
                    } // else
                    let records = grid$.grid( "getSelectedRecords" );

                    // exclude selected rows which may be marked for deletion already
                    for ( let i = 0; i < records.length; i++ ) {
                        if ( !model.allowDelete( records[i] ) ) {
                            records.splice( i, 1 );
                            i -= 1;     // i stays the same for next iteration
                        }
                    }
                    if ( records.length > 0 ) {
                        model.deleteRecords( records );
                    }
                }
            },
            {
                name: "mle-env-import-selection-revert",
                labelKey: "APEX.IG.REVERT_CHANGES",
                icon: "icon-ig-revert",
                action: function() {
                    const model = currentTabState.models.get( ID_ENV_IMPORTS ),
                        grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW );

                    if ( !model || !grid$[0] ) {
                        return;
                    } // else
                    let records = grid$.grid( "getSelectedRecords" );

                    // exclude selected rows which may be marked for deletion already
                    for ( let i = 0; i < records.length; i++ ) {
                        if ( !model.canRevertRecord( records[i] ) ) {
                            records.splice( i, 1 );
                            i -= 1;     // i stays the same for next iteration
                        }
                    }
                    if ( records.length > 0 ) {
                        model.revertRecords( records );
                    }
                }
            },
            {
                name: "row-edit",
                labelKey: "OB.EDIT_DATA",
                action: function( menu, el ) {
                    const grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW ),
                       model = currentTabState.models.get( ID_DATA ),
                       record = getGridRowContextRecord( el, grid$ ),
                       args = {
                            model: model,
                            record: record,
                            dialogTitle: getMessage( "EDIT_DATA" ),
                            pageMode: "E"
                        };

                    return openDialog( "dialogRowEdit", args );
                }
            },
            {
                name: "import-edit",
                labelKey: "OB.EDIT_IMPORT",
                action: function( menu, el ) {
                    const grid$ = currentTabState.getCurrentView().find( SEL_GRID_VIEW ),
                       model = currentTabState.models.get( ID_ENV_IMPORTS ),
                       record = getGridRowContextRecord( el, grid$ ),
                       args = {
                            model: model,
                            record: record,
                            dialogTitle: getMessage( "EDIT_IMPORT" ),
                            pageMode: "E"
                        };

                    return openDialog( "dialogImportEdit", args );
                }
            },
        ] );

        //
        // Object type view specific actions
        //
        objectTypeActions.forEach( a => {
            const actions = a.actions,
                actionNames = [];

            for ( let i = 0; i < actions.length; i++ ) {
                let action = actions[i];

                if ( typeof action === "string" ) {
                    actionNames.push( action );
                } else {
                    // they all default to hidden
                    action.hide = true;
                    apexActions.add( action );
                    actionNames.push( action.name );
                }
            }

            // setup map of type+view => array of action names
            viewToActionsMap.set( a.type + "_" + a.view, actionNames );
        } );
    }

    // note this is specific to friendly URLs
    function getUrlArgs() {
        const params = new URLSearchParams( window.location.search ),
            args = {};

        for ( const [n, v] of params ) {
            args[n.toUpperCase()] = v;
        }
        return args;
    }

    // exposed from initObjectsTree
    let clearObjectsFilter, getObjectsFilterValue;

    function openNode( node ) {
        const curDesc = doc.getDocDescriptor(),
            id = node.id,
            schema = getSchema(),
            typeDef = getTypeDef( node.type ),
            hasError = node.status === INVALID;

        if ( id && typeDef ) { // just to be safe make sure there is a type defined for this node
            if ( !curDesc || curDesc.id !== id ) {
                // when opening from the tree the owner is going to be the same as the parsing schema
                doc.openDocument(
                    makeObjectDocDescriptor( node.type, schema, node.label, id,
                        schema, getSchemaId(), hasError ) );
            }
        }
    }

    function initObjectsTree( regionId, ajaxIdentifier ) {
        const tree$ = getObjectsTree();
        let ids, lastSchema, selId,
            openSel = false,
            createObjectLabelPattern = null;

        // set the initial height before init the tree to see progress spinner
        // todo would be much better if the splitter already initialized
        let h = $( "#obMainSplitter" ).height() - $( "#obLeftHeader" ).height();
        tree$.parent().height( h );

        ids = sessionStorage.getItem( SKEY_TREE_EXPANSION_STATE );
        if ( ids ) {
            ids = ids.split( ":" );
        }
        selId = sessionStorage.getItem( SKEY_TREE_SELECTION );
        lastSchema = sessionStorage.getItem( SKEY_LAST_SCHEMA ); // this is the id not the schema name

        const args = getUrlArgs();

        // check if there is an initial schema/object pair to open on initial page load
        // if so it overrides anything from session storage
        if ( args.P2000_OB_INIT_SCHEMA ) {
            lastSchema = getSchemaIdFromSchema( args.P2000_OB_INIT_SCHEMA );
            if ( args.P2000_OB_INIT_ID ) {
                selId = args.P2000_OB_INIT_ID;
                openSel = true;
            } else {
                // the schema may be different from what was saved so select nothing because selId may not be in schema
                selId = null;
            }
            // clean up URL so page can be reloaded
            // note this is specific to the friendly URL format
            let url = new URL( window.location.href ),
                params = new URLSearchParams( url.search );

            params.delete( "p2000_ob_init_schema" );
            params.delete( "p2000_ob_init_id" );
            params.delete( "clear" );
            url.search = params.toString();
            // decode encoded characters like ":" or "," to lessen the visual impact
            window.history.replaceState( {}, "", decodeURIComponent( url.toString() ) );
        }

        if ( lastSchema ) {
            let prev = getSchemaId();

            gSchemaItem.setValue( lastSchema );
            if ( getSchemaId() !== lastSchema ) { // comparing ids
                // saved value not a valid schema so revert
                gSchemaItem.setValue( prev );
                // also ignore any other tree state
                selId = null;
                ids = [];
            }
        }

        let lastFilterString = null,
            filterContext = {
                matchString: "",
            },
            treeAdapter = $.apex.treeView.makeModelNodeAdapter( OBJECTS_TREE_MODEL, {
                fields: {
                    label: {},
                    type: {},
                    id: {},
                    classes: {},
                    status: {},
                    children: {}
                },
                regionId: regionId,
                ajaxIdentifier: ajaxIdentifier,
                regionData: {
                    dataShape: "tree",
                    parsingSchema: getSchema()
                },
                requestOptions: {
                    refreshObject: tree$[0] // to get the apexafterrefresh event
                },
                editable: true,
                trackChanges: false, // the tree edits are never saved; this avoids having to call clearChanges
                types: objectsTreeTypes,
                typeField: "type",
                identityField: "id",
                childrenField: "children",
                classesField: "classes",
                hasIdentity: true,
                initialExpandedNodeIds: ids,
                visibilityFilter: ( model, node, context ) => {
                    return node.label.toUpperCase().includes( context.matchString );
                },
                visibilityFilterContext: null
            } );

        // this menu will exist but it doesn't yet so trick the treeView into accepting it as the contextMenuId
        const tempMenu$ = $( "#objectsTreeMenu_menu" );

        tempMenu$.data( "apexMenu", {} );

        let treeOptions = {
            showRoot: false,
            collapsibleRoot: false,
            getNodeAdapter: function() {
                return treeAdapter;
            },
            contextMenuId: "objectsTreeMenu_menu",
            iconType: "a-Icon",
            multiple: false,
            doubleClick: "toggle",
            autoCollapse: false,
            useLinks: false,
            navigation: true,
            // events
            activateNode: function( event, ui ) {
                if ( ui.nodes.length > 0 ) {
                    if ( ui.nodes[0].type.endsWith( DIR_NODE_SUFFIX ) ) {
                        doc.checkAndCloseDoc();
                    } else {
                        openNode( ui.nodes[0] );
                    }
                }
            },
            selectionChange: function() {
                const sel = tree$.treeView( "getSelectedNodes" ),
                    action = apexActions.lookup( "create-current-object-type" );
                let createActionName, createAction;

                // the action has the initial pattern for label, get it once because it will get overwritten
                if ( !createObjectLabelPattern ) {
                    const menu$ = $( "#objectsCreateMenu_menu" );
                    let createItems;

                    createObjectLabelPattern = action.label;
                    // all the create-* actions could use a contextLabel
                    // Example create-table has label "Table" and needs contextLabel to be "Create Table"
                    // assume create sub menu exists and is first subMenu
                    createItems = menu$.menu( OPTION ).items;
                    createItems.forEach( item => {
                        if ( item.id && item.id.startsWith( "create-" ) ) {
                            let action = apexActions.lookup( item.id );

                            action.contextLabel = lang.format( createObjectLabelPattern, action.label );
                        }
                    } );
                }
                if ( sel.length && sel[0].type !== "INVALID_DIR" ) {
                    // This relies on the object type collection nodes having the same type names as the
                    // object instance nodes with a _DIR suffix.
                    createActionName = "create-" + sel[0].type.replace( DIR_NODE_SUFFIX, "" ).replace( "_", "-" ).toLowerCase();
                }

                action.hide = true;
                if ( createActionName ) {
                    createAction = apexActions.lookup( createActionName );
                    if ( createAction ) {
                        action.label = lang.format( createObjectLabelPattern, createAction.label );
                        action.createActionName = createActionName;
                        action.hide = false;
                    }
                }
                apexActions.update( "create-current-object-type" );
            }
        };

        tree$.treeView( treeOptions );

        // restore the initial selection if any just once
        tree$.on( "apexafterrefresh", () => {
            const curSchema = getSchema(),
                desc = doc.getDocDescriptor();

            lastFilterString = null;
            // after tree refreshes check current doc (for this schema) to make sure the object still exists
            // and also to update error indication
            if ( desc && desc.schema === curSchema ) {
                let n$ = tree$.treeView( "find", {
                    match: n => n.id === desc.id,
                    depth: -1
                } );

                if ( n$.length === 0 ) {
                    doc.closeDocument();
                } else {
                    const node = tree$.treeView( "getNodes", n$ )[0],
                        hasErrors = node.status === INVALID;

                    if ( desc.hasErrors !== hasErrors ) {
                        desc.hasErrors = hasErrors;
                        doc.updateDocState();
                    }
                }
            }
            checkFilter();
            // updateInvalidObjects does not add nodes to UI synchronously so wait just in case the node to select is
            // one of the invalid nodes.
            if ( selId ) {
                setTimeout( () => {
                        if ( openSel ) {
                            const treeAdapter = getNodeAdapter( tree$ ),
                                node = treeAdapter.getRecord( selId );

                            if ( node ) {
                                openAndSelectInTree( node.type, node.label, getSchema(), selId, getSchema(),
                                    node.status === INVALID );
                            }
                        } else {
                            selectInTree( selId );
                        }
                        selId = null; // only set initial selection once
                }, 0 );
            }
        } );

        tempMenu$.removeData( "apexMenu" );

        const filterInput$ = $( "#P2000_OB_OBJECTS_FILTER" );
        const checkFilter = () => {
            let value = filterInput$.val();

            if ( value !== lastFilterString ) {
                if ( value.length > 0 && ( lastFilterString === "" || lastFilterString === null ) ) {
                    // Going from no filter to some filter, expand all after a short delay.
                    // Don't want to expand until some filtering is done but don't know when that is
                    // because filtering is debounced and there is no notification from updateVisibility.
                    // Its not perfect but wait about the same as the debounce time.
                    setTimeout( () => {
                        tree$.treeView( "expandAll" );
                    }, 200 );
                }
                filterInput$.next().toggleClass( "is-empty", value === "" );
                debounceFilterTree( value );
                lastFilterString = value;
            }
        };
        const filterTree = filterString => {
            filterContext.matchString = filterString.toUpperCase();
            treeAdapter.updateVisibility( filterContext );
        };
        const debounceFilterTree = util.debounce( filterTree, 200 );

        // expose this outside of this function
        clearObjectsFilter = function() {
            filterInput$.val( "" );
            lastFilterString = null;
        };
        getObjectsFilterValue = function() {
            return filterInput$.val();
        };

        // until there is built-in support for clear icons in input fields add one here:
        filterInput$.after( `<span class="a-input-clear is-empty js-clearInput" tabindex="-1"><span class="a-Icon icon-multi-remove"></span></span>` )
            .on( "input", function() {
                checkFilter();
            } ).on( "keydown", function( event ) {
                let kc = event.which;

                if ( kc === keys.ENTER ) {
                    event.preventDefault();
                } else if ( kc === keys.ESCAPE ) {
                    clearObjectsFilter();
                    checkFilter();
                }
            } );
        filterInput$.next().on( "click", () => {
            clearObjectsFilter();
            checkFilter();
        } );
        // set remembered initial filter
        filterInput$.val( sessionStorage.getItem( SKEY_FILTER ) || "" ); // can't trust sessionStorage but val escapes
        // because tree is lazy loaded checkFilter call needs to wait until after tree loads see apexafterrefresh above

        // define tree related actions Labels are picked up from menu markup
        apexActions.add( [
            {
                name: "objects-expand-all",
                label: null,
                action: function() {
                    tree$.treeView( "expandAll" );
                }
            },
            {
                name: "objects-collapse-all",
                label: null,
                action: function() {
                    tree$.treeView( "collapseAll" );
                }
            },
            {
                name: "objects-refresh",
                label: null,
                action: function() {
                    treeAdapter.clearData();
                }
            },
            {
                name: "objects-open",
                label: null,
                action: function() {
                    // todo maybe someday treeView context menu provides context args. Until then get the selection
                    const nodes = tree$.treeView( "getSelectedNodes" );

                    if ( nodes.length ) {
                        openNode( nodes[0] );
                    }
                }
            }
        ] );

        $( () => {
            $( "#objectsTreeMenu_menu" ).menu( OPTION, "beforeOpen", function () {
                const sel = tree$.treeView( "getSelectedNodes" ),
                    showHide = (!sel[0] || sel[0].type.endsWith( DIR_NODE_SUFFIX ) ) ? HIDE : SHOW;

                apexActions[showHide]( "objects-open" );
            } );
        } );

        return tree$;
    }

    function initObjectsToolbar( toolbar$ ) {
        let actionMenuItems = [],
            actionsGroup = [],
            // This group will contain only one button at the moment, if more added, please rename it.
            uiDefaultsGroup = [];

        objectTypeActions.forEach( a => {
            let actions = a.actions;

            for ( let i = 0; i < actions.length; i++ ) {
                let action = actions[i];

                if ( action.name ) {
                    if ( action.preferButton !== false ) { // true is now the default
                        if ( action.uiDefaultsGroup ) {
                            uiDefaultsGroup.push( {
                                type: TB_BUTTON,
                                action: action.name,
                                icon: action.icon || null,
                                iconBeforeLabel: true,
                                hot: action.hot || false
                            } );
                        } else if ( !actionsGroup.find( x => x.action === action.name ) ) {
                            // add a toolbar button if not already present (a few actions are on multiple views)
                            actionsGroup.push( {
                                type: TB_BUTTON,
                                action: action.name,
                                icon: action.icon || null,
                                iconBeforeLabel: true,
                                hot: action.hot || false
                            } );
                        }
                    } else {
                        // note: this will not work in general because the menu is shared with all object type views,
                        // but it works presently because only one view uses the menu
                        if ( action.separatorBefore ) {
                            actionMenuItems.push( SEPARATOR_MI );
                        }
                        actionMenuItems.push( {
                            type: ACTION,
                            action: action.name
                        } );
                    }
                } else if ( typeof action === "string" ) {
                    // it might be the name of a common action add if not already present
                    let a = apexActions.lookup( action );

                    // xxxx download is a problem because it generally goes last except for code where it is before edit, save
                    if ( a && !actionsGroup.find( x => x.action === action ) ) {
                        actionsGroup.push( {
                            type: TB_BUTTON,
                            action: action,
                            icon: a.icon || null,
                            iconBeforeLabel: true,
                        } );
                    }
                }
            }
        } );

        toolbar$.toolbar( {
            // label: the toolbar accessible label is updated later. See objectDocDescriptor activate.
            // toolbarFor: null, xxx acc?
            idPrefix: "obtb", // todo add index if more than one tab area currently have duplicate ids with multi tab groups
            small: true,
            simple: true,
            cursorKeyNavigation: false, // todo there are bugs in the toolbar widget, change to true once fixed
            data: [
                {
                    id: "actionsGroup",
                    controls: actionsGroup
                },
                {
                    id: "uiDefaultsGroup",
                    controls: uiDefaultsGroup
                },
                {
                    id: "refreshGroup",
                    controls: [
                        {
                            type: TB_BUTTON,
                            icon: "icon-ob-refresh",
                            iconBeforeLabel: true,
                            action: "refresh-view"
                        }
                    ]
                },
                {
                    id: "overflowGroup",
                    controls: [
                        {
                            type: TB_MENU,
                            id: "actions_button", // was a common actions menu, now functioning like an overflow menu but static
                            labelKey: "OB.TB_MORE",
                            menu: {
                                items: actionMenuItems
                            }
                        }
                    ]
                }
            ]
        } );
    }

    function restoreState( cachedIds ) {
        let prevOpenTabs = sessionStorage.getItem( SKEY_OPEN_TABS );

        if ( prevOpenTabs ) {
            try {
                prevOpenTabs = JSON.parse( prevOpenTabs );
                if ( !isArray( prevOpenTabs ) ) {
                    throw new Error( "Invalid open tabs" );
                }
            } catch ( e ) {
                // local throw and catch to cover parse errors and our own validation (isArray)
                debug.warn( "Failed to restore previous open tabs", e );
                return;
            }

            for ( let i = 0; i < prevOpenTabs.length; i++ ) {
                let ok = false,
                    tabState = prevOpenTabs[i];

                // validate
                if ( tabState !== null && typeof tabState === "object" &&
                    Object.keys( tabState ).length === 4 ) {

                    let schema, name,
                        { type, id, schemaId, view } = tabState,
                        typeDef = objectTypeDefMap.get( type );

                    if ( [type, id, schemaId, view].filter( x => typeof x !== "string" ).length === 0 && typeDef ) {
                        // validate schema id can be looked up to get a schema name
                        // validate that name can be looked up from id
                        // validate that type has view
                        schema = gSchemaItem.displayValueFor( schemaId );
                        /*
                         * Note it is expected that after log out without closing the browser tab and log in again
                         * some session state like tree selection and expansion state is restored but open tabs are not.
                         * The tab information is still in session storage, but it won't be used because the object
                         * ids are not in cacheIds; the cacheIds were in server session state which is now gone.
                         */
                        name = cachedIds[id];

                        if ( schema !== schemaId && name && typeDef.getViewDef( view ) ) {
                            // Error indication is not persisted and tree not yet loaded
                            // so state will be updated after tree is refreshed. Won't work if this object tab is
                            // for a schema that is different from the current tree. But will get updated once
                            // schema is change to the matching one.
                            // todo think any case where the tab to restore has different owner and schema?
                            let desc = makeObjectDocDescriptor( type, schema, name, id, schema, schemaId );

                            lastViewByType.set( desc.type, view );
                            doc.openDocument( desc );
                            ok = true;
                        }
                    }
                }
                if ( !ok ) {
                    debug.warn( "Invalid previous tab data ignored" );
                }
            }
        }

        let prevViewState = sessionStorage.getItem( SKEY_VIEW_STATE );

        if ( prevViewState ) {
            try {
                prevViewState = JSON.parse( prevViewState );
                if ( !isArray( prevViewState ) ) {
                    throw new Error( "Invalid view state" );
                }
            } catch ( e ) {
                // local throw and catch to cover parse errors and our own validation (isArray)
                debug.warn( "Failed to restore previous view state", e );
                return;
            }

            for ( let i = 0; i < prevViewState.length; i++ ) {
                let viewState = prevViewState[i],
                    key = viewState.k,
                    state = viewState.v;

                if ( typeof key === "string" && typeof state === "object" ) {
                    let id = key.split( "_" )[0];

                    if ( cachedIds[id] ) {
                        viewStateMap.set( key, state );
                    }
                }
            }
        }
    }

    /**
     * This is the main point of initialization for page 2000. Code on page 2000 calls objectBrowser.initialize
     * after the document is ready so that actions can be created. Other than a few page items, text messages,
     * and other page content, everything the client side needs is passed in as options.
     * This page isn't made from normal APEX region components, but it still has a need to communicate with the
     * server via ajax and uses the same communication mechanisms using *AjaxIdentifier and *RegionId options.
     * @param {object} options
     * @param {object} options.preferences editor settings maybe more in the future
     * @param {string} options.codeAjaxIdentifier used to communicate with the server for code editor related ajax calls
     * @param {string} options.codeRegionId used to communicate with the server for code editor related ajax calls
     * @param {string} options.gridAjaxIdentifier used to communicate with the server for model related ajax calls
     * @param {string} options.gridRegionId used to communicate with the server for model related ajax calls
     * @param {string} options.treeAjaxIdentifier used to communicate with the server for tree model related ajax calls
     * @param {string} options.treeRegionId used to communicate with the server for tree model related ajax calls
     * @param {object} options.links hash of parameterized links to other pages see doLinkAction
     * @param {} options.cachedIds hash of object ids to object names used to restore tabs.
     */
    function initialize( options ) {
        const preferences = options.preferences || {};

        gCodeAjaxIdentifier = options.codeAjaxIdentifier;
        gCodeRegionId = options.codeRegionId;
        gGridAjaxIdentifier = options.gridAjaxIdentifier;
        gGridRegionId = options.gridRegionId;
        gLinks = options.links || {};
        gEditorSettings = preferences[CODE_EDITOR_PREF_NAME] || "";

        defineActions();

        // todo allow for possibility of a link to be empty/null in case a link is not possible in a particular case.

        // Fix up the links to normal/dialog pages. Want the URL and the options. APEX_PAGE.GET_URL has p_plain_url
        // arg but that gets rid of the options also which we want. So need to strip out what we need from full url
        // The following is fragile code. It is sensitive to the exact format returned by GET_URL.
        // Examples: It relies on the url being in single quotes, special chars escaped in the url, no extra
        //   white space, No , or : in object values ...
        for ( const [k, v] of objectEntries( gLinks ) ) {
            // eslint-disable-next-line no-script-url
            if ( v.startsWith( "javascript:apex" ) ) {
                let m = /\('([^']+)',\{([^}]+)}/.exec( v );

                if ( m ) {
                    let json = "{" + m[2].replaceAll( "'", '"' ).replace( /(\w+):/g, (m, n) => {
                        return '"' + n + '":';
                    } ) + "}";

                    try {
                        gLinks[k] = {
                            // replace unicode escapes
                            url: m[1].replace( /\\u([0-9A-F]{4})/gi, (m,d) => {
                                return String.fromCharCode( parseInt( d, 16 ) );
                            } ),
                            options: JSON.parse( json )
                        };
                    } catch ( e ) {
                        debug.error( "Invalid url", v );
                    }
                }
            }
        }
        // Tree menu links that open create object wizard dialog pages also need to have item values substituted
        // on the client side. Here we take a different approach so we can leverage the menu list behavior and
        // use the actions that it creates. Simply replace the link.
        // All the actions have not been added yet so wait just a moment
        setTimeout( () => {
            apexActions.list().forEach( a => {
                if ( a.name.startsWith( "create-" ) ) {
                    const action = apexActions.lookup( a.name );

                    if ( action?.actionBinding?.actionName === "a-dialog-open" ) {
                        let dialogAction = apexActions.lookup( action.actionBinding.actionName );
                        const originalAction = dialogAction.action;

                        dialogAction.action = function ( event, focusElement, args ) {
                            args.url = args.url.replaceAll( "~PARSING_SCHEMA~", getSchema() );
                            originalAction( event, focusElement, args );
                        };

                    }
                }
            } );
        }, 0 );

        const tree$ = initObjectsTree( options.treeRegionId, options.treeAjaxIdentifier );

        doc.init( "obObjectDoc", {
            initToolbar: initObjectsToolbar,
        } );

        gSchemaItem.element.on( "change", function() {
            doc.checkAndCloseDoc().then( ( closed ) => {
                if ( closed ) {
                    let treeAdapter = getNodeAdapter( tree$ ),
                        regionData = treeAdapter.getOption( "regionData" ),
                        schema = getSchema();

                    regionData.parsingSchema = schema;
                    // clear filter because although it may be desired to stay in some cases it is more likely that it
                    // could result in nothing found which leaves an empty tree
                    clearObjectsFilter();
                    treeAdapter.clearData();
                } else {
                    // document not closed so put the old schema back
                    gSchemaItem.setValue( doc.getDocDescriptor().schemaId, null, true ); // suppress change
                }
            } );
        } );

        // todo would like to get splitters initialized sooner until then wait to restore tab state
        apex.gPageContext$.on( "apexreadyend", function() {
            restoreState( options.cachedIds );
        } );

        $( window ).on( "unload", () => {
            let ids = tree$.treeView( "getExpandedNodeIds" ).join( ":" ),
                selectedNode = tree$.treeView( "getSelectedNodes")[0],
                openTabs = []; // not really tabs any more; just one

            sessionStorage.setItem( SKEY_TREE_EXPANSION_STATE, ids );
            sessionStorage.setItem( SKEY_TREE_SELECTION, selectedNode ? selectedNode.id : "" );
            sessionStorage.setItem( SKEY_FILTER, getObjectsFilterValue() );

            let desc = doc.getDocDescriptor();
            let typeDef = getTypeDef( desc.type );
            typeDef.saveState( desc, desc.tabPanel$ ); // updates viewStateMap

            openTabs.push( {
                schemaId: desc.schemaId,
                // todo think is ownerId needed also?
                type: desc.type,
                id: desc.id,
                view: desc.currentViewId
                // don't store the name because it is sensitive information on restore will derive it from the
                // servers cachedIds.
            } );

            let state = [];

            for ( const [k, v] of viewStateMap.entries() ) {
                state.push( {
                    k: k,
                    v: v
                } );
            }

            sessionStorage.setItem( SKEY_OPEN_TABS, JSON.stringify( openTabs ) );
            sessionStorage.setItem( SKEY_VIEW_STATE, JSON.stringify( state ) );
            sessionStorage.setItem( SKEY_LAST_SCHEMA, getSchemaId() ); // don't store the schema, its sensitive information
        } ).on( "beforeunload", () => {
            const desc = doc.getDocDescriptor();

            if ( desc ) {
                const message = desc.checkRemove();

                if ( message ) {
                    return message;
                }
            }
        } );

        $( document ).on( "apexafterclosedialog", function( event, data ) {
            const treeAdapter = getNodeAdapter( tree$ );
            let prefix = "P" + data.dialogPageId + "_",
                type = data[prefix + "OBJECT_TYPE"],
                label = data[prefix + "NAME"],
                id = data[prefix + "OBJECT_ID"],
                invalidate = data[prefix + "INVALIDATE"],
                invalid = data[prefix + "OBJECT_STATUS"] === INVALID,
                schema = data[prefix + "PARSING_SCHEMA"] || getSchema();

            /*
             * This is what is expected to be returned when any create dialog is closed
             *   dialogPageId: 2010
             *   P2010_NAME: "TEST2"
             *   P2010_OBJECT_ID: "79229"
             *   P2010_OBJECT_TYPE: "SYNONYM"
             *   P2010_OBJECT_STATUS: "INVALID" -- optional
             *   P2010_PARSING_SCHEMA: "USER" -- optional
             *   P2010_INVALIDATE: stringified JSON -- optional
             *    Example for INVALIDATE. If a new trigger is created for a table with object id 100123 the
             *    table DEPS and TRIGGER views need to be refreshed and no other types are affected
             *    so the value would be:
             *   {
             *     affectedObjects: [ {
             *       schema: "user",
             *       objId: "100123",
             *       views: ["DEPS", "TRIGGER"]
             *     } ]
             *   }
             */
            if ( type && label && id ) {
                if ( schema === getSchema() ) {
                    // Add to tree
                    const parent = treeAdapter.root().children.find( x => x.id === type );

                    if ( parent ) {
                        let index = -1,
                            node = {
                                type: type,
                                id: id
                            };

                        // todo think if model did sorting of children then wouldn't need to calculate index
                        if ( parent.children.length > 0 ) {
                            index = parent.children.findIndex( x => x.label > label );
                            if ( index < 0 ) {
                                index = parent.children.length;
                            }
                            index -= 1;
                        }
                        if ( invalid ) {
                            node.classes = "is-error";
                            node.status = INVALID;
                        }
                        treeAdapter.addNode( parent, index, label, node, () => {
                        } ); // a callback is required but is a noop
                    } else {
                        debug.error( "Node type not found in tree", type );
                    }
                }
                openAndSelectInTree( type, label, schema, id, schema, invalid ); // owner and schema should be the same in this case
            }
            if ( invalidate ) {
                let data, affectedObjects;

                try {
                    data = JSON.parse( invalidate );
                    affectedObjects = data.affectedObjects;
                } catch ( e ) {
                    debug.error( "Invalid data to invalidate" );
                    affectedObjects = null;
                }

                if ( data ) {
                    if ( data.refreshTree ) {
                        treeAdapter.clearData();
                    }
                    if ( data.refreshView ) {
                        currentObjectTypeDef.refreshData( currentTabState );
                    }
                }
                if ( affectedObjects ) {
                    for ( const ao of affectedObjects ) {
                        if ( ao.objId && isArray( ao.views ) ) {
                            // not currently using schema; todo should we be?
                            invalidateViews( ao.objId, ao.views, [] );
                        } else {
                            debug.error( "Invalid object to invalidate" );
                        }
                    }
                }
            }
        } );

        // We want responsive behavior for the inline dialogs (this is done by UT but not generally in builder so
        // make the call here) todo remove if this is ever done for all of builder.
        theme.initResponsiveDialogs();

        // Removing .no-js class after page rendering allows some components to be displayed smoothly
        $( "html" ).removeClass( "no-js" );
    }

    function removeFromTree( objId ) {
        const tree$ = getObjectsTree(),
            treeAdapter = getNodeAdapter( tree$ ),
            node = treeAdapter.getRecord( objId );

        if ( node ) {
            treeAdapter.deleteNode( node, () => {
            } ); // a callback is required but is a noop
        }
        doc.closeDocument( objId );
    }

    function doLinkAction( el, name, args ) {
        let options,
            link = gLinks[name];

        if ( !link ) {
            debug.error( "No such link with name ", name );
            return;
        }

        if ( typeof link === "object" ) {
            options = link.options;
            link = link.url;
        }
        for ( const [n, v] of objectEntries( args ) ) {
            link = link.replaceAll( "~" + n + "~", v );
        }
        if ( options ) {
            // must be a dialog to open
            navigation.dialog( link, options, "a-Dialog--wizard", $( el ) );
            return true;
        } else {
            navigation.redirect( link );
        }
    }

    function downloadReport( objectInstance, viewId, subViewId, downloadOptions ) {
        const text = downloadOptions.format === "TEXT",
            regionId = text ? gCodeRegionId : gGridRegionId;

        server.plugin( {
            regions: [
                {
                    dataShape: text ? "text" : "table",
                    parsingSchema: objectInstance.schema,
                    owner: objectInstance.owner,
                    objectType: objectInstance.type,
                    objectId: objectInstance.id,
                    objectName: objectInstance.name,
                    view: viewId,
                    subView: subViewId,
                    id: regionId,
                    ajaxIdentifier: text ? gCodeAjaxIdentifier : gGridAjaxIdentifier,
                    download: downloadOptions
                }
            ]
        }, {
            loadingIndicator: objectInstance.tabPanel$,
            loadingIndicatorPosition: "centered",
        } ).done( ( data ) => {
            const region = data.regions && data.regions[0];

            if ( region && region.download && region.download.id ) {
                // borrow this message from IG
                apexMessage.showPageSuccess( lang.getMessage( "APEX.IG.FILE_PREPARED" ) );

                let url = server.ajaxUrl( {
                    regions: [
                        {
                            id: regionId,
                            ajaxIdentifier: gGridAjaxIdentifier,
                            downloadFileId: region.download.id
                        }
                    ],
                    salt: $v( "pSalt" )
                } );

                navigation.download( url );
            }
        } );
        // server.plugin displays any failure message for us
    }

    /*
     * ================================
     * View types
     * ================================
     */
    // view types
    const VT_GRID = "grid",
        VT_GRIDS = "grids",
        VT_NVP = "nvp", // (name value pair)
        VT_EDITOR = "editor",
        VT_NVP_GRID = "nvp_grid",
        VT_NVP_EDITOR = "nvp_editor";

    /**
     * The document tabs are made up of views and each view is of a particular type.
     *
     * @param {string} name
     * @param {object} impl
     * The implementation object has these methods
     *         render: function( out, objectInstance, viewDef )
     *         initializeView: function( view$, objectInstance, viewDef )
     *         destroyView: function( view$ )
     *         focus: function( view$ )
     *         resize: function( view$ )
     *         getState: function( view$ )
     *         refresh: function( view$ ) // optional
     *         save: function( view$, objectInstance ) // optional
     *         checkDepends: function( objectInstance, viewDef ) // optional
     *         refreshData: function( objectInstance, viewDef ) // optional
     */
    function defineViewType( name, impl ) {
        viewTypesMap.set( name, impl );
    }

    function renderTooltipLine( name, value, escape = true ) {
        if ( escape ) {
            value = util.escapeHTML( value );
        }
        return `<li><span class="tt-label">${name}: </span><span class='tt-value'>${value}</span></li>`;
    }

    function renderSection( out, heading, id, typeClass, labeledById = null ) {
        out.markup( '<div role="region"' )
            .attr( ARIA_LABELED_BY, labeledById )
            .markup( '><span class="b-OB-Section-label"' )
            .optionalAttr( "id", labeledById )
            .markup( ">" )
            .content( heading )
            .markup( `</span><div id="${id}" class="${typeClass}"` )
            .optionalAttr( ARIA_LABELED_BY, labeledById )
            .markup( "></div></div>" );
    }

    function makeGridOptions( grid$, modelId, viewDef, columns ) {
        const editable = viewDef.editable || false, // todo may be dead code if no views are grid editable
            dataView = viewDef.Id === ID_DATA && editable;
        const options = {
            modelName: modelId,
            applyTemplateOptions: {
                extraSubstitutions: { baseId: grid$[0].id },
                iterationCallback: function( loopArg, model, record, index, placeholders, extraSubstitutions ) {
                    extraSubstitutions.rowIndex = "" + index;
                }
            },
            columns: [columns],
            editable: editable,
            spreadsheetMode: false, // todo true, if such an option existed and in place editing is desired
            fixedRowHeight: viewDef.fixedRowHeight !== undefined ? viewDef.fixedRowHeight : true,
            hasSize: viewDef.hasSize !== undefined ? viewDef.hasSize : true,
            multiple: true,
            multipleCells: true,
            selectCells: !editable, // want select cells unless editable todo at least for now because of issue with editing in cell selection mode
            resizeColumns: true,
            reorderColumns: false,
            noDataMessage: viewDef.noDataMessage || getMessage( "NO_DATA" ),
            hideEmptyFooter: true,
            rowHeader: "none",
            showNullAs: "", // todo maybe it would be nice to do this? "<span class='null-value'>null</span>",
            skipReadonlyCells: true,
            pagination: {
                scroll: true,
                virtual: dataView
            },
            persistSelection: dataView,
            columnSort: false,
            pageChange: function( event, data ) {
                const grid$ = $( this ),
                    model = grid$.grid( "getModel" );

                if ( data.offset !== 0 ) {
                    return;
                }

                // page rendering may still be in progress during this event and can't set selection in that case
                // so delay setting the selection as needed
                setTimeout( () => {
                    if ( grid$.grid( OPTION, "selectCells" ) ) {
                        const range = grid$.grid( "getSelectedRange" ),
                            firstCell = grid$.find( "tbody td.a-GV-cell" ).first();

                        if ( !range.recordIds.length && firstCell.length ) {
                            grid$.grid( "setSelection", firstCell );
                        }
                    } else {
                        const sel = grid$.grid( "getSelectedRecords" ),
                            firstRec = model.recordAt( 0 );

                        if ( !sel.length && firstRec ) {
                            grid$.grid( "setSelectedRecords", [firstRec] );
                        }
                    }
                }, 0 );
            },
            // todo dead code due to columnSort: false
            sortChange: function ( event, data ) {
                let originalIndex = data.column.sortIndex,
                    columns = grid$.grid( "getColumns" ),
                    model = grid$.grid( "getModel" ),
                    sorts = [],
                    fetchData = model.getOption( "fetchData" ),
                    index = 1;

                for ( let i = 0; i < columns.length; i++ ) {
                    let col = columns[i];

                    if ( col.sortIndex ) {
                        if ( data.action === "change" ) {
                            if ( col === data.column ) {
                                index = col.sortIndex;
                            }
                        } else if ( data.action === "add" ) {
                            if ( col.sortIndex >= index ) {
                                index = col.sortIndex + 1;
                            }
                        } else if ( data.action === "remove" ) {
                            if ( col === data.column ) {
                                delete col.sortIndex;
                                delete col.sortDirection;
                            } else if ( col.sortIndex > originalIndex ) {
                                col.sortIndex -= 1;
                            }
                        } else if ( data.action === "clear" || data.action === "set" ) {
                            delete col.sortIndex;
                            delete col.sortDirection;
                        }
                    }
                }

                if ( data.action !== "clear" && data.action !== "remove" ) {
                    data.column.sortIndex = index;
                    data.column.sortDirection = data.direction;
                }
                grid$.grid( "refreshColumns" );

                fetchData.sorts = sorts;
                for ( let i = 0; i < columns.length; i++ ) {
                    let col = columns[i];

                    if ( col.sortDirection ) {
                        sorts.push( {
                            column: col.property,
                            direction: col.sortDirection.toUpperCase(),
                            index: col.sortIndex
                        } );
                    }
                }
                model.clearData();
            }
        };

        // if editable need to disable selection action menu when nothing selected
        if ( editable ) {
            options.selectionChange = function() {
                let selection = grid$.grid( "getSelection" );

                $( ".js-selectionMenu", grid$ ).prop( "disabled", selection.length === 0 );
            };
        }

        // todo dead code since no viewDef config has sorts now
        if ( viewDef.sorts ) {
            // set initial sorts in column config
            for ( let i = 0; i < viewDef.sorts.length; i++ ) {
                let sort = viewDef.sorts[i],
                    col = options.columns[0][sort.column];

                if ( col ) {
                    col.sortIndex = sort.index;
                    col.sortDirection = sort.direction.toLowerCase();
                }
            }
        }

        if ( viewDef.id === ID_DATA ) {
            options.tooltip = {
                content: function( callback, model, recordMeta, colMeta, columnDef ) {
                    let text = null;

                    // only if over a column heading
                    // use same tooltip markup as page designer
                    if ( !recordMeta && columnDef ) {
                        text = "";

                        if ( columnDef.serverDataType ) {
                            text += renderTooltipLine( getMessage( "COL_DATA_TYPE" ), columnDef.serverDataType, false );
                        }
                        if ( columnDef.nullable ) {
                            text += renderTooltipLine( getMessage( "COL_NULLABLE" ), columnDef.nullable );
                        }
                        if ( columnDef.defaultValue ) {
                            text += renderTooltipLine( getMessage( "COL_DEFAULT" ), columnDef.defaultValue );
                        }
                        if ( columnDef.comment ) {
                            text += renderTooltipLine( getMessage( "COL_COMMENT" ), columnDef.comment );
                        }
                        if ( text.length > 0 ) {
                            text = `<ul class="tt-list">${text}</ul>`;
                        } else {
                            text = null;
                        }
                    }
                    return text;
                }
            };
        }
        return options;
    }

    function makeRecordViewOptions( rv$, modelId, viewDef, columns, subst ) {
        const options = {
            modelName: modelId,
            fields: [columns],
            hasSize: false,
            labelAlignment: "start",
            noDataMessage: getMessage( "NO_DATA" ),
            showNullAs: "", // todo maybe it would be nice to do this? "<span class='null-value'>null</span>",
            toolbar: null // no toolbar desired not even the default one
        };

        if ( subst ) {
            options.applyTemplateOptions = {
                extraSubstitutions: subst
            };
        }
        return options;
    }

    defineViewType( VT_GRID, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`,
                labelId = idPrefix + "label";

            out.markup( `<div class="ob-vtype-grid-r" role="region"` )
                .attr( ARIA_LABELED_BY, labelId )
                .markup( `><span class="u-vh" id="${labelId}">` )
                .content( viewDef.label )
                .markup( `</span><div id="${idPrefix}grid" class="ob-vtype-grid" aria-labelledby="${labelId}"></div>` );
            if ( viewDef.modelEditable && viewDef.id === ID_DATA ) {
                out.markup( `<div class="a-GV-columnItemContainer u-vh" aria-hidden="true">` );
                // may not have columns yet
                if ( viewDef.columns ) {
                    this.renderColumnItems( out, viewDef.columns );
                }
                out.markup( "</div>" );
            }
            out.markup( "</div>" );
        },
        renderColumnItems: function( out, columns ) {
            for ( const [, def] of objectEntries( columns ) ) {
                if ( def.elementId ) {
                    out.markup( `<div class="a-GV-columnItem">` );
                    if ( [ "VARCHAR2", "NVARCHAR2", "CHAR" ].includes ( def.dataType ) && def.dataLength && def.dataLength >= 60 ) {
                        out.markup( `<textarea id="${def.elementId}" class="textarea apex-item-textarea" rows="3" cols="30" data-resizable="true" style="resize: both;" ${def.isRequired? " required" : ""}></textarea>` );
                    } else if ( def.dataType === "CLOB" ) {
                        out.markup( `<textarea id="${def.elementId}" class="textarea apex-item-textarea" readonly rows="3" cols="30" data-resizable="true" style="resize: both;"></textarea>` );
                    } else {
                        out.markup( `<input id="${def.elementId}" type="text" class="text_field apex-item-text" size="30" ${def.isRequired? " required" : ""}>` );
                    }

                    out.markup( "</div>" );
                }
            }
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const modelId = objectInstance.modelId,
                grid$ = view$.find( SEL_VT_GRID ),
                items$ = grid$.next( ".a-GV-columnItemContainer" ),
                columns = [ ID_DATA, ID_ENV_IMPORTS ].includes( viewDef.id ) ?
                    objectInstance.dataColumns : objectInstance.columns.get( viewDef.id ),
                options = makeGridOptions( grid$, modelId, viewDef, columns );

            if ( objectInstance.dataColumns && items$.children().length === 0 ) {
                const out = util.htmlBuilder();

                this.renderColumnItems( out, objectInstance.dataColumns );
                $.apex.tableModelViewBase.clearColumnItemCache( items$[0] );
                items$.html( out.toString() );
            }
            grid$.height( view$.height() ).width( view$.width() )
                .grid( options );
            // todo restore saved state
            if ( options.selectionChange ) {
                $( ".js-selectionMenu", grid$ ).prop( "disabled", grid$.grid( "getSelection" ).length === 0 );
            }
        },
        destroyView: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID ),
                items$ = grid$.next( ".a-GV-columnItemContainer" );

            grid$.grid( "destroy" );
            $.apex.tableModelViewBase.clearColumnItemCache( items$[0] );
            items$.empty();
        },
        focus: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID );

            grid$.grid( FOCUS );
        },
        resize: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID );

            grid$.height( view$.height() ).width( view$.width() )
                .grid( "resize" );
        },
        getState: function( view$ ) {
            let state = null,
                grid$ = view$.find( SEL_VT_GRID ),
                sel = grid$.grid( "getSelection" );

            // todo want grid to return row, col index information
            if ( sel ) {
                // todo waiting on grid widget changes
            }
            return state;
        },
        save: function( view$, objectInstance ) {
            const model = objectInstance.models.get( objectInstance.currentViewId ),
                grid$ = view$.find( SEL_VT_GRID );
            if ( !model.hasErrors() ) {
                grid$.grid( "finishEditing" ).then( () => {
                    let p = model.save();

                    if ( p ) {
                        p.done( function( error, responseData ) {
                            let region,
                                successMessage = "";

                            if ( responseData.errors ) {
                                apexMessage.clearErrors();
                                apexMessage.showErrors( responseData.errors );
                            } else if ( responseData.regions ) {

                                // gather any success message(s)
                                for ( let i = 0; i < responseData.regions.length; i++ ) {
                                    region = responseData.regions[i];
                                    if ( region.fetchedData && region.fetchedData.successMessage ) {

                                        // it's not likely that there are multiple success messages but just in case
                                        if ( successMessage ) {
                                            successMessage += "<br>";
                                        }
                                        successMessage += region.fetchedData.successMessage;
                                    }
                                }

                                if ( !successMessage ) {
                                    // borrow this IG message
                                    successMessage = lang.getMessage( "APEX.IG.CHANGES_SAVED" );
                                }
                                apexMessage.showPageSuccess( successMessage );
                            }
                            // no need for fail handling because the message has already been shown
                        } ).always( function() {
                            // enable save button
                            apexActions.enable( "save" );
                        } );

                        // disable save button temporarily
                        apexActions.disable( "save" );
                    }
                } );
            } else {
                // borrow this general message used from IG
                apexMessage.alert( lang.getMessage( "APEX.CORRECT_ERRORS" ), function () {
                    // focus first error but wait a moment so happens after alert returns focus
                    setTimeout( () => {
                        grid$.find( ".is-error" ).first().focus();
                    }, 0 );
                } );
                return true;
            }
        }
    } );

    defineViewType( VT_NVP, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`;

            out.markup( `<div class="ob-vtype-nvp-r" role="region"` )
                .attr( ARIA_LABEL, viewDef.label )
                .markup( `><div id="${idPrefix}nvp" class="ob-vtype-nvp"></div></div>` );
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const modelId = objectInstance.modelId,
                rv$ = view$.find( SEL_VT_NVP ),
                rvColumns = objectInstance.columns.get( viewDef.id ),
                rvOptions = makeRecordViewOptions( rv$, modelId, viewDef, rvColumns, {
                    owner: objectInstance.owner
                } );

            rv$.height( view$.height() )
                .width( view$.width() )
                .recordView( rvOptions );
        },
        focus: function( view$ ) {
            const rv$ = view$.find( SEL_VT_NVP );

            rv$.recordView( FOCUS );
        },
        resize: function( view$ ) {
            const rv$ = view$.find( SEL_VT_NVP );

            rv$.height( view$.height() ).width( view$.width() )
                .recordView( "resize" );
        },
        getState: function() {
            return null;
        },
        checkDepends: function( objectInstance, viewDef ) {
            let found = false,
                objIds = objectInstance.staleObjects;

            // No subviews, just the view, which is record view
            if ( viewDef.columns.OBJECT_ID ) {
                let model = objectInstance.models.get( viewDef.id );

                if ( model ) {
                    let objId = model.getValue( "OBJECT_ID" );

                    if ( objIds.has( objId ) ) {
                        objIds.delete( objId );
                        found = true;
                    }
                }
            }
            return found;
        }
    } );

    defineViewType( VT_NVP_GRID, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`,
                subViews = viewDef.subViews;

            out.markup( `<div class="ob-vtype-nvpgrid" role="region"` )
                .attr( ARIA_LABEL, viewDef.label ) // not so easy to use aria-labelledby here because only work for
                                                   // one of the branches
                .markup( ">" );
            // the NVP part of this view type is now optional
            if ( !subViews[0].hidden ) {
                renderSection( out, subViews[0].heading,
                    idPrefix + "nvp", "ob-vtype-nvp", idPrefix + "nvp_label" );
                renderSection( out, subViews[1].heading,
                    idPrefix + "grid", "ob-vtype-grid", idPrefix + "grid_label" );
            } else {
                out.markup( `<span class="u-vh" id="${idPrefix}label">` )
                    .content( viewDef.label )
                    .markup( `</span><div id="${idPrefix}grid" class="ob-vtype-grid" aria-labelledby="${idPrefix}label"></div>` );
            }
            out.markup( "</div>" );
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const modelIds = objectInstance.modelIds,
                nvpView = viewDef.subViews[0];

            function initViews() {
                const gridView = viewDef.subViews[1],
                    grid$ = view$.find( SEL_VT_GRID ),
                    gridColumns = objectInstance.columns.get( viewDef.id + "_" + gridView.subId ),
                    gridOptions = makeGridOptions( grid$, modelIds[1], gridView, gridColumns );

                if ( !nvpView.hidden ) {
                    const rv$ = view$.find( SEL_VT_NVP ),
                        rvColumns = objectInstance.columns.get( viewDef.id + "_" + nvpView.subId ),
                        rvOptions = makeRecordViewOptions( rv$, modelIds[0], nvpView, rvColumns, {
                            owner: objectInstance.owner
                        } );

                    rv$.recordView( rvOptions );
                }
                grid$.grid( gridOptions );
            }

            if ( nvpView.hidden ) {
                view$.find( ".ob-vtype-nvpgrid, .ob-vtype-grid" ).height( view$.height() ).width( view$.width() );
            } else {
                view$.css( "overflow", "auto" )
                    .find( ".ob-vtype-nvpgrid" ).height( view$.height() ).width( view$.width() );
            }
            // before initializing the views fetch all the models
            let p = apexModel.multipleFetch( null, {
                loadingIndicator: view$,
                loadingIndicatorPosition: "centered"
            }, modelIds );

            if ( p ) {
                p.done( () => {
                    initViews();
                } );
            } else {
                initViews();
            }
        },
        focus: function( view$ ) {
            const rv$ = view$.find( SEL_VT_NVP ),
                grid$ = view$.find( SEL_VT_GRID );

            if ( rv$[0] ) {
                rv$.recordView( FOCUS );
            } else {
                grid$.grid( FOCUS );
            }
        },
        resize: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID ),
                rv$ = view$.find( SEL_VT_NVP ),
                wrapper$ = view$.children().first();
            let w = view$.width(),
                h = view$.height();

            if ( wrapper$.height() > view$.height() ) {
                w -= util.getScrollbarSize().width;
            }
            wrapper$.width( w );
            rv$.width( w ).recordView( "resize" );
            if ( !rv$[0] ) {
                // if NVP record view is hidden also set the height of the grid
                wrapper$.add( grid$ ).height( h );
            }
            grid$.width( w ).grid( "resize" );
        },
        refresh: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID ),
                rv$ = view$.find( SEL_VT_NVP );

            grid$.grid( REFRESH );
            rv$.recordView( REFRESH );
        },
        getState: function() {
            return null;
        },
        checkDepends: function( objectInstance, viewDef ) {
            let sv,
                found = false,
                objIds = objectInstance.staleObjects;

            // 2 subViews first is record view, second is grid
            sv = viewDef.subViews[0];
            if ( sv.columns.OBJECT_ID ) {
                let model = objectInstance.models.get( viewDef.id + "_" + sv.subId );

                if ( model ) {
                    let objId = model.getValue( "OBJECT_ID" );

                    if ( objIds.has( objId ) ) {
                        objIds.delete( objId );
                        found = true;
                    }
                }
            }
            if ( found ) {
                return found;
            } // else

            sv = viewDef.subViews[1];
            if ( sv.columns.OBJECT_ID ) {
                let model = objectInstance.models.get( viewDef.id + "_" + sv.subId );

                if ( model ) {
                    let colKey = model.getFieldKey( "OBJECT_ID" );

                    model.forEach( ( rec ) => {
                        let objId = rec[colKey];

                        if ( objIds.has( objId ) ) {
                            objIds.delete( objId );
                            found = true;
                        }
                    } );
                }
            }
            return found;
        }
    } );

    defineViewType( VT_GRIDS, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`,
                subViews = viewDef.subViews;

            out.markup( `<div class="ob-vtype-grids" role="region"` )
                .attr( ARIA_LABEL, viewDef.label )
                .markup( ">" );
            for ( let i = 0; i < subViews.length; i++ ) {
                renderSection( out, subViews[i].heading,
                    idPrefix + "grid_" + i, "ob-vtype-grid", idPrefix + "grid_label_" + i );
            }
            out.markup( "</div>" );
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const modelIds = objectInstance.modelIds;

            view$.css( "overflow", "auto" )
                .find( ".ob-vt-nvpgrid" ).height( view$.height() ).width( view$.width() );
            // before initializing the views fetch all the models
            apexModel.multipleFetch( null, {
                loadingIndicator: view$,
                loadingIndicatorPosition: "centered"
            }, modelIds ).done( () => {
                const grids$ = view$.find( SEL_VT_GRID );

                for ( let i = 0; i < viewDef.subViews.length; i++ ) {
                    let sv = viewDef.subViews[i],
                        grid$ = grids$.eq( i ),
                        columns = objectInstance.columns.get( viewDef.id + "_" + sv.subId ),
                        gridOptions = makeGridOptions( grid$, modelIds[i], sv, columns );

                    grid$.grid( gridOptions );
                }
            } );
        },
        focus: function( view$ ) {
            const grid$ = view$.find( SEL_VT_GRID ).eq( 0 );

            grid$.grid( FOCUS );
        },
        resize: function( view$ ) {
            const grids$ = view$.find( SEL_VT_GRID ),
                wrapper$ = view$.children().first();
            let w = view$.width();

            if ( wrapper$.height() > view$.height() ) {
                w -= util.getScrollbarSize().width;
            }
            wrapper$.width( w );

            grids$.width( w )
                .grid( "resize" );
        },
        refresh: function( view$ ) {
            const grids$ = view$.find( SEL_VT_GRID );

            grids$.grid( REFRESH );
        },
        getState: function() {
            return null;
        },
        checkDepends: function( objectInstance, viewDef ) {
            let found = false,
                objIds = objectInstance.staleObjects;

            viewDef.subViews.forEach( ( sv ) => {
                if ( sv.columns.OBJECT_ID ) {
                    let model = objectInstance.models.get( viewDef.id + "_" + sv.subId );

                    if ( model ) {
                        let colKey = model.getFieldKey( "OBJECT_ID" );

                        model.forEach( ( rec ) => {
                            let objId = rec[colKey];
                            if ( objIds.has( objId ) ) {
                                objIds.delete( objId );
                                found = true;
                            }
                        } );
                    }
                }
            } );
            return found;
        }
    } );

    function updateEditorText( editor$, text, stateKey ) {
        editor$
            .codeEditor( "setValue", text )
            .codeEditor( "resetUndoRedoStack" );

        // restore editing cursor position from saved view state
        let state = viewStateMap.get( stateKey );

        if ( state && !isNaN( state.l ) && !isNaN( state.c ) ) {
            editor$.codeEditor( "gotoPosition", state.l, state.c );
        }
    }

    defineViewType( VT_EDITOR, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`;

            out.markup( `<div class="ob-vtype-editor-r" role="region"` )
                .attr( "aria-label", viewDef.label )
                .markup( `><div id="${idPrefix}editor" class="ob-vtype-editor"></div></div>` );
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const self = this,
                editor$ = view$.find( SEL_VT_EDITOR ),
                docDesc = doc.getDocDescriptor(),
                readOnly = viewDef.readOnly,
                viewData = self.getViewData( objectInstance, viewDef.id ),
                ai = apex.aiHook?.aiEnabled ? {
                    ajax: {
                        // eslint-disable-next-line dot-notation
                        ajaxId: apex.aiHook.ajaxId[ "codeEditor" ]
                    }
                } : null;

            let codeCompleteFunction;

            viewData.readOnly = readOnly;
            viewData.initialValue = "";
            viewData.isChanged = false;

            if( [ "sql", "plsql" ].includes( viewDef.language ) ){
                codeCompleteFunction = function ( pSearchOptions, pCallback ) {
                    server.process( "getHints", {
                        x01: objectInstance.schema,
                        x02: pSearchOptions.search,
                        x03: pSearchOptions.parent,
                        x04: pSearchOptions.grantParent
                    }, {
                        success: pCallback
                    } );
                };
            }

            self.editorReady = new Promise( resolve => {
                editor$.codeEditor( $.extend( {
                    language: viewDef.language,
                    autofocus: false,
                    readOnly: readOnly,
                    codeComplete: codeCompleteFunction,
                    // Initially no errors or warnings are given as part of the editor view
                    // although there may be some on a separate errors tab.
                    value: "",
                    ai,
                    // callbacks
                    onInitialized: editor => {
                        resolve( editor );
                    },
                    heightFn: function() {
                        return view$.height();
                    }
                }, $.apex.codeEditor.preferencesObjectFromString( gEditorSettings ) ) );
            } );

            self.refreshData( objectInstance, viewDef );

            self.editorReady.then( editor => {

                const model = editor.getModel();

                model.onDidChangeContent( util.debounce( () => {
                    const newValue = model.getValue(),
                        isChanged = viewData.initialValue !== newValue;

                    viewData.isChanged = isChanged;

                    if ( docDesc.getIsChanged() !== isChanged ) {
                        doc.updateDocState();
                    }
                }, 200, true ) );
            } );

        },
        // optional method
        refreshData: function( objectInstance, viewDef ) {
            const viewId = viewDef.id,
                editor$ = objectInstance.tabPanel$.find( `${SEL_VIEW_PREFIX}${viewId} .ob-vtype-editor` ),
                self = this,
                viewData = self.getViewData( objectInstance, viewDef.id ),
                docDesc = doc.getDocDescriptor();

            let p = server.plugin( {
                "regions": [ {
                    id: gCodeRegionId,
                    ajaxIdentifier: gCodeAjaxIdentifier,
                    op: "fetch",
                    dataShape: "text",
                    objectType: objectInstance.type,
                    objectId: objectInstance.id,
                    objectName: objectInstance.name,
                    view: viewId,
                    owner: objectInstance.owner,
                    parsingSchema: objectInstance.schema
                } ]
            }, {
                loadingIndicator: editor$,
                loadingIndicatorPosition: "centered"
            } );
            p.then( data => {
                // - expect just one region
                // - (it is possible for text to be missing in the case of package with no body)
                // - todo if there is no body then drop action should be disabled
                // - normalize new line feeds
                let text = ( data.regions[0].text || "" ).replace( /\r?\n/g, "\n" );

                // Need to wait for editor initialized
                self.editorReady.then( () => {
                    viewData.initialValue = text;
                    viewData.isChanged = false;
                    if ( docDesc.getIsChanged() !== false ) {
                        doc.updateDocState();
                    }
                    updateEditorText( editor$, text, objectInstance.id + "_" + viewDef.id );
                } );
            } );
        },
        focus: function( view$ ) {
            const editor$ = view$.find( SEL_VT_EDITOR );

            editor$.codeEditor( FOCUS );
        },
        resize: function( view$ ) {
            const editor$ = view$.find( SEL_VT_EDITOR );

            editor$.codeEditor( "resize" );
        },
        getState: function( view$ ) {
            const editor$ = view$.find( SEL_VT_EDITOR );
            let state = null,
                pos = editor$.codeEditor( "getEditor" ).getPosition(); // todo change to codeEditor method when available
                    // todo consider editor restoreViewState and saveViewState

            if ( pos ) {
                state = { l: pos.lineNumber, c: pos.column };
            }
            return state;
        },
        save: function( view$, objectInstance ) {
            const self = this,
                editor$ = view$.find( SEL_VT_EDITOR ),
                objSchema = objectInstance.schema,
                objId = objectInstance.id,
                value = editor$.codeEditor( "getValue" ),
                docDesc = doc.getDocDescriptor(),
                viewData = self.getViewData( objectInstance, objectInstance.currentViewId );

            // todo maybe check if changed? better to disable save action when no changes?
            let p = server.plugin( {
                "regions": [ {
                    id: gCodeRegionId,
                    ajaxIdentifier: gCodeAjaxIdentifier,
                    op: "save",
                    dataShape: "text",
                    objectType: objectInstance.type,
                    objectId: objId,
                    objectName: objectInstance.name,
                    view: objectInstance.currentViewId,
                    owner: objectInstance.owner,
                    parsingSchema: objSchema,
                    text: value
                } ]
            }, {
                loadingIndicator: editor$,
                loadingIndicatorPosition: "centered"
            } );
            p.then( data => {
                // Don't expect text back but do expect success or errors.
                let region = data.regions[0], // expect just one region in response
                    errors = region.errors || [],
                    success = false;

                /*
                 * errors is an array of objects in the form of:
                 * [ {
                 *  message: "my error",
                 *  lineNumber: 1,
                 *  columnNumber: 5
                 * } ]
                 */
                editor$.codeEditor( OPTION, "errors", errors );

                if( errors.length === 0 ) {
                    success = true;
                    viewData.initialValue = value;
                    viewData.isChanged = false;
                    if ( docDesc.getIsChanged() !== false ) {
                        doc.updateDocState();
                    }
                    editor$.codeEditor( "resetUndoRedoStack" );
                    if ( region.success ) {
                        // indicate that all is well
                        apexMessage.showPageSuccess( region.success );
                    }
                } else {
                    apexMessage.hidePageSuccess();
                }
                // xxx after save editor is no longer changed?

                // invalidate the errors model xxx could this use invalidate?
                if ( objectInstance.models ) {
                    const model = objectInstance.models.get( "ERRORS" );
                    if ( model ) {
                        model.clearData();
                    }
                }
                // update tab state
                updateInvalidState( success, objectInstance, objId, objSchema );
            } );
        },
        getViewReadOnly: function( objectInstance, viewId ) {
            return this.getViewData( objectInstance, viewId ).readOnly;
        },
        setViewReadOnly: function( view$, objectInstance, viewId, readOnly ) {
            this.getViewData( objectInstance, viewId ).readOnly = readOnly;
            if( view$ ) {
                view$
                    .find( SEL_VT_EDITOR )
                    .codeEditor( "option", "readOnly", readOnly );
            }
        },
        getViewIsChanged: function( objectInstance, viewId ){
            return this.getViewData( objectInstance, viewId ).isChanged;
        },
        clearViewChanges: function( view$, objectInstance, viewId ) {
            const viewData = this.getViewData( objectInstance, viewId );
            if( view$ ) {
                view$
                    .find( SEL_VT_EDITOR )
                    .codeEditor( "setValue", viewData.initialValue );
            }
            viewData.isChanged = false;
        },
        getViewData: function( objectInstance, viewId ) {
            const data = objectInstance.data;
            if( !data.has( viewId ) ) {
                data.set( viewId, {
                    initialValue: "",
                    isChanged: false,
                    readOnly: true
                } );
            }
            return data.get( viewId );
        }
    } );

    defineViewType( VT_NVP_EDITOR, {
        render: function( out, objectInstance, viewDef ) {
            const idPrefix = `ob_${objectInstance.type}_${viewDef.id}_${objectInstance.id}_`,
                subViews = viewDef.subViews;

            out.markup( '<div class="ob-vtype-nvpeditor" role="region"' )
                .attr( ARIA_LABEL, viewDef.label )
                .markup( ">" );
            renderSection( out, subViews[0].heading,
                idPrefix + "nvp", "ob-vtype-nvp", idPrefix + "nvp_label" );
            renderSection( out, subViews[1].heading,
                idPrefix + "editor", "ob-vtype-editor", idPrefix + "editor_label" );
            out.markup( "</div>" );
        },
        initializeView: function( view$, objectInstance, viewDef ) {
            const modelId = objectInstance.modelIds[0],
                rv$ = view$.find( SEL_VT_NVP ),
                nvpView = viewDef.subViews[0],
                rvColumns = objectInstance.columns.get( viewDef.id + "_" + nvpView.subId ),
                rvOptions = makeRecordViewOptions( rv$, modelId, nvpView, rvColumns, {
                    owner: objectInstance.owner
                } ),
                editor$ = view$.find( SEL_VT_EDITOR ),
                editorViewDef = viewDef.subViews[1],
                ai = apex.aiHook?.aiEnabled ? {
                    ajax: {
                        // eslint-disable-next-line dot-notation
                        ajaxId: apex.aiHook.ajaxId[ "codeEditor" ]
                    }
                } : null;

            view$.find( ".ob-vtype-nvpgrid" ).height( view$.height() ).width( view$.width() );
            editor$.css( "height", "600px" ).codeEditor( $.extend( {
                language: editorViewDef.language,
                autofocus: false,
                readOnly: editorViewDef.readOnly,
                value: "",
                ai
            }, $.apex.codeEditor.preferencesObjectFromString( gEditorSettings ) ) );

            apexModel.multipleFetch( {
                regions: [{
                    id: gCodeRegionId,
                    ajaxIdentifier: gCodeAjaxIdentifier,
                    op: "fetch",
                    dataShape: "text",
                    objectType: objectInstance.type,
                    objectId: objectInstance.id,
                    objectName: objectInstance.name,
                    view: viewDef.id,
                    subView: editorViewDef.subId,
                    owner: objectInstance.owner,
                    parsingSchema: objectInstance.schema
                }]
            }, {
                loadingIndicator: view$,
                loadingIndicatorPosition: "centered"
            }, [modelId] ).done( ( data ) => {
                let text = data.regions[0].text;

                rv$.recordView( rvOptions );
                editor$.codeEditor( "setValue", text );
            } );
        },
        // optional method
        refreshData: function( objectInstance, viewDef ) {
            const viewId = viewDef.id,
                view$ = objectInstance.tabPanel$.find( SEL_VIEW_PREFIX + viewId ),
                rv$ = view$.find( SEL_VT_NVP ),
                editor$ = view$.find( SEL_VT_EDITOR ),
                nvpViewDef = viewDef.subViews[0],
                editorViewDef = viewDef.subViews[1],
                model = objectInstance.models.get( viewId + "_" + nvpViewDef.subId ),
                modelId = model.modelId();

            model.clearData( false ); // don't notify to keep the views from starting their own fetch

            apexModel.multipleFetch( {
                regions: [{
                    id: gCodeRegionId,
                    ajaxIdentifier: gCodeAjaxIdentifier,
                    op: "fetch",
                    dataShape: "text",
                    objectType: objectInstance.type,
                    objectId: objectInstance.id,
                    objectName: objectInstance.name,
                    view: viewDef.id,
                    subView: editorViewDef.subId,
                    owner: objectInstance.owner,
                    parsingSchema: objectInstance.schema
                }]
            }, {
                loadingIndicator: view$,
                loadingIndicatorPosition: "centered"
            }, [modelId] ).done( ( data ) => {
                let text = data.regions[0].text || "";

                rv$.recordView( REFRESH );
                updateEditorText( editor$, text, objectInstance.id + "_" + viewDef.id ); // todo save state and get correct stateKey
            } );
        },
        focus: function( view$ ) {
            const editor$ = view$.find( SEL_VT_EDITOR );

            editor$.codeEditor( FOCUS );
        },
        resize: function( /* view$ */ ) {
            // todo resize nvp_editor view
        },
        getState: function() {
            // todo implement this
            return null;
        }
    } );

    // keep editor preferences in sync and persist on server.
    $( document.body ).on( 'codeeditorpreferenceschanged', function ( event ) {
        const changed$ = $( event.target ),
            settingsString = changed$.codeEditor( 'getPreferencesString' ),
            settings = $.apex.codeEditor.preferencesObjectFromString( settingsString );

        // when one code editor changes its settings update all the others
        $( '.a-MonacoEditor' ).each( function () {
            if ( this !== event.target ) {
                $( this ).codeEditor( 'option', settings );
            }
        } );
        gEditorSettings = settingsString;
        // save preference settings to server
        server.process (
            "setPreference", {
                x01: CODE_EDITOR_PREF_NAME,
                x02: gEditorSettings
            }, {
                dataType: "" // don't expect any data back
            }
        );
    } );

    /*
     * Object types
     */
    function getView( type ) {
        return viewTypesMap.get( type );
    }

    function makeModelId( objectType, objectId, viewId ) {
        return `ob_${objectType}_${objectId}_${viewId}`;
    }

    function createModel( modelId, schema, owner, objectType, objectId, objectName, viewId, viewDef, columns, initialData ) {
        const shape = viewDef.shape || "table", // may be record but default is table
            options = {
                shape: shape,
                recordIsArray: true,
                fields: columns,
                regionData: {
                    // Note this dataShape is a secondary indicator of what kind of data is being requested.
                    // It was desired by the server it is not used by the model or anything else.
                    // It is not as robust as the intrinsic or primary indicators of the requested data.
                    dataShape: shape,
                    parsingSchema: schema,
                    owner: owner,
                    objectType: objectType,
                    objectId: objectId,
                    objectName: objectName,
                    view: viewId
                },
                regionId: gGridRegionId + ( viewDef.subId || "" ), // will this trick work?
                ajaxIdentifier: gGridAjaxIdentifier,
                hasTotalRecords: viewId !== ID_DATA, // want total records for all views except for data
                paginationType: viewId === ID_DATA ? "progressive" : "none"
            };
        let data = null,
            total = null,
            moreData = null;

        if ( viewDef.subId ) {
            options.regionData.subView = viewDef.subId;
        }

        if ( viewDef.editable || viewDef.modelEditable ) {
            options.editable = true;
            if ( !viewDef.editable ) {
                // optimistic updates only
                options.trackChanges = false;
            }
        }
        if ( viewDef.identityField ) {
            options.identityField =  viewDef.identityField;
        }
        if ( columns && columns._meta ) {
            options.metaField = "_meta";
        }
        if ( shape === "table" ) {
            options.fetchData = {
                filters: [], // there are never any initial filters set in the viewDef
                sorts: viewDef.sorts || []
            };
            // columns are only provided when then viewId is ID_DATA or ID_ENV_IMPORTS. This is targeting the Table object Data view
            if ( options.editable && columns ) {
                let saveColumns = [];

                // the server needs to know the column info to save
                for ( const [n, v] of objectEntries( columns ) ) {
                    if ( !v.virtual ) {
                        saveColumns.push( {
                            name: n,
                            index: v.index,
                            dataType: v.dataType,
                            isRequired: v.isRequired,
                            // readonly fields should not be saved in the DB
                            // clob is a special case because it is not readonly from the model perspective so that
                            // it can be shown in a readonly textarea in the row edit dialog
                            queryOnly: v.readonly || v.dataType === "CLOB"
                        } );
                    }
                }
                // columns must be in the same order as the data
                saveColumns.sort( ( a, b ) => a.index - b.index );
                saveColumns.forEach( c => { delete c.index; } ); // index was only needed for sorting
                options.saveData = {
                    columns: saveColumns
                };
            }
        }
        if ( initialData ) {
            data = initialData.values;
            total = initialData.totalRows;
            moreData = initialData.moreData;
        }

        let model = apexModel.create( modelId, options, data, total, moreData );

        return model;
    }

    // keep these in sync with columnsColumns in objectBrowserConfig module
    const COL_COLUMN_NAME_INDEX = 1,
        COL_DATA_TYPE_INDEX = 2,
        COL_LENGTH_INDEX = 3,
        COL_PRECISION_INDEX = 5,
        COL_SCALE_INDEX = 6,
        COL_NULLABLE_INDEX = 7,
        COL_PRIMARY_KEY_INDEX = 9,
        COL_COMMENT_INDEX = 10,
        COL_IDENTITY_INDEX = 11,
        COL_VIRTUAL_INDEX = 12,
        COL_INVISIBLE_INDEX = 13;

    function normalizeDataType( dataType ) {
        if ( dataType.match( /^(N?VARCHAR2?|N?CHAR|)$/ ) ) {
            return "VARCHAR2";
        } else if ( dataType.match( /^(NUMBER|FLOAT|BINARY_DOUBLE|BINARY_FLOAT)$/ ) ) {
            return "NUMBER";
        } else if ( dataType === "DATE" ) {
            return "DATE";
        } else if ( dataType.match( /^TIMESTAMP.*\)$/ ) ) {
            return "TIMESTAMP";
        } else if ( dataType.match( /^TIMESTAMP.*WITH TIME ZONE$/ ) ) {
            return "TIMESTAMP_TZ";
        } else if ( dataType.match( /^TIMESTAMP.*WITH LOCAL TIME ZONE$/ ) ) {
            return "TIMESTAMP_LTZ";
        }
        return dataType;
    }

    function renderEditIconButton( name, actionName ) {
        return `<button type='button' class='a-Button a-Button--noLabel a-Button--iconTextButton a-Button--edit' \
title='${name}' ${ARIA_LABEL}='${name}' data-action='${actionName}'>\
<span aria-hidden='true' class='a-Icon icon-ob-edit'></span></button>`;
    }

    function makeColumnsDef( objId, columns, editable, dataTypeTemplate ) {
        let destColIndex = 0,
            startIndex = 0,
            columnsDef = {};

        if ( editable ) {
            const editLabel = getMessage( "EDIT_DATA");

            columnsDef.ROWID = {
                index: 0,
                hidden: true,
                canHide: false
            };
            startIndex = 1;

            columnsDef.ROW_ACTIONS = {
                hidden: false,
                readonly: false,
                escape: true,
                label: editLabel,
                heading: `<span class='u-vh'>${editLabel}</span>`,
                headingAlignment: "center",
                alignment: "center",
                seq: 1,
                noStretch: true,
                canSort: false,
                isRequired: false,
                canHide: false,
                noCopy: false,
                defaultValue: "",
                cellTemplate: renderEditIconButton( editLabel, "row-edit" ),
                columnCssClasses: "has-button",
                virtual: true,
                noHeaderActivate: true,
                width: DEFAULT_ACTIONS_COL_WIDTH
            };
        }

        // todo future consider option to make use of UI Defaults
        destColIndex = startIndex;
        for ( let i = 0; i < columns.length; i++ ) {
            let col = columns[i];

            if ( col[COL_INVISIBLE_INDEX] === "Y" ) {
                // invisible columns are not included in the data
                continue;
            }

            let dataType = normalizeDataType( col[COL_DATA_TYPE_INDEX] ),
                subst = {
                    DATA_TYPE: col[COL_DATA_TYPE_INDEX],
                    LENGTH: col[COL_LENGTH_INDEX],
                    PRECISION: col[COL_PRECISION_INDEX],
                    SCALE: col[COL_SCALE_INDEX]
                },
                identity = col[COL_IDENTITY_INDEX],
                virtualDBcol = col[COL_VIRTUAL_INDEX],
                def = {
                    index: destColIndex,
                    seq: destColIndex + 1,
                    heading: util.escapeHTML( col[COL_COLUMN_NAME_INDEX] ),
                    headingAlignment: "start",
                    alignment: "start",
                    isRequired: col[COL_NULLABLE_INDEX].startsWith( "N" ), // todo depends on where localized
                    readonly: true, // default, see below
                    width: 120, // todo not sure how best to set a reasonable minimum but also allow wider but without stretch
                    noStretch: false,
                    canSort: false, // default, see below
                    dataType: dataType,
                    dataLength: col[COL_LENGTH_INDEX],
                    noCopy: parseInt( col[COL_PRIMARY_KEY_INDEX], 10 ) > 0,
                    // extra stuff for tooltip
                    serverDataType: util.applyTemplate( dataTypeTemplate, {
                        extraSubstitutions: subst
                    } ),
                    comment: col[COL_COMMENT_INDEX],
                    nullable: col[COL_NULLABLE_INDEX]
                    // don't set defaultValue from DATA_DEFAULT because it is intended for the database to supply
                    // the default. The default can also be SQL expression that client has no idea about.
                };

            // only show so many visible columns by default
            if ( destColIndex > MAX_VISIBLE_DATA_COLUMNS ) {
                def.hidden = true;
            }
            // can only edit specific data types and can't edit an identity always column or a virtual column
            // SDO_GEOMETRY is a special case where APEX_EXEC converts to text display values
            if ( identity === "ALWAYS" || virtualDBcol === "Y" || dataType === "SDO_GEOMETRY" ) {
                // readonly already true by default
                def.isRequired = false; // doesn't make sense to be readonly and required
                def.noCopy = true;
            } else if ( ["VARCHAR2", "NUMBER", "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ", "CLOB"].includes( dataType ) ) {
                def.elementId = `O_${objId}_COL_${i + 1}`;
                def.readonly = false;
                def.canSort = true;
            } else {
                def.cellTemplate = "[" + util.escapeHTML( dataType ) + "]";
            }
            if ( dataType === "NUMBER" ) {
                def.headingAlignment = "end";
                def.alignment = "end";
            }
            // todo future consider support to edit LOB, JSON, geo columns.
            // todo need validation of input length, numbers? comment for help, PK for warning on change?
            columnsDef[col[COL_COLUMN_NAME_INDEX]] = def;
            destColIndex += 1;
        }
        if ( editable ) {
            columnsDef._meta = {
                index: destColIndex,
                hidden: true,
                canHide: false
            };
        }

        return columnsDef;
    }

    /**
     * This is the base implementation for all object types registered with registerObjectType.
     * The object type definition (from objectBrowserConfig.js) is merged into the object type instance
     * returned by registerObjectType.
     * See how these methods on object types are called from the interface returned from makeObjectDocDescriptor.
     */
    const objectPrototype = {
        /**
         * Renders the markup for each view of the object type that goes inside the body of a tab panel.
         * @param objectInstance
         * @returns {string}
         */
        renderUI: function( objectInstance ) {
            const out = util.htmlBuilder();

            // render each view the object type defines
            this.views.forEach( viewDef => {
                out.markup( `<div id="ob_view_${viewDef.id}" class="ob-view-${viewDef.id}">` );
                getView( viewDef.type ).render( out, objectInstance, viewDef );
                out.markup( "</div>" );
            } );
            return out.toString();
        },
        /**
         * Initialize the object type ui after it is rendered.
         * @param objectInstance
         * @param tabPanel$
         */
        initUI: function( objectInstance, tabPanel$ ) {
            objectInstance.tabPanel$ = tabPanel$;
        },
        /**
         * Called to cleanup the tab panel content.
         * @param objectInstance
         * @param tabPanel$
         */
        destroyUI: function( objectInstance, tabPanel$ ) {
            // this object instance is going away so release any models
            for ( const [, m] of objectInstance.models ) {
                // by releasing the model it will be destroyed. This means if the object tab is opened again new data is fetched
                apexModel.release( m.modelId() );
            }
            this.saveState( objectInstance, tabPanel$ );
        },
        /**
         * A helper to get the view definition for a specific view id
         * @param viewId
         * @returns {object}
         */
        getViewDef: function( viewId ) {
            return this.views.find( v => v.id === viewId );
        },
        /**
         * Update the saved view state for an object instance of this view type. Called when tab destroyed or
         * when page unloads.
         * @param objectInstance
         * @param tabPanel$
         */
        saveState: function( objectInstance, tabPanel$ ) {
           for ( let viewId of objectInstance.initializedViews ) {
                let key = objectInstance.id + "_" + viewId,
                    viewDef = this.getViewDef( viewId ),
                    views$ = tabPanel$.children(),
                    view$ = views$.filter( SEL_VIEW_PREFIX + viewId ),
                    state = getView( viewDef.type ).getState( view$ );

                if ( state ) {
                    viewStateMap.set( key, state );
                }
            }
        },
        /**
         * Activate an object. This will call activateView via change-view.
         * @param objectInstance
         * @param actions
         * @param toolbar$
         * @param tabs$
         */
        activate: function( objectInstance, actions, toolbar$, tabs$  ) {
            let viewId,
                changeViewAction = actions.lookup( "change-view" );

            objectInstance.currentViewId = null; // set to null so change-view will activate the view

            // only [re]render the tabs tablist when the type changes
            if ( this.type !== previousType ) {
                let choices = this.views.map( view => {
                        return {label: view.label, value: view.id};
                    } );

                previousType = this.type;

                changeViewAction.choices = choices;
                tabs$.find( "[role=tablist]" ).html(
                    this.views
                        .map( view => `<li><a aria-hidden="true" href="#ob_view_${view.id}">${view.label}</a></li>` )
                        .join( "" ) );
            }
            // even if the set of tabs are not changed, the panels are so must refresh tabs widget (bug 35222487)
            tabs$.tabs( "instance" ).active = $(); // do this so that refresh doesn't change the active tab
            tabs$.tabs( "refresh" ); // refresh tabs to pick up the new markup
            viewId = lastViewByType.get( objectInstance.type ) || changeViewAction.choices[0].value;
            changeViewAction.set( viewId ); // this will activate the view and sync the active tab
        },
        /**
         * Return the current active view id.
         * @param objectInstance
         * @returns {null|*}
         */
        getActiveView: function( objectInstance ) {
            return objectInstance.currentViewId;
        },
        /**
         * Refresh the data for the active current view of an object instance. This handles any views
         * based on models but otherwise the view type must implement refreshData.
         * @param objectInstance
         */
        refreshData: function( objectInstance ) {
            const viewId = objectInstance.currentViewId,
                viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type );
            let model;

            // Most views are based on models and are refreshed by clearing the model.
            // First see if the view type handles refreshData
            if ( view.refreshData ) {
                this.saveState( objectInstance, objectInstance.tabPanel$ );
                view.refreshData( objectInstance, viewDef );
                return;
            } // else

            if ( viewDef.subViews ) {
                let modelIds = [],
                    view$ = objectInstance.tabPanel$.children( SEL_VIEW_PREFIX + viewId );

                viewDef.subViews.forEach( v => {
                    model = objectInstance.models.get( viewId + "_" + v.subId );

                    if ( model ) {
                        modelIds.push( model.modelId() );
                        model.clearData( false ); // don't notify to keep the views from starting their own fetch
                    }
                } );
                apexModel.multipleFetch( null, {
                    loadingIndicator: view$,
                    loadingIndicatorPosition: "centered"
                }, modelIds ).done( () => {
                    // call the view to refresh each sub view
                    view.refresh( view$ );
                } );
            } else {
                model = objectInstance.models.get( viewId );

                if ( model ) {
                    model.clearData();
                }
            }
        },
        /**
         * Download the data for the current view.
         * @param objectInstance
         * @param format
         */
        download: function( objectInstance, format ) {
            const viewId = objectInstance.currentViewId;

            if ( viewId ) {
                let dlModelId, downloadOptions,
                    dlSubView = null,
                    viewDef = this.getViewDef( viewId );

                // It's not great that this method is aware of the various view types, but it is more about
                // understanding the configuration than view type implementation
                if ( viewDef.type === VT_NVP_GRID ) {
                    dlSubView = viewDef.subViews[1]; // can only download the grid data
                    dlModelId = viewId + "_" + dlSubView.subId;
                    dlSubView = dlSubView.subId;
                } else if ( viewDef.type === VT_NVP_EDITOR ) {
                    dlSubView = viewDef.subViews[1].subId; // can only download the editor text
                    format = "TEXT"; // just to be sure
                } else if ( viewDef.type === VT_GRID ) {
                    dlModelId = viewId;
                } else if ( viewDef.type === VT_EDITOR ) {
                    format = "TEXT"; // just to be sure
                } else {
                    return; // download not supported
                }

                downloadOptions = {
                    format: format
                };

                if ( dlModelId ) {
                    let model = objectInstance.models.get( dlModelId );

                    if ( model ) {
                        // add sorts and filters
                        $.extend( downloadOptions, model.getOption( "fetchData" ) );
                        // get list of visible columns
                        const allColumns = model.getOption( "fields" ),
                            visibleColumns = [];

                        for ( const [n, v] of objectEntries( allColumns ) ) {
                            if ( !v.virtual && !v.hidden ) {
                                visibleColumns.push( {name: n, seq: v.seq} );
                            }
                        }
                        visibleColumns.sort( ( a, b ) => a.seq - b.seq ); // sort by display order
                        downloadOptions.columns = visibleColumns.map( c => c.name ); // just the names are needed
                    }
                }

                downloadReport( objectInstance, viewId, dlSubView, downloadOptions );
            }
        },
        /**
         * Resize the current view.
         * @param objectInstance
         */
        resize: function( objectInstance ) {
            const viewId = objectInstance.currentViewId;

            if ( viewId && objectInstance.initializedViews.has( viewId ) ) {
                let viewDef = this.getViewDef( viewId ),
                    panel$ = objectInstance.tabPanel$,
                    views$ = panel$.children(),
                    view$ = views$.filter( SEL_VIEW_PREFIX + viewId );

                view$.height( panel$.height() ).width( panel$.width() );
                getView( viewDef.type ).resize( view$ );
            }
        },
        /**
         * Activate the current view.
         * @param objectInstance
         * @param viewId
         */
        activateView: function( objectInstance, viewId ) {
            const currentTypeView = this.type + "_" + viewId,
                panel$ = objectInstance.tabPanel$,
                viewDef = this.getViewDef( viewId ),
                views$ = objectInstance.tabPanel$.children(),
                toolbar$ = $( "#obObjectDocToolbar" ); // todo should not have special knowledge of toolbar id
            let view$, viewActionNames;

            objectInstance.currentViewId = viewId;
            //
            // Update actions
            //
            // show hide type/view specific actions
            if ( previousTypeView ) {
                viewActionNames = viewToActionsMap.get( previousTypeView );
                if ( viewActionNames ) {
                    viewActionNames.forEach( name => {
                        apexActions.hide( name );
                    } );
                }
                previousTypeView = null;
            }
            viewActionNames = viewToActionsMap.get( currentTypeView );
            if ( viewActionNames ) {
                viewActionNames.forEach( name => {
                    apexActions.show( name );
                } );
            }

            // special case to hide the menu button
            toolbar$.toolbar( "findElement", "actions_button" ).toggle(
                objectInstance.type === "TABLE" && viewId === "MAIN"
            );

            // todo special case to hide the toolbar if it has no actions. Blocking issue is style of tabs when there is no toolbar

            view$ = views$.hide()
                .filter( SEL_VIEW_PREFIX + viewId ).show();

            view$.height( panel$.height() ).width( panel$.width() );

            let view = getView( viewDef.type );

            // a special case for data view that is stale. Must destroy and reinitialize to get new columns
            if ( objectInstance.staleViews.has( viewId ) && objectInstance.initializedViews.has( viewId ) &&
                objectInstance.dataColumns && viewId === ID_DATA && view.destroyView ) {

                view.destroyView( view$ );
                apexModel.release( objectInstance.models.get( viewId ).modelId() );
                objectInstance.dataColumns = null;
                objectInstance.initializedViews.delete( viewId ); // so it will be initialized next
            }

            if ( !objectInstance.initializedViews.has( viewId ) ) {
                // xxx may still need to handle stale view data because of loadViewData
                this.initializeView( view$, objectInstance, viewDef );
            } else {
                view.resize( view$ );
                // don't want to focus here

                // note this staleObjects and checkDepends is dead code because only one object is open at a time
                // see invalidateViews
                if ( objectInstance.staleObjects.size > 0 && view.checkDepends ) {
                    // todo an object has one view that knows about the other object ids that this object depends
                    //  on. And knows what other views may need to be invalidated. May need to load the data for that
                    //  view first and use it to check. Then invalidate all the other views
                    if ( view.checkDepends( objectInstance, viewDef ) ) {
                        objectInstance.staleViews.add( viewId ); // todo other views also?
                    }
                }
                // if this view is stale refresh the data
                if ( objectInstance.staleViews.has( viewId ) ) {
                    this.refreshData( objectInstance );
                }
            }
            // no matter if activated or initialized and was stale or not it is not stale now
            objectInstance.staleViews.delete( viewId );

            // remember last view that each type is showing
            lastViewByType.set( objectInstance.type, viewId );
        },
        /**
         * Load data for a view
         * @ignore
         * @param objectInstance
         * @param viewId
         * @param progressView$ where to show progress spinner if there is a need
         * @param callback required
         * @param wait true if initial fetch of data should be done and callback called after data is available
         * @param viewDef optional
         */
        loadViewData: function( objectInstance, viewId, progressView$, callback, wait, viewDef = this.getViewDef( viewId ) ) {
            const schema = objectInstance.schema,
                owner = objectInstance.owner,
                type = objectInstance.type,
                objId = objectInstance.id,
                objName = objectInstance.name,
                modelId = makeModelId( type, objId, viewId );
            let model;

            function addModelListener( model, viewDef ) {
                if ( viewDef.updateActions ) {
                    model.subscribe( {
                        onChange: function( type ) {
                            if ( type === "addData" || type === "refresh" ) {
                                viewDef.updateActions( objectInstance );
                            }
                        }
                    } );
                }
            }

            if ( viewDef.columns === null && viewId === ID_DATA ) {
                let colSubViewName, // intentionally undefined
                    colViewName = "COLUMNS",
                    columnsView = this.getViewDef( colViewName );

                // columns view is either a top level view called "COLUMNS" or a subView of view "MAIN" called "COLS"
                if ( !columnsView ) {
                    colSubViewName = "COLS";
                    colViewName = "MAIN";
                    columnsView = this.views
                        .find( v => v.id === colViewName ).subViews
                        .find( v => v.subId === colSubViewName );
                }

                model = apexModel.get( modelId );

                // This is a special case for data of the TABLE, VIEW, and MATERIALIZED_VIEW types
                // Need to get both the data and columns definition from the server.
                // Don't need to keep the column definitions around as a model.
                // Can't use COLUMNS view model because it could have sorts or filters applied.
                // Don't have a model yet but want to make an ajax request as if we did. Get columns and data in one request.
                if ( !model ) {
                    let p = server.plugin( {
                        "regions": [
                            {
                                dataShape: "table",
                                parsingSchema: schema,
                                owner: owner,
                                objectType: type,
                                objectId: objId,
                                objectName: objName,
                                view: colViewName,
                                subView: colSubViewName,
                                id: gGridRegionId + "COLUMNS",
                                ajaxIdentifier: gGridAjaxIdentifier,
                                fetchData: {
                                    version: 1,
                                    firstRow: 1,
                                    maxRows: null // want all the columns
                                }
                            },
                            {
                                dataShape: "table",
                                parsingSchema: schema,
                                owner: owner,
                                objectType: type,
                                objectId: objId,
                                objectName: objName,
                                view: ID_DATA,
                                id: gGridRegionId + ID_DATA,
                                ajaxIdentifier: gGridAjaxIdentifier,
                                fetchData: {
                                    version: 1,
                                    firstRow: 1,
                                    maxRows: 100
                                }
                            }
                        ]
                    }, {
                        loadingIndicator: progressView$,
                        loadingIndicatorPosition: "centered"
                    } );
                    wait = true; // must wait in this case
                    p.done( ( responseData ) => {
                        if ( responseData.regions && responseData.regions.length === 2 ) {
                            let columns = responseData.regions[0].fetchedData.values;

                            // The column definition will be maintained by the model. It can't be saved in the
                            // viewDef because that is shared with all instances of the type.
                            columns = makeColumnsDef( objId, columns, viewDef.modelEditable,
                                columnsView.columns.DATA_TYPE.cellTemplate );
                            objectInstance.dataColumns = columns; // todo consider if objectInstance.columns map can be used instead of dataColumns
                            model = createModel( modelId, schema, owner,
                                type, objId, objName, viewId, viewDef, columns,
                                responseData.regions[1].fetchedData );
                            objectInstance.modelId = modelId;
                            objectInstance.models.set( viewId, model );
                            callback();
                        }
                    } );
                } else {
                    objectInstance.dataColumns = model.getOption( "fields" );
                    objectInstance.modelId = modelId;
                    objectInstance.models.set( viewId, model );
                }
            } else if ( viewDef.columns ) {
                model = apexModel.get( modelId );

                let columns;

                if( viewId === ID_ENV_IMPORTS ) {
                    const editLabel = getMessage( "EDIT_IMPORT" );

                    columns = {
                        ROW_ACTIONS: {
                            hidden: false,
                            readonly: false,
                            escape: true,
                            label: editLabel,
                            heading: `<span class='u-vh'>${editLabel}</span>`,
                            headingAlignment: "center",
                            alignment: "center",
                            seq: 1,
                            noStretch: true,
                            frozen: true,
                            canSort: false,
                            isRequired: false,
                            noCopy: false,
                            canHide: false,
                            defaultValue: "",
                            cellTemplate: renderEditIconButton( editLabel, "import-edit" ),
                            columnCssClasses: "has-button",
                            headingCssClasses: "has-button",
                            virtual: true,
                            noHeaderActivate: true,
                            width: DEFAULT_ACTIONS_COL_WIDTH
                        },
                        ...viewDef.columns
                    };

                    let i = 0;
                    for ( const [name, def] of objectEntries( columns ) ) {
                        if( ![ "ROW_ACTIONS", "ORIGINAL_IMPORT_NAME" ].includes( name ) ) {
                            def.elementId = `O_${objId}_COL_${i + 1}`;
                            def.readonly = false;
                            def.canSort = true;
                            i = i + 1;
                        }
                    }

                    objectInstance.dataColumns = columns;
                } else {
                    // copy columns so changes are not reflected in static viewDef config
                    columns = $.extend( true, {}, viewDef.columns );
                }

                if ( !model ) {
                    model = createModel( modelId, schema, owner, type, objId, objName, viewId, viewDef, columns );
                    if ( wait ) {
                        const p = model.fetch();

                        if ( p ) {
                            p.then( callback );
                        } else {
                            callback();
                        }
                    }
                } else {
                    // assume already have data so no need to wait
                    wait = false;
                }
                addModelListener( model, viewDef );
                objectInstance.modelId = modelId;
                objectInstance.models.set( viewId, model );
                objectInstance.columns.set( viewId, columns );
            } else if ( viewDef.subViews ) {
                let modelCreated = false,
                    modelIds = [];

                for ( let i = 0; i < viewDef.subViews.length; i++ ) {
                    let subView = viewDef.subViews[i];

                    if ( subView.columns ) {
                        let modelSuffix = viewId + "_" + subView.subId,
                            modelId = makeModelId( type, objId, modelSuffix ),
                            model = apexModel.get( modelId ),
                            // copy columns so changes are not reflected in static viewDef config
                            columns = $.extend( true, {}, subView.columns );

                        modelIds.push( modelId );
                        if ( !model ) {
                            model = createModel( modelId, schema, owner, type, objId, objName, viewId, subView, columns );
                            modelCreated = true;
                        }
                        objectInstance.models.set( modelSuffix, model );
                        objectInstance.columns.set( modelSuffix, columns );
                        addModelListener( model, viewDef );
                    }
                }
                objectInstance.modelIds = modelIds;
                if ( wait && modelCreated ) {
                    const p = apexModel.multipleFetch( null, {
                        loadingIndicator: progressView$,
                        loadingIndicatorPosition: "centered"
                    }, modelIds );

                    if ( p ) {
                        p.then( callback );
                    } else {
                        callback();
                    }
                }
            }
            // else: other view types load their own data
            if ( !wait ) {
                callback();
            }
        },
        /**
         * Initialize the current view. Called from activateView the first time (view not yet initialized).
         * First loads the view data then calls initializeView for the view type.
         * @param view$
         * @param objectInstance
         * @param viewDef
         */
        initializeView: function( view$, objectInstance, viewDef ) {
            let viewType = getView( viewDef.type );

            this.loadViewData( objectInstance, objectInstance.currentViewId, view$, function() {
                viewType.initializeView( view$, objectInstance, viewDef );
                objectInstance.initializedViews.add( viewDef.id );
            }, false, viewDef );
        },
        /**
         * Called to see if it is OK to close a tab.
         * @param objectInstance
         * @returns {string}
         */
        checkRemove: function( objectInstance ) {
            let message = null;

            if( objectInstance.getIsChanged() ) {
                message = getMessage( "CLOSE_WARNING" );
            }

            return message;
        },
        /**
         * Called to clear changes if user chooses to close tab even after warning.
         * @param objectInstance
         */
        clear: function( objectInstance ) {
            for ( const [, data] of objectInstance.data ) {
                data.isChanged = false;
            }
        },
        /**
         * Saves changes for the current view.
         * @param objectInstance
         * @returns {*}
         */
        save: function( objectInstance ) {
            const viewId = objectInstance.currentViewId,
                viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type ),
                view$ = objectInstance.tabPanel$.children( SEL_VIEW_PREFIX + viewId );

            if ( view.save ) {
                return view.save( view$, objectInstance );
            }
        },
        getViewReadOnly: function( objectInstance, viewId ) {
            const viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type );

            if( view.getViewReadOnly ) {
                return view.getViewReadOnly( objectInstance, viewId );
            } else {
                return false;
            }
        },
        setViewReadOnly: function( objectInstance, viewId, readOnly ) {
            const viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type ),
                view$ = objectInstance.tabPanel$.children( SEL_VIEW_PREFIX + viewId );

            if ( view.setViewReadOnly ) {
                view.setViewReadOnly( view$, objectInstance, viewId, readOnly );
            }
        },
        getViewIsChanged: function( objectInstance, viewId ) {
            const viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type );
            if( view.getViewIsChanged ) {
                return view.getViewIsChanged( objectInstance, viewId );
            } else {
                return false;
            }
        },
        clearViewChanges: function( objectInstance, viewId ) {
            const viewDef = this.getViewDef( viewId ),
                view = getView( viewDef.type ),
                view$ = objectInstance.tabPanel$.children( SEL_VIEW_PREFIX + viewId );

            if( view.clearViewChanges ) {
                view.clearViewChanges( view$, objectInstance, viewId );
            }
        }
    };

    function registerObjectType( typeName, typeDefinition ) {
        const def = Object.create( objectPrototype );

        Object.assign( def, typeDefinition );
        def.type = typeName;
        objectTypeDefMap.set( typeName, def );
        objectsTreeTypes[typeName + DIR_NODE_SUFFIX] = { // icon goes on the parent folder node not the object node
            icon: typeDefinition.icon
        };
        // add actions
        def.views.forEach( ( view ) => {
            if ( !view.label ) {
                // localize view label
                view.label = lang.getMessage( "OB.VIEW_" + ( view.labelKey || view.id ) );
                delete view.labelKey;
            }

            if ( view.subViews ) {
                view.subViews.forEach( sv => {
                    if ( !sv.heading ) {
                        // localize sub view heading
                        sv.heading = lang.getMessage( "OB.SV_" + sv.headingKey );
                        delete sv.headingKey;
                    }
                } );
            }

            if ( view.actions ) {
                // defer processing actions until after DOM is loaded
                objectTypeActions.push( {
                    type: typeName,
                    view: view.id,
                    actions: view.actions
                } );
            }
        } );
    }

    /*
     * ================================
     * Dialogs
     * ================================
     */
    const gDialogsMap = new Map(); // map dialog-name > dialog-impl
    let gIdIndex = 1;

    function updateDDL( dlgImpl, dlg$, valid ) {
        if ( dlgImpl.hasSQL ) {
            if ( valid ) {
                dlg$.find( "#" + dlgImpl.sqlPreviewId ).text( dlgImpl.ddl );
                Prism.highlightAll();
            }
            let region$ = dlg$.find( "#" + dlgImpl.sqlRegionId );

            region$.find( ".preview" ).toggle( valid );
            region$.find( ".previewMessage" ).toggle( !valid );
        }
    }

    function openDialog( name, inputArgs ) {
        const dlg$ = $( "#" + name, apex.gPageContext$ ),
            cursor = dlg$.find( "a-model-cursor" )[0],
            buttons$ = dlg$.find( ".js-ok,.js-copy" ),
            dlgImpl = gDialogsMap.get( name ),
            formalArgs = dlgImpl.args;
        let  newTitle = null;

        // if there is a cursor make sure no record is set before open
        if ( cursor ) {
            cursor.recordId = "";
        }

        for ( const [argName, itemName] of objectEntries( formalArgs ) ) {
            $s( itemName, inputArgs[argName] || "" );
        }

        if ( inputArgs.dialogTitle ) {
            newTitle = inputArgs.dialogTitle;
        } else if ( inputArgs.dialogTitleArgs && dlgImpl.titleTemplate ) {
            newTitle = lang.format( dlgImpl.titleTemplate, ...inputArgs.dialogTitleArgs );
        }
        if ( newTitle ) {
            dlg$.dialog( OPTION, "title", newTitle );
        }

        if ( dlgImpl.open ) {
            dlgImpl.open( dlg$, inputArgs );
        }
        if ( dlgImpl.validate ) {
            const valid = dlgImpl.validate( dlg$, true );

            updateDDL( dlgImpl, dlg$, valid );
            buttons$.prop( "disabled", !valid );
        }
        theme.openRegion( name );

        if ( dlgImpl.postOpen ) {
            dlgImpl.postOpen( dlg$, inputArgs );
        }

        return true;
    }

    function getItemFromEvent( event ) {
        let id = event.target.id;

        if ( !id ) {
            id = $( event.target ).closest( ".a-Form-fieldContainer" ).attr( "id" ).replace( "_CONTAINER", "" );
        }
        if ( item.isItem( id ) ) {
            return item( id );
        }
        return null;
    }

    /**
     * Initializes an inline dialog region.
     * @param {string} name dialog region static id
     * @param {string} itemPrefix all items in the region need to have the same prefix
     * @param {object} dlgImpl An object with these methods and properties
     *     args: {} map of arg name to item name suffix. The itemPrefix plus the property value makes the full item name
     *     hasSQL: true // optional if true a SQL region is added to the dialog and updated
     *     titleIsTemplate: true // optional if true dialog title supplied in openDialog inputArgs is treated as a template
     *     updateActions: true // optional if true actions are updated after ok close
     *     initialize: function( dlg$ ) called once to initialize dialog content
     *     open: function( dlg$, inputArgs ) called when dialog is opened. see openDialog
     *     validate: function( dlg$, isChange, event ) called on input and change of any dialog items
     *     onOk: function( dlg$ ) called when user presses OK button
     */
    function initDialog( name, itemPrefix, dlgImpl ) {
        const dlg$ = $( "#" + name, apex.gPageContext$ ),
            cursorId = dlg$.attr( "data-bind-cursor" ),
            okBtn$ = dlg$.find( ".js-ok" ),
            createBtn$ = dlg$.find( ".js-create" ),
            saveBtn$ = dlg$.find( ".js-save" ),
            deleteBtn$ = dlg$.find( ".js-delete" );

        if ( !dlg$[0] ) {
            debug.error("No such dialog ", name );
            return;
        }

        if ( itemPrefix ) {
            // add item prefix to all the item ids in args
            objectEntries( dlgImpl.args ).forEach( ( [p, v] ) => {
                dlgImpl.args[p] = itemPrefix + v;
            } );
        }

        gDialogsMap.set( name, dlgImpl );

        if ( dlgImpl.hasSQL ) {
            const sqlRegion$ = $( $( "#sqlPreviewRegion" )[0].content ).children().first().clone(),
                regionId = "sqlRegion_" + gIdIndex,
                previewId = "sqlPreview_" + gIdIndex,
                copyId = "sqlCopy_" + gIdIndex;

            gIdIndex += 1;
            sqlRegion$.attr( "id", regionId )
                .find( ".previewSQL" ).attr( "id", previewId )
                .parent( "pre" ).attr( "id", copyId );
            sqlRegion$.find( ".js-copy" ).attr( "data-clipboard-source", "#" + copyId );
            dlg$.find( ".b-OB-sqlPreview" ).append( sqlRegion$ );
            dlgImpl.sqlPreviewId = previewId;
            dlgImpl.sqlRegionId = regionId;
            sqlRegion$.show();
        }
        if ( dlgImpl.titleIsTemplate ) {
            // wait for dialog widget to initialize
            $( () => {
                dlgImpl.titleTemplate = dlg$.dialog( OPTION, "title" );
            } );
        }

        if ( cursorId ) {
            // cursorId comes from static page 2000 markup so is safe
            dlg$.append( `<a-model-cursor id="${cursorId}" explicit-store="true"></a-model-cursor>` );
        }
        if ( dlgImpl.initialize ) {
            // todo consider delay calling all initDialog until doc ready
            // need to wait until all items have been initialized
            $( document ).on( "apexreadyend", () => {
                dlgImpl.initialize( dlg$ );
            } );
        }

        if ( dlgImpl.validate ) {
            const validate = ( event ) => {
                if ( !dlg$.dialog( "isOpen" ) ) {
                    return; // skip validate while dialog is not open
                }
                const isChange = event.type === "change";
                let valid = true;

                if ( isChange ) {
                    const changedItem = getItemFromEvent( event );

                    // only validate visible items
                    if ( changedItem && changedItem.element.is( ":visible" ) ) {
                        valid = changedItem.getValidity().valid;
                        if ( !valid ) {
                            apexMessage.showErrors( {
                                type: "error",
                                location: "inline",
                                pageItem: changedItem.id,
                                message: changedItem.getValidationMessage()
                            } );
                        } else {
                            apexMessage.clearErrors( changedItem.id );
                        }
                    }
                }
                if ( valid ) {
                    valid = dlgImpl.validate( dlg$, isChange, event );
                }

                updateDDL( dlgImpl, dlg$, valid );
                okBtn$.prop( "disabled", !valid );
                dlg$.find( ".js-copy" ).prop( "disabled", !valid );
            };

            dlg$.on( "change", ( event ) => {
                validate( event );
            } );
            // only want input event for input or textarea fields
            dlg$.on( "input", "input,textarea", util.debounce( validate, 200 ) );
        }

        dlg$.on( "dialogclose", function() {
            let cursor = dlg$.find( "a-model-cursor" )[0];

            // if the dialog used a cursor clear the model so that it can be released when the views are done with it.
            if ( cursor ) {
                cursor.modelId = "";
            }
        } );

        dlg$.find( ".js-cancel" ).on( "click", () => {
            theme.closeRegion( name );
        } );
        okBtn$.on( "click", () => {
            const dlgImpl = gDialogsMap.get( name );

            dlgImpl.onOk( dlg$ ).then( ( { success, message } ) => {
                if ( success ) {
                    // todo think what if anything to do with the success message. Probably not worth showing until we get popup over messages in builder
                    theme.closeRegion( name );
                    // update actions for current view if needed
                    if ( dlgImpl.updateActions ) {
                        let typeDef = getTypeDef( currentTabState.type ),
                            viewDef = typeDef.getViewDef( currentTabState.currentViewId );

                        if ( viewDef.updateActions ) {
                            viewDef.updateActions( currentTabState );
                        }
                    }
                } else if ( message ) {
                    // todo is there a better way to show the message?
                    apexMessage.alert( message );
                } else {
                    // nothing to do but close the dialog
                    theme.closeRegion( name );
                }
            } );
        } );

        createBtn$.on( "click", () => {
            dlgImpl.onCreate( dlg$ );
        } );

        saveBtn$.on( "click", () => {
            dlgImpl.onSave( dlg$ );
        } );

        deleteBtn$.on( "click", () => {
            dlgImpl.onDelete( dlg$ );
        } );

    }

    function sendDDL( schema, owner, ddl, dialog$ ) {
        return new Promise( ( resolve ) => {
            server.plugin( {
                regions: [
                    {
                        id: gCodeRegionId,
                        ajaxIdentifier: gCodeAjaxIdentifier,
                        parsingSchema: schema,
                        owner: owner,
                        ddl: ddl
                    }
                ]
            }, {
                loadingIndicator: dialog$,
                loadingIndicatorPosition: "centered",
                success: function( data ) {
                    let region = data.regions[0]; // expect only one region in response

                    resolve( { success: region.status === "SUCCESS", message: region.message } );
                }
            } ).fail( ( jqXHR, textStatus, errorThrown ) => {
                // server.plugin will handle error cases so no need to handle here and
                // todo rethink this because default message location is on page. Probably want it on the dialog unless close dialog on errors.
                // turn the failure into resolved promise with success = false
                resolve( { success: false, message: errorThrown } );
            } );
        } );
    }

    function sendCommand( schema, owner, command, args = {}, dialog$ ) {
        return new Promise( ( resolve ) => {
            server.plugin( {
                regions: [
                    {
                        id: gCodeRegionId,
                        ajaxIdentifier: gCodeAjaxIdentifier,
                        parsingSchema: schema,
                        owner: owner,
                        command: command,
                        in: args
                    }
                ]
            }, {
                loadingIndicator: dialog$,
                loadingIndicatorPosition: "centered",
                success: function( data ) {
                    let region = data.regions[0]; // expect only one region in response

                    resolve( { success: region.status === "SUCCESS", message: region.message, result: region.out } );
                }
            } ).fail( ( jqXHR, textStatus, errorThrown ) => {
                // server.plugin will handle error cases so no need to handle here and
                // todo rethink this because default message location is on page. Probably want it on the dialog unless close dialog on errors.
                // turn the failure into resolved promise with success = false
                resolve( { success: false, message: errorThrown } );
            } );
        } );
    }

    function invalidateViews( objId, views, /* types */ ) {
        const desc = doc.getDocDescriptor();

        if ( views && desc && desc.id === objId ) {
            views.forEach( v => { desc.staleViews.add( v ); } );
        }
        /* Only one object is open at a time so no need for setting stale objects from types
           Leaving types parameter in calls to invalidateViews so as not to lose the metadata about how changes
           affect other object types.
            if ( types && types.includes( desc.type ) ) {
                desc.staleObjects.add( objId );
            }
        */
    }

    /*
     * ================================
     * Object Browser Interface
     * ================================
     */
    return {
        initialize: initialize,
        registerObjectType: registerObjectType,
        typeDisplayName: typeDisplayName,
        getCurrentInstance: function() {
            return currentTabState;
        },
        doLinkAction: doLinkAction,
        sendDDL: sendDDL,
        sendCommand: sendCommand,
        invalidateViews: invalidateViews,
        doc: doc,
        initDialog: initDialog,
        openDialog: openDialog,
        removeFromTree: removeFromTree,
        updateInvalidState: updateInvalidState,
        viewTypes: {
            GRID: VT_GRID,
            GRIDS: VT_GRIDS,
            NVP:  VT_NVP,
            EDITOR:  VT_EDITOR,
            NVP_GRID: VT_NVP_GRID,
            NVP_EDITOR: VT_NVP_EDITOR
        },
        getSchema: getSchema
    };
} )( apex.jQuery, apex.model, apex.util, apex.lang, apex.message,
    apex.server, apex.storage, apex.actions, apex.debug, apex.item, apex.navigation, apex.theme );
