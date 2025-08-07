/*!
 * Copyright (c) 2022, Oracle and/or its affiliates.
 */

( ( $, debug, region, util, widgetUtil ) => {
    "use strict";

    /*
     * Expected markup:
     *
     * <div id="{regionId}">                <- Based on the region template
     *     ...
     *     <a-dynamic-content
     *          region-id="{regionId}"      <- Static region ID
     *          ajax-identifier="..."       <- AJAX ID used for refreshing
     *          page-items-to-submit="..."  <- Comma-separated list of page items names
     *          lazy-loading                <- Optional. If present, lazy load
     *     >
     *         ...                          <- Actual region content
     *     </a-dynamic-content>
     *     ...
     * </div>
     */
    class DynamicContent extends HTMLElement {
        constructor() {
            super();

            const
                elem = this,
                regionId = elem.getAttribute( "region-id" ),
                ajaxIdentifier = elem.getAttribute( "ajax-identifier" ),
                lazyLoading = elem.hasAttribute( "lazy-loading" ),
                itemsToSubmit = elem.getAttribute( "page-items-to-submit" ),
                itemsToSubmitArr = itemsToSubmit ? itemsToSubmit.split( "," ) : undefined,
                region$ = $( "#" + util.escapeCSS( regionId ) );

            // Legacy themes may have templates missing the region ID. See #34064688
            if( !region$.length ) {
                debug.error( "Dynamic Content region must use a template with ID attribute" );
            }

            const refresh = () => {
                let promise = apex.server.plugin( {
                    regions: [ {
                        id: regionId,
                        ajaxIdentifier: ajaxIdentifier
                    } ],
                    pageItems: itemsToSubmitArr
                }, {
                    refreshObject: region$,
                    loadingIndicator: region$,
                    loadingIndicatorPosition: "centered",
                    success: res => {
                        elem.innerHTML = res.regions[0].result;
                    }
                } );

                return promise;
            };

            if( lazyLoading ) {
                widgetUtil.whenBecomesVisible( region$, refresh );
            }

            region.create( regionId, {
                type: "DynamicContent",
                refresh: refresh
            } );

        }
    }

    $( () => {
        window.customElements.define( "a-dynamic-content", DynamicContent );
    } );

} )( apex.jQuery, apex.debug, apex.region, apex.util, apex.widget.util );
