/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/* This file creates the apex.designerTree widget ( that extends the apex.treeView ).
 * It contains some of the utility functions that can be shared between the page designer ( f4000_p4500.tree.js ) and the
 * workflow designer ( f4000_p9600.tree.js ).
 *
 * *** IMPORTANT ***
 * This file strongly depends on the designer context and cannot be used outside of it.
 * In the future, the Page Designer ( f4000_p4500.js ) has to be updated to use thise widget for the trees and the duplicated
 * code has to be removed from f4000_p4500.tree.js
 * *****************
 * Duplicated functions:
 * accessible through the widget:
 * - nodesDeleted
 * - nodesCopied
 * - nodesMoved
 * - updateComponentNode
 * - getSelectedComponents
 * - getComponentDomNodes
 * - getComponent
 * - getNearestComponent
 * - getNearestValue
 * - getComponentNode
 * - setSelectedComponents
 *      - with a small tweak. and additional parameter ( pMultipleNodes ) has been added. if it's true, then it selects multipple nodes
 * - duplicateNodes
 *      - contains wf specific logic, consider to move it to f4000_p9600.tree.js
 * - checkComponentHasNode
 * - addComponentClass
 * - removeComponentClass
 * - getComponentHierarchyValues
 *      - it does not add to the workflow designer a the moment, but probably will in the future
 * - isCreatable
 * Accessible through $.apex.designerTree:
 * - addNode
 * - addLeafNode
 * - addChildNode
 * - addHeaderNode
 * - postProcessNodes
 *
 *
 * The configuration is very much the same as apex.treeView, with a few differences.
 * 1. This widget has a "contextMenuEntries" option, which accepts an array of objects.
 * ( then the widget sets the entries up according to their configuration )
 * 2. It also expects the createComponent funcion to be passed in as an option.
 * ( the provided function is executed in the widget context )
 *
 */

