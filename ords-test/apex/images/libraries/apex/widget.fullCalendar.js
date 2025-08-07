/*!
 * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
 */

/**
 * CSS Calendar Widget
 * @fileOverview
 * The {@link apex.widget}.fullCalendar is used for the CSS Calendar widget of Oracle APEX.
 **/

/* global FullCalendar */

( function ( widget, util, server, navigation, date, $, actions ) {
    "use strict";
    /**
     * @param {Object} [pOptions]
     * @param {Array} [pStaticData]
     * @param {String} [pPluginInitJavascript]
     *
     * @function fullCalendar
     * @memberOf apex.widget
     * */

    widget.fullCalendar = function ( pOptions, pStaticData, pPluginInitJavascript ) {

        // *****************************************************************************
        // C A L E N D A R - I N I T I A L I Z A T I O N
        // *****************************************************************************

        var C_MONTH_VIEW               = "dayGridMonth",
            C_WEEK_VIEW                = "timeGridWeek",
            C_DAY_VIEW                 = "timeGridDay",
            C_LIST                     = "list",
            C_LISTMONTH                = "listMonth",
            C_LISTWEEK                 = "listWeek",
            C_LISTDAY                  = "listDay",
            //
            C_BROWSE_MODE_EVENTS       = "EVENTS",
            C_BROWSE_MODE_CALENDAR     = "CALENDAR",
            C_EVENT_SOURCE_SQL         = "SQL",
            C_EVENT_SORT_REGION_SOURCE = "REGION_SOURCE",
            //
            C_CSS_FC                   = "fc-",
            C_CSS_FC_HELPER            = C_CSS_FC + "helper",
            C_CSS_FC_HIGHLIGHT         = C_CSS_FC + "highlight-cell",
            C_CSS_FC_DAY               = C_CSS_FC + "day",
            C_CSS_FC_EVENT             = C_CSS_FC + "event",
            C_CSS_FC_POPOVER           = C_CSS_FC + "popover",
            C_CSS_FC_APXLISTBUTTON     = C_CSS_FC + "apexListButton-button",
            C_CSS_FC_VIEW              = C_CSS_FC + "view",
            C_CSS_FC_VIEW_CONT         = C_CSS_FC_VIEW + "-harness",
            C_CSS_FC_TOOLTIP           = C_CSS_FC + "tooltip",
            //
            C_CAL_ATTR_DATA_DATE       = "data-date",
            //
            C_STYLE_HIGHL_BGCOLOR      = "#bce8f1",
            //
            C_DA_EVT_PREFIX            = "apexcalendar",
            C_DA_EVT_DATESELECT        = C_DA_EVT_PREFIX + "dateselect",
            C_DA_EVT_VIEWCHANGE        = C_DA_EVT_PREFIX + "viewchange",
            C_DA_EVT_EVTSELECT         = C_DA_EVT_PREFIX + "eventselect",
            C_DA_EVT_DRAGDROP_STRT     = C_DA_EVT_PREFIX + "dragdropstart",
            C_DA_EVT_DRAGDROP_DONE     = C_DA_EVT_PREFIX + "dragdropfinish",
            C_DA_EVT_DRAGDROP_ERR      = C_DA_EVT_PREFIX + "dragdroperror",
            //
            C_LOCALSTORAGE_LASTVIEW    = "lastview",
            C_GENERATED_ID_PREFIX      = "apex.widget.fullCalendar.Id_",
            //
            C_ISO_FORMAT               = 'YYYY-MM-DD"T"HH24:MI:SS',
            //
            gOptions,
            gRegion$,
            gCalendar$,
            gCalendar,
            gDefaults,
            gLocale,
            gStaticData         = [],
            gStaticDataLoaded   = false,
            gAllDay             = false,
            gCalStorage,
            gLastView,
            gLastViewResponsive = false,
            gEventId            = 0,
            gFetchPromise,
            // this object holds state information for keyboard support
            keyBoardInfo = {
                keyboardActive : false,
                focusEvents    : false,
                selectorEvent  : false,
                browseMode     : C_BROWSE_MODE_CALENDAR,
                dayEvents      : [],
                activeDayEvent : false,
                SELECTORID     : "com_oracle_apex_selectorevent$",
                cssClass       : C_CSS_FC_HELPER,
                KEY_PREV       : 37,
                KEY_NEXT       : 39,
                MONTH_VIEW     : C_MONTH_VIEW,
                WEEK_VIEW      : C_WEEK_VIEW,
                DAY_VIEW       : C_DAY_VIEW,
                LIST_VIEW      : C_LISTMONTH,
                viewChangeByKey: false
            };


        // *****************************************************************************
        // H E L P E R - F U N C T I O N S
        // *****************************************************************************
        //
        function eventEscaping( pEvent ) {
            return ( !( pEvent.source && pEvent.extendedProps.apexEventSource === 'SQL' ) );
        }

        function getNextId() {
            gEventId = gEventId + 1;
            return C_GENERATED_ID_PREFIX + gEventId;
        }

        function getMoreLink( pDate ) {
            var lDateCell$ = $( "div." + C_CSS_FC_VIEW + " td[" + C_CAL_ATTR_DATA_DATE + "=" + pDate + "]" ),
                lMoreLink$;

            if ( lDateCell$ ) {
                lMoreLink$ = lDateCell$.find( "a[class*=more-link]" );
            }

            return lMoreLink$;
        }

        function removeEventById( pEventId ) {
            if ( pEventId ) {
                var event = gCalendar.getEventById( pEventId );

                if ( event ) {
                    event.remove();
                }
            }
        }

        function isTimeAMPM( pLocale ) {
            var lLocale = pLocale || "en",
                lDate = new Date(),
                lLocaleTime = lDate.toLocaleTimeString( lLocale ).toUpperCase();

            return lLocaleTime.indexOf( "AM" ) > -1 || lLocaleTime.indexOf( "PM" ) > -1;
        }

        function formatYYYYMMDD( pDate, pSeparator ) {
            var lDate = pDate || new Date(),
                lSeparator = pSeparator || "";

            return date.format( lDate, "YYYY" + lSeparator + "MM" + lSeparator + "DD" );
        }

        function formatYYYYMMDDhhmmss( pDate ) {
            var lDate = pDate || new Date();

            return date.format( lDate, "YYYYMMDDHH24MISS" );
        }

        function formatTime( pDate, pIncludeDate ) {
            var lDate = pDate || new Date(),
                lIncludeDate = pIncludeDate || false,
                lTimeString = "";

            lTimeString = lIncludeDate ? formatYYYYMMDD( lDate, "-" ) + " " : "";

            if ( gOptions.timeFormatType === "12" ) {
                lTimeString = lTimeString + date.format( lDate, "HH:MI AM" );
            } else if ( gOptions.timeFormatType === "24" ) {
                lTimeString = lTimeString + date.format( lDate, "HH24:MI" );
            } else {
                if ( isTimeAMPM( gOptions.locale ) ) {
                    lTimeString = lTimeString + date.format( lDate, "HH:MI AM" );
                } else {
                    lTimeString = lTimeString + date.format( lDate, "HH24:MI" );
                }
            }
            return lTimeString;
        }

        function formatTimeRange( pDate1, pDate2 ) {
            var rangeString;

            if ( pDate1 && pDate2 ) {
                rangeString = formatTime( pDate1, true ) + " - " + formatTime( pDate2 );
            } else if ( pDate1 && !pDate2 ) {
                rangeString = formatTime( pDate1, true );
            } else if ( !pDate1 && pDate2 ) {
                rangeString = formatTime( pDate2, true );
            }
            return rangeString;
        }

        function subtractDayIfRequired( pEvent ) {
            var lEvent;

            lEvent = pEvent;

            if ( lEvent.end !== null && lEvent.allDay && !gOptions.endDateExclusive ) {
                date.subtract( lEvent.end, 1, date.UNIT.DAY );
            }

            return lEvent;
        }

        function makeEndDateInclusive( pEventArray ) {
            var i,
                endDate;
            if ( !gOptions.endDateExclusive ) {
                for ( i = 0; i < pEventArray.length; i++ ) {
                    if ( pEventArray[ i ].end ) {
                        if ( pEventArray[ i ].allDay ) {
                            endDate = date.parse( pEventArray[ i ].end, C_ISO_FORMAT );
                            date.add( endDate, 1, date.UNIT.DAY );
                            pEventArray[ i ].end = date.toISOString( endDate );
                        }
                    }
                }
            }
            return pEventArray;
        }

        function _calcAspectRatio() {
            var wWidth         = $( window ).width()  ,
                wHeight        = $( window ).height() ,
                rWidth         = gRegion$.width()     ,
                rHeight        = gRegion$.height()    ,
                rAspectRatio   = Math.round( ( rWidth / rHeight ) * 10 ) / 10,
                wAspectRatio   = Math.round( ( wWidth / wHeight ) * 10 ) / 10,
                theAspectRatio = rAspectRatio;


            if ( wAspectRatio < 1 && rAspectRatio > 1 ) { theAspectRatio = wAspectRatio; }
            else if ( wAspectRatio > 1 && rAspectRatio < 1 ) { theAspectRatio = 1; }

            if ( theAspectRatio < 1 ) { theAspectRatio = 1; }
            else if ( theAspectRatio > 2.6 ) { theAspectRatio = 2.6; }

            return theAspectRatio;
        }

        function lPadTime( pTime ) {
            return ( pTime <= 9 ? ( "0" + pTime + ":00:00" ) : ( "" + pTime + ":00:00" ) );
        }


        function getUrlAndRedirectAjax( pStart, pEnd ) {
            server.plugin( gOptions.ajaxIdentifier, {
                x01: "PREPARE_URL", /* action */
                x02: formatYYYYMMDDhhmmss( pStart ),
                x03: formatYYYYMMDDhhmmss( pEnd ),
                x06: gOptions.createLink
            }, {
                success: function ( pData ) {
                    if ( pData.url ) {
                        apex.navigation.redirect( pData.url );
                    } else {
                        apex.debug( pData );
                    }
                }
            } );
        }

       function getDayMinTime( pDate ) {
            var dayMinTime;
            if ( gOptions.minTime ) {
                dayMinTime = new Date( formatYYYYMMDD( pDate, "-" ) + "T" + gOptions.minTime + "Z" );
            } else {
                dayMinTime = new Date( formatYYYYMMDD( pDate, "-" ) + "T00:00:00Z" );
            }
            return dayMinTime;
        }

        function getDayMaxTime( pDate ) {
            var dayMaxTime;
            if ( gOptions.maxTime ) {
                dayMaxTime = new Date( formatYYYYMMDD( pDate, "-" ) + "T" + gOptions.maxTime + "Z" );
            } else {
                dayMaxTime = date.add( new Date( formatYYYYMMDD( pDate, "-" ) + "T00:00:00Z" ), 1, date.UNIT.DAY );
            }
            return dayMaxTime;
        }

        function scrollToHour( hour ) {
            var hourOffset, weekGrid, hourRow,
                hourRowOffset, hourRowHeight, weekGridOffset, weekGridHeight, scrollDiff;

            if ( gOptions.minTime ) {
                hourOffset = parseInt( gOptions.minTime.substr( 0, 2 ), 10 );
                hourOffset = ( hourOffset < 0 ? 0 : hourOffset );
            } else {
                hourOffset = 0;
            }
            weekGrid = gCalendar$.find( ".fc-timegrid" );
            hourRow  = gCalendar$.find( ".fc-timegrid .fc-timegrid-slot-label-cushion:odd:eq(" + ( hour - hourOffset ) + ")" ).closest( "td" );

            if ( hourRow.length ) {
                hourRowOffset  = hourRow.position().top;
                hourRowHeight  = hourRow.height() * 2;
                weekGridOffset = weekGrid.scrollTop();
                weekGridHeight = weekGrid.height();
                scrollDiff     = ( hourRowOffset + hourRowHeight ) - ( weekGridOffset + weekGridHeight );

                if ( hourRowOffset < weekGridOffset ) {
                    weekGrid.animate( { scrollTop: hourRowOffset }, 10 );
                }
                if ( hourRowOffset + hourRowHeight > weekGridOffset + weekGridHeight ) {
                    weekGrid.animate( { scrollTop: weekGridOffset + Math.max( hourRowHeight, scrollDiff ) }, 10 );
                }
            }
        }


        // *****************************************************************************
        // K E Y B O A R D - S U P P O R T
        // *****************************************************************************

        function openMoreEvents( pDayYYYYMMDD ) {
            var lMoreLink$ = getMoreLink( pDayYYYYMMDD );

            if ( lMoreLink$.length > 0 ) {
                lMoreLink$[0].click();
            }
        }

        function closeMoreEvents() {
            $( gCalendar$.find( "span.fc-popover-close.fc-icon-x" ) ).trigger( "click" );
        }

        function unhighlightEvent() {
            $( "." + C_CSS_FC_DAY + "." + C_CSS_FC_HIGHLIGHT ).css( "background-color", "" );
            $( "." + C_CSS_FC_DAY + "." + C_CSS_FC_HIGHLIGHT ).removeClass( C_CSS_FC_HIGHLIGHT );
        }

        function highlightEvent( pEvent ) {
            var lStart = date.startOfDay( pEvent.start ),
                lEnd   = date.startOfDay( date.subtract( date.clone( pEvent.end ), 1, date.UNIT.SECOND ) ),
                lCurrentDay, lCurrentDayId;

            lCurrentDay = lStart;

            while ( date.isSameOrBefore( lCurrentDay, lEnd ) ) {
                lCurrentDayId = formatYYYYMMDD( lCurrentDay, "-" );

                $( "." + C_CSS_FC_DAY + "[" + C_CAL_ATTR_DATA_DATE + "=" + lCurrentDayId + "]" ).addClass( C_CSS_FC_HIGHLIGHT );
                $( "." + C_CSS_FC_DAY + "[" + C_CAL_ATTR_DATA_DATE + "=" + lCurrentDayId + "]" ).css( "background-color", C_STYLE_HIGHL_BGCOLOR );
                date.add( lCurrentDay, 1, date.UNIT.DAY );
            }
        }

        function unrenderSelectorEvent() {
            var view = gCalendar.view;

            if ( view.type === C_MONTH_VIEW ) {
                unhighlightEvent();
            } else {
                removeEventById( keyBoardInfo.SELECTORID );
            }
        }

        function renderSelectorEvent() {
            var view = gCalendar.view,
                calEvent;

            if ( keyBoardInfo.selectorEvent ) {

                if ( view.type === C_MONTH_VIEW ) {
                    unhighlightEvent();
                    highlightEvent( keyBoardInfo.selectorEvent );
                } else {
                    // remove event first
                    removeEventById( keyBoardInfo.SELECTORID );

                    // create the event object to be passed to FullCalendar
                    calEvent = {
                        id              : keyBoardInfo.selectorEvent.id,
                        title           : keyBoardInfo.selectorEvent.title,
                        allDay          : keyBoardInfo.selectorEvent.allDay,
                        editable        : keyBoardInfo.selectorEvent.editable,
                        durationEditable: keyBoardInfo.selectorEvent.durationEditable,
                        className       : keyBoardInfo.selectorEvent.className,
                        start           : keyBoardInfo.selectorEvent.start,
                        end             : keyBoardInfo.selectorEvent.end,
                        overlap         : keyBoardInfo.selectorEvent.overlap
                    };
                    // pass event object to FullCalendar
                    gCalendar.addEvent( calEvent );
                }
            }
        }

        function leaveEventSelection() {
            keyBoardInfo.browseMode     = C_BROWSE_MODE_CALENDAR;
            keyBoardInfo.activeDayEvent = false;
            closeMoreEvents();
            $( "." + C_CSS_FC_EVENT, gCalendar$ ).removeClass( C_CSS_FC_HELPER );
            $( "div." + C_CSS_FC_VIEW, gCalendar$ ).trigger( "focus" );
            renderSelectorEvent();
        }

        function focusEvent( pView, pEventId ) {
            var focusEvent$;

            focusEvent$ = $( "." + C_CSS_FC_EVENT + "[data-id='" +
                             util.escapeHTML( pEventId ) +
                             "']", gCalendar$ );

            focusEvent$.addClass( C_CSS_FC_HELPER );
            if ( focusEvent$ ) {
                if ( pView.type === keyBoardInfo.MONTH_VIEW ) {
                    if ( focusEvent$.length === 1 ) {
                        focusEvent$.trigger( "focus" );
                    } else {
                        focusEvent$.each( function ( i, o ) { if ( $( o ).closest( "." + C_CSS_FC_POPOVER ) ) { $( o ).trigger( "focus" ); } } );
                    }
                } else {
                    focusEvent$.first().trigger( "focus" );
                }
            }
        }

        function startEventSelection( pView ) {
            var allEvents = gCalendar.getEvents(), i;

            keyBoardInfo.dayEvents = [];
            for ( i = 0; i < allEvents.length; i++ ) {
                if ( !(
                        (  date.isAfter( allEvents[ i ].start, date.subtract( date.clone( pView.activeEnd ), 1, date.UNIT.MINUTE ) ) ) ||
                        (  allEvents[ i ].end && date.isBefore( allEvents[ i ].end, pView.activeStart ) ) ||
                        ( !allEvents[ i ].end && date.isBefore( allEvents[ i ].start, pView.activeStart ) ) ||
                        (  allEvents[ i ].id === keyBoardInfo.SELECTORID )
                    ) ) {
                    keyBoardInfo.dayEvents.push( allEvents[ i ] );
                }
            }

            keyBoardInfo.dayEvents.sort( function ( a, b ) {
                var dateA, dateB, lResult;

                function getString( a ) {
                    var r;

                    if ( a.end ) {
                        r = formatYYYYMMDDhhmmss( a.start ) +
                            ( 9999999999 - ( ( a.end - a.start ) / 60000 ) ).toString() +
                            a.title;
                    } else {
                        r = formatYYYYMMDDhhmmss( a.start ) +
                            "9999999999" +
                            a.title;
                    }
                    return r;
                }
                dateA = getString( a );
                dateB = getString( b );

                if ( dateA < dateB ) {
                    lResult = -1;
                } else if ( dateA > dateB ) {
                    lResult = 1;
                } else {
                    lResult = 0;
                }

                return lResult;
            } );

            if ( keyBoardInfo.dayEvents.length > 0 ) {
                unrenderSelectorEvent();
                keyBoardInfo.browseMode     = C_BROWSE_MODE_EVENTS;
                keyBoardInfo.activeDayEvent = 0;
                if ( pView.type === C_MONTH_VIEW ) {
                    openMoreEvents( formatYYYYMMDD( keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].start, "-" ) );
                }

                focusEvent( pView, keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].id );
            }
            return ( keyBoardInfo.dayEvents.length > 0 );
        }

        function initKeyboardMode( view ) {
            var cursorStart,
                cursorEnd,
                validRange = gCalendar.getOption( "validRange" );

            if ( view.type !== keyBoardInfo.LIST_VIEW ) {
                if ( view.type === keyBoardInfo.MONTH_VIEW ) {
                    cursorStart = date.firstOfMonth( date.add( date.clone( view.activeStart ), 15, date.UNIT.DAY ) );
                    if ( validRange && validRange.start && date.isBefore( cursorStart, validRange.start ) ) {
                        cursorStart = validRange.start;
                    }
                    cursorEnd   = date.add( date.clone( cursorStart ), 1, date.UNIT.DAY );
                } else {
                    cursorStart = new Date( date.clone( view.activeStart ).setHours( gOptions.startingHour, 0, 0 ) );
                    cursorEnd   = date.add( new Date( date.clone( view.activeStart ).setHours( gOptions.startingHour, 0, 0 ) ), 60, date.UNIT.MINUTE );
                }


                keyBoardInfo.selectorEvent = {
                    id              : keyBoardInfo.SELECTORID,
                    title           : "",
                    allDay          : ( view.type === keyBoardInfo.MONTH_VIEW ),
                    editable        : false,
                    durationEditable: false,
                    className       : keyBoardInfo.cssClass,
                    start           : cursorStart,
                    end             : cursorEnd,
                    overlap         : true
                };

                // prevent mouse actions while keyboard mode is active
                keyBoardInfo.keyboardActive = true;
                if ( !startEventSelection( view ) ) {
                    leaveEventSelection();
                }
            }
        }

        function leaveKeyboardMode() {
            if ( keyBoardInfo.browseMode === C_BROWSE_MODE_EVENTS ) {
                leaveEventSelection();
            }
            unrenderSelectorEvent();
            keyBoardInfo.keyboardActive = false;
        }

        // Called by the APEX refresh event to refetch events
        function _refresh() {
            var eventSource = gCalendar.getEventSources()[ 0 ],
                events      = [];

            eventSource.refetch();
            events = gCalendar.getEvents();

            // remove client side added events
            for ( var i = 0; i < events.length; i++ ) {
                if ( !events[ i ].extendedProps.apexEventSource ) {
                    removeEventById( events[ i ].id );
                }
            }

            if ( keyBoardInfo.keyboardActive === true ) {
                leaveKeyboardMode();
            }

            return gFetchPromise;
        }

        function _calSelect( pSelectionInfo ) {
            var lFormat;

            if ( gCalendar.view.type === C_MONTH_VIEW ) {
                date.subtract( pSelectionInfo.end, 1, date.UNIT.MINUTE );
                lFormat = formatYYYYMMDD;
            } else {
                lFormat = formatYYYYMMDDhhmmss;
            }
            if ( gOptions.createLink && gOptions.createLink !== "" ) {
                // For the CREATE LINK we add the selected START and END dates in JS code
                // if page checksum is enabled we need the server to recalculate the URL checksum
                getUrlAndRedirectAjax( pSelectionInfo.start, pSelectionInfo.end );
            } else {
                // when no edit link is defined, fire event
                apex.event.trigger(
                    gRegion$,
                    C_DA_EVT_DATESELECT,
                    {
                        "newStartDate"      : lFormat( pSelectionInfo.start ),
                        "newEndDate"        : lFormat( pSelectionInfo.end ),
                        "dates": {
                            "newStartDate": pSelectionInfo.start,
                            "newEndDate"  : pSelectionInfo.end,
                        }
                    }
                );
            }

            // this is necessary once we have dialogs, because we wont leave the current page
            gCalendar.unselect();
            gCalendar.render();
        }

        function _eventClick( pEventClickInfo ) {
            if ( pEventClickInfo.jsEvent ) {
                pEventClickInfo.jsEvent.preventDefault();
            }

            if ( gCalendar.view.type.indexOf( C_LIST ) === 0 ) {
                if ( $( pEventClickInfo.el ).parents().hasClass( "fc-list-event-description" ) && $( pEventClickInfo.el ).prop( "tagName" ) === "A" ) {
                    return true;
                }
            }

            if ( pEventClickInfo.event.id === keyBoardInfo.SELECTORID ) {
                _calSelect( {
                    "start": date.clone( keyBoardInfo.selectorEvent.start ),
                    "end": date.clone( keyBoardInfo.selectorEvent.end ),
                    "allDay": gAllDay
                } );
            } else {
                if ( pEventClickInfo.event.extendedProps.url ) {
                    apex.navigation.redirect( pEventClickInfo.event.extendedProps.url );
                } else {
                    apex.event.trigger(
                        gRegion$,
                        C_DA_EVT_EVTSELECT,
                        {
                            "event": pEventClickInfo.event.toPlainObject( { "collapseExtendedProps":true } )
                        }
                    );
                }
            }
            return false;
        }

        function checkValidity( pView, pDirection, pAmount, pUnit ) {
            var lStart,
                lEnd,
                validRange = gCalendar.getOption( "validRange" );

            if ( !validRange ) {
                return true;
            }
            if ( ( pDirection ===  1 && !validRange.end ) ||
                 ( pDirection === -1 && !validRange.start ) ) {
                return true;
            }

            if ( validRange.start ) {
                if ( pView.type === C_MONTH_VIEW ) {
                    lStart = date.startOfDay( validRange.start );
                } else {
                    lStart = validRange.start;
                }
            }
            if ( validRange.end ) {
                if ( pView.type === C_MONTH_VIEW ) {
                    lEnd = date.endOfDay( validRange.end );
                } else {
                    lEnd = validRange.end;
                }
            }

            if ( pDirection === 1 ) {
                if ( !validRange.end ) {
                    return true;
                } else if ( date.isSameOrBefore( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), lEnd ) ) {
                    return true;
                } else {
                    return false;
                }
            } else {
                if ( !validRange.start ) {
                    return true;
                } else if ( date.isSameOrAfter( date.subtract( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), lStart ) ) {
                    return true;
                } else {
                    return false;
                }
            }
        }

        // This function moves the new event selection forward or backwards
        function moveSelection( pView, pDirection, pAmount, pUnit ) {
            var changeView = false,
                isAllowed  = false,
                startOfMonth, endOfMonth;

            if ( !checkValidity( pView, pDirection, pAmount, pUnit ) ) {
                return;
            }

            switch ( pView.type ) {
                case keyBoardInfo.MONTH_VIEW:
                    isAllowed = true;
                    if ( pUnit === date.UNIT.DAY ) {
                        startOfMonth = date.firstOfMonth( keyBoardInfo.selectorEvent.start );
                        endOfMonth   = date.lastOfMonth( keyBoardInfo.selectorEvent.start );
                        while ( !gOptions.weekEnds && date.dayOfWeek( startOfMonth ) > 5 ) {
                            date.add( startOfMonth, 1, pUnit );
                        }
                        while ( !gOptions.weekEnds && date.dayOfWeek( endOfMonth ) > 5 ) {
                            date.subtract( endOfMonth, 1, pUnit );
                        }
                        if (
                            ( pDirection === 1 &&
                              ( !date.isBefore( date.add( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), endOfMonth ) )
                            ) ||
                            ( pDirection === -1 &&
                              ( date.isBefore( date.subtract( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), startOfMonth ) )
                            )
                        ) {
                            changeView = true;
                        }
                    }
                    break;
                case keyBoardInfo.WEEK_VIEW:
                    if ( pUnit === date.UNIT.DAY ) {
                        isAllowed = true;
                        if (
                            ( pDirection === 1 &&
                              ( !date.isBefore( date.add( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), pView.activeEnd ) )
                            ) ||
                            ( pDirection === -1 &&
                              ( date.isBefore( date.subtract( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), pView.activeStart ) )
                            )
                        ) {
                            changeView = true;
                        }
                    } else { // minutes
                        if (
                            ( pDirection === 1 &&
                              ( !date.isAfter( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), getDayMaxTime( date.subtract( date.clone( keyBoardInfo.selectorEvent.end ), 1, date.UNIT.MINUTE ) ) ) )
                            ) ||
                            ( pDirection === -1 &&
                              ( !date.isBefore( date.subtract( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), getDayMinTime( keyBoardInfo.selectorEvent.start ) ) )
                            )
                        ) {
                            isAllowed = true;
                        }
                    }
                    break;
                case keyBoardInfo.DAY_VIEW:
                    if ( pUnit === date.UNIT.DAY ) {
                        changeView = true;
                        isAllowed  = true;
                    } else {
                        if (
                            ( pDirection === 1 &&
                              ( !date.isAfter( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), getDayMaxTime( pView.activeStart ) ) )
                            ) ||
                            ( pDirection === -1 &&
                              ( !date.isBefore( date.subtract( date.clone( keyBoardInfo.selectorEvent.start ), pAmount, pUnit ), getDayMinTime( pView.activeStart ) ) )
                            )
                        ) {
                            isAllowed = true;
                        }
                    }
                    break;
            }

            if ( isAllowed ) {
                date.add( keyBoardInfo.selectorEvent.start, pAmount * pDirection, pUnit );
                date.add( keyBoardInfo.selectorEvent.end, pAmount * pDirection, pUnit );

                if ( pUnit === date.UNIT.DAY ) {
                    while ( !gOptions.weekEnds && date.dayOfWeek( keyBoardInfo.selectorEvent.start ) > 5 ) {
                        date.add( keyBoardInfo.selectorEvent.start, pDirection, pUnit );
                        date.add( keyBoardInfo.selectorEvent.end, pDirection, pUnit );
                    }
                }

                if ( changeView ) {
                    keyBoardInfo.viewChangeByKey = true;
                    gCalendar.gotoDate( keyBoardInfo.selectorEvent.start );
                    renderSelectorEvent();

                    if ( pView.type === keyBoardInfo.WEEK_VIEW || pView.type === keyBoardInfo.DAY_VIEW ) {
                        scrollToHour( keyBoardInfo.selectorEvent.start.getHours() );
                    }
                } else {
                    renderSelectorEvent();
                }

                if ( pView.type === keyBoardInfo.WEEK_VIEW || pView.type === keyBoardInfo.DAY_VIEW ) {
                    scrollToHour( keyBoardInfo.selectorEvent.start.getHours() );
                }

            }
        }

        function extendSelection( pView, pDirection, pAmount, pUnit ) {
            var isAllowed = false;

            if ( pDirection === -1 ) {
                if ( date.isAfter( date.subtract( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), keyBoardInfo.selectorEvent.start ) ) {
                    isAllowed = true;
                }
            } else {
                switch ( pView.type ) {
                    case keyBoardInfo.MONTH_VIEW:
                        if ( pUnit === date.UNIT.DAY ) {
                            if ( date.isBefore( date.subtract( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), 1, date.UNIT.MINUTE ), pView.activeEnd ) ) {
                                isAllowed = true;
                            }
                        }
                        break;
                    case keyBoardInfo.WEEK_VIEW:
                        if ( pUnit === date.UNIT.DAY ) {
                            if ( date.isBefore( date.subtract( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), 1, date.UNIT.MINUTE ), pView.activeEnd ) ) {
                                isAllowed = true;
                            }
                        } else {
                            if ( !date.isAfter( date.add( date.clone( keyBoardInfo.selectorEvent.end ), pAmount, pUnit ), getDayMaxTime( date.subtract( date.clone( keyBoardInfo.selectorEvent.end ), 1, date.UNIT.MINUTE ) ) ) ) {
                                isAllowed = true;
                            }
                        }
                        break;
                    case keyBoardInfo.DAY_VIEW:
                        if ( pUnit === date.UNIT.MINUTE ) {
                            if ( !date.isAfter( date.add( date.clone( keyBoardInfo.selectorEvent.end ), 30, date.UNIT.MINUTE ), getDayMaxTime( pView.activeStart ) ) ) {
                                isAllowed = true;
                            }
                        }
                        break;
                }
            }
            if ( isAllowed ) {
                date.add( keyBoardInfo.selectorEvent.end, pAmount * pDirection, pUnit );
                if ( pUnit === date.UNIT.DAY ) {
                    while ( !gOptions.weekEnds && date.dayOfWeek( date.subtract( date.clone( keyBoardInfo.selectorEvent.end ), 1, date.UNIT.MINUTE ) ) > 5 ) {
                        date.add( keyBoardInfo.selectorEvent.end, pDirection, date.UNIT.DAY );
                    }
                }
                renderSelectorEvent();
            }
            if ( pView.type === keyBoardInfo.DAY_VIEW || pView.type === keyBoardInfo.WEEK_VIEW ) {
                scrollToHour( date.subtract( date.clone( keyBoardInfo.selectorEvent.end ), 1, date.UNIT.MINUTE ).getHours() );
            }
        }

        // This function moves the event selection forward or backwards.
        function gotoEvent( pView, pDirection ) {
            $( "." + C_CSS_FC_EVENT, gCalendar$ ).removeClass( C_CSS_FC_HELPER );

            if ( pDirection === -1 ) {
                if ( keyBoardInfo.activeDayEvent > 0 ) {
                    keyBoardInfo.activeDayEvent = keyBoardInfo.activeDayEvent - 1;
                } else {
                    keyBoardInfo.activeDayEvent = keyBoardInfo.dayEvents.length - 1;
                }
            } else {
                if ( keyBoardInfo.activeDayEvent < keyBoardInfo.dayEvents.length - 1 ) {
                    keyBoardInfo.activeDayEvent = keyBoardInfo.activeDayEvent + 1;
                } else {
                    keyBoardInfo.activeDayEvent = 0;
                }
            }
            if ( pView.type === keyBoardInfo.MONTH_VIEW ) {
                closeMoreEvents();
            }

            if ( pView.type === keyBoardInfo.MONTH_VIEW ) {
                if ( date.isBefore( keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].start, pView.activeStart ) ) {
                    openMoreEvents( formatYYYYMMDD( pView.activeStart, "-" ) );
                } else {
                    openMoreEvents( formatYYYYMMDD( keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].start, "-" ) );
                }
            }

            focusEvent( pView, keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].id );
        }

        function processKeyEvents( view, e ) {
            switch ( e.which ) {
                case 27:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        if ( !startEventSelection( view ) ) {
                            leaveKeyboardMode();
                        }
                    } else {
                        leaveKeyboardMode();
                    }
                    e.preventDefault();
                    break;

                case 78:
                    if ( e.shiftKey && keyBoardInfo.browseMode === C_BROWSE_MODE_EVENTS ) {
                        leaveEventSelection();
                    }
                    e.preventDefault();
                    break;

                case 13:
                case 32:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        _calSelect( {
                            "start": date.clone( keyBoardInfo.selectorEvent.start ),
                            "end": date.clone( keyBoardInfo.selectorEvent.end ),
                            "allDay": gAllDay
                        } );
                    } else {
                        _eventClick( {
                            "event": keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ],
                            "el": $( "a[data-id='" + keyBoardInfo.dayEvents[ keyBoardInfo.activeDayEvent ].id + "']", gCalendar$ )[ 0 ]
                        } );
                    }
                    e.preventDefault();
                    break;

                case 38:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_EVENTS ) {
                        gotoEvent( view, -1 );
                    } else {
                        if ( view.type === keyBoardInfo.WEEK_VIEW || view.type === keyBoardInfo.DAY_VIEW ) {
                            if ( e.shiftKey ) {
                                extendSelection( view, -1, 30, date.UNIT.MINUTE );
                            } else {
                                moveSelection( view, -1, 30, date.UNIT.MINUTE );
                            }
                        } else {
                            if ( e.shiftKey ) {
                                extendSelection( view, -1, 7, date.UNIT.DAY );
                            } else {
                                moveSelection( view, -1, 7, date.UNIT.DAY );
                            }
                        }
                    }
                    e.preventDefault();
                    break;
                case 9:
                    leaveKeyboardMode();
                    break;
                case 40:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_EVENTS ) {
                        gotoEvent( view, 1 );
                    } else {
                        if ( view.type === keyBoardInfo.WEEK_VIEW || view.type === keyBoardInfo.DAY_VIEW ) {
                            if ( e.shiftKey ) {
                                extendSelection( view, 1, 30, date.UNIT.MINUTE );
                            } else {
                                moveSelection( view, 1, 30, date.UNIT.MINUTE );
                            }
                        } else {
                            if ( e.shiftKey ) {
                                extendSelection( view, 1, 7, date.UNIT.DAY );
                            } else {
                                moveSelection( view, 1, 7, date.UNIT.DAY );
                            }
                        }
                    }
                    e.preventDefault();
                    break;
                case keyBoardInfo.KEY_NEXT:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        if ( !e.shiftKey ) {
                            moveSelection( view, 1, 1, date.UNIT.DAY );
                        } else {
                            extendSelection( view, 1, 1, date.UNIT.DAY );
                        }
                    }
                    e.preventDefault();
                    break;
                case keyBoardInfo.KEY_PREV:
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        if ( !e.shiftKey ) {
                            moveSelection( view, -1, 1, date.UNIT.DAY );
                        } else {
                            extendSelection( view, -1, 1, date.UNIT.DAY );
                        }
                    }
                    e.preventDefault();
                    break;
                case 33:  // PGUP
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        switch ( view.type ) {
                            case keyBoardInfo.WEEK_VIEW:
                                moveSelection( view, -1, 7, date.UNIT.DAY );
                                break;
                            case keyBoardInfo.DAY_VIEW:
                                moveSelection( view, -1, 1, date.UNIT.DAY );
                                break;
                            case keyBoardInfo.MONTH_VIEW:
                                moveSelection( view, -1, date.lastOfMonth( date.subtract( date.clone( view.activeStart ), 15, date.UNIT.DAY ) ).getDate(), date.UNIT.DAY );
                                break;
                        }
                    }
                    e.preventDefault();
                    break;
                case 34:  // PGDOWN
                    if ( keyBoardInfo.browseMode === C_BROWSE_MODE_CALENDAR ) {
                        switch ( view.type ) {
                            case keyBoardInfo.WEEK_VIEW:
                                moveSelection( view, 1, 7, date.UNIT.DAY );
                                break;
                            case keyBoardInfo.DAY_VIEW:
                                moveSelection( view, 1, 1, date.UNIT.DAY );
                                break;
                            case keyBoardInfo.MONTH_VIEW:
                                moveSelection( view, 1, date.lastOfMonth( date.add( date.clone( view.activeStart ), 15, date.UNIT.DAY ) ).getDate(), date.UNIT.DAY );
                                break;
                        }
                    }
                    e.preventDefault();
                    break;

            }
        }

        // *****************************************************************************
        // A J A X - C A L L S
        // *****************************************************************************

        function _setTooltip( element, pEvent ) {
            var dateDisplay, tooltip;

            if ( pEvent.id !== keyBoardInfo.SELECTORID && pEvent.title && pEvent.start ) {
                if ( pEvent.end ) {
                    if ( pEvent.allDay ) {
                        if ( date.isBefore( date.subtract( date.clone( pEvent.end ), 1, date.UNIT.DAY ), pEvent.start ) ) {
                            dateDisplay = gCalendar.formatRange( pEvent.start, pEvent.end, { "isEndExclusive": true } );
                        } else {
                            dateDisplay = gCalendar.formatRange( pEvent.start, subtractDayIfRequired( pEvent ).end, { "isEndExclusive": true } );
                        }
                    } else {
                        dateDisplay = formatTimeRange( pEvent.start, pEvent.end );
                    }
                } else {
                    if ( pEvent.allDay ) {
                        dateDisplay = gCalendar.formatDate( pEvent.start, { "month": "long", "year": "numeric", "day": "numeric" } );
                    } else {
                        dateDisplay = formatTime( pEvent.start, true );
                    }
                }

                tooltip =
                    '<span class="tt-title">' +
                    ( eventEscaping( pEvent ) ? util.escapeHTML( pEvent.title ) : pEvent.title ) +
                    '</span><br>';
                tooltip = tooltip + dateDisplay + "<br><br>";

                if ( pEvent.extendedProps.description ) {
                    tooltip = tooltip +
                              ( eventEscaping( pEvent ) ? util.escapeHTML( pEvent.extendedProps.description ) : pEvent.extendedProps.description );
                }
                $( element ).tooltip( {
                                          show        : apex.tooltipManager.defaultShowOption(),
                                          items       : "a." + C_CSS_FC_EVENT,
                                          position    : { my: "left top+15", at: "left center", collision: "flipfit" },
                                          content     : tooltip,
                                          classes     : { "ui-tooltip": "ui-widget-content ui-corner-all ui-widget ui-tooltip " + C_CSS_FC_TOOLTIP }
                                      } );
            }
        }

        function _removeTooltips() {
            $( "." + C_CSS_FC_TOOLTIP ).remove();
        }

        function _eventRender( pInfo ) {
            var event    = pInfo.event,
                element$ = $( pInfo.el );

            // do not process newly clicked events & "helper" events from keyboard navigation
            if ( ( !event._def.title && !event._def.url ) || event.id === keyBoardInfo.SELECTORID ) {
                return;
            }

            element$.attr( "data-id", event.id );

            if ( event.source ) {
                if ( event.extendedProps.apexEventSource === C_EVENT_SOURCE_SQL ) {
                    element$.find( "div.fc-event-title" ).html( event.title );
                }
            }

            // add a tabindex for allow tabbing through events
            element$.attr( "tabindex", "0" );

            if ( gOptions.mouseHoverOver ) {
                _setTooltip( element$, event );
            }
        }

        function _eventContent( pInfo ) {
            var event   = pInfo.event,
                view    = pInfo.view,
                content = "";

            // build html for event content
            if ( view.type.indexOf( C_LIST ) === 0 ) {
                if ( event.url ) {
                    content = '<td class="fc-list-event-title"><a href="' + event.url + '">' + event.title + '</a></td>';
                } else {
                    content = '<td class="fc-list-event-title">' + event.title + '</td>';
                }
                // add tooltip contents as we did in our own list view in earlier releases
                if ( event.extendedProps.description ) {
                    content += '<div class="fc-list-event-description">' + event.extendedProps.description + '</div>';
                }
            } else {
                content = '<div class="fc-event-title fc-sticky">' + event.title + '</div>';
            }

            return { html: content };
        }

        function _eventsSet() {
            _removeTooltips();
        }

        function _eventAfterAllRender( pView ) {
            $( ".fc-prev-button", gCalendar$ ).attr( "title", apex.lang.getMessage( "APEX.GV.PREV_PAGE" ) );
            $( ".fc-prev-button", gCalendar$ ).attr( "aria-label", apex.lang.getMessage( "APEX.GV.PREV_PAGE" ) );
            $( ".fc-next-button", gCalendar$ ).attr( "title", apex.lang.getMessage( "APEX.GV.NEXT_PAGE" ) );
            $( ".fc-next-button", gCalendar$ ).attr( "aria-label", apex.lang.getMessage( "APEX.GV.NEXT_PAGE" ) );
            $( "div." + C_CSS_FC_VIEW_CONT + " div." + C_CSS_FC_VIEW, gCalendar$ ).attr( "tabindex", "0" );
            if ( pView.type.indexOf( C_LIST ) !== 0 ) {
                $( "div." + C_CSS_FC_VIEW_CONT + " div." + C_CSS_FC_VIEW + " ." + C_CSS_FC_EVENT, gCalendar$ ).attr( "tabindex", "-1" );
            }

            if ( pView.type.indexOf( C_LIST ) === 0 ) {
                $( "table.fc-list-table", gCalendar$ ).attr( "role", "presentation" );
                $( "tr.fc-list-day > td" ).attr( "role", "heading" );
                $( "tr.fc-list-day > td" ).attr( "aria-level", "3" );
            }

            if ( apex.clipboard.isSupported ) {
                apex.clipboard.addHandler(
                    $( "." + C_CSS_FC_VIEW, gCalendar$ ),
                    function ( pDtWrapper ) {
                        var lText = "",
                            lEventList, i;

                        lEventList  = gCalendar.getEvents();

                        lText = lText + apex.lang.getMessage( "APEX.CALENDAR.EVENT_START" )       + "\t" +
                                        apex.lang.getMessage( "APEX.CALENDAR.EVENT_END" )         + "\t" +
                                        apex.lang.getMessage( "APEX.CALENDAR.EVENT_TITLE" )       + "\t" +
                                        apex.lang.getMessage( "APEX.CALENDAR.EVENT_DESCRIPTION" ) + "\t" +
                                        apex.lang.getMessage( "APEX.CALENDAR.EVENT_ID" )          + "\r\n";

                        for ( i = 0; i < lEventList.length; i++ ) {
                            if ( date.isSameOrAfter( lEventList[ i ].start, pView.activeStart ) && (
                                 !lEventList[ i ].end ||
                                 date.isSameOrBefore( lEventList[ i ].end, pView.activeEnd ) ) ) {

                                lText = lText + gCalendar.formatDate( lEventList[ i ].start, { "month": "long", "year": "numeric", "day": "numeric" } ) + "\t";
                                if ( lEventList[ i ].end ) {
                                    lText = lText + gCalendar.formatDate( lEventList[ i ].end, { "month": "long", "year": "numeric", "day": "numeric" } );
                                }

                                lText = lText + "\t" + util.stripHTML( lEventList[ i ].title ) + "\t";
                                if ( lEventList[ i ].extendedProps.description ) {
                                    lText = lText + util.stripHTML( lEventList[ i ].extendedProps.description );
                                }
                                if ( lEventList[ i ].id ) {
                                    lText = lText + "\t";
                                    if ( lEventList[ i ].id.indexOf( C_GENERATED_ID_PREFIX ) === 0 ) {
                                        lText = lText + lEventList[ i ].id.substr( C_GENERATED_ID_PREFIX.length );
                                    } else {
                                        lText = lText + util.stripHTML( lEventList[ i ].id );
                                    }
                                }
                                lText = lText + "\r\n";
                            }
                        }

                        pDtWrapper.setData( "text", lText );
                        return pDtWrapper; } );
            }
            gRegion$.trigger( "afterAllRender" );
        }

        function _viewRender( pDateInfo ) {
            var view      = pDateInfo.view;

            // when there's no "last view", deactivate Keyboard Mode
            if ( !gCalStorage || !gCalStorage.getItem( C_LOCALSTORAGE_LASTVIEW ) ||
                 JSON.parse( gCalStorage.getItem( C_LOCALSTORAGE_LASTVIEW ) ).viewType !== view.type ) {
                leaveKeyboardMode();
            }

            if ( !gOptions.viewRange ) {
                if ( gCalStorage && gCalStorage.getItem( C_LOCALSTORAGE_LASTVIEW ) ) {
                    gOptions.viewRange = JSON.parse( gCalStorage.getItem( C_LOCALSTORAGE_LASTVIEW ) ).viewType;
                } else {
                    gOptions.viewRange = C_MONTH_VIEW;
                }
            }

            if ( view.type === C_LIST ) {
                if ( !gOptions.viewRange || gOptions.viewRange === C_MONTH_VIEW ) {
                    gCalendar.changeView( C_LISTMONTH );
                } else if ( gOptions.viewRange === C_WEEK_VIEW ) {
                    gCalendar.changeView( C_LISTWEEK );
                } else if ( gOptions.viewRange === C_DAY_VIEW ) {
                    gCalendar.changeView( C_LISTDAY );
                }
            }

            if ( view.type.indexOf( C_LIST ) === 0 ) {
                $( "." + C_CSS_FC_APXLISTBUTTON, gCalendar$ ).prop( "disabled", true );
            } else {
                $( "." + C_CSS_FC_APXLISTBUTTON, gCalendar$ ).prop( "disabled", false );
            }

            if ( view.type === C_MONTH_VIEW ) {
                $( ".fc-" + C_MONTH_VIEW + "-button", gCalendar$ ).prop( "disabled", true );
            } else {
                $( ".fc-" + C_MONTH_VIEW + "-button", gCalendar$ ).prop( "disabled", false );
            }

            if ( view.type === C_WEEK_VIEW ) {
                $( ".fc-" + C_WEEK_VIEW + "-button", gCalendar$ ).prop( "disabled", true );
            } else {
                $( ".fc-" + C_WEEK_VIEW + "-button", gCalendar$ ).prop( "disabled", false );
            }

            if ( view.type === C_DAY_VIEW ) {
                $( ".fc-" + C_DAY_VIEW + "-button", gCalendar$ ).prop( "disabled", true );
            } else {
                $( ".fc-" + C_DAY_VIEW + "-button", gCalendar$ ).prop( "disabled", false );
            }

            removeEventById( keyBoardInfo.SELECTORID );

            gOptions.viewRange = view.type;

            // when view changed by clicking a button, deactivate Keyboard Mode
            if ( !keyBoardInfo.viewChangeByKey ) {
                leaveKeyboardMode();
            } else {
                keyBoardInfo.viewChangeByKey = false;
            }
            // Responsive View change can only be towards "list" view
            if ( view.type.indexOf( C_LIST ) !== 0 ) {
                gLastViewResponsive = false;
            }

            // set new view in local storage
            gCalStorage.setItem( C_LOCALSTORAGE_LASTVIEW, JSON.stringify( {
                                                                 viewType        : view.type,
                                                                 viewStartDate   : view.currentStart,
                                                                 viewEndDate     : view.currentEnd
                                                             } ) );

            // fire event for dynamic action
            apex.event.trigger(
                gRegion$,
                C_DA_EVT_VIEWCHANGE,
                {
                    "viewType" : view.type,
                    "startDate": formatYYYYMMDDhhmmss( view.currentStart ),
                    "endDate"  : formatYYYYMMDDhhmmss( date.subtract( date.clone( view.currentEnd ), 1, date.UNIT.SECOND ) ),
                    "viewStartDate": formatYYYYMMDDhhmmss( view.activeStart ),
                    "viewEndDate"  : formatYYYYMMDDhhmmss( date.subtract( date.clone( view.activeEnd ), 1, date.UNIT.SECOND ) ),
                    "dates": {
                        "startDate": view.currentStart,
                        "endDate"  : date.subtract( date.clone( view.currentEnd ), 1, date.UNIT.SECOND ),
                        "viewStartDate": view.activeStart,
                        "viewEndDate"  : date.subtract( date.clone( view.activeEnd ), 1, date.UNIT.SECOND )
                    }
                }
            );

            // patch jQuery fullcalendar markup to be consumable by screenreaders
            //

            if ( view.type === C_MONTH_VIEW || view.type === C_WEEK_VIEW || view.type === C_DAY_VIEW ) {
                $( "." + C_CSS_FC_VIEW + " > table", gCalendar$ ).attr( "role", "presentation" );
                $( "." + C_CSS_FC_VIEW + " > table > tbody.fc-body table", gCalendar$ ).attr( "role", "presentation" );
                $( "." + C_CSS_FC_VIEW + " > table > thead.fc-head table", gCalendar$ ).attr( "role", "presentation" );
                $( "." + C_CSS_FC_VIEW + " > table > thead.fc-head table > thead > tr > th ", gCalendar$ ).attr( "scope", "col" );
            }

            if ( gOptions.keyBoardSupport ) {
                $( "." + C_CSS_FC_VIEW + ",." + C_CSS_FC_POPOVER, gCalendar$ ).off( "keydown", viewEventHandler );
                $( "." + C_CSS_FC_VIEW + ",." + C_CSS_FC_POPOVER, gCalendar$ ).on( "keydown", viewEventHandler );
            }

            _eventAfterAllRender( view );
        }

        function _windowResize( pArg ) {
            var lView = pArg.view || {},
                lWidth = $( window ).width();
            if ( lView.type === C_MONTH_VIEW || lView.type === C_WEEK_VIEW ) {
                if ( $( window ).width() < 700 ) {
                    gLastViewResponsive = lView.type;
                    gCalendar.changeView( ( lView.type === C_MONTH_VIEW ? C_LISTMONTH : C_LISTWEEK ) );
                    gCalendar.setOption( "aspectRatio", _calcAspectRatio() );
                }
            } else if ( lView.type.indexOf( C_LIST ) === 0 ) {
                if ( lWidth > 700 && gLastViewResponsive ) {
                    gCalendar.changeView( gLastViewResponsive );
                    gCalendar.setOption( "aspectRatio", _calcAspectRatio() );
                    gLastViewResponsive = false;
                }
            }
        }

        // Issues an AJAX call to update the event on the server in case a user dragged or resized it
        function _changeEvent( pEvent, pDurationDelta, pRevertFunction ) {
            if ( pEvent.extendedProps.apexEventSource === C_EVENT_SOURCE_SQL ) {
                server.plugin(
                    gOptions.ajaxIdentifier,
                    {
                        x01      : "CHANGE",
                        x02      : formatYYYYMMDDhhmmss( pEvent.start ),
                        x03      : ( ( pEvent.end !== null ) ? formatYYYYMMDDhhmmss( subtractDayIfRequired( pEvent ).end ) : null ),
                        x04      : pEvent.id,
                        x05      : pEvent.extendedProps.checksum,
                        pageItems: gOptions.pageItems
                    },
                    {
                        refreshObject: gRegion$,
                        success      : function ( data ) {
                            apex.event.trigger(
                                gRegion$,
                                C_DA_EVT_DRAGDROP_DONE,
                                data
                            );
                        },
                        error        : function ( pjqXHR, pTextStatus, pErrorThrown ) {
                            // Revert drag and drop or resize operation if an error occurred on the backend
                            apex.event.trigger(
                                gRegion$,
                                C_DA_EVT_DRAGDROP_ERR,
                                pErrorThrown
                            );
                            pRevertFunction();
                        }
                    }
                );
            } else {
                pRevertFunction();
            }
        }

        function _eventDrop( pEventDropInfo ) {
            if ( !apex.event.gCancelFlag ) {
                _changeEvent( pEventDropInfo.event, pEventDropInfo.delta, pEventDropInfo.revert );
            } else {
                pEventDropInfo.revert();
            }
        }

        function _eventDrag( pEventDragInfo ) {
            apex.event.trigger(
                gRegion$,
                C_DA_EVT_DRAGDROP_STRT,
                pEventDragInfo.event.toPlainObject( { "collapseExtendedProps":true } )
            );
        }

        // Issues an AJAX call to update the event on the server in case a user changed the end date of an event
        function _eventResize( pEventResizeInfo ) {
            _changeEvent( pEventResizeInfo.event, { "startDelta": pEventResizeInfo.startDelta, "endDelta": pEventResizeInfo.endDelta }, pEventResizeInfo.revert );
        }

        // Populates the FullCalendar with new events by issuing an AJAX request to the server
        function _getEvents( pFetchInfo, pSuccessCallback, pErrorCallback ) {

            function _prepareData( pData ) {
                var lData;

                if ( pData ) {
                    lData = makeEndDateInclusive( pData );

                    for ( var i = 0; i < lData.length; i++ ) {

                        if ( !lData[ i ].id || lData[ i ].id === "" ) {
                            lData[ i ].id = getNextId();
                        }

                        lData[ i ].extendedProps                 = {};
                        lData[ i ].extendedProps.description     = lData[ i ].description;
                        lData[ i ].extendedProps.checksum        = lData[ i ].checksum;
                        lData[ i ].extendedProps.displayOrder    = lData[ i ].displayOrder;
                        lData[ i ].extendedProps.apexEventSource = C_EVENT_SOURCE_SQL;

                        // bug-37074971: new action links lead to double executing of the event URL (e.g. opening a dialog twice)
                        // this is caused by actions.js logic which listens to all link clicks where action syntax is used inside a.href
                        // and fullcalendar also has it's own link/click handling in _eventClick function.
                        // so we remap url property to use extendedProps.url in our own click handler but set the standard event url property to "#"
                        // which has 2 benefits:
                        // - calendar still renders a link inside the event (accessibility, mouse cursor etc)
                        // - actions.js logic does not kick in as a.href does not use special action syntax anymore
                        if ( lData[ i ].url ) {
                            lData[ i ].extendedProps.url = lData[ i ].url;
                            lData[ i ].url = "#";
                        }
                    }
                }
                return lData;
            }

            // use static data after initial page load
            if ( gStaticData.length > 0 && !gStaticDataLoaded ) {

                // check if stored view date range is within provided static data range
                if ( gLastView ) {
                    if ( date.isValidString( gLastView.viewStartDate ) &&
                         ( new Date( gLastView.viewStartDate ) > new Date( gStaticData[ 0 ].end ) ) &&
                         ( new Date( gLastView.viewEndDate ) < new Date( gStaticData[ gStaticData.length - 1 ].start ) ) ) {
                        gStaticData = _prepareData( gStaticData );
                        gStaticDataLoaded = true;
                        pSuccessCallback( gStaticData );
                        return;
                    }
                } else {
                    gStaticData = _prepareData( gStaticData );
                    gStaticDataLoaded = true;
                    pSuccessCallback( gStaticData );
                    return;
                }
            }

            // make ajax call, to get events objects
            gFetchPromise = server.plugin( gOptions.ajaxIdentifier, {
                x01: "GET", /* action */
                x02: formatYYYYMMDDhhmmss( pFetchInfo.start ),
                x03: formatYYYYMMDDhhmmss( pFetchInfo.end ),
                pageItems: gOptions.pageItems
            }, {
                refreshObject: gRegion$,
            } );

            gFetchPromise.done( function( pData ) {

                var theData, changedData;
                theData = _prepareData( pData );

                if ( typeof gOptions.dataFilter === "function" ) {
                    changedData = gOptions.dataFilter( theData );
                    if ( changedData ) {
                        theData = changedData;
                    }
                }
                pSuccessCallback( theData );

            } ).fail( function( jqXHR, textStatus, errorThrown ) {

                pErrorCallback( errorThrown );

            } );
        }

        function viewEventHandler( e ) {
            var view = gCalendar.view;
            if ( keyBoardInfo.keyboardActive ) {
                switch ( view.type ) {
                    case C_MONTH_VIEW:
                    case C_WEEK_VIEW:
                    case C_DAY_VIEW:
                        processKeyEvents( view, e );
                        break;
                }
            } else {
                if ( view.type.indexOf( C_LIST ) !== 0 && (
                    $( "." + C_CSS_FC_VIEW, gCalendar$ ).is( ":focus" ) ||
                    $( "." + C_CSS_FC_POPOVER, gCalendar$ ).is( ":focus" )
                ) && (
                    e.which === 37 ||
                    e.which === 39 ||
                    e.which === 40 ||
                    e.which === 38 ||
                    e.which === 13 ||
                    e.which === 34 ||
                    e.which === 33 ||
                    e.which === 32 )
                ) {
                    e.preventDefault();
                    initKeyboardMode( view );
                }
                if ( apex.clipboard.isSupported &&
                     $( "." + C_CSS_FC_VIEW, gCalendar$ ).is( ":focus" ) && (
                        ( ( e.metaKey || e.ctrlKey ) && e.which === 67 ) || // 67=C (OSX uses meta Windows uses ctrl)
                        ( e.shiftKey && e.which === 121 )
                    )
                ) {
                    apex.clipboard.copy();
                    e.preventDefault();
                }
            }
        }

        function _init() {
            // setup options to initialize FullCalendar object
            var currentDate = new Date(),   //the date we want calendar to start from
                changedCalOptions,
                calOptions,
                windowResizeFunction,
                actionContext;

            gOptions = $.extend( {
                enableDragAndDrop: false,
                pageItems        : ""
                }, pOptions );

            gRegion$   = $( "#" + gOptions.regionId, apex.gPageContext$ );
            gCalendar$ = $( "#" + gOptions.regionId + "_calendar", apex.gPageContext$ );

            // if there is no region container, add one on the fly. It's necessary for our refresh mechanism
            if ( gRegion$.length === 0 ) {
                gRegion$ = gCalendar$.wrap(
                    util.htmlBuilder().markup( "<div" ).attr( "id", gOptions.regionId ).markup( "></div>" ).toString()
                );
            }

            gDefaults  = FullCalendar.BASE_OPTION_DEFAULTS;
            gLocale    = FullCalendar.globalLocales.find( function( locale ) { return locale.code === gOptions.locale; } ) || {};
            gStaticData = pStaticData || [];
            gStaticDataLoaded = false;

            gOptions = $.extend( {}, gDefaults, gOptions );

            // user will choose own settings 12 or 24

            if ( gOptions.timeFormatType === "24" ) {
                gOptions.eventTimeFormat = {
                    hour: 'numeric',
                    minute: '2-digit',
                    omitZeroMinute: false,
                    meridiem: 'short',
                    hour12: false
                };
                gOptions.slotLabelFormat = {
                    hour: 'numeric',
                    minute: '2-digit',
                    omitZeroMinute: false,
                    meridiem: 'short',
                    hour12: false
                };
            } else if ( gOptions.timeFormatType === "12" ) {
                gOptions.eventTimeFormat = {
                    hour: 'numeric',
                    minute: '2-digit',
                    omitZeroMinute: true,
                    meridiem: 'short',
                    hour12: true
                };
                gOptions.slotLabelFormat = {
                    hour: 'numeric',
                    minute: '2-digit',
                    omitZeroMinute: true,
                    meridiem: 'short',
                    hour12: true
                };
            }

            // display time part in list views
            gOptions.views = {
                listMonth: {
                    displayEventTime: true,
                    displayEventEnd: true
                },
                listWeek: {
                    displayEventTime: true,
                    displayEventEnd: true
                },
                listDay: {
                    displayEventTime: true,
                    displayEventEnd: true
                }
            };

            // make some updates from the defaults values

            //make sure if no drag&drop, it is totally disabled
            if ( gOptions.enableDragAndDrop ) {
                // adjust the resize depending on drag and drop and end column
                if ( gOptions.enableResizing ) {
                    gOptions.eventStartEditable    = true;
                    gOptions.eventDurationEditable = true;
                    gOptions.editable              = true;
                } else {
                    gOptions.editable              = true;
                    gOptions.eventStartEditable    = true;
                    gOptions.eventDurationEditable = false;
                }
            } else {
                gOptions.eventStartEditable    = false;
                gOptions.eventDurationEditable = false;
                gOptions.editable              = false;
            }

            gOptions.keyBoardSupport = true;

            // The session storage to keep track of the calendar view, date changes
            gCalStorage = apex.storage.getScopedSessionStorage( {
                                                                    prefix   : "ORA_WWV_apex.Calendar",
                                                                    useAppId : true,
                                                                    usePageId: true,
                                                                    regionId : gOptions.regionId
                                                                } );

            //if the item already exists, make sure we know where the user was (view and date)
            gLastView = gCalStorage.getItem( C_LOCALSTORAGE_LASTVIEW );

            //if item lastview exists then try to parse it
            if ( gLastView ) {
                try {
                    gLastView = JSON.parse( gLastView );
                    // is this a good json object ? then check if it has the correct date objects
                    if ( gLastView !== null ) {
                        if ( date.isValidString( gLastView.viewStartDate ) ) {
                            currentDate = new Date( gLastView.viewStartDate );
                        }
                    }
                } catch ( ex ) {
                    currentDate = new Date();     //make sure the start date is today
                    gLastView = null;         //make sure this is set to null
                }
            }

            // previous and next keys are different in RTL
            if ( gOptions.isRTL ) {
                keyBoardInfo.KEY_PREV = 39;
                keyBoardInfo.KEY_NEXT = 37;
            }

            if ( gOptions.hasListView ) {
                windowResizeFunction = _windowResize;
            }

            calOptions = {
                customButtons: {
                    apexListButton: {
                        text: ( ( gLocale && gLocale.buttonText && gLocale.buttonText[C_LIST] ) ? gLocale.buttonText[C_LIST] : C_LIST ),
                        click: function () {
                            if ( !gOptions.viewRange || gOptions.viewRange === C_MONTH_VIEW ) {
                                gCalendar.changeView( C_LISTMONTH );
                            } else if ( gOptions.viewRange === C_WEEK_VIEW ) {
                                gCalendar.changeView( C_LISTWEEK );
                            } else if ( gOptions.viewRange === C_DAY_VIEW ) {
                                gCalendar.changeView( C_LISTDAY );
                            }
                        }
                    }
                },
                themeSystem              : "standard",
                locale                   : gOptions.locale,
                headerToolbar            : JSON.parse( gOptions.calendarHeader ),
                views                    : gOptions.views,
                displayEventTime         : false,
                dayHeaderFormat          : gOptions.columnFormat,
                initialView              : gOptions.defaultView,
                titleFormat              : gOptions.titleFormat,
                eventTimeFormat          : gOptions.eventTimeFormat,
                slotLabelFormat          : gOptions.slotLabelFormat,
                firstDay                 : gOptions.firstDayOfWeek,
                direction                : ( ( gOptions.isRTL ) ? "rtl" : "ltr" ),
                editable                 : gOptions.editable,
                eventStartEditable       : gOptions.eventStartEditable,
                eventDurationEditable    : gOptions.eventDurationEditable,
                nextDayThreshold         : "00:00:00",
                weekends                 : gOptions.weekEnds,
                dayMaxEventRows          : ( parseInt( gOptions.eventLimit, 10 ) < 2 ? 2 : parseInt( gOptions.eventLimit, 10 ) ),
                defaultTimedEventDuration: "01:00",
                aspectRatio              : _calcAspectRatio(),
                scrollTime               : lPadTime( gOptions.startingHour ),
                slotMinTime              : gOptions.minTime || "00:00:00",
                slotMaxTime              : gOptions.maxTime || "23:59:59",
                initialDate              : currentDate,
                events                   : _getEvents,
                eventResize              : _eventResize,
                eventDrop                : _eventDrop,
                eventDragStart           : _eventDrag,
                eventClick               : _eventClick,
                windowResize             : windowResizeFunction,
                select                   : _calSelect,
                slotEventOverlap         : false,
                selectable               : true,
                selectMirror             : true,
                fixedWeekCount           : false,
                eventDidMount            : _eventRender,
                eventContent             : _eventContent,
                datesSet                 : _viewRender,
                eventsSet                : _eventsSet            };

            if ( calOptions.initialView === date.UNIT.MONTH ) { calOptions.initialView = C_MONTH_VIEW; }
            if ( calOptions.initialView === date.UNIT.WEEK ) { calOptions.initialView = C_WEEK_VIEW; }
            if ( calOptions.initialView === date.UNIT.DAY ) { calOptions.initialView = C_DAY_VIEW; }

            if ( gOptions.eventSorting === C_EVENT_SORT_REGION_SOURCE ) { calOptions.eventOrder = "extendedProps.displayOrder"; }

            if ( typeof pPluginInitJavascript === "function" ) {
                changedCalOptions = pPluginInitJavascript( calOptions );
                if ( changedCalOptions ) {
                    if ( changedCalOptions.dataFilter && typeof changedCalOptions.dataFilter === "function" ) {
                        gOptions.dataFilter       = changedCalOptions.dataFilter;
                    }
                    if ( changedCalOptions.endDateExclusive ) {
                        gOptions.endDateExclusive = true;
                    }
                    if ( changedCalOptions.disableKeyboardSupport ) {
                        gOptions.keyBoardSupport  = false;
                    }
                    if ( changedCalOptions.listViewAlwaysShowMonth ) {
                        gOptions.listViewAlwaysShowMonth = changedCalOptions.listViewAlwaysShowMonth;
                    }
                    calOptions = changedCalOptions;
                }
            }

            // create calendar & render
            gCalendar = new FullCalendar.Calendar( gCalendar$[ 0 ], calOptions );
            gCalendar$.data( "fullCalendar", gCalendar );
            gCalendar.render();


            if ( gOptions.keyBoardSupport ) {
                $( "." + C_CSS_FC_VIEW + ",." + C_CSS_FC_POPOVER, gCalendar$ ).off( "keydown", viewEventHandler );
                $( "." + C_CSS_FC_VIEW + ",." + C_CSS_FC_POPOVER, gCalendar$ ).on( "keydown", viewEventHandler );
            }

            widget.util.onVisibilityChange( gRegion$[ 0 ], function( show ) {
                if ( show ) {
                    gCalendar.render();
                    gCalendar.setOption( "aspectRatio", _calcAspectRatio() ); // re-calculate aspect ratio, useful when calendar initially hidden
                }
            } );

            // when calendar container is resized the size has to be updated
            widget.util.onElementResize( gCalendar$[ 0 ], function () {
                gCalendar.updateSize();
            } );

            gRegion$.on( "apexrefresh", function () {
                _refresh();
            } );

            gCalendar$.on( "apexafterclosedialog", function () {
                // refresh your calendar region, do you have a refresh method, if so...
                _refresh();
            } );

            // -----------------------------------------------------------------
            // Register the Calendar with the region interface (feature #1794)
            //
            apex.region.create( gOptions.regionId, {
                type: "FullCalendar",
                widgetName: "fullCalendar",
                filterRegionId: gOptions.filterRegionId,
                refresh: function() {
                    return _refresh();
                },
                focus: function() {
                    gCalendar$.find( "div." + C_CSS_FC_VIEW ).trigger( "focus" );
                },
                widget: function() {
                    return gCalendar$;
                }
            } );

            // Add actions
            actionContext = actions.createContext( "FullCalendar", gRegion$, gOptions.regionId );

            actionContext.add([
                {
                    name: "download",
                    action: function( event, focusElement, args ) {
                        widget.fullCalendar.download( args.format );
                    }
                }
            ]);

            // make sure the user goes back to his previous view
            if ( gLastView !== null ) {
                if ( date.isValidString( gLastView.viewStartDate ) ) {
                    if ( gLastView.viewType === C_MONTH_VIEW ||
                         ( gLastView.viewType === C_WEEK_VIEW && gOptions.showTime ) ||
                         ( gLastView.viewType === C_DAY_VIEW && gOptions.showTime ) ||
                         gLastView.viewType.indexOf( C_LIST ) === 0
                    ) {
                        if ( gLastView.viewType !== gCalendar.view.type ) {
                            // setTimeout needed because otherwise fullcalender refetches events from db on changeView
                            setTimeout( function() {
                                gCalendar.changeView( gLastView.viewType );
                            }, 50 );
                        }
                    }
                }
            }

        }

        _init();


        // *****************************************************************************
        // E X P O S E D   F U N C T I O N S
        // *****************************************************************************

        widget.fullCalendar.download = function ( pFormat ) {

            var lView, lUrl;

            lView = gCalendar.view;
            lUrl  = server.pluginUrl(
                gOptions.ajaxIdentifier,
                {
                    x01      : "DOWNLOAD",
                    x02      : formatYYYYMMDDhhmmss( lView.activeStart ),
                    x03      : formatYYYYMMDDhhmmss( lView.activeEnd ),
                    x06      : lView.type,
                    x07      : lView.title,
                    x10      : pFormat,
                    pageItems: gOptions.pageItems
                }
            );

            navigation.redirect( lUrl );
        };

    }; // fullCalendar

} )( apex.widget, apex.util, apex.server, apex.navigation, apex.date, apex.jQuery, apex.actions );
