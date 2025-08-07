/*!
 Copyright (c) 2016, 2021, Oracle and/or its affiliates. All rights reserved.
*/
/*
 * The percent graph widget of Oracle APEX.
 */
( function( util, locale, item, lang, $ ) {
    "use strict";

    /*
     * Utility function to normalize the number
     */
    function normalize( value ) {
        value = locale.toNumber( value );

        if ( isNaN( value ) ) {
            value = null;
        } else if ( value < 0 ) {
            value = 0;
        } else if ( value > 100 ) {
            value = 100;
        }
        return value;
    }

    /*
     * Utility function to render the percent graph HTML
     */
    function render( value, options ) {
        var out = util.htmlBuilder();

        value = normalize( value );
        
        if ( value !== null ) {
            out.markup( "<div class='a-Report-percentChart'" );
            if ( options.backgroundColor || options.width || options.foregroundColor || options.textColor ) {
                out.optionalAttr(
                    "style",
                    ( options.backgroundColor ? `--a-percent-chart-background-color:${options.backgroundColor};` : "" ) +
                    ( options.foregroundColor ? `--a-percent-chart-bar-background-color:${options.foregroundColor};` : "" ) +
                    ( options.textColor ? `--a-percent-chart-bar-text-color:${options.textColor};` : "" ) +
                    ( options.width ? `width:${options.width}px;` : "" )
                );
            }
            // aria-valuemin and aria-valuemax default to 0 and 100, no need to set those attributes
            out.markup( `><div role='meter' aria-valuenow='${value}' class='a-Report-percentChart-fill'` )
                .optionalAttr(
                    "aria-labelledby",
                    ( options.labelId ? options.labelId : "" )
                ).optionalAttr(
                    "aria-label",
                    ( !options.labelId ? lang.getMessage( "PCT_GRAPH_ARIA_LABEL" ) : "" )
                )
                .optionalAttr(
                    "style",
                    ( !isNaN( value ) ? `width:${value}%;` : "" )
                )
                .markup( ">" )
                .markup( "<span" )
                .attr(
                    "class",
                    "a-Report-percentChart-value" +
                    ( options.showValue ? "" : " u-VisuallyHidden" )
                )
                .markup( ">" )
                .content( value + "%" )
                .markup( "</span></div>" );
        }
        return out.toString();
    }

    function attachPctGraph( context$ ) {
        /*
         * expected markup:
         * <div class="apex-item-pct-graph" id="{NAME}" 
         *     data-bg-color="{color}" data-fg-color="{color}" data-text-color="{color}"
         *     data-show-value="{TRUE|FALSE}" data-width="{px}">
         *     {value}
         *     </div>
         * The value must be a plain (unformatted) number.
         * The default for data-show-value is false.
         * The colors, show value, and width attributes can be omitted.
         */
        $( ".apex-item-pct-graph", context$ ).each( ( _, el ) => {
            const item$ = $( el ),
                itemId = el.id,
                // data attributes
                options = {
                    backgroundColor: item$.attr( 'data-bg-color' ),
                    foregroundColor: item$.attr( 'data-fg-color' ),
                    textColor: item$.attr( 'data-text-color' ),
                    showValue: item$.attr( 'data-show-value' ),
                    width: item$.attr( 'data-width' ),
                    labelId: item$.attr( 'data-label-id' )
                };
                
                item$.html( render( item$.html(), options ) );

                item.create( itemId, {
                    item_type: 'PCT_GRAPH',
                    displayValueFor: ( value ) => {
                        return render( value, options );
                    }
                });
        });
    }

    // register attachNumberInput to run when needed
    item.addAttachHandler( attachPctGraph );

})( apex.util, apex.locale, apex.item, apex.lang, apex.jQuery );