/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

 /*
 * main controller file for the workflow designer.
 * fetches data, creates the model, adds global functions and actions
 *
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint semi: "error" */
/* global pe,gIsInternal,gIsReadOnly,gLanguage,gApexVersion */


( function( model, $, apexActions, server, env, pd, util, message ) {
    "use strict";

    const C_PROCESSING = "is-processing";
    const TAB_NAME_SEARCH = "search";
    const TAB_NAME_PE_COMP = "peComponentProperties";
    const TAB_NAME_SHAREDCOMP = "sharedComp_container";
    const M_GO_WORKFLOW = "pd-go-to-workflow-tree";
    const M_GO_DIAGRAM = "pd-go-to-diagram-builder";
    const M_GO_PROP_EDITOR = "pd-go-to-wf-property-editor";
    const M_GO_SHARED = "pd-go-to-used-shared-tree";
    const M_SHOW_SHORTCUTS = "pd-show-shortcuts";
    const M_GO_G_ACTIVITIES = "pd-go-to-gallery-activities";
    const WF_STATE_DEV = "DEVELOPMENT";
    const WF_STATE_ACTIVE = "ACTIVE";
    const WF_STATE_INACTIVE = "INACTIVE";
    const pe$ = $( "#peMain" );

    let startRegion$, trees$, shouldCreateWorkflow, workflowDiagramConfig;

    /**
     * this function is called before each version state change. it confirms the change with the user and checks some min requirements
     * it's called from the tree context menu and also from the property editor
     *
     * @param {object}   component  model component
     * @param {string}   value      the next state value
     * @param {function} callback   function to execute after button press in the alert window
     */
    pd.validateVersionStateChange = function( component, value, callback ) {
        if ( value === WF_STATE_ACTIVE ) {
            let hasOwner = !!component.getChilds( model.COMP_TYPE.WORKFLOW_PARTICIP, {
                fitlers: [ {
                    id: model.PROP.WORKFLOW_PARTICIP_TYPE,
                    value: "OWNER"
                } ]
            } ).length;
            let hasErrors = component.getAllChildren().some( child => child.hasErrors() );
            if ( !hasOwner || hasErrors ) {
                // must have an owner(i.e. participant) and can't have any errors
                let errorMessage = !hasOwner ? pd.msg( "WF.ERROR.MISSING_OWNER" ) : pd.msg( "WF.ERROR.FIX_VALIDATION_ERROR" );
                message.alert( errorMessage, () => {} );
            } else {
                // child workflows must have an active version
                let children = pd.getConnectedWorkflows( component.parentId, "child" );
                if ( children.length > 0 ) {
                    for( let i = 0; i < children.length; i++ ) {
                        let versions = model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { parentId: children[ i ].childWorkflowId } );
                        if ( versions.every( version => version.getProperty( model.PROP.STATE ).getValue() !== WF_STATE_ACTIVE ) ) {
                            message.alert( pd.msg( "WF.ERROR.NO_ACTIVE_CHILD" ), () => {} );
                            return;
                        }
                    }
                    callback();
                } else {
                    // default confirmation dialog
                    message.confirm( pd.msg( "WF.QUESTION_ACTIVATE" ) , ( ok ) => {
                        if ( ok ) {
                            callback();
                        }
                    } );
                }
            }
        } else if ( value === WF_STATE_INACTIVE ) {
            // a child version(/workflow) can be deactivated, if:
            // - it has no non-inactive ancestor
            // - has other non-inactive versions
            let ancestors = pd.getConnectedWorkflows( component.parentId );
            if (
                ancestors.length > 0
                && ancestors.some( parent => !parent.isInactive )
                && component.getSiblings().every( version => pd.isInactive( version ) )
            ) {
                message.alert( pd.msg( "WF.ERROR.PARENT_IS_ACTIVE" ), () => {} );
            } else {
                message.confirm( pd.msg( "WF.QUESTION_DEACTIVATE" ) , ( ok ) => {
                    if ( ok ) {
                        callback();
                    }
                } );
            }
        }
    };

    /**
     * returns the all plug-ins from the model that can be used in the worlfow designer ( ie. supports workflow activity )
     *
     * @returns {object}
     */
    pd.getWorkflowActivities = function() {
        let plugins = pe.getComponentType( pe.COMP_TYPE.WORKFLOW_ACTIVITY ).pluginType.plugins;
        const isCloud = pe.getAll().sharedComponents.isCloud;
        return Object.keys( plugins ).reduce( ( acc, curr ) => {
            if ( plugins[ curr ].componentTypes.includes( pe.COMP_TYPE.WORKFLOW_ACTIVITY )
                // Only show cloud-specific plug-ins in APEX ABD instances
                && ( isCloud || !plugins[ curr ].cloudOnly )
               )
            {
                acc[ curr ] = plugins[ curr ];
            }
            return acc;
        }, {}) ;
    };

    /**
     * matches the workflow activity components with its diagram configuration.
     * if it's not specified, falls back to a default setting ( mostly used for plug-ins )
     *
     * @returns {object}
     */
    pd.getWorkflowActivitiesConfig = function( ) {
        let activities = pd.getWorkflowActivities();
        return Object.keys ( activities ).reduce( ( acc, curr ) => {
            let additionalData = {};
            let obj = { title: activities[ curr ].title };
            if ( workflowDiagramConfig[ curr ] ) {
                switch ( activities[ curr ].title ) {
                    case "NATIVE_WORKFLOW_START":
                        additionalData = {
                            stencilTooltip: {
                                text: "Start",
                                position: "top",
                            },
                            allowLinkIn: false,
                        };
                        break;
                    case "NATIVE_WORKFLOW_END":
                        additionalData = {
                            stencilTooltip: "End",
                            allowLinkOut: false,
                        };
                        break;
                }
                acc[ curr ]= {
                    ...obj,
                    ...workflowDiagramConfig[ curr ],
                    ...additionalData
                };
            } else {
                acc[ curr ]= {
                    ...obj,
                    ...workflowDiagramConfig.$PLUGIN$,
                    typeId: curr,
                };
            }
            return acc;
        }, {} );
    };

    pd.getDiagramKeyboardShortcuts = function() {
        return [ {
            label: pd.msg( "WF.DIAGRAM.DESELECT" ),
            key: "esc",
            displayKey: "Esc",
            event: "deselect"
        }, {
            label: pd.msg( "WF.DIAGRAM.SELECT_NEXT" ),
            key: "shift+up shift+right",
            displayKey: "Shift+Up Shift+Right",
            event: "cycleUp"
        }, {
            label: pd.msg( "WF.DIAGRAM.SELECT_PREV" ),
            key: "shift+down shift+left",
            displayKey: "Shift+Down Shift+Left",
            event: "cycleDown"
        }, {
            label: pd.msg( "WF.DIAGRAM.SHOW_MENU" ),
            key: "shift+F10",
            displayKey: "Shift+F10",
            event: "menuShow"
        }, {
            label: pd.msg( "WF.DIAGRAM.MOVE_CELL_UP" ),
            key: "up",
            displayKey: "Up",
            event: "selMoveUp"
        }, {
            label: pd.msg( "WF.DIAGRAM.MOVE_CELL_DOWN" ),
            key: "down",
            displayKey: "Down",
            event: "selMoveDown"
        }, {
            label: pd.msg( "WF.DIAGRAM.MOVE_CELL_LEFT" ),
            key: "left",
            displayKey: "Left",
            event: "selMoveLeft"
        }, {
            label: pd.msg( "WF.DIAGRAM.MOVE_CELL_RIGHT" ),
            key: "right",
            displayKey: "Right",
            event: "selMoveRight"
        }, {
            label: pd.msg( "WF.DIAGRAM.SCROLL_AREA_UP" ),
            key: "w",
            displayKey: "W",
            event: "paperPanUp"
        }, {
            label: pd.msg( "WF.DIAGRAM.SCROLL_AREA_DOWN" ),
            key: "s",
            displayKey: "S",
            event: "paperPanDown"
        }, {
            label: pd.msg( "WF.DIAGRAM.SCROLL_AREA_LEFT" ),
            key: "a",
            displayKey: "A",
            event: "paperPanLeft"
        }, {
            label: pd.msg( "WF.DIAGRAM.SCROLL_AREA_RIGHT" ),
            key: "d",
            displayKey: "D",
            event: "paperPanRight"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_TOP" ),
            key: "i",
            displayKey: "I",
            event: "elConnectUpTrigger"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_BOTTOM" ),
            key: "k",
            displayKey: "K",
            event: "elConnectDownTrigger"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_LEFT" ),
            key: "j",
            displayKey: "J",
            event: "elConnectLeftTrigger"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_RIGHT" ),
            key: "l",
            displayKey: "L",
            event: "elConnectRightTrigger"
        }, {
            label: pd.msg( "WF.DIAGRAM.REMOVE_CELL" ),
            key: "delete backspace",
            displayKey: "Delete",
            event: "cellRemove"
        }, {
            label: pd.msg( "WF.DIAGRAM.CHANGE_SELECTION_MODE" ),
            key: "shift+c",
            displayKey: "Shift+C",
            event: "cyclingModeChange"
        }, {
            label: pd.msg( "WF.DIAGRAM.ZOOM_IN" ),
            key: "ctrl+plus",
            displayKey: "Ctrl+Plus",
            event: "zoomIn"
        }, {
            label: pd.msg( "WF.DIAGRAM.ZOOM_OUT" ),
            key: "ctrl+minus",
            displayKey: "Ctrl+Minus",
            event: "zoomOut"
        }, {
            label: pd.msg( "WF.DIAGRAM.ZOOM_RESET" ),
            key: "ctrl+0",
            displayKey: "Ctrl+0",
            event: "zoomReset"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_TARGET" ),
            key: "l",
            displayKey: "L",
            event: "linkPlaceholderTargetTrigger"
        }, {
            label: pd.msg( "WF.DIAGRAM.OPEN_MENU_ADD_TO_LINK" ),
            key: "i k",
            displayKey: "I K",
            event: "linkAddElementButtonTrigger"
        } ];
    };

    /**
     * checks if the provided component is under a version with the provided state
     *
     * @param {object} component model component
     * @param {string} state the version state to check for, default is inactive
     * @returns {boolean}
     */
    pd.isInactive = function( component, state = WF_STATE_INACTIVE ) {
        if ( component /* && pd.isSharedDesignerComponent( component.typeId ) */ ) {
            let comp = component;
            if ( comp.typeId !== model.COMP_TYPE.WORKFLOW_VERSION ) {
                while ( comp && comp.typeId !== model.COMP_TYPE.WORKFLOW_VERSION ) {
                    comp = comp.getParent();
                }
            }
            if ( comp ) {
                let property = comp.getProperty( model.PROP.STATE );
                return ( property && property.getValue() === state );
            }
        }
        return false;
    };

    /**
     * returns all the ancestors/descedants of a workflow
     *
     * @param {string} startWorkflowId id of the subject workflow
     * @param {string} direction parent|child ancestors(parent) or descendants(child)
     * @returns
     */
    pd.getConnectedWorkflows = function( startWorkflowId, direction = "parent" ) {
        let result = [];
        const WORKFLOW_ID = "workflowId";
        const CHILD_WORKFLOW_ID = "childWorkflowId";
        const filterKey = direction === "parent" ? CHILD_WORKFLOW_ID : WORKFLOW_ID;
        const conditionKey = direction !== "parent" ? CHILD_WORKFLOW_ID : WORKFLOW_ID;
        const start = startWorkflowId;
        const workflowDefPropId = model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_INVOKE_WF", 1 ).id;
        const activities = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, {
            properties: [ { id: model.PROP.PAGE_PROCESS_TYPE, value: "NATIVE_INVOKE_WF" } ]
        } ).reduce( ( acc, act ) => {
            let obj = {
               activityId: act.id,
               isInactive: pd.isInactive( act ),
               name: act.getParent( model.COMP_TYPE.WORKFLOW )?.getProperty( model.PROP.NAME ).getValue(),
               [CHILD_WORKFLOW_ID]: act.getProperty( workflowDefPropId ).getValue(),
               [WORKFLOW_ID]: act.getParent( model.COMP_TYPE.WORKFLOW ).id,
            };
            if ( obj[WORKFLOW_ID] !== obj[CHILD_WORKFLOW_ID]
               && acc.filter( x => x[WORKFLOW_ID] === act[WORKFLOW_ID] && x[CHILD_WORKFLOW_ID] === act[CHILD_WORKFLOW_ID ] ).length < 1
            ) {
               acc.push( obj );
            }
            return acc;
       }, [] );

        function getNextWorkflow( currentWorkflowId ) {
            if ( currentWorkflowId ) {
                let acts = activities.filter( act => act[filterKey] === currentWorkflowId );
                acts.forEach( act => {
                    result.push( act );
                    if ( act[conditionKey] !== start ) {
                        getNextWorkflow( act[conditionKey] );
                    }
                } );
            }
        }

        getNextWorkflow( startWorkflowId );

        return result;
    };

    /**
     * hides/shows the "create your first workflow" region
     * ( should be displayed only if there's not a single workflow in the model )
     */
    function toggleCreateWorkflowRegion() {
        if ( model.getComponents( model.COMP_TYPE.WORKFLOW ).length ) {
            startRegion$.hide();
            trees$.show();
        } else {
            startRegion$.show();
            trees$.hide();
        }
    }

    /**
     * wrapper for ajax calls
     *
     * @param {string} name     name of the process to call
     * @param {object} data     data for the called process
     * @param {object} options  addittional options to the server.process call
     * @returns
     */
    function ajax( name, data, options ) {
        data.p_arg_names = [ "FB_FLOW_ID" ];
        data.p_arg_values = [ $v( "P9600_CURRENT_APP" ) ];
        return server.process( name, data, options );
    }

    /**
     * fetches all required data from the server and initializes the model with it
     *
     * @returns {promise}
     */
    function getDesignerData() {
        let spinner$, staticData, workflowData, sharedData, workspaceData, wfDiagramConfigData;
        let container$ = $( "#a_PageDesigner" ); // id is defined in the template
        let deferred$ = $.Deferred();

        // show loading screen
        util.delayLinger.start( "main", function(){
            spinner$ = util.showSpinner( container$ );
            container$.addClass( C_PROCESSING );
        } );

        staticData = $.ajax( {
            dataType: "json",
            type:     "GET",
            url:      env.APEX_FILES + "apex_ui/js/staticData/pd_static_data_" + gLanguage + ".json?v=" + gApexVersion
        } );

        // get the workflow diagram config
        wfDiagramConfigData = ajax( "getWorkflowDiagramConfig", {}, { type: "GET" } );
        // get the workflow data
        workflowData = ajax( "getWorkflowData", {}, { type: "GET" } );
        // get the shared components
        sharedData = ajax( "getSharedData", {}, { type: "GET" } );
        // workspace related data
        workspaceData = ajax( "getWorkspaceData", {}, { type: "GET" } );

        $.when( staticData, workspaceData, sharedData, workflowData, wfDiagramConfigData )
            .done( ( rStaticData, rWorkspaceData, rSharedData, rWorkflowData, rWfDiagramConfigData ) => {
                model.initModelConfig( rStaticData[ 0 ], rWorkspaceData[ 0 ], rSharedData[ 0 ] );
                // can we get this info from the server / do we need this at all?
                rWorkflowData[ 0 ][ model.COMP_TYPE.PAGE ] = [
                    {
                        "id": env.APP_PAGE_ID,
                        "parentId": $v( "P9600_CURRENT_APP" ),
                        "pageId": env.APP_PAGE_ID,
                        "properties": {
                            [ model.PROP.NAME ]: "Workflow Designer", // page name
                            [ model.PROP.PAGE_MODE ]: "NORMAL", // page mode
                            [ model.PROP.IS_GLOBAL_PAGE]: "N" // is global page
                        }
                    }
                ];

                model.setComponentData( rWorkflowData[ 0 ] );
                model.setCurrentAppId( $v( "P9600_CURRENT_APP" ) );
                model.setCurrentPageId( env.APP_PAGE_ID );   // static

                workflowDiagramConfig = rWfDiagramConfigData[ 0 ].config.reduce( ( acc, curr ) => {
                    acc[ curr.typeId ] = curr;
                    return acc;
                }, {} );

                $( document ).trigger( "modelReady" );

                deferred$.resolve();
            } )
        .fail( function() {
            deferred$.reject();
        } )
        .always( function() {
            util.delayLinger.finish( "main", function(){
                spinner$.remove();
                container$.removeClass( C_PROCESSING );
            } );
        } );

        return deferred$.promise();
    }

    function createStartWorkflow() {
        let transaction = model.transaction.start( "PAGE_CONTROLLER" );

        let workflow = new model.Component( {
            previousComponent: "last",
            typeId: model.COMP_TYPE.WORKFLOW
        } );

        // the workflow's callback automatically creates a version, we just have to select it
        let version = model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { parentId: workflow.id } )[ 0 ];

        apex.commandHistory.execute( transaction );

        return version;
    }

    /**
     * initializes the page serach
     * @todo bascially the same as in f4000_p4500.js, but with different page items...
     */
    function initSearch() {
        let lSearch$ = $( "#search-container" ).peSearch( { componentType: model.COMP_TYPE.WORKFLOW } );
        $( "#P9600_LOCAL_SEARCH,#P9600_MATCH_CASE,#P9600_IS_REGEXP" ).on( "change", function() {
            let lValue    = $v( "P9600_LOCAL_SEARCH" ),
                lModifier = ( ( $v( "P9600_MATCH_CASE" ) === "Y" ) ? "" : "i" ) + "g",
                lIsRegExp = ( $v( "P9600_IS_REGEXP" ) === "Y" );
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

        // clear the searc parameters
        $( "#CLEAR_PAGE_SEARCH" ).on( "click", function() {
            $s( "P9600_LOCAL_SEARCH", "", "", true );
            $s( "P9600_MATCH_CASE",   "", "", true );
            $s( "P9600_IS_REGEXP",    "", "", true );
            lSearch$.peSearch( "clear" );
        } );

        $( document ).on( "pageSearch", function( pEvent, pSearchText ) {
            pd.activateTab( TAB_NAME_SEARCH );
            // Set the search values provided by the caller
            $s( "P9600_MATCH_CASE", "", "", true );
            $s( "P9600_IS_REGEXP",  "", "", true );
            $s( "P9600_LOCAL_SEARCH", pSearchText ); // will trigger the change event and issue the query
        } );
    }

    $( function() {
        initSearch();

        model.init( {
            isInternal: gIsInternal,    // global variable
            isReadOnly: gIsReadOnly     // global variable
        } );

        // run initModel after the ready event so that modelReady will always fire after ready
        setTimeout( function() {
            // load the page data
            let deferred = getDesignerData();
            // check if the Workflow Report page's Create button loaded the page
            let url = new URL( window.location.href );
            if ( url.searchParams.has( "request" ) ) {
                shouldCreateWorkflow = url.searchParams.get( "request" ) === "newWorkflow";
            }

            $.when( deferred ).done( function() {
                // look for a initial component to select
                let selection = pd.parseSelectionHash( window.location.hash );
                if ( selection ) {
                    pd.goToComponent( selection.typeId, selection.componentId );
                // create new workflow, if requested
                } else if ( shouldCreateWorkflow ) {
                    $( document ).trigger( "selectionChanged", [ "controller", [ createStartWorkflow() ] ] );
                    url.searchParams.delete( "request" );
                    window.history.replaceState( null, null, url );
                // default node selection
                } else {
                    let versions = model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION );
                    let active = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === WF_STATE_ACTIVE );
                    let dev = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === WF_STATE_DEV );
                    let inactive = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === WF_STATE_INACTIVE );
                    // select the first version as starting node ( active -> dev -> inactive ). if no activity was found, take the first workflow
                    let startNode = active || dev || inactive || model.getComponents( model.COMP_TYPE.WORKFLOW )[ 0 ];

                    if ( startNode ){
                        $( document ).trigger( "selectionChanged", [ "controller",  [ startNode ] ] );
                    }
                }
            } );

            // add global actions
            apexActions.add( [ {
                name: M_GO_WORKFLOW,
                label: pd.msg( "WF.GO_TO_WORKFLOW_TREE"),
                action: function() {
                    pd.activateTab( "workflowTree_container" );
                    $( "#workflowTree" ).designerTree( "focus" );
                    return true;
                }
            }, {
                name: M_GO_DIAGRAM,
                label: pd.msg( "WF.GO_TO_DIAGRAM" ),
                action: function() {
                    pd.activateTab( "grid_diagram" );
                    $( "#app" )[ 0 ].diagramBuilder?.focus();
                    return true;
                }
            }, {
                name: M_GO_PROP_EDITOR,
                label: pd.msg( "WF.GO_TO_PROPERTY_EDITOR" ),
                action: function() {
                    pd.activateTab( TAB_NAME_PE_COMP );
                    pe$.propertyEditor( "focus" );
                    return true;
                }
            }, {
                name: M_GO_SHARED,
                label: pd.msg( "WF.GO_TO_USED_SHARED_COMPONENTS" ),
                action: function() {
                    pd.activateTab( TAB_NAME_SHAREDCOMP );
                    $( "#PDsharedCompTree" ).designerTree( "focus" );
                    return true;
                }
            }, {
                name: M_GO_G_ACTIVITIES,
                label: pd.msg( "WF.GO_TO_GALLERY" ),
                action: function() {
                    pd.activateTab( "grid_diagram" );
                    $( "#gallery-tabs" ).tabs( "option", "active", 0 );
                    $( "#gallery-tabs .a-Gallery.a-IconList" ).iconList( "focus" );
                    return true;
                }
            }, {
                name: M_SHOW_SHORTCUTS,
                label: pd.msg( "KBD_SHORTCUTS" ),
                action: function() {
                    let names = [], actions = {};
                    let shortcuts = apexActions.listShortcuts( true );

                    // group shortcuts by action
                    for ( let i = 0; i < shortcuts.length; i++ ) {
                        let sc = shortcuts[i];
                        let action = actions[sc.actionName];
                        if ( !action ) {
                            names.push( sc.actionName );
                            action = {
                                actionLabel: sc.actionLabel,
                                shortcuts: []
                            };
                            actions[ sc.actionName ] = action;
                        }
                        action.shortcuts.push( sc.shortcutDisplay );
                    }

                    actions = {
                        ...actions,
                        ...pd.getDiagramKeyboardShortcuts().reduce( ( acc, curr ) => {
                            let name = curr.label.replace( /\s+/g, "-" ).toLowerCase();
                            let shortcut = curr.displayKey || curr.key;
                            acc[ name ] = {
                                actionLabel: curr.label,
                                shortcuts: shortcut.split( " " ).map( key => apexActions.shortcutDisplay( key, true ) )
                            };
                            return acc;
                        }, {} )
                    };
                    names = Object.keys( actions );

                    // sort by actionLabel
                    names.sort( function( a, b ) {
                        if ( actions[ a ].actionLabel > actions[ b ].actionLabel ) {
                            return 1;
                        } else if ( actions[ a ].actionLabel < actions[ b ].actionLabel ) {
                            return -1;
                        } // else
                        return 0;
                    } );

                    pd.getShortcutsMenuListMarkup( names, actions );
                }
            } ] );

            // the call below clears the previously added shortcuts ( from f4000.designer.js ), so we must add them again
            let bindings = [
                ...apexActions.listShortcuts().reduce( ( acc, curr ) => {
                    acc.push( pd.addBinding( curr.actionName, curr.shortcut ) );
                    return acc;
                }, [] ),
                pd.addBinding( M_SHOW_SHORTCUTS, "Alt+Shift+F1" ),
                pd.addBinding( M_GO_SHARED, "Ctrl+/,S" ),
                pd.addBinding( M_GO_WORKFLOW, "Ctrl+/,W" ),
                pd.addBinding( M_GO_PROP_EDITOR, "Ctrl+/,E" ),
                pd.addBinding( M_GO_DIAGRAM, "Ctrl+/,D" ),
                pd.addBinding( M_GO_G_ACTIVITIES, "Ctrl+/,G,A" )
            ];

            apexActions.setShortcutKeyBindings( bindings );

        }, 1 );

        // handle the "start workflow" region
        startRegion$ = $( "#startRegion" );
        trees$ = $( "#trees" );
        $( document ).on( "modelReady", function(/*  e  */) {
            // if we know that a workflow will be created we don't want to show the create region not even for a second
            if ( !shouldCreateWorkflow ) {
                toggleCreateWorkflowRegion();
            }
        } );

        $( "#helpMenu_menu" ).on( "menucreate", function() {
            let keyboardShortcutsMenu = $( "#helpMenu_menu" ).menu( "find", "keyboardShortcuts" );
            if ( keyboardShortcutsMenu ) {
                keyboardShortcutsMenu.hide   = false;
                keyboardShortcutsMenu.action = M_SHOW_SHORTCUTS;
            }
        } );

        $( "#createWorkflow" ).on( "click" , function ( e ){
            e.preventDefault();
            let startNode = createStartWorkflow();
            toggleCreateWorkflowRegion();
            $( document ).trigger( "selectionChanged", [ "controller",  [ startNode ] ] );
        } );

        model.observer( "PAGE_CONTROLLER", {
            component: { typeIds: [ model.COMP_TYPE.WORKFLOW ] },
            events: [ model.EVENT.CREATE, model.EVENT.DELETE ]
        }, function() {
            toggleCreateWorkflowRegion();
        } );

        // Initialize all the pdPropertyEditor widgets with their corresponding modes
        $( "#peMain" ).pdPropertyEditor( {
            mode: "main"
        } );

    });
})( pe, apex.jQuery, apex.actions, apex.server, apex.env, window.pageDesigner, apex.util, apex.message );