/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */
( function ( util, apexRegion, widget, lang, server, apexItem, message, debug, $ ) {
    "use strict";

    /**
     * Initialization function for client side templator region ( template based reports such as cards )
     * Expected markup:
     * <div id="{regionStaticId}">...
     *   <div id="{regionStaticId}_tmv"></div>
     *   ...
     * </div>
     *
     * @ignore
     * @param {object} pOptions Required options object.
     * @param {string} pOptions.regionId
     * @param {string} pOptions.regionStaticId
     * @param {object} pOptions.source
     * @param {string} pOptions.source.type Either "SERVER" or "CLIENT"
     * @param {string} pOptions.source.ajaxIdentifier
     * @param {string|string[]} pOptions.source.itemsToSubmit
     * @param {array} pOptions.source.restEndpointURLs
     * @param {string} pOptions.source.httpMethod Either "GET" or "POST"
     * @param {object} pOptions.source.requestData
     * @param {object} pOptions.source.requestHeaders
     * @param {string} pOptions.source.arraySelector
     * @param {string} pOptions.beforeTemplate
     * @param {string} pOptions.recordTemplate
     * @param {string} pOptions.afterTemplate
     * @param {string} pOptions.pagination Either "SCROLL" or "PAGE"
     * @param {number} pOptions.rowsPerPage
     * @param {string} pOptions.noDataMessage
     * @param {boolean} pOptions.enableCache
     * @param {string} pOptions.searchItem
     * @param {boolean} pOptions.showErrors
     */
    widget.clientSideTemplator = function ( pOptions ) {
        const REGION_TYPE = "ClientSideTemplator",
              SOURCE_TYPE_SERVER = "SERVER",
              SOURCE_TYPE_CLIENT = "CLIENT",
              HTTP_METHOD_GET = "GET",
              HTTP_METHOD_POST = "POST",
              PAGINATION_SCROLL = "SCROLL",
              PAGINATION_PAGE = "PAGE",
              MAX_PAGE_SIZE = 1000,
              EVENT_AJAX_RESPONSE = "apexclientsidetemplatorresponse",
              EVENT_AJAX_ERROR = "apexclientsidetemplatorajaxerror";

        let defaultOptions = {
            regionId: "",
            regionStaticId: "",
            source: {
                type: SOURCE_TYPE_CLIENT,
                ajaxIdentifier: "",
                itemsToSubmit: [],
                restEndpointURLs: [""],
                httpMethod: HTTP_METHOD_GET,
                requestData: {},
                requestHeaders: {},
                arraySelector: ""
            },
            beforeTemplate: "",
            recordTemplate: "",
            afterTemplate: "",
            pagination: PAGINATION_SCROLL,
            rowsPerPage: 20,
            noDataMessage: lang.getMessage( "APEX.IG.NO_DATA_FOUND" ),
            enableCache: false,
            searchItem: "",
            showErrors: true
        };

        let options = $.extend( defaultOptions, pOptions ),
            region$ = $( "#" + util.escapeCSS( options.regionStaticId ), apex.gPageContext$ ),
            modelName = REGION_TYPE + "_" + options.regionId,
            templateNamePrefix = REGION_TYPE.toUpperCase() + "_" + options.regionId.toUpperCase(),
            trrOptions = {},
            searchItem$,
            searchItemValue = "",
            optionsSource = options.source, // options.source is used many times, therefore a own variable to reduce minified file size
            responseCache;

        // requestData & requestHeaders should be native JS objects, apex_javascript.add_attribute doesn't support objects
        if ( optionsSource.httpMethod === HTTP_METHOD_POST ) {
            if ( optionsSource.requestData && !isObject( optionsSource.requestData ) ) {
                optionsSource.requestData = JSON.parse( optionsSource.requestData );
            }
            if ( optionsSource.requestHeaders && !isObject( optionsSource.requestHeaders ) ) {
                optionsSource.requestHeaders = JSON.parse( optionsSource.requestHeaders );
            }
        }

        // init searchItemValue
        if ( options.searchItem ) {
            searchItemValue = apexItem( options.searchItem ).getValue();
        }

        debug.info( REGION_TYPE + " options: ", options );

        /**
         * Check if a given object or variable is a function
         * @function isFunction
         * @param {object} pFunction function
         * @return {boolean}
         */
        function isFunction( pFunction ) {
            return pFunction instanceof Function;
        }

        /**
         * Check if a given object or variable is a object
         * @function isObject
         * @param {object} pObject object
         * @return {boolean}
         */
        function isObject( pObject ) {
            return pObject instanceof Object;
        }

        /**
         * Save data to cache location
         * @function setCacheData
         * @param {object} pData data object
         */
        function setCacheData( pData ) {
            responseCache = JSON.parse( JSON.stringify( pData ) ); // clone object
        }

        /**
         * Get data from cache location
         * @function getCacheData
         * @return {object} data object
         */
        function getCacheData() {
            return responseCache;
        }

        /**
         * Fetch data either from DB server or if specified by a client side fetch to a REST endpoint
         * @function fetchData
         * @return {Promise<object>} data as jQuery Deferred promise
         */
        function fetchData() {
            let deferred = $.Deferred(),
                requestData = optionsSource.httpMethod === HTTP_METHOD_POST ? optionsSource.requestData : null,
                requestHeaders = optionsSource.httpMethod === HTTP_METHOD_POST ? optionsSource.requestHeaders : {},
                restEndpointURLs = optionsSource.restEndpointURLs || [],
                allData = {},
                errorResponse,
                scope = options.regionStaticId + "_fetch_data",
                spinner$;

            // needed because Object.assign or $.extend are replacing object attributes/keys with the same name
            function _mergeObject( pTarget, pSource ) {
                if ( !isObject( pTarget ) || !isObject( pSource ) ) {
                    return pSource;
                }

                Object.keys( pSource ).forEach( ( key ) => {
                    const targetValue = pTarget[key];
                    const sourceValue = pSource[key];

                    if ( Array.isArray( targetValue ) && Array.isArray( sourceValue ) ) {
                        pTarget[key] = targetValue.concat( sourceValue );
                    } else if ( isObject( targetValue ) && isObject( sourceValue ) ) {
                        pTarget[key] = _mergeObject( Object.assign( {}, targetValue ), sourceValue );
                    } else {
                        pTarget[key] = sourceValue;
                    }
                } );

                return pTarget;
            }

            async function _clientSideFetch() {

                async function _fetchData( pURL ) {
                    const response = await Promise.all( [
                        await fetch( pURL, {
                            method: optionsSource.httpMethod,
                            mode: "cors",
                            credentials: "omit",
                            cache: "no-store",
                            redirect: "follow",
                            referrerPolicy: "no-referrer",
                            body: requestData,
                            headers: requestHeaders
                        } )
                            .then( ( response ) => {
                                if ( response.ok ) {
                                    return response.json();
                                } else {
                                    errorResponse = {
                                        type: SOURCE_TYPE_CLIENT,
                                        url: pURL,
                                        jqxhr: null,
                                        textStatus: response.status,
                                        errorThrown: response.statusText
                                    };
                                }
                            } )
                            .catch( () => {
                                errorResponse = {
                                    type: SOURCE_TYPE_CLIENT,
                                    url: pURL,
                                    jqxhr: null,
                                    textStatus: "failed",
                                    errorThrown: "Connection refused"
                                };
                            } )
                    ] );

                    if ( errorResponse ) {
                        return Promise.reject( errorResponse );
                    }

                    return Promise.resolve( response );
                }

                if ( options.enableCache ) {
                    let cachedData = getCacheData();
                    if ( cachedData ) {
                        return Promise.resolve( cachedData );
                    }
                }

                util.delayLinger.start( scope, function() {
                    spinner$ = util.showSpinner( region$ );
                } );

                // if multiple endpoint URLs are configured, merge data to one big object
                for ( let i = 0; i < restEndpointURLs.length; i++ ) {
                    let [data] = ( await _fetchData( restEndpointURLs[i] ) ) || {};
                    _mergeObject( allData, data );
                }

                util.delayLinger.finish( scope, function() {
                    spinner$.remove();
                } );

                if ( options.enableCache ) {
                    setCacheData( allData );
                }
                return Promise.resolve( allData );
            }

            // server/db side fetch of data
            if ( optionsSource.type === SOURCE_TYPE_SERVER ) {
                server
                    .plugin(
                        optionsSource.ajaxIdentifier,
                        {
                            pageItems: optionsSource.itemsToSubmit
                        },
                        {
                            refreshObject: region$,
                            loadingIndicator: region$
                        }
                    )
                    .done( function ( data ) {
                        deferred.resolve( data );
                    } )
                    .fail( function ( jqXHR, textStatus, errorThrown ) {
                        deferred.reject( {
                            type: SOURCE_TYPE_SERVER,
                            jqxhr: jqXHR,
                            textStatus: textStatus,
                            errorThrown: errorThrown
                        } );
                    } );
            // client side fetch of data
            } else if ( optionsSource.type === SOURCE_TYPE_CLIENT ) {
                _clientSideFetch().then( ( data ) => deferred.resolve( data ) ).catch( ( error ) => deferred.reject( error ) );
            }

            return deferred.promise();
        }

        /**
         * Refresh data either from DB server or if specified by a client side fetch to a REST endpoint
         * @function refreshData
         * @return {Promise<object>} region data (prepared for apex.model) as jQuery Deferred promise
         */
        function refreshData() {
            let deferred = $.Deferred();

            fetchData()
                .done( function ( data ) {
                    let jsonData = prepareData( data ),
                        modelData = [];

                    debug.info( REGION_TYPE + " request success", jsonData );
                    region$.trigger( EVENT_AJAX_RESPONSE, jsonData );

                    modelData = prepareModelData( jsonData );

                    deferred.resolve( prepareRegionData( modelData ) );
                } )
                .fail( function ( error ) {
                    debug.error( REGION_TYPE + " request failed", error );
                    handleAJAXError( error );
                    deferred.reject( error );
                } );

            return deferred.promise();
        }

        /**
         * Handle client side AJAX / fetch error of web service request
         * @function handleAJAXError
         * @param {object} pError error object
         */
        function handleAJAXError( pError ) {
            let error = pError || {},
                errorMsg = "";

            region$.trigger( EVENT_AJAX_ERROR, pError );

            if ( error.type === SOURCE_TYPE_CLIENT ) {
                errorMsg = error.errorThrown || error.textStatus;

                if ( !errorMsg || errorMsg === "error" ) {
                    errorMsg = lang.hasMessage( "REGION.CLIENTSIDETEMPLATOR.ERROR" ) ? lang.getMessage( "REGION.CLIENTSIDETEMPLATOR.ERROR" ) : "Web Service Request failed.";
                }

                if ( options.showErrors ) {
                    message.clearErrors();
                    message.showErrors( {
                        message: errorMsg,
                        location: "page"
                    } );
                }
            }
        }

        /**
         * Build the field definition for apex.model dynamically based on a row from the data set
         * @function buildModelFields
         * @param {object} pDataRow row from the data result set
         * @return {object} data as jQuery Deferred promise
         *
         * @example <caption>Example return</caption>
         *
         * {
         *     APEX_MODEL_ROW_ID: {
         *         index: 0
         *     },
         *     COL1: {
         *         index: 1
         *     },
         *     COL2: {
         *         index: 2
         *     },
         *     COL3: {
         *         index: 3
         *     }
         * }
         */
        function buildModelFields( pDataRow ) {
            let fields = {},
                keys = Object.keys( pDataRow || {} ),
                key;

            if ( pDataRow && keys.length > 0 ) {
                for ( let i = 0; i < keys.length; i++ ) {
                    key = keys[i].toUpperCase();

                    fields[key] = {};
                    fields[key].index = i;
                }
            } else {
                fields.APEX_MODEL_ROW_ID = {
                    index: 0
                };
            }
            return fields;
        }

        /**
         * Prepare the data object returned by the server and return just the data part with some modifications
         * @function prepareData
         * @param {object} pData data object
         * @return {array} prepared data
         */
        function prepareData( pData ) {
            let data = [];

            if ( pData ) {
                if ( optionsSource.type === SOURCE_TYPE_CLIENT && optionsSource.arraySelector && pData[optionsSource.arraySelector] ) {
                    data = pData[optionsSource.arraySelector];
                } else {
                    data = pData;
                }

                if ( !Array.isArray( data ) ) {
                    return [];
                }

                for ( let i = 0; i < data.length; i++ ) {
                    // handle custom prepareRowData function provided by JS init code
                    if ( options.prepareRowData && isFunction( options.prepareRowData ) ) {
                        data[i] = options.prepareRowData( data[i] );
                    }
                    // add apex.model identity column as first attribute to row data
                    data[i] = Object.assign( { apex_model_row_id: "id" + i }, data[i] );
                }

                // handle custom filterData function provided by JS init code
                if ( options.filterData && isFunction( options.filterData ) ) {
                    data = options.filterData( data );
                }

                // handle custom sortData function provided by JS init code
                if ( options.sortData && isFunction( options.sortData ) ) {
                    data = data.sort( options.sortData );
                }
            }
            return data;
        }

        /**
         * Prepare the data array to be in the right format for apex.model
         * @function prepareModelData
         * @param {array} pData data array
         * @return {object} prepared model data
         *
         * @example <caption>Example return</caption>
         *
         * {
         *     values: [["id0", "xxx", "yyy", "zzz"], ["id1", "xxx", "yyy", "zzz"]],
         *     firstRow: 1,
         *     moreData: false,
         *     totalRows: 2
         * }
         */
        function prepareModelData( pData ) {
            let data = [],
                modelData = {
                    values: [],
                    firstRow: 1,
                    moreData: false,
                    totalRows: 0
                };

            if ( pData && Array.isArray( pData ) ) {
                // build array of arrays
                for ( let i = 0; i < pData.length; i++ ) {
                    let row = [];

                    Object.values( pData[i] ).forEach( value => {
                        row.push( ( value || "" ).toString() );
                    } );
                    data.push( row );
                }

                if ( optionsSource.type === SOURCE_TYPE_CLIENT && options.searchItem && searchItemValue.length > 0 ) {
                    // handle custom searchItemFilter function provided by JS init code, otherwise filter the first 2 columns by default
                    if ( options.searchItemFilter && isFunction( options.searchItemFilter ) ) {
                        data = options.searchItemFilter( data, buildModelFields( pData[0] ), searchItemValue );
                    } else {
                        data = data.filter( function ( item ) {
                            return item[1].toLowerCase().includes( searchItemValue.toLowerCase() ) || item[2].toLowerCase().includes( searchItemValue.toLowerCase() );
                        } );
                    }
                }

                modelData.values = data;
                modelData.totalRows = data.length;
            }
            return modelData;
        }

        /**
         * Prepare the model data object to be in the right format for AJAX based region refreshes
         * @function prepareRegionData
         * @param {object} pModelData model data object
         * @return {object} prepared region data
         *
         * @example <caption>Example return</caption>
         *
         * {
         *     regions: [
         *         {
         *             id: "4090112546548705",
         *             fetchedData: {
         *                 values: [["id0", "xxx", "yyy", "zzz"], ["id1", "xxx", "yyy", "zzz"]],
         *                 firstRow: 1,
         *                 moreData: false,
         *                 totalRows: 2
         *             }
         *         }
         *     ]
         * }
         */
        function prepareRegionData( pModelData ) {
            let modelData = pModelData || {},
                regionData = {
                    regions: [
                        {
                            id: options.regionId,
                            ajaxIdentifier: options.ajaxIdentifier,
                            fetchedData: modelData
                        }
                    ]
                };
            return regionData;
        }

        /**
         * Build template arguments (for apex.util.defineTemplate) based on row data of the data set
         * @function buildTemplateArgs
         * @param {object} pDataRow row data
         * @return {array} template arguments array
         *
         * @example <caption>Example return</caption>
         *
         * [
         *     {
         *         name: "APEX_MODEL_ROW_ID",
         *         required: false,
         *         default: "",
         *         escape: "HTML"
         *     },
         *     {
         *         name: "COL1",
         *         required: false,
         *         default: "",
         *         escape: "HTML"
         *     },
         *     {
         *         name: "COL2",
         *         required: false,
         *         default: "",
         *         escape: "HTML"
         *     }
         * ]
         */
        function buildTemplateArgs( pDataRow ) {
            let templateArgs = [],
                keys,
                key;

            if ( pDataRow ) {
                keys = Object.keys( pDataRow );

                for ( let i = 0; i < keys.length; i++ ) {
                    key = keys[i].toUpperCase();

                    templateArgs.push( {
                        name: key,
                        required: false,
                        default: "",
                        escape: "HTML"
                    } );
                }
            }
            return templateArgs;
        }

        /**
         * Build the template directive syntax for a named template (which adds placeholders based on row data and the apply directive)
         * @function buildTemplateDirective
         * @param {object} pDataRow row data
         * @param {string} pTemplateName template name
         * @return {string} template directive string
         *
         * @example <caption>Example return</caption>
         *
         * {with/}
         * REGION_ID:=123456
         * REGION_STATIC_ID:=my_region
         * APEX_MODEL_ROW_ID:=&APEX_MODEL_ROW_ID.
         * COL1:=&COL1.
         * COL2:=&COL2.
         * COL3:=&COL3.
         * {apply CLIENTSIDETEMPLATOR_4090112546548705_RECORD/}
         */
        function buildTemplateDirective( pDataRow, pTemplateName ) {
            let templateDirective = "",
                keys,
                key;

            if ( pDataRow ) {
                keys = Object.keys( pDataRow );

                templateDirective = "{with/}\n";
                templateDirective += "REGION_ID:=" + options.regionId + "\n";
                templateDirective += "REGION_STATIC_ID:=" + options.regionStaticId + "\n";
                for ( let i = 0; i < keys.length; i++ ) {
                    key = keys[i].toUpperCase();

                    templateDirective += key + ":=&" + key + ".\n";
                }
            }
            templateDirective += "{apply " + pTemplateName + "/}";
            return templateDirective;
        }

        /**
         * Define the named templates for before/record/after templates of tableModelView
         * @function defineTemplates
         * @param {array} pData data array
         */
        function defineTemplates( pData ) {
            let templateArgs = [];

            if ( pData && Array.isArray( pData ) ) {
                templateArgs = buildTemplateArgs( pData[0] );
            }
            util.defineTemplates( [
                {
                    name: templateNamePrefix + "_BEFORE",
                    template: options.beforeTemplate,
                    args: templateArgs
                },
                {
                    name: templateNamePrefix + "_RECORD",
                    template: options.recordTemplate,
                    args: templateArgs
                },
                {
                    name: templateNamePrefix + "_AFTER",
                    template: options.afterTemplate,
                    args: templateArgs
                }
            ] );
        }

        /**
         * Set searchItemValue variable & refreshes region. Used for search if searchItem option is specified
         * @function inputSearch
         */
        function inputSearch() {
            searchItemValue = apexItem( options.searchItem ).getValue();
            apexRegion( options.regionStaticId ).refresh();
        }

        // init region
        fetchData()
            .done( function ( data ) {
                let jsonData = prepareData( data ),
                    modelData = prepareModelData( jsonData );

                debug.info( REGION_TYPE + " request success", jsonData );
                region$.trigger( EVENT_AJAX_RESPONSE, jsonData );

                defineTemplates( jsonData );

                trrOptions = {
                    regionType: REGION_TYPE,
                    regionId: options.regionId,
                    regionStaticId: options.regionStaticId,
                    ajaxIdentifier: options.ajaxIdentifier,
                    itemsToSubmit: options.itemsToSubmit,
                    lazyLoading: false,
                    beforeTemplate: buildTemplateDirective( jsonData[0], templateNamePrefix + "_BEFORE" ),
                    afterTemplate: buildTemplateDirective( jsonData[0], templateNamePrefix + "_AFTER" ),
                    recordTemplate: buildTemplateDirective( jsonData[0], templateNamePrefix + "_RECORD" ),
                    modelName: modelName,
                    columns: [buildModelFields( jsonData[0] )],
                    modelOptions: {
                        hasTotalRecords: true,
                        paginationType: "none",
                        pageSize: MAX_PAGE_SIZE,
                        identityField: "APEX_MODEL_ROW_ID",
                        // custom callServer function to hijack AJAX calls and include our client & server side fetch logic
                        callServer: function () {
                            return refreshData();
                        }
                    },
                    pagination: {},
                    rowsPerPage: options.rowsPerPage,
                    noDataMessage: options.noDataMessage
                };

                if ( options.pagination === PAGINATION_SCROLL ) {
                    trrOptions.pagination.scroll = true;
                    trrOptions.pagination.virtual = true;
                    trrOptions.footer = false;
                }
                if ( options.pagination === PAGINATION_PAGE ) {
                    trrOptions.pagination.hideSinglePage = true;
                    if ( jsonData.length <= options.rowsPerPage ) {
                        trrOptions.footer = false;
                    }
                }

                widget.templateReportRegionInit( trrOptions, modelData );
            } )
            .fail( function ( error ) {
                debug.error( REGION_TYPE + " request failed", error );
                handleAJAXError( error );
            } );

        // if a search item is provided, refresh the region when something is typed
        // search logic is then handled directly by refreshData & prepareModelData
        if ( options.searchItem ) {
            searchItem$ = $( "#" + util.escapeCSS( options.searchItem ), apex.gPageContext$ );
            searchItem$.on( "input", util.debounce( inputSearch, 100 ) );
        }
    };
} )( apex.util, apex.region, apex.widget, apex.lang, apex.server, apex.item, apex.message, apex.debug, apex.jQuery );
