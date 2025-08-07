/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
*/
/**
 * @interface combobox
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
     * @memberOf combobox.prototype
     */
    // End of removing not supported methods


    /**
     * <P>Specify the maximum number of items to display in the dropdown suggestions. It should be a valid integer greater or equal to 0</p>
     * @name maxResults
     * @type {number}
     * @memberof combobox.prototype
     * @example <caption>Get option maxResults after initialization</caption>
     * // get
     * let value = apex.item( "P1_ITEM" ).maxResults;
     * @example <caption>Set option maxResults after initialization</caption>
     * // set
     * apex.item( "P1_ITEM" ).maxResults = 10;
     * */

    /**
     * <p>Specify if the component will show the choices grouped, if true, the datasource should provide the choices grouped</p>
     * @name hasGroups
     * @type {boolean}
     * @memberof combobox.prototype
     * */

    /**
     * <P>Specify the minimum number of characters that must be entered before a search is executed. It should be a valid
     *  integer greater or equal to 0</p>
     * @name minCharactersSearch
     * @type {number}
     * @memberof combobox.prototype
     **/

    /**
     * <P>Specify the template to be used to render the choices, if it is not provided the default template will be used
     *  TODO add logic to allow choiceTemplate to be a named template</p>
     * @name choiceTemplate
     * @type {string}
     * @memberof combobox.prototype
     **/

    /**
     * <P>Specify the ajax identifier the component will use to fetch results from the server.This is only used when
     *  {@link combobox#fetchOnSearch} equal true.</p>
     * @name ajaxIdentifier
     * @type {string}
     * @memberof combobox.prototype
     **/

    /**
     * <p>Controls if the component will use a key value pair configuration, if true the choices data must have a return
     * and display value. This configuration requires {@link combobox#fetchOnSearch} equal false,
     * This configuration requires {@link combobox#manualEntriesItem} to have a value</p>
     * @name returnDisplay
     * @type {boolean}
     * @memberof combobox.prototype
     **/

    /**
     * <P>Select how the search against the entered value is performed. </p>
     * @name matchType
     * @type {string}
     * @memberof combobox.prototype
     **/


    class Combobox extends apex.widget.util.ComboSelect {
        item_type = "COMBOBOX";

        constructor() {
            // We pass the properties that cannot be changed if using the Combobox component, on this case
            // manualEntries cannot change, so Combobox cannot be transformed to a Select item
            super( { manualEntries: {
                attrName: "manual-entries",
                value: true
                }
            } );
        }
    }

    // Check if browser supports attachInternals, at the time of this comment from the major browsers only
    // Safari needs this checked.
    if ( 'attachInternals' in HTMLElement.prototype ) {
        // Custom element native property that indicates if the custom element is associated with its parent form.
        Combobox.formAssociated = true;
    } else {
        page.registerCustomElementToSubmit( "a-combobox" );
    }

    customElements.define( 'a-combobox', Combobox );
} )( apex.item, apex.util, apex.widget, apex.debug, apex.jQuery, apex.WebComponent, apex.page );