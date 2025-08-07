/*!
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

 /**
 * @fileOverview
 * This module is part of the page designer and contains the controller logic for the grid layout view.
 */

( function ( model, $, debug, lang, pd, util ) {
    "use strict";

    const C_ERROR = pd.CSS.IS_ERROR,
        C_WARNING = pd.CSS.IS_WARNING,
        I_ERROR = "icon-error",
        I_WARNING = "icon-warning";

    const C_BUTTON_CONT = "a-GridLayout-buttonContainer",
        SEL_COMPONENT = ".a-GridLayout-pageItem, .a-GridLayout-region, .a-GridLayout-button",
        SEL_COMPONENT_OR_PAGE = ".a-GridLayout-page, .a-GridLayout-pageItem, .a-GridLayout-region, .a-GridLayout-button",
        SEL_HEADER = ".a-GridLayout-page > h3, .a-GridLayout-pageItem > h3, .a-GridLayout-region > h3, .a-GridLayout-button > h3",
        SEL_GLV = "#glv";

    const T_PAGE = "page",
        T_REGION = "region",
        T_ITEM = "item",
        T_BUTTON = "button";

    const PREF_HIDE_LEGACY = "GLV_HIDE_LEGACY",
        PREF_HIDE_GLOBAL = "GLV_HIDE_GLOBAL",
        PREF_HIDE_EMPTY = "GLV_HIDE_EMPTY",
        PREF_HIDE_BTNS = "GLV_HIDE_BTNS",
        PREF_HIDE_ITEMS = "GLV_HIDE_ITEMS";

    const GLV_WIDGET_NAME = "glv",
        OPTION = "option";

    const INDEX = $.apex.gridlayout.INDEX;

    const propMap = {
        "newGrid": model.PROP.GRID_NEW_GRID,
        "newRow": model.PROP.GRID_NEW_ROW,
        "col": model.PROP.GRID_COLUMN,
        "newCol": model.PROP.GRID_NEW_COLUMN,
        "span": model.PROP.GRID_COLUMN_SPAN,
        "rowSpan": model.PROP.GRID_ROW_SPAN,
        "alignment": model.PROP.ALIGNMENT
    };

    const hasOwnProperty = util.hasOwnProperty;

    /*
     * Command support for gridlayout operations
     * The move, copy, and add commands can be initiated by the gridlayout widget (because of drag and drop) or
     * they can be initiated by a menu command.
     */

    function updateModelWithChanges( propertyChanges ) {
        var i, mprop, propChange, mcomp, value, p;

        for ( i = 0; i < propertyChanges.length; i++ ) {
            propChange = propertyChanges[i];
            mprop = propMap[propChange.property];
            mcomp = propChange.component._modelComponent;
            p = mcomp.getProperty( mprop );
            if ( !p ) {
                // strange that there is no property on the component but it can happen
                // don't try setting the value
                continue;
            }
            if ( propChange.newValue === true ) {
                value = p.getMetaData().yesValue;
            } else if ( propChange.newValue === false ) {
                value = p.getMetaData().noValue;
            } else if ( propChange.property === "alignment" && propChange.newValue ) {
                value = propChange.newValue.toUpperCase();
            } else if ( ( propChange.property === "col" || propChange.property === "span" || propChange.property === "rowSpan" ) && propChange.newValue === -1 ) {
                value = "";
            } else if ( propChange.newValue !== undefined && propChange.newValue !== null ) {
                value = "" + propChange.newValue; // force it to be a string
            }
            if ( value !== undefined ) {
                p.setValue( value );
            }
        }
    }

    function getPreviousComponent( changes ) {
        var index,
            prevComponent = null;

        index = changes.newComponentIndex;
        if ( index === undefined ) {
            index = changes.newIndex;
        }
        if ( index > 0 ) {
            prevComponent = changes.newParentContainer.components[ index - 1 ]._modelComponent;
        }
        return prevComponent;
    }

    // cleanup changes for undo/redo
    // Because of re-rendering the DOM and refreshing of regions or the whole page the only thing that
    // can be relied on to locate components is the id and to locate containers is the parent region id and
    // container id (name)
    function cleanupChanges( changes ) {
        if ( changes.newParentContainer === changes.prevParentContainer ) {
            // new and prev must be the same array not just arrays with the same values
            changes.newParentContainer = changes.prevParentContainer = [ changes.newParentContainer._parent.id, changes.newParentContainer.placeholder ];
        } else {
            if ( changes.newParentContainer ) {
                changes.newParentContainer = [ changes.newParentContainer._parent.id, changes.newParentContainer.placeholder ];
            }
            if ( changes.prevParentContainer ) {
                changes.prevParentContainer = [ changes.prevParentContainer._parent.id, changes.prevParentContainer.placeholder ];
            }
        }
        delete changes.component$;
        delete changes.newComponent$;
        delete changes.container$;
        delete changes.prevContainer$;
    }

    function getDisplayState() {
        var options = glv$.gridlayout( OPTION );

        return {
            hideLegacySlots: options.hideLegacySlots,
            hideEmptySlots: options.hideEmptySlots,
            hideButtons: options.hideButtons,
            hideItems: options.hideItems,
            displayFrom: options.displayFrom,
            hideGlobalComponents: gHideGlobalComponents
        };
    }

    function setDisplayState( state ) {
        var options = glv$.gridlayout( OPTION );

        if ( options.displayFrom !== state.displayFrom ) {
            glv$.gridlayout( OPTION, "displayFrom", state.displayFrom );
        }
        [ "displayFrom", "hideLegacySlots", "hideEmptySlots", "hideButtons", "hideItems" ].forEach( function( key ) {
            // if not currently showing and was showing then show it
            if ( !state[key] && options[key] !== state[key] ) {
                glv$.gridlayout( OPTION, key, state[key] );
            }
        } );
        if ( state.hideGlobalComponents !== gHideGlobalComponents ) {
            gHideGlobalComponents = state.hideGlobalComponents;
            glv$.gridlayout( "pageDataChanged" );
        }
    }

    var gModelReady = false,
        gHideGlobalComponents = true,
        currentCommand = null, // used to associate an expected gridlayout event with the command that caused it
        ignoreChange = false,  // used to ignore a gridlayout event caused by an undo/redo or during model notification
        ignoreModelCreate = false, // used to ignore a model create caused by a GLV command
        ignoreModelChange = false; // used to ignore a model change caused by a GLV command

    /*
     * Prototype gridMoveCommand
     */
    var gridMoveCommand = $.extend( apex.commandHistory.baseCommand(), {
        execute: function () {
            if ( !this.changes ) {
                currentCommand = this;
                this.gl$.gridlayout( "move", {}, this.component$, this.container$, this.grid, this.row, this.column, this.index, this.alignment );
            } else {
                // else the operation has already been done
                this.updateDataLayer();
            }
            this.state = getDisplayState();
        },
        updateDataLayer: function( changes ) {
            var newContainer, newParent, mcomp, previousComponent,
                values = [];

            function addValue( id, value ) {
                values.push( {id: id, value: value} );
            }

            if ( changes ) {
                this.changes = changes;
            }
            changes = this.changes;
            this._label = lang.formatMessageNoEscape( "PD.GLV.CMD.MOVE", this.changes.component.title );

            ignoreModelChange = true;

            // using changes create a data layer transaction and make updates
            this.transaction = model.transaction.start( GLV_WIDGET_NAME );
            mcomp = changes.component._modelComponent;
            // did the container change?
            if ( changes.newParentContainer !== changes.prevParentContainer ) {
                newContainer = changes.newParentContainer;
                newParent = newContainer._parent;
                if ( changes.component.type === T_REGION ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.PARENT_REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.PARENT_REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                } else if ( changes.component.type === T_ITEM ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                } else if ( changes.component.type === T_BUTTON ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                }
            }

            previousComponent = getPreviousComponent( changes );

            // move component
            mcomp.move( { previousComponent, values } );
            // update any grid change properties
            updateModelWithChanges( changes.propertyChanges );

            this.transaction.execute();

            cleanupChanges( changes );
        },
        undo: function () {
            var component,
                changes = this.changes,
                grid = changes.prevGrid,
                row = changes.prevRow,
                column = changes.prevColumn,
                index = changes.prevIndex;

            setDisplayState( this.state );

            ignoreChange = true;
            if ( changes.prevGridRemoved ) {
                index = INDEX.NEW_GRID;
            } else if ( changes.prevRowRemoved ) {
                index = INDEX.NEW_ROW;
            } else if ( changes.prevColumnRemoved ) {
                index = INDEX.NEW_COLUMN;
            }
            if ( changes.newParentContainer === changes.prevParentContainer ) {
                if ( index >= 0 && changes.prevIndex > changes.newIndex ) {
                    index += 1;
                }
                if ( changes.newGridInserted ) {
                    if ( changes.newGrid <= changes.prevGrid ) {
                        grid += 1;
                    }
                } else if ( changes.newRowInserted ) {
                    if ( changes.newRow <= changes.prevRow ) {
                        row += 1;
                    }
                } else if ( changes.newColumnInserted ) {
                    if ( changes.newColumn <= changes.prevColumn ) {
                        column += 1;
                    }
                }
            }

            ignoreModelChange = true;
            // undo the data layer transaction
            this.transaction.undo();
            // refresh the column information in case it changed
            component = glv$.gridlayout( "findComponentById", changes.component.id );
            component.col = getComponentProperty( component._modelComponent, model.PROP.GRID_COLUMN, -1 ) * 1; // must be a number
            if ( component.col >= 0 ) {
                // normally when moving the column is set to automatic
                // but on an undo need to force the current column value to be used
                component.forceColumn = true;
            }

            this.gl$.gridlayout( "move", {},
                changes.component.id,
                changes.prevParentContainer,
                grid,
                row,
                column,
                index,
                changes.prevAlignment );
        },
        redo: function () {
            var changes = this.changes,
                index = changes.newIndex;

            setDisplayState( this.state );

            ignoreChange = true;
            if ( changes.newGridInserted ) {
                index = INDEX.NEW_GRID;
            } else if ( changes.newRowInserted ) {
                index = INDEX.NEW_ROW;
            } else if ( changes.newColumnInserted ) {
                index = INDEX.NEW_COLUMN;
            } else if ( changes.newParentContainer === changes.prevParentContainer ) {
                if ( changes.newIndex > changes.prevIndex ) {
                    index += 1;
                }
            }

            ignoreModelChange = true;
            // redo the data layer transaction
            this.transaction.redo();

            this.gl$.gridlayout( "move", {},
                changes.component.id,
                changes.newParentContainer,
                changes.newGrid,
                changes.newRow,
                changes.newColumn,
                index,
                changes.newAlignment );
        },
        label: function () {
            return this._label;
        }
    } );

    /**
     * Create a move command
     *
     * @param gl$
     * @param changes optional
     * @param component$ optional
     * @param container$ optional
     * @param grid optional
     * @param row optional
     * @param column optional
     * @param index optional
     * @param alignment optional
     * @return {*}
     */
    function makeGridMoveCommand( gl$, changes, component$, container$, grid, row, column, index, alignment ) {
        var that = Object.create( gridMoveCommand );

        that.changes = changes;
        that.gl$ = gl$;
        that.component$ = component$;
        that.container$ = container$;
        that.grid = grid;
        that.row = row;
        that.column = column;
        that.index = index;
        that.alignment = alignment;
        that._label = "move";
        return that;
    }

    /*
     * Prototype gridCopyCommand
     */
    var gridCopyCommand = $.extend( apex.commandHistory.baseCommand(), {
        execute: function () {
            if ( !this.changes ) {
                currentCommand = this;
                this.gl$.gridlayout( "copy", {}, this.component$, this.container$, this.grid, this.row, this.column, this.index, this.alignment );
            } else {
                // else the operation has already been done
                this.updateDataLayer();
            }
            this.state = getDisplayState();
        },
        updateDataLayer: function( changes ) {
            var newContainer, newParent, mcomp, previousComponent,
                values = [];

            function addValue( id, value ) {
                values.push( {id: id, value: value} );
            }

            if ( changes ) {
                this.changes = changes;
            }
            changes = this.changes;
            this._label = lang.formatMessageNoEscape( "PD.GLV.CMD.COPY", this.changes.originalComponent.title );

            ignoreModelChange = true;
            ignoreModelCreate = true;

            // using changes create a data layer transaction and make updates
            this.transaction = model.transaction.start( GLV_WIDGET_NAME );
            mcomp = changes.component._modelComponent;
            mcomp = changes.component._modelComponent = mcomp.duplicate();
            // keep title and id in sync
            changes.component.id = mcomp.id;
            changes.component.title = mcomp.getDisplayTitle();
            glv$.gridlayout( "update", changes.component, false );

            // did the container change?
            if ( changes.newParentContainer !== changes.originalComponent._parent ) {
                newContainer = changes.newParentContainer;
                newParent = newContainer._parent;
                if ( changes.component.type === T_REGION ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.PARENT_REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.PARENT_REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                } else if ( changes.component.type === T_ITEM ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                } else if ( changes.component.type === T_BUTTON ) {
                    if ( newParent.type === T_PAGE ) {
                        addValue( model.PROP.REGION, "" );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    } else {
                        addValue( model.PROP.REGION, newParent.id );
                        addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                    }
                }
            }

            previousComponent = getPreviousComponent( changes );

            // move new component
            mcomp.move( { previousComponent, values } );
            // update any grid change properties
            updateModelWithChanges( changes.propertyChanges );

            this.transaction.execute();

            cleanupChanges( changes );
        },
        undo: function () {
            var changes = this.changes;

            setDisplayState( this.state );

            ignoreChange = true;
            this.gl$.gridlayout( "remove", {},
                [changes.component.id]
            );

            // undo the data layer transaction
            this.transaction.undo();
        },
        redo: function () {
            var changes = this.changes,
                index = changes.newIndex;

            setDisplayState( this.state );

            ignoreChange = true;
            if ( changes.newGridInserted ) {
                index = INDEX.NEW_GRID;
            } else if ( changes.newRowInserted ) {
                index = INDEX.NEW_ROW;
            } else if ( changes.newColumnInserted ) {
                index = INDEX.NEW_COLUMN;
            } else if ( changes.newParentContainer === changes.prevParentContainer ) {
                if ( changes.newIndex > changes.prevIndex ) {
                    index += 1;
                }
            }

            ignoreModelChange = true;
            ignoreModelCreate = true;

            this.gl$.gridlayout( "add", {},
                changes.component,
                changes.newParentContainer,
                changes.newGrid,
                changes.newRow,
                changes.newColumn,
                index,
                changes.newAlignment,
                changes.newComponent$ );

            // redo the data layer transaction
            this.transaction.redo();
        },
        label: function () {
            return this._label;
        }
    } );

    /**
     * Create a copy command
     *
     * @param gl$
     * @param changes optional
     * @param component$ optional
     * @param container$ optional
     * @param grid optional
     * @param row optional
     * @param column optional
     * @param index optional
     * @param alignment optional
     * @return {*}
     */
    function makeGridCopyCommand( gl$, changes, component$, container$, grid, row, column, index, alignment ) {
        var that = Object.create( gridCopyCommand );

        that.changes = changes;
        that.gl$ = gl$;
        that.component$ = component$;
        that.container$ = container$;
        that.grid = grid;
        that.row = row;
        that.column = column;
        that.index = index;
        that.alignment = alignment;
        that._label = "copy";
        return that;
    }

    /*
     * Prototype gridAddCommand
     */
    var gridAddCommand = $.extend( apex.commandHistory.baseCommand(), {
        execute: function () {
            if ( !this.changes ) {
                currentCommand = this;
                this.gl$.gridlayout( "add", {}, this.componentTypeId, this.container$, this.grid, this.row, this.column, this.index, this.alignment );
            } else {
                // else the operation has already been done
                this.updateDataLayer();
            }
            this.state = getDisplayState();
        },
        updateDataLayer: function( changes ) {
            var i, newContainer, newParent, value, mcomp, componentTypeId,
                galleryComponent, prevComponent,
                removeFromGrid = false,
                values = [];

            function addValue( id, value ) {
                values.push( {id: id, value: value} );
            }

            if ( changes ) {
                this.changes = changes;
            }
            changes = this.changes;
            galleryComponent = changes.component._galleryComponent;
            this._label = lang.formatMessageNoEscape( "PD.GLV.CMD.CREATE", galleryComponent.title );

            // using changes create a data layer transaction and make updates
            this.transaction = model.transaction.start( GLV_WIDGET_NAME );

            newContainer = changes.newParentContainer;
            newParent = newContainer._parent;
            if ( changes.component.type === T_REGION ) {
                componentTypeId = model.COMP_TYPE.REGION;

                if ( newParent.type === T_PAGE ) {
                    addValue( model.PROP.PARENT_REGION, "" );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                } else {
                    addValue( model.PROP.PARENT_REGION, newParent.id );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                }
            } else if ( changes.component.type === T_ITEM ) {
                componentTypeId = model.COMP_TYPE.PAGE_ITEM;

                if ( newParent.type === T_PAGE ) {
                    addValue( model.PROP.REGION, "" );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                } else {
                    addValue( model.PROP.REGION, newParent.id );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                }
            } else if ( changes.component.type === T_BUTTON ) {
                componentTypeId = model.COMP_TYPE.BUTTON;


                if ( newParent.type === T_PAGE ) {
                    addValue( model.PROP.REGION, "" );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                } else {
                    addValue( model.PROP.REGION, newParent.id );
                    addValue( model.PROP.SLOT_PLACEHOLDER, newContainer.placeholder );
                }
            }

            prevComponent = getPreviousComponent( changes );

            // Copy values from gallery metadata
            for ( i = 0; i < galleryComponent.values.length; i++ ) {
                value = galleryComponent.values[i];
                values.push( value );
                if ( value.id === model.PROP.ITEM_TYPE && value.value === "NATIVE_HIDDEN" ) {
                    // hidden items are not represented in the gridlayout so remove it
                    removeFromGrid = true;
                }
            }

            ignoreModelChange = true;
            ignoreModelCreate = true;
            mcomp = new model.Component( {
                previousComponent: prevComponent,
                typeId:            componentTypeId,
                values:            values
            } );
            changes.component._modelComponent = mcomp;

            // the data from the gallery is no longer needed
            delete changes.component._galleryComponent;

            if ( removeFromGrid ) {
                ignoreChange = true;
                glv$.gridlayout( "remove", {}, changes.newComponent$ );
                // nothing to undo/redo in grid so remove changes
                this.changes = null;
            } else {
                // update any grid change properties
                updateModelWithChanges( changes.propertyChanges );

                // keep title and id in sync
                changes.component.id = mcomp.id;
                changes.component.title = mcomp.getDisplayTitle();
                glv$.gridlayout( "update", changes.component, false );
            }

            this.transaction.execute();

            cleanupChanges( changes );
        },
        undo: function () {
            var changes = this.changes;

            setDisplayState( this.state );

            if ( changes ) {
                ignoreChange = true;
                this.gl$.gridlayout( "remove", {},
                    [changes.component.id]
                );
            }

            // undo the data layer transaction
            this.transaction.undo();
        },
        redo: function () {
            var index,
                changes = this.changes;

            setDisplayState( this.state );

            if ( changes ) {
                index = changes.newIndex;

                ignoreChange = true;
                ignoreModelChange = true;
                ignoreModelCreate = true;

                if ( changes.newGridInserted ) {
                    index = INDEX.NEW_GRID;
                } else if ( changes.newRowInserted ) {
                    index = INDEX.NEW_ROW;
                } else if ( changes.newColumnInserted ) {
                    index = INDEX.NEW_COLUMN;
                } else if ( changes.newParentContainer === changes.prevParentContainer ) {
                    if ( changes.newIndex > changes.prevIndex ) {
                        index += 1;
                    }
                }
                this.gl$.gridlayout( "add", {},
                    changes.component,
                    changes.newParentContainer,
                    changes.newGrid,
                    changes.newRow,
                    changes.newColumn,
                    index,
                    changes.newAlignment,
                    changes.newComponent$ );
            }

            // redo the data layer transaction
            this.transaction.redo();
        },
        label: function () {
            return this._label;
        }
    } );

    /**
     * Create a add command
     *
     * @param gl$
     * @param changes optional
     * @param componentTypeId optional
     * @param container$ optional
     * @param grid optional
     * @param row optional
     * @param column optional
     * @param index optional
     * @param alignment optional
     * @return {*}
     */
    function makeGridAddCommand( gl$, changes, componentTypeId, container$, grid, row, column, index, alignment ) {
        var that = Object.create( gridAddCommand );

        that.changes = changes;
        that.gl$ = gl$;
        that.componentTypeId = componentTypeId;
        that.container$ = container$;
        that.grid = grid;
        that.row = row;
        that.column = column;
        that.index = index;
        that.alignment = alignment;
        that._label = "create";
        return that;
    }

    /*
     * Prototype gridDeleteCommand
     */
    var gridDeleteCommand = $.extend( apex.commandHistory.baseCommand(), {
        execute: function () {
            currentCommand = this;

            this.gl$.gridlayout( "remove", {} );
            this.state = getDisplayState();
        },
        updateDataLayer: function( changes ) {
            this.changes.push( changes );
            // using changes create a data layer transaction and make updates and save the transaction
            if ( !this.transaction ) {
                this.transaction = model.transaction.start( GLV_WIDGET_NAME );
            }
            changes.component._modelComponent.remove();

            cleanupChanges( changes );

            if ( changes.lastChange ) {
                this.transaction.execute();
            }
        },
        undo: function () {
            var i, changes, index,
                changesArray = this.changes;

            setDisplayState( this.state );

            // undo in reverse order so position information is correct
            for ( i = changesArray.length - 1; i >= 0; i-- ) {
                changes = changesArray[i];

                ignoreChange = true;

                index = changes.prevIndex;
                if ( changes.prevGridRemoved ) {
                    index = INDEX.NEW_GRID;
                } else if ( changes.prevRowRemoved ) {
                    index = INDEX.NEW_ROW;
                } else if ( changes.prevColumnRemoved ) {
                    index = INDEX.NEW_COLUMN;
                }
                // todo may need to do similar adjustment to grid, row, column
                this.gl$.gridlayout( "add", {},
                    changes.component,
                    changes.prevParentContainer,
                    changes.prevGrid,
                    changes.prevRow,
                    changes.prevColumn,
                    index,
                    changes.prevAlignment,
                    changes.component$ );
            }
            // undo the data layer transaction
            this.transaction.undo();
        },
        redo: function () {
            var i,
                components = [],
                changes = this.changes;

            setDisplayState( this.state );

            ignoreChange = true;
            for ( i = 0; i < changes.length; i++ ) {
                components.push( changes[i].component.id );
            }
            this.gl$.gridlayout( "remove", {}, components );
            // redo the data layer transaction
            this.transaction.redo();
        },
        label: function () {
            return this._label;
        }
    } );

    /**
     * Create a delete command
     *
     * @param gl$
     */
    function makeGridDeleteCommand( gl$, components$ ) {
        var that = Object.create( gridDeleteCommand );

        that.changes = [];
        that.gl$ = gl$;
        that.transaction = null;
        if ( components$.length > 1 ) {
            that._label = lang.formatMessageNoEscape( "PD.GLV.CMD.DEL_N", components$.length );
        } else {
            that._label = lang.formatMessageNoEscape( "PD.GLV.CMD.DEL", glv$.gridlayout( "getComponents", components$ )[0].title );
        }
        return that;
    }

     /*
     * End glv commands
     */

    function updateCopy( newComponent, oldComponent ) {
        // the data model doesn't provide a way to get new titles or ids before
        // a transaction is created. So just use dummy information here and
        // update it during the copied
        newComponent.id = "t0001";  // todo there can be multiple copies at once such as children of regions. Can't all have same id.
                                    // also how to associate the component with the model create notification that will happen later??? Relayout?
                                    //newComponent.title = ""; // this is causing problems. Because containers get copied also
        newComponent._modelComponent = oldComponent._modelComponent;
    }

    function getIconForComponent ( component ) {
        return component.iconClass;
    }

    function makeComponent( compId ) {

        const galleryComponent = window.componentGallery.getComponentData( compId );
        const type = galleryComponent.type;

        // the data model doesn't provide a way to get new titles or ids before
        // a transaction is created. So just use dummy information here and
        // update it during the copied
        let component = {
            type,
            _galleryComponent: galleryComponent, // used to pass gallery metadata to add command
            id: "t0002",
            title: galleryComponent.title,
            iconClass: galleryComponent.iconClass
        };

        if ( type === T_REGION ) {
            let regionType;
            let templateComponentType;
            let regionTemplateId;
            for ( let i = 0; i < galleryComponent.values.length; i++ ) {
                const value = galleryComponent.values[i];
                if ( value.id === model.PROP.REGION_TEMPLATE ) {
                    regionTemplateId = value.value;
                } else if ( value.id === model.PROP.REGION_TYPE ) {
                    regionType = value.value;
                    component.regionType = regionType;

                    if ( regionType.startsWith( "TMPL" ) ) {
                        const templateComponentTypes = model.getRegionPlugin( regionType ).templateTypes;
                        templateComponentType = templateComponentTypes.includes( "REPORT" ) ? "REPORT" :
                                                templateComponentTypes.includes( "PARTIAL" ) ?  "PARTIAL" :
                                                "REGION_ONLY";
                    }
                }
            }
            component.slots = [];

            const slotsIn = model.getSlots( { regionType, templateComponentType, regionTemplateId } );

            copySlots( slotsIn, component.slots, null, regionType );
            for ( const slot of component.slots ) {
                slot.components = [];
            }

        }

        if ( type === T_ITEM ) {
            for ( let i = 0; i < galleryComponent.values.length; i++ ) {
                const value = galleryComponent.values[i];
                if ( value.id === model.PROP.ITEM_TYPE ) {
                    component.itemType = value.value;
                }
            }
        }

        return component;
    }

    function getBoolComponentProperty( component, prop, defaultValue ) {
        var trueValue,
            value = defaultValue,
            p =  component.getProperty( prop );

        if ( p ) {
            trueValue = p.getMetaData().yesValue;
            value = p.getValue() === trueValue;
        }
        return value;
    }

    function getComponentProperty( component, prop, defaultValue ) {
        var value = defaultValue,
            p =  component.getProperty( prop );

        if ( p ) {
            value = p.getValue();
            if ( ( value === null || value === "" ) && defaultValue ) {
                value = defaultValue;
            }
        }
        return value;
    }

    function getComponentParentId( component ) {
        var parentId = component.parentId || component.pageId; // if no parent then component is at page level
        if ( component.typeId === model.COMP_TYPE.REGION ) {
            parentId = getComponentProperty( component, model.PROP.PARENT_REGION, parentId );
        }
        return parentId;
    }

    function copySlots( slotsIn, slotsOut, regionId, regionType ) {
        let slotOut;
        let lastSpan = 0;

        for ( const slot of slotsIn ) {
            const title = slot.name;

            if ( slot.placeholder === "RIGHT_OF_IR_SEARCH_BAR" ) {
                // don't include the right of IR search bar button slot if the region is not an IRR
                if ( ( regionType && regionType !== "NATIVE_IR" ) ||
                        ( regionId && model.getComponents( model.COMP_TYPE.REGION, { id: regionId } )[0].getProperty( model.PROP.REGION_TYPE ).getValue() !== "NATIVE_IR" ) ||
                        ( !regionId && !regionType ) ) {
                    continue;
                }
            }

            slotOut = {
                placeholder: slot.placeholder,
                hasRegionSupport: slot.hasRegionSupport,
                hasItemSupport: slot.hasItemSupport,
                hasButtonSupport: slot.hasButtonSupport,
                supportedRegionTypes: slot.supportedRegionTypes,
                supportedItemTypes: slot.supportedItemTypes,
                title,
                isGrid: slot.hasGridSupport,
                hasSubRegionTemplate: slot.hasSubRegionTemplate,
                isLegacy: slot.isLegacy,
                isDeprecated: slot.isDeprecated,
                type: regionId ? "region" : "page"
            };

            // static grid is only for the page level slots (when regionId is not defined)
            if ( !regionId && !regionType ) {
                // glvSpan/span and !glvNewRow/newColumn control the static slot grid
                if ( hasOwnProperty( slot, "glvSpan" ) || slot.glvNewRow === false ) {
                    slotOut.span = slot.glvSpan;
                    slotOut.newColumn = !slot.glvNewRow;
                    // the model metadata doesn't have independent newRow and newColumn information so
                    // make it a new row if it isn't a new column and the span won't fit in the previous column
                    if ( !slotOut.newColumn && slotOut.span > lastSpan ) {
                        slotOut.newRow = true;
                    }
                    lastSpan = slotOut.span;
                } else {
                    slotOut.newRow = true;
                }
            }

            if ( slotOut.hasButtonSupport && slot.hasAlignment ) {
                slotOut.hasAlignment = true;
            }

            slotsOut.push( slotOut );
        }
    }

    function copyRegionTemplate( regionTemplateId, templateOut ) {

        const { regionType, templateComponentType } = templateOut;

        const slots = model.getSlots( { regionType, templateComponentType, regionTemplateId } );

        templateOut.slots = [];

        copySlots( slots, templateOut.slots, templateOut.id );

        return templateOut;
    }

    function copyPageTemplate( templateIn, templateOut ) {
        var grid = templateIn.grid;

        templateOut.gridType = grid.type.toLowerCase();
        templateOut.maxColumns = grid.maxColumns;
        templateOut.hasColumnSpan = grid.hasColumnSpan;
        if ( grid.hasRowSpan !== undefined ) {
            templateOut.hasRowSpan = grid.hasRowSpan;
        }
        templateOut.alwaysUseMaxColumns = grid.alwaysUseMaxColumns;
        templateOut.slots = [];
        copySlots( templateIn.slots, templateOut.slots );
        return templateOut;
    }

    function getSlotComponents( slot, regionId ) {

        let filter = {};

        if ( gHideGlobalComponents ) {
            filter.excludeGlobalPage = true;
        }

        slot.components = [];

        if ( slot.hasRegionSupport ) {

            filter.properties = [ {
                id:    model.PROP.SLOT_PLACEHOLDER,
                value: slot.placeholder
            }, {
                id:    model.PROP.PARENT_REGION,
                value: regionId ? regionId : ""
            } ];

            const modelComponents = model.getComponents( model.COMP_TYPE.REGION, filter );

            for ( let i = 0; i < modelComponents.length; i++ ) {
                const modelComponent = modelComponents[i];

                // don't include components from the global page if they are known to be conditionally excluded
                if ( !pd.isDisplayed( modelComponent ) ) {
                    continue;
                }

                let component = {};
                const regionTemplateId = getComponentProperty( modelComponent, model.PROP.REGION_TEMPLATE );

                const regionType = getComponentProperty( modelComponent, model.PROP.REGION_TYPE );
                const templateComponentType = model.getTemplateComponentType( modelComponent );

                component = copyRegionTemplate( regionTemplateId, {
                    type: T_REGION,
                    regionType,
                    templateComponentType,
                    id: modelComponent.id,
                    seq: modelComponent.seq,
                    title: modelComponent.getDisplayTitle(),
                    iconClass: pd.getComponentIconClass( T_REGION, regionType, templateComponentType ),
                    newGrid: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_GRID, false ),
                    newRow: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_ROW, false ),
                    col: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN, -1 ) * 1, // must be a number
                    newCol: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_COLUMN, true ),
                    span: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN_SPAN, -1 ) * 1, // must be a number
                    hasErrors: modelComponent.hasErrors(),
                    hasWarnings: modelComponent.hasWarnings(),
                    isReadOnly: modelComponent.isReadOnly(),
                    itemsAboveContent: getComponentProperty( modelComponent, model.PROP.ITEM_DISPLAY_POSITION, "ABOVE" ) === "ABOVE",
                    _modelComponent: modelComponent
                } );

                if ( pd.isConditional( modelComponent ) ) {
                    component.isConditional = true;
                }

                // add region slots
                for ( const slot of component.slots ) {
                    slot.components = getSlotComponents( slot, component.id );
                }

                slot.components.push( component );
            }
        }

        if ( slot.hasItemSupport ) {

            filter.properties = [ {
                id:    model.PROP.SLOT_PLACEHOLDER,
                value: slot.placeholder
            }, {
                id:    model.PROP.REGION,
                value: regionId ? regionId : ""
            } ];

            const modelComponents = model.getComponents( model.COMP_TYPE.PAGE_ITEM, filter );

            for ( let i = 0; i < modelComponents.length; i++ ) {
                const modelComponent = modelComponents[i];

                // Skip hidden items
                let itemType = getComponentProperty( modelComponent, model.PROP.ITEM_TYPE );
                if ( itemType === "NATIVE_HIDDEN" ) {
                    continue;
                }

                let component = {
                    type: T_ITEM,
                    id: modelComponent.id,
                    seq: modelComponent.seq,
                    title: modelComponent.getDisplayTitle(),
                    itemType,
                    iconClass: pd.getComponentIconClass( T_ITEM, getComponentProperty( modelComponent, model.PROP.ITEM_TYPE ) ),
                    newGrid: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_GRID, false ),
                    newRow: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_ROW, false ),
                    col: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN, -1 ) * 1, // must be a number
                    newCol: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_COLUMN, true ),
                    span: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN_SPAN, -1 ) * 1, // must be a number,
                    hasErrors: modelComponent.hasErrors(),
                    hasWarnings: modelComponent.hasWarnings(),
                    isReadOnly: modelComponent.isReadOnly(),
                    _modelComponent: modelComponent
                };

                let rowSpan = getComponentProperty( modelComponent, model.PROP.GRID_ROW_SPAN, -1 ) * 1; // must be a number
                if ( rowSpan > 0 ) {
                    component.rowSpan = rowSpan;
                }

                if ( pd.isConditional( modelComponent ) ) {
                    component.isConditional = true;
                }

                slot.components.push( component );
            }

        }

        if ( slot.hasButtonSupport ) {

            filter.properties = [ {
                id:    model.PROP.SLOT_PLACEHOLDER,
                value: slot.placeholder
            }, {
                id:    model.PROP.REGION,
                value: regionId ? regionId : ""
            } ];

            const modelComponents = model.getComponents( model.COMP_TYPE.BUTTON, filter );

            for ( let i = 0; i < modelComponents.length; i++ ) {
                const modelComponent = modelComponents[i];
                let alignment = getComponentProperty( modelComponent, model.PROP.ALIGNMENT, null );
                let isHot = getBoolComponentProperty( modelComponent, model.PROP.BUTTON_IS_HOT, false );
                let component = {
                    type: T_BUTTON,
                    id: modelComponent.id,
                    seq: modelComponent.seq,
                    title: modelComponent.getDisplayTitle(),
                    iconClass: pd.getComponentIconClass( T_BUTTON, isHot ? "hot" : "normal" ),
                    newGrid: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_GRID, false ),
                    newRow: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_ROW, false ),
                    col: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN, -1 ) * 1, // must be a number
                    newCol: getBoolComponentProperty( modelComponent, model.PROP.GRID_NEW_COLUMN, true ),
                    span: getComponentProperty( modelComponent, model.PROP.GRID_COLUMN_SPAN, -1 ) * 1, // must be a number,
                    hasErrors: modelComponent.hasErrors(),
                    hasWarnings: modelComponent.hasWarnings(),
                    isReadOnly: modelComponent.isReadOnly(),
                    _modelComponent: modelComponent
                };

                if ( alignment ) {
                    component.alignment = alignment.toLowerCase();
                }

                let rowSpan = getComponentProperty( modelComponent, model.PROP.GRID_ROW_SPAN, -1 ) * 1; // must be a number
                if ( rowSpan > 0 ) {
                    component.rowSpan = rowSpan;
                }

                if ( pd.isConditional( modelComponent ) ) {
                    component.isConditional = true;
                }

                slot.components.push( component );
            }
        }

        slot.components.sort( function( a, b ) {
            if ( a.seq === b.seq ) {
                return ( String( a.id ).padStart( 36, '0' ) > String( b.id ).padStart( 36, '0' ) ) ? 1 : -1;
            } else {
                return a.seq - b.seq;
            }
        } );

        return slot.components;
    }

    function getDefaultGridData() {
        return {
            type: T_PAGE,
            iconClass: "icon-warning",
            gridType: "fixed",
            maxColumns: 12,
            hasColumnSpan: true,
            hasRowSpan: false,
            alwaysUseMax: false,
            title: lang.getMessage( "PD.GLV.EMPTY_GRID" ),
            slots: []
        };
    }

    function getPageGridData() {
        if ( !gModelReady ) {
            return getDefaultGridData();
        }

        const modelComponents = model.getComponents( model.COMP_TYPE.PAGE );

        if ( modelComponents.length !== 1 ) {
            return getDefaultGridData();
        }
        const modelComponent = modelComponents[0];
        let template = model.getPageTemplate();
        if ( !template ) {
            return getDefaultGridData();
        }
        let page = copyPageTemplate( template, {
            type: T_PAGE,
            id: modelComponent.id,
            iconClass: "icon-page",
            title: modelComponent.getDisplayTitle(),
            hasErrors: modelComponent.hasErrors(),
            hasWarnings: modelComponent.hasWarnings(),
            isReadOnly: model.isPageReadOnly(),
            _modelComponent: modelComponent
        } );

        // loop over page slots
        for ( const slot of page.slots ) {
            slot.components = getSlotComponents( slot );
        }

        return page;
    }

    function updateRegionData( region ) {
        // loop over region slots
        for ( const slot of region.slots ) {
            slot.components = getSlotComponents( slot, region.id );
        }
    }

    var glv$;

    $( function() {

        // Component types the GLV is using and listening for
        var COMPONENT_TYPES = [ model.COMP_TYPE.PAGE, model.COMP_TYPE.REGION, model.COMP_TYPE.PAGE_ITEM, model.COMP_TYPE.BUTTON ];

        var glvMenu$ = $( "#glvMenu" ),
            pendingComponentsToSelect = null;

        glv$ = $( SEL_GLV );

        function checkAllWritable( components ) {
            var i, allWritable = true;

            for ( i = 0; i < components.length; i++ ) {
                if ( components[i].isReadOnly ) {
                    allWritable = false;
                    break;
                }
            }
            return allWritable;
        }

        function doGridDelete() {
            var cmd,
                components$ = glv$.gridlayout( "getSelection" ).filter( SEL_COMPONENT ),
                comps = glv$.gridlayout( "getSelectedComponents" ),
                allWritable = checkAllWritable( comps );

            if ( components$.length === 0 || !allWritable || glv$.gridlayout( OPTION, "displayFrom" ) === comps[0].id ) {
                return;
            }
            // no need for a confirmation dialog because of undo
            cmd = makeGridDeleteCommand( glv$, components$ );
            apex.commandHistory.execute( cmd );
        }

        // this is the action member function of a menu item
        function menuMoveOrCopyAction() {
            var cmd,
                grid = null,
                row = null,
                column = null,
                selection$ = glv$.gridlayout( "getSelection" );

            if ( selection$.length !== 1 ) {
                return;
            }

            if ( this.col >= 0 ) {
                grid = 0; // todo handle case where there are multiple grids
                row = this.row;
                column = this.col;
            }
            if ( this.copy ) {
                cmd  = makeGridCopyCommand( glv$, null, selection$, this.container, grid, row, column, this.index, this.alignment );
            } else {
                // move
                cmd  = makeGridMoveCommand( glv$, null, selection$, this.container, grid, row, column, this.index, this.alignment );
            }
            apex.commandHistory.execute( cmd );
        }

        // this is the action member function of a menu item
        function menuAddAction( componentTypeId ) {
            var cmd,
                grid = null,
                row = null,
                column = null;

            if ( this.col >= 0 ) {
                grid = 0; // todo handle case where there are multiple grids
                row = this.row;
                column = this.col;
            }
            cmd  = makeGridAddCommand( glv$, null, componentTypeId, this.container, grid, row, column, this.index, this.alignment );
            apex.commandHistory.execute( cmd );
        }

        var positionsSubMenuGrid = [
                { l:"Before", i: null, a: 0 },
                { l:"After", i: null, a: 1 },
                { l:"Row before", i: INDEX.NEW_ROW, a: 0 },
                { l:"Row after", i: INDEX.NEW_ROW, a: 1 },
                { l:"Column before", i: INDEX.NEW_COLUMN, a: 0 },
                { l:"Column after", i: INDEX.NEW_COLUMN, a: 1 }
            ],
            positionsSubMenu = [
                { l:"Before", i: null, a: 0 },
                { l:"After", i: null, a: 1 }
            ];

        function makeTargetMenu( targets, action, copy ) {
            var i, j, menuItem, item, target, subMenuItems, subMenuItem, targetType,
                regionMenu = null, // for buttons, group targets into region subMenus
                menuItems = [];

            function addTargetPositions( item ) {
                var i, p, positions, menuItem,
                    menuItems = [];

                if ( targetType === "grid" ) {
                    positions = positionsSubMenuGrid;
                } else {
                    positions = positionsSubMenu;
                }
                for ( i = 0; i < positions.length; i++ ) {
                    p = positions[i];

                    menuItem = {
                        label: p.l,
                        type: "action",
                        action: action,
                        container: target.element,
                        index: p.i ? p.i : item.index + p.a
                    };
                    if ( targetType === "grid" ) {
                        if ( p.i === INDEX.NEW_ROW ) {
                            menuItem.row = item.row + p.a;
                        } else {
                            menuItem.row = item.row;
                        }
                        if ( p.i === INDEX.NEW_COLUMN ) {
                            menuItem.col = item.col + p.a;
                        } else {
                            menuItem.col = item.col;
                        }
                    } else {
                        if ( item.alignment ) {
                            menuItem.alignment = item.alignment;
                        }
                    }
                    if ( copy ) {
                        menuItem.copy = true;
                    }
                    menuItems.push( menuItem );
                }
                return menuItems;
            }

            if ( targets.length > 0 && targets[0].element.hasClass( C_BUTTON_CONT ) ) {
                // group button targets into region sub-menus because there are typically so many button targets
                regionMenu = {};
            }
            for ( i = 0; i < targets.length; i++ ) {
                target = targets[i];
                if ( regionMenu ) {
                    if ( regionMenu.label !== target.region ) {
                        if ( regionMenu.label ) {
                            menuItems.push( regionMenu );
                        }
                        regionMenu = {
                            label: target.region,
                            type: "subMenu",
                            menu: { items: [] }
                        };
                    }
                }
                menuItem = {
                    label: regionMenu ? target.name : target.label
                };
                targetType = target.type;
                if ( target.items.length === 0 ) {
                    menuItem.type = "action";
                    menuItem.action = action;
                    // extra stuff for the action
                    menuItem.container = target.element;
                    menuItem.index = 0;
                    if ( targetType === "grid" ) {
                        menuItem.row = 0;
                        menuItem.col = 0;
                    } else {
                        if ( target.alignment ) {
                            menuItem.alignment = target.alignment;
                        }
                    }
                    if ( copy ) {
                        menuItem.copy = true;
                    }
                } else {
                    menuItem.type = "subMenu";
                    menuItem.menu = { items: [] };
                    subMenuItems = menuItem.menu.items;
                    for ( j = 0; j < target.items.length; j++ ) {
                        item = target.items[j];
                        subMenuItem = {
                            label: item.name,
                            type: "subMenu",
                            menu: { items: addTargetPositions( item ) }
                        };
                        subMenuItems.push( subMenuItem );
                    }
                }
                if ( regionMenu ) {
                    regionMenu.menu.items.push( menuItem );
                } else {
                    menuItems.push( menuItem );
                }
            }
            if ( regionMenu ) {
                menuItems.push( regionMenu );
            }
            return menuItems;
        }

        // share makeTargetMenu and menuAddAction with gallery
        pd.glvMakeTargetMenu = makeTargetMenu;
        pd.glvMenuAddAction = menuAddAction;

        function updateDisplayFromHere( comps ) {
            comps = comps || glv$.gridlayout( "getSelectedComponents" );

            apex.actions.lookup( "glv-disp-from-region" ).disabled = !( comps.length >= 1 && comps[0].type === T_REGION &&
                comps[0].id !== glv$.gridlayout( OPTION, "displayFrom" ) );
            apex.actions.update( "glv-disp-from-region" );
            apex.actions.lookup( "glv-disp-from-page" ).disabled = glv$.gridlayout( OPTION, "displayFrom" ) === null;
            apex.actions.update( "glv-disp-from-page" );
        }

        apex.actions.add( [
            {
                name: "glv-disp-from-page",
                label: lang.getMessage( "PD.GLV.MI.DISP_PAGE" ),
                shortcut: "Ctrl+Alt+T",
                disabled: true,
                action: function() {
                    glv$.gridlayout( OPTION, "displayFrom", null );
                    updateDisplayFromHere();
                }
            },
            {
                name: "glv-disp-from-region",
                label: lang.getMessage( "PD.GLV.MI.DISP_REGION" ),
                shortcut: "Ctrl+Alt+D",
                disabled: true,
                action: function() {
                    var comps = glv$.gridlayout( "getSelectedComponents" );

                    if ( comps.length >= 1 && comps[0].type === T_REGION ) {
                        glv$.gridlayout( OPTION, "displayFrom", comps[0].id );
                    }
                    this.disabled = true;
                    apex.actions.update( this.name );
                    apex.actions.lookup( "glv-disp-from-page" ).disabled = false;
                    apex.actions.update( "glv-disp-from-page" );
                }
            },
            {
                name: "glv-hide-empty",
                label: lang.getMessage( "PD.GLV.MI.HIDE_EMPTY" ),
                shortcut: "Ctrl+Alt+E",
                get: function () {
                    return glv$.gridlayout( OPTION, "hideEmptySlots" );
                },
                set: function ( v ) {
                    glv$.gridlayout( OPTION, "hideEmptySlots", v );
                    pd.saveBoolPref( PREF_HIDE_EMPTY, v );
                }
            }
        ] );


        // grid layout context menu
        var contextMenu = {
            menubar: false,
            items: [
                { id: "dispRoot", type: "action", action: "glv-disp-from-page" },
                { id: "dispHere", type: "action", action: "glv-disp-from-region" },
                { type: "toggle", action: "pd-expand-restore" },
                { type: "separator" },
                { id: "newgrid", type: "action", labelKey: "PD.GLV.MI.NEW_GRID", hide: true }, // TODO repurpose or remove
                // TODO consider other grid options, colSpan, rowSpan, newGrid, column
                { id: "delete", type: "action", labelKey: "PD.DEL", accelerator: "Del", disabled: function() {
                    var comps = glv$.gridlayout( "getSelectedComponents" ), // todo consider optimization where don't get selection again (see dispHere)
                        allWritable = checkAllWritable( comps );

                    return comps.length < 1 || comps.length === 1 && comps[0].type === T_PAGE ||
                        !allWritable || glv$.gridlayout( OPTION, "displayFrom" ) === comps[0].id;
                }, action: function () {
                        doGridDelete( {} );
                    }
                },
                { id: "moveTo", type: "subMenu", disabled: true, labelKey: "PD.MI.MOVE2", menu: { items: [ ]}
                },
                { id: "copyTo", type: "subMenu", disabled: true, labelKey: "PD.MI.COPY2", menu: { items: [ ]}
                },
                { type: "separator" },
                { id: "hideConditional", type: "subMenu", disabled: true, labelKey: "PD.GLV.MI.HIDE_COND_COMP",
                    hide: true, // todo for the future
                    menu: { items: [ ]}
                },
                { type: "toggle", labelKey: "PD.GLV.MI.HIDE_LEGACY", get: function () {
                    return glv$.gridlayout( OPTION, "hideLegacySlots" );
                }, set: function ( v ) {
                    glv$.gridlayout( OPTION, "hideLegacySlots", v );
                    pd.saveBoolPref( PREF_HIDE_LEGACY, v );
                } },
                { type: "toggle", action: "glv-hide-empty" },
                { type: "toggle", labelKey: "PD.GLV.MI.HIDE_GLOBAL", disabled: function () {
                    var displayFromId = glv$.gridlayout( OPTION, "displayFrom" ),
                        rootComponentIsGlobal = displayFromId ?
                            glv$.gridlayout( "findComponentById", displayFromId )._modelComponent.isOnGlobalPage() :
                            false;
                    // if this is the global page or currently displaying from a region on the global page then can't hide
                    return !gModelReady || model.isGlobalPage() || rootComponentIsGlobal;
                }, get: function () {
                    return gHideGlobalComponents;
                }, set: function ( v ) {
                    gHideGlobalComponents = v;
                    glv$.gridlayout( "pageDataChanged" );
                    pd.saveBoolPref( PREF_HIDE_GLOBAL, v );
                } },
                { type: "toggle", labelKey: "PD.GLV.MI.HIDE_BTNS", get: function () {
                    return glv$.gridlayout( OPTION, "hideButtons" );
                }, set: function ( v ) {
                    glv$.gridlayout( OPTION, "hideButtons", v );
                    pd.saveBoolPref( PREF_HIDE_BTNS, v );
                } },
                { type: "toggle", labelKey: "PD.GLV.MI.HIDE_ITEMS", get: function () {
                    return glv$.gridlayout( OPTION, "hideItems" );
                }, set: function ( v ) {
                    glv$.gridlayout( OPTION, "hideItems", v );
                    pd.saveBoolPref( PREF_HIDE_ITEMS, v );
                } },
                // todo hide until CSS is finished
                { type: "subMenu", hide: true, labelKey: "PD.GLV.MI.ZOOM", menu: { items: [
                    { type: "radioGroup", set: function ( v ) {
                        glv$.gridlayout( OPTION, "zoom", v );
                    }, get: function () {
                        return glv$.gridlayout( OPTION, "zoom" ) + "";
                    }, choices: [
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "50" ), value: "50" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "75" ), value: "75" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "100" ), value: "100" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "120" ), value: "125" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "150" ), value: "150" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "170" ), value: "175" },
                        { labelKey: lang.formatMessage( "PD.GLV.MI.ZOOM_N", "200" ), value: "200" }
                    ] }
                ]}
                }
            ],
            beforeOpen: function() {
                var component$,
                    moveTo = glvMenu$.menu( "find", "moveTo" ),
                    copyTo = glvMenu$.menu( "find", "copyTo" ),
                    selection$ = glv$.gridlayout( "getSelection" ).filter( SEL_COMPONENT );

                moveTo.menu.items = [];
                copyTo.menu.items = [];
                if ( selection$.length === 1 ) {
                    component$ = selection$.eq( 0 );
                    if ( !glv$.gridlayout( "getComponents", component$ )[0].isReadOnly ) {
                        moveTo.menu.items = makeTargetMenu( glv$.gridlayout( "getDropTargets", component$ ), menuMoveOrCopyAction );
                        copyTo.menu.items = makeTargetMenu( glv$.gridlayout( "getDropTargets", component$, "copy" ), menuMoveOrCopyAction, true );
                    }
                }
                moveTo.disabled = moveTo.menu.items.length === 0;
                copyTo.disabled = copyTo.menu.items.length === 0;
            },
            afterClose: function( event, ui ) {
                if ( !ui.actionTookFocus ) {
                    glv$.gridlayout( "focus" );
                }
            }
        };
        glvMenu$.menu( contextMenu );

        gHideGlobalComponents = pd.getBoolPref( PREF_HIDE_GLOBAL, true );

        glv$.gridlayout( {
            getPageRoot: getPageGridData,
            hideLegacySlots: pd.getBoolPref( PREF_HIDE_LEGACY, true ),
            hideEmptySlots: pd.getBoolPref( PREF_HIDE_EMPTY, false ),
            hideButtons: pd.getBoolPref( PREF_HIDE_BTNS, false ),
            hideItems: pd.getBoolPref( PREF_HIDE_ITEMS, false ),
            getIconForComponent: getIconForComponent,
            makeComponent: makeComponent,
            updateComponentCopy: updateCopy,
            deleteKeyAction: function ( event ) {
                doGridDelete( event );
            },
            contextMenuAction: function( event ) {
                var pos, target$;

                if ( event.type === "contextmenu" ) {
                    glvMenu$.menu( "toggle", event.pageX, event.pageY );
                } else {
                    target$ = $( event.target );
                    pos = target$.offset();
                    glvMenu$.menu( "toggle", pos.left, pos.top + target$.find( "h3" ).height() );
                }
            },
            stateClassMap: {
                hasErrors: C_ERROR,
                hasWarnings: C_WARNING
            },
            stateIconMap: {
                hasErrors: I_ERROR,
                hasWarnings: I_WARNING
            },
            appendTo: "parent",
            cursor: "default",
            cursorAt: { left: 2, top: 2 },
            containment: "document",
            multiple: true,
            animate: false,
            delay: 10,
            distance: 5,
            opacity: 0.9,
            scroll: true,
            scrollSensitivity: 30,
            iconType: "a-Icon",
            selectionChange: function () {
                var i, comps, modelComponent,
                    modelComponents = [];

                comps = $( this ).gridlayout( "getSelectedComponents" );
                for ( i = 0; i < comps.length; i++ ) {
                    modelComponent = comps[i]._modelComponent;
                    if ( modelComponent ) {
                        modelComponents.push( modelComponent );
                    } else {
                        debug.log( "No component found for selection " + comps[i].id );
                    }
                }
                updateDisplayFromHere( comps );

                $( document ).trigger( "selectionChanged", [ GLV_WIDGET_NAME, modelComponents ] );
            },
            added: function ( event, changes ) {
                var cmd;

                if ( ignoreChange ) {
                    ignoreChange = false;
                    return;
                }
                if ( currentCommand ) {
                    currentCommand.updateDataLayer( changes );
                    currentCommand = null;
                } else {
                    cmd = makeGridAddCommand( glv$, changes );
                    apex.commandHistory.execute( cmd );
                }
            },
            removed: function ( event, changes ) {
                if ( ignoreChange ) {
                    ignoreChange = false;
                    return;
                }
                if ( currentCommand ) {
                    currentCommand.updateDataLayer( changes );
                    // there can be multiple components removed so don't null currentCommand until the last
                    if ( changes.lastChange ) {
                        currentCommand = null;
                    }
                }
            },
            moved: function ( event, changes ) {
                var cmd;

                if ( ignoreChange ) {
                    ignoreChange = false;
                    return; // its an undo or redo
                }
                if ( currentCommand ) {
                    currentCommand.updateDataLayer( changes );
                    currentCommand = null;
                } else {
                    cmd = makeGridMoveCommand( glv$, changes );
                    apex.commandHistory.execute( cmd );
                }
            },
            copied: function ( event, changes ) {
                var cmd;

                if ( ignoreChange ) {
                    ignoreChange = false;
                    return;
                }
                if ( currentCommand ) {
                    currentCommand.updateDataLayer( changes );
                    currentCommand = null;
                } else {
                    cmd = makeGridCopyCommand( glv$, changes );
                    apex.commandHistory.execute( cmd );
                }
            },
            start: function () {
                apex.tooltipManager.disableTooltips();
            },
            stop: function () {
                apex.tooltipManager.enableTooltips();
            }

        } ).tooltip( {
            // todo one problem with these tooltips is they don't scroll with the item they label
            items: SEL_HEADER,
            show: apex.tooltipManager.defaultShowOption(),
            content: function() {
                var comp = glv$.gridlayout( "getComponents", $( this ).parent() )[0]; // get the component to show a note/tooltip for
                if ( comp.note ) {
                    return comp.note; // todo consider to cache tooltip here?
                } else if ( comp._modelComponent ) { // no model no tooltip
                    return pd.tooltipContentForComponent( comp._modelComponent );
                }
            }
        } ).on( "focusin", function ( event ) {
            // Gridlayout only focuses the component but the tooltip is looking at the h3 child
            // so have to manually open and close the tooltip
            var fakeEvent,
                component$ = $( event.target ).closest( SEL_COMPONENT_OR_PAGE );

            if ( component$.length === 0 ) {
                return;
            }
            if ( !glv$.tooltip( OPTION, "disabled" ) ) {
                fakeEvent = $.Event( event );
                fakeEvent.target = fakeEvent.currentTarget = component$.children( "h3" )[0];
                glv$.tooltip( "open", fakeEvent );
            }
        } ).on( "focusout", function ( event ) {
            // Gridlayout only focuses the component but the tooltip is looking at the h3 child
            // so have to manually open and close the tooltip
            var fakeEvent,
                component$ = $( event.target ).closest( SEL_COMPONENT_OR_PAGE );

            if ( component$.length === 0 ) {
                return;
            }
            if ( !glv$.tooltip( OPTION, "disabled" ) ) {
                fakeEvent = $.Event( event );
                fakeEvent.target = fakeEvent.currentTarget = component$.children( "h3" )[0];
                glv$.tooltip( "close", fakeEvent );
            }
        } ).on( "keyup", function ( event ) {
            // Gridlayout only focuses the component but the tooltip is looking at the h3 child
            // tooltip has builtin support for closing the tooltip when ESC is pressed but it is looking at the wrong target
            // so must help out by sending a fake event with the adjusted target
            var fakeEvent, component$;

            if ( event.keyCode === $.ui.keyCode.ESCAPE ) {
                component$ = $( event.target ).closest( SEL_COMPONENT_OR_PAGE );
                if ( component$.length === 0 ) {
                    return;
                }
                if ( !glv$.tooltip( OPTION, "disabled" ) ) {
                    fakeEvent = $.Event( event );
                    fakeEvent.currentTarget = component$.children( "h3" )[0];
                    glv$.tooltip( "close", fakeEvent );
                }
            }
        } );

        $( document ).on( "selectionChanged", function( event, source, modelComponents ) {
            var i, modelComponent,
                compIds = [];

            if ( source === GLV_WIDGET_NAME ) {
                return;
            }
            for ( i = 0; i < modelComponents.length; i++ ) {
                modelComponent = modelComponents[i];
                if ( modelComponent.typeId === model.COMP_TYPE.PAGE ||
                     modelComponent.typeId === model.COMP_TYPE.REGION ||
                     modelComponent.typeId === model.COMP_TYPE.PAGE_ITEM ||
                     modelComponent.typeId === model.COMP_TYPE.BUTTON ) {

                    compIds.push( modelComponent.id );
                }
            }
            if ( glv$.is( ":visible" ) ) {
                glv$.gridlayout( "setSelectedComponents", compIds );
                updateDisplayFromHere();
            } else {
                pendingComponentsToSelect = compIds;
            }
        } );

        $( "#editor_tabs" ).on( "tabsactivate", function( event, ui ) {
            if ( ui.newPanel[0].id === "grid_layout" ) {
                if ( pendingComponentsToSelect ) {
                    glv$.gridlayout( "setSelectedComponents", pendingComponentsToSelect );
                    updateDisplayFromHere();
                    pendingComponentsToSelect = null;
                }
            }
        } );
        /*
         * Observe model changes
         */

        // Register observer to find out if any titles change
        model.observer(
            GLV_WIDGET_NAME,
            {
                component: {
                    typeIds: COMPONENT_TYPES
                },
                events: [ model.EVENT.DISPLAY_TITLE ]
            },
            function( notification ) {
                var component = glv$.gridlayout( "findComponentById", notification.component.id );

                if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                    debug.trace( "GLV Handle display title change: " + dumpNotifications( notification ) );
                }

                if ( component ) {
                    component.title = notification.component.getDisplayTitle();
                    glv$.gridlayout( "update", component, false );
                }
            }
        );

        // Register observer to find out if any component properties changed
        model.observer(
            GLV_WIDGET_NAME,
            {
                component: {
                    typeIds: COMPONENT_TYPES
                },
                events: [ model.EVENT.CHANGE ],
                properties: [
                    // for determining if component is conditional - keep in sync with pd.isConditional
                    model.PROP.CONDITION_TYPE,
                    model.PROP.AUTHORIZATION_SCHEME,
                    model.PROP.BUILD_OPTION,
                    // grid settings
                    model.PROP.GRID_NEW_GRID,
                    model.PROP.GRID_NEW_ROW,
                    model.PROP.GRID_NEW_COLUMN,
                    model.PROP.GRID_COLUMN,
                    model.PROP.GRID_COLUMN_SPAN,
                    model.PROP.GRID_ROW_SPAN,
                    model.PROP.ALIGNMENT,
                    model.PROP.ITEM_DISPLAY_POSITION,
                    // properties that affect the icon
                    model.PROP.ITEM_TYPE,
                    model.PROP.REGION_TYPE,
                    model.PROP.BUTTON_IS_HOT,
                    // properties that result in a move
                    model.PROP.DISPLAY_SEQUENCE,
                    model.PROP.REGION,
                    model.PROP.PARENT_REGION,
                    model.PROP.SLOT_PLACEHOLDER
                ]
            },
            function( notifications ) {
                var i, id, parentId, itemType, notification, component, parentComponent,
                    update = {},
                    layout = {},
                    refresh = {};

                function changed( propertyId ) {
                    var propEvents = notification.properties[ propertyId ];
                    return propEvents && $.inArray( "change", propEvents ) >= 0;
                }

                function newValue( propertyId ) {
                    return notification.component.getProperty( propertyId ).getValue();
                }

                function newBoolValue( propertyId ) {
                    var p =  notification.component.getProperty( propertyId ),
                        trueValue = p.getMetaData().yesValue;
                    return p.getValue() === trueValue;
                }

                function containsAncestorOf( collection, component ) {
                    var c = component._parent ? component._parent._parent : null;
                    while ( c ) {
                        if ( collection[c.id] ) {
                            return true;
                        }
                        c = c._parent ? c._parent._parent : null;
                    }
                    return false;
                }

                // todo would like a better way to ignore this notification if this was the source of the change!!!!
                if ( ignoreModelChange ) {
                    ignoreModelChange = false;
                    return;
                }

                if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                    debug.trace( "GLV Handle property changes: " + dumpNotifications( notifications ) );
                }

                for ( i = 0; i < notifications.length; i++ ) {
                    notification = notifications[i];
                    id = notification.component.id;
                    parentId = getComponentParentId( notification.component );
                    component = glv$.gridlayout( "findComponentById", id );
                    parentComponent = glv$.gridlayout( "findComponentById", parentId );

                    if ( !component && parentComponent ) {
                        // this is most likely a hidden item being changed to a non hidden or a button being moved into a valid position
                        refresh[parentId] = parentComponent;
                    }

                    if ( component ) {
                        if ( changed( model.PROP.ITEM_TYPE ) && component.type === T_ITEM ) {
                            itemType = newValue( model.PROP.ITEM_TYPE );
                            // todo other checks such as start/stop grid
                            if ( itemType === "NATIVE_HIDDEN" ) {
                                refresh[parentId] = parentComponent;
                            } else {
                                // a type change can effect the icon
                                component.iconClass = pd.getComponentIconClass( T_ITEM, getComponentProperty( notification.component, model.PROP.ITEM_TYPE ) );
                                component.itemType = itemType;
                                update[id] = component;
                            }
                        }
                        if ( changed( model.PROP.CONDITION_TYPE ) || changed( model.PROP.AUTHORIZATION_SCHEME ) || changed( model.PROP.BUILD_OPTION ) ) {
                            if ( pd.isConditional( notification.component ) ) {
                                component.isConditional = true;
                            } else {
                                delete component.isConditional;
                            }
                            update[id] = component;
                        }
                        if ( changed( model.PROP.REGION_TYPE ) && component.type === T_REGION ) {
                            component.iconClass = pd.getComponentIconClass( T_REGION, getComponentProperty( notification.component, model.PROP.REGION_TYPE ) );
                            component.regionType = newValue( model.PROP.REGION_TYPE );
                            update[id] = component;
                        }
                        if ( ( changed( model.PROP.BUTTON_IS_HOT ) ) &&
                                component.type === T_BUTTON ) {
                            component.iconClass = pd.getComponentIconClass( T_BUTTON, getBoolComponentProperty( notification.component, model.PROP.BUTTON_IS_HOT, false ) ? "hot" : "normal" );
                            update[id] = component;
                        }
                        if ( changed( model.PROP.GRID_NEW_GRID ) ) {
                            component.newGrid = newBoolValue( model.PROP.GRID_NEW_GRID );
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.GRID_NEW_ROW ) ) {
                            component.newRow = newBoolValue( model.PROP.GRID_NEW_ROW );
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.GRID_NEW_COLUMN ) ) {
                            component.newCol = newBoolValue( model.PROP.GRID_NEW_COLUMN );
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.GRID_COLUMN ) ) {
                            component.col = newValue( model.PROP.GRID_COLUMN ) * 1; // must be a number
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.GRID_COLUMN_SPAN ) ) {
                            component.span = newValue( model.PROP.GRID_COLUMN_SPAN ) * 1; // must be a number
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.GRID_ROW_SPAN ) ) {
                            component.rowSpan = newValue( model.PROP.GRID_ROW_SPAN ) * 1; // must be a number
                            layout[parentId] = component;
                        }
                        if ( changed( model.PROP.ITEM_DISPLAY_POSITION ) ) {
                            component.itemsAboveContent = newValue( model.PROP.ITEM_DISPLAY_POSITION ) === "ABOVE";
                            layout[parentId] = component;
                        }
                        // these indicate a move of some kind
                        if ( changed( model.PROP.ALIGNMENT ) ||
                             changed( model.PROP.REGION ) ||
                             changed( model.PROP.PARENT_REGION ) ||
                             changed( model.PROP.SLOT_PLACEHOLDER ) ||
                             changed( model.PROP.DISPLAY_SEQUENCE ) ) {
                            if ( component &&
                                component._parent &&
                                component._parent._parent &&
                                component._parent._parent.id !== parentId ) {

                                refresh[component._parent._parent.id] = component._parent._parent;
                            }

                            refresh[parentId] = parentComponent;
                        }

                    }
                }
                // weed out unnecessary updates
                for ( id in update ) {
                    if ( hasOwnProperty( update, id ) ) {
                        component = update[id];
                        if ( !layout[component.id] && !refresh[component.id] && !containsAncestorOf( layout, component ) && !containsAncestorOf( refresh, component ) ) {
                            glv$.gridlayout( "update", component, false );
                        }
                    }
                }
                for ( id in layout ) {
                    if ( hasOwnProperty( layout, id ) ) {
                        component = layout[id];
                        if ( !refresh[component.id] && !containsAncestorOf( refresh, component ) ) {
                            glv$.gridlayout( "update", component, true );
                        }
                    }
                }
                for ( id in refresh ) {
                    if ( hasOwnProperty( refresh, id ) ) {
                        parentComponent = refresh[id];
                        // parentComponent could be null if it is something currently being hidden and therefore not something we can update
                        if ( parentComponent && !containsAncestorOf( refresh, parentComponent ) ) {
                            if ( parentComponent.type === "page" ) {
                                glv$.gridlayout( "pageDataChanged" );
                            } else {
                                updateRegionData( parentComponent );
                                glv$.gridlayout( "update", parentComponent, true, true ); // layout children
                            }
                        }
                    }
                }
            },
            true // batch notifications
        );

        // Register observer to find out if properties affecting the grid itself change
        model.observer(
            GLV_WIDGET_NAME,
            { events: [ model.EVENT.GRID ] },
            function( notifications ) {
                var i, components;

                if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                    debug.trace( "GLV Handle grid changes - refresh whole page: " + dumpNotifications( notifications ) );
                }
                if ( !glv$.is( ":visible" ) ) {
                    // when not visible the gridlayout will not preserve the selection so do it when tab is focused again
                    pendingComponentsToSelect = [];
                    components = glv$.gridlayout( "getSelectedComponents" );
                    for ( i = 0; i < components.length; i++ ) {
                        pendingComponentsToSelect.push( components[i].id );
                    }
                }
                // if the page template or any region templates change or the page mode changes then
                // must recalculate all the page grid data and refresh gridlayout.
                glv$.gridlayout( "pageDataChanged" );
            },
            true // batch notifications
        );

        // Register observer to find out if a component has been created
        model.observer(
            GLV_WIDGET_NAME,
            {
                component: {
                    typeIds: COMPONENT_TYPES
                },
                events: [ model.EVENT.CREATE ]
            },
            function( notification ) {
                var parentComponent;

                // todo would like a better way to ignore this notification if this was the source of the change!!!!
                if ( ignoreModelCreate ) {
                    ignoreModelCreate = false;
                    return;
                }

                if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                    debug.trace( "GLV Handle create: " + dumpNotifications( notification ) );
                }
                // Could be something completely new (duplicated or created in the tree) or a delete from tree being undone
                // there is not enough information in the notification to add this so need to relayout from the parent
                parentComponent = glv$.gridlayout( "findComponentById", getComponentParentId( notification.component ) );
                if ( parentComponent ) {
                    if ( parentComponent.type === "page" ) {
                        glv$.gridlayout( "pageDataChanged" );
                    } else {
                        // parent component must be a region get fresh region data from model
                        updateRegionData( parentComponent );
                        glv$.gridlayout( "update", parentComponent, true, true ); // layout children
                    }
                }
            }
        );

        // Register observer to find out if a component has been deleted
        model.observer(
            GLV_WIDGET_NAME,
            {
                component: {
                    typeIds: COMPONENT_TYPES
                },
                events: [ model.EVENT.DELETE ]
            },
            function( notification ) {
                var component$,
                    componentId = notification.component.id;

                if ( !currentCommand ) {

                    if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                        debug.trace( "GLV Handle delete: " + dumpNotifications( notification ) );
                    }

                    component$ = glv$.gridlayout( "findById" , componentId );

                    if ( component$.length ) {
                        ignoreChange = true;
                        glv$.gridlayout( "remove", {}, component$ );
                    }
                }
            }
        );

        // Register observers to find out if a component has errors or warnings
        model.observer(
            GLV_WIDGET_NAME,
            { component: {
                typeIds: COMPONENT_TYPES
              },
              events: [ model.EVENT.ERRORS, model.EVENT.NO_ERRORS, model.EVENT.WARNINGS, model.EVENT.NO_WARNINGS ]
            },
            function( notification ) {
                var component = glv$.gridlayout( "findComponentById", notification.component.id );

                if (  debug.getLevel() >= debug.LOG_LEVEL.APP_TRACE ) {
                    debug.trace( "GLV Handle error or warning status change: " + dumpNotifications( notification ) );
                }

                if ( component ) {
                    component.hasErrors = notification.component.hasErrors();
                    component.hasWarnings = notification.component.hasWarnings();
                    glv$.gridlayout( "update", component, false );
                }
            }
        );

        function dumpNotifications( notifications ) {
            var i, j, prop, events, notification,
                result = "";
            if ( !$.isArray( notifications ) ) {
                notifications = [notifications];
            }
            for ( i = 0; i < notifications.length; i++ ) {
                notification = notifications[i];
                result += "[" + notification.component.id + ": ";
                for ( prop in notification.properties ) {
                    if ( Object.prototype.hasOwnProperty.call( notification.properties, prop ) ) {
                        result += prop + ":";
                        events = notification.properties[prop];
                        for ( j = 0; j < events.length; j++ ) {
                            result += events[j] + ",";
                        }
                        result = result.substring( 0, result.length - 1 ) + ";";
                    }
                }
                result += "] ";
            }
            return result;
        }

        /*
        * For debugging: leave the following debug code commented out
        */
