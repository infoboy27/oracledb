/*!
 * Copyright (c) 2013, 2023, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 * Sticky Table Header - Plugin to allow any table of your choosing to have a fixed table header (which can then combined
 * with sticky widget).
 */
 (function( $, util ){
    "use strict";

    var NO_MAX = -1,
        ORIGINAL_MARKUP_POSTFIX = "_orig",
        appendedStylesToDocument = false;

    // Sets table scrolling if required, checks if scrolling is already setup and does nothing if so
    function setTableScrolling ( pWrapper$, pMaxHeight ) {
        var th, lScrollbarWidth,
            lFixedHeadersTableHead$ = pWrapper$.find( "div.t-fht-thead" ),
            lFixedHeadersTableBody$ = pWrapper$.find( "div.t-fht-tbody" ),
            lFixedHeadersTableHeadLastElement$ = lFixedHeadersTableHead$.find( "table tr" ).first().children( "th:last-child" );

        // Only set table scrolling if it has not been done before
        if ( lFixedHeadersTableHead$.find( "th.t-fht-thead-scroll" ).length === 0 ) {

            th = $( document.createElement( "th" ) );

            th.addClass( "t-fht-thead-scroll" );

            lScrollbarWidth = util.getScrollbarSize().width;

            lFixedHeadersTableHeadLastElement$.after( th );

            th.css({
                "width":        lScrollbarWidth,
                "min-width":    lScrollbarWidth,
                "max-width":    lScrollbarWidth,
                "margin":       "0px",
                "padding":      "0px"
            });

            lFixedHeadersTableBody$.height( pMaxHeight );
        }
    }


    // Looks at various height measures and determines if scrolling is required
    function isScrollingRequired( pMaxHeight, pOriginalTable$, pOriginalTableHead$ ){
        var lBorder, lComputedOriginalTableHeadHeight, lOriginalTableHeadHeight;

        function getComputedStylePropertyValue( element, propertyName ) {
            var result;
            if( element.length >= 1 ) {
                result = window.getComputedStyle( element.get( 0 ) ).getPropertyValue( propertyName );
            }
            return result;
        }

        lComputedOriginalTableHeadHeight = parseInt( getComputedStylePropertyValue( pOriginalTableHead$, "height" ), 10 );

        if ( !lComputedOriginalTableHeadHeight ) {
            // todo consider if this code is needed in light of comment about IE
            // IE 7 and IE 8 will supply a non-integer when calling computedStylePropertyValue.
            // In this case, the jquery defined height will work just as well.
            lComputedOriginalTableHeadHeight = pOriginalTableHead$.height();
        }
        lBorder = getComputedStylePropertyValue( pOriginalTable$, "border-collapse" ) === "collapse" ? 1 : 0;

        lOriginalTableHeadHeight = lComputedOriginalTableHeadHeight + lBorder;

        return pMaxHeight !== NO_MAX && pOriginalTable$.height() - lOriginalTableHeadHeight > pMaxHeight;
    }

    // todo we should not be extending jQuery
    $.fn.setTableHeadersAsFixed = function( options ){
        var tables$, fixedHeadersTableHeadId;

        if ( !appendedStylesToDocument ) { //TODO: Remove this and place it in APP_UI.
            $( "head" ).append( '<style type="text/css">' +
            '.t-fht-cell { height: 1px; overflow: hidden; } ' +
            '.t-fht-wrapper { width: 100%; overflow: hidden; position: relative; } ' +
            '.t-fht-thead { overflow: hidden; position: relative; } ' +
            '.t-fht-tbody { overflow: auto; } ' +
            '</style>' );
            appendedStylesToDocument = true;
        }

        tables$ = this;
        if  ( !tables$.is( "table" ) ) {
            tables$ = this.find( "table" ).not("table table"); // exclude nested tables see bug 31371568
        }
        if ( tables$.length > 0 ) {
            options = $.extend( {},
                {
                    maxHeight: NO_MAX   // The default option is no_max height;
                                        // i.e. just separate the headers from the table.
                },
                options
            );

            fixedHeadersTableHeadId = 0;

            tables$.each(function( index, Element ){

                // Each table needs to store these variables in their own closure.
                // They should not be brought outside this loop! Except the one above.
                var originalTableHead$, fixedHeadersTable$, fixedHeadersTableHead$, originalColumnsAll$,
                    fixedHeadersTableBody$, newTable$, fixedColumns$, firstRow$, originalColumns$,
                    maxHeight = options.maxHeight,
                    originalTable$ = $( Element );

                fixedHeadersTableHeadId += 1;

                if ( maxHeight === NO_MAX ) {
                    if ( originalTable$.hasClass( "mxh480" ) ) {
                        maxHeight = 480;
                    } else if ( originalTable$.hasClass( "mxh320" ) ) {
                        maxHeight = 320;
                    } else if ( originalTable$.hasClass( "mxh640" ) ) {
                        maxHeight = 640;
                    }
                }
                originalTableHead$ = originalTable$.find( "tr" ).first();
                originalTableHead$.children( "th" ).each(function(){
                    var jqueryElement$ = $(this);
                    jqueryElement$.append($(document.createElement( "div" )).addClass( "t-fht-cell" ));
                });

                originalTableHead$.find( "th a" ).each( function( i ){
                    $( this ).attr( "data-fht-column-idx", i );
                });

                fixedHeadersTable$ = $( document.createElement( "div" ) ).addClass( "t-fht-wrapper" );
                fixedHeadersTableHead$ = $( document.createElement("div") ).addClass( "t-fht-thead" );
                fixedHeadersTableHead$.attr( "id", "stickyTableHeader_" + fixedHeadersTableHeadId );
                fixedHeadersTableHead$.addClass( "js-stickyTableHeader" );

                fixedHeadersTableBody$ = originalTable$.wrap( $( document.createElement( "div" ) ).addClass( "t-fht-tbody" )).parent();
                newTable$ = originalTable$.clone().empty().append( originalTableHead$.clone( true ) )
                    .attr( "aria-hidden", true );

                fixedHeadersTableHead$.append( newTable$ );
                fixedHeadersTableBody$.before( fixedHeadersTableHead$ );
                fixedHeadersTable$ = fixedHeadersTableHead$.add( fixedHeadersTableBody$ ).wrapAll( fixedHeadersTable$ ).parent();

                if( isScrollingRequired( maxHeight, originalTable$, originalTableHead$ ) ){
                    setTableScrolling( fixedHeadersTable$, maxHeight );
                }
                fixedHeadersTableBody$.on( "scroll", function() {
                    fixedHeadersTableHead$.scrollLeft( this.scrollLeft );
                });
                fixedHeadersTableHead$.on( "scroll", function() {
                    fixedHeadersTableBody$.scrollLeft( this.scrollLeft );
                });

                fixedColumns$ = fixedHeadersTableHead$.find( "tr" ).first().children( "th" );
                firstRow$ = originalTable$.find( "tr" ).first();
                originalColumns$ = firstRow$.children( "td" );
                originalColumnsAll$ = originalTable$.children( "td" );

                // As the visble fixed header is hidden to AT using aria-hidden, it cannot contain any focusable elements,
                // so let's add tabindex=-1 and also remove aria-haspopup and aria-roledescription (keyboard / screen
                // reader users will interact with the original, now visually hidden header).
                fixedColumns$.find( "a" )
                    .removeAttr( "aria-haspopup aria-roledescription" )
                    .attr( "tabindex", -1 );

                originalTable$.attr( "id", originalTable$.attr( "id" ) + ORIGINAL_MARKUP_POSTFIX ); //avoids duplicate IDs

                // If original heading has column heading links (eg IR), keyboard and JAWS users need to interact with the
                // hidden heading for the best user experience.
                // Therefore we need to replicate showing focus on the visible column headings, when the hidden headings have focus.
                originalTable$.find( "th a" )
                    .on( "focus", function( e ){
                        let target$ = $( e.target );
                        fixedHeadersTableHead$
                            .find( "th a[data-fht-column-idx=" + target$.attr( "data-fht-column-idx" ) + "]" )
                            .addClass( "has-focus" );
                    })
                    .on( "blur", function( e ){
                        let target$ = $( e.target );
                        fixedHeadersTableHead$
                            .find( "th a[data-fht-column-idx=" + target$.attr( "data-fht-column-idx" ) + "]" )
                            .removeClass( "has-focus" );
                    });

                if (originalColumns$.length < 1) {
                    originalColumns$ = firstRow$.children( "th" ); // todo consider combine with above by using "td,th"
                }

                // To help with accessibility, add ARIA based labelling which means screen readers can still pick up the
                // correct column heading (HEADERS alone no longer works, because of the new fixed TH table).
                // Note: Original table headers are effectively redundant, but left in place in case developers have
                // been reliant on them.
                originalColumnsAll$.each( function() {
                    $( this ).attr( "aria-labelledby", $( this ).attr( "headers" ) );
                });

                // Whenever there is a resize event such that the table dimensions change, the table headers
                // that were fixed, need to be synchronized with the table they originally belonged to.
                var resize = function () {
                    $( ".js-stickyTableHeader" ).next().width( "auto" );

                    // clears width of the "replacement (empty div)" element created by widget.stickyWidget.js
                    originalColumns$.children(".t-fht-cell").each(function ( i ) {
                        var width = this.getBoundingClientRect().width,
                            fixedColumn$ = fixedColumns$.eq( i );

                        // TH and TD elements don't respect the width property, so we must use the child div to "force" its parent (the TH or the TD) to be correct.
                        fixedColumn$.find( ".t-fht-cell" ).width( width );
                    });
                    originalTable$.css( "margin-top", -originalTable$.find( "tr" ).first().height() );

                    if ( isScrollingRequired( maxHeight, originalTable$, originalTableHead$ ) ) {
                        setTableScrolling( fixedHeadersTable$, maxHeight );
                    }

                };

                // Resize handlers
                $( window ).on( "apexwindowresized" , resize);
                fixedHeadersTableHead$.on( "forceresize" , resize);

                resize();

            });
            return this;
        }
    };
})( apex.jQuery, apex.util );