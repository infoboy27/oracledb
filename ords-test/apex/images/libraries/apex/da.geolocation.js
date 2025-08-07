/*!
 Copyright (c) 2022, Oracle and/or its affiliates.
 */
( ( da, debug, item, locale ) => {
    "use strict";

    da.getCurrentPosition = ( event ) => {
        if ( 'geolocation' in navigator ) {
            const returnType = event.action.attribute01;
            const enableHighAccuracy = event.action.attribute06 = "Y";

            navigator.geolocation.getCurrentPosition( ( currentPosition ) => {
                switch ( returnType ) {
                    case 'geojson': {
                        let coordsString = {};

                        // Iterate through the coords object and rebuild it
                        // as a string to set the vale of geojsonItem
                        // eslint-disable-next-line guard-for-in
                        for ( const key in currentPosition.coords ) {
                            coordsString[key] = currentPosition.coords[key];
                        }

                        const geojsonItem = event.action.attribute02;
                        item(geojsonItem).setValue( JSON.stringify( coordsString ) );
                        break;
                    }
                    case 'lat_long': {
                        let latitudeItem = event.action.attribute03;
                        let longitudeItem = event.action.attribute04;
                        let latitude = currentPosition.coords.latitude;
                        let longitude = currentPosition.coords.longitude;

                        // Locale handling
                        const decimalSeparator = locale.getDecimalSeparator();
                        if ( decimalSeparator !== '.' ) {
                            latitude = latitude.toString().replaceAll('.', decimalSeparator);
                            longitude = longitude.toString().replaceAll('.', decimalSeparator);
                        }

                        item(latitudeItem).setValue( latitude );
                        item(longitudeItem).setValue( longitude );
                        break;
                    }
                    case 'javascript_code': {
                        const javascriptCode = event.action.attribute05;

                        if ( typeof javascriptCode === "function" ) {
                            javascriptCode( currentPosition, event );
                        } else {
                            debug.error("Get Current Position - JavaScript Function is not a function.");
                        }
                        break;
                    }
                }

                da.resume(event.resumeCallback, false);
            }, ( error ) => {
                debug.error(error); // todo consider user message instead of debug
                da.resume(event.resumeCallback, true);
            }, {
                enableHighAccuracy
            });
        } else {
            debug.warn('Geolocation is not supported on this device.');
            da.resume(event.resumeCallback, true);
        }
    }; // da.getCurrentPosition

})( apex.da, apex.debug, apex.item, apex.locale );
