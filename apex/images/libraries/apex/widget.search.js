/*!
 * Copyright (c) 2022, 2023, Oracle and/or its affiliates. All rights reserved.
 */

/**
 * @interface search
 * @since 22.2
 * @extends {region}
 * @classdesc
 * <p>The Search Widget is a new region type.
 * The developer adds the "Search" Region to their page, and configures one or many Search Configurations to use for search.
 * For each used Search Configuration, the developer configures up to 3 links, which are displayed at various places in the
 * result list, and which allow end users to navigate based on Search Results.
 * </p>
 */
 (function ( util, debug, lang, $, region ) {
    "use strict";

    //Constants:
    const REGION_TYPE        = "Search",
          WIDGET_NAME        = "search",
          C_SR               = "a-SearchResults",
          C_SR_COUNT         = C_SR + "-count",
          C_SR_OL            = C_SR + "-list",
          C_SR_LI_ITEM       = C_SR + "-item",
          C_SR_LI_EMPTY      = C_SR + "-emptySearch",
          C_SR_LI_NO_DATA    = C_SR + "-noData",
          C_SR_PAGINATION    = C_SR + "-pagination",
          C_SR_PAGE_NAV      = C_SR + "-pageNav",
          C_SR_PREV          = C_SR_PAGE_NAV + "--prev",
          C_SR_NEXT          = C_SR_PAGE_NAV + "--next",
          C_ICON             = "a-Icon",
          C_ICON_PREV        = "icon-prev",
          C_ICON_NEXT        = "icon-next",
          C_SR_PAGE_RANGE    = C_SR + "-pageRange",
          C_UVH              = "u-vh",
          C_BUTTON           = "a-Button",
        //Pagination Defaults:
          C_O_FIRST_ROW_DEFAULT    = 1,
        //Other settings:
          C_PAGINATION_DEBOUNCE = 20,
          C_SEARCH_DEBOUNCE = 400;

    function translate( m ) {
        return lang.getMessage( m );
    }

    function format( pKey, ...pValues ) {
        return lang.formatMessage( pKey, ...pValues );
    }

    $.widget( "apex.search",
    {
        widgetEventPrefix: WIDGET_NAME,
        options: {
            /**
             * Region numeric value for lazy loading usage.
             *
             * @ignore
             * @memberof search
             * @instance
             * @type {string}
             * @default null
             */
            regionId: null,
            /**
             * Search region id. Required.
             *
             * @ignore
             * @memberof search
             * @instance
             * @type {string}
             * @default null
             */
            regionStaticId: null,
            /**
              * The plug-in ajax identifier. Required.
              *
              * @ignore
              * @memberof search
              * @instance
              * @type {string}
              * @default null
              */
            ajaxIdentifier: null,
            /**
              * <p>If false, search results data was fetched as part of the page load.
              * Found in object gSearch{regionID}data global JS variable.</p>
              *
              * @memberof search
              * @instance
              * @type {boolean}
              * @default false
              * @exampleGetter false
              */
             lazyLoading: false,
            /**
              * <p>List of selectors for page items to submit.</p>
              *
              * @memberof search
              * @instance
              * @type {String}
              * @default null
              * @exampleGetter #PAGE_ITEM_1,#PAGE_ITEM_2
              */
            itemsToSubmit: null,
            /**
             * <p>External Page Item that will be used as the source of
             * end-user search terms.</p>
             *
             * @memberof search
             * @instance
             * @type {string}
             * @exampleGetterSetter P100_INPUT_TEXT
             */
            externalPageItem: null,
            /**
              * Indicates whether default search configurations are set. If true, this
              * widget will fetch data when no query was typed in.
              *
              * @ignore
              * @memberof search
              * @instance
              * @type {boolean}
              * @default false
              */
            ajaxFetchWhenNoQuery: false,
            /**
              * <p>If true, the results are returned in a single group instead of
              * being grouped by search configurations.</p>
              *
              * @memberof search
              * @instance
              * @type {boolean}
              * @default false
              * @exampleGetter false
              */
            usesOverallSort: false,
            /**
             * <p>If true, the server request will be performed as the user
             * types in the input field instead of pressing 'Enter'</p>
             *
             * @memberof search
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetter false
             */
            searchAsYouType: false,
            /**
             * <p>If searchAsYouType is set to true, then this field is
             * required to start searching depending on the amount of characters</p>
             *
             * @memberof search
             * @instance
             * @type {Integer}
             * @default 0
             * @exampleGetter 4
             */
             minCharacters: 0,
            /**
             * <p>Used to show or hide the Result Count.
             * Can be true or false, default false.</p>
             *
             * @memberof search
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetterSetter false
             */
            showResultCount: false,
            /**
             * <p>If Show Result Count is set to "Selector", this value needs
             * to be set. If set to null, the widget will either:
             * 1. If showResultCount = true, a div will be added with the result
             * count visible to the user.
             * 2. If showResultCount = false, a hidden div will be added for
             * accessibility purposes. </p>
             *
             * @memberof search
             * @instance
             * @type {string}
             * @exampleGetterSetter #containerID
             */
            resultCountSelector: null,
            /**
             * <p>If defined, this property represents a string message that
             * will be returned when no query has been performed and
             * results are not set.</p>
             *
             * @memberof search
             * @instance
             * @type {string}
             * @default null
             * @exampleGetterSetter MY.OWN.STRING
             */
            noQueryEnteredMessage: null,
            /**
             * <p>If defined, this limits the amount of results per page,
             * otherwise the rendered results region will not use pagination.</p>
             *
             * @memberof search
             * @instance
             * @type {Integer}
             * @default null
             * @exampleGetterSetter 10
             */
            resultsPerPage: null,
            /**
             * <p>If defined, this no data found message will be displayed
             * instead of any message defined for each source configuration.</p>
             *
             * @memberof search
             * @instance
             * @type {String}
             * @default null
             * @exampleGetterSetter "No results found"
             */
            overrideNoDataFoundMessage: null
        },

        // ------
        // Internal lifecycle methods
        //
        _create: function () {
            let o = this.options,
                ctrl$ = this.element,
                lWidget = this;

            debug.trace( `Search Region '${ctrl$[0].id}' created. Options: `, o );
            this._super();

            region.create( o.regionStaticId, function( baseRegion ) {
                baseRegion.type = REGION_TYPE;
                baseRegion.widgetName = WIDGET_NAME;
                baseRegion.widget = function() {
                    return ctrl$;
                };
                baseRegion.refresh = function() {
                    lWidget._refetch();
                };
                apex.widget.util.makeInterfaceFromWidget( baseRegion, ctrl$, WIDGET_NAME, ["openConfig"],
                    ["ajaxIdentifier", "regionStaticId"] );
            } );

            //In order to ajaxFetchWhenNoQuery OR lazyLoading to work, min characters should be at least 1.
            if ( o.minCharacters === 0 ) {
                o.minCharacters = 1;
            }

            //Setup instance pagination obj
            lWidget.pagination = {
                firstRow: C_O_FIRST_ROW_DEFAULT
            };

            lWidget._searchItem = apex.item(o.externalPageItem);
            lWidget._searchItem$ = $( "#" + util.escapeCSS( o.externalPageItem ) );

            lWidget._render();
            lWidget._addEventHandlers();
            //Initial fetch
            lWidget._refetch();
        },

        _getItemValue: function() {
            return this._searchItem.getValue().trim();
        },

        _destroy: function() {
            this._removeEventHandlers();
            this.element
                .removeClass( C_SR )
                .empty();
        },

        _render: function() {
            let o = this.options,
                ctrl$ = this.element,
                lResultList$ = ctrl$.find( "." + C_SR_OL ),
                lResultsCount$;

            //Add result count output (if no selector defined):
            if( o.showResultCount && !o.resultCountSelector ) {
                lResultsCount$ = $( `<div class="${C_SR_COUNT}" aria-live="polite"></div>` );
            } else {
                //Print out the results count (hidden):
                lResultsCount$ = $( `<div class="${C_SR_COUNT} ${C_UVH}" aria-live="polite"></div>` );
            }
            if( lResultList$.length === 0 ) {
                //No OL rendered in the region.
                lResultList$ = $( `<ol class="${C_SR_OL}"></ol>` );
                ctrl$.html( lResultList$ );
            }
            //Add the search results list container:
            lResultsCount$.insertBefore( lResultList$ );

            //Sets the result count to 0:
            this._setResultsCount( "0" );
        },

        _refetch: function() {
            let o = this.options,
                ctrl$ = this.element,
                lCurrentValue = this._getItemValue(),
                lLazyLoadingData;

            //Run fetch:
            if ( lCurrentValue.length > 0 ) {
                //If input has already a value (on page load/calculation/reload)
                this._fetch( lCurrentValue );
            } else if( o.ajaxFetchWhenNoQuery  ) {
                //Load when no query (a search config is set to load always)
                this._fetch();
            } else if ( !o.lazyLoading ) {
                //Find the loaded data in the document:
                lLazyLoadingData = `gSearch${o.regionId}data`;
                //Verify if the data in the document has contents:
                if ( window[lLazyLoadingData]?.configs?.length > 0 ) {
                    this._renderResults( window[lLazyLoadingData] );
                } else {
                    //Found object in dom but had no results, treat this as no query entered.
                    if( o.noQueryEnteredMessage ) {
                        ctrl$.find( "." + C_SR_OL ).empty().append( `<li class="${C_SR_LI_EMPTY}">${translate(o.noQueryEnteredMessage)}</li>` );
                    }
                }
            } else {
                //Nothing searched
                if( o.noQueryEnteredMessage ) {
                    ctrl$.find( "." + C_SR_OL ).empty().append( `<li class="${C_SR_LI_EMPTY}">${translate(o.noQueryEnteredMessage)}</li>` );
                }
            }
        },

        _reset: function() {
            this._render();
        },

        _addEventHandlers: function() {
            let lWidget = this,
                o = this.options,
                p = this.pagination,
                lSearchTerm;

            if( o.searchAsYouType ) {
                lWidget._searchItem$.on( "keyup", util.debounce(function() {
                    //Reset pagination:
                    p.firstRow = 1;
                    lSearchTerm = this.value.trim();
                    if ( lSearchTerm.length >= o.minCharacters ) {
                        lWidget._fetch( lSearchTerm );
                    } else if ( lSearchTerm.length <= 0 && o.ajaxFetchWhenNoQuery ) {
                        lWidget._fetch();
                    } else {
                        lWidget._clear();
                    }
                }, C_SEARCH_DEBOUNCE ));
            } else {
                //Search on "ENTER" key press
                lWidget._searchItem$.on( "keypress", function(e) {
                    if ( e.which === 13 ) {
                        //Reset pagination:
                        p.firstRow = 1;
                        lSearchTerm = this.value.trim();
                        if ( lSearchTerm.length > 0 ) {
                            lWidget._fetch( lSearchTerm );
                        } else if ( lSearchTerm.length <= 0 && o.ajaxFetchWhenNoQuery ) {
                            lWidget._fetch();
                        } else {
                            lWidget._clear();
                        }
                        e.preventDefault();
                    }
                });
            }

            //Add Pagination events:
            if( o.resultsPerPage ) {
                $( document ).on( "click", "button." + C_SR_PREV, util.debounce( function(){
                    let regionIdFromControl = $(this).attr( "aria-controls" );
                    //Allow pagination movements from specific region controls
                    //Supports multiple instances in the same region.
                    if( regionIdFromControl === o.regionStaticId ) {
                        p.firstRow -= o.resultsPerPage;
                        $(this).attr('disabled',true);
                        lWidget._fetch( lWidget._getItemValue(), function(){
                            $(this).attr('disabled',false);
                        } );
                    }
                }, C_PAGINATION_DEBOUNCE ));
                $( document ).on( "click", "button." + C_SR_NEXT, util.debounce( function() {
                    let regionIdFromControl = $(this).attr( "aria-controls" );
                    //Allow pagination movements from specific region controls
                    //Supports multiple instances in the same region.
                    if( regionIdFromControl === o.regionStaticId ) {
                        p.firstRow += o.resultsPerPage;
                        $(this).attr('disabled',true);
                        lWidget._fetch( lWidget._getItemValue(), function(){
                            $(this).attr('disabled',false);
                        } );
                    }
                }, C_PAGINATION_DEBOUNCE ));
            }
        },

        _removeEventHandlers: function() {
            let lWidget = this;

            lWidget._searchItem$.off( "keyup keypress" );
            $( document ).off( "click", "button." + C_SR_PAGE_NAV );
        },

        _clear: function() {
            let o = this.options,
                ctrl$ = this.element,
                resultList$ = ctrl$.find( "." + C_SR_OL ),
                pagination$ = ctrl$.find( "." + C_SR_PAGINATION);

            //Leave the default no search conducted message:
            if( o.noQueryEnteredMessage ) {
                resultList$.empty().append( `<li class="${C_SR_LI_EMPTY}">${translate(o.noQueryEnteredMessage)}</li>` );
            } else {
                resultList$.html( "" );
            }
            //Remove pagination:
            pagination$.remove();

            //Clear the result count.
            this._setResultsCount( "0" );
        },

        _setResultsCount: function( pValue ) {
            let o = this.options,
                ctrl$ = this.element,
                lNumber = parseInt( pValue, 10 ),
                lResultsString;

            if ( isNaN(lNumber) ) {
                //Defaulting to 0 but outputting an error message.
                debug.error( "Number of results obtained is not a valid number", pValue );
                lNumber = 0;
            } else {
                //Decide if we show 1 result found vs X results found message.
                lResultsString = ( lNumber === 1 ) ? translate( "APEX.SEARCH.1_RESULT_FOUND" ) : format( "APEX.SEARCH.N_RESULTS_FOUND", lNumber );
            }
            if( o.resultCountSelector && o.resultCountSelector.length > 0 ) {
                //For selectors, we only show the number.
                $( o.resultCountSelector ).empty().append( lNumber );
            } else {
                ctrl$.find( "." + C_SR_COUNT ).text( lResultsString );
            }
        },

        _fetch: function( pSearchTerm, callback ) {
            let lWidget = this,
                p,
                o = lWidget.options,
                lFirstRow = lWidget.pagination.firstRow,
                lSearchParameters = { action: "SEARCH" };

            //Trigger before refresh event so it can be used in dynamic actions, e.g.: add a spinner:
            lWidget.element.trigger( "apexbeforerefresh" );

            if ( pSearchTerm && pSearchTerm.length > 0 ) {
                lSearchParameters.query = pSearchTerm;
            }

            if( o.resultsPerPage ) {
                lSearchParameters.firstRow = lFirstRow;
                lSearchParameters.maxRows = o.resultsPerPage;
            }

            // AJAX call to plugin
            /**
             * lSearchParameters contains the following parameters:
             * action:   "SEARCH" //Other actions not supported at this time.
             * query:    <search term> //optional.
             * firstRow: <1-n> //optional, used if pagination enabled.
             * maxRows:  <1-n> //optional, used if pagination enabled.
             */
            p = apex.server.plugin( o.ajaxIdentifier, {
                pageItems: o.itemsToSubmit,
                x02: JSON.stringify(lSearchParameters)
            }, {
                dataType: "json",
                queue: {name: 'perform_search_' + o.regionStaticId, action: 'replace'} //Make sure the call replaces (aborts) old requests before running a new one.
            });

            p.done( data => {
                this._renderResults( data );
            } );
            p.always( () => {
                //Trigger after refresh event so it can be used in dynamic actions, e.g.: remove a spinner:
                lWidget.element.trigger( "apexafterrefresh" );

                if ( callback ) {
                    callback();
                }
            } );

            return p;
        },

        _renderResults: function( pResults ) {
            let o = this.options,
                ctrl$ = this.element,
                resultList$ = ctrl$.find( "." + C_SR_OL ),
                pagination$ = ctrl$.find( "." + C_SR_PAGINATION),
                lFirstRow = this.pagination.firstRow,
                lTopRow = (lFirstRow - 1 ) + o.resultsPerPage,
                lDisableNextButton = "",
                lDisablePreviousButton = `disabled="disabled"`,
                lConfigResults = 0,
                lPageResults = 0,
                lConfigResultsPerPage = 0,
                lTotalCount = 0;

            //Clear list and pagination areas.
            resultList$.html("");
            pagination$.remove();

            if( pResults ) {

                //Opening results list:
                if( o.resultsPerPage ) {
                    //Show start of results if pagination is shown:
                    resultList$.attr( "start", lFirstRow );
                } else {
                    resultList$.removeAttr( "start" );
                }

                if ( pResults.configs ) {
                    //Read results from each search configuration:
                    if( pResults.configs.length > 0 ) {
                        pResults.configs.forEach( function( configResult ) {
                            lConfigResults = 0;
                            lConfigResultsPerPage += configResult.results.length;
                            lTotalCount += configResult.resultsCount ? configResult.resultsCount : 0;
                            configResult.results.every( function ( result ) {

                                //When pagination is used, there is always an extra row added at the end, skip adding it.X
                                if ( o.resultsPerPage && ( lConfigResults === o.resultsPerPage || lPageResults === o.resultsPerPage ) ) {
                                    return false;
                                }
                                //Add result using markup from the server:
                                resultList$.append( `<li class="${C_SR_LI_ITEM}">${result.row}</li>` );
                                lConfigResults += 1;
                                lPageResults += 1; //overall count.

                                return true;
                            });

                            //Show no data found messages, if configured.
                            if ( lConfigResults === 0 && configResult.noDataFound && !o.overrideNoDataFoundMessage ) {
                                resultList$.append( `<li class="${C_SR_LI_NO_DATA}">${configResult.noDataFound}</li>` );
                            }
                        });

                    }
                } else if ( o.usesOverallSort ) {
                    lTotalCount += pResults.resultsCount ? pResults.resultsCount : 0;
                    //Show results when overall sort is specified:
                    if( pResults.results.length > 0 ) {
                        lConfigResultsPerPage += pResults.results.length;
                        //Add results with mixed configurations:
                        lPageResults = 0;
                        pResults.results.every( function ( result ) {
                            //When pagination is used, there is always an extra row added at the end, skip adding it.
                            if ( o.resultsPerPage && lPageResults === o.resultsPerPage ) {
                                return false;
                            }

                            //Add result using markup from the server:
                            resultList$.append( `<li class="${C_SR_LI_ITEM}">${result.row}</li>` );
                            lPageResults += 1;

                            return true;
                        });

                        //Show no data found messages, if configured.
                        if ( lPageResults === 0 && pResults.noDataFound && !o.overrideNoDataFoundMessage ) {
                            debug.trace( pResults.noDataFound );
                            resultList$.append( `<li class="${C_SR_LI_NO_DATA}">${pResults.noDataFound}</li>` );
                        }
                    } else {
                        if ( pResults.noDataFound && !o.overrideNoDataFoundMessage ) {
                            resultList$.append( `<li class="${C_SR_LI_NO_DATA}">${pResults.noDataFound}</li>` );
                        }
                    }
                } else {
                    //Wrong config or JSON output?
                    debug.error( "Invalid JSON output returned from the server", pResults );
                }

                //Add no data found if the override no data found message is set:
                if ( lPageResults === 0 && o.overrideNoDataFoundMessage ) {
                    resultList$.append( `<li class="${C_SR_LI_NO_DATA}">${o.overrideNoDataFoundMessage}</li>` );
                }

                //Set results output:
                this._setResultsCount( lTotalCount );

                /**
                 * Add Pagination:
                 * 1. If results per page value is defined (pagination = ON) and,
                 * 2. page results are more than 0 and,
                 * 3. is the first row and the amount of total results is more than results per page or,
                 *      is the first row is more than 1 (user has clicked on next page).
                 */
                if ( ( o.resultsPerPage && lPageResults > 0 )
                    && ( ( lFirstRow === 1 && lConfigResultsPerPage > o.resultsPerPage ) || lFirstRow > 1 ) ) {

                    //Disable next button if we hit the total results.
                    if ( lConfigResultsPerPage <= o.resultsPerPage ) {
                        lTopRow = (lFirstRow - 1) + lPageResults;
                        lDisableNextButton = `disabled="disabled"`;
                    }

                    //Showing pagination in the main container:
                    ctrl$.attr( "aria-label", format("APEX.SEARCH.RESULTS_X_TO_Y", lFirstRow, lTopRow ));

                    //Enable the previous button if we are in the next page of results.
                    if ( lFirstRow > 1 ) {
                        lDisablePreviousButton = "";
                    }

                    $( `<div class="${C_SR_PAGINATION}" role="region" aria-label="${translate("APEX.SEARCH.PAGINATION")}">
                                    <button class="${C_BUTTON} ${C_SR_PAGE_NAV} ${C_SR_PREV}" type="button" aria-label="${translate("APEX.GV.PREV_PAGE")}" title="${translate("APEX.GV.PREV_PAGE")}" aria-controls="${o.regionStaticId}" ${lDisablePreviousButton}>
                                        <span class="${C_ICON} ${C_ICON_PREV}" aria-hidden="true"></span>
                                    </button>
                                    <span class="${C_SR_PAGE_RANGE}" title="${translate("APEX.GV.PAGE_RANGE")}" aria-live="polite">
                                        <span class="${C_UVH}">${translate("APEX.GV.PAGE_RANGE")}</span>
                                        ${lFirstRow} - ${lTopRow}
                                    </span>
                                    <button class="${C_BUTTON} ${C_SR_PAGE_NAV} ${C_SR_NEXT}" type="button" aria-label="${translate("APEX.GV.NEXT_PAGE")}" title="${translate("APEX.GV.NEXT_PAGE")}" aria-controls="${o.regionStaticId}" ${lDisableNextButton}>
                                        <span class="${C_ICON} ${C_ICON_NEXT}" aria-hidden="true" ></span>
                                    </button>
                                </div>` ).insertAfter( resultList$ );
                }

            } else {
                //Empty results.
                debug.trace( "No results available." );
                if( o.noQueryEnteredMessage ) {
                    resultList$.append( `<li class="${C_SR_LI_EMPTY}">${translate(o.noQueryEnteredMessage)}</li>` );
                }
            }

            //Removing is-placeholder class from the parent and aria-hidden="true"
            ctrl$.removeClass( "is-placeholder" ).removeAttr( "aria-hidden" );
        }
    });
})( apex.util, apex.debug, apex.lang, apex.jQuery, apex.region );
