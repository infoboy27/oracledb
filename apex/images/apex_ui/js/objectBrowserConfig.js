/*!
 * Copyright (c) 2021, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This file has all the object type configuration data for object browser.
 *
 **/
/* global objectBrowser */
( function( $, ob, lang, apexActions, apexMessage ) {
    "use strict";

    const registerObjectType = ob.registerObjectType,
        getCurrentInstance = ob.getCurrentInstance,
        doLinkAction = ob.doLinkAction,
        openDialog = ob.openDialog,
        sendCommand = ob.sendCommand;

    const extend = $.extend;

    // common view ids
    const ID_DATA = "DATA",
        ID_MAIN = "MAIN",
        ID_COLS = "COLS", // this is a sub view
        ID_GRANTS = "GRANTS",
        ID_STATS = "STATS",
        ID_DEPS = "DEPS",
        ID_DDL = "DDL",
        ID_CODE = "CODE",
        ID_ERRORS = "ERRORS",
        ID_DETAILS = "DETAILS",
        ID_SUMMARY = "SUMMARY", // this is a sub view
        ID_ENV_IMPORTS = "ENV_IMPORTS";

    // common text message keys
    const TM_LAST_ANALYZED = "LAST_ANALYZED",
        TM_OBJECT_DETAILS = "OBJECT_DETAILS",
        TM_DROP = "DROP",
        TM_STATUS = "STATUS",
        TM_SUMMARY = "SUMMARY",
        TM_COLUMNS = "COLUMNS";

    const L_PLSQL = "plsql",
        L_JSON = "json",
        L_JAVASCRIPT_MODULE = "mle-javascript-module",
        SHAPE_RECORD = "record";

    function getActionMessage( key ) {
        return lang.getMessage( "OB.ACTION_" + key );
    }

    function getMessage( key ) {
        return lang.getMessage( "OB." + key );
    }

    function getHeading( key ) {
        return lang.getMessage( "OB.COL_" + key );
    }

    function applyGridColumnDefaults( columns ) {
        for ( const [, c] of Object.entries( columns ) ) {
            if ( !c.hidden ) {
                c.heading = getHeading( c.heading );
                c.alignment = c.alignment || "start";
                c.headingAlignment = c.headingAlignment || c.alignment;
                if ( c.noStretch === undefined ) {
                    c.noStretch = false;
                }
                if ( c.canSort === undefined ) {
                    c.canSort = true;
                }
                if ( c.seq === undefined ) {
                    c.seq = c.index + 1;
                }
            }
        }

        return columns;
    }

    function applyRecordFieldDefaults( fields ) {
        for ( const [, c] of Object.entries( fields ) ) {
            if ( !c.hidden ) {
                c.label = getHeading( c.label );
            }
        }

        return fields;
    }

    function makeOpenLink( owner, label, type ) {
        return `{if ?OBJECT_ID/}\
<a href="#action$open-object?id=&OBJECT_ID.&owner=${owner}&label=${label}&type=${type}">${label}</a>\
{else/}\
${label}\
{endif/}`;
    }

    function makeGotoErrorLink( view ) {
        return `<a href="#action$goto-error?&view=${view}&line=&LINE.&column=&POSITION.">&TEXT!HTML.</a>`;
    }

    function openDropObjectDialog() {
        const objectInstance = getCurrentInstance();
        let args,
            type = objectInstance.type;

        if ( type === "PACKAGE" && objectInstance.currentViewId === "BODY" ) {
            type = "PACKAGE BODY";
        }
        type = type.replace( "_", " " );
        args = {
            id: objectInstance.id,
            owner: objectInstance.owner,
            schema: objectInstance.schema,
            type: type,
            name: objectInstance.name,
        };

        if ( type === "TABLE" ) {
            args.cascade = "N";
        }
        return openDialog( "dialogDropObject", args );
    }

    function gatherStats( modelKey, column ) {
        const objectInstance = getCurrentInstance(),
            owner = objectInstance.owner,
            schema = objectInstance.schema,
            model = objectInstance.models.get( modelKey ),
            args = {
                objectId: objectInstance.id,
                objectName: objectInstance.name,
                objectType: objectInstance.type
            };

        sendCommand( schema, owner, "gather_stats", args, objectInstance.tabPanel$ )
            .then( ( result ) => {
                let regionData = model.getOption( "regionData" ),
                    jobName = result.result.jobName;

                if ( jobName ) {
                    regionData.jobName = jobName;
                }
                model.setValue( column, getMessage( "CMD_GATHER_STATS.IN_PROGRESS" ) );
                model.clearChanges(); // this does not need to be saved.
                apexMessage.alert( result.message, () => {
                } );
            } );
    }

    function disable() {
        sendCommandWithRefreshAndMessage( "disable" );
    }

    function sendCommandWithRefreshAndMessage( command ) {
        const objectInstance = getCurrentInstance(),
            owner = objectInstance.owner,
            schema = objectInstance.schema,
            args = {
                objectId: objectInstance.id,
                objectName: objectInstance.name,
                objectType: objectInstance.type
            };

        sendCommand( schema, owner, command, args, objectInstance.tabPanel$ )
            .then( ( result ) => {
                apexActions.invoke( "refresh-view" ); // use this so both models are refreshed
                apexMessage.alert( result.message, () => {
                } );
            } );
    }

    function compile() {
        const objectInstance = getCurrentInstance(),
            owner = objectInstance.owner,
            schema = objectInstance.schema,
            objId = objectInstance.id,
            args = {
                objectId: objId,
                objectName: objectInstance.name,
                objectType: objectInstance.type
            };

        sendCommand( schema, owner, "compile", args, objectInstance.tabPanel$ )
            .then( ( result ) => {
                apexMessage.alert( result.message, () => {} );
                ob.updateInvalidState( result.success, objectInstance, objId, schema );
            } );
    }

    function doSave() {
        const objectInstance = getCurrentInstance();

        return objectInstance.save();
    }

    function addToArgsListFromGridModel( args, grid$, model, argName, colName, curArgName = null, test = null ) {
        const columnIndex = model.getFieldKey( colName ),
            list = [];

        model.forEach( ( rec, index, id ) => {
            if ( !test || test( rec ) ) {
                list.push( {
                    display: rec[columnIndex],
                    return: id
                } );
            }
        } );
        args[argName] = list;

        if ( curArgName ) {
            let rec, current,
                // todo consider should be abel to use getSelectedRecords even in cell selection mode
                recId = grid$.grid( "getSelectedRange" ).recordIds[0];

            current = list[0];
            if ( recId ) {
                rec = model.getRecord( recId );
                if ( rec ) {
                    current = model.getRecordId( rec );
                }
            }
            args[curArgName] = current;
        }
    }

    function addColumnsToArgs( args, grid$, model, currentArgName = "currentColumn", test = null ) {
        addToArgsListFromGridModel( args, grid$, model,
            "columns", "COLUMN_NAME", currentArgName, test );
    }

    function addConstraintsToArgs( args, grid$, model, match ) {
        const statusIndex = model.getFieldKey( "STATUS" );
        let test = null;

        if ( match ) {
            test = function( rec ) {
                return rec[statusIndex] === match;
            };
        }

        addToArgsListFromGridModel( args, grid$, model,
            "constraints", "CONSTRAINT_NAME", "currentConstraint", test );
    }

    function addTriggersToArgs( args, grid$, model, match ) {
        const statusIndex = model.getFieldKey( "STATUS" );
        let test = null;

        if ( match ) {
            test = function( rec ) {
                return rec[statusIndex] === match;
            };
        }

        addToArgsListFromGridModel( args, grid$, model,
            "triggers", "TRIGGER_NAME", "currentTrigger", test );
    }

    function toggleActionEnable( action, enable ) {
        if ( enable ) {
            apexActions.enable( action );
        } else {
            apexActions.disable( action );
        }
    }

    // view types
    const VT_GRID = ob.viewTypes.GRID,
        VT_GRIDS = ob.viewTypes.GRIDS,
        VT_NVP = ob.viewTypes.NVP,
        VT_EDITOR = ob.viewTypes.EDITOR,
        VT_NVP_GRID = ob.viewTypes.NVP_GRID,
        VT_NVP_EDITOR = ob.viewTypes.NVP_EDITOR;

    const nameColumnWidth = 200,
        objectTypeColumnWidth = 140,
        dataTypeColumnWidth = 140,
        smallNumberColumnWidth = 90,
        mediumNumberColumnWidth = 120,
        smallKeywordColumnWidth = 80,
        mediumKeywordColumnWidth = 180,
        longTextColumnWidth = 240,
        dateColumnWidth = 160,
        // A template for formatting the data type display.
        // Number scale is optional but always shown even if 0 (default) when precision is given
        // The server pre-formats timestamp, interval types
        dataTypeTemplate = `&DATA_TYPE.\
{case DATA_TYPE/}\
{when NUMBER/}\
{if ?PRECISION/}\
(&PRECISION.,&SCALE.)\
{endif/}\
{when FLOAT/}\
(&PRECISION.)\
{when CHAR/}\
(&LENGTH. &USE_CHAR.)\
{when VARCHAR/}\
(&LENGTH. &USE_CHAR.)\
{when VARCHAR2/}\
(&LENGTH. &USE_CHAR.)\
{when NCHAR/}\
(&LENGTH. &USE_CHAR.)\
{when NVARCHAR/}\
(&LENGTH. &USE_CHAR.)\
{when NVARCHAR2/}\
(&LENGTH. &USE_CHAR.)\
{when RAW/}\
(&LENGTH.)\
{endcase/}`,
        columnsNoDataMessage = getMessage( "NO_DATA_COLUMNS" ),
        dataNoDataMessage = getMessage( "NO_DATA" ),
        dataNoImportsMessage = getMessage( "NO_DATA_IMPORTS" ),
        // keep the column indexes in sync with COL_*_INDEX constants in f4500_p2000.js
        columnsColumns = applyGridColumnDefaults( {
            // The column_id is the model identityField, so it must have a unique value for each row.
            // Invisible (aka hidden) columns do not have a column_id so the server adds it.
            // The column_id is not currently shown. If it were to be shown then for invisible columns the
            // number should be displayed as empty string.
            COLUMN_ID: {
                index: 0,
                hidden: true,
                canHide: false,
                readonly: true
            },
            COLUMN_NAME: {
                index: 1,
                seq: 1,
                elementId: "T_COLS_NAME",
                heading: "COLUMN_NAME",
                width: nameColumnWidth,
                usedAsRowHeader: true,
                isRequired: true
            },
            DATA_TYPE: {
                index: 2,
                seq: 2,
                elementId: "T_COLS_DATA_TYPE",
                heading: "DATA_TYPE",
                width: dataTypeColumnWidth,
                cellTemplate: dataTypeTemplate,
                // set dependsOn so template is reapplied when these fields change
                dependsOn: ["LENGTH", "PRECISION", "SCALE", "USE_CHAR"],
                isRequired: true
            },
            LENGTH: {
                index: 3,
                elementId: "T_COLS_LENGTH",
                canSort: true,
                hidden: true,
                canHide: false
            },
            USE_CHAR: {
                index: 4,
                elementId: "T_COLS_USE_CHAR",
                canSort: true,
                hidden: true,
                canHide: false
            },
            PRECISION: {
                index: 5,
                elementId: "T_COLS_PRECISION",
                canSort: true,
                hidden: true,
                canHide: false
            },
            SCALE: {
                index: 6,
                elementId: "T_COLS_SCALE",
                canSort: true,
                hidden: true,
                canHide: false
            },
            NULLABLE: {
                index: 7,
                seq: 3,
                elementId: "T_COLS_NULLABLE",
                heading: "NULLABLE",
                width: smallKeywordColumnWidth,
                isRequired: true
            },
            DATA_DEFAULT: {
                index: 8,
                seq: 4,
                elementId: "T_COLS_DEFAULT",
                heading: "DEFAULT",
            },
            PRIMARY_KEY: {
                index: 9,
                seq: 5,
                readonly: true,
                heading: "PRIMARY_KEY",
                headingAlignment: "center",
                alignment: "center",
                width: smallNumberColumnWidth
            },
            COMMENTS: {
                index: 10,
                seq: 6,
                heading: "COMMENT",
                noStretch: false
            },
            IDENTITY: {
                index: 11,
                seq: 7,
                heading: "IDENTITY"
            },
            VIRTUAL: {
                index: 12,
                hidden: true,
                canHide: false
            },
            INVISIBLE: {
                index: 13,
                hidden: true,
                canHide: false
            }
        } ),
        summaryColumns = applyRecordFieldDefaults( {
            COMMENTS: {
                index: 0,
                label: "COMMENT"
            }
            // todo future consider count if available and not too expensive
        } ),
        grantsNoDataMessage = getMessage( "NO_DATA_GRANTS" ),
        grantsColumns = applyGridColumnDefaults ( {
            PRIVILEGE: {
                index: 0,
                heading: "PRIVILEGE",
                usedAsRowHeader: true,
                width: mediumKeywordColumnWidth
            },
            GRANTEE: {
                index: 1,
                heading: "GRANTEE",
                width: nameColumnWidth
            },
            GRANTABLE: {
                index: 2,
                heading: "GRANTABLE",
                width: smallKeywordColumnWidth
            },
            GRANTOR: {
                index: 3,
                heading: "GRANTOR",
                width: nameColumnWidth
            },
            OBJECT_NAME: {
                index: 4,
                heading: "OBJECT_NAME",
                width: nameColumnWidth
            }
        } ),
        grantsView = {
            id: ID_GRANTS,
            type: VT_GRID,
            noDataMessage: grantsNoDataMessage,
            columns: grantsColumns,
            actions: [ "grant", "revoke" ]
        },
        ddlView = {
            id: ID_DDL,
            type: VT_EDITOR,
            language: L_PLSQL,
            readOnly: true,
            actions: [ "download-text" ]
        },
        errorsNoDataMessage = getMessage( "NO_DATA_ERRORS" ),
        errorsColumns = applyGridColumnDefaults( {
            LINE: {
                index: 0,
                heading: "LINE",
                alignment: "end",
                usedAsRowHeader: true,
                width: smallNumberColumnWidth
            },
            POSITION: {
                index: 1,
                heading: "POSITION",
                alignment: "end",
                width: smallNumberColumnWidth
            },
            TEXT: {
                index: 2,
                heading: "TEXT",
                noStretch: false,
                cellTemplate: makeGotoErrorLink( ID_CODE )
            }
        } ),
        errorsView = {
            id: ID_ERRORS,
            type: VT_GRID,
            fixedRowHeight: false,
            noDataMessage: errorsNoDataMessage,
            columns: errorsColumns
        },
        // used for both references and referenced by
        depsRefColumns = applyGridColumnDefaults( {
            OWNER: {
                index: 0,
                heading: "OWNER",
                width: nameColumnWidth
            },
            NAME: {
                index: 1,
                heading: "OBJECT_NAME",
                cellTemplate: makeOpenLink( "&OWNER.", "&NAME.", "&TYPE." ),
                width: nameColumnWidth,
                usedAsRowHeader: true
            },
            TYPE: {
                index: 2,
                heading: "OBJECT_TYPE",
                width: objectTypeColumnWidth
            },
            OBJECT_ID: {
                index: 3,
                hidden: true,
                canHide: false
            }
        } ),
        depsSynonymsColumns = applyGridColumnDefaults( {
            OWNER: {
                index: 0,
                heading: "OWNER",
                width: nameColumnWidth
            },
            SYNONYM_NAME: {
                index: 1,
                heading: "SYNONYM_NAME",
                width: nameColumnWidth,
                usedAsRowHeader: true
            }
        } ),
        depsRefSubView = {
            subId: "REF",
            headingKey: "REFERENCES",
            hasSize: false,
            noDataMessage: getMessage( "NO_DATA_REF" ),
            columns: depsRefColumns
        },
        depsRefBySubView = {
            subId: "REFBY",
            headingKey: "REFERENCED_BY",
            hasSize: false,
            noDataMessage: getMessage( "NO_DATA_REF_BY" ),
            columns: depsRefColumns
        },
        synonymsNoDataMessage = getMessage( "NO_DATA_SYNONYMS" ),
        depsSynSubView = {
            subId: "SYN",
            headingKey: "SYNONYMS",
            hasSize: false,
            noDataMessage: synonymsNoDataMessage,
            columns: depsSynonymsColumns
        },
        dependenciesView = {
            id: ID_DEPS,
            type: VT_GRIDS,
            subViews: [
                depsRefSubView,
                depsRefBySubView,
                depsSynSubView,
            ]
        },
        synonymsView = {
            labelKey: "SYNONYMS",
            id: "DEPS_SYN",
            type: VT_GRID,
            hasSize: false,
            noDataMessage: synonymsNoDataMessage,
            columns: depsSynonymsColumns
        },
        funcProcViews = [
            {
                id: ID_CODE,
                type: VT_EDITOR,
                language: L_PLSQL,
                readOnly: false,
                actions: ["code-drop", "download-text", "code-save-compile"]
            },
            dependenciesView,
            errorsView,
            grantsView
        ],
        mleEnvViews = [ {
            // don't need label key suffix if it is the same as the id
            id: ID_ENV_IMPORTS,
            type: VT_GRID,
            modelEditable: true,
            identityField: "ORIGINAL_IMPORT_NAME",
            noDataMessage: dataNoImportsMessage,
            columns: applyGridColumnDefaults ( {
                ORIGINAL_IMPORT_NAME: {
                    hidden: true,
                    index: 0,
                    isRequired: false,
                    readonly: false
                },
                MODULE_OWNER: {
                    index: 1,
                    heading: "MODULE_OWNER",
                    usedAsRowHeader: true,
                    width: nameColumnWidth,
                    dataType: "VARCHAR2",
                    isRequired: true,
                    readonly: false
                },
                MODULE_NAME: {
                    index: 2,
                    heading: "MODULE_NAME",
                    width: nameColumnWidth,
                    dataType: "VARCHAR2",
                    isRequired: true,
                    readonly: false
                },
                IMPORT_NAME: {
                    index: 3,
                    heading: "IMPORT_NAME",
                    width: nameColumnWidth,
                    dataType: "VARCHAR2",
                    isRequired: true,
                    readonly: false
                }
            } ),
            actions: [
                {
                    name: "mle-env-import-selection-insert-row",
                    label: getMessage( "ADD_IMPORT" ),
                    icon: "icon-ob-insert-row",
                    action: function() {
                        let objectInstance = getCurrentInstance(),
                        model = objectInstance.models.get( ID_ENV_IMPORTS ),
                        args = {
                             model: model,
                             record: [],
                             dialogTitle: getMessage( "ADD_IMPORT" ),
                             pageMode: "C"
                         };

                        return openDialog( "dialogImportEdit", args );
                    }
                },
                "code-drop"
            ]
        },
            errorsView,
            grantsView,
            ddlView
        ],
        mleModViews = [
            {
                id: ID_CODE,
                type: VT_EDITOR,
                language: L_JAVASCRIPT_MODULE,
                readOnly: false,
                actions: [ "code-drop", "download-text", "code-save-compile" ]
            },
            grantsView,
            //ddlView
        ];

    registerObjectType( "TABLE", {
        icon: "icon-ob-table",
        views: [
            {
                labelKey: "TABLE",
                id: ID_MAIN,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: ID_SUMMARY,
                        headingKey: TM_SUMMARY,
                        modelEditable: true,
                        hidden: true,
                        shape: SHAPE_RECORD,
                        columns: summaryColumns
                    },
                    {
                        subId: ID_COLS,
                        headingKey: TM_COLUMNS,
                        modelEditable: true,
                        identityField: "COLUMN_ID",
                        noDataMessage: columnsNoDataMessage,
                        columns: columnsColumns
                    }
                ],
                actions: [
                    {
                        name: "table-add-column",
                        label: getActionMessage( "ADD_COL" ),
                        icon: "icon-ob-add",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "MAIN_COLS" ),
                                identityIndex = model.getFieldKey( "IDENTITY" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitle: this.label,
                                    add: true,
                                    hasIdentity: "N",
                                    model: model
                                };

                            model.forEach( ( rec ) => {
                                if ( rec[identityIndex] ) {
                                    args.hasIdentity = "Y";
                                }
                            } );
                            return openDialog( "dialogAddModCol", args );
                        }
                    },
                    {
                        name: "table-modify-column",
                        label: getActionMessage( "MODIFY_COL" ),
                        icon: "icon-ob-edit",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                identityIndex = model.getFieldKey( "IDENTITY" ),
                                columnNameIndex = model.getFieldKey( "COLUMN_NAME" ),
                                identityColumnName = null,
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitle: this.label,
                                    add: false,
                                    hasIdentity: "N",
                                    model: model
                                };

                            model.forEach( ( rec ) => {
                                if ( rec[identityIndex] ) {
                                    args.hasIdentity = "Y";
                                    identityColumnName = rec[columnNameIndex];
                                }
                            } );
                            addColumnsToArgs( args, grid$, model, "currentColumn", function( rec ) {
                                // include all columns except the identity column, if there is one
                                return identityColumnName ? rec[columnNameIndex] !== identityColumnName : true;
                            } );
                            return openDialog( "dialogAddModCol", args );
                        }
                    },
                    {
                        name: "table-rename-column",
                        label: getActionMessage( "RENAME_COL" ),
                        icon: "icon-ob-rename",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitle: this.label,
                                    rename: true,
                                    model: model
                                };

                            addColumnsToArgs( args, grid$, model );
                            return openDialog( "dialogDropRenameCol", args );
                        }
                    },
                    {
                        name: "table-drop-column",
                        label: getActionMessage( "DROP_COL" ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitle: this.label,
                                    rename: false,
                                    model: model
                                };

                            addColumnsToArgs( args, grid$, model );
                            return openDialog( "dialogDropRenameCol", args );
                        }
                    },
                    {
                        name: "goto-ui-defaults",
                        label: getActionMessage( "UI_DEFAULTS" ),
                        icon: "icon-ob-ui-defaults",
                        uiDefaultsGroup: true,
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" ) {
                                return doLinkAction( el,"UI_DEFAULTS", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.owner
                                } );
                            }
                        }
                    },
                    {
                        name: "table-rename",
                        label: getActionMessage( "RENAME" ),
                        preferButton: false,
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let args = {
                                id: objectInstance.id,
                                owner: objectInstance.owner,
                                schema: objectInstance.schema,
                                name: objectInstance.name,
                            };

                            return openDialog( "dialogRenameTable", args );
                        }
                    },
                    {
                        name: "table-copy-table",
                        label: getActionMessage( "COPY_TABLE" ),
                        preferButton: false,
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                };

                            // don't need currentColumn because not acting on the selected column
                            addColumnsToArgs( args, grid$, model, null );
                            return openDialog( "dialogCopyTable", args );
                        }
                    },
                    {
                        name: "table-drop",
                        label: getActionMessage( "DROP_TABLE" ),
                        preferButton: false,
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    {
                        name: "table-truncate",
                        label: getActionMessage( "TRUNCATE" ),
                        preferButton: false,
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let args = {
                                id: objectInstance.id,
                                owner: objectInstance.owner,
                                schema: objectInstance.schema,
                                name: objectInstance.name,
                            };

                            return openDialog( "dialogTruncateTable", args );
                        }
                    },
                    {
                        name: "table-comment",
                        label: getActionMessage( "TABLE_COMMENT" ),
                        preferButton: false,
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                objModel = objectInstance.models.get( "MAIN_SUMMARY" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    objectType: objectInstance.type,
                                    model: model,
                                    objModel: objModel
                                };

                            addColumnsToArgs( args, grid$, model );
                            return openDialog( "dialogComment", args );
                        }
                    },
                    {
                        name: "table-create-lookup-table",
                        label: getActionMessage( "CREATE_LT" ),
                        preferButton: false,
                        separatorBefore: true, // see comment where this is implemented in f4500_p2000
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" ) {
                                return doLinkAction( el,"CREATE_LOOKUP_TABLE", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    },
                    {
                        name: "table-create-app",
                        label: getActionMessage( "CREATE_APP" ),
                        preferButton: false,
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" ) {
                                return doLinkAction( el,"CREATE_APP", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    }
                ]
            },
            {
                // don't need label key suffix if it is the same as the id
                id: ID_DATA,
                type: VT_GRID,
                modelEditable: true,
                identityField: "ROWID",
                noDataMessage: dataNoDataMessage,
                columns: null, // don't know yet, fetch at runtime
                actions: [
                    {
                        name: "selection-insert-row",
                        label: getActionMessage( "INSERT" ),
                        icon: "icon-ob-insert-row",
                        action: function() {
                            let objectInstance = getCurrentInstance(),
                                model = objectInstance.models.get( ID_DATA ),
                                args = {
                                     model: model,
                                     record: [],
                                     dialogTitle: getMessage( "CREATE_DATA" ),
                                     pageMode: "C"
                                 };

                            return openDialog( "dialogRowEdit", args );
                        },
                    },
                    "choose-columns",
                    "filter",
                    {
                        name: "count-rows",
                        label: getActionMessage( "COUNT_ROWS" ),
                        icon: "icon-ob-count-rows",
                        action: function() {
                            let objectInstance = getCurrentInstance(),
                                owner = objectInstance.owner,
                                schema = objectInstance.schema,
                                args = {
                                    objectId: objectInstance.id,
                                    objectName: objectInstance.name,
                                    objectType: objectInstance.type
                                };

                            sendCommand( schema, owner, "count_rows", args, objectInstance.tabPanel$ )
                                .then( ( result ) => {
                                    apexMessage.alert( result.message, () => {} );
                                } );
                        },
                    },
                    {
                        name: "load-data",
                        label: getActionMessage( "LOAD_DATA" ),
                        icon: "icon-ob-load-data",
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" ) {
                                return doLinkAction( el,"LOAD_DATA", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    },
                    "download-excel"
                ]
            },
            {
                id: "INDEXES",
                type: VT_GRID,
                modelEditable: true,
                identityField: "OBJECT_ID",
                noDataMessage: getMessage( "NO_DATA_INDEX" ),
                columns: applyGridColumnDefaults( {
                    OWNER: {
                        index: 0,
                        heading: "OWNER",
                        width: nameColumnWidth
                    },
                    INDEX_NAME: {
                        index: 1,
                        heading: "INDEX_NAME",
                        cellTemplate: makeOpenLink( "&OWNER.", "&INDEX_NAME.", "INDEX" ),
                        usedAsRowHeader: true,
                        width: nameColumnWidth
                    },
                    UNIQUENESS: {
                        index: 2,
                        heading: "UNIQUENESS",
                        width: mediumKeywordColumnWidth
                    },
                    COLUMNS: {
                        index: 3,
                        heading: TM_COLUMNS,
                        width: nameColumnWidth
                    },
                    STATUS: {
                        index: 4,
                        heading: TM_STATUS,
                        width: mediumKeywordColumnWidth
                    },
                    INDEX_TYPE: {
                        index: 5,
                        heading: "INDEX_TYPE",
                        headingAlignment: "center",
                        alignment: "center",
                        width: mediumKeywordColumnWidth
                    },
                    TEMPORARY: {
                        index: 6,
                        heading: "TEMPORARY",
                        headingAlignment: "center",
                        alignment: "center",
                        width: smallKeywordColumnWidth
                    },
                    PARTITIONED: {
                        index: 7,
                        heading: "PARTITIONED",
                        headingAlignment: "center",
                        alignment: "center",
                        width: smallKeywordColumnWidth
                    },
                    FUNCIDX_STATUS: {
                        index: 8,
                        heading: "FUNCTION_STATUS",
                        headingAlignment: "center",
                        alignment: "center",
                        width: mediumKeywordColumnWidth
                    },
                    VISIBILITY: {
                        index: 9,
                        heading: "VISIBILITY",
                        headingAlignment: "center",
                        alignment: "center",
                        width: smallKeywordColumnWidth
                    },
                    OBJECT_ID: {
                        index: 10,
                        readonly: true,
                        hidden: true,
                        canHide: false
                    }
                } ),
                // xxx updateActions
                actions: [
                    {
                        name: "table-create-index",
                        label: getActionMessage( "CREATE" ),
                        icon: "icon-ob-create",
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" && objectInstance.currentViewId === "INDEXES" ) {
                                return doLinkAction( el, "CREATE_TABLE_INDEX", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    },
                    {
                        name: "table-drop-index",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "INDEXES" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            addToArgsListFromGridModel( args, grid$, model,
                                "indexes", "INDEX_NAME", "currentIndex" );
                            return openDialog( "dialogDropIndex", args );
                        }
                    }
                ]
            },
            {
                id: "CONSTRAINTS",
                type: VT_GRID,
                modelEditable: true,
                identityField: "CONSTRAINT_NAME",
                noDataMessage: getMessage( "NO_DATA_CONSTRAINTS" ),
                columns: applyGridColumnDefaults( {
                    CONSTRAINT_NAME: {
                        index: 0,
                        heading: "CONSTRAINT",
                        usedAsRowHeader: true,
                        width: nameColumnWidth
                    },
                    CONSTRAINT_TYPE: {
                        index: 1,
                        heading: "TYPE",
                        width: mediumKeywordColumnWidth
                    },
                    SEARCH_CONDITION: {
                        index: 2,
                        heading: "SEARCH_CONDITION",
                        width: longTextColumnWidth
                    },
                    RELATED_TABLE: {
                        index: 3,
                        heading: "RELATED_CONSTRAINT",
                        width: nameColumnWidth
                    },
                    COLUMNS: {
                        index: 4,
                        heading: TM_COLUMNS,
                        width: nameColumnWidth
                    },
                    DELETE_RULE: {
                        index: 5,
                        heading: "DELETE_RULE",
                        width: mediumKeywordColumnWidth
                    },
                    STATUS: {
                        index: 6,
                        heading: TM_STATUS,
                        width: mediumKeywordColumnWidth
                    },
                    LAST_CHANGE: {
                        index: 7,
                        heading: "LAST_CHANGE",
                        width: dateColumnWidth
                    },
                    INDEX_NAME: {
                        index: 8,
                        heading: "INDEX",
                        width: nameColumnWidth
                    },
                    INVALID: {
                        index: 9,
                        heading: "INVALID",
                        width: smallKeywordColumnWidth
                    }
                } ),
                updateActions: function( objectInstance ) {
                    const model = objectInstance.models.get( "CONSTRAINTS" );

                    if ( model ) {
                        let allEnabled = true,
                            allDisabled = true,
                            statusKey = model.getFieldKey( "STATUS" );

                        model.forEach( rec => {
                            let status = rec[statusKey];

                            if ( status === "ENABLED" ) {
                                allDisabled = false;
                            } else {
                                allEnabled = false;
                            }
                        } );
                        toggleActionEnable( "table-enable-constraint", !allEnabled );
                        toggleActionEnable( "table-disable-constraint", !allDisabled );
                        toggleActionEnable( "table-drop-constraint", model.getTotalRecords( true ) > 0 );
                    }
                },
                actions: [
                    {
                        name: "table-create-constraint",
                        label: getActionMessage( "CREATE" ),
                        icon: "icon-ob-create",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "CONSTRAINTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            return openDialog( "dialogAddConstraint", args );
                        }
                    },
                    {
                        name: "table-drop-constraint",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "CONSTRAINTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            addConstraintsToArgs( args, grid$, model );
                            return openDialog( "dialogDropConstraint", args );
                        }
                    },
                    {
                        name: "table-enable-constraint",
                        label: getActionMessage( "ENABLE" ),
                        icon: "icon-ob-enable",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "CONSTRAINTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitleArgs: [getActionMessage( "ENABLE" )],
                                    model: model,
                                    enable: true
                                };

                            addConstraintsToArgs( args, grid$, model,"DISABLED" );
                            return openDialog( "dialogEnDisConstraint", args );
                        }
                    },
                    {
                        name: "table-disable-constraint",
                        label: getActionMessage( "DISABLE" ),
                        icon: "icon-ob-disable",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "CONSTRAINTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitleArgs: [getActionMessage( "DISABLE" )],
                                    model: model,
                                    enable: false
                                };

                            addConstraintsToArgs( args, grid$, model, "ENABLED" );
                            return openDialog( "dialogEnDisConstraint", args );
                        }
                    }
                ]
            },
            // can't use grantsView here because this is where the actions are defined
            {
                id: ID_GRANTS,
                type: VT_GRID,
                noDataMessage: grantsNoDataMessage,
                columns: grantsColumns,
                // xxx updateActions
                actions: [
                    {
                        name: "grant",
                        label: getActionMessage( "GRANT" ),
                        icon: "icon-ob-grant",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "GRANTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    objectType: objectInstance.type,
                                    model: model
                                };

                            return openDialog( "dialogGrant", args );
                        }
                    },
                    {
                        name: "revoke",
                        label: getActionMessage( "REVOKE" ),
                        icon: "icon-ob-revoke",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "GRANTS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    objectType: objectInstance.type,
                                    model: model
                                };

                            return openDialog( "dialogRevoke", args );
                        }
                    }
                ]
            },
            {
                id: ID_STATS,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: "TBL",
                        headingKey: "TABLE_STATISTICS",
                        shape: SHAPE_RECORD,
                        modelEditable: true, // so last analyzed since can be updated
                        columns: applyRecordFieldDefaults( {
                            NUM_ROWS: {
                                index: 0,
                                label: "ROWS"
                            },
                            BLOCKS: {
                                index: 1,
                                label: "BLOCKS"
                            },
                            AVG_ROW_LEN: {
                                index: 2,
                                label: "AVG_ROW_LEN"
                            },
                            LAST_ANALYZED_SINCE: {
                                index: 3,
                                label: TM_LAST_ANALYZED
                            }
                        } )
                    },
                    {
                        subId: "COL",
                        headingKey: "COLUMN_STATISTICS",
                        hasSize: false,
                        columns: applyGridColumnDefaults( {
                            COLUMN_NAME: {
                                index: 0,
                                heading: "COLUMN_NAME",
                                usedAsRowHeader: true,
                                width: nameColumnWidth
                            },
                            DATA_TYPE: {
                                index: 1,
                                heading: "DATA_TYPE",
                                width: dataTypeColumnWidth
                            },
                            DATA_LENGTH: {
                                index: 2,
                                heading: "DATA_LENGTH",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            DATA_PRECISION: {
                                index: 3,
                                heading: "DATA_PRECISION",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            DATA_SCALE: {
                                index: 4,
                                heading: "DATA_SCALE",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            NUM_DISTINCT: {
                                index: 5,
                                heading: "DISTINCT",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            DENSITY: {
                                index: 6,
                                heading: "DENSITY",
                                alignment: "end",
                                width: mediumNumberColumnWidth
                            },
                            NUM_NULLS: {
                                index: 7,
                                heading: "NULLS",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            NUM_BUCKETS: {
                                index: 8,
                                heading: "BUCKETS",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            AVG_COL_LEN: {
                                index: 9,
                                heading: "AVG_COL_LEN",
                                alignment: "end",
                                width: smallNumberColumnWidth
                            },
                            LAST_ANALYZED: {
                                index: 10,
                                heading: TM_LAST_ANALYZED,
                                width: dateColumnWidth
                            }
                        } )
                    }
                ],
                actions: [
                    {
                        name: "table-gather-stats",
                        label: getActionMessage( "GET_STATS" ),
                        icon: "icon-ob-stats",
                        action: function() {
                            gatherStats( "STATS_TBL", "LAST_ANALYZED_SINCE" );
                        }
                    }
                ]
            },
            /* TODO future ui defaults
            {
                id: "UI_DEFS",
                type: VT_NVP_GRID,
            },
            */
            {
                id: "TRIGGERS",
                type: VT_GRID,
                modelEditable: true,
                identityField: "OBJECT_ID",
                noDataMessage: getMessage( "NO_DATA_TRIGGERS" ),
                columns: applyGridColumnDefaults( {
                    // todo yes add owner column same for indexes
                    OWNER: {
                        index: 0,
                        heading: "OWNER",
                        width: nameColumnWidth
                    },
                    TRIGGER_NAME: {
                        index: 1,
                        heading: "TRIGGER_NAME",
                        cellTemplate: makeOpenLink( "&OWNER.", "&TRIGGER_NAME.", "TRIGGER" ),
                        usedAsRowHeader: true,
                        width: nameColumnWidth
                    },
                    TRIGGER_TYPE: {
                        index: 2,
                        heading: "TRIGGER_TYPE",
                        width: mediumKeywordColumnWidth
                    },
                    TRIGGERING_EVENT: {
                        index: 3,
                        heading: "TRIGGERING_EVENT",
                        width: mediumKeywordColumnWidth
                    },
                    STATUS: {
                        index: 4,
                        heading: TM_STATUS,
                        headingAlignment: "center",
                        alignment: "center",
                        width: mediumKeywordColumnWidth
                    },
                    OBJECT_ID: {
                        index: 5,
                        hidden: true,
                        canHide: false
                    }
                } ),
                updateActions: function( objectInstance ) {
                    const model = objectInstance.models.get( "TRIGGERS" );

                    if ( model ) {
                        let allEnabled = true,
                            allDisabled = true,
                            statusKey = model.getFieldKey( "STATUS" );

                        model.forEach( rec => {
                            let status = rec[statusKey];

                            if ( status === "ENABLED" ) {
                                allDisabled = false;
                            } else {
                                allEnabled = false;
                            }
                        } );
                        toggleActionEnable( "table-enable-trigger", !allEnabled );
                        toggleActionEnable( "table-disable-trigger", !allDisabled );
                        toggleActionEnable( "table-drop-trigger", model.getTotalRecords( true ) > 0 );
                    }
                },
                actions: [
                    {
                        name: "table-create-trigger",
                        label: getActionMessage( "CREATE" ),
                        icon: "icon-ob-create",
                        action: function( event, el ) {
                            let objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "TABLE" && objectInstance.currentViewId === "TRIGGERS" ) {
                                return doLinkAction( el, "CREATE_TABLE_TRIGGER", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    },
                    {
                        name: "table-drop-trigger",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "TRIGGERS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            addTriggersToArgs( args, grid$, model );
                            return openDialog( "dialogDropTrigger", args );
                        }
                    },
                    {
                        name: "table-enable-trigger",
                        label: getActionMessage( "ENABLE" ),
                        icon: "icon-ob-enable",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "TRIGGERS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitleArgs: [getActionMessage( "ENABLE" )],
                                    model: model,
                                    enable: true
                                };

                            addTriggersToArgs( args, grid$, model, "DISABLED" );
                            return openDialog( "dialogEnDisTrigger", args );
                        }
                    },
                    {
                        name: "table-disable-trigger",
                        label: getActionMessage( "DISABLE" ),
                        icon: "icon-ob-disable",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "TRIGGERS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    dialogTitleArgs: [getActionMessage( "DISABLE" )],
                                    model: model,
                                    enable: false
                                };

                            addTriggersToArgs( args, grid$, model, "ENABLED" );
                            return openDialog( "dialogEnDisTrigger", args );
                        }
                    }
                ]
            },
            {
                id: ID_DEPS,
                type: VT_GRIDS,
                subViews: [
                    depsRefSubView,
                    depsRefBySubView,
                    depsSynSubView,
                    {
                        subId: "REST",
                        headingKey: "REST_SYNC",
                        hasSize: false,
                        noDataMessage: getMessage( "NO_DATA_REST" ),
                        columns: applyGridColumnDefaults( {
                            APPLICATION_ID: {
                                index: 0,
                                heading: "APP_ID",
                                width: mediumNumberColumnWidth
                            },
                            APPLICATION_NAME: {
                                index: 1,
                                heading: "APP_NAME",
                                usedAsRowHeader: true,
                                width: nameColumnWidth
                            },
                            MODULE_NAME: {
                                index: 2,
                                heading: "REST_SOURCE",
                                width: nameColumnWidth
                            },
                            SYNC_IS_ACTIVE: {
                                index: 3,
                                heading: "ACTIVE", // xxx need to decode the value as a LOV
                                width: smallKeywordColumnWidth
                            },
                            SYNC_INTERVAL: {
                                index: 4,
                                heading: "JOB_INTERVAL",
                                width: mediumNumberColumnWidth
                            },
                            LAST_SYNCHRONIZATION: {
                                index: 5,
                                heading: "LAST_SYNC",
                                width: dateColumnWidth
                            },
                            NEXT_SYNCHRONIZATION: {
                                index: 6,
                                heading: "NEXT_SYNC",
                                width: dateColumnWidth
                            }
                        } )
                    }
                ]
            },
            ddlView,
            {
                id: "SAMPLES",
                type: VT_GRID,
                fixedRowHeight: false,
                columns: applyGridColumnDefaults( {
                    ROWID: {
                        index: 0,
                        hidden: true,
                        canHide: false
                    },
                    RELEVANCE: {
                        index: 1,
                        heading: "RELEVANCE",
                        headingAlignment: "end",
                        alignment: "end",
                        width: mediumNumberColumnWidth
                    },
                    DESCRIPTION: {
                        index: 2,
                        heading: "DESCRIPTION",
                        width: longTextColumnWidth
                    },
                    QUERY: {
                        index: 3,
                        heading: "QUERY",
                        copyValueToClipboard: true,
                        cellTemplate: `<pre>&QUERY.</pre>
<button type="button" class="a-Button u-noSelect" data-action='copy-query'>&"APP_TEXT$OB.ACTION_COPY".</button>
<button type="button" class="a-Button u-noSelect" data-action="run-query?url=&RUN_LINK.">&"APP_TEXT$OB.ACTION_RUN".</button>`
                    },
                    RUN_LINK: {
                        index: 4,
                        hidden: true,
                        canHide: false
                    }
                } ),
            }
        ]
    } );

    registerObjectType( "VIEW", {
        icon: "icon-ob-view",
        views: [
            {
                labelKey: "VIEW",
                id: ID_MAIN,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: ID_SUMMARY,
                        headingKey: TM_SUMMARY,
                        modelEditable: true,
                        hidden: true,
                        shape: SHAPE_RECORD,
                        columns: summaryColumns
                    },
                    {
                        subId: ID_COLS,
                        headingKey: TM_COLUMNS,
                        modelEditable: true,
                        identityField: "COLUMN_ID",
                        noDataMessage: columnsNoDataMessage,
                        columns: ( columns => {
                            let c,
                                copy = extend( true, {}, columns ); // make a deep copy of columns

                            // views do not display the default or primary key columns
                            c = copy.DATA_DEFAULT;
                            c.hidden = true;
                            c.canHide = false;
                            c = copy.PRIMARY_KEY;
                            c.hidden = true;
                            c.canHide = false;
                            // views do not have an identity column or virtual column or invisible column
                            delete copy.IDENTITY;
                            delete copy.VIRTUAL;
                            delete copy.INVISIBLE;
                            return copy;
                        } )( columnsColumns ) // view columns very similar to columnsColumns
                    }
                ],
                actions: [
                    {
                        name: "view-compile",
                        icon: "icon-ob-compile",
                        label: getActionMessage( "COMPILE" ),
                        action: function() {
                            compile();
                        }
                    },
                    // delay defining this so the menu items show up in the desired order
                    "view-drop",
                    // can't use table-comment even though the action is identical because of diffs in icon and
                    // preferButton
                    {
                        name: "comment",
                        label: getActionMessage( "COMMENT" ),
                        icon: "icon-ob-comment",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let grid$ = objectInstance.getCurrentView().find( ".a-GV" ),
                                model = objectInstance.models.get( "MAIN_COLS" ),
                                objModel = objectInstance.models.get( "MAIN_SUMMARY" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    objectType: objectInstance.type,
                                    model: model,
                                    objModel: objModel
                                };

                            addColumnsToArgs( args, grid$, model );
                            return openDialog( "dialogComment", args );
                        }
                    }
                ]
            },
            {
                id: ID_CODE,
                type: VT_EDITOR,
                language: L_PLSQL,
                readOnly: false,
                actions: [
                    {
                        name: "view-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    "download-text",
                    {
                        name: "code-save-compile",
                        label: getActionMessage( "SAVE_COMPILE" ),
                        icon: "icon-ob-compile",
                        hot: true,
                        action: function() {
                            return doSave();
                        }
                    }
                ]
            },
            {
                id: ID_DATA,
                type: VT_GRID,
                noDataMessage: dataNoDataMessage,
                columns: null, // don't know yet, fetch at runtime
                actions: ["choose-columns", "filter", "count-rows", "download-excel"]
            },
            errorsView,
            grantsView,
            /* TODO future ui defaults
            {
                id: "UI_DEFS",
                type: VT_NVP_GRID,
            },
            */
            dependenciesView,
            ddlView
        ]
    } );

    registerObjectType( "INDEX", {
        icon: "icon-ob-index",
        views: [
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: "IDX",
                        headingKey: "INDEX",
                        shape: SHAPE_RECORD,
                        columns: applyRecordFieldDefaults( {
                            INDEX_NAME: {
                                index: 0,
                                label: "INDEX_NAME"
                            },
                            INDEX_TYPE: {
                                index: 1,
                                label: "INDEX_TYPE"
                            },
                            TABLE_OWNER: {
                                index: 2,
                                label: "TABLE_OWNER"
                            },
                            TABLE_NAME: {
                                index: 3,
                                label: "TABLE_NAME",
                                cellTemplate: makeOpenLink( "&TABLE_OWNER.", "&TABLE_NAME.", "&TABLE_TYPE." )
                            },
                            TABLE_TYPE: {
                                index: 4,
                                label: "TABLE_TYPE"
                            },
                            UNIQUENESS: {
                                index: 5,
                                label: "UNIQUENESS"
                            },
                            COMPRESSION: {
                                index: 6,
                                label: "COMPRESSION"
                            },
                            PREFIX_LENGTH: {
                                index: 7,
                                label: "PREFIX_LENGTH"
                            },
                            TABLESPACE_NAME: {
                                index: 8,
                                label: "TABLESPACE_NAME"
                            },
                            STATUS: {
                                index: 9,
                                label: TM_STATUS
                            },
                            LAST_ANALYZED: {
                                index: 10,
                                label: TM_LAST_ANALYZED
                            },
                            OBJECT_ID: {
                                index: 11,
                                hidden: true,
                                canHide: false
                            }
                        } )
                    },
                    {
                        subId: ID_COLS,
                        headingKey: "INDEX_COLUMNS",
                        hasSize: false,
                        columns: applyGridColumnDefaults( {
                            COLUMN_NAME: {
                                index: 0,
                                heading: "COLUMN_NAME",
                                usedAsRowHeader: true,
                                width: nameColumnWidth
                            },
                            COLUMN_EXPRESSION: {
                                index: 1,
                                heading: "COLUMN_EXPRESSION",
                                width: longTextColumnWidth,
                                canSort: false, // server has trouble sorting and filtering due to this column being long data type
                                canFilter: false // todo consider adding to grid widget
                            },
                            COLUMN_POSITION: {
                                index: 2,
                                heading: "COLUMN_POSITION",
                                alignment: "end",
                                width: mediumNumberColumnWidth
                            }
                        } )
                    }
                ],
                actions: [
                    {
                        name: "index-disable",
                        label: getActionMessage( "DISABLE" ),
                        icon: "icon-ob-disable",
                        action: function() {
                            disable();
                        }
                    },
                    {
                        name: "index-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    {
                        name: "index-rebuild",
                        label: getActionMessage( "REBUILD" ),
                        icon: "icon-ob-rebuild",
                        action: function() {
                            sendCommandWithRefreshAndMessage( "rebuild" );
                        }
                    }
                ]
            },
            {
                id: ID_STATS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                modelEditable: true, // so last analyzed since can be updated
                columns: applyRecordFieldDefaults( {
                    NUM_ROWS: {
                        index: 0,
                        label: "NUM_ROWS"
                    },
                    COMPRESSION: {
                        index: 1,
                        label: "COMPRESSION"
                    },
                    LAST_ANALYZED: {
                        index: 2,
                        label: TM_LAST_ANALYZED
                    },
                } ),
                actions: [
                    {
                        name: "index-gather-stats",
                        label: getActionMessage( "GET_STATS" ),
                        icon: "icon-ob-stats",
                        action: function() {
                            gatherStats( "STATS", "LAST_ANALYZED" );
                        }
                    }
                ]
            },
            ddlView
        ]
    } );

    registerObjectType( "SEQUENCE", {
        icon: "icon-ob-sequence",
        views: [
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                modelEditable: true,
                columns: applyRecordFieldDefaults( {
                    MIN_VALUE: {
                        index: 0,
                        label: "MIN_VALUE"
                    },
                    MAX_VALUE: {
                        index: 1,
                        label: "MAX_VALUE"
                    },
                    INCREMENT_BY: {
                        index: 2,
                        label: "INCREMENT_BY"
                    },
                    CYCLE_FLAG: {
                        index: 3,
                        label: "CYCLE_FLAG"
                    },
                    ORDER_FLAG: {
                        index: 4,
                        label: "ORDER_FLAG"
                    },
                    CACHE_SIZE: {
                        index: 5,
                        label: "CACHE_SIZE"
                    },
                    LAST_NUMBER: {
                        index: 6,
                        // todo want to make this readonly but would need a way to tell item-value binding
                        //   not to update. No harm because model never saved.
                        // readonly: true,
                        label: "LAST_NUMBER"
                    }
                } ),
                actions: [
                    {
                        name: "sequence-alter",
                        label: getActionMessage( "ALTER" ),
                        icon: "icon-ob-edit",
                        action: function() {
                            const objectInstance = getCurrentInstance(),
                                model = objectInstance.models.get( "DETAILS" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            return openDialog( "dialogAlterSequence", args );
                        }
                    },
                    {
                        name: "sequence-drop",
                        icon: "icon-ob-drop",
                        label: getActionMessage( TM_DROP ),
                        action: function() {
                            return openDropObjectDialog();
                        }
                    }
                ]
            },
            grantsView,
            dependenciesView,
            ddlView,
        ]
    } );

    registerObjectType( "TYPE", {
        icon: "icon-ob-type",
        views: [
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                columns: applyRecordFieldDefaults( {
                    OWNER: {
                        index: 0,
                        label: "OWNER"
                    },
                    TYPE_NAME: {
                        index: 1,
                        label: "TYPE_NAME"
                    },
                    TYPE_OID: {
                        index: 2,
                        label: "TYPE_OID"
                    },
                    TYPECODE: {
                        index: 3,
                        label: "OBJ_COL"
                    },
                    ATTRIBUTES: {
                        index: 4,
                        label: "ATTRIBUTES"
                    },
                    METHODS: {
                        index: 5,
                        label: "METHODS"
                    },
                    PREDEFINED: {
                        index: 6,
                        label: "PREDEFINED"
                    },
                    INCOMPLETE: {
                        index: 7,
                        label: "COMPLETE"  // xxx decode(INCOMPLETE,'YES','NO','NO','YES',INCOMPLETE) INCOMPLETE perhaps move to UI?
                    },
                    FINAL: {
                        index: 8,
                        label: "FINAL"
                    },
                    INSTANTIABLE: {
                        index: 9,
                        label: "INSTANTIABLE"
                    },
                    SUPERTYPE_OWNER: {
                        index: 10,
                        label: "SUPERTYPE_OWNER"
                    },
                    SUPERTYPE_NAME: {
                        index: 11,
                        label: "SUPERTYPE_NAME"
                    },
                    LOCAL_ATTRIBUTES: {
                        index: 12,
                        label: "LOCAL_ATTRIBUTES"
                    },
                    LOCAL_METHODS: {
                        index: 13,
                        label: "LOCAL_METHODS"
                    }
                } ),
                actions: [
                    {
                        name: "type-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    }
                ]
            },
            synonymsView,
            grantsView,
            ddlView
        ]
    } );

    registerObjectType( "PACKAGE", {
        icon: "icon-ob-package",
        views: [
            {
                labelKey: "SPECIFICATION",
                id: "SPEC",
                type: VT_EDITOR,
                language: L_PLSQL,
                readOnly: false,
                actions: [
                    {
                        name: "code-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    "download-text",
                    "code-save-compile"
                ]
            },
            {
                id: "BODY",
                type: VT_EDITOR,
                language: L_PLSQL,
                readOnly: false,
                actions: ["code-drop", "download-text", "code-save-compile"]
            },
            dependenciesView,
            {
                id: ID_ERRORS,
                type: VT_GRID,
                fixedRowHeight: false,
                noDataMessage: errorsNoDataMessage,
                columns: applyGridColumnDefaults( {
                    LOC: {
                        index: 0,
                        heading: "LOCATION",
                        // values PACKAGE or PACKAGE BODY todo LOV display values
                        width: mediumKeywordColumnWidth
                    },
                    LINE: {
                        index: 1,
                        heading: "LINE",
                        alignment: "end",
                        width: smallNumberColumnWidth
                    },
                    POSITION: {
                        index: 2,
                        heading: "POSITION",
                        alignment: "end",
                        width: smallNumberColumnWidth
                    },
                    TEXT: {
                        index: 3,
                        heading: "TEXT",
                        noStretch: false,
                        cellTemplate: makeGotoErrorLink( "{case LOC/}{when PACKAGE/}SPEC{otherwise/}BODY{endcase/}" )
                    }
                } )
            },
            grantsView
        ]
    } );

    registerObjectType( "PROCEDURE", {
        icon: "icon-ob-procedure",
        views: funcProcViews
    } );

    registerObjectType( "FUNCTION", {
        icon: "icon-ob-function",
        views: funcProcViews
    } );

    registerObjectType( "TRIGGER", {
        icon: "icon-ob-trigger",
        views: [
            {
                id: ID_CODE,
                type: VT_EDITOR,
                language: L_PLSQL,
                readOnly: false,
                actions: ["code-drop", "download-text", "code-save-compile"]
            },
            errorsView,
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                columns: applyRecordFieldDefaults( {
                    OBJECT_STATUS: {
                        index: 0,
                        label: "OBJECT_STATUS"
                    },
                    TRIGGER_STATUS: {
                        index: 1,
                        label: "TRIGGER_STATUS",
                    },
                    TRIGGER_TYPE: {
                        index: 2,
                        label: "TRIGGER_TYPE"
                    },
                    TRIGGERING_EVENT: {
                        index: 3,
                        label: "TRIGGERING_EVENT"
                    },
                    BASE_OBJECT_TYPE: {
                        index: 4,
                        label: "BASE_TYPE"
                    },
                    TABLE_OWNER: {
                        index: 5,
                        label: "BASE_OWNER"
                    },
                    TABLE_NAME: {
                        index: 6,
                        label: "BASE_NAME",
                        cellTemplate: makeOpenLink( "&TABLE_OWNER.", "&TABLE_NAME.", "TABLE" )
                    },
                    COLUMN_NAME: {
                        index: 7,
                        label: "COLUMN_NAME"
                    },
                    REFERENCING_NAMES: {
                        index: 8,
                        label: "REFERENCING_NAMES"
                    },
                    WHEN_CLAUSE: {
                        index: 9,
                        label: "WHEN_CLAUSE"
                    },
                    DESCRIPTION: {
                        index: 10,
                        label: "DESCRIPTION"
                    },
                    ACTION_TYPE: {
                        index: 11,
                        label: "ACTION_TYPE"
                    },
                    OBJECT_ID: {
                        index: 12,
                        hidden: true,
                        canHide: false
                    }
                } ),
                updateActions: function( objectInstance ) {
                    const model = objectInstance.models.get( "DETAILS_TRG" );

                    if ( model && model.getRecord() ) {
                        const enabled = model.getValue( "TRIGGER_STATUS" ) === "ENABLED";

                        if ( enabled ) {
                            apexActions.hide( "trigger-enable" );
                            apexActions.show( "trigger-disable" );
                        } else {
                            apexActions.show( "trigger-enable" );
                            apexActions.hide( "trigger-disable" );
                        }
                    }
                },
                actions: [
                    {
                        name: "trigger-compile",
                        label: getActionMessage("COMPILE" ),
                        icon: "icon-ob-compile",
                        action: function() {
                            compile();
                        }
                    },
                    {
                        name: "trigger-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    {
                        name: "trigger-enable",
                        label: getActionMessage("ENABLE" ),
                        icon: "icon-ob-enable",
                        action: function() {
                            sendCommandWithRefreshAndMessage( "enable" );
                        }
                    },
                    {
                        name: "trigger-disable",
                        label: getActionMessage("DISABLE" ),
                        icon: "icon-ob-disable",
                        action: function() {
                            disable();
                        }
                    }
                ]
            },
            ddlView
        ]
    } );

    registerObjectType( "DATABASE_LINK", {
        icon: "icon-ob-database-link",
        views: [
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                columns: applyRecordFieldDefaults( {
                    OWNER: {
                        index: 0,
                        label: "OWNER"
                    },
                    DB_LINK: {
                        index: 1,
                        label: "DB_LINK"
                    },
                    USERNAME: {
                        index: 2,
                        label: "USERNAME"
                    },
                    HOST: {
                        index: 3,
                        label: "HOST"
                    },
                    CREATED: {
                        index: 4,
                        label: "CREATED"
                    }
                } ),
                actions: [
                    {
                        name: "dblink-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    {
                        name: "dblink-test",
                        label: getActionMessage("TEST" ),
                        icon: "icon-ob-test",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let args = {
                                id: objectInstance.id,
                                owner: objectInstance.owner,
                                schema: objectInstance.schema,
                                name: objectInstance.name
                            };

                            return openDialog( "dialogDBLinkTest", args );
                        }
                    }
                ]
            },
            synonymsView,
            ddlView
        ]
    } );

    registerObjectType( "MATERIALIZED_VIEW", {
        icon: "icon-ob-materialized-view",
        views: [
            {
                labelKey: "MATERIALIZED_VIEW",
                id: ID_MAIN,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: ID_SUMMARY,
                        headingKey: TM_SUMMARY,
                        modelEditable: true,
                        hidden: true,
                        shape: SHAPE_RECORD,
                        columns: summaryColumns
                    },
                    {
                        subId: ID_COLS,
                        headingKey: TM_COLUMNS,
                        modelEditable: true,
                        identityField: "COLUMN_ID",
                        noDataMessage: columnsNoDataMessage,
                        columns: ( columns => {
                            let c,
                                copy = extend( true, {}, columns ); // make a deep copy of columns

                            // materialized views do not have an identity column so hide it
                            c = copy.IDENTITY;
                            c.hidden = true;
                            c.canHide = false;
                            // materialized views do not have an invisible column
                            delete copy.INVISIBLE;
                            return copy;
                        } )( columnsColumns ) // materialized view columns very similar to columnsColumns
                    }
                ],
                actions: [
                    {
                        name: "materialized-view-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    },
                    "comment"
                ]
            },
            {
                id: ID_DATA,
                type: VT_GRID,
                noDataMessage: dataNoDataMessage,
                columns: null, // don't know yet, fetch at runtime
                actions: ["choose-columns", "filter", "count-rows", "download-excel"]
            },
            {
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                columns:  applyRecordFieldDefaults( {
                    OWNER: {
                        index: 0,
                        label: "OWNER"
                    },
                    NAME: {
                        index: 1,
                        label: "NAME"
                    },
                    TABLE_NAME: {
                        index: 2,
                        label: "TABLE_NAME"
                    },
                    MASTER_VIEW: {
                        index: 3,
                        label: "MASTER_VIEW"
                    },
                    MASTER_OWNER: {
                        index: 4,
                        label: "MASTER_OWNER"
                    },
                    MASTER: {
                        index: 5,
                        label: "MASTER"
                    },
                    MASTER_LINK: {
                        index: 6,
                        label: "MASTER_LINK"
                    },
                    CAN_USE_LOG: {
                        index: 7,
                        label: "USE_LOG"
                    },
                    UPDATABLE: {
                        index: 8,
                        label: "UPDATABLE"
                    },
                    REFRESH_METHOD: {
                        index: 9,
                        label: "REFRESH_METHOD"
                    },
                    LAST_REFRESH: {
                        index: 10,
                        label: "LAST_REFRESH"
                    },
                    ERROR: {
                        index: 11,
                        label: "ERROR"
                    },
                    FR_OPERATIONS: {
                        index: 12,
                        label: "FR_OPERATIONS"
                    },
                    CR_OPERATIONS: {
                        index: 13,
                        label: "CR_OPERATIONS"
                    },
                    TYPE: {
                        index: 14,
                        label: "TYPE"
                    },
                    NEXT: {
                        index: 15,
                        label: "NEXT"
                    },
                    START_WITH: {
                        index: 16,
                        label: "START_WITH"
                    },
                    REFRESH_GROUP: {
                        index: 17,
                        label: "REFRESH_GROUP"
                    },
                    UPDATE_TRIG: {
                        index: 18,
                        label: "UPDATE_TRIGGER"
                    },
                    UPDATE_LOG: {
                        index: 19,
                        label: "UPDATE_LOG"
                    },
                    QUERY: {
                        index: 20,
                        label: "QUERY"
                    },
                    MASTER_ROLLBACK_SEG: {
                        index: 21,
                        label: "MASTER_ROLLBACK"
                    },
                    STATUS: {
                        index: 22,
                        label: TM_STATUS
                    },
                    REFRESH_MODE: {
                        index: 23,
                        label: "REFRESH_MODE"
                    },
                    PREBUILT: {
                        index: 24,
                        label: "PREBUILT"
                    }
                } )
            },
            grantsView,
            dependenciesView,
            ddlView
        ]
    } );

    registerObjectType( "SYNONYM", {
        icon: "icon-ob-synonym",
        views: [
            {
                labelKey: TM_OBJECT_DETAILS,
                id: ID_DETAILS,
                type: VT_NVP,
                shape: SHAPE_RECORD,
                columns: applyRecordFieldDefaults( {
                    SYNONYM_OWNER: {
                        index: 0,
                        label: "SYNONYM_OWNER",
                    },
                    SYNONYM_NAME: {
                        index: 1,
                        label: "SYNONYM_NAME"
                    },
                    OBJECT_OWNER: {
                        index: 2,
                        label: "OBJECT_OWNER"
                    },
                    OBJECT_NAME: {
                        index: 3,
                        label: "OBJECT_NAME",
                        cellTemplate: makeOpenLink( "&OBJECT_OWNER.", "&OBJECT_NAME.", "&OBJECT_TYPE." )
                    },
                    OBJECT_TYPE: {
                        index: 4,
                        label: "OBJECT_TYPE"
                    },
                    STATUS: {
                        index: 5,
                        label: TM_STATUS
                    },
                    OBJECT_ID: {
                        index: 6,
                        hidden: true,
                        canHide: false
                    }
                } ),
                actions: [
                    {
                        name: "synonym-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            return openDropObjectDialog();
                        }
                    }
                ]
            }
        ]
    } );

    registerObjectType( "SODA_COLLECTION", {
        icon: "icon-ob-soda",
        views: [
            {
                labelKey: "COL_CONTENTS",
                id: ID_DETAILS,
                type: VT_NVP_GRID,
                subViews: [
                    {
                        subId: ID_SUMMARY,
                        headingKey: TM_SUMMARY,
                        shape: SHAPE_RECORD,
                        columns: applyRecordFieldDefaults( {
                            DOCUMENT_COUNT: {
                                index: 0,
                                label: "DOCUMENT_COUNT"
                            },
                        } )
                    },
                    {
                        subId: "CONTENTS",
                        headingKey: "CONTENTS",
                        hasSize: false,
                        columns: applyGridColumnDefaults( {
                            KEY: {
                                index: 0,
                                heading: "KEY",
                                usedAsRowHeader: true,
                                width: 280
                            },
                            CONTENT: {
                                index: 1,
                                heading: "CONTENT",
                                width: 280
                            },
                            CONTENT_SIZE: {
                                index: 2,
                                heading: "SIZE",
                                headingAlignment: "end",
                                alignment: "end",
                                width: mediumNumberColumnWidth
                            },
                            CREATED: {
                                index: 3,
                                heading: "CREATED",
                                headingAlignment: "center",
                                alignment: "center",
                                width: dateColumnWidth
                            },
                            LAST_MODIFIED: {
                                index: 4,
                                heading: "LAST_MODIFIED",
                                headingAlignment: "center",
                                alignment: "center",
                                width: dateColumnWidth
                            }
                        } )
                    }
                ],
                actions: [
                    {
                        name: "soda-load-data",
                        label: getActionMessage("LOAD_DATA" ),
                        icon: "icon-ob-load-data",
                        action: function( event, el ) {
                            const objectInstance = getCurrentInstance();

                            if ( objectInstance.type === "SODA_COLLECTION" && objectInstance.currentViewId === "DETAILS" ) {
                                return doLinkAction( el, "LOAD_SODA_COLLECTION", {
                                    TABLE_NAME: objectInstance.name,
                                    PARSING_SCHEMA: objectInstance.schema
                                } );
                            }
                        }
                    },
                    {
                        name: "soda-drop",
                        label: getActionMessage( TM_DROP ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name
                                };

                            return openDialog( "dialogDropSODA", args );
                        }
                    }
                ]
            },
            {
                id: "GUIDE",
                type: VT_NVP_EDITOR,
                subViews: [
                    {
                        subId: "GUIDE_SUMMARY",
                        headingKey: TM_SUMMARY,
                        shape: SHAPE_RECORD,
                        columns: applyRecordFieldDefaults( {
                            SEARCH_INDEX: {
                                index: 0,
                                label: "SEARCH_INDEX"
                                // No link is needed here because it is not too useful to visit the index
                            },
                            STATUS: {
                                index: 1,
                                label: TM_STATUS
                            },
                            VIEWS: {
                                index: 2,
                                label: "RELATIONAL_VIEWS",
                                cellTemplate: `{loop VIEWS/}
<a href='#action$open-object?id=&APEX$ITEM%id.&owner=&"owner".&label=&APEX$ITEM%name.&type=VIEW'>&APEX$ITEM%name.</a>
{endloop/}` // todo xxx make this list of links look nicer
                            }
                        } )
                    },
                    {
                        subId: "GUIDE_JSON",
                        headingKey: "DATA_GUIDE",
                        language: L_JSON,
                        readOnly: true
                    }
                ],
                updateActions: function( objectInstance ) {
                    const model = objectInstance.models.get( "GUIDE_GUIDE_SUMMARY" );
                    let searchIndex = false;

                    if ( model && model.getRecord() ) {
                        searchIndex = model.getValue( "SEARCH_INDEX" );
                    }
                    if ( searchIndex ) {
                        apexActions.hide( "soda-create-search" );
                        apexActions.show( "soda-drop-search" );
                        apexActions.enable( "soda-create-view" );
                    } else {
                        apexActions.show( "soda-create-search" );
                        apexActions.hide( "soda-drop-search" );
                        apexActions.disable( "soda-create-view" );
                    }
                },
                actions: [
                    {
                        name: "soda-create-search",
                        label: getActionMessage( "CREATE_SEARCH_INDEX" ),
                        icon: "icon-ob-add",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "GUIDE_GUIDE_SUMMARY" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            return openDialog( "dialogSODAIndex", args );
                        }
                    },
                    {
                        name: "soda-drop-search",
                        label: getActionMessage( "DROP_SEARCH_INDEX" ),
                        icon: "icon-ob-drop",
                        action: function() {
                            const objectInstance = getCurrentInstance(),
                                model = objectInstance.models.get( "GUIDE_GUIDE_SUMMARY" ),
                                indexName = model.getValue( "SEARCH_INDEX" );
                            let p = sendCommand( objectInstance.schema, objectInstance.owner, "drop_soda_index", {
                                    objectId: this.objId,
                                    objectName: objectInstance.name,
                                    objectType: "SODA_COLLECTION",
                                    indexName: indexName
                                }, objectInstance.tabPanel$ );

                            p.then( ( { success } ) => {
                                if ( success ) {
                                    apexActions.invoke( "refresh-view" );
                                    apexActions.invoke( "objects-refresh" ); // refresh tree because an index is dropped
                                }
                            } );
                        }
                    },
                    {
                        name: "soda-create-view",
                        label: getActionMessage( "CREATE_RELATIONAL_VIEW" ),
                        icon: "icon-ob-add",
                        action: function() {
                            const objectInstance = getCurrentInstance();
                            let model = objectInstance.models.get( "GUIDE_GUIDE_SUMMARY" ),
                                args = {
                                    id: objectInstance.id,
                                    owner: objectInstance.owner,
                                    schema: objectInstance.schema,
                                    name: objectInstance.name,
                                    model: model
                                };

                            return openDialog( "dialogSODAView", args );
                        }
                    }
                ]
            },
            {
                id: "META",
                type: VT_NVP_EDITOR,
                subViews: [
                    {
                        subId: "METADATA_SUMMARY",
                        headingKey: TM_SUMMARY,
                        shape: SHAPE_RECORD,
                        columns: applyRecordFieldDefaults( {
                            ENDPOINT: {
                                index: 0,
                                label: "ENDPOINT",
                                cellTemplate: '<a href="&ENDPOINT!ATTR." target="_blank">&ENDPOINT.</a>'
                            }
                        } )
                    },
                    {
                        subId: "METADATA_JSON",
                        headingKey: "META_DATA",
                        language: L_JSON,
                        readOnly: true
                    }
                ]
            },
        ]
    } );

    registerObjectType( "MLE_ENVIRONMENT", {
        icon: "icon-ob-mle-env",
        views: mleEnvViews
    } );

    registerObjectType( "MLE_MODULE", {
        icon: "icon-ob-mle-module",
        views: mleModViews
    } );

} )( apex.jQuery, objectBrowser, apex.lang, apex.actions, apex.message );
