/*!
 * Copyright (c) 2021, 2023, Oracle and/or its affiliates.
 */

/**
 * This document handles the tree navigation object for the Blueprint Designer page
 * in app 4500, page 4100.
 */
( function( $, util, server, debug, lang ) {
    "use strict";

    var treeNav$ = $( "#treeNav" ),
        propertyEditor$ = $( "#peMain" ),
        blueprintNodesAdapter,
        contextMenuItem$,
        popup,
        gBlueprintName,
        loadingPopup$ = apex.widget.waitPopup();

    const BLUEPRINT_MODE = "blueprint-mode",
          TABLE_MODE = "table-mode",
          COLUMN_M0DE = "column-mode",
          DATA_SOURCE_MODE = "data-source-mode",
          NO_MODE = "no-mode",
          //Node Types:
          CONST_TBL_TYPE = "table",
          CONST_COL_TYPE = "column",
          CONST_COL_BLUEPRINT_TYPE = "column-blueprint",
          CONST_COL_BUILTIN_TYPE = "column-builtin",
          CONST_COL_INLINE_TYPE = "column-inline",
          CONST_COL_FORMULA_TYPE = "column-formula",
          CONST_COL_SEQUENCE_TYPE = "column-sequence",
          CONST_COL_DATASOURCE_TYPE = "column-data_source",
          CONST_DATASOURCE_TYPE = "datasource",
          CONST_PARENT_TBL_TYPE = "TablesParent",
          CONST_PARENT_DS_TYPE = "DataSourcesParent",
          //Others:
          CONST_ACTION = "action",
          CONST_SEPARATOR = "separator",
          hasOwnProperty = util.hasOwnProperty,
          EVENT_CLICK = "click";

    var defaultNewColumn = {
        id: 9999,
        type: CONST_COL_TYPE,
        label: "NEWCOLUMN",
        display: "NewColumn",
        parentTable: "NEWTABLE",
        seq: 99,
        lang: "en",
        source: "BUILTIN",
        ds: "number.guid",
        builtin: "number.guid:NUMBER",
        inline: "",
        min: "1",
        max: "1000",
        precision: "0",
        minDate: "",
        maxDate: "",
        formatMask: "",
        seqStart: "",
        seqIncrement: "",
        dsTable: "",
        dsCustomDataSource: "",
        dsName: "",
        dsQuery: "",
        dsQueryColumn: "",
        dependsOn: "",
        formula: "",
        required: "true",
        blank: "0",
        mv: "N",
        mvDelimiter: "",
        mvMin: "",
        mvMax: "",
        mvPartition: "",
        mvFormat: "",
        mvUnique: "",
        maxLength: "",
        nodeAction: "addColumn"
    };

    var defaultNewTable = {
        id: 9999,
        label: "NEWTABLE",
        display: "NewTable",
        type: CONST_TBL_TYPE,
        seq: 99,
        rows: 50,
        nodeAction: "addTable",
        children: []
    };

    var defaultNewDataSource = {
        label: "NEWDATASOURCE",
        type: CONST_DATASOURCE_TYPE,
        oldLabel: "NEWDATASOURCE",
        dsType: "SQL_QUERY",
        table: "",
        sqlQuery: "",
        whereClause: "",
        nodeAction: "addDataSource"
    };

    //Functions:
    function getTreeRules () {

        return {
            "blueprint": {
                icon: "icon-dg-blueprint",
                operations: {
                    canAdd: true
                }
            },
            "table": {
                icon: "icon-dg-table",
                operations: {
                    canAdd: true,
                    canPreview: true,
                    canDrag: true
                }
            },
            "column": {
                icon: "icon-dg-built-in",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-builtin": {
                icon: "icon-dg-built-in",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-data_source": {
                icon: "icon-dg-data-source",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-blueprint": {
                icon: "icon-dg-blueprint",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-sequence": {
                icon: "icon-dg-seq",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-inline": {
                icon: "icon-dg-inline",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "column-formula": {
                icon: "icon-dg-formula",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            },
            "datasource": {
                icon: "icon-dg-data-source",
                operations: {
                    canAdd: true,
                    canDrag: true
                }
            }
        };
    }

    function createContextMenu( ) {
        var contextMenuEntries = [];

        //Add actions:
        contextMenuEntries.push({
            id: "add-column-action",
            label: translate( "ODG.PE.CONTEXT.ADD_COLUMN" ),
            type: CONST_ACTION,
            action: function() {
                addColumn();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_TBL_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        },
        {
            id: "add-table-action",
            label: translate( "ODG.PE.CONTEXT.ADD_TABLE" ),
            type: CONST_ACTION,
            action: function() {
                addTable();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_PARENT_TBL_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        },
        {
            id: "add-datasource-action",
            label: translate( "ODG.PE.CONTEXT.ADD_DATA_SOURCE" ),
            type: CONST_ACTION,
            action: function() {
                addDataSource();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_PARENT_DS_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        });

        //Delete Actions:
        contextMenuEntries.push({
            type: CONST_SEPARATOR,
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_TBL_TYPE, CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE, CONST_DATASOURCE_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            },
        },
        {
            id: "delete-table-action",
            label: translate( "ODG.PE.CONTEXT.DELETE_TABLE" ),
            type: CONST_ACTION,
            action: function() {
                deleteTable();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_TBL_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        },
        {
            id: "delete-column-action",
            label: translate( "ODG.PE.CONTEXT.DELETE_COLUMN" ),
            type: CONST_ACTION,
            action: function() {
                deleteColumn();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        },
        {
            id: "delete-datasource-action",
            label: translate( "ODG.PE.CONTEXT.DELETE_DATA_SOURCE" ),
            type: CONST_ACTION,
            action: function() {
                deleteDataSource();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_DATASOURCE_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        });

        //Preview Actions:
        contextMenuEntries.push({
            type: CONST_SEPARATOR,
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_TBL_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            },
        }/*,
        //TODO: Add support for preview table.
        {
            id: "preview-table-action",
            label: translate( "ODG.PE.CONTEXT.PREVIEW_DATA" ),
            type: CONST_ACTION,
            action: function() {
                previewTable();
            },
            hide: function() {
                var selectedNodes = treeNav$.treeView( "getSelectedNodes" );
                if ( selectedNodes && selectedNodes.length > 0 ) {
                    return ![ CONST_TBL_TYPE ].includes( selectedNodes[0].type );
                }
                return false;
            }
        }*/);

        return { items: contextMenuEntries };
    }

    function translate( m ) {
        return lang.getMessage( m );
    }

    function format( pKey ) {
        var pattern = translate( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ));
        return lang.format.apply( this, args );
    }

    //Actions for the TreeView:
    function addTable() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ ),
            parentObject,
            parentNode$,
            position;


        if ( lSelectedNodes[0].type === CONST_PARENT_TBL_TYPE ) {
            parentNode$ = selectedNode$;
            position = lSelectedNodes[0].children.length;
            parentObject = lSelectedNodes[0];
        } else {
            parentNode$ = treeNav$.treeView( "getSelection" ).first().parent().parent().siblings("div.a-TreeView-content");
            position = 0;
            parentObject =  lSelectedNodes[0]._parent;
        }
        defaultNewTable.blueprintName = gBlueprintName;
        defaultNewTable.seq = getNextSequenceValue( parentObject );
        defaultNewTable.label = getNewLabel( parentObject, defaultNewTable.label );
        treeNav$.treeView( "addNode", parentNode$, position, defaultNewTable );
    }

    function addColumn() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ ),
            parentNode$,
            parentObject,
            position;


        if ( lSelectedNodes[0].type === CONST_TBL_TYPE ) {
            parentNode$ = selectedNode$;
            parentObject = lSelectedNodes[0];
        } else {
            parentNode$ = selectedNode$.first().parent().parent();
            parentObject =  lSelectedNodes[0]._parent;
        }
        position = parentObject.children.length;
        //Set parent table:
        defaultNewColumn.blueprintName = gBlueprintName;
        defaultNewColumn.parentTable = parentObject.label;
        //Get the sequence (nodes are ordered by this value).
        defaultNewColumn.seq = getNextSequenceValue( parentObject );
        defaultNewColumn.label = getNewLabel( parentObject, defaultNewColumn.label );
        //Add the node to the tree:
        treeNav$.treeView( "addNode", parentNode$, position, defaultNewColumn );
    }

    function addDataSource() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ ),
            parentNode$,
            parentObject,
            position;


        if ( lSelectedNodes[0].type === CONST_PARENT_DS_TYPE ) {
            parentNode$ = selectedNode$;
            parentObject = lSelectedNodes[0];
            position = parentObject.children.length;
        } else {
            parentNode$ = treeNav$.treeView( "getSelection" ).first().parent().parent();
            parentObject =  lSelectedNodes[0]._parent;
            position = 0;
        }
        defaultNewDataSource.blueprintName = gBlueprintName;
        defaultNewDataSource.label = getNewLabel( parentObject, defaultNewDataSource.label );
        treeNav$.treeView( "addNode", parentNode$, position, defaultNewDataSource );
    }

    function deleteTable() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ );

        if ( lSelectedNodes[0].nodeAction === "none" || lSelectedNodes[0].nodeAction === "updateTable" ) {
            deleteFromBlueprint( lSelectedNodes[0].label, CONST_TBL_TYPE );
        } else {
            lSelectedNodes[0].nodeAction = "none";
            //Need to mark the new columns that might've been created for this table.
            lSelectedNodes[0].children.forEach( function( column ) {
                column.nodeAction = "none";
            });
            treeNav$.treeView( "deleteTreeNodes", selectedNode$ );
        }
    }

    function deleteColumn() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
        lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ );

        if ( lSelectedNodes[0].nodeAction === "none" || lSelectedNodes[0].nodeAction === "updateColumn" ) {
            deleteFromBlueprint( lSelectedNodes[0].label, CONST_COL_TYPE, lSelectedNodes[0].parentTable );
        } else {
            lSelectedNodes[0].nodeAction = "none";
            treeNav$.treeView( "deleteTreeNodes", selectedNode$ );
        }
    }

    function deleteDataSource() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
        lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ );

        if ( lSelectedNodes[0].nodeAction === "none" || lSelectedNodes[0].nodeAction === "updateDataSource" ) {
            deleteFromBlueprint( lSelectedNodes[0].label, CONST_DATASOURCE_TYPE );
        } else {
            lSelectedNodes[0].nodeAction = "none";
            treeNav$.treeView( "deleteTreeNodes", selectedNode$ );
        }
    }

    /*function previewTable() {
        var selectedNode$ = treeNav$.treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selectedNode$ );

        redirectToPage( "4014",lSelectedNodes[0].label );
    }*/

    /**
     * Gets all the data from the server to populate the tree and property editor.
     */
    function getTreeData() {

        (async () => {
            //Get all the translatable strings before creating context menus and getting the remote data:
            await lang.loadMessages(["ODG.%"]);

            contextMenuItem$ = createContextMenu();

            await server.process ("GetBPTablesAndColumns", {},
            {
                success : function( pData ) {
                    //Setup tree data:
                    let blueprintTablesArray = [],
                        blueprintColumnsArray = [],
                        customDataSourcesArray = [];

                    //Init tree view:
                    treeNav$.treeView( {
                        getNodeAdapter: function() { return getTreeNodeAdapter( pData ); },
                        iconType:        "a-Icon",
                        collapsibleRoot: false,
                        expandRoot:      true,
                        contextMenu:     contextMenuItem$,
                        contextMenuId:   "TDrenderingTreeMenu",
                        multiple:        false,
                        distance:        5
                    } );

                    //Initialize property editor:
                    propertyEditor$.tdPropertyEditor(
                    {
                        mode: BLUEPRINT_MODE,
                        schemas: apex.item("P4100_AVAILABLE_SCHEMA").getValue()
                    });

                    propertyEditor$.tdPropertyEditor( "addCustomProperties" );

                    //Expand all and select the root node (blueprint)
                    treeNav$.treeView( "expandAll" );
                    treeNav$.treeView( "setSelection", $( "[aria-level='1']", treeNav$ ).first().parent() );
                    propertyEditor$.tdPropertyEditor( "setTreeElement", treeNav$ );

                    //Set the Blueprint Name (for new tables/columns)
                    gBlueprintName = pData.label;
                    //Set all the custom data sources:
                    pData.children.forEach( function( childElement ) {

                        if ( childElement.type === CONST_PARENT_DS_TYPE ) {
                            childElement.children.forEach( function( customDataSource ) {
                                if( customDataSource.label ) {
                                    customDataSourcesArray.push( { d: customDataSource.label, r: customDataSource.label, type: customDataSource.dsType, query: customDataSource.sqlQuery } );
                                }
                            });
                        } else if ( childElement.type === CONST_PARENT_TBL_TYPE ) {
                            childElement.children.forEach( function( blueprintTable ) {
                                if( blueprintTable.label ) {
                                    var columnsArray = [];
                                    blueprintTablesArray.push( { d: blueprintTable.label, r: blueprintTable.label, seq: blueprintTable.seq } );
                                    blueprintTable.children.forEach( function( blueprintColumn ) {
                                        columnsArray.push( { d: blueprintColumn.label, r: blueprintColumn.label } );
                                    });
                                    blueprintColumnsArray.push( { table: blueprintTable.label, columns: columnsArray } );
                                }
                            });
                        }
                    });

                    //Initialize custom data sources and all the tables and column arrays
                    propertyEditor$.tdPropertyEditor( "setCurrentSchema", pData.schema );
                    propertyEditor$.tdPropertyEditor( "setCustomDataSources", customDataSourcesArray );
                    propertyEditor$.tdPropertyEditor( "setBlueprintTablesAndColumns", blueprintTablesArray, blueprintColumnsArray );
                },
                error: function( pError ) {
                    debug( pError );
                    loadingPopup$.remove();
                }
            });
            loadingPopup$.remove();
        })();
    }

    /**
     * Gets the next valid sequence value for new columns and tables.
     *
     * @param {*} pParentNode
     * @returns
     */
    function getNextSequenceValue( pParentNode ) {
        let lLargestSequence = 10; //default value when parent node has no children.

        if ( pParentNode.children.length > 0 ) {
            lLargestSequence = Math.max( 0, ...pParentNode.children.map( x => x.seq ) ) + 10;
        }
        return lLargestSequence;
    }

    /**
     * Returns the new label for new columns, tables and custom data sources.
     * @param {*} pLabel
     * @param {*} pCounter
     * @returns
     */
    function getNewLabel( pParentNode, pLabel ) {
        let newCount = 1,
            oldCountIndex,
            tempLabel = pLabel;

        pParentNode.children.forEach( function( element ) {
            if ( element.label === tempLabel ) {
                oldCountIndex = tempLabel.lastIndexOf( "_" );

                if ( oldCountIndex > 0 ) {
                    newCount = parseInt( tempLabel.substring( oldCountIndex + 1 ), 10 ) + 1;
                    tempLabel = tempLabel.replace( tempLabel.substring( oldCountIndex ), "_" + newCount );
                }
            }
        });

        return tempLabel.includes( "_" ) ? tempLabel : tempLabel += "_" + newCount;
    }

    getTreeData();

    //Event handling:
    treeNav$.on( "treeviewselectionchange", function( ) {
        var selection$ = $( this ).treeView( "getSelection" ),
            lSelectedNodes = treeNav$.treeView( "getNodes", selection$ ),
            lSelectedNode;

        //Update tables, columns and custom data sources (read tree and make them available for the LOVs)
        updateBlueprintLOVReferences();

        if( lSelectedNodes.length > 0 ) {
            lSelectedNode = lSelectedNodes[0];

            propertyEditor$.tdPropertyEditor( "setSelectedNode", lSelectedNode, treeNav$.treeView( "getSelection" ).first() );

            if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( lSelectedNode.type ) ) {
                propertyEditor$.tdPropertyEditor( "setMode", COLUMN_M0DE, lSelectedNode );
            } else if ( lSelectedNode.type === CONST_TBL_TYPE ) {
                propertyEditor$.tdPropertyEditor( "setMode", TABLE_MODE, lSelectedNode );
            } else if ( lSelectedNode.type === CONST_DATASOURCE_TYPE ) {
                propertyEditor$.tdPropertyEditor( "setMode", DATA_SOURCE_MODE, lSelectedNode );
            } else if ( lSelectedNode.type === "blueprint" ) {
                propertyEditor$.tdPropertyEditor( "setMode", BLUEPRINT_MODE, lSelectedNode );
            } else {
                propertyEditor$.tdPropertyEditor( "setMode", NO_MODE, lSelectedNode );
            }
        }
    } );

    $( contextMenuItem$ ).on( "menubeforeopen", function(){
        if ( treeNav$.treeView( "getSelection" ).length === 0 ) {
            treeNav$.treeView( "setSelection", $( "[aria-level='1']", treeNav$ ).first().parent() );
        }
    } );

    // Save Operation
    $( "#SaveBlueprintChanges" ).on( EVENT_CLICK, function() {
        saveBlueprint( 4000, false, blueprintNodesAdapter.root() );
    });

    // Preview Data
    $( "#SaveAndPreviewBlueprintChanges" ).on( EVENT_CLICK, function() {
        saveBlueprint( 4012, true, blueprintNodesAdapter.root() );
    });

    // Generate Data
    $( "#SaveAndGenerateBlueprintChanges" ).on( EVENT_CLICK, function() {
        saveBlueprint( 4005, true, blueprintNodesAdapter.root() );
    });

    /**
     * Runs updates on the LOVs that reference
     * tables, columns and custom data sources.
     */
    function updateBlueprintLOVReferences() {
        let customDataSourcesArray = [],
            blueprintTablesArray = [],
            blueprintColumnsArray = [];

        blueprintNodesAdapter.root().children.forEach( function( childElement ) {

            if ( childElement.type === CONST_PARENT_DS_TYPE ) {
                childElement.children.forEach( function( customDataSource ) {
                    if( customDataSource.label && customDataSource.nodeAction !== "addDataSource" ) {
                        customDataSourcesArray.push( { d: customDataSource.label, r: customDataSource.label, type: customDataSource.dsType, query: customDataSource.sqlQuery } );
                    }
                });
            } else if ( childElement.type === CONST_PARENT_TBL_TYPE ) {
                childElement.children.forEach( function( blueprintTable ) {
                    if( blueprintTable.label && blueprintTable.nodeAction !== "addTable" ) {
                        var columnsArray = [];
                        blueprintTablesArray.push( { d: blueprintTable.label, r: blueprintTable.label, seq: blueprintTable.seq } );
                        blueprintTable.children.forEach( function( blueprintColumn ) {
                            columnsArray.push( { d: blueprintColumn.label, r: blueprintColumn.label } );
                        });
                        blueprintColumnsArray.push( { table: blueprintTable.label, columns: columnsArray } );
                    }
                });
            }
        });

        //Update custom data sources and all the tables and column arrays
        propertyEditor$.tdPropertyEditor( "setCustomDataSources", customDataSourcesArray );
        propertyEditor$.tdPropertyEditor( "setBlueprintTablesAndColumns", blueprintTablesArray, blueprintColumnsArray );
    }

    function getTreeNodeAdapter( pData ) {

        blueprintNodesAdapter = $.apex.treeView.makeDefaultNodeAdapter( pData, getTreeRules() );

        blueprintNodesAdapter.sortCompare = function( pNodeA, pNodeB ) {
            return pNodeA.seq - pNodeB.seq;
        };

        blueprintNodesAdapter.renderNodeContent = function( lSelectedNodes, out, options, state ) {
            var label, icon;

            if ( blueprintNodesAdapter.getIcon ) {
                icon = blueprintNodesAdapter.getIcon( lSelectedNodes );
                if ( icon !== null ) {
                    out.markup( "<span" ).attr( "class", options.iconType + " " + icon ).markup( "></span>" );
                }
            }
            label = "&nbsp;" + blueprintNodesAdapter.getLabel( lSelectedNodes );

            out.markup( "<span tabIndex='-1' role='treeitem'" )
                .attr( "class", options.labelClass )
                .attr( "aria-level", state.level )
                .attr( "aria-selected", state.selected ? "true" : "false" )
                .optionalAttr( "area-disabled", state.disabled ? "true" : null )
                .optionalAttr( "aria-expanded", state.hasChildren === false ? null : state.expanded ? "true" : "false" )
                .optionalAttr( "aria-owns", state.owns )
                .markup( ">" )
                .markup( label )
                .markup( "</span>" );
            };
        return blueprintNodesAdapter;
    }

    /**
     * Helper function to gather all the nodes that require saving:
     * @param {*} pNode
     * @param {*} nodeList
     * @returns
     */
    function fillNodeArray( pNode, nodeList ) {

        if ( pNode.nodeAction && pNode.nodeAction !== "none" ) {
            //Verify if there is a flag for a consistent state of the node:
            if ( pNode.nodeReady && pNode.nodeReady === 'N' ) {
                debug.error("The blueprint object with name " + pNode.label + " is in inconsistent state and will not be saved.");
            } else {
                let copiedNode = jQuery.extend( {}, pNode ),
                    priority;
                //Remove circular references:
                delete copiedNode._parent;
                delete copiedNode.children;
                /* Data Generator API handles all references by name, so name changes are specially important.
                * Append node priority according to its type, and reorder, to avoid running into No Data Found issues.
                * Order:
                * 1. Blueprint
                * 2. Custom Data Sources
                * 3. Tables
                * 4. Columns
                */
                if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( copiedNode.type ) ) {
                    priority = 4;
                } else if ( copiedNode.type === CONST_TBL_TYPE ) {
                    priority = 3;
                } else if ( copiedNode.type === CONST_DATASOURCE_TYPE ) {
                    priority = 2;
                } else if ( copiedNode.type === "blueprint" ) {
                    priority = 1;
                }
                copiedNode.priority = priority;
                nodeList.push( copiedNode );
            }
        }

        if ( hasOwnProperty( pNode, "children" )
            && pNode.children instanceof Array ) {
            for( const child of pNode.children ) {
                fillNodeArray( child, nodeList );
            }
        }
        return nodeList;
    }

    /**
     * Helper function to gather all the column nodes:
     * @param {*} pNode
     * @param {*} nodeList
     * @returns
     */
     function fillColumnsArray( pNode, nodeList ) {
        let copiedNode = jQuery.extend( {}, pNode );
        //Remove circular references:
        delete copiedNode._parent;
        delete copiedNode.children;

        if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( copiedNode.type ) ) {
            nodeList.push( copiedNode );
        }

        if ( hasOwnProperty( pNode, "children" )
            && pNode.children instanceof Array ) {
            for( const child of pNode.children ) {
                fillColumnsArray( child, nodeList );
            }
        }
        return nodeList;
    }

    /**
     * Goes recursively through the entire tree and identifies
     * which nodes require saving.
     *
     * If a blueprint save operation is successful, the focus returns
     * to the node it was modified last.
     * @param {*} pNode
     * @param {*} pContinue
     */
    function saveBlueprint( pTargetPageId, pIsModal, pNode ) {
        let nodesToSaveArray = [],
            errorsArray = [],
            lTreeNode,
            lCurrentNode$;

        popup = apex.widget.waitPopup();
        apex.message.clearErrors();

        //Set a value in the parent page to determine if there's a need to refresh the UI.
        apex.item("P4100_REQUIRED_SAVE").setValue(propertyEditor$.tdPropertyEditor( "isBlueprintChanged" ));

        if ( propertyEditor$.tdPropertyEditor( "hasBlueprintErrors" ) ) {
            apex.message.showErrors( [
                {
                    type:       "error",
                    location:   [ "page" ],
                    message:    format( "ODG.PE.CORRECT_BEFORE_SAVE", propertyEditor$.tdPropertyEditor( "getBlueprintErrorList" ) ),
                    unsafe:     false
                }
            ] );
            popup.remove();
            return;
        }

        //Selecting the current node (for re-focus purposes after the save).
        lTreeNode = propertyEditor$.tdPropertyEditor( "getTreeNode" );
        lCurrentNode$ = propertyEditor$.tdPropertyEditor( "getCurrentNode" );

        fillNodeArray( pNode, nodesToSaveArray );

        //Order according to priority:
        nodesToSaveArray.sort( function(a, b) {
            if( a.priority > b.priority ) {
                return 1;
            }
            if ( a.priority < b.priority ) {
                return -1;
            }
            return 0;
        });

        async function saveTreeNode( pNode ) {
            try {
                const saveResult = await server.process( "SaveBlueprintObject",
                    {
                        f01: server.chunk( JSON.stringify( pNode ) )
                    });
                return saveResult;
            } catch ( pError ) {
                debug( pError );
            }
        }

        ( async () => {
            apex.message.clearErrors();
            for( const node of nodesToSaveArray ) {
                const result = await saveTreeNode( node );
                if ( result && !result.success ) {
                    let objectType;

                    if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( node.type ) ) {
                        objectType = lang.getMessage( "ODG.PE.COLUMN" );
                    } else if ( node.type === CONST_TBL_TYPE ) {
                        objectType = lang.getMessage( "ODG.PE.TABLE" );
                    } else if ( node.type === CONST_DATASOURCE_TYPE ) {
                        objectType = lang.getMessage( "ODG.PE.DATA_SOURCE" );
                    } else if ( node.type === "blueprint" ) {
                        objectType = lang.getMessage( "ODG.PE.BLUEPRINT" );
                    }

                    errorsArray.push(
                        {
                            type:       "error",
                            location:   [ "page" ],
                            message:    format( "ODG.BLUEPRINT_ERRORS", objectType, node.label, result.message ),
                            unsafe:     false
                        }
                    );
                }
            }

            if ( errorsArray.length > 0 ) {
                apex.message.showErrors( errorsArray );
                popup.remove();
            } else {
                //Set the blueprint changes flag back to false and unbind the beforeunload.
                propertyEditor$.tdPropertyEditor( "setBlueprintChanges", false );
                $(window).off('beforeunload');

                if( pIsModal ) {
                    popup.remove();
                    redirectToPage( pTargetPageId );
                } else {
                    server.process ("GetBPTablesAndColumns", {},
                    {
                        success : function( pData ) {
                            treeNav$.treeView( "option", "getNodeAdapter", function() { return getTreeNodeAdapter( pData ); } );
                            treeNav$.treeView( "refresh" );
                            treeNav$.treeView( "expandAll" );
                            updateBlueprintLOVReferences();
                            propertyEditor$.tdPropertyEditor( "refreshUI" );
                            apex.message.showPageSuccess( lang.getMessage( "ODG.BLUEPRINT_SAVED" ) );
                            // When adding any new nodes, the focus cannot be set again to the
                            // object we had in memory so we run a "find" operation on the treeView
                            // to find the saved node by label and set the focus on it.
                            if ( ["addColumn", "addTable", "addDataSource" ].includes( lTreeNode.nodeAction ) ) {
                                let lFoundNode$ = treeNav$.treeView( "find", {
                                    depth: -1,
                                    match: function( pNode )
                                    {
                                        return pNode.label === lTreeNode.label;
                                    }
                                });
                                treeNav$.treeView( "setSelection", lFoundNode$ );
                            } else {
                                //Regain focus on the saved node.
                                treeNav$.treeView( "setSelectedNodes", [ lTreeNode ] );
                                propertyEditor$.tdPropertyEditor( "setSelectedNode", lTreeNode, lCurrentNode$ );
                            }
                            popup.remove();
                        }
                    });
                }
            }
        })();
    }

    /**
     * Deletes a blueprint object.
     * @param {*} pNode
     * @param {*} pContinue
     */
     function deleteFromBlueprint( pName, pType, pParentName ) {
         let lHasReferences = false,
             lReferencesColumns = "",
             lObjectType,
             nodesToSaveArray = [];

        fillColumnsArray( blueprintNodesAdapter.root(), nodesToSaveArray );

        for( let node of nodesToSaveArray ) {
            if ( node.source === "DATA_SOURCE" && pName === node.dsName ) {
                //check if data source name matches the pName
                lHasReferences = true;
                if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( pType ) ) {
                    lObjectType = translate( "ODG.PE.COLUMN" );
                } else if ( pType === CONST_TBL_TYPE ) {
                    lObjectType = translate( "ODG.PE.TABLE" );
                } else if ( pType === CONST_DATASOURCE_TYPE ) {
                    lObjectType = translate( "ODG.PE.DATA_SOURCE" );
                }
                lReferencesColumns += "" + node.parentTable + "." + node.label + " ";
            } else if ( node.source === "BLUEPRINT" ) {
                //check if the blueprint table or column matches the pName:
                let blueprintRef = node.ds.split( "." );
                if ( pName === blueprintRef[0] || pName === blueprintRef[1] ) {
                    lHasReferences = true;
                    if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( pType ) ) {
                        lObjectType = translate( "ODG.PE.COLUMN" );
                    } else if ( pType === CONST_TBL_TYPE ) {
                        lObjectType = translate( "ODG.PE.TABLE" );
                    } else if ( pType === CONST_DATASOURCE_TYPE ) {
                        lObjectType = translate( "ODG.PE.DATA_SOURCE" );
                    }
                    lReferencesColumns += "" + node.parentTable + "." + node.label + " ";
                }
            }
        }

        //Verify if the object is referenced in a column (for blueprint and custom data source types)
        if ( lHasReferences ) {

            apex.message.showDialog( format( "ODG.PE.UNABLE_TO_DELETE.BODY", pName, lObjectType.toLowerCase(), lReferencesColumns, lObjectType.toLowerCase()), {
                title: format( "ODG.PE.UNABLE_TO_DELETE.TITLE", lObjectType.toLowerCase() ),
                dialogClass: "ui-dialog--notification",
                unsafe: false,
                modern: true,
                style: "warning",
                iconClass: "a-Icon icon-warning"
            } );

        } else {

            if( [ CONST_COL_TYPE, CONST_COL_BUILTIN_TYPE, CONST_COL_BLUEPRINT_TYPE, CONST_COL_INLINE_TYPE, CONST_COL_DATASOURCE_TYPE, CONST_COL_FORMULA_TYPE, CONST_COL_SEQUENCE_TYPE ].includes( pType ) ) {
                lObjectType = translate( "ODG.PE.COLUMN" );
            } else if ( pType === CONST_TBL_TYPE ) {
                lObjectType = translate( "ODG.PE.TABLE" );
            } else if ( pType === CONST_DATASOURCE_TYPE ) {
                lObjectType = translate( "ODG.PE.DATA_SOURCE" );
            }

            apex.message.confirm( format( "ODG.PE.CONFIRM_DELETE", lObjectType, pName ), function( okPressed ) {
                if ( okPressed ) {
                    server.process("DeleteFromBlueprint",
                    {
                        x01: pName,
                        x02: pType,
                        x03: pParentName
                    }, {
                        success: function(pData) {
                            if (pData.success === true) {
                                if ( propertyEditor$.tdPropertyEditor( "isBlueprintChanged" ) ) {
                                    //If user has pending changs, save them too.
                                    saveBlueprint( 4000, false, blueprintNodesAdapter.root() );
                                } else {
                                    //Just update the blueprint references and reload the location.
                                    updateBlueprintLOVReferences();
                                    location.reload();
                                }
                            } else {
                                apex.message.clearErrors();
                                apex.message.showErrors([
                                    {
                                        type:       "error",
                                        location:   [ "page", "inline" ],
                                        message:    translate( "ODG.PE.ERROR_DELETE", pName, pData ),
                                        unsafe:     false
                                    }]);
                            }
                        },
                        error: function( pError ) {
                            debug( pError );
                        }
                    });
                }
            });
        }
    }

    /**
     * Opens a modal page for preview or generate data.
     * @param {*} pPage
     */
    function redirectToPage( pPage, bpTableName ) {
        var bpId = apex.item("P4100_BLUEPRINT_ID").getValue(),
            url;

        if ( bpTableName ) {
            //If table name exits, then it is a preview/generate data on a table level:
            url = "f?p=#APP_ID#:#TARGET_PAGE#:#SESSION#::NO:Y,#TARGET_PAGE#:P#TARGET_PAGE#_BP_NAME,P#TARGET_PAGE#_TABLE_NAME:#P4100_BLUEPRINT_NAME#,#TABLE_NAME#";
        } else {
            url = "f?p=#APP_ID#:#TARGET_PAGE#:#SESSION#::NO:Y,#TARGET_PAGE#:P#TARGET_PAGE#_BLUEPRINT_ID:#P4100_BLUEPRINT_ID#";
        }
        url = url.replace("#APP_ID#", apex.env.APP_ID);
        url = url.replace("#SESSION#",apex.env.APP_SESSION);
        url = url.replace( /#TARGET_PAGE#/g, pPage );
        url = url.replace("#P4100_BLUEPRINT_ID#", bpId );
        url = url.replace("#TABLE_NAME#", bpTableName );

        server.process("PrepareURL",
        {
            x01: url
        }, {
            success: function(pData) {
                if (pData.success === true) {
                    apex.navigation.redirect(pData.url);
                }
            },
            error: function( pError ) {
                debug( pError );
            }
        });
    }

    //Reload page when blueprint selection changes
    $( "#P4100_BP_SELECTOR" ).on( "change", function() {
        apex.item("P4100_BLUEPRINT_ID").setValue( this.value );
        redirectToPage( '4100' );
    });

} )( apex.jQuery, apex.util, apex.server, apex.debug, apex.lang );