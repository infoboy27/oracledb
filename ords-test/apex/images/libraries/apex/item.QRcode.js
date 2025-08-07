/*!
 Copyright (c) 2023, Oracle and/or its affiliates.
*/
/*
 * The QR Code item of Oracle APEX.
 * The main parts of this web component are:
 * value: the value to be encoded into the QR code.
 * foreground color: hex code color that configures the foreground color of the QR code.
 * backgroud color: hex code color that configures the background color of the QR code.
 * All of these three attributes can be changed from the client-side and an ajax call will be made to generate a new QR
 * code.
 */
/**
 * @interface qrcode
 * @since 23.2
 * @extends {item}
 * @classdesc
 *
 * Expected markup
 * <a-qrcode role="region" foreground-color="{initial-foreground-color}" background-color="{initial-background-color}" value="{initial-qrcode-value}" ajax-identifier="{ajax-identifier}"></a-qrcode>
 *
 */
( function( item, server, $, WebComponent ) {
    "use strict";

    // Remove not supported methods from the documentation
    /**
     * Non-applicable
     *
     * @override
     * @method addValue
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method disable
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method displayValueFor
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method enable
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method getValidationMessage
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method hasDisplayValue
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method isDisabled
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method isReady
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method refresh
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method removeValue
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method setFocus
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method setStyle
     * @ignore
     * @memberOf qrcode.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method whenReady
     * @ignore
     * @memberOf qrcode.prototype
     */
    // End of removing not supported methods

    const DEFAULT_FOREGROUND_COLOR = '#000000',
          DEFAULT_BACKGROUND_COLOR = '#FFFFFF';
    /**
     * <p>Specify the HEX Code of the foreground color of the QR Code.</p>
     * @name foregroundColor
     * @type {string}
     * @memberof qrcode.prototype
     **/

    /**
     * <p>Specify the HEX Code of the background color of the QR Code.</p>
     * @name backgroundColor
     * @type {string}
     * @memberof qrcode.prototype
     **/

        /**
     * @type {ComponentMetaData}
     * @ignore
     * */
    const componentMetaData = {
        ajaxIdentifier: {
            type: WebComponent.dataTypes.string
        },
        foregroundColor: {
            type: WebComponent.dataTypes.string,
            defaultValue: DEFAULT_FOREGROUND_COLOR,
            reactive: true
        },
        backgroundColor: {
            type: WebComponent.dataTypes.string,
            defaultValue: DEFAULT_BACKGROUND_COLOR,
            reactive: true
        }
    };

    const delegatedAttributes = [ "value", "name" ];

    item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

    class QRcode extends item.ItemComponent {

        // Properties
        _wrappedElement$;
        item_type = "QR_CODE";

        // Private properties
        #v = {};

        constructor() {
            super();
            this._configPrivateState( this.#v );

            this._wrappedElement$ = $( `<input type="hidden" >` );
        }

        /*
         * This function re-renders the QR code whenever the value, the foreground-color, or the background-color
         * changed.
         *
         * attrChanges - array of attrbutes changed.
         */
        _render( attrChanges ) {
            if ( !this.rendered ) {
                this.element.append( this._wrappedElement$ );
            }
            else if ( attrChanges ) {
                let lSendAjax = false;
                // Generate a new QR Code when any attribute changes
                for ( const attrChange of attrChanges ) {
                    if ( [ componentMetaData.foregroundColor.attrName,
                            componentMetaData.backgroundColor.attrName
                    ].includes( attrChange.attributeName ) ) {
                        // Call the ajax function
                        lSendAjax = true;
                        break;
                    }
                }
                if ( lSendAjax ) {
                    this.#ajaxGetQRCode();
                }
            }

            // Move aria-labelledby and aria-describedby attributes from <a-qrcode> to <svg>
            const lAriaLabelledBy  = $( this.element ).attr( 'aria-labelledby' );
            const lAriaDescribedBy = $( this.element ).attr( 'aria-describedby' );
            $( this.element ).find('svg' ).attr( 'aria-labelledby', lAriaLabelledBy )
                .attr( 'aria-describedby', lAriaDescribedBy );
            $( this.element ).removeAttr( 'aria-labelledby' ).removeAttr( 'aria-describedby' );
        }

        /**
        * This function changes the value of the QR code component and requests a new QR code image using ajax call.
        *
        * @param {string}  value               - The value to set.
        * @param {string}  displayValue        - The display value, only if different from value and can't be determined
        *                                        by the item itself.
        * @param {boolean} suppressChangeEvent - Pass true to prevent the change event from being triggered for the item
        *                                        being set. The default is false.
        *
        * @ignore
        */
        setValue( value, displayValue, suppressChangeEvent ) {
            this._wrappedElement$.val( value );

            if ( this.rendered ) {
                this.#ajaxGetQRCode();
            }

            super.setValue( value, displayValue, suppressChangeEvent );
        }

        /*
         * Private Methods
         */

        /*
         * This function makes an request to the server for a new QR code.
         */
        #ajaxGetQRCode() {
            server.plugin(
                this.#v.ajaxIdentifier,
                {
                    x01: this._wrappedElement$.val(),
                    x02: this.#v.foregroundColor,
                    x03: this.#v.backgroundColor
                },
                {
                    loadingIndicatorPosition: "centered",
                    target: this._wrappedElement$,
                    success: ( data ) => {
                        // Inject the QR Code SVG HTML
                        this.element.children( "svg" ).remove();
                        this.element.prepend( data.QR );
                    }
                }
            );
        }

        // Static methods
        static get observedAttributes() {
            return observedAttributes;
        }
        static get delegatedAttributes() {
            return delegatedAttributes;
        }
        static get componentMetaData() {
            return componentMetaData;
        }
    }

    customElements.define( 'a-qrcode', QRcode );
} )( apex.item, apex.server, apex.jQuery, apex.WebComponent );