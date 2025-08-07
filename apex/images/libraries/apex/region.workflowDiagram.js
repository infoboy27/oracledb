/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint "comma-dangle": ["error", "never"] */
/* eslint keyword-spacing: ["error", { "before": true, "after": true } ] */
/* global DiagramBuilder */

( () => {
    "use strict";

    const { jQuery: $, debug, region, util, widget, WebComponent, actions, lang } = apex;
    const widgetUtil = widget.util;

    const DIAGRAM_CONFIG = {
        readOnly: true,
        renderStencil: false,
        showNavigator: false,
        selectionMode: "none",
        linkDesignations: [ {
            typeId: "ERROR",
            glyph: "\ue317"
        }, {
            typeId: "TIMEOUT",
            glyph: "\ue108"
        } ],
        style: {
            paperCls: "paper",
            toastForegroundContainerCls: "a-WorkflowToast"
        },
        routeHighlights: [ {
            typeId: "TERMINATED",
            color: "var(--a-diagram-route-terminated)"
        }, {
            typeId: "FAULTED",
            color: "var(--a-diagram-route-faulted)"
        }, {
            typeId: "ACTIVE",
            color: " var(--a-diagram-route-active)"
        }, {
            typeId: "COMPLETED",
            color: "var(--a-diagram-route-completed)"
        }, {
            typeId: "WAITING",
            color: "var(--a-diagram-route-waiting)"
        }, {
            typeId: "SUSPENDED",
            color: "var(--a-diagram-route-suspended)"
        } ]
    };

    const TOOLBAR_ACTIONS = {
        zoomIn: "zoom-in",
        zoomOut: "zoom-out",
        zoomReset: "zoom-reset",
        showNavigator: "show-navigator"
    };
    const ZOOM_STEP = .1;

    class WorkflowDiagram extends WebComponent {
        diagramElement;
        toolbarElement;
        targetElement;

        #diagram;
        #buttons;
        #initZoom;
        #workflowConfig;
        #context;

        #autoLoad;
        #regionId;
        #region$;
        #workflowIdItem;
        #ajaxIdentifier;

        #navigatorShown = false;

        #suspendedLoad = false;
        #loading = false;

        constructor() {
            super();
            const buttons = this.getAttribute( "buttons" );

            this.#ajaxIdentifier = this.getAttribute( "ajax-identifier" );
            this.#regionId = this.getAttribute( "region-id" );
            this.#region$ = $( `#${ util.escapeCSS( this.#regionId ) }`);
            this.#workflowIdItem = this.getAttribute( "workflow-id-item" );
            this.#initZoom = this.getAttribute( "init-zoom" );
            this.#autoLoad = this.hasAttribute( "auto-load" ) ? ( this.getAttribute( "auto-load" ).toLowerCase() !== "false" )  : true;
            this.#workflowConfig = JSON.parse( ( this.getAttribute( "workflow-config" ) || "[]" ) );

            if ( !this.#region$.length ) {
                debug.error( "Workfow Diagram region must use a template with ID attribute" );
            }

            this.#buttons = buttons ? buttons.split( ":" ) : [];

            region.create( this.#regionId, {
                type: "WorkflowDiagram",
                refresh: this.refresh.bind( this )
            } );
        }

        _render(){
            if ( this.rendered ) {
                return;
            }

            const el = document.createElement( "div" );
            this.targetElement = el;
            el.classList.add( "a-WorkflowApp" );
            el.setAttribute( "role", "img" );
            el.setAttribute( "aria-label", lang.getMessage( "APEX.WF_DIAGRAM.ARIA_LABEL" ) );
            el.setAttribute( "aria-description", lang.getMessage( "APEX.WF_DIAGRAM.ARIA_DESC" ) );
            this.append( el );

            const KeyboardAction = DiagramBuilder.KeyboardAction;
            this.#diagram = new DiagramBuilder( {
                ...DIAGRAM_CONFIG,
                locale: {
                    [ DiagramBuilder.Locale.STR_ZOOM_LEVEL ]: lang.getMessage( "APEX.WF.ZOOM_LEVEL" )
                },
                keyboardNavigationMap: {
                    "up": KeyboardAction.PAPER_PAN_UP,
                    "down": KeyboardAction.PAPER_PAN_DOWN,
                    "left": KeyboardAction.PAPER_PAN_LEFT,
                    "right": KeyboardAction.PAPER_PAN_RIGHT,
                    "ctrl+0": KeyboardAction.ZOOM_RESET,
                    "ctrl+minus": KeyboardAction.ZOOM_OUT,
                    "ctrl+plus": KeyboardAction.ZOOM_IN
                },
                el,
                initialZoom: parseFloat( this.#initZoom )
            } );
            this.#initToolbar();
            this.#createContext();

            widgetUtil.onVisibilityChange( $( this ), show => {
                if ( show && this.#suspendedLoad ) {
                    this.#suspendedLoad = false;
                    this.refresh();
                }
            } );

            if ( this.#autoLoad ) {
                this.refresh();
            }
        }

        _fetchData() {
            return new Promise( ( resolve, reject ) => {
                this.#loading = true;
                apex.server.plugin( {
                    regions: [ {
                        id: this.#regionId,
                        ajaxIdentifier: this.#ajaxIdentifier
                    } ],
                    pageItems: this.#workflowIdItem ? [ this.#workflowIdItem ] : []
                }, {
                    refreshObject: this,
                    loadingIndicator: this,
                    loadingIndicatorPosition: "centered",
                    success: res => {
                        this.#loading = false;
                        resolve( res.regions[ 0 ] );
                    },
                    error: ( xhr, textStatus, errorThrown ) => {
                        this.#loading = false;
                        reject( errorThrown );
                    }
                } );
            } );
        }

        refresh() {
            if ( !this.#diagram || this.#loading ) {
                return;
            }

            if ( widgetUtil.isVisible( $( this ) ) ) {
                this._fetchData().then( data => {
                    const { cells = [], defaultRouter = DiagramBuilder.Router.NORMAL, route: dataRoute = [] } = data || {}; 
                    const activities = [];
                    const links = [];
                    const route = dataRoute.reduce( ( acc, entry ) => {
                        const { activityId, linkId, state } = entry;
                        const prevActivityObj = acc.length ? acc[ acc.length - 1 ] : null;
                        const activityObj = {
                            cellId: activityId,
                            highlightTypeId: state
                        };
                        // If the previous activity is the same as this activity, it means we need to overwrite it and overwrite
                        // the incoming link as well. This can happen as the query may return the same activity with different
                        // statuses (e.g. waiting -> suspended) which we do not care about. We use only the last status.
                        if ( prevActivityObj && prevActivityObj.cellId === activityId ) {
                            if ( linkId ) {
                                acc [ acc.length - 2 ] = {
                                    cellId: linkId
                                };
                            }
                            acc[ acc.length - 1 ] = activityObj;
                        } else {
                            if ( linkId ) {
                                acc.push( {
                                    cellId: linkId
                                } );
                            }
                            acc.push( activityObj );
                        }
                        return acc;
                    }, [] );

                    cells.forEach(entry => {
                        if ( activities.findIndex( act => act.id === entry.activityId ) < 0 ) {
                            activities.push( {
                                id: entry.activityId,
                                text: entry.activityName,
                                typeId: entry.activityType,
                                diagram: entry.activityDiagram
                            } );
                        }

                        if ( entry.linkId && links.findIndex( link => link.id === entry.linkId ) < 0 ) {
                            links.push( {
                                id: entry.linkId,
                                name: entry.linkName,
                                source: entry.activityId,
                                target: entry.linkTargetId,
                                diagram: entry.linkDiagram,
                                type: entry.linkType
                            } );
                        }
                    } );

                    this.#diagram.setElementsConfig( this.#getWorkflowActivitiesConfig( activities ) );
                    this.#diagram.load( {
                        cells: [ ...this.#prepareActivities( activities ), ...this.#prepareLinks( links ) ],
                        route
                    } );
                    this.#diagram.setDefaultRouter( defaultRouter );
                } );
            } else {
                this.#suspendedLoad = true;
            }
        }

        get diagramBuilder() {
            return this.#diagram;
        }

        #createContext(){
            const diagram = this.#diagram;
            const me = this;
            this.#context = actions.createContext( "workflowDiagram", this );
            this.#context.add( [ {
                name: TOOLBAR_ACTIONS.zoomIn,
                action: function() {
                    diagram.zoom( ZOOM_STEP );
                }
            }, {
                name: TOOLBAR_ACTIONS.zoomOut,
                action: function() {
                    diagram.zoom( -ZOOM_STEP );
                }
            }, {
                name: TOOLBAR_ACTIONS.zoomReset,
                action: function() {
                    diagram.zoom( 1, true );
                }
            }, {
                name: TOOLBAR_ACTIONS.showNavigator,
                get: function() {
                    return me.#navigatorShown;
                },
                set: function( value ) {
                    value ? diagram.showNavigator() : diagram.hideNavigator();
                    me.#navigatorShown = value;
                }
            } ] );
        }

        #initToolbar() {
            let config = {
                actionsContext: this.#context,
                simple: true,
                data: []
            };
            let zoomControls = [];

            if ( this.#buttons.includes( "ZOOM_IN" ) ) {
                zoomControls.push( {
                    type: "BUTTON",
                    title: lang.getMessage( "APEX.WF.ZOOM_IN" ),
                    label: lang.getMessage( "APEX.WF.ZOOM_IN" ),
                    iconOnly: true,
                    icon: "icon-zoom-region",
                    action: TOOLBAR_ACTIONS.zoomIn
                } );
            }

            if ( this.#buttons.includes( "ZOOM_OUT" ) ) {
                zoomControls.push( {
                    type: "BUTTON",
                    title: lang.getMessage( "APEX.WF.ZOOM_OUT" ),
                    label: lang.getMessage( "APEX.WF.ZOOM_OUT" ),
                    iconOnly: true,
                    icon: "icon-zoom-page",
                    action: TOOLBAR_ACTIONS.zoomOut
                } );
            }

            if ( this.#buttons.includes( "ZOOM_RESET" ) ) {
                zoomControls.push( {
                    type: "BUTTON",
                    title: lang.getMessage( "APEX.WF.ZOOM_RESET" ),
                    label: lang.getMessage( "APEX.WF.ZOOM_RESET" ),
                    iconOnly: true,
                    icon: "icon-search",
                    action: TOOLBAR_ACTIONS.zoomReset
                } );
            }

            if ( zoomControls.length ) {
                config.data.push( {
                    id: "zoomControls",
                    align: "end",
                    groupTogether: true,
                    controls: zoomControls
                } );
            }

            if ( this.#buttons.includes( "NAVIGATOR" ) ) {
                config.data.push( {
                    id: "navigatorControls",
                    align: "end",
                    controls: [ {
                        type: "BUTTON",
                        title: lang.getMessage( "APEX.WF.NAVIGATOR" ),
                        label: lang.getMessage( "APEX.WF.NAVIGATOR" ),
                        iconOnly: true,
                        icon: "icon-navigator",
                        action: TOOLBAR_ACTIONS.showNavigator
                    } ]
                });
            }

            if ( config.data.length ) {
                const tEl = document.createElement( "div" );
                this.toolbarElement = tEl;
                tEl.classList.add( "a-Toolbar", "a-Toolbar-pageColumn", "a-Toolbar-pageColumn--gridLayout", "a-Toolbar--simple" );
                this.prepend( tEl );
                $( tEl ).toolbar( config );
            }
        }

        /**
         *
         * @param {array} links array of link objects
         * @returns {array}
         */
        #prepareLinks( links ) {
            return links.map( link => {
                let coordinates = JSON.parse( link.diagram );
                let sourceAnchor, targetAnchor, labels = [];
                if ( coordinates.source.args ) {
                    sourceAnchor = { args: coordinates.source.args, name: coordinates.source.name };
                }

                if ( coordinates.target.args ) {
                    targetAnchor = { args: coordinates.target.args, name: coordinates.target.name };
                }

                // hide the label of "normal" transitions
                if ( link.type !== "NORMAL" ) {
                    labels.push( {
                        text: link.name,
                        position: coordinates.label
                    } );
                }

                return {
                    id: link.id,
                    source: {
                        id: link.source,
                        anchor: sourceAnchor
                    },
                    target: {
                        id: link.target,
                        anchor: targetAnchor
                    },
                    vertices: coordinates.vertices,
                    z: coordinates.z,
                    designation: link.type,
                    labels,
                    ...( coordinates.router && { router: coordinates.router } )
                };
            } );
        }

        /**
         *
         * @param {array} activities array of activity objects
         * @returns {array}
         */
        #prepareActivities( activities ) {
            return activities.map( activity => {
                activity = {
                    ...activity,
                    ...JSON.parse( activity.diagram ),
                    hasMenu: false
                };
                delete activity.diagram;
                return activity;
            } );
        }

        /**
         *
         * @param {array} activities array of workflow activity objects
         * @returns {array} array of activity type objects
         */
        #getWorkflowActivitiesConfig( activities ) {
            let pluginType = this.#workflowConfig.filter( config => config.typeId === "$PLUGIN$")[ 0 ],
             types = this.#workflowConfig.reduce( ( acc, curr ) => {
                acc.push( curr.typeId );
                return acc;
            }, [] );
            return [ ...( activities.filter( activity => !types.includes( activity.typeId ) ).map( act => {
                return {
                    ...pluginType,
                    typeId: act.typeId
                } ;
            } ) ), ...this.#workflowConfig ];
        }
    }

    $( function() {
        customElements.define( "a-workflow-diagram", WorkflowDiagram );
    } );

} )();