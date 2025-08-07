/*!
 Copyright (c) 2022, Oracle and/or its affiliates.
 */
( ( $, da, server, debug, item, util ) => {
    "use strict";

    da.share = async ( event ) => {
        const SHARE_TYPE_CURRENT_PAGE = 'current_page';
        const SHARE_TYPE_URL = 'url';
        const SHARE_TYPE_FILES = 'files';
        const FILE_SOURCE_SQL_QUERY = 'sql_query';
        const FILE_SOURCE_FILE_URL = 'file_url';

        const title = event.action.attribute01 !== null ? util.applyTemplate( event.action.attribute01 ) : null;
        const text = util.applyTemplate( event.action.attribute02 );

        let shareOptions = { text };

        if ( title ) {
            shareOptions.title = title;
        }

        // Sanitize a URL by adding missing parts dependending 
        // on how it was built by the user
        const sanitizeUrl = ( url ) => {
            if ( url.startsWith( 'r/' ) ) {
                const apexPath = event.action.attribute09;
                url = apexPath + url;
            }
            if ( !url.startsWith( 'http' ) ) {
                url = window.location.origin + url;
            }
            return url;
        }; // sanitizeUrl

        // Invoke the web share API and resume the dynamic actions
        const share = async ( shareOptions ) => {
            try {
                await navigator.share( shareOptions );
                da.resume(event.resumeCallback, false);
            } catch (error) {
                debug.warn(error);
                da.resume(event.resumeCallback, true);
            }
        }; // share

        // Share a URL using web share API of the device
        // Remove the APEX session from the URL first if it exists
        const shareUrl = async ( url ) => {
            url = new URL(sanitizeUrl(url));
            url.searchParams.delete('session');
            url = url.href;

            shareOptions.url = url;
            await share(shareOptions);
        }; // shareUrl

        // Share files using web share API of the device
        const shareFiles = async ( data, fileSource ) => {
            let files = [];

            // loop through all files and sanitize them for the web share API
            for ( const file of data ) {
                let url;
                let filename;
                let mimeType;

                // Files coming from SQL are returned as base64
                if ( fileSource === FILE_SOURCE_SQL_QUERY ) {
                    url = `data:${file.mimetype};base64,${file.blob}`;
                    filename = file.filename;
                    mimeType = file.mimetype;
                } else {
                    url = file;
                    filename = new URL(sanitizeUrl(url)).pathname.split('/').pop();
                }

                // Fetch the file and create a blob
                const response = await fetch(url);
                const blob = await response.blob();

                // Append the blob to a new array of files for the web share API
                files.push( new File ( [ blob ], filename, {
                    type: mimeType || blob.type,
                    lastModified: new Date().getTime()
                } ) );
            }
    
            // Check if files are sharable, then share
            if ( navigator.canShare({ files }) ) {
                shareOptions.files = files;
                await share(shareOptions);
            } else {
                debug.error('Those files cannot be shared.'); // todo consider user message instead of debug
                da.resume(event.resumeCallback, true);
            }
        }; // shareFiles

        // Check if Web Share API is supported by the device
        if ( navigator.canShare ) {
            const shareType = event.action.attribute03;

            if ( shareType === SHARE_TYPE_CURRENT_PAGE ) {
                await shareUrl( window.location.href );
            } else if ( shareType === SHARE_TYPE_URL ) {
                const pageUrl = event.action.attribute04;
                shareUrl( pageUrl );
            } else if ( shareType === SHARE_TYPE_FILES ) {
                const fileSource = event.action.attribute05;
                if ( fileSource === FILE_SOURCE_FILE_URL ) {
                    const fileUrl = event.action.attribute06?.split(/\r?\n/);
                    shareFiles( fileUrl, fileSource );
                } else if ( fileSource === FILE_SOURCE_SQL_QUERY ) {
                    const pageItems = event.action.attribute08;
                    server.plugin( event.action.ajaxIdentifier, {
                        pageItems
                    }, {
                        async: !event.action.waitForResult,
                        loadingIndicator: "body",
                        loadingIndicatorPosition: "page",
                        success: ( data ) => {
                            shareFiles( data, fileSource );
                        },
                        error: ( jqXHR, textStatus, errorThrown ) => {
                            da.handleAjaxErrors( jqXHR, textStatus, errorThrown, event.resumeCallback );
                        }
                    } );
                }
            }
        } else {
            debug.warn('Web share is not supported on this device.');
            da.resume(event.resumeCallback, true);
        }
    }; // da.share

    // On page load, if the device does not support web share
    // Hide buttons that are triggering events of the web share dynamic action
    // This is a convenience utility for feature detection
    $( () => {
        if ( !navigator.canShare ) {
            da.initDaEventList();
            da.gEventList.forEach( event => event.actionList.forEach( action => {
                if ( event.triggeringElementType === 'BUTTON' && action.action === 'NATIVE_SHARE' ) {
                    item( event.triggeringButtonId ).hide();
                }
            } ) );
        }
    } );

})( apex.jQuery, apex.da, apex.server, apex.debug, apex.item, apex.util );