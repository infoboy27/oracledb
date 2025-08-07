/*!
 Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
*/
/*
 * The {@link apex.widget}.displayMap is used for the Display Map widget of Oracle APEX.
 */

( function ( item, $, util, debug ) {
    "use strict";

    var ITEM_CONTAINER_ELEMENT = "div.apex-item-wrapper--display-map";

    // APEX item interface
    var displayMapItemPrototype = {
        item_type: "DISPLAY_MAP",
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
        show: function() {
            this.element.closest( ITEM_CONTAINER_ELEMENT ).show();
        },
        hide: function() {
            this.element.closest( ITEM_CONTAINER_ELEMENT ).hide();
        },
        setValue: function ( /* pValue */ ) {
            debug.error( "This input element is a readonly component and doesn't support setting a value." );
        },
        getValue: function () {
            return this.element[0].value;
        },
        getNativeValue: function () {
            return JSON.parse( this.element[0].value || "{}" );
        }
    };

    /**
     * Check if a given string is valid GeoJSON
     * @param {string} pString
     * @return {boolean} Is string GeoJSON
     */
    function isValidGeoJSON( pString ) {
        var string = pString || "",
            geoJSON;

        if ( !string ) {
            return true;
        }

        try {
            geoJSON = JSON.parse( string );
        } catch ( e ) {
            debug.error( "Failed to parse GeoJSON.", e );
            return false;
        }

        if ( !geoJSON.coordinates ) {
            debug.error( "Missing coordinates in GeoJSON." );
            return false;
        }

        if ( !Array.isArray( geoJSON.coordinates ) ) {
            debug.error( "Missing coordinates array in GeoJSON." );
            return false;
        }

        if ( geoJSON.coordinates.length !== 2 ) {
            debug.error( "Missing coordinates in coordinates array in GeoJSON." );
            return false;
        }

        if ( isNaN( geoJSON.coordinates[0] ) || isNaN( geoJSON.coordinates[1] ) ) {
            debug.error( "Not numeric coordinates in coordinates array in GeoJSON." );
            return false;
        }

        if ( !geoJSON.type ) {
            debug.error( "Missing type in GeoJSON." );
            return false;
        }

        if ( geoJSON.type.toLowerCase() !== "point" ) {
            debug.error( "Missing point type in GeoJSON." );
            return false;
        }

        return true;
    }

    /**
     * Main function which handles all item specific features, called from item.addAttachHandler
     * @param {object} context$
     */
    function updateSingleDisplayMap( context$ ) {
        // loop over all display map items
        $( "input[type='hidden'].apex-item-display-map", context$ ).each( function () {
            var itemId = util.escapeCSS( this.id ),
                item$ = $( "#" + itemId, apex.gPageContext$ ),
                map$ = $( "#" + itemId + "_MAP", apex.gPageContext$ );

            // inititialize map using miniMap
            if ( map$.length > 0 && isValidGeoJSON( item$.val() ) ) {
                map$.miniMap();
            }

            // Create APEX item interface
            item.create( itemId, displayMapItemPrototype );
        } );
    } // updateSingleDisplayMap

    // register updateSingleDisplayMap to run again when needed
    item.addAttachHandler( updateSingleDisplayMap );
} )( apex.item, apex.jQuery, apex.util, apex.debug );
