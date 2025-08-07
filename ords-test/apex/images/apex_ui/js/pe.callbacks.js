/*!
 * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * todo documentation
 **/

/* global pe */

/**
 * @namespace
 **/
( function( model, $, util, locale, lang, pd, date ) {
    "use strict";

    let ITEM_TYPE = {
            RICH_TEXT_EDITOR: "NATIVE_RICH_TEXT_EDITOR",
            TEXTAREA:         "NATIVE_TEXTAREA",
            FILE:             "NATIVE_FILE",
            IMAGE_UPLOAD:     "NATIVE_IMAGE_UPLOAD",
            HIDDEN:           "NATIVE_HIDDEN",
            TEXT_FIELD:       "NATIVE_TEXT_FIELD",
            MARKDOWN_EDITOR:  "NATIVE_MARKDOWN_EDITOR",
            NUMBER_FIELD:     "NATIVE_NUMBER_FIELD",
            DATE_PICKER:      "NATIVE_DATE_PICKER_APEX",
            ROW_ACTION:       "NATIVE_ROW_ACTION",
            ROW_SELECTOR:     "NATIVE_ROW_SELECTOR",
            INPUT:            "NATIVE_INPUT",
            RANGE:            "NATIVE_RANGE",
            // lov based items
            AUTO_COMPLETE:    "NATIVE_AUTO_COMPLETE",
            CHECKBOX:         "NATIVE_CHECKBOX",
            COMBOBOX:         "NATIVE_COMBOBOX",
            LIST_MANAGER:     "NATIVE_LIST_MANAGER",
            POPUP_LOV:        "NATIVE_POPUP_LOV",
            RADIOGROUP:       "NATIVE_RADIOGROUP",
            SELECT_LIST:      "NATIVE_SELECT_LIST",
            SHUTTLE:          "NATIVE_SHUTTLE"
        },
        REGION_TYPE = {
            FACETED_SEARCH:   "NATIVE_FACETED_SEARCH",
            SMART_FILTERS:    "NATIVE_SMART_FILTERS",
            IG:               "NATIVE_IG",
            FORM:             "NATIVE_FORM"
        },
        PROCESS_TYPE = {
            INVOKE_API:       "NATIVE_INVOKE_API",
            EXECUTION_CHAIN:  "NATIVE_EXECUTION_CHAIN",
            DOWNLOAD:         "NATIVE_DOWNLOAD",
            PRINT_REPORT:     "NATIVE_PRINT_REPORT",
            INVOKE_WF:        "NATIVE_INVOKE_WF",
            WORKFLOW:         "NATIVE_WORKFLOW",
        },
        gSavedSourceSqlQuery = "";

    // order by properties
    const SOURCE_QUERY_ORDER_BY_PROPS = [
        model.PROP.SOURCE_QUERY_ORDER_BY,
        model.PROP.SOURCE_QUERY_ORDER_BY_ITEM,
        model.PROP.SOURCE_GRAPH_ORDER_BY,
        model.PROP.SOURCE_GRAPH_ORDER_BY_ITEM
     ];

    const REQUIRED_VALUE_TYPE = {
              BASIC:  "BASIC",
              BLOB:   "BLOB",
              CUSTOM: "CUSTOM",
              ITEM:   "ITEM" };

    const ITEM_TYPE_TEXTAREA_THRESHOLD = 256;

    const hasOwnProperty = util.hasOwnProperty;

    // this regex can be used to identify if a string contains an item substitution
    const REGEX_STRING_HAS_ITEM_SUBSTITUTION = /&([A-Za-z0-9_$#]+(?:%[A-Za-z0-9_]+)?)\./g;

    function msg( pKey ) {
        return lang.getMessage( "MODEL.CALLBACKS." + pKey );
    } // msg

    function format( pKey ) {
        var pattern = msg( pKey ),
            args = [ pattern ].concat( Array.prototype.slice.call( arguments, 1 ) );
        return lang.format.apply( this, args );
    } // format

    function _hasChanged( pProperty, pAction, pChangedProperty, pOldValue ) {

        return (  pProperty
               && (  pAction === model.CALLBACK_ACTION.CREATED
                  || (  pAction === model.CALLBACK_ACTION.CHANGED
                     && pChangedProperty.id === pProperty.id
                     && ( pProperty.getValue() !== pOldValue || pOldValue === undefined )
                     )
                  )
               );
    } // _hasChanged


    function _hasChangedEqualsTo( pProperty, pAction, pChangedProperty, pValue ) {

        return (  _hasChanged( pProperty, pAction, pChangedProperty )
               && pProperty.getValue() === pValue
               );
    } // _hasChangedEqualsTo


    function _hasChangedNotEqualsTo( pProperty, pAction, pChangedProperty, pValue ) {

        return (  _hasChanged( pProperty, pAction, pChangedProperty )
               && pProperty.getValue() !== pValue
               );
    } // _hasChangedNotEqualsTo


    function _removeComponents( pComponents ) {

        for ( let i = 0; i < pComponents.length; i++ ) {
            pComponents[ i ].remove();
        }
    }

    function _removeChildren( pComponent, pTypeId ) {

        _removeComponents( pComponent.getChilds( pTypeId ) );

    } // _removeChildren

    function _setPropertyValue( pComponent, pPropertyId, pValue ) {

        var lProperty = pComponent.getProperty( pPropertyId );

        // only set the property if it really exists and it has changed
        if ( lProperty ) {
            lProperty.setValue( pValue );
        }
    } // _setPropertyValue

    function _revalidateProperty( pComponent, pPropertyId ) {

        let lProperty;

        // we support passing a property object as pPropertyId parameter
        // this can be handy if the calling logic already resolved a property
        if ( !pComponent && pPropertyId && pPropertyId instanceof Object ) {
            lProperty = pPropertyId;
        } else {
            lProperty = pComponent.getProperty( pPropertyId );
        }

        // force a re-validation and set property value to existing value
        if ( lProperty ) {
            lProperty.setValue( lProperty.getValue(), true );
        }
    } // _revalidateProperty

    function _setSlot( {
        componentTypeId,
        action,
        property,
        oldRegionId,
        component
    } ) {
        // We should only set the slot if the callback action is "changed" or "validate"
        // Early exit if not one of those two actions
        if ( ![ model.CALLBACK_ACTION.CHANGED, model.CALLBACK_ACTION.VALIDATE ].includes( action ) ) {
            return;
        }

        const isRegion = componentTypeId === model.COMP_TYPE.REGION;
        const regionPropertyId = isRegion ? model.PROP.PARENT_REGION : model.PROP.REGION;
        const newSlotPlaceholder = component.getPropertyValue( model.PROP.SLOT_PLACEHOLDER );

        if ( action === model.CALLBACK_ACTION.VALIDATE && property.id === regionPropertyId ) {
            // Upon the CALLBACK_ACTION.VALIDATE event, we have access to the old slot
            // so lets save it temporarily, so we can use it upon the subsequent CALLBACK_ACTION events
            component.oldSlotPlaceholder = newSlotPlaceholder;
            return;
        }

        const regionId = component.getPropertyValue( regionPropertyId );

        // If the slotplaceholder is not set  - we will enforce slot control
        let supportedItemType;
        let supportedRegionType;
        if ( !newSlotPlaceholder || newSlotPlaceholder === "INVALID" ) {
            if ( componentTypeId === model.COMP_TYPE.PAGE_ITEM ) {
                supportedItemType = component.getPropertyValue( model.PROP.ITEM_TYPE );
            }
            if ( componentTypeId === model.COMP_TYPE.REGION ) {
                supportedRegionType = component.getPropertyValue( model.PROP.REGION_TYPE );
            }
        }
        const slots = model.getSlots( { componentTypeId, regionId, supportedItemType, supportedRegionType } );

        const setDefaultSlot = () => {
            // Get the default slot where this component should go into
            const defaultSlotPlaceholder = model.getSlot( { componentTypeId, regionId, supportedItemType, supportedRegionType } )?.placeholder;
            if ( defaultSlotPlaceholder ) {
                // One last check if the list of slots contains the default one
                // New parent does not have the old slot, so let's find if the parent container has the default position
                const hasSlot = slots.some( slot => slot.placeholder === defaultSlotPlaceholder );
                // Default position was found in parent, so let's put the component in the default position
                if ( hasSlot ) {
                    _setPropertyValue( component, model.PROP.SLOT_PLACEHOLDER, defaultSlotPlaceholder );
                }
            }
        };

        if ( action === model.CALLBACK_ACTION.VALIDATE
            && property.id !== model.PROP.SLOT_PLACEHOLDER
            && newSlotPlaceholder === "" ) {
            // When a new component is created automatically, all the properties of the new component are populated
            // based on the global default properties. Therefore, the slot placeholder could've been "" which is invalid.
            // So we need to set the slot placeholder to be the default one when the VALIDATE callback action catches
            // cascading effect. Then the CHANGED callback action is used to reset the slot placeholder if necessary.

            // The slot placeholder may need to be set for any property validate except for the SLOT_PLACEHOLDER property

            // For example, when a form region's data source is updated, the components for the columns are created
            // automatically, the slot placeholder could be "" depending on the global setting. If the slot placeholder
            // is "", we have to set it in the VALIDATE action because no CHANGED action will be triggered for the
            // SLOT_PLACEHOLDER property when a form region's data source is updated implicitly.
            setDefaultSlot();
        } else if ( action === model.CALLBACK_ACTION.CHANGED ) {
            // We should only set the slot when the REGION or PARENT_REGION
            // properties are changed.
            // If there are no slots available, the component gets moved to a slot that's invalid by definition
            if ( slots.length === 0 ) {
                component._properties[ model.PROP.SLOT_PLACEHOLDER ]._value = "INVALID";
            }

            if ( property.id === regionPropertyId) {
                // No forced slot found, so that must be a move between parent region
                // else logic: if newSlotPlaceholder !== "", then that means we should not find a default value, and leave it be
                if ( newSlotPlaceholder === "" ) {
                    const hasOldSlot = slots.some( slot => slot.placeholder === component.oldSlotPlaceholder );
                    // Check if the new parent has that the old slot
                    // New parent has the old slot so let's put the component in this slot again
                    if ( hasOldSlot &&
                        // Only do this operation if the move is from page to page slot or from region to region slot
                        ( ( regionId === "" && oldRegionId === "" ) || ( regionId && oldRegionId ) ) ) {
                        _setPropertyValue( component, model.PROP.SLOT_PLACEHOLDER, component.oldSlotPlaceholder );
                    } else {
                        setDefaultSlot();
                    }
                }
                // Cleanup
                delete component.oldSlotPlaceholder;
            } else if ( property.id === model.PROP.SLOT_PLACEHOLDER ) {
                const hasSlot = slots.some( slot => slot.placeholder === property.getValue() );
                if ( !hasSlot ) {
                    setDefaultSlot();
                }
            }
        }

    } // _setSlot

    function initCapColumnName( pColumnName ) {
        // initcap column name and replace underscores with spaces
        // Escape column name to avoid issues if the column name contains html meta characters, because the column heading is normally not escaped
        return util.escapeHTML(
            pColumnName
                .replace( /_+/g, "_" ).replace( /^_+/, "" ).replace( /_+$/, "" ).replace( /_/g, " " )
                .toLowerCase()
                .split( " " )
                .map( function( word ) {
                        var firstWord = word[ 0 ] || "";
                        return word.replace( firstWord, firstWord.toUpperCase() );
                } )
                .join( " " )
        );
    } // initCapColumnName


    function getLegacyDmlProcesses() {

        return model.getComponents( model.COMP_TYPE.PAGE_PROCESS, {
            properties: [{
                id:    model.PROP.PAGE_PROCESS_TYPE,
                value: new RegExp( "^(NATIVE_FORM_FETCH|NATIVE_FORM_PROCESS)$" )
            }]
        } );

    } // getLegacyDmlProcesses


    function _createComponent( pOptions ) {

        // Create the component if it doesn't exists
        if ( model.getComponents( pOptions.typeId, {
                parentId:   pOptions.parentId,
                properties: pOptions.searchPropertyValues
            } ).length === 0 )
        {
            new model.Component( {
                previousComponent: pOptions.previousComponent,
                typeId:   pOptions.typeId,
                parentId: pOptions.parentId,
                values:   pOptions.searchPropertyValues.concat( pOptions.addPropertyValues )
            } );
        }
    } // _createComponent


    function manageColumns( pRegion, pColumnsParent, pColumnComponentTypeId, pDbColumnPropertyId, pOptions ) {

        function getSqlColumns( pSqlColumns, pSetSqlColumn ) {

            var i,
                lColumns = [];

            for ( i = 0; i < pSqlColumns.length; i++ ) {
                lColumns.push( {
                    name:         pSqlColumns[ i ].name,
                    type:         pSqlColumns[ i ].type,
                    maxLen:       pSqlColumns[ i ].maxLen,
                    isRequired:   pSqlColumns[ i ].isRequired,
                    isGeneric:    pSqlColumns[ i ].isGeneric,
                    isPrimaryKey: pSqlColumns[ i ].isPrimaryKey,
                    isQueryOnly:  pSqlColumns[ i ].isQueryOnly,
                    no:           i + 1,
                    regionColumn: null
                } );

                if ( pSetSqlColumn ) {
                    pSetSqlColumn( lColumns[ i ] );
                }
            }
            return lColumns;
        } // getSqlColumns

        function removeUnusedColumns( pSqlColumns, pParent, pComponentTypeId, pOptions ) {

            var lComponents,
                i, j,
                lFound,
                lDbColumnProperty,
                lDbColumnName;

            if ( pParent ) {
                lComponents = pParent.getChilds( pComponentTypeId );
            } else {
                lComponents = model.getComponents( pComponentTypeId, pOptions.filter );
            }

            // Remove all columns/items which don't exist anymore or where the type has changed
            for ( i = 0; i < lComponents.length; i++ ) {
                lFound = false;
                lDbColumnProperty = lComponents[ i ].getProperty( pDbColumnPropertyId );
                if ( lDbColumnProperty ) {
                    lDbColumnName = lDbColumnProperty.getValue();
                } else {
                    // not a database column, we can ignore it
                    lFound = true;
                }
                for ( j = 0; j < pSqlColumns.length && !lFound; j++ ) {
                    if ( pSqlColumns[ j ].name === lDbColumnName && ( !pOptions.compareCheck || pOptions.compareCheck( pSqlColumns[ j ], lComponents[ i ] ) ) ) {
                        pSqlColumns[ j ].regionColumn = lComponents[ i ];
                        lFound = true;
                        break;
                    }
                }

                if ( !lFound && ( !pOptions.removeCheck || pOptions.removeCheck( lComponents[ i ] ) ) ) {
                    lComponents[ i ].remove();
                }
            }
        } // removeUnusedColumns


        function addUpdateColumns( pSqlColumns, pParent, pComponentTypeId, pOptions ) {

            var lComponents,
                i,
                lPreviousComponent,
                lValues;

            if ( pParent ) {
                lComponents = pParent.getChilds( pComponentTypeId );
            } else {
                lComponents = model.getComponents( pComponentTypeId, pOptions.filter );
            }

            // New columns should be added after the existing columns
            if ( lComponents.length > 0 ) {
                lPreviousComponent = lComponents[ lComponents.length - 1 ];
            }

            // Add all columns where we don't have a region/report column yet or update where something has changed
            for ( i = 0; i < pSqlColumns.length; i++ ) {

                // Filter function to skip columns we don't want to add (eg. IG Column BLOB)
                if (typeof pOptions.skipColumn === "function" &&
                    pOptions.skipColumn.call(undefined, pSqlColumns[ i ] ) ) {
                    continue;
                }

                // If the SQL statement contains a new column, add it.
                if ( !pSqlColumns[ i ].regionColumn ) {

                    lValues = [];
                    pOptions.add( lValues, pSqlColumns[ i ] );

                    if ( pParent ) {
                        lPreviousComponent = new model.Component( {
                            previousComponent:         lPreviousComponent,
                            typeId:                    pComponentTypeId,
                            parentId:                  pParent.id,
                            values:                    lValues,
                            ignorePropertyIfNotExists: true
                        } );
                    } else {
                        lPreviousComponent = new model.Component( {
                            previousComponent:         lPreviousComponent,
                            typeId:                    pComponentTypeId,
                            values:                    lValues,
                            ignorePropertyIfNotExists: true
                        } );
                    }

                } else {
                    pOptions.update( pSqlColumns[ i ].regionColumn, pSqlColumns[ i ] );
                }
            }
        }


        var lSqlColumns;

        // If we don't want that the ROWID column gets removed, we have read it as valid column but later remove it
        // before we are actually adding new columns. This is needed for IG which adds the ROWID column in case the IG
        // is editable and it shouldn't be removed as soon as the query is modified.

        lSqlColumns = model.getSourceLocationProperty( pRegion )?.getColumns( true );

        // Only if we have a valid SQL which has returned columns, we try to add/modify the report columns
        if ( lSqlColumns?.length > 0 ) {

            lSqlColumns = getSqlColumns( lSqlColumns, pOptions.setSqlColumn );

            // Remove all columns which don't exist anymore
            removeUnusedColumns( lSqlColumns, pColumnsParent, pColumnComponentTypeId, {
                compareCheck: pOptions.compareCheck,
                removeCheck:  pOptions.removeCheck,
                filter:       pOptions.filter
            } );

            // Add or Update columns
            addUpdateColumns( lSqlColumns, pColumnsParent, pColumnComponentTypeId, {
                add:        pOptions.add,
                update:     pOptions.update,
                filter:     pOptions.filter,
                skipColumn: pOptions.skipColumn
            } );
        }
    } // manageColumns

    function updateColumnAttributes( pComponent, pSqlColumn ) {
        const YES = "Y", NO = "N";
        let dataTypeProperty       = pComponent.getProperty( model.PROP.DATA_TYPE ),
            valueRequiredProperty  = pComponent.getProperty( model.PROP.VALUE_REQUIRED ),
            valueRequired          = ( pSqlColumn.isRequired ? YES : NO );

        // Update the column type property if it has changed
        // We intentionally don't set IS_VISIBLE ( or COLUMN_ALIGNMENT ), because that might have already
        // been changed by the developer
        if ( dataTypeProperty.getValue() !== pSqlColumn.type ) {
            dataTypeProperty.setValue( pSqlColumn.type );
        }

        // activate the "required" flag if the column is "not null" and currently it's unchecked
        if ( valueRequiredProperty && valueRequired === YES && valueRequiredProperty.getValue() === NO  ) {
            valueRequiredProperty.setValue( valueRequired );
        }
    } // updateColumnAttributes

    function hasOrderBy( pRegion ) {

        var lOrderByProperty = pRegion.getProperty( SOURCE_QUERY_ORDER_BY_PROPS );

        // Check region SQL statement or Order By attribute if it contains an ORDER BY clause
        return ( model.getSourceLocationProperty( pRegion ).hasOrderBy() || ( lOrderByProperty && lOrderByProperty.getValue() !== "" ) );

    } // hasOrderBy

    function addRestParametersToComponent(
        pAddToComponent,
        pAddToComponentId,
        pRestModuleOrOperationId,
        pRestParamComponentTypeId,   // Module or Operation parameters
        pComponentRestParamTypeId,
        pRestOperationComponent )
     {

        var lWebSrcParams,
            lParamDefaultValue, lParamName, lParamDataType, lParamRequired, lParamDirection,
            lParamItemName, lMatchingItem,
            lValues, lFetchInOutParamRegexp,
            lRegionType, lRegionPluginAttrs, lRegionEditable,
            //
            lAlreadyExistingParameters = pAddToComponent.getChilds( model.COMP_TYPE.REGION_WS_PARAM ),
            lRestDbOperation = "";

        function addParameter( pRestSourceParam, pValues, pItemName, pParamDefaultValue, pParamRequired ) {

            if ( [ "OUT", "IN_OUT" ].includes( pRestSourceParam.getProperty( model.PROP.DIRECTION ).getValue() ) ) {
                if ( lRestDbOperation !== "FETCH_COLLECTION" ) {
                    pValues.push( {
                        id:    model.PROP.IGNORE_OUTPUT,
                        value: "Y"
                    } );
                }
                pValues.push( {
                    id:    model.PROP.HIDDEN_REQUIRED_VALUE_TYPE,
                    value: "ITEM"
                } );
                pValues.push( {
                    id:    model.PROP.HIDDEN_VALUE_TYPE,
                    value: "ITEM"
                } );
                if ( pItemName !== "" ) {
                    pValues.push( {
                        id:    model.PROP.VALUE_ITEM,
                        value: pItemName
                    } );
                }

            } else {
                pValues.push( {
                    id:    model.PROP.HIDDEN_REQUIRED_VALUE_TYPE,
                    value: "BASIC"
                } );
                pValues.push( {
                    id:    model.PROP.HIDDEN_VALUE_TYPE,
                    value: ( pParamRequired === "Y" || pItemName !== "" ? "ITEM" : ( pParamDefaultValue === "" ? "NULL" : "DEFAULT" ) )
                } );
                pValues.push( {
                    id:    model.PROP.VALUE_TYPE,
                    value: ( pParamRequired === "Y" || pItemName !== "" ? "ITEM" : ( pParamDefaultValue === "" ? "NULL" : "DEFAULT" ) )
                } );
                if ( pItemName !== "" ) {
                    pValues.push( {
                        id:    model.PROP.VALUE_ITEM,
                        value: pItemName
                    } );
                }
            }
        }

        //
        // determine whether we have an editable region; for these we will add OUT parameters also.
        //
        lRegionType = ( pAddToComponent.getProperty( model.PROP.REGION_TYPE ) ? pAddToComponent.getProperty( model.PROP.REGION_TYPE ).getValue() : "" );
        if ( [ REGION_TYPE.IG, REGION_TYPE.FORM ].includes( lRegionType ) ) {

            if ( lRegionType === REGION_TYPE.IG ) {

                lRegionPluginAttrs = pAddToComponent.getChilds( model.COMP_TYPE.IG_ATTRIBUTES )[ 0 ];

            } else if ( lRegionType === REGION_TYPE.FORM ) {

                lRegionPluginAttrs = pAddToComponent.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ];

            }
            lRegionEditable = lRegionPluginAttrs.getProperty( model.PROP.IS_EDITABLE ).getValue();
        }

        //
        // OUT parameters will be added for editable regions, and for page processes.
        //
        if ( [ model.COMP_TYPE.PAGE_PROC_WS_PARAM, model.COMP_TYPE.WF_ACTIVITY_WS_PARAM ].includes( pComponentRestParamTypeId ) || lRegionEditable === "Y" ) {

            lFetchInOutParamRegexp = "^(IN|IN_OUT|OUT)$";

        } else {

            lFetchInOutParamRegexp = "^(IN|IN_OUT)$";

        }

        //
        // look up Web Source Parameters (Shared Components)
        //
        lWebSrcParams = model.getComponents( pRestParamComponentTypeId, {
            parentId: pRestModuleOrOperationId,
            properties: [{
                id:    model.PROP.DIRECTION,
                value: new RegExp( lFetchInOutParamRegexp )
            }],
            filterFunction: function() {
                return ( !this.getProperty( model.PROP.IS_STATIC ) || this.getProperty( model.PROP.IS_STATIC ).getValue() === "N" );
            }
        } );

        //
        for ( let i = 0; i < lWebSrcParams.length; i++ ) {

            //
            // if the component already has this Web Source Parameter, do not add it in again.
            //
            if ( lAlreadyExistingParameters.some( ( parameter ) => {
                     return parameter.getProperty( model.PROP.WEB_SRC_PARAM ).getValue() === lWebSrcParams[ i ].id; } ) )
            {
                continue;
            }

            lValues = [{
                id:    model.PROP.WEB_SRC_PARAM,
                value: lWebSrcParams[ i ].id
            }];

            //
            // let's try to find a page item for this parameter
            //
            lParamItemName = "";
            lParamName     = lWebSrcParams[ i ].getProperty( model.PROP.NAME ).getValue();
            lMatchingItem  = model.getComponents(
                                 model.COMP_TYPE.PAGE_ITEM,
                                 {
                                     properties: [{
                                         id:    model.PROP.ITEM_NAME,
                                         value: "P" + model.getCurrentPageId() + "_" + lParamName.replace( /[^0-9A-Za-z#$]+/g, "_" ).toUpperCase()
                                     }]
                                 } );

            if ( lMatchingItem.length > 0 ) {
                lParamItemName = lMatchingItem[ 0 ].getProperty( model.PROP.ITEM_NAME ).getValue();
            }

            //
            // Get the default value of the parameter, whether it's required and the direction
            //
            lParamDefaultValue = lWebSrcParams[ i ].getProperty( model.PROP.PARAMETER_VALUE    ).getValue();
            lParamRequired     = lWebSrcParams[ i ].getProperty( model.PROP.PARAMETER_REQUIRED )?.getValue();
            lParamDirection    = lWebSrcParams[ i ].getProperty( model.PROP.DIRECTION          )?.getValue();

            //
            // regions, map layers and JET chart series:
            // for operation parameters, populate the (read only) properties for HTTP methods and database operation
            //
            if (    pComponentRestParamTypeId !== model.COMP_TYPE.PAGE_PROC_WS_PARAM
                 && pRestParamComponentTypeId === model.COMP_TYPE.WEB_SRC_OPER_PARAM
                 && pRestOperationComponent )
            {
                lRestDbOperation = pRestOperationComponent.getProperty( model.PROP.DATABASE_OPERATION ).getValue();
                lValues.push( {
                    id:    model.PROP.DATABASE_OPERATION,
                    value: lRestDbOperation
                } );
                lValues.push( {
                    id:    model.PROP.HTTP_METHOD,
                    value: pRestOperationComponent.getProperty( model.PROP.HTTP_METHOD ).getValue()
                } );
            }

            // Set the default value as static value or initialize it as static value if the parameter is
            // required and the developer should enter something

            lValues.push( {
                id:    model.PROP.API_DIRECTION,
                value: lParamDirection
            } );
            lParamDataType = lWebSrcParams[ i ].getProperty( model.PROP.WEB_SRC_PARAM_DATA_TYPE );

            if (    lParamDataType
                 && [ "IN", "IN_OUT" ].includes ( lParamDirection ) )
            {
                lValues.push( {
                    id:    model.PROP.WEB_SRC_PARAM_DATA_TYPE,
                    value: lParamDataType.getValue()
                } );
            }

            if ( [ model.COMP_TYPE.PAGE_PROC_WS_PARAM, model.COMP_TYPE.WF_ACTIVITY_WS_PARAM ].includes( pComponentRestParamTypeId ) ) {
                addParameter( lWebSrcParams[ i ], lValues, lParamItemName, lParamDefaultValue, lParamRequired );
            } else {
                //
                // Parameters for regions, map layers and JET chart series
                //
                // Data Profile Column parameter types are never used for regions
                //
                if ( lWebSrcParams[ i ].getProperty( model.PROP.WEB_SRC_PARAM_TYPE ).getValue() === "DATA_PROFILE" ) {
                    continue;
                }

                addParameter( lWebSrcParams[ i ], lValues, lParamItemName, lParamDefaultValue,lParamRequired );
            }

            new model.Component( {
                typeId:   pComponentRestParamTypeId,
                parentId: pAddToComponentId,
                values:   lValues
            } );
        }
    } // addRestParametersToComponent


    function addDBOperationParametersToComponent(
        pAddToComponent,
        pAddToComponentId,
        pRestSourceModuleId,
        pParamsForDatabaseOperation,
        pParamsForArrayColumnId,
        pComponentRestParamTypeId )
    {
        let lRestOperationComponent;

        //
        // look up the REST Operation component based on the REST Source ID and the
        // database operation
        //
        lRestOperationComponent = model.getComponents( model.COMP_TYPE.WEB_SRC_OPERATION, {
            parentId: pRestSourceModuleId,
            properties: [{
                id:    model.PROP.DATABASE_OPERATION,
                value: pParamsForDatabaseOperation
            },{
                id:    model.PROP.SOURCE_WEB_SRC_ARRAY_COL,
                value: pParamsForArrayColumnId
            }]
        } );

        //
        // if we did not find any operation for an Array Column ID, there is no operation
        // mapped to this array column ID. In that case, look up the operation with no
        // array column ID.
        //
        if ( lRestOperationComponent.length === 0 ) {
            lRestOperationComponent = model.getComponents( model.COMP_TYPE.WEB_SRC_OPERATION, {
                parentId: pRestSourceModuleId,
                properties: [{
                    id:    model.PROP.DATABASE_OPERATION,
                    value: pParamsForDatabaseOperation
                }]
            } );
        }

        //
        // if we found a REST Source operation, add its parameters to the component
        //
        if ( lRestOperationComponent && lRestOperationComponent[ 0 ] ) {

            addRestParametersToComponent(
                pAddToComponent,
                pAddToComponentId,
                lRestOperationComponent[ 0 ].id,
                model.COMP_TYPE.WEB_SRC_OPER_PARAM,
                pComponentRestParamTypeId,
                lRestOperationComponent[ 0 ] );

        }
    } // addDBOperationParametersToComponent

    function addWorkflowParameterToComponent( parameter, activity ) {
        let valueType, ignoreOutput, requiredValueType = "BASIC";
        const paramType = activity.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY ? model.COMP_TYPE.WF_ACTIVITY_WF_PARAM : model.COMP_TYPE.PAGE_PROCESS_WF_PARAM;
        const direction = parameter.getPropertyValue( model.PROP.API_DIRECTION );
        const isRequired = parameter.getPropertyValue( model.PROP.PARAMETER_REQUIRED ) === "Y";
        const defaultValue = parameter.getPropertyValue( model.PROP.PARAMETER_DEFAULT_VALUE );
        const values = [ {
            id:    model.PROP.WORKFLOW_PARAM,
            value: parameter.id
        }, {
            id:    model.PROP.API_DIRECTION,
            value: direction
        }, {
            id:    model.PROP.WORKFLOW_DATA_TYPE,
            value: parameter.getPropertyValue( model.PROP.WORKFLOW_DATA_TYPE )
        } ];

        // dynamic default values
        if ( [ "IN", "IN_OUT" ].includes( direction ) ) {

            if ( direction === "IN_OUT" ) {
                ignoreOutput = "Y";
            }

            if ( isRequired ) {
                valueType = ( defaultValue !== "" ? "DEFAULT" : "ITEM" );
            } else {
                valueType = "NULL";
            }
        } else if ( direction === "OUT" ) {
            requiredValueType = "";
            valueType = "";
            ignoreOutput = "Y";
        }

        values.push( {
            id:    model.PROP.HIDDEN_REQUIRED_VALUE_TYPE,
            value: requiredValueType
        }, {
            id:    model.PROP.HIDDEN_VALUE_TYPE,
            value: valueType
        } );

        // "in" does not have ignoreOutput property
        if ( paramType === model.COMP_TYPE.WF_ACTIVITY_WF_PARAM && direction !== "IN" ) {
            values.push( {
                id:    model.PROP.IGNORE_OUTPUT,
                value: ignoreOutput
            } );
        }

        new model.Component( {
            typeId: paramType,
            parentId: activity.id,
            values: values,
        } );
    }

    function updateWorkflowActivityParameter( workflowParameter, activityParameter ) {
        const IN = "IN", OUT = "OUT", IN_OUT = "IN_OUT", TYPE_ITEM = "ITEM", ENABLED = "Y", TYPE_NULL = "NULL", TYPE_DEFAULT = "DEFAULT";
        const wfDirection = workflowParameter.getPropertyValue( model.PROP.API_DIRECTION );
        const wfIsRequired = workflowParameter.getPropertyValue( model.PROP.PARAMETER_REQUIRED ) === ENABLED;
        const wfDefaultValue = workflowParameter.getPropertyValue( model.PROP.PARAMETER_DEFAULT_VALUE );
        const actDirection = activityParameter.getPropertyValue( model.PROP.API_DIRECTION );
        const actValueType = activityParameter.getPropertyValue( model.PROP.HIDDEN_VALUE_TYPE );
        const setParamValueType = () => {
            if ( wfDefaultValue !== "" ) {
                _setPropertyValue( activityParameter, model.PROP.PARAMETER_VALUE_TYPE, TYPE_DEFAULT );
            } else {
                _setPropertyValue( activityParameter, model.PROP.PARAMETER_VALUE_TYPE, TYPE_ITEM );
            }
        };
        if ( actDirection !== wfDirection ) {
            // first set the direction, as other properties might depend in it
            activityParameter.getProperty( model.PROP.API_DIRECTION ).setValue( wfDirection, { checkReadOnly: false } );
            if ( actValueType !== TYPE_ITEM && ( ( actDirection === OUT && wfDirection === IN_OUT ) || ( actDirection === OUT && wfDirection === IN ) ) ) {
                if ( wfIsRequired ) {
                    setParamValueType();
                } else {
                    _setPropertyValue( activityParameter, model.PROP.PARAMETER_VALUE_TYPE, TYPE_NULL );
                }
            }
        } else if ( wfIsRequired && actValueType === TYPE_NULL ) {
            setParamValueType();
        }
    }

    function syncPrintPageHeaderText ( pRegion, pAction, pComponentType, pOldTitle ) {

        if ( ! pRegion ) {
            return;
        }

        var lNewTitle = pRegion.getProperty( model.PROP.TITLE ).getValue(),
            lOldTitle = ( typeof pOldTitle === "undefined" ) ? lNewTitle : pOldTitle,
            lPrintAttributes = pRegion.getChilds( pComponentType )[ 0 ] || pRegion.getChildrenUntil( pComponentType )[ 0 ],
            lOldPrintPageHeaderText;

        if ( ! lPrintAttributes ) {
            return;
        }

        lOldPrintPageHeaderText = lPrintAttributes.getProperty( model.PROP.PRINT_PAGE_HEADER_TEXT ).getValue();

        // Keep the "Page header text" property in sync if the text is equal to the old region title
        if ( pAction === model.CALLBACK_ACTION.CREATED
            || ( lOldTitle === lOldPrintPageHeaderText ) )
        {
            _setPropertyValue( lPrintAttributes, model.PROP.PRINT_PAGE_HEADER_TEXT, lNewTitle );
        }

    } // syncPrintPageHeaderText


    function handleWebSrcParameters( pComponent, pRegionId ) {

        var lIsEditableProperty = pComponent.getProperty( model.PROP.IS_EDITABLE ),
            lWebSrcProperty     = pComponent.getParent() && pComponent.getParent().getProperty( model.PROP.SOURCE_WEB_SRC_QUERY ),
            lUseTableProperty   = pComponent.getParent() && pComponent.getParent().getProperty( model.PROP.WEB_SRC_USE_LOCAL_TABLE ),
            lArrayColProperty   = pComponent.getParent() && pComponent.getParent().getProperty( model.PROP.SOURCE_WEB_SRC_ARRAY_COL ),

            lIgFormUsingWebSrc  =    // a) region uses a Web Source
                                     lWebSrcProperty && lWebSrcProperty.getValue() !== ""

                                     // b) region does not use the Local Sync Table
                                  && ( !lUseTableProperty || lUseTableProperty.getValue() === 'N' )

                                     // c) region is a Form or Interactive Grid Region
                                  && pComponent.getParent() && pComponent.getParent().getProperty( model.PROP.REGION_TYPE )
                                  && [ REGION_TYPE.IG, REGION_TYPE.FORM ].includes( pComponent.getParent().getProperty( model.PROP.REGION_TYPE ).getValue() ),

            lRegionWebSrcParams, lRegionWebSrcParam, lWebSrcParamIdProp, lWebSrcParamId, p;

        if ( lIgFormUsingWebSrc ) {

            if ( lIsEditableProperty.getValue() === "Y" ) {

                // add REST Parameters for the INSERT, UPDATE, DELETE and FETCH_SINGLE_ROW operations
                addDBOperationParametersToComponent( pComponent.getParent(), pRegionId, lWebSrcProperty.getValue(), "UPDATE",           lArrayColProperty?.getValue(), model.COMP_TYPE.REGION_WS_PARAM );
                addDBOperationParametersToComponent( pComponent.getParent(), pRegionId, lWebSrcProperty.getValue(), "DELETE",           lArrayColProperty?.getValue(), model.COMP_TYPE.REGION_WS_PARAM );
                addDBOperationParametersToComponent( pComponent.getParent(), pRegionId, lWebSrcProperty.getValue(), "INSERT",           lArrayColProperty?.getValue(), model.COMP_TYPE.REGION_WS_PARAM );
                addDBOperationParametersToComponent( pComponent.getParent(), pRegionId, lWebSrcProperty.getValue(), "FETCH_SINGLE_ROW", lArrayColProperty?.getValue(), model.COMP_TYPE.REGION_WS_PARAM );

                // add Module Parameters
                addRestParametersToComponent(
                    pComponent.getParent(),
                    pRegionId,
                    lWebSrcProperty.getValue(),
                    model.COMP_TYPE.WEB_SRC_MOD_PARAM,
                    model.COMP_TYPE.REGION_WS_PARAM );

            } else {

                //
                // get all Web Source parameters for the region
                lRegionWebSrcParams = model.getComponents( model.COMP_TYPE.REGION_WS_PARAM, {
                                          parentId: pRegionId,
                                          properties: []
                                      } );

                //
                // now we need to verify the parameter definition for each of the region web source parameters.
                // If a parameter is mapped to a DML Database Operation, we can remove it, as non-editable regions
                // only work with the "FETCH COLLECTION" database operation
                //
                for ( p = 0; p < lRegionWebSrcParams.length; p++ ) {

                    lWebSrcParamIdProp = lRegionWebSrcParams[ p ].getProperty( model.PROP.WEB_SRC_PARAM );
                    if ( lWebSrcParamIdProp ) {
                        lWebSrcParamId = lWebSrcParamIdProp.getValue();
                    }
                    if ( lWebSrcParamId ) {

                        lRegionWebSrcParam = model.getComponents( model.COMP_TYPE.WEB_SRC_MOD_PARAM, {
                                                 id: lWebSrcParamId
                                             } );

                        if ( lRegionWebSrcParam[0] ) {
                            if (    lRegionWebSrcParam[0].getProperty( model.PROP.DIRECTION )
                                 && lRegionWebSrcParam[0].getProperty( model.PROP.DIRECTION ).getValue() === "OUT" )
                            {
                                _removeComponents ( [ lRegionWebSrcParams[ p ] ] );
                            }
                        } else {

                            lRegionWebSrcParam = model.getComponents( model.COMP_TYPE.WEB_SRC_OPER_PARAM, {
                                                     id: lWebSrcParamId
                                                 } );

                            if (    lRegionWebSrcParam
                                 && lRegionWebSrcParam.length > 0
                                 && lRegionWebSrcParam[0].getProperty( model.PROP.DATABASE_OPERATION )
                                 && [ "INSERT", "UPDATE", "DELETE", "FETCH_SINGLE_ROW" ].includes( lRegionWebSrcParam[0].getProperty( model.PROP.DATABASE_OPERATION ).getValue() ) )
                            {
                                _removeComponents ( [ lRegionWebSrcParams[ p ] ] );
                            }
                        }
                    }
                }
            }
        }
    } // handleWebSrcParameters

    function removeInteractiveGridProcesses ( regionId ) {
        _removeComponents (
            model.getComponents( model.COMP_TYPE.VALIDATION, {
                properties: [{ id: model.PROP.VALIDATION_REGION, value: regionId }]
            } )
        );
        _removeComponents (
            model.getComponents( model.COMP_TYPE.PAGE_PROCESS, {
                properties: [{ id: model.PROP.PROCESS_REGION, value: regionId }]
            } )
        );
    } // removeInteractiveGridProcesses

    function validateMultiValueSeparator( pProperty, pAction, pValue ) {
        if (   pAction === model.CALLBACK_ACTION.VALIDATE
            && [ model.PROP.MULTI_VALUE_SEPARATOR_OPTIONAL, model.PROP.MULTI_VALUE_SEPARATOR_ALWAYS, model.PROP.MULTI_VALUE_SEPARATOR ].includes( pProperty?.id )
            && [ "\\", "\"", "\\005C", "\\0022"].includes( pValue ) ) {
            return { error: msg( "ITEM.ERROR_MULTI_VALUE_SEPARATOR_NOT_ALLOWED" ) };
        }
    } // validateMultiValueSeparator

    function _setTemplateComponentRegionTemplate( region, templateComponentType ) {

        let regionTemplate = "";
        let landmarkType = "";

        // Set region template based on the selected display type
        if ( templateComponentType === "REPORT" ) {
            regionTemplate = model.getTheme().defaultTemplates.templateComponent;
            landmarkType = "region";
        }

        _setPropertyValue( region, model.PROP.REGION_TEMPLATE, regionTemplate );
        _setPropertyValue( region, model.PROP.LANDMARK_TYPE, landmarkType );

    } // _setTemplateComponentRegionTemplate


    function regionPluginAttr( pAction, pProperty, pOldValue ) {

        function removeValidationsProcesses( pRegionId ) {
            // Remove any region depending validation or process if we don't allow editing anymore
            _removeComponents (
                model.getComponents( model.COMP_TYPE.VALIDATION, {
                    properties: [{ id: model.PROP.VALIDATION_REGION, value: pRegionId }]
                } )
            );
            _removeComponents (
                model.getComponents( model.COMP_TYPE.PAGE_PROCESS, {
                    properties: [
                        { id: model.PROP.PAGE_PROCESS_TYPE,          value: "NATIVE_FORM_DML" },
                        { id: model.PROP.PROCESS_DATA_SOURCE_REGION, value: pRegionId }
                    ]
                } )
            );
        } // removeValidationsProcesses

        var lRegionId = this.parentId,
            lIsEditableProperty = this.getProperty( model.PROP.IS_EDITABLE );

        // Check if the component with an editable flag is getting created or if the editable flag has been changed
        if ( _hasChanged( lIsEditableProperty, pAction, pProperty ) ) {

            if ( lIsEditableProperty.getValue() === "Y" ) {

                // Always add the new DML process before any existing process. In most cases, especially if it's
                // a master detail this will guarantee the correct order where a form comes always first.
                _createComponent( {
                    typeId: model.COMP_TYPE.PAGE_PROCESS,
                    searchPropertyValues: [
                        { id: model.PROP.PAGE_PROCESS_TYPE,          value: "NATIVE_FORM_DML" },
                        { id: model.PROP.PROCESS_DATA_SOURCE_REGION, value: lRegionId }
                    ],
                    addPropertyValues: [
                        { id: model.PROP.NAME, value: lang.formatMessageNoEscape( "WIZARD.FORM.DML_PROCESS_NAME", this.getParent().getDisplayTitle() )}
                    ],
                    previousComponent: "first" } );

            } else {

                removeValidationsProcesses( lRegionId );

            }

            handleWebSrcParameters( this, lRegionId, pAction, pProperty, pOldValue );
        }

        // Special template component region handling
        //
        // We have to split the logic into two places (CREATED is handled by templateComponentPlugin),
        // because if REGION_PLUGIN_ATTR gets created, it can yet access this.getParent(), that's
        // why we can only cover the CHANGED case here.
        let templateComponentTypeProp = this.getProperty( model.PROP.TEMPLATE_COMPONENT_TYPE );

        if ( pAction === model.CALLBACK_ACTION.CHANGED && _hasChanged( templateComponentTypeProp, pAction, pProperty ) ) {
            let value = templateComponentTypeProp.getValue();
            _setTemplateComponentRegionTemplate( this.getParent(), value );
            // report template components must have a source
            let sourceLocProp = this.getParent().getProperty( model.PROP.SOURCE_LOCATION );
            if ( value === "REPORT" ) {
                if ( sourceLocProp.getValue() === "" ) {
                    sourceLocProp.setValue( "LOCAL", true );
                }
            } else {
                // if the region does not any have colums yet, set the location none
                if ( !this.getParent().getChilds( model.COMP_TYPE.REGION_TMPL_COLUMN ).length ) {
                    sourceLocProp.setValue( "", true );
                }
            }
            // update property HIDDEN_TEMPLATE_COMPONENT_TYPE of all region columns
            // to new/changed template component type
            model.getComponents( model.COMP_TYPE.REGION_TMPL_COLUMN, {
                parentId: lRegionId,
                properties: []
            } ).forEach( function( component ) {
                _setPropertyValue( component, model.PROP.HIDDEN_TEMPLATE_COMPONENT_TYPE, templateComponentTypeProp.getValue() );
            } );

        }

        // Using Scroll pagination on a modal dialog page (iFrame) results in layout glitch, prevent it for the time being
        // Note: pOldValue in case of VALIDATE is actually the new value
        if (  pAction === model.CALLBACK_ACTION.VALIDATE
           && pProperty.id === model.PROP.PAGINATION_TYPE
           && pOldValue === "SCROLL"
           && model.getComponents( model.COMP_TYPE.PAGE, { id: model.getCurrentPageId() })[ 0 ].getProperty( model.PROP.PAGE_MODE ).getValue() === "MODAL" )
        {
            return { error: msg( "TEMPLATE_COMPONENT.MODAL_DIALOG_SCROLL_PAGINATION" ) };
        }

    } // regionPluginAttr


    function cardPlugin( pAction, pProperty ) {

        var lDefaultCardTemplate;

        if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            if ( pAction === model.CALLBACK_ACTION.CREATED ) {

                new model.Component( {
                    typeId:   model.COMP_TYPE.CARD,
                    parentId: this.id
                } );

                lDefaultCardTemplate = model.getTheme().defaultTemplates.cards;

                if ( lDefaultCardTemplate ) {
                    _setPropertyValue( this, model.PROP.REGION_TEMPLATE, lDefaultCardTemplate );
                }
            }

            // set "Show Total Row Count" property to "No" for web sources
            if ( this.getProperty( model.PROP.SOURCE_LOCATION ).getValue() === "WEB_SOURCE" ) {
                _setPropertyValue( this, model.PROP.SHOW_TOTAL_ROW_COUNT, "N" );
            }

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the card attributes if that hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.CARD );
            _removeChildren( this, model.COMP_TYPE.CARD_ACTION );

        }
    } // cardPlugin


    function classicRptTabularFormPlugin( pAction, pProperty, pRegion, pComponentTypeId, pColumnComponentTypeId, pPrintComponentTypeId, pOldValue ) {

        function removeAll( pRegion ) {

            // Remove the report attributes and columns if that hasn't already been done (i.e if the region is removed)
            _removeChildren( pRegion, pComponentTypeId );
            _removeChildren( pRegion, pColumnComponentTypeId );

        } // removeAll

        var lColumns,
            lSourceProperty;


        if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            if ( pAction === model.CALLBACK_ACTION.CREATED ) {

                new model.Component( {
                    typeId:   pComponentTypeId,
                    parentId: pRegion.id
                } );

                syncPrintPageHeaderText( pRegion, pAction, pPrintComponentTypeId, pOldValue );
            }

            manageColumns( pRegion, pRegion, pColumnComponentTypeId, model.PROP.COLUMN_NAME, {
                removeCheck: function( pReportColumn ) {
                    // Remove the existing report column if it isn't contained in the SQL anymore,
                    // but don't remove it if it's one of our "virtual" columns
                    return ( pReportColumn.getProperty( model.PROP.DERIVED_COLUMN ).getValue() === "N" );
                },
                add: function( pValues, pSqlColumn ) {

                    pValues.push( { id: model.PROP.COLUMN_NAME,     value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.QUERY_COLUMN_ID, value: pSqlColumn.no } );
                    if ( pSqlColumn.type === "BLOB" ) {
                        pValues.push( { id: model.PROP.CLASSIC_REPORT_COLUMN_TYPE, value: "IMAGE" } );
                    }

                    if ( pSqlColumn.type === "NUMBER" ) {
                        pValues.push( { id: model.PROP.COLUMN_ALIGNMENT, value: "RIGHT" } );
                        pValues.push( { id: model.PROP.HEADING_ALIGNMENT, value: "RIGHT" } );
                    }

                    pValues.push( { id: model.PROP.COLUMN_HEADING, value: initCapColumnName( pSqlColumn.name )} );

                },
                update: function( pReportColumn, pSqlColumn ) {

                    // Check if the query column id has changed
                    var lProperty = pReportColumn.getProperty( model.PROP.QUERY_COLUMN_ID );
                    if ( parseInt( lProperty.getValue(), 10 ) !== pSqlColumn.no ) {
                        lProperty.setValue( pSqlColumn.no );
                    }
                }
            } );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, [ model.PROP.HAS_GENERIC_COLUMNS, model.PROP.GENERIC_COLUMN_COUNT ] ) !== -1 ) {

            lSourceProperty = model.getSourceLocationProperty( pProperty.component );

            // Trigger a re-validation of the source property which will also set the _columns attribute.
            lSourceProperty.setValue( lSourceProperty.getValue(), true );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.TITLE ) {

            syncPrintPageHeaderText( pRegion, pAction, pPrintComponentTypeId, pOldValue );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            removeAll( pRegion );

        }

        if ( pAction === model.CALLBACK_ACTION.CREATED || ( pAction === model.CALLBACK_ACTION.CHANGED && ( $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 || SOURCE_QUERY_ORDER_BY_PROPS.includes(pProperty.id)  ) )
            && hasOrderBy( pRegion ) )
        {
            // No column heading sorting is allowed if the report query contains an order by.
            // Reset all existing sort properties
            if ( hasOrderBy( pRegion ) ) {
                lColumns = pRegion.getChilds( pColumnComponentTypeId, {
                    filterFunction: function() {
                        var lColumnSortSequence = this.getProperty( model.PROP.COLUMN_SORT_SEQUENCE ),
                            lDisableSortColumn  = this.getProperty( model.PROP.DISABLE_SORT_COLUMN );

                        return (  ( lColumnSortSequence && lColumnSortSequence.getValue() !== "" )
                            || ( lDisableSortColumn  && lDisableSortColumn.getValue() === "N" )
                        );
                    }
                } );
                for ( let i = 0; i < lColumns.length; i++ ) {
                    _setPropertyValue( lColumns[ i ], model.PROP.COLUMN_SORT_SEQUENCE, "" );
                    _setPropertyValue( lColumns[ i ], model.PROP.DISABLE_SORT_COLUMN,  "Y" );
                }
            }
        }


    } // classicRptTabularFormPlugin


    function classicRptTabularFormAttr( pAction, pProperty, pOldValue ) {

        var lPrintComponentTypeId;

        if ( this.typeId === model.COMP_TYPE.CLASSIC_REPORT ) {
            lPrintComponentTypeId = model.COMP_TYPE.CLASSIC_RPT_PRINT;
        } else {
            lPrintComponentTypeId = model.COMP_TYPE.TAB_FORM_PRINT;
        }

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            if ( this.getProperty( model.PROP.ENABLE_PRINTING ).getValue() === "Y" ) {
                new model.Component( {
                    typeId:   lPrintComponentTypeId,
                    parentId: this.id
                } );
                syncPrintPageHeaderText( this.getParent(), pAction, lPrintComponentTypeId );
                pd.getTab( "pePrintingTabPanel" ).show();
            }
        } else if (  pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty.id === model.PROP.ENABLE_PRINTING
            && pProperty.getValue() !== pOldValue )
        {
            if ( pProperty.getValue() === "Y" ) {
                new model.Component( {
                    typeId:   lPrintComponentTypeId,
                    parentId: this.id
                } );
                syncPrintPageHeaderText( this.getParent(), model.CALLBACK_ACTION.CREATED, lPrintComponentTypeId );

            } else {
                _removeChildren( this, lPrintComponentTypeId );
            }
        }
    } // classicRptTabularFormAttr


    function interactiveReportPlugin( pAction, pProperty, pOldValue ) {

        var lIrAttributes,
            lDefaultIrTemplate;

        if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            if ( pAction === model.CALLBACK_ACTION.CREATED ) {

                lIrAttributes = new model.Component( {
                    typeId:   model.COMP_TYPE.IR_ATTRIBUTES,
                    parentId: this.id
                } );

                syncPrintPageHeaderText( this, pAction, model.COMP_TYPE.IR_PRINT_ATTR, pOldValue );

                lDefaultIrTemplate = model.getTheme().defaultTemplates.ir;

                if ( lDefaultIrTemplate ) {
                    _setPropertyValue( this, model.PROP.REGION_TEMPLATE, lDefaultIrTemplate );
                }

            } else {
                lIrAttributes = this.getChilds( model.COMP_TYPE.IR_ATTRIBUTES )[ 0 ];
            }

            manageColumns( this, lIrAttributes, model.COMP_TYPE.IR_COLUMN, model.PROP.COLUMN_NAME, {
                setSqlColumn: function( pSqlColumn ) {

                    // Normalize data types to just a few
                    pSqlColumn.isTzDependent = "N";
                    if ( pSqlColumn.type === "VARCHAR2" ) {
                        pSqlColumn.type = "STRING";
                    } else if ( pSqlColumn.type === "TIMESTAMP" || pSqlColumn.type === "TIMESTAMP_TZ" ) { // todo is TIMESTAMP_TZ really not TZ dependent?
                        pSqlColumn.type = "DATE";
                    } else if ( pSqlColumn.type === "TIMESTAMP_LTZ" ) {
                        pSqlColumn.type          = "DATE";
                        pSqlColumn.isTzDependent = "Y";
                    } else if ( pSqlColumn.type !== "NUMBER" && pSqlColumn.type !== "DATE" && pSqlColumn.type !== "CLOB" ) {
                        pSqlColumn.type = "OTHER";
                    }

                },
                compareCheck: function( pSqlColumn, pReportColumn ) {

                    return ( pSqlColumn.type === pReportColumn.getProperty( model.PROP.COLUMN_TYPE ).getValue() );

                },
                add: function( pValues, pSqlColumn ) {

                    var lColumnFilterType = "D";

                    pValues.push( { id: model.PROP.COLUMN_NAME, value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.COLUMN_TYPE, value: pSqlColumn.type } );

                    if ( pSqlColumn.type === "DATE" ) {
                        pValues.push( { id: model.PROP.TZ_DEPENDENT, value: pSqlColumn.isTzDependent } );

                    } else if ( pSqlColumn.type === "NUMBER" ) {
                        pValues.push( { id: model.PROP.COLUMN_ALIGNMENT, value: "RIGHT" } );
                        pValues.push( { id: model.PROP.HEADING_ALIGNMENT, value: "RIGHT" } );

                    } else if ( pSqlColumn.type === "CLOB" || pSqlColumn.type === "OTHER" ) {
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_SORT,          value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_CONTROL_BREAK, value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_AGGREGATE,     value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_COMPUTE,       value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_CHART,         value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_GROUP_BY,      value: "N" } );
                        pValues.push( { id: model.PROP.ALLOW_USERS_TO_PIVOT,         value: "N" } );
                        lColumnFilterType = "N";

                        if ( pSqlColumn.type === "OTHER" ) {
                            pValues.push( { id: model.PROP.ALLOW_USERS_TO_FILTER,    value: "N" } );
                            pValues.push( { id: model.PROP.ALLOW_USERS_TO_HIGHLIGHT, value: "N" } );
                        }
                    }

                    if ( pSqlColumn.isPrimaryKey ) {
                        pValues.push( { id: model.PROP.IS_PRIMARY_KEY, value: "Y" } );
                    }

                    pValues.push( { id: model.PROP.IR_COLUMN_FILTER_TYPE, value: lColumnFilterType } );
                    pValues.push( { id: model.PROP.COLUMN_HEADING, value: initCapColumnName( pSqlColumn.name )} );

                },
                update: function( pReportColumn, pSqlColumn ) {

                    var lProperty;

                    // Check if the TZ has changed, in that case we just update that flag
                    if ( pSqlColumn.type === "DATE" ) {
                        lProperty = pReportColumn.getProperty( model.PROP.TZ_DEPENDENT );
                        if ( pSqlColumn.isTzDependent !== lProperty.getValue() ) {
                            lProperty.setValue( pSqlColumn.isTzDependent );
                        }
                    }
                }
            } );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.TITLE )
        {

            syncPrintPageHeaderText( this, pAction, model.COMP_TYPE.IR_PRINT_ATTR, pOldValue );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the IR attributes if that hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.IR_ATTRIBUTES );

        }
    } // interactiveReportPlugin


    function interactiveReportAttr( pAction, pProperty, pOldValue ) {

        function hasPrintAttributes( pShowDownloadProperty, pDownloadFormatsProperty ) {
            var lIsShowDownload = pShowDownloadProperty.getValue() === "Y",
                lDownloadFormats = ( lIsShowDownload ) ? pDownloadFormatsProperty.getValue().split( ":" ) : [];

            return ( lIsShowDownload &&
            (  $.inArray( "XLSX", lDownloadFormats ) !== -1
            || $.inArray( "PDF", lDownloadFormats ) !== -1 ) );
        }


        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            if ( hasPrintAttributes( this.getProperty( model.PROP.SHOW_DOWNLOAD ),
                    this.getProperty( model.PROP.DOWNLOAD_FORMATS ) ) ) {
                new model.Component( {
                    typeId:   model.COMP_TYPE.IR_PRINT_ATTR,
                    parentId: this.id
                } );
                syncPrintPageHeaderText( this.getParent(), pAction, model.COMP_TYPE.IR_PRINT_ATTR );
            }

        } else if (  pAction === model.CALLBACK_ACTION.CHANGED
            && ( pProperty.id === model.PROP.DOWNLOAD_FORMATS ||
            pProperty.id === model.PROP.SHOW_DOWNLOAD )
            && pProperty.getValue() !== pOldValue )
        {
            if ( hasPrintAttributes( this.getProperty( model.PROP.SHOW_DOWNLOAD ),
                    this.getProperty( model.PROP.DOWNLOAD_FORMATS ) ) ) {

                // Only create the print component if it doesn't exist yet
                if ( model.getComponents( model.COMP_TYPE.IR_PRINT_ATTR, { parentId: this.id } ).length === 0 ) {
                    new model.Component( {
                        typeId:   model.COMP_TYPE.IR_PRINT_ATTR,
                        parentId: this.id
                    } );
                    syncPrintPageHeaderText( this.getParent(), model.CALLBACK_ACTION.CREATED, model.COMP_TYPE.IR_PRINT_ATTR );
                }
            } else {
                _removeChildren( this, model.COMP_TYPE.IR_PRINT_ATTR );
            }
        }
    } // interactiveReportAttr


    function irColumn( action, property, oldValue ) {

        // Remove dependent IR column actions if the column type has changed or the column has been removed
        if (  (  _hasChanged( this.getProperty( model.PROP.IR_COLUMN_DISPLAY_TYPE ), action, property, oldValue )
              && /^(TMPL)/.test( oldValue ) )
           || action === model.CALLBACK_ACTION.REMOVED )
        {

            _removeChildren( this, model.COMP_TYPE.IR_COLUMN_ACTION );

        }

    } // irColumn


    function interactiveGridPlugin( pAction, pProperty, pOldValue, pSql ) {

        var lIgAttributes,
            lDefaultIgTemplate;

        if ( pAction === model.CALLBACK_ACTION.VALIDATE && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1  ) {

            // Don't allow ORDER BY because that can cause ORA-01733 during update and an ORDER BY would
            // not have an effect if users specify a column order.
            if ( pSql.hasOrderBy ) {
                return { error: format( "IG.HAS_ORDER_BY" ) };
            }

        } else if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            if ( pAction === model.CALLBACK_ACTION.CREATED ) {

                lIgAttributes = new model.Component( {
                    typeId:   model.COMP_TYPE.IG_ATTRIBUTES,
                    parentId: this.id
                } );

                lDefaultIgTemplate = model.getTheme().defaultTemplates.ir;

                if ( lDefaultIgTemplate ) {
                    _setPropertyValue( this, model.PROP.REGION_TEMPLATE, lDefaultIgTemplate );
                }

                syncPrintPageHeaderText( this, pAction, model.COMP_TYPE.IG_PRINT, pOldValue );

            } else {
                lIgAttributes = this.getChilds( model.COMP_TYPE.IG_ATTRIBUTES )[ 0 ];
            }

            // set "Show Total Row Count" property to "No" for web sources
            if ( this.getProperty( model.PROP.SOURCE_LOCATION ).getValue() === "WEB_SOURCE" ) {
                _setPropertyValue( lIgAttributes, model.PROP.SHOW_TOTAL_ROW_COUNT, "N" );
            }

            manageColumns( this, this, model.COMP_TYPE.IG_COLUMN, model.PROP.SOURCE_DB_COLUMN, {
                add: function( pValues, pSqlColumn ) {

                    var lIsVisible = true;

                    // *************************************************************************************************
                    // KEEP IN SYNC with wwv_flow_report_dev.plb / create_ig_region
                    // *************************************************************************************************

                    pValues.push( { id: model.PROP.COLUMN_NAME,        value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.COLUMN_SOURCE_TYPE, value: "DB_COLUMN" } );
                    pValues.push( { id: model.PROP.SOURCE_DB_COLUMN,   value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.DATA_TYPE,          value: pSqlColumn.type } );


                    if ( pSqlColumn.isPrimaryKey || pSqlColumn.type === "ROWID" ) {

                        lIsVisible = false;
                        pValues.push( { id: model.PROP.ITEM_TYPE,      value: ITEM_TYPE.HIDDEN } );
                        pValues.push( { id: model.PROP.IS_PRIMARY_KEY, value: "Y" } );
                        pValues.push( { id: model.PROP.IS_QUERY_ONLY,  value: ( pSqlColumn.isQueryOnly ? "Y" : "N" ) } );

                    } else if ( pSqlColumn.type === "VARCHAR2" ) {

                        if ( pSqlColumn.maxLen < ITEM_TYPE_TEXTAREA_THRESHOLD || pSqlColumn.isGeneric ) {
                            pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXT_FIELD } );
                        } else {
                            pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXTAREA } );
                        }
                        if ( pSqlColumn.maxLen ) {
                            pValues.push( { id: model.PROP.ELEMENT_MAX_CHARACTERS, value: pSqlColumn.maxLen + "" } );
                        }

                    } else if ( pSqlColumn.type === "CLOB" ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXTAREA } );
                        pValues.push( { id: model.PROP.REGION_COLUMN_SESSION_STATE_DATA_TYPE, value: "CLOB" } );

                    } else if ( pSqlColumn.type === "NUMBER" ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.NUMBER_FIELD } );

                    } else if ( $.inArray( pSqlColumn.type, [ "TIMESTAMP_TZ" ] ) !== -1 ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXT_FIELD } );
                        // $$$ date picker does not support time zones, so default TIMESTAMP_TZ data type to Text Field

                    } else if ( $.inArray( pSqlColumn.type, [ "DATE", "TIMESTAMP", "TIMESTAMP_LTZ" ] ) !== -1 ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.DATE_PICKER } );

                    }

                    if ( lIsVisible ) {
                        pValues.push( { id: model.PROP.FILTER_DATA_TYPE, value: pSqlColumn.type } );
                        pValues.push( { id: model.PROP.COLUMN_HEADING,   value: initCapColumnName( pSqlColumn.name )} );
                        pValues.push( { id: model.PROP.VALUE_REQUIRED,   value: pSqlColumn.isRequired ? "Y" : "N" } );
                    }
                },
                update: updateColumnAttributes,
                // Bug 25673217 - Do not add BLOB columns on IG Columns because IG doesn't support it
                skipColumn: (sqlColumn) => {
                    return sqlColumn.type === "BLOB";
                }
            } );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.TITLE )
        {

            syncPrintPageHeaderText( this, pAction, model.COMP_TYPE.IG_PRINT, pOldValue );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the IR attributes if that hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.IG_ATTRIBUTES );
            _removeChildren( this, model.COMP_TYPE.IG_COLUMN );

            removeInteractiveGridProcesses( this.id );

        }
    } // interactiveGridPlugin


    function interactiveGridAttr( pAction, pProperty, pOldValue ) {

        var lSqlColumns,
            lRegionId = this.parentId;

        function hasPrintAttributes( pEnableDownloadProperty, pDownloadFormatsProperty ) {
            var lEnableDownload  = pEnableDownloadProperty.getValue() === "Y",
                lDownloadFormats = ( lEnableDownload ) ? pDownloadFormatsProperty.getValue().split( ":" ) : [];

            return ( lEnableDownload &&
                (  $.inArray( "XLSX", lDownloadFormats ) !== -1
                    || $.inArray( "PDF", lDownloadFormats ) !== -1
                    )
                );
        }

        function addColumnIfNotExists( pParentId, pColumnName, pValues ) {
            var lValues = [{
                id: model.PROP.COLUMN_NAME,
                value: pColumnName
            }].concat( ( pValues ? pValues : [] ) );

            if ( model.getComponents( model.COMP_TYPE.IG_COLUMN, {
                parentId: pParentId,
                properties: [{ id: model.PROP.COLUMN_NAME, value: pColumnName }]
            } ).length === 0 )
            {
                new model.Component( {
                    typeId:   model.COMP_TYPE.IG_COLUMN,
                    parentId: pParentId,
                    values:   lValues
                } );
            }
        }

        function removeColumn( pParentId, pColumnName ) {
            _removeComponents (
                model.getComponents( model.COMP_TYPE.IG_COLUMN, {
                    parentId: pParentId,
                    properties: [{ id: model.PROP.COLUMN_NAME, value: pColumnName }]
                } )
            );
        }


        if ( pAction === model.CALLBACK_ACTION.CREATED ) {
            if ( hasPrintAttributes( this.getProperty( model.PROP.ENABLE_DOWNLOAD ), this.getProperty( model.PROP.IG_DOWNLOAD_FORMATS ) ) ) {
                new model.Component( {
                    typeId:   model.COMP_TYPE.IG_PRINT,
                    parentId: lRegionId
                } );
                syncPrintPageHeaderText( this.getParent(), pAction, model.COMP_TYPE.IG_PRINT );
            }
        } else if (  pAction === model.CALLBACK_ACTION.CHANGED
            && ( pProperty.id === model.PROP.IG_DOWNLOAD_FORMATS || pProperty.id === model.PROP.ENABLE_DOWNLOAD )
            && pProperty.getValue() !== pOldValue )
        {
            if ( hasPrintAttributes( this.getProperty( model.PROP.ENABLE_DOWNLOAD ), this.getProperty( model.PROP.IG_DOWNLOAD_FORMATS ) ) ) {

                // Only create the print component if it doesn't exist yet
                if ( model.getComponents( model.COMP_TYPE.IG_PRINT, { parentId: lRegionId } ).length === 0 ) {
                    new model.Component( {
                        typeId:   model.COMP_TYPE.IG_PRINT,
                        parentId: lRegionId
                    } );
                    syncPrintPageHeaderText( this.getParent(), model.CALLBACK_ACTION.CREATED, model.COMP_TYPE.IG_PRINT );
                }
            } else {
                _removeChildren( this, model.COMP_TYPE.IG_PRINT );
            }
        }

        // Check if the component is getting created or if the editable flag has been changed
        if (  pAction === model.CALLBACK_ACTION.CREATED
            || (  pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty.id === model.PROP.IS_EDITABLE
            && pProperty.getValue() !== pOldValue
            )
            )
        {
            if ( this.getProperty( model.PROP.IS_EDITABLE ).getValue() === "Y" ) {

                // If the grid is editable and no primary key hasn't been defined yet, we try to add a column of
                // type ROWID if available and make it the primary key
                if ( model.getComponents( model.COMP_TYPE.IG_COLUMN, {
                    parentId:   lRegionId,
                    properties: [{ id: model.PROP.IS_PRIMARY_KEY, value: "Y" }]
                } ).length === 0 )
                {
                    lSqlColumns = model.getSourceLocationProperty( this.getParent() ).getColumns( true );
                    for ( let i = 0; i < lSqlColumns.length; i++ ) {
                        if ( lSqlColumns[ i ].type === "ROWID" ) {
                            addColumnIfNotExists( lRegionId, lSqlColumns[ i ].name, [
                                { id: model.PROP.ITEM_TYPE,          value: ITEM_TYPE.HIDDEN },
                                { id: model.PROP.COLUMN_SOURCE_TYPE, value: "DB_COLUMN" },
                                { id: model.PROP.SOURCE_DB_COLUMN,   value: lSqlColumns[ i ].name },
                                { id: model.PROP.DATA_TYPE,          value: "ROWID" },
                                { id: model.PROP.IS_PRIMARY_KEY,     value: "Y" }
                            ] );
                            break;
                        }
                    }
                }

                addColumnIfNotExists( lRegionId, "APEX$ROW_ACTION", [
                    { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.ROW_ACTION }
                ] );

                addColumnIfNotExists( lRegionId, "APEX$ROW_SELECTOR", [
                    { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.ROW_SELECTOR }
                ] );

                // Always add the new DML process after any existing process. In most cases, especially if it's
                // a master detail this will guarantee the correct order if the IGs are enabled in the correct order.
                _createComponent( {
                    typeId: model.COMP_TYPE.PAGE_PROCESS,
                    searchPropertyValues: [
                        { id: model.PROP.PAGE_PROCESS_TYPE, value: "NATIVE_IG_DML" },
                        { id: model.PROP.PROCESS_REGION,    value: lRegionId }
                    ],
                    addPropertyValues: [
                        { id: model.PROP.NAME, value: lang.formatMessageNoEscape( "WIZARD.IG.DML_PROCESS_NAME", this.getParent().getDisplayTitle() )}
                    ],
                    previousComponent: "last" } );

            } else {


                // Remove added columns and any region depending validation or process if we don't allow editing anymore,
                // but don't remove ROWID which might be used by the developer
                removeColumn( lRegionId, "APEX$ROW_SELECTOR" );
                removeColumn( lRegionId, "APEX$ROW_ACTION" );

                removeInteractiveGridProcesses( lRegionId );

            }

            handleWebSrcParameters( this, lRegionId, pAction, pProperty, pOldValue );
        }


    } // interactiveGridAttr


    function interactiveGridColumn( pAction, pProperty, pValue ) {
        const PLUGIN = model.getComponentType( model.COMP_TYPE.IG_COLUMN ).pluginType.plugins [ this.getProperty( model.PROP.ITEM_TYPE ).getValue() ],
              JOIN_LOV = ( $.inArray( "JOIN_LOV", PLUGIN.features ) !== -1 ),
              lItemTypeProperty = this.getProperty( model.PROP.ITEM_TYPE ),
              lDataTypeProperty = this.getProperty( model.PROP.DATA_TYPE ),
              lFilterDataTypeProperty = this.getProperty( model.PROP.FILTER_DATA_TYPE ),
              lLovTypeProperty = this.getProperty( model.PROP.LOV_TYPE );

        let lFilterDataType,
            lValidationResult;

        lValidationResult = validateMultiValueSeparator( pProperty, pAction, pValue );

        if ( lValidationResult ) {
            return lValidationResult;
        }
        // Trigger revalidation of SQL Query when column (item) type changed for LOV based columns (items)
        revalidateLovQuery( this, pAction, pProperty );

        // Automatically set columns which point to a "Parent Column" to hidden
        if ( _hasChangedNotEqualsTo( this.getProperty( model.PROP.MASTER_COLUMN ), pAction, pProperty, "" ) ) {
            _setPropertyValue( this, model.PROP.ITEM_TYPE, ITEM_TYPE.HIDDEN );
        }

        // Don't export and sort hidden items
        if ( _hasChangedEqualsTo( this.getProperty( model.PROP.ITEM_TYPE ), pAction, pProperty, ITEM_TYPE.HIDDEN ) ) {
            _setPropertyValue( this, model.PROP.ENABLE_SORT_GROUP,       "N" );
            _setPropertyValue( this, model.PROP.INCLUDE_IN_EXPORT_PRINT, "N" );
        }

        // LOV based and text item types should always be start (left) aligned
        if (  _hasChangedEqualsTo( lItemTypeProperty, pAction, pProperty, ITEM_TYPE.TEXT_FIELD )
           || _hasChangedEqualsTo( lItemTypeProperty, pAction, pProperty, ITEM_TYPE.TEXTAREA )
           || ( _hasChanged( lItemTypeProperty, pAction, pProperty ) && lLovTypeProperty )
           )
        {
            _setPropertyValue( this, model.PROP.COLUMN_ALIGNMENT,  "LEFT" );
            _setPropertyValue( this, model.PROP.HEADING_ALIGNMENT, "LEFT" );

            if  ( _hasChangedEqualsTo( lItemTypeProperty, pAction, pProperty, ITEM_TYPE.TEXTAREA ) ) {
                _setPropertyValue( this, model.PROP.FILTER_LOV_TYPE,   "NONE" );
                _setPropertyValue( this, model.PROP.ENABLE_SORT_GROUP, "N" );
            }

        } else if ( _hasChangedEqualsTo( lItemTypeProperty, pAction, pProperty, ITEM_TYPE.NUMBER_FIELD ) ) {
            _setPropertyValue( this, model.PROP.COLUMN_ALIGNMENT,  "RIGHT" );
            _setPropertyValue( this, model.PROP.HEADING_ALIGNMENT, "RIGHT" );
            _setPropertyValue( this, model.PROP.FILTER_LOV_TYPE,   "NONE" );

        }

        // toggle column filter and column filter LOV type based on the column data type
        if ( _hasChanged( lDataTypeProperty, pAction, pProperty ) ) {
            if ( $.inArray( lDataTypeProperty.getValue(), model.UNSORTABLE_COLUMN_DATA_TYPES ) !== -1 ) {
                if ( lDataTypeProperty.getValue() === "CLOB" ) {
                    // unsortable columns: Enable Column Filter only for CLOB columns, and use "NONE as the LOV type
                    _setPropertyValue( this, model.PROP.COLUMN_FILTER,   "Y" );
                    _setPropertyValue( this, model.PROP.FILTER_LOV_TYPE, "NONE" );
                } else {
                    // unsortable columns: Disable Column Filter for BLOB, BFILE and other columns
                    _setPropertyValue( this, model.PROP.COLUMN_FILTER, "N" );
                }
            } else {
                // enable Column Filter for simple columns
                _setPropertyValue( this, model.PROP.COLUMN_FILTER, "Y" );
            }
        }

        // Set Filter Data Type to VARCHAR2 if the item type does support LOV joining and an LOV has been defined
        if ( ( pAction === model.CALLBACK_ACTION.CREATED || pAction === model.CALLBACK_ACTION.CHANGED ) && lFilterDataTypeProperty ) {
            if ( JOIN_LOV && lLovTypeProperty && lLovTypeProperty.getValue() !== "" ) {
                lFilterDataType = "VARCHAR2";
            } else if ( lDataTypeProperty ) {
                lFilterDataType = lDataTypeProperty.getValue();
                // Use the default VARCHAR2 filter data type as long as no column data type has been provided
                if ( lFilterDataType === "" ) {
                    lFilterDataType = "VARCHAR2";
                }
            }
            if ( lFilterDataTypeProperty.getValue() !== lFilterDataType ) {
                lFilterDataTypeProperty.setValue( lFilterDataType );
            }
        }

        // If an LOV has been specified, use it for the filter as well
        if ( _hasChangedNotEqualsTo( this.getProperty( model.PROP.LOV_TYPE ), pAction, pProperty, "" ) ) {
            _setPropertyValue( this, model.PROP.FILTER_LOV_TYPE, "LOV" );
        }

    } // interactiveGridColumn


    function checkColumnIsInOrderBy ( pPropertyId, pPropertyValue, pColumnName ) {
        let isInOrderByClause;

        function checkColumnIsInOrderByExpression ( pOrderBys, pColumnName ) {
            return pOrderBys.filter( o => o.toUpperCase().includes( pColumnName ) ).length > 0;
        }

        if ( [ model.PROP.SOURCE_QUERY_ORDER_BY_ITEM, model.PROP.SOURCE_GRAPH_ORDER_BY_ITEM ].includes( pPropertyId ) ) {
            const jsonValue = JSON.parse( pPropertyValue );

            isInOrderByClause = jsonValue.orderBys.every( ( pElement ) => {
                const orderBys = pElement.expr.split( "," );

                return checkColumnIsInOrderByExpression ( orderBys, pColumnName );
            } );
        } else if ( [ model.PROP.SOURCE_QUERY_ORDER_BY, model.PROP.SOURCE_GRAPH_ORDER_BY ].includes( pPropertyId ) ) {
            const orderBys = pPropertyValue.split( "," );

            isInOrderByClause = checkColumnIsInOrderByExpression ( orderBys, pColumnName );
        }
        return isInOrderByClause;
    } // checkColumnIsInOrderBy

    function regionTemplateComponentColumn( pAction, pProperty ) {
        if (    pAction === model.CALLBACK_ACTION.CHANGED
             && pProperty.id === model.PROP.IS_GROUP ) {
            const region = this.getParent(),
                  orderByType = region.getProperty( model.PROP.SOURCE_QUERY_ORDER_BY_TYPE ),
                  orderByProperty = region.getProperty( SOURCE_QUERY_ORDER_BY_PROPS ),
                  columnName = this.getProperty( model.PROP.SOURCE_DB_COLUMN ).getValue(),
                  regionPluginAttributes = region.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ],
                  tmplColumns = region.getChilds( model.COMP_TYPE.REGION_TMPL_COLUMN, {
                      properties: [ {
                          id: model.PROP.IS_GROUP,
                          value: "Y"
                      } ]
                  } );

            // set hidden attribute to show/hide report group plug-in attributes
            if ( regionPluginAttributes ) {
                _setPropertyValue( regionPluginAttributes, model.PROP.HIDDEN_COLUMNS_HAVE_GROUPS, tmplColumns?.length > 0 ? "Y" : "N" );
            }

            if (    columnName
                 && pProperty.getValue() === "Y"
                 && orderByType.getValue() === "" ) {
                orderByType.setValue( "STATIC" );
                _setPropertyValue( region, [ model.PROP.SOURCE_QUERY_ORDER_BY, model.PROP.SOURCE_GRAPH_ORDER_BY ], columnName );
            }
            if ( orderByProperty ) {
                _revalidateProperty( null, orderByProperty );
            }
        }
    } // regionTemplateComponentColumn

    function templateComponentRegionPlugin( pAction, pProperty, pOldValue, pSql ) {
        let regionPluginAttributes,
            templateComponentType;

        // Synchronize the region columns as soon as one of the source properties changes
        if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && model.SOURCE_LOCATION_PROPS.includes( pProperty.id ) ) )
        {

            if ( pAction === model.CALLBACK_ACTION.CREATED ) {
                const regionType             = this.getProperty( model.PROP.REGION_TYPE ).getValue();
                const templateComponentTypes = model.getComponentType( model.COMP_TYPE.REGION ).pluginType.plugins[ regionType ].templateTypes;
                // default TEMPLATE_COMPONENT_TYPE with a supported type, if both are supported, REPORT is the preferred one
                const templateComponentType  = templateComponentTypes.includes( "REPORT" ) ? "REPORT" :
                                               templateComponentTypes.includes( "PARTIAL" ) ?  "PARTIAL" :
                                               "REGION_ONLY";
                const sourceLocation         = this.getProperty( model.PROP.SOURCE_LOCATION ).getValue();

                regionPluginAttributes =
                    new model.Component( {
                            typeId:   model.COMP_TYPE.REGION_PLUGIN_ATTR,
                            parentId: this.id,
                            values:   [
                                {
                                    id:    model.PROP.HIDDEN_REGION_TYPE,
                                    value: regionType
                                }, {
                                    id:    model.PROP.TEMPLATE_COMPONENT_TYPE,
                                    value: templateComponentType
                                }, {
                                    id:    model.PROP.HIDDEN_SOURCE_LOCATION,
                                    value: sourceLocation
                                }]
                        } );

                if ( templateComponentType === "REPORT" ) {
                    this.getProperty( model.PROP.SOURCE_LOCATION ).setValue( "LOCAL", true ) ;
                }

                // We have to split the logic into two places, CHANGED is handled by regionPluginAttr.
                _setTemplateComponentRegionTemplate( this, templateComponentType );

            } else {
                regionPluginAttributes = this.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ];
                templateComponentType  = regionPluginAttributes.getProperty( model.PROP.TEMPLATE_COMPONENT_TYPE ).getValue();
            }

            // set "Show Total Row Count" property to "No" for web sources
            if ( this.getProperty( model.PROP.SOURCE_LOCATION )?.getValue() === "WEB_SOURCE" ) {
                _setPropertyValue( regionPluginAttributes, model.PROP.SHOW_TOTAL_ROW_COUNT, "N" );
            }

            manageColumns( this, this, model.COMP_TYPE.REGION_TMPL_COLUMN, model.PROP.SOURCE_DB_COLUMN, {
                add: function( pValues, pSqlColumn ) {

                    pValues.push( { id: model.PROP.HIDDEN_TEMPLATE_COMPONENT_TYPE, value: templateComponentType } );
                    pValues.push( { id: model.PROP.COLUMN_NAME_UPPER,              value: pSqlColumn.name.replace( / /g, "_" ).toUpperCase() } );
                    pValues.push( { id: model.PROP.COLUMN_SOURCE_TYPE,             value: "DB_COLUMN" } );
                    pValues.push( { id: model.PROP.SOURCE_DB_COLUMN,               value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.DATA_TYPE,                      value: pSqlColumn.type } );


                    if ( pSqlColumn.isPrimaryKey || pSqlColumn.type === "ROWID" ) {

                        pValues.push( { id: model.PROP.IS_PRIMARY_KEY, value: "Y" } );

/*
                    } else if ( pSqlColumn.type === "CLOB" ) {

                        // phase 2 $$$ pValues.push( { id: model.PROP.REGION_COLUMN_SESSION_STATE_DATA_TYPE, value: "CLOB" } );
*/
                    }
                },
                update: function( pRegionColumn, pSqlColumn ) {

                    let dataTypeProperty = pRegionColumn.getProperty( model.PROP.DATA_TYPE );

                    // Update the column type property if it has changed
                    if ( dataTypeProperty.getValue() !== pSqlColumn.type ) {
                        dataTypeProperty.setValue( pSqlColumn.type );
                    }
                }
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            _removeChildren( this, model.COMP_TYPE.REGION_TMPL_COLUMN );
            _removeChildren( this, model.COMP_TYPE.REGION_ACTION );
            // REGION_PLUGIN_ATTR is removed by the generic code in pe.model / _callPluginCallback

        }

        if ( pAction === model.CALLBACK_ACTION.VALIDATE ) {
            // check if SQL Query has order by like we do it for the grid
            if ( model.SOURCE_LOCATION_PROPS.includes( pProperty.id ) && pSql.hasOrderBy ) {
                return { error: format( "TMPL_COMPONENT.HAS_ORDER_BY" ) };
            }

            // check if group by columns are included in order by
            if ( SOURCE_QUERY_ORDER_BY_PROPS.includes( pProperty.id ) ) {
                const tmplColumns = this.getChilds( model.COMP_TYPE.REGION_TMPL_COLUMN, {
                    properties: [ {
                        id: model.PROP.IS_GROUP,
                        value: "Y"
                    } ]
                } ),
                      orderByProperty = this.getProperty( SOURCE_QUERY_ORDER_BY_PROPS );
                let returnWarning;

                // check each single column
                tmplColumns.every( ( pElement ) => {
                    const columnName = pElement.getProperty( model.PROP.SOURCE_DB_COLUMN )?.getValue();

                    // only check columns that type is db column
                    if ( columnName ) {
                        returnWarning = !checkColumnIsInOrderBy ( orderByProperty?.id, pOldValue, columnName );
                        if ( returnWarning ) {
                            return false;
                        }
                    }
                    return true;
                } );

                if ( returnWarning ) {
                    return { warning: format( "TMPL_COMPONENTS_COLUMN_GROUP.COLUMN_IS_NOT_IN_ORDER_BY_CLAUSE" ) };
                }
            }
        }
    } // templateComponentRegionPlugin


    function classicReportPlugin( pAction, pProperty, pOldValue ) {

        classicRptTabularFormPlugin( pAction, pProperty, this, model.COMP_TYPE.CLASSIC_REPORT, model.COMP_TYPE.CLASSIC_RPT_COLUMN, model.COMP_TYPE.CLASSIC_RPT_PRINT, pOldValue );

    } // classicReportPlugin


    function tabularFormPlugin( pAction, pProperty, pOldValue ) {

        var lSelf = this,
            lTabForms;

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // eslint-disable-next-line no-alert
            alert( format( "TABFORM.WARNING" ) );

        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE && pProperty.id === model.PROP.REGION_TYPE ) {

            // Raise an error if there is already a tabular form on the page
            lTabForms = model.getComponents( model.COMP_TYPE.REGION, {
                properties: [{
                    id: model.PROP.REGION_TYPE,
                    value: "NATIVE_TABFORM" }
                ],
                filterFunction: function() {
                    return ( this.id !== lSelf.id );
                }
            } );

            if ( lTabForms.length > 0 ) {
                return { error: format( "TABFORM.ONLY_ONE_PER_PAGE" ) };
            }
        }
        classicRptTabularFormPlugin( pAction, pProperty, this, model.COMP_TYPE.TABULAR_FORM, model.COMP_TYPE.TAB_FORM_COLUMN, model.COMP_TYPE.TAB_FORM_PRINT, pOldValue );

    } // tabularFormPlugin


    function classicRptTabularFormColumn( pColumn, pComponentTypeId, pAction, pProperty, pValue ) {

        var lRegion = pColumn.getParent(),
            lHeadingProperty;

        // No sorting is allowed if the report query contains an order by
        if (  pAction === model.CALLBACK_ACTION.VALIDATE
            && (  ( pProperty.id === model.PROP.DISABLE_SORT_COLUMN  && pValue === "N" )
            || ( pProperty.id === model.PROP.COLUMN_SORT_SEQUENCE && pValue !== "" )
            )
            && hasOrderBy( lRegion )
        )
        {
            return { error: format( "CLASSIC_RPT_TABFORM_COLUMN.NO_SORTING" ) };

        } else if (  pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty.id === model.PROP.COLUMN_SORT_SEQUENCE
            && pProperty.getValue() === ""
            && hasOrderBy( lRegion )
            && pColumn.getProperty( model.PROP.DISABLE_SORT_COLUMN ).getValue() === "N"
        )
        {
            _setPropertyValue( pColumn, model.PROP.DISABLE_SORT_COLUMN, "Y" );
        }

        if ( pAction === model.CALLBACK_ACTION.CHANGED
           && pProperty.id === model.PROP.CLASSIC_REPORT_COLUMN_TYPE
           && pValue  === "HIDDEN_COLUMN" ) // pValue contains the previous value
        {
            lHeadingProperty = pColumn.getProperty( model.PROP.COLUMN_HEADING );
            if ( lHeadingProperty && lHeadingProperty.getValue() === "" ) {
                lHeadingProperty.setValue( initCapColumnName( pColumn.getProperty( model.PROP.COLUMN_NAME ).getValue() ) );
            }
        }

    } // classicRptTabularFormColumn


    function classicReportColumn( pAction, pProperty, pValue ) {

        return classicRptTabularFormColumn( this, model.COMP_TYPE.CLASSIC_RPT_COLUMN, pAction, pProperty, pValue );

    } // classicReportColumn


    function tabularFormColumn( pAction, pProperty, pValue ) {

        return classicRptTabularFormColumn( this, model.COMP_TYPE.TAB_FORM_COLUMN, pAction, pProperty, pValue );

    } // tabularFormColumn

    function validateDateFormatMask( pThis, pAction, pProperty, pValue ) {
        if (   pAction === model.CALLBACK_ACTION.VALIDATE
            && pProperty?.id === model.PROP.FORMAT_MASK_DATE
            && !( "" + pValue ).match( REGEX_STRING_HAS_ITEM_SUBSTITUTION ) ) { // when substitution is used we cannot check now
            try {
                // create a date string with the given format mask that is needed to try the parse
                const dateString = date.format( new Date(), pValue );
                // now parse the date, parse function has less supported format mask parts
                date.parse( dateString, pValue );
            } catch ( e ) {
                return { error: format( "ITEM.ERROR_FORMAT_MASK_DATE", e?.cause ) };
            }
        }
    }

    function facetedSearchOrSmartFilters( pAction ) {

        const SEARCH_FIELD_NAME = "P" + model.getCurrentPageId() + "_SEARCH";

        let facetFilterTypeId;

        if ( this.getProperty( model.PROP.REGION_TYPE ).getValue() === REGION_TYPE.FACETED_SEARCH ) {
            facetFilterTypeId      = model.COMP_TYPE.FACET;
        } else {
            facetFilterTypeId      = model.COMP_TYPE.SFILTER;
        }

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // pre-create the Search facet / filter
            _createComponent( {
                typeId: facetFilterTypeId,
                parentId: this.id,
                searchPropertyValues: [
                    { id: model.PROP.ITEM_NAME, value: SEARCH_FIELD_NAME }
                ],
                addPropertyValues: [
                    { id: model.PROP.ITEM_NAME,  value: SEARCH_FIELD_NAME },
                    { id: model.PROP.ITEM_TYPE,  value: "NATIVE_SEARCH" },
                    { id: model.PROP.ITEM_LABEL, value: lang.getMessage("SL.PLACEHOLDER" )}
                ],
                previousComponent: "first" } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove created Facets and Filter Controls.
            // We do delete both (Facets and Filters) component types, because when
            // reading an existing page with a Faceted Search or Smart Filters region,
            // the PD configuration will duplicate the same "page items" into the Facets
            // and Filters component types, because they do have the same where clause restriction.
            _removeChildren( this, model.COMP_TYPE.FACET );
            _removeChildren( this, model.COMP_TYPE.FACET_GROUP );
            _removeChildren( this, model.COMP_TYPE.SFILTER );
            _removeChildren( this, model.COMP_TYPE.SFILTER_GROUP );
        }
    } // facetedSearchOrSmartFilters


    function regionPluginWithColumns( pAction, pProperty ) {

        var PLUGIN               = model.getComponentType( model.COMP_TYPE.REGION ).pluginType.plugins [ this.getProperty( model.PROP.REGION_TYPE ).getValue() ],
            HAS_COLUMN_ALIGNMENT = ( $.inArray( "VALUE_ALIGNMENT", PLUGIN.features ) !== -1 );

        if (  pAction === model.CALLBACK_ACTION.CREATED
           || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            //
            // Note: Keep this code in sync with wwv_flow_wizard_api.create_region_columns!
            //
            manageColumns( this, this, model.COMP_TYPE.REGION_COLUMN, model.PROP.COLUMN_NAME, {
                add: function( pValues, pSqlColumn ) {

                    pValues.push( { id: model.PROP.COLUMN_NAME,        value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.HIDDEN_REGION_TYPE, value: PLUGIN.name } );
                    pValues.push( { id: model.PROP.COLUMN_TYPE,        value: pSqlColumn.type } );

                    if ( pSqlColumn.isPrimaryKey || pSqlColumn.type === "ROWID" ) {
                        pValues.push( { id: model.PROP.IS_VISIBLE, value: "N" } );
                    } else {
                        if ( $.inArray( "COLUMN_HEADING", PLUGIN.features ) !== -1 ) {
                            pValues.push( {
                                id:    model.PROP.COLUMN_HEADING,
                                value: initCapColumnName( pSqlColumn.name )
                            } );
                        }
                        if ( HAS_COLUMN_ALIGNMENT ) {

                            if ( pSqlColumn.type === "NUMBER" ) {
                                pValues.push( { id: model.PROP.COLUMN_ALIGNMENT, value: "RIGHT" } );
                                pValues.push( { id: model.PROP.HEADING_ALIGNMENT, value: "RIGHT" } );

                            } else {
                                pValues.push( { id: model.PROP.COLUMN_ALIGNMENT, value: "LEFT" } );
                                pValues.push( { id: model.PROP.HEADING_ALIGNMENT, value: "LEFT" } );

                            }
                        }
                    }

                },
                update: function( pRegionColumn, pSqlColumn ) {

                    var lProperty = pRegionColumn.getProperty( model.PROP.COLUMN_TYPE );

                    // Update the column type property if it has changed
                    // We intentionally don't set IS_VISIBLE or COLUMN_ALIGNMENT, because that might have already
                    // been changed by the developer
                    if ( lProperty.getValue() !== pSqlColumn.type ) {
                        lProperty.setValue( pSqlColumn.type );
                    }
                }
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove all region columns if that hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.REGION_COLUMN );

        }
    } // regionPluginWithColumns


    function cardAttributes( pAction, pProperty ) {

        var lIconSourceType = this.getProperty( model.PROP.ICON_SOURCE_TYPE ),
            lMediaSourceType = this.getProperty( model.PROP.MEDIA_SOURCE_TYPE ),
            lCardUsesBlobColumn = this.getProperty( model.PROP.CARD_USES_BLOB_COLUMN );

        // If Icon or Media Source are derived from a BLOB column, we have to set our 'virtual' CARD_USES_BLOB_COLUMN property,
        // because that is used by BLOB_PK_COLUMN1 property to determin if we should ask for a BLOB PK.
        // CARD_USES_BLOB_COLUMN is also set at query time as virtual column in wwv_flow_cards
        if ( _hasChanged( lIconSourceType, pAction, pProperty ) || _hasChanged( lMediaSourceType, pAction, pProperty ) ) {
            if ( ( lIconSourceType && lIconSourceType.getValue() === "BLOB" ) || ( lMediaSourceType && lMediaSourceType.getValue() === "BLOB" ) ) {
                lCardUsesBlobColumn.setValue( "Y" );
            } else {
                lCardUsesBlobColumn.setValue( "N" );
            }
        }

    } // cardAttributes

    function mapRegionAttributes( pAction ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Create the first layer
            new model.Component( {
                typeId:   model.COMP_TYPE.MAP_LAYER,
                parentId: this.id
            } );
        }

    } // mapRegionAttributes

    function searchRegionPlugin( pAction ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Create the first search source
            new model.Component( {
                typeId:   model.COMP_TYPE.SEARCH_REGION_SOURCE,
                parentId: this.id
            } );

            let defaultSearchRegionTemplate = model.getTheme().defaultTemplates.search;

                if ( defaultSearchRegionTemplate ) {
                    _setPropertyValue( this, model.PROP.REGION_TEMPLATE, defaultSearchRegionTemplate );
                }

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            _removeChildren( this, model.COMP_TYPE.SEARCH_REGION_SOURCE );

        }

    } // searchRegionPlugin

    function mapRegionPlugin( pAction ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Create the mapRegionPlugin attributes
            new model.Component( {
                typeId:   model.COMP_TYPE.MAP_REGION,
                parentId: this.id
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the chartPlugin attributes if it hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.MAP_REGION );

        }
    } // mapRegionPlugin


    function jetChartPlugin( pAction ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Create the chartPlugin attributes
            new model.Component( {
                typeId:   model.COMP_TYPE.JET_CHART,
                parentId: this.id
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the chartPlugin attributes if it hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.JET_CHART );

        }
    } // jetChartPlugin

    function jetChartAttributes( pAction, pProperty ) {

        var C_AXES_SUPPORT = [ "area", "bar", "boxPlot", "bubble", "combo", "line", "lineWithArea", "range", "polar", "radar", "stock", "scatter", "gantt" ];

        var lSelf = this,
            lChartTypeProperty = lSelf.getProperty( model.PROP.JET_CHART_TYPE ),
            lChartType = lChartTypeProperty.getValue(),
            lSeries,
            lAxes,
            lOrientationProperty;

        function addAxes () {
            var axis_one, axis_two;

            if ( lSelf.getChilds( model.COMP_TYPE.JET_CHART_AXES ).length === 0 ) {

                if ( lChartType === "gantt" ) {
                    axis_one = "major";
                    axis_two = "minor";
                } else {
                    axis_one = "x";
                    axis_two = "y";
                }

                new model.Component( {
                    typeId:   model.COMP_TYPE.JET_CHART_AXES,
                    parentId: lSelf.id,
                    values: [{
                        id:    model.PROP.NAME, // $$$ todo: we shouldn't use NAME!
                        value: axis_one
                    }]
                } );
                new model.Component( {
                    typeId:   model.COMP_TYPE.JET_CHART_AXES,
                    parentId: lSelf.id,
                    values: [{
                        id:    model.PROP.NAME, // $$$ todo: we shouldn't use NAME!
                        value: axis_two
                    }]
                } );

            }
        }

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Create the first series
            new model.Component( {
                typeId:   model.COMP_TYPE.JET_CHART_SERIES,
                parentId: lSelf.id,
                values: [{
                    id:    model.PROP.SERIES_CHART_TYPE,
                    value: lChartType
                }]
            } );

            // Create X and Y axis
            if ( $.inArray( lChartType, C_AXES_SUPPORT ) !== -1 ) {
                addAxes();
            }

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            lSeries = lSelf.getChilds( model.COMP_TYPE.JET_CHART_SERIES );

            if ( pProperty.id === model.PROP.JET_CHART_TYPE ) {

                // synchronize the current chartPlugin type to all series
                for ( let i = 0; i < lSeries.length; i++ ) {
                    _setPropertyValue( lSeries[ i ], model.PROP.SERIES_CHART_TYPE, lChartType );
                }

                // Some chart types only support one series, remove all the others
                if ( $.inArray( lChartType, [ "dial", "stock", "gantt" ] ) !== -1 ) {
                    for ( let i = 1; i < lSeries.length; i++ ) {
                        lSeries [ i ].remove();
                    }
                }

                // Some chart types don't support series
                if ( $.inArray( lChartType, C_AXES_SUPPORT ) !== -1 ) {

                    lAxes = lSelf.getChilds ( model.COMP_TYPE.JET_CHART_AXES );
                    if ( lAxes.length !== 0 ) {
                        // Gantt Chart only supports major/minor axes - clear existing x/y/y2
                        if ( lAxes [0].getProperty( model.PROP.NAME ).getValue() === "x" && lChartType === "gantt" ) {
                            _removeChildren( lSelf, model.COMP_TYPE.JET_CHART_AXES );
                        }
                        // All Other Chart Types support x/y/y2 axes - clear existing major/minor
                        if ( lAxes [0].getProperty( model.PROP.NAME ).getValue() === "major" && lChartType !== "gantt" ) {
                            _removeChildren( lSelf, model.COMP_TYPE.JET_CHART_AXES );
                        }
                    }

                    addAxes();
                } else {
                    _removeChildren( lSelf, model.COMP_TYPE.JET_CHART_AXES );
                }

            }
        }

        // =================================================================================================
        // Defaults set depending on chart type. Keep in sync with Create App/Page Wizard (wizapi.plb)!
        // =================================================================================================

        if ( _hasChanged( lChartTypeProperty, pAction, pProperty ) ) {
            if ( lChartType === "pie" ) {
                _setPropertyValue( lSelf, model.PROP.LEGEND_RENDERED, "on" );
            }
            if ( lChartType === "pie" || lChartType === "donut" ) {
                _setPropertyValue( lSelf, model.PROP.VALUE_FORMAT_TYPE, "decimal" );
                _setPropertyValue( lSelf, model.PROP.VALUE_DECIMAL_PLACES, "0" );
                _setPropertyValue( lSelf, model.PROP.VALUE_FORMAT_SCALING, "none" );
            }
        }

        // Default height/max width attribute depending on chart type

        // Dial/Status Meter Gauge chart type
        lOrientationProperty = lSelf.getProperty( model.PROP.JET_GAUGE_ORIENTATION );
        if ( _hasChangedEqualsTo( lChartTypeProperty, pAction, pProperty, "dial" ) ||
             _hasChanged( lOrientationProperty, pAction, pProperty ) )
        {

            if ( lOrientationProperty.getValue() === "circular" ) {
                _setPropertyValue( lSelf, model.PROP.CHART_HEIGHT,    "100" );
                _setPropertyValue( lSelf, model.PROP.CHART_MAX_WIDTH, "90" );
            } else if ( lOrientationProperty.getValue() === "vertical" ) {
                _setPropertyValue( lSelf, model.PROP.CHART_HEIGHT,    "200" );
                _setPropertyValue( lSelf, model.PROP.CHART_MAX_WIDTH, "21" );
            } else if ( lOrientationProperty.getValue() === "horizontal" ) {
                _setPropertyValue( lSelf, model.PROP.CHART_HEIGHT,    "" );
                _setPropertyValue( lSelf, model.PROP.CHART_MAX_WIDTH, "250" );
            }

        // all other chart types
        } else if ( _hasChangedNotEqualsTo( lChartTypeProperty, pAction, pProperty, "dial" ) ) {
            _setPropertyValue( lSelf, model.PROP.CHART_HEIGHT,    "400" );
            _setPropertyValue( lSelf, model.PROP.CHART_MAX_WIDTH, "" );
        }

    } // jetChartAttributes

    function jetChartSeries( pAction, pProperty, pOldValue ) {

        var PROP_SERIES_TYPES = [
            model.PROP.JET_SERIES_TYPE_COMBO,
            model.PROP.JET_SERIES_TYPE_RANGE,
            model.PROP.JET_SERIES_TYPE_POLAR,
            model.PROP.JET_SERIES_TYPE_RADAR,
            model.PROP.JET_SERIES_TYPE_BOX_PLOT,
            model.PROP.SERIES_CHART_TYPE /* used for single chart types */
        ];

        var lSelf = this,
            lRegionSourceLocationProperty,
            lResult;

        function getSeriesType() {

            var i, lProperty;

            // Find the series type property which exists depending on the chart type
            for ( i = 0; i < PROP_SERIES_TYPES.length; i++ ) {
                lProperty = lSelf.getProperty( PROP_SERIES_TYPES[ i ] );
                if ( lProperty ) {
                    break;
                }
            }

            return lProperty.getValue();
        }

        if (  pAction === model.CALLBACK_ACTION.CREATED
           || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, PROP_SERIES_TYPES ) !== -1 )
           )
        {
            // Replicate the value of our conditional series type properties into our
            // series type column mapping property. This property always exists and is used by the different column
            // properties as a dependency column
            _setPropertyValue( lSelf, model.PROP.JET_SERIES_TYPE_COLUMN_MAPPING, getSeriesType() );
        }

        // We only check CHANGED, because during create we can't access the parents yet
        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.CHILD_SOURCE_LOCATION ) {
            lRegionSourceLocationProperty = lSelf.getParent().getParent().getProperty( model.PROP.SOURCE_LOCATION );
            if ( lSelf.getProperty( model.PROP.CHILD_SOURCE_LOCATION ).getValue() === "REGION_SOURCE" ) {
                lRegionSourceLocationProperty._isRequired = true;

                // Force a re-validation of the region source property if it's needed for the chart series and if it's currently empty
                if ( lRegionSourceLocationProperty.getValue() === "" ) {
                    lRegionSourceLocationProperty.setValue( "", true );
                }
            }  else {
                lRegionSourceLocationProperty._isRequired = false;
            }
        }

        lResult = sourceLocationHandling( pAction, this, pProperty, pOldValue, model.COMP_TYPE.JET_CHART_WS_PARAM );
        if ( lResult ) {
            return lResult;
        }

        // Create Y2 axis when Series assigned to Y2
        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.ASSIGNED_TO_Y2 ) {
            if ( lSelf.getProperty( model.PROP.ASSIGNED_TO_Y2 ).getValue() === "on" ) {
                if ( lSelf.getParent().getChilds( model.COMP_TYPE.JET_CHART_AXES ).length === 2 ) {
                    new model.Component( {
                        typeId:   model.COMP_TYPE.JET_CHART_AXES,
                        parentId: lSelf.getParent().id,
                        values: [{
                            id:    model.PROP.NAME, // $$$
                            value: "y2"
                        }]
                    } );
                }
            } // $$$ we should have an else where remove the y2 if no series is using it anymore
        }

        // Pie charts do show the labels, keep in sync with Create App and Page wizard
        if ( _hasChangedEqualsTo( lSelf.getProperty( model.PROP.SERIES_CHART_TYPE ), pAction, pProperty, "pie" ) ) {
            _setPropertyValue( lSelf, model.PROP.ITEMS_LABEL_RENDERED, "Y" );
        }

    } // jetChartSeries

    function jetChartAxes( pAction ) {

        var lSelf = this,
            lName;

        // =================================================================================================
        // Defaults set depending on Axis type. Keep in sync with Create App/Page Wizard (wizapi.plb)!
        // =================================================================================================
        if (  pAction === model.CALLBACK_ACTION.CREATED ) {

            lName = lSelf.getProperty( model.PROP.NAME ).getValue();

            if ( lName === "y" ) {
                _setPropertyValue( lSelf, model.PROP.VALUE_FORMAT_TYPE,    "decimal" );
                _setPropertyValue( lSelf, model.PROP.VALUE_DECIMAL_PLACES, "0" );
                _setPropertyValue( lSelf, model.PROP.VALUE_FORMAT_SCALING, "none" );
            } else if ( lName === "major" ) {
                _setPropertyValue( lSelf, model.PROP.JET_AXIS_SCALE, "months" );
            } else if ( lName === "minor" ) {
                _setPropertyValue( lSelf, model.PROP.VALUE_FORMAT_TYPE, "decimal" );
                _setPropertyValue( lSelf, model.PROP.JET_AXIS_SCALE,    "days" );
            }
        }

    } // jetChartAxes

    function mapLayerAttributes( pAction, pProperty, pOldValue ) {
        var lSelf = this,
            lRegionSourceLocationProperty;

        // We only check CHANGED, because during create we can't access the parents yet
        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.CHILD_SOURCE_LOCATION ) {
            lRegionSourceLocationProperty = lSelf.getParent().getParent().getProperty( model.PROP.SOURCE_LOCATION );
            if ( lSelf.getProperty( model.PROP.CHILD_SOURCE_LOCATION ).getValue() === "REGION_SOURCE" ) {
                lRegionSourceLocationProperty._isRequired = true;

                // Force a re-validation of the region source property if it's needed for the chart series and if it's currently empty
                if ( lRegionSourceLocationProperty.getValue() === "" ) {
                    lRegionSourceLocationProperty.setValue( "", true );
                }
            }  else {
                lRegionSourceLocationProperty._isRequired = false;
            }
        }

        return sourceLocationHandling( pAction, lSelf, pProperty, pOldValue, model.COMP_TYPE.MAP_LAYER_WS_PARAM );
    }

    function legacyCalendarPlugin( pAction, pProperty ) {

        var lSelf = this,
            lCalendars;

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            new model.Component( {
                typeId:   model.COMP_TYPE.CLASSIC_CALENDAR,
                parentId: this.id
            } );
            // eslint-disable-next-line no-alert
            alert( format( "LEGACY_CALENDAR.WARNING" ) );

        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE && pProperty.id === model.PROP.REGION_TYPE ) {

            // Raise an error if there is already a legacy calendar on the page
            lCalendars = model.getComponents( model.COMP_TYPE.REGION, {
                properties: [{
                    id: model.PROP.REGION_TYPE,
                    value: "NATIVE_CALENDAR" }
                ],
                filterFunction: function() {
                    return ( this.id !== lSelf.id );
                }
            } );

            if ( lCalendars.length > 0 ) {
                return { error: format( "LEGACY_CALENDAR.ONLY_ONE_PER_PAGE" ) };
            }

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove the calendar attributes if it hasn't already been done (i.e if the region is removed)
            _removeChildren( this, model.COMP_TYPE.CLASSIC_CALENDAR );

        }
    } // legacyCalendarPlugin


    function formPlugin( pAction, pProperty ) {

        var lSelf = this;

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Always add the Init process after any existing process.
            new model.Component( {
                previousComponent: "last",
                typeId: model.COMP_TYPE.PAGE_PROCESS,
                values: [
                    { id: model.PROP.PAGE_PROCESS_TYPE,          value: "NATIVE_FORM_INIT" },
                    { id: model.PROP.PROCESS_DATA_SOURCE_REGION, value: lSelf.id },
                    { id: model.PROP.PROCESS_POINT,              value: "BEFORE_HEADER" },
                    { id: model.PROP.NAME, value: lang.formatMessageNoEscape( "WIZARD.FORM.INIT_PROCESS_NAME", this.getParent().getDisplayTitle() )}
                ]
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Clean up after removing the region / changing the region type
            // remove the added page items, i.e. page items with the form region as source
            _removeComponents(
                model.getComponents( model.COMP_TYPE.PAGE_ITEM, {
                    properties: [ { id: model.PROP.DATA_SOURCE_REGION, value: lSelf.id } ]
                } )
            );

            // remove the added processes
            _removeComponents(
                model.getComponents( model.COMP_TYPE.PAGE_PROCESS, {
                    properties: [ { id: model.PROP.PROCESS_DATA_SOURCE_REGION, value: lSelf.id } ]
                } )
            );
        }

        if (  pAction === model.CALLBACK_ACTION.CREATED
            || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, model.SOURCE_LOCATION_PROPS ) !== -1 ) )
        {
            manageColumns( lSelf, undefined, model.COMP_TYPE.PAGE_ITEM, model.PROP.DATA_SOURCE_COLUMN, {
                add: function( pValues, pSqlColumn ) {

                    var lIsVisible = true,
                        lItemName;

                    // *************************************************************************************************
                    // KEEP IN SYNC with wwv_flow_form_region_dev.plb
                    // *************************************************************************************************

                    lItemName = model.getUniquePropertyValue( null, model.COMP_TYPE.PAGE_ITEM, model.PROP.ITEM_NAME, "P" + model.getCurrentPageId() + "_" + pSqlColumn.name );
                    pValues.push( { id: model.PROP.ITEM_NAME,          value: lItemName } );
                    pValues.push( { id: model.PROP.REGION,             value: lSelf.id } );
                    pValues.push( { id: model.PROP.DATA_SOURCE_REGION, value: lSelf.id } );
                    pValues.push( { id: model.PROP.DATA_SOURCE_COLUMN, value: pSqlColumn.name } );
                    pValues.push( { id: model.PROP.DATA_TYPE,          value: pSqlColumn.type } );

                    if ( pSqlColumn.isPrimaryKey || pSqlColumn.type === "ROWID" ) {

                        lIsVisible = false;
                        pValues.push( {id: model.PROP.ITEM_TYPE,      value: ITEM_TYPE.HIDDEN} );
                        pValues.push( {id: model.PROP.IS_PRIMARY_KEY, value: "Y"} );
                        pValues.push( {id: model.PROP.IS_QUERY_ONLY,  value: ( pSqlColumn.isQueryOnly ? "Y" : "N" ) } );

                    } else if ( pSqlColumn.type === "VARCHAR2" ) {

                        if ( pSqlColumn.maxLen < ITEM_TYPE_TEXTAREA_THRESHOLD || pSqlColumn.isGeneric ) {
                            pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXT_FIELD } );
                        } else {
                            pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXTAREA } );
                        }
                        if ( pSqlColumn.maxLen ) {
                            pValues.push( { id: model.PROP.ELEMENT_MAX_CHARACTERS, value: pSqlColumn.maxLen + "" } );
                        }

                    } else if ( pSqlColumn.type === "CLOB" ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXTAREA } );
                        pValues.push( { id: model.PROP.PAGE_ITEM_DATA_TYPE, value: "CLOB" } );

                    } else if ( pSqlColumn.type === "NUMBER" ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.NUMBER_FIELD } );

                    } else if ( $.inArray( pSqlColumn.type, [ "TIMESTAMP_TZ" ] ) !== -1 ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.TEXT_FIELD } );
                        // $$$ date picker does not support time zones, so default TIMESTAMP_TZ data type to Text Field

                    } else if ( $.inArray( pSqlColumn.type, [ "DATE", "TIMESTAMP", "TIMESTAMP_LTZ" ] ) !== -1 ) {

                        pValues.push( { id: model.PROP.ITEM_TYPE, value: ITEM_TYPE.DATE_PICKER } );

                    }


                    if ( lIsVisible ) {
                        pValues.push( { id: model.PROP.ITEM_LABEL,     value: initCapColumnName( pSqlColumn.name )} );
                        pValues.push( { id: model.PROP.VALUE_REQUIRED, value: pSqlColumn.isRequired ? "Y" : "N" } );
                    }
                },
                update: updateColumnAttributes,
                filter: { properties: [{ id: model.PROP.DATA_SOURCE_REGION, value: lSelf.id }] }
            } );
        }

    } // formPlugin


    function setValuePlugin( pAction, pProperty ) {

        var SET_TYPE_ID     = model.getPluginProperty( model.COMP_TYPE.DA_ACTION, "NATIVE_SET_VALUE", 1 ).id,
            lFireOnPageLoad = this.getProperty( model.PROP.FIRE_ON_PAGE_LOAD );

        // By default, a set value operation of type "Dialog Return Item" should not fire during page load, because
        // it only works in a "Dialog Closed" event.
        if (  pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty.id === SET_TYPE_ID
            && pProperty.getValue() === "DIALOG_RETURN_ITEM"
            && lFireOnPageLoad.getValue() === "Y" )
        {
            lFireOnPageLoad.setValue( "N" );
        }

    } // setValuePlugin


    function inputPlugin( pAction, pProperty, pValue ) {
        let lValidationResult;

        lValidationResult = validateDateFormatMask( this, pAction, pProperty, pValue );
        if ( lValidationResult ) {
            return lValidationResult;
        }

        if ( this.typeId === model.COMP_TYPE.SFILTER ) {
            const suggestionsTypeProp = this.getProperty( model.PROP.SUGGESTIONS_TYPE );

            // An "Input Field" facet/filter doesn't support DYNAMIC, always set it to None
            if ( _hasChangedEqualsTo( suggestionsTypeProp, pAction, pProperty, "DYNAMIC" ) ) {
                suggestionsTypeProp.setValue( "" );
            }
        }

    } // inputPlugin

    function rangePlugin( pAction, pProperty, pValue ) {
        let lValidationResult;

        lValidationResult = validateDateFormatMask( this, pAction, pProperty, pValue );
        if ( lValidationResult ) {
            return lValidationResult;
        }
    } // rangePlugin

    function radioGroupFilterPlugin( pAction /*, pProperty */ ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {
            // For better UX, we should always show all LOV entries and just "Disable" instead of "Hide" them,
            // this will makes it a lot easier to switch between those values
            _setPropertyValue( this, model.PROP.FC_ZERO_COUNT_ENTRIES, "D" );
            _setPropertyValue( this, model.PROP.FC_SORT_BY_TOP_COUNTS, "N" );
        }

    } // radioGroupFilterPlugin

    function webServiceProcessPlugin( pAction, pProperty, pOldValue ) {

        var PLUGIN_NAME,
            WS_OPER_PROPERTY_ID,
            STORE_RESULT_PROPERTY_ID;

        var that           = this,
            lWsOperationId,
            lStoreResultIn;

        function removeAllParams() {
            _removeChildren( that, model.COMP_TYPE.PAGE_PROC_WS_P_I );
            _removeChildren( that, model.COMP_TYPE.PAGE_PROC_WS_P_O );
            _removeChildren( that, model.COMP_TYPE.PAGE_PROC_WS_P_A );
        }

        function addParams( pWsOperationId, pComponentTypeId, pNewComponentTypeId ) {

            // Get all parameters of that web service operation and attach them to the process
            var lParameters = model.getComponents( pComponentTypeId, { parentId: pWsOperationId } );

            for ( let i = 0; i < lParameters.length; i++ ) {
                new model.Component( {
                    typeId:   pNewComponentTypeId,
                    parentId: that.id,
                    values: [
                        {
                            id:    model.PROP.PARAMETER_ID,
                            value: lParameters[ i ].id
                        },
                        {
                            id:    model.PROP.NAME,
                            value: lParameters[ i ].getProperty( model.PROP.NAME ).getValue()
                        }
                    ]
                } );
            }
        } // addParams

        if ( pAction === model.CALLBACK_ACTION.VALIDATE && pProperty.id === model.PROP.PAGE_PROCESS_TYPE ) {
            PLUGIN_NAME = pOldValue; // That's actually not the old value, it will contain the new page type. And because
                                     // we do support NATIVE_WEB_SERVICE and NATIVE_WEB_SERVICE_LEGACY we can't just hardcode the plug-in.
        } else {
            PLUGIN_NAME = this.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
        }
        WS_OPER_PROPERTY_ID      = model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, PLUGIN_NAME, 1 ).id;
        STORE_RESULT_PROPERTY_ID = model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, PLUGIN_NAME, 2 ).id;

        if ( pAction === model.CALLBACK_ACTION.CREATED || pAction === model.CALLBACK_ACTION.CHANGED ) {
            lWsOperationId = this.getProperty( WS_OPER_PROPERTY_ID ).getValue();
            lStoreResultIn = this.getProperty( STORE_RESULT_PROPERTY_ID ).getValue();
        }

        if (  ( pAction === model.CALLBACK_ACTION.CREATED && lWsOperationId !== "" )
            || ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === WS_OPER_PROPERTY_ID && lWsOperationId !== pOldValue ) )
        {
            // If the selected web service operation has been changed, remove all existing parameters
            if ( pAction === model.CALLBACK_ACTION.CHANGED ) {
                removeAllParams();
            }

            // Initialize the process specific in/out/auth parameters based on the web service operation parameters
            if ( lWsOperationId !== "" ) {
                addParams( lWsOperationId, model.COMP_TYPE.WS_REF_OPER_P_I, model.COMP_TYPE.PAGE_PROC_WS_P_I );
                addParams( lWsOperationId, model.COMP_TYPE.WS_REF_OPER_P_H, model.COMP_TYPE.PAGE_PROC_WS_P_I );
                if ( lStoreResultIn === "ITEMS" ) {
                    addParams( lWsOperationId, model.COMP_TYPE.WS_REF_OPER_P_O, model.COMP_TYPE.PAGE_PROC_WS_P_O );
                }
                addParams( lWsOperationId, model.COMP_TYPE.WS_REF_OPER_P_A, model.COMP_TYPE.PAGE_PROC_WS_P_A );
            }

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === STORE_RESULT_PROPERTY_ID && lStoreResultIn !== pOldValue ) {

            _removeChildren( that, model.COMP_TYPE.PAGE_PROC_WS_P_O );

            // Only initialize the output parameters if the result should be stored in items
            if ( lStoreResultIn === "ITEMS" ) {
                addParams( lWsOperationId, model.COMP_TYPE.WS_REF_OPER_P_O, model.COMP_TYPE.PAGE_PROC_WS_P_O );
            }

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove all parameters if that hasn't already been done (i.e if the region is removed)
            removeAllParams();

        }
    } // webServiceProcessPlugin

    function createTaskProcessPlugin( pAction, pProperty, pOldValue ) {

        const TASK_DEF_ID = model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_CREATE_TASK", 1 ).id;

        let lSelf = this,
            lTaskDefId,
            lModelCompType;

        function removeAllTaskParams(pCompTypeId) {
            _removeChildren( lSelf, pCompTypeId);
        }

        function addTaskParams( pTaskDefId , pCompTypeId ) {

            var lTaskParams,
                lValues;

            lTaskParams = model.getComponents( model.COMP_TYPE.TASK_DEF_PARAM, {
                parentId: pTaskDefId
            } );

            for ( let i = 0; i < lTaskParams.length; i++ ) {
                lValues = [{
                    id:    model.PROP.TASK_DEF_PARAM,
                    value: lTaskParams[ i ].id
                }];

               // Set the default value as static value or initialize it as static value if the parameter is required and the developer should enter something
                if ( lTaskParams[ i ].getProperty( model.PROP.PARAMETER_REQUIRED ).getValue() === "Y" ) {
                    lValues.push( {
                        id:    model.PROP.TASK_VALUE_TYPE,
                        value: "STATIC"
                    } );

                } else {
                    lValues.push( {
                        id:    model.PROP.TASK_VALUE_TYPE,
                        value: "NULL"
                    } );
                }

                new model.Component( {
                    typeId:   pCompTypeId,
                    parentId: lSelf.id,
                    values:   lValues
                } );
            }
        } // addTaskParams
        if ( this.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY) {
            lModelCompType = model.COMP_TYPE.WF_ACTIVITY_TASK_PARAM;
        }
        else {
            lModelCompType = model.COMP_TYPE.PAGE_PROCESS_TASK_PARAM;
        }
        if ( _hasChanged( this.getProperty( TASK_DEF_ID ), pAction, pProperty, pOldValue )) {

            // If the selected task definition has been changed, remove all existing parameters
            if ( pAction === model.CALLBACK_ACTION.CHANGED ) {
                removeAllTaskParams(lModelCompType);
            }

            // Initialize the process specific  parameters based on the task definition parameters
            lTaskDefId = this.getProperty( TASK_DEF_ID ).getValue();
            if ( lTaskDefId !== "" ) {
                addTaskParams( lTaskDefId, lModelCompType );
            }

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            // Remove all parameters if that hasn't already been done (i.e if the region is removed)
            removeAllTaskParams(lModelCompType);

        }
    } // createTaskProcessPlugin

    function revalidateLovQuery( pThis, pAction, pProperty ) {
        const lSnippet = pThis.getProperty( model.PROP.LOV_SQL ),
              lvalue = lSnippet?.getValue();

        // Trigger revalidation of SQL Query when item type changed
        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty?.id === model.PROP.ITEM_TYPE && lvalue ) {
            lSnippet.setValue( lvalue, true );
        }
    } // revalidateLovQuery

    function comboboxPlugin ( pAction, pProperty, pValue ) {
        const lMultiSelectionProperty = this.getProperty( model.getPluginProperty( this.typeId, ITEM_TYPE.COMBOBOX, 'multi_selection' ).id ),
              lMultiValueTypeProperty = this.getProperty( model.PROP.MULTI_VALUE_TYPE_OPTIONAL );

        if (    pAction === model.CALLBACK_ACTION.VALIDATE
             && pProperty?.id === lMultiSelectionProperty?.id
             && !lMultiValueTypeProperty?.getValue() && pValue === "Y" ) {
            // validate when multi selection is enabled that item is set to multiple valued
            return { error: msg( "ITEM.ERROR_COMBOBOX_MULTI_VALUE_AND_MULTI_SELECTION" ) };
        }

        if (    pAction === model.CALLBACK_ACTION.CHANGED
             && pProperty?.id === model.PROP.MULTI_VALUE_TYPE_OPTIONAL
             && !lMultiValueTypeProperty?.getValue() ) {
            // disable multi selection when no multi value type is set
            lMultiSelectionProperty.setValue( 'N' );
        }
    } // comboboxPlugin

    function selectListPlugin ( pAction, pProperty, pValue ) {
        const lPageActionProperty = this.getProperty( model.getPluginProperty( this.typeId, ITEM_TYPE.SELECT_LIST, 'page_action_on_selection' ).id ),
              lMultiValueTypeProperty = this.getProperty( model.PROP.MULTI_VALUE_TYPE_OPTIONAL );

        if (   pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty?.id === model.PROP.MULTI_VALUE_TYPE_OPTIONAL ) {
            const lValue = lPageActionProperty?.getValue();

            // trigger revalidation of Page Action on Selection when multi value type changed
            lPageActionProperty.setValue( lValue, true );
        } else if (    pAction === model.CALLBACK_ACTION.VALIDATE
                    && pProperty?.id === lPageActionProperty?.id
                    && lMultiValueTypeProperty?.getValue() && pValue !== "NONE" ) {
            // validate when page action is not set to none that mutiple values are not allowed
            return { error: msg( "ITEM.ERROR_SELECT_LIST_MULTI_VALUE_AND_PAGE_ACTION" ) };
        }

        // Only if the item type or the allow multi selection property has changed, we will change the height
        if (    pAction === model.CALLBACK_ACTION.CREATED
             || pProperty?.id === model.PROP.MULTI_VALUE_TYPE_OPTIONAL ) {
            let lHeight;

            if ( lMultiValueTypeProperty.getValue() ) {
                lHeight = 5;
            } else {
                lHeight = 1;
            }
            _setPropertyValue( this, model.PROP.ELEMENT_HEIGHT, lHeight );
        }
    } // selectListPlugin

    function popupLovPlugin ( pAction, pProperty, pValue ) {
        const lAdditionalOutputProperty = this.getProperty( model.getPluginProperty( this.typeId, ITEM_TYPE.POPUP_LOV, 'additional_outputs' ).id ),
              lMultiValueTypeProperty = this.getProperty( model.PROP.MULTI_VALUE_TYPE_OPTIONAL );

        if (   pAction === model.CALLBACK_ACTION.CHANGED
            && pProperty?.id === model.PROP.MULTI_VALUE_TYPE_OPTIONAL ) {
            const lValue = lAdditionalOutputProperty?.getValue();

            // trigger revalidation of Additional Outputs when multi value type changed
            lAdditionalOutputProperty.setValue( lValue, true );
        } else if (    pAction === model.CALLBACK_ACTION.VALIDATE
                    && pProperty?.id === lAdditionalOutputProperty?.id
                    && lMultiValueTypeProperty?.getValue() && pValue ) {
            // validate additional output is empty when item is set to multiple valued
            return { error: msg( "ITEM.ERROR_POPUP_LOV_MULTI_VALUE_AND_ADDITIONAL_OUTPUTS" ) };
        }
    } // popupLovPlugin

    function workflowProcessPlugin( action, property/* , oldValue */) {
        const self = this;
        const typeProp = self.getProperty( model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.WORKFLOW, 1 ).id );
        const workflowProp = self.getProperty( model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.WORKFLOW, 2 ).id );

        if ( action === model.CALLBACK_ACTION.REMOVED || _hasChangedNotEqualsTo( typeProp, action, property, "START" ) ) {
            _removeChildren( self, model.COMP_TYPE.PAGE_PROCESS_WF_PARAM );
        } else if ( _hasChanged( workflowProp, action, property ) ) {
            let params = self.getChilds( model.COMP_TYPE.PAGE_PROCESS_WF_PARAM );
            let workflowParams = model.getComponents( model.COMP_TYPE.WORKFLOW_PARAM, {
                parentId: workflowProp.getValue(),
                properties: [ {
                    id: model.PROP.API_DIRECTION,
                    value: new RegExp( "^(IN|IN_OUT)$" ),
                } ]
            } );

            if ( params.length > 0 ) {
                removeUnusedWorkflowParameters( workflowParams, params );
            }

            workflowParams.forEach( ( param ) => {
                addWorkflowParameterToComponent( param, self );
            } );
        }
    } // workflowProcessPlugin

    function removeUnusedWorkflowParameters( parameters, parameterComponents ) {

        for( let i = 0; i < parameterComponents.length; i++ ) {
            let currParams = parameters.filter( param => param.id === parameterComponents[ i ].getPropertyValue( model.PROP.WORKFLOW_PARAM ) );
            if ( currParams.length === 0 ) {
                parameterComponents[ i ].remove();
            }
        }
    } // removeUnusedParameters

    function invokeWorkflowProcessPlugin( action, property, oldValue ) {
        const self = this;
        const workflowProp          = self.getProperty( model.getPluginProperty( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_WF, 1 ).id );
        const waitForCompletionProp = self.getProperty( model.getPluginProperty( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_WF, 5 ).id );

        if ( action === model.CALLBACK_ACTION.REMOVED ) {
            _removeChildren( self, model.COMP_TYPE.WF_ACTIVITY_WF_PARAM );
        // Validate in case the "Wait for Completion" property is enabled that it's not allowed to
        // start the owner workflow or any of its ancestors
        } else if ( action === model.CALLBACK_ACTION.VALIDATE && property.id === workflowProp?.id ) {
            let ownerWorkflow = self.getParent( model.COMP_TYPE.WORKFLOW );
            if ( waitForCompletionProp?.getValue() === "Y" && ownerWorkflow?.id ) {
                let ancestors = pd.getConnectedWorkflows( ownerWorkflow.id );
                if ( ownerWorkflow.id === oldValue || ancestors.some( parent => parent.workflowId === oldValue )) {
                    return { error: msg( "WF.ERROR_SELF_REFERENCE" ) };
                }
            }
        } else {
            if ( _hasChanged( workflowProp, action, property, oldValue ) || _hasChanged( waitForCompletionProp, action, property, oldValue ) ) {
                let activityParams = self.getChilds( model.COMP_TYPE.WF_ACTIVITY_WF_PARAM );
                let addOutParams = self.getPropertyValue( waitForCompletionProp.id ) === "Y";
                let workflowParams = model.getComponents( model.COMP_TYPE.WORKFLOW_PARAM, {
                    parentId: workflowProp.getValue(),
                    properties: [{
                        id:    model.PROP.API_DIRECTION,
                        value: new RegExp( "^(IN|IN_OUT" + ( addOutParams ? "|OUT" : "" ) + ")$" )
                    } ]
                } );

                if ( activityParams.length > 0 ) {
                    removeUnusedWorkflowParameters( workflowParams, activityParams );
                }

                activityParams = self.getChilds( model.COMP_TYPE.WF_ACTIVITY_WF_PARAM );

                workflowParams.forEach( param => {
                    let actParam = activityParams.filter( p => p.getPropertyValue( model.PROP.WORKFLOW_PARAM ) === param.id )[ 0 ];
                    if ( !actParam ) {
                        addWorkflowParameterToComponent( param, self );
                    }
                } );
            }
        }


    } // invokeWorkflowProcessPlugin

    function plsqlProcessPlugin( pAction, pProperty ) {

        var lSnippet = this.getProperty( model.SOURCE_SNIPPET_PROPS );

        // Trigger a re-validation of the code snippet property if the location or the remote database has been changed
        if ( (  _hasChangedEqualsTo( this.getProperty( model.PROP.PLSQL_PROCESS_LOCATION ), pAction, pProperty, "LOCAL" )
             || _hasChangedNotEqualsTo( this.getProperty( model.PROP.SOURCE_REMOTE_DATABASE ), pAction, pProperty, "" )
            )
           && lSnippet.getValue() !== "" )
        {
            lSnippet.setValue( lSnippet.getValue(), true );
        }

    } // plsqlProcessPlugin

    function sendEmailProcessPlugin( pAction, pProperty ) {
        var EMAIL_PLACEHOLDER_PROP_ID = model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_SEND_EMAIL", 12 ).id,
            EMAIL_TEMPLATE_PROP       = this.getProperty( model.getPluginProperty( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_SEND_EMAIL", 11 ).id ),
            self = this,
            lEmailTemplateComponent, lEmailTemplatePlaceholders, lOldPlaceholders,
            lNewJson = {}, lOldJson;

        // if the email template has changed, and is not null (empty), when fetch the placeholder JSON from the
        // server.
        if ( _hasChangedNotEqualsTo( EMAIL_TEMPLATE_PROP, pAction, pProperty, "" ) ) {

            // look up the email template in Shared Components
            lEmailTemplateComponent = model.getComponents( model.COMP_TYPE.EMAIL_TEMPLATE, { id: EMAIL_TEMPLATE_PROP.getValue() } );

            // we should have exactly one email template, since we looked it up by ID
            if ( lEmailTemplateComponent && lEmailTemplateComponent.length === 1 ) {

                // get the email template placeholders
                lEmailTemplatePlaceholders = model.getEmailPlaceholders( EMAIL_TEMPLATE_PROP.getValue() );

                lEmailTemplatePlaceholders.forEach( function( pPlaceHolder ) {
                    if ( pPlaceHolder !== "" ) {
                        lNewJson[ pPlaceHolder ] = "";
                    }
                } );

                // let's now look into the old placeholders JSON and see if we have common placeholders. For those
                // we'll retain the assigned values.

                lOldPlaceholders = self.getProperty( EMAIL_PLACEHOLDER_PROP_ID ).getValue();
                if ( lOldPlaceholders !== "" ) {
                    try {
                        lOldJson = JSON.parse( lOldPlaceholders );
                        Object.keys( lOldJson ).forEach(
                            function( key ) {
                                if ( hasOwnProperty( lNewJson, key ) ) {
                                    lNewJson[ key ] = lOldJson[ key ];
                                }
                            } );
                    } catch ( e ) {
                        // fail safely if the old property value was invalid JSON.
                    }
                }
            }
            _setPropertyValue( self, EMAIL_PLACEHOLDER_PROP_ID, JSON.stringify( lNewJson, null, 4 ) ) ;
        }
    } // sendEmailProcessPlugin

    // common logic for download & print report processes
    function downloadPrintReportProcessPlugin( pType, pAction, pProperty, pValue ) {
        const errorMsg = pType === PROCESS_TYPE.DOWNLOAD ? msg( "PROCESS_DOWNLOAD.PROCESS_NOT_SUPPORTED" )
                           : pType === PROCESS_TYPE.PRINT_REPORT ? msg( "PROCESS_PRINT_REPORT.PROCESS_NOT_SUPPORTED" ) : "",
              allowedRenderingPoints = [ "BEFORE_HEADER" ],
              allowedProcessingPoints = [ "ON_SUBMIT_BEFORE_COMPUTATION", "AFTER_SUBMIT_BEFORE_VALIDATION", "AFTER_SUBMIT" ],
              reloadOnSubmitProp = model.getComponents( model.COMP_TYPE.PAGE, { id: model.getCurrentPageId() })[0].getProperty( model.PROP.RELOAD_ON_SUBMIT );

        // validate allowed process points
        if ( pAction === model.CALLBACK_ACTION.VALIDATE
             && pProperty.id === model.PROP.PROCESS_POINT )
        {
            // Show a error message when the process is not supported for chosen process point
            if ( !( allowedRenderingPoints.includes( pValue ) ||
                    ( allowedProcessingPoints.includes( pValue ) && reloadOnSubmitProp.getValue() === "A" ) ) ) {
                return { error: errorMsg };
            }
        }
    } // downloadPrintReportProcessPlugin

    function downloadProcessPlugin( pAction, pProperty, pValue ) {
        return downloadPrintReportProcessPlugin( PROCESS_TYPE.DOWNLOAD, pAction, pProperty, pValue );
    } // downloadProcessPlugin

    function printReportProcessPlugin( pAction, pProperty, pValue ) {
        return downloadPrintReportProcessPlugin( PROCESS_TYPE.PRINT_REPORT, pAction, pProperty, pValue );
    } // printReportProcessPlugin

    function nativeItemPlugins( pAction ) {
        const lItemType = this.getProperty( model.PROP.ITEM_TYPE ).getValue();

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // For some item types we automatically set the height to 5 because they are designed to be multi line
            if ( [ ITEM_TYPE.RICH_TEXT_EDITOR, ITEM_TYPE.TEXTAREA, ITEM_TYPE.SHUTTLE ].includes( lItemType ) ) {

                _setPropertyValue( this, model.PROP.ELEMENT_HEIGHT, "5" );

            // Markdown Editor shouldn't use the generic default values for width/height
            } else if ( lItemType === ITEM_TYPE.MARKDOWN_EDITOR ) {

                _setPropertyValue( this, model.PROP.ELEMENT_WIDTH, "" );
                _setPropertyValue( this, model.PROP.ELEMENT_HEIGHT, "" );

            } else if ( ( lItemType === ITEM_TYPE.FILE || lItemType === ITEM_TYPE.IMAGE_UPLOAD ) && ( !this.getProperty( model.PROP.DATA_SOURCE_COLUMN ) && getLegacyDmlProcesses().length === 0 ) ) {

                // Don't use "BLOB column specified..." storage type if page doesn't have a Fetch/DML process
                _setPropertyValue( this, model.getPluginProperty( model.COMP_TYPE.PAGE_ITEM, lItemType, 'storage_type' ).id, "APEX_APPLICATION_TEMP_FILES" );
            }

        }

    } // nativeItemPlugins


    function _itemNameChanged( pComponent, pProperty, pOldValue ) {

        var PAGE_PREFIX = /^(P\d+_)/;

        var lOldDbColumnName,
            lNewDbColumnName,
            lItemLabel,
            lDbSourceColumn;

        lOldDbColumnName = pOldValue.replace( PAGE_PREFIX, "" );
        lNewDbColumnName = pProperty.getValue().replace( PAGE_PREFIX, "" );

        // Keep the "Label" property in sync if the label is empty or equal to the old facet name
        lItemLabel = pComponent.getProperty( model.PROP.ITEM_LABEL );
        if (  lItemLabel
            && ( initCapColumnName( lOldDbColumnName ) === lItemLabel.getValue() || lItemLabel.getValue() === "" ))
        {
            lItemLabel.setValue( initCapColumnName( lNewDbColumnName ));
        }

        // Keep the db column name in sync if the DB Column is empty or equal to the old facet name
        lDbSourceColumn = pComponent.getProperty( model.PROP.SOURCE_DB_COLUMN );
        if (  lDbSourceColumn
            && ( pOldValue.replace( PAGE_PREFIX, "" ) === lDbSourceColumn.getValue() || lDbSourceColumn.getValue() === "" ))
        {
            lDbSourceColumn.setValue( pProperty.getValue().replace( PAGE_PREFIX, "" ));
        }
    } // _itemNameChanged


    function page( pAction, pProperty ) {

        const enableMetaTags = this.getProperty( model.PROP.ENABLE_META_TAGS );

        // Check if the enable meta tags has been changed
        if ( _hasChanged( enableMetaTags, pAction, pProperty ) ) {

            if ( enableMetaTags.getValue() === "Y" ) {

                new model.Component( {
                    typeId:   model.COMP_TYPE.META_TAG,
                    parentId: this.id,
                    values:   [{
                        id:    model.PROP.META_TAG_NAME,
                        value: "description"
                    }]
                } );

            } else { // page requires authentication

                // Remove all page meta tags
                _removeChildren( this, model.COMP_TYPE.META_TAG );

            }

        }

        const pageAuthentication = this.getProperty( model.PROP.PAGE_AUTHENTICATION );

        // Check if the page authentication has been changed
        if ( _hasChanged( pageAuthentication, pAction, pProperty ) ) {

            // if page is not public
            if ( pageAuthentication.getValue() === "N" ) {

                // Remove all page meta tags
                _removeChildren( this, model.COMP_TYPE.META_TAG );

            }

        }

        const reloadOnSubmit = this.getProperty( model.PROP.RELOAD_ON_SUBMIT );

        if ( _hasChanged( reloadOnSubmit, pAction, pProperty ) ) {

            // find all download & print report processes with validation errors and
            // re-set the process point which leads to re-validation of the property
            model.getComponents( model.COMP_TYPE.PAGE_PROCESS, {
                properties: [ {
                    id: model.PROP.PAGE_PROCESS_TYPE,
                    value: new RegExp( "(NATIVE_DOWNLOAD|NATIVE_PRINT_REPORT)" )
                } ],
                // only get components with errors if it's set to "Always", else search for every download component
                hasErrors: reloadOnSubmit.getValue() === "A" ? true : undefined
            } ).forEach( function( component ) {
                _revalidateProperty( component, model.PROP.PROCESS_POINT );
            } );
        }

    } // page

    function pageItem( pAction, pProperty, pValue ) {
        let lNewColumnName,
            lNewDbColumnName,
            lSourceUsed,
            lDmlProcesses,
            lColumns,
            lValidationResult;

        lValidationResult = validateMultiValueSeparator( pProperty, pAction, pValue );

        if ( lValidationResult ) {
            return lValidationResult;
        }
        // Trigger revalidation of SQL Query when item type changed for LOV based items
        revalidateLovQuery( this, pAction, pProperty );

        if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            if ( pProperty.id === model.PROP.ITEM_NAME ) {
                // Has the item name changed?
                _itemNameChanged( this, pProperty, pValue );

            } else if ( pProperty.id === model.PROP.SOURCE_TYPE ) {
                // Always default "Used" to "Always, replacing any existing value in session state" if page item is based on a DB column
                lSourceUsed = this.getProperty( model.PROP.SOURCE_USED );
                if ( lSourceUsed && pProperty.getValue() === "DB_COLUMN" ) {
                    lSourceUsed.setValue( "NO" );
                } else {
                    lSourceUsed.setValue( "YES" );
                }

            } else if ( pProperty.id === model.PROP.SOURCE_DB_COLUMN ) {
                // Has the "DB column" property changed?

                lNewDbColumnName = pProperty.getValue();

                // Try to find the column definition based on the Fetch or DML process specified for the current page
                lDmlProcesses = getLegacyDmlProcesses();

                if ( lDmlProcesses.length > 0 ) {
                    if ( lDmlProcesses[ 0 ].getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_FORM_FETCH" ) {
                        lColumns = lDmlProcesses[ 0 ].getProperty( model.PROP.FORM_FETCH_TABLE_NAME ).getColumns();
                    } else {
                        lColumns = lDmlProcesses[ 0 ].getProperty( model.PROP.FORM_PROCESS_TABLE_NAME ).getColumns();
                    }
                    // Try to lookup the entered DB column name and set the "Value Required" and "Maximum Characters" property based
                    // on the column specification.
                    for ( let i = 0; i < lColumns.length; i++ ) {
                        if ( lColumns[ i ].name === lNewDbColumnName ) {

                            // Set "Value Required" property if the page item has one
                            _setPropertyValue( this, model.PROP.VALUE_REQUIRED, lColumns[ i ].isRequired ? "Y" : "N" );

                            // Set "Maximum Characters" property if the page item has one
                            _setPropertyValue( this, model.PROP.ELEMENT_MAX_CHARACTERS, hasOwnProperty( lColumns[ i ], "maxLen" ) ? lColumns[ i ].maxLen + "" : "" );
                        }
                    }
                }

            } else if ( pProperty.id === model.PROP.DATA_SOURCE_COLUMN ) {
                // Has the "Data Source column" property changed?

                lNewColumnName = pProperty.getValue();
                lColumns = pProperty._getAvailableColumns( true );

                // Try to lookup the entered DB column name and set the "Value Required" and "Maximum Characters" property based
                // on the column specification.
                for ( let i = 0; i < lColumns.length; i++ ) {
                    if ( lColumns[i].name === lNewColumnName ) {

                        // Set "Value Required" property if the page item has one
                        _setPropertyValue( this, model.PROP.DATA_TYPE, lColumns[i].type );

                        // Set "Value Required" property if the page item has one
                        _setPropertyValue( this, model.PROP.VALUE_REQUIRED, lColumns[i].isRequired ? "Y" : "N" );

                        // Set "Maximum Characters" property if the page item has one
                        _setPropertyValue( this, model.PROP.ELEMENT_MAX_CHARACTERS, hasOwnProperty( lColumns[i], "maxLen" ) ? lColumns[i].maxLen + "" : "" );
                    }
                }
            }
        }

        // Enable session state protection for Primary key items
        if ( _hasChangedEqualsTo( this.getProperty( model.PROP.IS_PRIMARY_KEY ), pAction, pProperty, "Y" ) ) {
            _setPropertyValue( this, model.PROP.SESSION_STATE_PROTECTION, "S" );
        }

        // Slot handling when this item region changes
        _setSlot( {
            componentTypeId: model.COMP_TYPE.PAGE_ITEM,
            action: pAction,
            property: pProperty,
            oldRegionId: pValue,
            component: this
        } );
    } // pageItem

    function facet( pAction, pProperty, pValue ) {
        const FS_PLUGIN_SHOW_CHART_PROP_ID = model.getPluginProperty( model.COMP_TYPE.REGION, REGION_TYPE.FACETED_SEARCH, 'show_charts' ).id;
        let lFsRegionPluginAttributes,
            lFsRegionShowChart,
            lValidationResult;

        if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            if ( pProperty.id === model.PROP.ITEM_NAME ) {
                // Has the item name changed?
                _itemNameChanged( this, pProperty, pValue );

            } else if ( pProperty.id === model.PROP.FC_SHOW_CHART && pValue === "N" && pProperty.getValue() === "Y" ) {

                // If charting of the Facets gets enabled, automatically set the region level attribute "Show Chart" to Popup
                // if it hasn't been turned on yet.
                lFsRegionPluginAttributes = this.getParent().getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ];
                if ( lFsRegionPluginAttributes ) {
                    lFsRegionShowChart = lFsRegionPluginAttributes.getProperty( FS_PLUGIN_SHOW_CHART_PROP_ID );
                    if ( lFsRegionShowChart && lFsRegionShowChart.getValue() === "N" ) {
                        lFsRegionShowChart.setValue( "Y" );
                    }
                }
            }
        }
        lValidationResult = validateMultiValueSeparator( pProperty, pAction, pValue );

        if ( lValidationResult ) {
            return lValidationResult;
        }
    } // facet

    function facetGroup( pAction ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Immediately create a single checkbox to start with
            new model.Component( {
                typeId:   model.COMP_TYPE.FACET_GROUP_ITEM,
                parentId: this.id,
                values:   [{
                    id:    model.PROP.HIDDEN_PARENT_REGION,
                    value: this.parentId
                }]
            } );

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            _removeChildren( this, model.COMP_TYPE.FACET_GROUP_ITEM );

        }
    } // facetGroup


    function sFilter( pAction, pProperty, pOldValue ) {

        if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            if ( pProperty.id === model.PROP.ITEM_NAME ) {
                // Has the item name changed?
                _itemNameChanged( this, pProperty, pOldValue );
            }
        }
    } // sFilter


    function sFilterGroup( pAction /*, pProperty */ ) {

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // Immediately create a single checkbox to start with
            new model.Component({
                typeId:   model.COMP_TYPE.SFILTER_GROUP_ITEM,
                parentId: this.id,
                values:   [{
                    id:    model.PROP.HIDDEN_PARENT_REGION,
                    value: this.parentId
                }]
            });

        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {

            _removeChildren( this, model.COMP_TYPE.SFILTER_GROUP_ITEM );

        }
    } // sFilterGroup


    function button( pAction, pProperty, pOldValue ) {

        var lLabel       = this.getProperty( model.PROP.BUTTON_LABEL ),
            lNameInitCap = initCapColumnName( this.getProperty( model.PROP.BUTTON_NAME ).getValue() );

        function reValidateDynamicActionButtons( pButtonId, pComponentTypeId, pPropertyId ) {

            var lComponents,
                lProperty;

            lComponents = model.getComponents( pComponentTypeId, { properties: [{ id: pPropertyId, value: pButtonId }]} );
            for ( let i = 0; i < lComponents.length; i++ ) {
                lProperty = lComponents[ i ].getProperty( pPropertyId );
                lProperty.setValue( lProperty.getValue(), true );
            }
        } // reValidateDynamicActionButtons

        // Slot handling when this button region changes
        _setSlot( {
            componentTypeId: model.COMP_TYPE.BUTTON,
            action: pAction,
            property: pProperty,
            oldRegionId: pOldValue,
            component: this
        } );

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            lLabel.setValue( lNameInitCap );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            if ( pProperty.id === model.PROP.BUTTON_NAME ) {
                // Keep the "Label" property in sync if the label is empty or equal to the old button name
                lLabel = this.getProperty( model.PROP.BUTTON_LABEL );
                if ( initCapColumnName( pOldValue ) === lLabel.getValue() || lLabel.getValue() === "" ) {
                    lLabel.setValue( lNameInitCap );
                }

            } else if ( pProperty.id === model.PROP.BUTTON_TEMPLATE ) {

                // Re-validate all dynamic actions referencing this button to make sure that the button template does contain #BUTTON_ID#
                reValidateDynamicActionButtons( this.id, model.COMP_TYPE.DA_EVENT,  model.PROP.WHEN_BUTTON );
                reValidateDynamicActionButtons( this.id, model.COMP_TYPE.DA_ACTION, model.PROP.AFFECTED_BUTTON );
            }
        }
    } // button


    function sourceLocationHandling( pAction, pComponent, pProperty, pOldValue, pCompWsParamComponentTypeId ) {

        function addSqlQuery( pOptions ) {
            let lProperty = pComponent.getProperty( pOptions.id ),
                lValue = "",
                lQuote = ( lDatabaseType === "MYSQL" ? '\u0060' : '"' );

            if ( pOptions.value ) {
                lValue = pOptions.value;
            } else if ( lProperty ) {
                lValue = lProperty.getValue() || "";
            }

            if ( lValue !== "" ) {
                if ( pOptions.prefix ) {
                    lSqlQuery += pOptions.prefix;
                }
                // Does the identifier contain special characters?
                if ( lDatabaseType === "MYSQL" ) {
                    if ( pOptions.identifier && !/^[A-Za-z]+[A-Za-z0-9_$]*$/.test( lValue ) ) {
                        lSqlQuery += lQuote + lValue.replace( /\u0060/, '\u0060\u0060' ) + lQuote;
                    } else {
                        lSqlQuery += lValue;
                    }

                } else {
                    if ( pOptions.identifier && !/^[A-Z]+[A-Z0-9_$]*$/.test( lValue ) ) {
                        lSqlQuery += lQuote + lValue + lQuote;
                    } else {
                        lSqlQuery += lValue;
                    }
                }
                if ( pOptions.postfix ) {
                    lSqlQuery += pOptions.postfix;
                }
            }
        } // addSqlQuery

        function propHasValue( pPropId ) {
            let lProperty = pComponent.getProperty( pPropId );
            return lProperty && lProperty.getValue().trim() !== "";
        }

        let lProperty,
            lArrayColumnProp,
            lArrayColumn,
            lSourceTypeProp,
            lRegionTypeProp,
            lUseLocalTableProp,
            lWebSrcModuleId,
            lArrayColumnId,
            lRegionPluginAttrs,
            lQueryType,
            lGraphColumnsClause,
            lSqlColumns,
            lDatabaseType = "ORACLE",
            lSqlQuery     = "",
            lQueryTypeProp,
            lQueryOwnerProp,
            lQueryTypeTableProp,
            lSqlQueryProp,
            lSourceLocProp;

        if ( pComponent.typeId === model.COMP_TYPE.WORKFLOW_VERSION ) {
            lQueryTypeProp = model.PROP.WF_SOURCE_QUERY_TYPE;
            lQueryOwnerProp = model.PROP.WF_SOURCE_QUERY_OWNER;
            lQueryTypeTableProp = model.PROP.WF_SOURCE_QUERY_TABLE;
            lSqlQueryProp = model.PROP.WF_SOURCE_SQL_QUERY;
        } else {
            lQueryTypeProp = model.PROP.SOURCE_QUERY_TYPE;
            lQueryOwnerProp = model.PROP.SOURCE_QUERY_OWNER;
            lQueryTypeTableProp = model.PROP.SOURCE_QUERY_TABLE;
            lSqlQueryProp = model.PROP.SOURCE_SQL_QUERY;
        }

        // Remove columns if the source location property is cleared
        if ( pComponent.typeId === model.COMP_TYPE.REGION && _hasChangedEqualsTo( pComponent.getProperty( model.PROP.SOURCE_LOCATION ), pAction, pProperty, "" ) ) {
            [ model.COMP_TYPE.REGION_COLUMN, model.COMP_TYPE.REGION_TMPL_COLUMN ].forEach( typeId => _removeChildren( pComponent, typeId ) );
        }

        // When switching from Table or SQL Query based query type, we do want to default the SQL query or Function based on SQL Query
        // property with the old table/sql query
        if ( pProperty && pProperty.id === lQueryTypeProp ) {
            lQueryType = pComponent.getProperty( lQueryTypeProp ).getValue();
            if ( pAction === model.CALLBACK_ACTION.VALIDATE ) {

                lProperty = pComponent.getProperty( model.PROP.SOURCE_LOCATION );
                if ( lProperty && lProperty.getValue() === "REMOTE" ) {

                    // The Graph / PQL query type is currently not supported for remote databases
                    if ( pOldValue === "GRAPH" ) { /* pOldValue it's actually the new value */
                        return { error: format( "GRAPH.REMOTE_DB_NOT_SUPPORTED" ) };
                    } else {
                        lProperty = pComponent.getProperty( model.PROP.SOURCE_REMOTE_DATABASE_TYPE );
                        lDatabaseType = ( lProperty ? lProperty.getValue() : "ORACLE" );
                    }
                }

                if ( lQueryType === "TABLE" && [ "SQL", "FUNC_BODY_RETURNING_SQL" ].includes( pOldValue ) /* it's actually the new value */ ) {

                    lSqlColumns = pComponent.getProperty( lQueryTypeTableProp ).getColumns();
                    if ( lSqlColumns.length > 0 ) {

                        lProperty = pComponent.getProperty( model.PROP.SOURCE_INCLUDE_ROWID_COLUMN );
                        if ( lProperty && lProperty.getValue() === "Y" && lDatabaseType === "ORACLE" ) {
                            addSqlQuery( {
                                value:      "ROWID",
                                postfix:    ",\n",
                                identifier: true
                            } );
                        }
                        for ( let i = 0; i < lSqlColumns.length; i++ ) {
                            addSqlQuery( {
                                value:      lSqlColumns[i].name,
                                prefix:     ( lSqlQuery === "" ) ? "" : "       ",
                                postfix:    ( i < lSqlColumns.length - 1 ) ? ",\n" : "",
                                identifier: true
                            } );
                        }
                        lSqlQuery = "select " + lSqlQuery + "\n  from ";
                        addSqlQuery( {id: lQueryOwnerProp, postfix: ".", identifier: true} );
                        addSqlQuery( {id: lQueryTypeTableProp, identifier: true} );
                        addSqlQuery( {id: model.PROP.SOURCE_QUERY_WHERE, prefix: "\n where " } );
                    }
                    gSavedSourceSqlQuery = lSqlQuery + "";

                } else if ( lQueryType === "GRAPH" && [ "SQL", "FUNC_BODY_RETURNING_SQL" ].includes( pOldValue ) /* it's actually the new value */ ) {
                    //
                    // only generate a SQL query, if we have a Graph Name, Match Clause and Columns Clause
                    //
                    if (    propHasValue( model.PROP.SOURCE_GRAPH_NAME )
                         && propHasValue( model.PROP.SOURCE_GRAPH_MATCH_CLAUSE )
                         && propHasValue( model.PROP.SOURCE_GRAPH_COLUMNS_CLAUSE ) )
                    {
                        //
                        // Change a declarative Graph query to SQL or Function Returning SQL
                        //
                        lSqlQuery = "select *\n  from graph_table (\n           ";
                        addSqlQuery( {id: lQueryOwnerProp, postfix: ".", identifier: true} );
                        addSqlQuery( {id: model.PROP.SOURCE_GRAPH_NAME,  identifier: true} );
                        addSqlQuery( {id: model.PROP.SOURCE_GRAPH_MATCH_CLAUSE,    prefix: "\n           match " } );
                        addSqlQuery( {id: model.PROP.SOURCE_GRAPH_WHERE_CLAUSE,    prefix: "\n           where " } );

                        lGraphColumnsClause = pComponent.getProperty( model.PROP.SOURCE_GRAPH_COLUMNS_CLAUSE ).getValue();
                        if ( lGraphColumnsClause.trim().substr( 0, 1 ) === "(" ) {
                            addSqlQuery( {value: lGraphColumnsClause,  prefix: "\n           columns" } );
                        } else {
                            addSqlQuery( {value: lGraphColumnsClause,  prefix: "\n           columns( ", postfix: " )" } );
                        }
                        lSqlQuery = lSqlQuery + "\n       )";
                        addSqlQuery( {id: model.PROP.SOURCE_GRAPH_STATIC_ORDER_BY, prefix: "\n order by "} );

                        gSavedSourceSqlQuery = lSqlQuery + "";
                    }

                } else if ( lQueryType === "SQL" && pOldValue === "FUNC_BODY_RETURNING_SQL" /* it's actually the new value */ ) {
                    gSavedSourceSqlQuery = pComponent.getProperty( lSqlQueryProp ).getValue() + "";

                } else {
                    gSavedSourceSqlQuery = "";
                }
            } else if ( pAction === model.CALLBACK_ACTION.CHANGED && [ "TABLE", "GRAPH", "SQL" ].includes( pOldValue ) && gSavedSourceSqlQuery !== "" ) {
                if ( lQueryType === "SQL" ) {
                    _setPropertyValue( pComponent, lSqlQueryProp, gSavedSourceSqlQuery );
                } else if ( lQueryType === "FUNC_BODY_RETURNING_SQL" ) {
                    _setPropertyValue( pComponent, model.PROP.SOURCE_QUERY_PLSQL_FUNC_BODY_SQL, "return q'~\n" + gSavedSourceSqlQuery + "\n~';" );
                }
                gSavedSourceSqlQuery = "";
            }
        // REPORT Template Components must have a source; show an error message if the SOURCE_LOCATION is set to null
        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE && pProperty?.id === model.PROP.SOURCE_LOCATION && pComponent.getPropertyValue( model.PROP.REGION_TYPE ).startsWith( "TMPL_" ) ) {
            const templateComponentType = model.getTemplateComponentType( pComponent );
            if ( pOldValue === "" && templateComponentType === "REPORT" ) {
                return( { error: format( "NO_SOURCE_ERROR" ) } );
            }
        }

        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.SOURCE_INCLUDE_ROWID_COLUMN ) {
            // revalidate the TABLE property to refresh the columns
            lProperty = pComponent.getProperty( lQueryTypeTableProp );
            lProperty.setValue( lProperty.getValue(), true );
        }

        // set the (hidden) "database type" property, so that the "translation" of a table name to a SQL query
        // is done correctly for the target database.
        if ( model.getSourceLocationProperty( pComponent ) && pProperty && ( pProperty.id === model.PROP.SOURCE_REMOTE_DATABASE || pProperty.id === lQueryTypeTableProp ) )
        {
            _setPropertyValue( pComponent,
                               model.PROP.SOURCE_REMOTE_DATABASE_TYPE,
                               ( model.getSourceLocationProperty( pComponent ).databaseType() ) );
        }

        // Recreate Web Source Parameter if the selected Web Source Module has been set or changed
        lSourceTypeProp    = pComponent.getProperty( model.PROP.SOURCE_LOCATION );
        lRegionTypeProp    = pComponent.getProperty( model.PROP.REGION_TYPE );
        if ( lSourceTypeProp?.getValue() === model.LOCATION.WEB_SOURCE ) {
            lProperty          = pComponent.getProperty( model.PROP.SOURCE_WEB_SRC_QUERY );
        } else if ( lSourceTypeProp?.getValue() === model.LOCATION.DUALITY_VIEW ) {
            lProperty          = pComponent.getProperty( model.PROP.SOURCE_DUALITY_VIEW );
        } else if ( lSourceTypeProp?.getValue() === model.LOCATION.JSON_COLLECTION ) {
            lProperty          = pComponent.getProperty( model.PROP.SOURCE_JSON_COLLECTION );
        }

        // for REST Sources, we need to determine whether we have array columns and whether local synchronization
        // tables exist.
        if (    model.getSourceLocationProperty( pComponent )
             && pProperty
             && [ model.PROP.SOURCE_WEB_SRC_QUERY, model.PROP.SOURCE_DUALITY_VIEW, model.PROP.SOURCE_JSON_COLLECTION ].includes( pProperty.id ) )
        {

            // only process the WEB_SRC_HAS_ARRAY_COLUMNS property when the
            // chosen REST Data Source actually has changed.
            if ( _hasChanged( lProperty,          pAction, pProperty, pOldValue ) ||
                 _hasChanged( lSourceTypeProp,    pAction, pProperty, pOldValue ) )
            {
                // first check whether we have array columns. If we don't have, disable the property, so that
                // no select list for array columns shows up.

                if ( pProperty.id === model.PROP.SOURCE_WEB_SRC_QUERY ) {

                    if ( model.getSourceLocationProperty( pComponent ).wsmHasArrayColumns() ) {
                        _setPropertyValue( pComponent,
                                           model.PROP.WEB_SRC_HAS_ARRAY_COLUMNS,
                                           'Y' );
                    } else {
                        _setPropertyValue( pComponent,
                                           model.PROP.WEB_SRC_HAS_ARRAY_COLUMNS,
                                           'N' );
                    }
                } else {
                    if ( model.getSourceLocationProperty( pComponent ).wsmHasArrayColumns() ) {
                        _setPropertyValue( pComponent,
                                           model.PROP.DOC_SRC_HAS_ARRAY_COLUMNS,
                                           'Y' );
                    } else {
                        _setPropertyValue( pComponent,
                                           model.PROP.DOC_SRC_HAS_ARRAY_COLUMNS,
                                           'N' );
                    }
                }
            }

            // once we determined whether array columns exist or not, let's find out whether a synchronization
            // table exists for the array column (or for the REST source if no array column exists or no array
            // column is selected ).
            lArrayColumnProp   = pComponent.getProperty( model.PROP.SOURCE_WEB_SRC_ARRAY_COL );
            lArrayColumn       = ( lArrayColumnProp ? lArrayColumnProp.getValue() : "" );

            if ( model.getSourceLocationProperty( pComponent ).wsmHasLocalTableFor( lArrayColumn ) ) {
                _setPropertyValue( pComponent,
                                   model.PROP.WEB_SRC_HAS_LOCAL_TABLE,
                                   'Y' );
            } else {

                _setPropertyValue( pComponent,
                                   model.PROP.WEB_SRC_HAS_LOCAL_TABLE,
                                   'N' );
            }
        }

        lUseLocalTableProp = pComponent.getProperty( model.PROP.WEB_SRC_USE_LOCAL_TABLE );

        if ( _hasChanged( lProperty,          pAction, pProperty, pOldValue ) ||
             _hasChanged( lSourceTypeProp,    pAction, pProperty, pOldValue ) ||
             _hasChanged( lArrayColumnProp,   pAction, pProperty, pOldValue ) ||
             _hasChanged( lUseLocalTableProp, pAction, pProperty, pOldValue ) ) {

            _removeChildren( pComponent, pCompWsParamComponentTypeId );

            // do we have a REST Source set for the region ...?
            if ( lProperty ) {

                lWebSrcModuleId = lProperty.getValue();
                lArrayColumnId  = lArrayColumn;
                if ( lWebSrcModuleId !== "" ) {

                    if ( !pComponent.getProperty( model.PROP.WEB_SRC_USE_LOCAL_TABLE ) ||
                         pComponent.getProperty( model.PROP.WEB_SRC_USE_LOCAL_TABLE ).getValue() === 'N' )
                    {

                        // Add the REST source module level parameters first
                        addRestParametersToComponent( pComponent, pComponent.id, lWebSrcModuleId, model.COMP_TYPE.WEB_SRC_MOD_PARAM, pCompWsParamComponentTypeId );

                        // And now add the parameters of the "Fetch Rows" web source operation, as all regions
                        // use the Fetch Rows operation.
                        addDBOperationParametersToComponent( pComponent, pComponent.id, lWebSrcModuleId, "FETCH_COLLECTION", lArrayColumnId, pCompWsParamComponentTypeId );

                        //
                        // now get the Region Attributes Component (child of the region component). For editable regions,
                        // handleWebSrcParameters() adds parameters for those REST Source operations which have a
                        // database operation assigned.
                        if ( lRegionTypeProp ) {
                            if ( lRegionTypeProp.getValue() === "NATIVE_IG" ) {
                                lRegionPluginAttrs = pComponent.getChilds( model.COMP_TYPE.IG_ATTRIBUTES );
                            } else if ( lRegionTypeProp.getValue() === "NATIVE_FORM" ) {
                                lRegionPluginAttrs = pComponent.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR );
                            }

                            if ( lRegionPluginAttrs && lRegionPluginAttrs[ 0 ] ) {
                                handleWebSrcParameters( lRegionPluginAttrs[ 0 ], pComponent.id, pAction, pProperty, pOldValue );
                            }
                        }
                    }
                }
            }
        }

        // Default Post Processing SQL query and Function returning SQL query with the columns of the web source data profile
        lProperty = pComponent.getProperty( [ model.PROP.SOURCE_POST_PROCESSING,
                                              model.PROP.DUALITYVIEW_SOURCE_POST_PROCESSING,
                                              model.PROP.JSONCOLL_SOURCE_POST_PROCESSING ] );

        if ( _hasChangedEqualsTo( lProperty, pAction, pProperty, "SQL" ) || _hasChangedEqualsTo( lProperty, pAction, pProperty, "FUNC_BODY_RETURNING_SQL" ) ) {
            let lPostProcForSourceType = lProperty.id,
                lPostProcForSourcePropId,
                lPostProcSqlQueryPropId,
                lPostProcPlsqlFuncBodyPropId;

            if ( lPostProcForSourceType === model.PROP.SOURCE_POST_PROCESSING ) {
                lPostProcForSourcePropId     = model.PROP.SOURCE_WEB_SRC_QUERY;
                lPostProcSqlQueryPropId      = model.PROP.POST_PROC_SQL_QUERY;
                lPostProcPlsqlFuncBodyPropId = model.PROP.POST_PROC_PLSQL_FUNC_BODY_SQL;

            } else if ( lPostProcForSourceType === model.PROP.DUALITYVIEW_SOURCE_POST_PROCESSING ) {
                lPostProcForSourcePropId     = model.PROP.SOURCE_DUALITY_VIEW;
                lPostProcSqlQueryPropId      = model.PROP.DUALITYVIEW_POST_PROC_SQL_QUERY;
                lPostProcPlsqlFuncBodyPropId = model.PROP.DUALITYVIEW_POST_PROC_PLSQL_FUNC_BODY_SQL;

            } else if ( lPostProcForSourceType === model.PROP.JSONCOLL_SOURCE_POST_PROCESSING ) {
                lPostProcForSourcePropId     = model.PROP.SOURCE_JSON_COLLECTION;
                lPostProcSqlQueryPropId      = model.PROP.JSONCOLL_POST_PROC_SQL_QUERY;
                lPostProcPlsqlFuncBodyPropId = model.PROP.JSONCOLL_POST_PROC_PLSQL_FUNC_BODY_SQL;
            }

            lSqlQuery = "";
            lSqlColumns = pComponent.getProperty( lPostProcForSourcePropId ).getColumns();
            if ( lSqlColumns.length > 0 ) {
                for ( let i = 0; i < lSqlColumns.length; i++ ) {
                    addSqlQuery( {
                        value:      lSqlColumns[i].name,
                        prefix:     ( i === 0 ) ? "" : "       ",
                        postfix:    ( i < lSqlColumns.length - 1 ) ? ",\n" : "",
                        identifier: true
                    } );
                }
                lSqlQuery = "select " + lSqlQuery + "\n  from #APEX$SOURCE_DATA#";
                if ( lProperty.getValue() === "SQL" ) {
                    _setPropertyValue( pComponent, lPostProcSqlQueryPropId, lSqlQuery );
                } else if ( lProperty.getValue() === "FUNC_BODY_RETURNING_SQL" ) {
                    _setPropertyValue( pComponent, lPostProcPlsqlFuncBodyPropId, "return q'~\n" + lSqlQuery + "\n~';" );
                }
            }
        } else if ( _hasChangedEqualsTo( lProperty, pAction, pProperty, "" ) ) {
            // if the Post Processing property is set to null, re-set the source property to get back the original list of columns
            let sourceProp = pComponent.getProperty( model.getSourceLocationProperty( pComponent ).id );
            if ( sourceProp ) {
                sourceProp.setValue( sourceProp.getValue(), true );
            }
        }

        //
        // Force a change on the REST Source property when the chosen Array Column was changed,
        // in order to get a new validation and to re-fetch the columns.
        //
        if ( _hasChanged( pComponent.getProperty( model.PROP.SOURCE_WEB_SRC_ARRAY_COL ), pAction, pProperty, pOldValue ) ) {
            lProperty = pComponent.getProperty( model.PROP.SOURCE_WEB_SRC_QUERY );
            lProperty.setValue( lProperty.getValue(), true );
        }

        if ( _hasChanged( pComponent.getProperty( model.PROP.SOURCE_DUALITY_VIEW_ARRAY_COL ), pAction, pProperty, pOldValue ) ) {
            lProperty = pComponent.getProperty( model.PROP.SOURCE_DUALITY_VIEW );
            lProperty.setValue( lProperty.getValue(), true );
        }

        if ( _hasChanged( pComponent.getProperty( model.PROP.SOURCE_JSON_COLLECTION_ARRAY_COL ), pAction, pProperty, pOldValue ) ) {
            lProperty = pComponent.getProperty( model.PROP.SOURCE_JSON_COLLECTION );
            lProperty.setValue( lProperty.getValue(), true );
        }

        // Some region-plugin-attribute properties depend on the region's source location property
        // we need to keep both location properties in sync
        lSourceLocProp = pComponent.getProperty( model.PROP.SOURCE_LOCATION );
        if ( _hasChanged( lSourceLocProp, pAction, pProperty, pOldValue ) ) {
            let pluginAttribute = pComponent.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ];
            if ( pluginAttribute ) {
                _setPropertyValue( pluginAttribute, model.PROP.HIDDEN_SOURCE_LOCATION, lSourceLocProp.getValue() );
            }
        }

    } // sourceLocationHandling


    function region( pAction, pProperty, pOldValue ) {

        let lRegionColumns;

        // Slot handling when parent region changes
        _setSlot( {
            componentTypeId: model.COMP_TYPE.REGION,
            action: pAction,
            property: pProperty,
            oldRegionId: pOldValue,
            component: this
        } );

        // Don't show sub regions in a "Region Display Selector"
        if (  this.getProperty( model.PROP.PARENT_REGION ).getValue() !== ""
            && (  pAction === model.CALLBACK_ACTION.CREATED
               || ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.PARENT_REGION && pOldValue === "" )
               )
           )
        {
            _setPropertyValue( this, model.PROP.REGION_DISPLAY_SELECTOR, "N" );
        }

        // Reset the "Master Column" property of all IG columns if the "Master Region" property gets changed
        if ( pAction === model.CALLBACK_ACTION.CHANGED && pProperty.id === model.PROP.MASTER_REGION && pOldValue !== "" ) {
            lRegionColumns = this.getChilds( model.COMP_TYPE.IG_COLUMN, {
                filterFunction: function() {
                    var lMasterColumnProp = this.getProperty( model.PROP.MASTER_COLUMN );
                    return ( lMasterColumnProp && lMasterColumnProp.getValue() !== "" );
                }
            } );
            for ( let i = 0; i < lRegionColumns.length; i++ ) {
                _setPropertyValue( lRegionColumns[ i ], model.PROP.MASTER_COLUMN, "" );
            }
        }


        return sourceLocationHandling( pAction, this, pProperty, pOldValue, model.COMP_TYPE.REGION_WS_PARAM );

    } // region


    function printAttributes( pAction, pProperty ) {

        var DECIMAL_SEP = locale.getDecimalSeparator(),
            PAGE_SIZES = {
                "LETTER": {
                    units:  "INCHES",
                    width:  "8" + DECIMAL_SEP + "5",
                    height: "11"
                },
                "LEGAL": {
                    units:  "INCHES",
                    width:  "8" + DECIMAL_SEP + "5",
                    height: "14"
                },
                "TABLOID": {
                    units:  "INCHES",
                    width:  "8.5",
                    height: "17"
                },
                "A4": {
                    units:  "MILLIMETERS",
                    width:  "210",
                    height: "297"
                },
                "A3": {
                    units:  "MILLIMETERS",
                    width:  "297",
                    height: "420"
                }
            };

        var lPageSize,
            lWidth,
            lHeight;

        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            if ( $.inArray( model.getPrimaryLanguage(), [ "en", "en-us", "en-ca", "fr-ca" ] ) !== -1 ) {
                lPageSize = "LETTER";
            } else {
                lPageSize = "A4";
            }
            _setPropertyValue( this, model.PROP.PRINT_PAGE_SIZE, lPageSize );

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            if ( pProperty.id === model.PROP.PRINT_PAGE_SIZE && pProperty.getValue() !== "CUSTOM" ) {
                // Has the page size been changed changed?

                lPageSize = PAGE_SIZES[ pProperty.getValue() ];

                _setPropertyValue( this, model.PROP.PRINT_UNITS, lPageSize.units );
                if ( this.getProperty( model.PROP.PRINT_ORIENTATION ).getValue() === "VERTICAL" ) {
                    _setPropertyValue( this, model.PROP.PRINT_WIDTH,  lPageSize.width );
                    _setPropertyValue( this, model.PROP.PRINT_HEIGHT, lPageSize.height );
                } else {
                    _setPropertyValue( this, model.PROP.PRINT_WIDTH,  lPageSize.height );
                    _setPropertyValue( this, model.PROP.PRINT_HEIGHT, lPageSize.width );
                }

            } else if ( pProperty.id === model.PROP.PRINT_ORIENTATION ) {

                // Swap existing width and height values
                lWidth  = this.getProperty( model.PROP.PRINT_WIDTH  ).getValue();
                lHeight = this.getProperty( model.PROP.PRINT_HEIGHT ).getValue();

                _setPropertyValue( this, model.PROP.PRINT_WIDTH,  lHeight );
                _setPropertyValue( this, model.PROP.PRINT_HEIGHT, lWidth );

            }
        }
    } // printAttributes


    function validateDaButton( pButtonId ) {

        var lButton,
            lButtonTemplateId;

        // Make sure that the button template contains the #BUTTON_ID# placeholder or that the button has
        // specified id="xxx" in the custom attributes. Without an id tag for a button, dynamic action will not fire
        if ( pButtonId !== "" ) {
            lButton           = model.getComponents( model.COMP_TYPE.BUTTON, { id: pButtonId } )[ 0 ];
            lButtonTemplateId = lButton.getProperty( model.PROP.BUTTON_TEMPLATE ).getValue();
            if (  lButtonTemplateId !== ""
                && !model.getButtonTemplates()[ lButtonTemplateId ].hasButtonId
                && !/id=/.test( lButton.getProperty( model.PROP.CUSTOM_ATTRIBUTES ).getValue() ) )
            {
                return { error: lang.formatMessage( "PD.PE.BUTTON_NO_ID_ERROR" ) }; // todo replace with format and rename PD.PE.BUTTON_NO_ID_ERROR to MODEL.CALLBACK.BUTTON...
            }
        }

    } // validateDaButton


    function dynamicActionHasNoWhenCondition( pDynamicAction ) {

        var lWhenCondition;

        if ( pDynamicAction.getProperty( model.PROP.JS_CONDITION ) ) {

            lWhenCondition = pDynamicAction.getProperty( model.PROP.JS_CONDITION );

        } else if ( pDynamicAction.getProperty( model.PROP.JS_CONDITION_WHEN_IG ) ) {

            lWhenCondition = pDynamicAction.getProperty( model.PROP.JS_CONDITION_WHEN_IG );

        }

        return ( !lWhenCondition || lWhenCondition.getValue() === "" );

    } // dynamicActionHasNoWhenCondition


    function dynamicActionEvent( pAction, pProperty, pValue ) {

        var i, lWhenButtonProperty, lButtonAction, lFalseActions, lFalseActionResultProperty,
            lDynamicActions, lWhenItemsProperty, lConditionItemProperty, lExecutionTypeProperty,
            lIgRegionProperty = this.getProperty( model.PROP.IG_REGION ),
            lIgRegionId = "";

        // For new Dynamic Actions, or when the "When Region" property changes, we need to check if it is an IG region,
        // and update the hidden 'IG Region' property accordingly.
        if (  pAction === model.CALLBACK_ACTION.CREATED ||
            ( pAction === model.CALLBACK_ACTION.CHANGED && [ model.PROP.WHEN_TYPE, model.PROP.WHEN_REGION, model.PROP.WHEN_IG_REGION ].includes(pProperty.id) )
           )
        {
            // the "when region" property can be WHEN_REGION or WHEN_IG_REGION
            const whenRegionProperty = this.getProperty([ model.PROP.WHEN_REGION, model.PROP.WHEN_IG_REGION ]);
            if ( whenRegionProperty && whenRegionProperty.getValue() !== "" ) {
                const regionType = model.getComponents( model.COMP_TYPE.REGION, { id: whenRegionProperty.getValue() } )[ 0 ].getProperty( model.PROP.REGION_TYPE ).getValue();
                if ( regionType === "NATIVE_IG" ) {
                    lIgRegionId = whenRegionProperty.getValue();
                }
            }

            lIgRegionProperty.setValue( lIgRegionId );

            lDynamicActions = this.getChilds( model.COMP_TYPE.DA_ACTION );

            // synchronize the current IG region id to dynamic actions
            for ( i = 0; i < lDynamicActions.length; i++ ) {
                _setPropertyValue( lDynamicActions[ i ], model.PROP.IG_REGION, lIgRegionId );
            }
        }

        // If the dynamic action sets the when condition to null, remove the corresponding FALSE actions
        if ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, [ model.PROP.JS_CONDITION, model.PROP.JS_CONDITION_WHEN_IG ] ) !== -1 ) {

            lFalseActions = this.getChilds( model.COMP_TYPE.DA_ACTION, {
                properties: [{
                    id: model.PROP.FIRE_WHEN_EVENT_RESULT_IS,
                    value: "FALSE"
                }]
            } );

            if ( dynamicActionHasNoWhenCondition( this ) ) {

                // When removing a condition, remove the children that have a FALSE event result
                _removeComponents( lFalseActions );

            } else {

                // When setting a condition, set 'fire when result' action property to itself, to get rid of any false action errors
                for ( i = 0; i < lFalseActions.length; i++ ) {
                    lFalseActionResultProperty = lFalseActions[ i ].getProperty( model.PROP.FIRE_WHEN_EVENT_RESULT_IS );
                    lFalseActionResultProperty.setValue( lFalseActionResultProperty.getValue() );
                }
            }
        }


        // If client-side condition type changes to a type that requires and item or column be defined, or when > item or when > column changes
        // then we default this to the current when > item / column.
        if (  pAction === model.CALLBACK_ACTION.CREATED
           || ( pAction === model.CALLBACK_ACTION.CHANGED && $.inArray( pProperty.id, [ model.PROP.JS_CONDITION, model.PROP.JS_CONDITION_WHEN_IG, model.PROP.WHEN_ITEMS, model.PROP.WHEN_COLUMNS ] ) !== -1 )
           )
        {
            if ( lIgRegionProperty.getValue() === "" ) {
                lWhenItemsProperty     = this.getProperty( model.PROP.WHEN_ITEMS );
                lConditionItemProperty = this.getProperty( model.PROP.JS_CONDITION_ITEM );
            } else {
                lWhenItemsProperty     = this.getProperty( model.PROP.WHEN_COLUMNS );
                lConditionItemProperty = this.getProperty( model.PROP.JS_CONDITION_COLUMN_WHEN_IG );
            }

            if ( lWhenItemsProperty && lConditionItemProperty ) {

                /*
                 * We update the condition item value when any of the following are true:
                 * 1. If the condition item is currently null
                 * 2. If the when > item has changed, and the condition item value was the same as the old when > item value
                 */
                if (  lConditionItemProperty.getValue() === ""
                   || ( pProperty.id === lWhenItemsProperty.id && lConditionItemProperty.getValue() === pValue.split( "," )[ 0 ] ) /* old when item may be multiple, use first item */
                   )
                {
                    // Set the condition item value to the when item, or the 1st of the when items if there are multiple
                    lConditionItemProperty.setValue( lWhenItemsProperty.getValue().split( "," )[ 0 ] );
                }
            }
        }

        // If the dynamic action event is associated to a button, make sure that the button action is set to "Defined by Dynamic Action".
        lWhenButtonProperty = this.getProperty( model.PROP.WHEN_BUTTON );
        if ( _hasChanged( lWhenButtonProperty, pAction, pProperty ) ) {
            if (  !/^apex/.test( this.getProperty( model.PROP.EVENT ).getValue() ) // apex events are listening event, no need to change the button execution
                && lWhenButtonProperty
                && !lWhenButtonProperty.getMetaData().isReadOnly
                && lWhenButtonProperty.getValue() !== "" )
            {
                lButtonAction = model.getComponents( model.COMP_TYPE.BUTTON, { id: lWhenButtonProperty.getValue() } )[ 0 ].getProperty( model.PROP.BUTTON_ACTION );

                if ( lButtonAction.getValue() !== "DEFINED_BY_DA" ) {
                    lButtonAction.setValue( "DEFINED_BY_DA" );
                }
            }

        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE && pProperty.id === model.PROP.WHEN_BUTTON ) {

            return validateDaButton( pValue );

        }

        // If the dynamic action event Execution Type property is Debounce or Throttle, set the value of the Immediate property accordingly
        lExecutionTypeProperty = this.getProperty( model.PROP.DA_EXECUTION_TYPE );
        if ( _hasChangedEqualsTo( lExecutionTypeProperty, pAction, pProperty, "DEBOUNCE" ) ) {
            _setPropertyValue( this, model.PROP.DA_EXECUTION_IMMEDIATE, "N" );
        } else if ( _hasChangedEqualsTo( lExecutionTypeProperty, pAction, pProperty, "THROTTLE" ) ) {
            _setPropertyValue( this, model.PROP.DA_EXECUTION_IMMEDIATE, "Y" );
        }
    } // dynamicActionEvent


    function dynamicActionAction( pAction, pProperty, pValue ) {

        const NAME_PROPERTY = this.getProperty( model.PROP.NAME ),
              ACTION_TYPE_PROPERTY = this.getProperty( model.PROP.DA_ACTION_TYPE );

        let affectedTypeProperty = this.getProperty( model.PROP.AFFECTED_TYPE );


        if ( pAction === model.CALLBACK_ACTION.CREATED ) {

            // copy the IG REGION property from the dynamic action event
            _setPropertyValue( this, model.PROP.IG_REGION, this.getParent().getProperty( model.PROP.IG_REGION ).getValue() );

            // Default "Affected Elements - Type" to ITEM or COLUMN depending if it's an IG region and it's supported by the action
            if ( affectedTypeProperty && affectedTypeProperty.getValue() === "" && ACTION_TYPE_PROPERTY.getValue() !== "NATIVE_JAVASCRIPT_CODE" ) {
                if ( this.getProperty( model.PROP.IG_REGION ).getValue() === "" ) {
                    affectedTypeProperty.setValue( "ITEM" );
                } else {
                    affectedTypeProperty.setValue( "COLUMN" );
                }
            }

        } else if ( pAction === model.CALLBACK_ACTION.CHANGED ) {

            // When the action's event changes, if the action's event result is false, check if the parent DA
            // has a condition, and if not set the event result property to TRUE.
            if ( pProperty.id === model.PROP.DA_EVENT ) {

                if ( this.getProperty( model.PROP.FIRE_WHEN_EVENT_RESULT_IS ).getValue() === "FALSE" ) {

                    if ( dynamicActionHasNoWhenCondition( this.getParent() ) ) {

                        _setPropertyValue( this, model.PROP.FIRE_WHEN_EVENT_RESULT_IS, "TRUE" );

                    }
                }
            }

        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE ) {

            if ( pProperty.id === model.PROP.FIRE_WHEN_EVENT_RESULT_IS ) {

                if ( pValue === "FALSE" && dynamicActionHasNoWhenCondition( this.getParent() ) ) {

                    return { error: lang.formatMessage( "PD.PE.INVALID_FALSE_ACTIONS" ) };

                }
            } else if ( pProperty.id === model.PROP.AFFECTED_BUTTON ) {

                return validateDaButton( pValue );

            } else if ( pProperty.id === model.PROP.AFFECTED_COLUMNS ) {

                // Disallow affected columns to be specified when the DA is based on an IG region and the action is show or hide
                if ( this.getProperty( model.PROP.IG_REGION ).getValue() !== "" &&
                     pValue !== "" &&
                     $.inArray( this.getProperty( model.PROP.DA_ACTION_TYPE ).getValue(), [ "NATIVE_SHOW", "NATIVE_HIDE" ] ) > -1 )
                {
                    return { error: lang.formatMessage( "PD.PE.SHOW_HIDE_NOT_SUPPORTED" ) };
                }
            } else if ( pProperty.id === model.PROP.DA_ACTION_TYPE ) {

                // Disallow action type to be show or hide, when affected columns is not null and DA is based on an IG region
                if ( this.getProperty( model.PROP.IG_REGION ).getValue() !== "" &&
                     this.getProperty( model.PROP.AFFECTED_COLUMNS ) &&
                     this.getProperty( model.PROP.AFFECTED_COLUMNS ).getValue() !== "" &&
                     $.inArray( pValue, [ "NATIVE_SHOW", "NATIVE_HIDE" ] ) > -1 )
                {
                    return { error: lang.formatMessage( "PD.PE.SHOW_HIDE_NOT_SUPPORTED" ) };
                }

            }

        }

        // Synchronize our hidden name attribute if the name or action type has been changed. It is used as our
        // component display property (eg. tree) and shows either name or action type.
        if ( _hasChanged( NAME_PROPERTY, pAction, pProperty ) || _hasChanged( ACTION_TYPE_PROPERTY, pAction, pProperty )) {
            this.getProperty( model.PROP.NAME_HIDDEN ).setValue( NAME_PROPERTY.getValue() || ACTION_TYPE_PROPERTY.getDisplayValue() );
        }

        // If we switch to "Execute JavaScript code", most of the time we actually don't want to type in an Affected Element
        if ( _hasChangedEqualsTo( ACTION_TYPE_PROPERTY, pAction, pProperty, "NATIVE_JAVASCRIPT_CODE" ) ) {

            affectedTypeProperty.setValue( "" );
        }

    } // dynamicActionAction


    function componentRestParam( action, property, value ) {

        let self                 = this,
            valueTypeProperty    = self.getProperty( model.PROP.VALUE_TYPE ),
            directionProperty    = self.getProperty( model.PROP.API_DIRECTION ),
            ignoreOutputProperty = self.getProperty( model.PROP.IGNORE_OUTPUT ),
            outValueTypeProperty = self.getProperty( model.PROP.OUT_VALUE_TYPE );

        if ( _hasChanged( valueTypeProperty, action, property ) ||
             _hasChanged( ignoreOutputProperty, action, property ) ||
             ( outValueTypeProperty &&_hasChanged( outValueTypeProperty, action, property ) ) )
        {
            let direction    = directionProperty.getValue(),
                ignoreOutput = ignoreOutputProperty ? ignoreOutputProperty.getValue() : "",
                requiredValueType;

            if ( direction === "IN" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.BASIC;
            } else if ( direction === "OUT" && ignoreOutput === "Y" ) {
                requiredValueType = "";
            } else if ( direction === "IN_OUT" && [ "Y", "" ].includes( ignoreOutput ) ) {
                requiredValueType = REQUIRED_VALUE_TYPE.BASIC;
            } else if ( [ "IN_OUT", "OUT" ].includes( direction ) && ignoreOutput === "N" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.ITEM;
            }

            _setPropertyValue( self, model.PROP.HIDDEN_REQUIRED_VALUE_TYPE, requiredValueType );

            valueTypeProperty    = self.getProperty( model.PROP.VALUE_TYPE );
            outValueTypeProperty = self.getProperty( model.PROP.OUT_VALUE_TYPE );

            if ( outValueTypeProperty ) {
                _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, outValueTypeProperty.getValue() );
            } else if ( valueTypeProperty ) {
                _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, valueTypeProperty.getValue() );
            } else if ( requiredValueType === REQUIRED_VALUE_TYPE.ITEM || requiredValueType === "" ) {
                _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, requiredValueType );
            }
        }

        if ( action === model.CALLBACK_ACTION.VALIDATE ) {

            //
            // Region, Map Layer or JET Chart Series REST Parameters need a validation on the
            // Ignore Output property
            //
            if ( [ model.COMP_TYPE.REGION_WS_PARAM,
                   model.COMP_TYPE.JET_CHART_WS_PARAM,
                   model.COMP_TYPE.MAP_LAYER_WS_PARAM ].includes ( self.typeId ) )
            {
                //
                // Only Editable Regions can have "Ignore Output" for IN OUT parameters.
                //
                if ( property.id === model.PROP.IGNORE_OUTPUT && value === "N" ) {

                    let parent       = self.getParent(),
                        parentTypeId = parent.typeId,
                        isEditable   = "N",
                        regionType,
                        restOperParam, databaseOperationProp,
                        regionPluginAttrs;

                    if ( parentTypeId === model.COMP_TYPE.REGION ) {

                        regionType = self.getParent().getProperty( model.PROP.REGION_TYPE ).getValue();

                        if ( [ REGION_TYPE.IG, REGION_TYPE.FORM ].includes( regionType ) ) {

                            if ( regionType === REGION_TYPE.IG ) {

                                regionPluginAttrs = parent.getChilds( model.COMP_TYPE.IG_ATTRIBUTES )[ 0 ];

                            } else if ( regionType === REGION_TYPE.FORM ) {

                                regionPluginAttrs = parent.getChilds( model.COMP_TYPE.REGION_PLUGIN_ATTR )[ 0 ];

                            }
                            isEditable = regionPluginAttrs.getProperty( model.PROP.IS_EDITABLE ).getValue();
                        }
                    }

                    if ( isEditable === "N" ) {
                        return { error: format( "WEB_SRC_PARAM.IGNORE_OUTPUT_NON_EDITABLE" ) };
                    }

                    restOperParam = model.getComponents( model.COMP_TYPE.WEB_SRC_OPER_PARAM, {
                            id: self.getProperty( model.PROP.WEB_SRC_PARAM ).getValue()
                        } )[ 0 ];

                    if ( restOperParam ) {
                        databaseOperationProp = restOperParam.getProperty( model.PROP.DATABASE_OPERATION );
                        if ( databaseOperationProp && databaseOperationProp.getValue() === "FETCH_COLLECTION" ) {
                            return { error: format( "WEB_SRC_PARAM.IGNORE_OUTPUT_FETCH_COLLECTION" ) };
                        }
                    }
                }
            }

            //
            // Make sure that Type = Null isn't picked for the parameter, if the parameter configuration requires to enter a value
            //
            if ( property.id === model.PROP.VALUE_TYPE && value === "NULL" ) {

                let lWebSrcParam,
                    lWebSrcParamRequiredProp;

                // Get the referenced web source parameter configuration
                lWebSrcParam = model.getComponents( model.COMP_TYPE.WEB_SRC_MOD_PARAM, {
                    id: self.getProperty( model.PROP.WEB_SRC_PARAM ).getValue()
                } )[ 0 ];

                if ( !lWebSrcParam ) {
                    lWebSrcParam = model.getComponents( model.COMP_TYPE.WEB_SRC_OPER_PARAM, {
                        id: self.getProperty( model.PROP.WEB_SRC_PARAM ).getValue()
                    } )[ 0 ];
                }

                if ( lWebSrcParam ) {
                    lWebSrcParamRequiredProp = lWebSrcParam.getProperty( model.PROP.PARAMETER_REQUIRED );
                    if ( lWebSrcParamRequiredProp && lWebSrcParamRequiredProp.getValue() === "Y" ) {
                        return { error: format( "WEB_SRC_PARAM.REQUIRES_VALUE" ) };
                    }
                }
            }
        }

    } // componentRestParam


    function invokeApiPlugin( action, property, value, validationInfo ) {

        let self = this,
            typeProperty       = self.getProperty( model.getPluginProperty( self.typeId, PROCESS_TYPE.INVOKE_API, 1 ).id ),
            methodProperty     = self.getProperty([
                                     model.getPluginProperty( self.typeId, PROCESS_TYPE.INVOKE_API, 4 ).id,
                                     model.getPluginProperty( self.typeId, PROCESS_TYPE.INVOKE_API, 5 ).id ]),
            restSourceProperty = self.getProperty( model.getPluginProperty( self.typeId, PROCESS_TYPE.INVOKE_API, 6 ).id ),
            restOperProperty   = self.getProperty( model.getPluginProperty( self.typeId, PROCESS_TYPE.INVOKE_API, 7 ).id ),
            paramCompType,
            wsParamCompType;

        function removeUnusedParameters( parameters, parameterComponents ) {

            let i, j,
                found,
                name;

            // Remove all parameters which don't exist anymore or where the type has changed
            for ( i = 0; i < parameterComponents.length; i++ ) {
                found = false;
                name  = parameterComponents[ i ].getProperty( model.PROP.NAME ).getValue().toLowerCase();

                for ( j = 0; j < parameters.length && !found; j++ ) {
                    if ( parameters[ j ].name.toLowerCase() === name ) {
                        parameters[ j ].parameterComponent = parameterComponents[ i ];
                        found = true;
                        break;
                    }
                }

                if ( !found ) {
                    parameterComponents[ i ].remove();
                }
            }
        } // removeUnusedParameters


        function addUpdateParameters( parameters, parameterComponents, pCompTypeId ) {

            let i,
                previousComponent;

            // New parameters should be added after the existing parameters
            if ( parameterComponents.length > 0 ) {
                previousComponent = parameterComponents[ parameterComponents.length - 1 ];
            }

            // Add all parameters where we don't have a parameter component yet or update where something has changed
            for ( i = 0; i < parameters.length; i++ ) {

                if ( parameters[ i ].parameterComponent ) {

                    // Parameter with that name does already exist, set the key properties of the parameter declaration again
                    let parameterComponent = parameters[ i ].parameterComponent;

                    _setPropertyValue( parameterComponent, model.PROP.API_DIRECTION, parameters[ i ].direction );
                    _setPropertyValue( parameterComponent, model.PROP.HAS_DEFAULT,   parameters[ i ].hasDefault ? "Y" : "N" );
                    if ( parameters[ i ].isCustomDataType ) {
                        _setPropertyValue( parameterComponent, model.PROP.API_DATA_TYPE, "CUSTOM" );
                        _setPropertyValue( parameterComponent, model.PROP.API_CUSTOM_DATA_TYPE, parameters[ i ].dataType );
                    } else {
                        _setPropertyValue( parameterComponent, model.PROP.API_DATA_TYPE, parameters[ i ].dataType );
                    }

                } else {

                    // If the API contains a new parameter, add it at the end of the existing parameters.
                    previousComponent = new model.Component( {
                        previousComponent: previousComponent,
                        typeId:            pCompTypeId,
                        parentId:          self.id,
                        values:            [{
                            // We just need the name, the other properties will be set by the processInvokeApiParam callback
                            id:    model.PROP.NAME,
                            value: parameters[ i ].name
                        }]
                    } );
                }
            }
        } // addUpdateParameters
        if ( this.typeId === model.COMP_TYPE.WORKFLOW_ACTIVITY) {
            paramCompType   = model.COMP_TYPE.WF_ACTIVITY_API_PARAM;
            wsParamCompType = model.COMP_TYPE.WF_ACTIVITY_WS_PARAM;
        }
        else {
            paramCompType   = model.COMP_TYPE.PAGE_PROC_API_PARAM;
            wsParamCompType = model.COMP_TYPE.PAGE_PROC_WS_PARAM;
        }
        if ( action === model.CALLBACK_ACTION.VALIDATE && methodProperty && methodProperty.id === property.id ) {

            // Show a warning if the function/procedure is overloaded
            if ( validationInfo.parameters && validationInfo.parameters.length > 1 ) {
                return { warning: format( "INVOKE_API.OVERLOADED_WARNING", value ) };
            }

        } else if ( action === model.CALLBACK_ACTION.REMOVED ) {

            _removeChildren( self, paramCompType );
            _removeChildren( self, wsParamCompType );

        } else {

            if ( _hasChanged( typeProperty, action, property )) {
                _removeChildren( self, paramCompType );
                _removeChildren( self, wsParamCompType );
            }

            // synchronize the parameters if the method has been changed
            if ( _hasChanged( methodProperty, action, property )) {

                let parameters          = methodProperty.getParameters(),
                    parameterComponents = self.getChilds( paramCompType );

                // Only if we have a valid method which has returned parameters, we try to add/modify the parameters
                if ( parameters.length > 0 ) {

                    // Remove all parameters which don't exist anymore
                    removeUnusedParameters( parameters, parameterComponents );

                    // Add or Update parameters
                    addUpdateParameters( parameters, parameterComponents, paramCompType );
                }

            } else {
                let moduleChanged    = _hasChanged( restSourceProperty, action, property ),
                    operationChanged = _hasChanged( restOperProperty, action, property ),
                    pageProcessWsParams, operationParam;

                if ( moduleChanged ) {
                    //
                    // If the REST Module changed, we cannot reuse any parameter. Even if it has the
                    // same name, the meaning and IN, OUT or IN/OUT semantics could be totally different.
                    // So we're removing everything and re-create anew.
                    //
                    _removeChildren( self, wsParamCompType );

                    addRestParametersToComponent(
                        self,
                        self.id,
                        restSourceProperty.getValue(),
                        model.COMP_TYPE.WEB_SRC_MOD_PARAM,
                        wsParamCompType);

                } else if ( operationChanged ) {
                    //
                    // if only the operation changed, we can keep the module parameters, but
                    // we will delete and recreate operation parameters. Unlike PL/SQL, the
                    // meta data for IN, OUT or IN/OUT is defined at the Shared Component
                    // level; and semantics can change between operations, even if the
                    // parameter name is the same.
                    //
                    pageProcessWsParams = self.getChilds( wsParamCompType );

                    for ( let i = 0; i < pageProcessWsParams.length; i++ ) {

                        // is the parameter an operation parameter ...?
                        operationParam  = model.getComponents( model.COMP_TYPE.WEB_SRC_OPER_PARAM, {
                                              id: pageProcessWsParams[ i ].getProperty( model.PROP.WEB_SRC_PARAM ).getValue()
                                          } );

                        // ... delete it.
                        if ( operationParam[ 0 ] ) {
                            _removeComponents ( [ pageProcessWsParams[ i ] ] );
                        }
                    }

                    //
                    // add the Parameters for the chosen REST Operation to the component.
                    addRestParametersToComponent(
                        self,
                        self.id,
                        restOperProperty.getValue(),
                        model.COMP_TYPE.WEB_SRC_OPER_PARAM,
                        wsParamCompType,
                        model.getComponents(
                            model.COMP_TYPE.WEB_SRC_OPERATION,
                            { id: restOperProperty.getValue() } )[0] );
                }
            }
        }

    } // invokeApiPlugin

    function executionChainPlugin( action, property, value ) {
        const allowedBackgroundPoints = [ "ON_SUBMIT_BEFORE_COMPUTATION", "AFTER_SUBMIT" ];

        let self                    = this,
            childProcessComponents,
            processPointProp        = self.getProperty( model.PROP.PROCESS_POINT ),
            processNameProp,
            executeBackgroundPropId = model.getPluginProperty( self.typeId, PROCESS_TYPE.EXECUTION_CHAIN, 1 ).id,
            rootProcess,
            processPoint;

        function getRootProcessComponent( pComponent ) {
            let parentProcessProp = pComponent.getProperty( model.PROP.PARENT_PROCESS ),
                parentProcessComp;

            if ( parentProcessProp && parentProcessProp.getValue() !== "" ) {
                parentProcessComp = model.getComponents( model.COMP_TYPE.PAGE_PROCESS,
                                                         { id: parentProcessProp.getValue() } )[ 0 ];

                if ( parentProcessComp ) {
                    return getRootProcessComponent( parentProcessComp );
                }
            }
            return pComponent;
        }
        function getChildProcesses( pComponent, pFollowHierarchy ) {
            let foundComponents = [];

            function addChildComponents( pForComponent ) {
                let childComponents;

                if ( pForComponent.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === PROCESS_TYPE.EXECUTION_CHAIN ) {
                    childComponents = model.getComponents( model.COMP_TYPE.PAGE_PROCESS,
                                                           { properties: [{
                                                                 id:    model.PROP.PARENT_PROCESS,
                                                                 value: pForComponent.id } ]
                                                           } );

                    for ( let i = 0; i < childComponents.length; i++ ) {
                        foundComponents.push( childComponents[ i ] );
                        if ( pFollowHierarchy ) {
                            addChildComponents( childComponents[ i ] );
                        }
                    }
                }
            }

            addChildComponents( pComponent );
            return foundComponents;
        }

        function disableBackgroundForAllChilds( pComponent ) {

            //
            // disable execution in background
            //
            _setPropertyValue( pComponent, executeBackgroundPropId, "N" );

            //
            // get all child processes of this page process
            //
            childProcessComponents = getChildProcesses( pComponent, false );

            //
            // walk through all child processes, and for processes of the EXECUTION CHAIN type,
            // this function calls itself recursively to disable background processing also
            // for all child processes.
            //
            for ( let i = 0; i < childProcessComponents.length; i++ ) {
                if ( childProcessComponents[ i ].getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === PROCESS_TYPE.EXECUTION_CHAIN ) {
                    disableBackgroundForAllChilds( childProcessComponents[ i ] );
                }
            }
        }

        if (    action === model.CALLBACK_ACTION.CHANGED
             && property.id === model.PROP.PROCESS_POINT )
        {
            //
            // if the process point does not support background execution, disable it
            // and also for all child processes.
            //
            if ( !( allowedBackgroundPoints.includes( processPointProp.getValue() ) ) ) {
                disableBackgroundForAllChilds( self );
            }
        }

        if (    action      === model.CALLBACK_ACTION.VALIDATE
             && property.id === executeBackgroundPropId
             && value       === "Y" )
        {

            //
            // let's check whether the root process has a process point which does not
            // support background execution, and raise an error if that is the case.
            //
            rootProcess = getRootProcessComponent( self );
            processPointProp = rootProcess.getProperty( model.PROP.PROCESS_POINT );
            processNameProp  = rootProcess.getProperty( model.PROP.NAME );

            if ( processPointProp ) {
                processPoint = processPointProp.getValue();
                if ( !allowedBackgroundPoints.includes( processPoint ) ) {
                    return { error: format( "PROCESS_BACKGROUND.PAGE_RENDERING_NOT_SUPPORTED", processNameProp.getValue() ) };
                }
            }
            //
            // let's now check whether any of the child processes (go down the hierarchy)
            // has an editable region set. If yes, raise an error, as we do not support
            // background execution for region processes (yet).
            //
            childProcessComponents = getChildProcesses( self, true );

            for ( let i = 0; i < childProcessComponents.length; i++ ) {
                let editableRegionProp = childProcessComponents[ i ].getProperty( model.PROP.PROCESS_REGION ),
                    processNameProp    = childProcessComponents[ i ].getProperty( model.PROP.NAME );

                if ( editableRegionProp && editableRegionProp.getValue() !== "" ) {
                    return { error: format( "PROCESS_BACKGROUND.CHILD_PROCESSES_W_REGION_NOT_SUPPORTED", processNameProp.getValue() ) };
                }
            }
        }
    } // executionChainPlugin


    function processInvokeApiParam( action, property, value ) {

        const VALUE_TYPE_PROPERTIES = [ model.PROP.API_VALUE_TYPE_BASIC, model.PROP.API_VALUE_TYPE_BLOB, model.PROP.API_VALUE_TYPE_CUSTOM ],
              VALUE_TYPE = {
                  API_DEFAULT: "API_DEFAULT",
                  ITEM:        "ITEM",
                  STATIC:      "STATIC"
              };

        let self = this,
            nameProperty         = self.getProperty( model.PROP.NAME ),
            directionProperty    = self.getProperty( model.PROP.API_DIRECTION ),
            dataTypeProperty     = self.getProperty( model.PROP.API_DATA_TYPE ),
            ignoreOutputProperty = self.getProperty( model.PROP.IGNORE_OUTPUT ),
            valueTypeProperty    = self.getProperty( VALUE_TYPE_PROPERTIES ),
            hasDefaultProperty   = self.getProperty( model.PROP.HAS_DEFAULT );

        if ( action === model.CALLBACK_ACTION.CREATED || _hasChanged( nameProperty, action, property, value )) {

            let parentComponent = self.getParent(),
                methodProperty = parentComponent.getProperty([
                    model.getPluginProperty( parentComponent.typeId, PROCESS_TYPE.INVOKE_API, 4 ).id,
                    model.getPluginProperty( parentComponent.typeId, PROCESS_TYPE.INVOKE_API, 5 ).id ]),
                editRegionId = "",
                editRegion,
                editRegionType = "",
                parameters = methodProperty.getParameters(),
                name = nameProperty.getValue().toLowerCase(),
                i;
            if (parentComponent.typeId !== model.COMP_TYPE.WORKFLOW_ACTIVITY) {
                editRegionId = parentComponent.getProperty( model.PROP.PROCESS_REGION ).getValue();
            }
            if ( editRegionId !== "" ) {
                editRegion     = pe.getComponents( pe.COMP_TYPE.REGION, { id: editRegionId }, false )[ 0 ];
                editRegionType = editRegion.getProperty( pe.PROP.REGION_TYPE ).getValue();
            }

            // When a parameter is created, we try to look it up in the parameters of that method and
            // default as many properties as possible
            for ( i = 0; i < parameters.length; i++ ) {
                if ( parameters[ i ].name.toLowerCase() === name ) {
                    directionProperty.setValue( parameters[ i ].direction );
                    _setPropertyValue( self, model.PROP.HAS_DEFAULT, parameters[ i ].hasDefault ? "Y" : "N" );

                    if ( parameters[ i ].isCustomDataType ) {

                        dataTypeProperty.setValue( "CUSTOM" );
                        _setPropertyValue( self, model.PROP.API_CUSTOM_DATA_TYPE, parameters[ i ].dataType );
                        if ( parameters[ i ].hasDefault ) {
                            _setPropertyValue( self, model.PROP.API_VALUE_TYPE_CUSTOM, VALUE_TYPE.API_DEFAULT );
                        }

                    } else {

                        // Standard data type
                        dataTypeProperty.setValue( parameters[ i ].dataType );

                        if ( parameters[ i ].dataType !== "BLOB" ) {

                            let namePropertyId,
                                items = [];

                            if ( editRegionType === REGION_TYPE.IG ) {
                                // search for a column that matches the parameter name
                                namePropertyId = model.PROP.COLUMN_NAME;
                                items = editRegion.getChilds( model.COMP_TYPE.IG_COLUMN, {
                                    properties: [{
                                        id:    namePropertyId,
                                        value: parameters[ i ].name.replace( /^p_|pi_|po_/, "" ).toUpperCase()
                                    }]});
                            }
                            if ( items.length === 0 ) {
                                // search for a page item that matches the parameter name
                                namePropertyId = model.PROP.ITEM_NAME;
                                items = model.getComponents( model.COMP_TYPE.PAGE_ITEM, {
                                    properties: [{
                                        id:    namePropertyId,
                                        value: "P" + model.getCurrentPageId() + "_" + parameters[ i ].name.replace( /^p_|pi_|po_/, "" ).toUpperCase()
                                    }]});
                            }
                            if ( items.length > 0 ) {
                                _setPropertyValue( self, model.PROP.API_VALUE_TYPE_BASIC, VALUE_TYPE.ITEM );
                                _setPropertyValue( self, model.PROP.VALUE_ITEM, items[ 0 ].getProperty( namePropertyId ).getValue() );

                            } else if ( parameters[ i ].hasDefault ) {
                                _setPropertyValue( self, model.PROP.API_VALUE_TYPE_BASIC, VALUE_TYPE.API_DEFAULT );

                            } else if ( parameters[ i ].dataType === "BOOLEAN" ) {
                                 // It's more likely that a boolean is just a programmatic flag to enable/disable something
                                _setPropertyValue( self, model.PROP.API_VALUE_TYPE_BASIC, VALUE_TYPE.STATIC );
                            }

                        } else {

                            // Special handling for BLOB, because we don't support ITEM binding
                            if ( parameters[ i ].hasDefault ) {
                                _setPropertyValue( self, model.PROP.API_VALUE_TYPE_BLOB, VALUE_TYPE.API_DEFAULT );
                            }
                        }
                    }
                }
            }

        } else if ( action === model.CALLBACK_ACTION.VALIDATE && ( property.id === model.PROP.HAS_DEFAULT || VALUE_TYPE_PROPERTIES.includes( property.id )))
        {
            // Don't allow to set "Has Default" to No if "Value Type" equals to "API Default"
            if ( property.id === model.PROP.HAS_DEFAULT && value === "N" ) {

                if ( valueTypeProperty && valueTypeProperty.getValue() === VALUE_TYPE.API_DEFAULT ) {
                    return { error: format( "INVOKE_API.HAS_DEFAULT_ERROR" ) };
                }

            // Don't allow to set "Value Type" to "API Default" if "Has Default" equals No or is not available
            } else if ( value === VALUE_TYPE.API_DEFAULT && ( !hasDefaultProperty || hasDefaultProperty.getValue() === "N" ) ) {
                return { error: format( "INVOKE_API.API_DEFAULT_ERROR" ) };
            }
        }

        // Synchronize our HIDDEN_* properties that are used as depending-on properties.
        if ( _hasChanged( directionProperty, action, property ) ||
             _hasChanged( dataTypeProperty, action, property ) ||
             _hasChanged( ignoreOutputProperty, action, property )
           )
        {
            let direction    = directionProperty.getValue(),
                dataType     = dataTypeProperty.getValue(),
                ignoreOutput = ignoreOutputProperty ? ignoreOutputProperty.getValue() : "",
                requiredValueType;

            // The HIDDEN_REQUIRED_VALUE_TYPE and HIDDEN_VALUE_TYPE properties do always exists and are
            // used by the different API_VALUE_TYPE_* and VALUE_* properties as a depending-on property.
            // Keep in sync with view wwv_flow_invokeapi_cparams_dev in dev_views.sql
            if ( [ "IN", "IN_OUT" ].includes( direction ) && dataType === "BLOB" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.BLOB;
            } else if ( [ "IN", "IN_OUT" ].includes( direction ) && dataType === "CUSTOM" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.CUSTOM;
            } else if ( direction === "IN" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.BASIC;
            } else if ( direction === "OUT" && [ "BLOB", "CUSTOM" ].includes( dataType ) ) {
                requiredValueType = "";
            } else if ( direction === "OUT" && ignoreOutput === "Y" ) {
                requiredValueType = "";
            } else if ( direction === "IN_OUT" && ignoreOutput === "Y" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.BASIC;
            } else if ( [ "IN_OUT", "OUT" ].includes( direction ) && ignoreOutput === "N" ) {
                requiredValueType = REQUIRED_VALUE_TYPE.ITEM;
            }
            _setPropertyValue( self, model.PROP.HIDDEN_REQUIRED_VALUE_TYPE, requiredValueType );

            // Page Designer doesn't trigger a change event for those properties that do appear because of a dependency,
            // that's why we have to manually synchronize the hidden unified value type (HIDDEN_VALUE_TYPE) ourself.
            valueTypeProperty = self.getProperty( VALUE_TYPE_PROPERTIES );
            if ( valueTypeProperty ) {
                _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, valueTypeProperty.getValue() );
            } else if ( requiredValueType === REQUIRED_VALUE_TYPE.ITEM || requiredValueType === "" ) {
                _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, requiredValueType );
            }
        }

        // based on the currently visible value type property, synchronize the value to our
        // hidden unified value type which is used as dependent-on property for all VALUE_* properties
        // Note: this doesn't get triggered for default values specified for a property which gets visible because
        //       of a depending-on check. See a few lines above where we sync too.
        if ( _hasChanged( valueTypeProperty, action, property )) {
            _setPropertyValue( self, model.PROP.HIDDEN_VALUE_TYPE, valueTypeProperty.getValue() );
        }

    } // processInvokeApiParam

    function processWorkflowActivityParam( action, property, value ) {
        const ignoreOutputProp = this.getProperty( model.PROP.IGNORE_OUTPUT );
        if ( action === model.CALLBACK_ACTION.CREATED ) {
            this.getProperty( model.PROP.PARAMETER_VALUE_TYPE )?.setValue( this.getProperty( model.PROP.HIDDEN_VALUE_TYPE ).getValue() );
        } else if ( _hasChanged( this.getProperty( model.PROP.PARAMETER_VALUE_TYPE ), action, property, value ) ) {
            this.getProperty( model.PROP.HIDDEN_VALUE_TYPE ).setValue( this.getProperty( model.PROP.PARAMETER_VALUE_TYPE ).getValue() );
        } else if ( _hasChanged( ignoreOutputProp, action, property ) || _hasChanged( this.getProperty( model.PROP.API_DIRECTION ), action, property ) ) {
            let direction = this.getProperty( model.PROP.API_DIRECTION ).getValue();
            if ( direction === "IN_OUT" ) {
                if ( ignoreOutputProp.getValue() === "Y" ) {
                    this.getProperty( model.PROP.HIDDEN_REQUIRED_VALUE_TYPE ).setValue( "BASIC" );
                } else {
                    this.getProperty( model.PROP.HIDDEN_REQUIRED_VALUE_TYPE ).setValue( "ITEM" );
                    this.getProperty( model.PROP.HIDDEN_VALUE_TYPE ).setValue( "ITEM" );
                }
            } else if ( direction === "OUT" ) {
                this.getProperty( model.PROP.HIDDEN_REQUIRED_VALUE_TYPE ).setValue( "" );
                // if "out" params have the IgnoreOutput disabled we need to show the "item selector"
                this.getProperty( model.PROP.HIDDEN_VALUE_TYPE ).setValue( ( ignoreOutputProp.getValue() === "N" ? "ITEM" : "" ) );
            } else if ( direction === "IN" ) {
                this.getProperty( model.PROP.HIDDEN_REQUIRED_VALUE_TYPE ).setValue( "BASIC" );
            }
        }
    }

    function pageProcess( action, property, value ) {
        const TYPE_EXECUTE_CODE = "NATIVE_PLSQL",
              POINT_AJAX        = "ON_DEMAND",
              //
              self              = this;

        let pointProperty         = self.getProperty( model.PROP.PROCESS_POINT ),
            typeProperty          = self.getProperty( model.PROP.PAGE_PROCESS_TYPE ),
            parentProcessProperty = self.getProperty( model.PROP.PARENT_PROCESS ),
            backgroundProcessName;

        function parentProcessIsBackground( pComponent ) {
            let parentProcessProp = pComponent.getProperty( model.PROP.PARENT_PROCESS ),
                parentProcessBgProp,
                parentProcessComp,
                result = false;

            if ( parentProcessProp && parentProcessProp.getValue() !== "" ) {
                parentProcessComp = model.getComponents( model.COMP_TYPE.PAGE_PROCESS,
                                                         { id: parentProcessProp.getValue() } )[ 0 ];

                if ( parentProcessComp ) {
                    parentProcessBgProp = parentProcessComp.getProperty( model.getPluginProperty( self.typeId, PROCESS_TYPE.EXECUTION_CHAIN, 1 ).id );
                    if ( parentProcessBgProp && parentProcessBgProp.getValue() === "Y" ) {
                        result = parentProcessComp.getProperty( model.PROP.NAME ).getValue();
                    } else {
                        result = parentProcessIsBackground( parentProcessComp );
                    }
                }
            }
            return result;
        }

        function findExecutionPoint( pProcessId ) {
            let processComp = model.getComponents( model.COMP_TYPE.PAGE_PROCESS, { id: pProcessId } )[ 0 ],
                parentProcessProp = processComp.getProperty( model.PROP.PARENT_PROCESS ),
                rootProcessPoint;

            if ( parentProcessProp && parentProcessProp.getValue() !== "" ) {
                //
                // there is a parent process ID, so walk up the hierarchy
                //
                rootProcessPoint = findExecutionPoint( parentProcessProp.getValue() );

            } else {

                //
                // there is no grant parent process ID, so let's get and return the execution point.
                //
                if ( processComp.getProperty( model.PROP.PROCESS_POINT ) ) {
                    rootProcessPoint = processComp.getProperty( model.PROP.PROCESS_POINT ).getValue();
                } else {
                    // fallback for the case we cannot find anything.
                    rootProcessPoint = "AFTER_SUBMIT";
                }

            }
            return rootProcessPoint;
        }

        function hasChildProcesses( pComponent ) {
            return model.getComponents( model.COMP_TYPE.PAGE_PROCESS,
                                        { properties: [{
                                                         id:    model.PROP.PARENT_PROCESS,
                                                         value: pComponent.id } ]
                                                       } )?.length > 0;
        }


        //
        // If the execution chain (Parent Process) is set to "None", then we need to look up
        // the process point of the former execution chain (wand walk up the hierarchy if reqiured).
        // Then set the process point to the found value, otherwise the default ("AFTER_SUBMIT") from
        // page designer meta data would be applied, which could lead to the process "vanishing" - bug #35362394
        //
        if (    action                           === model.CALLBACK_ACTION.CHANGED
             && property.id                      === model.PROP.PARENT_PROCESS
             && value                            !== ""
             && parentProcessProperty.getValue() === "" )
        {
            pointProperty.setValue( findExecutionPoint( value ) );
        }

        //
        // background execution is not supported for region-based processing (IG DML, Tab Form)
        //
        if (    action      === model.CALLBACK_ACTION.VALIDATE
             && property.id === model.PROP.PROCESS_REGION
             && value       !== "" )
        {
            backgroundProcessName = parentProcessIsBackground( self );
            if ( backgroundProcessName ) {
                return { error: format( "PROCESS_BACKGROUND.PROCESS_W_REGION_NOT_SUPPORTED", backgroundProcessName ) };
            }
        }

        //
        // if an execution chain has child processes, do not allow changing the process type.
        //
        if (    action                  === model.CALLBACK_ACTION.VALIDATE
             && property.id             === model.PROP.PAGE_PROCESS_TYPE
             && value                   !== PROCESS_TYPE.EXECUTION_CHAIN
             && hasChildProcesses( self ) )
        {
                return { error: format( "PROCESS.CHILDREN_ONLY_ALLOWED_FOR_EXECUTION_CHAINS" ) };
        }

        if ( !property || !pointProperty || !typeProperty ) {
            return;
        }

        let processPoint   = pointProperty.getValue(),
            processType    = typeProperty.getValue();

        let isTypeChanged           = property.id === model.PROP.PAGE_PROCESS_TYPE,
            isPointChanged          = property.id === model.PROP.PROCESS_POINT,
            isAjax                  = processPoint === POINT_AJAX,
            isExecuteCode           = processType === TYPE_EXECUTE_CODE,
            isDownload              = processType === PROCESS_TYPE.DOWNLOAD,
            isPrintReport           = processType === PROCESS_TYPE.PRINT_REPORT;

        switch( action ) {
            case model.CALLBACK_ACTION.VALIDATE:
                // only "Execute Code" type of processes can have "Ajax Callback" process point
                if ( ( isTypeChanged && isAjax && value !== TYPE_EXECUTE_CODE ) || ( isPointChanged && !isExecuteCode && value === POINT_AJAX ) ) {
                    return { error: format( "PROCESS.AJAX_RESTRICTION" ) };
                }
                break;
            case model.CALLBACK_ACTION.CHANGED:
                // the "Process Type" and "Process Point" properties are not depending on each other
                // so we must re-assign the values in order to update their state, ie. remove deprecated error messages
                if ( isTypeChanged && isExecuteCode && isAjax ) {
                    _revalidateProperty( null, pointProperty );
                } else if ( isPointChanged && !isExecuteCode && value === POINT_AJAX ) {
                    _revalidateProperty( null, typeProperty );
                // force a re-validation of the process point if the type changes
                // for download & print report processes
                } else if ( isTypeChanged && ( isDownload || isPrintReport ) ) {
                    _revalidateProperty( null, pointProperty );
                }
                break;
        }

    } // pageProcess

    function componentAction( action, property, oldValue ) {

        let self = this,
            actionPositionProp = self.getProperty( model.PROP.ACTION_POSITION ),
            actionTemplateProp = self.getProperty( model.PROP.ACTION_TEMPLATE ),
            hiddenTemplateProp = self.getProperty( model.PROP.HIDDEN_TEMPLATE_ID );

        if ( _hasChanged( property, action, actionPositionProp, oldValue )) {

            // Does the position allow to pick a template or do we just use the one configured for the position
            let position = model.getPluginActionPosition( actionPositionProp.getValue() );

            // Sync the template id to our HIDDEN_TEMPLATE_ID property, because all dependencies
            // are based on that property which is always available
            if ( position.type === "LINK" ) {
                hiddenTemplateProp.setValue( "0" ); // Note: 0 is a pre-configured template used for LINKs.
            } else if ( position.templateId ) {
                hiddenTemplateProp.setValue( position.templateId );
            }
        }

        if ( actionTemplateProp && _hasChanged( property, action, actionTemplateProp, oldValue )) {
            // Sync the template id to our HIDDEN_TEMPLATE_ID property, because all dependencies
            // are based on that property which is always available
            hiddenTemplateProp.setValue( actionTemplateProp.getValue() );
        }

        // Does the picked template support menus?
        if ( _hasChanged( property, action, hiddenTemplateProp, oldValue )) {

            let menuEntryTypeId;

            if ( self.typeId === model.COMP_TYPE.REGION_ACTION ) {
                menuEntryTypeId = model.COMP_TYPE.REGION_ACTION_MENU_ENTRY;
            } else if ( self.typeId === model.COMP_TYPE.IR_COLUMN_ACTION ) {
                menuEntryTypeId = model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY;
            }

            if ( model.getActionPositionType( self ) === "MENU" ) {

                // if we don't have any menu entries so far, create a dummy one to guide the developer
                if ( self.getChilds( menuEntryTypeId ).length === 0 ) {

                    new model.Component( {
                        typeId:   menuEntryTypeId,
                        parentId: self.id
                    } );
                }

            } else {

                // if the new plugin action type isn't a MENU anymore, remove all menu entries
                _removeChildren( self, menuEntryTypeId );

            }
        }

    } // componentAction


    function componentMenuEntry( action, property ) {

        let self = this,
            parentMenuPropId;

        // if the menu entry isn't of type SUB_MENU anymore or it gets removed, we also have to clean up all sub menu entries
        if (  _hasChangedNotEqualsTo( property, action, self.getProperty( model.PROP.MENU_ENTRY_TYPE ), "SUB_MENU" )
           || action === model.CALLBACK_ACTION.REMOVED )
        {

            if ( self.typeId === model.COMP_TYPE.REGION_ACTION_MENU_ENTRY ) {
                parentMenuPropId = model.PROP.REGION_ACTION_PARENT_MENU;
            } else if ( self.typeId === model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY ) {
                parentMenuPropId = model.PROP.IR_COLUMN_ACTION_PARENT_MENU;
            }

            _removeComponents(
                model.getComponents(
                    self.typeId, {
                        parentId: self.parentId,
                        properties: [{
                            id:    parentMenuPropId,
                            value: self.id
                        }]},
                    false ));
        }

    } // componentMenuEntry

    function toggleWorkflowComponents( version ) {
        let state = version.getProperty( model.PROP.STATE ).getValue();
        switch ( state ) {
            case "ACTIVE":
                this.enable();
                this.getProperties().forEach( prop => prop.id !== model.PROP.DIAGRAM && prop.disable() );
                break;
            case "DEVELOPMENT":
                this.enable();
                this.getProperties().forEach( ( prop ) => {
                    if ( ![ model.PROP.CHANGED_ON, model.PROP.CHANGED_BY ].includes( prop.id ) ) {
                        prop.enable();
                    }
                } );
                break;
            case "INACTIVE":
                this.disable();
        }
    }

    function componentWorkflowParam( action , property, oldValue ) {
        const self = this;
        const workflowPropId = model.getPluginProperty( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_WF, 1 ).id;
        const waitForCompletionPropId = model.getPluginProperty( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_WF, 5 ).id;
        const paramDirection = self.getPropertyValue( model.PROP.API_DIRECTION );
        const dataTypeProp = this.getProperty( model.PROP.WORKFLOW_DATA_TYPE );
        const defaultValueProp = this.getProperty( model.PROP.PARAMETER_DEFAULT_VALUE );
        const isRequiredProp = this.getProperty( model.PROP.PARAMETER_REQUIRED );
        const getConnectedParams = () => {
            return  model.getComponents( model.COMP_TYPE.WF_ACTIVITY_WF_PARAM, {
                properties: [ {
                    id: model.PROP.WORKFLOW_PARAM,
                    value: self.id
                } ]
           } );
        };
        // when a new workflow parameter is created, we need to look up all the activities that invokes the current workflow and add them a workflow-parameter component
        // and also when the "direction" changes, we have to go through all activities to see if we only need to update a property or actually create/remove the workflow-parameter
        if ( action === model.CALLBACK_ACTION.CREATED || _hasChanged( this.getProperty( model.PROP.API_DIRECTION ), action, property/* , oldValue */ ) ) {
            // look up all invokeWorkflow activities that references the current workflow
            model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, {
                properties: [ {
                    id: model.PROP.PAGE_PROCESS_TYPE,
                    value: PROCESS_TYPE.INVOKE_WF
                }, {
                    id: workflowPropId,
                    value: self.getParent().id
                } ]
            } ).forEach( activity => {
                let activityParameters = activity.getChilds( model.COMP_TYPE.WF_ACTIVITY_WF_PARAM );
                let activityParameter = activityParameters.filter( actParam => actParam.getPropertyValue( model.PROP.WORKFLOW_PARAM ) === self.id )[ 0 ];
                let waitForCompletion = activity.getPropertyValue( waitForCompletionPropId );
                // if it's creation action or the activity does not have the parameter yet, we add it
                if ( action === model.CALLBACK_ACTION.CREATED || !activityParameter ) {
                    // only add an "out" parameter, if the activity's "Wait for Completion" is enabled
                    if ( paramDirection !== "OUT" || ( paramDirection === "OUT" && waitForCompletion === "Y" ) ) {
                        addWorkflowParameterToComponent( self, activity );
                    }
                // if the activity has this parameter already
                } else if ( activityParameter ) {
                    if ( waitForCompletion === "N" && paramDirection === "OUT" ) {
                        activityParameter.remove();
                    } else {
                        updateWorkflowActivityParameter( self, activityParameter );
                    }
                }
            } );
        } else if ( _hasChanged( dataTypeProp, action, property, oldValue ) ) {
            getConnectedParams().forEach( param => param.getProperty( model.PROP.WORKFLOW_DATA_TYPE ).setValue( dataTypeProp.getValue(), { checkReadOnly: false } ) );
        } else if ( _hasChanged( defaultValueProp, action, property, oldValue ) && isRequiredProp?.getValue() === "Y" ) {
            getConnectedParams().forEach( param => {
                if ( param.getPropertyValue( model.PROP.PARAMETER_VALUE_TYPE ) === "NULL" ) {
                    _setPropertyValue( param, model.PROP.PARAMETER_VALUE_TYPE, "DEFAULT" );
                }
            } );
        }
    } // componentWorkflowParam

    function componentWorkflowActivityVariable( pAction /* , pProperty, pValue */ ) {
        let version = this.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
        if ( [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ].includes( pAction ) && version ) {
            toggleWorkflowComponents.call( this, version );
        }
    } // componentWorkflowActivityVariable

    function componentWorkflowVariable( pAction /* , pProperty, pValue */ ) {
        let version = this.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
        if ( [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ].includes( pAction ) && version ) {
            toggleWorkflowComponents.call( this, version );
        }
    } // componentWorkflowVariable

    function componentWorkflowBranch( pAction, pProperty, pValue ) {
        const OTHERWISE = "OTHERWISE";
        let otherBranches, version = this.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
        if ( [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ].includes( pAction ) && version ) {
            toggleWorkflowComponents.call( this, version );
        } else if ( pAction === model.CALLBACK_ACTION.VALIDATE ) {
            if ( pProperty.id === model.PROP.OPERATOR ) {
                otherBranches = this.getParent().getChilds( model.COMP_TYPE.WORKFLOW_BRANCH, {
                    properties: [ {
                        id: model.PROP.OPERATOR,
                        value: OTHERWISE
                    } ]
                } );
                if ( pValue === OTHERWISE && pProperty.getValue() !== OTHERWISE && otherBranches.length ) {
                    return { error: msg( "WF.ERROR_MAX_ONE_OTHERWISE" ) };
                }
                return {};
            } else if ( model.PROP.TO_WORKFLOW_ACTIVITY ===  pProperty.id ) {
                if ( pValue && pProperty.id === model.PROP.TO_WORKFLOW_ACTIVITY ) {
                    let comp = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, { id: pValue } );
                    if ( comp.length === 1 && comp[ 0 ].getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_WORKFLOW_START" ) {
                        return { error: msg( "WF.ERROR_START_AS_TARGET" ) };
                    }
                }
            }
        } else if ( pAction === model.CALLBACK_ACTION.REMOVED ) {
            if ( !this.isReadOnly() ) {
                this.getParent().getChilds( model.COMP_TYPE.WORKFLOW_BRANCH, {
                    properties: [ {
                        id: model.PROP.OPERATOR,
                        value: OTHERWISE
                    } ]
                } ).forEach( ( branch ) => {
                    let prop = branch.getProperty( model.PROP.OPERATOR );
                    prop.setValue( prop.getValue(), true );
                } );
            }
        }
    } // componentWorkflowBranch

    function componentWorkflowTransition( pAction, pProperty, pValue ) {
        const TYPE_NORMAL = "NORMAL",
            TYPE_ERROR = "ERROR",
            TYPE_TIMEOUT = "TIMEOUT";
        const TOGGLE_PROPS = [ model.PROP.FROM_WORKFLOW_ACTIVITY, model.PROP.TO_WORKFLOW_ACTIVITY, model.PROP.TRANSITION_TYPE ];
        let self = this, prop, transitions, version, state, comp;
        switch( pAction ) {
            case model.CALLBACK_ACTION.VALIDATE:
                if ( pProperty.id === model.PROP.TRANSITION_TYPE ) {
                    // there can be unlimited number of error transitions
                    if ( pValue === TYPE_ERROR || !self.getParent() ) {
                        return {};
                    }

                    transitions = self.getParent().getChilds( model.COMP_TYPE.WORKFLOW_TRANS, {
                        parentId: self.parentId,
                        properties: [ {
                            id: model.PROP.TRANSITION_TYPE,
                            value: TYPE_NORMAL
                        } ]
                    } );

                    if ( pValue === TYPE_NORMAL && transitions.length > 0 && self.id !== transitions[ 0 ].id ) {
                        return { error: msg( "WF.ERROR_MAX_ONE_NORMAL" ) };
                    }

                    transitions = self.getParent().getChilds( model.COMP_TYPE.WORKFLOW_TRANS, {
                        parentId: self.parentId,
                        properties: [ {
                            id: model.PROP.TRANSITION_TYPE,
                            value: TYPE_TIMEOUT
                        } ]
                    } );

                    if ( pValue === TYPE_TIMEOUT && transitions.length > 0 && self.id !== transitions[ 0 ].id ) {
                        return { error: msg( "WF.ERROR_MAX_ONE_TIMEOUT" ) };
                    }
                }

                if ( [ model.PROP.FROM_WORKFLOW_ACTIVITY, model.PROP.TO_WORKFLOW_ACTIVITY ].includes( pProperty.id ) ) {
                    if ( ( pProperty.id === model.PROP.FROM_WORKFLOW_ACTIVITY && pValue === self.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue() )
                        || ( pProperty.id === model.PROP.TO_WORKFLOW_ACTIVITY && pValue === self.getProperty( model.PROP.FROM_WORKFLOW_ACTIVITY ).getValue() ) ) {
                        return { error: msg( "WF.ERROR_SAME_FROM_TO" ) };
                    }

                    if ( pValue && pProperty.id === model.PROP.TO_WORKFLOW_ACTIVITY ) {
                        comp = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, { id: pValue } );
                        if ( comp.length === 1 && comp[ 0 ].getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() === "NATIVE_WORKFLOW_START" ) {
                            return { error: msg( "WF.ERROR_START_AS_TARGET" ) };
                        }
                    }
                }

                break;
            case model.CALLBACK_ACTION.CREATED:
                // re-set the value of the transition type in order to trigger a validation on the value
                prop = self.getProperty( model.PROP.TRANSITION_TYPE );
                prop.setValue( prop.getValue(), true );
                break;
            case model.CALLBACK_ACTION.REMOVED:
                if ( !self.isReadOnly() ) {
                    self.getParent().getChilds( model.COMP_TYPE.WORKFLOW_TRANS ).forEach( ( transition ) => {
                        if ( transition.id !== self.id ) {
                            prop = transition.getProperty( model.PROP.TRANSITION_TYPE );
                            if ( !prop.isReadOnly() ) {
                                prop.setValue( prop.getValue(), true );
                            }
                        }
                    } );
                }
                break;
            case model.CALLBACK_ACTION.CHANGED:
                // on change of "to" we re-set "from" - and the other way around too
                if ( [ model.PROP.FROM_WORKFLOW_ACTIVITY, model.PROP.TO_WORKFLOW_ACTIVITY ].includes( pProperty.id ) && pValue !== pProperty.getValue() ) {
                    prop = self.getProperty( ( pProperty.id === model.PROP.FROM_WORKFLOW_ACTIVITY ? model.PROP.TO_WORKFLOW_ACTIVITY : model.PROP.FROM_WORKFLOW_ACTIVITY ) );
                    if ( !prop.isReadOnly() ) {
                        prop.setValue( prop.getValue(), true );
                    }
                }
                break;
            case model.CALLBACK_ACTION.INIT:
            case model.CALLBACK_ACTION.PARENT_UPDATE:
                version = this.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
                if ( !version ) {
                    return;
                }
                state = version.getProperty( model.PROP.STATE ).getValue();
                if ( state === "INACTIVE") {
                    this.disable();
                } else if ( state === "ACTIVE") {
                    this.getProperties().forEach( ( prop ) => {
                        if ( TOGGLE_PROPS.includes( prop.id ) ) {
                            prop.disable();
                        } else if ( !prop.isReadOnly() ) {
                            prop.enable();
                        }
                    } );
                } else {
                    this.getProperties().forEach( ( prop ) => {
                        if ( TOGGLE_PROPS.includes( prop.id ) ) {
                            prop.enable();
                        }
                    } );
                    this.enable(); // enable everything
                }
        }
    } // componentWorkflowTransition

    function componentWorkflowActivity( pAction, pProperty, pOldValue ) {
        const SWITCH = "NATIVE_WORKFLOW_SWITCH",
            WF_START = "NATIVE_WORKFLOW_START",
            WF_END = "NATIVE_WORKFLOW_END",
            CREATE_TASK = "NATIVE_CREATE_TASK",
            WAIT = "NATIVE_WORKFLOW_WAIT",
            TASK_VAR_OUTCOME = "TASK_OUTCOME",
            TASK_VAR_APPROVAL = "APPROVER",
            NULL = "NULL",
            TIMEOUT = "TIMEOUT";
        let self = this,
            switchTypeProperty = model.getPluginProperty(  model.COMP_TYPE.PAGE_PROCESS ,SWITCH, 1 ).id,
            version, state, activityType, activities;
        const TOGGLE_PROPS = [
            model.PROP.PAGE_PROCESS_TYPE,
            model.PROP.WF_SOURCE_SQL_QUERY,
            model.PROP.STATIC_ID,
            model.PROP.DUE_ON_TYPE,
            model.PROP.DUE_ON_INTERVAL_VALUE,
            model.PROP.DUE_ON_SCHEDULER_VALUE,
            model.PROP.DUE_ON_QUERY_VALUE,
            switchTypeProperty ];
        const createTaskVariables = function() {
            let version = self.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
            let vars = version.getChilds( model.COMP_TYPE.WORKFLOW_VARIABLE );
            if ( !vars.filter( wfvar => wfvar.getProperty( model.PROP.WF_IDENTIFICATION_STATIC_ID ).getValue() === TASK_VAR_APPROVAL ).length ) {
                new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_VARIABLE,
                    parentId: version.id,
                    values: [ {
                        id: model.PROP.WF_IDENTIFICATION_STATIC_ID,
                        value: TASK_VAR_APPROVAL
                    }, {
                        id: model.PROP.ITEM_LABEL,
                        value: "Approver"
                    }, {
                        id: model.PROP.WORKFLOW_VALUE_TYPE,
                        value: NULL
                    } ]
                } );
            }
            if ( !vars.filter( wfvar => wfvar.getProperty( model.PROP.WF_IDENTIFICATION_STATIC_ID ).getValue() === TASK_VAR_OUTCOME ).length ) {
                new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_VARIABLE,
                    parentId: version.id,
                    values: [ {
                        id: model.PROP.WF_IDENTIFICATION_STATIC_ID,
                        value: TASK_VAR_OUTCOME
                    }, {
                        id: model.PROP.ITEM_LABEL,
                        value: "TaskOutcome"
                    }, {
                        id: model.PROP.WORKFLOW_VALUE_TYPE,
                        value: NULL
                    } ]
                } );
            }
        };
        const validateComponent = function( activityType ) {
            let errors = [];
            // each activity - except end - must have at least one incoming transition / branch
            if ( WF_END !== activityType ) {
                if( !self.getChilds( activityType === SWITCH ? model.COMP_TYPE.WORKFLOW_BRANCH : model.COMP_TYPE.WORKFLOW_TRANS )?.length ) {
                    errors.push( msg( "WF.ERROR_NO_OUTGOING_CONN" ) );
                }
            }
            // each activity - except start - must have at least one outgoing transition / branch
            if ( WF_START !== activityType ) {
                let isTarget = self.getParent()?.getChildrenUntil( model.COMP_TYPE.WORKFLOW_TRANS ).some( transition => transition.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue() === self.id );
                isTarget ||= self.getParent()?.getChildrenUntil( model.COMP_TYPE.WORKFLOW_BRANCH ).some( branch => branch.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).getValue() === self.id );
                if ( !isTarget ) {
                    errors.push( msg( "WF.ERROR_NO_INCOMING_CONN" ) );
                }
            }
            return errors;
        };

        switch( pAction ) {
            case model.CALLBACK_ACTION.CREATED:
                activityType = this.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                if ( activityType === CREATE_TASK ) {
                    createTaskVariables();
                }
                // dummy setValue call to trigger the component validation
                this.getProperty( model.PROP.NAME ).setValue( this.getProperty( model.PROP.NAME ).getValue(), true );
                break;
            case model.CALLBACK_ACTION.VALIDATE:
                if( pProperty.id === model.PROP.PAGE_PROCESS_TYPE ) {
                    // only one start activity allowed
                    activities = model.getComponents( model.COMP_TYPE.WORKFLOW_ACTIVITY, {
                        parentId: self.parentId,
                        properties: [ {
                            id: model.PROP.PAGE_PROCESS_TYPE,
                            value: WF_START
                        } ]
                    } );

                    if ( self.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue() !== pOldValue && pOldValue === WF_START && activities.length > 0 ) {
                        return { error: msg( "WF.ERROR_ONE_START" ) };
                    }

                }
                break;
            case model.CALLBACK_ACTION.CHANGED:
                activityType = self.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                // changing type from switch to something else, or changing the switch type property
                if ( ( pOldValue === SWITCH && _hasChanged( this.getProperty( model.PROP.PAGE_PROCESS_TYPE ), pAction, pProperty, pOldValue ) ) || _hasChanged( self.getProperty( switchTypeProperty ),  pAction, pProperty, pOldValue ) ) {
                    // remove every branch of the activity
                    _removeChildren( self, model.COMP_TYPE.WORKFLOW_BRANCH );
                // simple type change
                } else if ( _hasChanged( self.getProperty( model.PROP.PAGE_PROCESS_TYPE ), pAction, pProperty, pOldValue ) ) {
                    if ( [ SWITCH, WF_END ].includes( activityType ) ) {
                        // remove the transitions
                        _removeChildren( self, model.COMP_TYPE.WORKFLOW_TRANS );
                    } else if ( activityType === WAIT ) {
                        // remoe only the timeout connections
                        self.getChilds( model.COMP_TYPE.WORKFLOW_TRANS, {
                            properties: [ {
                                id: model.PROP.TRANSITION_TYPE,
                                value: TIMEOUT
                            } ]
                        } ).forEach( comp => comp.remove() );
                    } else {
                        self.getParent().getChilds( model.COMP_TYPE.WORKFLOW_ACTIVITY ).forEach( ( activity ) => {
                            activityType = activity.getProperty( model.PROP.PAGE_PROCESS_TYPE );
                            // reset the type to remove/show errors
                            if ( activityType.errors.length ) {
                                activityType.setValue( activityType.getValue(), true );
                            }

                            if ( activityType.getValue() === CREATE_TASK ) {
                                createTaskVariables();
                            }
                        } );
                    }
                // if the activity does not have "due-on-type" defined remove the "timeout" transitions
                } else if ( _hasChanged( self.getProperty( model.PROP.DUE_ON_TYPE ), pAction, pProperty, pOldValue ) ) {
                    if ( self.getProperty( model.PROP.DUE_ON_TYPE ).getValue() === "" ) {
                        self.getChilds( model.COMP_TYPE.WORKFLOW_TRANS, {
                            properties: [ {
                                id: model.PROP.TRANSITION_TYPE,
                                value: TIMEOUT
                            } ]
                        } ).forEach( comp => comp.remove() );
                    }
                }

                // re-set the incoming links' "to" property
                model.getComponentsAdvanced( [ {
                    typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                    filter: {
                        properties: [ {
                            id: model.PROP.TO_WORKFLOW_ACTIVITY,
                            value: self.id
                        } ]
                    }
                }, {
                    typeId: model.COMP_TYPE.WORKFLOW_BRANCH,
                    filter: {
                        properties: [ {
                            id: model.PROP.TO_WORKFLOW_ACTIVITY,
                            value: self.id
                        } ]
                    }
                } ] ).forEach( ( comp ) => {
                    let prop = comp.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY );
                    if ( !prop.isReadOnly() ) {
                        comp.getProperty( model.PROP.TO_WORKFLOW_ACTIVITY ).setValue( self.id, true );
                    }
                } );
                break;
            case model.CALLBACK_ACTION.VALIDATE_COMPONENT:
                activityType = this.getProperty( model.PROP.PAGE_PROCESS_TYPE ).getValue();
                return { error: validateComponent( activityType ) };
            case model.CALLBACK_ACTION.INIT:
            case model.CALLBACK_ACTION.PARENT_UPDATE:
                version = this.getParent( model.COMP_TYPE.WORKFLOW_VERSION );
                if ( !version ) {
                    return;
                }
                state = version.getProperty( model.PROP.STATE ).getValue();
                if ( state === "ACTIVE" ) {
                    this.getProperties().forEach( prop => {
                        if ( TOGGLE_PROPS.includes( prop.id ) ) {
                            prop.disable();
                        }
                    } );
                    this.enable();
                } else if ( state === "DEVELOPMENT" ) {
                    this.getProperties().forEach( prop => {
                        if ( TOGGLE_PROPS.includes( prop.id ) ) {
                            prop.enable();
                        }
                    } );
                } else if ( state === "INACTIVE") {
                    this.disable();
                }
        }
    } // componentWorkflowActivity

    function componentWorkflowVersion( action, property, newValue ) {
        const STATE_DEV = "DEVELOPMENT",
            STATE_ACTIVE = "ACTIVE",
            STATE_INACTIVE = "INACTIVE",
            WF_START = "NATIVE_WORKFLOW_START",
            WF_END = "NATIVE_WORKFLOW_END";
        const SOURCE_PROPS = [
            model.PROP.WF_SOURCE_QUERY_TYPE,
            model.PROP.WF_SOURCE_QUERY_OWNER,
            model.PROP.COLUMN_MAPPING_PK_COLUMN,
            model.PROP.WF_SOURCE_QUERY_TABLE,
            model.PROP.WF_SOURCE_SQL_QUERY
        ];
        let self = this, errors = [], start, middle, end;

        const toggleWorkflowVersionProps = function() {
            // enable/disable properties based on the stat value
            let state = self.getProperty( model.PROP.STATE ).getValue();
            // everything disabled
            if ( state === STATE_INACTIVE ) {
                self.disable();
                self.getAllChildren().forEach( component => component.disable() );
            } else if ( state === STATE_ACTIVE ) {
                // only the source properties disabled, everything else enabled
                SOURCE_PROPS.forEach( prop => self.getProperty( prop )?.disable() );
            }
        };

        switch( action ) {
            case model.CALLBACK_ACTION.VALIDATE_COMPONENT:
                // there must be exactly one start activity
                start = this.getChilds( pe.COMP_TYPE.WORKFLOW_ACTIVITY, {
                    properties: [ {
                        id: pe.PROP.PAGE_PROCESS_TYPE,
                        value: WF_START
                    } ]
                } );

                if ( start.length !== 1 ) {
                    errors.push( msg( "WF.ERROR_ONE_START" ) );
                }

                // there must be at least one end activity
                end = this.getChilds( pe.COMP_TYPE.WORKFLOW_ACTIVITY, {
                    properties: [ {
                        id: pe.PROP.PAGE_PROCESS_TYPE,
                        value: WF_END
                    } ]
                } );

                if ( end.length < 1 ) {
                    errors.push( msg( "WF.ERROR_NO_END" ) );
                }

                return { error: errors };
            case model.CALLBACK_ACTION.VALIDATE:
                // only one version can be in development
                if ( property?.id === model.PROP.STATE ) {
                    let comps = model.getComponents( self.typeId, {
                        parentId: self.parentId,
                        properties: [ {
                            id: model.PROP.STATE,
                            value: STATE_DEV
                        } ]
                    } );
                    if ( comps.length && property.getValue() !== "DEVELOPMENT" && newValue === STATE_DEV ) {
                        return { error: msg( "WF.ERROR_DUP_DEV" ) };
                    }
                } else if ( property.id === model.PROP.WF_SOURCE_QUERY_TYPE ) {
                    sourceLocationHandling( action, self, property, newValue );
                }
                break;
            case model.CALLBACK_ACTION.CHANGED:
                if ( property.id === model.PROP.STATE ) {
                    // there can be only one active version at the time, setting one to active must deactivate other(s)
                    if ( newValue === STATE_DEV && property.getValue() === STATE_ACTIVE ) {
                        model.getComponents( self.typeId, {
                            parentId: self.parentId,
                            properties: [ {
                                id: model.PROP.STATE,
                                value: STATE_ACTIVE
                            } ]
                        } ).forEach( ( component ) => {
                            if ( component.id === self.id ) {
                                return;
                            }
                            component.getProperty( model.PROP.STATE ).setValue( STATE_INACTIVE );
                        } );

                        // reassign the state value of versions in development, to remove the error message ( in case there's any )
                        model.getComponents( self.typeId, {
                            parentId: self.parentId,
                            properties: [ {
                                id: model.PROP.STATE,
                                value: STATE_DEV
                            } ]
                        } ).forEach( ( component ) => {
                            if ( component.id === self.id ) {
                                return;
                            }
                            component.getProperty( model.PROP.STATE ).setValue( STATE_DEV );
                        } );

                    }
                    // on state version change always update the compnent properties availability
                    toggleWorkflowVersionProps();
                } else if ( property.id === model.PROP.WF_SOURCE_QUERY_TYPE ) {
                    sourceLocationHandling( action, self, property, newValue );
                }
                break;
            case model.CALLBACK_ACTION.CREATED:
                // when a version is created, we immediately create three activities ( type: start, default, end )
                start = new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                    parentId: self.id,
                    values: [ {
                        id: model.PROP.PAGE_PROCESS_TYPE,
                        value: WF_START
                    }, {
                        id: model.PROP.NAME,
                        value: msg( "WF.START_ACT" )
                    }, {
                        id: model.PROP.DISPLAY_SEQUENCE,
                        value: 10
                    } ]
                } );
               middle = new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                    parentId: self.id,
                    previousComponent: start,
                    values: [ {
                        id: model.PROP.DISPLAY_SEQUENCE,
                        value: 20
                    }, {
                        id: model.PROP.NAME,
                        value: msg( "WF.ACT" )
                    } ]
                } );
                end = new model.Component( {
                    previousComponent: middle,
                    typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY,
                    parentId: self.id,
                    values: [ {
                        id: model.PROP.PAGE_PROCESS_TYPE,
                        value: WF_END
                    }, {
                        id: model.PROP.NAME,
                        value: msg( "WF.END_ACT" )
                    }, {
                        id: model.PROP.DISPLAY_SEQUENCE,
                        value: 30
                    } ]
                } );

                // create links between the activities: start -> middle -> end
                new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                    parentId: start.id,
                    previousComponent: start,
                    values: [ {
                        id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                        value: start.id
                    }, {
                        id: model.PROP.TO_WORKFLOW_ACTIVITY,
                        value: middle.id
                    } ]
                } );
                new model.Component( {
                    typeId: model.COMP_TYPE.WORKFLOW_TRANS,
                    parentId: middle.id,
                    previousComponent: middle,
                    values: [ {
                        id: model.PROP.FROM_WORKFLOW_ACTIVITY,
                        value: middle.id
                    }, {
                        id: model.PROP.TO_WORKFLOW_ACTIVITY,
                        value: end.id
                    } ]
                } );

                break;
            case model.CALLBACK_ACTION.REMOVED:
                // re-set the state value of all other version components to trigger the validation ( so the error added / cleared )
                model.getComponents( self.typeId, {
                    parentId: self.parentId,
                    properties: [ {
                        id: model.PROP.STATE,
                        value: STATE_DEV
                    } ]
                } ).forEach( ( component ) => {
                    let prop = component.getProperty( model.PROP.STATE );
                    prop.setValue( prop.getValue() );
                } );
                break;
            case model.CALLBACK_ACTION.INIT:
                toggleWorkflowVersionProps.call( this );

        }
    } // componentWorkflowVersion

    function componentWorkflow( action/* , property, newValue */ ) {
        let self = this;
        if ( action === model.CALLBACK_ACTION.CREATED ) {
            new model.Component( {
                typeId: model.COMP_TYPE.WORKFLOW_VERSION,
                parentId: self.id
            } );
        }
    } // componentWorkflow

    $( document ).on( "modelConfigLoaded", function() {

        const REGION_PLUGINS = model.getComponentType( model.COMP_TYPE.REGION ).pluginType.plugins;
        let name;

        // Some component types have to execute additional code if they are created/modified/deleted
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE,                     page );
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE_ITEM,                pageItem );
        model.setComponentTypeCallback( model.COMP_TYPE.FACET,                    facet );
        model.setComponentTypeCallback( model.COMP_TYPE.FACET_GROUP,              facetGroup );
        model.setComponentTypeCallback( model.COMP_TYPE.FACET_GROUP_ITEM,         facet );
        model.setComponentTypeCallback( model.COMP_TYPE.SFILTER,                  sFilter );
        model.setComponentTypeCallback( model.COMP_TYPE.SFILTER_GROUP,            sFilterGroup );
        model.setComponentTypeCallback( model.COMP_TYPE.SFILTER_GROUP_ITEM,       sFilter );
        model.setComponentTypeCallback( model.COMP_TYPE.BUTTON,                   button );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION,                   region );
        model.setComponentTypeCallback( model.COMP_TYPE.DA_EVENT,                 dynamicActionEvent );
        model.setComponentTypeCallback( model.COMP_TYPE.DA_ACTION,                dynamicActionAction );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION_PLUGIN_ATTR,       regionPluginAttr );
        model.setComponentTypeCallback( model.COMP_TYPE.CARD,                     cardAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.JET_CHART,                jetChartAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.JET_CHART_SERIES,         jetChartSeries );
        model.setComponentTypeCallback( model.COMP_TYPE.JET_CHART_AXES,           jetChartAxes );
        model.setComponentTypeCallback( model.COMP_TYPE.CLASSIC_REPORT,           classicRptTabularFormAttr );
        model.setComponentTypeCallback( model.COMP_TYPE.CLASSIC_RPT_COLUMN,       classicReportColumn );
        model.setComponentTypeCallback( model.COMP_TYPE.TABULAR_FORM,             classicRptTabularFormAttr );
        model.setComponentTypeCallback( model.COMP_TYPE.TAB_FORM_COLUMN,          tabularFormColumn );
        model.setComponentTypeCallback( model.COMP_TYPE.IG_ATTRIBUTES,            interactiveGridAttr );
        model.setComponentTypeCallback( model.COMP_TYPE.IG_COLUMN,                interactiveGridColumn );
        model.setComponentTypeCallback( model.COMP_TYPE.IR_ATTRIBUTES,            interactiveReportAttr );
        model.setComponentTypeCallback( model.COMP_TYPE.IR_PRINT_ATTR,            printAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.IR_COLUMN,                irColumn );
        model.setComponentTypeCallback( model.COMP_TYPE.CLASSIC_RPT_PRINT,        printAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.TAB_FORM_PRINT,           printAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.IG_PRINT,                 printAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.MAP_REGION,               mapRegionAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.MAP_LAYER,                mapLayerAttributes );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION_WS_PARAM,          componentRestParam );
        model.setComponentTypeCallback( model.COMP_TYPE.JET_CHART_WS_PARAM,       componentRestParam );
        model.setComponentTypeCallback( model.COMP_TYPE.MAP_LAYER_WS_PARAM,       componentRestParam );
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE_PROC_WS_PARAM,       componentRestParam );
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE_PROC_API_PARAM,      processInvokeApiParam );
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE_PROCESS,             pageProcess );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION_ACTION,            componentAction );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION_ACTION_MENU_ENTRY, componentMenuEntry );
        model.setComponentTypeCallback( model.COMP_TYPE.IR_COLUMN_ACTION,         componentAction );
        model.setComponentTypeCallback( model.COMP_TYPE.IR_COL_ACTION_MENU_ENTRY, componentMenuEntry );
        model.setComponentTypeCallback( model.COMP_TYPE.WF_ACTIVITY_WS_PARAM,     componentRestParam );
        model.setComponentTypeCallback( model.COMP_TYPE.WF_ACTIVITY_API_PARAM,    processInvokeApiParam );
        model.setComponentTypeCallback( model.COMP_TYPE.WF_ACTIVITY_WF_PARAM,     processWorkflowActivityParam );
        model.setComponentTypeCallback( model.COMP_TYPE.PAGE_PROCESS_WF_PARAM,    processWorkflowActivityParam );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_BRANCH,          componentWorkflowBranch,
            [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT, model.CALLBACK_ACTION.PARENT_UPDATE ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_TRANS,           componentWorkflowTransition,
            [ model.CALLBACK_ACTION.VALIDATE_COMPONENT, model.CALLBACK_ACTION.INIT, model.CALLBACK_ACTION.PARENT_UPDATE ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_ACT_VAR,        componentWorkflowActivityVariable,
            [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY,        componentWorkflowActivity,
            [ model.CALLBACK_ACTION.VALIDATE_COMPONENT, model.CALLBACK_ACTION.INIT, model.CALLBACK_ACTION.PARENT_UPDATE ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_PARAM,        componentWorkflowParam,
            [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_VARIABLE,        componentWorkflowVariable,
            [ model.CALLBACK_ACTION.PARENT_UPDATE, model.CALLBACK_ACTION.INIT ] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW_VERSION,         componentWorkflowVersion,
            [ model.CALLBACK_ACTION.VALIDATE_COMPONENT, model.CALLBACK_ACTION.INIT] );
        model.setComponentTypeCallback( model.COMP_TYPE.WORKFLOW, componentWorkflow );
        model.setComponentTypeCallback( model.COMP_TYPE.REGION_TMPL_COLUMN, regionTemplateComponentColumn );

        // Register a default handling for region types which use columns
        for ( name in REGION_PLUGINS ) {
            if ( hasOwnProperty( REGION_PLUGINS, name ) && $.inArray( "COLUMNS", REGION_PLUGINS[ name ].features ) !== -1 ) {
                model.setPluginCallback( model.COMP_TYPE.REGION, name, regionPluginWithColumns );
            }
        }

        // Register a default handling for template component region plug-ins
        for ( name in REGION_PLUGINS ) {
            if ( hasOwnProperty( REGION_PLUGINS, name ) && /^(TMPL)/.test( name )) {
                model.setPluginCallback( model.COMP_TYPE.REGION, name, templateComponentRegionPlugin );
            }
        }

        // Some plug-ins need extra handling if the region type or source property gets changed
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_CARDS",                cardPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, REGION_TYPE.IG,                interactiveGridPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_IR",                   interactiveReportPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_SQL_REPORT",           classicReportPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_TABFORM",              tabularFormPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_JET_CHART",            jetChartPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_MAP_REGION",           mapRegionPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_CALENDAR",             legacyCalendarPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, REGION_TYPE.FORM,              formPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, "NATIVE_SEARCH_REGION",        searchRegionPlugin );
        model.setPluginCallback( model.COMP_TYPE.REGION, REGION_TYPE.FACETED_SEARCH,    facetedSearchOrSmartFilters );
        model.setPluginCallback( model.COMP_TYPE.REGION, REGION_TYPE.SMART_FILTERS,     facetedSearchOrSmartFilters );

        model.setPluginCallback( model.COMP_TYPE.DA_ACTION, "NATIVE_SET_VALUE",         setValuePlugin );

        // Some plug-ins need extra handling if the item type gets changed
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.RICH_TEXT_EDITOR, nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.TEXTAREA,         nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.SHUTTLE,          nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.MARKDOWN_EDITOR,  nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.FILE,             nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.IMAGE_UPLOAD,     nativeItemPlugins );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.COMBOBOX,         comboboxPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.POPUP_LOV,        popupLovPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_ITEM, ITEM_TYPE.SELECT_LIST,      selectListPlugin );

        // Some plug-ins need extra handling if the smart filter type gets changed
        model.setPluginCallback( model.COMP_TYPE.SFILTER,   ITEM_TYPE.INPUT,            inputPlugin );
        model.setPluginCallback( model.COMP_TYPE.SFILTER,   ITEM_TYPE.RANGE,            rangePlugin );
        model.setPluginCallback( model.COMP_TYPE.SFILTER,   ITEM_TYPE.RADIOGROUP,       radioGroupFilterPlugin );

        // Some plug-ins need extra handling if the facet type gets changed
        model.setPluginCallback( model.COMP_TYPE.FACET,     ITEM_TYPE.INPUT,            inputPlugin );
        model.setPluginCallback( model.COMP_TYPE.FACET,     ITEM_TYPE.RANGE,            rangePlugin );
        model.setPluginCallback( model.COMP_TYPE.FACET,     ITEM_TYPE.RADIOGROUP,       radioGroupFilterPlugin );

        // Some plug-ins need extra handling if the process type gets changed
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_WEB_SERVICE",         webServiceProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_WEB_SERVICE_LEGACY",  webServiceProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_PLSQL",               plsqlProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_SEND_EMAIL",          sendEmailProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, "NATIVE_CREATE_TASK",         createTaskProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.INVOKE_API,      invokeApiPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.EXECUTION_CHAIN, executionChainPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.DOWNLOAD,        downloadProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.PRINT_REPORT,    printReportProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.PAGE_PROCESS, PROCESS_TYPE.WORKFLOW,        workflowProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY, "NATIVE_CREATE_TASK",    createTaskProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_API, invokeApiPlugin );
        model.setPluginCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY, "NATIVE_SEND_EMAIL",     sendEmailProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY, "NATIVE_PLSQL",          plsqlProcessPlugin );
        model.setPluginCallback( model.COMP_TYPE.WORKFLOW_ACTIVITY, PROCESS_TYPE.INVOKE_WF,  invokeWorkflowProcessPlugin );

    } );

    $( document ).on( "modelReady modelSaved", function() {
        const COMPONENTS = [ {
            typeId: model.COMP_TYPE.WORKFLOW_VERSION
        }, {
            typeId: model.COMP_TYPE.WORKFLOW_VARIABLE
        }, {
            typeId: model.COMP_TYPE.WORKFLOW_ACTIVITY
        }, {
            typeId: model.COMP_TYPE.WORKFLOW_ACT_VAR
        }, {
            typeId: model.COMP_TYPE.WORKFLOW_PARAM
        }, {
            typeId: model.COMP_TYPE.WORKFLOW_TRANS
        } ];
        model.getComponentsAdvanced( COMPONENTS ).forEach( component => {
            component._callComponentTypeCallback( { action: model.CALLBACK_ACTION.INIT } );
        } );

    } );

} )( window.pe, apex.jQuery, apex.util, apex.locale, apex.lang, window.pageDesigner, apex.date );
