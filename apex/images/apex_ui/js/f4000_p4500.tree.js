/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This module is part of the Page Designer and contains the controller logic for the tree view.
 */

( function( model, pd, util, debug, lang, $ ) {
    "use strict";

    var CSS = {
            IS_HEADER:         "is-header",
            IS_EVENT_VIEW:     "is-event-view",
            IS_NOT_IMPORTANT:  "is-not-important",
            IS_POPULATED:      "is-populated",
            IS_RUN_ON_INIT:    "is-run-on-init"
        },
        ROW_SELECTOR_COLUMN_NAME = "CHECK$01",
        MAX_DA_ACTION_PLUGIN_ATTRIBUTES = 15,
        SHARED_COMP_TYPES = [
            {
                title:  msg( "NAVIGATION_MENU_LIST" ),
                typeId: model.COMP_TYPE.LIST,
                type:   "navigation_menu_list"
            }, {
                title:  msg( "NAVIGATION_BAR_LIST" ),
                typeId: model.COMP_TYPE.LIST,
                type:   "navigation_bar_list"
            }, {
                title:  msg( "TAB_SET" ),
                typeId: model.COMP_TYPE.TAB_SET,
                type:   "tab_set"
            }, {
                typeId: model.COMP_TYPE.LOV,
                type:   "lov"
            }, {
                typeId: model.COMP_TYPE.LIST,
                type:   "list"
            }, {
                typeId: model.COMP_TYPE.AUTHORIZATION,
                type:   "authorization"
            /*
            }, {
                typeId: model.COMP_TYPE.PLUGIN,
                type:   "plugin"
            */
            }, {
                typeId: model.COMP_TYPE.BUILD_OPTION,
                type:   "build_option"
            }, {
                typeId: model.COMP_TYPE.AI_CONFIG,
                type:   "ai_config"
            }, {
                typeId: model.COMP_TYPE.DATA_LOAD_TABLE,
                type:   "data_load_table"
            }, {
                typeId: model.COMP_TYPE.DATA_LOAD_DEF,
                type:   "data_load_definition"
            }, {
                typeId: model.COMP_TYPE.EMAIL_TEMPLATE,
                type:   "email_template"
            }, {
                typeId: model.COMP_TYPE.WS_REF,
                type:   "web_service"
            }, {
                typeId: model.COMP_TYPE.BREADCRUMB,
                type:   "breadcrumb"
            }, {
                typeId: model.COMP_TYPE.SEARCH_CONFIG,
                type:   "search_config"
            }, {
                typeId: model.COMP_TYPE.REPORT_QUERY,
                type:   "report_query"
            }, {
                title: msg( "TEMPLATES" ),
                type:  "template",
                children: [
                    {
                        titleTypeId: model.COMP_TYPE.PAGE,
                        typeId:      model.COMP_TYPE.PAGE_TEMPLATE,
                        type:        "page_template"
                    }, {
                        titleTypeId: model.COMP_TYPE.PAGE_ITEM,
                        typeId:      model.COMP_TYPE.FIELD_TEMPLATE,
                        type:        "field_template"
                    }, {
                        titleTypeId: model.COMP_TYPE.BUTTON,
                        typeId:      model.COMP_TYPE.BUTTON_TEMPLATE,
                        type:        "button_template"
                    }, {
                        titleTypeId: model.COMP_TYPE.REGION,
                        typeId:      model.COMP_TYPE.REGION_TEMPLATE,
                        type:        "region_template"
                    }, {
                        titleTypeId: model.COMP_TYPE.LIST,
                        typeId:      model.COMP_TYPE.LIST_TEMPLATE,
                        type:        "list_template"
                    }, {
                        title:       msg( "CLASSIC_REPORT" ),
                        typeId:      model.COMP_TYPE.REPORT_TEMPLATE,
                        type:        "report_template"
                    }, {
                        title:       msg( "NAVIGATION_MENU_LIST" ),
                        typeId:      model.COMP_TYPE.LIST_TEMPLATE,
                        type:        "nav_list_template"
                    }, {
                        titleTypeId: model.COMP_TYPE.BREADCRUMB,
                        typeId:      model.COMP_TYPE.BREADCRUMB_TEMPLATE,
                        type:        "breadcrumb_template"
                    }, {
                        title:       msg( "LEGACY_CALENDAR" ),
                        typeId:      model.COMP_TYPE.CALENDAR_TEMPLATE,
                        type:        "calendar_template"
                    }
                ]
            }
        ];

    const hasOwnProperty = util.hasOwnProperty;

    function msg( pKey ) {
        return lang.getMessage( "PD.TREE." + pKey );
    }

    function formatNoEscape( pKey ) {
        var pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    }

    function formatNoEscapeAll( pKey ) {
        var pattern = lang.getMessage( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.formatNoEscape.apply( this, args );
    }

    function formatPostfix( pKey, pValue, pResult ) {
        if ( pResult ) {
            return formatNoEscapeAll( pKey, pValue );
        } else {
            return pValue;
        }
    }

    /*
     * Adds a child tree node to a parent node which can itself contain child nodes.
     *
     * @param {Object} pHeaderNode Parent tree node where we add a new child
     * @param {Object} pOptions    $$$
     *
     * @return {Object} new tree node
     */
    function addChildNode( pHeaderNode, pOptions ) {

        var lNode = addLeafNode( pHeaderNode, $.extend( { isHeader: true }, pOptions ) );

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
    }

    /*
     * Adds a leaf tree node to a parent node.
     *
     * @param {Object} pHeaderNode Parent tree node where we add a new child
     * @param {Object} pOptions    $$$
     *
     * @return {Object} new tree node
     */
    function addLeafNode( pHeaderNode, pOptions ) {

        var lNode = {
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
                if ( pd.isNever( pOptions.component ) ) {
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
                // highlight a dynamic action - action if it fires during page load/row init
                if ( pOptions.component.typeId === model.COMP_TYPE.DA_ACTION && pOptions.component.getProperty( model.PROP.FIRE_ON_PAGE_LOAD ).getValue() === "Y" ) {
                    lNode.classes += " " + CSS.IS_RUN_ON_INIT;
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
            lNode.classes += " " + CSS.IS_NOT_IMPORTANT;
        }

        // If it's not a unique ID we will add a prefix with the ID of the parent node
        if ( hasOwnProperty( pOptions, "id" ) ) {
            lNode.id = pOptions.id;
        } else {
            if ( pOptions.component instanceof model.Component ) {
                lNode.id = lNode.type + "_" + pOptions.component.typeId + "_" + pOptions.component.id;
                // Only a few component types can appear multiple times in the tree, for those we have to
                // include the parent id to make them unique
                if ( lNode.type.indexOf( "inline_" ) === 0 || lNode.type.indexOf( "page_load_da_" ) === 0 ) {
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

        if ( hasOwnProperty( pOptions, "icon" ) ) {
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
    }


    function addHeaderNode( pHeaderNode, pOptions ) {

        var lNode, i;

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

        lNode = addChildNode( pHeaderNode, pOptions );

        if ( pOptions.filter ) {
            if ( pOptions.filter.setFilter === "parent" ) {
                for ( i = 0; i < pOptions.filter.properties.length; i++ ) {
                    pHeaderNode.data[ pOptions.filter.properties[ i ].id ] = pOptions.filter.properties[ i ].value;
                }
            } else if ( pOptions.filter.properties ) {
                for ( i = 0; i < pOptions.filter.properties.length; i++ ) {
                    lNode.data[ pOptions.filter.properties[ i ].id ] = pOptions.filter.properties[ i ].value;
                }
            }
        }
        if ( pOptions.data ) {
            for ( var lKey in pOptions.data ) {
                if ( hasOwnProperty( pOptions.data, lKey ) ) {
                    lNode.data[ lKey ] = pOptions.data[ lKey ];
                }
            }
        }

        return lNode;
    }


    function postProcessNodes( pNode ) {

        // Can the node contain sub nodes or is it the leaf node?
        if ( pNode.children ) {

            // Recursively loop through all sub nodes to find out if the current node should be cleaned up or if
            // it should automatically be opened
            for ( var i = 0; i < pNode.children.length; ) {
                if ( postProcessNodes( pNode.children[ i ] ) ) {
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
                       || (  hasOwnProperty( pNode.children[ i ].data, "componentId" )
                          && !model.getComponents( pNode.children[ i ].data.typeId, { id: pNode.children[ i ].data.componentId } )[ 0 ].isOnGlobalPage()
                          )
                        )
                    {
                        if ( !pNode.state.hasComponents ) {
                            pNode.state.hasComponents = true;
                            if ( pNode.commands.showHasComponents ) {
                                pNode.classes += " " + CSS.IS_POPULATED;
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
    }


    function addNode( pHeaderNode, pOptions ) {

        var lSetFilter = pOptions.setFilter,
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

            lHeaderNode = addHeaderNode( pHeaderNode, {
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
            if ( pd.isDisplayed( lComponents[ i ] ) ) {
                if ( lConfigMap[ lComponents[ i ].typeId ].addSubComponents ) {
                    lNode = addChildNode( lHeaderNode, {
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
                    addLeafNode( lHeaderNode, {
                        title:          lComponents[ i ].getDisplayTitle(),
                        type:           lConfigMap[ lComponents[ i ].typeId ].type,
                        isPlain:        lConfigMap[ lComponents[ i ].typeId ].isPlain,
                        component:      lComponents[ i ],
                        openAllParents: ( lComponents[ i ].isOnGlobalPage() ) ? false : lConfigMap[ lComponents[ i ].typeId ].openAllParents
                    } );
                }
            }
        }

    } // addNode


    function getPointTitle( pComponentTypeId, pPoint ) {

        var lPropertyId;

        if ( pComponentTypeId === model.COMP_TYPE.BRANCH ) {
            lPropertyId = model.PROP.BRANCH_POINT;
        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_COMPUTATION ) {
            lPropertyId = model.PROP.COMPUTATION_POINT;
        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_PROCESS ) {
            lPropertyId = model.PROP.PROCESS_POINT;
        }

        return model.getLovTitle( pComponentTypeId, lPropertyId, pPoint );

    } // getPointTitle


    function addBranches( pHeaderNode, pFilter, pOmitIfEmpty ) {

        var lHeader = {
            type:        "branches",
            isOpen:      true,
            omitIfEmpty: pOmitIfEmpty
        };

        // Create the Header Node and for each branch a node
        addNode( pHeaderNode, {
            header:    lHeader,
            component: {
                type:   "branch",
                typeId: model.COMP_TYPE.BRANCH,
                filter: {
                    properties: [{
                        id:    model.PROP.BRANCH_POINT,
                        value: pFilter.processPoint
                    }]
                },
                openAllParents: true
            }
        } );

    }


    function addValidations( pHeaderNode, pFilter, pOmitIfEmpty ) {

        var lPrefix           = "inline_",
            lFilterProperties = [],
            lFilterFunction,
            lItemName,
            lColumnName,
            lHeader = {
                isOpen:      true,
                omitIfEmpty: pOmitIfEmpty
            };

        if ( hasOwnProperty( pFilter, "regionColumn" ) ) {
            // Only show validations of that region column
            lColumnName = pFilter.regionColumn.getProperty( model.PROP.COLUMN_NAME ).getValue();
            lFilterFunction = function(){
                var lProperty;

                if ( this.getProperty( model.PROP.VALIDATION_REGION ).getValue() !== pFilter.region.id ) {
                    return false;
                }

                // If the column name is used as "Validation Item" or in the "Associated Column", we show
                // that validation below that region column.
                lProperty = this.getProperty( model.PROP.REGION_VAL_COLUMN );
                return (  lProperty && lProperty.getValue() === lColumnName
                       || this.getProperty( model.PROP.ASSOCIATED_COLUMN ).getValue() === lColumnName
                       );
            };

        } else if ( hasOwnProperty( pFilter, "region" ) ) {

            lHeader.isOpen = false;

            // Only show validations of that region
            lFilterFunction = function() {

                // Don't show the validation if it belongs to a different region
                // Or has a value in the "Associated Column" property
                // Or has the "Validate Column" property
                return !(  this.getProperty( model.PROP.VALIDATION_REGION ).getValue() !== pFilter.region.id
                        || this.getProperty( model.PROP.ASSOCIATED_COLUMN ).getValue() !== ""
                        || this.getProperty( model.PROP.REGION_VAL_COLUMN )
                        );

            };

        } else if ( hasOwnProperty( pFilter, "item" ) ) {
            // Only show validations of the current page item which use it for comparison or as associated item
            lItemName = pFilter.item.getProperty( model.PROP.ITEM_NAME ).getValue();

            lFilterFunction = function() {
                var lProperty;

                if ( this.getProperty( model.PROP.VALIDATION_REGION ).getValue() !== "" ) {
                    return false;
                }

                // Show the validation if the page items is used in the
                // a) "Associated Item" property or
                // b) "Validation Item" property
                lProperty = this.getProperty( model.PROP.VAL_ITEM );
                return (  this.getProperty( model.PROP.ASSOCIATED_ITEM ).getValue() === pFilter.item.id
                       || ( lProperty && lProperty.getValue() === lItemName )
                       );
            };

        } else {
            // Show all validations

            lPrefix = "";
            lHeader.isOpen = true;
            lHeader.openAllParents = true;

        }

        lHeader.type = lPrefix + "validations";

        addNode( pHeaderNode, {
            header:    lHeader,
            setFilter: false,
            component: {
                type:   lPrefix + "validation",
                typeId: model.COMP_TYPE.VALIDATION,
                filter: {
                    properties:     lFilterProperties,
                    filterFunction: lFilterFunction
                }
            }
        } );
    }


    function addComputations( pHeaderNode, pFilter, pOmitIfEmpty, pOpenAllParents ) {

        var lFilterProperty,
            lPrefix = ( hasOwnProperty( pFilter, "item" ) ) ? "inline_" : "",
            lHeader = {
                type:        lPrefix + "computations",
                isOpen:      true,
                omitIfEmpty: pOmitIfEmpty
            };

        // Do we have to show all computations of a computation process point?
        if ( hasOwnProperty( pFilter, "processPoint" ) ) {

            lFilterProperty = {
                id:    model.PROP.COMPUTATION_POINT,
                value: pFilter.processPoint
            };

        // Or all computations for a page item?
        } else if ( hasOwnProperty( pFilter, "item" ) ) {

            lFilterProperty = {
                id:    model.PROP.COMPUTATION_ITEM_NAME,
                value: pFilter.item.getProperty( model.PROP.ITEM_NAME ).getValue()
            };
        }

        // Create the Header Node and for each computation a node
        addNode( pHeaderNode, {
            header:    lHeader,
            component: {
                type:   lPrefix + "computation",
                typeId: model.COMP_TYPE.PAGE_COMPUTATION,
                filter: {
                    properties: [ lFilterProperty ]
                },
                openAllParents: pOpenAllParents
            }
        } );
    }


    function addProcesses( pHeaderNode, pFilter, pOmitIfEmpty, pOpenAllParents ) {

        function addChildren( pProcessNode, pProcess ) {

            var lProcessType = pProcess.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();

            if ( lProcessType === "NATIVE_CREATE_TASK" ) {

                addNode( pProcessNode, {
                    header: {
                        type:        "task_params",
                        isOpen:      true,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "task_param",
                        typeId: model.COMP_TYPE.PAGE_PROCESS_TASK_PARAM,
                        filter: {
                            parentId: pProcess.id
                        }
                    }
             } );
            }

            if ( lProcessType === "NATIVE_WORKFLOW" ) {
                if ( pProcess.getProperty( model.getPluginProperty( pProcess.typeId, lProcessType, 1 ).id ).getValue() === "START" ) {
                    addNode( pProcessNode, {
                        header: {
                            type:        "workflow_params",
                            isOpen:      true,
                            omitIfEmpty: true
                        },
                        setFilter: false,
                        component: {
                            type:   "workflow_param",
                            typeId: model.COMP_TYPE.PAGE_PROCESS_WF_PARAM,
                            filter: {
                                parentId: pProcess.id
                            }
                        }
                 } );
                }
            }

            if ( lProcessType === "NATIVE_INVOKE_API" ) {

                addNode( pProcessNode, {
                    header: {
                        type:        "api_params",
                        isOpen:      false,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "api_param",
                        typeId: model.COMP_TYPE.PAGE_PROC_API_PARAM,
                        filter: {
                            parentId: pProcess.id
                        }
                    }
                } );

                addNode( pProcessNode, {
                    header: {
                        type:        "api_ws_params",
                        isOpen:      false,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "api_ws_param",
                        typeId: model.COMP_TYPE.PAGE_PROC_WS_PARAM,
                        filter: {
                            parentId: pProcess.id
                        }
                    }
                } );

            } else if ( [ "NATIVE_WEB_SERVICE", "NATIVE_WEB_SERVICE_LEGACY" ].includes( lProcessType ) ) {

                addNode( pProcessNode, {
                    header: {
                        type:        "ws_params",
                        isOpen:      true,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "ws_param",
                        typeId: model.COMP_TYPE.PAGE_PROC_WS_P_I,
                        filter: {
                            parentId: pProcess.id
                        }
                    }
                } );

                if ( pProcess.getProperty( model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, lProcessType, 2 ).id ).getValue() === "ITEMS" ) { // Store Result In

                    addNode( pProcessNode, {
                        header: {
                            type:        "ws_params",
                            isOpen:      true,
                            omitIfEmpty: true
                        },
                        setFilter: false,
                        component: {
                            type:   "ws_param",
                            typeId: model.COMP_TYPE.PAGE_PROC_WS_P_O,
                            filter: {
                                parentId: pProcess.id
                            }
                        }
                    } );
                }

                addNode( pProcessNode, {
                    header: {
                        type:        "ws_params",
                        isOpen:      true,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "ws_param",
                        typeId: model.COMP_TYPE.PAGE_PROC_WS_P_A,
                        filter: {
                            parentId: pProcess.id
                        }
                    }
                } );

            }

            if ( lProcessType === "NATIVE_EXECUTION_CHAIN" ) {
                addNode( pProcessNode, {
                    header: {
                        type:        "processes",
                        isOpen:      true,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "process",
                        typeId: model.COMP_TYPE.PAGE_PROCESS,
                        filter: {
                            properties: [ {
                                             id:    model.PROP.PARENT_PROCESS,
                                             value: pProcess.id
                                         } ]
                        },
                        addSubComponents: addChildren
                    }
                } );
            }
            //
            //
        } // addChildren

        var lPrefix       = ( hasOwnProperty( pFilter, "region" ) ) ? "inline_" : "",
            lFilterProperty,
            lHeader;

        if ( pFilter.processPoint === "ON_DEMAND" ) {
            lHeader = false;
        } else {
            lHeader = {
                type:        lPrefix + "processes",
                isOpen:      true,
                omitIfEmpty: pOmitIfEmpty
            };
        }

        // Do we have to show all processes of a process point?
        if ( hasOwnProperty( pFilter, "processPoint" ) ) {

            lFilterProperty = {
                id:    model.PROP.PROCESS_POINT,
                value: pFilter.processPoint
            };

        } else if ( hasOwnProperty( pFilter, "region" ) ) {
            // Or all process for a region
            lFilterProperty = {
                id:    model.PROP.PROCESS_REGION,
                value: pFilter.region.id
            };
            lHeader.isOpen = false;
        }

        // Create the Header Node and for each process a node
        addNode( pHeaderNode, {
            header:    lHeader,
            component: {
                type:   lPrefix + "process",
                typeId: model.COMP_TYPE.PAGE_PROCESS,
                filter: {
                    properties: [ lFilterProperty ]
                },
                addSubComponents: addChildren,
                openAllParents:   pOpenAllParents
            }
        } );
    } // addProcesses

    function addMetaTags( pHeaderNode ) {

        // Create the Header Node and for each meta_tag a node
        addNode( pHeaderNode, {
            header:    {
                type:        "meta_tags",
                omitIfEmpty: true
            },
            component: {
                type:   "meta_tag",
                typeId: model.COMP_TYPE.META_TAG,
                filter: {
                    properties: []
                },
                openAllParents: true
            }
        } );
    }


    function addDynamicActions( pHeaderNode, pFilter ) {

        function addActions( pDaEventNode, pDaEvent, pResult, pTitle ) {

            // Create the Header Node and for each action a node
            addNode( pDaEventNode, {
                header: {
                    title:       pTitle,
                    type:        "da_actions_" + pResult,
                    isOpen:      true,
                    omitIfEmpty: false
                },
                setFilter: "header",
                component: {
                    type:   "da_action",
                    typeId: model.COMP_TYPE.DA_ACTION,
                    filter: {
                        parentId: pDaEvent.id,
                        properties: [{
                            id:    model.PROP.FIRE_WHEN_EVENT_RESULT_IS,
                            value: pResult.toUpperCase()
                        }]
                    }
                }
            } );
        }

        function addChildren( pDaEventNode, pDaEvent ) {
            addActions( pDaEventNode, pDaEvent, "true",  msg( "TRUE" ) );
            addActions( pDaEventNode, pDaEvent, "false", msg( "FALSE" ) );
        }

        var lPrefix,
            lSetFilter = false,
            lFilterProperties = [],
            lHeader = {
                title:       msg( "DYNAMIC_ACTIONS" ),
                isOpen:      true,
                omitIfEmpty: true
            };

        lPrefix = "inline_";
        if ( hasOwnProperty( pFilter, "regionColumn" ) ) {
            // Only show actions of that region column
            lFilterProperties.push( {
                id:    model.PROP.WHEN_IG_REGION,
                value: pFilter.region.id
            } );
            lFilterProperties.push( {
                id:    model.PROP.WHEN_COLUMNS,
                value: new RegExp( "(^|,|\\s)" + util.escapeRegExp( pFilter.regionColumn.getProperty( model.PROP.COLUMN_NAME ).getValue() ) + "($|,|\\s)" )
            } );

        } else if ( hasOwnProperty( pFilter, "region" ) ) {
            // Only show actions of that region
            lFilterProperties.push( {
                id:    model.PROP.WHEN_TYPE,
                value: "REGION"
            } );
            lFilterProperties.push( {
                id:    model.PROP.WHEN_REGION,
                value: pFilter.region.id
            } );
            lHeader.isOpen = false;

        } else if ( hasOwnProperty( pFilter, "item" ) ) {
            // Only show actions of the current page item
            lFilterProperties.push( {
                id:    model.PROP.WHEN_ITEMS,
                value: new RegExp( "(^|,|\\s)" + util.escapeRegExp( pFilter.item.getProperty( model.PROP.ITEM_NAME ).getValue() ) + "($|,|\\s)" )
            } );

        } else if ( hasOwnProperty( pFilter, "button" ) ) {
            // Only show actions for current button
            lFilterProperties.push( {
                id:    model.PROP.WHEN_BUTTON,
                value: pFilter.button.id
            } );

        } else if ( hasOwnProperty( pFilter, "event" ) ) {
            // Only show actions for the specified event
            lFilterProperties.push( {
                id:    model.PROP.EVENT,
                value: pFilter.event
            } );
            lPrefix    = "";
            lSetFilter = "header";
            if ( pFilter.event === "" ) {
                lHeader.title = msg( "UNDEFINED_EVENT" );
            } else {
                lHeader.title = model.getLovTitle( model.COMP_TYPE.DA_EVENT, model.PROP.EVENT, pFilter.event );
            }
            lHeader.idPostfix   = "_" + pFilter.event;
            lHeader.omitIfEmpty = false;

        }

        lHeader.type = lPrefix + "da_events";

        addNode( pHeaderNode, {
            header:    lHeader,
            setFilter: lSetFilter,
            component: {
                type:   lPrefix + "da_event",
                typeId: model.COMP_TYPE.DA_EVENT,
                filter: {
                    properties: lFilterProperties
                },
                addSubComponents: addChildren
            }
        } );
    }


    function addComponents( headerNode, options ) {

        function getHeader () {
            let header = {
                isOpen:      false,
                omitIfEmpty: true
            };

            if ( hasOwnProperty( options, "processPoint" ) ) {
                header.title       = options.processPoint.name;
                header.type        = "process_point";
                header.id          = options.processPoint.id;
                header.omitIfEmpty = ( !options.processPoint.isQuickPick );
            } else if ( hasOwnProperty( options, "slot"  ) ) {
                header.title       = formatPostfix( "MODEL.POSTFIX.LEGACY", options.slot.name, options.slot.isLegacy );

                if ( options.region ) {
                    header.type        = "region_slot";
                    header.id          = `region_${model.COMP_TYPE.REGION}_${options.region.id}_slot_${options.slot.placeholder}`;
                } else {
                    header.type        = "page_slot";
                    header.id          = `page_${model.COMP_TYPE.PAGE}_slot_${options.slot.placeholder}`;
                    header.omitIfEmpty = !options.slot.isQuickPick;
                }
            } else if ( hasOwnProperty( options, "validSlots" ) ) {
                header.title       = msg( "INVALID_SLOT" );
                header.hasWarnings = true;

                if ( options.region ) {
                    header.type        = "region_slot";
                    header.id          = `region_${model.COMP_TYPE.REGION}_${options.region.id}_invalid_slot`;
                } else {
                    header.type        = "page_slot";
                    header.id          = `page_${model.COMP_TYPE.PAGE}_invalid_slot`;
                }
            }

            return header;
        }

        function getFilter ( regionPropId ) {
            let filter = {
                properties: []
            };

            if ( hasOwnProperty( options, "processPoint" ) ) {

                filter.properties.push( {
                    id:    regionPropId,
                    value: ""
                } );
                filter.properties.push( {
                    id:    model.PROP.SLOT_PLACEHOLDER,
                    value: options.processPoint.id
                } );

            } else if ( hasOwnProperty( options, "slot"  ) ) {

                if ( options.region ) {
                    filter.properties.push( {
                        id:    regionPropId,
                        value: options.region.id
                    } );
                } else {
                    filter.properties.push( {
                        id:    regionPropId,
                        value: ""
                    } );
                }

                filter.properties.push( {
                    id:    model.PROP.SLOT_PLACEHOLDER,
                    value: options.slot.placeholder
                } );
            } else if ( hasOwnProperty( options, "validSlots" ) ) {

                if ( options.region ) {
                    filter.properties.push( {
                        id:    regionPropId,
                        value: options.region.id
                    } );
                } else {
                    filter.properties.push( {
                        id:    regionPropId,
                        value: ""
                    } );
                }

                // Find all components which reference a non-existing page slot
                filter.filterFunction = function() {

                    const slotPlaceholder = this.getPropertyValue( model.PROP.SLOT_PLACEHOLDER );

                    if ( slotPlaceholder ) {
                        // Checks if the slotPlaceholder exists in the validSlots
                        return !options.validSlots.find( validSlot => validSlot.placeholder === slotPlaceholder );
                    } else {
                        return false;
                    }
                };

            }

            return filter;
        }

        function addRegionChildren( regionNode, pRegion ) {

            var REGION_FUNCTIONS = {
                "NATIVE_CARDS":          addCard,
                "NATIVE_MAP_REGION":     addMapRegion,
                "NATIVE_IR":             addInteractiveReport,
                "NATIVE_IG":             addInteractiveGrid,
                "NATIVE_SQL_REPORT":     addClassicReport,
                "NATIVE_FNC_REPORT":     addClassicReport,
                "NATIVE_TABFORM":        addTabularForm,
                "NATIVE_JET_CHART":      addJetChart,
                "NATIVE_FACETED_SEARCH": addFacetedSearch,
                "NATIVE_SEARCH_REGION":  addSearchSources,
                "NATIVE_SMART_FILTERS":  addSmartFilters
            };

            const regionType = pRegion.getProperty( model.PROP.REGION_TYPE ).getValue();

            if ( !pRegion.isOnGlobalPage() ) {
                if ( hasOwnProperty( REGION_FUNCTIONS, regionType ) ) {
                    REGION_FUNCTIONS[ regionType ]( regionNode, pRegion );
                } else if ( /^(TMPL)/.test( regionType )) {
                    addTemplateComponentRegion( regionNode, pRegion );
                } else {
                    addRegionPluginAttributes( regionNode, pRegion );
                }
            }


            if ( pRegion.getProperty( model.PROP.SOURCE_WEB_SRC_QUERY ) ) {
                addNode( regionNode, {
                    header: {
                        type:        "region_web_src_params",
                        isOpen:      false,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "region_web_src_param",
                        typeId: model.COMP_TYPE.REGION_WS_PARAM,
                        filter: {
                            parentId: pRegion.id
                        }
                    }
                } );
            }

            addValidations   ( regionNode, { region: pRegion }, true );
            // todo addProcesses( regionNode, { region: pRegion }, true );
            addDynamicActions( regionNode, { region: pRegion } );

            if ( pRegion ) {
                const slots = model.getSlots( { regionId: pRegion.id } );
                for ( const slot of slots ) {
                    addComponents( regionNode, { region: pRegion, slot } );
                }
                // Emit invalid region slots
                addComponents( regionNode, { region: pRegion, validSlots: slots } );
            }
        } // addRegionChildren

        function addItemChildren( itemNode, pItem ) {

            addValidations   ( itemNode, { item: pItem }, true );
            addDynamicActions( itemNode, { item: pItem } );
            addComputations  ( itemNode, { item: pItem }, true );
        } // addItemChildren

        function addButtonChildren( buttonNode, pButton ) {

            addDynamicActions( buttonNode, { button: pButton } );
        } // addButtonChildren

        addNode( headerNode, {
            header:    getHeader(),
            setFilter: "header",
            component: [
                {
                    type:             "region",
                    typeId:           model.COMP_TYPE.REGION,
                    filter:           getFilter( model.PROP.PARENT_REGION ),
                    addSubComponents: addRegionChildren,
                    isOpen:           true,
                    openAllParents:   true,
                    omitIfEmpty:      false
                },
                {
                    type:             "item",
                    typeId:           model.COMP_TYPE.PAGE_ITEM,
                    filter:           getFilter( model.PROP.REGION ),
                    addSubComponents: addItemChildren,
                    isOpen:           false,
                    openAllParents:   true
                },
                {
                    type:             "button",
                    typeId:           model.COMP_TYPE.BUTTON,
                    filter:           getFilter( model.PROP.REGION ),
                    addSubComponents: addButtonChildren,
                    isOpen:           false,
                    openAllParents:   true
                }
            ]
        } );

    }

    function addMapRegion( pHeaderNode, pRegion ) {

        var lComponent = model.getComponents( model.COMP_TYPE.MAP_REGION, { parentId: pRegion.id } )[ 0 ];

        function addChildren( pLayerNode, pLayer ) {

            if ( pLayer.getProperty( model.PROP.SOURCE_WEB_SRC_QUERY ) ) {

                addNode( pLayerNode, {
                    header: {
                        type:        "map_layer_web_src_params",
                        isOpen:      false,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "map_layer_web_src_param",
                        typeId: model.COMP_TYPE.MAP_LAYER_WS_PARAM,
                        filter: {
                            parentId: pLayer.id
                        }
                    }
                } );
            }
        }

        addNode( pHeaderNode, {
            header: {
                type:        "map_layers",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "map_layer",
                typeId: model.COMP_TYPE.MAP_LAYER,
                filter: {
                    parentId: lComponent.id
                },
                addSubComponents: addChildren
            }
        } );

    } // addMapRegion

    function addCard( pHeaderNode, pRegion ) {

        var lComponent = model.getComponents( model.COMP_TYPE.CARD, { parentId: pRegion.id } )[ 0 ];

        addNode( pHeaderNode, {
            header: {
                type:        "card_actions",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "card_action",
                typeId: model.COMP_TYPE.CARD_ACTION,
                filter: {
                    parentId: lComponent.id
                }
            }
        } );

    } // addCard

    function addTemplateComponentActions( options ) {

        function addMenuEntries( actionNode, action ) {

            function addSubMenuEntries( actionNode, action ) {

                // Show the entries of a sub menu in its own sub node
                if ( action.getProperty( model.PROP.MENU_ENTRY_TYPE ).getValue() === "SUB_MENU" ) {
                    addNode( actionNode, {
                        header: {
                            type:        options.nodePrefix + "_action_menu_entries",
                            isOpen:      true,
                            omitIfEmpty: false
                        },
                        setFilter: false,
                        component: {
                            type:   options.nodePrefix + "_action_menu_entry",
                            typeId: options.menuEntryCompTypeId,
                            filter: {
                                properties: [{
                                    id:    options.parentMenuPropId,
                                    value: action.id
                                }]
                            },
                            addSubComponents: addSubMenuEntries
                        }
                    } );
                }

            } // addSubMenuEntries

            // Only if the current action is of type MENU we show the tree node
            if ( model.getActionPositionType( action ) === "MENU" ) {
                addNode( actionNode, {
                    header: {
                        type:        options.nodePrefix + "_action_menu_entries",
                        isOpen:      false,
                        omitIfEmpty: false
                    },
                    setFilter: false,
                    component: {
                        type:   options.nodePrefix + "_action_menu_entry",
                        typeId: options.menuEntryCompTypeId,
                        filter: {
                            parentId: action.id,
                            properties: [{
                                id:    options.parentMenuPropId,
                                value: "" // top level has to be empty
                            }]
                        },
                        addSubComponents: addSubMenuEntries
                    }
                } );
            }

        } // addMenuEntries

        // Only if the current template component plug-in supports actions, we show the tree node
        if ( model.hasPluginActions( options.component.typeId, options.pluginName )) {
            addNode( options.headerNode, {
                header: {
                    type:        options.nodePrefix + "_actions",
                    isOpen:      true,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type:   options.nodePrefix + "_action",
                    typeId: options.actionCompTypeId,
                    filter: {
                        parentId: options.component.id
                    },
                    addSubComponents: addMenuEntries
                }
            } );
        }

    } // addTemplateComponentActions

    function addTemplateComponentRegion( pHeaderNode, pRegion ) {
        // only show columns if the source is defined
        if ( pRegion.getProperty( model.PROP.SOURCE_LOCATION )?.getValue() ) {
            addNode( pHeaderNode, {
                header: {
                    title:       msg( "REPORT_COLUMNS" ),
                    type:        "region_tmpl_columns",
                    isOpen:      false,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type:   "region_tmpl_column",
                    typeId: model.COMP_TYPE.REGION_TMPL_COLUMN,
                    filter: {
                        parentId: pRegion.id
                    }
                }
            } );
        }

        addTemplateComponentActions({
            headerNode:          pHeaderNode,
            component:           pRegion,
            pluginName:          pRegion.getProperty( model.PROP.REGION_TYPE ).getValue(),
            nodePrefix:          "region",
            actionCompTypeId:    model.COMP_TYPE.REGION_ACTION,
            menuEntryCompTypeId: model.COMP_TYPE.REGION_ACTION_MENU_ENTRY,
            parentMenuPropId:    model.PROP.REGION_ACTION_PARENT_MENU
        });

    } // addTemplateComponentRegion

    function addInteractiveReport( pHeaderNode, pRegion ) {

        let lComponent = model.getComponents( model.COMP_TYPE.IR_ATTRIBUTES, { parentId: pRegion.id } )[ 0 ];

        function addActions( headerNode, irColumn ) {

            let pluginName = irColumn.getProperty( model.PROP.IR_COLUMN_DISPLAY_TYPE ).getValue();

            if ( /^(TMPL)/.test( pluginName )) {
                addTemplateComponentActions({
                    headerNode:          headerNode,
                    component:           irColumn,
                    pluginName:          pluginName,
                    nodePrefix:          "ir_column",
                    actionCompTypeId:    model.COMP_TYPE.IR_COLUMN_ACTION,
                    menuEntryCompTypeId: model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY,
                    parentMenuPropId:    model.PROP.IR_COLUMN_ACTION_PARENT_MENU
                });
            }

        } // addActions

        addNode( pHeaderNode, {
            header: {
                title:       msg( "REPORT_COLUMNS" ),
                type:        "region_columns",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ir_report_column",
                typeId: model.COMP_TYPE.IR_COLUMN,
                filter: {
                    parentId: lComponent.id
                },
                addSubComponents: addActions
            }
        } );

        addNode( pHeaderNode, {
            header: {
                type:        "ir_column_groups",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ir_column_group",
                typeId: model.COMP_TYPE.IR_COLUMN_GROUP,
                filter: {
                    parentId: lComponent.id
                }
            }
        } );

        addNode( pHeaderNode, {
            header: {
                type:        "ir_saved_reports",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ir_saved_report",
                typeId: model.COMP_TYPE.IR_SAVED_REPORT,
                filter: {
                    parentId: lComponent.id
                }
            }
        } );

    }


    function addInteractiveGrid( pHeaderNode, pRegion ) {

        var lComponent = model.getComponents( model.COMP_TYPE.IG_ATTRIBUTES, { parentId: pRegion.id } )[ 0 ];

        function addChildren( pRegionColumnNode, pColumn ) {

            addValidations( pRegionColumnNode, { region: pRegion, regionColumn: pColumn }, true );
            addDynamicActions( pRegionColumnNode, { region: pRegion, regionColumn: pColumn } );
        }

        addNode( pHeaderNode, {
            header: {
                title:       msg( "REPORT_COLUMNS" ),
                type:        "ig_columns",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ig_column",
                typeId: model.COMP_TYPE.IG_COLUMN,
                isOpen: false,
                filter: {
                    parentId: pRegion.id
                },
                addSubComponents: addChildren
            }
        } );

        addNode( pHeaderNode, {
            header: {
                type:        "ig_column_groups",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ig_column_group",
                typeId: model.COMP_TYPE.IG_COLUMN_GROUP,
                filter: {
                    parentId: pRegion.id
                }
            }
        } );

        addNode( pHeaderNode, {
            header: {
                type:        "ig_saved_reports",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "ig_saved_report",
                typeId: model.COMP_TYPE.IG_SAVED_REPORT,
                filter: {
                    parentId: lComponent.id
                }
            }
        } );

    }


    function addClassicReport( pHeaderNode, pRegion ) {

        addNode( pHeaderNode, {
            header: {
                title:       msg( "REPORT_COLUMNS" ),
                type:        "region_columns",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "classic_report_column",
                typeId: model.COMP_TYPE.CLASSIC_RPT_COLUMN,
                isOpen: false,
                filter: {
                    parentId: pRegion.id
                }
            }
        } );

    }


    function addTabularForm( pHeaderNode, pRegion ) {

        function addChildren( pRegionColumnNode, pColumn ) {

            addValidations( pRegionColumnNode, { region: pRegion, regionColumn: pColumn }, true );
        }

        addNode( pHeaderNode, {
            header: {
                title:       msg( "REPORT_COLUMNS" ),
                type:        "region_columns",
                isOpen:      false,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "tabform_column",
                typeId: model.COMP_TYPE.TAB_FORM_COLUMN,
                isOpen: false,
                filter: {
                    parentId: pRegion.id
                },
                addSubComponents: addChildren
            }
        } );

    }


    function addFacetedSearch( pHeaderNode, pRegion ) {

        function addChildren( pFacetGroupNode, pFacetGroup ) {

            addNode( pFacetGroupNode, {
                header: {
                    type:        "facet_group_items",
                    isOpen:      true,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type:   "facet_group_item",
                    typeId: model.COMP_TYPE.FACET_GROUP_ITEM,
                    isOpen: false,
                    filter: {
                        parentId: pFacetGroup.id
                    }
                }
            } );
        }

        addNode( pHeaderNode, {
            header: {
                title:       msg( "FACETS" ),
                type:        "facets",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: [
                {
                    type:   "facet",
                    typeId: model.COMP_TYPE.FACET,
                    isOpen: false,
                    filter: {
                        parentId: pRegion.id
                    }
                },
                {
                    type:   "facet_group",
                    typeId: model.COMP_TYPE.FACET_GROUP,
                    isOpen: true,
                    filter: {
                        parentId: pRegion.id
                    },
                    addSubComponents: addChildren
                }
            ]
        } );

        addRegionPluginAttributes( pHeaderNode, pRegion );
    }


    function addSearchSources( pHeaderNode, pRegion ) {

        addNode( pHeaderNode, {
            header: {
                title:       msg( "SEARCH_SOURCES" ),
                type:        "search_sources",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: [
                {
                    type:   "search_source",
                    typeId: model.COMP_TYPE.SEARCH_REGION_SOURCE,
                    isOpen: false,
                    filter: {
                        parentId: pRegion.id
                    }
                }
            ]
        } );

        addRegionPluginAttributes( pHeaderNode, pRegion );
    }

    function addSmartFilters( pParentNode, pRegion ) {

        function addSmartFilterGroupChildren( sFilterGroupNode, sFilterGroup ) {

            addNode( sFilterGroupNode, {
                header: {
                    type:        "sfilter_group_items",
                    isOpen:      true,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type:   "sfilter_group_item",
                    typeId: model.COMP_TYPE.SFILTER_GROUP_ITEM,
                    isOpen: false,
                    filter: {
                        parentId: sFilterGroup.id
                    }
                }
            });
        }

        addNode( pParentNode, {
            header: {
                title:       msg( "SFILTERS" ),
                type:        "sfilters",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: [
                {
                    type:   "sfilter",
                    typeId: model.COMP_TYPE.SFILTER,
                    isOpen: false,
                    filter: {
                        parentId: pRegion.id
                    }
                },
                {
                    type:   "sfilter_group",
                    typeId: model.COMP_TYPE.SFILTER_GROUP,
                    isOpen: true,
                    filter: {
                        parentId: pRegion.id
                    },
                    addSubComponents: addSmartFilterGroupChildren
                }
            ]
        });

        addRegionPluginAttributes( pParentNode, pRegion );
    }


    function addJetChart( pParentNode, pRegion ) {

        function addChildren( pSeriesNode, pSeries ) {

            if ( pSeries.getProperty( model.PROP.SOURCE_WEB_SRC_QUERY ) ) {
                addNode( pSeriesNode, {
                    header: {
                        type:        "jet_chart_web_src_params",
                        isOpen:      false,
                        omitIfEmpty: true
                    },
                    setFilter: false,
                    component: {
                        type:   "jet_chart_web_src_param",
                        typeId: model.COMP_TYPE.JET_CHART_WS_PARAM,
                        filter: {
                            parentId: pSeries.id
                        }
                    }
                } );
            }
        }

        var lComponent = model.getComponents( model.COMP_TYPE.JET_CHART, { parentId: pRegion.id } )[ 0 ],
            lChartType = lComponent.getProperty( model.PROP.JET_CHART_TYPE ).getValue();

        addNode( pParentNode, {
            header: {
                type:        "jet_chart_series",
                isOpen:      true,
                omitIfEmpty: false
            },
            setFilter: false,
            component: {
                type:   "jet_chart_serie",
                typeId: model.COMP_TYPE.JET_CHART_SERIES,
                filter: {
                    parentId: lComponent.id
                },
                addSubComponents: addChildren
            }
        } );

        if ( lChartType in { area:1, bar:1, boxPlot:1, bubble:1, combo:1, gantt:1, line:1, lineWithArea:1, polar:1, radar:1, range:1, scatter:1, stock:1 } ) {
            addNode( pParentNode, {
                header: {
                    type: "jet_chart_axes",
                    isOpen: true,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type: "jet_chart_axis",
                    typeId: model.COMP_TYPE.JET_CHART_AXES,
                    filter: {
                        parentId: lComponent.id
                    }
                }
            } );
        }

    }


    function addRegionPluginAttributes( pHeaderNode, pRegion ) {

        var PLUGINS = model.getComponentType( model.COMP_TYPE.REGION_PLUGIN_ATTR ).pluginType.plugins,
            lRegionType = pRegion.getProperty( model.PROP.REGION_TYPE ).getValue();

        // If the plug-in does store columns, show them
        if ( $.inArray( "COLUMNS", PLUGINS[ lRegionType ].features ) !== -1 ) {
            addNode( pHeaderNode, {
                header: {
                    title:       msg( "REPORT_COLUMNS" ),
                    type:        "region_columns",
                    isOpen:      false,
                    omitIfEmpty: false
                },
                setFilter: false,
                component: {
                    type:   "region_column",
                    typeId: model.COMP_TYPE.REGION_COLUMN,
                    filter: {
                        parentId: pRegion.id
                    }
                }
            } );
        }

    }


    function getRenderingData() {

        var lTreeData,
            lPage;

        lPage = model.getComponents( model.COMP_TYPE.PAGE );

        // Emit Root Page Node
        lTreeData = addChildNode( undefined, {
            component: lPage[ 0 ],
            type:      "page",
            title:     formatNoEscape( "PAGE_TITLE", lPage[ 0 ].id, lPage[ 0 ].getDisplayTitle() ),
            isHeader:  false,
            isOpen:    true
        } );

        // Set defaults for "Create" menu
        lTreeData.data[ model.PROP.COMPUTATION_POINT ] = "BEFORE_BOX_BODY";
        lTreeData.data[ model.PROP.PROCESS_POINT ]     = "AFTER_HEADER";
        lTreeData.data[ model.PROP.BRANCH_POINT ]      = "BEFORE_HEADER";
        lTreeData.data[ model.PROP.SLOT_PLACEHOLDER ]  = "BODY";

        getRenderingEventView( lTreeData );

        postProcessNodes( lTreeData );

        return lTreeData;

    }


    function getRenderingEventView( pTreeData ) {

        var lPreRenderingNode,
            lPostRenderingNode,
            lNode,
            lPageTemplate = model.getPageTemplate(),
            lIsGlobalPage = model.isGlobalPage();

        //
        // Emit "Before Regions"
        //
        lPreRenderingNode = addHeaderNode( pTreeData, {
            title:             msg( "PRE_RENDERING" ),
            type:              "pre_rendering",
            showHasComponents: true,
            omitIfEmpty:       true
        } );

        if ( !lIsGlobalPage ) {
            //
            // Emit "On New Instance"
            //
            // Note: Only included for legacy pages if such a computation or process exists
            //
            lNode = addHeaderNode( lPreRenderingNode, {
                title:       getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "ON_NEW_INSTANCE" ),
                type:        "on_new_instance",
                isOpen:      true,
                omitIfEmpty: true
            } );
            addComputations( lNode, { processPoint: "ON_NEW_INSTANCE" }, true );
            addProcesses   ( lNode, { processPoint: "ON_NEW_INSTANCE" }, true );

            //
            // Emit "Before Header"
            //
            lNode = addHeaderNode( lPreRenderingNode, {
                title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "BEFORE_HEADER" ),
                type:   "before_header",
                isOpen: true
            } );

            addBranches    ( lNode, { processPoint: "BEFORE_HEADER" }, true );
            addComputations( lNode, { processPoint: "BEFORE_HEADER" }, true );
            addProcesses   ( lNode, { processPoint: "BEFORE_HEADER" }, true );
        }

        //
        // Emit "Meta Tags"
        //
        const hasMetaTags  = model.hasMetaTags();
        if ( hasMetaTags ) {
            addMetaTags( lPreRenderingNode );
        }

        //
        // Emit "After Header"
        //
        lNode = addHeaderNode( lPreRenderingNode, {
            title:       getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "AFTER_HEADER" ),
            type:        "after_header",
            isOpen:      true,
            omitIfEmpty: lIsGlobalPage
        } );

        if ( !lIsGlobalPage ) {
            addComputations( lNode, { processPoint: "AFTER_HEADER" }, true );
            addProcesses   ( lNode, { processPoint: "AFTER_HEADER" }, true );
        }
        addComponents( lNode, { processPoint: { id: "AFTER_HEADER", name: formatPostfix( "MODEL.POSTFIX.LEGACY", msg( "COMPONENTS" ), true ) }} );

        //
        // Emit "Before Regions"
        //
        if ( !lIsGlobalPage ) {
            lNode = addHeaderNode( lPreRenderingNode, {
                title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "BEFORE_BOX_BODY" ),
                type:   "before_regions",
                isOpen: true
            } );

            addComputations( lNode, { processPoint: "BEFORE_BOX_BODY" }, true );
            addProcesses   ( lNode, { processPoint: "BEFORE_BOX_BODY" }, true );
        }

        //
        // Emit "Components"
        //
        lNode = addHeaderNode( pTreeData, {
            title:  msg( "COMPONENTS" ),
            type:   "components",
            isOpen: true
        } );

        // Emit valid page slots
        for ( const slot of lPageTemplate.slots ) {
            if ( !["AFTER_HEADER", "BEFORE_FOOTER"].includes( slot.placeholder ) ) {
                addComponents( lNode, { slot } );
            }
        }

        // Emit Invalid Page Slots
        addComponents( lNode, { validSlots: lPageTemplate.slots } );

        //
        // Emit "After Regions"
        //
        lPostRenderingNode = addHeaderNode( pTreeData, {
            title:             msg( "POST_RENDERING" ),
            type:              "post_rendering",
            showHasComponents: true
        } );

        //
        // Emit "After Regions"
        //
        if ( !lIsGlobalPage ) {
            lNode = addHeaderNode( lPostRenderingNode, {
                title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "AFTER_BOX_BODY" ),
                type:   "after_regions",
                isOpen: true
            } );

            addComputations( lNode, { processPoint: "AFTER_BOX_BODY" }, true );
            addProcesses   ( lNode, { processPoint: "AFTER_BOX_BODY" }, true );
        }

        //
        // Emit "Before Footer"
        //
        lNode = addHeaderNode( lPostRenderingNode, {
            title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "BEFORE_FOOTER" ),
            type:   "before_footer",
            isOpen: true
        } );

        if ( !lIsGlobalPage ) {
            addComputations( lNode, { processPoint: "BEFORE_FOOTER" }, true );
            addProcesses   ( lNode, { processPoint: "BEFORE_FOOTER" }, true );
        }
        addComponents( lNode, { processPoint: { id: "BEFORE_FOOTER", name: formatPostfix( "MODEL.POSTFIX.LEGACY", msg( "COMPONENTS" ), true ) }} );

        //
        // Emit "After Footer"
        //
        if ( !lIsGlobalPage ) {
            lNode = addHeaderNode( lPostRenderingNode, {
                title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "AFTER_FOOTER" ),
                type:   "after_footer",
                isOpen: true
            } );

            addComputations( lNode, { processPoint: "AFTER_FOOTER" }, true );
            addProcesses   ( lNode, { processPoint: "AFTER_FOOTER" }, true );
        }
    }


    function getDynamicActionData() {

        var lTreeData = {
                id:       "da",
                children: [],
                state:    {},
                commands: {
                    omitIfEmpty: false
                }
            },
            lNode,
            lComponents,
            lUsedEventsMap = { // the following events should always be visible
                "ready":  true,
                "change": true,
                "click":  true,
                "apexafterclosedialog": true
            };

        function addActions( pDaEventNode, pDaEvent, pResult, pTitle ) {

            var lFilterProperties = [{
                    id:    model.PROP.FIRE_WHEN_EVENT_RESULT_IS,
                    value: pResult.toUpperCase()
                }];

            if ( pDaEvent.getProperty( model.PROP.EVENT ).getValue() !== "ready" ) {
                lFilterProperties.push( {
                    id:    model.PROP.FIRE_ON_PAGE_LOAD,
                    value: "Y"
                } );
            }

            // Create the Header Node and for each action a node
            addNode( pDaEventNode, {
                header: {
                    title:       pTitle,
                    type:        "page_load_da_actions_" + pResult,
                    isOpen:      true,
                    omitIfEmpty: true
                },
                setFilter: "header",
                component: {
                    type:    "page_load_da_action",
                    typeId:  model.COMP_TYPE.DA_ACTION,
                    isPlain: true,
                    filter: {
                        parentId:   pDaEvent.id,
                        properties: lFilterProperties
                    }
                }
            } );
        } // addActions


        // Emit all dynamic actions which are fired during page load
        addNode( lTreeData, {
            header:    {
                title:       msg( "FIRED_ON_PAGE_LOAD" ),
                type:        "page_load_da_events",
                isOpen:      false,
                omitIfEmpty: true
            },
            setFilter: false,
            component: {
                type:    "page_load_da_event",
                typeId:  model.COMP_TYPE.DA_EVENT,
                isPlain: true,
                filter:  {
                    filterFunction: function() {

                        var lResult = true;

                        // If the dynamic action isn't bound to the "Page Load" event we have to check if it contains
                        // actions where the "Fire on Page Load" flag is set
                        if ( this.getProperty( model.PROP.EVENT ).getValue() !== "ready" ) {
                            lResult = (
                                this.getChilds( model.COMP_TYPE.DA_ACTION, {
                                    properties: [{
                                        id:    model.PROP.FIRE_ON_PAGE_LOAD,
                                        value: "Y"
                                    }]
                                }, false ).length > 0 );
                        }

                        return lResult;
                    }
                },
                addSubComponents: function( pDaEventNode, pDaEvent ) {
                    addActions( pDaEventNode, pDaEvent, "true",  msg( "TRUE" ) );
                    addActions( pDaEventNode, pDaEvent, "false", msg( "FALSE" ) );
                }
            }
        } );

        // Emit "Events"
        lNode = addHeaderNode( lTreeData, {
            title:  msg( "EVENTS" ),
            type:   "da_events",
            isOpen: true,
            filter: {
                properties: [{ id: model.PROP.EVENT, value: "" }]
            }
        } );

        // Find all events which are used by the dynamic action on the current page
        lComponents = model.getComponents( model.COMP_TYPE.DA_EVENT, {} );
        for ( var i = 0; i < lComponents.length; i++ ) {
            lUsedEventsMap[ lComponents[ i ].getProperty( model.PROP.EVENT ).getValue() ] = true;
        }

        // Emit all dynamic actions grouped by events
        for ( var lEvent in lUsedEventsMap ) {
            if ( hasOwnProperty( lUsedEventsMap, lEvent ) ) {
                addDynamicActions( lNode, { event: lEvent } );
            }
        }

        postProcessNodes( lTreeData );

        return lTreeData;

    }


    function getProcessingData() {

        var lTreeData = {
                id:       "rd",
                children: [],
                state:    {},
                commands: {
                    omitIfEmpty: false
                }
            };

        getProcessingEventView( lTreeData );
        postProcessNodes( lTreeData );

        return lTreeData;

    }


    function getProcessingEventView( pTreeData ) {

        var lNode,
            lIsGlobalPage = model.isGlobalPage();

        // Don't show processing for global page
        if ( lIsGlobalPage ) {
            return;
        }

        //
        // Emit "After Submit"
        //
        lNode = addHeaderNode( pTreeData, {
            title: getPointTitle( model.COMP_TYPE.PAGE_COMPUTATION, "AFTER_SUBMIT" ),
            type:  "after_submit"
        } );

        addProcesses   ( lNode, { processPoint: "ON_SUBMIT_BEFORE_COMPUTATION" }, true, true );
        addBranches    ( lNode, { processPoint: "BEFORE_COMPUTATION" }, true );
        addComputations( lNode, { processPoint: "AFTER_SUBMIT" }, true, true );

        //
        // Emit "Validating"
        //
        lNode = addHeaderNode( pTreeData, {
            title: getPointTitle( model.COMP_TYPE.BRANCH, "BEFORE_VALIDATION" ),
            type:  "validating"
        } );

        addBranches   ( lNode, { processPoint: "BEFORE_VALIDATION" }, true );
        addValidations( lNode, {}, true );

        //
        // Emit "Processing"
        //
        lNode = addHeaderNode( pTreeData, {
            title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "AFTER_SUBMIT" ),
            type:   "processing",
            isOpen: true
        } );

        addBranches ( lNode, { processPoint: "BEFORE_PROCESSING" }, true );
        addProcesses( lNode, { processPoint: "AFTER_SUBMIT" }, true, true );

        //
        // Emit "After Processing"
        //
        lNode = addHeaderNode( pTreeData, {
            title:  getPointTitle( model.COMP_TYPE.BRANCH, "AFTER_PROCESSING" ),
            type:   "after_processing",
            isOpen: true
        } );

        addBranches( lNode, { processPoint: "AFTER_PROCESSING" }, true );

        //
        // Emit "AJAX Callbacks"
        //
        lNode = addHeaderNode( pTreeData, {
            title:  getPointTitle( model.COMP_TYPE.PAGE_PROCESS, "ON_DEMAND" ),
            id:     "ajax_callbacks",
            type:   "processes",
            isOpen: true
        } );

        addProcesses( lNode, { processPoint: "ON_DEMAND" }, false, true );

    } // getProcessingEventView


    function getSharedData() {

        function addSharedComponents( pHeaderNode, pComponentType, pOmitIfEmpty ) {

            var lType = model.getComponentType( pComponentType.typeId ),
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
            lRefByCompProps = getRefByCompProps( pComponentType.typeId );
            lUsedSharedComponents = {};
            for ( var i = 0; i < lRefByCompProps.length; i++ ) {

                // Find all shared components which are used by one of the page level components
                lComponents = model.getComponents( lRefByCompProps[ i ].typeId, {} );
                for ( var j = 0; j < lComponents.length; j++ ) {

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
                        if ( !hasOwnProperty( lUsedSharedComponents, lValue ) ) {
                            lUsedSharedComponents[ lValue ] = {};
                        }
                        if ( !hasOwnProperty( lUsedSharedComponents[ lValue ], lRefByCompProps[ i ].typeId ) ) {
                            lUsedSharedComponents[ lValue ][ lRefByCompProps[ i ].typeId ] = [];
                        }
                        lUsedSharedComponents[ lValue ][ lRefByCompProps[ i ].typeId ].push( lComponents[ j ] );
                    }
                }
            }

            // Emit all the found shared components and show the referencing page level components as well
            // Todo this should be ordered by name
            for ( var lId in lUsedSharedComponents ) {
                if ( hasOwnProperty( lUsedSharedComponents, lId ) ) {

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

                                var lRefByType,
                                    lHeaderNode;

                                for ( var lTypeId in lUsedSharedComponents[ lId ] ) {
                                    if ( hasOwnProperty( lUsedSharedComponents[ lId ], lTypeId ) ) {

                                        lRefByType = model.getComponentType( lTypeId );

                                        lHeaderNode = addHeaderNode( pComponentNode, {
                                            title:       formatNoEscape( "REFERENCED_BY", ( lUsedSharedComponents[ lId ][ lRefByType.id ].length === 1 ) ? lRefByType.title.singular : lRefByType.title.plural ),
                                            type:        "references",
                                            isOpen:      true,
                                            omitIfEmpty: false
                                        } );

                                        for ( var k = 0; k < lUsedSharedComponents[ lId ][ lRefByType.id ].length; k++ ) {
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

            var lHeaderNode, lId, isOpen = false;

            for ( var i = 0; i < pSharedCompTypes.length; i++ ) {

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

                } else if ( hasOwnProperty( pSharedCompTypes[ i ], "typeId" ) ) {

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


        var lTreeData = {
                id:       "sd",
                children: [],
                state:    {},
                commands: {
                    omitIfEmpty: false
                }
            };


        addSharedCompTypes( lTreeData, SHARED_COMP_TYPES, false );

        postProcessNodes( lTreeData );

        return lTreeData;

    }


    function getRefByCompProps( pComponentTypeId ) {

        var lType = model.getComponentType( pComponentTypeId ),
            lRefProperty,
            lRefType,
            lResult = [];

        // Find all properties which are using the current component type as LOV
        for ( var i = 0; i < lType.refByProperties.length; i++ ) {

            // Find all the component types which are using that property
            lRefProperty = model.getProperty( lType.refByProperties[ i ] );
            for ( var j = 0; j < lRefProperty.refByComponentTypes.length; j++ ) {

                // Only scan page level component types
                lRefType = model.getComponentType( lRefProperty.refByComponentTypes[ j ] );
                if ( lRefType.isPageComponent || lRefType.id === model.COMP_TYPE.PAGE ) {
                    lResult.push( {
                        typeId:     lRefType.id,
                        propertyId: lRefProperty.id
                    } );
                }
            }
        }
        return lResult;
    } // getRefByCompProps


    function getComponentHierarchyValues( pNode ) {

        // sets the specified attribute value from the parent or grand parent node
        function addValue( pOptions ) {

            var lComponent;

            if ( hasOwnProperty( pOptions, "value" ) ) {
                // Add static value
                lValues.push( {
                    id:    pOptions.id,
                    value: pOptions.value
                } );

            } else if ( pOptions.typeId ) {
                // Add nearest component with that type
                lComponent = getNearestComponent( pOptions.typeId, pNode._parent );

                lValues.push( {
                    id:    pOptions.id,
                    value: ( lComponent ) ? lComponent.id : ""
                } );

            } else if ( pOptions.id ) {
                // Add nearest property value
                lValues.push( {
                    id:    pOptions.id,
                    value: getNearestValue( pOptions.id, pNode._parent ) + ""
                } );

            }
        }

        var lValues = [];

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
            case "region_action_menu_entry":
                addValue({ id: model.PROP.REGION_ACTION_PARENT_MENU, typeId: model.COMP_TYPE.REGION_ACTION_MENU_ENTRY } );
                break;
            case "ir_column_action_menu_entry":
                addValue({ id: model.PROP.IR_COLUMN_ACTION_PARENT_MENU, typeId: model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY } );
                break;
        }

        return lValues;
    }


    function nodesMoved( pChange, pTree$ ) {

        var lComponents = [],
            lPrevComponent,
            lMessage,
            lTransaction;

        const toNodeComponent = getComponent( pChange.items[ 0 ].toNode );

        if ( pChange.items.length > 0 ) {

            lMessage = model.transaction.message( {
                action:     model.MESSAGE_ACTION.MOVE,
                component:  toNodeComponent,
                count:      pChange.items.length
            } );

            lTransaction = model.transaction.start( "", lMessage );

            for ( var i = 0; i < pChange.items.length; i++ ) {

                lComponents[ i ] = getComponent( pChange.items[ i ].toNode );
                if ( pChange.items[ i ].toIndex === 0 ) {
                    lPrevComponent = null;
                } else {
                    lPrevComponent = getComponent( pChange.parentNode.children[ pChange.items[ i ].toIndex - 1 ] );
                    // If we don't find a component it's very likely that we have dragged the component onto the parent component
                    // and they treeView just doesn't know yet into which of the children nodes it should actually be put into
                    if ( !lPrevComponent ) {
                        lPrevComponent = "last";
                    }
                }

                lComponents[ i ].move( {
                    previousComponent: lPrevComponent,
                    values: getComponentHierarchyValues( pChange.items[ i ].toNode ) } );
            }

            apex.commandHistory.execute( lTransaction );

            // Refresh the tree node and expand the new slot placeholder
            refreshTree( { pTree$, componentsToExpand : [ toNodeComponent ] } );
        }
    }


    function nodesCopied( pChange, pTree$ ) {

        var lComponent,
            lPrevComponent,
            lNewComponents = [],
            lMessage,
            lTransaction;

        if ( pChange.items.length > 0 ) {

            lMessage = model.transaction.message( {
                action:     model.MESSAGE_ACTION.DUPLICATE,
                component:  getComponent( pChange.items[ 0 ].toNode ),
                count:      pChange.items.length
            } );

            lTransaction = model.transaction.start( "", lMessage );

            for ( var i = 0; i < pChange.items.length; i++ ) {

                lComponent = getComponent( pChange.items[ i ].toNode );
                if ( pChange.items[ i ].toIndex === 0 ) {
                    lPrevComponent = null;
                } else {
                    lPrevComponent = getComponent( pChange.parentNode.children[ pChange.items[ i ].toIndex - 1 ] );
                    // If we don't find a component it's very likely that we have dragged the component onto the parent component
                    // and they treeView just doesn't know yet into which of the children nodes it should actually be put into
                    if ( !lPrevComponent ) {
                        lPrevComponent = "last";
                    }
                }

                lNewComponents[ i ] = lComponent.duplicate();
                lNewComponents[ i ].move( {
                    previousComponent: lPrevComponent,
                    values: getComponentHierarchyValues( pChange.items[ i ].toNode ) } );
            }

            apex.commandHistory.execute( lTransaction );

            // Select the moved components
            setSelectedComponents( lNewComponents, pTree$, pChange.items[ 0 ].toNode._parent.id, true );
        }
    }


    function nodesDeleted( pChange, pTree$ ) {

        let lComponent,
            lMessage,
            lTransaction,
            lSelectedNodes;
        const NODE_TYPES = [
            "region_slot",
            "page_slot",
            "branches",
            "processes",
            "validations",
            "computations"
        ];

        if ( pChange.items.length > 0 ) {

            // get current selection before tree refresh
            lSelectedNodes = pTree$.treeView( "getSelectedNodes" );

            // filter out empty tree slots and get the parent instead
            // because slots get removed when they don't have children
            for( let i = 0; i < lSelectedNodes.length; i++ ) {
                if( NODE_TYPES.includes( lSelectedNodes[i].type ) && lSelectedNodes[i].children.length < 1 ) {
                    lSelectedNodes[i] = lSelectedNodes[i]._parent;
                }
            }

            lMessage = model.transaction.message( {
                action:     model.MESSAGE_ACTION.DELETE,
                component:  getComponent( pChange.items[ 0 ].node ),
                count:      pChange.items.length
            } );

            lTransaction = model.transaction.start( "", lMessage );

            for ( let i = 0; i < pChange.items.length; i++ ) {
                lComponent = getComponent( pChange.items[ i ].node );
                if ( lComponent ) {
                    lComponent.remove();
                }
            }
        }
        apex.commandHistory.execute( lTransaction );

        // set selection and focus after tree refresh
        pTree$.treeView( "setSelectedNodes", lSelectedNodes, true, true );
    }


    function duplicateNodes( pNodes, pTree$ ) {

        var lMessage,
            lTransaction,
            lNewComponents = [];

        if ( pNodes.length > 0 ) {

            lMessage = model.transaction.message( {
                action:     model.MESSAGE_ACTION.DUPLICATE,
                component:  getComponent( pNodes[ 0 ] ),
                count:      pNodes.length
            } );

            lTransaction = model.transaction.start( "", lMessage );

            for ( var i = 0; i < pNodes.length; i++ ) {
                lNewComponents.push( getComponent( pNodes[ i ] ).duplicate() );
            }

            apex.commandHistory.execute( lTransaction );

            // Select the moved components
            setSelectedComponents( lNewComponents, pTree$, pNodes[ 0 ]._parent.id, true );
        }
    }


    function setSelectedComponents( pComponents, pTree$, pParentId, pNotify ) {

        var lComponentNodes  = [],
            lComponentNodes$ = $(),
            lParentId = pParentId,
            lNode,
            i;

        // For the dynamic action tree we always want to select the dynamic actions displayed below "Events"
        if ( !pParentId && pTree$[ 0 ].id === "PDdynamicActionTree" ) {
            lParentId = "da_da_events";
        }

        // select all component nodes passed in
        // todo: jjs seems like this selects the same components in two different ways based on if notifications are desired
        // todo:   but now both setSelection and setSelectedNodes take an extra param to control notification
        if ( pNotify ) {

            for ( i = 0; i < pComponents.length; i++ ) {
                lComponentNodes$ = lComponentNodes$.add( getComponentDomNodes$( pComponents[ i ], pTree$, lParentId ) );
            }

            pTree$.treeView( "setSelection", lComponentNodes$ );

        } else {

            for ( i = 0; i < pComponents.length; i++ ) {
                lNode = getComponentNode( pComponents[ i ], pTree$, lParentId );
                if ( lNode ) {
                    lComponentNodes.push( lNode );
                }
            }

            pTree$.treeView( "setSelectedNodes", lComponentNodes, false, true );

        }

    } // setSelectedComponents



    function createOppositeDynamicAction( pNodes, pTree$ ) {

        var OPPOSITE_MAP = {
                "NATIVE_SHOW":         "NATIVE_HIDE",
                "NATIVE_HIDE":         "NATIVE_SHOW",
                "NATIVE_ENABLE":       "NATIVE_DISABLE",
                "NATIVE_DISABLE":      "NATIVE_ENABLE",
                "NATIVE_ADD_CLASS":    "NATIVE_REMOVE_CLASS",
                "NATIVE_REMOVE_CLASS": "NATIVE_ADD_CLASS"
            };

        var lComponent,
            lValues = [],
            lType,
            lPluginAttributeNo,
            lPluginProperty,
            lResultIs,
            lMessage,
            lTransaction,
            lNewComponents = [];

        lMessage = model.transaction.message( {
            action:     model.MESSAGE_ACTION.CREATE,
            component:  getComponent( pNodes[ 0 ] ),
            count:      pNodes.length
        } );

        lTransaction = model.transaction.start( "", lMessage );

        for ( var i = 0; i < pNodes.length; i++ ) {

            lComponent = getComponent( pNodes[ i ] );

            // Set the opposite action type, if non was found we use the current type
            lType = lComponent.getProperty( model.PROP.DA_ACTION_TYPE ).getValue();
            if ( hasOwnProperty( OPPOSITE_MAP, lType ) ) {
                lValues.push( {
                    id:    model.PROP.DA_ACTION_TYPE,
                    value: OPPOSITE_MAP[ lType ]
                } );
                // Copy all plug-in attributes from the old plug-in to the new plug-in
                lPluginAttributeNo = 1;
                lPluginProperty    = model.getPluginProperty( model.COMP_TYPE.DA_ACTION, lType, lPluginAttributeNo );

                while ( lPluginProperty && lComponent.getProperty( lPluginProperty.id ) && lPluginAttributeNo <= MAX_DA_ACTION_PLUGIN_ATTRIBUTES ) {
                    lValues.push( {
                        id:    model.getPluginProperty( model.COMP_TYPE.DA_ACTION, OPPOSITE_MAP[ lType ], lPluginAttributeNo ).id,
                        value: lComponent.getProperty( lPluginProperty.id ).getValue()
                    } );
                    lPluginAttributeNo += 1;
                    lPluginProperty = model.getPluginProperty( model.COMP_TYPE.DA_ACTION, lType, lPluginAttributeNo );
                }

                // This is necessary, because changing the type will trigger that "Fire on page load" will be set to a
                // default specified by the type, but we actually want to use what has already been defined.
                lValues.push( {
                    id:    model.PROP.FIRE_ON_PAGE_LOAD,
                    value: lComponent.getProperty( model.PROP.FIRE_ON_PAGE_LOAD ).getValue()
                } );
            }

            // Set the opposite result
            if ( lComponent.getProperty( model.PROP.FIRE_WHEN_EVENT_RESULT_IS ).getValue() === "TRUE" ) {
                lResultIs = "FALSE";
            } else {
                lResultIs = "TRUE";
            }
            lValues.push( { id: model.PROP.FIRE_WHEN_EVENT_RESULT_IS, value: lResultIs } );
            lNewComponents.push( lComponent.duplicate( lValues ) );

            // Always move the new action after all the existing actions
            lNewComponents[ lNewComponents.length - 1 ].move( { previousComponent: "last" } );

        }
        apex.commandHistory.execute( lTransaction );

        // Select the newly created component
        setSelectedComponents( lNewComponents, pTree$, pNodes[ 0 ]._parent._parent.id, true );
    }


    function createComponent( pNode, pTree$, pComponentTypeId, pSecondaryType ) {

        var nodeComponent = getComponent( pNode ),
            lValues       = [],
            lParentId,
            lParentComponent,
            lRefreshRegionId,
            lColumnName,
            lComponents,
            lStartNodeId,
            lTransaction,
            lNewComponent,
            lPrevComponent,
            lMessage;

        function addValue( pOptions ) {

            var lComponent;

            if ( hasOwnProperty( pOptions, "value" ) ) {
                // Add static value
                lValues.push( {
                    id:    pOptions.id,
                    value: pOptions.value
                } );

            } else if ( pOptions.typeId ) {
                // Add nearest component with that type
                lComponent = getNearestComponent( pOptions.typeId, pNode );

                lValues.push( {
                    id:    pOptions.id,
                    value: lComponent ? lComponent.id : ""
                } );

            } else if ( pOptions.id ) {
                // Add nearest property value
                lValues.push( {
                    id:    pOptions.id,
                    value: getNearestValue( pOptions.id, pNode ) + ""
                } );

            }
        }

        if ( pComponentTypeId === model.COMP_TYPE.REGION ) {

            if ( pSecondaryType === "SUB_REGION" ) {
                // create a sub region inside a region
                addValue( { id: model.PROP.PARENT_REGION, typeId: model.COMP_TYPE.REGION } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER, value: "SUB_REGIONS" } );
            } else if ( pSecondaryType === "REGION_DEFAULT_SLOT" ) {
                const component = getNearestComponent( model.COMP_TYPE.REGION, pNode );
                const slotPlaceholder = model.getSlot( { component, componentTypeId: pComponentTypeId } ).placeholder;
                addValue( { id: model.PROP.PARENT_REGION, value: component.id } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER, value: slotPlaceholder} );
            } else if ( pNode.type === "page_slot" ) {
                // create a region inside a page_slot
                addValue( { id: model.PROP.PARENT_REGION, value: "" } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else if ( pNode.type === "region_slot" ) {
                // create a region inside a region_slot
                addValue( { id: model.PROP.PARENT_REGION, typeId: model.COMP_TYPE.REGION } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else if ( pNode.type === "region" ) {
                // create a region below a region
                addValue( { id: model.PROP.PARENT_REGION } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else if ( [ "item", "button" ].includes( pNode.type ) ) {
                // create a region below an item/button
                const regionId = nodeComponent.getProperty( model.PROP.REGION ).getValue();
                addValue( { id: model.PROP.PARENT_REGION, value: regionId } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else {
                // Fallback value: no parent, in default position
                addValue( { id: model.PROP.PARENT_REGION, value: "" } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            }

            // If the slot has supported region types, set the first supported region type for the new region
            const regionId = lValues.find( value => value.id === model.PROP.PARENT_REGION )?.value;
            const component = model.getComponents( model.COMP_TYPE.REGION, { id: regionId } )[0];
            const slotPlaceholder = lValues.find( value => value.id === model.PROP.SLOT_PLACEHOLDER )?.value;
            if ( component && slotPlaceholder ) {
                const slot = model.getSlot( { componentTypeId: pComponentTypeId, component, slotPlaceholder } );
                if ( slot && Array.isArray( slot.supportedRegionTypes ) ) {
                    addValue( { id: model.PROP.REGION_TYPE, value: slot.supportedRegionTypes[0] } );
                }
            }

        } else if ( [ model.COMP_TYPE.PAGE_ITEM, model.COMP_TYPE.BUTTON ].includes( pComponentTypeId ) ) {

            // Find parent region or page this item/button is assigned to
            // Bug 33894807 this allows the grid layout refresh to work on newly added items
            lParentComponent = getNearestComponent([ model.COMP_TYPE.REGION, model.COMP_TYPE.PAGE ], pNode );
            lParentId        = lParentComponent.id;

            if ( pNode.type === "page_slot" ) {
                // create an item/button inside a page_slot
                addValue( { id: model.PROP.REGION, value: "" } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else if ( pNode.type === "region_slot" ) {
                // create an item/button inside a region_slot
                addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else if ( pNode.type === "region" ) {
                if ( pSecondaryType === "BELOW" ) {
                    // create an item/button below a region
                    addValue( { id: model.PROP.REGION } );
                    addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
                } else {
                    // create an item/button inside a region
                    addValue( { id: model.PROP.REGION, typeId: model.COMP_TYPE.REGION } );
                    const slotPlaceholder = model.getSlot( { component: lParentComponent, componentTypeId: pComponentTypeId } ).placeholder;
                    addValue( { id: model.PROP.SLOT_PLACEHOLDER , value: slotPlaceholder} );
                }
            } else if ( [ "item", "button" ].includes( pNode.type ) ) {
                // create an item/button below an item/button
                addValue( { id: model.PROP.REGION } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            } else {
                // Fallback value: no parent, in default position
                addValue( { id: model.PROP.REGION, value: "" } );
                addValue( { id: model.PROP.SLOT_PLACEHOLDER } );
            }

            // If the slot has supported item types, set the first supported item type for the new item
            if ( pComponentTypeId === model.COMP_TYPE.PAGE_ITEM ) {

                const regionId = lValues.find( value => value.id === model.PROP.REGION )?.value;
                const component = model.getComponents( model.COMP_TYPE.REGION, { id: regionId } )[0];
                const slotPlaceholder = lValues.find( value => value.id === model.PROP.SLOT_PLACEHOLDER )?.value;

                if ( component && slotPlaceholder ) {
                    const slot = model.getSlot( { componentTypeId: pComponentTypeId, component, slotPlaceholder } );
                    if ( slot && Array.isArray( slot.supportedItemTypes ) ) {
                        addValue( { id: model.PROP.ITEM_TYPE, value: slot.supportedItemTypes[0] } );
                    }
                }
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_COMPUTATION ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.PAGE_ITEM, pNode );

            // If the computation was created on or below a page item, then we will automatically assign it to this page item
            if ( lParentComponent ) {
                addValue( { id: model.PROP.COMPUTATION_ITEM_NAME, value: lParentComponent.getProperty( model.PROP.ITEM_NAME ).getValue()} );
                addValue( { id: model.PROP.COMPUTATION_POINT, value: "BEFORE_BOX_BODY" } );
            } else {
                addValue( { id: model.PROP.COMPUTATION_POINT } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_PROCESS ) {
            lParentComponent = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, pNode );

            if ( lParentComponent && lParentComponent.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_EXECUTION_CHAIN" ) {
                addValue( { id: model.PROP.PARENT_PROCESS, value: lParentComponent.id } );
            } else {
                addValue( { id: model.PROP.PROCESS_POINT } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.VALIDATION ) {

            lParentComponent = getNearestComponent(
                [ model.COMP_TYPE.PAGE_ITEM,
                  model.COMP_TYPE.REGION,
                  model.COMP_TYPE.TAB_FORM_COLUMN,
                  model.COMP_TYPE.IG_COLUMN
                ],
                pNode );

            // Was the validation created on or below a component? If yes, default to that component.
            if ( lParentComponent ) {
                switch ( lParentComponent.typeId ) {
                    case model.COMP_TYPE.PAGE_ITEM:

                        addValue( { id: model.PROP.ASSOCIATED_ITEM, value: lParentComponent.id } );
                        break;

                    case model.COMP_TYPE.REGION:

                        addValue( { id: model.PROP.VALIDATION_REGION, value: lParentComponent.id } );
                        break;

                    case model.COMP_TYPE.TAB_FORM_COLUMN:

                        lColumnName = lParentComponent.getProperty( model.PROP.COLUMN_NAME ).getValue();
                        addValue( { id: model.PROP.VALIDATION_REGION,      value: lParentComponent.parentId } );
                        addValue( { id: model.PROP.ASSOCIATED_COLUMN,      value: lColumnName } );
                        addValue( { id: model.PROP.REGION_VALIDATION_TYPE, value: "ITEM_NOT_NULL" } );
                        addValue( { id: model.PROP.REGION_VAL_COLUMN,      value: lColumnName } );
                        addValue( { id: model.PROP.ERROR_MESSAGE,          value: msg( "COLUMN_NOT_NULL_VALIDATION" ) } );
                        break;

                    case model.COMP_TYPE.IG_COLUMN:

                        lColumnName = lParentComponent.getProperty( model.PROP.COLUMN_NAME ).getValue();
                        addValue( { id: model.PROP.VALIDATION_REGION,      value: lParentComponent.parentId } );
                        addValue( { id: model.PROP.ASSOCIATED_COLUMN,      value: lColumnName } );
                        addValue( { id: model.PROP.REGION_VALIDATION_TYPE, value: "ITEM_NOT_NULL" } );
                        addValue( { id: model.PROP.REGION_VAL_COLUMN,      value: lColumnName } );
                        addValue( { id: model.PROP.ERROR_MESSAGE,          value: msg( "COLUMN_NOT_NULL_VALIDATION" ) } );
                        break;
                }
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.BRANCH ) {

            addValue( { id: model.PROP.BRANCH_POINT } );

        } else if ( pComponentTypeId === model.COMP_TYPE.DA_EVENT ) {

            lParentComponent = getNearestComponent(
                [ model.COMP_TYPE.PAGE_ITEM,
                  model.COMP_TYPE.BUTTON,
                  model.COMP_TYPE.REGION,
                  model.COMP_TYPE.PAGE,
                  model.COMP_TYPE.IG_COLUMN ],
                pNode );

            // Was the dynamic action created on or below a component? If yes, default to that component.
            if ( lParentComponent ) {
                switch ( lParentComponent.typeId ) {
                    case model.COMP_TYPE.PAGE_ITEM:

                        addValue( { id: model.PROP.EVENT, value: "change" } );
                        addValue ( { id: model.PROP.WHEN_TYPE,  value: "ITEM" } );
                        addValue ( { id: model.PROP.WHEN_ITEMS, value: lParentComponent.getProperty( model.PROP.ITEM_NAME ).getValue()} );
                        break;

                    case model.COMP_TYPE.BUTTON:

                        if ( $.inArray( lParentComponent.getProperty( model.PROP.BUTTON_ACTION ).getValue(), [ "REDIRECT_PAGE", "REDIRECT_APP" ] ) !== -1 ) {
                            addValue( { id: model.PROP.EVENT, value: "apexafterclosedialog" } );
                            lRefreshRegionId = lParentComponent.getProperty( model.PROP.REGION ).getValue();
                        } else {
                            addValue( { id: model.PROP.EVENT, value: "click" } );
                        }
                        addValue ( { id: model.PROP.WHEN_TYPE,   value: "BUTTON" } );
                        addValue ( { id: model.PROP.WHEN_BUTTON, value: lParentComponent.id } );
                        break;

                    case model.COMP_TYPE.REGION:

                        addValue ( { id: model.PROP.EVENT, value: (() => {
                            let regionType = lParentComponent.getProperty( model.PROP.REGION_TYPE ).getValue();

                            if ( regionType === "NATIVE_CARDS" ) {
                                return "NATIVE_CARDS|REGION TYPE|tablemodelviewpagechange";
                            } else if ( regionType === "NATIVE_IG" ) {
                                return "NATIVE_IG|REGION TYPE|interactivegridselectionchange";
                            } else if ( regionType.startsWith( "TMPL" ) ) {
                                lRefreshRegionId = lParentComponent.id;
                                return "apexafterclosedialog";
                            } else {
                                // generic fallback. makes sense for CR, IR, Chart, Faceted Search, Tree, Map, Dynamic Content
                                return "apexafterrefresh";
                            }
                        })() } );
                        addValue ( { id: model.PROP.WHEN_TYPE,   value: "REGION" } );
                        addValue ( { id: model.PROP.WHEN_REGION, value: lParentComponent.id } );
                        break;

                    case model.COMP_TYPE.PAGE:

                        addValue( { id: model.PROP.EVENT, value: "ready" } );
                        break;

                    case model.COMP_TYPE.IG_COLUMN:

                        addValue( { id: model.PROP.EVENT,          value: "change" } );
                        addValue( { id: model.PROP.WHEN_TYPE,      value: "COLUMN" } );
                        addValue( { id: model.PROP.WHEN_IG_REGION, value: lParentComponent.parentId } );
                        addValue( { id: model.PROP.WHEN_COLUMNS,   value: lParentComponent.getProperty( model.PROP.COLUMN_NAME ).getValue()} );
                        break;
                }
            } else {
                addValue( { id: model.PROP.EVENT } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.DA_ACTION ) {

            addValue( { id: model.PROP.DA_EVENT, typeId: model.COMP_TYPE.DA_EVENT } );

            if ( pSecondaryType !== undefined ) {
                addValue( { id: model.PROP.FIRE_WHEN_EVENT_RESULT_IS, value: pSecondaryType } );
            } else {
                addValue( { id: model.PROP.FIRE_WHEN_EVENT_RESULT_IS } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.TAB_FORM_COLUMN || pComponentTypeId === model.COMP_TYPE.CLASSIC_RPT_COLUMN ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            lParentId        = lParentComponent.id;
            lComponents      = lParentComponent.getChilds( pComponentTypeId );
            addValue( { id: model.PROP.QUERY_COLUMN_ID,     value: lComponents.length + 1 } );
            addValue( { id: model.PROP.DERIVED_COLUMN,      value: "Y" } );
            addValue( { id: model.PROP.DISABLE_SORT_COLUMN, value: "Y" } );

            if ( pSecondaryType === "ROW_SELECTOR" ) {

                addValue( { id: model.PROP.COLUMN_NAME,          value: ROW_SELECTOR_COLUMN_NAME } );
                addValue( { id: model.PROP.TAB_FORM_COLUMN_TYPE, value: "ROW_SELECTOR" } );
                addValue( { id: model.PROP.COLUMN_HEADING,       value: "&nbsp;" } );

            } else if ( pSecondaryType === "VIRTUAL" ) {

                // Get all existing virtual columns and order them by column name to get the last used derived column
                lComponents = lParentComponent.getChilds( pComponentTypeId, {
                    properties: [{ id: model.PROP.DERIVED_COLUMN, value: "Y" }]
                }, function( a, b ) {
                    return ( a.getProperty( model.PROP.COLUMN_NAME ).getValue() > b.getProperty( model.PROP.COLUMN_NAME ).getValue() ) ? 1 : -1;
                } );

                addValue( {
                    id:    model.PROP.COLUMN_NAME,
                    value: "DERIVED$" + ( ( lComponents.length < 8 ) ? "0" : "" ) + ( lComponents.length + 1 )
                } );
                addValue( {
                    id:    ( pComponentTypeId === model.COMP_TYPE.TAB_FORM_COLUMN ) ? model.PROP.TAB_FORM_COLUMN_TYPE : model.PROP.CLASSIC_REPORT_COLUMN_TYPE,
                    value: "LINK"
                } );
                addValue( {
                    id:    model.PROP.COLUMN_HEADING,
                    value: "&nbsp;"
                } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.IG_COLUMN ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            lParentId        = lParentComponent.id;
            addValue( { id: model.PROP.ITEM_TYPE,          value: "NATIVE_DISPLAY_ONLY" } );
            addValue( { id: model.PROP.COLUMN_SOURCE_TYPE, value: "SQL_EXPRESSION" } );

        } else if ( pComponentTypeId === model.COMP_TYPE.REGION_TMPL_COLUMN ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            lParentId        = lParentComponent.id;
            addValue( { id: model.PROP.COLUMN_SOURCE_TYPE, value: "SQL_EXPRESSION" } );

        } else if ( pComponentTypeId === model.COMP_TYPE.CARD_ACTION ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION, pNode ).getChilds( model.COMP_TYPE.CARD )[ 0 ].id;

        } else if ( pComponentTypeId === model.COMP_TYPE.REGION_ACTION ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            lParentId        = lParentComponent.id;
            addValue( { id: model.PROP.HIDDEN_PLUGIN_NAME, value: lParentComponent.getProperty( model.PROP.REGION_TYPE ).getValue() } );

        } else if ( pComponentTypeId === model.COMP_TYPE.REGION_ACTION_MENU_ENTRY ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION_ACTION, pNode ).id;
            // If we are in a sub-menu, we also have to set the parent menu
            if ( [ "region_action_menu_entries", "region_action_menu_entry" ].includes( pNode._parent._parent.type )) {
                addValue( { id: model.PROP.REGION_ACTION_PARENT_MENU, value: getNearestComponent( model.COMP_TYPE.REGION_ACTION_MENU_ENTRY, pNode._parent ).id } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.IR_COLUMN_ACTION ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.IR_COLUMN, pNode );
            lParentId        = lParentComponent.id;
            addValue( { id: model.PROP.HIDDEN_PLUGIN_NAME, value: lParentComponent.getProperty( model.PROP.IR_COLUMN_DISPLAY_TYPE ).getValue() } );

        } else if ( pComponentTypeId === model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ) {

            lParentId = getNearestComponent( model.COMP_TYPE.IR_COLUMN_ACTION, pNode ).id;
            // If we are in a sub-menu, we also have to set the parent menu
            if ( [ "ir_column_action_menu_entries", "ir_column_action_menu_entry" ].includes( pNode._parent._parent.type )) {
                addValue( { id: model.PROP.IR_COLUMN_ACTION_PARENT_MENU, value: getNearestComponent( model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY, pNode._parent ).id } );
            }

        } else if ( pComponentTypeId === model.COMP_TYPE.MAP_LAYER ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION, pNode ).getChilds( model.COMP_TYPE.MAP_REGION )[ 0 ].id;

        } else if ( pComponentTypeId === model.COMP_TYPE.SEARCH_REGION_SOURCE ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION, pNode ).id;

        } else if ( pComponentTypeId === model.COMP_TYPE.IR_COLUMN_GROUP ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION, pNode ).getChilds( model.COMP_TYPE.IR_ATTRIBUTES )[ 0 ].id;

        } else if ( pComponentTypeId === model.COMP_TYPE.IG_COLUMN_GROUP ) {

            lParentId = getNearestComponent( model.COMP_TYPE.REGION, pNode ).id;

        } else if ( pComponentTypeId === model.COMP_TYPE.JET_CHART_SERIES ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode ).getChilds( model.COMP_TYPE.JET_CHART )[ 0 ];
            lParentId = lParentComponent.id;
            addValue( { id: model.PROP.SERIES_CHART_TYPE, value: lParentComponent.getProperty( model.PROP.JET_CHART_TYPE ).getValue()} );

        } else if ( $.inArray( pComponentTypeId, [ model.COMP_TYPE.FACET, model.COMP_TYPE.FACET_GROUP, model.COMP_TYPE.SFILTER, model.COMP_TYPE.SFILTER_GROUP ]) !== -1 ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            lParentId        = lParentComponent.id;

        } else if ( $.inArray( pComponentTypeId, [ model.COMP_TYPE.FACET_GROUP_ITEM, model.COMP_TYPE.SFILTER_GROUP_ITEM ]) !== -1 ) {

            lParentComponent = getNearestComponent(
                                   ( pComponentTypeId === model.COMP_TYPE.FACET_GROUP_ITEM ? model.COMP_TYPE.FACET_GROUP : model.COMP_TYPE.SFILTER_GROUP ),
                                   pNode );
            lParentId        = lParentComponent.id;
            addValue({ id: model.PROP.HIDDEN_PARENT_REGION, typeId: model.COMP_TYPE.REGION });

        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_PROC_API_PARAM ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, pNode );
            lParentId        = lParentComponent.id;

        } else if ( pComponentTypeId === model.COMP_TYPE.PAGE_PROC_WS_PARAM ) {

            lParentComponent = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, pNode );
            lParentId        = lParentComponent.id;

        }

        // Get the start tree node where we have to look for the newly created component. It's necessary to restrict
        // the search, because a component can appear multiple times in the tree (ie. computations), but we do want to
        // select the tree node where we have created the component
        if ( nodeComponent ) {
            lStartNodeId = pNode._parent.id;
        }

        // The "Row Selector" of a tabular form should always be added as first column
        if ( pComponentTypeId === model.COMP_TYPE.TAB_FORM_COLUMN && pSecondaryType === "ROW_SELECTOR" ) {
            lPrevComponent = undefined;
        } else if ( [ model.COMP_TYPE.DA_EVENT, model.COMP_TYPE.PAGE_PROCESS ].includes( pComponentTypeId ) ) {
            // If it's a dynamic action event, or a page process, we always want to add it to the end
            // of all dynamic actions or processes, in order to keep the existing execution sequence.
            lPrevComponent = "last";
        } else if ( nodeComponent ) {
            lPrevComponent = nodeComponent;
        } else {
            // Append the new component as last component
            lPrevComponent = "last";
        }

        lMessage = model.transaction.message( {
            action:     model.MESSAGE_ACTION.CREATE,
            component:  pComponentTypeId
        } );

        lTransaction = model.transaction.start( "", lMessage );

        lNewComponent = new model.Component( {
            previousComponent: lPrevComponent,
            typeId:            pComponentTypeId,
            parentId:          lParentId,
            values:            lValues
        } );

        // For dynamic action events we automatically create an action to get started
        if ( pComponentTypeId === model.COMP_TYPE.DA_EVENT ) {

            if ( lNewComponent.getProperty( model.PROP.EVENT ).getValue() === "apexafterclosedialog" ) {

                new model.Component( {
                    typeId:   model.COMP_TYPE.DA_ACTION,
                    parentId: lNewComponent.id,
                    values:   [
                        { id: model.PROP.DA_ACTION_TYPE,  value: "NATIVE_REFRESH" },
                        { id: model.PROP.AFFECTED_TYPE,   value: "REGION" },
                        { id: model.PROP.AFFECTED_REGION, value: ( lRefreshRegionId ? lRefreshRegionId : "" ) }
                    ]
                } );

            } else if ( lNewComponent.getProperty( model.PROP.WHEN_TYPE ) &&
                        lNewComponent.getProperty( model.PROP.WHEN_TYPE ).getValue() === "COLUMN" ) {

                new model.Component( {
                    typeId:   model.COMP_TYPE.DA_ACTION,
                    parentId: lNewComponent.id,
                    values:   [
                        { id: model.PROP.DA_ACTION_TYPE, value: "NATIVE_ENABLE" },
                        { id: model.PROP.AFFECTED_TYPE,  value: "COLUMN" }
                    ]
                } );

            } else {

                new model.Component( {
                    typeId:   model.COMP_TYPE.DA_ACTION,
                    parentId: lNewComponent.id,
                    values:   [
                        { id: model.PROP.DA_ACTION_TYPE, value: "NATIVE_SHOW" },
                        { id: model.PROP.AFFECTED_TYPE,  value: "ITEM" }
                    ]
                } );

            }
        }

        apex.commandHistory.execute( lTransaction );

        // Select the newly created component
        setSelectedComponents( [ lNewComponent ], pTree$, lStartNodeId, true );

    }


    //
    // Helper functions to make treeView handling easier
    //
    function getNodes( pTreeNodes$, pTree$ ) {

        return pTree$.treeView( "getNodes", pTreeNodes$ );

    } // getNodes


    function getSelectedComponents( pTree$ ) {

        var lNodes  = pTree$.treeView( "getSelectedNodes" ),
            lResult = [];

        // Get components of selected nodes
        for ( var i = 0; i < lNodes.length; i++ ) {
            if ( lNodes[ i ].data && hasOwnProperty( lNodes[ i ].data, "componentId" ) ) {
                lResult.push( model.getComponents( lNodes[ i ].data.typeId, { id: lNodes[ i ].data.componentId } )[ 0 ] );
            }
        }

        return lResult;

    } // getSelectedComponents


    function getComponentDomNodes$( pComponent, pTree$, pParentId ) {

        var lParent$;

        // todo that's a slow! Can we search by ID?
        if ( pParentId ) {
            lParent$ = pTree$.treeView( "find", {
                depth: -1,
                match: function( pNode ) {
                    return ( pNode.id === pParentId );
                }
            } );
        }

        return pTree$.treeView( "find", {
            parentNodeContent$: lParent$,
            depth:   -1,
            findAll: true,
            match: function( pNode ) {
                return ( pNode.data.typeId === pComponent.typeId && pNode.data.componentId === pComponent.id );
            }
        } );

    } // getComponentDomNodes$


    function getComponentNode( pComponent, pTree$, pParentId ) {

        return pTree$.treeView( "getNodes", getComponentDomNodes$( pComponent, pTree$, pParentId ) )[ 0 ];

    } // getComponentNode


    function getComponent( pNode$, pTree$ ) {

        var lNode,
            lComponents = [];

        if ( pNode$ instanceof jQuery ) {
            lNode = pTree$.treeView( "getNodes", pNode$ )[ 0 ];
        } else {
            lNode = pNode$;
        }

        if ( lNode.data && lNode.data.typeId && lNode.data.componentId ) {
            lComponents = model.getComponents( lNode.data.typeId, { id: lNode.data.componentId } );
        }

        if ( lComponents.length === 1 ) {
            return lComponents[ 0 ];
        } else {
            return undefined;
        }

    } // getComponent


    function getNearestComponent( pComponentTypeId, pNode ) {

        var lComponentTypes = ( Array.isArray( pComponentTypeId ) ) ? pComponentTypeId : [ pComponentTypeId ],
            lComponent;

        if ( pNode ) {
            lComponent = getComponent( pNode );

            // Search as long as the current node is a component and it matches to the specified component type
            if ( lComponent === undefined || ( lComponent && $.inArray( lComponent.typeId, lComponentTypes ) === -1 ) ) {
                lComponent = getNearestComponent( lComponentTypes, pNode._parent );
            }
        }
        return lComponent;
    }


    function getNearestValue( pPropertyId, pNode ) {

        var lValue;

        if ( pNode ) {
            if ( hasOwnProperty( pNode.data, pPropertyId ) ) {
                lValue = pNode.data[ pPropertyId ];
            } else {
                // Search as long as we have found the specified property
                lValue = getNearestValue( pPropertyId, pNode._parent );
            }
        } else {
            lValue = "";
        }
        return lValue;
    }


    function updateComponentNode( pComponent, pTree$, pFunction ) {

        getComponentDomNodes$( pComponent, pTree$ ).each( function() {
            var lDomNode$ = $( this );
            pFunction.call( getNodes( lDomNode$, pTree$ )[ 0 ] );
            pTree$.treeView( "update", lDomNode$ );
        } );

    } // updateComponentNode


    // Check if component has a tree node (it won't if it is displayed in attributes or printing PE tabs), if not use the parent
    function checkComponentHasNode( pComponent ) {
        var lComponent;

        if ( $.inArray( pComponent.typeId, model.NO_NODE_COMP_TYPES ) > -1 ) {
            lComponent = checkComponentHasNode( pComponent.getParent() );
        } else {
            lComponent = pComponent;
        }

        return lComponent;
    } // checkComponentHasNode

    function addComponentClass( pComponent, pClass, pTree$ ) {
        var lComponent = checkComponentHasNode( pComponent );

        updateComponentNode( lComponent, pTree$, function(){
            if ( !( this.data && this.data.isPlain ) ) {
                this.classes += " " + pClass;
            }
        } );

    } // addComponentClass

    function removeComponentClass( pComponent, pClass, pTree$ ) {
        var lComponent = checkComponentHasNode( pComponent );

        updateComponentNode( lComponent, pTree$, function(){
            this.classes =
                $.grep( this.classes.split( " " ), function( pValue ) {
                    return ( pValue !== pClass );
                } ).join( " " );
        } );

    } // removeComponentClass

    function refreshTree( { pTree$, componentsToExpand } ) {

        let nodesToExpand = [];
        for ( const component in componentsToExpand ) {
            if ( hasOwnProperty( componentsToExpand, component ) ) {
                const regionId = componentsToExpand[ component ] ? model.getParentRegionId( componentsToExpand[ component ] ) : null;
                const slotPlaceholder = componentsToExpand[ component ] ? componentsToExpand[ component ].getPropertyValue( model.PROP.SLOT_PLACEHOLDER ) : null;
                let nodeToExpand;
                if ( regionId ) {
                    nodeToExpand = `region_${model.COMP_TYPE.REGION}_${regionId}_slot_${slotPlaceholder}`;
                } else {
                    nodeToExpand = `page_${model.COMP_TYPE.PAGE}_slot_${slotPlaceholder}`;
                }
                nodesToExpand.push( nodeToExpand );
            }
        }

        // Refresh tree and expand the node
        pTree$.trigger( "refresh", JSON.stringify( nodesToExpand ) );

    } // refreshTree


    function getTreeRules() {

        function canDeleteRegionColumn( pNode ) {
            var lComponent = getComponent( pNode );

            // At least one region column does have to exist
            return ( model.getComponents( lComponent.typeId, { parentId: lComponent.parentId } ).length > 1 );
        }

        function canDeleteSearchSource( pNode ) {
            var lComponent = getComponent( pNode );

            // At least one region column does have to exist
            return ( model.getComponents( lComponent.typeId, { parentId: lComponent.parentId } ).length > 1 );
        }

        function canDeleteTabFormColumn( pNode ) {
            // Only the row selector or derived columns of a tabular form / classic report can be deleted
            return ( getComponent( pNode ).getProperty( model.PROP.DERIVED_COLUMN ).getValue() === "Y" );
        }

        function canDragClassicRptColumn( pNode ) {
            // Row Selector is not draggable, it has to be the first column (bug# 13018546)
            return ( getComponent( pNode ).getProperty( model.PROP.COLUMN_NAME ).getValue() !== ROW_SELECTOR_COLUMN_NAME );
        }

        function canAddJetChartSeries( pNode ) {
            // Only one chart series allowed for the specified jet chart types
            return ( $.inArray(
                getNearestComponent( model.COMP_TYPE.REGION, pNode ).getChilds( model.COMP_TYPE.JET_CHART )[ 0 ].getProperty( model.PROP.JET_CHART_TYPE ).getValue(),
                [ "dial", "stock", "gantt" ] ) === -1
            );
        }

        function canDeleteJetChartSeries( pNode ) {
            // At least one chart series does have to exist
            return ( model.getComponents( model.COMP_TYPE.JET_CHART_SERIES, { parentId: getComponent( pNode ).parentId } ).length > 1 );
        }

        function canDeleteMapLayer( pNode ) {
            // At least one map layer does have to exist
            return ( model.getComponents( model.COMP_TYPE.MAP_LAYER, { parentId: getComponent( pNode ).parentId } ).length > 1 );
        }

        function canDuplicateJetChartSeries( pNode ) {
            // Only one chart series allowed for the specified jet chart types
            return ( $.inArray(
                getComponent( pNode ).getParent().getProperty( model.PROP.JET_CHART_TYPE ).getValue(),
                [ "dial", "stock", "gantt" ] ) === -1
            );
        }

        function canDeleteSmartFilter( pNode ) {
            // Smart Filters always needs a search field
            return ( getComponent( pNode ).getProperty( model.PROP.ITEM_TYPE ).getValue() !== "NATIVE_SEARCH" );
        }

        function canDuplicateFacetOrSmartFilter( pNode ) {
            // Faceted Search and Smart Filters only need one search field
            return ( getComponent( pNode ).getProperty( model.PROP.ITEM_TYPE ).getValue() !== "NATIVE_SEARCH" );
        }

        function slotValidChildren ( pNode, pChildren, regionId ) {

            let isValidChildren;

            if ( Array.isArray( pChildren ) ) {
                const componentTypes = pChildren.map( ( child ) => child.type );

                const slot = model.getSlot( {
                    componentTypes,
                    regionId,
                    slotPlaceholder: pNode.data[ model.PROP.SLOT_PLACEHOLDER ]
                } );

                isValidChildren = componentTypes.every( childrenType => [ "region", "item", "button" ].includes( childrenType ) );

                // slot doesn't have region support, and user is trying to move a region
                if ( isValidChildren && slot && !slot.hasRegionSupport ) {
                    isValidChildren = !pChildren.some( child => child.type === "region" );
                }

                // slot doesn't have item support, and user is trying to move an item
                if ( isValidChildren && slot && !slot.hasItemSupport ) {
                    isValidChildren = !pChildren.some( child => child.type === "item" );
                }

                // slot doesn't have button support, and user is trying to move an button
                if ( isValidChildren && slot && !slot.hasButtonSupport ) {
                    isValidChildren = !pChildren.some( child => child.type === "button" );
                }
            } else {
                isValidChildren = false;
            }

            return isValidChildren;
        }

        return {
            "default": {
                operations: {
                    canAdd:       false,
                    canDuplicate: false,
                    canDelete:    false,
                    canRename:    false,
                    canDrag:      false,
                    canSearch:    false,
                    canExtCreate: false,
                    canExtEdit:   false,
                    canExtCopy:   false
                }
            },
            "page": {
                icon: "icon-tree-page"
            },
            "validations":{
                operations: {
                    canAdd: true
                },
                validChildren: [ "validation" ]
            },
            "validation": {
                icon: "icon-tree-validation",
                operations: {
                    canDuplicate: true,
                    canRename:    true,
                    canDelete:    true,
                    canDrag:      true,
                    canExtCopy:   true
                }
            },
            "inline_validations": {
                validChildren: [ "inline_validation" ]
            },
            "inline_validation": {
                icon: "icon-tree-validation",
                operations: {
                    canDuplicate: true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                }
            },
            "pre_rendering": {
            },
            "post_rendering": {
            },
            "computations": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "computation" ]
            },
            "computation": {
                icon: "icon-tree-computation",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canDelete:    true,
                    canExtCopy:   true,
                    canSearch:    true
                }
            },
            "inline_computations": {
                validChildren: [ "inline_computation" ]
            },
            "inline_computation": {
                icon: "icon-tree-computation",
                operations: {
                    canDuplicate: true,
                    canDelete:    true,
                    canExtCopy:   true,
                    canSearch:    true
                }
            },
            "processes": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "process" ]
            },
            "process": {
                icon: "icon-tree-process",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                },
                validChildren: [ "process" ]
            },
            "api_params": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "api_param" ]
            },
            "api_param": {
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true
                }
            },
            "api_ws_params": {
                validChildren: [ "api_ws_param" ]
            },
            "api_ws_param": {
            },
            "after_submit": {
            },
            "processing": {
            },
            "after_processing": {
            },
            "validating": {
            },
            "after_header": {
            },
            "before_header": {
            },
            "before_regions": {
            },
            "after_regions": {
            },
            "before_footer": {
            },
            "after_footer": {
            },
            "meta_tags": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "meta_tag" ]
            },
            "meta_tag":{
                icon: "icon-tree-meta-tag",
                operations: {
                    canDuplicate: true,
                    canRename:    true,
                    canDelete:    true
                }
            },
            "branches": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "branch" ]
            },
            "branch":{
                icon: "icon-tree-branch",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                }
            },
            "components": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "page_slot" ]
            },
            "page_slot": {
                operations: {
                    canAdd: true
                },
                validChildren: function( pNode, pChildren ) {
                    return slotValidChildren ( pNode, pChildren, "" );
                }
            },
            "region_slot": {
                operations: {
                    canAdd: true
                },
                validChildren: function( pNode, pChildren ) {
                    return slotValidChildren ( pNode, pChildren, pNode._parent.data.componentId );
                }
            },
            "region": {
                icon: "icon-tree-region",
                operations: {
                    canAdd:       true, // needed for children like region, item and button
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                },
                validChildren: [
                    // the following types are added for easier drag & drop
                    "region_slot",
                    "region",
                    "item",
                    "button",
                    "inline_da_events",
                    "svg_chart_series",
                    "jet_chart_series", "jet_chart_axes",
                    "facets",
                    "search_sources",
                    "sfilters",
                    "region_columns",
                    "ir_column_groups", "ir_saved_reports",
                    "ig_column_groups", "ig_saved_reports", "ig_columns",
                    "region_tmpl_columns",
                    "map_layers" ]
            },
            "item": {
                icon: "icon-tree-item",
                operations: {
                    canAdd:       true, // needed for computation
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canExtCopy:   true,
                    canSearch:    true
                },
                validChildren: [
                    // the following types are added for easier drag & drop
                    "computations", "inline_validations", "inline_da_events", "computation"
                ]
            },
            "button": {
                icon: "icon-tree-button",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                }
            },
            "region_columns": {
                operations: {
                    canAdd:    true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "classic_report_column", "ir_report_column", "tabform_column", "region_column" ]
            },
            "classic_report_column": {
                icon: "icon-tree-report-column",
                operations: {
                    canRename:    false, // todo isRenameable,
                    canDuplicate: false,
                    canDelete:    canDeleteRegionColumn,
                    canDrag:      canDragClassicRptColumn,
                    drag: {
                        normal: "move"
                    }
                }
            },
            "classic_report_attributes": {
            },
            "tabform_attributes": {
            },
            "region_plugin_attributes": {
            },
            "map_layers": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "map_layer" ]
            },
            "map_layer": {
                icon: "icon-tree-col-group",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    canDeleteMapLayer
                }
            },
            "card_actions": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "card_action" ]
            },
            "card_action": {
                icon: "icon-tree-col-group",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    true
                }
            },
            "region_actions": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "region_action" ]
            },
            "region_action": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    true
                },
                validChildren: [ "region_action_menu_entries" ]
            },
            "region_action_menu_entries": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "region_action_menu_entry" ]
            },
            "region_action_menu_entry": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    true
                }
            },
            "ir_column_actions": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "ir_column_action" ]
            },
            "ir_column_action": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    true
                },
                validChildren: [ "ir_column_menu_entries" ]
            },
            "ir_column_action_menu_entries": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "ir_column_action_menu_entry" ]
            },
            "ir_column_action_menu_entry": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    false,
                    canDelete:    true
                }
            },
            "ir_attributes": {
                validChildren: [ "ir_column_groups", "ir_saved_reports" ]
            },
            "ir_column_groups": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "ir_column_group" ]
            },
            "ir_column_group": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true
                }
            },
            "ir_saved_reports": {
                validChildren: [ "ir_saved_report" ]
            },
            "ir_saved_report": {
                icon: "icon-tree-saved-report"
            },
            "ir_report_column": {
                icon: "icon-tree-report-column",
                operations: {
                    canRename: false, // todo isRenameable,
                    canDelete: canDeleteRegionColumn,
                    canDrag:   true
                },
                validChildren: [ "ir_column_actions" ]
            },
            "ig_column_groups": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "ig_column_group" ]
            },
            "ig_column_group": {
                icon: "icon-tree-col-group",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canRename:    true,
                    canDelete:    true
                }
            },
            "ig_saved_reports": {
                validChildren: [ "ig_saved_report" ]
            },
            "ig_saved_report": {
                icon: "icon-tree-saved-report"
            },
            "ig_columns": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "ig_column" ]
            },
            "ig_column": {
                icon: "icon-tree-report-column",
                operations: {
                    canRename: false,
                    canDrag:   true,
                    canDelete: canDeleteRegionColumn
                }
            },
            "tabform_column": {
                icon: "icon-tree-item",
                operations: {
                    canRename: false,
                    canDrag:   canDragClassicRptColumn,
                    canDelete: canDeleteTabFormColumn
                }
            },
            "region_column": {
                icon: "icon-tree-report-column",
                operations: {
                    canRename: false,
                    canDrag:   true,
                    canDelete: canDeleteRegionColumn
                }
            },
            "region_tmpl_columns": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "region_tmpl_column" ]
            },
            "region_tmpl_column": {
                icon: "icon-tree-report-column",
                operations: {
                    canRename: false,
                    canDrag:   true,
                    canDelete: canDeleteRegionColumn
                }
            },
            "search_sources": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "search_source" ]
            },
            "search_source": {
                icon: "icon-search",
                operations: {
                    canAdd:       false,
                    canDuplicate: false,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    canDeleteSearchSource,
                    canSearch:    true
                }
            },
            "facets": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "facet", "facet_group" ]
            },
            "facet": {
                icon: "icon-tree-report-column",
                operations: {
                    canAdd:       false,
                    canDuplicate: canDuplicateFacetOrSmartFilter,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canSearch:    true
                }
            },
            "facet_group": {
                icon: "icon-item-native-checkbox",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canSearch:    false
                },
                validChildren: [ "facet_group_items" ]
            },
            "facet_group_items": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "facet_group_item" ]
            },
            "facet_group_item": {
                icon: "icon-tree-report-column",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canSearch:    true
                }
            },
            "sfilters": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "sfilter", "sfilter_group" ]
            },
            "sfilter": {
                icon: "icon-tree-report-column",
                operations: {
                    canAdd:       false,
                    canDuplicate: canDuplicateFacetOrSmartFilter,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    canDeleteSmartFilter,
                    canSearch:    true
                }
            },
            "sfilter_group": {
                icon: "icon-item-native-checkbox",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canSearch:    false
                },
                validChildren: [ "sfilter_group_items" ]
            },
            "sfilter_group_items": {
                operations: {
                    canAdd: true // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "sfilter_group_item" ]
            },
            "sfilter_group_item": {
                icon: "icon-tree-report-column",
                operations: {
                    canAdd:       false,
                    canDuplicate: true,
                    canDrag:      true,  // Adapter extraCheck will only allow move within same region
                    canRename:    false, // todo isRenameable,
                    canDelete:    true,
                    canSearch:    true
                }
            },
            "jet_chart_series": {
                operations: {
                    canAdd: canAddJetChartSeries  // Adapter extraCheck will only allow move within same region
                },
                validChildren: [ "jet_chart_serie" ]
            },
            "jet_chart_serie": {
                icon: "icon-tree-chart-series",
                operations: {
                    canAdd:       canAddJetChartSeries,
                    canDuplicate: canDuplicateJetChartSeries,
                    canDelete:    canDeleteJetChartSeries,
                    canRename:    true,
                    canDrag:      true,
                    drag: {
                        normal: "move"
                    }
                }
            },
            "jet_chart_axes": {
                validChildren: [ "jet_chart_axis" ]
            },
            "jet_chart_axis": {
            },
            "region_web_src_params": {
                validChildren: [ "region_web_src_param" ]
            },
            "jet_chart_web_src_params": {
                validChildren: [ "jet_chart_web_src_param" ]
            },
            "map_layer_web_src_params": {
                validChildren: [ "map_layer_web_src_param" ]
            },
            "da_events": {
                validChildren: [ "da_event" ]
            },
            "da_event": {
                icon: "icon-tree-da-event",
                operations: {
                    canDuplicate: true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                },
                validChildren: [ "da_actions_true", "da_actions_false" ]
            },
            "da_actions_true": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "da_action" ]
            },
            "da_actions_false": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "da_action" ]
            },
            "da_action": {
                icon: "icon-tree-da-action",
                operations: {
                    canDuplicate: true,
                    canDrag:      true,
                    canDelete:    true
                }
            },
            "inline_da_events": {
                validChildren: [ "inline_da_event" ]
            },
            "inline_da_event": {
                icon: "icon-tree-da-event",
                operations: {
                    canDuplicate: true,
                    canRename:    true,
                    canDelete:    true,
                    canExtCopy:   true
                },
                validChildren: [ "da_actions_true", "da_actions_false" ]
            },
            "page_load_da_events": {
                operations: {
                    canAdd: true
                },
                validChildren: [ "page_load_da_event" ]
            },
            "page_load_da_event": {
                icon: "icon-tree-da-event",
                operations: {
                    canDrag: true,
                    drag: {
                        normal: "move"
                    }
                }
            },
            "task_params": {
                validChildren: [ "task_param" ]
            },
            "task_param": {
            },
            //
            // Shared Components
            //
            "tab_sets": {
            },
            "tab_set": {
                icon: "icon-tree-tabs",
                operations: {
                    canExtEdit:   true
                }
            },
            "lovs": {
                operations: {
                    canExtCreate: true
                }
            },
            "lov": {
                icon: "icon-tree-lov",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "breadcrumbs": {
                operations: {
                    canExtCreate: true
                }
            },
            "breadcrumb": {
                icon: "icon-tree-breadcrumb",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true
                }
            },
            "lists": {
                operations: {
                    canExtCreate: true
                }
            },
            "list": {
                icon: "icon-tree-list",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "navigation_menu_lists": {
                operations: {
                    canExtCreate: true
                }
            },
            "navigation_menu_list": {
                icon: "icon-tree-list",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "navigation_bar_lists": {
                operations: {
                    canExtCreate: true
                }
            },
            "navigation_bar_list": {
                icon: "icon-tree-list",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "templates": {
            },
            "page_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "page_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "field_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "field_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "button_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "button_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "region_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "region_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "list_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "list_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "nav_list_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "nav_list_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "breadcrumb_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "breadcrumb_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "calendar_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "calendar_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "report_templates": {
                operations: {
                    canExtCreate: true
                }
            },
            "report_template": {
                icon: "icon-tree-templates",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "authorizations": {
                operations: {
                    canExtCreate: true
                }
            },
            "authorization": {
                icon: "icon-tree-authorization",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true,
                    canExtCopy:   true
                }
            },
            "plugins": {
            },
            "plugin": {
                icon: "icon-tree-plugin"
            },
            "build_options": {
                operations: {
                    canExtCreate: true
                }
            },
            "build_option": {
                icon: "icon-tree-build-option",
                operations: {
                    canExtCreate: true,
                    canExtEdit:   true
                }
            },
            "ai_configs": {
            },
            "ai_config": {
                icon: "icon-tree-ai-config",
                operations: {
                    canExtCreate: true,
                    canExtEdit: true
                }
            },
            "data_load_tables": {
            },
            "data_load_table": {
                icon: "icon-tree-data-load-table",
                operations: {
                    canExtEdit: true
                }
            },
            "data_load_definitions": {
            },
            "data_load_definition": {
                icon: "icon-tree-data-load-table",
                operations: {
                    canExtEdit: true
                }
            },
            "email_templates": {
            },
            "email_template": {
                icon: "icon-tree-email",
                operations: {
                    canExtEdit: true
                }
            },
            "web_services": {
                operations: {
                    canExtCreate: true
                }
            },
            "web_service": {
                icon: "icon-tree-web-service",
                operations: {
                    canExtCreate: true
                }
            },
            "references": {
            },
            "referenced_by": {
                // xxx would like the icon to be that of the referenced component
                operations: {
                    canRename: true
                }
            },
            "report_queries": {
            },
            "report_query": {
                icon: "icon-tree-report-layout",
                operations: {
                    canExtEdit: true
                }
            }

        };

    } // getTreeRules

    function getTreeNodeAdapter( pDataFunction, pExpandedState ) {

        function getInitialExpandedNodeIds( pData ) {

            var lNodeIds = [];

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
                for ( var i = 0; i < pNodes.length; i++ ) {
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

        function getParentOfType( component, typeId ) {
            let parent;
            if ( component ) {
                if ( component.typeId === typeId ) {
                    return component;
                }
                parent = component.getParent();

                if ( parent?.typeId !== typeId ) {
                    parent = getParentOfType( parent, typeId );
                }
            }
            return parent;
        } // getParentOfType

        var lData        = pDataFunction(),
            lNodeAdapter = $.apex.treeView.makeDefaultNodeAdapter( lData, getTreeRules(), true, getInitialExpandedNodeIds( lData ) );

        lNodeAdapter.getCollapsedNodes = function(  { expandedState } ) {
            const nodeMap = this._state.PDrenderingTree_?.nodeMap;

            const childlessNodes = new Set();
            const collapsedNodes = new Set();

            function findChildlessNodes( node ) {
                if ( node ) {
                    if  ( ( node.children?.length || 0 ) > 0 ) {
                        for (const child of node.children) {
                            findChildlessNodes(child);
                        }
                    } else {
                        childlessNodes.add( node.id );
                    }
                }
            };

            findChildlessNodes( this.data );

            for ( const node in nodeMap ) {
                if ( ( !expandedState [ node ]
                     || expandedState [ node ] === false
                     )
                     // regions without child nodes should not be considered as collapsed
                     && !childlessNodes.has( node )
                ) {
                        collapsedNodes.add( node );
                }
            }

            return collapsedNodes;

        };

        lNodeAdapter.sortCompare = null;

        lNodeAdapter.defaultGetIcon = lNodeAdapter.getIcon;
        lNodeAdapter.getIcon = function( n ) {
            const component = getComponent( n );
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
                }
            }
            return this.defaultGetIcon( n );
        };

        lNodeAdapter.extraCheck = function( pResult, pRule, pNode, pOperation, pChildren ) {

            var lComponent,
                i;

            if ( pResult ) {

                if ( $.inArray( pRule, [ "canDelete", "canRename", "canDrag", "canDuplicate" ] ) !== -1 ) {

                    lComponent = getComponent( pNode );
                    return ( lComponent && !lComponent.isReadOnly() && !model.isPageReadOnly() );

                } else if ( pRule === "canAdd" && model.isPageReadOnly() ) {
                    return false;

                    // Make sure children can only be moved within parent
                } else if (  pRule === "canAdd"
                          && pOperation === "move"
                          && [ "region_columns",
                            "region_tmpl_columns",
                            "ig_columns",
                            "ir_column_groups",
                            "ig_column_groups",
                            "facets",
                            "search_sources",
                            "sfilters",
                            "jet_chart_series",
                            "map_layers",
                            "jet_chart_axes",
                            "api_params",
                            "api_ws_params",
                            "processes",
                            "region_actions",
                            "ir_column_actions" ].includes( pNode.type )
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
                } else if ( pRule === "canAdd"
                            && pOperation === "move"
                            && ( pNode.type === "region_action_menu_entries" || pNode.type === "ir_column_action_menu_entries" )
                            && pChildren )
                {
                    let actionTypeId = pNode.type === "region_action_menu_entries" ? model.COMP_TYPE.REGION_ACTION : model.COMP_TYPE.IR_COLUMN_ACTION;
                    let actionComponent = getParentOfType( getComponent( pNode._parent ), actionTypeId );
                    // Make sure region/ir action entries can only be moved within their parent action
                    for ( i = 0; i < pChildren.length; i++ ) {
                        if ( actionComponent?.id !== getComponent( pChildren[ i ] )?.parentId ) {
                            return false;
                        }
                    }
                } else if ( pRule === "canAdd"
                            && pOperation === "move"
                            && pNode.type === "region_slot"
                            && pChildren ) {
                    const component = getComponent( pNode._parent );
                    const slot = model.getSlot( { component, slotPlaceholder: pNode.data[ model.PROP.SLOT_PLACEHOLDER ] } );
                    const supportedRegionTypes = slot.supportedRegionTypes;
                    const supportedItemTypes = slot.supportedItemTypes;
                    for ( const child of pChildren ) {
                        const childComponent = getComponent( child );
                        if ( childComponent.typeId === model.COMP_TYPE.REGION && supportedRegionTypes ) {
                            return supportedRegionTypes.includes( childComponent.getPropertyValue( model.PROP.REGION_TYPE ) );
                        } else if ( childComponent.typeId === model.COMP_TYPE.PAGE_ITEM && supportedItemTypes ) {
                            return supportedItemTypes.includes( childComponent.getPropertyValue( model.PROP.ITEM_TYPE ) );
                        }
                    }
                }
            }

            return pResult;
        };

        // custom render function to include status icon
        lNodeAdapter.renderNodeContent = function( node, out, options, state ) {
            var icon, c, statusIcon;

            if ( options.nodeSelector > 0 ) {
                // simulate a checkbox PD trees are always multi select
                out.markup( '<span class="u-selector"></span>' );
            }
            icon = this.getIcon( node );
            if ( icon !== null ) {
                out.markup( "<span" )
                    .attr( "class", "a-Icon " + icon )
                    .attr( "aria-hidden", "true" )
                    .markup( "></span>" );
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

        return function() {
            return lNodeAdapter;
        };
    } // getTreeNodeAdapter


    function initTree( pTree$, pDataFunction, pShowRoot ) {

        var contextMenuId = pTree$[0].id + "Menu";

        pTree$.treeView( {
            getNodeAdapter:  getTreeNodeAdapter( pDataFunction ),
            showRoot:        pShowRoot,
            collapsibleRoot: false,
            expandRoot:      false,
            contextMenu:     getContextMenu( pTree$ ),
            contextMenuId:   contextMenuId,
            multiple:        true,
            doubleClick:     "toggle",
            clickToRename:   false,
            keyboardRename:  false,
            keyboardAdd:     false, // todo can we add insert support?
            keyboardDelete:  true,
            //
            tooltip: {
                show:    apex.tooltipManager.defaultShowOption(),
                content: function( pCallback, pNode ) {
                    var lComponent = getComponent( pNode );
                    if ( lComponent ) {
                        return pd.tooltipContentForComponent( lComponent );
                    }
                }
            },
            // drag and drop
            dragAndDrop:       true,
            dragMultiple:      true,
            dragReorder:       true,
            delay:             10,
            distance:          5,
            // todo dragExpandDelay: -1, // to test no expand on hover during drag
            dragAppendTo:      document.body,
            dragCursor:        "move",
            dragOpacity:       0.6,
            dragCursorAt:      { left: 10, bottom: 10 },
            dragAnimate:       false,
            dragContainment:   "document",

            // events
            selectionChange: function() {

                var WIDGET = this.id,
                lComponents;

                lComponents = getSelectedComponents( $( this ) );

                // Notify other widgets on the page that a component has been selected
                debug.trace( "%s: trigger event selectionChanged", WIDGET, lComponents );
                $( document ).trigger( "selectionChanged", [ WIDGET, lComponents ] );

            },
            added: function() {
                // xxx console.log("TREEVIEW: added event.", change ); // todo
                // xxx rename in place?
            },
            moved: function( pEvent, pChange ) {
                nodesMoved( pChange, pTree$ );
            },
            copied: function( event, pChange ) {
                nodesCopied( pChange, pTree$ );
            },
            deleted: function( pEvent, pChange ) {
                nodesDeleted( pChange, pTree$ );
            }
        } );

        // ensures clicking the external context menu will always have a selected node on which to act
        $( '#' + contextMenuId ).on( "menubeforeopen", function(){
            if ( pTree$.treeView( "getSelection" ).length === 0 ) {
                pTree$.treeView( "setSelection", $( "[aria-level='1']", pTree$ ).first().parent() );
            }
        } );

        pTree$.on( "refresh", function( event, nodesToExpand ) {
            let expandedState = pTree$.treeView( "getExpandedState" );
            let collapsedState = pTree$.treeView( "getNodeAdapter" ).getCollapsedNodes( {expandedState  } );

            for ( const node of collapsedState ) {
                    expandedState[ node ] = false;
            }

            if ( nodesToExpand ) {
                try {
                    const nodes = JSON.parse( nodesToExpand );
                    for ( const node in nodes ) {
                        if ( hasOwnProperty( nodes, node ) ) {
                            expandedState[ nodes[ node ] ] = true;
                        }
                    }
                } catch( e ) {
                    // nodesToExpand cannot be parsed as JSON, so can't proceed with determining expanding nodes
                }
            }

            debug.trace( "%s: refresh tree", pTree$[ 0 ].id );
            pTree$.treeView( "option", "getNodeAdapter", getTreeNodeAdapter( pDataFunction, expandedState ) );

        } );

        registerEvents( pTree$, pDataFunction );

    } // initTree


    function destroyTree( pTree$ ) {

        var WIDGET = pTree$[ 0 ].id;

        model.unobserver( WIDGET, {} );
        $( document ).off( "selectionChanged." + WIDGET );

        pTree$.off( "refresh" );
        pTree$.treeView( "destroy" );

    }


    function registerEvents( pTree$ ) {

        var WIDGET            = pTree$[ 0 ].id,
            lComponentsFilter = null,
            lPropertiesFilter = [],
            lSelectionTypes;

        function addSharedCompTypes( pSharedCompTypes ) {

            var lRefByCompProps;

            for ( var i = 0; i < pSharedCompTypes.length; i++ ) {

                if ( hasOwnProperty( pSharedCompTypes[ i ], "typeId" ) ) {

                    lSelectionTypes[ pSharedCompTypes[ i ].typeId ] = true;

                    // Find all properties which are using the current component type as LOV
                    lRefByCompProps = getRefByCompProps( pSharedCompTypes[ i ].typeId );
                    for ( var j = 0; j < lRefByCompProps.length; j++ ) {
                        lComponentsFilter.push( { typeId: lRefByCompProps[ j ].typeId } );
                        lPropertiesFilter.push( lRefByCompProps[ j ].propertyId );
                    }
                }
                if ( pSharedCompTypes[ i ].children ) {
                    addSharedCompTypes( pSharedCompTypes[ i ].children );
                }
            }
        } // addSharedCompTypes

        // We don't have to listen for all component types, that depends on the tree.
        if ( WIDGET === "PDrenderingTree" ) {
            lComponentsFilter = null;
            lSelectionTypes   = null;
        } else if ( WIDGET === "PDdynamicActionTree" ) {
            lComponentsFilter = [
                { typeId: model.COMP_TYPE.DA_EVENT },
                { typeId: model.COMP_TYPE.DA_ACTION }
            ];
        } else if ( WIDGET === "PDprocessingTree" ) {
            lComponentsFilter = [
                { typeId: model.COMP_TYPE.BRANCH },
                { typeId: model.COMP_TYPE.PAGE_COMPUTATION },
                { typeId: model.COMP_TYPE.PAGE_PROCESS },
                { typeId: model.COMP_TYPE.VALIDATION },
                { typeId: model.COMP_TYPE.PAGE_PROC_WS_P_I },
                { typeId: model.COMP_TYPE.PAGE_PROC_WS_P_O },
                { typeId: model.COMP_TYPE.PAGE_PROC_WS_P_A },
                { typeId: model.COMP_TYPE.PAGE_PROC_API_PARAM },
                { typeId: model.COMP_TYPE.PAGE_PROC_WS_PARAM },
                { typeId: model.COMP_TYPE.PAGE_PROCESS_TASK_PARAM },
                { typeId: model.COMP_TYPE.PAGE_PROCESS_WF_PARAM }
            ];
        } else if ( WIDGET === "PDsharedCompTree" ) {

            lComponentsFilter = [];
            lSelectionTypes   = {};
            // Flatten the shared component types
            addSharedCompTypes( SHARED_COMP_TYPES );

        }

        // Set all component types the selectionChanged event should listen for
        if ( lSelectionTypes === undefined ) {
            lSelectionTypes = {};
            for ( var i = 0; i < lComponentsFilter.length; i++ ) {
                lSelectionTypes[ lComponentsFilter[ i ].typeId ] = true;
            }
        }

        // Register observers to find out if a component has changed it's display title
        model.observer(
            WIDGET,
            {
                components: lComponentsFilter,
                events:     [ model.EVENT.DISPLAY_TITLE ]
            },
            function( pNotification ) {

                debug.trace( "%s: DISPLAY_TITLE component notification received", WIDGET, pNotification );

                updateComponentNode( pNotification.component, pTree$, function(){
                    this.label = pNotification.component.getDisplayTitle();
                } );

            } );
        // Register observers to find out if a component has been created or deleted
        model.observer(
            WIDGET,
            {
                components: lComponentsFilter,
                events:     [ model.EVENT.CREATE, model.EVENT.DELETE ]
            },
            function( pNotifications ) {

                debug.trace( "%s: CREATE/DELETE component notification received", WIDGET, pNotifications );
                // Force refresh of the tree
                refreshTree( { pTree$ } );
            },
            true );

        if ( WIDGET === "PDsharedCompTree" ) {

            // Register observers to find out if display relevant properties have changed
            model.observer(
                WIDGET,
                {
                    components: lComponentsFilter,
                    events:     [ model.EVENT.CHANGE, model.EVENT.ADD_PROP, model.EVENT.REMOVE_PROP ],
                    properties: lPropertiesFilter
                },
                function( pNotifications ) {

                    debug.trace( "%s: CHANGE/ADD_PROP/REMOVE_PROP component notification received for shared component reference properties", WIDGET, pNotifications );

                    // Force refresh of the tree
                    refreshTree( { pTree$ } );
                },
                true );

        } else {

            // Register observers to find out if display relevant properties have changed
            model.observer(
                WIDGET,
                {
                    components: lComponentsFilter,
                    events:     [ model.EVENT.CHANGE, model.EVENT.ADD_PROP, model.EVENT.REMOVE_PROP ],
                    properties: [
                        model.PROP.PAGE_TEMPLATE,
                        model.PROP.DIALOG_TEMPLATE,
                        model.PROP.REGION_TEMPLATE,
                        model.PROP.PAGE_AUTHENTICATION,
                        model.PROP.ENABLE_META_TAGS,
                        model.PROP.EXECUTION_SEQUENCE,
                        model.PROP.DISPLAY_SEQUENCE,
                        model.PROP.BRANCH_POINT,
                        model.PROP.PROCESS_POINT,
                        model.PROP.PARENT_PROCESS,
                        model.PROP.COMPUTATION_POINT,
                        model.PROP.REGION,
                        model.PROP.PARENT_REGION,
                        model.PROP.SLOT_PLACEHOLDER,
                        model.PROP.VALIDATION_REGION,
                        model.PROP.VAL_ITEM,
                        model.PROP.REGION_VAL_COLUMN,
                        model.PROP.REGION_TYPE, // needed to refresh the "Attributes" sub node
                        model.PROP.ASSOCIATED_ITEM,
                        model.PROP.ASSOCIATED_COLUMN,
                        model.PROP.COMPUTATION_ITEM_NAME,
                        model.PROP.EVENT,
                        model.PROP.DA_EVENT,
                        model.PROP.DA_ACTION_TYPE,
                        model.PROP.FIRE_WHEN_EVENT_RESULT_IS,
                        model.PROP.FIRE_ON_PAGE_LOAD,
                        model.PROP.FACET_GROUP,
                        model.PROP.SFILTER_GROUP,
                        model.PROP.HIDDEN_TEMPLATE_ID, // needed to redraw the "Menus" sub node
                        model.PROP.REGION_ACTION_PARENT_MENU,
                        model.PROP.IR_COLUMN_DISPLAY_TYPE,
                        model.PROP.IR_COLUMN_ACTION_PARENT_MENU,
                        model.PROP.MENU_ENTRY_TYPE,
                        model.PROP.WHEN_REGION,
                        model.PROP.WHEN_IG_REGION,
                        model.PROP.WHEN_ITEMS,
                        model.PROP.WHEN_COLUMNS,
                        model.PROP.WHEN_BUTTON,
                        model.PROP.SOURCE_LOCATION,
                        model.PROP.TEMPLATE_COMPONENT_TYPE
                    ]
                },
                function( pNotifications ) {

                    debug.trace( "%s: CHANGE/ADD_PROP/REMOVE_PROP component notification received for display relevant properties", WIDGET, pNotifications );

                    // Force refresh of the tree. If a component slot was changed, expand the node
                    let componentsToExpand = [];
                    for ( const notification in pNotifications ) {
                        if ( hasOwnProperty( pNotifications, notification ) ) {
                            componentsToExpand.push( pNotifications[ notification ].component );
                        }
                    }

                    refreshTree( { pTree$ , componentsToExpand } );
                },
                true );
            // Register observers to find out if a component has changed
            model.observer(
                WIDGET,
                {
                    components: lComponentsFilter,
                    events:     [ model.EVENT.CHANGE ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasChanged() ) {
                        addComponentClass( pNotification.component, pd.CSS.IS_CHANGED, pTree$ );
                    } else {
                        removeComponentClass( pNotification.component, pd.CSS.IS_CHANGED, pTree$ );
                    }
                } );
            // Register observers to find out if a component has errors or warnings
            model.observer(
                WIDGET,
                {
                    components: lComponentsFilter,
                    events:     [ model.EVENT.ERRORS, model.EVENT.NO_ERRORS ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasErrors() ) {
                        addComponentClass( pNotification.component, pd.CSS.IS_ERROR, pTree$ );
                    } else {
                        removeComponentClass( pNotification.component, pd.CSS.IS_ERROR, pTree$ );
                    }
                } );
            model.observer(
                WIDGET,
                {
                    components: lComponentsFilter,
                    events:     [ model.EVENT.WARNINGS, model.EVENT.NO_WARNINGS ]
                },
                function( pNotification ) {
                    if ( pNotification.component.hasWarnings() ) {
                        addComponentClass( pNotification.component, pd.CSS.IS_WARNING, pTree$ );
                    } else {
                        removeComponentClass( pNotification.component, pd.CSS.IS_WARNING, pTree$ );
                    }
                } );
            pd.observerIsConditional( WIDGET, lComponentsFilter,
                function( pNotification ) {
                    removeComponentClass( pNotification.component, pd.CSS.IS_CONDITIONAL, pTree$ );
                    removeComponentClass( pNotification.component, pd.CSS.IS_NEVER, pTree$ );

                    if ( pd.isNever( pNotification.component ) ) {
                        addComponentClass( pNotification.component, pd.CSS.IS_NEVER, pTree$ );
                    } else if ( pd.isConditional( pNotification.component ) ) {
                        addComponentClass( pNotification.component, pd.CSS.IS_CONDITIONAL, pTree$ );
                    }
                } );

        }

        // Register event handlers if other widgets on the page select components
        $( document ).on( "selectionChanged." + WIDGET, function( pEvent, pWidget, pComponents ) {

            if ( pWidget !== WIDGET ) {
                debug.trace( "%s: selectionChanged event received from %s", WIDGET, pWidget, pComponents );

                if ( pComponents.length === 0 || lSelectionTypes === null || hasOwnProperty( lSelectionTypes, pComponents[ 0 ].typeId ) ) {
                    setSelectedComponents( pComponents, pTree$, null, false );
                }
            }
        } );

    } // registerEvents


    function getContextMenu( pTree$ ) {
        let contextMenuEntries = [],
            lId    = 0;

        function getCreateTitle( pTypeId ) {
            return formatNoEscape( "CREATE", model.getComponentType( pTypeId ).title.singular );
        }

        function execute( pFunction ){
            return pFunction.call( pTree$.treeView( "getSelectedNodes" ) );
        }

        // Returns true if the type of the node is contained within pValidTypes and the current page can be modified.
        function isCreatable( pNodes, pValidTypes ) {

            // Note: We don't support "Create" operations if more than one nodes are selected
            return (  pNodes.length === 1
                   && $.inArray( pNodes[ 0 ].type, pValidTypes ) !== -1
                   && !model.isPageReadOnly()
                   );
        }

        function isNotGlobal( pNodes, pValidTypes ) {
            if ( model.isGlobalPage() ) {
                return false;
            } else {
                return isCreatable( pNodes, pValidTypes );
            }
        }

        function isRegionType( pNode, pRegionTypes ) {
            var lRegion = getNearestComponent( model.COMP_TYPE.REGION, pNode );
            return ( $.inArray( lRegion.getProperty( model.PROP.REGION_TYPE ).getValue(), pRegionTypes ) !== -1 );
        }

        function isInteractiveGridEditable( pNode, pDefaultResult ) {
            var lRegion;

            if ( $.inArray( pNode.type, [ "region", "ig_column"] ) !== -1 ) {
                lRegion = getNearestComponent( model.COMP_TYPE.REGION, pNode );
                if ( lRegion.getProperty( model.PROP.REGION_TYPE ).getValue() === "NATIVE_IG" ) {
                    return ( lRegion.getChilds( model.COMP_TYPE.IG_ATTRIBUTES )[ 0 ].getProperty( model.PROP.IS_EDITABLE ).getValue() === "Y" );
                }
            }
            return pDefaultResult;
        }

        function goToUrl( pUrl, pPkValue ) {

            apex.navigation.redirect(
                pUrl.replace( /\\u002525/g,        '%' )
                    .replace( /%2525/g,            '%' )
                    .replace( /%25/g,              '%' )
                    .replace( /%session%/g,        apex.env.APP_SESSION )
                    .replace( /%pk_value%/g,       pPkValue )
                    .replace( /%application_id%/g, model.getCurrentAppId() )
                    .replace( /%page_id%/g,        model.getCurrentPageId() )
            );
        }

        function editExternal( pNode, pTree$ ) {
            var lComponent = getComponent( pNode, pTree$ );

            goToUrl( model.getComponentType( lComponent.typeId ).editUrl, lComponent.id );
        }

        function copyExternal( pNode, pTree$ ) {
            var lComponent = getComponent( pNode, pTree$ );

            goToUrl( model.getComponentType( lComponent.typeId ).copyUrl, lComponent.id );
        }

        function createExternal( pNode, pTree$ ) {
            var lTypeId;

            if ( getComponent( pNode, pTree$ ) ) {
                lTypeId = getComponent( pNode, pTree$ ).typeId;
            } else {
                lTypeId = pNode.data.typeId;
            }

            goToUrl( model.getComponentType( lTypeId ).createUrl );
        }

        function getTargetPage( pNode, pTree$ ) {

            var lComponent  = getComponent( pNode, pTree$ ),
                lBranchType = lComponent.getProperty( model.PROP.BRANCH_TYPE ).getValue(),
                lTargetUrl,
                lAppId,
                lPageId = null;

            if ( lBranchType === "REDIRECT_URL" ) {
                lTargetUrl = lComponent.getProperty( model.PROP.TARGET ).getValue();
                if ( /f\?p=([^:]*):([^:]*)/i.test( lTargetUrl ) ) {
                    lAppId  = RegExp.$1;
                    if ( lAppId === "&FLOW_ID." || lAppId === "&APP_ID." || lAppId === model.getCurrentAppId() ) {
                        lPageId = RegExp.$2;
                    }
                }
            } else if ( $.inArray( lBranchType, [ "BRANCH_TO_STEP", "BRANCH_TO_PAGE_ACCEPT" ] ) !== -1 ) {
                lPageId = lComponent.getProperty( model.PROP.BRANCH_PAGE_NUMBER ).getValue();
            }
            return lPageId;
        }

        function hasSlotSupport( node, targetLocation = "INSIDE", componentTypeId ) {

            let slot;

            if ( node.type === "region" && targetLocation === "INSIDE" ) {
                const component = getComponent( node, pTree$ );
                slot = model.getSlot( { componentTypeId, component } );
            } else if ( [ "region", "item", "button" ].includes( node.type ) ) {
                const component = getComponent( node, pTree$ );
                const regionId = model.getParentRegionId( component );
                const slotPlaceholder = component.getPropertyValue( model.PROP.SLOT_PLACEHOLDER );
                slot = model.getSlot( { componentTypeId, regionId, slotPlaceholder } );
            } else if ( node.type === "page_slot" ) {
                const slotPlaceholder = node.data[ model.PROP.SLOT_PLACEHOLDER ];
                slot = model.getSlot( { componentTypeId, slotPlaceholder } );
            } else if ( node.type === "region_slot" ) {
                const component = getComponent( node._parent, pTree$ );
                const slotPlaceholder = node.data[ model.PROP.SLOT_PLACEHOLDER ];
                slot = model.getSlot( { componentTypeId, component, slotPlaceholder } );
            } else if ( node.type === "components" ) {
                slot = model.getSlot( { componentTypeId, slotPlaceholder: "BODY" } );
            }

            // if a slot was found, return true, if not return false
            return !!slot;

        } // hasSlotSupport

        function addContextMenuEntry( contextMenuEntry ) {

            let lContextMenuEntry = {
                    label:       contextMenuEntry.label,
                    accelerator: contextMenuEntry.accelerator,
                    type:        contextMenuEntry.type
                },
                lAction,
                lVisible;

            lId += 1;
            lContextMenuEntry.id = pTree$[ 0 ].id + "_ctx_" + lId;

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
                        createComponent( this[ 0 ], pTree$, contextMenuEntry.typeId );
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
                        return isCreatable( this, contextMenuEntry.visible );
                    };
                } else if ( contextMenuEntry.visible.global === false ) {
                    lVisible = function(){
                        return isNotGlobal( this, contextMenuEntry.visible.types );
                    };
                } else {
                    lVisible = function(){
                        return isCreatable( this, contextMenuEntry.visible.types );
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

            contextMenuEntries.push( lContextMenuEntry );
        }

        function toggleBuildOptionEntry( isCommentOut ) {
            // if there's a non-component node selected, hide
            if ( !this.every( node => hasOwnProperty( node.data, "componentId" ) ) ) {
                return false;
            }
            // get the selected components
            let components = this.map( node => getComponent( node, pTree$ ) );
            // check that all components can be modified and have the BUILD_OPTION property
            if ( !components.every( comp => !comp.isOnGlobalPage() && !comp.isReadOnly() && comp.getProperty( model.PROP.BUILD_OPTION ) ) ) {
                return false;
            }

            if ( isCommentOut ) {
                // only display the "Comment Out" option if at least one component is not set to "Commented Out"
                return components.some( comp => comp.getProperty( model.PROP.BUILD_OPTION ).getValue() !== pd.COMMENTED_OUT_ID );
            } else {
                // only display the "Uncomment" option if at least one component is set to "Commented Out"
                return components.some( comp => comp.getProperty( model.PROP.BUILD_OPTION ).getValue() === pd.COMMENTED_OUT_ID );
            }
        }

        function setBuildOption( components = [], value = "" ) {
            if ( !components.length ) {
                return;
            }
            let message = model.transaction.message( {
                action: model.MESSAGE_ACTION.CHANGE,
                count: components.length,
                component: components[ 0 ],
                property: components[ 0 ].getProperty( model.PROP.BUILD_OPTION )
            } );
            let transaction = model.transaction.start("", message);
            components.forEach( ( component ) => {
                // at this point it should be sure that all components have build option property, but rather double check it
                // if it's "uncomment", only change components where build option currently is "Commented Out"
                let property = component.getProperty( model.PROP.BUILD_OPTION );
                if ( !property || ( !value && property.getValue() !== pd.COMMENTED_OUT_ID ) ) {
                    return;
                }
                property.setValue( value );
            } );
            apex.commandHistory.execute( transaction );
        }

        //
        // Create Menu entries
        //
        addContextMenuEntry( {
            label:   msg( "DUPLICATE" ),
            action: function() {
                duplicateNodes( this, pTree$ );
            },
            visible: function() {
                for ( var i = 0; i < this.length; i++ ) {
                    if ( !pTree$.treeView( "getNodeAdapter" ).check( "canDuplicate", this[ i ] ) ) {
                        return false;
                    }
                }
                return true;
            }
        } );

        addContextMenuEntry( {
            type: "separator",
            visible: function() {
                for ( var i = 0; i < this.length; i++ ) {
                    if ( !pTree$.treeView( "getNodeAdapter" ).check( "canDuplicate", this[ i ] ) ) {
                        return false;
                    }
                }
                return true;
            }
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "SUB_REGION" ) ),
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.REGION, "SUB_REGION" );
            },
            visible: function() {
                const component = getComponent( this[ 0 ], pTree$ );

                if ( component && component.typeId === model.COMP_TYPE.REGION && !component.isOnGlobalPage() ) {
                    const subRegionSlot = model.getSlot( { componentTypeId: model.COMP_TYPE.REGION,
                                                           component,
                                                           slotPlaceholder: "SUB_REGIONS" } );
                    return isCreatable( this, [ "region" ] ) && subRegionSlot;
                }

                return false;
            }
        } );

        // The "Create Region" entry will show instead of "Create Sub Region" if there is no SUB_REGIONS slot
        // The new region will be placed under the default region slot
        addContextMenuEntry( {
            typeId: model.COMP_TYPE.REGION,
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.REGION, "REGION_DEFAULT_SLOT" );
            },
            visible: function() {
                const component = getComponent( this[ 0 ], pTree$ );

                if ( component && component.typeId === model.COMP_TYPE.REGION && !component.isOnGlobalPage() ) {
                    const subRegionSlot = model.getSlot( { componentTypeId: model.COMP_TYPE.REGION,
                                                           component,
                                                           slotPlaceholder: "SUB_REGIONS" } );
                    return isCreatable( this, [ "region" ] ) &&
                           hasSlotSupport( this[0], "INSIDE", model.COMP_TYPE.REGION ) &&
                           !subRegionSlot;
                }

                return false;
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.REGION,
            visible: function() {

                if ( isCreatable( this, [ "components", "page_slot", "region_slot" ] ) ) {
                    return hasSlotSupport( this[0], "INSIDE", model.COMP_TYPE.REGION );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.PAGE_ITEM,
            visible: function() {

                if ( isCreatable( this, [ "components", "page_slot", "region_slot", "region" ] ) ) {
                    return hasSlotSupport( this[0], "INSIDE", model.COMP_TYPE.PAGE_ITEM );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.BUTTON,
            visible: function(){

                if ( isCreatable( this, [ "components", "page_slot", "region_slot", "region" ] ) ) {
                    return hasSlotSupport( this[0], "INSIDE", model.COMP_TYPE.BUTTON );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.DA_EVENT,
            visible: function(){
                if ( isCreatable( this, [
                        "da_events", "da_event", "inline_da_events", "inline_da_event",
                        "region", "item", "ig_column", "button" ] ) )
                {
                    // Only expose dynamic actions on column level if the IG is editable, because for non-editable IG
                    // dynamic actions don't make much sense because they would never fire
                    if ( this[ 0 ].type === "ig_column" ) {
                        return isInteractiveGridEditable( this[ 0 ], false );
                    } else {
                        // If the current component is not an IG column we will always show the dynamic action context menu
                        return true;
                    }
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.PAGE_COMPUTATION,
            visible: {
                global: false,
                types: [
                    "computations", "computation", "inline_computations", "inline_computation",
                    "on_new_instance", "before_header", "after_header", "before_regions", "after_regions", "before_footer",
                    "after_footer", "after_submit", "item" ]
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.PAGE_PROCESS,
            visible: {
                global: false,
                types: [
                    "processes", "on_new_instance", "before_header", "after_header",
                    "before_regions", "after_regions", "before_footer", "after_footer", "after_submit", "processing" ]
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.PAGE_PROCESS,
            label:   msg( "ADD_CHILD_PROCESS" ),
            visible: function() {
                    var lProcess;
                    if ( !model.isPageReadOnly() && isNotGlobal( this, ["process"] ) ) {
                        lProcess = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, this[0], pTree$ );
                        return lProcess.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_EXECUTION_CHAIN";
                    } else {
                        return false;
                    }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.VALIDATION,
            visible: function(){
                if ( isNotGlobal( this, [ "validation", "validations", "validating", "inline_validations", "inline_validation", "item" ] ) ) {
                    return true;
                } else {
                    return (  isNotGlobal( this, [ "region", "tabform_column", "ig_column" ] )
                           && (  isRegionType( this[ 0 ], [ "NATIVE_TABFORM" ] )
                              || isInteractiveGridEditable( this[ 0 ], false )
                              )
                           );
                }
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.BRANCH,
            visible: {
                global: false,
                types: [ "branches", "branch", "before_header", "after_submit", "validating", "processing", "after_processing" ]
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.META_TAG,
            visible: {
                global: false,
                types: [ "header", "meta_tags", "meta_tag" ]
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.DA_ACTION,
            visible: [ "da_action" ]
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "TRUE_ACTION" ) ),
            typeId: model.COMP_TYPE.DA_ACTION,
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.DA_ACTION, "TRUE" );
            },
            visible: [ "da_actions_true", "da_event", "inline_da_event" ]
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "FALSE_ACTION" ) ),
            typeId: model.COMP_TYPE.DA_ACTION,
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.DA_ACTION, "FALSE" );
            },
            visible: [ "da_actions_false", "da_event", "inline_da_event" ]
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "OPPOSITE_DYNAMIC_ACTION" ) ),
            typeId: model.COMP_TYPE.DA_ACTION,
            action: function() {
                createOppositeDynamicAction( this, pTree$ );
            },
            visible: function(){
                for ( var i = 0; i < this.length; i++ ) {
                    if ( this[ i ].type !== "da_action" || !( pTree$.treeView( "getNodeAdapter" ).check( "canDuplicate", this[ i ] ) ) ) {
                        return false;
                    }
                }
                return true;
            }
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "VIRTUAL_COLUMN" ) ),
            action: function() {
                if ( isRegionType( this[ 0 ], [ "NATIVE_TABFORM" ] ) ) {
                    createComponent( this[ 0 ], pTree$, model.COMP_TYPE.TAB_FORM_COLUMN, "VIRTUAL" );
                } else {
                    createComponent( this[ 0 ], pTree$, model.COMP_TYPE.CLASSIC_RPT_COLUMN, "VIRTUAL" );
                }
            },
            visible: function() {
                return (  isCreatable( this, [ "region_columns", "classic_report_column", "tabform_column" ] )
                       && isRegionType( this[ 0 ], [ "NATIVE_SQL_REPORT", "NATIVE_FNC_REPORT", "NATIVE_TABFORM" ] ) );
            }
        } );

        addContextMenuEntry( {
            label:  formatNoEscape( "CREATE", msg( "ROW_SELECTOR" ) ),
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.TAB_FORM_COLUMN, "ROW_SELECTOR" );
            },
            visible: function() {
                var lRegion;

                if ( isCreatable( this, [ "region_columns", "tabform_column" ] ) ) {
                    lRegion = getNearestComponent( model.COMP_TYPE.REGION, this[ 0 ], pTree$ );
                    if ( lRegion.getProperty( model.PROP.REGION_TYPE ).getValue() === "NATIVE_TABFORM" ) {
                        // Check if the region selector already exists for that tabular form
                        return ( lRegion.getChilds( model.COMP_TYPE.TAB_FORM_COLUMN, { properties: [{ id: model.PROP.COLUMN_NAME, value: ROW_SELECTOR_COLUMN_NAME }]} ).length === 0 );
                    }
                }
                return false;
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.IG_COLUMN,
            visible: [ "ig_columns", "ig_column" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.REGION_TMPL_COLUMN,
            visible: [ "region_tmpl_columns", "region_tmpl_column" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.FACET,
            visible: [ "facets", "facet", "facet_group" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.FACET_GROUP,
            visible: [ "facets", "facet", "facet_group" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.FACET_GROUP_ITEM,
            visible: [ "facet_group", "facet_group_items", "facet_group_item" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.SFILTER,
            visible: [ "sfilters", "sfilter", "sfilter_group" ]
        });

        /* Postponed to phase 2
        addContextMenuEntry({
            typeId:  model.COMP_TYPE.SFILTER_GROUP,
            visible: [ "sfilters", "sfilter", "sfilter_group" ]
        });

        addContextMenuEntry({
            typeId:  model.COMP_TYPE.SFILTER_GROUP_ITEM,
            visible: [ "sfilter_group", "sfilter_group_items", "sfilter_group_item" ]
        });
        */

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.SEARCH_REGION_SOURCE,
            visible: [ "search_sources","search_source" ]
        } );

        addContextMenuEntry({
            typeId:  model.COMP_TYPE.JET_CHART_SERIES,
            visible: function(){
                if ( isCreatable( this, [ "jet_chart_series", "jet_chart_serie" ] ) ) {
                    return pTree$.treeView( "getNodeAdapter" ).check( "canAdd", this[ 0 ] );
                }
                return false;
            }
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.IR_COLUMN_GROUP,
            visible: [ "ir_column_groups", "ir_column_group" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.IG_COLUMN_GROUP,
            visible: [ "ig_column_groups", "ig_column_group" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.CARD_ACTION,
            visible: [ "card_actions", "card_action" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.REGION_ACTION,
            visible: [ "region_actions", "region_action" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.REGION_ACTION_MENU_ENTRY,
            visible: [ "region_action_menu_entries", "region_action_menu_entry" ]
        } );


        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.IR_COLUMN_ACTION,
            visible: [ "ir_column_actions", "ir_column_action" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY,
            visible: [ "ir_column_action_menu_entries", "ir_column_action_menu_entry" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.MAP_LAYER,
            visible: [ "map_layers", "map_layer" ]
        } );

        addContextMenuEntry( {
            typeId:  model.COMP_TYPE.PAGE_PROC_API_PARAM,
            visible: [ "api_params", "api_param" ]
        } );

        addContextMenuEntry( {
            type: "separator"
        } );

        function addSynchronize( pLabel, pRegionType ){

            addContextMenuEntry( {
                label:   pLabel,
                action:  function (){
                    var lRegion,
                        lSourceProperty,
                        lMessage,
                        lTransaction;

                    lRegion = getNearestComponent( model.COMP_TYPE.REGION, this[0], pTree$ );
                    lSourceProperty = model.getSourceLocationProperty( lRegion );

                    // Trigger a re-validation of the source property which will set the _columns attribute, -> which will
                    // call the necessary code in pe.callbacks.js to add/remove columns.
                    lMessage = model.transaction.message( {
                        action:    model.MESSAGE_ACTION.CHANGE,
                        component: lRegion,
                        property:  lSourceProperty
                    } );

                    lTransaction = model.transaction.start( "", lMessage );

                    lSourceProperty.setValue( lSourceProperty.getValue(), true );
                    apex.commandHistory.execute( lTransaction );

                },
                visible: function (){
                    var lRegion,
                        lRegionType;

                    if ( !model.isPageReadOnly() && isNotGlobal( this, ["region", "ig_columns", "region_columns", "region_tmpl_columns"] ) ) {
                        lRegion = getNearestComponent( model.COMP_TYPE.REGION, this[0], pTree$ );
                        lRegionType = lRegion.getProperty( model.PROP.REGION_TYPE ).getValue();
                        // Show "Synchronize Columns/Page Items" if the region does have a source property
                        return ( model.getSourceLocationProperty( lRegion ) && ( ( !pRegionType && lRegionType !== "NATIVE_FORM" ) || lRegionType === pRegionType ) );
                    } else {
                        return false;
                    }
                }
            } );
        }

        addSynchronize( msg( "SYNCHRONIZE_COLUMNS" ) );
        addSynchronize( msg( "SYNCHRONIZE_PAGE_ITEMS" ), "NATIVE_FORM" );

        addContextMenuEntry( {
            label:   msg( "SYNCHRONIZE_API_PARAMS" ),
            action:  function () {
                let pageProcess,
                    methodProperty,
                    message,
                    transaction;

                pageProcess    = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, this[ 0 ], pTree$ );
                methodProperty = pageProcess.getProperty( model.getPluginProperty( pageProcess.typeId, "NATIVE_INVOKE_API", 4 ).id );
                if ( !methodProperty ) {
                    methodProperty = pageProcess.getProperty( model.getPluginProperty( pageProcess.typeId, "NATIVE_INVOKE_API", 5 ).id );
                }

                // Trigger a re-validation of the pl/sql method property which will set the _parameters attribute, -> which will
                // call the necessary code in pe.callbacks.js to add/remove parameters.
                message = model.transaction.message( {
                    action:    model.MESSAGE_ACTION.CHANGE,
                    component: pageProcess,
                    property:  methodProperty
                } );

                transaction = model.transaction.start( "", message );

                methodProperty.setValue( methodProperty.getValue(), true );
                apex.commandHistory.execute( transaction );
            },
            visible: function (){
                var pageProcess,
                    processType,
                    invokeApiType;

                if ( !model.isPageReadOnly() && isNotGlobal( this, ["process", "api_params"] )) {
                    pageProcess = getNearestComponent( model.COMP_TYPE.PAGE_PROCESS, this[ 0 ], pTree$ );
                    processType = pageProcess.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                    // Show "Synchronize Parameters" if it's the "Invoke API" process, but not if the
                    // "Type" is "REST Source"
                    if ( processType === "NATIVE_INVOKE_API" ) {
                        invokeApiType = pageProcess.getProperty( model.getPluginProperty( pageProcess.typeId, "NATIVE_INVOKE_API", 1 ).id ).getValue();
                        if ( invokeApiType === "WEB_SOURCE" ) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                } else {
                    return false;
                }
            }
        } );

        function addFacetsOrFilters ( pRegion, pItems, pTypeId ) {
            const filteredRegionId = pRegion.getPropertyValue( model.PROP.SOURCE_FILTERED_REGION ),
                  columns = model.getRegionColumns( filteredRegionId ),
                  facetType = "NATIVE_INPUT",
                  userCanChooseOperatorId = model.getPluginProperty( pTypeId, facetType, 'user_can_choose_operator' ).id;
            let message,
                transaction;

            message = model.transaction.message( {
                action: model.MESSAGE_ACTION.CREATE,
                count: 2 // needed for multiple
            } );

            transaction = model.transaction.start( "", message );

            columns.forEach( element => {
                const exists = pItems.some( column => {
                    return element.name === column.getProperty( model.PROP.SOURCE_DB_COLUMN )?.getValue();
                } );

                if ( !exists ) {
                    new model.Component( {
                        previousComponent: "last",
                        typeId:   pTypeId,
                        parentId: pRegion.id,
                        values:   [
                            { id: model.PROP.ITEM_NAME,  value: `P${ model.getCurrentPageId() }_${ element.name }` },
                            { id: model.PROP.ITEM_TYPE,  value: facetType },
                            { id: model.PROP.ITEM_LABEL, value: element.label || element.name },
                            { id: model.PROP.SOURCE_DB_COLUMN, value: element.name },
                            { id: model.PROP.DATA_TYPE, value: element.dataType || "VARCHAR2" },
                            { id: userCanChooseOperatorId, value: "Y" }
                        ]
                    } );
                }
            } );

            apex.commandHistory.execute( transaction );
        }

        addContextMenuEntry( {
            label:   msg( "SYNCHRONIZE_FACETS" ),
            action:  function () {
                const region = getNearestComponent( model.COMP_TYPE.REGION, this[ 0 ], pTree$ ),
                      facetGroups = region.getChilds( model.COMP_TYPE.FACET_GROUP );
                let facets = region.getChilds( model.COMP_TYPE.FACET );

                facetGroups.forEach( group => {
                    facets = facets.concat( group.getChilds( model.COMP_TYPE.FACET_GROUP_ITEM ) );
                } );

                addFacetsOrFilters ( region, facets, model.COMP_TYPE.FACET );
            },
            visible: function() {
                if ( !model.isPageReadOnly() && [ "region", "facets"].includes( this[ 0 ].type ) ) {
                    const region = getNearestComponent( model.COMP_TYPE.REGION, this[ 0 ], pTree$ ),
                          regionType = region.getProperty( model.PROP.REGION_TYPE ).getValue();

                    if ( regionType === "NATIVE_FACETED_SEARCH" ) {
                        const filteredRegionId = region.getPropertyValue( model.PROP.SOURCE_FILTERED_REGION ),
                              columns = model.getRegionColumns( filteredRegionId );

                        // support only regions with columns
                        if ( columns.length > 0 ) {
                            return true;
                        }
                    }
                }

                return false;
            }
        } );

        addContextMenuEntry( {
            label:   msg( "SYNCHRONIZE_FILTERS" ),
            action:  function () {
                const region = getNearestComponent( model.COMP_TYPE.REGION, this[ 0 ], pTree$ ),
                      facetGroups = region.getChilds( model.COMP_TYPE.SFILTER_GROUP );
                let facets = region.getChilds( model.COMP_TYPE.SFILTER );

                facetGroups.forEach( group => {
                    facets = facets.concat( group.getChilds( model.COMP_TYPE.SFILTER_GROUP_ITEM ) );
                } );

                addFacetsOrFilters ( region, facets, model.COMP_TYPE.SFILTER );
            },
            visible: function() {
                if ( !model.isPageReadOnly() && [ "region", "sfilters"].includes( this[ 0 ].type ) ) {
                    const region = getNearestComponent( model.COMP_TYPE.REGION, this[ 0 ], pTree$ ),
                          regionType = region.getProperty( model.PROP.REGION_TYPE ).getValue();

                    if ( regionType === "NATIVE_SMART_FILTERS" ) {
                        const filteredRegionId = region.getPropertyValue( model.PROP.SOURCE_FILTERED_REGION ),
                              columns = model.getRegionColumns( filteredRegionId );

                        // support only regions with columns
                        if ( columns.length > 0 ) {
                            return true;
                        }
                    }
                }

                return false;
            }
        } );

        addContextMenuEntry( {
            type: "separator"
        } );

        //
        // Similar to Create Region, Create Page Item, Create Button
        // the following entries will create regions, items and buttons below
        // the current node, as opposed to inside them like the other entries do
        //
        addContextMenuEntry( {
            label:  lang.getMessage( "PD.TREE.CREATE.REGION.BELOW" ),
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.REGION, "BELOW" );
            },
            typeId:  model.COMP_TYPE.REGION,
            visible: function() {

                if ( isCreatable( this, [ "region", "item", "button" ] ) ) {
                    return hasSlotSupport( this[0], "BELOW", model.COMP_TYPE.REGION );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            label:  lang.getMessage( "PD.TREE.CREATE.ITEM.BELOW" ),
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.PAGE_ITEM, "BELOW" );
            },
            typeId:  model.COMP_TYPE.PAGE_ITEM,
            visible: function() {

                if ( isCreatable( this, [ "region", "item", "button" ] ) ) {
                    return hasSlotSupport( this[0], "BELOW", model.COMP_TYPE.PAGE_ITEM );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            label:  lang.getMessage( "PD.TREE.CREATE.BUTTON.BELOW" ),
            action: function() {
                createComponent( this[ 0 ], pTree$, model.COMP_TYPE.BUTTON, "BELOW" );
            },
            typeId:  model.COMP_TYPE.BUTTON,
            visible: function() {

                if ( isCreatable( this, [ "region", "item", "button" ] ) ) {
                    return hasSlotSupport( this[0], "BELOW", model.COMP_TYPE.BUTTON );
                } else {
                    return false;
                }
            }
        } );

        addContextMenuEntry( {
            type: "separator",
            visible: function() {

                if ( isCreatable( this, [ "region", "item", "button" ] ) ) {
                    return hasSlotSupport( this[0], "BELOW" );
                } else {
                    return false;
                }
            }
        } );

        //
        // Misc menu entries
        //
        addContextMenuEntry( {
            label:  msg( "COPY_TO_PAGE" ),
            action: function() {
                copyExternal( this[ 0 ] );
            },
            visible: function() {
                return (  this.length === 1
                       && pTree$.treeView( "getNodeAdapter" ).check( "canExtCopy", this[ 0 ] )
                       && model.getComponentType( getComponent( this[ 0 ] ).typeId ).isPageComponent
                       && !getComponent( this[ 0 ] ).isOnGlobalPage()
                       );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "EDIT_SHARED_COMPONENT" ),
            action: function() {
                editExternal( this[ 0 ] );
            },
            visible: function() {
                return (  this.length === 1
                       && pTree$.treeView( "getNodeAdapter" ).check( "canExtEdit", this[ 0 ] )
                       && !model.getComponentType( getComponent( this[ 0 ], pTree$ ).typeId ).isPageComponent
                       );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "COPY_SHARED_COMPONENT" ),
            action: function() {
                copyExternal( this[ 0 ] );
            },
            visible: function() {
                return (  this.length === 1
                       && pTree$.treeView( "getNodeAdapter" ).check( "canExtCopy", this[ 0 ] )
                       && !model.getComponentType( getComponent( this[ 0 ], pTree$ ).typeId ).isPageComponent
                       );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "CREATE_SHARED_COMPONENT" ),
            action: function() {
                createExternal( this[ 0 ] );
            },
            visible: function() {
                return (  this.length === 1
                       && pTree$.treeView( "getNodeAdapter" ).check( "canExtCreate", this[ 0 ] )
                       );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "PAGE_SEARCH" ),
            action: function() {
                $( document ).trigger( "pageSearch", [ getComponent( this[ 0 ], pTree$ ).getDisplayTitle() ] );
            },
            visible: function() {
                return ( this.length === 1 && pTree$.treeView( "getNodeAdapter" ).check( "canSearch", this[ 0 ] ) );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "GOTO_TARGET_PAGE" ),
            action: function() {
                pd.goToPage( getTargetPage( this[ 0 ], pTree$ ) );
            },
            visible: function(){
                return ( this.length === 1 && this[ 0 ].type === "branch" );
            },
            disabled: function() {
                return ( getTargetPage( this[ 0 ], pTree$ ) === null );
            }
        } );

        addContextMenuEntry( {
            type: "separator"
        } );

        //
        // Expand/Collapse menu entries
        //
        addContextMenuEntry( {
            label:  msg( "EXPAND_ALL_BELOW" ),
            action: function() {
                pTree$.treeView( "expandAll", pTree$.treeView( "getSelection" ) );
            }
        } );

        addContextMenuEntry( {
            label:  msg( "COLLAPSE_ALL_BELOW" ),
            action: function() {
                pTree$.treeView( "collapseAll", pTree$.treeView( "getSelection" ) );
            }
        } );

        addContextMenuEntry( {
            type: "separator"
        } );

        if ( pd.COMMENTED_OUT_ID ) {
            addContextMenuEntry( {
                label: msg( "COMMENT_OUT" ),
                action: function() {
                    setBuildOption( this.map( ( node ) => getComponent( node, pTree$ ) ), pd.COMMENTED_OUT_ID );
                },
                visible: function() {
                    return ( !model.isPageReadOnly() && toggleBuildOptionEntry.call( this, true ) );
                }
            } );

            addContextMenuEntry( {
                label: msg( "UNCOMMENT" ),
                action: function() {
                    setBuildOption( this.map( ( node ) => getComponent( node, pTree$ ) ) );
                },
                visible: function() {
                    return ( !model.isPageReadOnly() && toggleBuildOptionEntry.call( this ) );
                }
            } );
        }

        //
        // Delete menu entry
        //
        addContextMenuEntry( {
            label:       msg( "DELETE" ),
            accelerator: "Del",
            action: function() {
                var node$ = pTree$.treeView( "getSelection" );
                pTree$.treeView( "deleteNodes", node$ );
            },
            visible: function() {
                for ( var i = 0; i < this.length; i++ ) {
                    if ( !pTree$.treeView( "getNodeAdapter" ).allowDelete( this[ i ] ) ) {
                        return false;
                    }
                }
                return true;
            }
        } );

        return { items: contextMenuEntries };

    } // getContextMenu

    $( function(){

        const lContainer = $( "#sp_main_content" ),
            lRenderingTree$      = $( "#PDrenderingTree" ),
            lDynamicActionTree$  = $( "#PDdynamicActionTree" ),
            lProcessingTree$     = $( "#PDprocessingTree" ),
            lSharedCompTree$     = $( "#PDsharedCompTree" );

        lContainer.on( "tabsactivate", function( event, ui ) {

            let lTree$ = ui.newPanel.find( ".a-TreeView" ),
                lComponents;

            // only care about tab activate when tab contains a tree
            if ( lTree$.length > 0 ) {
                // Notify other widgets on the page that the displayed tree has changed and other selected components
                // have to be displayed. But there is no need to do this if the current tree hasn't selected anything.
                // For example on the previous tab we had selected a page item and we switch to dynamic actions, we
                // still want to see the properties of the page item in the property editor and keep it selected in GLV.
                lComponents = getSelectedComponents( lTree$ );
                if ( lComponents.length > 0 ) {
                    debug.trace( "%s: trigger event selectionChanged", lTree$[ 0 ].id, lComponents );
                    $( document ).trigger( "selectionChanged", [ lTree$[ 0 ].id, lComponents ] );
                }
            }
        } );

        // Load the trees as soon as the model has loaded the data
        $( document ).on( "modelReady", function() {

            initTree( lRenderingTree$,     getRenderingData,     true );
            initTree( lDynamicActionTree$, getDynamicActionData, false );
            initTree( lProcessingTree$,    getProcessingData,    false );
            initTree( lSharedCompTree$,    getSharedData,        false );

            // Clear trees if the model gets cleared
            $( document ).one( "modelCleared", function() {

                destroyTree( lRenderingTree$ );
                destroyTree( lDynamicActionTree$ );
                destroyTree( lProcessingTree$ );
                destroyTree( lSharedCompTree$ );

            } );

        } );
    } );

} )( window.pe, window.pageDesigner, apex.util, apex.debug, apex.lang, apex.jQuery );
