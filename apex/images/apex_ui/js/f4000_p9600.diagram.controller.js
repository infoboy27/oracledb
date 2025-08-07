/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 *
 * This file is the primary controller of the diagram builder; it takes care of the communication between the model and the builder.
 * Creates the builder instance, synchronizes the component selection with the tree - and the property editor, listens ( /observers ) the model changes
 * and ensures that always the actual state of the model is displayed.
 *
 *
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint "comma-dangle": ["error", "never"] */
/* eslint keyword-spacing: ["error", { "before": true, "after": true } ] */
/* global DiagramBuilder */

/**
 * Known Issues:
 * - bug: updating the pl/sql code of an activity ( without opening the editor ) and quickly(!) selecting another activity in the diagram of the same type
 *        sets the value of the newly selected activity's property
 */

( function ( model, $, debug, lang, pd, util, actions ) {
    "use strict";
    $( document ).on( "modelReady", function() {
        const SEL_CONTAINER = "#app",           // selector of the dom element that is used to create the diagram
            SEL_MENU = "#diagramMenu",          // selector of the dome element that is used to create the menu
            DIAGRAM_WIDGET_NAME = "diagram";    // used in transactions / event initiators
        const SELECTION_CHANGED_EVENT = "selectionChanged";
        const MENU_SELECT_EVENT = "diagramMenuSelect";
        // activities that require a special treatment
        const WF_START  = "NATIVE_WORKFLOW_START",
            WF_END     = "NATIVE_WORKFLOW_END",
            WF_WAIT    = "NATIVE_WORKFLOW_WAIT",
            SWITCH     = "NATIVE_WORKFLOW_SWITCH",
            INVOKE_WF  = "NATIVE_INVOKE_WF";
        // the following component types are the links in the diagram builder
        const LINK_TYPES = [ model.COMP_TYPE.WORKFLOW_TRANS, model.COMP_TYPE.WORKFLOW_BRANCH ];
        // these components do not have labels in the diagram
        const NO_LABLE_COMPS = [ WF_START, WF_END, WF_WAIT ];
        // all the represented components in the diagram ( + the version, as that serves as the "base" )
        const COMPONENT_TYPES = [ model.COMP_TYPE.WORKFLOW_VERSION, model.COMP_TYPE.WORKFLOW_ACTIVITY, ...LINK_TYPES ];
        // the key of the attribute on the diagram cells that holds the model id
        const LOCAL_ID = "apexId";
        // diagram toolbar actions
        const ACTIONS = {
            zoomIn: "diagram-zoom-in",
            zoomOut: "diagram-zoom-out",
            showNavigator: "diagram-show-navigator",
            linkNormal: "diagram-link-normal",
            linkOrt: "diagram-link-orthogonal",
            cellToFront: "diagram-cell-to-front",
            cellToBack: "diagram-cell-to-back",
            goToPrevWorkflow: "diagram-prev-workflow"
        };
        // toolbar button actions
        const LINK_BUTTONS = [ ACTIONS.linkNormal, ACTIONS.linkOrt ];
        const COMP_BUTTONS = [ ACTIONS.cellToBack, ACTIONS.cellToFront ];
        // used in the zoom actions
        const ZOOM_STEP = .1;
        // the possible position values in the ELEMENT_CONNECTBUTTON_POINTERUP event
        const TOP = "top", BOTTOM = "bottom", LEFT = "left"; /* RIGHT = "right"; */
        // error indicator setting in the diagram
        const STATUS_ERROR = {
            glyph: "\ue242",
            color: "var(--a-palette-danger)"
        };
        // link designations config
        const LINK_DESIGNATIONS = [ {
            typeId: "ERROR",
            glyph: "\ue317"
        }, {
            typeId: "TIMEOUT",
            glyph: "\ue108"
        } ];
        // static diagram settings
        const DIAGRAM_CONFIG = {
            renderStencil: false,
            drawGrid: true,
            style: {
                toastForegroundContainerCls: "a-WorkflowToast"
            },
            locale: {
                [ DiagramBuilder.Locale.STR_ZOOM_LEVEL ]: msg( "ZOOM_LEVEL" )
            },
            keyboardNavigation: true,
            keyboardNavigationMap: pd.getDiagramKeyboardShortcuts().reduce( ( acc, curr ) => {
                // the key is already registered for an action but another action wants to use it as well - we
                // will merge the actions into an array under the same key
                if ( Object.hasOwn( acc, curr.key ) ) {
                    let value = acc[ curr.key ];
                    value = Array.isArray( value ) ? [ ...value, curr.event ] : [ value, curr.event ];
                    acc[ curr.key ] = value;
                }
                // key not yet found in the map
                else {
                    acc[ curr.key ] = curr.event;
                }
                return acc;
            }, {} ),
            onElementRemoveKeepInboundLinks: true,
            onElementRemoveKeepOutboundLinks: true,
            dropConnectOnLinks: true,
            requireLinkSourceElement: true,
            linkDesignations: LINK_DESIGNATIONS,
            allowConnection: ( sourceEl, targetEl, linkView ) => {
                let sourceComp, linkComponent, isTransition;
                if ( shouldCreateLink ) {
                    return true;
                }
                linkComponent = getComponent( getLocalId( linkView.model ) );
                isTransition = linkComponent.typeId === model.COMP_TYPE.WORKFLOW_TRANS;
                sourceComp = getComponent( getLocalId( sourceEl ) );
                return !( isTransition && sourceComp.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === SWITCH );
            },
            allowDropConnectOnLink: ( viewToBeDroppedOn, droppedView, isDropped ) => {
                if ( isDropped ) {
                    let params = droppedView.model.getBBox();
                    app.attachElementToLink( droppedView.model, viewToBeDroppedOn.model, {
                        point: {
                            x: params.x + params.width / 2,
                            y: params.y + params.height / 2
                        }
                    } );
                    currentTransaction.execute();
                    noHistory = false;
                    currentTransaction = undefined;
                    return false;
                }
                return true;
            },
            allowDropConnectOnPlaceholder: ( viewToBeDroppedOn, droppedView, placeholder, isDropped ) => {
                if ( isDropped ) {
                    let link = viewToBeDroppedOn.model;
                    silentExecute( function() {
                        setLinkTarget( link, droppedView.model.id, false );
                    } );
                }
                return true;
            },
            allowDropConnectOnElement: ( viewToBeDroppedOn, droppedView, isDropped ) => {
                if ( isDropped ) {
                    let sourceEl = viewToBeDroppedOn.model;
                    let el = droppedView.model;
                    noHistory = true;
                    addLink( sourceEl, el );
                    currentTransaction.execute();
                    noHistory = false;
                    currentTransaction = undefined;
                    return false;
                }
                return true;
            }
        };
        // diagram cell properties
        const ALLOW_SOURCE_CHANGE = "allowSourceChange",
            ALLOW_TARGET_CHANGE = "allowTargetChange",
            ALLOW_LINK_OUT = "allowLinkOut",
            ALLOW_LINK_IN = "allowLinkIn",
            ALLOW_REMOVE = "allowRemove",
            HAS_MENU_BUTTON = "hasMenu";
        // misc
        const REDO = "redo", UNDO = "undo";
        const STATE_INACTIVE = "INACTIVE";
        const STATE_DEV = "DEVELOPMENT";
        const TRANSTITION_NORMAL = "NORMAL";
        // default activity alignment
        const DEFAULT_ELEMENT_OPTIONS = {
            verticalAlign: "center",
            horizontalAlign: "center"
        };
        // link router options
        const LINK_ROUTER_ORTHOGONAL = "orthogonal";
        const LINK_ROUTER_NORMAL = "normal";
        const DEFAULT_LINK_ROUTER = LINK_ROUTER_NORMAL;
        // used in the transactions to differentiate the current from the changed data
        const OLD_DATA = "old", NEW_DATA = "new";
        // link position data key
        const LINK_POS_KEY = "pos";
        // link's default setting / transition/bramch default diagram property value
        const DEFAULT_LABEL_POSITION = {
            distance: .5,
            offset: 0
        },
        DEFAULT_LINK_DATA = {
            source: {
                args: {
                    dx: "50%",
                    dy: "50%",
                    rotate: true
                },
                name: "topLeft"
            },
            target: {
                args: {
                    dx: "50%",
                    dy: "50%",
                    rotate: true
                },
                name: "topLeft"
            },
            vertices: [],
            z: 1,
            label: DEFAULT_LABEL_POSITION,
            router: undefined
        };

        // menu entries that displayed in mutliple contexts
        const DIAGRAM_CONFIG_MENU_ENTRIES = [ {
            type: "separator"
        }, {
            type: "subMenu",
            labelKey: msg( "DEF_ROUTER_SETTING" ),
            hide: function() {
                return !currentVersion || ( !!currentVersion && !!menuContext );
            },
            menu: {
                items: [ {
                    type: "radioGroup",
                    set: function( v ) {
                        let version = getCurrentVersionComponent();
                        if ( version ) {
                            let command = getUpdateCommand( {
                                [ currentVersion ]: {
                                    component: version,
                                    defaultRouter: {
                                        [ OLD_DATA ]: version.getProperty( model.PROP.DIAGRAM ).getValue(),
                                        [ NEW_DATA ]: v
                                    }
                                }
                            } );
                            executeCommand( command );
                            app.setDefaultRouter( v );
                        }
                    },
                    get: function() {
                        let version = getCurrentVersionComponent();
                        if ( version ) {
                            return version.getProperty( model.PROP.DIAGRAM ).getValue() || DEFAULT_LINK_ROUTER;
                        }
                    },
                    choices: [ {
                        labelKey: msg( "NORMAL" ),
                        value: DiagramBuilder.Router.NORMAL
                    }, {
                        labelKey: msg( "ORTHOGONAL" ),
                        value: DiagramBuilder.Router.ORTHOGONAL
                    } ]
                } ]
            }
        }, {
            type: "separator"
        }, {
            label: lang.getMessage( "PD.DEL" ),
            type: "action",
            action: function( /* options, focusElement, data */ ){
                let component = getSelectedComponentFromDiagram();
                if ( component ) {
                    removeComponentFromModel( component );
                }
            },
            hide: function() {
                let component = getSelectedComponentFromDiagram();
                if ( !component || !pd.isInactive( component, STATE_DEV ) ) {
                    return true;
                }

                return ![
                    DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN,
                    DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER,
                    DiagramBuilder.Event.LINK_MENUBUTTON_POINTERDOWN,
                    DiagramBuilder.Event.LINK_MENUBUTTON_KEYBOARDTRIGGER
                ].includes( menuContext );
            }
        }  ];
        const hasOwnProperty = util.hasOwnProperty;

        let app,                        // diagram instance
            container$,                 // the diagram instance, jQuery object
            diagramMenu$,               // menu widget for the diagram
            currentVersion,             // the currently displayed version. it let us know when we have to load new data
            showNavigator = false,      // naviagtor visibility state
            menuContext,                // we use one menu widget; to only show the relevant fields, we must know the context ( i.e. what type of a button was clicked in the diagram )
            menuPosition,               // shows which button was pressed on the element, top/bottom/left/right
            selectedCells,              // stores the the selected component ids ( that can be visualised in the diagram ); used after diagram-load
            // various flags
            ignoreSelection = false,    // there's no way to set the selection in the diagram without triggering its onSelectionChange listener. we must ignore it manually
            ignoreEverything = false,   // flag to ignore specific events. it's a manual switch, must be explicitly set to true and false around the function
            ignoreDiagram = false,      // ignore the diagram event
            ignoreModel = false,        // ignore the model event

            shouldCreateLink = false,
            noHistory = false,
            storeFirstTransaction = false,
            detachedLinkId,
            detachedLinkTimer,
            currentTransaction,
            previousVersions = [];

        /**
         * gets the workflow related messages
         *
         * @param {string} key message key
         * @returns string
         */
        function msg( key ) {
            return lang.getMessage( "WF." + key );
        }

        /**
         * executes the provided command/transaction. based on global setting either includes it in the history or not
         *
         * @param {object} command a model transaction
         */
        function executeCommand( command  ) {
            if ( !noHistory || storeFirstTransaction ) {
                if ( storeFirstTransaction ) {
                    storeFirstTransaction = false;
                    noHistory = true;
                }
                apex.commandHistory.execute( command );
            } else {
                command.execute();
            }
        }

        /**
         * creates the "cells" data for the diagram
         *
         * @param {object} version the currently active version
         * @returns array
         */
        function createDiagramData( version ) {
            // the prop values of the components depend on the version state
            let isInteractive = version.getProperty( model.PROP.STATE ).getValue() === STATE_DEV;
            // create the activities data
            let activityData = version.getChilds( model.COMP_TYPE.WORKFLOW_ACTIVITY ).map( activity => getActivityData( activity, isInteractive ) );
            // get all the transitions and branches in the version
            let transitions = [ ...version.getChildrenUntil( model.COMP_TYPE.WORKFLOW_TRANS ), ...version.getChildrenUntil( model.COMP_TYPE.WORKFLOW_BRANCH ) ];
            // create the diagran specific data of it
            let transitionData = transitions.map( ( transition ) => getTransitionData( transition, isInteractive ) );

            return [ ...activityData, ...transitionData ];
        }

        /**
         * creates the diagram specific data from an activity
         *
         * @param {object} activity model component ( model.COMP_TYPE.WORKFLOW_ACTIVITY )
         * @returns object
         */
        function getActivityData( activity, isInteractive ) {
            const processType = activity.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
            return {
                id: activity.id,
                [ LOCAL_ID ]: activity.id,
                [ ALLOW_LINK_OUT ]: isInteractive && processType !== WF_END,
                [ ALLOW_LINK_IN ]: isInteractive && processType !== WF_START,
                [ HAS_MENU_BUTTON ]: isInteractive || processType === INVOKE_WF,
                [ ALLOW_REMOVE ]: isInteractive,
                typeId: processType,
                text: getComponentLabel( activity ),
                statusIcon: activity.hasErrors() ? STATUS_ERROR : "",
                ...parse( activity.getProperty( model.PROP.DIAGRAM ).getValue() )
            };
        }

        /**
         * creates the diagram specific data from a transition/bramch component
         *
         * @param {object} transition model component ( model.COMP_TYPE.WORKFLOW_TRANS, model.COMP_TYPE.WORKFLOW_BRANCH )
         * @returns object
         */
        function getTransitionData( transition, isInteractive ) {
            let targetObj = {},
                labels = [],
                router,
                targetAnchor, // empty object results in error
                sourceAnchor; // empty object results in error

            let isBranch = transition.typeId === model.COMP_TYPE.WORKFLOW_BRANCH;
            // currently we do not have icons for the branch types
            let designation = isBranch ? null : transition.getProperty( model.PROP.TRANSITION_TYPE ).getValue();
            // if branch, the source is the parent
            let sourceId = isBranch ? transition.parentId : transition.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue();
            // the target property ( both branch and transition have it)
            let targetId = transition.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
            // parse the diagram property value
            let coordinates = getTransitionCoordinates( transition.getProperty( model.PROP.DIAGRAM ).getValue() );

            // source anchor setting
            if ( coordinates.source.args ) {
                sourceAnchor = { args: coordinates.source.args, name: coordinates.source.name };
            }

            // if there's a targetId, the link is connected to the an element, enough set the id
            if ( targetId ) {
                targetObj.id = targetId;
            // if there's no id, the link is not connected. if it has target coordinates, use them
            } else if ( coordinates.target.pos ) {
                targetObj = coordinates.target.pos;
            }

            // target anchor setting
            if ( coordinates.target.args ) {
                targetAnchor = { args: coordinates.target.args, name: coordinates.target.name };
            }

            // hide the label of "normal" transitions
            if ( designation !== TRANSTITION_NORMAL ) {
                labels.push( {
                    text: transition.getProperty( model.PROP.NAME ).getValue(),
                    position: coordinates.label
                } );
            }

            // router
            if ( coordinates.router ) {
                router = coordinates.router;
            }

            return {
                id: transition.id,
                [ LOCAL_ID ]: transition.id,
                [ ALLOW_SOURCE_CHANGE ]: isBranch ? false : isInteractive ? true : false,
                [ ALLOW_TARGET_CHANGE ]: isInteractive,
                [ HAS_MENU_BUTTON ]: isInteractive,
                [ ALLOW_REMOVE ]: isInteractive,
                source: {
                    id: sourceId,
                    anchor: sourceAnchor
                },
                target: {
                    ...targetObj,
                    anchor: targetAnchor
                },
                vertices: coordinates.vertices,
                z: coordinates.z,
                labels, designation, router
            };
        }

        /**
         * it tries to create an object of the property value/string
         * if it's empty / the data is invalid ( should never happen ), returns the default link data
         *
         * @param {string} diagramData the content of the model.PROP.DIAGRAM
         * @returns
         */
        function getTransitionCoordinates( diagramData ) {
            return parse( diagramData, DEFAULT_LINK_DATA );
        }

        /**
         * returns the component with the provied id
         * ( it checks across all (three) component types represented in the diagram )
         *
         * @param {string} id apex id
         * @returns object
         */
        function getComponent( id ) {
            // if no id provied, then it'd return all the components of these type.
            // this would be misleading, so if there's no id, we return undefined
            if ( !id ) {
                return undefined;
            }
            return model.getComponentsAdvanced( [ {
                typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                filter: { id }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                filter: { id }
            }, {
                typeId: model.COMP_TYPE.WORKFLOW_BRANCH,
                filter: { id }
            } ] )[ 0 ];
        }

        /**
         * returns the diagram cell with the provided id, regardless of the type
         *
         * @param {string} id diagram-id or local-id
         * @returns object
         */
        function getCell( id ) {
            let cell = getElement( id );
            cell ||= getLink( id );
            return cell;
        }

        /**
         * returns all selected diagram cells
         *
         * @param {array} ids array of the selected component ids
         * @returns array
         */
        function getCells( ids ) {
            return ids.map( getCell );
        }

        /**
         * returns the link from the dialog with the provided id
         *
         * @param {string} id   diagram-id or local-id
         * @returns object
         */
        function getLink( id ) {
            let link = app.getLinkById( id );
            link ||= app.getLinkBy( LOCAL_ID, id );
            return link;
        }

        /**
         * returns the element from the dialog with the provided id
         *
         * @param {string} id diagram-id or local-id
         * @returns object
         */
        function getElement( id ) {
            let element = app.getElementById( id );
            element ||= app.getElementBy( LOCAL_ID, id );
            return element;
        }

        /**
         * set the selection in the diagram
         *
         * @param {string|array|object}| id diagram-id or apexId / diagram cell
         * @param {object} options
         */
        function selectCell( id, options = {} ) {
            let cells = typeof id === "string" ? [ getCell( id ) ] : Array.isArray( id ) ? getCells( id ) : [ id ];
            cells = cells.filter( cell => cell );
            if ( cells.length ) {
                app.requireView();
                app.select( cells, options );
            } else {
                ignoreSelection = false;
                app.deselect();
            }
        }

        /**
         * sets the local id of a diagram element
         *
         * @param {string|object}   unit    id or diagram cell
         * @param {string}          localId apex id
         */
        function setLocalId( unit, localId ) {
            let cell = typeof unit === "string" ? getCell( unit ) : unit;
            return cell.prop( LOCAL_ID, localId );
        }

        /**
         * returns the local id of a diagram cell
         *
         * @param {string|object} cell id or diagram cell
         * @returns string
         */
        function getLocalId( cell ) {
            if ( typeof cell === "string" ) {
                cell = getCell( cell );
            }
            return cell.prop( LOCAL_ID );
        }

        /**
         * returns the links default target position relative to the source element
         *
         * @param {object}  element     link's source element
         * @param {string}  direction   UP|RIGHT|DOWN|LEFT the direction relative to the source element
         * @param {boolean} onlyLink    if true, the link should be shorter
         * @returns object
         */
        function getDefaultLinkPosition( element, direction = BOTTOM, onlyLink ) {
            let linkEndX, linkEndY;
            const LINK_END_DISTANCE = !onlyLink ? 100 : 50;
            const { width, height } = element.size();
            const { x, y } = element.position();
            if ( [ TOP, BOTTOM ].includes( direction ) ) {
                linkEndX = x + width / 2;
                linkEndY = direction === BOTTOM ? y + ( height * 2 ) + LINK_END_DISTANCE : y - height - LINK_END_DISTANCE;
            } else {
                linkEndY = y + height / 2;
                linkEndX = direction === LEFT ? x - LINK_END_DISTANCE - width / 2 : x + LINK_END_DISTANCE + width * 1.5;
            }
            return { x: linkEndX, y: linkEndY };
        }

        /**
         * creates an eleent in the diagram and sets the localId on it
         *
         * @param {string} typeId   element type, in our case it's the model.PROP.PAGE_PROCESS_TYPE
         * @param {object} options  position, alignment
         * @param {string} localId  apex id
         * @returns object
         */
        function addElement ( typeId, options, localId ) {
            let element = app.addElement( typeId, options );
            if ( localId ) {
                app.requireView();
                setLocalId( element, localId );
            }
            app.select( element );
            return element;
        }

        /**
         * creates a link in the diagram and sets the localId on it
         *
         * @param {string}          source source element's id
         * @param {string|object}   target target element's id or coordinates
         * @param {string}          localId  apex id
         * @returns
         */
        function addLink( source, target, localId ) {
            let sourceComponent = getComponent( getLocalId( source ) );
            if ( !sourceComponent ) {
                return;
            }
            let targetElement = typeof target === "string" ? getElement( target ) : target;
            let link = app.addLink( source, ( targetElement ? targetElement : getDefaultLinkPosition( source ) ), {
                [ ALLOW_SOURCE_CHANGE ]: getLinkType( sourceComponent ) !== model.COMP_TYPE.WORKFLOW_BRANCH
            } );
            if ( localId ) {
                app.requireView();
                setLocalId( link, localId );
            }
            return link;
        }

        /**
         *  sets the link's target
         *
         * @param {object}          link    diagram cell
         * @param {string|object}   target  diagram cell or id
         * @param {boolean}         silent  if true, the next diagram event is ignored. in this case the LINK_TARGET_CHANGE
         */
        function setLinkTarget( link, target = {}, silent ) {
            ignoreDiagram = silent;
            let targetElementId = typeof target === "string" ? getElement( target ) : target.id;
            if ( targetElementId ) {
                app.setLinkTarget( link, targetElementId );
            } else {
                app.setLinkTarget( link, target );
            }
        }

        /**
         *  sets the link's source
         *
         * @param {object}          link    diagram cell
         * @param {string|object}   target  diagram cell or id
         * @param {boolean}         silent  if true, the next diagram event is ignored. in this case the LINK_SOURCE_CHANGE
         */
        function setLinkSource( link, source = {}, silent ) {
            ignoreDiagram = silent;
            let sourceElementId = typeof source === "string" ? getElement( source ) : source.id;
            app.setLinkSource( link, sourceElementId ? sourceElementId : "" );
        }

        /**
         * returns the link's target value
         *
         * @param {object} link
         * @returns
         */
        function getLinkTarget( link ) {
            return link.attributes.target;
        }

        /**
         * returns the link's source value
         *
         * @param {object} link
         * @returns
         */
        function getLinkSource( link ) {
            return link.attributes.source;
        }

        /**
         * @todo due to a late change in behavior of the diagram-builder we must use force: true
         * should invesigate and restructure
         *
         * removes a cell from the diagram
         *
         *
         * @param {string|object} unit
         */
        function removeCell( unit ) {
            let cell = typeof unit === "string" ? getCell( unit ) : unit;
            cell.attributes.typeId ? app.removeElement( cell, { force: true} ) : app.removeLink( cell, { force: true } );
        }

        /**
         * based on the component type returns if the link is a transition or branch
         *
         * @param {object} activity model component
         * @returns string
         */
        function getLinkType( activity ) {
            return activity.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === SWITCH ? model.COMP_TYPE.WORKFLOW_BRANCH : model.COMP_TYPE.WORKFLOW_TRANS;
        }

        /**
         * sets the error state of a diagram cell
         *
         * @param {object}  component  model component
         */
        function setErrorState( component ) {
            let cell = getCell( component.id );
            if ( !cell ) {
                return;
            }
            if ( component.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ) {
                if ( component.hasErrors() ) {
                    cell.statusIcon( STATUS_ERROR.glyph );
                    cell.statusIconColor( STATUS_ERROR.color );
                } else {
                    cell.statusIcon( null );
                }
            } else if ( LINK_TYPES.includes( component.typeId ) ) {
                cell.error( component.hasErrors() );
            }
        }

        /**
         * clears and disables the diagram
         *
         * @param {boolean} [center=true] whether to center the paper scroller
         */
        function resetDiagram( center = true ) {
            app.clear( true, center );
            toggleToolbarButtons();
            app.setReadOnly( true );
            currentVersion = undefined;
        }

        /**
         * called in the menu create* actions. creates a link from the currently selected element
         *
         */
        function createLinkMenuAction() {
            let component = getSelectedComponentFromDiagram();
            if ( component ) {
                let typeId = getLinkType( component );
                createComponentInModel( typeId, component );
            }
        }

        /**
         * called in the menu create* actions. creates a component with the provided type in the model
         *
         * @param {string} typeId           the type of the component
         * @param {object} parentComponent  model component
         */
        function createComponentInModel( typeId, parentComponent ) {
            let values = [];
            if ( typeId === model.COMP_TYPE.WORKFLOW_TRANS ) {
                values.push( {
                    id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                    value: parentComponent.id
                } );
            } else if ( typeId === model.COMP_TYPE.WORKFLOW_BRANCH ) {
                values.push( {
                    id: model.PROP.SWITCH_TYPE,
                    value: getSwitchType( parentComponent )
                } );
            }

            let message = model.transaction.message( {
                action:     model.MESSAGE_ACTION.CREATE,
                component:  typeId
            } );
            let transaction = model.transaction.start( "", message );
            let component = new model.Component( {
                previousComponent: parentComponent,
                parentId: parentComponent.id,
                typeId,
                values
            } );
            executeCommand( transaction );
            if ( COMPONENT_TYPES.includes( component.typeId ) ) {
                selectCell( component.id );
            } else {
                triggerSelect( [ component ] );
            }
        }

        /**
         * called in the menu delete action
         *
         * @param {object} component model component
         */
        function removeComponentFromModel( component ) {

            let message = model.transaction.message( {
                action:     model.MESSAGE_ACTION.DELETE,
                component:  component,
                count:      1
            } );
            let transaction = model.transaction.start( "", message );
            component.remove();
            executeCommand( transaction );
        }

        /**
         *
         * @param {object} component model component, activty with type of switch
         * @returns the switch type property's value
         */
        function getSwitchType( component ) {
            return component.getProperty( model.getPluginProperty(  model.COMP_TYPE.PAGE_PROCESS , SWITCH, 1 ).id ).getValue();
        }

        /**
         * returns the selected cells model component.
         * returns undefined if  there is no selecton/multi selection/no component found (<- in this case the data already corrupt)
         *
         * @returns object  model component
         */
        function getSelectedComponentFromDiagram() {
            let diagramSelection = app.getSelection();
            if ( diagramSelection.length !== 1  ) {
                debug.info( "No or multiple cells are selected" );
                return;
            }
            let component = getComponent( getLocalId(  diagramSelection[ 0 ] ) );
            if ( !component ) {
                debug.info( "Component cannot be found" );
                return;
            }
            return component;
        }
        /**
         * wrapper function to silence the errors in case if no / wrong data
         *
         * @param {string} obj
         * @returns object
         */
        function parse( obj, fallback = {} ) {
            try {
                return JSON.parse( obj );
            } catch {
                debug.info( "The provided data is invalid, fallback to default." );
                return fallback;
            }
        }

        /**
         * based on the component type returns if the label should be displayed or not
         * currently only show it for branches and not "normal" transitions
         * ( and most of the activities )
         *
         * @param { object } component
         * @returns boolean
         */
        function showLabel( component ) {
            return ( component.typeId === model.COMP_TYPE.WORKFLOW_BRANCH ||
                ( component.typeId === model.COMP_TYPE.WORKFLOW_TRANS && component.getProperty( model.PROP.TRANSITION_TYPE ).getValue() !== TRANSTITION_NORMAL ) ||
                ( component.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY && !NO_LABLE_COMPS.includes( component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() ) )
            );
        }

        /**
         * this function called from the elements* context menu. it creates a new element connected to the currently selected element
         * the position depends on the menuContext, ie. which menu button was pressed on the selected element
         *
         */
        function createElementOnElement() {
            let elementType = this.id;
            let diagramSelection = app.getSelection();
            // no multi selection support at the moment
            if ( diagramSelection.length !== 1 ) {
                return;
            }
            let sourceElement = diagramSelection[ 0 ];

            currentTransaction = model.transaction.start( DIAGRAM_WIDGET_NAME );
            let link = addLink( sourceElement, getDefaultLinkPosition( sourceElement, menuPosition ) );
            silentExecute( function() {
                // create the element
                let element = addElement( elementType, {
                    ...getLinkTarget( link ),
                    ...DEFAULT_ELEMENT_OPTIONS
                } );
                // now that we have the element and the link created, reset the menuPosition
                menuPosition = undefined;
                // connect the link to the element
                setLinkTarget( link, element.id );
            } );
        }

        /**
         * this function called from the link-placeholder( ie. the button at the end of a link ) menu
         * it creates an element at the position the link points to and connects the link to the newly created element
         */
        function createElementOnLink() {
            let diagramSelection = app.getSelection();
            // no multi selection support at the moment
            if ( diagramSelection.length !== 1 ) {
                return;
            }
            let link = diagramSelection[ 0 ];
            let linkTargetPosition = getLinkTarget( link );
            let elementType = this.id;
            currentTransaction = model.transaction.start( DIAGRAM_WIDGET_NAME );
            // create the activity at the link's target position
            let element = addElement( elementType, {
                ...linkTargetPosition,
                ...DEFAULT_ELEMENT_OPTIONS
            } );
            silentExecute( function() {
                setLinkTarget( link, element.id, false );
            } );
        }

        function createElementInLink() {
            let diagramSelection = app.getSelection();
            if ( diagramSelection.length !== 1 ) {
                return;
            }
            let link = diagramSelection[ 0 ];
            let elementType = this.id;
            currentTransaction = model.transaction.start( DIAGRAM_WIDGET_NAME );
            storeFirstTransaction = true;
            addElement( elementType, {
                addToLink: {
                    link
                },
                ...app.clientToLocalPoint( event ),
                ...DEFAULT_ELEMENT_OPTIONS
            } );
            noHistory = false;
            currentTransaction.execute();
            currentTransaction = undefined;
        }

        /**
         *
         * there are complex actions that consist of multiple transactions / trigger multiple events.
         * this is a wrapper function that executes the provided function ( without storing it in the history )
         * and the started transaction ( currentTransaction )
         *
         */
        function silentExecute( actionFunction ) {
            noHistory = true;
            // update the link
            actionFunction();
            if ( currentTransaction ) {
                currentTransaction.execute();
                currentTransaction = undefined;
            }

            noHistory = false;

        }

        /**
         * prepares the create element menu entries
         *
         * @returns array
         */
        function getMenuActivities() {
            let activities = pd.getWorkflowActivities();
            let activity, entries = [];
            for ( let key in activities ) {
                if ( !hasOwnProperty( activities, key ) ) {
                    continue;
                }
                activity = activities[ key ];
                // start activity can't be a target, so it makes no sense to create through a context menu
                if ( key === WF_START ) {
                    continue;
                }
                entries.push( {
                    id: key,
                    label: activity.title,
                    type: "action",
                    icon: pd.getComponentIconClass( "activity", key ),
                    action: function( options, focusElement, data ) {
                        switch ( data.context ) {
                            case DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_POINTERUP:
                            case DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER:
                                createElementOnElement.call( this );
                                break;
                            case DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_POINTERDOWN:
                            case DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER:
                                createElementOnLink.call( this );
                                break;
                            case DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_POINTERDOWN:
                            case DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER:
                                createElementInLink.call( this );
                                break;
                        }
                    },
                    hide: function() {
                        // end can't have an outgoing link
                        if ( key === WF_END && menuContext === DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_POINTERDOWN ) {
                            return true;
                        }
                        return ![ DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_POINTERUP,
                                DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER,
                                DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_POINTERDOWN,
                                DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER,
                                DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_POINTERDOWN,
                                DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                    }
                } );
            }

            entries.push( {
                type: "separator"
            }, {
                label: lang.getMessage( "PD.WF.CREATE_CONNECTION" ),
                type: "action",
                action: createLinkMenuAction,
                hide: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component || !pd.isInactive( component, STATE_DEV ) ) {
                        return true;
                    }
                    return ![ DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_POINTERUP, DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                }
            } );
            return entries;
        }

        /**
         * prepares the element's context menu entries
         *
         * @returns array
         */
        function getElementContextMenu() {
            return [ {
                label: lang.getMessage( "PD.TREE.DUPLICATE" ),
                type: "action",
                action: function( /* options, focusElement, data */ ){
                    let component = getSelectedComponentFromDiagram();
                    if ( component ) {
                        let message = model.transaction.message( {
                            action:     model.MESSAGE_ACTION.DUPLICATE,
                            component:  component,
                            count:      1
                        } );
                        let transaction = model.transaction.start( "", message );
                        component.duplicate();
                        executeCommand( transaction );
                    }
                },
                hide: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component || !pd.isInactive( component, STATE_DEV ) ) {
                        return true;
                    }
                    return ![ DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN, DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                }
            }, {
                label: lang.getMessage( "PD.WF.CREATE_CONNECTION" ),
                type: "action",
                action: createLinkMenuAction,
                hide: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component || !pd.isInactive( component, STATE_DEV ) || component.getProperty( model.PROP.PAGE_PROCESS_TYPE )?.getValue() === WF_END ) {
                        return true;
                    }
                    return ![ DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN, DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                }
            }, {
                label: msg( "CREATE_ACTIVITY_VARIABLE" ),
                type: "action",
                action: function( /* options, focusElement, data */ ) {
                    let component = getSelectedComponentFromDiagram();
                    if ( component ) {
                        createComponentInModel( model.COMP_TYPE.WORKFLOW_ACT_VAR, component );
                    }
                },
                hide: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component || !pd.isInactive( component, STATE_DEV ) ) {
                        return true;
                    }
                    return ![ DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN, DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                }
            }, {
                type: "separator"
            }, {
                label: msg( "OPEN_WORKFLOW" ),
                type: "action",
                action: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component ) {
                        return;
                    }
                    let workflowDefinitionPropId = model.getPluginProperty( model.COMP_TYPE.WORKFLOW_ACTIVITY, INVOKE_WF, 1 ).id;
                    if ( workflowDefinitionPropId ) {
                        let workflowId = component.getProperty( workflowDefinitionPropId ).getValue();
                        if ( workflowId ) {
                            previousVersions.push( currentVersion );
                            actions.show( ACTIONS.goToPrevWorkflow );
                            $( document ).trigger( SELECTION_CHANGED_EVENT, [ MENU_SELECT_EVENT, ( model.getComponents( model.COMP_TYPE.WORKFLOW, { id: workflowId } ) ) ] );
                        }
                    }
                },
                hide: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component || component.getProperty( model.PROP.PAGE_PROCESS_TYPE )?.getValue() !== INVOKE_WF ) {
                        return true;
                    }
                    return ![ DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN, DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER ].includes( menuContext );
                }
            } ];
        }

        /**
         * opens the menu at the required position
         *
         * @param {object} cell          the cell that initiated the event
         * @param {string} diagramEvent  the fired diagram event. we use this value to know the menu context ( so we can hide/show the menu entries )
         * @param {object} coords        x,y coordinates of the menu position
         * @param {string} position      sent by the diaram. shows where the pressed button is located top|right|bottom|left
         */
        function openMenu( cell, diagramEvent, coords, position ) {
            app.select( cell );
            menuContext = diagramEvent; // needed to hide/show the entries
            menuPosition = position;    // if it's element-placeholder button press, we need to know which button was pressed to position the new element
            diagramMenu$.menu( "toggle", coords.x, coords.y, { context: diagramEvent } );
            // after opening the menu we can reset the value
            menuContext = undefined;
        }

        /**
         * returns the pageX and pageY values from an event
         * ( used for the menu positioning )
         *
         * @param {object} event klick event
         * @returns {object}
         */
        function getCoordsFromEvent( event ) {
            return {
                x: event.pageX,
                y: event.pageY
            };
        }

        /**
         * set the position of the default components created with a new version
         * ( initial layout )
         *
         * @param {array} components array of initialy components. ( it should have 5 elements )
         */
        function setInitialLayout( components ) {
            const linkLength = 240;
            const elWidth = 220;
            const elHeight = 60;
            // get the center of the diagram
            const { x: centerX, y: centerY } = app.getVisibleAreaCenter();
            // filter out the links
            let activities = components.filter( child => child.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY );
            if ( activities.length === 3 ) {
                // left
                activities[ 0 ].getProperty( model.PROP.DIAGRAM ).setValue( JSON.stringify( { position: {
                    x: centerX - linkLength - 60, y: centerY - elHeight / 2
                } } ) );
                // middle
                activities[ 1 ].getProperty( model.PROP.DIAGRAM ).setValue( JSON.stringify( { position: {
                    x: centerX - elWidth / 2, y: centerY - elHeight / 2
                } } ) );
                // right
                activities[ 2 ].getProperty( model.PROP.DIAGRAM ).setValue( JSON.stringify( { position: {
                    x: centerX + linkLength, y: centerY - elHeight / 2
                } } ) );
            }
        }

        /**
         * gets the currently active version component
         *
         * @param {component} start starting component. we check each parent until we find the version | if empty we take the vaue from currentVersion
         * @returns object
         */
        function getComponentsVersion( start ) {
            if ( typeof start === "string" ) {
                return model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { id: start } )[ 0 ];
            } else {
                return getParentOfType( start, model.COMP_TYPE.WORKFLOW_VERSION );
            }
        }

        /**
         * return the currently active version's component from the model. using the value from currentVersion
         *
         * @returns object
         */
        function getCurrentVersionComponent() {
            if ( currentVersion ) {
                let component = model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { id: currentVersion } );
                if ( component.length ) {
                    return component[ 0 ];
                }
            }
            return undefined;
        }

        /**
         * loads the provided version's data in the diagram
         *
         * @param {object} version model component
         */
        function loadDiagram( version ) {
            app.load( {
                cells: createDiagramData( version )
            } );
            currentVersion = version.id;
            app.setDefaultRouter( version.getProperty( model.PROP.DIAGRAM ).getValue() || DEFAULT_LINK_ROUTER );
            app.setReadOnly( version.getProperty( model.PROP.STATE ).getValue() === STATE_INACTIVE  );
        }

        /**
         *
         */
        function getParentOfType( start, type ) {
            let component = start;
            while ( component && component.typeId !== type ) {
                component = component.getParent();
            }
            return component;
        }

        /**
         * from the provided workflow component get the first active / dev / inactive version
         *
         * @param {object} workflow workflow model component
         *
         * @return {object} workflow version component
         */
        function getWorkflowVersion( workflow ) {
            let versions = workflow.getChilds( model.COMP_TYPE.WORKFLOW_VERSION );
            let active = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === "ACTIVE" );
            let dev = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === "DEVELOPMENT" );
            let inactive = versions.find( version => version.getProperty( model.PROP.STATE ).getValue() === "INACTIVE" );
            return active || dev || inactive;
        }

        /**
         * create the diagram related actions
         */
        function createDesignerActions() {
            actions.add( [ {
                name: ACTIONS.zoomIn,
                action: function() {
                    app.zoom( ZOOM_STEP);
                }
            }, {
                name: ACTIONS.zoomOut,
                action: function() {
                    app.zoom( - ZOOM_STEP);
                }
            }, {
                name: ACTIONS.showNavigator,
                label: msg( "ACTION_SHOW_NAVIGATOR" ),
                get: function() {
                    return showNavigator;
                },
                set: function( value ) {
                    value ? app.showNavigator() : app.hideNavigator();
                    showNavigator = !showNavigator;
                }
            }, {
                name: ACTIONS.linkNormal,
                icon: "icon-line-segment-straight",
                get: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component ) {
                        return false;
                    }
                    if ( LINK_TYPES.includes( component.typeId ) ) {
                        return getTransitionData( component )?.router?.name === LINK_ROUTER_NORMAL;
                    }
                    return false;
                },
                set: function( value ) {
                    let state = value ? LINK_ROUTER_NORMAL : undefined;
                    app.getSelection().forEach( x => app.setLinkRouter( x, state ) );
                    setLinkData( app.getSelection() );
                    if ( state ) {
                        actions.update( ACTIONS.linkOrt );
                    }

                }
            }, {
                name: ACTIONS.linkOrt,
                icon: "icon-line-segment-orthogonal",
                get: function() {
                    let component = getSelectedComponentFromDiagram();
                    if ( !component ) {
                        return false;
                    }
                    if ( LINK_TYPES.includes( component.typeId ) ) {
                        return getTransitionData( component )?.router?.name === LINK_ROUTER_ORTHOGONAL;
                    }
                    return false;
                },
                set: function( value ) {
                    let state = value ? LINK_ROUTER_ORTHOGONAL : undefined;
                    app.getSelection().forEach( x => app.setLinkRouter( x, state ) );
                    setLinkData( app.getSelection() );
                    if ( state ) {
                        actions.update( ACTIONS.linkNormal );
                    }
                }
            }, {
                name: ACTIONS.cellToFront,
                icon: "icon-move-to-front",
                action: function(){
                    let isLink, component, selection = app.getSelection();
                    if ( selection.length ) {
                        component = getComponent( getLocalId( selection[ 0 ] ) );
                        if ( component ) {
                            isLink = LINK_TYPES.includes( component.typeId );
                        }

                        selection.forEach( ( cell ) => {
                            cell.toFront();
                        } );

                        if ( isLink ) {
                            setLinkData( selection );
                        } else {
                            setElementData( selection );
                        }
                    }
                }
            }, {
                name: ACTIONS.cellToBack,
                icon: "icon-move-to-back",
                action: function() {
                    let isLink, component, selection = app.getSelection();
                    if ( selection.length ) {
                        component = getComponent( getLocalId( selection[ 0 ] ) );
                        if ( component ) {
                            isLink = LINK_TYPES.includes( component.typeId );
                        }

                        selection.forEach( ( cell ) => {
                            cell.toBack();
                        } );

                        if ( isLink ) {
                            setLinkData( selection );
                        } else {
                            setElementData( selection );
                        }
                    }
                }
            }, {
                name: ACTIONS.goToPrevWorkflow,
                action: function() {
                    let lastWorkflow = previousVersions.pop();
                    if ( lastWorkflow ) {
                        $( document ).trigger( SELECTION_CHANGED_EVENT, [ MENU_SELECT_EVENT, ( model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { id: lastWorkflow } ) ) ] );
                    }
                    if ( previousVersions.length < 1 ) {
                        actions.hide( ACTIONS.goToPrevWorkflow );
                    }
                }
            } ] );
        }

        /**
         * wrapper function around the event listener. checks if one of the ignore* flags set
         *
         * @param {function} eventHanlder the function to execute on the event, if the check pass
         * @returns
         */
        function listenToEvent( eventHanlder ) {
            if ( ignoreEverything || app.isReadOnly() || ignoreDiagram) {
                ignoreDiagram = false;
                return;
            }
            eventHanlder();
        }

        /**
         * takes a diagram element and returns its position in the same format as we store it in the mode ( string )
         *
         * @param {object} element diagram element
         * @returns string
         */
        function getElementPositionStr( element ) {
            return JSON.stringify( { position: element.position(), z: element.attributes.z } );
        }

        /**
         * @todo update / restructure
         *
         * @param {object} link
         * @returns {string}
         */
        function getLinkPositionStr( link ) {
            return JSON.stringify( parseLinkPositionData( link ) );
        }

        /**
         *
         * @param {object} data diagram link attribute link attribute
         * @returns object
         */
        function getLinkPositionData( data ) {
            if ( data.x && data.y ) {
                return {
                    [ LINK_POS_KEY ]: {
                        x: data.x,
                        y: data.y
                    }
                };
            } else {
                return {};
            }
        }

        /**
         * extracts ( and structures ) the relevant data from the link attributes
         *
         * @param {object} link diagram link
         * @returns object
         */
        function parseLinkPositionData( link ) {
            let target = getLinkPositionData( getLinkTarget( link ) );
            target = { ...target, ...getLinkTarget( link ).anchor };
            let source = getLinkPositionData( getLinkSource( link ) );
            source = { ...source, ...getLinkSource( link ).anchor };
            let vertices = link.attributes.vertices || [];
            let router = link.attributes.router;
            // if label exists it's on the 1 position
            let label = link.attributes.labels?.length > 1 ? link.attributes.labels[ 1 ].position : DEFAULT_LABEL_POSITION;
            let z = link.attributes.z;
            return { source, target, vertices, router, z, label  };
        }

        /**
         * compares the diagram data of an element with the model and updates the model if required
         *
         * @param {objact|array} data
         */
        function setElementData( data ) {
            let changes = {}, elements = Array.isArray( data ) ? data : [ data ];
            elements.forEach( ( element ) => {
                let component = getComponent( getLocalId( element ) );
                if ( !component || component.isReadOnly() ) {
                    return;
                }
                // get the currently stored diagram(/position) data from the component
                let componentPosition = component.getProperty( model.PROP.DIAGRAM ).getValue();
                // get the position from the diagram's element
                let elementPosition = getElementPositionStr( element );
                // if they're matching, do not update
                if ( componentPosition !== elementPosition ) {
                    changes[ component.id ] = {
                        component,
                        position: {
                            [ OLD_DATA ]: componentPosition,
                            [ NEW_DATA ]: elementPosition
                        }
                    };
                }
            } );
            if ( Object.keys( changes ).length ) {
                let command = getUpdateCommand( changes );
                executeCommand( command );
            }
        }

        /**
         * returns the value to be displayed in the diagram cells. label -> name
         *
         * @param {object} component model component
         * @returns
         */
        function getComponentLabel( component ) {
            return component.getProperty( model.PROP.ITEM_LABEL )?.getValue() || component.getProperty( model.PROP.NAME )?.getValue();
        }

        /**
         * compares the diagram data of a link with the model and updates the model if required
         *
         * @param {object} link single link or an array of links
         */
        function setLinkData( data ) {
            let changes = {}, links = Array.isArray( data ) ? data : [ data ];
            links.forEach( ( link ) => {
                let oldTargetModelId, newTargetModelId = "",
                oldSourceModelId, newSourceModelId = "";

                // get the compnent
                let component = getComponent( getLocalId( link ) );
                if ( !component || component.isReadOnly() ) {
                    return;
                }
                // get the component id of the target
                let { id: targetElementId } = getLinkTarget( link );
                if ( targetElementId ) {
                    newTargetModelId = getLocalId( targetElementId );
                }

                // get the component id of the source
                let { id: sourceElementId } = getLinkSource( link );
                if ( sourceElementId ) {
                    newSourceModelId = getLocalId( sourceElementId );
                }

                let isTransition = component.typeId === model.COMP_TYPE.WORKFLOW_TRANS;
                // target is coming from the same property
                oldTargetModelId = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
                // it should never change in a case of a branch, but we check for it.
                oldSourceModelId = isTransition ? component.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue() : component.parentId;
                // get the position data
                let modelPosition = component.getProperty( model.PROP.DIAGRAM ).getValue();
                let linkPosition = getLinkPositionStr( link );

                // if there's no change in the positionData nor in the source/target ids, stop here
                if ( areStringifiedObjectsEqual( linkPosition, modelPosition ) && oldTargetModelId === newTargetModelId && ( !isTransition || ( isTransition && oldSourceModelId === newSourceModelId ) ) ) {
                    return;
                }

                changes[ component.id ] = {
                    component,
                    data : {
                        [ OLD_DATA ]: modelPosition,
                        [ NEW_DATA ]: linkPosition
                    }, target: {
                        [ OLD_DATA ]: oldTargetModelId,
                        [ NEW_DATA ]: newTargetModelId
                    }, source: {
                        [ OLD_DATA ]: oldSourceModelId,
                        [ NEW_DATA ]: newSourceModelId
                    }
                };
            } );

            if ( Object.keys( changes ).length ) {
                executeCommand( getUpdateCommand( changes ) );
            }
        }

        /**
         * Checks whether two stringified (json) objects are equal. Ignores properties whose value is null/undefined.
         * @param {string} str1 Stringified object 1
         * @param {string} str2 Stringified object 2
         * @returns {boolean} True or false depending on whether they are equal
         */
        function areStringifiedObjectsEqual( str1, str2 ) {
            // We will remove null/undefined properties as they would trigger a false
            // positive, e.g. in case of "router: null":
            const obj1 = removeBlankProps( JSON.parse( str1 ) );
            const obj2 = removeBlankProps( JSON.parse( str2 ) );
            return DiagramBuilder.Util.isEqual( obj1, obj2 );
        }

        /**
         * Removes properties whose value is either null or undefined. Does not mutate, is not deep. Returns a new object.
         * @param {object} obj
         * @returns {object} New object without blank properties
         */
        function removeBlankProps( obj ) {
            return Object.fromEntries( Object.entries( obj ).filter( ( [ /*k*/, v ] ) => v != null ) );
        }

        /**
         * set up the observers to react to the model changes
         *
         */
        function registerObservers() {

            // observer: component created
            model.observer( DIAGRAM_WIDGET_NAME, {
                component: { typeIds: COMPONENT_TYPES },
                events: [ model.EVENT.CREATE ]
            }, function( notification ) {
                let component = notification.component,
                version = getComponentsVersion( component ),
                cell = getCell( component.id ),
                modelPosition, diagramProperty,
                positionData, elementPosition, sourceId;

                // if a new version is created: set the initial layout ( not on redo/undo )
                if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                    // do not center the diagram after creating a new version
                    resetDiagram( false );
                    // make sure that the diagram is enabled
                    app.setReadOnly( false );
                    let children = component.getAllChildren();

                    if ( notification.action ) {
                        noConsequenceFunctionCall( function() {
                            let transaction = model.transaction.start( "", DIAGRAM_WIDGET_NAME );
                            if ( children.length === 5 ) {
                                setInitialLayout( children );
                            }
                            transaction.execute();
                        } );
                    } else {
                        // we only want to set autolayout on create
                        if ( children.length === 5 ) {
                            setInitialLayout( children );
                        }
                        currentVersion = version.id;
                    }

                }

                // stop, if: the global ignore flag is set / there's not version / the component is created in another version / the diagram cell already exists
                if ( ignoreEverything || !version || ( version && version.id !== currentVersion ) || cell ) {
                    // we possibly end up here after a new element creation in the model initiated by the diagram. we update the diagram elements with the default data from the model
                    if ( ignoreModel ) {
                        ignoreModel = false;
                        if ( showLabel( component ) ) {
                            let label = getComponentLabel( component );
                            component.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ? app.setElementText( cell, label ) : app.setLinkLabel( cell, label );
                        }
                    }
                    return;
                }

                ignoreDiagram = true;
                switch ( component.typeId ) {
                    case model.COMP_TYPE.WORKFLOW_ACTIVITY:
                        // when version is created, we update the position ( diagram property ) of the child activities ( setInitLayout call above),
                        // but the change is not present in the notification ( as it is created before )
                        // that's why we check in this situation if the two data match
                        elementPosition = component.getProperty( model.PROP.DIAGRAM ).getValue();
                        diagramProperty = getComponent( component.id ).getProperty( model.PROP.DIAGRAM );
                        modelPosition = diagramProperty.getValue();
                        if ( elementPosition !== modelPosition ) {
                            elementPosition = modelPosition;
                        }
                        elementPosition = parse( elementPosition );
                        cell = addElement( component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue(), {
                            text: component.getProperty( model.PROP.NAME ).getValue(),
                            ...elementPosition.position
                        }, component.id );

                        // populate the diagram property of the component, not on redo/undo!
                        if ( !notification.action ) {
                            diagramProperty.setValue( getElementPositionStr( cell ) );
                        }

                        setErrorState( cell );

                        break;
                    case model.COMP_TYPE.WORKFLOW_TRANS:
                        sourceId = component.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue();
                        // falls through
                    case model.COMP_TYPE.WORKFLOW_BRANCH:
                        // in case of a branch, the parent id is the "from"
                        sourceId ||= component.parentId;
                        positionData = parse( component.getProperty( model.PROP.DIAGRAM ).getValue() );
                        // create the link
                        cell = createLinkFromModel( component, sourceId, positionData );

                        // populate the diagram property of the component, not on redo/undo!
                        if ( !notification.action ) {
                            getComponent( component.id )?.getProperty( model.PROP.DIAGRAM ).setValue( getLinkPositionStr( cell ) );
                        }

                        break;
                }

            } );

            // observer: component updated
            model.observer( DIAGRAM_WIDGET_NAME, {
                component: { typeIds: COMPONENT_TYPES },
                events: [ model.EVENT.CHANGE ],
                properties: [
                    model.PROP.FROM_WORKFLOW_ACTIVITY,
                    model.PROP.TO_WORKFLOW_ACTIVITY,
                    model.PROP.TRANSITION_TYPE,
                    model.PROP.PAGE_PROCESS_TYPE,
                    model.PROP.NAME,
                    model.PROP.ITEM_LABEL,
                    model.PROP.STATE
                ]
            }, function( notification ) {
                let component = notification.component, element, link, source, target, state;

                function changed( propertyId ) {
                    let propEvents = notification.properties[ propertyId ];
                    return propEvents && propEvents.includes( "change" );
                }

                if ( !container$.is( ":visible" ) || ignoreModel || ignoreEverything ) {
                    ignoreModel = false;
                    return;
                }

                // react on the version state change
                if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION && component.id === currentVersion && changed( model.PROP.STATE ) ) {
                    toggleToolbarButtons( component );
                    state = component.getProperty( model.PROP.STATE ).getValue();
                    // enable/disable the region
                    app.setReadOnly( state === STATE_INACTIVE );
                    let isInteractive = state === STATE_DEV;
                    component.getAllChildren().forEach( ( child ) => {
                        if ( LINK_TYPES.includes( child.typeId ) ) {
                            link = getCell( child.id );
                            if ( link ) {
                                link.prop( ALLOW_SOURCE_CHANGE, isInteractive );
                                link.prop( ALLOW_TARGET_CHANGE, isInteractive );
                                link.prop( HAS_MENU_BUTTON, isInteractive );
                                link.prop( ALLOW_REMOVE, isInteractive );
                            }
                        } else if ( child.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ) {
                            element = getCell( child.id );
                            if ( element ) {
                                let processType = child.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                                if ( processType !== WF_END ) {
                                    element.prop( ALLOW_LINK_OUT, isInteractive );
                                }

                                if ( processType !== WF_START ) {
                                    element.prop( ALLOW_LINK_IN, isInteractive );
                                }
                                element.prop( ALLOW_REMOVE, isInteractive );
                                element.prop( HAS_MENU_BUTTON, isInteractive || processType === INVOKE_WF );
                            }
                        }
                    } );
                    return;
                }

                if ( detachedLinkTimer && detachedLinkId === component.id ) {
                    clearTimeout( detachedLinkTimer );
                    detachedLinkId = undefined;
                }

                component = getComponent( component.id );
                if ( !component?.typeId ) {
                    return;
                }

                switch ( component.typeId ) {
                    case model.COMP_TYPE.WORKFLOW_ACTIVITY:
                        element = getElement( component.id );
                        // is the process type changed
                        if ( changed( model.PROP.PAGE_PROCESS_TYPE ) ) {
                            // type change is handled in the diagram and it is a complex process ( remove the current element(+links), recreate the element of the new type, ... )
                            // we must ignore all "side" events during this process
                            noConsequenceFunctionCall( () => {
                                app.changeElementType( element, component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() );
                            } );
                            // reselect the element as the previous reference is obsolote
                            element = getCell( component.id );
                        }

                        // on undo/redo could happen that we change from a no-label component to a label-component
                        // also a process type can switch from a no-label component to a label-component
                        if ( ( changed( model.PROP.ITEM_LABEL ) || changed( model.PROP.NAME ) ) || ( showLabel( component ) && ( notification.action || changed( model.PROP.PAGE_PROCESS_TYPE ) ) ) ) {
                            app.setElementText( element, getComponentLabel( component ) );
                        }
                        break;
                    case model.COMP_TYPE.WORKFLOW_TRANS:
                        // in case of a transition the source component is defined in a property
                        // @todo basically the FOM_WORKFLOW_ACTIVITY property value sets the parent element, so the parentId should always be the same
                        source = component.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue();
                        // falls through
                    case model.COMP_TYPE.WORKFLOW_BRANCH:
                        source ||= component.parentId;
                        target = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
                        target ||= getTransitionCoordinates( component.getProperty( model.PROP.DIAGRAM ).getValue() )?.target?.pos;
                        link = getLink( component.id );
                        // leave if we can't find the link
                        if ( !link ) {
                            return;
                        }
                        // if there's a target id ( and its value has changed ), update the target
                        if ( changed( model.PROP.TO_WORKFLOW_ACTIVITY ) ) {
                            if ( target ) {
                                let linkTarget = app.getLinkTarget( link );
                                if ( linkTarget && hasOwnProperty( linkTarget, "id" ) ) {
                                    if ( linkTarget.id !== getCell( target )?.id ) {
                                        setLinkTarget( link, target, true );
                                    }
                                } else if ( link.attributes?.target?.x !== target.x || link.attributes?.target?.y !== target.y ) {
                                    setLinkTarget( link, target, true );
                                }
                            } else {
                                setLinkTarget( link, target, true );
                            }
                        }
                        // set the source; it can't( /shouldn't! ) be ever null / coordinates
                        if ( changed( model.PROP.FROM_WORKFLOW_ACTIVITY ) ) {
                            if ( source ){
                                let linkSource = app.getLinkSource( link );
                                if ( linkSource && hasOwnProperty( linkSource, "id" ) ) {
                                    if ( linkSource.id !== source ) {
                                        setLinkSource( link, source, true );
                                    }
                                } else {
                                    setLinkSource( link, source, true );
                                }
                            } else {
                                setLinkSource( link, source, true );
                            }
                        }
                        // set the label
                        if ( changed( model.PROP.NAME ) && showLabel( component ) ) {
                            app.setLinkLabel( link, component.getProperty( model.PROP.NAME ).getValue() );
                        }
                        // set the link type ( designation )
                        if ( changed( model.PROP.TRANSITION_TYPE ) ) {
                            app.setLinkDesignation( link, component.getProperty( model.PROP.TRANSITION_TYPE ).getValue() );
                            // check if the new link type has a label or not
                            if ( showLabel( component ) ) {
                                app.setLinkLabel( link, component.getProperty( model.PROP.NAME ).getValue() );
                            } else {
                                app.removeLinkLabel( link );
                            }
                        }
                        break;
                }
            } );

            // observer: component removed
            model.observer( DIAGRAM_WIDGET_NAME, {
                component: { typeIds: COMPONENT_TYPES },
                events: [ model.EVENT.DELETE ]
            }, function( notification ) {
                let component = notification.component,
                    version = getComponentsVersion( component ),
                    cell;

                if ( ignoreEverything || !currentVersion || ( version && version.id !== currentVersion ) || ignoreModel) {
                    ignoreModel = false;
                    return;
                }

                // if it's version delete, we do not have to deal with the children components, the model takes care of them
                if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                    resetDiagram();
                    return;
                }

                cell = getCell( component.id );
                if ( cell ) {
                    noConsequenceFunctionCall( () => {
                        let targets = app.getLinks().filter( link => getLinkTarget( link )?.id === cell.id );
                        targets.forEach( ( link ) => {
                            setLinkTarget( link, cell.position() );
                            let component = getComponent( getLocalId( link ) );
                            if ( component ) {
                                if ( !notification.action ) {
                                    component.getProperty( model.PROP.DIAGRAM ).setValue( getLinkPositionStr( link ) );
                                } else {
                                    detachedLinkId = component.id;
                                    detachedLinkTimer = setTimeout( function(){
                                        silentExecute( function() {
                                            setLinkData( link );
                                        } );
                                    }, 1 );
                                }
                            }
                        } );
                        removeCell( cell );
                    } );
                }
            } );

            // observer: component has error/warning
            model.observer( DIAGRAM_WIDGET_NAME, {
                component: { typeIds: COMPONENT_TYPES },
                events: [ model.EVENT.ERRORS, model.EVENT.NO_ERRORS, model.EVENT.WARNINGS, model.EVENT.NO_WARNINGS, model.EVENT.VALIDATE_COMPONENT ]
            }, function( notification ) {
                let component = notification.component;
                setErrorState( component );
            } );
        }

        /**
         * all events will be ignored around the provided callback function call
         *
         * @param {function} callback function to be executed
         */
        function noConsequenceFunctionCall( callback ) {
            ignoreEverything = true;
            callback.call();
            ignoreEverything = false;
        }

        /**
         * returns the anchor data from a link transation change object
         *
         * @param {object} data change data from a transaction
         * @param {string} end  which end of the link source|target
         * @returns
         */
        function getAnchorData( data, end ) {
            return data.args && data.name ? { name: data.name, args: data.args } : DEFAULT_LINK_DATA[ end ];
        }

        /**
         * this function is called in the transactions context. executes all the transaction changes in the diagram
         *
         * @param {string} direction show the change direction undo|redo
         */
        function executeChange( direction ) {
            // shows which version should we use to update the diagram
            let dataVersion = direction === UNDO ? OLD_DATA : NEW_DATA;

            for ( let componentId in this.changes ) {
                if ( !hasOwnProperty( this.changes, componentId ) ) {
                    continue;
                }
                let change = this.changes[ componentId ];
                let component = change.component;
                if ( component.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ) {
                    let element = getElement( component.id );
                    let diagram = parse( change.position[ dataVersion ] );
                    let { z, position } = diagram;
                    app.setCellZIndex( element, ( z ?? 0 ) );
                    if ( position ) {
                        element.position( position.x, position.y );
                    }
                } else if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                    if ( component.id === currentVersion ) {
                        app.setDefaultRouter( change.defaultRouter[ dataVersion ] || DEFAULT_LINK_ROUTER );
                    }
                } else {
                    let link = getLink( component.id );
                    let data = parse( change.data[ dataVersion ] , DEFAULT_LINK_DATA );
                    let anchorData;

                    if ( data.vertices ) {
                        app.setLinkVertices( link, data.vertices );
                    }
                    if ( data.label && showLabel( component ) ) {
                        app.setLinkLabel( link, component.getProperty( model.PROP.NAME ).getValue(), { position: data.label, rewrite: true } );
                    }

                    // update the router
                    const currRouterName = app.getLinkRouter( link )?.name;
                    const newRouterName = data.router?.name;
                    if ( currRouterName !== newRouterName ) {
                        app.setLinkRouter( link, newRouterName );
                        const selection = app.getSelection();
                        if ( selection.length === 1 ) {
                            const selComponent = getComponent( getLocalId( selection[ 0 ] ) );
                            // If we have the affected link selected, keep the routing buttons in sync with the router
                            if ( selComponent === component && LINK_TYPES.includes( component.typeId ) ) {
                                LINK_BUTTONS.forEach( actionName => {
                                    const btn$ = $( `[data-action=${actionName}]` );
                                    btn$[ actionName.includes( newRouterName ) ? "addClass" : "removeClass" ]( "is-active" );
                                } );
                            }
                        }
                    }

                    // set z on the link
                    app.setCellZIndex( link, ( data.z ?? 0 ) );

                    if ( hasOwnProperty( data.source, LINK_POS_KEY ) ) {
                        app.setLinkSource( link, data.source.pos );
                    } else {
                        setLinkSource( link, change.source[ dataVersion ] );
                        anchorData = getAnchorData( data.source, "source" );
                        app.setLinkSourceAnchor( link, anchorData );
                    }

                    if ( hasOwnProperty( data.target, LINK_POS_KEY ) ) {
                        app.setLinkTarget( link, data.target.pos );
                    } else {
                        setLinkTarget( link, change.target[ dataVersion ] );
                        anchorData = getAnchorData( data.target, "target" );
                        app.setLinkTargetAnchor( link, anchorData );
                    }
                }
            }
        }

        const updateComponentCommand = $.extend( apex.commandHistory.baseCommand(), {
            execute: function() {
                this.transaction = !currentTransaction ? model.transaction.start( DIAGRAM_WIDGET_NAME ) : currentTransaction;
                this.updateDataLayer();
            },
            updateDataLayer: function() {
                let changes = this.changes;
                // this.transaction = model.transaction.start( DIAGRAM_WIDGET_NAME );
                for ( let componentId in changes ) {
                    if ( !hasOwnProperty( changes, componentId ) ) {
                        continue;
                    }
                    let change = changes[ componentId ];
                    let component = change.component;
                    if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                        component.getProperty( model.PROP.DIAGRAM ).setValue( change.defaultRouter.new );
                    } else {
                        // set the position data. we don't have to set the ignore flag, as we do not listen to the diagram property changes
                        component.getProperty( model.PROP.DIAGRAM ).setValue( component.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ? change.position.new : change.data.new );
                        // update the other properties. only set the ignoreModel flag if we do change one of the values. ( otherwise it would stay true -> we would ignore am other event )
                        let targetProperty = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY );
                        if ( targetProperty && change.target.new !== change.target.old ) {
                            ignoreModel = true;
                            targetProperty.setValue( change.target.new );
                        }
                        let sourceProperty = component.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY );
                        if ( sourceProperty && change.source.new !== change.source.old ) {
                            ignoreModel = true;
                            sourceProperty.setValue( change.source.new );
                        }
                    }
                }

                if ( !currentTransaction ){
                    this.transaction.execute();
                }
            },
            undo: function() {
                // we manually restore everything in the diagram, the transaction takes care of the model -> no need to react to any event
                noConsequenceFunctionCall( () => {
                    if ( this.version === currentVersion ) {
                        executeChange.call( this, UNDO );
                    }
                    this.transaction.undo();
                } );
            },
            redo: function() {
                // we manually redo everything in the diagram, the transaction takes care of the model -> no need to react to any event
                noConsequenceFunctionCall( () => {
                    if ( this.version === currentVersion ) {
                        executeChange.call( this, REDO );
                    }
                    this.transaction.redo();
                } );
            },
            label: function() {
                return this._label;
            }
        } );

        function getUpdateCommand( changes ) {
            let message, self = Object.create( updateComponentCommand );
            self.version = currentVersion;
            self.changes = changes;
            if ( Object.keys( changes ).length === 1 ) {
                let component = changes[ Object.keys( changes )[ 0 ] ].component;
                if ( component ) {
                    if ( component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                        message = component.getProperty( model.PROP.WORKFLOW_VERSION ).getValue();
                    } else {
                        message = component.getProperty( model.PROP.NAME ).getValue();
                    }
                }
            }
            self._label = `${ lang.getMessage( "PD.WF.UPDATE" ) } ${ ( message || lang.getMessage( "MODEL.MULTIPLE_COMPONENTS" ) ) }`;
            return self;
        }

        const createComponentCommand = $.extend( apex.commandHistory.baseCommand(), {
            execute: function() {
                this.transaction = !currentTransaction ? model.transaction.start( DIAGRAM_WIDGET_NAME ) : currentTransaction;
                this.updateDataLayer();
            },
            updateDataLayer: function() {
                let component, parentComponent, targetComponentId;
                ignoreModel = true;
                if ( LINK_TYPES.includes( this.change.typeId ) ) {
                    let link = getLink( this.change.elementId );
                    let parentComponentId = getLocalId( getLinkSource( link ).id );
                    // get the links target
                    let target = getLinkTarget( link );
                    // if it's an id, get the element
                    if ( target && target.id ) {
                        targetComponentId = getElement( target.id );
                    }
                    // regardless of the component, store the diagram property
                    let values = [ {
                        id: model.PROP.DIAGRAM,
                        value: JSON.stringify( this.change.diagramData )
                    } ];
                    // if there's a target element store it in the model
                    if ( targetComponentId ) {
                        values.push( {
                            id: model.PROP.TO_WORKFLOW_ACTIVITY,
                            value: getLocalId( targetComponentId )
                        } );
                    }

                    if ( this.change.typeId === model.COMP_TYPE.WORKFLOW_TRANS ) {
                        component = new model.Component( {
                            previousComponent: "last",
                            typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                            parentId: parentComponentId,
                            values: [ ...values, {
                                id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                                value: parentComponentId
                            } ]
                        } );
                    } else  {
                        // for a branch, we need to know the switch type of the parent activity
                        parentComponent = getComponent( parentComponentId );
                        component = new model.Component( {
                            previousComponent: "last",
                            typeId: model.COMP_TYPE.WORKFLOW_BRANCH,
                            parentId: parentComponentId,
                            values: [ ...values, {
                                id: model.PROP.SWITCH_TYPE,
                                value: getSwitchType( parentComponent )
                            } ]
                        } );
                    }
                    // set the component's id on the diagram element
                    setLocalId( link.id, component.id );
                } else {
                    component = new model.Component( {
                        previousComponent: "last",
                        typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                        parentId: currentVersion,
                        values: [ {
                            id: model.PROP.PAGE_PROCESS_TYPE,
                            value: this.change.typeId
                        }, {
                            id: model.PROP.DIAGRAM,
                            value: JSON.stringify( this.change.diagramData )
                        } ]
                    } );
                    // set the component's id on the diagram element
                    setLocalId( this.change.elementId, component.id );
                }

                if ( !currentTransaction ){
                    this.transaction.execute();
                }
                // as the diagram is already selected the component when it was created the selectCell would be ignored
                // ( ^ it's not true for drop ) so we have to manually trigger the selection on the document
                selectCell( component.id );
                triggerSelect( [ component ] );
            },
            undo: function() {
                toggleToolbarButtons();
                this.moveInHistory( UNDO );
            },
            redo: function() {
                toggleToolbarButtons();
                this.moveInHistory( REDO );
            },
            moveInHistory: function( direction ) {
                let componentTypes = this.transaction.components;
                noConsequenceFunctionCall( () => {
                    this.transaction[ direction ].call( this.transaction );
                    if ( this.version === currentVersion ) {
                        for ( let typeId in componentTypes ) {
                            if ( !hasOwnProperty( componentTypes, typeId ) || ( hasOwnProperty( componentTypes, typeId ) && !COMPONENT_TYPES.includes( typeId ) ) ) {
                                continue;
                            }
                            let components = componentTypes[typeId];
                            for ( let componentId in components ) {
                                if ( !hasOwnProperty( components, componentId ) ) {
                                    continue;
                                }
                                if ( direction === UNDO ) {
                                    if ( !components[ componentId ].oldComponent ) {
                                        removeCell( componentId );
                                    } else {
                                        let component = components[ componentId ].oldComponent;
                                        let target = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
                                        target ||= getTransitionCoordinates( component.getProperty( model.PROP.DIAGRAM ).getValue() )?.target?.pos;
                                        let link = getLink ( componentId );
                                        setLinkTarget( link, target, null );
                                    }
                                } else {
                                    let component = components[ componentId ].newComponent;
                                    if ( !components[ componentId ].oldComponent ) {
                                        createDiagramCell( component );
                                    } else {
                                        let target = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
                                        target ||= getTransitionCoordinates( component.getProperty( model.PROP.DIAGRAM ).getValue() )?.target?.pos;
                                        let link = getLink ( componentId );
                                        setLinkTarget( link, target, null );
                                    }
                                }
                            }
                        }
                    }
                } );
            },
            label: function() {
                return this._label;
            }
        } );

        function getCreateCommand( typeId, diagramData, elementId, sourceId ) {
            let self = Object.create( createComponentCommand );
            self.version = currentVersion;
            self.typeId = typeId;
            self.diagramData = diagramData;
            self.change = { typeId, diagramData, elementId, sourceId };
            self.element = elementId;
            self._label = lang.getMessage( "PD.WF.CREATE" );
            return self;
        }

        function getDeleteCommand( id ) {
            let self = Object.create( gridDeleteCommand );
            self.version = currentVersion;
            self.component = getComponent( id );
            self.typeId = self.component.typeId;
            self.id = id;
            self.change = { typeId: self.typeId, id };
            self._label = lang.getMessage( "PD.WF.REMOVE" );
            return self;
        }

        const gridDeleteCommand = $.extend( apex.commandHistory.baseCommand(), {
            execute: function() {
                this.transaction = !currentTransaction ? model.transaction.start( DIAGRAM_WIDGET_NAME ) : currentTransaction;
                this.updateDataLayer();
            },
            updateDataLayer: function() {
                ignoreModel = true;
                this.component.remove();
                if ( !currentTransaction ){
                    this.transaction.execute();
                }
            },
            undo: function() {
                toggleToolbarButtons();
                this.transaction.undo();
            },
            redo: function() {
                toggleToolbarButtons();
                this.transaction.redo();
            },
            moveInHistory: function( direction ) {
                let componentTypes = this.transaction.components;
                noConsequenceFunctionCall( () => {
                    if ( this.version === currentVersion ) {
                        for ( let typeId in componentTypes ) {
                            if ( !hasOwnProperty( componentTypes, typeId ) ) {
                                continue;
                            }
                            let components = componentTypes[typeId];
                            for ( let componentId in components ) {
                                if ( !hasOwnProperty( components, componentId ) ) {
                                    continue;
                                }
                                let component = components[ componentId ];
                                if ( component.operation === "delete" ) {
                                    if ( direction === REDO ) {
                                        removeCell( componentId );
                                    } else {
                                        let component = components[ componentId ].oldComponent;
                                        createDiagramCell( component );
                                    }
                                }

                            }
                        }
                    }
                    this.transaction[ direction ].call( this.transaction );
                } );
            },
            label: function () {
                return this._label;
            }
        } );

        /**
         * creates a transition/branch from the diagram link cell
         *
         * @param {object} link a diagram link cell
         */
        function createLink( link ) {
            let sourceComponent = getComponent( getLocalId( getLinkSource( link ).id ) );
            // link can't be created without a source element
            if ( !sourceComponent ) {
                return;
            }
            let data = parseLinkPositionData( link );
            let typeId = getLinkType( sourceComponent );
            let command = getCreateCommand( typeId, data, link.id, sourceComponent.id );
            executeCommand( command );
        }

        /**
         * listener on the link-source-change and link-target-change event
         * ( it's either updates the link immediately or sets the listener )
         *
         * @param {object} current  diagram link element
         * @param {object} detail   details of the event that triggered this function
         */
        function linkChangeListener( current, detail ) {
            listenToEvent( () => {
                // only set the mouseup listener if it's an anchor position change
                // ( the position changes saved in the pointerUp listener )
                if ( !shouldCreateLink && current && detail && hasOwnProperty( detail, "id" ) && !hasOwnProperty( detail, "anchor" ) ) {
                    // an update from the diagram
                    setLinkData( current );
                }
            } );
        }

        /**
         * creates a diagram link from the component data
         * @todo get the source id and model data in here
         *
         * @param {object} component        model component
         * @param {string} sourceElementId  the id of the source component
         * @param {object} modelData        link attributes
         * @returns
         */
        function createLinkFromModel( component, sourceElementId, modelData ) {

            let target = component.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue();
            let sourceElement = getElement( sourceElementId );
            let anchorData;

            // if there's a position data and no target(id), then the link is not attached to any element. it must be coordinates
            if ( hasOwnProperty( modelData, "target" ) && !target ) {
                target = modelData.target.pos;
            }

            // it should be true only if an element is created from an element
            if ( !target && menuPosition ) {
                target = getDefaultLinkPosition( sourceElement, menuPosition, true );
            }

            // create the link
            let link = addLink( sourceElement, target, component.id );

            // set the label
            if ( showLabel( component ) ) {
                app.setLinkLabel( link, component.getProperty( model.PROP.NAME ).getValue() );
            }

            // source anchors
            if ( modelData?.source && Object.keys( modelData.source ).length ) {
                ignoreDiagram = true;   // silence the listener
                anchorData = getAnchorData( modelData.source, "source" );
                app.setLinkSourceAnchor( link, anchorData );
            }

            // target anchors
            if ( modelData?.target && Object.keys( modelData.target ).length ) {
                ignoreDiagram = true;   // silence the listener
                anchorData = getAnchorData( modelData.target, "target" );
                app.setLinkTargetAnchor( link, anchorData );
            }

            // vertices
            if ( modelData?.vertices && modelData.vertices.length ) {
                ignoreDiagram = true; // silence the listener
                app.setLinkVertices( link, modelData.vertices );
            }

            return link;
        }

        function createDiagramCell( component ) {
            let positionData, elementPosition, sourceId;
            switch ( component.typeId ) {
                case model.COMP_TYPE.WORKFLOW_ACTIVITY:
                    elementPosition = component.getProperty( model.PROP.DIAGRAM ).getValue();
                    if ( elementPosition ) {
                        elementPosition = parse( elementPosition );
                    }

                    addElement( component.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue(), {
                        text: component.getProperty( model.PROP.NAME ).getValue(),
                        ...elementPosition.position
                    }, component.id );

                    break;
                case model.COMP_TYPE.WORKFLOW_TRANS:
                    sourceId = component.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue();
                    // falls through
                case model.COMP_TYPE.WORKFLOW_BRANCH:
                    // in case of a branch, the parent id is the "from"
                    sourceId ||= component.parentId;
                    positionData = parse( component.getProperty( model.PROP.DIAGRAM ).getValue() );
                    // if there's a position data and no target(id), then the link is not attached, the target must be coordinates
                    createLinkFromModel( component, sourceId, positionData );

                    break;
            }
        }

        /**
         * triggers selection on the document with a list of selected components
         *
         * @param {array} components array of components
         */
        function triggerSelect( components ) {
            $( document ).trigger( SELECTION_CHANGED_EVENT, [ DIAGRAM_WIDGET_NAME, components ] );
        }

        /**
         *
         *
         * @param {object|null} components array of selected model components or null
         * @returns
         */
        function toggleToolbarButtons( components ) {
            // disable everything first
            [ ...LINK_BUTTONS, ...COMP_BUTTONS ].forEach( button => actions.disable( button ) );
            // leave if no component selected, or at least one component is from an inactive version
            if ( !components?.length || ( components?.length && components.some( comp => getComponentsVersion( comp ).getProperty( model.PROP.STATE ).getValue() === STATE_INACTIVE ) ) ) {
                return;
            }
            COMP_BUTTONS.forEach( button => actions.enable( button ) );
            // enable only if all selected components are links from the current version
            let linkAction = components.every( comp => LINK_TYPES.includes( comp.typeId ) && getComponentsVersion( comp )?.id === currentVersion ) ? actions.enable : actions.disable;
            LINK_BUTTONS.forEach( button => linkAction( button ) );
        }

        $( document ).on( SELECTION_CHANGED_EVENT, function( event, source, modelComponents, nodes = [] ) {
            let workflow, currentWorkflow, version, selectedComponentIds = [];
            // the selection is triggered by the diagram
            if ( source === DIAGRAM_WIDGET_NAME ) {
                toggleToolbarButtons( modelComponents.filter( comp => [ ...LINK_TYPES, model.COMP_TYPE.WORKFLOW_ACTIVITY ].includes( comp.typeId ) ) );
                return;
            }
            // if the root node selected, clear the diagram;
            if ( nodes.length === 1 && !nodes[ 0 ]._parent ) {
                resetDiagram();
                return;
            }

            // filter out the not supported components and store the component ids
            selectedComponentIds.push( ...modelComponents.filter( comp => comp && COMPONENT_TYPES.includes( comp.typeId ) ).reduce( ( acc, curr ) => {
                acc.push( curr.id );
                return acc;
            }, [] ) );

            if ( !selectedComponentIds.length ) {
                // it happens when a link in the error-message dialog was clicked ( it's the property number then )
                if ( typeof nodes === "number" ) {
                    workflow = modelComponents.find( comp => comp.typeId === model.COMP_TYPE.WORKFLOW );
                    if ( !workflow ) {
                        let comp = modelComponents[ 0 ];
                        while ( comp && comp.typeId !== model.COMP_TYPE.WORKFLOW ) {
                            if ( [ model.COMP_TYPE.WORKFLOW_ACTIVITY, model.COMP_TYPE.WORKFLOW_VERSION ].includes( comp.typeId ) ) {
                                version = comp.typeId === model.COMP_TYPE.WORKFLOW_VERSION ? comp : comp.getParent();
                                break;
                            }
                            comp = comp.getParent();
                        }
                        if ( !version && comp ) {
                            workflow = comp;
                        }
                    }
                } else {
                    // figure out which is the active workflow ( in case of multiselect, we go with the first one)
                    // is a workflow node selected
                    workflow = modelComponents.find( comp => comp.typeId === model.COMP_TYPE.WORKFLOW );
                    // if not, could be a non-model node was clicked ( e.g. parameters, variables ) in a workflow
                    if ( !workflow ) {
                        // get the parent worflow node
                        let node = nodes [ 0 ];
                        while ( node && node.data?.typeId !== model.COMP_TYPE.WORKFLOW ) {
                            // if among the parents we find an activity/version we do not have to load a new version, we just select the first parent component
                            if ( node.data && [ model.COMP_TYPE.WORKFLOW_ACTIVITY, model.COMP_TYPE.WORKFLOW_VERSION ].includes( node.data.typeId ) ) {
                                version = node.data.typeId === model.COMP_TYPE.WORKFLOW_VERSION ? model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { id: node.data.componentId } )[ 0 ] : getComponentsVersion( getComponent( node.data.componentId ) );
                                break;
                            }
                            node = node._parent;
                        }
                        if ( !version && node ) {
                            workflow = model.getComponents( model.COMP_TYPE.WORKFLOW, { id: node.data.componentId } )[ 0 ];
                        }
                    }
                }

                if ( currentVersion ) {
                    currentWorkflow = model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { id: currentVersion } )[ 0 ].getParent().id;
                }

                if ( workflow && ( !currentVersion || ( workflow.id !== currentWorkflow ) ) ) {
                    version = getWorkflowVersion( workflow );
                }

                if ( !version && currentWorkflow !== workflow?.id ) {
                    resetDiagram();
                    return;
                }
            } else {
                version = getComponentsVersion( modelComponents.find( comp => comp ) );
            }

            // stop, if there's no component type selected that is represented in the diagram and the version is still the same
            if ( !version || ( currentVersion === version.id && !selectedComponentIds.length ) ) {
                toggleToolbarButtons( [] );
                app.deselect();
                return;
            }

            // if the diagram is not visible we always store the selection ( to select them later )
            if ( !container$.is( ":visible" ) ) {
                selectedCells = selectedComponentIds;
            }

            // if it's a new version ( and the diagram is visible ), load the data
            if ( version.id !== currentVersion ) {
                if ( container$.is( ":visible" ) ) {
                    loadDiagram( version );
                    // if the selection is not through the Open action, clear the history
                    if ( source !== MENU_SELECT_EVENT ) {
                        previousVersions = [];
                        actions.hide( ACTIONS.goToPrevWorkflow );
                    }
                }
                currentVersion = version.id;
            }

            toggleToolbarButtons( [] );

            // ( if it's not there, there's an error if a link is the first selection )
            setTimeout( function() {
                // make sure that we do not react on the diagram selectionChanged event
                ignoreSelection = true;
                selectCell( selectedComponentIds, {
                    scrollTo: true
                    /* add */
                } );
            }, 1 );
        } );

        // reload the diagram on tab activation, as the data might have changed while hidden
        $( "#editor_tabs, #peTabs" ).on( "tabsactivate", function( event, ui ) {
            if ( ui.newPanel[ 0 ].id === "grid_diagram" ) {
                let version = getCurrentVersionComponent();
                if ( version ) {
                    loadDiagram( version );
                    if ( selectedCells ) {
                        setTimeout( function() {
                            ignoreSelection = true;
                            selectCell( selectedCells, {
                                scrollTo: true
                            } );
                            selectedCells = "";
                        }, 1 );
                    }
                }
            }
        } );

        registerObservers();

        // get the config elements from the model
        const activitiesConfig = pd.getWorkflowActivitiesConfig();
        const elements = Object.keys( activitiesConfig ).reduce( ( acc, curr ) => {
            acc.push( {
                typeId: curr,
                ...activitiesConfig[ curr ]
            } );
            return acc;
        }, [] );

        container$ = $( SEL_CONTAINER );

        // create the diagram
        app = new DiagramBuilder( {
            el: container$[ 0 ],
            ...DIAGRAM_CONFIG, elements, showNavigator
        } );

        // make it accessible through the dom element ( needed for the gallery )
        container$[ 0 ].diagramBuilder = app;
        container$[ 0 ].diagramBuilder.getCurrentVersion = getCurrentVersionComponent;

        createDesignerActions();

        toggleToolbarButtons();

        actions.hide( ACTIONS.goToPrevWorkflow );

        // create the menu widget
        diagramMenu$ = $( SEL_MENU );
        diagramMenu$.menu( {
            menubar: false,
            items: [ ...getMenuActivities(), ...getElementContextMenu(), ...DIAGRAM_CONFIG_MENU_ENTRIES ],
            afterClose: () => {
                app.focus();
            }
        } );

        // set up the listeners
        app.on( {
            [ DiagramBuilder.Event.SELECTION_CHANGE ]: ( current/* , detail  */) => {
                if ( !current?.length ) {
                    return;
                }
                let components = current.map( curr => getComponent( getLocalId( curr ) ) );
                components = components.filter ( component => component );
                toggleToolbarButtons( components );
                if ( ignoreSelection ) {
                    ignoreSelection = false;
                } else if ( components.length ) {
                    triggerSelect( components );
                }
            },
            [ DiagramBuilder.Event.BLANK_POINTERUP ]: () => {
                toggleToolbarButtons();
                if ( currentVersion ) {
                    triggerSelect( [ getCurrentVersionComponent() ] );
                }
            },
            [ DiagramBuilder.Event.ELEMENT_ADD ]: ( element ) => {
                listenToEvent( () => {
                    let { typeId, position, z } = element.attributes;
                    let command = getCreateCommand( typeId, { position, z }, element.id );
                    executeCommand( command );
                } );
            },
            [ DiagramBuilder.Event.ELEMENT_REMOVE ]: ( element ) => {
                listenToEvent( () => {
                    let command = getDeleteCommand( getLocalId(  element ) );
                    executeCommand( command );
                } );
            },
            // we update the element(/component) position in the model on this event.
            // the ELEMENT_POSITION_CHANGE triggered on every coordionates change, that's way to many events and would mess up the history
            [ DiagramBuilder.Event.ELEMENT_POINTERUP ]:  ( /* view, e */ ) => {
                listenToEvent( () => {
                    // we can assume that the target element is always selected
                    setElementData( app.getSelection() );
                } );
            },
            [ DiagramBuilder.Event.ELEMENT_BEFORE_DROP ]: ( draggedView, endModel, position, droppedOverView/* , droppedOverTool, e */ ) => {
                // if it's dropped on another element, there's gonna be a sequence of events. we don't want to crete a transaction
                // for each of these events, so start one here, and will execute it after the last event fired too
                if ( droppedOverView ) {
                    currentTransaction = model.transaction.start( DIAGRAM_WIDGET_NAME );
                    storeFirstTransaction = true;
                }
            },
            [ DiagramBuilder.Event.ELEMENT_POSITION_CHANGE ]: function( view, position, isKeyboard ) {
                if ( isKeyboard ) {
                    setElementData( view );
                } else if ( currentTransaction ) {
                    setElementData( view );
                }
            },
            [ DiagramBuilder.Event.LINK_ADD ]: ( element/* , detail */ ) => {
                listenToEvent( () => {
                    if ( !element || !hasOwnProperty( element, "attributes" ) ) {
                        return;
                    }
                    if ( element.attributes.source?.id ) {
                        let sourceComponent = getComponent( getLocalId( getCell( element.attributes.source.id ) ) );
                        // only transactions can change their source
                        if ( sourceComponent ) {
                            element.prop( ALLOW_SOURCE_CHANGE, getLinkType( sourceComponent ) === model.COMP_TYPE.WORKFLOW_TRANS );
                        }
                    }
                    // if the newly created link has a target then there's no need to wait, we can go ahead and add to the model
                    if ( currentTransaction || element.attributes.target?.id ) {
                        createLink( element );
                        return;
                    }
                    // if we got here it means that it's a new link that is still being positioned, will react on pointer up
                    shouldCreateLink = true;
                } );
            },
            [ DiagramBuilder.Event.LINK_REMOVE ]: ( link ) => {
                listenToEvent( () => {
                    // if a new link dropped on an invalid target, we must switch the flag back ( it's not in the model so that's it )
                    if ( shouldCreateLink ) {
                        shouldCreateLink = false;
                        return;
                    }
                    let command = getDeleteCommand(  getLocalId( link ) );
                    executeCommand( command );
                } );
            },
            [ DiagramBuilder.Event.LINK_POINTERUP ]: ( current/* , detail */ ) => {
                listenToEvent( () => {
                    if ( shouldCreateLink ) {
                        shouldCreateLink = false;
                        createLink( current.model );
                    } else if ( current && current.model ) {
                        setLinkData( current.model );
                    }
                } );
            },
            [ DiagramBuilder.Event.LINK_VERTEXHANDLE_POINTERUP ]: ( view, tool, handle, vertexNewCoords, vertexOldCoords ) => {
                const vertexPositionChange = vertexNewCoords.x !== vertexOldCoords.x || vertexNewCoords.y !== vertexOldCoords.y;
                if ( vertexPositionChange ) {
                    setLinkData( view.model );
                }
            },
            [ DiagramBuilder.Event.LINK_VERTEX_REMOVE ]: ( link ) => {
                setLinkData( link );
            },
            [ DiagramBuilder.Event.LINK_SEGMENTHANDLE_POINTERUP ]: ( view, tool, handle, vertex, newChangedValues ) => {
                if ( Object.keys(newChangedValues).length ) {
                    setLinkData( view.model );
                }
            },
            [ DiagramBuilder.Event.LINK_SOURCE_ANCHOR_POINTERUP ]: ( view/* , tool, anchor, e */ ) => {
                setLinkData( view.model );
            },
            [ DiagramBuilder.Event.LINK_TARGET_ANCHOR_POINTERUP ]: ( view/* , tool, anchor, e */ ) => {
                setLinkData( view.model );
            },
            [ DiagramBuilder.Event.LINK_TARGET_CHANGE ]: linkChangeListener,
            [ DiagramBuilder.Event.LINK_SOURCE_CHANGE ]: linkChangeListener,
            [ DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_POINTERUP ]: ( current, tool, position, point, event  ) => {
                openMenu( current.model, DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_POINTERUP, getCoordsFromEvent( event ), position );
            },
            [ DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER ]: ( current, tool, position/* , point, event */  ) => {
                const rect = tool.el.getBoundingClientRect();
                openMenu( current.model, DiagramBuilder.Event.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER, { x: rect.x + rect.width / 2, y: rect.y + rect.height / 2 }, position );
            },
            [ DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_POINTERDOWN ]: ( current, tool, ratio, point, event ) => {
                openMenu( current.model, DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_POINTERDOWN, getCoordsFromEvent( event ) );
            },
            [ DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER]: ( current, tool/*, ratio, point, event */ ) => {
                const rect = tool.el.getBoundingClientRect();
                openMenu( current.model, DiagramBuilder.Event.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER, { x: rect.x + rect.width / 2, y: rect.y + rect.height / 2 } );
            },
            [ DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN ]: ( current, tool, event ) => {
                openMenu( current.model, DiagramBuilder.Event.ELEMENT_MENUBUTTON_POINTERDOWN, getCoordsFromEvent( event ) );
            },
            [ DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER ]: ( current, tool/* , event */ ) => {
                const rect = tool.el.getBoundingClientRect();
                openMenu( current.model, DiagramBuilder.Event.ELEMENT_MENUBUTTON_KEYBOARDTRIGGER, { x: rect.x + rect.width / 2, y: rect.y + rect.height / 2 } );
            },
            [ DiagramBuilder.Event.LINK_MENUBUTTON_POINTERDOWN ]: ( current, tool, event ) => {
                openMenu( current.model, DiagramBuilder.Event.LINK_MENUBUTTON_POINTERDOWN, getCoordsFromEvent( event ) );
            },
            [ DiagramBuilder.Event.LINK_MENUBUTTON_KEYBOARDTRIGGER ]: ( current, tool/*, event */ ) => {
                const rect = tool.el.getBoundingClientRect();
                openMenu( current.model, DiagramBuilder.Event.LINK_MENUBUTTON_KEYBOARDTRIGGER, { x: rect.x + rect.width / 2, y: rect.y + rect.height / 2 } );
            },
            [ DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_POINTERDOWN ]: ( current, tool, point, event ) => {
                openMenu( current.model, DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_POINTERDOWN, getCoordsFromEvent( event ), point );
            },
            [ DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER ]: ( current, tool/*, point, event */ ) => {
                const rect = tool.el.getBoundingClientRect();
                openMenu( current.model, DiagramBuilder.Event.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER, { x: rect.x + rect.width / 2, y: rect.y + rect.height / 2 } );
            },
            [ DiagramBuilder.Event.BEFORE_KEYBOARD_ACTION ]: ( action, event, processObj ) => {
                if ( action === DiagramBuilder.KeyboardAction.CELL_REMOVE && !app.isReadOnly() && getCurrentVersionComponent()?.getProperty( model.PROP.STATE )?.getValue() === STATE_DEV ) {
                    processObj.process = false;
                    app.getSelection().forEach( cell => removeComponentFromModel( getComponent( getLocalId( cell ) ) ) );
                }
            }
        } );
        // let the other components know that the diagram is ready
        $( document ).trigger( "diagramReady" );

    } );

} )( window.pe, apex.jQuery, apex.debug, apex.lang, window.pageDesigner, apex.util, apex.actions );