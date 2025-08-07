/*!
 Copyright (c) 2021, 2023, Oracle and/or its affiliates.
*/
/*
 * The number field item of Oracle APEX.
 *
 * todo consider including as part of interface description the expected markup including configuration attributes
 * Expected Markup
 *   &lt;input id="{item-name}" name="{item-name}" type="text|number?" class="number_field apex-item-text apex-item-number"
 *      value="{value}"
 *      data-min="{number}" data-max="{number}"
 *      data-format="{number format model}">
 *
 * <p>The data-min and data-max values must be plain (unformatted) numbers. For example 3000 rather than $3,000.00.
 * Can have any other attribute appropriate for input type=text such as readonly, disabled, size,
 * maxlength, required, pattern.
 */

/**
 * @interface numberFieldItem
 * @since 21.2
 * @extends {item}
 * @classdesc
 * <p>The numberFieldItem interface is used to access the properties and methods of the Number Field item.
 * You get access to the numberFieldItem interface with the {@link apex.item} function when passed
 * the item id (name) of a Number Field item.</p>
 * <p>When the field looses focus or the user presses enter the number entered will be formatted according to
 * the format mask configured for the item if any. If the page or item is validated on the client,
 * which is done by default before the page is submitted, this item will report validation errors.
 * It validates if the field is required, that it is a valid number, and within the minimum and maximum
 * range if so configured.</p>
 */
(function( item, util, locale, lang, $ ) {
    "use strict";

    const unsupToNumFmtRE = /V|RN|TM|EEEE/; // keep in sync with locale.js

    /*
     * Utility function to format the number
     */
    const formatNumber = locale.formatNumber,
        toNumber = locale.toNumber;

    const reformatNumber = ( value, format ) => {
        let num = toNumber( value, format );

        if ( !isNaN( num ) ) {
            value = formatNumber( num, format );
        }
        return value.trim();
    };

    const setCheckFormat = ( item, value ) => {
        let input = item.element;

        input[0].setCustomValidity( "" ); // clear any existing error and assume no errors
        if ( value === "" || value === null ) {
            input.val( value ); // base item handles required validation message
        } else {
            let message, min, max,
                valid = true,
                format = item._format,
                num = toNumber( value, format );

            min = item._min;
            if ( min != null ) {
                min = toNumber( min );
            }
            max = item._max;
            if ( max != null ) {
                max = toNumber( max );
            }

            if ( isNaN( num ) ) {
                // not a valid number so just store the value as is
                valid = false;
            } else {
                if ( format ) {
                    // format the value
                    value = formatNumber( num, format ).trim(); // don't want extra white space even if it is part of the format
                }
                if ( min != null && max != null ) {
                    if ( num < min || num > max ) {
                        valid = false;
                    }
                } else if ( min != null ) {
                    if ( num < min ) {
                        valid = false;
                    }
                } else if ( max != null ) {
                    if ( num > max ) {
                        valid = false;
                    }
                }
            }
            input.val( value );
            if ( !valid ) {
                // todo for hex should say it is a hex number.
                // todo consider how to indicate that , or . is required for decimal separator
                if ( min != null && max != null ) {
                    message = lang.formatMessage( "APEX.NUMBER_FIELD.VALUE_NOT_BETWEEN_MIN_MAX", formatNumber( min, format ), formatNumber( max, format ) );
                } else if ( min != null ) {
                    message = lang.formatMessage( "APEX.NUMBER_FIELD.VALUE_LESS_MIN_VALUE", formatNumber( min, format ) );
                } else if ( max != null ) {
                    message = lang.formatMessage( "APEX.NUMBER_FIELD.VALUE_GREATER_MAX_VALUE", formatNumber( max, format ) );
                } else {
                    message = lang.getMessage( "APEX.NUMBER_FIELD.VALUE_INVALID" );
                }
                input[0].setCustomValidity( message );
            }
        }
    };

    // don't doc methods that don't apply to numberFieldItem
    /**
     * @ignore
     * @method addValue
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method removeValue
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method refresh
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method isReady
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method whenReady
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method getSeparator
     * @memberOf numberFieldItem.prototype
     */
    /**
     * @ignore
     * @method getMultiValueStorage
     * @memberOf numberFieldItem.prototype
     */

    /**
     * @lends numberFieldItem.prototype
     */
    const numberFieldItemPrototype = {
        /**
         * <p>The number field item type is "NUMBER".</p>
         * @type {string}
         */
        item_type: "NUMBER",
        setValue: function ( value, displayValue, suppressChangeEvent ) {
            if ( this._noFormat ) {
                this.element.val( value );
            } else {
                setCheckFormat( this, value );
            }

            if ( !suppressChangeEvent ) {
                // used to prevent the attached change event in order to prevent a second call setCheckFormat
                this._preventChangeHandler = true;
            }
        },
        getValue: function () {
            let value = this.element.val();

            if ( !this._noFormat ) {
                // format the value if a valid number. The only reason for this is to handles the case where the item value
                // is changed outside of the item API and not by the user
                value = reformatNumber( this.element.val(), this._format );
            }
            return value;
        },
        isChanged: function() {
            return this.node.value !== this.node.defaultValue;
        },
        displayValueFor: function ( value /*, state*/ ) {
            return this._noFormat ? value : reformatNumber( value, this._format );
        },
        /**
         * <p>Return the current value of the item as a JavaScript number. If the value is not a valid number
         * returns NaN. This is useful when working with numbers because the {@link item#getValue} method
         * always returns a string.</p>
         *
         * @returns {number}
         * @example <caption>In this example, page items P1_COST and P1_TAX are added together and then
         * formatted and displayed in an alert dialog</caption>
         * var total = apex.item( "P1_COST" ).getNativeValue() + apex.item( "P1_TAX" ).getNativeValue();
         * apex.message.alert( "Total is: " + apex.locale.formatNumber( total, "L999G999G999D99" ) );
         */
        getNativeValue: function() {
            return toNumber( this.element.val(), this._format );
        }
    };

    function attachNumberInput( context$ ) {
        $( "input.apex-item-number", context$ ).each( function() {
            let thisItem,
                item$ = $( this ),
                id = this.id;

            // Change handler to keep the case and whitespace in sync
            item$.on( "change", () => {
                //if the change event is triggered by the setValue, we don't need to do any transformation
                if ( thisItem._preventChangeHandler ) {
                    thisItem._preventChangeHandler = false;
                    return;
                }

                if ( !thisItem._noFormat ) {
                    setCheckFormat( thisItem, item$.val() );
                }
            } );

            item.create( id, numberFieldItemPrototype );

            thisItem = item( id );
            thisItem._format = item$.attr( "data-format" ) || null;
            if ( unsupToNumFmtRE.test( thisItem._format ) ) {
                thisItem._noFormat = true;
            }
            thisItem._min = item$.attr( "data-min" ) || null;
            thisItem._max = item$.attr( "data-max" ) || null;
            thisItem._preventChangeHandler = false;
            if ( !thisItem._noFormat ) {
                // make sure it is initially validated and formatted
                setCheckFormat( thisItem, item$.val() );
            }
        } );
    }

    // register attachNumberInput to run when needed
    item.addAttachHandler( attachNumberInput );

})( apex.item, apex.util, apex.locale, apex.lang, apex.jQuery );