/*
        function dumpChanges( changeType, changes ) {
            var i, prop, value, pc, str;
            for ( prop in changes ) {
                value = changes[prop];
                if ( prop === "propertyChanges" ) {
                    if ( value.length > 0 ) {
                        console.log( "    propertyChanges:" );
                        for ( i = 0; i < value.length; i++ ) {
                            pc = value[i];
                            console.log( "      " + pc.component.title + ", " + pc.property + ", old = " + pc.oldValue + ", new = " + pc.newValue );
                        }
                    }
                } else if ( $.isPlainObject( value ) ) {
                    str = "    " + prop + ": ";
                    if ( value.jquery ) {
                        str += "id = " + value[0].id + ", ";
                    }
                    if ( value.type ) {
                        str += "type = " + value.type + ", ";
                    }
                    if ( value.title ) {
                        str += "title = " + value.title + ", ";
                    }
                    if ( value.id ) {
                        str += "id = " + value.id + ", ";
                    }
                    console.log( str );
                } else {
                    console.log( "    " + prop + " = " + value );
                }
            }
        }
 */

    } );

    $( document ).on( "modelReady", function(){
        gModelReady = true;

        if ( $( SEL_GLV ).length ) {
            try {
                glv$.gridlayout( "pageDataChanged" );
            } catch ( ex ) {
                // give the rest of the page a chance of running even if there is an error in gridlayout
                debug.error( "Failed to load grid layout", ex );
                gModelReady = false;
                glv$.gridlayout( "pageDataChanged" );
            }
        }

    } );

    $( document ).on( "modelCleared", function(){
        gModelReady = false;
        if ( $( SEL_GLV ).length ) {
            glv$.gridlayout( "pageDataChanged" );
        }
    } );

} )( window.pe, apex.jQuery, apex.debug, apex.lang, window.pageDesigner, apex.util );