/* eslint quotes: ["error", "double"] */
/* eslint no-var: "error" */
/* eslint semi: "error" */
( function( $, model, pd, lang ) {
    "use strict";

    $.widget( "apex.designerTree", $.apex.treeView, {
        _create: function() {
            let self = this;
            $.extend( this.options, {
                selectionChange: function( ) {
                    let WIDGET = this.id, components;

                    components = self.getSelectedComponents( $( this ) );
                    // Notify other widgets on the page that a component has been selected
                    $( document ).trigger( "selectionChanged", [ WIDGET, components, self.getSelectedNodes() ] );
                },
                copied: function( event, change ) {
                    self.nodesCopied( change );
                },
                moved: function( event, change ) {
                    self.nodesMoved( change );
                },
                deleted: function( event, change ) {
                    self.nodesDeleted( change );
                }
            } );

            if ( this.options.contextMenuEntries ) {
                this.options.contextMenu = { items: this._getContextMenu( this.options.contextMenuEntries ) };
            }

            this.createComponent = function( node, componentTypeId ) {
                self.options.createComponent.call( self, node, componentTypeId );
            };

            this._super( "init", this.options );
        },
        nodesDeleted: function( pChange ) {

            let self = this,
                lComponent,
                lMessage,
                lTransaction,
                lSelectedNodes;
            const NODE_TYPES = [
                "region_slot",
                "page_slot",
                "branches",
                "processes",
                "validations",
                "computations",
                "workflow_outgoing_links",
                "workflow_incoming_links",
                "workflow_params"
            ];

            if ( pChange.items.length > 0 ) {

                // get current selection before tree refresh
                lSelectedNodes = self.getSelectedNodes();

                // filter out empty tree slots and get the parent instead
                // because slots get removed when they don't have children
                for( let i = 0; i < lSelectedNodes.length; i++ ) {
                    if( NODE_TYPES.includes( lSelectedNodes[i].type ) && lSelectedNodes[i].children.length < 1 ) {
                        lSelectedNodes[i] = lSelectedNodes[i]._parent;
                    }
                }

                lMessage = model.transaction.message( {
                    action:     model.MESSAGE_ACTION.DELETE,
                    component:  self.getComponent( pChange.items[ 0 ].node ),
                    count:      pChange.items.length
                } );

                lTransaction = model.transaction.start( "", lMessage );

                for ( let i = 0; i < pChange.items.length; i++ ) {
                    lComponent = self.getComponent( pChange.items[ i ].node );
                    // the validations in the remove process ( pe.model.js: _remove) might throw an error, we need to handle that
                    if ( lComponent ) {
                        try {
                            lComponent.remove();
                        } catch ( e ) {
                            lTransaction.cancel();
                            self.element.trigger( "refresh" );
                            pd.showError( e );
                            return;
                        }

                    }
                }
            }
            apex.commandHistory.execute( lTransaction );

            // set selection and focus after tree refresh
            self.setSelectedNodes( lSelectedNodes, true, true );
        }, //nodesDeleted
        nodesCopied: function( pChange, pTree$ ) {
            let self = this,
                lComponent,
                lPrevComponent,
                lNewComponents = [],
                lMessage,
                lTransaction;

            if ( pChange.items.length > 0 ) {

                lMessage = model.transaction.message( {
                    action:     model.MESSAGE_ACTION.DUPLICATE,
                    component:  self.getComponent( pChange.items[ 0 ].toNode ),
                    count:      pChange.items.length
                } );

                lTransaction = model.transaction.start( "", lMessage );

                for ( let i = 0; i < pChange.items.length; i++ ) {

                    lComponent = self.getComponent( pChange.items[ i ].toNode );
                    if ( pChange.items[ i ].toIndex === 0 ) {
                        lPrevComponent = null;
                    } else {
                        lPrevComponent = self.getComponent( pChange.parentNode.children[ pChange.items[ i ].toIndex - 1 ] );
                        // If we don't find a component it's very likely that we have dragged the component onto the parent component
                        // and they treeView just doesn't know yet into which of the children nodes it should actually be put into
                        if ( !lPrevComponent ) {
                            lPrevComponent = "last";
                        }
                    }

                    lNewComponents[ i ] = lComponent.duplicate();
                    lNewComponents[ i ].move( {
                        previousComponent: lPrevComponent,
                        values: self.getComponentHierarchyValues( pChange.items[ i ].toNode ) } );
                }

                apex.commandHistory.execute( lTransaction );

                // Select the moved components
                pTree$.designerTree( "setSelectedComponents", lNewComponents, pChange.items[ 0 ].toNode._parent.id, true );
            }
        }, // nodesCopied
        nodesMoved: function( pChange ) {
            let self = this;
            let lComponents = [],
            lPrevComponent,
            lMessage,
            lTransaction;

            if ( pChange.items.length > 0 ) {

                lMessage = model.transaction.message( {
                    action:     model.MESSAGE_ACTION.MOVE,
                    component:  self.getComponent( pChange.items[ 0 ].toNode ),
                    count:      pChange.items.length
                } );

                lTransaction = model.transaction.start( "", lMessage );

                for ( let i = 0; i < pChange.items.length; i++ ) {

                    lComponents[ i ] = self.getComponent( pChange.items[ i ].toNode );
                    if ( pChange.items[ i ].toIndex === 0 ) {
                        lPrevComponent = null;
                    } else {
                        lPrevComponent = self.getComponent( pChange.parentNode.children[ pChange.items[ i ].toIndex - 1 ] );
                        // If we don't find a component it's very likely that we have dragged the component onto the parent component
                        // and they treeView just doesn't know yet into which of the children nodes it should actually be put into
                        if ( !lPrevComponent ) {
                            lPrevComponent = "last";
                        }
                    }

                    lComponents[ i ].move( {
                        previousComponent: lPrevComponent,
                        values: self.getComponentHierarchyValues( pChange.items[ i ].toNode ) } );
                }

                apex.commandHistory.execute( lTransaction );

            }
        }, // nodesMoved
        updateComponentNode: function( pComponent, pTree$, pFunction ) {
            let self = this;
            this.getComponentDomNodes$( pComponent, pTree$ ).each( function() {
                let lDomNode$ = $( this );
                pFunction.call( self.getNodes( lDomNode$, pTree$ )[ 0 ] );
                self.update( lDomNode$ );
            } );
        }, // updateComponentNode
        getSelectedComponents: function() {

            let lNodes  = this.getSelectedNodes(),
                lResult = [];

            // Get components of selected nodes
            for ( let i = 0; i < lNodes.length; i++ ) {
                if ( lNodes[ i ].data && Object.prototype.hasOwnProperty.call( lNodes[ i ].data, "componentId" ) ) {
                    lResult.push( model.getComponents( lNodes[ i ].data.typeId, { id: lNodes[ i ].data.componentId } )[ 0 ] );
                }
            }

            return lResult;

        }, // getSelectedComponents
        getComponentDomNodes$: function( pComponent, pTree$, pParentId ) {
            let lParent$;
            // todo that's a slow! Can we search by ID?
            if ( pParentId ) {
                lParent$ = this.find( {
                    depth: -1,
                    match: function( pNode ) {
                        return ( pNode.id === pParentId );
                    }
                } );
            }

            return this.find( {
                parentNodeContent$: lParent$,
                depth:   -1,
                findAll: true,
                match: function( pNode ) {
                    return ( pNode.data.typeId === pComponent.typeId && pNode.data.componentId === pComponent.id );
                }
            } );

        }, //getComponentDomNodes$
        getComponent: function( pNode$ ) {

            let lNode,
                lComponents = [];

            if ( pNode$ instanceof jQuery ) {
                lNode = this.getNodes( pNode$ )[ 0 ];
            } else {
                lNode = pNode$;
            }

            if ( lNode.data && lNode.data.typeId && lNode.data.componentId ) {
                lComponents = model.getComponents( lNode.data.typeId, { id: lNode.data.componentId } );
            }

            if ( lComponents.length === 1 ) {
                return lComponents[ 0 ];
            }
            // @todo remove?
            return undefined;

        }, // getComponent
        getNearestComponent: function( pComponentTypeId, pNode ) {

            let lComponentTypes = ( Array.isArray( pComponentTypeId ) ) ? pComponentTypeId : [ pComponentTypeId ],
                lComponent;

            if ( pNode ) {
                lComponent = this.getComponent( pNode );

                // Search as long as the current node is a component and it matches to the specified component type
                if ( lComponent === undefined || ( lComponent && $.inArray( lComponent.typeId, lComponentTypes ) === -1 ) ) {
                    lComponent = this.getNearestComponent( lComponentTypes, pNode._parent );
                }
            }
            return lComponent;
        }, //getNearestComponent
        getNearestValue: function( pPropertyId, pNode ) {

            let lValue;

            if ( pNode ) {
                if ( Object.prototype.hasOwnProperty.call( pNode.data, pPropertyId ) ) {
                    lValue = pNode.data[ pPropertyId ];
                } else {
                    // Search as long as we have found the specified property
                    lValue = this.getNearestValue( pPropertyId, pNode._parent );
                }
            } else {
                lValue = "";
            }
            return lValue;
        }, // getNearestValue
        getComponentNode: function( pComponent, pParentId ) {

            return this.getNodes( this.getComponentDomNodes$( pComponent, null, pParentId ) )[ 0 ];

        }, // getComponentNode
        getComponentNodes: function( pComponent, pParentId ) {

            return this.getNodes( this.getComponentDomNodes$( pComponent, null, pParentId ) );

        }, // getComponentNode
        setSelectedComponents: function( pComponents, pParentId, pNotify, pMultipleNodes ) {

            let lComponentNodes  = [],
                lComponentNodes$ = $(),
                lParentId = pParentId,
                lNode;

            // For the dynamic action tree we always want to select the dynamic actions displayed below "Events"
            if ( !pParentId && this.element[ 0 ].id === "PDdynamicActionTree" ) {
                lParentId = "da_da_events";
            }

            // select all component nodes passed in
            // todo: jjs seems like this selects the same components in two different ways based on if notifications are desired
            // todo:   but now both setSelection and setSelectedNodes take an extra param to control notification
            if ( pNotify ) {

                for ( let i = 0; i < pComponents.length; i++ ) {
                    lComponentNodes$ = lComponentNodes$.add( this.getComponentDomNodes$( pComponents[ i ], lParentId ) );
                }

                this.setSelection( lComponentNodes$ );

            } else {

                for ( let i = 0; i < pComponents.length; i++ ) {
                    if ( pMultipleNodes ) {
                        lNode = this.getComponentNodes( pComponents[ i ], lParentId );
                        lComponentNodes.push( ...lNode );
                    } else {
                        lNode = this.getComponentNode( pComponents[ i ], lParentId );
                        if ( lNode ) {
                            lComponentNodes.push( lNode );
                        }
                    }
                }

                this.setSelectedNodes( lComponentNodes, false, true );

            }

        }, // setSelectedComponents
        duplicateNodes: function( pNodes, pTree$ ) {

            let lMessage,
                lTransaction,
                lComponent,
                lNewComponent,
                lNewComponents = [];

            if ( pNodes.length > 0 ) {

                lMessage = model.transaction.message( {
                    action:     model.MESSAGE_ACTION.DUPLICATE,
                    component:  this.getComponent( pNodes[ 0 ] ),
                    count:      pNodes.length
                } );

                lTransaction = model.transaction.start( "", lMessage );

                for ( let i = 0; i < pNodes.length; i++ ) {
                    lComponent = this.getComponent( pNodes[ i ] );
                    lNewComponent = lComponent.duplicate();
                    if ( lComponent.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                        let stateProperty = lNewComponent.getProperty( model.PROP.STATE );
                        // the duplicated version is always in DEVELOPMENT
                        stateProperty.setValue( "DEVELOPMENT" );
                        if ( stateProperty.getValue() === "DEVELOPMENT" ) {
                            lNewComponent.getProperties().forEach( ( prop ) => {
                                if ( ![ model.PROP.CHANGED_ON, model.PROP.CHANGED_BY ].includes( prop.id ) ) {
                                    prop.enable();
                                }
                            } );
                        }
                    } else if ( lComponent.typeId === model.COMP_TYPE.WORKFLOW ) {
                        model.getComponents( model.COMP_TYPE.WORKFLOW_VERSION, { parentId: lNewComponent.id } ).forEach( ( comp ) => {
                            let state = comp.getProperty( model.PROP.STATE );
                            if ( state.getValue() !== "INACTIVE" ) {
                                state.setValue( "DEVELOPMENT", true );
                                comp.getProperties().forEach( ( prop ) => {
                                    if ( ![ model.PROP.CHANGED_ON, model.PROP.CHANGED_BY ].includes( prop.id ) ) {
                                        prop.enable();
                                    }
                                } );
                            } else {
                                comp.disable();
                                comp.getProperties().forEach( prop => prop.disable() );
                            }
                        } );
                    } else if ( lComponent.typeId === model.COMP_TYPE.WORKFLOW_PARAM ) {
                        const directionProp = lNewComponent.getProperty( model.PROP.API_DIRECTION );
                        directionProp.setValue( directionProp.getValue(), true );
                    }
                    lNewComponents.push( lNewComponent );
                }

                apex.commandHistory.execute( lTransaction );

                // Select the moved components
                this.setSelectedComponents( lNewComponents, pTree$, pNodes[ 0 ]._parent.id, true );
            }
        }, // duplicateNodes
        checkComponentHasNode: function( pComponent ) {
            let lComponent;

            if ( $.inArray( pComponent.typeId, model.NO_NODE_COMP_TYPES ) > -1 ) {
                lComponent = this.checkComponentHasNode( pComponent.getParent() );
            } else {
                lComponent = pComponent;
            }

            return lComponent;
        }, // checkComponentHasNode
        addComponentClass: function( pComponent, pClass, pTree$ ) {
            let lComponent = this.checkComponentHasNode( pComponent );

            this.updateComponentNode( lComponent, pTree$, function(){
                if ( !( this.data && this.data.isPlain ) ) {
                    this.classes += " " + pClass;
                }
            } );

        }, // addComponentClass
        removeComponentClass: function( pComponent, pClass, pTree$ ) {
            let lComponent = this.checkComponentHasNode( pComponent );

            this.updateComponentNode( lComponent, pTree$, function(){
                this.classes =
                    $.grep( this.classes.split( " " ), function( pValue ) {
                        return ( pValue !== pClass );
                    } ).join( " " );
            } );

        }, // removeComponentClass
        getComponentHierarchyValues: function( pNode ) {
            let self = this;
            // sets the specified attribute value from the parent or grand parent node
            function addValue( pOptions ) {

                let lComponent;

                if ( Object.prototype.hasOwnProperty.call( pOptions, "value" ) ) {
                    // Add static value
                    lValues.push( {
                        id:    pOptions.id,
                        value: pOptions.value
                    } );

                } else if ( pOptions.typeId ) {
                    // Add nearest component with that type
                    lComponent = self.getNearestComponent( pOptions.typeId, pNode._parent );

                    lValues.push( {
                        id:    pOptions.id,
                        value: ( lComponent ) ? lComponent.id : ""
                    } );

                } else if ( pOptions.id ) {
                    // Add nearest property value
                    lValues.push( {
                        id:    pOptions.id,
                        value: self.getNearestValue( pOptions.id, pNode._parent ) + ""
                    } );

                }
            }

            let lValues = [];

            switch ( pNode.type ) {
                case "region":
                    if ( pNode._parent.type === "page_slot" ) {
                        addValue( { id: model.PROP.PARENT_REGION, value: "" } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    } else if ( pNode._parent.type === "region" ) {
                        addValue( { id: model.PROP.PARENT_REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER, value: "" } ); // default value calculated in pe.callback.js _setSlot
                    } else {
                        addValue( { id: model.PROP.PARENT_REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    }
                    break;
                case "item":
                    if ( pNode._parent.type === "page_slot" ) {
                        addValue( { id: model.PROP.REGION, value: "" } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    } else if ( pNode._parent.type === "region" ) {
                        addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER, value: "" } ); // default value calculated in pe.callback.js _setSlot
                    } else {
                        addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    }
                    break;
                case "button":
                    if ( pNode._parent.type === "page_slot" ) {
                        addValue( { id: model.PROP.REGION, value: "" } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    } else if ( pNode._parent.type === "region" ) {
                        addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER, value: "" } ); // default value calculated in pe.callback.js _setSlot
                    } else {
                        addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                        addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                    }
                    break;
                case "da_action":
                    addValue( { id: model.PROP.DA_EVENT, typeId: model.COMP_TYPE.DA_EVENT } );
                    addValue( { id: model.PROP.FIRE_WHEN_EVENT_RESULT_IS } );
                    break;
                case "computation":
                    addValue( { id: model.PROP.COMPUTATION_POINT } );
                    break;
                case "process":
                    if ( pNode._parent.type === "processes" && pNode._parent._parent.type === "process" ) {
                        addValue( { id: model.PROP.PARENT_PROCESS, typeId: model.COMP_TYPE.PAGE_PROCESS } );
                    } else {
                        addValue( { id: model.PROP.PROCESS_POINT } );
                    }
                    break;
                case "branch":
                    addValue( { id: model.PROP.BRANCH_POINT } );
                    break;
                case "facet_group_item":
                    addValue({ id: model.PROP.FACET_GROUP,          typeId: model.COMP_TYPE.FACET_GROUP });
                    addValue({ id: model.PROP.HIDDEN_PARENT_REGION, typeId: model.COMP_TYPE.REGION });
                    break;
                case "sfilter_group_item":
                    addValue({ id: model.PROP.SFILTER_GROUP,        typeId: model.COMP_TYPE.SFILTER_GROUP });
                    addValue({ id: model.PROP.HIDDEN_PARENT_REGION, typeId: model.COMP_TYPE.REGION });
                    break;
            }

            return lValues;
        }, // getComponentHierarchyValues
        isCreatable: function( pNodes, pValidTypes ) {
            // Note: We don't support "Create" operations if more than one nodes are selected
            return (  pNodes.length === 1
                   && $.inArray( pNodes[ 0 ].type, pValidTypes ) !== -1
                   && !model.isPageReadOnly()
                   );
        }, // isCreatable
        _getContextMenu: function( entries ) {

            let self = this,
                lId    = 0;

            function getCreateTitle( pTypeId ) {
                return formatNoEscape( "CREATE", model.getComponentType( pTypeId ).title.singular );
            }

            function execute( pFunction ){
                return pFunction.call( self.getSelectedNodes() );
            }

            function isNotGlobal( pNodes, pValidTypes ) {
                if ( model.isGlobalPage() ) {
                    return false;
                } else {
                    return self._isCreatable( pNodes, pValidTypes );
                }
            }

            function addContextMenuEntry( contextMenuEntry ) {

                let lContextMenuEntry = {
                        label:       contextMenuEntry.label,
                        accelerator: contextMenuEntry.accelerator,
                        type:        contextMenuEntry.type
                    },
                    lAction,
                    lVisible;

                lId += 1;
                lContextMenuEntry.id = self.id + "_ctx_" + lId;

                if ( !lContextMenuEntry.type ) {
                    lContextMenuEntry.type = "action";
                    lAction    = contextMenuEntry.action;
                }

                if ( contextMenuEntry.typeId ) {
                    if ( !contextMenuEntry.label ) {
                        lContextMenuEntry.label = getCreateTitle( contextMenuEntry.typeId );
                    }

                    if ( !lAction ) {
                        lAction = function(){
                            self.createComponent( this[ 0 ], contextMenuEntry.typeId );
                        };
                    }
                }

                lContextMenuEntry.action = function() {
                    return execute( lAction );
                };

                if ( contextMenuEntry.visible ) {

                    if ( typeof contextMenuEntry.visible === "function" ) {
                        lVisible = contextMenuEntry.visible;
                    } else if ( Array.isArray( contextMenuEntry.visible ) ) {
                        lVisible = function(){
                            return self._isCreatable( this, contextMenuEntry.visible );
                        };
                    } else if ( contextMenuEntry.visible.global === false ) {
                        lVisible = function(){
                            return isNotGlobal( this, contextMenuEntry.visible.types );
                        };
                    } else {
                        lVisible = function(){
                            return self._isCreatable( this, contextMenuEntry.visible.types );
                        };
                    }

                    lContextMenuEntry.hide = function() {
                        return !execute( lVisible );
                    };
                }

                if ( contextMenuEntry.disabled ) {
                    lContextMenuEntry.disabled = function() {
                        return execute( contextMenuEntry.disabled );
                    };
                }

                return lContextMenuEntry;
            }

            return entries.map( entry => addContextMenuEntry( entry ) );
        }
    } );

    $.apex.designerTree.addNode = function( pHeaderNode, pOptions ) {

        let lSetFilter = pOptions.setFilter,
            lHeaderTitle,
            lComponents,
            lFilters   = [],
            lConfigMap = {},
            lHeaderFilter,
            lHeaderNode,
            lNode,
            i;

        if ( lSetFilter === undefined ) {
            lSetFilter = "parent";
        }

        if ( pOptions.header === false ) {
            lHeaderNode = pHeaderNode;

            if ( lSetFilter === "parent" ) {
                for ( i = 0; i < pOptions.component.filter.properties.length; i++ ) {
                    pHeaderNode.data[ pOptions.component.filter.properties[ i ].id ] = pOptions.component.filter.properties[ i ].value;
                }
            }
        } else {
            if ( pOptions.header.component instanceof model.Component ) {
                lHeaderTitle = pOptions.header.component.getDisplayTitle();
            } else if ( pOptions.header.title ) {
                lHeaderTitle = pOptions.header.title;
            } else {
                lHeaderTitle = model.getComponentType( pOptions.component.typeId ).title.plural;
            }

            if ( lSetFilter ) {

                lHeaderFilter = {
                    setFilter:  lSetFilter,
                    properties: []
                };

                if ( Array.isArray( pOptions.component ) ) {
                    for ( i = 0; i < pOptions.component.length; i++ ) {
                        lHeaderFilter.properties = lHeaderFilter.properties.concat( pOptions.component[ i ].filter.properties );
                    }
                } else if ( pOptions.component.filter.properties ) {
                    lHeaderFilter.properties = pOptions.component.filter.properties;
                }
            }

            lHeaderNode = $.apex.designerTree.addHeaderNode( pHeaderNode, {
                title:          lHeaderTitle,
                type:           pOptions.header.type,
                id:             pOptions.header.id,
                idPostfix:      pOptions.header.idPostfix,
                isPlain:        pOptions.header.isPlain,
                hasWarnings:    pOptions.header.hasWarnings,
                hasErrors:      pOptions.header.hasErrors,
                isOpen:         pOptions.header.isOpen,
                openAllParents: pOptions.header.openAllParents,
                omitIfEmpty:    pOptions.header.omitIfEmpty,
                component:      pOptions.header.component,
                filter:         lHeaderFilter
            } );
        }

        if ( Array.isArray( pOptions.component ) ) {

            for ( i = 0; i < pOptions.component.length; i++ ) {
                lFilters[ i ] = {
                    typeId: pOptions.component[ i ].typeId,
                    filter: pOptions.component[ i ].filter
                };
                lConfigMap[ pOptions.component[ i ].typeId ] = pOptions.component[ i ];
            }

        } else {

            lFilters[ 0 ] = {
                typeId: pOptions.component.typeId,
                filter: pOptions.component.filter
            };
            lConfigMap[ pOptions.component.typeId ] = pOptions.component;

        }

        // Get and emit all components specified by the filter
        lComponents = model.getComponentsAdvanced( lFilters );

        for ( i = 0; i < lComponents.length; i++ ) {
            if ( lConfigMap[ lComponents[ i ].typeId ].addSubComponents ) {
                lNode = $.apex.designerTree.addChildNode( lHeaderNode, {
                    title:          lComponents[ i ].getDisplayTitle(),
                    type:           lConfigMap[ lComponents[ i ].typeId ].type,
                    component:      lComponents[ i ],
                    isHeader:       false,
                    isPlain:        lConfigMap[ lComponents[ i ].typeId ].isPlain,
                    isOpen:         lConfigMap[ lComponents[ i ].typeId ].isOpen,
                    openAllParents: ( lComponents[ i ].isOnGlobalPage() ) ? false : lConfigMap[ lComponents[ i ].typeId ].openAllParents,
                    omitIfEmpty:    lConfigMap[ lComponents[ i ].typeId ].omitIfEmpty
                } );

                lConfigMap[ lComponents[ i ].typeId ].addSubComponents( lNode, lComponents[ i ] );

            } else {
                $.apex.designerTree.addLeafNode( lHeaderNode, {
                    title:          lComponents[ i ].getDisplayTitle(),
                    type:           lConfigMap[ lComponents[ i ].typeId ].type,
                    isPlain:        lConfigMap[ lComponents[ i ].typeId ].isPlain,
                    component:      lComponents[ i ],
                    openAllParents: ( lComponents[ i ].isOnGlobalPage() ) ? false : lConfigMap[ lComponents[ i ].typeId ].openAllParents
                } );
            }
        }

    };

    $.apex.designerTree.addLeafNode = function( pHeaderNode, pOptions ) {

        let lNode = {
                type:     pOptions.type,
                label:    pOptions.title,
                classes:  "",
                data:     {},
                commands: {}
            };

        if ( pOptions.component instanceof model.Component ) {
            lNode.data = {
                typeId:      pOptions.component.typeId,
                componentId: pOptions.component.id,
                isPlain:     pOptions.isPlain
            };
            if ( !pOptions.isPlain ) {
                if ( pd.isNever( pOptions.component ) || pd.isInactive( pOptions.component ) ) {
                    lNode.classes = pd.CSS.IS_NEVER;
                } else if ( pd.isConditional( pOptions.component ) ) {
                    lNode.classes = pd.CSS.IS_CONDITIONAL;
                }
                if ( pOptions.component.hasChanged() ) {
                    lNode.classes += " " + pd.CSS.IS_CHANGED;
                }
                if ( pOptions.component.hasErrors() ) {
                    lNode.classes += " " + pd.CSS.IS_ERROR;
                    lNode.commands.openAllParents = true; // always show node if it has an error
                }
                if ( pOptions.component.hasWarnings() ) {
                    lNode.classes += " " + pd.CSS.IS_WARNING;
                }
                // highlight a workflow version if it is active
                if ( pOptions.component.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
                    let state = pOptions.component.getProperty( model.PROP.STATE ).getValue();
                    if ( state === "ACTIVE" ) {
                        lNode.label += ` [${ pd.msg( "WF.ACTIVE" ) }]`;
                    } else if ( state === "DEVELOPMENT" ) {
                        lNode.label += ` [${ pd.msg( "WF.DEV" ) }]`;
                    }
                }
            }
            if ( !pOptions.title ) {
                lNode.label = pOptions.component.getDisplayTitle();
            }
        } else {

            if ( pOptions.hasWarnings ) {
                lNode.classes += " " + pd.CSS.IS_WARNING;
            }

            if ( pOptions.hasErrors ) {
                lNode.classes += " " + pd.CSS.IS_ERROR;
                lNode.commands.openAllParents = true; // always show node if it has an error
            }
        }

        if ( pOptions.isNotImportant ) {
            lNode.classes += " " + pd.CSS.IS_NOT_IMPORTANT;
        }

        // If it's not a unique ID we will add a prefix with the ID of the parent node
        if ( Object.prototype.hasOwnProperty.call( pOptions, "id" ) ) {
            lNode.id = pOptions.id;
        } else {
            if ( pOptions.component instanceof model.Component ) {
                lNode.id = lNode.type + "_" + pOptions.component.typeId + "_" + pOptions.component.id;
                // Only a few component types can appear multiple times in the tree, for those we have to
                // include the parent id to make them unique
                if ( lNode.type.indexOf( "inline_" ) === 0 || lNode.type.indexOf( "page_load_da_" ) === 0 || lNode.type === "workflow_transition" || lNode.type === "workflow_branch" ) {
                    lNode.id = pHeaderNode.id + "_" + lNode.id;
                }
            } else {
                lNode.id = pOptions.type;
                if ( pOptions.idPostfix ) {
                    lNode.id += pOptions.idPostfix;
                }
                if ( pHeaderNode ) {
                    lNode.id = pHeaderNode.id + "_" + lNode.id;
                }
            }
        }

        if ( pOptions.tooltip ) {
            lNode.tooltip = pOptions.tooltip;
        }

        if ( Object.prototype.hasOwnProperty.call( pOptions, "icon" ) ) {
            if ( pOptions.icon === false ) {
                lNode.icon = null;
            } else {
                lNode.icon = pOptions.icon;
            }
        }

        if ( pOptions.openAllParents ) {
            lNode.commands.openAllParents = true;
        }

        if ( pHeaderNode ) {
            pHeaderNode.children.push( lNode );
        }

        return lNode;
    };

    $.apex.designerTree.addChildNode = function( pHeaderNode, pOptions ) {

        let lNode = $.apex.designerTree.addLeafNode( pHeaderNode, $.extend( { isHeader: true }, pOptions ) );

        lNode.children = [];
        lNode.state    = {};

        if ( pOptions.isOpen ) {
            lNode.state = {
                opened: true
            };
        }

        if ( pOptions.omitIfEmpty ) {
            lNode.commands.omitIfEmpty = true;
        }

        if ( pOptions.showHasComponents ) {
            lNode.commands.showHasComponents = true;
        }

        return lNode;
    };

    $.apex.designerTree.addHeaderNode = function( pHeaderNode, pOptions ) {

        let lNode;

        pOptions = $.extend( {
            component:         {},
            hasWarnings:       false,
            hasErrors:         false,
            isOpen:            false,
            isPlain:           false,
            openAllParents:    false,
            omitIfEmpty:       false,
            showHasComponents: false
        }, pOptions );

        pOptions.isHeader       = true;
        pOptions.isNotImportant = true;

        lNode = $.apex.designerTree.addChildNode( pHeaderNode, pOptions );

        if ( pOptions.filter ) {
            if ( pOptions.filter.setFilter === "parent" ) {
                for ( let i = 0; i < pOptions.filter.properties.length; i++ ) {
                    pHeaderNode.data[ pOptions.filter.properties[ i ].id ] = pOptions.filter.properties[ i ].value;
                }
            } else if ( pOptions.filter.properties ) {
                for ( let i = 0; i < pOptions.filter.properties.length; i++ ) {
                    lNode.data[ pOptions.filter.properties[ i ].id ] = pOptions.filter.properties[ i ].value;
                }
            }
        }
        if ( pOptions.data ) {
            for ( let lKey in pOptions.data ) {
                if ( Object.prototype.hasOwnProperty.call( pOptions.data, lKey ) ) {
                    lNode.data[ lKey ] = pOptions.data[ lKey ];
                }
            }
        }

        return lNode;
    };

    $.apex.designerTree.postProcessNodes = function( pNode ) {

        // Can the node contain sub nodes or is it the leaf node?
        if ( pNode.children ) {

            // Recursively loop through all sub nodes to find out if the current node should be cleaned up or if
            // it should automatically be opened
            for ( let i = 0; i < pNode.children.length; ) {
                if ( $.apex.designerTree.postProcessNodes( pNode.children[ i ] ) ) {
                    pNode.children.splice( i, 1 );
                } else {
                    if ( pNode.children[ i ].commands.openAllParents ) {
                        if ( !pNode.state.opened ) {
                            pNode.state.opened = true;

                        }
                        if ( !pNode.commands.openAllParents ) {
                            pNode.commands.openAllParents = true;
                        }
                    }
                    // In a second step, check if a parent node with showHasComponents = true should be highlighted if one of the
                    // sub nodes is a node of type component
                    if (  ( pNode.children[ i ].state && pNode.children[ i ].state.hasComponents )
                    || (  Object.prototype.hasOwnProperty.call( pNode.children[ i ].data, "componentId" )
                        && !model.getComponents( pNode.children[ i ].data.typeId, { id: pNode.children[ i ].data.componentId } )[ 0 ].isOnGlobalPage()
                        )
                        )
                    {
                        if ( !pNode.state.hasComponents ) {
                            pNode.state.hasComponents = true;
                            if ( pNode.commands.showHasComponents ) {
                                pNode.classes += " " + pd.CSS.IS_POPULATED;
                            }
                        }
                    }
                    i += 1;
                }
            }

            // If the node doesn't contain any children, make it a leaf node
            if ( pNode.children.length === 0 ) {
//                delete pNode[ "children" ];
                delete pNode.state;
            }

            return ( pNode.commands.omitIfEmpty && ( ( pNode.children && pNode.children.length === 0 ) || !pNode.children ) );
        } else {
            delete pNode.state;
            return false;
        }
    };

    function formatNoEscape( pKey ) {
        function msg( pKey ) {
            return lang.getMessage( "PD.TREE." + pKey );
        }
        let pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    }

} ) ( apex.jQuery, window.pe, window.pageDesigner, apex.lang );