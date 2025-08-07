/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
*/
/**
 * @interface select
 * @extends {item}
 * @classdesc
 * <p>TODO write the documentation
 * </p>
 */
( function( item, util, widget, debug, $, WebComponent, page ) {
    "use strict";

    // Remove not supported methods from the documentation
    /**
     * Non-applicable
     *
     * @override
     * @method whenReady
     * @ignore
     * @memberOf select.prototype
     */
    // End of removing not supported methods


    class Select extends apex.widget.util.ComboSelect {
        item_type = "SEARCHABLE_SELECT";

        constructor() {
            const fixedProperties = {
                manualEntries: {
                    attrName: "manual-entries",
                    value: false,
                },
                returnDisplay: {
                    attrName: "return-display",
                    value: true
                }
            };

            // We pass the properties that cannot be changed if using the Select component, on this case
            // e.g. manualEntries cannot change, so Select cannot be transformed to a Combobox item
            super( fixedProperties );
        }
    }

    // Check if browser supports attachInternals, at the time of this comment from the major browsers only
    // Safari needs this checked.
    if ( 'attachInternals' in HTMLElement.prototype ) {
        // Custom element native property that indicates if the custom element is associated with its parent form.
        Select.formAssociated = true;
    } else {
        page.registerCustomElementToSubmit( "a-select" );
    }

    customElements.define( 'a-select', Select );
} )( apex.item, apex.util, apex.widget, apex.debug, apex.jQuery, apex.WebComponent, apex.page );