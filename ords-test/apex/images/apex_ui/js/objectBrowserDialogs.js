/*!
 * Copyright (c) 2021, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This contains the implementation for all the inline dialog regions on the Object Browser page 4500:2000
 **/
/* global objectBrowser, $v2 */
( function( $, ob, apexModel, util, apexMessage, apexItem, apexItems, apexBinding, apexActions, lang, theme ) {
    "use strict";

    const initDialog = ob.initDialog,
        getCurrentInstance = ob.getCurrentInstance,
        typeDisplayName = ob.typeDisplayName,
        sendDDL = ob.sendDDL,
        sendCommand = ob.sendCommand,
        invalidateViews = ob.invalidateViews,
        removeFromTree = ob.removeFromTree;

    const SELECTED = "SELECTED",
        TEMP_MODEL = "RECORD_VIEW_MODEL";

    const OWNER = "OWNER",
        OBJ_NAME = "OBJ_NAME",
        TYPE = "TYPE";

    function toggleItem( item, show ) {
        if ( show ) {
            item.show();
        } else {
            item.hide();
        }
    }

    function cleanupIdentifier( itemName, value ) {
        // fix up column name replace spaces with underscore and remove double quote
        if ( value.includes( " " ) || value.includes( '"' ) ) {
            value = value.replaceAll( " ", "_" ).replaceAll( '"', "" );
            $s( itemName, value, null, true );
        }
        return value;
    }

    function escapeSqlString( str ) {
        return str.replaceAll( "'", "''" );
    }

    function updateSelectListOptions( item, selectId, list, currentValue ) {
        // load columns select list with the existing columns in the table
        // Note there is no select list item API to set the options so this is making assumptions
        // about the select list item markup which could break in the future.
        $( "#" + selectId ).html(
            util.applyTemplate( `{loop LIST/}\
<option value="&APEX$ITEM%return.">&APEX$ITEM%display.</option>\
{endloop/}`,
                {
                    extraSubstitutions: {LIST: list}
                } )
        );
        if ( currentValue ) {
            item.setValue( currentValue );
        }
    }

    function getItemDisplayValue( itemName ) {
        let item = apexItem( itemName );

        return item.displayValueFor( item.getValue() );
    }

    function refreshTree() {
        apexActions.invoke( "objects-refresh" );
    }

    // delete record from model m with record id given by the id
    function deleteRecord( m, id ) {
        let rec = m.getRecord( id );

        m.deleteRecords( [rec] );
    }

    /*
     * ================================
     * Dialogs
     * define the dialog definitions
     * ================================
     */

    initDialog( "dialogColumns", "P2000_SHOW_", {
        args: {
            columns: "COLUMNS"
            // todo consider checkboxes all, none
        },
        _resize: function( /*dlg$*/ ) {
            //xxx anything to do here? try to do it all with css
            //console.log("xxx dlg size", dlg$.width(), dlg$.height() );
        },
        initialize: function( dlg$ ) {
            // xxx anything to do here?
            dlg$.on( "dialogresizestop dialogopen", () => {
                this._resize( dlg$ );
            } );
        },
        open: function( dlg$, inputArgs ) {
            const columns = [],
                shown = [],
                args = this.args,
                cbGroup$ = $( "#" + args.columns ),
                grid$ = inputArgs.grid$,
                gridCols = grid$.grid( "getColumns" );

            // update checkbox list with grid columns
            for ( const c of gridCols ) {
                if ( c.canHide === undefined || c.canHide ) {
                    let colName = c.label || c.heading;

                    columns.push( colName );
                    if ( !c.hidden ) {
                        shown.push( colName );
                    }
                }
            }
            cbGroup$.html( util.applyTemplate( `{loop CHECKBOXES/}\
<div class="apex-item-option">\
  <input type="checkbox" id="P2000_SHOW_COLUMNS_&APEX$I." name="P1_CBGROUP" data-display="&APEX$ITEM." value="&APEX$ITEM.">\
  <label class="u-checkbox" for="P2000_SHOW_COLUMNS_&APEX$I.">&APEX$ITEM.</label>\
</div>{endloop/}`,
                {
                    extraSubstitutions: { CHECKBOXES: columns }
                } )
            );
            $s( args.columns, shown );
            // save the grid for onOk
            this._grid$ = grid$;
        },
        validate: function() {
            let args = this.args,
                cols = $v( args.columns );

            return cols.length > 0; // require at least one column
        },
        onOk: function() {
            let args = this.args;

            return new Promise( ( resolve ) => {
                let grid$ = this._grid$,
                    shown = apexItem( args.columns ).getValue(),
                    gridCols = grid$.grid( "getColumns" );

                this._grid$ = null;
                for ( const c of gridCols ) {
                    if ( c.canHide === undefined || c.canHide ) {
                        let colName = c.label || c.heading;

                        c.hidden = !shown.includes( colName );
                    }
                }
                grid$.grid( "refreshColumns" )
                    .grid( "refresh" );
                resolve( {} );
            } );
        }
    } );

    const filterModelName = "FilterModel";
    let gSelectColumnLabel = null; // null display value from server e.g. - Select Column -

    // todo consider moving this to widget.util as a general utility function
    let gAriaAlertMessageSpan$ = null;

    /**
     * A visually hidden alert utility.
     * Use when something has changed on the screen that is visually clear but would be missed by a screen reader user
     * and the message to say (about what happened) is not also visible on the screen.
     *
     * @ignore
     * @param {string} message the message to say. It should have no markup.
     */
    function ariaAlert( message ) {
        let alert$ = gAriaAlertMessageSpan$;

        if ( !alert$ || !alert$[0].isConnected ) {
            alert$ = $( `<span aria-hidden="true" class="u-vh" role="alert"></span>` );
            $( "body" ).append( alert$ );
            gAriaAlertMessageSpan$ = alert$;
        }
        alert$.text( "" );

        setTimeout( () => {
            alert$.attr( "aria-hidden", "false" ).text( message );
            setTimeout( () => {
                alert$.attr( "aria-hidden", "true" ).text( "" );
            }, 500 ); // give AT enough time to access message before removing it
        }, 0 );
    }

    initDialog( "dialogFilter", "P2000_FILTER_", {
        args: {
            // these all have a _XX suffix to be unique
            column: "COLUMN",
            op: "OP",
            value: "VALUE"
        },
        initialize: function( dlg$ ) {
            const row$ = dlg$.find( `.b-OB-addFilter` ).first(),
                rowTemplate = row$.html();

            this.formContainer$ = row$.parent(); // where to put the dynamic form
            this.filterModel = null; // create a model to hold filters when dialog opens
            this.columnOptions$ = null;
            // this is before the items are turned into a template so need the _XX suffix to extract the null option
            gSelectColumnLabel = apexItem( this.args.column + "_XX" ).element.find( "option" ).first().text();

            // Server adds one row of form items that is turned into a template
            // todo consider other ways to provide this as a template: template element region template or
            //  dynamic templates
            this.rowTemplate =
                `<div class="b-OB-addFilter" data-bind-record="&APEX$ID." role="group" aria-label='&ROW_LABEL.'>\
${rowTemplate.replaceAll( "_XX", "_&APEX$ID." )}</div>`;
            row$.remove();

            // cleanup the filter model and dynamic form on dialog close
            dlg$.on( "dialogclose", () => {
                apexModel.release( filterModelName );
                this.filterModel = null;
                this.formContainer$.empty();
            } );
            dlg$.find( ".js-add" ).on( "click", () => {
                let filterModel = this.filterModel,
                    lastIndex = filterModel.getTotalRecords( true ) - 1,
                    afterRec = filterModel.recordAt( lastIndex ),
                    newId = afterRec.id + 1;

                filterModel.insertNewRecord( null, afterRec, {id: newId, column: "", op: "", value: ""} );
                this.updateForm();
                this.formContainer$.find( ".b-OB-addFilter" ).last().find( "select" ).first().focus();
                ariaAlert( lang.getMessage( "OB.FILTER_ADDED" ) );
            } );
            dlg$.on( "click", ".js-remove", ( event ) => {
                let filterModel = this.filterModel,
                    row$ = $( event.target ).closest( ".b-OB-addFilter" ),
                    index = row$.parent().index( row$ ),
                    id = row$.attr( "data-bind-record" );

                if ( id ) {
                    let rec = filterModel.getRecord( id );

                    filterModel.deleteRecords( [rec] );
                    row$.remove();
                    if ( filterModel.getTotalRecords( true ) === 0 ) {
                        filterModel.insertNewRecord( null, null, {id: 1, column: "", op: "", value: ""} );
                    }
                    this.updateForm();
                    this.formContainer$.find( ".b-OB-addFilter" ).eq( index ).find( "select" ).first().focus();
                }
            } );
            // todo would like to use data binding for this but there are some aspects that are tricky
            //   including handling boolean attributes such as 'disabled' correctly
            dlg$.on( "change", ".js-filter-op", ( event ) => {
                const opSel$ = $( event.target ),
                    op = opSel$.val(),
                    row$ = opSel$.closest( ".b-OB-addFilter" ),
                    value$ = row$.find( "input" ).last();

                if ( op === "N" || op === "NN" ) {
                    value$.attr( "disabled", "disabled" );
                    value$.val( "" );
                } else {
                    value$.removeAttr( "disabled" );
                }
            } );
        },
        updateForm: function() {
            const options = {
                    iterationCallback: function( loopArg, model, record, index, placeholders, extraSubstitutions ) {
                        extraSubstitutions.ROW_LABEL = lang.formatMessage( "OB.FILTER_GROUP", "" + ( index + 1 ) );
                    }
                };
            let content$,
                // need to process all rows to keep the group label updated
                template = `{loop FilterModel/}${this.rowTemplate}{endloop/}`;

            this.formContainer$.empty();

            content$ = $( util.applyTemplate( template, options ) );
            this.formContainer$.append( content$ );
            content$.find( "select.filterColumns" ).each( ( i, el ) => {
                $( el ).html( this.columnOptions$.clone() );
            } );
            apexItem.attach( content$ );
            // todo remove this once selectList items auto initialize
            // don't need any of the fancy stuff in selectList item
            content$.find( "select" ).each( ( i, el ) => {
                apexItem.create( el.id, {} );
            } );
            apexBinding.applyBindings( this.formContainer$[0] );
            // todo think maybe applyBinding should take the initial value from 2 way bindings
            //  for now force a change
            content$.find( "select" ).trigger( "change" );
        },
        open: function( dlg$, inputArgs ) {
            const columns = [],
                filterData = [],
                grid$ = inputArgs.grid$,
                model = grid$.grid( "getModel" ),
                gridCols = grid$.grid( "getColumns" );

            // update checkbox list with grid columns
            columns.push( {
                display: gSelectColumnLabel,
                return: ""
            } );
            for ( const c of gridCols ) {
                if ( ( c.canHide || !c.hidden ) && !c.virtual && c.canFilter !== false ) {
                    let colName = c.label || c.heading;

                    columns.push( {
                        display: colName,
                        return: c.property
                    } );
                }
            }

            this.columnOptions$ = $(
                util.applyTemplate( `{loop LIST/}<option value="&APEX$ITEM%return.">&APEX$ITEM%display.</option>{endloop/}`,
                    {
                        extraSubstitutions: { LIST: columns }
                    } )
            );

            model.getOption( "fetchData" ).filters.forEach( ( f, i ) => {
                filterData.push( {
                    id: i + 1,
                    column: f.column,
                    op: f.op,
                    value: f.value
                } );
            } );

            this.filterModel = apexModel.create( filterModelName, {
                // default table of objects
                fields: {
                    id: {},
                    column: {},
                    op: {defaultValue: "EQ"},
                    value: {}
                },
                editable: true,
                trackChanges: false,
                identityField: "id",
                paginationType: "none"
            }, filterData, filterData.length );
            this.grid$ = grid$;
            this.model = model;

            if ( filterData.length === 0 ) {
                this.filterModel.insertNewRecord( null, null, {id: 1, column: "", op: "", value: ""} );
            }
            this.updateForm();
        },
        validate: function() {
            let valid = true;

            // Always valid when there is just one row so that the last filter can be cleared.
            if ( this.filterModel.getTotalRecords( true ) > 1 ) {
                // todo want data binding on input so that Apply button is enabled as soon as value is not empty
                //   for now just exclude checking the value
                this.filterModel.forEach( ( rec ) => {
                    const op = rec.op;

                    if ( !rec.column || !op /* || ( op !== "N" && op !== "NN" && !rec.value ) see todo above */ ) {
                        valid = false;
                    }
                } );
            }
            return valid;
        },
        onOk: function() {
            return new Promise( ( resolve ) => {
                let newFilters = [];

                this.filterModel.forEach( ( rec ) => {
                    let nullOp = ["N", "NN"].includes( rec.op );
                    if ( rec.column && rec.op && ( rec.value || nullOp ) ) {
                        newFilters.push( {
                            column: rec.column,
                            op: rec.op,
                            value: nullOp ? undefined : rec.value
                        } );
                    }
                } );
                this.model.getOption( "fetchData" ).filters = newFilters;
                this.model.clearData();
                resolve( {} );
            } );
        }
    } );

    initDialog( "dialogDropObject", "P2000_DROP_DLG_", {
        args: {
            owner: OWNER,
            type: "OBJ_TYPE",
            name: OBJ_NAME,
            cascade: "CASCADE"
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                cascade = apexItem( args.cascade );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            toggleItem( cascade, inputArgs.type === "TABLE" );
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                type = $v( args.type ).toLowerCase(),
                name = $v( args.name ),
                cascade = type === "table" ? $v( args.cascade ) === "Y" : false,
                valid = true; // always valid

            // syntax for environments is slightly different
            if ( type === "mle environment" ) {
                type = "mle env";
            }

            this.ddl = null;
            if ( valid ) {
                if ( type === "database link" ) {
                    // special case for database links. From the SQL language ref:
                    //  "... you cannot qualify dblink with the name of a schema, because periods are permitted
                    //  in names of database links ..."
                    this.ddl = `drop ${type} "${name}";`;
                } else {
                    this.ddl = `drop ${type} "${owner}"."${name}"${cascade ? " cascade constraints" : ""};`;
                }
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );
            p.then( ( { success } ) => {
                if ( success ) {
                    let type = $v( this.args.type );

                    if ( type === "PACKAGE BODY" ) {
                        // package body is special because from the UI perspective it is just one view
                        // of the combined package spec body "object". Just remove the editor text.
                        let objectInstance = getCurrentInstance(),
                            editor$ = objectInstance.tabPanel$.find( ".ob-view-BODY .ob-vtype-editor" );

                        editor$.codeEditor( "setValue", "" );
                    }
                    // Dropping an object could cause many things to be invalid so refresh the tree
                    refreshTree();
                }
            } );
            return p;
        }
    } );

    function formatDataType( dataType, length, lengthSemantics, precision, scale, ydPrecision ) {
        let result = dataType;

        switch ( dataType ) {
            case "VARCHAR2":
            case "CHAR":
            case "NCHAR":
            case "NVARCHAR2":
            case "RAW":
                if ( length ) {
                    let ls = "";

                    // lengthSemantics is "" or "BYTE" or "CHAR"
                    // but RAW, NCHAR, and NVARCHAR2 don't support length semantics
                    if ( dataType !== "RAW" && dataType[0] !== "N" && lengthSemantics ) {
                        ls = " " + lengthSemantics;
                    }
                    result += `(${length}${ls})`;
                } else {
                    // length is required we ignore the fact that it is not strictly required for NCHAR, CHAR
                    result = null;
                }
                break;
            case "NUMBER":
                if ( precision ) {
                    if ( scale ) {
                        result += `(${precision},${scale})`;
                    } else {
                        result += `(${precision})`;
                    }
                } else if ( scale ) {
                    // can't have scale with no precision
                    result = null;
                }
                break;
            case "FLOAT":
                if ( precision ) {
                    result += `(${precision})`;
                }
                break;
            case "INTERVAL YEAR TO MONTH":
                if ( ydPrecision ) {
                    result = result.split( " " ); // turn it into an array
                    result.splice( 2, 0, `(${ydPrecision})` ); // insert year precision
                    result = result.join( " " ); // turn it back into a string
                }
                break;
            case "INTERVAL DAY TO SECOND":
                if ( ydPrecision || precision ) {
                    result = result.split( " " ); // turn it into an array
                    if ( ydPrecision ) {
                        result.splice( 2, 0, `(${ydPrecision})` ); // insert day precision
                    }
                    if ( precision ) {
                        result.push( `(${precision})` ); // add frac seconds precision
                    }
                    result = result.join( " " ); // turn it back into a string
                }
                break;
            case "TIMESTAMP":
                if ( precision ) {
                    result += `(${precision})`;
                }
                break;
            case "TIMESTAMP WITH TIME ZONE":
            case "TIMESTAMP WITH LOCAL TIME ZONE":
                if ( precision ) {
                    result = result.split( " " ); // turn it into an array
                    result.splice( 1, 0, `(${precision})` ); // insert the precision
                    result = result.join( " " ); // turn it back into a string
                }
                break;
        }

        if ( result ) {
            // a space is allowed but the convention is to not have it
            result = result.replaceAll( " (", "(" );
        }
        return result;
    }

    initDialog( "dialogAddModCol", "P2000_ADDMODCOL_DLG_", {
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            columnName: "COL", // Column text field
            columns: "COLS", // Column select list
            dataType: "DATA_TYPE",
            fmtDataType: "FMT_DT", // formatted version of data type as stored in model
            length: "LENGTH",
            lengthSemantics: "CHAR_USED",
            ydPrecision: "YD_PREC", // interval year or day precision
            precision: "PRECISION", // number/float precision or fractional seconds precision
            scale: "SCALE",
            nullable: "NULL",
            colDefault: "DEFAULT",
            identity: "IDENTITY",
            hasIdentity: "HAS_IDTY"
        },
        hasSQL: true,
        initialize: function( dlg$ ) {
            const args = this.args,
                cursor = dlg$.find( "a-model-cursor" )[0],
                dataType = apexItem( args.dataType ),
                fmtDataType = apexItem( args.fmtDataType ),
                length = apexItem( args.length ),
                lengthSemantics = apexItem( args.lengthSemantics ),
                precision = apexItem( args.precision ),
                ydPrecision = apexItem( args.ydPrecision ),
                scale = apexItem( args.scale ),
                identity = apexItem( args.identity ),
                hasIdentity = apexItem( args.hasIdentity );

            this.add = false; // set on open from inputArgs

            // APEX doesn't support custom attributes on a hidden item and automatic binding has already happened by
            // now so use binding API to do: ab-item-value="=DATA_TYPE"
            apexBinding.bindExpression(
                {type: "item-value", element: fmtDataType.node, itemName: args.fmtDataType, storeElement: cursor },
                "=DATA_TYPE"
            );
            // fmtDataType is bound to the model DATA_TYPE field but there is a complex relationship between
            // fmtDataType dataType, precision and ydPrecision
            // The dataType and various values such as precision, length etc. are distinct except for
            // TIMESTAMP(p), TIMESTAMP(p) WITH TIME ZONE, TIMESTAMP(p) WITH LOCAL TIME ZONE,
            // INTERVAL YEAR(ydp) TO MONTH, INTERVAL DAY(ydp) TO SECOND(p)
            fmtDataType.element.on( "change", () => {
                let p = null,
                    ydp = null,
                    dtValue = fmtDataType.getValue();

                if ( dtValue.startsWith( "TIMESTAMP" ) ) {
                    // remove (n) and side effect setting precision to n.
                    dtValue = dtValue.replace( /\((\d+)\)/, ( m, p1 ) => {
                        if ( p1 ) {
                            p = p1;
                        }
                        return "";
                    } );
                } else if ( dtValue.startsWith( "INTERVAL" ) ) {
                    // remove (n) and side effect setting precision to n.
                    dtValue = dtValue.replace( /\((\d+)\)/g, ( m, p1 ) => {
                        if ( p1 ) {
                            if ( ydp === null ) {
                                ydp = p1;
                            } else {
                                p = p1;
                            }
                        }
                        return "";
                    } );
                }
                dataType.setValue( dtValue );
                // delay setting these fields until after the model data binding happens
                setTimeout( () => {
                    if ( p !== null ) {
                        precision.setValue( p );
                    }
                    if ( ydp ) {
                        ydPrecision.setValue( ydp );
                    }
                }, 0 );
            } );
            // update fmtDataType when dataType, precision (in some cases), or ydPrecision change
            dlg$.on( "change", `#${args.dataType},#${args.precision},#${args.ydPrecision}`, ( event ) => {
                let newValue,
                    dtValue = dataType.getValue();

                if ( dtValue.startsWith( "TIMESTAMP" ) || dtValue.startsWith( "INTERVAL" ) ) {
                    newValue = formatDataType( dtValue, null, null,
                        precision.getValue(), null, ydPrecision.getValue() );
                } else if ( event.target === dataType.node ) {
                    newValue = dtValue;
                }
                if ( newValue != null ) {
                    fmtDataType.setValue( newValue, null, true ); // no change event
                }
            } );

            // Length (a.k.a size) visible when data type is in VARCHAR2, CHAR, NCHAR, NVARCHAR2, RAW
            // todo min is 1 max is ? for RAW, 2000 for CHAR, 1000 or 2000 for NCHAR (national character set),
            //     32767 or 4000 for VARCHAR2 (MAX_STRING_SIZE)
            //     16383 or 32767 or 2000 or 4000 (national character set, MAX_STRING_SIZE)
            apexBinding.bind(
                {type: "visible", element: length.node },
                [{type: "item", name: args.dataType}],
                () => {
                    return ["VARCHAR2", "CHAR", "NCHAR", "NVARCHAR2", "RAW"].includes( dataType.getValue() );
                }
            );
            // (Length) Semantics visible when data type is in VARCHAR2, CHAR
            apexBinding.bind(
                {type: "visible", element: lengthSemantics.node },
                [{type: "item", name: args.dataType}],
                () => {
                    return ["VARCHAR2", "CHAR"].includes( dataType.getValue() );
                }
            );
            // Precision visible when data type is in NUMBER, TIMESTAMP *, FLOAT, INTERVAL DAY TO SECOND
            // todo range 1 to 126?
            apexBinding.bind(
                {type: "visible", element: precision.node },
                [{type: "item", name: args.dataType}],
                () => {
                    return ["NUMBER", "FLOAT", "INTERVAL DAY TO SECOND", "TIMESTAMP",
                        "TIMESTAMP WITH TIME ZONE",
                        "TIMESTAMP WITH LOCAL TIME ZONE"].includes( dataType.getValue() );
                }
            );
            // Scale visible when data type is NUMBER
            // todo? range -84 to 127
            apexBinding.bind(
                {type: "visible", element: scale.node },
                [{type: "item", name: args.dataType}],
                () => {
                    return dataType.getValue() === "NUMBER";
                }
            );
            // Interval year/day precision visible when data type is INTERVAL YEAR TO MONTH or INTERVAL DAY TO SECOND
            apexBinding.bind(
                {type: "visible", element: ydPrecision.node },
                [{type: "item", name: args.dataType}],
                () => {
                    return ["INTERVAL YEAR TO MONTH", "INTERVAL DAY TO SECOND"].includes( dataType.getValue() );
                }
            );
            // Identity only shown if don't already have identity and only if data type is number
            apexBinding.bind(
                {type: "visible", element: identity.node },
                [{type: "item", name: args.dataType},
                    {type: "item", name: args.hasIdentity}],
                () => {
                    return dataType.getValue() === "NUMBER" && hasIdentity.getValue() !== "Y";
                }
            );

            dlg$.on( "dialogclose", () => {
                // Because this dialog is used for both add and modify and only want the
                // cursor record-id bound for modify need to remove it when the dialog closes otherwise
                // next time it opens for add it can get populated with the previous data
                apexBinding.unbind( {
                    type: "attribute",
                    element: cursor,
                    attribute: "record-id"
                } );
            } );
        },
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                cursor = dlg$.find( "a-model-cursor" )[0],
                model = inputArgs.model,
                columns = apexItem( args.columns ),
                column = apexItem( args.columnName );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.add = inputArgs.add;
            this.model = model;

            // for add show column text field, for modify show select list of columns
            toggleItem( columns, !inputArgs.add );
            toggleItem( column, inputArgs.add );

            cursor.modelId = model.modelId();

            if ( inputArgs.add ) {
                // For add, the cursor has no record but the items are still bound to the model and will
                // be initialized with "". Binding is async so after yielding set the default for nullable
                setTimeout( () => {
                    apexItem( args.nullable ).setValue( "Y" ); // for new columns default to allow nulls
                }, 0 );
            } else {
                updateSelectListOptions( columns, args.columns, inputArgs.columns, inputArgs.currentColumn );
                // todo would like to use bindExpression but the data ref for item P2000_ADDMODCOL_DLG_COLS gets confused as a model field
                apexBinding.bind( {
                        type: "attribute",
                        element: cursor,
                        attribute: "record-id"
                    }, [
                    {
                        type: "item",
                        name: args.columns
                    }], ( esc, args ) => {
                        return apexItem( args[0].name ).getValue();
                    } );
            }
        },
        validate: function( dlg$, change ) {
            const args = this.args,
                op = this.add ? "add" : "modify",
                cursor = dlg$.find( "a-model-cursor" )[0];
            let nullClause = "",
                identityClause = "",
                defaultClause = "",
                dataType = $v( args.dataType ),
                length = $v( args.length ),
                lengthSemantics = $v( args.lengthSemantics ),
                precision = $v( args.precision ),
                ydPrecision = $v( args.ydPrecision ),
                scale = $v( args.scale ),
                owner = $v( args.owner ),
                name = $v( args.name ),
                columnName = $v( this.add ? args.columnName : args.columns ),
                nullable = $v( args.nullable ) === "Y",
                hasIdentity = $v( args.hasIdentity ),
                identity = $v( args.identity ),
                colDefault = $v( args.colDefault ),
                dataTypeString = formatDataType( dataType, length, lengthSemantics, precision, scale, ydPrecision ),
                valid = true; // assume valid

            if ( !owner || !name || !columnName || !dataTypeString ) {
                valid = false;
            }
            if ( !this.add ) {
                columnName = getItemDisplayValue( args.columns );
            }

            this.ddl = null;
            if ( valid ) {
                if ( this.add ) {
                    if ( change ) {
                        columnName = cleanupIdentifier( args.columnName, columnName );
                    }

                    if ( !nullable ) {
                        nullClause = " not null";
                    }
                } else if ( cursor.getCurrentRecord() ) {
                    let prevNullable = this.model.getValue( cursor.getCurrentRecord(), "NULLABLE" ) === "Y";

                    if ( nullable !== prevNullable ) {
                        nullClause = nullable ? " null" : " not null";
                    }
                }
                // identity is only supported for add column and only if don't already have an identity col
                if ( dataType === "NUMBER" && hasIdentity !== "Y" && this.add && identity === "Y" ) {
                    identityClause = ` generated by default on null as identity`;
                }
                if ( colDefault ) {
                    defaultClause = ` default ${colDefault}`;
                }
                this.ddl = `alter table "${owner}"."${name}" ${op}
("${columnName}" ${dataTypeString}${defaultClause}${identityClause}${nullClause});`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                dataType = $v( args.dataType ),
                isIdentityCol = this.ddl.includes( "as identity" ),
                cursor = dlg$.find( "a-model-cursor" )[0],
                p = sendDDL( this.schema, $v( args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    // update the columns model
                    if ( this.add ) {
                        let lastRec, newRec,
                            m = cursor.getModel(),
                            maxColumnId = -1;

                        m.forEach( ( rec, index, id ) => {
                            let colId = parseFloat( id );
                            if ( colId > maxColumnId ) {
                                maxColumnId = colId;
                            }
                        } );
                        lastRec = m.recordAt( m.getTotalRecords( true ) - 1 );

                        newRec = Array(12).fill( "", 0, 12);
                        newRec[0] = "" + ( maxColumnId + 1 );
                        m.insertNewRecord( null, lastRec, newRec );
                        cursor.recordId = newRec[0];
                    }
                    // one small fix up needed before storing the form fields back to the model
                    if ( dataType.startsWith( "INTERVAL" ) || dataType.startsWith( "TIMESTAMP" ) ) {
                        apexItem( args.precision ).setValue( "", null, true ); // no change event
                    }
                    cursor.store();

                    invalidateViews( this.objId, ["DATA", "INDEXES", "CONSTRAINTS", "STATS", "DDL"],
                        ["INDEX", "TRIGGERS"] );
                    if ( isIdentityCol ) {
                        // Setting a column to be an identity column forces not null
                        // It also adds a default that we can't know. So must refresh the columns grid
                        cursor.getModel().clearData();
                        // If identity changed need to refresh tree because sequence is added todo is the sequence even shown?
                        refreshTree();
                    }
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDropRenameCol", "P2000_RENDROPCOL_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            column: "COLS", // Column select list
            columnNew: "COL_REN", // new name
        },
        hasSQL: true,
        initialize: function( dlg$ ) {
            let args = this.args,
                cursor = dlg$.find( "a-model-cursor" )[0];

            this.rename; // set on open from inputArgs

            // only needed for the rename case but no harm in having it always
            // todo think do we want the new column name to always default to blank? If so how do we do that with binding.
            apexBinding.bind( {
                type: "attribute",
                element: cursor,
                attribute: "record-id"
            }, [
                {
                    type: "item",
                    name: args.column
                }], ( esc, args ) => {
                return apexItem( args[0].name ).getValue();
            } );
        },
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                cursor = dlg$.find( "a-model-cursor" )[0],
                column = apexItem( args.column ),
                columnNew = apexItem( args.columnNew );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.rename = inputArgs.rename;
            this.model = inputArgs.model;

            cursor.modelId = this.model.modelId();

            // for add show column text field, for modify show select list of columns
            toggleItem( columnNew, inputArgs.rename );
            updateSelectListOptions( column, args.column, inputArgs.columns, inputArgs.currentColumn );
        },
        validate: function( dlg$, change ) {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                columnName = getItemDisplayValue( args.column ),
                newColumnName = this.rename ? $v( args.columnNew ) : null,
                valid = true; // assume valid

            if ( !owner || !name || !columnName || ( this.rename && !newColumnName ) ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `alter table "${owner}"."${name}" `;
                if ( this.rename ) {
                    if ( change ) {
                        newColumnName = cleanupIdentifier( args.columnNew, newColumnName );
                    }
                    this.ddl += `rename column\n"${columnName}" to "${newColumnName}";`;
                } else {
                    this.ddl += `drop column "${columnName}";`;
                }
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const cursor = dlg$.find( "a-model-cursor" )[0],
                p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    if ( this.rename ) {
                        cursor.store();
                    } else {
                        deleteRecord( this.model, $v( this.args.column ) );
                    }

                    invalidateViews( this.objId, ["DATA", "INDEXES", "CONSTRAINTS", "STATS", "DEPS", "DDL"],
                        this.rename ? ["INDEX", "TRIGGERS"] : null );
                    // Dropping a column that has an index or trigger removes those things from the tree
                    // We may not yet know if or what specific index or trigger may be removed.
                    // Also dropping or renaming a column can invalidate views, procedures etc.
                    refreshTree(); // so refresh the tree
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogRenameTable", "P2000_RENTABLE_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            nameNew: "TAB_REN",
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
        },
        validate: function( dlg$, change ) {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                nameNew = $v( args.nameNew ),
                valid = true; // assume valid

            if ( !owner || !name || !nameNew ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                if ( change ) {
                    nameNew = cleanupIdentifier( args.nameNew, nameNew );
                }
                this.ddl = `alter table "${owner}"."${name}" rename
to "${nameNew}";`; // can't specify owner on the new table name.
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            let args = this.args;
            const p = sendDDL( this.schema, $v( args.owner ), this.ddl, dlg$ );
            p.then( ( { success } ) => {
                if ( success ) {
                    const nameNew = $v( args.nameNew ),
                        docDesc = getCurrentInstance(); // this shouldn't have changed while dialog is open

                    // when a table is renamed many objects can become invalid so refresh the tree
                    refreshTree();
                    // the tab also needs to be renamed
                    docDesc.name = nameNew;
                    docDesc.title = docDesc.path + nameNew;
                    ob.doc.renameDocument( docDesc );
                    invalidateViews( this.objId, null, ["INDEX", "TRIGGER", "TABLE", "VIEW", "SYNONYM"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogComment", "P2000_COMMENT_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            tabOrCol: "OBJ_COL",
            columns: "COLS",
            comment: "COMMENT",
            type: TYPE
        },
        hasSQL: true,
        initialize: function( dlg$ ) {
            let args = this.args,
                cursor = dlg$.find( "a-model-cursor" )[0],
                columns = apexItem( args.columns ),
                tabOrCol = apexItem( args.tabOrCol );

            // can't [easily?] put markup in a radio group LOV so add the binding here
            // this makes assumptions about the radio group markup; that the label follows the input
            tabOrCol.element.find( "input[value='T']" ).next().attr( "ab-text", `=${args.type}` );
            apexBinding.applyBindings( tabOrCol.node );

            // Show columns select list when column radio button Page 2000 has this:
            // ab-visible="{case P2000_COMMENT_DLG_OBJ_COL/}{when C/}V{otherwise/}H{endcase/}"
            // todo the above stopped working as soon as a model cursor was associated with this form.
            //     figure out how to fix this but for now remove and add our own binding
            apexBinding.unbind( { type: "visible", element: columns.node } );
            apexBinding.bind(
                {type: "visible", element: columns.node },
                [{type: "item", name: args.tabOrCol}],
                () => {
                    return tabOrCol.getValue() === "C" ? "V" : "H";
                }
            );

            // only needed for the column case but no harm in having it always
            // todo think do we want the new comment to always default to blank? If so how do we do that with binding.
            //  if not then probably need a new model so that changes to the comment are not lost as you move around
            apexBinding.bind( {
                type: "attribute",
                element: cursor,
                attribute: "record-id"
            }, [
                {
                    type: "item",
                    name: args.columns
                }], ( esc, args ) => {
                return apexItem( args[0].name ).getValue();
            } );

            tabOrCol.element.on( "change", () => {
                let value = tabOrCol.getValue(),
                    recId, curModel;

                if ( value === "C" ) {
                    curModel = this.model;
                    recId = columns.getValue();
                } else {
                    curModel = this.objModel;
                    recId = "0";
                }

                if ( value && curModel ) {
                    cursor.modelId = curModel.modelId();
                    cursor.recordId = recId;
                }
            } );
        },
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                tabOrCol = apexItem( args.tabOrCol ),
                columns = apexItem( args.column ),
                type = apexItem( args.type );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.objectType = inputArgs.objectType;
            this.model = inputArgs.model; // for MAIN_COLS
            this.objModel = inputArgs.objModel; // for MAIN_SUMMARY
            type.setValue( typeDisplayName( this.objectType ) );

            // default to table always
            tabOrCol.setValue( "T" );

            updateSelectListOptions( columns, args.columns, inputArgs.columns, inputArgs.currentColumn );
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                columnComment = $v( args.tabOrCol ) === "C",
                columnName = getItemDisplayValue( args.columns ),
                comment = escapeSqlString( $v( args.comment ) ),
                valid = true; // assume valid

            if ( !owner || !name || ( columnComment && !columnName ) ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                let columnPart = "",
                    type = this.objectType.toLowerCase().replace( "_", " " );

                if ( columnComment ) {
                    type = "column";
                    columnPart = `."${columnName}"`;
                } else if ( type === "view" ) {
                    type = "table";
                }
                this.ddl = `comment on ${type} "${owner}"."${name}"${columnPart}
is '${comment}';`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                columnComment = $v( args.tabOrCol ) === "C",
                cursor = dlg$.find( "a-model-cursor" )[0],
                p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    cursor.store(); // which model to store is already set on the cursor
                    // refresh data view to get updated column comment in tooltip
                    invalidateViews( this.objId, columnComment ? ["DATA", "DDL"] : ["DDL"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogCopyTable", "P2000_COPYTABLE_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            nameNew: "TAB_NEW",
            chooseCols: "CHOOSE_COL",
            columns: "COLUMNS",
            chooseRows: "ROWS",
            where: "WHERE"
        },
        hasSQL: true,
        initialize: function() {
            let args = this.args,
                chooseCols = apexItem( args.chooseCols ),
                columns = apexItem( args.columns ),
                chooseRows = apexItem( args.chooseRows ),
                where = apexItem( args.where );

            // show Columns shuttle when choose columns is SELECTED
            apexBinding.bind(
                {type: "visible", element: columns.node},
                [{type: "item", name: args.chooseCols}],
                () => {
                    return chooseCols.getValue() === SELECTED;
                }
            );
            // show Where when choose columns is SELECTED
            apexBinding.bind(
                {type: "visible", element: where.node},
                [{type: "item", name: args.chooseRows}],
                () => {
                    return chooseRows.getValue() === SELECTED;
                }
            );
        },
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                chooseCols = apexItem( args.chooseCols ),
                columns = apexItem( args.columns ),
                chooseRows = apexItem( args.chooseRows );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;

            chooseCols.setValue( "ALL" );
            chooseRows.setValue( "NONE" );
            columns.setValue( [] ); // must clear this before adding columns

            updateSelectListOptions( columns, args.columns + "_LEFT", inputArgs.columns );
            // The rest button won't work because the options are set here so hide it.
            $( "#" + args.columns + "_RESET" ).hide();
        },
        validate: function( dlg$, change ) {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                nameNew = $v( args.nameNew ),
                where = $v( args.where ),
                columns = $v2( args.columns ), // $v2 because want the array
                chooseCols = $v( args.chooseCols ),
                chooseRows = $v( args.chooseRows ),
                valid = true; // assume valid

            if ( !owner || !name || !nameNew ||
                    ( chooseCols === SELECTED && columns.length === 0 ) ||
                    ( chooseRows === SELECTED && !where ) ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                let colList = "*",
                    whereClause = "";

                if ( chooseRows === "NONE" ) {
                    whereClause = "\nwhere 1=2";
                } else if ( chooseRows === SELECTED ) {
                    whereClause = `\nwhere ${where}`;
                }
                if ( chooseCols === SELECTED ) {
                    colList = columns.map( v => apexItem( args.columns ).displayValueFor( v ) );
                    // quote all the columns
                    colList = '"' + colList.join( '", "' ) + '"';
                }
                if ( change ) {
                    nameNew = cleanupIdentifier( args.nameNew, nameNew );
                }
                this.ddl = `create table "${owner}"."${nameNew}" as
select ${colList}
from "${owner}"."${name}"${whereClause};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );
            p.then( ( { success } ) => {
                if ( success ) {
                    // don't know what the object id is for the newly created table so need to
                    // refresh the tree
                    refreshTree();
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogTruncateTable", "P2000_TRUNCTABLE_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                valid = true; // assume valid

            if ( !owner || !name ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `truncate table "${owner}"."${name}";`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );
            p.then( ( { success } ) => {
                if ( success ) {
                    invalidateViews( this.objId, ["DATA"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDropIndex", "P2000_DROPIDX_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            index: "INDEX"
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                index = apexItem( args.index );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            updateSelectListOptions( index, args.index, inputArgs.indexes, inputArgs.currentIndex );
        },
        validate: function() {
            const args = this.args;
            let index = getItemDisplayValue( args.index ),
                valid = true; // assume valid

            if ( !index ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `drop index "${index}";`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                objId = $v( args.index ),
                p = sendDDL( this.schema, $v( args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    deleteRecord( this.model, objId );
                    removeFromTree( objId );
                }
            } );
            return p;
        }
    } );

    $( () => {
        // ab-visible binding doesn't work on items where the element with item id isn't the item element.
        // so bind the shuttles and radio group here before the dialogs are initialized and bindings applied
        $( "#P2000_ADDCON_DLG_CASCADE, #P2000_ADDCON_DLG_FK_COL, #P2000_ADDCON_DLG_FK_COLS2" )
            .attr( "ab-visible", "{case P2000_ADDCON_DLG_TYPE/}{when FOREIGN KEY/}V{otherwise/}H{endcase/}" );
    } );

    initDialog( "dialogAddConstraint", "P2000_ADDCON_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            constraint: "CONSTRAINT", // the name
            type: TYPE, // CHECK, FOREIGN KEY, PRIMARY KEY, UNIQUE
            // when type = check
            conditionCol: "CON_COL",
            conditionExp: "CHECK_CON",
            // when type = foreign key
            cascade: "CASCADE",
            fkPopulate: "POP_FK", // hidden. controls loading of FK_TAB
            fkCol: "FK_COL",
            fkTab: "FK_TAB",
            fkTabCols: "FK_COLS2",
            // when type = primary key
            pkCol1: "PK_COL1",
            pkCol2: "PK_COL2",
            pkCol3: "PK_COL3",
            // when type = unique
            ukCol1: "UK_COL1",
            ukCol2: "UK_COL2",
            ukCol3: "UK_COL3",
        },
        hasSQL: true,
        updateActions: true,
        initialize: function() {
            let args = this.args,
                type = apexItem( args.type ),
                fkPopulate = apexItem( args.fkPopulate );

            type.element.on( "change", () => {
                if ( type.getValue() === "FOREIGN KEY" && fkPopulate.getValue() !== "Y" ) {
                    fkPopulate.setValue( "Y" );
                }
            } );
        },
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                objectInstance = getCurrentInstance(),
                constraint = apexItem( args.constraint ),
                conditionCol = apexItem( args.conditionCol ),
                pkCol1 = apexItem( args.pkCol1 ),
                pkCol2 = apexItem( args.pkCol2 ),
                pkCol3 = apexItem( args.pkCol3 ),
                ukCol1 = apexItem( args.ukCol1 ),
                ukCol2 = apexItem( args.ukCol2 ),
                ukCol3 = apexItem( args.ukCol3 );
            let mainColsModel = objectInstance.models.get( "MAIN_COLS" );

            function updateColumns() {
                const columns = [];

                // get this again because it may have come into existence from loadViewData
                mainColsModel = objectInstance.models.get( "MAIN_COLS" );
                let columnIndex = mainColsModel.getFieldKey( "COLUMN_NAME" );

                columns.push( {
                    display: gSelectColumnLabel,
                    return: ""
                } );
                mainColsModel.forEach( ( rec ) => {
                    let name = rec[columnIndex];

                    columns.push( {
                        display: name,
                        return: name
                    } );
                } );

                updateSelectListOptions( conditionCol, args.conditionCol, columns );
                // This is part of a shuttle, makes assumption of shuttle DOM structure.
                // Ok for item to be null because never set the current selection
                // don't include the "null" choice here
                updateSelectListOptions( null, "P2000_ADDCON_DLG_FK_COL_LEFT", columns.slice( 1 ) );
                updateSelectListOptions( pkCol1, args.pkCol1, columns );
                updateSelectListOptions( pkCol2, args.pkCol2, columns );
                updateSelectListOptions( pkCol3, args.pkCol3, columns );
                updateSelectListOptions( ukCol1, args.ukCol1, columns );
                updateSelectListOptions( ukCol2, args.ukCol2, columns );
                updateSelectListOptions( ukCol3, args.ukCol3, columns );
            }

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            constraint.setValue( inputArgs.name + "_CON" );

            // get table columns
            if ( mainColsModel && mainColsModel.getTotalRecords( true ) > 0 ) {
                // the main view has already been visited so can already updateColumns
                updateColumns();
            } else {
                // the main view has not been visited yet so explicitly get the data for the columns
                // then updateColumns
                objectInstance.loadViewData( "MAIN", dlg$, updateColumns );
            }
        },
        validate: function() {
            const args = this.args;
            let expr,
                owner = $v( args.owner ),
                name = $v( args.name ),
                constraint = getItemDisplayValue( args.constraint ),
                type = $v( args.type ),
                valid = true; // assume valid

            if ( !owner || !name || !constraint ) {
                valid = false;
            } else {
                if ( type === "CHECK" ) {
                    let conditionCol = $v( args.conditionCol ),
                        conditionExp = $v( args.conditionExp );

                    if ( conditionCol && conditionExp ) {
                        expr = `check ( "${conditionCol}" ${conditionExp} )`;
                    } else {
                        valid = false;
                    }
                } else if ( type === "FOREIGN KEY" ) {
                    let cascade = $v( args.cascade ).toLowerCase(),
                        fkCol = $v2( args.fkCol ),
                        fkTab = $v( args.fkTab ),
                        fkTabCols = $v2( args.fkTabCols );

                    if ( fkCol.length > 0 && fkTab && fkTabCols.length > 0 ) {
                        if ( cascade ) {
                            cascade = " " + cascade;
                        }
                        expr = `foreign key ( "${fkCol.join( '", "' )}" ) references "${fkTab}" ( "${fkTabCols.join( '", "' )}" )${cascade}`;
                    } else {
                        valid = false;
                    }
                } else if ( type === "PRIMARY KEY" ) {
                    let colList = [],
                        pkCol1 = $v( args.pkCol1 ),
                        pkCol2 = $v( args.pkCol2 ),
                        pkCol3 = $v( args.pkCol3 );

                    if ( pkCol1 ) {
                        colList.push( `"${pkCol1}"` );
                        if ( pkCol2 ) {
                            colList.push( `"${pkCol2}"` );
                        }
                        if ( pkCol3 ) {
                            colList.push( `"${pkCol3}"` );
                        }
                        expr = `primary key ( ${colList.join( ", " )} )`;
                    } else {
                        valid = false;
                    }
                } else if ( type === "UNIQUE" ) {
                    let colList = [],
                        ukCol1 = $v( args.ukCol1 ),
                        ukCol2 = $v( args.ukCol2 ),
                        ukCol3 = $v( args.ukCol3 );

                    if ( ukCol1 ) {
                        colList.push( `"${ukCol1}"` );
                        if ( ukCol2 ) {
                            colList.push( `"${ukCol2}"` );
                        }
                        if ( ukCol3 ) {
                            colList.push( `"${ukCol3}"` );
                        }
                        expr = `unique ( ${colList.join( ", " )} )`;
                    } else {
                        valid = false;
                    }
                } else {
                    valid = false;
                }
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `alter table "${owner}"."${name}" add constraint
"${constraint}" ${expr};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    this.model.clearData();
                    invalidateViews( this.objId, ["MAIN", "INDEXES", "DEPS", "DDL"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDropConstraint", "P2000_DROPCON_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            constraint: "CONSTRAINT"
        },
        hasSQL: true,
        updateActions: true,
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                constraint = apexItem( args.constraint );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            updateSelectListOptions( constraint, args.constraint, inputArgs.constraints, inputArgs.currentConstraint );
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                constraint = getItemDisplayValue( args.constraint ),
                valid = true; // assume valid

            if ( !owner || !name || !constraint ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `alter table "${owner}"."${name}" drop constraint
${constraint};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                objId = $v( args.constraint ),
                p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    deleteRecord( this.model, objId );
                    invalidateViews( this.objId, ["MAIN", "DATA", "DEPS", "DDL"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogEnDisConstraint", "P2000_ENDISCON_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            constraint: "CONSTRAINT"
        },
        hasSQL: true,
        updateActions: true,
        titleIsTemplate: true,
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                constraint = apexItem( args.constraint );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;
            this.enable = inputArgs.enable;

            updateSelectListOptions( constraint, args.constraint, inputArgs.constraints, inputArgs.currentConstraint );
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                constraint = getItemDisplayValue( args.constraint ),
                action = this.enable ? "enable" : "disable",
                valid = true; // assume valid

            if ( !owner || !name || !constraint ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `alter table "${owner}"."${name}" ${action} constraint
${constraint};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                p = sendDDL( this.schema, $v( args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    let m = this.model,
                        rec = m.getRecord( $v( args.constraint ) );

                    m.setValue( rec, "STATUS", this.enable ? "ENABLED" : "DISABLED" );
                    invalidateViews( this.objId, ["MAIN", "DATA", "DEPS", "DDL"] );
                }
            } );
            return p;
        }
    } );

    const procPrivs = ["DEBUG", "EXECUTE"],
        privsByObjectType = {
            TABLE: ["ALTER", "DEBUG", "DELETE", "INDEX", "INSERT", "READ", "REFERENCES", "SELECT", "UPDATE"],
            VIEW: ["DEBUG","DELETE", "INSERT", "MERGE VIEW", "READ", "REFERENCES",  "SELECT", "UNDER", "UPDATE"],
            SEQUENCE: ["ALTER", "KEEP SEQUENCE", "SELECT"],
            TYPE: ["DEBUG", "EXECUTE", "UNDER"],
            PACKAGE: procPrivs,
            FUNCTION: procPrivs,
            PROCEDURE: procPrivs,
            MATERIALIZED_VIEW: ["ON COMMIT REFRESH", "QUERY REWRITE", "READ", "SELECT"],
            MLE_ENVIRONMENT: ["EXECUTE"],
            MLE_MODULE: ["EXECUTE"]
        };

    function makeCheckboxTemplate( el$, id ) {
        let cbTemplate = el$.find( `#${id} .apex-item-grid-row` ).html();

        // server adds just one checkbox that is turned into a template
        cbTemplate = `<div class="apex-item-grid-row">{loop LIST/}\
${cbTemplate.replaceAll( "-R-", "&APEX$ITEM%return." ).replaceAll( "-D-", "&APEX$ITEM%display." ).replaceAll( /_\d+"/g, "_&APEX$I.\"" )}\
{if =APEX$ITEM%newrow/}</div><div class="apex-item-grid-row">{endif/}{endloop/}`;
        return cbTemplate;
    }

    function handlePrivsAllCheckbox( inst, grant ) {
        inst.all = false;
        grant.element.on( "change", () => {
            let privs = grant.getValue();

            if ( privs.includes( "ALL" ) ) {
                if ( inst.all && privs.length > 1 ) {
                    // all is first choice, remove it
                    privs.shift();
                    inst.all = false;
                    grant.setValue( privs, null, true );
                } else if ( !inst.all ) {
                    inst.all = true;
                    if ( privs.length > 1 ) {
                        privs = ["ALL"]; // remove any others
                        grant.setValue( privs, null, true );
                    }
                }
            } else {
                inst.all = false;
            }
        } );
    }

    initDialog( "dialogGrant", "P2000_GRANT_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            grantee: "GRANTEE",
            grant: "GRANT",
            option: "OPTION",
            type: TYPE
        },
        hasSQL: true,
        initialize: function( dlg$ ) {
            const args = this.args,
                grant = apexItem( args.grant );

            this.cbTemplate = makeCheckboxTemplate( dlg$, args.grant );

            handlePrivsAllCheckbox( this, grant );
        },
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                type = apexItem( args.type );
            let privs,
                objectType = inputArgs.objectType;

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.objectType = objectType;
            this.model = inputArgs.model;
            type.setValue( typeDisplayName( objectType ) );

            privs = privsByObjectType[objectType].map( ( p, i ) => { return {
                return: p,
                display: p,
                newrow: i % 2 ? "Y" : "N"
            }; } );
            privs.unshift( {return: "ALL", display:"ALL", newrow: "Y"} );

            this.all = false;
            $( "#" + args.grant + " .apex-item-grid" ).html(
                util.applyTemplate( this.cbTemplate,
                    {
                        extraSubstitutions: {LIST: privs}
                    } )
            );

        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                grantee = $v( args.grantee ),
                grant = $v2( args.grant ),
                withGrantOptionClause = $v( args.option ) === "Y" ? " with grant option" : "",
                valid = true; // assume valid

            if ( !owner || !name || !grantee || grant.length === 0 ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `grant ${grant.join( ", " )} on "${owner}"."${name}" to ${grantee}${withGrantOptionClause};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    this.model.clearData(); // refresh the view data
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogRevoke", "P2000_REVOKE_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            grantee: "GRANTEE", // select list
            grant: "GRANT", // checkboxes
            type: TYPE
        },
        hasSQL: true,
        gatherPrivsFor: function( granteeFor ) {
            const args = this.args,
                m = this.model;
            let privs = [],
                index = 0;

            if ( !m ) {
                return;
            } // else
            m.forEach( rec => {
                let g = m.getValue( rec, "GRANTEE" );

                if ( g === granteeFor ) {
                    let p = m.getValue( rec, "PRIVILEGE" );

                    privs.push( {
                        return: p,
                        display: p,
                        newrow: index % 2 ? "Y" : "N"
                    } );
                    index += 1;
                }
            } );
            privs.unshift( {return: "ALL", display:"ALL", newrow: "Y"} );

            $( "#" + args.grant + " .apex-item-grid" ).html(
                util.applyTemplate( this.cbTemplate,
                    {
                        extraSubstitutions: {LIST: privs}
                    } )
            );

        },
        initialize: function( dlg$ ) {
            const args = this.args,
                grantee = apexItem( args.grantee );

            this.cbTemplate = makeCheckboxTemplate( dlg$, args.grant );

            grantee.element.on( "change", () => {
                this.gatherPrivsFor( grantee.getValue() );
            } );
        },
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                grantee = apexItem( args.grantee ),
                grant = apexItem( args.grant ),
                type = apexItem( args.type ),
                uniqueGrantees = new Set();
            let m,
                list = [];

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.objectType = inputArgs.objectType;
            m = this.model = inputArgs.model;
            type.setValue( typeDisplayName( this.objectType ) );

            // clear grant checkboxes
            grant.setValue( [] );

            // gather the grantees from the model
            m.forEach( rec => {
                let g = m.getValue( rec, "GRANTEE" );

                if ( !uniqueGrantees.has( g ) ) {
                    list.push( {display: g, return: g} );
                    uniqueGrantees.add( g );
                }
            } );
            updateSelectListOptions( grantee, args.grantee, list );
            this.gatherPrivsFor( grantee.getValue() );
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                grantee = $v( args.grantee ),
                grant = $v2( args.grant ),
                valid = true; // assume valid

            if ( !owner || !name || !grantee || grant.length === 0 ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `revoke ${grant.join( ", " )} on "${owner}"."${name}" from ${grantee}`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    this.model.clearData(); // refresh the view data
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDropTrigger", "P2000_DROPTRIG_DLG_",{
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            trigger: "TRIGGER"
        },
        hasSQL: true,
        updateActions: true,
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                trigger = apexItem( args.trigger );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            updateSelectListOptions( trigger, args.trigger, inputArgs.triggers, inputArgs.currentTrigger );
        },
        validate: function() {
            const args = this.args;
            let trigger = getItemDisplayValue( args.trigger ),
                valid = true; // assume valid

            if ( !trigger ) {
                valid = false;
            }

            this.ddl = null;
            if ( valid ) {
                this.ddl = `drop trigger "${trigger}";`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                objId = $v( args.trigger ),
                p = sendDDL( this.schema, $v( args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    deleteRecord( this.model, objId );
                    removeFromTree( objId );
                    invalidateViews( this.objId, ["DEPS"] );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogEnDisTrigger", "P2000_ENDIS_DLG_", {
        args: {
            owner: OWNER,
            name: OBJ_NAME,
            trigger: "TRIGGER"
        },
        titleIsTemplate: true,
        updateActions: true,
        open: function( dlg$, inputArgs ) {
            const args = this.args,
                trigger = apexItem( args.trigger );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;
            this.enable = inputArgs.enable;

            updateSelectListOptions( trigger, args.trigger, inputArgs.triggers, inputArgs.currentTrigger );
        },
        validate: function() {
            const args = this.args;
            let owner = $v( args.owner ),
                name = $v( args.name ),
                trigger = getItemDisplayValue( args.trigger ),
                valid = true; // assume valid

            if ( !owner || !name || !trigger ) {
                valid = false;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                command = this.enable ? "enable" : "disable",
                trigger = getItemDisplayValue( args.trigger ),
                p = sendCommand( this.schema, $v( args.owner ), command, {
                    objectId: this.objId,
                    objectName: trigger,
                    objectType: "TRIGGER"
                }, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    // for success don't show a message because the result can be seen in the triggers view once refreshed
                    this.model.clearData(); // refresh the view
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDropSODA", "P2000_DROPSODA_DLG_", {
        args: {
            owner: OWNER,
            name: "COL_NAME",
        },
        open: function( dlg$, inputArgs ) {
            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                name = $v( args.name ),
                valid = true; // always valid

            if ( !owner || !name ) {
                valid = false;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                name = $v( args.name ),
                p = sendCommand( this.schema, $v( args.owner ), "drop_soda", {
                    objectId: this.objId,
                    objectName: name,
                    objectType: "SODA_COLLECTION"
                }, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    // other things change views invalid, indexes removed so refresh whole tree rather than just remove from tree
                    refreshTree();
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogSODAIndex", "P2000_SODAIDX_DLG_", {
        args: {
            owner: OWNER,
            name: "COL_NAME",
            indexName: "IDX_NAME"
        },
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                indexName = apexItem( args.indexName );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            indexName.setValue( inputArgs.name + "_SEARCH_IX" );
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                name = $v( args.name ),
                indexName = $v( args.indexName ),
                valid = true; // always valid

            if ( !owner || !name || !indexName ) {
                valid = false;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                name = $v( args.name ),
                indexName = $v( args.indexName ),
                p = sendCommand( this.schema, $v( args.owner ), "create_soda_index", {
                    objectId: this.objId,
                    objectName: name,
                    objectType: "SODA_COLLECTION",
                    indexName: indexName
                }, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    apexActions.invoke( "refresh-view" );
                    refreshTree(); // because an index should be added
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogSODAView", "P2000_SODAVIEW_DLG_", {
        args: {
            owner: OWNER,
            name: "COL_NAME",
            viewName: "VIEW_NAME",
            jsonPath: "JSON_SEL"
        },
        open: function( dlg$, inputArgs ) {
            let args = this.args,
                viewName = apexItem( args.viewName ),
                jsonPath = apexItem( args.jsonPath );

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            viewName.setValue( inputArgs.name + "_VIEW" );
            jsonPath.setValue( "$" );
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                name = $v( args.name ),
                viewName = $v( args.viewName ),
                jsonPath = $v( args.jsonPath ),
                valid = true; // always valid

            if ( !owner || !name || !viewName || !jsonPath ) {
                valid = false;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                name = $v( args.name ),
                viewName = $v( args.viewName ),
                jsonPath = $v( args.jsonPath ),
                p = sendCommand( this.schema, $v( args.owner ), "create_soda_view", {
                    objectId: this.objId,
                    objectName: name,
                    objectType: "SODA_COLLECTION",
                    viewName: viewName,
                    jsonPath: jsonPath
                }, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    apexActions.invoke( "refresh-view" );
                    refreshTree(); // because a view should be added
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogDBLinkTest", "P2000_DBLTEST_DLG_", {
        args: {
            owner: OWNER,
            name: "DB_LINK_NAME"
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                name = $v( args.name ),
                valid = true; // always valid

            if ( !owner || !name ) {
                valid = false;
            }
            this.ddl = null;
            if ( valid ) {
                this.ddl = `select 1 from dual@"${name}"`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const args = this.args,
                p = sendCommand( this.schema, $v( args.owner ), "test_db_link", {
                    ddl: this.ddl,
                    objectName: $v( args.name )
                }, dlg$ );
            p.then( ( { success, message } ) => {
                if ( success ) {
                    apexMessage.alert( message, () => {} );
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogAlterSequence", "P2000_ALTSEQ_DLG_", {
        args: {
            owner: OWNER,
            name: "SEQ_NAME",
            currentVal: "CURRENT_VAL",
            minVal: "MIN_VAL",
            maxVal: "MAX_VAL",
            inc: "INCREMENT_BY",
            cycle: "CYCLE",
            numCache: "CACHE",
            order: "ORDER"
        },
        hasSQL: true,
        open: function( dlg$, inputArgs ) {
            const cursor = dlg$.find( "a-model-cursor" )[0];

            this.objId = inputArgs.id;
            this.schema = inputArgs.schema;
            this.model = inputArgs.model;

            cursor.modelId = inputArgs.model.modelId();
        },
        validate: function() {
            let args = this.args,
                owner = $v( args.owner ),
                name = $v( args.name ),
                minVal = $v( args.minVal ),
                maxVal = $v( args.maxVal ),
                inc = $v( args.inc ),
                cycle = $v( args.cycle ) === "Y",
                order = $v( args.order ) === "Y",
                numCache = $v( args.numCache ),
                valid = true; // assume valid

            if ( !owner || !name || !minVal || !maxVal || !inc || !numCache ) {
                valid = false;
            }
            // todo other validation?

            this.ddl = null;
            if ( valid ) {
                this.ddl = `alter sequence "${owner}"."${name}"
minvalue ${minVal}
maxvalue ${maxVal}
increment by ${inc}
${cycle ? "cycle" : "nocycle"}
cache ${numCache}
${order ? "order" : "noorder"};`;
            }
            return valid;
        },
        onOk: function( dlg$ ) {
            const cursor = dlg$.find( "a-model-cursor" )[0],
                p = sendDDL( this.schema, $v( this.args.owner ), this.ddl, dlg$ );

            p.then( ( { success } ) => {
                if ( success ) {
                    cursor.store();
                }
            } );
            return p;
        }
    } );

    initDialog( "dialogRowEdit", "P2000_ROW_EDIT_DLG_", {
        args: {
            pageMode: "MODE"
        },
        hasSQL: false,
        initialize: function( dlg$ ) {
            dlg$.on( "dialogclose", () => {
                const rv$ = $( "#editDataForm" );

                // disable the edit mode before destroying the recordView
                // otherwise destroy will also delete edit items
                rv$.recordView( "setEditMode", false );
                // destroy the recordView widget and model used
                rv$.recordView( "destroy" );
                apexModel.destroy( TEMP_MODEL );
            } );
        },
        open: function( dlg$, inputArgs ) {
            this.model = inputArgs.model;
            this.record = inputArgs.record;
            this.pageMode = inputArgs.pageMode;
            this.name = "dialogRowEdit";
            // copy the record into new array
            this.tempRecord = structuredClone( inputArgs.record );
            // copy the fields information from main model
            this.fields = structuredClone( inputArgs.model.getOption( "fields" ) );
            // clear hidden flag for all columns
            // we must show all the columns in edit form all the time
            for ( const colName of Object.keys( this.fields ) ) {
                let field = this.fields[ colName ];

                if ( ![ "ROWID", "ROW_ACTIONS", "_meta" ].includes( colName ) ) {
                    field.hidden = false;
                }
                if ( !field.hidden && field.heading ) {
                    // move the heading to the label. The heading is already escaped.
                    // todo this still leads to double escaping in the unlikely event that a column name contains markup
                    field.label = field.heading;
                    delete field.heading;
                }
            }
            // create a temporary model to handle local updates
            apexModel.create( TEMP_MODEL, {
                shape: "table",
                recordIsArray: true,
                fields: this.fields,
                regionId: this.model.getOption( "regionId" ),
                ajaxIdentifier: this.model.getOption( "ajaxIdentifier" ),
                regionData: this.model.getOption( "regionData" ),
                saveData: this.model.getOption( "saveData" ),
                identityField: this.model.getOption( "identityField" ),
                metaField: this.model.getOption( "metaField" ),
                editable: true,
            }, ( this.pageMode === "C" ) ? null : [ this.tempRecord ] );

            this.tempModel = apexModel.get( TEMP_MODEL );

            // if inserting new row, then add empty row
            if ( this.pageMode === "C" ) {
                this.tempModel.insertNewRecord();
            }
        },
        validate: function() {
            return true;
        },
        onCreate: function () {
            // don't check here if model hasErrors or not
            // consider case of NOT NULL columns with default values
            // if we add model.hasErrors check, then nothing will happen when Create button is clicked
            // and data not entered for NOT NULL columns
            let p = this.tempModel.save();

            if ( p ) {
                p.done( () => {
                    // refresh the main model
                    this.model.clearData();

                    apexMessage.showPageSuccess( lang.getMessage( "OB.ROW_INSERTED" ) );
                    theme.closeRegion( this.name );
                } );

                p.fail( function( jqXHR ) {
                    apexMessage.alert( jqXHR[0].message );
                } );
            }
        },
        onSave: function() {
            // if there are no changes, close the dialog
            if ( !this.tempModel.isChanged() ) {
                theme.closeRegion( this.name );
                return;
            }

            if ( !this.tempModel.hasErrors() ) {
                let p = this.tempModel.save();

                if ( p ) {
                    p.done( () => {
                        let rowID = this.tempModel.getValue( this.tempModel.recordAt(0), "ROWID" ),
                            meta = this.model.getRecordMetadata( rowID ),
                            updatedRow = this.tempModel.recordAt(0),
                            updatedRowVersion = updatedRow[updatedRow.length-1].rowVersion;

                        // update the main model data from tempModel
                        // use setValue function instead of array replace using meta.record
                        // this will ensure changes are notified
                        for ( const colName in this.fields ) {
                            if ( ![ "ROWID", "ROW_ACTIONS", "_meta" ].includes( colName ) && !this.tempModel.getFieldMetadata( colName ).readonly ){
                                this.model.setValue( this.record, colName, this.tempModel.getValue( updatedRow, colName ) );
                            }
                        }
                        // update the rowVersion in main model
                        meta.record[meta.record.length-1].rowVersion = updatedRowVersion;
                        meta.rowVersion = updatedRowVersion;

                        apexMessage.showPageSuccess( lang.getMessage( "APEX.IG.CHANGES_SAVED" ) );
                        theme.closeRegion( this.name );
                    } );

                    p.fail( function( jqXHR ) {
                        apexMessage.alert( jqXHR[0].message );
                    } );
                }
            } else {
                apexMessage.alert( lang.getMessage( "OB.CORRECT_ERRORS" ) );
            }
        },
        onDelete: function() {
            // save the record before deleting
            // we need it to restore, incase deletion fails
            const rowToDelete = this.tempModel.recordAt(0),
                rv$ = $( "#editDataForm" );

            apexMessage.confirm( lang.getMessage ( "OB.ROW_DELETE_CONFIRM" ), ( okPressed ) => {
                if( okPressed ) {
                    // before deleting the row, hide the recordView widget
                    // because, when row is deleted recordView exits edit mode ( readonly items )
                    // and all the values with display with strike through
                    // this will appear as visual glitch
                    rv$.hide();
                    this.tempModel.deleteRecords( [ this.tempModel.recordAt(0) ] );
                    let p = this.tempModel.save();

                    if ( p ) {
                        p.done ( () => {
                            // delete the record from main model
                            this.model.deleteRecords( [ this.record ] );

                            apexMessage.showPageSuccess( lang.getMessage ( "OB.ROW_DELETED" ) );
                            theme.closeRegion( this.name );
                            rv$.show();
                        } );

                        p.fail(  ( jqXHR ) => {
                            // deletion failed, for e.g. it can happen because of foreign key constraints
                            // revert the changes in the model before showing error message
                            this.tempModel.revertRecords( [ rowToDelete ] );
                            rv$.show();
                            apexMessage.alert( jqXHR[0].message );
                        } );
                    }
                }
            });
        },
        postOpen: function () {
            const rv$ = $( "#editDataForm" );

            // initialize the record view
            // page 2000 has div with id editDataForm
            rv$.recordView( {
                modelName: TEMP_MODEL,
                fields: [ this.fields ],
                editable: true,
                toolbar : null,
                recordOffset : 0,
                exitEditModeOnEscape: false
            } );

            // set editmode after recordView initialization
            // if we use alwaysEdit true during initialization, then validation errors
            // are displayed as soon as the form is rendered
            rv$.recordView( "setEditMode", true );
        }
    } );

    if ( apex.env.DB_VERSION >= 23 ) {
        initDialog( "dialogImportEdit", "P2000_IMPORT_EDIT_DLG_", {
            args: {
                pageMode: "MODE"
            },
            hasSQL: false,
            initialize: function( /* dlg$ */ ) {
                apexItems.P2000_MODULE_NAME.element.on( "change", () => {
                    if( this.pageMode === "C" ) {
                        // in create mode, default the import name to the lower case module name
                        if( apexItems.P2000_MODULE_NAME.value !== "" && apexItems.P2000_IMPORT_NAME.value === "" ) {
                            apexItems.P2000_IMPORT_NAME.value = apexItems.P2000_MODULE_NAME.value.toLowerCase().replaceAll( "_", '-' );
                        }
                    }
                } );
                // keep the current schema helper item, used in the 2 select lists in sync
                apexItems.P2000_OB_SCHEMA.element.on( "change", () => {
                    apexItems.P2000_SCHEMA_HELPER.value = objectBrowser.getSchema();
                } );
            },
            open: function( dlg$, inputArgs ) {

                this.model = inputArgs.model;
                this.record = inputArgs.record;
                this.pageMode = inputArgs.pageMode;
                this.name = "dialogImportEdit";

                // copy the record into new array
                this.tempRecord = structuredClone( inputArgs.record );
                // copy the fields information from main model
                this.fields = structuredClone( inputArgs.model.getOption( "fields" ) );

                // create a temporary model to handle local updates
                apexModel.create( TEMP_MODEL, {
                    shape: "table",
                    recordIsArray: true,
                    fields: this.fields,
                    regionId: this.model.getOption( "regionId" ),
                    ajaxIdentifier: this.model.getOption( "ajaxIdentifier" ),
                    regionData: this.model.getOption( "regionData" ),
                    saveData: this.model.getOption( "saveData" ),
                    identityField: this.model.getOption( "identityField" ),
                    metaField: this.model.getOption( "metaField" ),
                    editable: true,
                }, ( this.pageMode === "C" ) ? null : [ this.tempRecord ] );

                this.tempModel = apexModel.get( TEMP_MODEL );

                if ( this.pageMode === "C" ) {
                    apexItems.P2000_ORIGINAL_IMPORT_NAME.value = "";
                    apexItems.P2000_MODULE_OWNER.value = "";
                    apexItems.P2000_MODULE_NAME.value = "";
                    apexItems.P2000_IMPORT_NAME.value = "";
                } else if ( this.pageMode === "E" ) {
                    apexItems.P2000_ORIGINAL_IMPORT_NAME.value = this.tempModel.getValue( this.tempRecord, "ORIGINAL_IMPORT_NAME" );
                    apexItems.P2000_IMPORT_NAME.value = this.tempModel.getValue( this.tempRecord, "IMPORT_NAME" );
                    const moduleOwner = this.tempModel.getValue( this.tempRecord, "MODULE_OWNER" );
                    const moduleName = this.tempModel.getValue( this.tempRecord, "MODULE_NAME" );
                    if( apexItems.P2000_MODULE_OWNER.value !== moduleOwner ) {
                        apexItems.P2000_MODULE_NAME.element.one( "apexafterrefresh", () => {
                            apexItems.P2000_MODULE_NAME.value = moduleName;
                        } );
                        apexItems.P2000_MODULE_OWNER.value = moduleOwner;
                    } else {
                        apexItems.P2000_MODULE_NAME.value = moduleName;
                    }
                }
            },
            validate: function() {
                return true;
            },
            onCreate: function () {
                const primaryKey = this.tempModel.insertNewRecord();

                this.tempModel.setRecordValue( primaryKey, "MODULE_OWNER", apexItems.P2000_MODULE_OWNER.value );
                this.tempModel.setRecordValue( primaryKey, "MODULE_NAME", apexItems.P2000_MODULE_NAME.value );
                this.tempModel.setRecordValue( primaryKey, "IMPORT_NAME", apexItems.P2000_IMPORT_NAME.value );

                let p = this.tempModel.save();

                if ( p ) {
                    p.always( () => {
                        this.tempModel.clearData( false );
                    } );

                    p.done( () => {
                        // refresh the main model
                        this.model.clearData();

                        apexMessage.showPageSuccess( lang.getMessage( "OB.IMPORT_CREATED" ) );
                        theme.closeRegion( this.name );
                    } );

                    p.fail( function( jqXHR ) {
                        apexMessage.alert( jqXHR[0].message );
                    } );
                }
            },
            onSave: function() {
                this.tempModel.setValue( this.tempRecord, "MODULE_OWNER", apexItems.P2000_MODULE_OWNER.value );
                this.tempModel.setValue( this.tempRecord, "MODULE_NAME", apexItems.P2000_MODULE_NAME.value );
                this.tempModel.setValue( this.tempRecord, "IMPORT_NAME", apexItems.P2000_IMPORT_NAME.value );

                // if there are no changes, close the dialog
                if ( !this.tempModel.isChanged() ) {
                    theme.closeRegion( this.name );
                    return;
                }

                let p = this.tempModel.save();

                if ( p ) {
                    p.done( () => {
                        // refresh the main model
                        this.model.clearData();
                        apexMessage.showPageSuccess( lang.getMessage( "APEX.IG.CHANGES_SAVED" ) );
                        theme.closeRegion( this.name );
                    } );

                    p.fail( function( jqXHR ) {
                        apexMessage.alert( jqXHR[0].message );
                    } );
                }
            },
            onDelete: function() {
                apexMessage.confirm( lang.getMessage ( "OB.IMPORT_DELETE_CONFIRM" ), ( okPressed ) => {
                    if( okPressed ) {
                        this.tempModel.deleteRecords( [ this.tempModel.recordAt(0) ] );
                        let p = this.tempModel.save();

                        if ( p ) {
                            p.done ( () => {
                                // delete the record from the main model
                                this.model.deleteRecords( [ this.record ] );
                                apexMessage.showPageSuccess( lang.getMessage ( "OB.IMPORT_DELETED" ) );
                                theme.closeRegion( this.name );
                            } );

                            p.fail(  ( jqXHR ) => {
                                apexMessage.alert( jqXHR[0].message );
                            } );
                        }
                    }
                });
            }
        } );
    }

} )( apex.jQuery, objectBrowser, apex.model, apex.util, apex.message, apex.item, apex.items, apex.binding, apex.actions, apex.lang, apex.theme );