/*!
 * Copyright (c) 2014, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * Search results functionality for navigating to the source of the search result items.
 **/

(function( $, nav ) {
    "use strict";

    const BUILDER_WINDOW_NAME = "APEX_BUILDER",
          EVENT_CLICK = "click",
          ACTION_HREF_PREFIX = "#action$";

    function isOpenerApexBuilder() {
        try {
            if ( window.opener && !window.opener.closed && window.opener.apex &&
                window.opener.apex.jQuery &&
                // Opener window has item pFlowId that matches 4xxx which means it is the builder
                window.opener.document.getElementById("pFlowId").value.match( /^4\d\d\d$/ ) ) {
                return true;
            }
        } catch ( ex ) {
            return false; // window must contain a page from another domain
        }
        return false;
    }

    function getBuilderInstance() {
        return $( "#pInstance" ).val();
    }

    function navigateInPageDesigner( appId, pageId, typeId, componentId, errorFn ) {
        if ( isOpenerApexBuilder() && window.opener.pageDesigner?.setPageSelection ) {
            window.opener.pageDesigner.setPageSelection( appId, pageId, typeId, componentId, function( result ) {
                if ( result !== "OK" ) {
                    errorFn();
                }
            });
            // Focus the builder window now while still handling the click event even though controlling the page designer may still fail
            nav.openInNewWindow( "", BUILDER_WINDOW_NAME, { altSuffix: getBuilderInstance() } );
        } else {
            errorFn();
        }
    }

    function navigateInBuilderWindow( url ) {
        var instance = getBuilderInstance();

        nav.openInNewWindow( url, BUILDER_WINDOW_NAME, { altSuffix: instance } );
    }
    // expose these for use by DAs
    window.navigateInBuilderWindow = navigateInBuilderWindow;
    window.doSearch = function() {
        $("#search_results").hide();
        apex.submit({showWait: true});
    };

    $( function() {

        $( "button.edit-button" ).on( EVENT_CLICK, function( event ) {
            let appId, pageId, componentId, workflowDesigner, url,
                btn$ = $( this ),
                instance = getBuilderInstance(),
                typeId = btn$.attr( "data-typeid" );

            if ( typeId ) {
                appId = btn$.attr( "data-appid" );
                pageId = btn$.attr( "data-pageid" );
                componentId = btn$.attr( "data-componentid" );
                workflowDesigner = btn$.attr( "data-designer" ) === "workflow";
                let pageNumber = workflowDesigner ? 9600 : 4500;
                let itemsToSet = workflowDesigner ? "FB_FLOW_ID,F4000_P1_FLOW" : "FB_FLOW_ID,FB_FLOW_PAGE_ID,F4000_P1_FLOW,F4000_P1_PAGE";
                let itemValues = ( workflowDesigner ? [ appId, appId ] : [ appId, pageId, appId ] ).join( "," );
                navigateInPageDesigner( appId, pageId, typeId, componentId, function() {
                    let url = `f?p=4000:${ pageNumber }:${ instance }::NO:1:${ itemsToSet }:${ itemValues }#${ typeId }:${ componentId }`;
                    navigateInBuilderWindow( url );
                } );
            } else {
                url = btn$.attr( "data-link" ).trim();
                if ( url.startsWith( ACTION_HREF_PREFIX ) ) {
                    nav.redirect( url );
                } else {
                    navigateInBuilderWindow( url );
                }
            }
            event.preventDefault();
        } );
    });

})( apex.jQuery, apex.navigation );
