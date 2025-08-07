/* !
 * Copyright (c) 2013, 2024, Oracle and/or its affiliates.
 */

/**
 * @fileOverview
 *
 * This file creates a Spotlight search dialog in App Builder.
 * There are two ways to open it:
 *   1. click the search icon on the top right
 *   2. Shortcut: Ctrl + '
 *
 * It searches a dynamic JSON file for navigation and
 * Apps / Pages depending on context.
 *
 * It searches a dynamic JSON file for recently visited.
 *
 **/

( function ( $, item, nav, util, actions, debug, lang, WebComponent, env, server ) {
  'use strict';

  let a_spotlight_search;
  let shortcuts_url;
  let selectedIndex = 0;

  const { formatMessage, getMessage } = lang; // application messages
  const session = env.APP_SESSION; // session information
  const currentAppId = $v( 'F4000_P1_FLOW' ) || $v( 'P4500_CURRENT_APP' ) || $v( 'P0_FLOWPAGE' ).split( ';' )[ 0 ] || null; // current app id

  // types of urls
  const URL_TYPES = {
    redirect:           'redirect',
    searchPage:         'search-page',
    searchApp:          'search-app',
    searchAllApps:      'search-all-apps',
    searchWorkspace:    'search-workspace',
    go2Page:            'goto-page',
    go2App:             'goto-app',
    pe:                 'pe',
    shortcutAction:     'shortcutAction',
  };

  /**
       * spotlight fuzzy search class
       */
  class F2S {

    #list; // list to perform fuzzy search
    #options; // options for configuring the fuzzy search
    #defaultOptions;

    // Static properties
    static typeOf = {
      function: 'function',
      object: 'object',
      string: 'string',
    };

    // constructs a new f2s instance
    constructor( pList = [], pOptions = {} ) {
      // default options for fuzzy search
      this.#defaultOptions = {
        isCaseSensitive: false,
        ignoreLocation:  false,
        includeScore:    false,
        includeMatches:  false,
        shouldSort:      true,
        keys:            [],
        location:        0,
        threshold:       0.6,
        distance:        100,
        maxScore:        0.8,
        sortFn :         this.#sort,
      };

      Object.freeze( this.#defaultOptions );

      // set the list where to search on and options for the search.
      this.list = pList;
      this.options = pOptions;
    }

    /**
     * fuzzy search on a list of objects based on the provided search term
     * @param {string} pSearchTerm
     * @returns {Array}
     */
    #searchOnListOfObjects( pSearchTerm = '' ) {
      // check if keys are defined for searching
      if ( !this.options.keys.length ) {
        return [];
      } else {
        const lDefaultWeight = 1; // default weight for keys
        const lListsByKey = []; // array to store lists by key
        const listsByItem = {}; // array to store lists by item

        // iterate over each key for searching
        this.options.keys.forEach( key => {

          let lList;
          let weight;
          const searchSet = new Set();

          // create a list object for the key
          if ( typeof key ===  F2S.typeOf.object ) {
            if ( !Array.isArray( key ) && key.name !== undefined ) {
              lList = {
                name: typeof key.name ===  F2S.typeOf.string ? key.name : JSON.stringify( key.name ),
                list: [],
              };

              weight = key.weight ?? lDefaultWeight;
            }
          } else {
            if ( typeof key !== F2S.typeOf.function ) {
              lList = {
                name: typeof key === F2S.typeOf.string ? key : JSON.stringify( key ),
                list: [],
              };

              weight = lDefaultWeight;
            }
          }

          // process the list for the key
          if ( lList !== undefined ) {

            let lPathToString;

            // convert key to a string path
            if ( Array.isArray( lList.name ) ) {
              lPathToString = lList.name;
            } else {
              if ( typeof lList.name !== F2S.typeOf.function ) {
                const lNameString = typeof lList.name === F2S.typeOf.string ? lList.name : JSON.stringify( lList.name );

                lPathToString = lNameString.split( '.' );

              }
            }

            // loop the list and add items to the search set
            if ( lPathToString !== undefined ) {
              this.#list.forEach( ( listItem, index ) => {
                let lValueAtKey = listItem[ lPathToString[ 0 ] ];

                if ( lValueAtKey !== undefined ) {
                  if ( lPathToString.length > 1 ) {
                    for ( let idx = 1; idx < lPathToString.length; idx++ ) {
                      lValueAtKey = lValueAtKey[ lPathToString[ idx ] ] !== undefined
                        ? lValueAtKey[ lPathToString[ idx ] ]
                        : undefined;
                    }
                  }

                  if ( lValueAtKey !== undefined ) {
                    searchSet.add( lValueAtKey );
                  }

                  const list = {
                    item: lValueAtKey,
                    refIndex: index,
                    score: lValueAtKey === undefined ? 1 : undefined,
                  };

                  if ( listsByItem[ lValueAtKey ] ) {
                    listsByItem[ lValueAtKey ].push( list );
                  } else {
                    listsByItem[ lValueAtKey ] = [ list ];
                  }

                  lList.list.push( list );
                }
              } );
            }

            // perform fuzzy search on the list of strings
            const lResults = this.#searchOnListOfStrings( pSearchTerm, Array.from( searchSet ), weight );

            // process the search results
            if ( lResults.length ) {

              for ( let i = 0; i < lResults.length; i++ ) {

                const lResult = lResults[ i ];
                const listByItem = listsByItem[ lResult.item ];

                lResult.matches?.forEach( match => {
                  match.key = lList.name;
                } );

                listByItem?.forEach( list => {
                  list.score = lResult.score;

                  if ( lResult.matches ) {
                    list.matches = lResult.matches;
                  }
                } );
              }

              lListsByKey.push( lList );
            }
          }
        } );

        // combining scores from resulting lists
        const lCombinedResults = {};

        if ( !lListsByKey.length ) {
          return [];
        }

        for ( let idx = 0; idx < lListsByKey.length; idx++ ) {
          const listByKey = lListsByKey[ idx ];

          listByKey.list.forEach( ( { score, refIndex, matches } ) => {
            if ( score !== undefined ) {
              let combinedResult = lCombinedResults[ refIndex ];

              if ( !combinedResult ) {
                combinedResult = {
                  item: this.#list[ refIndex ],
                  refIndex,
                  matches,
                  score,
                };

                lCombinedResults[ refIndex ] = combinedResult;
              } else {
                if ( score < combinedResult.score ) {
                  combinedResult.score = score;
                }

                combinedResult.matches = [ ...combinedResult.matches, matches ];
              }
            }
          } );
        }
        return Object.values( lCombinedResults );
      }
    }

    /**
           * Performs bitap algorithm for fuzzy search
           * @param {string} pattern
           * @param {string} text
           * @returns {Object}
           */
    #bitap( pattern, text ) {
      // destructuring options for bitap algorithm
      const { ignoreLocation, location, threshold, distance } = this.options;

      // initialize result object
      const result = { matches: [], location: -1 };
      let endingIndex;

      // calculate ending index based on options
      if ( ignoreLocation ) {
        endingIndex = text.length - 1;
      } else {
        endingIndex = ( threshold * distance ) + location;

        if ( endingIndex > ( text.length - location ) ) {
          endingIndex = text.length - 1;
        }
      }

      // return empty result if pattern is empty or longer than text
      if ( pattern === '' || pattern.length > text.length ) {
        return result;
      }

      // create an array of unique characters in the pattern
      const uniqueCharacters = Array.from( new Set( `${ pattern }` ) );
      const invertedSource = Array.from( pattern ).reverse();
      const bitMasks = {};
      const starState = Array( pattern.length ).fill( 1 );
      let state = starState;

      // generate the bitmasks corresponding to each individual character
      uniqueCharacters.forEach( uniqueCharacter => {
        const bitMask = [];

        invertedSource.forEach( character => {
          bitMask.push( uniqueCharacter === character ? 0 : 1 );
        } );

        bitMasks[ uniqueCharacter ] = bitMask;
      } );

      // perform bitap algorithm
      for ( let idx = 0; idx < text.length; idx++ ) {

        let _0Idx = pattern.length - 1;
        const shortenedText = text.substring( idx, text.length );

        if ( shortenedText.length < pattern.length ) {
          break;
        }

        state = starState;

        for ( let chrIdx = 0; chrIdx < shortenedText.length; chrIdx++ ) {
          const character = shortenedText[ chrIdx ];
          const bitMask = bitMasks[ character ] || starState;

          // shifting current state to the left
          const shiftedState = state.slice( 1, state.length );
          // after shifting the state, adding a 0 to the right-most position
          shiftedState.push( 0 );

          state = [];

          // executing or operation between newly shifted state and the bit mask to create a new state
          for ( let jdx = 0; jdx < shiftedState.length; jdx++ ) {
            state.push( shiftedState[ jdx ] || bitMask[ jdx ] );
          }

          // rejection state
          if ( state[ _0Idx ] === 1 ) {
            break;
          }

          // acceptance state
          if ( _0Idx === 0 && state[ _0Idx ] === 0 ) {

            if ( ( idx >= location && idx <= endingIndex ) && result.location === -1 ) {
              result.location = idx;
            }

            result.matches.push( [ idx, idx + ( pattern.length - 1 ) ] );

            break;
          }

          // continue searching for the pattern
          _0Idx = _0Idx - 1;
        }
      }

      return result;
    }

    /**
          * computes the score for a found location based on errors and pattern length
          * @param {number} foundLocation
          * @param {number} errors
          * @param {string} pattern
          * @returns {number}
          */
    #computeScore( foundLocation, errors, pattern ) {
      const accuracy = errors / pattern.length;
      const { ignoreLocation, location, distance } = this.options;
      // if ignorelocation option is set or no location is found, return accuracy
      if ( ignoreLocation || foundLocation <= -1 ) {
        return accuracy;
      }

      const proximity = Math.abs( location - foundLocation );

      // if distance option is not set, return proximity or accuracy based on proximity
      if ( !distance ) {
        return proximity ? 1.0 : accuracy;
      }

      // calculate score based on accuracy and proximity
      return ( accuracy + proximity / distance ) / 100;
    }

    /**
           * computes the levenshtein distance between two strings
           * @param {string} pSourceString
           * @param {string} pTargetString
           * @returns {number}
           */
    #levenshteinDistance( pSourceString = '', pTargetString = '' ) {
      // if either string is empty, return the length of the other string
      if ( !pSourceString.length ) {
        return pTargetString.length;
      }
      if ( !pTargetString.length ) {
        return pSourceString.length;
      }

      // initialize an array to store distances
      const arr = [];

      // populate the array with initial values
      for ( let i = 0; i <= pTargetString.length; i++ ) {
        arr[ i ] = [ i ];
        for ( let j = 1; j <= pSourceString.length; j++ ) {
          arr[ i ][ j ] =
                          i === 0 ?
                            j :
                            Math.min(
                              arr[ i - 1 ][ j ] + 1,
                              arr[ i ][ j - 1 ] + 1,
                              arr[ i - 1 ][ j - 1 ] + ( pSourceString[ j - 1 ] === pTargetString[ i - 1 ] ? 0 : 1 ),
                            );
        }
      }

      // return the levenshtein distance between the two strings
      return ( arr[ pTargetString.length ][ pSourceString.length ] );
    }

    /**
     * searches for the search term within a list of strings and returns matching results
     * @param {string} pSearchTerm
     * @param {Array<string>} pListOfStrings
     * @param {number} pKeyWeight
     * @returns {Array<Object>}
     */
    #searchOnListOfStrings( pSearchTerm = '', pListOfStrings = this.#list, pKeyWeight = 1 ) {

      const lResult = [];
      const lListOfStrings = [];
      const lSourceString = this.options.isCaseSensitive ? pSearchTerm.trim() : pSearchTerm.trim().toLowerCase();

      // extracting strings from the list and converting them to lowercase if case sensitivity is disabled
      pListOfStrings.forEach( listItem => {
        if ( typeof listItem !== F2S.typeOf.function ) {

          const lListItemString = typeof listItem === F2S.typeOf.string ? listItem : JSON.stringify( listItem );

          lListOfStrings.push( lListItemString );
        }
      } );

      // iterating through the list of strings to find matches
      lListOfStrings.forEach( ( listItem, idx ) => {
        const lTargetString = this.options.isCaseSensitive ? listItem.trim() : listItem.trim().toLowerCase();

        // naive test
        if ( lTargetString.includes( lSourceString ) ) {
          // if naive test passed, score will be calculated
          const { location, matches } = this.#bitap( lSourceString, lTargetString );
          const errors = this.#levenshteinDistance( lSourceString, lTargetString );
          const score = this.#computeScore( location, errors, lSourceString );

          // constructing result object
          const lResultObject = {
            item: listItem,
            refIndex: idx,
            score: score / ( pKeyWeight ? pKeyWeight : 0.01 ),

            ...( this.options.includeMatches &&
                              {
                                matches: [
                                  {
                                    indices: matches,
                                    value: listItem,
                                  },
                                ],
                              }
            ),
          };

          // adding result object to the result array
          lResult.push( lResultObject );
        }
      } );
      return lResult;
    }

    /**
           * sorts the results array based on the scores of each result
           * @param {Array<Object>} results
           * @returns {Array<Object>}
           */
    #sort( results ) {
      // filtering out results with undefined scores
      results = results.filter( result => ( result.score !== undefined ) );

      // sorting based on score
      return results.sort( ( a, b ) => ( a.score - b.score ) );
    }

    /**
           * searches search term within the list and returns the sorted results
           * @param {string} pSearchTerm
           * @returns {Array<Object>}
           */
    search( pSearchTerm = '' ) {
      // checking if the list is empty or if the search term is empty
      if ( !this.#list.length || pSearchTerm === '' ) {
        return [];
      }

      const listType = typeof this.#list[ 0 ];
      // performing search based on the type of the first element in the list (object or string)
      const lResultsList = this.options.sortFn( listType === F2S.typeOf.object ? this.#searchOnListOfObjects( pSearchTerm ) : this.#searchOnListOfStrings( pSearchTerm ), pSearchTerm );

      return lResultsList;

    }

    // Getters and Setters
    get list() {
      return this.#list;
    }

    set list( newList ) {
      this.#list = Array.isArray( newList ) ? newList : [ newList ];
    }

    get options() {
      return this.#options;
    }

    set options( newOptions ) {
      // validating and merging provided options with default options
      const defaultOptionsKeys = Object.keys( this.#defaultOptions );
      const lOptions = {};

      Object.entries( newOptions ).forEach( ( [ key, value ] ) => {
        if ( defaultOptionsKeys.includes( key ) && ( typeof this.#defaultOptions[ key ] === typeof value ) ) {
          lOptions[ key ] = value;
        }
      } );

      this.#options = { ...this.#defaultOptions, ...lOptions };
    }
  }

  /*
       * Class in charge of retrieving the indices and performe a search on them by
       * calling a given search algorithm.
       */
  class SearchProvider {

    #appIndices;
    #currentIndex;
    #fuzzySearchAgent;
    #staticIndices;
    #appContextIndex;
    #appsByAlias;
    #requestsInProcess;
    #advancedSearchOptions;
    #regularSearchOptions;

    constructor() {
      this.#appIndices = {};
      this.#staticIndices = [];
      this.#appContextIndex = [];
      this.#appsByAlias = {};
      this.#requestsInProcess = 0;

      // fetching indices
      this.#fetchIndices(); // This duplicates the requests to the server.

      // options for fuzzy search algorithm
      this.#advancedSearchOptions = {
        includeScore: true,
        includeMatches: true,
        keys: [
          {
            name: 'alias',
            weight: 0.5,
          },
          {
            name: 'initials',
            weight: 0.9,
          },
          {
            name: 'name',
            weight: 0,
          },
          {
            name: 'pageId',
            weight: 0,
          },
        ],
        sortFn: this.#sort,
      };

      this.#regularSearchOptions = {
        includeScore: true,
        includeMatches: true,
        keys: [
          {
            name: 'alias',
            weight: 0.5,
          },
          {
            name: 'initials',
            weight: 0.9,
          },
          {
            name: 'appId',
            weight: 0.5,
          },
          {
            name: 'name',
            weight: 0,
          },
          {
            name: 'pageId',
            weight: 0,
          },
        ],
        sortFn: this.#sort,
      };

      // initializing f2s (fuzzysearch) instance
      this.#fuzzySearchAgent = new F2S( [], this.#regularSearchOptions );
    }

    /**
     * sorts search results by category and then by score within each category
     * @param {Array<Object>} results
     * @returns {Array<Object>}
     */
    #sort( results, pSearchTerm ) {
      let resultsLength = results.length;

      const pe = window.pe;
      const searchPe = ( pSearchInput, pTypeId ) => {
        let peIndex = [];

        // returns the components that makes match
        const getPeResults = function ( pSearchInput, pTypeId ) {
          let lComponents = pe.displayTitleSearch( pSearchInput, pTypeId );
          let lType = pe.getComponentType( pTypeId );

          // check all child component types
          if ( lType ) {
            for ( let i = 0; i < lType.childComponentTypes.length; i++ ) {
              lComponents = getPeResults( pSearchInput, lType.childComponentTypes[ i ] ).concat( lComponents );
            }
          }

          return lComponents;
        };

        const peElement = getPeResults( pSearchInput, pTypeId );

        // build pe elemenet object
        for ( let i = 0; i < peElement.length; i++ ) {
          const actualElement = peElement[ i ];
          const element = {};
          const lType = pe.getComponentType( actualElement.typeId );
          element.name = util.escapeHTML( actualElement.getDisplayTitle() );
          element.category = util.escapeHTML( lType.title.singular ); // TODO for 24.2  this should change to 'APEX.SEARCH.CATEGORY.PAGE_COMPONENTS'
          element.icon = '<span class="a-Spotlight-icon" aria-hidden="true"><span class="a-Icon icon-page-designer"></span></span>';
          element.pe = "pe";
          element.typeid = actualElement.typeId;
          element.componentid = actualElement.id;
          element.propertyid = lType.displayPropertyId;
          element.context = 'app';
          peIndex.push( { item: element, refIndex: resultsLength += 1, score: 0.5 } );
        }

        return peIndex;
      };

      if ( typeof pe !== 'undefined' ) {
        let type = env.APP_ID === "4000" && env.APP_PAGE_ID === "9600" ? pe.COMP_TYPE.WORKFLOW : pe.COMP_TYPE.PAGE;
        const peResults = searchPe( pSearchTerm, type );

        results = [ ...results, ...peResults ];
      }

      const resultsByCategoryMap = {}; // initialize an object to map results by category
      let resultsByCategory = []; // initialize an array to store sorted results by category

      // iterate over each search result
      results.forEach( result => {
        // check if the result has a defined score
        if ( result.score !== undefined ) {
          const { item: { category}  } = result;

          // check if the category already exists in the map
          if ( resultsByCategoryMap[ category ] ) {
            // add the result to the existing category
            resultsByCategoryMap[ category ].push( result );
          } else {
            // create a new category and add the result
            resultsByCategoryMap[ category ] = [ result ];
          }
        }
      } );

      // iterate over each category in the map
      Object.keys( resultsByCategoryMap ).forEach( category => {
        // sort results within the category by score
        let sortedResults = resultsByCategoryMap[ category ].sort( ( a, b ) => ( a.score - b.score ) );

        // calculate the average score for the category
        let avrgScore = sortedResults.reduce( ( accumulator, result ) => {
          return accumulator + result.score;
        }, 0 ) / sortedResults.length;

        resultsByCategory.push( {
          avrgScore,
          category,
          results: sortedResults,
        } );

        // sort the final array by average score
        resultsByCategory = resultsByCategory.sort( ( a, b ) => ( a.avrgScore - b.avrgScore ) );
      } );

      // return the sorted results grouped by category
      return resultsByCategory;
    }

    /**
           * In case a search result was found in "initials", this method fixes the indices where
           * such initials appear in the "name" key.
           * @param { Object } matchResults
           * @param { Array } searchTermChars
           */
    #fixInitialsIndices( matchResults, searchTermChars = [] ) {

      const updateMatch = ( result, match ) => {
        if ( match.key === 'initials' ) {
          const name = result.item.name.toLowerCase();
          let splittedName = name.split( ' ' );

          if ( splittedName.length > 1 ) {
            let initials = Array.from( new Set( [ ...match.value.toLowerCase() ] ) );
            const spliceInitials = [];
            const newIndices = [];

            initials.forEach( ( initial, idx ) => {
              if ( !searchTermChars.includes( initial ) ) {
                spliceInitials.unshift( idx );
              }
            } );

            spliceInitials.forEach( spliceIdx => {
              splittedName.splice( spliceIdx, 1 );
              initials.splice( spliceIdx, 1 );
            } );

            initials.forEach( initial => {
              splittedName.forEach( word => {
                if ( word.indexOf( initial ) === 0 ) {
                  const initialIndex = name.indexOf( word );
                  newIndices.push( [ initialIndex, initialIndex ] );
                }
              } );
            } );
            match.indices =  newIndices;
          }
        }
      };

      let strMatchResults = JSON.stringify( matchResults );
      strMatchResults = JSON.parse( strMatchResults );

      strMatchResults.forEach( matchResult => {
        matchResult.results.forEach( result => {
          result.matches?.forEach( matches => {

            if ( Array.isArray( matches ) ) {
              matches.forEach( match => {
                updateMatch( result, match );
              } );
            } else {
              updateMatch( result, matches );
            }

          } );
        } );
      } );

      return strMatchResults;
    }

    /**
           * public method used to set particular restrictions to the inputted search term, thus allowing
           * the search to be performend or stopped
           * @param {*} pSearchTerm
           * @returns { Boolean }
           */
    // eslint-disable-next-line no-unused-vars
    validInput( pSearchTerm ) {
      // check if the entered search term has of the special formats and if so if it's valid
      // note: not implemented and defaulted to true as there are not restrictions for this use case
      return true;
    }

    /**
           * public method in charge of performing a search on the avaliable indices
           * @param { String } pSearchTerm
           * @returns { Promise<Array> }
           */
    search( pSearchTerm ) {
      let matchResults = this.#fuzzySearchAgent.search( pSearchTerm );

      if ( matchResults.length ) {
        if ( pSearchTerm.length > 1 ) {
          const uniqueCharacters = Array.from( new Set( [ ...`${ pSearchTerm }` ] ) );
          matchResults = this.#fixInitialsIndices( matchResults, uniqueCharacters );
        }

        return matchResults;
      }

      // no results found
      return [];
    }

    // Private Methods

    /**
           * private async method dedicated to fetch the indices where search is
           * going to be permormed on
           */
    async #fetchIndices( appId ) {
      if ( appId ) {
        if ( this.#currentIndex !== `app_${ appId }` ) {

          let appIndex = this.#appIndices[ appId ] ?? [];

          if ( !appIndex || !appIndex.length ) {

            this.awaitingIndices = true;
            this.#requestsInProcess = this.#requestsInProcess + 1;

            try {
              const { global, pages } = await server.process( 'spotlightIndex', { x01: appId, x02: 'Y' } );

              if ( pages.length ) {
                appIndex = [ ...global.filter( item => ( item.context === 'app' ) ), ...pages ];
                this.#appIndices[ appId ] = appIndex;
              }
            } catch ( error ) {
              debug.warn( JSON.parse( error.responseText ) );
              appIndex = [];
            } finally {
              this.#requestsInProcess = this.#requestsInProcess - 1;

              if ( this.#requestsInProcess === 0 ) {
                this.awaitingIndices = false;
              }
            }
          }

          this.#fuzzySearchAgent.list = appIndex;
          this.#fuzzySearchAgent.options = this.#advancedSearchOptions;
          this.#currentIndex = `app_${ appId }`;
        }
      } else {
        if ( this.#currentIndex !== 'static' ) {
          if ( !this.#staticIndices.length && !this.awaitingIndices ) {

            this.awaitingIndices = true;
            this.#requestsInProcess = this.#requestsInProcess + 1;

            let indices = [];

            try {
              const response = await server.process( 'spotlightIndex', { x01: currentAppId, x02: 'N' } );

              shortcuts_url = response.shortcuts;
              indices = [ ...response.global, ...response.apps ];

              this.#appContextIndex = response.global.filter( item => ( item.context === 'app' ) );

              response.apps.forEach( app => {
                if ( app.alias != null ) {
                  this.#appsByAlias[ app.alias.toUpperCase() ] = app.appId;
                }
              } );

              if ( currentAppId && response.pages ) {
                indices = [ ...indices, ...response.pages ];
                this.#appIndices[ currentAppId ] = [ ...this.#appContextIndex, ...response.pages];
              }
            } catch ( error ) {
              debug.warn( JSON.parse( error.responseText ) );
            } finally {
              this.#requestsInProcess = this.#requestsInProcess - 1;
              this.#staticIndices = indices;

              if ( this.#requestsInProcess === 0 ) {
                this.awaitingIndices = false;
              }
            }
          }

          this.#fuzzySearchAgent.list = this.#staticIndices;
          this.#fuzzySearchAgent.options = this.#regularSearchOptions;
          this.#currentIndex = 'static';
        }
      }
    }

    updateIndices( advancedSearch ) {
      if ( advancedSearch && advancedSearch.is ) {
        if ( isNaN( advancedSearch.app ) ) {
          let appId = this.#appsByAlias[ advancedSearch.app ];

          if ( appId ) {
            this.#fetchIndices( appId );
            return;
          } else {
            const aliasByLastDividerRegex = new RegExp( '^(?<alias>[\\w@#$%^&*<>{}()!?-]+)[-:]' );
            const execResult = aliasByLastDividerRegex.exec( advancedSearch.searchInput );
            const alias = execResult?.groups.alias?.toUpperCase();

            appId = this.#appsByAlias[ alias ];

            if ( appId ) {
              // Updating advancedSearch object with the new values for its properties
              advancedSearch.app = appId;
              advancedSearch.searchTerm = advancedSearch.searchInput.substring( execResult.groups.alias.length + 1, advancedSearch.searchInput.length );
              this.#fetchIndices( appId );
              return;
            }
          }
        } else {
          this.#fetchIndices( advancedSearch.app );
          return;
        }
      }

      this.#fetchIndices();
    }
  }

  /**
       * constructs a renderableresult object
       * @param {Object} metadata
       * @param {HTMLElement} HTMLElement
       */
  class RenderableResult {
    constructor( metadata, HTMLElement ) {
      this.metadata = metadata;
      this.HTMLElement = HTMLElement;
    }
  }

  /*
       * class dedicated to format the looks of the spotlight
       */
  class ViewProvider {
    // private properties
    #advancedSearch;
    #body;
    #context;
    #emptyResults;
    #recentlyVisited;
    #recentlyVisitedModel;
    #resultsContainer;
    #resultSet;
    #searchFn;
    #searchInput;
    #shortcuts;
    #liShortcuts;
    #observer;
    #resultsCategories;
    #updatedResults;

    // static properties
    static aliasAllowedChars = '\\w@#$%^&*<>{}()!?';
    static advancedSearchRegex = new RegExp( `^(?<app>[${ ViewProvider.aliasAllowedChars }]+-?)[-:]` );

    static aria = {
      autocomplete:     'aria-autocomplete',
      expanded:         'aria-expanded',
      haspopup:         'aria-haspopup',
      hidden:           'aria-hidden',
      label:            'aria-label',
      labelledby:       'aria-labelledby',
      owns:             'aria-owns',
      selected:         'aria-selected',
      activedescendant: 'aria-activedescendant',
    };

    static role = {
      none:    'none',
      region:  'region',
      option:  'option',
      listbox: 'listbox',
    };

    static selector = {
      class: {
        is_active:                    'is-active',
        spotlight:                    'a-Spotlight',
        spotlight_body:               'a-Spotlight-body',
        spotlight_category:           'a-Spotlight-category',
        spotlight_desc:               'a-Spotlight-desc',
        spotlight_field:              'a-Spotlight-field',
        spotlight_icon:               'a-Spotlight-icon',
        spotlight_info:               'a-Spotlight-info',
        spotlight_input:              'a-Spotlight-input',
        spotlight_link:               'a-Spotlight-link',
        spotlight_recent:             'a-Spotlight-category--recent',
        spotlight_result_label:       'a-Spotlight-label',
        spotlight_result:             'a-Spotlight-result',
        spotlight_result_page:        'a-Spotlight-result--page',
        spotlight_results:            'a-Spotlight-results',
        spotlight_no_results:         'a-Spotlight-noResults',
        spotlight_results_list:       'a-Spotlight-resultsList',
        spotlight_search:             'a-Spotlight-search',
        spotlight_shortcut:           'a-Spotlight-shortcut',
        spotlight_shortcuts:          'a-Spotlight-category--shortcuts',
        spotlight_category_title:     'a-Spotlight-categoryTitle',
        spotlight_skeleton:           'a-Spotlight-skeleton',
        spotlight_wrap_skeleton:      'a-Spotlight-wrap-skeleton',
        spotlight_icon_skeleton:      'a-Spotlight-icon-skeleton',
        spotlight_info_skeleton:      'a-Spotlight-info-skeleton',
        spotlight_category_container: 'a-Spotlight-categoryContainer',
        spotlight_clear_button:       'a-Button a-Button--noUI',
        spotlight_clear_all:          'a-Spotlight-clearAll',
      },
      id: {
        category_title:        'category-title--',
        spotlight_result_list: 'sp-result-list',
        spotlight_header:      'header-spotlightSearch',
      },
      attr: {
        spotlight_is_visible: 'is-visible',
      },
    };

    static staticMsg = {
      app:           getMessage( 'SL.APP' ),
      page:          getMessage( 'SL.PAGE' ),
      placeHolder:   getMessage( 'SL.PLACEHOLDER' ),
      oneMatchFound: getMessage( 'SL.MATCH.FOUND' ),
      noMatchFound:  getMessage( 'SL.NO.MATCH.FOUND' ),
      enterKeywords: getMessage( 'SL.SEARCH.HELP' ),
    };

    static template = {
      body:   `<div class="${ ViewProvider.selector.class.spotlight_body }">
                          <!-- Search -->
                          <div class="${ ViewProvider.selector.class.spotlight_search }">
                              <div class="${ ViewProvider.selector.class.spotlight_icon }">
                                  <span class="a-Icon icon-search" ${ ViewProvider.aria.hidden }="true"></span>
                              </div>
                              <div class="${ ViewProvider.selector.class.spotlight_field }">
                                  <input type="text" role="combobox" ${ ViewProvider.aria.expanded }="false" ${ ViewProvider.aria.autocomplete }="none" ${ ViewProvider.aria.haspopup }="true" ${ ViewProvider.aria.label }="${ getMessage( 'SL.PLACEHOLDER' ) }" ${ ViewProvider.aria.owns }="${ ViewProvider.selector.id.spotlight_result_list }" autocomplete="off" autocorrect="off" spellcheck="false" class="${ ViewProvider.selector.class.spotlight_input }" placeholder="${ ViewProvider.staticMsg.placeHolder }">
                              </div>
                          </div>
                          <!-- end Search -->

                          <div class="${ ViewProvider.selector.class.spotlight_results }" aria-label="Search Results">

                              <div class="${ ViewProvider.selector.class.spotlight_category } ${ ViewProvider.selector.class.spotlight_recent }"></div>

                              <div class="${ ViewProvider.selector.class.spotlight_category } ${ ViewProvider.selector.class.spotlight_shortcuts }" role="${ ViewProvider.role.region }" aria-labelledby="${ ViewProvider.selector.id.category_title }shortcuts"></div>
                          </div>
                          <!-- <div class="${ ViewProvider.selector.class.spotlight_results } results"></div> -->
                      </div>`,

      empty_results: `<div class="${ ViewProvider.selector.class.spotlight_no_results }">${ getMessage( 'APEX.SEARCH.NO_RESULTS_FOUND' ) }</div>`,

      category_container: ( category = '' ) => {
        category = category.toLowerCase().replace( ' ', '-' );
        const categoryClass = category !== '' ? ` ${ ViewProvider.selector.class.spotlight_category }--${ category }` : '';

        return `<div class="${ ViewProvider.selector.class.spotlight_category }${ categoryClass }"></div>`;
      },

      category_title: ( category = '' ) => {
        const categoryTitleId = category !== '' ? `${ ViewProvider.selector.id.category_title }${ category.toLowerCase().replace( ' ', '-' ) }` : '';

        if ( categoryTitleId !== 'category-title--recently-visited' ) {
          return `<div class="${ ViewProvider.selector.class.spotlight_category_title }" id="${ categoryTitleId }">${ category }</div>`;
        } else {
          return `<div class="${ ViewProvider.selector.class.spotlight_category_container }">
                                  <div class="${ ViewProvider.selector.class.spotlight_category_title }" id="${ categoryTitleId }">${ category }</div>
                                  <button type="button" class="${ ViewProvider.selector.class.spotlight_clear_button } ${ ViewProvider.selector.class.spotlight_clear_all }" title=${ getMessage( 'APEX.SEARCH.CLEAR_ALL' ) }" aria-label="${ getMessage( 'APEX.SEARCH.CLEAR_ALL' ) }">${ getMessage( 'APEX.SEARCH.CLEAR_ALL' ) }</button>
                              </div>`;
        }
      },

      result: ( { alias, category, highlightText, icon, name, nameNnumber, path = '', shortcut, url, index, pe, typeid, componentid, propertyid } ) => {
        return `<li id="sp-result-${ index }" ${ ViewProvider.aria.selected }="false" role="${ ViewProvider.role.option }" class="${ ViewProvider.selector.class.spotlight_result } ${ ViewProvider.selector.class.spotlight_result_page }" data-category=${ getMessage( category ).toLowerCase().replace( / /g, '_' ) } ${ ViewProvider.aria.label }="${ formatMessage( 'SL.GOTO', name, nameNnumber, ( alias ? alias : 'Without alias' ), ( shortcut ? shortcut : 'Without shortcut' ) ) }">
                              <span class="${ ViewProvider.selector.class.spotlight_link }"${ url ? ` data-url="${ url }"` : '' } ${ pe ? ` data-type="${ pe }"` : '' } ${ typeid ? ` data-typeid="${ typeid }"` : '' } ${ componentid ? ` data-componentid="${ componentid }"` : '' } ${ propertyid ? ` data-propertyid="${ propertyid }"` : '' }>
                                  ${ icon || '' }
                                  <span class="${ ViewProvider.selector.class.spotlight_info }">
                                  <span class="${ ViewProvider.selector.class.spotlight_result_label }" ${ ViewProvider.aria.hidden }="true">${ highlightText ? highlightText : name }</span>
                                  <span class="${ ViewProvider.selector.class.spotlight_desc }" ${ ViewProvider.aria.hidden }="true">${ path.replace( '{APP_ID}', currentAppId ) }</span>
                                  </span>
                              </span>
                          </li> `;
      },

      skeleton: `<div class="${ ViewProvider.selector.class.spotlight_wrap_skeleton }">
                              <ul role="${ ViewProvider.role.listbox }" class="${ ViewProvider.selector.class.spotlight_results_list }">
                                  <li>
                                      <span class="${ ViewProvider.selector.class.spotlight_link } ${ ViewProvider.selector.class.spotlight_skeleton }">
                                          <span class="${ ViewProvider.selector.class.spotlight_icon } ${ ViewProvider.selector.class.spotlight_icon_skeleton }"></span>
                                          <span class="${ ViewProvider.selector.class.spotlight_info } ${ ViewProvider.selector.class.spotlight_info_skeleton }"></span>
                                      </span>
                                  </li>
                                  <li>
                                      <span class="${ ViewProvider.selector.class.spotlight_link } ${ ViewProvider.selector.class.spotlight_skeleton }">
                                          <span class="${ ViewProvider.selector.class.spotlight_icon } ${ ViewProvider.selector.class.spotlight_icon_skeleton }"></span>
                                          <span class="${ ViewProvider.selector.class.spotlight_info } ${ ViewProvider.selector.class.spotlight_info_skeleton }"></span>
                                      </span>
                                  </li>
                                  <li>
                                      <span class="${ ViewProvider.selector.class.spotlight_link } ${ ViewProvider.selector.class.spotlight_skeleton }">
                                          <span class="${ ViewProvider.selector.class.spotlight_icon } ${ ViewProvider.selector.class.spotlight_icon_skeleton }"></span>
                                          <span class="${ ViewProvider.selector.class.spotlight_info } ${ ViewProvider.selector.class.spotlight_info_skeleton }"></span>
                                      </span>
                                  </li>
                              </ul>
                          </div>`,

      results_list: `<ul ${ ViewProvider.aria.activedescendant }="" role="${ ViewProvider.role.listbox }" class="${ ViewProvider.selector.class.spotlight_results_list }"></ul>`,

      shortcut: {
        // Search Workspace for ( Ctrl + 1 )
        ctrl_1: `<li role="option" class="${ ViewProvider.selector.class.spotlight_result } ${ ViewProvider.selector.class.spotlight_result_page }" ${ ViewProvider.aria.label }="" id="sp-result-sc-1" ${ ViewProvider.aria.selected }="true">
                    <span class="${ ViewProvider.selector.class.spotlight_link }" data-type="${ URL_TYPES.searchWorkspace }" data-url="">
                        <span class="${ ViewProvider.selector.class.spotlight_icon }" ${ ViewProvider.aria.hidden }="true">
                            <span class="a-Icon icon-search"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_info }">
                            <span class="ctrl-label ${ ViewProvider.selector.class.spotlight_result_label }" ${ ViewProvider.aria.hidden }="true"></span>
                            <span class="${ ViewProvider.selector.class.spotlight_desc }" ${ ViewProvider.aria.hidden }="true"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_shortcut }">Ctrl + 1</span>
                    </span>
                </li>`,

        // Search all applications for ( Ctrl + 2 )
        ctrl_2: `<li role="option" class="${ ViewProvider.selector.class.spotlight_result } ${ ViewProvider.selector.class.spotlight_result_page }" ${ ViewProvider.aria.label }="" id="sp-result-sc-2" ${ ViewProvider.aria.selected }="true">
                    <span class="${ ViewProvider.selector.class.spotlight_link }" data-type="${ URL_TYPES.searchAllApps }">
                        <span class="${ ViewProvider.selector.class.spotlight_icon }" ${ ViewProvider.aria.hidden }="true">
                            <span class="a-Icon icon-search"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_info }">
                            <span class="ctrl-label ${ ViewProvider.selector.class.spotlight_result_label }" ${ ViewProvider.aria.hidden }="true"></span>
                            <span class="${ ViewProvider.selector.class.spotlight_desc }" ${ ViewProvider.aria.hidden }="true"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_shortcut }">Ctrl + 2</span>
                    </span>
                </li>`,

        // Search this App for ( Ctrl + 3 )
        ctrl_3: `<li role="option" class="${ ViewProvider.selector.class.spotlight_result } ${ ViewProvider.selector.class.spotlight_result_page }" ${ ViewProvider.aria.label }="" id="sp-result-sc-3" ${ ViewProvider.aria.selected }="false">
                    <span class="${ ViewProvider.selector.class.spotlight_link }" data-type="${ URL_TYPES.searchApp }">
                        <span class="${ ViewProvider.selector.class.spotlight_icon }" ${ ViewProvider.aria.hidden }="true">
                            <span class="a-Icon icon-search"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_info }">
                            <span class="ctrl-label ${ ViewProvider.selector.class.spotlight_result_label }" ${ ViewProvider.aria.hidden }="true"></span>
                            <span class="${ ViewProvider.selector.class.spotlight_desc }" ${ ViewProvider.aria.hidden }="true"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_shortcut }">Ctrl + 3</span>
                    </span>
                </li>`,

        // Search Page for ( Ctrl + 4 )
        ctrl_4: `<li role="option" class="${ ViewProvider.selector.class.spotlight_result } ${ ViewProvider.selector.class.spotlight_result_page }" ${ ViewProvider.aria.label }="" id="sp-result-sc-4" ${ ViewProvider.aria.selected }="false">
                    <span class="${ ViewProvider.selector.class.spotlight_link }" data-type="${ URL_TYPES.searchPage }">
                        <span class="${ ViewProvider.selector.class.spotlight_icon }" ${ ViewProvider.aria.hidden }="true">
                            <span class="a-Icon icon-search"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_info }">
                            <span class="ctrl-label ${ ViewProvider.selector.class.spotlight_result_label }" ${ ViewProvider.aria.hidden }="true"></span>
                            <span class="${ ViewProvider.selector.class.spotlight_desc }" ${ ViewProvider.aria.hidden }="true"></span>
                        </span>
                        <span class="${ ViewProvider.selector.class.spotlight_shortcut }">Ctrl + 4</span>
                    </span>
                </li>`,
      },
    };

    /**
           * constructs a new viewprovider
           * @param {function} searchFn
           * @param {string} context
           */
    constructor( searchFn, context ) {
      // set context based on application case
      this.#context = ( () => {
        const producesContextChange = {
          4000 : () => {
            switch ( +env.APP_PAGE_ID ) {
            case 1500: break;
            case 4500:
              context = 'page';
              break;
            default:
              context = 'app';
              break;
            }
          },
        };
        const contextChangeFn = producesContextChange[ env.APP_ID ];

        if ( contextChangeFn ) {
          contextChangeFn();
        }

        // return apex context
        return context;
      } )();

      this.#advancedSearch = {};
      this.#searchFn = searchFn;
      this.#recentlyVisitedModel = [];
      this.#updatedResults = [];

      // create body element
      this.#body = this.#createElementFromTemplate( 'body' );

      // initialize shortcuts
      this.#shortcuts = {
        onScreen: false,
        title: this.#createElementFromTemplate( 'category_title', {}, getMessage( 'APEX.SEARCH.SC.SHORTCUTS' ) ),
        ul: this.#genShortcuts(),
        container: this.#body.querySelector( `.${ ViewProvider.selector.class.spotlight_category }.${ ViewProvider.selector.class.spotlight_shortcuts }` ),
      };

      // initialize li shortcuts
      this.#liShortcuts = {};

      // populate lishortcuts with li elements and their properties
      for ( let child of this.#shortcuts.ul.children ) {
        this.#liShortcuts[ child.id ] = {
          li: child,
          span: child.children[ 0 ],
          label: child.querySelector( '.ctrl-label' ),
        };
      }

      // initialize search input
      this.#searchInput = this.#body.querySelector( 'input' );

      // initialize results container.
      this.#resultsContainer = this.#body.querySelector( `.${ ViewProvider.selector.class.spotlight_results }` );

      // Empty map of categories to be filled up in this.#appendElement
      // with unique categories resulting from the searches performed on the page.
      this.#resultsCategories = {};

      // initialize empty results
      this.#emptyResults = {
        onScreen: false,
        parent: this.#resultsContainer,
        span: this.#createElementFromTemplate( 'empty_results' ),
        show: function () {
          if ( !this.onScreen && this.parent ) {
            this.parent.insertBefore( this.span, this.parent.firstElementChild );
            this.onScreen = true;
          }
        },
        hide: function () {
          if ( this.onScreen && this.parent ) {
            this.span.remove();
            this.onScreen = false;
          }
        },
      };

      // Skeleton intended to show signs of activity while indices are being downloaded
      this.skeleton = {
        onScreen: false,
        wrapper: this.#createElementFromTemplate( 'skeleton', {} ),
        resultsContainer: this.#resultsContainer,
        show() {
          if ( !this.onScreen ) {
            this.resultsContainer.appendChild( this.wrapper );
            this.onScreen = true;
          }
        },
        hide() {
          if ( this.onScreen ) {
            this.wrapper.remove();
            this.onScreen = false;
          }
        },
      };

      // initialize intersectionobserver
      this.#observer = new IntersectionObserver( this.#handleIntersection, {
        threshold: 1.0,
      } );

      // add event listeners for search input
      this.#addEventListener( this.#searchInput, 'input', ( ev ) => {
        this.#advancedSearch = this.#isAdvancedSearch( ev.target.value );
        this.#searchFn( ev.target.value, this.#advancedSearch );
        this.#updateShortcuts( ev.target.value );
        this.#updateHeader( ev.target.value );
        this.#activeItem( selectedIndex = 0 );
      } );

      // add event listener for dialog close
      document.addEventListener( 'spotlightDialogClose', () => {
        this.#closeDialogView();
      } );

      // add event listener to handle shortcuts
      this.#addEventListener( this.#searchInput, 'keyup', util.debounce( ( e ) => {
        if ( this.#searchInput.value !== '' ) {
          if ( e.ctrlKey && e.which === 49 ) {        // Ctrl + 1
            this.#goTo( document.querySelectorAll( `[ data-type="${ URL_TYPES.searchWorkspace }" ]` )[ 0 ] );
          } else if ( e.ctrlKey && e.which === 50 ) { // Ctrl + 2
            this.#goTo( document.querySelectorAll( `[ data-type="${ URL_TYPES.searchAllApps }" ]` )[ 0 ] );
          } else if ( e.ctrlKey && e.which === 51 ) { // Ctrl + 3
            this.#goTo( document.querySelectorAll( `[ data-type="${ URL_TYPES.searchApp }" ]` )[ 0 ] );
          } else if ( e.ctrlKey && e.which === 52 ) { // Ctrl + 4
            this.#goTo( document.querySelectorAll( `[ data-type="${ URL_TYPES.searchPage }" ]` )[ 0 ] );
          }
        }
      }, 50 ) );

      // add event listener for arrow navigation
      this.#addEventListener( this.#body, 'keydown', util.debounce( ( e ) => {
        if ( e.which === 38 ) {        // Key up
          e.preventDefault();
          this.#getPrev();
        } else if ( e.which === 40 ) { // Key down
          e.preventDefault();
          this.#getNext();
        } else if ( e.which === 13 ) { // Key enter
          e.preventDefault();
          const domItem = document.querySelector( `li.${ ViewProvider.selector.class.spotlight_result }.${ ViewProvider.selector.class.is_active }` );
          const categoryUl = domItem.closest( 'ul[data-category]' );

          if ( categoryUl ) {
            let item;
            const dataCategory = categoryUl.dataset.category;

            if ( dataCategory === 'recently_visited' ) {
              const indexOfItem = Array.from( categoryUl.childNodes ).indexOf( domItem );
              item = this.#recentlyVisitedModel[ indexOfItem ];
            } else if ( dataCategory !== 'static_shortcuts' ) {
              item = this.#updatedResults[ domItem.dataset.index ].metadata.item;
            }

            this.#goTo( domItem.firstElementChild, item );
          }
        }
      }, 50 ) );

      this.#asyncConstructor();
    }

    async #asyncConstructor() {
      // initialize recently visited
      this.#recentlyVisited = {
        onScreen: false,
        title: this.#createElementFromTemplate( 'category_title', {}, getMessage( 'APEX.SEARCH.CATEGORY.RECENTLY_VISITED' ) ),
        ul: await this.#getRecentlyVisited(),
      };

      this.#recentlyVisited.container = this.#body.querySelector( `.${ ViewProvider.selector.class.spotlight_category }.${ ViewProvider.selector.class.spotlight_recent }` );

      if ( this.#recentlyVisitedModel.length ) {
        this.#showPermanentCategory( this.#recentlyVisited );
      }

      // listens for clear all button
      // ----- TODO - Relevant code that should be re-enabled once Recently Visited Links are fixed ----
      // const clearAll = document.querySelector( `.${ ViewProvider.selector.class.spotlight_clear_all }` );

      // if ( clearAll != null ) {
      //     this.#addEventListener( clearAll, 'click', () => {
      //         // remove all recently visited
      //         this.#removeRecentlyVisited();
      //     } );
      // }
      // ------------------------------------------------------------------------------------------------

      // this.render();
    }

    /**
           * Adds a Category node with search results to the DOM before the "Shortcuts"
           * @param { Object } category
           */
    #showResultsCategory( category ) {
      if ( !category.onScreen ) {
        this.#resultsContainer.insertBefore( category.container, this.#shortcuts.container );
        category.onScreen = true;
      }
    }

    /**
           * Removes a Category node with search results from the DOM
           * @param { Object } category
           */
    #hideResultsCategory( category ) {
      if ( category.onScreen ) {
        category.container.remove();
        category.onScreen = false;
      }
    }

    /**
           * Removes empty category elements from the DOM
           */
    #hideResultsCategories() {

      const categoriesKeys = Object.keys( this.#resultsCategories );

      for ( let idx = 0; idx < categoriesKeys.length; idx ++ ) {
        let resultsCategory = this.#resultsCategories[ categoriesKeys[ idx ] ];

        while ( resultsCategory.ul.firstChild ) {
          resultsCategory.ul.removeChild( resultsCategory.ul.lastChild );
        }

        this.#hideResultsCategory( resultsCategory );
      }
    }

    /**
           * Adds the inner content of a permanent Category ( Shortcuts and Recently Visited ) to its container.
           * @param { Object } category
           */
    #showPermanentCategory( category ) {
      if ( category && !category.onScreen ) {
        category.container.appendChild( category.title );
        category.container.appendChild( category.ul );
        category.onScreen = true;
      }
    }

    /**
           * removes the insides a permanent category ( shortcuts and recently visited ) from its container
           * @param { Object } category
           */
    #hidePermanentCategory( category ) {
      if ( category.onScreen ) {
        category.title.remove();
        category.ul.remove();
        category.onScreen = false;
      }
    }

    // Private methods
    /**
           * cleans up the dialog
           */
    #closeDialogView() {
      this.#searchInput.value = '';
      this.#updateHeader( this.#searchInput.value );
      this.#searchFn( this.#searchInput.value, false );
    }

    /**
           * highlights text based on match indices
           * @param {string} text
           * @param {Array<Array<number>>} indices
           * @returns {string}
           * @private
           */
    #highlightText( text, indices ) {
      let highlightedText = '';
      let lastIndex = 0;

      indices.forEach( index => {
        let start = index[ 0 ];
        let end = index[ 1 ];

        // ensure no existing <mark> tags
        if ( start >= lastIndex ) {
          // add non-highlighted text
          highlightedText += text.substring( lastIndex, start );

          // highlight the matching text
          highlightedText += '<span class="a-Spotlight-highlight">' + text.substring( start, end + 1 ) + '</span>';

          // update the index of the last processed character
          lastIndex = end + 1;
        }
      } );

      // add any remaining non-highlighted text
      highlightedText += text.substring( lastIndex );

      return highlightedText;
    }

    /**
           * highlights matches in the result set by wrapping them in <span> tags
           * @param {Array<Object>} resultSet
           * @returns {Array<Object>}
           * @private
           */
    #highlightMatches( resultSet ) {
      resultSet.forEach( entry => {
        entry.results.forEach( result => {
          const { item } = result;
          let highlightedText = item.name;

          result.matches?.forEach( match => {
            // remove existing <span> tags
            highlightedText = highlightedText.replace( /<\/?span.*?>/g, '' );

            if ( match.length > 0 ) {
              match.forEach( matchElement => {
                if ( matchElement.key === 'name' || matchElement.key === 'initials' ) {
                  // highlight matching text
                  highlightedText = this.#highlightText( highlightedText, matchElement.indices );
                }
              } );
            } else {
              if ( match.key === 'name' || match.key === 'initials' ) {
                // highlight matching text
                highlightedText = this.#highlightText( highlightedText,  match.indices );
              }
            }
          } );

          // update the item with highlighted text
          item.highlightText = highlightedText;
        } );
      } );
      return resultSet;
    }

    #isAdvancedSearch( searchInput ) {
      const advancedSearch = { is: false };

      searchInput = searchInput.trim();

      if ( ViewProvider.advancedSearchRegex.test( searchInput ) ) {
        const match = searchInput.match( ViewProvider.advancedSearchRegex );
        const inputSplit = searchInput.split( match[ 0 ] )[ 1 ];

        advancedSearch.is = true;
        advancedSearch.app = match.groups.app.toUpperCase();
        advancedSearch.searchTerm = inputSplit;
        advancedSearch.searchInput = searchInput;
      }

      return advancedSearch;
    }

    /**
           * updates the visibility attribute of li elements based on their visible intersection
           * @private
           * @param {Array<IntersectionObserverEntry>} entries
           */
    #handleIntersection( entries ) {
      // check li elements intersection
      entries.forEach( entry => {
        // update visibility attribute based on intersection status
        entry.target.setAttribute( ViewProvider.selector.attr.spotlight_is_visible, entry.isIntersecting );

      } );
    }

    /**
           * advances to the next element on key down
           * @private
           */
    #getNext() {
      // get all li elements
      const items = document.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_result }` );

      // increment the index of active item
      if ( selectedIndex < items.length ) {
        selectedIndex = selectedIndex + 1;
        this.#activeItem( selectedIndex );
      }

      // iterate over each item
      items.forEach( item => {
        // if the active element is the last reset it to 0 and active the first element
        if ( selectedIndex === items.length ) {
          selectedIndex = 0;
          this.#activeItem( selectedIndex );
        }

        // if the item is active but not visible, scroll it
        if ( item.classList.contains( ViewProvider.selector.class.is_active ) && item.getAttribute( ViewProvider.selector.attr.spotlight_is_visible ) === 'false' ) {
          item.scrollIntoView( { block: 'end', behavior: 'smooth' } );
        }
      } );

    }

    /**
           * returns to the previous element on key up
           * @private
           */
    #getPrev() {
      // get all li elements
      const items = document.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_result }` );

      // decrement the index of active item
      if ( selectedIndex >= 0 ) {
        selectedIndex = selectedIndex - 1;
        this.#activeItem( selectedIndex );
      }

      // iterate over each item
      items.forEach( item => {
        // if the active element is less than 0 reset it to the last element and activate it
        if ( selectedIndex === - 1 ) {
          selectedIndex = items.length - 1;
          this.#activeItem( selectedIndex );
        }

        // if the item is active but not visible, scroll it
        if ( item.classList.contains( ViewProvider.selector.class.is_active ) && item.getAttribute( ViewProvider.selector.attr.spotlight_is_visible ) === 'false' ) {
          item.scrollIntoView( { block: 'nearest', behavior: 'smooth' } );
        }
      } );
    }

    /**
           * activates the element in the specified index and scrolls it into view
           * @private
           * @param {number} index
           */
    #activeItem( index ) {
      // get all li elements
      const items = document.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_result }` );

      // iterate over each item
      items.forEach( ( item, i ) => {
        // if the index matches, scroll to the item and add the active class
        if ( i === index ) {
          item.scrollIntoView( { block: 'nearest', behavior: 'smooth' } );
          item.classList.add( ViewProvider.selector.class.is_active );
          item.setAttribute( ViewProvider.aria.selected, true );
          this.#searchInput.setAttribute( ViewProvider.aria.activedescendant, item.id );

        } else { // otherwise, remove the active class
          item.classList.remove( ViewProvider.selector.class.is_active );
          item.setAttribute( ViewProvider.aria.selected, false );
        }
      } );
    }

    /**
           * updates the spolight header text based on the provided search input
           * @private
           * @param {string} searchInput
           */
    #updateHeader( searchInput ) {
      // gets the header spotlight element
      let buttonHeader = document.querySelector( `#${ ViewProvider.selector.id.spotlight_header }` );

      // update the header text based on the search input
      buttonHeader.innerHTML = `${ util.escapeHTML( searchInput || getMessage( 'SL.PLACEHOLDER' )  ) } <span class="a-Icon icon-search"></span>`;
    }

    /**
           * updates the inner content of shortcuts
           * @private
           * @param {string} searchInput
           */
    #updateShortcuts( searchInput ) {
      // get the shortcuts ids
      const keys = Object.keys( this.#liShortcuts );

      // iterate over each id
      keys.forEach( ( key, idx ) => {
        key = keys[ idx ]; // the current id
        const shortcut = this.#liShortcuts[ key ]; // get the corresponding shortcut

        // update shortcut attributes and label based on the id
        switch ( key ) {
        case 'sp-result-sc-1': // Ctrl + 1 - Search Workspace for:
          shortcut.li.setAttribute( 'aria-label', lang.formatMessage( 'SL.SEARCH.WP', searchInput ) + ', ,  , Ctrl + 1 ' );
          shortcut.label.innerHTML = lang.formatMessage( 'SL.SEARCH.WP', searchInput );
          break;
        case 'sp-result-sc-2': // Ctrl + 2 - Search all applications for:
          shortcut.li.setAttribute( 'aria-label', lang.formatMessage( 'SL.SEARCH.ALLAPPS', searchInput ) + ', ,  , Ctrl + 2 ' );
          shortcut.label.innerHTML = lang.formatMessage( 'SL.SEARCH.ALLAPPS', searchInput );
          break;
        case 'sp-result-sc-3': // Ctrl + 3 - Search this App for:
          shortcut.li.setAttribute( 'aria-label', lang.formatMessage( 'SL.SEARCH.APP', searchInput ) + ', ,  , Ctrl + 3 ' );
          shortcut.label.innerHTML = lang.formatMessage( 'SL.SEARCH.APP', searchInput );
          break;
        case 'sp-result-sc-4': // Ctrl + 4 - Search Page for:
          shortcut.li.setAttribute( 'aria-label', lang.formatMessage( 'SL.SEARCH.PAGE', searchInput ) + ', ,  , Ctrl + 4 ' );
          shortcut.label.innerHTML = lang.formatMessage( 'SL.SEARCH.PAGE', searchInput );
          break;
        }
      } );
    }

    /**
           * creates element from a viewprovider templates
           * @private
           * @param {string} templateName
           * @param {Object} attrs
           * @returns {HTMLElement}
           */
    #createElementFromTemplate( templateName, attrs = {} ) {
      // check if template exist and is not null
      if ( templateName != null ) {
        // the corresponding template
        let template = ViewProvider.template[ templateName ];

        // check if the template exists
        if ( template ) {
          // if template is a function, add extra arguments
          if ( typeof template === 'function' ) {
            template = template( arguments[ 2 ] || '' );
          }

          const disposableWrapper = document.createElement( 'div' ); // disposable wrapper to hold the template content
          disposableWrapper.innerHTML = template;

          const element = disposableWrapper.firstChild; // first child of disposable wrapper

          const keys = Object.keys( attrs ); // the keys attributes
          // set attributes on the created element
          keys.forEach( key => {
            element.setAttribute( key, attrs[ key ] );
          } );
          // returns the element created from the template
          return element;
        }
      }
    }

    /**
           * retrieves recently visited items asynchronously and generates a list element
           * @private
           * @returns {Promise<HTMLUListElement>}
           */
    async #getRecentlyVisited() {
      let lUl = this.#createElementFromTemplate( 'results_list' ); // ul for recently visited
      const tempDiv = document.createElement( 'div' ); // temporary div for parsing HTML entities

      // retrieve recently visited from user preferences
      // ----- TODO - Relevant code that should be re-enabled once Recently Visited Links are fixed ----
      // try {

      //     const { status, output } = await server.process( 'spotlightRecentlyVisited', {
      //         x01: env.APP_USER,
      //         x02: 'GET',
      //         x03: null
      //     } );

      //     // if the call is successful update recently visited
      //     if ( status === 'OK' && output ) {
      //         this.#recentlyVisitedModel = JSON.parse( output );
      //     }

      // } catch ( error ) {
      //     debug.warn( error.responseText );
      // }
      // -------------------------------------------------------------------------------------------------

      // get the recently visited number
      lUl.length = this.#recentlyVisitedModel.length;
      // iterate over each recently visited element
      this.#recentlyVisitedModel.forEach( element => {
        // modify name and number of the element path.
        let nameNnumber = element.path?.replace( '{APP_ID}', element.appId || '' );
        nameNnumber = nameNnumber?.replace( '&#92;', '&#8212;' );
        element.path = nameNnumber;
        // parse HTML entities within the name and number
        tempDiv.innerHTML = nameNnumber;
        nameNnumber = tempDiv.textContent;
        tempDiv.textContent = '';

        // set data-category attribute and append generated list item
        lUl.setAttribute( 'data-category', getMessage( 'APEX.SEARCH.CATEGORY.RECENTLY_VISITED' ).toLowerCase().replace( / /g, '_' ) );

        // remove existing <span> tags
        element.highlightText = element.highlightText?.replace( /<\/?span.*?>/g, '' ) || element.name;

        // add recently visited flag
        element.recentlyVisited = 'Y';

        lUl.appendChild( this.#genResult( element ) );
      } );
      // returns the recently visited elements
      return lUl;
    }

    /**
           * updates the recently visited with a new element and saves it to user preferences
           * @private
           * @param {HTMLElement} recentlyVisitedRecord
           */
    // eslint-disable-next-line no-unused-private-class-members
    async #setRecentlyVisited( recentlyVisitedRecord ) {
      let deepCopiedRecord = JSON.stringify( recentlyVisitedRecord );
      deepCopiedRecord = JSON.parse( deepCopiedRecord );

      delete deepCopiedRecord.highlightText;
      delete deepCopiedRecord.recentlyVisited;

      const stringifiedRecord = JSON.stringify( deepCopiedRecord ); // stringified version of the recently visited record
      let indexOf = -1; // index of the record in the recently visited
      let minusCurrentRecord = []; // array to hold the recently visited

      // check if the record exists in the model
      for ( let idx = 0; idx < this.#recentlyVisitedModel.length; idx++ ) {
        // stringified version of the model
        let deepCopiedRecordFromModel = JSON.stringify( this.#recentlyVisitedModel[ idx ] );
        deepCopiedRecordFromModel = JSON.parse( deepCopiedRecordFromModel );

        delete deepCopiedRecordFromModel.highlightText;
        delete deepCopiedRecordFromModel.recentlyVisited;

        const stringifiedRecordFromModel = JSON.stringify( deepCopiedRecordFromModel );

        // if the stringified records match, update indexof
        if ( stringifiedRecord === stringifiedRecordFromModel ) {
          indexOf = idx;
        } else { // otherwise add the record to minuscurrentrecord
          minusCurrentRecord.push( this.#recentlyVisitedModel[ idx ] );
        }
      }

      if ( !recentlyVisitedRecord.appId ) {
        recentlyVisitedRecord.appId = currentAppId;
      }

      // if the record already exist in the model then updated its position as the firs element
      if ( indexOf > -1 ) {
        if ( indexOf !== 0 ) {
          this.#recentlyVisitedModel = [ deepCopiedRecord, ...minusCurrentRecord ];
        }
      } else { // otherwise should be added as the first element

        // if model has already 3 elements lifo on it to insert the new record as the first
        if ( this.#recentlyVisitedModel.length >= 3 ) {
          const tempModel = this.#recentlyVisitedModel.slice( 0, 2 );
          this.#recentlyVisitedModel = [ deepCopiedRecord, ...tempModel ];
        } else {
          this.#recentlyVisitedModel = [ deepCopiedRecord, ...this.#recentlyVisitedModel ];
        }
      }

      // update recently visited to user preferences
      try {
        await server.process( 'spotlightRecentlyVisited', {
          x01: env.APP_USER,
          x02: 'SET',
          x03: JSON.stringify( this.#recentlyVisitedModel ),
        } );
      } catch ( error ) {
        debug.warn( error.responseText );
      }
    }

    /**
           * generates the result element
           * @private
           * @param {Object} element
           * @returns {HTMLElement}
           */
    #genResult( element, index ) {
      // name and number extracted from the element path
      let nameNnumber = '';

      // extract the name and number from the element path
      if ( element.path && typeof element.path === 'string' ) {
        nameNnumber = element.path?.replace( '{APP_ID}', element.appId ) || '';
        nameNnumber = nameNnumber.replace( '&#92;', '&#8212;' );
        element.path = nameNnumber;
      }

      // disposable wrapper to hold the result content
      const lDisposableWrapper = document.createElement( 'div' );

      // generate the result HTML using the template
      lDisposableWrapper.innerHTML = ViewProvider.template.result( { ...element, nameNnumber, index } );

      // generated result element
      const result = lDisposableWrapper.firstChild;

      if ( index !== undefined ) {
        result.dataset.index = index;
      }

      // add mouse event listeners for results
      this.#addEventListener( result, 'mouseenter', this.#mouseEnter );

      result.setAttribute( ViewProvider.aria.selected, false );
      this.#searchInput.setAttribute( ViewProvider.aria.selected, result.getAttribute( 'data-index' ) );

      // add the clickable link element to the result
      const link = result.querySelector( `.${ ViewProvider.selector.class.spotlight_link }` );
      this.#addEventListener( link, 'click', () => {
        this.#goTo( link, element );
      } );

      return result;
    }

    // eslint-disable-next-line no-unused-private-class-members
    async #removeRecentlyVisited() {
      // filter out the record to be removed
      this.#recentlyVisitedModel = [];

      // update recently visited in user preferences
      try {
        await server.process( 'spotlightRecentlyVisited', {
          x01: env.APP_USER,
          x02: 'SET',
          x03: JSON.stringify( this.#recentlyVisitedModel ),
        } );
      } catch ( error ) {
        debug.warn( error.responseText );
      }

      // if there are no recently visited elements, clear it visually
      if ( this.#recentlyVisitedModel.length === 0 ) {
        // clear the content
        const recentlyVisitedContent = document.querySelector( `.${ ViewProvider.selector.class.spotlight_recent }` );
        recentlyVisitedContent.parentNode.removeChild( recentlyVisitedContent );
        this.#searchInput.focus();
      }
    }

    /**
           * generates shortcut elements based on the current context
           * @private
           * @returns {HTMLUListElement}
           */
    #genShortcuts() {
      // ul element to hold shortcut elements
      const shortcutsUl = this.#createElementFromTemplate( 'results_list', {
        'data-category': 'static_shortcuts',
      } );
        // object mapping context to shortcut template
      const shortcutsByContext = {
        app: ViewProvider.template.shortcut.ctrl_3,
        page: ViewProvider.template.shortcut.ctrl_4 + ViewProvider.template.shortcut.ctrl_3,
      };

      // populate the shortcuts ul
      shortcutsUl.innerHTML = `${ shortcutsByContext[ this.#context ] || '' } ${ ViewProvider.template.shortcut.ctrl_2 } ${ ViewProvider.template.shortcut.ctrl_1 }`;

      // add event listeners to each shortcut element
      for ( let shortcut of shortcutsUl.children ) {
        this.#addEventListener( shortcut, 'mouseenter', this.#mouseEnter );
        this.#addEventListener( shortcut, 'click', () => {
          this.#goTo( shortcut.firstElementChild );
        } );
      }

      // returns the shortcuts elements
      return shortcutsUl;
    }

    /**
           * redirects the user to the specified url
           * @private
           * @param {string} url
           * @param {Object} elem
           */
    #redirect( url, elem ) {
      // check if the url is provided
      if ( url ) {
        // TODO - Re-enable if in-app search ends up being a thing again. ---------------------
        // let gAppId = ''; // global application id
        // let gInAppSearchEnabled = false; // flag indicating whether in-app search is enabled
        // ------------------------------------------------------------------------------------

        // modify the url
        // check for the presence of '&debug.'
        if ( url.indexOf( '&DEBUG.' ) > 0 ) {
          let flowId = '::::'; // flow id for in-app search

          // TODO - Re-enable if in-app search ends up being a thing again. ---------------------
          // if ( gInAppSearchEnabled ) { // update flow id if in-app search is enabled
          //     flowId = '::FB_FLOW_ID:' + gAppId;
          // }
          // ------------------------------------------------------------------------------------

          // append flow id to the url
          url = url.substring( 0, url.indexOf( '&DEBUG.' ) + '&DEBUG.'.length ).concat( flowId );
        }

        // replace placeholders in the url with session values
        url = url.replace( '%SESSION%', session )
          .replace( '%25SESSION%25', session )
          .replace( '&DEBUG.', 'NO' )
          .replace( '&APP_SESSION.', session );

        // set new url
        if ( elem ) {
          elem.url = url;
        }


        // redirect the user to the new url
        nav.redirect( url );

        // close();
      }
    }

    // Private Event handlers
    /**
           * adds an event listener to the element
           * @private
           * @param {HTMLElement} element
           * @param {string} type
           * @param {EventListenerOrEventListenerObject} listener
           */
    #addEventListener( element, type, listener ) {
      element.addEventListener( type, listener );
    }

    /**
           * navigates to the specified url
           * @private
           * @param {HTMLElement} elem
           * @param {Object} recentlyVisitedRecord
           */
    async #goTo( elem, recentlyVisitedRecord ) {
      const url      = elem?.dataset.url; // url extracted from the element
      const type     = elem?.dataset.type; // url type
      const keywords = this.#searchInput.value; // keyword from search input

      // redirects depending on the url type
      switch ( type ) {
      case URL_TYPES.pe:
        window.pageDesigner.goToComponent( elem.getAttribute( 'data-typeid' ), elem.getAttribute( 'data-componentid' ), elem.getAttribute( 'data-propertyid' ) );
        break;
      case URL_TYPES.searchPage:
        window.pageDesigner.activateTab( 'search' );
        $( '#P4500_LOCAL_SEARCH' ).val( keywords ).trigger( 'change' ).trigger( 'focus' );
        dialog.close( a_spotlight_search );
        break;
      case URL_TYPES.searchApp:
        nav.popup( {
          url: shortcuts_url[ 0 ].url.replace( 'SEARCH_TERMS', encodeURIComponent( keywords ) ).replace( '%SESSION%', session ),
          name: 'SEARCH_RESULTS',
          width: 1000,
          height: 800,
        } );
        break;
      case URL_TYPES.searchAllApps:
        nav.popup( {
          url: shortcuts_url[ 1 ].url.replace( 'SEARCH_TERMS', encodeURIComponent( keywords ) ).replace( '%SESSION%', session ),
          name: 'SEARCH_RESULTS',
          width: 1000,
          height: 800,
        } );
        break;
      case URL_TYPES.searchWorkspace:
        this.#redirect( shortcuts_url[ 2 ].url.replace( 'SEARCH_TERMS', encodeURIComponent( keywords ) ).replace( '%SESSION%', session ), recentlyVisitedRecord );
        break;
      default:
        // ----- TODO - Relevant code that should be re-enabled once Recently Visited Links are fixed ----
        // if ( recentlyVisitedRecord !== undefined ) {
        //     this.#setRecentlyVisited( recentlyVisitedRecord );
        // }
        // ------------------------------------------------------------------------------------------------

        // redirect to the url if available
        this.#redirect( url, recentlyVisitedRecord );
        break;
      }
    }

    /**
           * adds 'is_active' class to the element on mouse enter
           * @private
           * @param {MouseEvent} event
           */
    #mouseEnter( event ) {
      const items = document.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_result }` );
      const active = document.querySelector( `li.${ ViewProvider.selector.class.spotlight_result }.${ ViewProvider.selector.class.is_active }` );
      const input = document.querySelector( `.${ ViewProvider.selector.class.spotlight_input }` );

      // removes is active class to the actual li element
      active.classList.remove( ViewProvider.selector.class.is_active );
      active.setAttribute( ViewProvider.aria.selected, false );

      // adds is active class to the mouse enter li element
      event.target.classList.add( ViewProvider.selector.class.is_active );
      event.target.setAttribute( ViewProvider.aria.selected, true );
      input.setAttribute( ViewProvider.aria.activedescendant, event.target.id );

      // iterate over each item
      items.forEach( ( item, index ) => {
        // set the selectedindex to continue navigation on that element
        if ( event.target === item ) {
          selectedIndex = index;
        }
      } );
    }

    /**
           * appends li elements to the corresponding category ul element in the results container
           * if the category ul element doesn't exist, it creates one along with its wrapper and title
           * @private
           * @param {HTMLElement} LiElement
           * @param {string} category
           */
    #appendElement( LiElement, category ) {

      let resultsCategory = this.#resultsCategories[ category ];
      const localizedCategory = getMessage( category );

      if ( !resultsCategory ) {
        resultsCategory = {
          onScreen: false,
          container: this.#createElementFromTemplate( 'category_container', {
            role: ViewProvider.role.region,
            [ ViewProvider.aria.labelledby ]: `${ ViewProvider.selector.id.category_title }${ localizedCategory.toLowerCase().replace( ' ', '-' ) }`,
          }, localizedCategory ),
          title: this.#createElementFromTemplate( 'category_title', {}, localizedCategory ),
          ul: this.#createElementFromTemplate( 'results_list', {
            'data-category': localizedCategory.toLowerCase().replace( ' ', '_' ),
          } ),
        };

        resultsCategory.container.appendChild( resultsCategory.title );
        resultsCategory.container.appendChild( resultsCategory.ul );

        this.#resultsCategories[ category ] = resultsCategory;
      }

      resultsCategory.ul.appendChild( LiElement );

      this.#showResultsCategory( resultsCategory );
    }

    // public methods
    /**
           * initializes the view by appending the body to the dialog and executing the search function
           * @param {HTMLElement} aSpotlight
           */
    initView( aSpotlight ) {
      // append the spotlight body to the dialog
      aSpotlight.appendChild( this.#body );
      aSpotlight.classList.add( ViewProvider.selector.class.spotlight );
      // execute the search function
      this.#searchFn();
    }

    clearView() {
      this.#emptyResults.hide();
      this.#hidePermanentCategory( this.#recentlyVisited );
      this.#hidePermanentCategory( this.#shortcuts );
      this.#hideResultsCategories();
    }

    /**
           * renders the search results on the screen
           * @param {Array} newResultSet
           */
    render( newResultSet = [] ) {
      // highlight matches in the result set
      this.#resultSet = this.#highlightMatches( newResultSet );

      // update the results in dom
      this.#updatedResults = [];

      // filter results by category
      this.#resultSet.forEach( category => {
        category.results.forEach( results => {
          const itemContext = results.item.context;

          if ( this.#advancedSearch.is || ( ( this.#context === 'global' &&   itemContext === 'global' ) ||
                           ( this.#context === 'app'    && ( itemContext === 'global'   || itemContext === 'app' ) ) ||
                           ( this.#context === 'page'   && ( itemContext === 'global'   || itemContext === 'app'     || itemContext === 'page' ) ) ) ) {

            if ( this.#advancedSearch.is && itemContext && itemContext === 'app' ) {
              results.item.appId = this.#advancedSearch.app;
            } else if ( results.item.path && results.item.path.indexOf( '{APP_ID}' ) > -1 ) {
              results.item.appId = currentAppId;
            }

            this.#updatedResults.push( new RenderableResult( results, this.#genResult( results.item, this.#updatedResults.length ) ) );
          }
        } );
      } );

      this.#hideResultsCategories();

      // render updated results on screen
      this.#updatedResults.forEach( result => {
        const category = result.metadata.item.category;

        // append the li and ul elements
        this.#appendElement( result.HTMLElement, category );
      } );

      // remove shortcuts if they are on the screen
      if ( this.#shortcuts.onScreen ) {
        this.#hidePermanentCategory( this.#shortcuts );
      }

      // handle empty results and recently visited
      const resultingCategories = this.#resultsContainer.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_category }:not(.${ ViewProvider.selector.class.spotlight_recent }, .${ ViewProvider.selector.class.spotlight_shortcuts } )` );

      if ( resultingCategories.length === 0 ) {
        // Show "No results found" info span if this.#searchInput is not empty
        if ( this.#searchInput.value !== '' ) {
          this.#emptyResults.show();
        } else {
          this.#emptyResults.hide();
        }

        // if available, show recently visited
        if ( this.#recentlyVisited?.ul.length !== 0 && !this.#recentlyVisited?.onScreen ) {
          // show recently visited if available and not on screen
          this.#showPermanentCategory( this.#recentlyVisited );
        }
      } else {
        // remove recently visited and empty results from screen
        if ( this.#recentlyVisited?.onScreen ) {
          this.#hidePermanentCategory( this.#recentlyVisited );
        }

        if ( this.#emptyResults.onScreen ) {
          this.#emptyResults.hide();
        }
      }

      // show shortcuts if search input is not empty and shortcuts are not on screen
      if ( this.#searchInput.value !== '' && !this.#shortcuts.onScreen ) {
        this.#showPermanentCategory( this.#shortcuts );
      }

      // li elements
      const liElements = document.querySelectorAll( `.${ ViewProvider.selector.class.spotlight_result }` );

      // add is-active class to the first li element
      liElements[ 0 ]?.classList.add( ViewProvider.selector.class.is_active );
      liElements[ 0 ]?.setAttribute( ViewProvider.aria.selected, true );
      this.#searchInput.setAttribute( ViewProvider.aria.activedescendant, liElements[ 0 ]?.id );

      // observe each li element to know if it is rendered
      liElements.forEach( element => {
        this.#observer.observe( element );
      } );
    }
  }

  /**
       * self-contained dialog functions, decoupled from the webcomponent
       * provides methods for initializing, opening, and closing a dialog
       */
  const dialog = {
    // initializes the dialog by creating an instance of a-spotlight-search
    init: () => {
      a_spotlight_search = document.createElement( Spotlight.webComponentName );
    },
    // opens the dialog with specified configurations, such as width, height, modal behavior, and position
    // freeze scroll and attach click event listeners to close the dialog
    open: ( pSpotlight ) => {
      const lDialog$ = $( pSpotlight );
      const scrollY = window.scrollY || window.pageYOffset;

      if ( !lDialog$.hasClass( 'ui-dialog-content' ) || !lDialog$.dialog( 'isOpen' ) ) {
        lDialog$.dialog( {
          width: 650,
          resizable: false,
          height: 'auto',
          modal: true,
          position: { my: 'center top', at: 'center top+' + ( scrollY + 64 ), of: $( 'body' ) },
          dialogClass: 'ui-dialog--apexspotlight',
          open: function () {

            lDialog$
              .css( 'min-height', 'auto' )
              .prev( '.ui-dialog-titlebar' )
              .remove();

            nav.beginFreezeScroll();

            // close the dialog on overlay click
            $( '.ui-widget-overlay' ).on( 'click', () => {
              dialog.close( pSpotlight );
            } );

            // close the dialog on keydown tab
            this.addEventListener( 'keydown', ( e ) => {
              if ( e.which === 9 ) {  // Key tab
                dialog.close( pSpotlight );
              }
            } );
          },
          close: function () {
            const closeDialog = new Event( 'spotlightDialogClose' );
            document.dispatchEvent( closeDialog );
            nav.endFreezeScroll();
          },
        } );
      }
    },
    // closes the dialog
    close: ( pSpotlight ) => {
      $( pSpotlight ).dialog( 'close' );
    },
  };

  /*
       * ==============================
       * ||                          ||
       * || Web Component Definition ||
       * ||                          ||
       * ==============================
       *  defines the metadata, attributes, and behavior of the web component a-spotlight-search
       */
  // metadata for the component
  const componentMetaData = {
    context: {
      type: WebComponent.dataTypes.string,
      sync: true,
      defaultValue: 'global',
    },
  };

  // attributes delegated to the component
  const delegatedAttributes = []; // ['aria-labelledby', 'min-height', 'height'];

  // add common attributes and hyphen case attribute names
  item.ItemComponent._addCommonAttributes( delegatedAttributes, componentMetaData );
  WebComponent._addHyphenCaseAttrNames( componentMetaData );

  // configure observed attributes
  const observedAttributes = WebComponent._configObservedAttributes( componentMetaData, delegatedAttributes );

  // define the Spotlight class
  class Spotlight extends item.ItemComponent {
    #v = {};
    #searchTerm;
    #searchProvider;
    #viewProvider;
    #searchIntervalId;

    static webComponentName = 'a-spotlight-search';

    /**
           * constructs an instance of the spotlight class
           * initializes private state and sets up search functionality
           */
    constructor() {
      super();
      this._configPrivateState( this.#v );

      this.#searchTerm = '';
      this.#searchProvider = new SearchProvider();

      // initialize view provider for rendering search results
      this.#viewProvider = new ViewProvider( this.search.bind( this ), this.#v.context );
    }

    /**
           * method that acts as the interface between the view and search providers while performing a search
           * @param {string} pNewSearchTerm
           * the function initializes the search provider if not already initialized,
           * performs the search using the provided search term, and renders the search results using the view provider
           */
    async search( pNewSearchTerm = '', advancedSearch ) {
      let lNewSearchTerm;

      this.#searchProvider.updateIndices( advancedSearch );

      if ( advancedSearch && advancedSearch.is ) {
        lNewSearchTerm = advancedSearch.searchTerm;
      } else {
        lNewSearchTerm = pNewSearchTerm;
      }

      // perform search if the new search term is different from the previous one and is valid
      if ( this.#searchProvider.validInput( lNewSearchTerm ) ) {
        this.#searchTerm = lNewSearchTerm;

        if ( this.#searchProvider.awaitingIndices ) {
          // If not already on screen, View Provider will render skeleton.
          if ( this.#viewProvider.skeleton.onScreen ) {
            if ( lNewSearchTerm === '' ) {
              this.#viewProvider.skeleton.hide();
            }
          } else if ( lNewSearchTerm !== '' || advancedSearch?.is ) {

            if ( advancedSearch?.is ) {
              this.#viewProvider.clearView();
            }

            this.#viewProvider.skeleton.show();
          }

          if ( this.#searchIntervalId === undefined ) {
            // Probing #searchProvider to determine if indices are already downloaded.
            this.#searchIntervalId = setInterval( () => {
              if ( !this.#searchProvider.awaitingIndices ) {
                clearInterval( this.#searchIntervalId );
                this.#searchIntervalId = undefined;
                this.#viewProvider.skeleton.hide();
                this.#viewProvider.render( this.#searchProvider.search( this.#searchTerm ) );
              }
            }, 50 );
          }
        } else {
          this.#viewProvider.render( this.#searchProvider.search( this.#searchTerm ) );
        }
      }
    }

    /**
           * private lifecycle method executed every time there are changes to the attributes
           * of the webcomponent's definition during runtime
           * @param {*} pAttributeChanges
           * initializes view provider the first time it's executed when the web component is mounted
           */
    // eslint-disable-next-line no-unused-vars
    _render( pAttributeChanges ) {
      // first time_render() gets executed when Web Component is mounted
      if ( !this.rendered ) {
        this.#viewProvider.initView( this );
      }
      // else {
      //     // Executed after the 1st time when there are attribute changes on the Web Component
      //     if ( pAttributeChanges ) {
      //         // pAttributeChanges.forEach( attribute => {
      //         // } );
      //     }
      // }
    }

    // static getters needed by apex web component implementation
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

  customElements.define( Spotlight.webComponentName, Spotlight );
  /*
       * ==============================
       * ||         End of           ||
       * || Web Component Definition ||
       * ==============================
       */

  // event listeners
  let button_spotlight_action;

  // add event listener when dom content is loaded
  window.addEventListener( 'DOMContentLoaded', () => {
    button_spotlight_action = document.querySelector( '#header-spotlightSearch' );

    // removing "data-action" temporarily to prevent JS error if spotlight button clicked before action is added
    if ( button_spotlight_action ) {
      button_spotlight_action.removeAttribute( 'data-action' );
    }
  }, false );

  // run when window has finished loading
  window.addEventListener( 'load', () => {
    let intervalPace = 100;
    let intervalCounter = 0;
    const actionName = 'spotlight-search';

    const addSpotlightAction = () => {
      // define an action for the spotlight button and a keyboard shortcut
      actions.add( {
        name: actionName,
        label: null,
        title: null,
        shortcut: 'Ctrl+Quote', // keyboard shortcut for opening spotlight
        action: () => {
          if ( !a_spotlight_search ) {
            dialog.init();
          }

          // open the spotlight search dialog
          dialog.open( a_spotlight_search );

          return true;
        },
      } );

      if ( button_spotlight_action ) {
        // adding "data-action" now that it is safe and the action has been added already
        button_spotlight_action.setAttribute( 'data-action', actionName );
      }
    };

    const intervalId = setInterval( () => {
      if ( actions.add ) {
        clearInterval( intervalId );
        addSpotlightAction();
      } else if ( intervalCounter >= 5000 ) {
        debug.warn( 'apex.actions.add could not be loaded' );
        clearInterval( intervalId );
      } else {
        intervalCounter = intervalCounter + intervalPace;
      }
    }, intervalPace );
  } );
} )( apex.jQuery, apex.item, apex.navigation, apex.util, apex.actions, apex.debug, apex.lang, apex.WebComponent, apex.env, apex.server );
