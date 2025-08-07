/*!
 * Copyright (c) 2023, Oracle and/or its affiliates.
 */

( function( $, debug, region, util, widgetUtil ) {
    "use strict";

    /*
     * Expected markup:
     *
     * <div id="{regionId}">                <- Based on the region template
     *     ...
     *     <a-partial
     *          region-id="{regionId}"      <- Static region ID
     *          ajax-identifier="..."       <- AJAX ID used for refreshing
     *          ajax-columns="..."          <- Checksum for ajax-columns
     *          ajax-actions="..."          <- Checksum for ajax-actions
     *          ajax-action-menus="..."     <- Checksum for ajax-action-menus
     *          page-items-to-submit="..."  <- Comma-separated list of page items names
     *          lazy-loading                <- Optional. If present, lazy load
     *     >
     *         ...                          <- Actual region content
     *     </a-partial>
     *     ...
     * </div>
     */
    class Partial extends HTMLElement {
        constructor() {
            super();

            const
                elem = this,
                regionId = elem.getAttribute( "region-id" ),
                ajaxIdentifier = elem.getAttribute( "ajax-identifier" ),
                ajaxColumns = elem.getAttribute( "ajax-columns" ),
                ajaxActions = elem.getAttribute( "ajax-actions" ),
                ajaxActionMenus = elem.getAttribute( "ajax-action-menus" ),
                lazyLoading = elem.hasAttribute( "lazy-loading" ),
                usesSlots = elem.hasAttribute( "uses-slots" ),
                itemsToSubmit = elem.getAttribute( "page-items-to-submit" ),
                itemsToSubmitArr = itemsToSubmit ? itemsToSubmit.split( "," ) : undefined,
                region$ = $( "#" + util.escapeCSS( regionId ) );

            // menu needs an init call after they where rendered
            // todo we need to have such a button as web component that handles
            // the create and destroy of the menu when it connect/disconnects
            const initMenuButtons = () => {
                $( "button[data-menu^='tc_menu_a']", region$ ).each( function() {
                    const menuId = util.escapeCSS( this.getAttribute( "data-menu" ) );

                    $( `div.a-Menu[id=${ menuId }]` ).remove();
                    $( `#${ menuId }` ).menu();
                } );
            };

            const refresh = () => {

                // If a partial has plugin slots, we should not be able to refresh it due to the server side
                // rendering architecture of slot contents (regions/items/buttons)
                if ( usesSlots ) {
                    debug.warn( "It's is not possible to refresh a region partial that uses slots." );
                    return;
                }

                const IS_LOADING_CLASS = "is-loading";
                let promise;

                elem.classList.add( IS_LOADING_CLASS );

                promise = apex.server.plugin( {
                    regions: [ {
                        id: regionId,
                        ajaxIdentifier:  ajaxIdentifier,
                        // checksums needed next to ajaxIdentifier by the server to handle ajax requests
                        ajaxColumns:     ajaxColumns,
                        ajaxActions:     ajaxActions,
                        ajaxActionMenus: ajaxActionMenus
                    } ],
                    pageItems: itemsToSubmitArr
                }, {
                    // no loading indicator, that's handled by using the is-loading class
                    success: res => {
                        elem.classList.remove( IS_LOADING_CLASS );
                        elem.innerHTML = res.regions[0].result;
                        initMenuButtons();
                    }
                } );

                return promise;
            };

            if( lazyLoading ) {
                widgetUtil.whenBecomesVisible( region$, refresh );
            }

            region.create( regionId, {
                type: "Partial",
                refresh: refresh
            } );

            initMenuButtons();

        }
    }

    $( () => {
        window.customElements.define( "a-partial", Partial );
    } );

} )( apex.jQuery, apex.debug, apex.region, apex.util, apex.widget.util );
