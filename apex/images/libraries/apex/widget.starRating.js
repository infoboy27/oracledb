/*!
 Copyright (c) 2018, 2022 Oracle and/or its affiliates. All rights reserved.
*/
/*
 * Star Rating APEX Item Widget
 */
( function( widget, util, item, $ ) {
    "use strict";

    var C_KEYS = $.ui.keyCode,
        C_DISPLAY_STARS = "STARS",
        C_DISPLAY_STARS_NUMBER = "STARS_AND_VALUE",
        C_DISPLAY_VALUE = "VALUE",
        C_DISPLAY_SINGLE_STAR_AND_VALUE = "SINGLE_STAR_AND_VALUE",
        CL_FONT_APEX = " fa ",
        CL_RATING = "a-StarRating",
        CL_RATING_STAR = "a-StarRating-star",
        CL_RATING_STARS = "a-StarRating-stars",
        CL_RATING_STARS_FG = "a-StarRating-stars-fg",
        CL_RATING_STAR_BG = "a-StarRating-stars-bg",
        CL_RATING_VALUE = "a-StarRating-value",
        CL_RATING_CLEAR = "a-StarRating-clear",
        CL_RATING_INNER = "a-StarRating-starsInner",
        CL_IS_FOCUSED = "is-focused",
        CL_TOOLTIP = "ui-widget-content ui-corner-all ui-widget ui-tooltip";

    /**
     * @param {string} itemId
     * @param  {Object} options
     */
    widget.starRating = function( itemId, options ) {
        var lStarRatingElement$,
            lForwardKey         = C_KEYS.RIGHT,
            lBackwardKey        = C_KEYS.LEFT,
            lInputId            = "#" + util.escapeCSS( itemId ) + "_INPUT",
            lItem$              = $( lInputId ),
            lClearBtnId         = util.escapeCSS( itemId ) + "_CLEAR_BTN",
            lDisplayedStars     = options.numStars,
            lStarWidth          = 16,
            lPreviousValue       = lItem$.val(),
            lInitialValue       = lItem$.val(),
            lTooltipInitialized = true,
            lDisplay            = C_DISPLAY_STARS,
            lOptions = $.extend( {
                // clearTooltip:  null, // required
                numStars:      5,
                iconClass:     "fa-star",
                increment:     1,
                labelText:     "#VALUE#",
                isRequired:    false,
                showClearButton: true,
                showValue: C_DISPLAY_STARS,
                readOnlyDisplay: C_DISPLAY_STARS,
                readOnly: false,
                iconTooltip: ""
            }, options );
        /**
        * Normalizes the passed value according to the widget options
        *
        * @param      {any}  value  The value
        * @param      {boolean}  reseting  Whether or not resets value to 0 when pValue is equal to prev value
        * @return     {any}  The normalized value
        */
        function normalize( value, reseting ) {
            if ( value === "0" || value === 0 || value === "" || value === null || value === false ) {
                if ( lOptions.isRequired || lOptions.readOnly ) {
                    value = "";
                } else {
                    value = 0;
                }
            } else {

                value = parseFloat( value );

                if ( isNaN( value ) ) {
                    value = 0;
                }

                if ( value < 0 ) {
                    value = 0;
                }
                 /*
                  * Fix Bug Num. 31907310
                  * If new val equal to item prev val item will be reseted ...
                  * but only if new value does not exceed num of stars.
                  * This is used when user clicks to one star twice or ...
                  * if user click the active star that represents the current item value
                  */
                 else if ( reseting && value === lPreviousValue && value <= lOptions.numStars ) {
                    value = normalize( 0, true );
                }
                // If value exceed num of stars when user use "right" or "up" key to increase value
                // value will be set to num of stars (max value)
                else if ( value > lOptions.numStars ) {
                    value = lOptions.numStars;
                }
            }

            return value;
        }

        /**
        * Check if item is editable or not
        *
        * @return {boolean}
        */
        function isEditable(){
            return (!lItem$.prop( "disabled" ) && !lOptions.readOnly);
        }

        /**
        * Builds and returns the rating value jQuery element
        *
        * @return     {jQuery}  The rating value element
        */
        function getRatingValue() {
            let lRatingValue$,
                out = util.htmlBuilder(),
                lDefaultValue = lItem$.val() === "" ? 0 : ""; // Fix Bug Num. 30441644
                                                              // Show item value when is null display 0.

                out.markup( "<div " )
                   .attr( "class", CL_RATING_VALUE )
                   .markup( ">" )
                   .content( lDefaultValue )
                   .markup( "</div>" );

            lRatingValue$ = $( out.toString() );

            return lRatingValue$;
        }

      /**
        * Builds and returns the clear button jQuery element
        *
        * @return     {jQuery}  The clear button element
        */
        function getClearButton() {
            let lClearButton$,
                out = util.htmlBuilder();

            out.markup( "<div " )
               .attr( "class", CL_RATING_CLEAR )
               .optionalAttr( "title", lOptions.clearTooltip )
               .markup( ">" )
                   .markup( "<span " )
                   .attr( "aria-hidden", "true" )
                   .attr( "id", lClearBtnId )
                   .attr( "class", "a-Icon icon-starrating-clear" )
                   .markup( "></span>" )
               .markup( "</div>" );

            lClearButton$ = $( out.toString() );

            return lClearButton$;
        }

        /**
        * Builds and returns the stars jQuery elements
        *
        * @return {jQuery} Stars elements
        */
        function render( value ) {
            let C_COLOR       = 'color:',
                activeColor   = lOptions.activeColor,
                inactiveColor = lOptions.inactiveColor,
                out           = util.htmlBuilder(),
                activeWidth;

            if ( activeColor ) {
              activeColor = C_COLOR + activeColor;
            }

            if ( inactiveColor ) {
              inactiveColor = C_COLOR + inactiveColor;
            }

            out.markup(" <div " )
             .attr( "class", CL_RATING_STARS )
             .markup( "> " )
                 .markup( "<div " )
                 .attr( "class", CL_RATING_INNER )
                 .markup(">")
                     .markup( "<div " )
                     .attr( "class", CL_RATING_STAR_BG )
                     .markup( ">" );

            if ( lDisplay !== C_DISPLAY_VALUE ) {
                for ( let i = 0; i < lDisplayedStars; i++ ) {
                    out.markup( "<span " )
                       .attr( "class", CL_RATING_STAR + CL_FONT_APEX + lOptions.iconClass )
                       .optionalAttr("style", inactiveColor )
                       .markup( "></span>");
                }
            }

            if ( lDisplay !== C_DISPLAY_STARS ) {
                if ( value === undefined ) {
                    value = 0;
                }
                // Fix Bug Num. 30441644
                // show item value ( Show value attr - Editable mode ) when item is inside IG
                // or when value is null display 0.
                out.markup( "<div " )
                   .attr( "class", CL_RATING_VALUE )
                   .markup( ">" )
                   .content( value )
                   .markup( "</div>" );
            }

            activeWidth = isNaN( value * lStarWidth ) ? 0 : value * lStarWidth ;
            out.markup( "</div>" )
               .markup( "<div " )
               .attr( "class", CL_RATING_STARS_FG )
               .attr("style", "width:" + activeWidth + "px;")
               .markup( ">" );

            if ( lDisplay !== C_DISPLAY_VALUE ) {
                for ( let i = 0; i < lDisplayedStars; i++ ) {
                    out.markup( "<span " )
                       .attr( "class", CL_RATING_STAR + CL_FONT_APEX + lOptions.iconClass )
                       .optionalAttr("style", activeColor )
                       .markup( "></span>");
                }
            }

            out.markup("</div></div></div>");

            return out.toString();
        }

        function updateStarWidth() {
            let dummyRating$ = $( "<span style='display: none' class='" + CL_RATING_STAR + CL_FONT_APEX +  lOptions.iconClass + "'></span>");

            lStarRatingElement$.append( dummyRating$ );

            lStarWidth = dummyRating$.width();

            dummyRating$.remove();
        }

        /**
        * Update star rating displayed value
        */
        function updateDisplay() {
            let lValue = lItem$.val(),
                lTooltipContent = lOptions.labelText;

            // Update prev value
            lPreviousValue = parseInt( lValue, 10 );

            lTooltipInitialized = true;

            if( lValue === "" ) {
                lValue = 0;
            }

            lStarRatingElement$
                .attr("title", lOptions.labelText.replace( /#VALUE#/, lValue ) );
            lItem$
                .closest( "." + CL_RATING )
                .find( "." + CL_RATING_STARS_FG )
                .css( "width", ( lValue * lStarWidth ) + "px" );
            lItem$
                .closest( "." + CL_RATING )
                .find( "." + CL_RATING_VALUE )
                .html( lValue );

            lItem$
                .attr( {
                    "aria-valuenow": "" + lValue,
                    "aria-valuetext": lOptions.labelText.replace( /#VALUE#/, "" + lValue ),
                    "value": lItem$.val()
                } );

            lItem$
                .closest( "." + CL_RATING )
                .find( "." + CL_RATING_VALUE )
                .text( lValue );

            if ( lOptions.iconTooltip.includes("#VALUE#") ) {
                lTooltipContent = lOptions.iconTooltip;
            }

            lItem$
                .parent()
                .tooltip( {
                     show: apex.tooltipManager.defaultShowOption(),
                     position: {
                         my: "left top+15",
                         at: "left center",
                         collision: "flipfit"
                     },
                     content: lTooltipContent.replace( /#VALUE#/, lValue ),
                     tooltipClass: CL_TOOLTIP
                 } );
        }

        lDisplay = lOptions.readOnly ?  lOptions.readOnlyDisplay : lOptions.showValue;

        if ( lDisplay === C_DISPLAY_SINGLE_STAR_AND_VALUE ) {
            lDisplayedStars = 1;
        } else if ( lDisplay === true ) {
            lDisplay = C_DISPLAY_STARS_NUMBER;
        } else if ( lDisplay === false ) {
            lDisplay = C_DISPLAY_STARS;
        }

        //  add Star Rating HTML element
        lStarRatingElement$ = lItem$.addClass( "u-vh is-focusable" )
                                  .wrap( "<div class='"+ CL_RATING +"'></div>")
                                  .parent();

        updateStarWidth();

        if ( lOptions.showClearButton && !lOptions.readOnly ) {
            lStarRatingElement$.append(
                getClearButton()
            );
        }

        if ( lDisplay !== C_DISPLAY_VALUE ) {
            lStarRatingElement$.append(
                render()
            );
        } else {
            lStarRatingElement$.append(
                getRatingValue()
            );
        }

        lItem$
            .attr( {
                "role": "spinbutton",
                "aria-valuenow": "0",
                "aria-valuemax": "" + lOptions.numStars
            } );

        // if initial value is empty but the value is not required the toolpit won't be initialized
        if ( lItem$.val() === "" && !lOptions.isRequired  ) {
            lItem$.attr( { "value": 0 } );
            lInitialValue = lItem$.val();
            lTooltipInitialized = false;
        }

        if ( lStarRatingElement$.css( "direction" ) === "rtl" ) {
            lForwardKey  = C_KEYS.LEFT;
            lBackwardKey = C_KEYS.RIGHT;
        }

        // Fix for bug 33286152
        widget.util.onVisibilityChange( lItem$[0], ( show ) => {
            if ( show ) {
                updateStarWidth();
            }
        } );

        lStarRatingElement$
            .on( "focusin", function() {
                lItem$
                   .closest( "." + CL_RATING )
                   .find( "." + CL_RATING_STARS )
                   .addClass( CL_IS_FOCUSED );
            } )
            .on( "focusout", function() {
                lItem$
                   .closest( "." + CL_RATING )
                   .find( "." + CL_RATING_STARS )
                   .removeClass( CL_IS_FOCUSED );
            } )
            .on( "keydown", function( e ) {
                let lValue = null,
                    lKeyCode = e.which;

                if ( isEditable() ) {
                    switch ( lKeyCode ) {
                        case C_KEYS.HOME:
                            lValue = 0;
                            break;
                        case C_KEYS.END:
                            lValue = lOptions.numStars;
                            break;
                        case C_KEYS.DOWN:
                        case lBackwardKey:
                            lValue = normalize( Math.round( lItem$.val() ) - lOptions.increment, true );
                            break;
                        case C_KEYS.UP:
                        case lForwardKey:
                            lValue = normalize( Math.round( lItem$.val() ) + lOptions.increment, true );
                            break;
                        case C_KEYS.DELETE:
                            lValue = "";
                            break;
                    }

                    // Fix Bug Num. 30441644
                    // Only Keys used on switch will update the item value.
                    if ( lValue !== null ) {
                        lItem$
                            .val( lValue )
                            .trigger( "change" );

                        updateDisplay();
                    }
                }
            } )
            .on( "click", function( e ) {
                let lVal, lStar$, lTarget$;

                lTarget$ = $( e.target );

                lStar$ = lTarget$.closest( "." + CL_RATING_STAR );

                if ( isEditable() ) {
                    lVal = lStar$
                       .parent()
                       .children()
                       .index( lStar$ ) + 1;

                    //Fix Bug Num. 30985042 and
                    //Fix Bug Num. 31511165
                    if ( lVal === 0 && lTarget$.attr('id') !== lClearBtnId ) {
                        return;
                    }

                    lItem$
                       .val( normalize( lVal, true ) )
                       .trigger( "change" );

                    updateDisplay();

                    lItem$.trigger( "focus" );
                }

                if ( lTooltipInitialized ) {
                    $( this )
                        .tooltip( 'disable' );
                    $( this )
                        .tooltip( 'enable' )
                        .tooltip( 'open' );
                }
            } ).hover( function() {
                if ( lTooltipInitialized ) {
                    $( this )
                        .tooltip( 'enable' )
                        .tooltip( 'open' );
                }
            } ).mouseleave( function() {
                if ( lTooltipInitialized ) {
                    $( this )
                        .tooltip( 'disable' );
                }
            } );

        updateDisplay();

        item.create( itemId, {
            setValue: function( pValue ) {
                lItem$.val( normalize( pValue, false ) );
                updateDisplay();
            },
            getValue: function() {
                return lItem$.val() !== "" ? lItem$.val() : "0";
            },
            displayValueFor: function( pValue ) {
                return render( normalize( pValue, false ) );
            },
            isChanged: function() {
                return lInitialValue !== lItem$.val();
            },
            disable: function() {
                lOptions.readOnly = true;
                $( lInputId ).attr("disabled", true);
                $( "#" + util.escapeCSS( itemId ) + " ." + CL_RATING_CLEAR ).hide();
            },
            enable: function() {
                if ( lOptions.showClearButton && lOptions.readOnly ) {
                    $( "#" + util.escapeCSS( itemId ) + " ." + CL_RATING_CLEAR ).show();
                }
                $( lInputId ).removeAttr("disabled");
                lOptions.readOnly = false;
            },
            reinit: function( pValue ) {
                // Fix Bug Num. 30441644
                // Avoid clear item value when tabbing in and out of a start rating column in IG.
                lItem$.val( normalize( pValue, false ) );

                updateDisplay();
            },
            setFocusTo: function() {
                $( lInputId ).trigger( "focus" );
                lItem$
                    .closest( "." + CL_RATING )
                    .find( "." + CL_RATING_STARS )
                    .addClass( CL_IS_FOCUSED );
                return $( lInputId );
            }
        });
    };
} )( apex.widget, apex.util, apex.item, apex.jQuery );
