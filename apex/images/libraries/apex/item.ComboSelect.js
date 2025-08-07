/*!
 Copyright (c) 2024, Oracle and/or its affiliates.
*/
/**
 * @interface comboSelect
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
     * @method whenReady
     * @ignore
     * @memberOf comboSelect.prototype
     */
        // End of removing not supported methods

    const START_WITH = 'starts-with',
        CONTAINS = "contains",
        SEPARATED = "separated",
        JSON_ARRAY_STORAGE = "json-array",
        CHIPS = "chips",
        MAX_DROPDOWN_H = 480,
        WRAPPED_ELEMENT_HTML = `<input type="text" class="apex-item-text">`,
        EN_COMBOBOX = ".aCombobox", // Event namespace
        A_DATA_VALUE = "data-value",
        EM_NO_DISPLAY_VALUE = "pDisplayValue parameter not supported when returnDisplay false",
        EM_NO_DISPLAY_RETURN_VALUE = `pValue and pDisplayValue parameters cannot both contain a value, please provide only one parameter`,
        EM_IDENTIFY_MANUAL_TRUE = "Invalid configuration, manualEntriesItem must have a value to support returnDisplay",
        ACTION_SELECTION = "ITEM_SELECTED",
        ACTION_DELETION = "ITEM_DELETED",
        isArray = Array.isArray;

    /**
     * Evaluate if the object choices provided has groups
     *
     * @param {object} choices Object to evaluate if the choices are grouped.
     * @returns {boolean} True if choices has groups.
     *
     * @private
     */
    const choicesHasGroups = ( choices ) => {
        return choices?.data?.[0]?.opts !== undefined;
    };

    const flattenChoices = ( choices ) => {
        let processedChoices = [];

        choices.data.forEach( ( element ) => {
            if ( isArray( element.opts ) && element.opts.length ) {
                processedChoices.push( {
                    d: element.label,
                    gOpenTag: true
                } );

                processedChoices = [ ...processedChoices, ...element.opts ];

                processedChoices.push( {
                    gCloseTag: true
                } );
            }
        } );

        return { fields: choices.fields, data: processedChoices };
    };

    // Function creates an array of columns configuration based on the fields object
    const fieldsToColumnsArr = ( fields ) => {
        return Object.keys( fields )
            .map( e => {
                let field = fields[e];
                return {
                    name: e,
                    index: field.index,
                    // Default value for searchable, visible is true
                    searchable: (field.searchable || field.searchable === undefined),
                    visible: (field.visible || field.visible === undefined)
                };
            } ).sort( (c, d) => { return c.index - d.index; } );
    };

    /**
     * <P>Specify the maximum number of items to display in the dropdown suggestions. It should be a valid integer greater or equal to 0</p>
     * @name maxResults
     * @type {number}
     * @memberof comboSelect.prototype
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
     * @memberof comboSelect.prototype
     * */

    /**
     * <P>Specify the minimum number of characters that must be entered before a search is executed. It should be a valid
     *  integer greater or equal to 0</p>
     * @name minCharactersSearch
     * @type {number}
     * @memberof comboSelect.prototype
     **/

    /**
     * <P>Specify the template to be used to render the choices, if it is not provided the default template will be used
     *  TODO add logic to allow choiceTemplate to be a named template</p>
     * @name choiceTemplate
     * @type {string}
     * @memberof comboSelect.prototype
     **/

    /**
     * <P>Specify the ajax identifier the component will use to fetch results from the server.This is only used when
     *  {@link combobox#fetchOnSearch} equal true.</p>
     * @name ajaxIdentifier
     * @type {string}
     * @memberof comboSelect.prototype
     **/

    /**
     * <p>Controls if the component will use a key value pair configuration, if true the choices data must have a return
     * and display value. This configuration requires {@link combobox#fetchOnSearch} equal false,
     * This configuration requires {@link combobox#manualEntriesItem} to have a value</p>
     * @name returnDisplay
     * @type {boolean}
     * @memberof comboSelect.prototype
     **/

    /**
     * <P>Select how the search against the entered value is performed. </p>
     * @name matchType
     * @type {string}
     * @memberof comboSelect.prototype
     **/

    /**
     * @type {ComponentMetaData}
     * @ignore
     * */
    const componentMetaData = {
        ajaxIdentifier: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        ajaxItems: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        choiceTemplate: {
            type: WebComponent.dataTypes.string,
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
        },
        displayValuesAs: {
            type: WebComponent.dataTypes.enum,
            defaultValue: CHIPS,
            enumValues:  [ SEPARATED, CHIPS ],
            reactive: true
        },
        fetchOnSearch: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        highlightChoices: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true
        },
        noResultsHint: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        maxResults: {
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            defaultValue: 250,
            setterGetter: true,
            reactive: true
        },
        minCharactersSearch: {
            defaultValue: 0,
            type: WebComponent.dataTypes.number,
            rangeMin: 0,
            reactive: true
        },
        multiValue: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        multiSelect: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        multiValueStorage: {
            type: WebComponent.dataTypes.enum,
            defaultValue: SEPARATED,
            enumValues:  [ SEPARATED, JSON_ARRAY_STORAGE ],
            reactive: true
        },
        manualEntries: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false
        },
        manualEntriesItem: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        matchType: {
            type: WebComponent.dataTypes.enum,
            defaultValue: CONTAINS,
            enumValues:  [ CONTAINS, START_WITH ],
            reactive: true
        },
        multiValueSeparator: {
            type: WebComponent.dataTypes.string,
            reactive: true,
            defaultValue: ":"
        },
        name: {
            // We need to set the name as a property, so item.name returns the name attribute as a property and behaves similar,
            // to an input. For that we only need a setter and getter.
            sync: false,
            setterGetter: true
        },
        parentItems: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        parentsRequired: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false
        },
        returnDisplay: {
            type: WebComponent.dataTypes.boolean,
            reactive: true,
            defaultValue: false
        }
    };
    const delegatedAttributes = [ "disabled", "size", "maxlength", "autocomplete", "placeholder",
        "minlength", "value", "tabindex", "aria-labelledby", "aria-describedby", "required" ];

    apex.item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
    WebComponent._addHyphenCaseAttrNames( componentMetaData );
    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

    class ComboSelect extends item.ItemComponent {

        // Properties
        choices;
        initialValueChoices;
        _wrappedElement$;

        // Private properties
        #comboboxContainer$;
        #comboboxInterface;
        #cachedSearches = new Map();
        #rendered = false;
        #value;
        #manualEntries;
        #defaultValue;
        #defaultNonLovValue;
        // eslint-disable-next-line no-unused-private-class-members
        #hasAdditionalColumns;
        #lastResultSet;
        #selectedChoices;
        #setOldValueChangeEOnFocusout = true;
        #oldValueChangeE;
        #oldValueManualEntriesChangeE;
        #identifyManualEntries;
        #returnDisplay;
        #fixedProperties;
        // It's not necessary to define each property used on the inner state, the base component class create them from the
        // metadata, but they were added for autocomplete code purposes
        #v = {
            maxResults: undefined,
            minCharactersSearch: undefined,
            ajaxIdentifier: undefined,
            ajaxItems: undefined,
            choiceTemplate: undefined,
            parentItems: undefined,
            parentsRequired: undefined,
            matchType: undefined,
            fetchOnSearch: undefined,
            cache: undefined,
            caseSensitive: undefined,
            noResultsHint: undefined,
            multiValue: undefined,
            manualEntriesItem: undefined,
            multiSelect: undefined,
            multiValueSeparator: undefined,
            returnDisplay: undefined,
            manualEntries: undefined,
            multiValueStorage: undefined,
            highlightChoices: undefined,
            displayValuesAs: undefined
        };

        /**
         *  Object constructor
         *
         * @param {object} [fixedProperties] list of properties that will have a fixed value and cannot change, used
         * for classes that extend this class
         * @private
         */
        constructor( fixedProperties ) {
            super();
            this._configPrivateState( this.#v );

            this.#fixedProperties = fixedProperties;

            // We need to overwrite the default setter and getter applied by webComponent class based in metadata
            // because metadata is not aware of inheritance, so we need to create a new getter for the fixed properties
            // therefore it always return the fixed value.
            for ( const [ k, v ] of Object.entries( this.#fixedProperties ) ) {
                Object.defineProperty( this, k, {
                    enumerable: true,
                    configurable: true,
                    get: () => v.value
                } );
            }

            this._wrappedElement$ = $( WRAPPED_ELEMENT_HTML );
            // Focus should go to the input element
            this.setFocusTo = this._wrappedElement$;
        }

        /**
         *  Compute the max number of results to return, it is needed because when multi-value true and
         *  multi-select false, the max number of results to return from the client search or server needs to take in
         *  consideration the selected values.
         *
         * @returns {number} Max number of results to display
         * @private
         */
        #maxResults() {
            if ( this.#v.multiValue && !this.#v.multiSelect ) {
                return this.#v.maxResults + this.getValue().length + this.getManualEntries().length;
            } else {
                return this.#v.maxResults;
            }
        }

        /**
         *  Loop through array of choices and highlight the search term on the display value, if parameter filter equal false
         *  it won't filter the choices, and it will return all choices independently if the search term was found and highlighted,
         *  when false it will return only the values that match the searchTerm and were highlighted.
         * @param {object} choices Choices object which contains the data that will be highlighted.
         * @param {string} searchTerm Search term that will be highlighted.
         * @param {boolean} filter Indicates if the method should return only the choices that contains the search term or all. 
         *  E.g. It is used when the search is on the server and the client will try to highlight the options, but if it can't it will
         *  still return all the results.
         * 
         * @returns {object} Object containing choices. the display value will be always HTML escaped.
         * @private
         */
        #highlightChoices( choices, searchTerm, filter ) {
            const pS = this.#v;
            let lastResultSet;

            if ( this.#v.multiValue && this.#v.displayValuesAs === SEPARATED 
                // if not filtering and showing Selected Values Only, it won't overwrite the last results
                // because it means that this batch won't be rendered on the dropdown and just ignored,
                // this will happens only if the user clicks quickly the counter while waiting for a result
                // set from the server.
                && ( filter || ( !filter && !this.#comboboxInterface.isShowingSelectedOnly() ) ) ) {
                // It needs to save the last results with all the context information like groups
                // to being able to construct an object with the context information of the selected values
                // even though that information is already on the client when fetch-on-search false
                // it is faster to loop through just the last results set than over the whole data set.
                lastResultSet = this.#lastResultSet = {};
            }

            return this.constructor.searchChoices(
                $.extend( true, {}, choices ),
                searchTerm,
                filter,
                this.#v.highlightChoices,
                this.#maxResults(),
                pS.matchType,
                pS.caseSensitive,
                pS.returnDisplay,
                lastResultSet
            );
        }

        #prepareChoices( choices, selectedValuesOnly = false ) {
            const itemValue = this.getValue(),
                returnDisplay = this.#returnDisplay,
                hasGroups = choicesHasGroups( choices );
            let lChoices = $.extend( true, {}, choices );

            if ( lChoices.fields && !this.#comboboxInterface.options.choiceTemplate ) {
                this.#comboboxInterface.options.choiceTemplate = "<span>" + lChoices.fields.map(el => {
                    if (el.visible !== false) {
                        // Creates array of column names with substitution string syntax included.
                        return `&"${el.name}".`;
                    }
                }).filter(el => el !== undefined) // Filter out undefined values
                    .join(' - ') + "</span>";
            }

            if ( hasGroups ) {
                lChoices = flattenChoices( lChoices );
            }

            lChoices.data = lChoices.data.filter( ( choice ) => {
                const valueIncluded = ( this.#v.multiValue ? itemValue : [ itemValue ] )
                    .includes( returnDisplay ? choice.r : choice.pristineDisplayValue );

                // If it is not a tag separator, and no return display, we move the value from the r to the d,
                // because the initComboSelect only prints what is on the d property.
                if ( !choice.gOpenTag && !choice.gCloseTag && !returnDisplay ) {
                    choice.d = choice.r;
                    delete choice.r;
                }

                // If multiSelect true or multiValue false, we don't remove selected records from the option list
                if ( !this.#v.multiValue || ( this.#v.multiValue && this.#v.multiSelect ) ) {
                    if ( ( this.#v.multiValue && this.#v.multiSelect ) || ( !this.#v.multiValue && !this.#manualEntries ) ) {
                        // If multi-select we marked the selected element on the results before rendering them.
                        choice.s = valueIncluded;
                    }
                    return true;
                } else if ( this.#v.multiValue ) {
                    // If not multiSelect, we don't display selected values and exclude them from the results.
                    return !valueIncluded;
                }

            } );

            if ( hasGroups && !selectedValuesOnly ) {
                let count = 0,
                    lData = $.extend( true, {}, lChoices.data );
                lChoices.data = lChoices.data.filter( ( el, indx ) => {
                    if ( !el.gOpenTag && !el.gCloseTag && count < this.#v.maxResults ) {
                        // We only count towards the limit the actual item and not the group separators.
                        count += 1;
                        return true;
                    } else if ( ( ( el.gOpenTag && !lData[ indx + 1 ].gCloseTag ) // If it is an open group tag, it doesn't
                        // filter it out, but only if the next element it is not a close tag, this condition remove empty groups.
                        || ( el.gCloseTag && !lData[ indx - 1 ].gOpenTag ) ) && count < this.#v.maxResults ) {
                        return true;
                    }
                } );

                // If the last group is not closed, it gets closed.
                if ( lChoices.data.length && !lChoices.data[ lChoices.data.length - 1 ].gCloseTag ) {
                    lChoices.data[ lChoices.data.length ] = { gCloseTag: true };
                }
            } else if ( !selectedValuesOnly ) {
                lChoices.data = lChoices.data.slice( 0, this.#v.maxResults );
            }

            return lChoices;
        }

        #cacheKey( match ) {
            return match + '|' + this.#maxResults();
        }

        #asyncCbSearch( choices, match, highlightChoices = true ) {
            let results;

            if ( highlightChoices ) {
                results = this.#highlightChoices( choices, match, false );
            } else {
                results = choices;

                if ( results.fields ) {
                    // If highlightChoices false, due to the data source being a function, we need to
                    // transform the fields obj to an array of columns configuration, this is
                    // done as a side effect in #highlightChoices, but we don't call it for this case,
                    // therefore it needs to be applied.
                    results.fields = fieldsToColumnsArr( results.fields );
                }
            }

            if ( this.#v.cache ) {
                // Cache needs to save the pristineResults without highlighting to be used as 
                // as selection context. 
                this.#cachedSearches.set( 
                    this.#cacheKey( match ), { results: results, pristineResults: choices } 
                );
            }

            return this.#prepareChoices( results );
        }

        #cascadeLov ( match ) {
            // LOV standard code
            return widget.util.cascadingLov(
                this.element,
                this.ajaxIdentifier,
                {
                    x01: match,
                    x02: this.#maxResults(),
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

        #search( match, callback, selectedValuesOnly ) {
            let results = [];

            if ( selectedValuesOnly ) {
                const selectedValues = $.extend( true, {}, this.#selectedChoices );
                // Selected choices is deep copied again, to avoid creating a circular dependancy
                // than will be a problem later when transformations are applied to this.#selectedChoices 
                // based on this.#lastResultSet.
                this.#lastResultSet = $.extend( true, {}, this.#selectedChoices );

                if ( selectedValues.fields ) {
                    // we need to transform the fields obj to an array of columns configuration, this is
                    // done as a side effect in #highlightChoices, but we don't call it for this case,
                    // therefore it needs to be applied.
                    selectedValues.fields = fieldsToColumnsArr( selectedValues.fields );
                }

                callback( this.#prepareChoices( selectedValues, selectedValuesOnly ) );
            } else {
                if ( this.#v.fetchOnSearch ) {
                    let cachedResults;
    
                    // If cache enabled and search term has been cached, it returns the cached results
                    if ( this.#v.cache ) {
                        const cache = this.#cachedSearches.get( this.#cacheKey( match ) );

                        if ( cache ) {
                            // Result context needs to be set back to what it was before.
                            this.#lastResultSet = cache.pristineResults;
                            cachedResults = cache.results;
                        }
                    }
    
                    if ( this.#v.ajaxIdentifier ) {
                        if ( cachedResults ) {
                            callback( this.#prepareChoices( cachedResults ) );
                        } else {
                            const  lovResults = this.#cascadeLov( match );
    
                            if ( lovResults ) {
                                lovResults.done( data => {
                                    callback( this.#asyncCbSearch( data, match ) );
                                } );
                            } else {
                                // If parent items are null and optimizing refresh we clear the container
                                callback( [] );
                            }
                        }
                    } else if ( this.choices ) {
                        if ( typeof this.choices === 'function' ) {
                            if ( cachedResults ) {
                                callback( this.#prepareChoices( cachedResults ) );
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
                    if ( !this.choices ) {
                        // Prevents not showing the no_data_found message
                        this.choices = { data: [] };
                    }
    
                    results = this.#highlightChoices( this.choices, match, !!match );
                    callback( this.#prepareChoices( results ) );
                }
            } 
        }

        #setDependingOnListener( oldSelector ) {
            const event = "change" + EN_COMBOBOX,
                handlerFn = () => { this.refresh(); };

            if ( oldSelector ) {
                $( oldSelector, apex.gPageContext$ ).off( event, handlerFn );
            }

            // if it's a cascading combobox, register a change handler on the parents.
            if ( this.#v.parentItems ) {
                $( this.#v.parentItems, apex.gPageContext$ ).on( event, handlerFn );
            }
        }

        #setListeners() {
            const eventRefresh = "apexrefresh" + EN_COMBOBOX,
                eventInput = "input" + EN_COMBOBOX,
                eventChange = "change" + EN_COMBOBOX,
                eventCustomFocusout = "comboSelectFocusOut" + EN_COMBOBOX,
                eventFocusin = "focusin" + EN_COMBOBOX,
                eventMouseDown = "mousedown" + EN_COMBOBOX;

            this.element.off( EN_COMBOBOX );

            this.element.on( eventRefresh, () => {
                // Refreshing on event refresh for legacy use.
                this.refresh();
            } ).on( eventCustomFocusout, () => {
                const changeEvent = $.Event( "change" );
                this.#setOldValueChangeEOnFocusout = true;

                if ( this.#v.multiValue ) {
                    if ( !util.unorderedArrayEqual( ( this.#oldValueChangeE || [] ), this.getValue() )
                        || !util.unorderedArrayEqual( ( this.#oldValueManualEntriesChangeE || [] ), this.getManualEntries() ) ) {
                        // If value has changed, we trigger a change event
                        changeEvent.apexData = {
                            oldValue: this.#oldValueChangeE,
                            value: this.getValue()
                        };

                        if ( this.#identifyManualEntries ) {
                            changeEvent.apexData.oldValueManualEntries = this.#oldValueManualEntriesChangeE;
                        }

                        this.element.trigger( changeEvent, changeEvent.apexData );
                    }
                } else {
                    if ( ( this.getValue() !== ( this.#oldValueChangeE || "" ) )
                        || ( this.getManualEntries() !== ( this.#oldValueManualEntriesChangeE || "" ) ) ){

                        changeEvent.apexData = {
                            oldValue: this.#oldValueChangeE,
                            value: this.getValue()
                        };

                        if ( this.#identifyManualEntries ) {
                            changeEvent.apexData.oldValueManualEntries = this.#oldValueManualEntriesChangeE;
                        }

                        // If manualEntries false, the change event on focusout will be only triggered when item had a value and now it is empty
                        if ( !this.#v.manualEntries ) {
                            changeEvent.apexData.action = ACTION_DELETION;
                        }

                        this.element.trigger( changeEvent, changeEvent.apexData );
                    }
                }
            } ).on( eventFocusin, () => {
                if ( this.#setOldValueChangeEOnFocusout ) {
                    this.#setOldValueChangeEOnFocusout = false;
                    this.#oldValueChangeE = this.getValue();
                    this.#oldValueManualEntriesChangeE = this.getManualEntries();
                }
            } ).on( eventMouseDown, '.js-removeChip', () => {
                // There is problem where if the focus is not on the combobox and use clicks directly on the X icon for
                // the chip, the oldValue needed to trigger the change event is not calculated well, because the delete
                // happens before setting the old value, so on the case that the chip is click before having focus, we
                // calculate the oldValue, because the item will gain focus later.
                if ( !this.element.has( $( document.activeElement ) ).length ) {
                    this.#setOldValueChangeEOnFocusout = false;
                    this.#oldValueChangeE = this.getValue();
                    this.#oldValueManualEntriesChangeE = this.getManualEntries();
                }
            } );

            this.element.find( ".apex-item-comboselect" ).on( eventInput, ( event ) => {
                event.stopImmediatePropagation();
                if ( event.apexData || ( !this.#v.multiValue && this.#v.manualEntries )) {
                    const inputEvent = $.Event( "input" );
                    inputEvent.apexData = event.apexData;
                    // We re-target the input event, so it looks like it was triggered by the combobox itself and not its
                    // internals.
                    this.element.trigger( inputEvent, inputEvent.apexData );

                    // Following the event profile than the Select Native item shows, a change event is triggered
                    // whenever the value is altered and not on focusout
                    if ( ( event?.apexData?.action === ACTION_SELECTION || ( event?.apexData?.action === ACTION_DELETION && this.#v.multiValue ) )
                        && !this.#v.manualEntries ) {
                        const changeEvent = $.Event( "change" );

                        changeEvent.apexData = event.apexData;
                        changeEvent.apexData.oldValue = this.#oldValueChangeE;
                        changeEvent.apexData.value = this.getValue();

                        // The old value is set to the new value, and it doesn't wait for focus value to compute it again
                        this.#oldValueChangeE = this.getValue();

                        this.element.trigger( changeEvent, changeEvent.apexData );
                    }
                }
            } ).on( eventChange, ( event ) => {
                // Change event will be retargeted.
                event.stopImmediatePropagation();
            } );

        }

        #fetchInlineResults() {
            const  lovResults = this.#cascadeLov( "" );

            if ( lovResults ) {
                lovResults.done( data => {
                    this.choices = data;
                } );
            } else {
                // If parent items are null and optimizing refresh we clear the container
                this.choices.data = [];
            }
        }

        // Applies value consolidation logic. e.g. If user types blue and there is already an object on the array
        // of choices with the display value Blue, it will return that object with its return value, instead
        // of creating a chip with a return value equal blue. This will only apply if all the options are on the
        // client.
        #consolidateValue( returnValue, displayValue ) {
            const returnDisplay = this.#returnDisplay,
                // If not returnDisplay, display property is r, to match our Shared LOVs
                displayProperty = returnDisplay ? "d" : "r",
                lDisplayValue = returnDisplay ? displayValue : returnValue,
                lDisplayValueLC = lDisplayValue?.toLowerCase(),
                hasGroups = choicesHasGroups( this.choices );
            let choiceDetails;

            if ( !this.#v.fetchOnSearch ) {
                let groupIndex = 0,
                    groupsCount = hasGroups ? this.choices.data.length : 1, // Not using groups is equal to having one big group
                    choice;

                while( groupIndex < groupsCount && !choice ) {
                    let choices,
                        choiceIndex = 0;

                    if ( hasGroups ) {
                        choices = this.choices.data[groupIndex].opts;
                    } else {
                        choices = this.choices.data;
                    }

                    while( choiceIndex < choices.length && !choice ) {
                        let element = choices[choiceIndex];

                        // If returnReturn display, and returnValue provided we search only on the return values.
                        if ( this.#v.returnDisplay && returnValue ) {
                            if ( element.r === returnValue ) {
                                choice = element;
                            }
                        } else {
                            if ( ( this.#v.caseSensitive && element[ displayProperty ] === lDisplayValue )
                                || ( !this.#v.caseSensitive && element[ displayProperty ].toLowerCase() === lDisplayValueLC ) ) {
                                choice = element;
                            }
                        }

                        choiceIndex = choiceIndex + 1;
                    }

                    groupIndex = groupIndex + 1;
                }

                if ( choice ) {
                    // It needs to match the expected object structure on the combo select common code.
                    choiceDetails = { text: choice[ displayProperty ], value: choice.r };
                }
            }

            return choiceDetails;
        }

        //Only applies if using multiValue false configuration
        #setValueOne( returnValue, displayValue, setItemValue = false, existingChoice = false ) {
            const returnDisplay = this.#returnDisplay;
            let choiceDetails;

            if ( existingChoice && displayValue ) {
                choiceDetails = {
                    text: displayValue,
                    value: returnDisplay ? returnValue : displayValue
                };
            } else if ( existingChoice && !displayValue && this.#v.fetchOnSearch && !this.#v.manualEntries ) {
                this._wrappedElement$.val( "" );
                this.#fetchDisplayValues( returnValue );
                choiceDetails = { value: returnValue };
            } else if ( returnDisplay && ( returnValue || displayValue ) ) {
                // If it is not an item coming from the dropdown, it shouldn't have return value.
                choiceDetails = this.#consolidateValue( existingChoice ? returnValue : undefined, displayValue );

                // if not manual entries allowed, if a value is not found on the dataset,
                // the display value is set to the returnValue. Like the popup LOV
                if ( !this.#v.manualEntries && !choiceDetails ) {
                    choiceDetails = { text: returnValue, value: returnValue };
                }
            } else if ( displayValue ) {
                // If no return display, the display value is the return value too.
                choiceDetails = this.#consolidateValue( displayValue );
            }

            if ( this.#identifyManualEntries ) {
                // Manual value is always reset everytime the item value is set.
                this.#saveManualEntries( "" );
            }

            if ( choiceDetails ) {
                // If returnDisplay, the returnValue is the value to save.
                this.#value = choiceDetails.value;

                if ( this.#v.manualEntries ) {
                    // manualEntries true configuration doesn't let the comboSelect interface know of its return values
                    choiceDetails.value = choiceDetails.text;
                }

                if ( choiceDetails.text ) {
                    this._wrappedElement$.val( choiceDetails.text );
                }

                // If not manual entries allowed, we saved the value on the data attribute
                if( !this.#manualEntries ) {
                    this._wrappedElement$.attr( A_DATA_VALUE, this.#value );
                }
            } else if ( displayValue ) {
                if ( returnDisplay ) {
                    if ( this.#identifyManualEntries ) {
                        // If not choice found we clear the internal value
                        this.#value = undefined;
                        this.#saveManualEntries( displayValue );
                        if ( setItemValue ) {
                            this._wrappedElement$.val( displayValue );
                        }
                    } else {
                        throw new Error( EM_IDENTIFY_MANUAL_TRUE );
                    }
                } else {
                    if ( this.#identifyManualEntries ) {
                        // If not choice found we clear the internal value
                        this.#value = undefined;
                        this.#saveManualEntries( displayValue );
                        this.#value = undefined;
                    } else {
                        this.#value = displayValue;
                    }
                    if ( setItemValue ) {
                        this._wrappedElement$.val( displayValue );
                    }
                }
            } else {
                // choice not found and displayValue is empty, we clear everything
                this.#value = undefined;
                this._wrappedElement$.val( "" ).removeAttr( A_DATA_VALUE );
            }

            // Check if the value is empty, and set the appropriate class
            this.#comboboxInterface.setEmpty();

            return choiceDetails;
        }

        /**
         *  Checks if a value is in an array, taking in consideration the caseSensitive configuration.
         *
         * @param {string} value Value to evaluate if it is on the array parameter
         * @param {Array<string>} pArray Array of strings
         * @private
         */
        #valueInArray( value, pArray ) {
            const valueLC = value.toLowerCase();

            return pArray.some( ( el ) => {
                return this.#v.caseSensitive ? value === el : valueLC === el.toLowerCase();
            } );
        }

        /**
         *  Converts the manualEntriesValue to its string version depending on the component configuration.
         *
         * @private
         */
        #manualEntriesString( ) {
            const itemValue = this.getManualEntries();

            if ( this.#v.multiValue ) {
                if ( this.#v.multiValueStorage === JSON_ARRAY_STORAGE ) {
                    return JSON.stringify( itemValue );
                } else {
                    const valueSeparator = this.#v.multiValueSeparator;

                    // Delimited
                    return itemValue.join( valueSeparator );
                }
            } else {
                return itemValue;
            }
        }

        /**
         *  Gets the non-lov item value
         *
         * @private
         */
        #nonlovValuesItemValue() {
            const itemId = this.#v.manualEntriesItem;
            let value;

            if ( itemId ) {
                if ( $( itemId ).length ) {
                    value = $( itemId ).val();
                }
            }

            return value;
        }

        #initializeComponentValue() {
            const returnDisplay = this.#returnDisplay;
            let initialNonLovValue, initialValue, initialDisplayValue;

            if ( this.#v.multiValue ) {
                initialNonLovValue = [];
                initialValue = [];
            }

            if ( this.#v.manualEntriesItem ) {
                // Set the item value based on nonLovValues item
                initialNonLovValue = this.#v.multiValue ?
                    util.toArray( this.#nonlovValuesItemValue(), this.getMultiValueStorage() ) : this.#nonlovValuesItemValue();
            }

            if ( this.#defaultValue ) {
                initialValue = this.#v.multiValue ? util.toArray( this.#defaultValue, this.getMultiValueStorage() ) : this.#defaultValue;

                if ( this.initialValueChoices ) {
                    initialDisplayValue = this.initialValueChoices;
                }
            }

            if ( returnDisplay ) {
                if ( this.#v.multiValue ) {
                    this.setValue( initialValue, this.#v.manualEntriesItem ? initialNonLovValue : initialDisplayValue, true );
                } else {
                    if ( initialValue ) {
                        this.setValue( initialValue, initialDisplayValue ? initialDisplayValue : undefined, true );
                    } else if ( initialNonLovValue ) {
                        this.setValue( undefined, initialNonLovValue );
                    }
                }
            } else {
                if ( this.#v.multiValue ) {
                    this.setValue( [ ...initialNonLovValue, ...initialValue ], undefined, true );
                } else {
                    if ( initialValue ) {
                        this.setValue( initialValue, undefined, true );
                    } else if ( initialNonLovValue ) {
                        this.setValue( initialNonLovValue, undefined, true );
                    }
                }
            }

            this.#defaultValue = this.#value;
            this.#defaultNonLovValue = this.#manualEntries;
        }

        /**
         *  Sets the manual entries item to the value passed
         *
         * @private
         */
        #setManualItem( value ) {
            const itemId = this.#v.manualEntriesItem;

            if ( itemId ) {
                if ( $( itemId ).length ) {
                    // We need to trigger a change even for IG to pick up the change on the model.
                    $( itemId ).val( value ).trigger( "change" );
                }
            }
        }

        /**
         *  It saves the free entry text value to the manual item entries item and private state
         *
         * @private
         */
        #saveManualEntries( value ) {
            if ( this.#v.multiValue ) {
                ( this.#manualEntries = this.getManualEntries() ).push( value );
            } else {
                this.#manualEntries = value;
            }

            this.#setManualItem( this.#manualEntriesString() );
        }

        /**
         *  It maps the returnValue and displayValue to what this class expects
         *
         * @private
         */
        #addValueCb( returnValue, displayValue, existingChoice ) {
            const returnDisplay = this.#returnDisplay;
            let choice;

            if ( returnDisplay ) {
                // If it is not an item on the data-set, the returnValue parameter must be null, it was added as free-text
                choice = this.#addValue( existingChoice ? returnValue : undefined, displayValue, existingChoice );
            } else {
                // If no return display, the display value is the return value too.
                choice = this.#addValue( displayValue, undefined, existingChoice );
            }

            return choice;
        }

        #addValue( returnValue, displayValue, existingChoice, calledProgamatically ) {
            const returnDisplay = this.#returnDisplay,
                isChoicesObj = isArray( displayValue?.data );
            let values = this.getValue(),
                choiceDetails, value;

            if ( existingChoice ) {   
                choiceDetails = {};

                if ( isChoicesObj ) {
                    const choice = choicesHasGroups( displayValue ) ? displayValue.data[0].opts[0] : displayValue.data[0];
                    choiceDetails.text = choice.d;
                    choiceDetails.value = choice.r;
                } else {
                    choiceDetails.text = returnDisplay ? displayValue : returnValue;
                    choiceDetails.value = returnValue;
                }
            } else {
                choiceDetails = this.#consolidateValue( returnValue, displayValue ) || {};

                // if not manual entries allowed, if a value is not found on the dataset,
                // the display value is set to the returnValue. Like the popup LOV
                if ( !this.#v.manualEntries && ( !choiceDetails.text || !choiceDetails.value ) ) {
                    choiceDetails.text = returnValue;
                    choiceDetails.value = returnValue;
                }
            }

            // It tells the initCombobox interface to skip the chip creation, we start assuming it will be skipped.
            choiceDetails.skip = true;

            if ( choiceDetails.text || choiceDetails.value ) {
                if ( returnDisplay && !values.includes( choiceDetails.value ) ) {
                    value = choiceDetails.value;
                    if ( this.#v.manualEntries ) {
                        // The initCombobox interface won't be aware of the id, because the display value should be unique, we
                        // could use it as the value for the chip
                        choiceDetails.value = choiceDetails.text;
                    }

                    choiceDetails.skip = false;
                } else if( !returnDisplay && !values.includes( choiceDetails.text ) ) {
                    value = choiceDetails.text;
                    choiceDetails.skip = false;
                }
            } else {
                if ( returnDisplay && displayValue ) {
                    value = returnValue;
                    if ( this.#identifyManualEntries ) {
                        if ( !this.#valueInArray( displayValue, this.getManualEntries() ) ) {
                            this.#saveManualEntries( displayValue );
                            choiceDetails.text = displayValue;
                            choiceDetails.value = displayValue;
                            choiceDetails.skip = false;
                        }
                    } else {
                        throw new Error( EM_IDENTIFY_MANUAL_TRUE );
                    }
                } else if ( !returnDisplay ){
                    if ( this.#identifyManualEntries ) {
                        if ( !this.#valueInArray( returnValue, this.getManualEntries() ) ) {
                            this.#saveManualEntries( returnValue );
                            choiceDetails.text = returnValue;
                            choiceDetails.value = returnValue;
                            choiceDetails.skip = false;
                        }
                    } else {
                        if ( this.#v.multiValue ) {
                            if ( !this.#valueInArray( returnValue, values ) ) {
                                value = returnValue;
                                choiceDetails.text = returnValue;
                                choiceDetails.value = returnValue;
                                choiceDetails.skip = false;
                            }
                        } else {
                            value = returnValue;
                            choiceDetails.skip = false;
                        }
                    }
                }
            }

            if ( value ) {
                const placeholderGroup = apex.lang.getMessage( "APEX.CS.OTHERS_GROUP" );
                values.push( value );
                this.#value = values;

                if( this.#v.multiValue && this.#v.displayValuesAs === SEPARATED ) {
                    let choice, resultSet, record;    

                    if ( isChoicesObj ) {
                        resultSet = displayValue;
                    } else {
                        // If called programatically, the function won't look for context and just create a fake 
                        // context when passing a display value string.
                        if ( calledProgamatically ) {
                            if ( displayValue ) {
                                resultSet = { data: [ { d: displayValue, r: value } ] };
                            } else if ( !displayValue ) {
                                if ( !this.#v.fetchOnSearch ) {
                                    // If just a return value is provided we try to get a valid choice record
                                    // from the data-set, if not found a record object is created to be associated with
                                    // that value.
                                    const lRecord = this.constructor.choiceRecord( value, this.choices );
                                    resultSet = { data: [] };

                                    if ( lRecord ) {
                                        resultSet.data.push( lRecord );

                                        if ( this.choices.fields ) {
                                            resultSet.fields = $.extend( true, {}, this.choices.fields );
                                        }
                                    } else {
                                        resultSet.data.push( { d: value, r: value } );
                                    }
                                } else {
                                    resultSet = { data: [ { d: value, r: value } ] };
                                }
                            }
                        } else {
                            if ( !this.#v.fetchOnSearch && !this.#lastResultSet ) {
                                // If last results is empty and fetch on search is false, it means it is the first rendering
                                // and there is no context of last results, therefore we just search the full choices object
                                resultSet = this.choices;
                            } else {
                                resultSet = this.#lastResultSet;
                            }
                        }
                    }

                    record = this.constructor.choiceRecord( value, resultSet );

                    if ( !this.#selectedChoices ) {
                        this.#selectedChoices = { data: [] };
                    }

                    // If resultSet contains field configuration, it will always overwrite the last configuration used
                    // if there is already saved results and the configuration is inconsistent, that could yield errors,
                    // providing different field configurations between choices is not supported and a developer shouldn't
                    // do it.
                    if ( resultSet?.fields ) {
                        this.#selectedChoices.fields = resultSet.fields;
                    }
                    
                    if ( choicesHasGroups( resultSet ) ) {
                        choice = record.opts[0];

                        // If the selected choices aren't grouped and the incomming choice to be add has a group,
                        // we move all the choices to a placeholder group. Group format will always overwrite non-group
                        if ( this.#selectedChoices.data.length && !choicesHasGroups( this.#selectedChoices ) ) {
                            this.#selectedChoices.data = [ { label: placeholderGroup, opts: this.#selectedChoices.data } ];
                        }

                        let group = this.#selectedChoices.data.find( el => {
                            return record.label === el.label;
                        } );

                        if ( group ) {
                            // The record even though it is in a group format, it should always be one record
                            const choice = record.opts[0];

                            group.opts.push( choice );
                        } else {
                            this.#selectedChoices.data.push( record );
                        }
                    } else {
                        choice = record;
                        if ( choicesHasGroups( this.#selectedChoices ) ) {
                            let group = this.#selectedChoices.data.find( el => {
                                return placeholderGroup === el.label;
                            } );
    
                            if ( group ) {
                                group.opts.push( record );
                            } else {
                                this.#selectedChoices.data.push( { label: placeholderGroup, opts: [ record ] } );
                            }
                        } else {
                            this.#selectedChoices.data.push( choice ); 
                        }
                    }

                    // The choice will be always set to selected once it has been added to the #selectedChoices
                    choice.s = true;
                    choice.pristineDisplayValue = choice.d;
                }
            }

            return choiceDetails;
        }

        /**
         *  It adds a chip representing a value to a multiValue true item.
         *
         * @param {string} pValue Value of chip to be added, if returnDisplay true, this is the return value of a choice to be added.
         * @param {string|object} [pDisplayValue] Display value of the chip to be added, only applies if returnDisplay true. If this
         * parameter contains a value, pValue must be left undefined. If manualEntries false this parameter doesn't apply
         * @param {boolean} [pSuppressChangeEvent] If true, doesn't trigger a change event when a chip is added. Default to true
         * @param {boolean} [calledProgamatically] If true, it indicates that the action to add a value was triggered programatically
         *  and not by a user interaction, on that case it treats the value differently when adding context to the selected value.
         *  It only applies if displayValuesAs equal "separated". Default to false
         * @ignore
         */
        #addValueChip( pValue, pDisplayValue, pSuppressChangeEvent = true, calledProgamatically = false ) {
            if ( this.#v.multiValue ) {
                const returnDisplay = this.#returnDisplay,
                    oldValue = this.getValue(),
                    oldNonLovValue = this.getManualEntries();

                // Validate parameters
                if ( this.#v.manualEntries ) {
                    if ( pDisplayValue && !returnDisplay ) {
                        throw new Error( EM_NO_DISPLAY_VALUE );
                    } else if ( pValue && pDisplayValue ) {
                        throw new Error( EM_NO_DISPLAY_RETURN_VALUE );
                    }
                }
                // End of validations

                // If not value, function does nothing.
                if ( ( this.#v.manualEntries && ( pValue || pDisplayValue ) ) || ( !this.#v.manualEntries && pValue )) {
                    // Values are always transformed to string.
                    const lValue = this.#purifyValue( pValue ? pValue : pDisplayValue );
                    let choiceDetails;

                    if ( this.#v.manualEntries ) {
                        choiceDetails = pDisplayValue ? this.#addValue( undefined, lValue ) : this.#addValue( lValue );
                    } else {
                        choiceDetails = this.#addValue( lValue, pDisplayValue, !!pDisplayValue, calledProgamatically );
                    }

                    if ( !choiceDetails.skip ) {
                        this.#comboboxInterface.addValueChip( choiceDetails.value, choiceDetails.text );

                        if ( !pSuppressChangeEvent ) {
                            const changeEvent = $.Event( "change" );

                            changeEvent.apexData = {
                                oldValue: oldValue,
                                value: this.getValue()
                            };

                            if ( this.#identifyManualEntries ) {
                                changeEvent.apexData.oldValueManualEntries = oldNonLovValue;
                            }

                            this.element.trigger( changeEvent, changeEvent.apexData );
                        }
                    }
                }
            }
        }

        #choiceReturnValue( displayValue ) {
            const hasGroups = choicesHasGroups( this.choices ),
                choices = hasGroups ? flattenChoices( this.choices ) : this.choices,
                choice = choices.data.filter( el => el.d === displayValue )[ 0 ];

            if ( choice ) {
                return choice.r;
            }
        }

        #choiceDisplayValue( returnValue ) {
            const hasGroups = choicesHasGroups( this.choices ),
                choices = hasGroups ? flattenChoices( this.choices ) : this.choices,
                choice = choices.data.filter( el => el.r === returnValue )[ 0 ];

            if ( choice ) {
                return choice.d;
            }
        }

        /**
         *  It transforms the value to a string and remove the separator if multivalue
         *
         * @param {string} value Value to be purified
         * @private
         */
        #purifyValue( value ) {
            let lValue = value == null ? undefined : String( value );

            if ( this.#v.multiValue && this.#v.multiValueStorage === SEPARATED ) {
                const regExpSeparator = new RegExp( util.escapeRegExp( this.#v.multiValueSeparator ), 'g' );
                lValue = lValue?.replace( regExpSeparator, "" );
            }
            return lValue;
        }

        #fetchDisplayValues( values ) {
            const lValues = this.#v.multiValue ? values : [ values ];
            let lValuesStringified;

            // The server expects the sent ids to fetch the display value to be on the same format 
            // than the item value is posted to the server.
            if ( this.#v.multiValueStorage === JSON_ARRAY_STORAGE && this.#v.multiValue ) {
                lValuesStringified = JSON.stringify( lValues );
            } else {
                lValuesStringified = lValues.join( this.#v.multiValueSeparator );
            }

            apex.server.plugin ( this.#v.ajaxIdentifier, {
                p_widget_action:            "get-display-values",
                // Using x03 instead of x01 because x01 and x02 are used for the search term, and max number
                // of results respectively on the server, but they are not needed here.
                x03:                        lValuesStringified,
                pageItems:                  $( this.#v.ajaxItems, apex.gPageContext$ )
                                                .add( this.#v.parentItems, apex.gPageContext$ )
            }, {
                loadingIndicator:           `#${util.escapeCSS( this.id )} .apex-item-comboselect`
            } ).done( ( response ) => {
                const placeholderGroup = apex.lang.getMessage( "APEX.CS.OTHERS_GROUP" );
                this.#selectedChoices = { data: [] };

                if ( response?.fields ) {
                    this.#selectedChoices.fields = response.fields;
                }

                lValues.forEach( ( value ) => {
                    const choice = this.constructor.choiceRecord( value, response ),
                        hasGroups = choicesHasGroups( response );
                    let displayValue;
                    

                    if ( choice ) {
                        displayValue = hasGroups ? choice.opts[0].d : choice.d;
                    } else {
                        // If row not found on the serve for that ID, the display value is set
                        // to the return value
                        displayValue = value;
                    }

                    if ( this.#v.displayValuesAs === SEPARATED ) {
                        if ( hasGroups ) {
                            const groupLabel = choice ? choice.label : placeholderGroup,
                                group = this.#selectedChoices.data.find( el => {
                                    return groupLabel === el.label;
                                } ),
                                choiceGroupToPush = choice 
                                    ? choice : { label: placeholderGroup, opts: [ { r: value, d: value } ] },
                                // The choice even though it is in a group format, it should always be one record
                                choiceToPush = choiceGroupToPush.opts[0];

                                choiceToPush.s = true;
                                choiceToPush.pristineDisplayValue = choiceToPush.d;    

                            if ( group ) {
                                group.opts.push( choiceToPush );
                            } else {
                                this.#selectedChoices.data.push( choiceGroupToPush );
                            }
                        } else {
                            const choiceToPush = choice 
                                ? choice : { r: value, d: value };
                            
                            choiceToPush.s = true;
                            choiceToPush.pristineDisplayValue = choiceToPush.d; 

                            this.#selectedChoices.data.push( choiceToPush ); 
                        }
                    }

                    if ( this.#v.multiValue ) {
                        this.#comboboxInterface.addValueChip( value, displayValue );
                    } else {
                        this._wrappedElement$.val( displayValue );
                    }
                } );

                // This won't be documented, but having a hook event after the chips are being created
                // the and new value is reflected in the UI is useful. We could think about document it
                // later.
                this.element.trigger( "apexafterdvfetched" );
            } ).fail( ( e ) => {
                debug.error( "There was an error when fetching the display value", e );
            } );
        }

        /**
         *  It removes a chip from the internal value, it doesn't remove the visual chip.
         *
         * @param {string} returnValue Value of chip to be removed
         * @param {string} [displayValue] Display Value of chip to be removed
         * @param {boolean} [removeChip] If true, it removes the chip element for that value
         * @private
         */
        #removeValue( returnValue, displayValue, removeChip = false ) {
            const values = this.getValue(),
                returnDisplay = this.#returnDisplay;
            let valueIndex, isValue, manualEntries, manualEntryIndex, isManualEntry, deleteKey;

            if ( returnDisplay ) {
                valueIndex = values.indexOf( returnValue ? returnValue : this.#choiceReturnValue( displayValue ) );

                if ( this.#v.manualEntries ) {
                    deleteKey = returnValue ? this.#choiceDisplayValue( returnValue ) : displayValue;
                } else {
                    deleteKey = returnValue;
                }
            } else {
                valueIndex = values.indexOf( returnValue );
                deleteKey = returnValue;
            }

            isValue = valueIndex >= 0;
            manualEntries = this.getManualEntries();
            manualEntryIndex = manualEntries.indexOf( returnDisplay ? displayValue : returnValue );
            isManualEntry = manualEntryIndex >= 0;


            // The value to be removed, could be on the manual entries or on the item value itself
            if ( isValue ) {
                values.splice( valueIndex, 1 );
                this.#value = values;

                if ( this.#selectedChoices ) {
                    const selectedValues = this.#selectedChoices,
                        data = selectedValues.data,
                        hasGroups = choicesHasGroups( this.#selectedChoices );
                    let groupIndex = 0,
                        valueFound = false,
                        groupLength;    

                    if ( hasGroups ) {
                        groupLength = data.length;
                    } else {
                        // If there is no groups, it loops at least once as it were a big group
                        groupLength = 1; 
                    }    

                    
                    // Probably it be easier/clearer to implement using the array method filter, but it won't allow
                    // to shortcircuit the loop, and item don't allow duplicated value, therefore no need to continue
                    // after a value has been found
                    while ( groupIndex < groupLength && !valueFound ) {
                        const groupOpts = hasGroups ? data[groupIndex].opts : data;
                        let optsIndex = 0;

                        while ( optsIndex < groupOpts.length && !valueFound ) {
                            const choice = groupOpts[optsIndex];

                            if ( choice.r === returnValue ) {
                                valueFound = true;
                                groupOpts.splice( optsIndex, 1 );
                            }

                            optsIndex += 1;
                        }

                        if ( hasGroups && valueFound && groupOpts.length === 0 ) {
                            data.splice( groupIndex, 1 );
                        }

                        groupIndex +=1 ;
                    }
                }
            } else if ( isManualEntry ) {
                manualEntries.splice( manualEntryIndex, 1 );
                this.#manualEntries = manualEntries;
                this.#setManualItem( this.#manualEntriesString() );
            }

            if ( removeChip && ( isManualEntry || isValue ) ) {
                this.#comboboxInterface.removeValueChip( deleteKey );
            }
        }

        #parsedChoices() {
            const choices = { data: [] },
                returnDisplay = this.#returnDisplay,
                groups$ = this.element.children( 'a-optgroup' );

            const parseOptions = ( options$ ) => {
                const options = [];

                options$.each( ( _, element ) => {
                    // Filter only textNodes inside the option tag, to avoid clashing with the text of the a-option-column-value
                    const displayValue = [ ...element.childNodes ]
                            .filter( e => e.nodeType === Node.TEXT_NODE )
                            .map( e => e.nodeValue.trim() ).join( "" ),
                        option = {
                            d: displayValue,
                            i: element.getAttribute( "icon" ),
                            r: element.getAttribute( "value" )
                        };

                    if ( !returnDisplay ) {
                        option.r = displayValue;
                        delete option.d;
                    }

                    $( element ).children( "a-option-column-value" ).each( ( _, element ) => {
                        option.cols = option.cols || [];

                        option.cols.push( element.innerText );
                    } );

                    if ( option.cols ) {
                        this.#hasAdditionalColumns = true;
                    }

                    options.push( option );
                } );

                return options;
            };

            this.element.children( 'a-column-metadata' ).each( ( _, element  ) => {
                const columnName = element.getAttribute( "name" ).toUpperCase(),
                    index = element.getAttribute( "index" ),
                    searchable = !( element.getAttribute( "searchable" ) === "false" ),
                    visible = !( element.getAttribute( "visible" ) === "false" );

                choices.fields = choices.fields || {};

                choices.fields[ columnName ] = {
                    index: index,
                    searchable: searchable,
                    visible: visible
                };
            } );

            if ( groups$.length ) {
                groups$.each( ( _, element ) => {
                    let options$ = $( element ).children( 'a-option' );

                    if ( options$.length ) {
                        const groupName = element.getAttribute( "label" ),
                            group = {
                                label: groupName
                            };

                        group.opts = parseOptions( options$ );
                        // Add group to main choices array
                        choices.data.push( group );
                    }
                } );
            } else {
                const options$ = this.element.children( 'a-option' ); // Check if there are option elements inside
                choices.data = parseOptions( options$ );
            }

            // We don't want to leave the element there after parsing, the choices are not updated when HTML metadata is updated.
            this.element.find( "a-optgroup, a-option, a-column-metadata" ).remove();
            
            return choices;
        }

        /**
         *  Return the defaultValue, although non-lov values are included in the computation to check if the item
         *  is changed, they are not return by that function.
         *
         * @ignore
         */
        get defaultValue() {
            return this.#defaultValue;
        }

        set defaultValue( value ) {
            let lValue;

            if ( value == null ) {
                lValue = "";
            } else {
                lValue = value;
            }

            this.setAttribute( "value", String( lValue ) );

            this.#defaultValue = this.#value;
            this.#defaultNonLovValue = this.#manualEntries;
        }

        /**
         *  Return the choices object of the selected values. Only applies if display-values-as="separated"
         *  
         * @ignore
         */
        get selectedChoices() {
            return this.#selectedChoices;
        }

        /**
         *  Return true if the item value has changed
         *
         * @ignore
         */
        isChanged( ) {
            if ( this.#v.multiValue ) {
                return !util.unorderedArrayEqual( ( this.#defaultValue || [] ), this.getValue() )
                    || !util.unorderedArrayEqual( ( this.#defaultNonLovValue || [] ), this.getManualEntries() );
            } else {
                return this.getValue() !== ( this.#defaultValue || "" );
            }
        }

        /**
         *  It removes a chip from a multi-value=true Combobox.
         *
         * @param {string} pValue Value of chip to be removed, if returnDisplay true, this is the return value of a choice to be removed.
         * @param {string} pDisplayValue Display value of the chip to be removed, only applies if returnDisplay true and manualEntries true.
         *  If this parameter contains a value, pValue must be left undefined.
         * @ignore
         */
        removeValue( pValue, pDisplayValue ) {
            if ( this.#v.multiValue ) {
                const returnDisplay = this.#returnDisplay;

                // Validate parameters
                if ( this.#v.manualEntries ) {
                    if ( pDisplayValue && !returnDisplay ) {
                        throw new Error( EM_NO_DISPLAY_VALUE );
                    } else if ( pValue && pDisplayValue ) {
                        throw new Error( EM_NO_DISPLAY_RETURN_VALUE );
                    }
                } else {
                    if ( pDisplayValue ) {
                        throw new Error( "Property pDisplayValue not supported for this configuration" );
                    }
                }
                // End of validations


                this.#removeValue( pValue, pDisplayValue, true );
            }
        }

        refresh() {
            this.setValue( "" );

            // A change from the parent items will trigger a refresh and cache will be cleared. We could cache all parent values
            // but structure will be more complex.
            this.#cachedSearches.clear();


            // When only refresh if fetch on type false, no need when true because the results are fetch on each search
            if ( !this.#v.fetchOnSearch && this.#v.ajaxIdentifier ) {
                this.#fetchInlineResults();
            }
        }

        /**
         *  It adds a chip to a multiValue true Combobox.
         *
         * @param {string} pValue Value of chip to be added, if returnDisplay true, this is the return value of a choice to be added.
         * @param {string} pDisplayValue Display value of the chip to be added, only applies if returnDisplay true. If this
         * parameter contains a value, pValue must be left undefined. If manualEntries false this parameter doesn't apply
         * @ignore
         */
        addValue( pValue, pDisplayValue ) {
            // It triggers a change event if the chip is added
            this.#addValueChip( pValue, pDisplayValue, false, true  );
        }

        /**
         *  Set the item value.
         *
         * @param {string|Array.<string>} pValue The value to set. When returnDisplay true, this argument will expect a return value
         *  or an array of return values, if the value passed is not the return value of any option, that value will be ignored.
         * @param {any} pDisplayValue Only available when returnDisplay true.
         *  When manualEntries true this argument allows to provide a display value or list of display values, which the component will test if they are part of the data source,
         *  if they are found, the return value will be added to the value, if they cannot, they will be added to the manual entries value.
         *  When manualEntries false, it allows to set a display value that it isn't necessary the same one that the one on the item data set, if provided
         *  and fetchOnSearch true, no AJAX request will be executed. The format it is the same than the expected format for pValue
         * @param {boolean} pSuppressChangeEvent indicates if the change event triggered when this function is called should be suppressed
         * @ignore
         */
        setValue( pValue, pDisplayValue, pSuppressChangeEvent ) {
            const oldValue = this.getValue(),
                oldNonLovValue = this.getManualEntries(),
                returnDisplay = this.#returnDisplay,
                isChoicesObj = isArray( pDisplayValue?.data );;

            // Transform the array to an array of strings and removes duplicate values from array
            const purifyArray = ( arr, caseSensitive ) => {
                const uniqueVals = new Map(),
                    result = [];

                for ( const el of arr ) {
                    let val =  String( el );

                    // When no manual entries allowed, it doesn't consider strings like Hello, and hello when caseSensitive false
                    // to be duplicated
                    if ( !caseSensitive && this.#v.manualEntries ) {
                        val = val.toLowerCase();
                    }

                    if ( !uniqueVals.get( val ) ) {
                        uniqueVals.set( val, true );
                        result.push( el );
                    }
                }

                return result;
            };

            // Validate parameters
            if ( this.#v.manualEntries ) {
                if ( pDisplayValue && !returnDisplay ) {
                    throw new Error( EM_NO_DISPLAY_VALUE );
                } else if ( pValue && pDisplayValue && !this.#v.multiValue) {
                    throw new Error( EM_NO_DISPLAY_RETURN_VALUE );
                }
            } else {
                if ( pDisplayValue && !pValue ) {
                    throw new Error( "pValue cannot be undefined, if pDisplayValue is provided" );
                }
            }
            // End of validations

            if ( !this.#rendered ) {
                // If the item has not been rendered we stored the value and do nothing, it will be set on rendering time
                this.#defaultValue = pValue;
                return;
            }

            if ( this.#v.multiValue ) {
                // We need to remove the chips first before adding the chips for the new values item value
                // Removes the lov chips
                for ( const el of oldValue ) {
                    let valueToRemove;
                    if ( this.#v.manualEntries ) {
                        // If return display we need to get the visual representation of the chip, because the look-up
                        // for which chip to remove is performed by display value.
                        valueToRemove = returnDisplay ? this.#choiceDisplayValue( el ) : el ;
                    } else {
                        valueToRemove = el;
                    }

                    this.#comboboxInterface.removeValueChip( valueToRemove, true );
                }
                // Removes the non-lov chips
                for ( const el of oldNonLovValue ) {
                    this.#comboboxInterface.removeValueChip( el, true );
                }
                // passing undefined or any falsy value would clear the item.
                this.#value = undefined;
                this.#manualEntries = undefined;
                this.#selectedChoices = undefined;
                this.#setManualItem( "" );

                if ( this.#v.manualEntries ) {
                    if ( pValue  ) {
                        const lValue =  pValue,
                            valueIsArray = isArray( lValue );
                            const purifiedArray = purifyArray( valueIsArray ? lValue : util.toArray( lValue, this.getMultiValueStorage() ) );

                        for ( const el of purifiedArray ) {
                            this.#addValueChip( el );
                        }
                    }
                    if ( pDisplayValue  ) {
                        const lValue =  pDisplayValue,
                            valueIsArray = isArray( lValue );
                            const purifiedArray = purifyArray( valueIsArray ? lValue : util.toArray( lValue, this.getMultiValueStorage() ) );
                        for ( const el of purifiedArray ) {
                            this.#addValueChip( undefined, el );
                        }
                    }
                } else {
                    let purifiedValuesArr, purifiedDisplayValuesArr;

                    if ( pValue ) {
                        purifiedValuesArr = purifyArray( isArray( pValue ) ? pValue : util.toArray( pValue, this.getMultiValueStorage() ) );
                    }

                    if ( purifiedValuesArr?.length ) {
                        if ( pDisplayValue && !isChoicesObj ) {
                            purifiedDisplayValuesArr = purifyArray(
                                isArray( pDisplayValue ) ? pDisplayValue : util.toArray( pDisplayValue, this.getMultiValueStorage() )
                            );
                        }
                        // If fetchOnSearch true, but a list of display values or a choices object is provided, no AJAX 
                        // request will be triggered disregarding if the number is displayed values provided is less than 
                        // the number of values
                        if ( !this.#v.fetchOnSearch || ( this.#v.fetchOnSearch && ( purifiedDisplayValuesArr || isChoicesObj ) )) {
                            for ( let i = 0; i < purifiedValuesArr.length; i++ ) {
                                let r = purifiedValuesArr[i],
                                    displayValue;

                                if ( purifiedDisplayValuesArr ) {
                                    // If a pDisplayValue is provided, if there is not a display value for that value instance
                                    // the display value would be equal to the value, for Fetch On Search false, no value consolidation
                                    // will be triggered if pDisplayValue is provided
                                    displayValue = purifiedDisplayValuesArr[i] ? purifiedDisplayValuesArr[i] : r;
                                } else if ( isChoicesObj ) {
                                    let record = this.constructor.choiceRecord( r, pDisplayValue );

                                    if ( record ) {
                                        displayValue = { data: [ record ] };

                                        if ( pDisplayValue.fields ) {
                                            displayValue.fields = pDisplayValue.fields;
                                        }
                                    }

                                    if ( !displayValue ) {
                                        displayValue = r;
                                    }
                                }

                                this.#addValueChip( r, displayValue, true, true );
                            }
                        } else {
                            // We first set the item value to the value being passed, although the UI won't reflect the change
                            // until is the AJAX call is back with the display values
                            this.#value = purifiedValuesArr;

                            // Meanwhile waiting for the async context value to be brougth from the server
                            // we provide some temp choice context to not leave the item on an non-workable state
                            this.#selectedChoices = purifiedValuesArr.map( el => { return { r: el, d: el }; } );

                            // Async
                            this.#fetchDisplayValues( purifiedValuesArr );
                        }
                    }
                }

            } else {
                const lValue =  pValue ? pValue : pDisplayValue,
                    valueIsArray = isArray( lValue );
                let valueOneDisplayValue, valueOneReturnValue;

                if ( returnDisplay ) {
                    if ( pValue ) {
                        valueOneReturnValue = this.#purifyValue( valueIsArray ? pValue[ 0 ] : pValue );
                    }

                    if ( this.#v.manualEntries || !isChoicesObj ) {
                        if ( pDisplayValue ) {
                            valueOneDisplayValue = this.#purifyValue( valueIsArray ? pDisplayValue[ 0 ] : pDisplayValue );
                        }
                    } else if ( isChoicesObj ){
                        let record = this.constructor.choiceRecord( valueOneReturnValue, pDisplayValue );

                        if ( record ) {
                            const choice = record.opts ? record.opts[0] : record;
                            valueOneDisplayValue = choice.d;
                        } else {
                            valueOneDisplayValue = valueOneReturnValue;
                        }
                    }
                } else {
                    valueOneDisplayValue = this.#purifyValue( valueIsArray ? pValue[ 0 ] : pValue );
                }

                this.#setValueOne(
                    valueOneReturnValue,
                    valueOneDisplayValue ,
                    true,
                    valueOneReturnValue !== undefined );
            }

            if ( !pSuppressChangeEvent ) {
                const changeEvent = $.Event( "change" );

                changeEvent.apexData = {
                    oldValue: oldValue,
                    value: this.getValue()
                };

                if ( this.#identifyManualEntries ) {
                    changeEvent.apexData.oldValueManualEntries = oldNonLovValue;
                }

                this.element.trigger( changeEvent, changeEvent.apexData );
            }
        }

        getValue() {
            let value = this.#value;

            if ( this.#v.multiValue ) {
                if ( value ) {
                    // We don't return the pointer to the inner value when it is an array, to avoid unwanted mutations
                    value = [ ...value ];
                } else {
                    value = [];
                }
            } else {
                if ( !value ) {
                    value = '';
                }
            }

            return value;
        }

        getSeparator() {
            if ( this.#v.multiValue ) {
                return this.#v.multiValueSeparator;
            } else {
                return null;
            }
        }

        getMultiValueStorage() {
            if ( this.#v.multiValue ) {
                let storage = { type: this.#v.multiValueStorage };

                if ( this.#v.multiValueStorage === SEPARATED ) {
                    storage.separator = this.#v.multiValueSeparator;
                }
                return storage;
            } else {
                return null;
            }
        }

        // Method used by grid or other widgets that implement the flyweight pattern
        reinit( pValue ) {

            // clear the auto complete select list, will get repopulated as soon as the user types something in
            this.#cachedSearches.clear();

            // set value and suppress change event
            this.setValue( pValue, null, true );

            if ( !this.#v.fetchOnSearch && this.#v.ajaxIdentifier && this.#v.parentItems ) {
                return () => { this.#fetchInlineResults(); };
            }
        }

        getManualEntries() {
            if ( this.#v.multiValue ) {
                return [ ...( this.#manualEntries || [] ) ];
            } else {
                return this.#manualEntries === undefined ? "" : this.#manualEntries;
            }
        }

        isEmpty() {
            let empty = true;

            if ( this.#v.multiValue && ( this.getValue().length || this.getManualEntries().length ) ) {
                empty = false;
            } else if ( !this.#v.multiValue && ( this.getValue() || this.getManualEntries() ) ) {
                empty = false;
            }

            return empty;
        }

        getValidity() {
            const isRequired = this.element.attr( "required" );

            if ( isRequired !== undefined && isRequired !== false ) {
                if ( this.isEmpty() ) {
                    return { valid: false, valueMissing: true };
                }
            }

            return { valid: true };
        }

        // TODO consider document this method, for developers to append a-option elements inside the web component, call
        // the method and then choices are refreshed.
        /**
         *  Parses the HTML metadata options as an array of choices, calling this method will always reset the choices object
         *  and column configuration.
         *
         *  @example
         *  <a-column-metadata name="COLUMN_NAME" searchable="true" index="0"></a-column-metadata>
         *  <a-optgroup label="Group">
         *      <a-option value="valueId" icon="myIcon">
         *          Option Label
         *          <a-option-column-value>Column Text</a-option-column-value>
         *      </a-option>
         *  </a-optgroup>
         *  //e.g.
         *  <a-column-metadata name="DESCRIPTION" searchable="true" index="0"></a-column-metadata>
         *  <a-optgroup label="Cat 1">
         *      <a-option value="1">
         *          Option 1
         *          <a-option-column-value>Description for option 1</a-option-column-value>
         *      </a-option>
         *      <a-option value="2">
         *          Option 2
         *          <a-option-column-value>Description for option 2</a-option-column-value>
         *      </a-option>
         *  </a-optgroup>
         *  <a-optgroup label="Cat 2">
         *      <a-option value="3">
         *          Option 3
         *          <a-option-column-value>Description for option 2</a-option-column-value>
         *      </a-option>
         *  </a-optgroup>
         * @ignore
         */
        parseChoices() {
            this.choices = this.#parsedChoices();
        }

        _cleanup(  ) {
            if ( this.#comboboxInterface ) {
                this.#comboboxInterface.destroy();
            }
        }

        _render( attrChanges ) {
            if ( this.#fixedProperties ) {
                // Replace the value from the inner state of the fixed properties, to ensure they are never changed.
                for ( const [ k, v ] of Object.entries( this.#fixedProperties ) ) {
                    this.#v[k] = v.value;

                    if ( attrChanges ) {
                        // We remove the attribute from the array of attribute changes
                        attrChanges = attrChanges.filter( el => el.attributeName !== v.attrName );
                    }
                }

                if ( attrChanges && !attrChanges.length ) {
                    // If after removing the fixed attributes the array length is zero we set the array undefined
                    // to avoid unnecessary codes executions on the render function.
                    attrChanges = undefined;
                }
            }

            // These conditions will be used many times to check a valid configuration, we compute it once, and on each attribute change it will be computed again
            this.#identifyManualEntries = this.#v.manualEntriesItem && !this.#v.fetchOnSearch && this.#v.manualEntries;
            this.#returnDisplay = !this.#v.manualEntries || ( this.#v.manualEntries && !this.#v.fetchOnSearch && this.#v.returnDisplay );

            if ( !this.#rendered ) {
                const hasHtmlChoices = this.element.find( "a-optgroup, a-option, a-column-metadata" ).length > 0;
                let icon$;

                // If there are option elements inside, we parsed and convert them to an array, this parse will only happen
                // on component creation, if user want to modify the options, it will have to access them through the choices property
                if ( !this.#v.fetchOnSearch && ( hasHtmlChoices || !this.choices ) ) {
                    this.parseChoices();
                } else if( this.#v.fetchOnSearch && ( hasHtmlChoices || !this.initialValueChoices ) ) {
                    this.initialValueChoices = this.#parsedChoices();
                }

                if ( this.#v.multiValue ) {
                    this.#comboboxContainer$ = $( `<div><ul><li></li></ul></div>` );
                    this.#comboboxContainer$.find( "li" ).append( this._wrappedElement$ );
                } else {
                    this.#comboboxContainer$ = $( `<div></div>` );
                    this.#comboboxContainer$.filter( "div" ).append( this._wrappedElement$ );
                }

                // Saved the icon printed by the server before everything gets wipe out
                if ( this.element.hasClass( "apex-item-has-icon" ) ) {
                    icon$ = this.element.find( ".apex-item-icon" ).detach();
                }

                // Clears the element inside, this removes server placeholder too.
                this.element.empty();
                this.element.append( this.#comboboxContainer$ );
                // Put the icon back
                if ( icon$ && icon$[0] ) {
                    this.element.append( icon$ );
                }

                this.#selectedChoices = undefined;
                this.#lastResultSet = undefined;

                // Initialize the combobox
                this.#comboboxInterface = widget.util.initComboSelect( this.#comboboxContainer$, {
                    baseId: this.id,
                    searchIcon: false,
                    enterable: this.#v.manualEntries,
                    multiValued: this.#v.multiValue,
                    multiSelect: this.#v.multiSelect,
                    expandIcon: !( this.#v.multiValue &&  this.#v.manualEntries ),
                    useOverflow: false,
                    multiValueSeparator: this.#v.multiValueSeparator,
                    escapeChoices: false,
                    maxHeight: MAX_DROPDOWN_H,
                    hasIcons: true,
                    clearIcon: true,
                    minCharactersSearch: this.#v.minCharactersSearch,
                    noMatchesMessage: this.#v.noResultsHint,
                    popupClasses: "ui-dialog-combobox",
                    choiceTemplate: this.#v.choiceTemplate,
                    asyncLoading: this.#v.fetchOnSearch,
                    closeOnEmpty: this.#v.manualEntries,
                    displayValuesAs: this.#v.displayValuesAs,
                    choices: ( match, callback, selectedValuesOnly = false ) => { this.#search( match, callback, selectedValuesOnly ); },
                    isDisabled: function() {
                        return false;
                    },
                    removeValue: ( value ) => {
                        const returnDisplay = this.#returnDisplay;

                        return returnDisplay && this.#v.manualEntries ? this.#removeValue( undefined, value ) : this.#removeValue( value );
                    },
                    addValue: ( returnValue, displayValue, existingChoice ) => {
                        return this.#addValueCb( returnValue, displayValue, existingChoice );
                    },
                    findChoice: ( returnValue, displayValue ) => {
                        // manualEntries true, doesn't need this function to return anything, when false
                        // we need to return an object containing the option information.
                        return this.#v.manualEntries ? undefined : { d: displayValue, r: returnValue };
                    },
                    setValue: ( returnValue, displayValue, existingChoice ) => {
                        return this.#setValueOne( returnValue, displayValue, false, existingChoice );
                    }
                } );

                // If not manual entries allowed, we don't apply autoTagCreation
                if ( this.#v.manualEntries ) {
                    this.#comboboxInterface.options.autoTagCreation = ( inputVal ) => {
                        const separators = this.#v.multiValueSeparator,
                            regExpSeparator = new RegExp( util.escapeRegExp( separators ) );
                        let chips;


                        if ( inputVal.match( regExpSeparator ) ) {
                            // Splits the string by the separator and removes empty strings. Boolean constructor
                            // return false for "" and it is used to filter them out from the array.
                            chips = inputVal.split( regExpSeparator ).filter( Boolean );
                        }

                        return chips;
                    };
                }

                this.#rendered = true;

                // Listeners
                this.#setDependingOnListener();

                this.#setListeners();

                this.#initializeComponentValue();
            } else if ( attrChanges ){
                for ( const v of attrChanges ) {

                    switch ( v.attributeName ) {
                        case componentMetaData.minCharactersSearch.attrName:
                            this.#comboboxInterface.options.minCharactersSearch = this.#v.minCharactersSearch;
                            break;
                        case componentMetaData.fetchOnSearch.attrName:
                            this.#comboboxInterface.options.asyncLoading = this.#v.fetchOnSearch;
                            break;
                        case componentMetaData.multiSelect.attrName:
                            this.#comboboxInterface.options.multiSelect = this.#v.multiSelect;
                            break;
                        case componentMetaData.choiceTemplate.attrName:
                            // TODO add logic to allow choiceTemplate to be a template named e.g. #myTemplate
                            this.#comboboxInterface.options.choiceTemplate = this.#v.choiceTemplate;
                            break;
                        case componentMetaData.multiValueSeparator.attrName:
                            this.#comboboxInterface.options.multiValueSeparator = this.#v.multiValueSeparator;
                            // Clears the item value.
                            this.setValue();
                            break;
                        case componentMetaData.noResultsHint.attrName:
                            this.#comboboxInterface.options.noMatchesMessage = this.#v.noResultsHint;
                            break;
                        case componentMetaData.manualEntriesItem.attrName:
                            // Clears the item value
                            this.setValue();

                            this.#value = undefined;
                            this.#manualEntries = undefined;

                            break;
                    }

                    // When these attributes change a full re-render will be applied
                    if ( [ componentMetaData.multiValue.attrName,
                        componentMetaData.returnDisplay.attrName,
                        componentMetaData.displayValuesAs.attrName
                    ].includes( v.attributeName ) ) {
                        this.#rendered = false;
                        // This removes the input element that has listeners making reference to the old ComboSelect interface
                        this._wrappedElement$.remove();
                        this._wrappedElement$ = $( WRAPPED_ELEMENT_HTML );
                        // Clean the items value
                        this.#value = undefined;
                        this.#manualEntries = undefined;
                        this.#setManualItem( "" );

                        // Destroy the old widget
                        this._cleanup();
                        this._render();
                    }

                    // Check if the changing attribute is one that could affect the cache results, if so it clears it.
                    if ( ![ componentMetaData.minCharactersSearch.attrName,
                        componentMetaData.ajaxIdentifier.attrName,
                        componentMetaData.ajaxItems.attrName,
                        componentMetaData.parentItems.attrName,
                        componentMetaData.returnDisplay.attrName,
                        componentMetaData.maxResults.attrName
                    ].includes( v.attributeName ) ) {
                        this.#cachedSearches.clear();
                    }

                    if ( v.attributeName === componentMetaData.parentItems.attrName ) {
                        this.#setDependingOnListener( v.oldValue );
                    }
                }
            }

            // Validate item configuration
            if ( this.#v.returnDisplay && this.#v.fetchOnSearch && this.#v.manualEntries ) {
                debug.error( "Invalid configuration, fetchOnSearch must be false to support returnDisplay" );
            }

            if ( this.#v.returnDisplay && !this.#v.manualEntriesItem && this.#v.manualEntries ) {
                debug.error( EM_IDENTIFY_MANUAL_TRUE );
            }
        }

        // Static methods

        /**
         *  Search for a choice in a given choices object
         *  
         * Non-puplic, it is exposed for unit tests
         * @ignore
         */
        static choiceRecord( returnValue, choices ) {
            const data = choices.data,
                hasGroups = choicesHasGroups( choices );
            let groupIndex = 0, 
                record, groupLength;

            if ( hasGroups ) {
                groupLength = data.length;
            } else {
                // If there is no groups, it loops at least once as it were a big group
                groupLength = 1; 
            }

            while ( groupIndex < groupLength && !record ) {
                const groupOpts = hasGroups ? data[groupIndex].opts : data;
                let index = 0;

                while( index < groupOpts.length && !record ) {
                    const choice = groupOpts[index];

                    if( choice.r === returnValue ) { 
                        const clonedChoice = $.extend( true, {}, choice );
                        record = hasGroups ? { label: data[groupIndex].label, opts: [ clonedChoice ] } : clonedChoice;
                    }

                    index += 1;
                }

                groupIndex += 1;
            }   
            
            return record;
        };

        /**
         *  Includes all the client search logic
         *  PD. Delegated to a static public method, so it can be used for component testing and server side mockup
         * @ignore
         */
        static searchChoices( choices, searchTerm, filter, highlightSearchTerm, maxResults,
                              matchType, caseSensitive, returnDisplay, pristineResults ) {
            const choicesArr = choices.data,
                hasGroups = choicesHasGroups( choices ),
                // Count when no using groups will be 1, to simulate a big group
                groupsCount = hasGroups ? choicesArr.length : 1,
                // If not returnDisplay, display property is r, to match our Shared LOVs
                displayProperty = returnDisplay ? "d" : "r";

            let results = [],
                groupIndex = 0,
                resultsTotal = 0,
                columnsArr;

            if ( choices.fields ) {
                // If we are using multi columns, an array of the column configuration is created based on the fields object
                columnsArr = fieldsToColumnsArr( choices.fields );

                if ( pristineResults ) {
                    pristineResults.fields = choices.fields;
                }
            }

            while( groupIndex < groupsCount && ( !maxResults || ( resultsTotal < maxResults ) ) ) {
                const groupResults = [],
                    pristineGroupResults = [];
                let choiceIndex = 0,
                    choicesInGroup;


                if ( hasGroups ) {
                    choicesInGroup = choicesArr[groupIndex].opts;
                } else {
                    // If not groups, the choices in group are all the choices available
                    choicesInGroup = choicesArr;
                }

                while ( choiceIndex < choicesInGroup.length && ( !maxResults || ( resultsTotal < maxResults ) ) ) {
                    const choice = choicesInGroup[choiceIndex];
                    let highlightedDisplayValue,
                        highlightedStringCol,
                        pristineChoiceCols;

                    if ( isArray( choice.cols ) ) {
                        let colsIndex = 0;

                        pristineChoiceCols = [...choice.cols];

                        while ( colsIndex < choice.cols.length && !highlightedStringCol ) {
                            const colValue = choice.cols[ colsIndex ];
                            if ( columnsArr[colsIndex].searchable && colValue ) {
                                highlightedStringCol = widget.util.highlightSearchTerm(
                                    colValue,
                                    searchTerm, matchType, caseSensitive, 'a-ComboSelect-itemHighlight'
                                );

                                // If there is a search term, and something was found on the column, we update the column data
                                if ( highlightedStringCol && searchTerm && highlightSearchTerm ) {
                                    choice.cols[ colsIndex ] = highlightedStringCol;
                                }
                            }

                            colsIndex = colsIndex + 1;
                        }

                    } else {
                        highlightedDisplayValue = widget.util.highlightSearchTerm(
                            choice[ displayProperty ], searchTerm, matchType, caseSensitive, 'a-ComboSelect-itemHighlight'
                        );
                    }

                    if ( highlightedDisplayValue || highlightedStringCol || !filter )  {
                        const matchedChoice = {
                            pristineDisplayValue: choice[ displayProperty ], //This will be the visual value for the chips
                            i: choice.i,
                            cols: choice.cols
                        };
                        let displayValue;

                        if ( highlightSearchTerm && highlightedDisplayValue ) {
                            // Value already escaped
                            displayValue = highlightedDisplayValue;
                        } else {
                            // If not highlighted value, or parameter highlight false, we use the pristine value
                            displayValue = util.escapeHTML( matchedChoice.pristineDisplayValue );
                        }

                        if ( returnDisplay ) {
                            if ( !choice.r ) {
                                throw new Error( "Invalid choice object, r property missing" );
                            }

                            matchedChoice.r = choice.r;
                            matchedChoice.d = displayValue;
                        } else {
                            matchedChoice.r = displayValue;
                        }


                        groupResults.push( matchedChoice );

                        if ( pristineResults ) {
                            const pristineRecord = {
                                i: choice.i,
                                r: choice.r,
                                d: choice[ displayProperty ]
                            };

                            if ( pristineChoiceCols ) {
                                pristineRecord.cols = pristineChoiceCols;
                            }

                            pristineGroupResults.push( pristineRecord );
                        }

                        resultsTotal += 1;
                    }
                    choiceIndex += 1;
                }

                if ( hasGroups && groupResults.length ) {
                    results.push( {
                        label: choicesArr[groupIndex].label,
                        opts: groupResults
                    } );
                } else {
                    results = [ ...results, ...groupResults ];
                }

                if ( pristineResults && pristineGroupResults.length ) {
                    if ( !pristineResults.data ) {
                        pristineResults.data = [];
                    }

                    if ( hasGroups ) {
                        pristineResults.data.push( {
                            label: choicesArr[groupIndex].label,
                            opts: pristineGroupResults
                        } );
                    } else {
                        pristineResults.data = [...pristineResults.data, ...pristineGroupResults];
                    }
                }

                groupIndex += 1;
            }

            return { fields: columnsArr, data: results };
        }

        static get observedAttributes() {
            return observedAttributes;
        }

        static get delegatedAttributes() {
            return delegatedAttributes;
        }

        static get componentMetaData() {
            return componentMetaData;
        }
        // End of static methods
    }

    apex.widget.util.ComboSelect = ComboSelect;


} )( apex.item, apex.util, apex.widget, apex.debug, apex.jQuery, apex.WebComponent );