/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
*/
/**
 * @interface autocomplete
 * @since 22.2
 * @extends {item}
 * @classdesc
 * <p>TODO write the documentation
 * </p>
 */
( function( item, util, widget, debug, $, WebComponent ) {
    "use strict";

    // Remove not supported methods from the documentation
    /**
     * Non-applicable
     *
     * @override
     * @method addValue
     * @ignore
     * @memberOf autocomplete.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method removeValue
     * @ignore
     * @memberOf autocomplete.prototype
     */

    /**
     * Non-applicable
     *
     * @override
     * @method whenReady
     * @ignore
     * @memberOf autocomplete.prototype
     */
    // End of removing not supported methods

    class Option extends HTMLElement {
        constructor() {
            super();
        }

        get textLabel() {
            return this.innerText;
        }

        set textLabel( value ) {
            this.innerText = value;
        }

        get htmlLabel () {
            return this.innerHTML;
        }

        set htmlLabel( value ) {
            this.innerHTML = value;
        }

        get icon () {
            return this.getAttribute( "icon" );
        }

        set icon ( value ) {
            this.setAttribute( "icon", value );
        }
    }
    customElements.define( 'a-option', Option );

    const START_WITH = 'starts-with',
        CONTAINS = 'contains',
        MAX_DROPDOWN_H = 480,
        EN_AUTOCOMPLTE = ".aAutocomplete";

    /**
     * <P>Specify the maximum number of items to display in the dropdown' suggestions. It should be a valid integer greater or equal to 0</p>
     * @name maxResults
     * @type {number}
     * @memberof autocomplete.prototype
     * @example <caption>Get option maxResults after initialization</caption>
     * // get
     * let value = apex.item( "P1_ITEM" ).maxResults;
     * @example <caption>Set option maxResults after initialization</caption>
     * // set
     * apex.item( "P1_ITEM" ).maxResults = 10;
     * */

    /**
     * <P>Specify the minimum number of characters that must be entered before a search is executed. It should be a valid
     *  integer greater or equal to 0</p>
     * @name minCharactersSearch
     * @type {number}
     * @memberof autocomplete.prototype
     **/

    /**
     * <P>Specify the ajax identifier the component will use to fetch results from the server.This is only used when
     *  {@link autocomplete#fetchOnType} equal true.</p>
     * @name ajaxIdentifier
     * @type {string}
     * @memberof autocomplete.prototype
     **/

    /**
     * <P>Select how the search against the entered value is performed. </p>
     * @name matchType
     * @type {number}
     * @memberof autocomplete.prototype
     **/

    /**
     * @type {ComponentMetaData}
     * @ignore
     * */
    const componentMetaData = {
        maxResults: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            setterGetter: true,
            reactive: true,
            defaultValue: 1000
        },
        minCharactersSearch: {
            defaultValue: 1,
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true
        },
        ajaxIdentifier: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        ajaxItems: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        parentItems: {
            reactive: true
        },
        parentsRequired: { defaultValue: false },
        matchType: {
            type: WebComponent.dataTypes.enum,
            defaultValue: CONTAINS,
            enumValues:  [ CONTAINS, START_WITH ],
            reactive: true
        },
        fetchOnType: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        cache: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        caseSensitive: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        }
    };
    // TODO maybe maxlength should be take into consideration when selecting a suggestion. JET implementation didn't do it so not a regression.
    const delegatedAttributes = [ "required", "disabled", "size", "maxlength", "autocomplete", "placeholder",
        "minlength", "value", "tabindex", "name", "aria-labelledby", "aria-describedby" ];

    apex.item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

    class Autocomplete extends item.ItemComponent {

        // Properties
        choices;
        _wrappedElement$;
        item_type = "AUTOCOMPLETE";

        // Private properties
        #comboboxInterface;
        #cachedSearches = new Map();
        // It's not necessary to define each property used on the inner state, the base component class create them from the
        // metadata, but they were added for autocomplete code purposes
        #v = {
            maxResults: undefined,
            minCharactersSearch: undefined,
            ajaxIdentifier: undefined,
            ajaxItems: undefined,
            parentItems: undefined,
            parentsRequired: undefined,
            matchType: undefined,
            fetchOnType: undefined,
            cache: undefined,
            caseSensitive: undefined
        };

        constructor() {
            super();
            this._configPrivateState( this.#v );

            this._wrappedElement$ = $( `<input type="text" class="apex-item-text apex-item-auto-complete">` );
            // Focus should go to the input element
            this.setFocusTo = this._wrappedElement$;
        }

        // Loop through array of choices and highlight the search term on the display value, if parameter filter equal false
        // it won't filter the choices, and it will return all choices independently if the search term was found and highlighted,
        // when false it will return only the values that match the searchTerm and were highlighted. Side effect: it escapes the text
        #highlightChoices ( choicesArr, searchTerm, filter ) {
            const results = [];
            let i = 0;

            while ( i < choicesArr.length && ( !this.#v.maxResults || results.length < this.#v.maxResults ) ) {
                let e = choicesArr[i];

                const highlightedString = widget.util.highlightSearchTerm( e.d, searchTerm, this.#v.matchType, this.#v.caseSensitive, 'a-ComboSelect-itemHighlight' );

                if ( highlightedString || !filter ) {
                    results.push( { d: highlightedString || util.escapeHTML( e.d ), i: e.i } );
                }

                i += 1;
            }

            return results;
        }

        #asyncCbSearch( data, match, highlightChoices = true ) {
            let results;

            if ( highlightChoices ) {
                results = this.#highlightChoices(data, match, false);
            } else {
                results = data;
            }

            if ( this.#v.cache ) {
                this.#cachedSearches.set( match, results );
            }

            return results;
        }

        #cascadeLov ( match ) {
            // LOV standard code
            return widget.util.cascadingLov(
                this.element,
                this.ajaxIdentifier,
                {
                    x01: match,
                    pageItems: $( this.#v.ajaxItems, apex.gPageContext$ )
                },
                {
                    optimizeRefresh: this.#v.parentsRequired,
                    dependingOn: $( this.#v.parentItems, apex.gPageContext$ ),
                    loadingIndicatorPosition: "Nothing", // Passing an invalid value will not show the loading indicator
                    target: this._wrappedElement$
                }
            );
        }

        #search( match, callback ) {
            let results = [];

            if ( this.#v.fetchOnType ) {
                let cachedResults;

                // If cache enabled and search term has been cached, it returns the cached results
                if ( this.#v.cache ) {
                    cachedResults = this.#cachedSearches.get( match );
                }

                if ( this.#v.ajaxIdentifier ) {
                    if ( cachedResults ) {
                        callback( cachedResults );
                    } else {
                        const  lovResults = this.#cascadeLov( match );

                        if ( lovResults ) {
                            lovResults.done( data => {
                                callback( this.#asyncCbSearch( data, match ) );
                            } );
                        } else {
                            // If parent items are null, with return an empty because fetch was aborted.
                            callback( [] );
                        }
                    }

                } else if ( this.choices ) {
                    if ( typeof this.choices === 'function' ) {
                        if ( cachedResults ) {
                            callback( cachedResults );
                        } else {
                            this.choices( match, this.#v.matchType, this.caseSensitive, this.#v.maxResults ).then( data => {
                                // If using a function because the search algorithm could be anything we should not try to
                                // highlight choices, because it will lead to unexpected results. If highlighting is needed
                                // the function returning the results should also provide it.
                                callback( this.#asyncCbSearch( data, match, false ) );
                            } ).catch( err => {
                                throw new Error( err );
                            } );
                        }
                    } else {
                        throw new Error( "Invalid data source provided, choices must be an function" );
                    }
                } else {
                    // We don't validate this on the constructor because user could create the item and them add the data source
                    debug.warn( "No data source provided" );
                }
            } else {
                if ( this.choices ) {
                    if ( Array.isArray( this.choices ) ) {
                        results = this.#highlightChoices( this.choices, match, !!match );

                        callback( results );
                    } else {
                        throw new Error( "Invalid data source provided, choices property must be an array" );
                    }
                }
            }
        }

        #setDependingOnListener( oldSelector ) {
            const event = "change" + EN_AUTOCOMPLTE,
                handlerFn = () => { this.element.trigger( "apexrefresh" ); };

            if ( oldSelector ) {
                $( oldSelector, apex.gPageContext$ ).off( event, handlerFn );
            }
            // if it's a cascading select list we have to register change events for our masters
            if ( this.#v.parentItems ) {
                $( this.#v.parentItems, apex.gPageContext$ ).on( event, handlerFn );
            }
        }

        #setRefreshListener() {
            const event = "apexrefresh" + EN_AUTOCOMPLTE,
                handlerFn = () => { this.refresh(); };

            this.element.on( event, handlerFn );
        }

        #fetchInlineResults() {
            const  lovResults = this.#cascadeLov( "" );

            if ( lovResults ) {
                lovResults.done( data => {
                    this.choices = data;
                } );
            } else {
                // If parent items are null and optimizing refresh we clear the container
                this.choices = [];
            }
        }

        refresh() {
            this.setValue( "" );

            // A change from the parent items will trigger a refresh and cache will be cleared. We could cache all parent values
            // but structure will be more complex.
            this.#cachedSearches.clear();


            // When only refresh if fetch on type false
            if ( !this.#v.fetchOnType && this.#v.ajaxIdentifier ) {
                this.#fetchInlineResults();
            }
        }

        setValue( value, displayValue, suppressChangeEvent ) {
            this._wrappedElement$.val( value );

            super.setValue( value, displayValue, suppressChangeEvent );
        }

        reinit( pValue ) {

            // clear the auto complete select list, will get repopulated as soon as the user types something in
            this.#cachedSearches.clear();

            // set value and suppress change event
            this.setValue( pValue, null, true );

            if ( !this.#v.fetchOnType && this.#v.ajaxIdentifier ) {
                return () => { this.#fetchInlineResults(); };
            }
        }

        _cleanup(  ) {
            if ( this.#comboboxInterface ) {
                this.#comboboxInterface.destroy();
            }
        }

        _render( attrChanges ) {
            if ( !this.rendered ) {
                let options$, icon$;

                // Check if there are option elements inside
                options$ = this.element.find( 'a-option' );
                // If there are option elements inside, we parsed and convert them to an array, this parse will only happen
                // on component creation, so if user want to modify the options, it will have to access them through the choices property
                if ( options$.length ) {
                    this.choices = [];
                    const choices = this.choices;

                    options$.each( function () {
                        let element = this;
                        choices.push( { d: element.innerText, i: this.getAttribute( "icon" ) } );
                    } );
                }


                // Saved the icon printed by the server before everything gets wipe out
                if ( this.element.hasClass( "apex-item-has-icon" ) ) {
                    icon$ = this.element.find( ".apex-item-icon" ).detach();
                }
                if ( this.id ) {
                    this._wrappedElement$.attr( 'id', this.id + '_input' );
                }
                // Clears the element inside, this removes server placeholder too.
                this.element.empty().append( this._wrappedElement$ );
                // Put the icon back
                if ( icon$ && icon$[0] ) {
                    this.element.append( icon$ );
                }

                // Initialize the combobox
                this.#comboboxInterface = widget.util.initComboSelect( this.element, {
                    baseId: this.id,
                    searchIcon: false,
                    enterable: true,
                    escapeChoices: false,
                    maxHeight: MAX_DROPDOWN_H,
                    hasIcons: true,
                    minCharactersSearch: this.#v.minCharactersSearch,
                    popupClasses: "ui-dialog-autocomplete",
                    containerClasses: null,
                    asyncLoading: this.#v.fetchOnType,
                    choices: ( match, callback ) => { this.#search( match, callback ); },
                    isDisabled: function() {
                        return true;
                    }
                } );

                // Listeners
                this.#setDependingOnListener();
                // For legacy apexrefresh
                this.element.on( "apexrefresh", () => { this.refresh(); } );

                this.#setRefreshListener();
            } else if ( attrChanges ){
                for ( const v of attrChanges ) {
                    if ( v.attributeName === componentMetaData.minCharactersSearch.attrName ) {
                        this.#comboboxInterface.options.minCharactersSearch = this.#v.minCharactersSearch;
                    } else if ( v.attributeName === componentMetaData.fetchOnType.attrName ) {
                        this.#comboboxInterface.options.asyncLoading = this.#v.fetchOnType;
                    }

                    // Check if the changing attribute is one that could affect the cache results, if so it clears it.
                    if ( ![ componentMetaData.minCharactersSearch.attrName,
                        componentMetaData.ajaxIdentifier.attrName,
                        componentMetaData.ajaxItems.attrName,
                        componentMetaData.parentItems.attrName
                    ].includes( v.attributeName ) ) {
                        this.#cachedSearches.clear();
                    }

                    if ( v.attributeName === componentMetaData.parentItems.attrName ) {
                        this.#setDependingOnListener( v.oldValue );
                    }
                }
            }
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

    customElements.define( 'a-autocomplete', Autocomplete );
} )( apex.item, apex.util, apex.widget, apex.debug, apex.jQuery, apex.WebComponent );