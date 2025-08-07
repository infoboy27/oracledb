/*!
 * Copyright (c) 2022, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * This file has all functions used in create object wizard pages in object browser
 *
**/
// create a namespace
let objectBrowserWizard = {};

( function( $, objectBrowserWizard, apexPage, apexRegion, apexLang ) {
    "use strict";

    // IG Initialization code
    // Adds up and down buttons to IG actions
    // Used in create table wizard page
    objectBrowserWizard.initIG = function( config ) {
        const toolbarData = $.apex.interactiveGrid.copyDefaultToolbar(),
              toolbarGroup = toolbarData.toolbarFind( "actions3" );

        // add the move up/down buttons see actions defined below
        toolbarGroup.controls.unshift({
            type: "BUTTON",
            iconOnly: true,
            icon: "icon-up-chevron",
            action: "selection-move-up"
        } );
        toolbarGroup.controls.unshift({
            type: "BUTTON",
            iconOnly: true,
            icon: "icon-down-chevron",
            action: "selection-move-down"
        });

        config.toolbarData = toolbarData;

        config.initActions = function( actions ) {
            actions.add( [
                {
                    name: "selection-move-up",
                    labelKey: "OB.MOVE_UP",
                    shortcut: "Alt+Up",
                    action: function( event ) {
                        let after$,
                            after = null,
                            focus = event.type === "keydown",
                            view = $( actions.context ).interactiveGrid( "getViews" ).grid,
                            grid$ = view.view$,
                            model = view.model,
                            rows = grid$.grid( "getSelection" ),
                            items = grid$.grid( "getSelectedRecords" );

                        if ( rows[0].prev().length ) {
                            after$ = rows[0].prev().prev();
                            if ( after$.length ) {
                                after = grid$.grid( "getRecords", [after$] )[0];
                            }
                            model.moveRecords( items, null, after );
                            grid$.grid( "setSelectedRecords", items, focus );
                        }
                        if ( focus ) {
                            return true; // don't change the focus for key events
                        }
                    }
                },
                {
                    name: "selection-move-down",
                    labelKey: "OB.MOVE_DOWN",
                    shortcut: "Alt+Down",
                    action: function( event ) {
                        let after$,
                            after = null,
                            focus = event.type === "keydown",
                            view = $( actions.context ).interactiveGrid( "getViews" ).grid,
                            grid$ = view.view$,
                            model = view.model,
                            rows = grid$.grid( "getSelection" ),
                            items = grid$.grid( "getSelectedRecords" );

                        after$ = rows[rows.length - 1].next();
                        if ( after$.length ) {
                            after = grid$.grid( "getRecords", [after$] )[0];
                            model.moveRecords( items, null, after );
                            grid$.grid( "setSelectedRecords", items, focus );
                        }
                        if ( focus ) {
                            return true; // don't change the focus for key events
                        }
                    }
                }
            ] );
            actions.remove( "single-row-view" );
            actions.remove( "row-duplicate" );
            actions.remove( "row-refresh" );
            actions.remove( "row-revert" );
            actions.lookup( "row-add-row" ).label = apexLang.getMessage( "OB.ACTION_ADD_COL" );
            actions.lookup( "row-delete" ).label = apexLang.getMessage( "OB.ACTION_DEL_COL" );
        };

        // let the model manage the sequence column
        config.defaultModelOptions = {
            sequenceField: "SORT_ORDER",
            sequenceStep: 10
        };

        return config;
    };

    // returns number of rows in IG region
    objectBrowserWizard.getIGRowCount = function ( staticId ) {
        const model = apexRegion( staticId ).widget().interactiveGrid( "getCurrentView" ).model;
        return model.getTotalRecords();
    };

    // enquotes the given string with double quotes
    objectBrowserWizard.enquote = function ( inputStr ) {
        return '"' + inputStr + '"';
    };

    // returns create index DDL
    objectBrowserWizard.getIndexDDL = function ( tableName, indexName, uniqueFlag, col1, col2, col3, col4, indexType, useV2, pointsOnly ) {
        let indexTypeDDL,
            indexDDL;

        switch ( indexType ) {
          case "N":
            indexTypeDDL = "";
            break;
          case "T":
            indexTypeDDL = "\nindextype is ctxsys.context";
            break;
          case "S":
            indexTypeDDL = `\nindextype is ${(( useV2 === "Y" ) ? "mdsys.spatial_index_v2" : "mdsys.spatial_index")} ${(( pointsOnly === "Y" ) ?  "\nparameters('layer_gtype=point')" : "")}` ;
        }

        indexDDL = `create ${( uniqueFlag === "Y" && indexType === "N" ) ? "unique ":""}index "${indexName}"\non "${tableName}" ( "${col1}"${( col2 !== "" && indexType === "N" ) ? "," + objectBrowserWizard.enquote( col2 ) : ""}${( col3 !== "" && indexType === "N" ) ? "," + objectBrowserWizard.enquote( col3 ) : ""}${( col4 !== "" && indexType === "N" ) ? "," + objectBrowserWizard.enquote( col4 ) : ""} )${indexTypeDDL};`;

        return indexDDL;
    };

    // submits the page by setting itemName with editFlag value
    // this is used in Create Index page, for spatial indexes
    objectBrowserWizard.branchToRegisterColumn = function ( itemName, editFlag ) {
        apexPage.submit( {
            request: "REGISTER_COLUMN",
            set: {
               [itemName]: editFlag },
            showWait: true} );
    };

    // returns create sequence DDL
    objectBrowserWizard.getSequenceDDL = function ( seqName, startWith, incrementBy, minVal, maxVal, cycleFlag, cacheCount ) {
        let seqDDL = `create sequence "${seqName}"${(startWith !== "")?"\nstart with " + startWith :""}${(incrementBy !== "")?"\nincrement by "+ incrementBy :""}\n${(cacheCount === 0 || cacheCount === "")?"nocache":"cache "+ cacheCount}${(minVal !== "")?"\nminvalue "+ minVal :""}${(maxVal !== "")?"\nmaxvalue "+ maxVal :""}\n${(cycleFlag === "Y")?"cycle":"nocycle"};`;
        return seqDDL;
    };

    // returns create type DDL
    objectBrowserWizard.getTypeDDL = function  ( typeName, collType, limit, dataType, objectName, length, precision, scale ) {
        let dataTypeStr,
            typeDDL,
            precisionScaleStr = "";

        if ( dataType === "number" || dataType === "decimal" || dataType === "float" ) {
            if ( precision !== "" &&  scale !== "" ) {
                precisionScaleStr = `(${precision},${scale})`;
            } else if ( precision !== "" &&  scale === "" ) {
                precisionScaleStr = `(${precision})`;
            }
        }

        switch( dataType ) {
            case "nest":
                dataTypeStr = `"${objectName}"`;
                break;
            case "raw":
            case "varchar2":
            case "char":
                dataTypeStr = `${dataType}(${length})`;
                break;
            case "number":
            case "decimal":
                dataTypeStr = `${dataType}${precisionScaleStr}`;
                break;
            case "float":
                dataTypeStr = `${dataType}${precisionScaleStr}`;
                break;
            default:
                dataTypeStr = dataType;
                break;
        }

        typeDDL = `create type "${typeName}" as
${( collType === "V" ) ? "varray(" + limit + ") of":"table of"} ${dataTypeStr};`;
        return typeDDL;
    };

    // returns create package spec code
    objectBrowserWizard.getPackageSpec = function ( packageName, sampleCodeFlag ) {
        let code = `
--==============================================================================
-- comments about procedure
--==============================================================================
procedure process_emp_data (
    p_empno      in out number,
    p_ename      in     varchar2,
    p_job        in     varchar2,
    p_mgr        in     number,
    p_hiredate   in     date,
    p_sal        in     number,
    p_comm       in     number,
    p_deptno     in     number,
    p_row_status in     varchar2 );

--==============================================================================
-- comments about function
--==============================================================================
function get_ename (
    p_empno in number )
return varchar2;
`;

        return `create or replace package "${packageName}" as
${( sampleCodeFlag === "Y" ) ? code:""}
end "${packageName}";
/`;
    };

    // returns create package body code
    objectBrowserWizard.getPackageBody = function ( packageName, sampleCodeFlag ) {
        let code = `
--==============================================================================
-- Public API, see specification
--==============================================================================
procedure process_emp_data (
    p_empno      in out number,
    p_ename      in     varchar2,
    p_job        in     varchar2,
    p_mgr        in     number,
    p_hiredate   in     date,
    p_sal        in     number,
    p_comm       in     number,
    p_deptno     in     number,
    p_row_status in     varchar2 )
is
begin
    apex_debug.enter(
        'process_emp_data' ,
        'p_empno'          , p_empno,
        'p_empno'          , p_empno,
        'p_job'            , p_job,
        'p_mgr'            , p_mgr,
        'p_hiredate'       , p_hiredate,
        'p_sal'            , p_sal,
        'p_comm'           , p_comm,
        'p_deptno'         , p_deptno,
        'p_row_status'     , p_row_status );

    -- enter the procedure code here

end process_emp_data;

--==============================================================================
-- Public API, see specification
--==============================================================================
function get_ename (
    p_empno in number )
return varchar2
is
    l_ename varchar2(255);
begin
    apex_debug.enter(
        'get_ename' ,
        'p_empno'   , p_empno );

    -- enter the function code here
    /*
    select ename
      into l_ename
      from emp
     where empno = p_empno;
    */
    return l_ename;
exception
    when no_data_found then
        apex_debug.warn(
            p_message => 'Employee not found. p_empno %s, sqlerrm %s',
            p0        => p_empno,
            p1        => sqlerrm );
        raise;
end get_ename;
`;

        return `create or replace package body "${packageName}" as
${( sampleCodeFlag === "Y" ) ? code:""}
end "${packageName}";
/`;
    };

    // returns create function code
    objectBrowserWizard.getFunctionDDL = function ( functionName, sampleCodeFlag ) {
        if ( sampleCodeFlag === "Y" ) {
            return `create or replace function "${functionName}" (
    p_empno in number )
return varchar2
as
    l_ename varchar2(255);
begin
    apex_debug.enter(
        '${functionName}' ,
        'p_empno'   , p_empno );

    -- enter the function code here
    /*
    select ename
      into l_ename
      from emp
     where empno = p_empno;
    */
    return l_ename;
exception
    when no_data_found then
        apex_debug.warn(
            p_message => 'Employee not found. p_empno %s, sqlerrm %s',
            p0        => p_empno,
            p1        => sqlerrm );
        raise;
end "${functionName}";
/`;
        } else {
            return `create or replace function "${functionName}"
return varchar2
as
begin
    return null;
end "${functionName}";
/`;
        }
    };

    // returns create procedure code
    objectBrowserWizard.getProcedureDDL = function ( procedureName, sampleCodeFlag ) {
        if ( sampleCodeFlag === "Y" ) {
            return `create or replace procedure "${procedureName}" (
    p_empno      in out number,
    p_ename      in     varchar2,
    p_job        in     varchar2,
    p_mgr        in     number,
    p_hiredate   in     date,
    p_sal        in     number,
    p_comm       in     number,
    p_deptno     in     number,
    p_row_status in     varchar2 )
as
begin
    apex_debug.enter(
        '${procedureName}' ,
        'p_empno'          , p_empno,
        'p_empno'          , p_empno,
        'p_job'            , p_job,
        'p_mgr'            , p_mgr,
        'p_hiredate'       , p_hiredate,
        'p_sal'            , p_sal,
        'p_comm'           , p_comm,
        'p_deptno'         , p_deptno,
        'p_row_status'     , p_row_status );

    -- enter the procedure code here
end "${procedureName}";
/`;
        } else {
            return `create or replace procedure "${procedureName}"
as
begin
    null;
end "${procedureName}";
/`;
        }
    };

    // Main function called from Create package/function/procedure wizard page
    // depending on objectType, it calls other functions to get the relevant code
    objectBrowserWizard.generateCode = function ( objectName, objectType, sampleCodeFlag ) {
        let ddl;

        switch ( objectType ) {
          case "PACKAGE":
            ddl = objectBrowserWizard.getPackageSpec( objectName, sampleCodeFlag );
            break;
          case "PACKAGE BODY":
            ddl = objectBrowserWizard.getPackageBody( objectName, sampleCodeFlag );
            break;
          case "FUNCTION":
            ddl = objectBrowserWizard.getFunctionDDL( objectName, sampleCodeFlag );
            break;
          case "PROCEDURE":
            ddl = objectBrowserWizard.getProcedureDDL( objectName, sampleCodeFlag );
        }

        return ddl;
    };

    // returns create db-link ddl
    objectBrowserWizard.getDBLinkDDL = function ( dbLinkName, connectSchema, passwordText, remoteHost, port, SIDOrService, SSName ) {
        let dbLinkDDL;
        dbLinkDDL = `create database link "${dbLinkName}"
connect to "${connectSchema}" identified by "${passwordText}"
using '(description =
(address_list =
  (address = (protocol = tcp)(host = ${remoteHost})(port = ${port}))
)
(connect_data =
     (${SIDOrService} = ${SSName})
))';`;

        return dbLinkDDL;
    };

    // returns create Synonym ddl
    objectBrowserWizard.getSynonymDDL = function ( synonymName, dbLocation, schemaTo, objectTo, remoteObjectTo, dbLink ) {
        let target = (( dbLocation === "LOCAL" ) ? `"${schemaTo}"."${objectTo}"`:`"${remoteObjectTo}"@"${dbLink}"` ),
            synonymDDL = `create synonym "${synonymName}" for ${target};`;
        return synonymDDL;
    };

    // returns create trigger ddl
    objectBrowserWizard.getTriggerSQL = function ( tableName, triggerName, beforeOrAfter ) {
        let triggerDDL = `create or replace trigger "${triggerName}"
${beforeOrAfter}
insert or update or delete on "${tableName}"
for each row
begin
    null;
end;
/`;
        return triggerDDL;
    };
} )( apex.jQuery, objectBrowserWizard, apex.page, apex.region, apex.lang );