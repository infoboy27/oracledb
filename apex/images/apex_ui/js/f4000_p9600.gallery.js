/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */

/**
 * This file initializes the "gallery" of the diagram builder. Currently, it only contains the list of available activities of the worfklow version.
 * Main function of this file is to create the IconList and get the data of the selected component before drag and let the diagram know that a drag has started.
 * All other processses related to the drag-and-drop are controlled by the diagram.
 *
 *
 */

/* global pe */

window.componentGallery = {};

( function( model, $, util, pd ) {
    "use strict";

    const hasOwnProperty = util.hasOwnProperty;

    const ACTIVITY = "activity";
    const ACTIVITIES = "activities";
    const DIAGRAM_SELECTOR = "#app";
    const DIAGRAM_WIDGET = "diagram";
    const CLS_DRAG_ACTIVE = "is-draggable";
    const CLS_DRAG_INACTIVE = "is-not-draggable";

    const gComponents = { activities: [] },
        gTypeToClassMap = { [ ACTIVITY ] : "a-Gallery-activity" },
        gTypeToCollectionMap = { [ ACTIVITY ]: ACTIVITIES };

    let diagram, elements;

    function renderLibComponent( out, index, item ) {
        let className = gTypeToClassMap[ item.type ],
            isPageReadOnly = model.isPageReadOnly();

        out.markup( "<li" )
            .attr( "class", className )
            .optionalAttr( "aria-grabbed", isPageReadOnly ? null : "false" )
            .attr( "data-component", item.type + ":" + index )
            .attr( "draggable", "true" )
            .markup( "><span class='a-Icon " ).attr( item.iconClass ).markup( "'></span><span class='a-Gallery-componentName'>" ).content( item.title )
            .markup( "</span></li>" );
    }

    function getComponentData( key ) {
        let data,
            parts = key.split( ":" ),
            collection = gComponents[ gTypeToCollectionMap[ parts[ 0 ] ] ];

        if ( collection ) {
            data = collection[ parts[ 1 ] ];
        }

        if ( !data ) {
            throw new Error( "Invalid component data key" );
        }
        return data;
    }

    function updateComponentGallery() {
        let isPageReadOnly = model.isPageReadOnly(),
            out = util.htmlBuilder();
        // currently only activities, but more expected in the future
        [ ACTIVITIES ].forEach( function( value ) {
            let item, components = gComponents[ value ],
                list$ = $( `#cg-${ util.escapeCSS( value ) } ul` ).first();

            out.clear();
            for ( let i = 0; i < components.length; i++ ) {
                item = components[i];
                if ( item.isSupported ) {
                    renderLibComponent( out, i, item );
                }
            }
            list$.html( out.toString() )
                .iconList( "refresh" );

            // make component icons draggable but only if the page is not readonly
            if ( !isPageReadOnly ) {
                // store the draggable instance
                elements = $( `#cg-${ util.escapeCSS( value ) } li` ).draggable( {
                    appendTo: "#app-viewport", // append here for proper scrolling
                    cursor2: "default",
                    containment: "#glv-viewport-container",
                    scroll: false,
                    cursorAt: { left: 2, top: 2 },
                    delay: 10,
                    distance: 5,
                    opacity: 0.1,
                    zIndex: 1000,
                    addClasses: true,
                    revert: false,
                    helper: () => {
                        return document.createElement( "div" );
                    },
                    start: function( event ) {
                        let comp$ = $( this ),
                            key = comp$.attr( "data-component" ),
                            comp = getComponentData( key ),
                            elementType = comp.values.find( val => val.id === model.PROP.PAGE_PROCESS_TYPE );
                        diagram.startDragging( elementType.value, event );
                        apex.tooltipManager.disableTooltips();
                    },
                    stop: () => {
                        apex.tooltipManager.enableTooltips();
                    }
                } );
            }
        } );
    }

    function initComponentGallery() {
        let components = pd.getWorkflowActivitiesConfig();
        for ( let act in components ) {
            if ( hasOwnProperty( components, act ) ) {
                gComponents.activities.push( {
                    type: ACTIVITY,
                    iconClass: pd.getComponentIconClass( ACTIVITY, act ),
                    title: components[ act ].title,
                    isSupported: true,
                    values: [
                        { id: model.PROP.PAGE_PROCESS_TYPE, value: act }
                    ]
                } );
            }
        }
        updateComponentGallery();
    }

    function toggleGallery( currentVersion ) {
        const disabled =  currentVersion?.getProperty( model.PROP.STATE ).getValue() !== "DEVELOPMENT";
        elements.draggable( disabled ? "disable" : "enable" );
        elements.each( ( idx, el ) => {
            if ( disabled ) {
                $( el ).removeClass( CLS_DRAG_ACTIVE ).addClass( CLS_DRAG_INACTIVE );
            } else {
                $( el ).removeClass( CLS_DRAG_INACTIVE ).addClass( CLS_DRAG_ACTIVE );
            }
        } );
    }

    // if the current version's state changes, update the gallery
    model.observer( DIAGRAM_WIDGET, {
        component: { typeIds: [ model.COMP_TYPE.WORKFLOW_VERSION ] },
        events: [ model.EVENT.CHANGE ],
        properties: [ model.PROP.STATE ]
    }, ( notification ) => {
        const component = notification.component;
        const currentVersion = diagram.getCurrentVersion();
        if ( !currentVersion || ( component.id === currentVersion?.id ) ) {
            toggleGallery( currentVersion );
        }
    } );

    // need to listen on the delete because of the redo/undo actions
    model.observer( DIAGRAM_WIDGET, {
        component: { typeIds: [ model.COMP_TYPE.WORKFLOW_VERSION ] },
        events: [ model.EVENT.DELETE ]
    }, () => {
        const currentVersion = diagram.getCurrentVersion();
        if ( !currentVersion ) {
            toggleGallery();
        }
    } );

    // we let the diagram (and the tree) to do the selection first; i.e. to set the currentVersion
    $( document ).on( "selectionChanged", () => {
        setTimeout( () => {
            toggleGallery( diagram.getCurrentVersion() );
        }, 1 ) ;
    } );

    $( document ).on( "diagramReady", () => {
        diagram = $( DIAGRAM_SELECTOR )[ 0 ].diagramBuilder;
        initComponentGallery();
    } );

    $( function() {
        $( "#cg-activities ul" ).addClass( "a-Gallery" ).each( function() {
            $( this ).iconList({
                multiple: false
            });
        } );

        $( "#gallery-tabs .u-ScrollingViewport.resize" ).resize( function() {
            $( this ).children( ".a-IconList" ).resize(); // fire resize event without actually changing the size of the list.
        });
    } );

})( pe, apex.jQuery, apex.util, window.pageDesigner );