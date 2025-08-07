/*!
 Copyright (c) 2021, 2022 Oracle and/or its affiliates. All rights reserved.
*/
/*
 * The {@link apex.widget}.geoCoder is used for the Geocoded address widget of Oracle APEX.
 */

( function ( item, $, util, debug, lang, message, event ) {
    "use strict";

    // globals
    var ITEM_CONTAINER_ELEMENT = "div.apex-item-wrapper--geocoded-address",
        ITEM_CONTAINER_CLASS_MAP = "apex-item-wrapper--geocoded-address-map",
        ITEM_CONTAINER_CLASS_DISPLAYONLY = "apex-item-wrapper--geocoded-address-displayonly",
        TRIGGER_JQ_SELECTOR = "JQUERY_SELECTOR",
        TRIGGER_AUTOMATIC = "AUTOMATIC",
        COUNTRY_TYPE_STATIC = "STATIC",
        COUNTRY_TYPE_ITEM = "ITEM",
        DISPLAY_MODE_GRID = "GRID",
        DISPLAY_MODE_LIST = "LIST",
        MATCH_VECTOR_SCORE = {
            INPUT_NOT_NULL_MATCH_NOT_NULL: "0",
            INPUT_NULL_MATCH_NULL: "1",
            INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL: "2",
            INPUT_NOT_NULL_MATCH_REPLACED_NULL: "3",
            INPUT_NULL_MATCH_REPLACED_NOT_NULL: "4"
        },
        EVENT_SELECTION = "apexgeocoderselection",
        EVENT_RESPONSE_DATA = "apexgeocoderresponse",
        EVENT_CHANGE = "change",
        DONE_ICON = "fa-check",
        OPEN_ICON = "fa-remove",
        BUTTON_NODE = "BUTTON",
        INPUT_NODE = "INPUT",
        HOUSENUMBER_FIRST_COUNTRIES = [ "AU", "CA", "CN", "FR", "GB", "HK", "IN", "JP", "NZ", "US", "ZA" ],
        MSG = {
            ADDRESS_REQUIRED: "APEX.ITEM.GEOCODE.ADDRESS_REQUIRED",
            COLUMN_CITY: "APEX.ITEM.GEOCODE.COLUMN_CITY",
            COLUMN_COUNTRY: "APEX.ITEM.GEOCODE.COLUMN_COUNTRY",
            COLUMN_HOUSENUMBER: "APEX.ITEM.GEOCODE.COLUMN_HOUSENUMBER",
            COLUMN_LATITUDE: "APEX.ITEM.GEOCODE.COLUMN_LATITUDE",
            COLUMN_LONGITUDE: "APEX.ITEM.GEOCODE.COLUMN_LONGITUDE",
            COLUMN_MAPLINK: "APEX.ITEM.GEOCODE.COLUMN_MAPLINK",
            COLUMN_MATCHSCORE: "APEX.ITEM.GEOCODE.COLUMN_MATCHSCORE",
            COLUMN_POSTALCODE: "APEX.ITEM.GEOCODE.COLUMN_POSTALCODE",
            COLUMN_STATE: "APEX.ITEM.GEOCODE.COLUMN_STATE",
            COLUMN_STREET: "APEX.ITEM.GEOCODE.COLUMN_STREET",
            DIALOG_TITLE: "APEX.ITEM.GEOCODE.DIALOG_TITLE",
            GEOCODING_DONE: "APEX.ITEM.GEOCODE.GEOCODING_DONE",
            GEOCODING_OPEN: "APEX.ITEM.GEOCODE.GEOCODING_OPEN",
            MAP_DIALOG_TITLE: "APEX.ITEM.GEOCODE.MAP_DIALOG_TITLE",
            NO_DATA_FOUND: "APEX.ITEM.GEOCODE.NO_DATA_FOUND",
            REQUIRED: "APEX.ITEM.GEOCODE.REQUIRED",
            REQUIRED_MULTIPLE: "APEX.ITEM.GEOCODE.REQUIRED_MULTIPLE"
        };

    // APEX item interface
    var geocoderItemPrototype = {
        item_type: "GEOCODER",
        enable: function () {
            this.element.prop( "disabled", false );
            this.element.closest( ITEM_CONTAINER_ELEMENT ).removeClass( "apex_disabled" );
        },
        disable: function () {
            this.element.prop( "disabled", true );
            this.element.closest( ITEM_CONTAINER_ELEMENT ).addClass( "apex_disabled" );
        },
        isDisabled: function () {
            return this.element.prop( "disabled" ) === true;
        },
        show: function () {
            this.element.closest( ITEM_CONTAINER_ELEMENT ).show();
        },
        hide: function () {
            this.element.closest( ITEM_CONTAINER_ELEMENT ).hide();
        },
        setValue: function ( pValue ) {
            this.element.val( pValue );
        },
        getValue: function () {
            return this.element[0].value;
        },
        getNativeValue: function () {
            return JSON.parse( this.element[0].value || "{}" );
        },
        displayValueFor: function ( pValue /*, pState */ ) {
            if ( pValue ) {
                return lang.getMessage( MSG.GEOCODING_DONE );
            } else {
                return lang.getMessage( MSG.GEOCODING_OPEN );
            }
        },
        getValidity: function() {
            var options = getItemOptions( util.escapeCSS( this.id ), false );

            if ( options.trigger !== TRIGGER_AUTOMATIC && options.isRequired && !this.element[0].value ) {
                return { valid:false, valueMissing:true };
            }

            return this.node.validity || { valid:true };
        }
    };

    /**
     * Main function which handles all item specific features, called from item.addAttachHandler
     * @param {object} context$
     */
    function updateSingleGeocoder( context$ ) {
        // loop over all geocoding items
        $( "input[type='hidden'].apex-item-geocoder", context$ ).each( function () {
            var itemId = util.escapeCSS( this.id ),
                item$ = $( "#" + itemId, apex.gPageContext$ ),
                itemMap$,
                displayItem$,
                nativeValue,
                options = getItemOptions( itemId, false ),
                itemsSelector,
                triggerElem$,
                triggerElemNode;

            // item map: create initial map & register change handler to update map
            if ( options.showMapItem ) {
                item$.closest( ITEM_CONTAINER_ELEMENT ).addClass( ITEM_CONTAINER_CLASS_MAP );
                itemMap$ = $( "#" + itemId + "_MAP", apex.gPageContext$ );

                // if item has no value a placeholder is displayed
                // set automatic height (3:2 aspect ratio) if not provided
                // theme applies a initial height of 3px if div is empty, so let's take 10 to be safe
                if ( itemMap$.height() < 10 ) {
                    // set timeout because theme adjustments to displayed width during page load
                    setTimeout( function () {
                        itemMap$.css( "height", itemMap$.width() * ( 2 / 3 ) );
                    }, 20 );
                }

                if ( item$.val().length > 0 ) {
                    nativeValue = JSON.parse( item$.val() );
                    if ( nativeValue && nativeValue.coordinates ) {
                        createMap( itemMap$, nativeValue.coordinates, options );
                    }
                }

                item$.on( EVENT_CHANGE, function () {
                    itemMap$ = $( "#" + itemId + "_MAP", apex.gPageContext$ );
                    if ( $( this ).val().length > 0 ) {
                        nativeValue = JSON.parse( item$.val() );
                        if ( nativeValue && nativeValue.coordinates ) {
                            if ( itemMap$.hasClass( "apex-minimap" ) ) {
                                itemMap$.miniMap( "option", "center", nativeValue.coordinates );
                            } else {
                                createMap( itemMap$, nativeValue.coordinates, options );
                            }
                        }
                    } else {
                        if ( itemMap$.hasClass( "apex-minimap" ) ) {
                            itemMap$.miniMap( "destroy" );
                        }
                    }
                } );
            }

            // display only item: register change handler to update icon and displayed text
            if ( options.showDisplayOnlyItem ) {
                item$.closest( ITEM_CONTAINER_ELEMENT ).addClass( ITEM_CONTAINER_CLASS_DISPLAYONLY );
                item$.closest( ITEM_CONTAINER_ELEMENT ).addClass( "apex-item-wrapper--has-icon" );

                item$.on( EVENT_CHANGE, function () {
                    displayItem$ = $( "#" + itemId + "_DISPLAY", apex.gPageContext$ );
                    if ( $( this ).val().length > 0 ) {
                        displayItem$.text( lang.getMessage( MSG.GEOCODING_DONE ) );
                        displayItem$.next().removeClass( OPEN_ICON ).addClass( DONE_ICON );
                    } else {
                        displayItem$.text( lang.getMessage( MSG.GEOCODING_OPEN ) );
                        displayItem$.next().removeClass( DONE_ICON ).addClass( OPEN_ICON );
                    }
                } );
            }

            // handle different triggering events of geocoding
            if ( options.trigger === TRIGGER_JQ_SELECTOR ) {
                triggerElem$ = $( options.triggerSelector, apex.gPageContext$ );
                triggerElemNode = triggerElem$.prop( "nodeName" );

                if ( triggerElemNode === BUTTON_NODE ) {
                    triggerElem$.on( "click", function () {
                        openPopup( itemId );
                    } );
                } else if ( triggerElemNode === INPUT_NODE ) {
                    triggerElem$.on( "change", function () {
                        openPopup( itemId );
                    } );
                }
            } else if ( options.trigger === TRIGGER_AUTOMATIC ) {
                // cancel submit if geocoding hasn't been done so far & open geocoder popup
                $( apex.gPageContext$ ).on( "apexbeforepagesubmit", function () {
                    if ( checkBeforePageSubmit( options ) ) {
                        apex.event.gCancelFlag = true;
                        openPopup( itemId );
                    }
                } );

                // if a dependent items value changes set the display text of the geocoding item
                if ( options.showDisplayOnlyItem && !item$.data( "geocoding-done" ) ) {
                    itemsSelector = getItemsSelector( options );
                    if ( itemsSelector ) {
                        $( itemsSelector ).on( "change", function () {
                            displayItem$ = $( "#" + itemId + "_DISPLAY", apex.gPageContext$ );
                            displayItem$.text( lang.getMessage( MSG.GEOCODING_OPEN ) );
                            displayItem$.next().removeClass( DONE_ICON ).addClass( OPEN_ICON );
                        } );
                    }
                }
            }

            // create APEX item interface
            item.create( itemId, geocoderItemPrototype );
        } );
    } // updateSingleGeocoder

    // register updateSingleGeocoder to run again when needed
    item.addAttachHandler( updateSingleGeocoder );

    //
    // Helper functions
    //

    /**
     * <p>Get options of a specific geocoder item</p>
     * @function getItemOptions
     * @param {string} pItemId The item name / id
     * @param {boolean} pFetchItemValues Should item values be fetched
     * @return {object} The options
     * data-geo-match-mode="RELAX_BASE_NAME" data-show-coordinates="Y" data-show-preview-map="Y" data-preview-map-background="osm-bright" data-structured-address="Y" data-sanitize-address="Y" data-country-type=COUNTRY_TYPE_ITEM data-country="" data-country-item="P1_COUNTRY" data-poi-item="P1_POI"
     * data-street-item="P1_STREET" data-housenumber-item="P1_HOUSE_NUMBER" data-city-item="P1_CITY" data-zip-item="P1_ZIP" data-subarea-item="P1_SUBAREA" data-region-item="P1_REGION" data-addressline-item="P1_ADDRESSLINE" data-matchvector-item="P1_MATCH_VECTOR" data-trigger=TRIGGER_JQ_SELECTOR data-trigger-selector="#SEARCH"
     */
    function getItemOptions( pItemId, pFetchItemValues ) {
        var item$ = $( "#" + util.escapeCSS( pItemId ), apex.gPageContext$ ),
            fetchItemValues = typeof pFetchItemValues == "undefined" ? true : pFetchItemValues,
            options = {
                itemId: util.escapeCSS( pItemId ) || "",
                //: item$.data( "ig-static-id" ) || "",  not used right now !
                isReadonly: ( item$.data( "readonly" ) || "N" ) === "Y",
                isRequired: ( item$.data( "required" ) || "N" ) === "Y",
                geoMatchMode: item$.data( "geo-match-mode" ) || "RELAX_HOUSE_NUMBER",
                displayMode: item$.data( "display-mode" ) || DISPLAY_MODE_LIST,
                showCoordinates: ( item$.data( "show-coordinates" ) || "Y" ) === "Y",
                showMapPopup: ( item$.data( "show-preview-map" ) || "" ).indexOf( "POPUP" ) > -1,
                showMapItem: ( item$.data( "show-preview-map" ) || "" ).indexOf( "ITEM" ) > -1,
                showDisplayOnlyItem: ( item$.data( "show-preview-map" ) || "" ).indexOf( "ITEM" ) === -1,
                previewMapBackground: item$.data( "preview-map-background" ) || "default",
                useCustomBackground: item$.data( "custom-map-bg" ),
                customBackgroundName: item$.data( "custom-map-bg-name" ),
                customBackgroundType: item$.data( "custom-map-bg-type" ),
                customBackgroundUrl: item$.data( "custom-map-bg-url" ),
                customBackgroundAttribution: item$.data( "custom-map-bg-attribution" ),
                customBackgroundApiKey: item$.data( "custom-map-bg-api-key" ),
                customBackgroundHeaders: item$.data( "custom-map-bg-http-headers" ),
                customBackgroundMinZoom: item$.data( "custom-map-bg-zoom-min" ),
                customBackgroundMaxZoom: item$.data( "custom-map-bg-zoom-max" ),
                structuredAddress: ( item$.data( "structured-address" ) || "Y" ) === "Y",
                sanitizeAddress: ( item$.data( "sanitize-address" ) || "Y" ) === "Y",
                countryType: item$.data( "country-type" ) || COUNTRY_TYPE_STATIC,
                countryStatic: item$.data( "country" ) || "",
                countryItem: item$.data( "country-item" ) || "",
                poiItem: item$.data( "poi-item" ) || "",
                streetItem: item$.data( "street-item" ) || "",
                housenumberItem: item$.data( "housenumber-item" ) || "",
                subareaItem: item$.data( "subarea-item" ) || "",
                cityItem: item$.data( "city-item" ) || "",
                zipItem: item$.data( "zip-item" ) || "",
                regionItem: item$.data( "region-item" ) || "",
                addresslineItem: item$.data( "addressline-item" ) || "",
                matchvectorItem: item$.data( "matchvector-item" ) || "",
                trigger: item$.data( "trigger" ) || TRIGGER_AUTOMATIC,
                triggerSelector: item$.data( "trigger-selector" ) || "",
                country: "",
                poi: "",
                street: "",
                housenumber: "",
                subarea: "",
                city: "",
                zip: "",
                region: "",
                addressLines: []
            };

        if ( fetchItemValues ) {
            if ( options.countryType === COUNTRY_TYPE_STATIC ) {
                options.country = options.countryStatic;
            } else if ( options.countryType === COUNTRY_TYPE_ITEM ) {
                if ( options.countryItem ) {
                    options.country = item( options.countryItem ).getValue().toUpperCase();
                }
            }
            if ( options.poiItem ) {
                options.poi = item( options.poiItem ).getValue();
            }
            if ( options.streetItem ) {
                options.street = item( options.streetItem ).getValue();
            }
            if ( options.housenumberItem ) {
                options.housenumber = item( options.housenumberItem ).getValue();
            }
            if ( options.subareaItem ) {
                options.subarea = item( options.subareaItem ).getValue();
            }
            if ( options.cityItem ) {
                options.city = item( options.cityItem ).getValue();
            }
            if ( options.zipItem ) {
                options.zip = item( options.zipItem ).getValue();
            }
            if ( options.addresslineItem ) {
                item( options.addresslineItem )
                    .getValue()
                    .split( "," )
                    .forEach( function ( addressLine ) {
                        options.addressLines.push( addressLine.trim() );
                    } );
            }
        }

        return options;
    }

    /**
     * <p>Validate supplied item options</p>
     * @function validateOptions
     * @param {object} pOptions A item options object
     * @return {boolean} If validation failed or not
     */
    function validateOptions( pOptions ) {
        var options = pOptions || {};

        if ( !options.country ) {
            showError( options.itemId, lang.formatMessage( MSG.REQUIRED, lang.getMessage( MSG.COLUMN_COUNTRY ) ) );
            return false;
        }
        if ( options.structuredAddress ) {
            if ( !options.city && !options.zip ) {
                showError( options.itemId, lang.formatMessage( MSG.REQUIRED_MULTIPLE, lang.getMessage( MSG.COLUMN_CITY ), lang.getMessage( MSG.COLUMN_POSTALCODE ) ) );
                return false;
            }
            if ( !options.street ) {
                showError( options.itemId, lang.formatMessage( MSG.REQUIRED, lang.getMessage( MSG.COLUMN_STREET ) ) );
                return false;
            }
        } else {
            if ( options.addressLines.length === 0 ) {
                showError( options.itemId, lang.getMessage( MSG.ADDRESS_REQUIRED ) );
                return false;
            }
        }
        return true;
    }

    /**
     * <p>Check if we should open a geocoder popup when page gets submitted & trigger is automatic</p>
     * @function checkBeforePageSubmit
     * @param {object} pOptions A item options object
     * @return {boolean} Should we open a map dialog
     */
    function checkBeforePageSubmit( pOptions ) {
        var options = pOptions || {},
            item$ = $( "#" + options.itemId, apex.gPageContext$ ),
            shouldOpen = false;

        if ( !item$.data( "geocoding-done" ) ) {
            if ( options.countryType === COUNTRY_TYPE_ITEM ) {
                if ( options.countryItem && item( options.countryItem ).isChanged() ) {
                    shouldOpen = true;
                }
            }
            if ( options.poiItem && item( options.poiItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.streetItem && item( options.streetItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.housenumberItem && item( options.housenumberItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.subareaItem && item( options.subareaItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.regionItem && item( options.regionItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.cityItem && item( options.cityItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.zipItem && item( options.zipItem ).isChanged() ) {
                shouldOpen = true;
            }
            if ( options.addresslineItem && item( options.addresslineItem ).isChanged() ) {
                shouldOpen = true;
            }
        }
        return shouldOpen;
    }

    /**
     * <p>Get the jQuery selector for all items configured as a geocoding source. Used for change event handling</p>
     * @function getItemsSelector
     * @param {object} pOptions A item options object
     * @return {string} The selector string
     */
    function getItemsSelector( pOptions ) {
        var options = pOptions || {},
            selector = "";

        if ( options.countryType === COUNTRY_TYPE_ITEM ) {
            if ( options.countryItem ) {
                selector = "#" + util.escapeCSS( options.countryItem );
            }
        }
        if ( options.poiItem ) {
            selector = selector + ", #" + util.escapeCSS( options.poiItem );
        }
        if ( options.streetItem ) {
            selector = selector + ", #" + util.escapeCSS( options.streetItem );
        }
        if ( options.housenumberItem ) {
            selector = selector + ", #" + util.escapeCSS( options.housenumberItem );
        }
        if ( options.subareaItem ) {
            selector = selector + ", #" + util.escapeCSS( options.subareaItem );
        }
        if ( options.cityItem ) {
            selector = selector + ", #" + util.escapeCSS( options.cityItem );
        }
        if ( options.zipItem ) {
            selector = selector + ", #" + util.escapeCSS( options.zipItem );
        }
        if ( options.addresslineItem ) {
            selector = selector + ", #" + util.escapeCSS( options.addresslineItem );
        }
        selector = selector.replace( /^,+|,+$/g, "" );
        selector = selector.trim();

        return selector;
    }

    /**
     * <p>Calculate score from supplied Geocode MatchVectore response attribute</p>
     * @function getMatchVectorScore
     * @param {string} pMatchVector A supplied match vector
     * @return {number} The score 0 - 100
     */
    function getMatchVectorScore( pMatchVector ) {
        var matchVector = pMatchVector || "?????????????????",
            addressPoint = matchVector.substring( 2, 3 ),
            //poiName = matchVector.substring( 3, 4 ),
            houseNumber = matchVector.substring( 4, 5 ),
            //streetPrefix = matchVector.substring( 5, 6 ),
            streetBaseName = matchVector.substring( 6, 7 ),
            //streetSuffix = matchVector.substring( 7, 8 ),
            //streetType = matchVector.substring( 8, 9 ),
            //secondaryUnit = matchVector.substring( 9, 10 ),
            city = matchVector.substring( 10, 11 ),
            //region = matchVector.substring( 13, 14 ),
            country = matchVector.substring( 14, 15 ),
            postalCode = matchVector.substring( 15, 16 ),
            //postalAddonCode = matchVector.substring( 16, 17 ),
            score = 100;

        // if we find an exact address point just exit with 100%
        if ( addressPoint === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_NOT_NULL || addressPoint === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_NULL ) {
            return score;
        }

        // country
        if ( country === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 60;
        } else if ( country === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 70;
        } else if ( country === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NULL ) {
            score = score - 80;
        }

        // zip code
        if ( postalCode === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 20;
        } else if ( postalCode === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 25;
        } else if ( postalCode === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NULL ) {
            score = score - 30;
        }

        // city
        if ( city === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 15;
        } else if ( city === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 20;
        } else if ( city === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NULL ) {
            score = score - 25;
        }

        // street
        if ( streetBaseName === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 10;
        } else if ( streetBaseName === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 13;
        } else if ( streetBaseName === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NULL ) {
            score = score - 16;
        }

        // house number
        if ( houseNumber === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 3;
        } else if ( houseNumber === MATCH_VECTOR_SCORE.INPUT_NULL_MATCH_REPLACED_NOT_NULL ) {
            score = score - 5;
        } else if ( houseNumber === MATCH_VECTOR_SCORE.INPUT_NOT_NULL_MATCH_REPLACED_NULL ) {
            score = score - 7;
        }

        if ( score < 0 ) {
            score = 0;
        }

        return score;
    }

    /**
     * <p>Get the complete street string containing street name & house number with correct order, based on the country.</p>
     * @function getStreetString
     * @param {string} pCountry The ISO country code
     * @param {string} pStreet The street name
     * @param {string} pHouseNumber The house number
     * @return {string} The final street string containing street name + house number
     */
    function getStreetString( pCountry, pStreet, pHouseNumber ) {
        var streetString = pStreet + " " + pHouseNumber;

        if ( HOUSENUMBER_FIRST_COUNTRIES.includes( pCountry ) ) {
            streetString = pHouseNumber + " " + pStreet;
        }

        return streetString.trim();
    }

    /**
     * <p>Make POST request to Oracle's Geocode service</p>
     * @function makeGeocodeRequest
     * @param {object} pOptions A item options object
     * @return {object} The promise object
     */
    function makeGeocodeRequest( pOptions ) {
        var deferred = $.Deferred(),
            geocodingUrl = "https://elocation.oracle.com/appidGC000110/elocation/lbs",
            isStructured = typeof pOptions.structuredAddress == "undefined" ? true : pOptions.structuredAddress,
            matchMode = util.escapeHTML( pOptions.geoMatchMode ),
            country = util.escapeHTML( pOptions.country ),
            poi = util.escapeHTML( pOptions.poi ),
            street = util.escapeHTML( pOptions.street ),
            housenumber = util.escapeHTML( pOptions.housenumber ),
            streetString = getStreetString( country, street, housenumber ),
            subarea = util.escapeHTML( pOptions.subarea ),
            city = util.escapeHTML( pOptions.city ),
            zip = util.escapeHTML( pOptions.zip ),
            region = util.escapeHTML( pOptions.region ),
            addressLines = pOptions.addressLines || [],
            structuredTemplate = `<geocode_request vendor="elocation"><address_list><input_location id="1" get_timezone="true"><input_address match_mode="${matchMode}"><gen_form country="${country}" name="${poi}" street="${streetString}" sub_area="${subarea}" city="${city}" postal_code="${zip}" region="${region}"/></input_address></input_location></address_list></geocode_request>`,
            unstructuredTemplate = `<geocode_request vendor="elocation"><address_list><input_location id="1" get_timezone="true"><input_address match_mode="${matchMode}"><unformatted country="${country}">${addressLines.map( ( addressLine ) => `<address_line value="${addressLine}"/>` ).join( "" )}</unformatted></input_address></input_location></address_list></geocode_request>`;

        $.ajax( {
            url: geocodingUrl,
            method: "POST",
            dataType: "jsonp",
            data: "xml_request=" + encodeURIComponent( isStructured ? structuredTemplate : unstructuredTemplate ) + "&format=json"
        } )
            .done( function ( data ) {
                deferred.resolve( data );
            } )
            .fail( function ( jqXHR, textStatus, errorThrown ) {
                deferred.reject( errorThrown );
            } );

        return deferred.promise();
    }

    /**
     * <p>Parse JSON from Oracle's Geocode service into our own JSON representation</p>
     * @function parseResponse
     * @param {string} pArray A JSON array
     * @return {object} The JSON object
     */
    function parseResponse( pArray ) {
        var inputArray = pArray || [],
            json = {},
            element;

        function _cleanupValue( pValue ) {
            var value = pValue || "";
            return value === "null" ? "" : value;
        }

        if ( Array.isArray( inputArray ) ) {
            json.matchCount = inputArray.length;
            json.matches = [];

            for ( var i = 0; i < inputArray.length; i++ ) {
                element = inputArray[i];

                json.matches.push( {
                    sequence: i,
                    latitude: _cleanupValue( element.y ),
                    longitude: _cleanupValue( element.x ),
                    matchCode: _cleanupValue( element.matchCode ),
                    matchVector: _cleanupValue( element.matchVector ),
                    matchVectorScore: getMatchVectorScore( element.matchVector ),
                    name: _cleanupValue( element.name ),
                    houseNumber: _cleanupValue( element.houseNumber ),
                    street: _cleanupValue( element.street ),
                    settlement: _cleanupValue( element.settlement ),
                    municipality: _cleanupValue( element.municipality ),
                    region: _cleanupValue( element.region ),
                    country: _cleanupValue( element.country ),
                    language: _cleanupValue( element.language ),
                    postalCode: _cleanupValue( element.postalCode ),
                    side: _cleanupValue( element.side ),
                    percent: _cleanupValue( element.percent ),
                    edgeId: _cleanupValue( element.edgeId ),
                    timezone: _cleanupValue( element["timezone="] ),
                    gmtOffset: _cleanupValue( element["GMT_offset="] )
                } );
            }
        } else {
            json.error = "Parsing Error";
        }

        return json;
    }

    /**
     * <p>Prepare data provided by Oracle's Geocode service JSON for apex.model</p>
     * @function prepareModelData
     * @param {object} pData The data to use
     * @return {array} The data used by apex.model
     */
    function prepareModelData( pData ) {
        var city = "",
            data = [];

        if ( pData ) {
            for ( var i = 0; i < pData.matches.length; i++ ) {
                // prepare city name
                if ( pData.matches[i].municipality && pData.matches[i].settlement !== pData.matches[i].municipality ) {
                    city = pData.matches[i].municipality + " (" + pData.matches[i].settlement + ")";
                } else {
                    city = pData.matches[i].settlement;
                }

                // add data to array which is used by apex.model (but only if any useful data is returned by web service)
                if ( pData.matches[i].country && pData.matches[i].settlement ) {
                    data.push( [
                        pData.matches[i].sequence,
                        pData.matches[i].street,
                        pData.matches[i].houseNumber,
                        city,
                        pData.matches[i].postalCode,
                        pData.matches[i].region,
                        pData.matches[i].country,
                        pData.matches[i].latitude,
                        pData.matches[i].longitude,
                        '<a class="a-GeoCoder-previewMap" href="javascript:void(0);" data-latitude="' +
                            util.escapeHTMLAttr( pData.matches[i].latitude ) +
                            '" data-longitude="' +
                            util.escapeHTMLAttr( pData.matches[i].longitude ) +
                            '"><span class="fa fa-map-marker" aria-hidden="true"></span></a>',
                        '<progress class="a-GeoCoder-matchScore" max="100" value="' +
                            util.escapeHTMLAttr( pData.matches[i].matchVectorScore ) +
                            '">' +
                            util.escapeHTMLAttr( pData.matches[i].matchVectorScore ) +
                            "%</progress>"
                    ] );
                }
            }
        }

        return data;
    }

    /**
     * <p>Show a error message for specifc item</p>
     * @function showError
     * @param {string} pItemId The ID of an APEX item
     * @param {string} pErrorMsg The error message
     */
    function showError( pItemId, pErrorMsg ) {
        message.clearErrors( pItemId );
        message.showErrors( [
            {
                type: "error",
                location: ["page"],
                pageItem: pItemId,
                message: pErrorMsg,
                unsafe: false
            }
        ] );
    }

    /**
     * <p>Create a map component showing a preview of a certain location</p>
     * @function createMap
     * @param {object} pContainer$ The jQuery object of a container div
     * @param {array} pCenter The coordinates array
     * @param {string} pBackground The map background
     */
    function createMap( pContainer$, pCenter, pOptions ) {
        const { 
            previewMapBackground: background,
            useCustomBackground,
            customBackgroundName,
            customBackgroundType,
            customBackgroundUrl,
            customBackgroundAttribution,
            customBackgroundApiKey,
            customBackgroundHeaders,
            customBackgroundMinZoom,
            customBackgroundMaxZoom
        } = pOptions;
        
        if ( pContainer$ ) {
            // create map
            pContainer$.miniMap( {
                center: pCenter,
                zoom: 16,
                marker: true,
                controls: true,
                tooltip: "",
                background,
                useCustomBackground,
                customBackgroundName,
                customBackgroundType,
                customBackgroundUrl,
                customBackgroundAttribution,
                customBackgroundApiKey,
                customBackgroundHeaders,
                customBackgroundMinZoom,
                customBackgroundMaxZoom
            } );

            setMapHeight();
        }
    }

    /**
     * <p>Open popup dialog handler - When openend makes request to Geocoding service and create a grid with all results supplied</p>
     * @function openPopup
     * @param {string} pItemId The ID of an APEX item
     */
    function openPopup( pItemId ) {
        var itemOptions = getItemOptions( pItemId ),
            item$ = $( "#" + util.escapeCSS( pItemId ), apex.gPageContext$ ),
            view,
            dialog$,
            dialogOptions,
            topJQuery = util.getTopApex().jQuery,
            baseId = "GeoCoder_" + apex.env.APP_PAGE_ID + "_" + pItemId, // including page to help keep it unique on top level apex page
            dialogId = baseId + "_dlg",
            grid$,
            model,
            jsonData,
            gridFieldDefinitions = {
                ID: {
                    index: 0,
                    canHide: false,
                    hidden: true,
                    seq: 1
                },
                STREET: {
                    index: 1,
                    heading: lang.getMessage( MSG.COLUMN_STREET ),
                    alignment: "start",
                    headingAlignment: "start",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 2
                },
                HOUSE_NUMBER: {
                    index: 2,
                    heading: lang.getMessage( MSG.COLUMN_HOUSENUMBER ),
                    alignment: "center",
                    headingAlignment: "center",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 3
                },
                CITY: {
                    index: 3,
                    heading: lang.getMessage( MSG.COLUMN_CITY ),
                    alignment: "start",
                    headingAlignment: "start",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 4
                },
                POSTAL_CODE: {
                    index: 4,
                    heading: lang.getMessage( MSG.COLUMN_POSTALCODE ),
                    alignment: "center",
                    headingAlignment: "center",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 5
                },
                STATE: {
                    index: 5,
                    heading: lang.getMessage( MSG.COLUMN_STATE ),
                    alignment: "center",
                    headingAlignment: "center",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 6
                },
                COUNTRY: {
                    index: 6,
                    heading: lang.getMessage( MSG.COLUMN_COUNTRY ),
                    alignment: "center",
                    headingAlignment: "center",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 7
                },
                LATITUDE: {
                    index: 7,
                    heading: lang.getMessage( MSG.COLUMN_LATITUDE ),
                    alignment: "end",
                    headingAlignment: "end",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 8
                },
                LONGITUDE: {
                    index: 8,
                    heading: lang.getMessage( MSG.COLUMN_LONGITUDE ),
                    alignment: "end",
                    headingAlignment: "end",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    seq: 9
                },
                MAP_LINK: {
                    index: 9,
                    heading: lang.getMessage( MSG.COLUMN_MAPLINK ),
                    alignment: "center",
                    headingAlignment: "center",
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    escape: false,
                    seq: 10
                },
                MATCH_SCORE: {
                    index: 10,
                    heading: lang.getMessage( MSG.COLUMN_MATCHSCORE ),
                    alignment: "center",
                    headingAlignment: "center",
                    width: 100,
                    canHide: false,
                    canSort: false,
                    hidden: false,
                    escape: false,
                    seq: 11
                }
            };

        function _resize() {
            if ( view ) {
                view.resize();
            }
        }

        function _focus() {
            if ( view ) {
                view.focus();
            }
        }

        function _messageContent() {
            return "<div class='a-GeoCoder-dialog'></div>";
        }

        // save selected data from grid back to items
        function _saveToItems() {
            var records,
                record,
                jsonRow;

            function _getItemValue( pLatitude, pLongitude ) {
                if ( pLatitude && pLongitude ) {
                    return '{"type": "Point", "coordinates": [' + pLongitude + ", " + pLatitude + "]}";
                } else {
                    return "{}";
                }
            }

            if ( view ) {
                records = view.getSelectedRecords();

                // if we only have one entry and nothing selected so far, get this first record
                if ( records.length === 0 && model.getTotalRecords() === 1 ) {
                    record = model.recordAt( 0 );
                } else {
                    record = records[0];
                }

                if ( record ) {
                    // find specific record in parsed json data by sequence attribute
                    jsonRow = jsonData.matches.find( ( row ) => row.sequence === model.getValue( record, "ID" ) );

                    if ( jsonRow ) {
                        item( itemOptions.itemId ).setValue( _getItemValue( jsonRow.latitude, jsonRow.longitude ) );
                        item$.data( "geocoding-done", "Y" );

                        if ( itemOptions.sanitizeAddress ) {
                            if ( itemOptions.streetItem ) {
                                if ( !itemOptions.housenumberItem ) {
                                    item( itemOptions.streetItem ).setValue( getStreetString( jsonRow.country, jsonRow.street, jsonRow.houseNumber ) );
                                } else {
                                    item( itemOptions.streetItem ).setValue( jsonRow.street );
                                }
                            }
                            if ( itemOptions.housenumberItem ) {
                                item( itemOptions.housenumberItem ).setValue( jsonRow.houseNumber );
                            }
                            if ( itemOptions.subareaItem ) {
                                item( itemOptions.subareaItem ).setValue( jsonRow.municipality );
                            }
                            if ( itemOptions.cityItem ) {
                                item( itemOptions.cityItem ).setValue( jsonRow.municipality || jsonRow.settlement );
                            }
                            if ( itemOptions.zipItem ) {
                                item( itemOptions.zipItem ).setValue( jsonRow.postalCode );
                            }
                            if ( itemOptions.regionItem ) {
                                item( itemOptions.regionItem ).setValue( jsonRow.region );
                            }
                        }

                        if ( itemOptions.matchvectorItem ) {
                            item( itemOptions.matchvectorItem ).setValue( jsonRow.matchVector );
                        }

                        dialog$.dialog( "close" );
                        event.trigger( item$, EVENT_SELECTION, jsonRow );
                    }
                }
            }
        }

        // Adjust global GridFieldDefinitions object for item specific settings before creating model & grid
        function _adjustGridFieldDefinitions() {
            if ( itemOptions.showCoordinates ) {
                gridFieldDefinitions.LATITUDE.hidden = false;
                gridFieldDefinitions.LONGITUDE.hidden = false;
            } else {
                gridFieldDefinitions.LATITUDE.hidden = true;
                gridFieldDefinitions.LONGITUDE.hidden = true;
            }
            if ( itemOptions.showMapPopup ) {
                gridFieldDefinitions.MAP_LINK.hidden = false;
            } else {
                gridFieldDefinitions.MAP_LINK.hidden = true;
            }
        }

        // create apex.model based on data from geocoding service
        function _createModel( pData ) {
            var modelName = baseId,
                data = prepareModelData( pData ) || [],
                total = data.length || 0;

            // create the model
            model = apex.model.create(
                modelName,
                {
                    recordIsArray: true,
                    shape: "table",
                    hasTotalRecords: true,
                    fields: gridFieldDefinitions,
                    regionId: pItemId, // model assumes it is dealing with a region but shouldn't really care
                },
                data,
                total
            );
        }

        // clear apex.model
        function _clearModel() {
            var modelName = baseId;

            // Clear the model
            model = apex.model.get( modelName );
            if ( model ) {
                model.clearData();
            }
        }

        // create a simple grid showing data from apex.model
        function _createGrid() {
            var modelName = baseId;

            grid$.grid( {
                modelName: modelName,
                columns: [gridFieldDefinitions],
                footer: true,
                noDataMessage: lang.getMessage( MSG.NO_DATA_FOUND ),
                rowsPerPage: 15,
                pagination: {
                    scroll: true,
                    loadMore: true,
                    showRange: false
                },
                reorderColumns: false,
                resizeColumns: true,
                tooltip: {
                    content: function ( callback, model, recordMeta, colMeta, columnDef ) {
                        var text = null;

                        if ( columnDef && recordMeta ) {
                            if ( columnDef.property === "MATCH_SCORE" ) {
                                text = $( model.getValue( recordMeta.record, "MATCH_SCORE" ) ).text();
                            }
                        }

                        return text;
                    }
                },
                selectionChange: function ( event ) {
                    if ( event.originalEvent && event.originalEvent.type === "click" ) {
                        _saveToItems();
                    }
                },
                activateCell: function ( event ) {
                    var cell$ = $( event.target ).closest( ".a-GV-cell" ),
                        KEY_ENTER = 13;

                    if ( ( event.type === "keydown" && event.which !== KEY_ENTER ) || cell$.hasClass( "a-GV-selHeader" ) || cell$.hasClass( "has-button" ) ) {
                        return;
                    }
                    _saveToItems();
                },
                pageChange: function () {
                    // when pagination happens, remove fixed height we applied when opening the dialog
                    // this makes the container scrollable again
                    grid$.height( "auto" );

                    if ( itemOptions.showMapPopup ) {
                        topJQuery( "body" ).on( "click", "a.a-GeoCoder-previewMap", function () {
                            openMapPopup( itemOptions.itemId, $( this ).data( "latitude" ), $( this ).data( "longitude" ) );
                        } );
                    }
                }
            } );

            view = grid$.data( "apex-grid" );
        }

        // create a simple list view showing data from apex.model
        function _createList() {
            var modelName = baseId,
                ww = $( window ).width() - 10,
                wh = $( window ).height() - 10,
                width,
                height;
            
            function _getStreetTemplate( pCountry ) {
                var streetTemplate = "&STREET. &HOUSE_NUMBER.";
    
                if ( HOUSENUMBER_FIRST_COUNTRIES.includes( pCountry ) ) {
                    streetTemplate = "&HOUSE_NUMBER. &STREET.";
                }
    
                return streetTemplate;
            }
            
            grid$.tableModelView( {
                modelName: modelName,
                beforeTemplate: '<ul class="a-AddressList" role="listbox">',
                recordTemplate: '<li data-id="&ID." class="a-AddressList-item" role="option"><div class="a-AddressList-line1">' + _getStreetTemplate( itemOptions.country ) + '</div><div class="a-AddressList-line2">&CITY., &STATE. &POSTAL_CODE., &COUNTRY.</div></li>',
                afterTemplate: "</ul>",
                footer: false,
                hasSize: true,
                noDataMessage: lang.getMessage( MSG.NO_DATA_FOUND ),
                useIconList: true,
                constrainNavigation: true,
                rowsPerPage: 10,
                pagination: {
                    scroll: true,
                    loadMore: true
                },
                iconListOptions: {
                    navigation: true,
                    multiple: false,
                    activate: function( event ) {
                        _saveToItems();
                        event.preventDefault();
                    }
                }
            } );

            // fix container width & height
            width = ( grid$.find( "ul.a-AddressList" ).outerWidth() || 200 ) * 2;
            height = ( grid$.find( "ul.a-AddressList" ).outerHeight() || 100 ) + ( grid$.find( "div.a-GV-loadMore" ).outerHeight() || 50 );
            
            if ( width > ww ) {
                width = ww;
            }
            if ( height > wh ) {
                height = wh;
            }

            grid$.width( width );
            grid$.height( height );

            view = grid$.data( "apex-tableModelView" );
        }

        dialogOptions = {
            id: dialogId,
            title: lang.getMessage( MSG.DIALOG_TITLE ),
            isPopup: false,
            parentElement: null,
            draggable: true,
            resizable: true,
            width: "auto",
            height: "auto",
            confirm: true,
            okButton: true,
            cancelLabelKey: "APEX.DIALOG.CLOSE",
            dialogClass: "ui-dialog-geocoder",
            notification: false, // keeps the role as 'dialog'
            init: function ( dialogContent$ ) {
                var content$;

                dialog$ = topJQuery( "#" + util.escapeCSS( dialogId ) ); // the dialog is in the top context.

                content$ = $( "<div class='a-GeoCoder-results'></div>" );
                dialogContent$.append( content$ );
                dialogContent$.attr( "role", "application" );
                grid$ = content$;
            },
            open: function () {
                var spinner$,
                    ww = $( window ).width() - 10,
                    wh = $( window ).height() - 10,
                    heightOffset = ( dialog$.closest( "div.ui-dialog" ).find( "div.ui-dialog-titlebar" ).outerHeight() + dialog$.closest( "div.ui-dialog" ).find( "div.ui-dialog-buttonpane" ).outerHeight() ) || 150,
                    width,
                    height;

                debug.info( "GeoCoder itemOptions", itemOptions );

                if ( !validateOptions( itemOptions ) ) {
                    dialog$.dialog( "close" );
                    return;
                }

                spinner$ = util.showSpinner( dialog$ );

                makeGeocodeRequest( itemOptions )
                    .done( function ( data ) {
                        jsonData = parseResponse( data );
                        debug.info( "GeoCoder jsonData", jsonData );

                        if ( jsonData.error ) {
                            showError( pItemId, jsonData.error );
                            dialog$.dialog( "close" );
                            return;
                        }

                        event.trigger( item$, EVENT_RESPONSE_DATA, jsonData );

                        _adjustGridFieldDefinitions( itemOptions );
                        _createModel( jsonData );

                        if ( itemOptions.displayMode === DISPLAY_MODE_GRID ) {
                            _createGrid();

                            if ( model.getTotalRecords() > 0 ) {
                                width = grid$.outerWidth() + 250; // if we have results, make the grid wider to reduce narrow columns
                            } else {
                                width = grid$.outerWidth();
                            }
                        } else if ( itemOptions.displayMode === DISPLAY_MODE_LIST ) {
                            _createList();

                            width = grid$.outerWidth();
                        }

                        _focus();

                        height = grid$.outerHeight() + heightOffset;

                        if ( width > ww ) {
                            width = ww;
                        }
                        if ( height > wh ) {
                            height = wh;
                        }

                        dialog$.dialog( "option", "width", width );
                        dialog$.dialog( "option", "height", height );

                        // apply inner height of dialog to grid container
                        // this was needed to don't display unnecessary vertical scrollbars
                        grid$.height( dialog$.height() );

                        _resize();
                    } )
                    .fail( function ( errorMsg ) {
                        debug.error( "GeoCoder request failed", errorMsg );
                        showError( pItemId, errorMsg );
                        dialog$.dialog( "close" );
                    } )
                    .always( function () {
                        if ( spinner$ ) {
                            spinner$.remove();
                            spinner$ = null;
                        }
                    } );
            },
            resize: function( event ) {
                // resize list view container when dialog size changes
                if ( itemOptions.displayMode === DISPLAY_MODE_LIST ) {
                    grid$.width( dialog$.width() );
                    grid$.height( dialog$.height() );
                }
                _resize( event.target );
            },
            callback: function ( result ) {
                if ( result ) {
                    _saveToItems();
                }
                _clearModel();
                dialog$.dialog( "destroy" ).remove();
            }
        };

        apex.message.showDialog( _messageContent, dialogOptions );
    }

    /**
     * <p>Open popup dialog handler for map - When openend renders a map component with given coordinates</p>
     * @function openMapPopup
     * @param {string} pItemId The ID of an APEX item
     * @param {number} pLatitude Coordinate latitude value
     * @param {number} pLongitude Coordinate longitude value
     */
    function openMapPopup( pItemId, pLatitude, pLongitude ) {
        var itemOptions = getItemOptions( pItemId ),
            dialog$,
            dialogOptions,
            width = 600,
            height = 400,
            topJQuery = util.getTopApex().jQuery,
            baseId = "GeoCoder_" + apex.env.APP_PAGE_ID + "_" + pItemId + "_map", // including page to help keep it unique on top level apex page
            dialogId = baseId + "_dlg",
            mapContainer$;

        function _messageContent() {
            return "<div class='a-GeoCoder-map-dialog'></div>";
        }

        dialogOptions = {
            id: dialogId,
            title: lang.getMessage( MSG.MAP_DIALOG_TITLE ),
            isPopup: false,
            parentElement: null,
            draggable: true,
            resizable: false,
            width: "auto",
            height: "auto",
            confirm: true,
            okButton: false,
            cancelLabelKey: "APEX.DIALOG.CLOSE",
            dialogClass: "ui-dialog-geocoder-map",
            notification: false, // keeps the role as 'dialog'
            init: function ( dialogContent$ ) {
                var content$;

                dialog$ = topJQuery( "#" + util.escapeCSS( dialogId ) ); // the dialog is in the top context.

                content$ = $( "<div id='" + baseId + "' class='a-GeoCoder-map' style='width:" + width + "px;height:" + height + "px'></div>" );
                dialogContent$.append( content$ );
                mapContainer$ = content$;
            },
            open: function () {
                var ww = $( window ).width() - 10,
                    wh = $( window ).height() - 10;

                if ( width > ww ) {
                    dialog$.dialog( "option", "width", ww );
                    mapContainer$.css( "width", ww );
                }
                if ( height > wh ) {
                    dialog$.dialog( "option", "height", wh );
                    mapContainer$.css( "height", wh );
                }
                createMap( mapContainer$, [pLongitude, pLatitude], itemOptions );
            },
            callback: function () {
                mapContainer$.miniMap( "destroy" );
                dialog$.dialog( "destroy" ).remove();
            }
        };

        apex.message.showDialog( _messageContent, dialogOptions );
    }

    //
    // namespace for public functions used by DAs
    //
    apex.item.geoCoder = {
        openPopup: function ( pItemId ) {
            if ( item( pItemId ).item_type !== "GEOCODER" ) {
                debug.error( "Item is not a Geocoded Address item." );
            }
            openPopup( pItemId );
        },
        makeRequest: function ( pItemId, callback ) {
            var itemOptions = getItemOptions( pItemId );

            makeGeocodeRequest( itemOptions )
                .done( function ( data ) {
                    var jsonData = parseResponse( data );
                    debug.info( "GeoCoder jsonData", jsonData );

                    callback( jsonData );
                } )
                .fail( function ( errorMsg ) {
                    debug.error( "GeoCoder request failed", errorMsg );
                    callback( { error: errorMsg } );
                } );
        }
    };

    /**
     * Render show map height
     */
    function setMapHeight() {
        $('[data-GeoCoder-height]').each(function() {
            let geoCoderHeight = $(this).attr('data-GeoCoder-height');
            $(this).css('block-size', geoCoderHeight);
        });
    };

} )( apex.item, apex.jQuery, apex.util, apex.debug, apex.lang, apex.message, apex.event );
