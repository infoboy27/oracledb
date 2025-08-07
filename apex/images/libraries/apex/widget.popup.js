/*!
 Popup - a jQuery UI based widget based on dialog
 Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
 */
(function ( $ ) {
    "use strict";

    /*
     * A popup is a modal dialog without a title bar that closes when click/touch outside of it. It is also not
     * resizable or draggable
     */
    const C_TOP = "u-callout--top",
        C_BOTTOM = "u-callout--bottom",
        C_LEFT = "u-callout--left",
        C_RIGHT = "u-callout--right";

    $.widget( "apex.popup", $.ui.dialog, {
        widgetEventPrefix: "popup",
        closeBlurEvent: undefined,
        closeMousedownEvent: undefined,
        closeMouseDownTarget$: undefined,
        closeBlurTarget$: undefined,
        options: {
            parentElement: null,
            relativePosition: "below",
            callout: false,
            noOverlay: false,
            takeFocus: true, // If false, it overwrites the $.ui.dialog behaviour of taking the focus away and returning it.
            // closeDeadAreas Accepts a jQuery object including DOM elements where the close popup action won't be triggered 
            // on mouseDown when interacting with them.
            closeDeadAreas: null
        },

        _create: function() {
            const self = this;
            let o = this.options,
                dialog$ = this.element;

            self.closeBlurEvent = "blur.popupTracking" + this.uuid;
            self.closeMousedownEvent = "mousedown.popupTracking" + this.uuid;

            // force some options
            o.resizable = false;
            o.draggable = false;
            o.modal = !o.noOverlay; // if noOverlay still behave modal but don't use an overlay

            this._super();

            this.calloutBefore = C_RIGHT;
            this.calloutAfter = C_LEFT;
            if ( dialog$.css( "direction" ) === "rtl" ) {
                this.calloutBefore = C_LEFT;
                this.calloutAfter = C_RIGHT;
            }

            // let the popup fit the content
            if ( o.width === "auto" ) {
                this.uiDialog.css( "display", "inline-block" ).hide();
            }

            this.uiDialog.addClass( "ui-dialog--popup" );

            if ( !o.showTitle ) {
                this.uiDialog.children( ".ui-dialog-titlebar" ).hide();
            }

            this._setPosition();

            dialog$.on( "popupopen", () => {
                if ( o.noOverlay ) {
                    /*
                     * The use of detecting mouse down is implemented on the document bodies to support iframes.
                     * This includes iframes from any origin.
                     * documents$ returns this.contentDocument Other way the popuLov does not works on modal dialogs (bug #33373399)
                     * Now there are 2 differences between this and the overlay case
                     * - the click that closes the popup is acted upon (this was always the main benefit)
                     * - the popup closes if the window looses focus for any reason (this is new behavior)
                     */
                    self.closeMouseDownTarget$ = $( document.body ).add( $( "iframe" ).map(function() {
                        return this.contentDocument;
                    } ) );
                    self.closeBlurTarget$ = $( window );

                    // popup likely opened from a click and don't want mousedown to act on that click so do after
                    setTimeout( () => {
                        this.closeBlurTarget$.on( self.closeBlurEvent, () => {
                            dialog$.popup( "close" );
                        } );
                        this.closeMouseDownTarget$.on( self.closeMousedownEvent, e => {
                            function mouseDownInAllowedArea() {
                                return o.closeDeadAreas && $( e.target ).closest( o.closeDeadAreas ).length;
                            }

                            // normally dialogs allow interaction with other non-modal dialogs but a popup does not want that (bug 32355339)
                            if ( $( e.target ).closest( ".ui-dialog" ).not( ".ui-dialog--popup" ).length 
                                || !( this._allowInteraction( e ) || mouseDownInAllowedArea() ) ) {
                                // if close by clicking outside don't steal focus away from what was clicked on
                                // would rather not set focus at all because this results in double focus events but dialog assumes there is always an opener
                                dialog$.data( "apex-popup" ).opener = $( e.target ); // use an internal property set the opener to what was clicked on
                                // We need to record if the Mouse Down was outside the popup, so we don't return the focus back on the showDialog function
                                e.data = { mouseDownOutPopup: !dialog$[0].contains( e.target ) };
                                dialog$.popup( "close", e );
                            }
                            // else allow mousedown and likely resulting click
                        } );
                    }, 0 );
                    // cleanup click to close handler
                    dialog$.one( "popupclose", function() {
                        self.closeBlurTarget$.off( self.closeBlurEvent );
                        self.closeMouseDownTarget$.off( self.closeMousedownEvent );
                    } );
                } else {
                    // click outside dialog to close it
                    $( ".ui-widget-overlay" ).on( "click", function () {
                        dialog$.popup( "close" );
                    } );
                }

                this._updateCallout();
            });
        },

        _destroy: function() {
            if ( this.callout$ ) {
                this.callout$.remove();
            }

            // Remove listeners that closes the popup first, which aren't removed on DOM element destruction.
            this.closeBlurTarget$.off( this.closeBlurEvent );
            this.closeMouseDownTarget$.off( this.closeMousedownEvent );

            this.uiDialog[0].remove();
        },

        _setPosition: function() {
            let calloutPos, position,
                space = 0,
                o = this.options,
                dialog$ = this.element,
                relPos = o.relativePosition;

            // The parentElement is what the popup is positioned relative to so validate that here
            if ( o.parentElement ) {
                // must distinguish between a selector and markup; find does $() doesn't
                this.positionTo$ = typeof o.parentElement === "string" ? $( document ).find( o.parentElement ) : $( o.parentElement );
                if ( !this.positionTo$[0] ) {
                    this.positionTo$ = null;
                }
            }
            if ( o.callout && this.positionTo$ ) {
                if ( !this.callout$ ) {
                    this.callout$ = $( "<div class='u-callout'></div>" );
                    dialog$.after( this.callout$ );
                }
                space = parseInt( dialog$.parent().css( "margin-top" ), 10 );
            } else {
                if ( this.callout$ ) {
                    this.callout$.remove();
                    this.callout$ = null;
                }
            }

            if ( this.positionTo$ ) {
                const of$ = this.positionTo$;

                // position the popup
                if ( relPos === "above" ) {
                    calloutPos = C_BOTTOM;
                    position = {
                        my: "left bottom",
                        at: "left top-" + space,
                        of: of$,
                        collision: "fit flipfit"
                    };
                } else if ( relPos === "below" ) {
                    calloutPos = C_TOP;
                    position = {
                        my: "left top",
                        at: "left bottom+" + space,
                        of: of$,
                        collision: "fit flipfit"
                    };
                } else if ( relPos === "before" ) { // left
                    calloutPos = C_RIGHT;
                    position = {
                        my: "right top",
                        at: "left-" + space + " top",
                        of: of$,
                        collision: "flipfit fit"
                    };
                } else if ( relPos === "after" ) { // right
                    calloutPos = C_LEFT;
                    position = {
                        my: "left top",
                        at: "right+" + space + " top",
                        of: of$,
                        collision: "flipfit fit"
                    };
                } else if ( relPos === "inside" ) {
                    calloutPos = C_TOP;
                    position = {
                        my: "left top",
                        at: "left+" + space + " top+" + space,
                        of: of$
                    };
                }
                if ( this.callout$ ) {
                    this.callout$.removeClass( C_TOP + " " + C_BOTTOM + " " + C_RIGHT + " " + C_LEFT )
                        .addClass( calloutPos );
                }
            } else {
                position = { my: "center", at: "center", of: window };
            }
            this.options.position = position;
        },

        _updateCallout: function() {
            let calloutLeft, calloutTop, delta, popupOffset, elOffset, callout$;

            if ( !this.callout$ || !this.positionTo$ ) {
                return;
            } // else

            callout$ = this.callout$;
            popupOffset = this.element.offset();
            elOffset = this.positionTo$.offset();
            if (callout$.hasClass( C_TOP )) {
                if (popupOffset.top < elOffset.top) {
                    callout$.removeClass( C_TOP ).addClass( C_BOTTOM );
                }
            } else if (callout$.hasClass( C_BOTTOM )) {
                if (popupOffset.top > elOffset.top) {
                    callout$.removeClass( C_BOTTOM ).addClass( C_TOP );
                }
            } else if (callout$.hasClass( this.calloutAfter )) {
                if (popupOffset.left < elOffset.left) {
                    callout$.removeClass( this.calloutAfter ).addClass( this.calloutBefore );
                }
            } else if (callout$.hasClass( this.calloutBefore )) {
                if (popupOffset.left > elOffset.left) {
                    callout$.removeClass( this.calloutBefore ).addClass( this.calloutAfter );
                }
            }

            callout$.css("left", "");
            callout$.css("top", "");
            if (callout$.hasClass( C_TOP ) || callout$.hasClass( C_BOTTOM )) {
                calloutLeft = parseInt(callout$.css("left"), 10);
                // the popup and element should be left aligned but the fit logic can shift them so make sure the callout
                // points to the right place
                delta = elOffset.left - popupOffset.left;
                if ( delta > 0 ) {
                    callout$.css("left", delta + calloutLeft );
                }
            } else if (callout$.hasClass( C_LEFT ) || callout$.hasClass( C_RIGHT )) {
                calloutTop = parseInt(callout$.css("top"), 10);
                // the popup and element should be top aligned but the fit logic can shift them so make sure the callout
                // points to the right place
                delta = elOffset.top - popupOffset.top;
                if ( delta > 0 ) {
                    callout$.css("top", delta + calloutTop );
                }
            }
        },

        _setOption: function( key, value ) {
            if ( key === "draggable" || key === "resizable" || key === "modal" ) {
                throw new Error( "Popup " + key + " cannot be set." );
            }
            this._super( key, value );
            if ( key === "parentElement" || key === "callout" || key === "relativePosition" ) {
                this._setPosition();
            }
        },

        _focusTabbable: function() {
            const o = this.options;

            if ( o.takeFocus ){
                // Call to base method
                this._super();
            }
        },

        close: function( event ) {
            const that = this,
                o = this.options;
    
            if ( !this._isOpen || this._trigger( "beforeClose", event ) === false ) {
                return;
            }
    
            this._isOpen = false;
            this._focusedElement = null;
            this._destroyOverlay();
            this._untrackInstance();
    
            // The "o.takeFocus &&" is the only different part than the original function. If no focus was take it
            // initially, no focus out logic should be performed.
            if ( o.takeFocus && !this.opener.filter( ":focusable" ).trigger( "focus" ).length ) {
    
                // Hiding a focused element doesn't trigger blur in WebKit
                // so in case we have nothing to focus on, explicitly blur the active element
                // https://bugs.webkit.org/show_bug.cgi?id=47182
                $.ui.safeBlur( $.ui.safeActiveElement( this.document[ 0 ] ) );
            }
    
            this._hide( this.uiDialog, this.options.hide, function() {
                that._trigger( "close", event );
            } );
        }
    } );

})( apex.jQuery );
