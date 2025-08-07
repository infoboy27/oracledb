/*!
 Copyright (c) 2019, 2024, Oracle and/or its affiliates.
 */
/*
 todo
 issues:
  - if list facet has no available options should it be hidden completely; how can this happen? in this case don't tell server it is hidden
  - test use case where page is submitted rather than ajax to refresh report
 Future possibilities:
  - date type for ranges, input
  - selectRange filer control type: this is two select lists that define a range
  - range slider control type
  - nested lists
 */

/**
 * @interface facetsRegion
 * @since 21.2
 * @extends {region}
 * @classdesc
 * <p>The facetsRegion interface is used to access the properties and methods of the facets API which is
 * used by both the Faceted Search and Smart Filters regions.
 * You get access to the facetsRegion interface with the {@link apex.region} function when passed
 * the regionId (static ID) of either a Faceted Search Region or Smart Filters Region.
 * The terms <em>facet</em> and <em>filter</em> (when used as a noun) are often used interchangeably.
 * </p>
 * <p>The facetsRegion provides the user interface used to search and filter an associated report.
 * The Faceted Search and Smart Filters regions have a great deal of overlap in their functionality; both allow
 * searching and filtering a report. The biggest difference is in the UI and this is controlled by the
 * {@link facetsRegion#uiMode} property. A number of properties are only supported in one mode or the other
 * as noted in the description of each property.
 * </p>
 * <p>Report region plug-in developers use the facetsRegion API to support the client side of faceted
 * search for their plug-in. The plug-in server-side render code must pass the static ID of the Faceted Search
 * or Smart Filter region to the client as part of its configuration. The plug-in region must listen for
 * the {@link facetsRegion#event:change} event and refresh the report in response.
 * Before sending the ajax request to refresh the report it must call
 * {@link facetsRegion#lock} and after the response completes it must call {@link facetsRegion#unlock}.
 * </p>
 * <div class="hw">
 * <h3 id="facet-items-section">Facet Items</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Facet Items" href="#facet-items-section"></a>
 * </div>
 * <p>Users filter the report by choosing or entering value(s) for as many facets as needed. The facet value is used
 * to match a specific column. Users can also enter a search term that matches any of the searchable columns
 * of the report. Each facet value and the search term(s) is stored in a hidden page item and has a corresponding
 * session state value. The item name is the filter or facet name.
 * </p>
 * <p>For example, if there is a facet or filter with name P1_PROJECT_STATUS that has LOV return values:
 * 'OPEN', 'IN_PROGRESS', 'CLOSED', and 'REOPENED'. Setting the page item will cause the facets region and
 * the report region to be updated to reflect the new facet value(s).
 * After executing the following code the report will show any records that have project status of OPEN or REOPENED.</p>
 * <pre class="prettyprint"><code>apex.item( "P1_PROJECT_STATUS" ).setValue( "OPEN:REOPENED" );
 * </code></pre>
 * <p>Note that multiple values are separated by a colon ":" and facet values that represent a range use
 * vertical bar "|" to separate the min and max range values.
 * </p>
 * <h4 id="facet-items-section-flexible-Operators"><b>Flexible Operators</b></h4>
 * <p>When using facets of type "Input Field" and "User can Choose Operator" is activated then the operator can be set by changing
 * the facet value.</p>
 * <p>For example, if there is a facet or filter with name P1_POPULATION, then report region can be filtered for all countries where
 * population is equal to a specific value.
 * After executing the following code the report will show any records that have equals to 1000.</p>
 * <pre class="prettyprint"><code>apex.item( "P1_POPULATION" ).setValue( "EQ:1000" );</code></pre>
 * <p>The following operators are available:</p>
 * <ul>
 *     <li>General
 *         <ul>
 *             <li>EQ: Equals</li>
 *             <li>NEQ: Not equals</li>
 *         </ul>
 *     </li>
 *     <li>NUMBER
 *         <ul>
 *             <li>LT: Less than</li>
 *             <li>LTE: Less than or equal to</li>
 *             <li>GT: Greater than</li>
 *             <li>GTE: Greater than or equal to</li>
 *         </ul>
 *     </li>
 *     <li>VARCHAR2
 *         <ul>
 *             <li>STARTS": Starts with</li>
 *             <li>NSTARTS: Does not start with</li>
 *             <li>C: Contains</li>
 *             <li>NC: Does not contain</li>
 *         </ul>
 *     </li>
 * </ul>
 */
( function ( util, debug, lang, locale, $, date, item, message, widget ) {
    "use strict";

    const C_FS = "a-FS",
          C_FS_SMART = `${C_FS}--smart`,
          C_FS_FACETS = `${C_FS}--facets`,
          C_FS_COLLAPSIBLE = `${C_FS}--collapsible`,
          C_FS_CURRENT = `${C_FS}-currentList`,
          C_FS_CUR_ITEM = `${C_FS}-currentItem`,
          C_FS_HEADER = `${C_FS}-header`,
          SEL_FS_HEADER = "." + C_FS_HEADER,
          C_INPUT_VALUE = `${C_FS}-inputValue`,
          SEL_INPUT_VALUE = "." + C_INPUT_VALUE,
          C_FS_APPLY = `${C_FS}-apply`,
          C_CHIP = "a-Chip",
          SEL_CHIP_TEXT = ".a-Chip-text > .a-Chip-value",
          SEL_CHIP_LABEL_TEXT = ".a-Chip-label,.a-Chip-text",
          C_FC = `${C_FS}-control`,
          C_FC_COLLAPSIBLE = `${C_FS}-control--collapsible`,
          C_FC_FACET_SELECTION_WRAP = `${ C_FS }-addFilter-filterSelection`,
          SEL_FACET_SELECTION = `.${ C_FC_FACET_SELECTION_WRAP } > a-select`,
          C_JS_OPEN_FILTER_DIALOG = "js-openFilterDialog",
          C_JS_OPEN_FILTER_DIALOG_FACET = `${ C_JS_OPEN_FILTER_DIALOG }Facet`,
          C_BODY = `${C_FS}-body`,
          C_WRAP = `${C_FS}-wrap`,
          C_BODY_INNER = `${C_FS}-bodyInner`,
          SEL_BODY_INNER = "." + C_BODY_INNER,
          C_FILTER = `${C_FS}-filter`,
          SEL_FILTER = `.${ C_FILTER }`,
          C_FACET_CHART = `${C_FS}-facetChart`,
          C_ITEM_GROUP = "apex-item-group",
          SEL_ITEM_GROUP = "." + C_ITEM_GROUP,
          C_ITEM_SUBGROUP = "apex-item-subgroup",
          SEL_ITEM_SUBGROUP = "." + C_ITEM_SUBGROUP,
          C_ITEM_OPTION = "apex-item-option",
          SEL_ITEM_OPTION = "." + C_ITEM_OPTION,
          C_BADGE = "apex-item-option-badge",
          C_CTRL_APPLY = "js-ctrlApply",
          SEL_BADGE = "." + C_BADGE,
          C_FS_TOTAL_AREA = `${C_FS}-totalArea`,
          C_FS_TOTAL = `${C_FS}-totalCount`,
          C_DISABLED = "is-disabled",
          SEL_DISABLED = "." + C_DISABLED,
          C_CHECKED = "is-checked",
          C_COLLAPSED = "is-collapsed",
          C_JS_CONTROL_ROOT = 'js-controlRoot',
          SEL_JS_CONTROL_ROOT = "." + C_JS_CONTROL_ROOT,
          C_JS_TABBABLE = "js-tabbable",
          C_JS_BEGIN = "js-begin",
          SEL_JS_BEGIN = `.${ C_JS_BEGIN }`,
          C_JS_END = "js-end",
          SEL_JS_END = `.${ C_JS_END }`,
          C_FS_RANGE = "a-FS-range",
          SEL_FS_RANGE = `.${ C_FS_RANGE }`,
          SEL_JS_TABBABLE = "." + C_JS_TABBABLE,
          SEL_VISIBLE = ":visible",
          SEL_TABBABLE = ":tabbable",
          C_FILTER_DIALOG_POPUP = `${C_FS}-addFilter`,
          C_I_BAR = "icon-bar-chart",
          C_I_PIE = "icon-pie-chart",
          C_HIDDEN = "u-hidden",
          SEL_HIDDEN = `.${ C_HIDDEN }`,
          D_ORDER = "data-order",
          D_COUNT = "data-count",
          D_VALUE = "data-value",
          D_FC = "data-fc",
          A_ID = "id",
          A_CLASS= "class",
          A_LABEL = "aria-label",
          A_LBLBY = "aria-labelledby",
          A_TITLE = "title",
          A_TABINDEX = "tabindex",
          A_ROLE = "role",
          A_ARIA_SELECTED = "aria-selected",
          A_ARIA_CHECKED = "aria-checked",
          A_MIN = "min",
          A_MAX = "max",
          A_DISABLED = "disabled",
          CUR_ITEMS_UL = `<ul class="${C_FS}-currentItems"></ul>`,
          DIV_C = "</div>",
          SPAN_C = "</span>",
          EVENT_CHANGE = "change",
          EVENT_FOCUS = "focus",
          EVENT_CLICK = "click",
          MENU_ID_SUFFIX = "_facetMenu",
          UNKNOWN_DATA_TYPE_MSG = "Facets: Unknown dataType: ",
          TYPE_STRING = "string",
          TYPE_OBJECT = "object";

    const REGION_TYPE = "Facets",
          WIDGET_NAME = "facets",
          DISPLAY_TYPE_FILTER_DIALOG = "FILTER_DIALOG";

    const EVENT_FACETS_CHANGE = EVENT_CHANGE,
          EVENT_BEFORE_ADD_CHART = "beforeAddChart",
          EVENT_AFTER_REMOVE_CHART = "afterRemoveChart",
          EVENT_FILTER = "filterablefilter",
          STATE_KEY = "facetCollapsedState",
          OPEN_CHARTS_KEY = "openCharts",
          CHART_CONFIG_KEY = "chartConfig",
          FILTER_DIALOG_CURRENT_FACET_KEY = "filterDialogFacetName",
          FILTERED_FACETS_KEY = "clientSideFiltering",
          EVENT_NS = ".facets",
          VAL_SEP = ":",
          RANGE_SEP = "|",
          CHART_ID_SUFFIX = "_A-FC",
          FCT_CHECKBOX = "checkbox",
          FCT_RADIO = "radio",
          FCT_GROUP = "group",
          FCT_LIST = "list",
          FCT_RANGE = "range",
          FCT_INPUT = "input",
          HTML_TAG_INPUT = FCT_INPUT,
          FCT_RANGE_LIST = "rangeList",
          SHOW_MORE = "SHOW_MORE",
          SHOW_LESS = "SHOW_LESS",
          SHOW_ALL_STEP_SIZE = 10000;

    const DATA_TYPE_VARCHAR2 = "VARCHAR2",
          DATA_TYPE_NUMBER = "NUMBER",
          DATA_TYPE_DATE = "DATE",
          DATA_TYPE_TIMESTAMP = "TIMESTAMP",
          DATA_TYPE_TIMESTAMP_TZ = "TIMESTAMP_TZ",
          DATA_TYPE_TIMESTAMP_LOCAL_TZ = "TIMESTAMP_LTZ";

    const KEYS = $.ui.keyCode,
          NUMBER_FORMAT = "FM999G999G999G999G999G999G999G999",
          CANONICAL_FORMAT = "YYYYMMDDHH24MISS",
          MSG_INPUT_CURRENT_LABEL = "APEX.FS.INPUT_CURRENT_LABEL",
          MSG_FILTER = "ACTIONS_MENU_FILTER",
          MIN_RESULTS_FOR_SUGGESTIONS = 10; // must have at least this many results to bother showing the suggestion filter chip area

    const extend = $.extend,
          toInteger = ( numStr )  => {
              return parseInt( numStr, 10 );
          };

    const suggestionValueRE = /^(\d+)(:(.*))?$/;

    let gFacetsRegionCount = 0,
        gIgnoreCollapsible = false,
        gErrorPlaceholderTemplateId;

    /*
     * A key is a string, to reference a Facets Region-specific translatable system message
     */
    function getFRMessage( key ) {
        return lang.getMessage( "APEX.FS." + key );
    }

    /*
     * A value is either a scalar string, a range object with properties b and e (for begin and end),
     * or an array of strings or range objects
     */
    function valueToString( value ) {
        if ( typeof value === TYPE_STRING ) {
            return value;
        } // else
        return value.map( i => {
            if ( i !== null && typeof i === TYPE_OBJECT ) {
                return i.b + RANGE_SEP + i.e;
            } // else
            return i;
        } ).join( VAL_SEP );
    }

    function stringToValue( string ) {
        return string.split( VAL_SEP ).map( i => {
            let r = ( i + "" ).split( RANGE_SEP );

            if ( r.length === 2 ) {
                return { b: r[0], e: r[1] };
            } // else
            return i;
        } );
    }

    function getSearchTerms( id ) {
        let terms = $v( id );

        // ok if terms has leading/trailing space but don't want it to be only whitespace
        if ( terms && terms.trim() !== "" ) {
            terms = terms.split( "\n" );
        } else {
            terms = [];
        }
        return terms;
    }

    function  highlightSearchTerm( baseString, searchTerm, textHighlightingCls ) {
        let highlightedString;
        const matchStart = ( "" + baseString ).toLowerCase().indexOf( searchTerm.toLowerCase() ); // baseString should always be a string

        if ( searchTerm && matchStart > -1 ) {
            const matchEnd = matchStart + searchTerm.length - 1,
                  beforeMatch = baseString.slice( 0, matchStart ),
                  matchedText = baseString.slice( matchStart, matchEnd + 1  ),
                  afterMatch = baseString.slice( matchEnd + 1 );

            highlightedString = `${util.escapeHTML( beforeMatch )}<span class='${textHighlightingCls}'>${util.escapeHTML( matchedText )}</span>${util.escapeHTML( afterMatch )}`;
        }

        return highlightedString;
    }

    function getFacetItemValue( control, includeOperatorValue = false ) {
        const value = $( "#" + util.escapeCSS( control.name ) ).val();

        if ( control.type === FCT_INPUT && control.flexibleOperator && value && value.includes( VAL_SEP ) && !includeOperatorValue ) {
            return getInputValue( value );
        }
        return value;
    }

    function getInputOperator( control ) {
        return stringToValue( getFacetItemValue( control, true ) )[0];
    }

    function getInputValue( value ) {
        return value.split( VAL_SEP )[1] || "";
    }

    function setItem( name, value ) {
        $( "#" + util.escapeCSS( name ) ).val( value ).trigger( EVENT_CHANGE, [{internal: true}] );
    }

    function setFacetItemValue( control, valueString ) {
        setItem( control.name, valueString );
    }

    function getControlIndex( controls, name ) {
        return controls.findIndex( el => { return el.name === name; } );
    }

    function getLabelForValue( control, value, operator ) {
        let label = value,
            controlImpl = gControlTypes[control.type];

        if ( controlImpl.getLabelForValue ) {
            label = controlImpl.getLabelForValue( control, value, operator );
            // if called before the lov has its values array just return the value
            // typically values would be empty because of control.lovValuesOptimizationSort is empty, but to be more robust just check values.length
            if ( !label && control.values.length === 0 ) {
                label = value;
            }
        }
        return label;
    }

    function getControlSuggestedValue( control, counts ) {
        let value = null,
            values = control.values,
            suggestedValues = control.suggestedValues,
            result = null;

        // if the control has values (is a LOV type control)
        if ( values && values.length > 0 ) {
            if ( Array.isArray( suggestedValues ) && suggestedValues.length > 0 ) {
                // for an array of suggestions make sure the value exists
                for ( let i = 0; i < suggestedValues.length; i++ ) {
                    value = control.values.find( x => x.r === suggestedValues[i] );

                    if ( value ) {
                        value = value.r;
                        // don't pick a suggestion that has no results
                        if ( counts && counts[value] === 0 ) {
                            value = null;
                            continue;
                        }
                        break;
                    }
                }
                // if a value wasn't found it could be a custom range
                if ( value == null && control.type === FCT_RANGE_LIST && !control.noManualEntry ) {
                    value = suggestedValues[0];
                }
            } else if ( suggestedValues === true ) {
                // when suggestedValues is true (dynamic) pick the first one or one with largest count
                if ( counts ) {
                    let sortedValues = Object.entries( counts ).sort( ( a,b ) => b[1] - a[1] );
                    if ( sortedValues.length > 0 && sortedValues[0][1] >= 0 ) {
                        value = sortedValues[0][0];
                    }
                } else {
                    value = values[0].r; // xxx deal with groups?
                }
            }
        } else if ( Array.isArray( suggestedValues ) && suggestedValues.length > 0 ) {
            // controls that don't have values also don't have counts so if there is a suggestion use it
            value = suggestedValues[0];
        }

        // finally if there is a value and it has a count make sure the count is not zero
        if ( value && counts && counts[value] === 0 ) {
            value = null;
        }

        if ( value ) {
            result = {
                r: value,
                d: getLabelForValue( control, stringToValue( value )[0] )
            };
        }
        return result;
    }

    function makeCurrentChip( chip$, prevChip$, focus ) {
        // make previous chip not active or a tab stop
        prevChip$.removeClass( C_JS_TABBABLE )
            .children( SEL_CHIP_LABEL_TEXT ).attr( A_TABINDEX, -1 );
        // The current (active) chip can have up to 2 tab stops.
        let stop$ = chip$.addClass( C_JS_TABBABLE )
            .children( SEL_CHIP_LABEL_TEXT ).attr( A_TABINDEX, 0 ).first();
        if ( focus ) {
            stop$.trigger( EVENT_FOCUS );
        }
    }

    // the server gives the values in exactly the order it intends but there are some options that affect
    // the order shown in the UI. Record the initial order
    function setValuesOrder( control ) {
        let i, items, item;

        // todo think this is facet control specific
        if ( control.values && ( control.checkedFirst || control.disabledLast || control.orderByCount ) )  {
            items = control.values;
            for ( i = 0; i < items.length; i++ ) {
                item = items[i];
                item.order = i + 1;
            }
        }
    }

    // convert the server side value format e.g. for dates to the format that the input requires
    function convertServerToInput( pValue, pControl ) {
        let nativeValue;

        if ( !pValue ) {
            return pValue;
        }
        switch ( pControl.dataType ) {
        case DATA_TYPE_VARCHAR2:
        case DATA_TYPE_NUMBER: // todo same handling for number like it's done for date
            return pValue;
        case DATA_TYPE_DATE:
        case DATA_TYPE_TIMESTAMP:
        case DATA_TYPE_TIMESTAMP_TZ:
        case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
            try {
                nativeValue = date.parse( pValue, CANONICAL_FORMAT );
                return date.format( nativeValue, pControl.formatMask );
            } catch ( e ) {
                return pValue; // todo maybe add also log output but for the moment it's enough
            }
        default:
            throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ pControl.dataType }` );
        }
    }

    // convert the input value e.g. from date picker to the format the server requires
    function convertInputToServer( pValue, pControl ) {
        let nativeValue;

        if ( !pValue ) {
            return pValue;
        }

        switch ( pControl.dataType ) {
        case DATA_TYPE_VARCHAR2:
        case DATA_TYPE_NUMBER: // todo same handling for number like it's done for date
            return pValue;
        case DATA_TYPE_DATE:
        case DATA_TYPE_TIMESTAMP:
        case DATA_TYPE_TIMESTAMP_TZ:
        case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
            try {
                nativeValue = date.parse( pValue, pControl.formatMask );
                return date.format( nativeValue, CANONICAL_FORMAT );
            } catch ( e ) {
                return ""; // todo maybe add also log output but for the moment it's enough
            }
        default:
            throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ pControl.dataType }` );
        }
    }

    function JSONArrayOrEmptyString( a ) {
        return a.length > 0 ? JSON.stringify( a ) : "";
    }

    function notVisible( el$, curFacets ) {
        return !el$.is( SEL_VISIBLE ) && !( typeof curFacets === TYPE_STRING && $( curFacets ).is( SEL_VISIBLE ) );
    }

    function renderTotalCountArea( label, regionId ) {
        let labelId = regionId + '_row_count_lbl';

        return `<div class='${ C_FS_TOTAL_AREA }' role='region' aria-labelledby='${ labelId }' >\
<span class='a-FS-totalLabel' id='${ labelId }'>${util.escapeHTML( label )}</span> <span class='${ C_FS_TOTAL }'></span></div>`;
    }

    function renderSearchInput( out, id, placeholder, hasIcon, searchLabel, clearIcon, isItemGroup = false, headerId ) {
        if ( isItemGroup ) {
            out.markup( "<div class='apex-item-group apex-item-group--search'>" );
        }

        // If any for the header is provided, a header is created.
        if ( headerId ) {
            out.markup( `<h3 class="u-vh"` )
               .attr( A_ID, headerId )
               .attr( "aria-roledescription", getFRMessage( "VISUALLY_HIDDEN_HEADING" ) )
               .markup( ">" )
               .content( searchLabel )
               .markup( "</h3>" );
        }

        out.markup( `<input class="text_field apex-item-text${hasIcon ? " apex-item-has-icon" : ""}" type="search" maxlength=500` )
            .attr( A_ID, id )
            .optionalAttr( "placeholder", placeholder );

        if ( headerId ) {
            // If header ID provided, we use it as the label
            out.attr( A_LBLBY, headerId );
        } else {
            out.optionalAttr( A_LABEL, searchLabel );
        }
        out.markup( ">" );

        if ( clearIcon ) {
            out.markup( "<span class='a-FS-search-clear js-clearInput' tabindex='-1'><span class='a-Icon icon-multi-remove' ></span></span>" );
        }

        if ( hasIcon ) {
            renderIcon( out, "apex-item-icon icon-search" );
        }

        if ( isItemGroup ) {
            out.markup( "</div>" );
        }
    }

    function renderFilterDialogButton( pOut, pIconOnly, pBottom ) {
        const buttonLbl = getFRMessage( "ADD_FILTER" ),
              labelClass = pIconOnly ? "a-Button--noLabel " : "",
              wrapperClass = pBottom ? `${ C_FS }-moreFacets ${ C_FS }-moreFacets--bottom` : `${C_FS}-searchActions`,
              stretch = pBottom ? ` a-Button--stretch` : "";

        pOut.markup( `<div class="${ wrapperClass }">` );
        pOut.markup( `<button type='button' class="a-Button ${ labelClass }a-Button--withIcon${ stretch } ${ C_JS_OPEN_FILTER_DIALOG }"` )
            .optionalAttr( A_TITLE, pIconOnly ? buttonLbl : "" )
            .optionalAttr( A_LABEL, pIconOnly ? buttonLbl : "" )
            .markup( ">" );
        renderIcon( pOut, "a-Icon icon-add-filter" );
        if ( !pIconOnly ) {
            pOut.content( util.escapeHTML( buttonLbl ) );
        }
        pOut.markup( "</button>" );
        pOut.markup( "</div>" );
    }

    function toggleListOverflow ( pThis, pTarget ) {
        const button$ = $( pTarget ),
              action = button$.hasClass( "js-showMore" ) ? SHOW_MORE : SHOW_LESS;

        pThis._updateDisplayedItems( button$, action );
    }

    function renderButton( pOut, pText, pClass, pIcon, pTabIndex, pAriaControls, pDataFc ) {
        pOut.markup( `<button type="button"` )
            .attr( A_CLASS, `a-Button ${ pClass }` )
            .optionalAttr( A_TITLE, pIcon ? pText : "" )
            .optionalAttr( A_LABEL, pIcon ? pText : "" )
            .optionalAttr( "tabindex", pTabIndex ? pTabIndex : "" )
            .optionalAttr( "aria-controls", pAriaControls ? pAriaControls : "" );
        if ( pDataFc !== undefined ) {
            pOut.attr( D_FC, pDataFc );
        }
        pOut.markup( ">" )
            .content( pIcon ? "" : pText );

        if ( pIcon ) {
            renderIcon( pIcon ) ;
        }

        pOut.markup( "</button>" );
    }

    function chartForFacet( name ) {
        return $( "#" + util.escapeCSS( name + CHART_ID_SUFFIX ) );
    }

    function formatNumber( number, fmt, threshold, fmtOpt ) {
        let result;

        if ( fmt === true ) {
            if ( threshold !== null && number >= threshold ) {
                result = locale.formatCompactNumber( number, {maximumFractionDigits: 0} );
            } else {
                result = locale.formatNumber( number, NUMBER_FORMAT );
            }
        } else if ( fmt === "compact" ) {
            result = locale.formatCompactNumber( number, fmtOpt );
        } else if ( typeof fmt === TYPE_STRING ) {
            result = locale.formatNumber( number, fmt, fmtOpt );
        } else {
            result = "" + number;
        }
        return result;
    }

    function renderValuesFilter( out, fcIdPrefix, control, hidden ) {
        let filterLabel = lang.formatMessageNoEscape( "APEX.FS.FILTER", control.label ), // no escaping needed because it'S done in the renderSearchInput function
            id = fcIdPrefix + "_f";

        out.markup( `<div class='${C_FILTER}'` )
            .optionalAttr( "style", hidden ? "display: none" : "" )
            .markup( ">" );
        renderSearchInput( out, id, filterLabel, true, filterLabel, true, true );
        out.markup( DIV_C );
    }

    function renderIcon( out, iconClasses ) {
        out.markup( "<span aria-hidden='true'" )
            .attr( A_CLASS, `a-Icon ${ iconClasses }` )
            .markup( ">" + SPAN_C );
    }

    function renderClearValueButton( out, label, accLabel, value, controlIndex ) {
        out.markup( "<button class='a-FS-clear' type='button'" )
            .attr( A_LABEL, accLabel )
            .attr( D_FC, controlIndex );
        if ( typeof value === TYPE_OBJECT ) {
            out.attr( "data-begin", value.b );
            out.attr( "data-end", value.e );
        } else {
            out.attr( D_VALUE, value );
        }
        out.markup( ">" )
            .content( label )
            .markup( "<span class='a-Icon icon-multi-remove'></span></button>" );
    }

    function freezeScroll( popup$ ) {
        const navigation = apex.navigation;

        // add handlers to a popup to freeze scrolling while open
        popup$.on( "popupopen", () => {
            navigation.beginFreezeScroll();
        } ).on( "popupclose", () => {
            navigation.endFreezeScroll();
        } );
    }

    // Uses the compareDocumentPosition API to evaluate if a node is after another node, is consider an after position
    // if toEvaluateNode is next to the baseNode in the same tree or is a descendant of a next tree or a next tree to the
    // parent, take a look to the API which provides a better explanation.
    function isNodePositionedAfter ( baseNode, toEvaluateNode ) {
        const positionIndex = baseNode.compareDocumentPosition( toEvaluateNode ),
              containedAndFollowing = Node.DOCUMENT_POSITION_CONTAINED_BY + Node.DOCUMENT_POSITION_FOLLOWING;

        return positionIndex === Node.DOCUMENT_POSITION_FOLLOWING || positionIndex === containedAndFollowing;
    }

    // don't doc methods/properties that don't apply to facetsRegion
    /**
     * @ignore
     * @member widgetName
     * @memberOf facetsRegion.prototype
     */
    /**
     * @ignore
     * @member parentRegionId
     * @memberOf facetsRegion.prototype
     */
    /**
     * @ignore
     * @method call
     * @memberOf facetsRegion.prototype
     */
    /**
     * @ignore
     * @method widget
     * @memberOf facetsRegion.prototype
     */
    /**
     * @ignore
     * @method alternateLoadingIndicator
     * @memberOf facetsRegion.prototype
     */

    $.widget( "apex.facets",
    /**
     * @lends facetsRegion.prototype
     */
    {
        widgetEventPrefix: WIDGET_NAME,
        options: {
            //regionStaticId: "",  // required
            //ajaxIdentifier: "",  // required
            /**
             * <p>Controls the UI mode of the region. It is one of the following values:</p>
             * <ul>
             * <li>"F" This is traditional faceted search mode. This is the value set by the Faceted Search region.</li>
             * <li>"S" This is smart filter search mode. This is the value set by the Smart Filters region.</li>
             * </ul>
             * <p>This option property cannot be changed after initialization. A number of other options and methods
             * are affected by this property setting.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {string}
             * @default "F"
             * @exampleGetter
             */
            uiMode: "F",
            /**
             * <p>This determines if the search bar is collapsible.
             * If null (the default) the search bar is collapsible on mobile sized screens but not on desktop (larger) screens.
             * If true the searchbar is always collapsible. If false the searchbar is not collapsible.
             * When collapsible and there are no filters the search input field is not shown and the suggestions,
             * if any, are on one line.
             * This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and
             * {@link facetsRegion#maxChips} is not 0.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {boolean|null}
             * @default null
             * @exampleGetterSetter true
             */
            collapsibleSearchBar: null,
            /**
             * <p>The maximum number of suggestion filter chips to show at a time.
             * If 0 the suggestion filter chips area is not shown. If -1 then all available facet suggestions
             * are shown. The {@link facetsRegion#moreFiltersChip} option is only useful when this value is positive.
             * </p>
             * <p>This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and is ignored otherwise.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {number}
             * @default 5
             * @exampleGetterSetter 6
             */
            maxChips: 5,
            /**
             * <p>Determine if a special "more filters" chip is shown in the suggestion filter chips area.
             * When clicked this chip shows a list of available filers to choose and filer the report on.
             * </p>
             * <p>This only applies when {@link facetsRegion#uiMode} is "S" (smart filter mode) and is ignored otherwise.
             * See also {@link facetsRegion#maxChips}.</p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default true
             * @exampleGetterSetter false
             */
            moreFiltersChip: true,
            /**
             * Controls initialization of facet collapsible state. One of "clear" or "reset".
             * Internal communication from server to client for cache control settings
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {string}
             * @default null
             */
            initState: null,
            /**
             * <p>Batch facet control changes or not. Batching changes allows the user to make a number of selections
             * before the report refreshes. In some cases this can make searching more efficient.
             * </p>
             * <p>When true, the {@link facetsRegion#event:change} event is delayed until an "apply" button is pressed. When
             *  {@link facetsRegion#uiMode} is "F" (faceted search mode) there will be an apply button shown (unless
             *  {@link facetsRegion#externalApply} is true). When {@link facetsRegion#uiMode} is "S" (smart filter mode)
             *  changes are applied when the the facet popup is closed.
             * </p>
             * <p>When false, the {@link facetsRegion#event:change} event is fired as soon as any facet control value changes.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default true
             * @exampleGetterSetter false
             */
            batch: true,
            /**
             * <p>Only applies if {@link facetsRegion#batch} is true and {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * If true no apply button is shown. Used when facets are in a dialog
             * or popup or otherwise have some other external way to apply the changes.
             * See the {@link facetsRegion#apply} method.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetterSetter true
             */
            externalApply: false,
            /**
             * <p>If true the facet control values give feedback (counts) about how many resources match the facet value.
             * If false there is no feedback. Feedback can also be configured on a per facet basis with the
             * <code class="prettyprint">hasFeedback</code> property of a control. See {@link facetsRegion.control}.
             * </p>
             * <p>This option can only be set during initialization.</p>
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default true
             * @exampleGetter
             */
            feedback: true,
            /**
             * <p>This controls the search field.
             * If true a search field is included in the facets area.
             * If false there is no search field.
             * If a string it is the ID of a page item input field to use as the search field
             * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be true
             * and cannot be changed.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {string|boolean}
             * @default false
             * @exampleGetterSetter "P1_SEARCH"
             */
            searchField: false,
            /**
             * <p>The id of a button that initiates the search. Only applies if {@link facetsRegion#searchField}
             * is a string page item id. If this value is changed call {@link facetsRegion#refreshView}.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {string}
             * @default null
             * @exampleGetterSetter "P1_SEARCH_BUTTON"
             */
            searchButton: null,
            /**
             * <p>Name of the search item. Required if {@link facetsRegion#searchField} is not false.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {string}
             * @default null
             * @exampleGetter
             */
            searchItem: null,
            /**
             * <p>Specify if multiple searches are allowed. If true the report can be filtered by multiple
             * search terms. Each search term must match some part of a record for it to be included in the report.
             * (This means that search term conditions are combined with AND.)
             * If false only a single search term is allowed.
             * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be true
             * and cannot be changed.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default false
             * @exampleGetterSetter true
             */
            multipleSearches: false,
            /**
             * Search term suggesitions
             * If false there are no suggestions
             * If true get suggestions via ajax todo
             * Or an a Array of search term suggestion strings
             *
             * todo consider documenting
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {string[]|boolean}
             * @default false
             */
            searchSuggestions: false,
            // todo option(s) for search history
            // recentSearchTerms: null
            /**
             * <p>Controls if and where the list of current (applied) facet choices are shown. This is known as the
             * current facets area.
             * If a string, it is the selector of an element to render the list of current facet values in.
             * If true the list of current facets is added at the top of the facets region.
             * If false or not present there is no list of current facets.
             * </p>
             * <p>This option can only be set during initialization.
             * When {@link facetsRegion#uiMode} is "S" (smart filter mode) this option is forced to be false
             * because applied facets are always shown in the search bar.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {string|boolean}
             * @default true
             * @exampleGetter
             */
            currentFacets: true,
            /**
             * <p>Controls if and where the total count is shown.
             * If a string, it is a selector of an element to display the current total resources count in.
             * If true show the total count in the current facets area or if there is no current facets area show it
             * where the current facets area would be if it were true.
             * If false don't show the total count.
             * This is forced to false if feedback is false.</p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {string|boolean}
             * @default true
             * @exampleGetter
             */
            showTotalCount: true,
            /**
             * <p>Determines if facets can have a button to show a chart of facet counts.
             * If true a chart for a single facet can be shown in a dialog (or popup).
             * If false no charts can be shown.
             * If a string it is the selector of an element to render the charts in.
             * </p>
             * <p>Charts can also be shown with the {@link facetsRegion#addChart} method unless this option is false.
             * When {@link facetsRegion#uiMode} is "S" (smart filter mode) there is no built-in UI for the user to show charts.
             * The require and JET chart libraries and JET CSS must be available. This is done automatically by the Faceted
             * Search region but not the Smart Filters region.
             * </p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {string|boolean}
             * @default false
             * @exampleGetterSetter true
             */
            showCharts: false,
            /**
             * <p>The default maximum number of values to show in a facet chart.</p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {number}
             * @default 10
             * @exampleGetterSetter 20
             */
            chartTopNValues: 10,
            /**
             * Default options for dialog widget that shows charts when showCharts is true.
             * Only one of defaultChartDialog and defaultChartPopup should be non-null
             * TODO consider documenting this in the future
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {object}
             */
            defaultChartDialog: {
                width: 620,
                height: 580,
                appendTo: "form[name='wwv_flow']",
                resizable: true,
                draggable: true,
                title: getFRMessage( "CHART_TITLE" ),
                modal: false
            },
            /**
             * Default options for popup widget that shows charts when showCharts is true.
             * Only one of defaultChartDialog and defaultChartPopup should be non-null
             * TODO consider documenting this in the future
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {object}
             */
            defaultChartPopup: null,
            /* Example:
              {
                width: 620,
                height: 580,
                appendTo: "form[name='wwv_flow']",
                noOverlay: true,
                relativePosition: "after",
                callout: true
              },
            */
            /**
             * Default options for popup widget that shows list of facets that can be shown or hidden.
             *
             * TODO consider documenting this in the future
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {object}
             */
            defaultConfigPopup: {
                title: getFRMessage( "CONFIG_TITLE" ),
                appendTo: "form[name='wwv_flow']",
                relativePosition: "below",
                width: "auto",
                minHeight: "0",
                noOverlay: true,
                callout: false,
            },
            /**
            * Default options for popup widget that shows list of facets that can be shown or hidden.
            *
            * TODO consider documenting this in the future
            * @ignore
            * @memberof facetsRegion
            * @instance
            * @type {object}
            */
            defaultFilterDialogPopup: {
                appendTo: "form[name='wwv_flow']",
                relativePosition: "below",
                width: "300px",
                minHeight: "0",
                noOverlay: true,
                callout: true,
                autoOpen: false,
                classes: {
                    "ui-dialog": `${C_FS}-addFilterPopup`
                },
                showTitle: true
            },
            /**
             * <p>Controls if and how numbers for facet value counts and total count are formatted.
             * If false the numbers are not formatted.
             * If true the numbers are formatted using compact format (with no fractional digits) for numbers greater
             * than or equal to the {@link facetsRegion#numberFormatThreshold} and a default format model with group separators otherwise.
             * The {@link facetsRegion#numberFormatOptions} are not used.
             * If a string: it is a database number format model or the keyword "compact".
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {string|boolean}
             * @default true
             * @exampleGetterSetter "999G999G999G999"
             */
            numberFormat: true,
            /**
             * See {@link facetsRegion#numberFormat}. Only applies if {@link facetsRegion#numberFormat} is true.
             * If null and <code class="prettyprint">numberFormat</code> is true then
             * the default format model with group separators is used.
             * @memberof facetsRegion
             * @instance
             * @type {number}
             * @default null
             * @exampleGetterSetter 1000
             */
            numberFormatThreshold: null,
            /**
             * <p>Options to pass to the number formatting function. The available option properties depend on
             * the value of {@link facetsRegion#numberFormat}. See {@link apex.locale.formatNumber} and
             * {@link apex.locale.formatCompactNumber}.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {object}
             * @default null
             * @exampleGetterSetter {
             *     maximumFractionDigits: 1
             * }
             */
            numberFormatOptions: null,
            // todo consider collapse toggle position start/end?
            /**
             * <p>Persist facet control collapsed state and chart state in browser session storage or not.
             * </p>
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default true
             * @exampleGetterSetter false
             */
            persistState: true,
            /**
             * <p>Controls if facet values are cleared when hidden by the facet configuration popup (More Filters).
             * This option is not applicable when {@link facetsRegion#uiMode} is "S" (smart filter mode)</p>
             * @memberof facetsRegion
             * @instance
             * @type {boolean}
             * @default true
             * @exampleGetterSetter false
             */
            clearOnHide: true,
            // todo consider an autoCollapse option that allows at most one facet control to be expanded.
            /**
             * @typedef facetsRegion.control
             * @type object
             * @desc
             * <p>Facet control option properties that configure the look and behavior of a facet.
             * </p>
             * <p>A note about facet visibility: There are 3 options that can affect if a facet is shown:
             * displayed, visibleCondition, and lovDependsOn. There is little coordination between these options.
             * In general, the last one evaluated wins (gets to say if the facet is visible or not).
             * </p>
             * <p>See also listControl, {@link facetsRegion#rangeControl}.
             * </p>
             *
             * @prop {string} name The item/session state name
             * @prop {string} type One of "list", "range", "rangeList", "selectList",
             *               "group", "checkbox", "input"
             * @prop {string} label The UI label to show for the facet control.
             * @prop {boolean} includeLabel Determines if the facet label is also displayed when a facet value is shown
             *   standalone such as in the current facets area in faceted search mode
             *   or as a suggestion facet chip in smart filters mode. When facet is displayed in filter dialog the label is always shown.
             * @prop {string} icon Icon CSS classes to show before the facet label in faceted search mode and
             *   in the suggestions drop down in smart filters mode.
             * @prop {string} cssClasses Additional classes to set on the facet control. In faceted search mode
             * the class is added to the facet control element with class 'a-FS-control'.
             * In smart filters mode the class is added to the suggestion chip element with class 'a-Chip' and to
             * the popup element with class 'a-FS-body'.
             * @prop {boolean} collapsible Determines if the the facet control can be collapsed.
             *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * @prop {boolean} initialCollapsed When <code class="prettyprint">collapsible</code> is true this determines if the facet control is initially collapsed.
             *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * @prop {integer} maxHeight The maximum height of the facet control values area.
             *   If the facet has more values than will fit in this height then they will scroll.
             *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * @prop {boolean} clearBtn If true the control will have a clear button shown when it has a value.
             *   Default true.
             *   When {@link facetsRegion#uiMode} is "S" (smart filters mode) this does not apply and is set to false.
             * @prop {boolean} hasFeedback If true then this control expects to get feedback about how many matching
             *   resources are available. The default comes from option {@link facetsRegion#feedback}.
             * @prop {string} displayAs Controls whether the facet control is shown as inline or in a filter dialog (INLINE, FILTER_DIALOG).
             *   Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * @prop {object} visibleCondition A condition object as described by apex.util.checkCondition. This controls the visibility
             *     of the facet. When the condition is true the facet if visible. When not visible the facet will have no value.
             * @prop showChart {boolean} Default true. Only applicable for LOV related controls and if showCharts, hasFeedback and showCounts is true.
             * @prop initialChart {boolean} Default false. Only applies if showChart is applicable and true and showCharts is a string.
             * @prop {boolean|array} suggestedValues Determines if a facet suggestion chip is displayed in the suggestion filter chips area
             *   and if so what value to suggest. If true the value with the largest count or first value
             *   of a LOV facet is used as the suggestion value.
             *   If false this facet is not included in the suggestion filter chip area. If an array it is an array of
             *   facet values. The first value that has a non-zero count is used.
             *   Only applies when {@link facetsRegion#uiMode} is "S" (smart search mode).
             * @prop {facetsRegion.listControl|facetsRegion.rangeControl|facetsRegion.selectListControl|facetsRegion.checkboxControl|facetsRegion.inputControl} * Additional type specific properties.
             */
            // todo add "starRating", to list of types
            /**
             * @typedef facetsRegion.listControl
             * @type object
             * @desc
             * <p>These are additional options for controls that have a list of values (LOV).
             * These options apply to the facet control types 'list' and 'rangeList'</p>
             *
             * @prop {boolean} escape If false allows markup in the values display values. Otherwise markup is escaped.
             * @prop {boolean} multiple If true the user can select multiple values from the list. (checkboxes)
             * @prop {boolean} showCounts Default true. Only applicable if hasFeedback is true.
             * @prop {boolean} hideEmpty If true values with 0 count are hidden if false values with 0 count are visually "disabled"
             * @prop {string} lovDependsOn Parent cascading LOV parent facet name. When the parent changes, new values are requested from the server.
             * @prop {boolean} lovDependsOnRequired If true the lovDependsOn parent must have a value for this facet to have any values.
             *       This only applies when lovDependsOn is specified.
             * @prop {object[]} values LOV array of objects with these properties
             *  @prop {string} values.r Return value
             *  @prop {string} values.d Display value
             *  @prop {string} [values.l] Optional display value without markup. Only needed when display value includes markup
             *      if no l property and escape is false fall back to stripHTML on display value (d).
             *  @prop {string} [values.i] Icon CSS Classes for value
             *  @prop {boolean} [values.g] Indicates that this list item represents a group not a value.
             * @prop {boolean} filterValues If true the user can filter the list of values to make it easy to find a particular value.
             * @prop {string} listClasses extra classes to add to the list grouping element
             * @prop {number} showAllCount If the list contains more than this number of items a "Show all" control is shown.
             *     Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             * @prop {number} showAllGrace Default 1. If the number of items is withing this amount of the showAllCount
             *     don't bother with showMore behavior. Only applies if showAllCount is given.
             *     This solves the problem of clicking show more/all only to find for example 1 more item.
             * @prop {boolean} orderByCount If true the items are ordered by the count descending (after checked items if checkedFirst is true).
             * @prop {boolean} checkedFirst If true any selected items are shown first. Not supported if values are grouped.
             * @prop {boolean} disabledLast If true any disabled items are shown last. Only applies if hasFeedback is true.
             *     Not applicable if hideEmpty is true. Not supported if values are grouped.
             * @prop {boolean} hideRadioButton Only applies when multiple is false. Uses bold label rather than radio button to indicate selected item
             * @prop {boolean} noManualEntry Only applies to rangeList. If true the manual range entry controls are not added.
             * @prop {boolean} actionsFilter If true adds the action Filter to the facet context menu. The default is false.
             *      Only applies when {@link facetsRegion#uiMode} is "F" (faceted search mode).
             */
             // This option makes only sense in combination with the server so we don't want to document it
             // @prop {string} lovValuesOptimizationSort If has value (asc or desc) then the values array is empty when initialized and the values
             //       should be taken from the fetch counts request response.
            /**
             * @typedef facetsRegion.rangeControl
             * @type object
             * @desc
             * <p>These are additional options for controls that allow a range defined by a start and end value.
             * These options apply to the facet control types 'range' and 'rangeList' (unless noManualEntry is true).</p>
             *
             * @prop {boolean} allowOpen If true manual entry open ended ranges are allowed. Default false.
             * @prop {string} prefixText Text to display before the range input fields. Example: "$".
             * @prop {string} suffixText Text to display after the range input fields. Example: "mph".
             * @prop {string} rangeText Text displayed between the 2 range input fields. Example: " - ".
             * @prop {string} currentLabel Label used for the current facets area. Example: "$%0 to $%1"
             * @prop {string} currentLabelOpenHi Label used for the current facets area. Example: "Over $%0"
             * @prop {string} currentLabelOpenLow Label used for the current facets area. Example: "Under $%0"
             * @prop {number} min Minimum value user is allowed to enter.   When dataType is number:
             * @prop {number} max Maximum value user is allowed to enter.   When dataType is number:
             * @prop {number} step Number input step increment.   When dataType is number:
             * @prop {string} dataType The datatype of the value to enter and the facet value to compare with.
             *   The comparison operator is controlled by the server. One of "NUMBER", "VARCHAR2", "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ"
             * @prop {string} formatMask Format Mask of the input when facet is based on dataType "DATE", "TIMESTAMP", "TIMESTAMP_TZ", "TIMESTAMP_LTZ"
             */
            // todo for rangeControl add once implemented (currently number assumed) * @prop {string} dataType
            /**
             * @typedef facetsRegion.selectListControl
             * @type object
             * @desc
             * <p>These are additional options for select list controls.
             * These options apply to the facet control types 'selectList'.</p>
             *
             * @prop {boolean} showCounts Default true. Only applicable if hasFeedback is true.
             * @prop {boolean} hideEmpty If true values with 0 count are hidden if false values with 0 count are visually "disabled"
             * @prop {string} lovDependsOn Parent cascading LOV parent facet name. When the parent changes, new values are requested from the server.
             * @prop {boolean} lovDependsOnRequired If true the lovDependsOn parent must have a value for this facet to have any values.
             *   This only applies when lovDependsOn is specified.
             * @prop {object[]} values Same as for list type.
             * @prop {string} nullLabel This is the label for the first option, which used to unselect all others.
             *   It represents no facet value selected. This is not the same as the List of Values: Include Null Option.
             *   Required.
             */
            // This option makes only sense in combination with the server so we don't want to document it
            // @prop {string} lovValuesOptimizationSort If has value (asc or desc) then the values array is empty when initialized and the values
            //       should be taken from the fetch counts request response.
            // todo Icon not currently supported in values for selectList.
            /**
             * @typedef facetsRegion.checkboxControl
             * @type object
             * @desc
             * Checkbox specific options
             *   Note the checkbox type can only be in a group. This means it must follow a group control or be in
             *     the facets array of a group item. It is different from other facet controls in that it does not
             *     form its own group. The label is the label of the checkbox. So some of the common control properties
             *     such as collapsible and maxHeight don't apply and are simply ignored. Some properties take their
             *     value from the group the checkbox is in.
             * @prop {string} value Control return value when checked
             * @prop {string} icon Icon CSS class
             * @prop {boolean} escape If false allows markup in the label. Otherwise markup is escaped.
             * @prop {string} altLabel {string} label to use in currentFacets and charts. Useful when the label contains markup.
             */
            // todo in the future the checkbox may not need to be in a group.
            /**
             * @typedef facetsRegion.inputControl
             * @type object
             * @desc
             * Input specific options
             * @prop {string} dataType The datatype of the value to enter and the facet value to compare with.
             *   The comparison operator is controlled by the server. One of "NUMBER", "VARCHAR2", "DATE", "TIMESTAMP", "TIMESTAMP WITH TIME ZONE", "TIMESTAMP WITH LOCAL TIME ZONE"
             * @prop {string} formatMask Format Mask of the input when facet is based on dataType "DATE", "TIMESTAMP", "TIMESTAMP WITH TIME ZONE", "TIMESTAMP WITH LOCAL TIME ZONE"
             * @prop {string} inputLabel Label to show before the input.
             * @prop {string} suffixText {string} Text to show after the input.
             * @prop {string} currentLabel {string} Label used for the current facets area. Example: "Within %0 miles"
             *   When dataType is "NUMBER":
             * @prop {number} min Minimum value user is allowed to enter
             * @prop {number} max Maximum value user is allowed to enter
             * @prop {number} step Number input step increment
             */

            /*
             * TODO consider documenting these controls and control properties
             * Star Rating specific options
             *   values {array} same as for list. Icon and group should not be used. Label (l) is not needed.
             *   showCounts {boolean} Default true. Only applicable if hasFeedback is true.
             *   hideEmpty {boolean} if true values with 0 count are hidden if false values with 0 count are visually "disabled"
             *   hideRadioButton {boolean} Uses bold label rather than radio button to indicate selected item
             *   listClasses {string} extra classes to add to the list grouping element
             *   activeIcon {string} CSS class to use for the "star" icon.
             *   inactiveIcon {string} CSS class to use for the placeholder icons. If not given icon is used. Only applies
             *       if inactiveColor is not null.
             *   activeColor {string} "star" icon color. Defaults to "red".
             *   inactiveColor {string} Color of placeholder icon if any after the number of stars. If null there are no placeholders. Default null.
             *   suffixText {string} Text to show after the icons. Example " and up"
             *   maxSuffixText {string} Text to show after the icons for the largest value. Example "".
             *       If not specified the suffixText is used.
             *   itemLabel {string} Label used for accessibility and in the current facets area. Example: "%0 stars and up"
             *   maxItemLabel {string} Label used for largest value for accessibility and in the current facets area.
             *       Example: "%0 stars". If not specified the itemLabel is used.
             * Group specific options
             *   Note the name does not specify an item/session state name. The group control type is special in
             *     that it is not a facet but just a way to group checkbox controls.  All the controls in this
             *     group are in the facets array or follow this control until there is a control that can't be in a group.
             *     When the widget is rendered the controls are flattened; the controls in the facets array are moved
             *     into the controls array right after the group control.
             *   facets {array} an array of facets that belong to this group. Currently all the facets must be of
             *     type checkbox. The facets array is optional. Checkbox controls can also follow the group control.
             */

            /**
             * An array of facet control objects. Required. The controls are set according to the region
             * facet or filter configuration.
             *
             * @memberof facetsRegion
             * @instance
             * @type {facetsRegion.control[]}
             */
            controls: [],

            /**
             * <p>Object containing translatable strings. All required.</p>
             *
             * @memberof facetsRegion
             * @instance
             * @type {object}
             * @prop {string} searchLabel Accessible label for the search input field or search button.
             *   Only used when {@link facetsRegion#searchField} is true.
             * @prop {string} searchPlaceholder Placeholder text for the search input field.
             *   Only used when {@link facetsRegion#searchField} is true.
             * @prop {string} totalCountLabel Label to show before the total results count. Only used when {@link facetsRegion#showTotalCount} is true.
             * @exampleGetter
             */
            text: {
                // searchLabel: "Search",
                // searchPlaceholder: "Search",
                // totalCountLabel: "Total Results",
            },
            //
            // events:
            //
            /**
             * <p>Triggered when one or more facet control values have changed. It has no additional data.
             * This is the same as the Dynamic Action events: Facets Change [Faceted Search] and
             * Filters Change [Smart Filters].</p>
             * @event change
             * @memberof facetsRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @example <caption>The report region associated with the Smart Filter or Faceted Search region will
             * automatically refresh when facet values change but if you have other regions on the page that
             * also need to refresh listen for this event. The following will refresh region "extraReport" when
             * facet values change.</caption>
             * apex.region( "myRegionId" ).on( "facetschange", function( event ) {
             *     apex.region( "extraReport" ).refresh();
             * } );
             */
            change: null,
            /**
             * <p>Triggered just before a new chart is added to the charts dashboard area.
             * This is the same as the Dynamic Action event: Before Add Chart [Faceted Search].</p>
             * @event beforeAddChart
             * @memberof facetsRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data
             * @property {number} data.count Number of active charts after this one is added.
             * @property {string} data.chartName The name of the chart. It is the same as the facet item.
             * @property {Element} data.chart The chart Element added. This is the wrapping element that contains
             *   the title, buttons, and chart.
             * @example <caption>In this example charts are shown in a collapsible dashboard region. When the
             * first chart is added the collapsible region needs to be expanded.</caption>
             * apex.region( "myRegionId" ).on( "facetsbeforeaddchart", function( event, data ) {
             *     if ( data.count === 1 ) {
             *         apex.theme.openRegion( "myDashboardRegionId" );
             *     }
             * } );
             */
            beforeAddChart: null,
            /**
             * <p>Triggered just after a chart is removed from the charts dashboard area.
             * This is the same as the Dynamic Action event: After Remove Chart [Faceted Search].</p>
             * @event afterRemoveChart
             * @memberof facetsRegion
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data
             * @property {number} data.count Number of active charts now that this one is removed.
             * @property {string} data.chartName The name of the chart. It is the same as the facet item.
             * @example <caption>In this example charts are shown in a collapsible dashboard region. When the
             * last chart is removed the collapsible region needs to be collapsed.</caption>
             * apex.region( "myRegionId" ).on( "facetsafterremovechart", function( event, data ) {
             *     if ( data.count === 0 ) {
             *         apex.theme.closeRegion( "myDashboardRegionId" );
             *     }
             * } );
             */
            afterRemoveChart: null,
            /**
             * Internal communication from server to client for items that need to be submitted for the counts computation query
             * @ignore
             * @memberof facetsRegion
             * @instance
             * @type {string}
             * @default null
             */
            filteredRegionItemsToSubmit: null
        },

        // ------
        // Internal lifecycle methods
        //
        _create: function () {
            let control,
                state,
                initialCharts = [],
                o = this.options,
                ctrl$ = this.element;

            debug.info( `Facets '${ctrl$[0].id}' created. Options: `, o );

            ctrl$.addClass( C_FS );

            this._super();

            if ( !o.feedback ) {
                // if there is no feedback then will never call the server to get counts so will never get the total count
                o.showTotalCount = false;
            }

            if ( o.uiMode === "S" ) {
                ctrl$.addClass( C_FS_SMART );
                // force some defaults for this uiMode
                o.currentFacets = false;
                o.searchField = true;
                o.multipleSearches = true;
                if ( o.maxChips <= 0 ) {
                    o.moreFiltersChip = false;
                }
                o.externalApply = o.batch;

                const onResize = () => {
                    this.isMobile = false;
                    // todo use a css variable for the mobile breakpoint
                    if ( !apex.theme.mq( "(min-width: 640px)" ) ) {
                        this.isMobile = true;
                    }

                    if ( this._isSearchBarCollapsible() ) {
                        ctrl$.addClass( C_FS_COLLAPSIBLE + " " + C_COLLAPSED ); // start collapsed it will expand if needed
                    }
                    this._checkSearchBarCollapse();
                };

                $( window ).on( "apexwindowresized", onResize );
                onResize();
            } else {
                ctrl$.addClass( C_FS_FACETS );
            }

            this.lockCount = 0;
            this.totalResourceCount = null;
            this.facetValueCounts = null;
            this.hiddenControls = [];
            this.filterDialogControls = [];
            this.moreFiltersPopup$ = null; // same member used for different popups depending on uiMode see openConfig and _openMoreFilters
            this.filterDialogPopup$ = null; // same member used for different popups depending on uiMode see openFilterDialog
            this.facetUIPopup$ = null;
            this.searchBarCollapseTimer = null;

            // uiMode specific handlers;
            this._on( o.uiMode === "S" ? this._eventHandlersS : this._eventHandlersF );

            this.idPrefix = ctrl$[0].id;
            if ( !this.idPrefix ) {
                this.idPrefix = "afc_" + gFacetsRegionCount;
                gFacetsRegionCount += 1;
            }
            this.searchId = null; // id of the search input field or null if there is none. This can be the
               // the internal search field input of either uiMode or an external search field item.
            this.searchButtonId = null;
            this.pendingChange = false;
            // used in batch mode so the apply button is only shown when the value has changed
            this.currentValues = {}; // map control.name => control value
            this.facetValuesNeeded = [];
            this.facetCountsNeeded = [];
            this.facetCollapsedState = {};
            // charts
            this.currentCharts = [];
            this.chartConfig = {};
            this.chartDashboard$ = this.chartsPopup$ = this.chartWidget = null; // chartsPopup$ could be a popup or dialog widget
            this.chartsLoaded = false;
            // client-side filtering config
            this.clientFilteringConfig = {};

            // Detect changes to facet items and reflect in facet control UI
            // There really should be at least one control and all controls have a hidden item input
            // all the facet items are together under one element
            if ( o.controls.length > 0 ) {
                this.itemsContainer$ = $( "#" + o.controls[0].name ).parent();
                this.itemsContainer$.on( EVENT_CHANGE + EVENT_NS, ( event, data ) => {
                    let target$;

                    if ( !data || !data.internal ) {
                        target$ = $( event.target );
                        if ( target$.prop( A_ID ) === o.searchItem ) {
                            if ( o.uiMode === "F" ) {
                                if ( o.multipleSearches ) {
                                    // the UI is updated after report/counts refreshed
                                    this._changed();
                                } else {
                                    this._initSearch();
                                    this._doSearch();
                                }
                            } else {
                                // smart filter mode
                                this._setSearchTerms();
                                this._changed();
                            }
                        } else {
                            this._setFCValue( target$ );
                        }
                    }
                } );
            }
            this.currentFacetsArea$ = this.currentFacets$ = this.totalCount$ = null;

            // remember the displayed, initialCollapsed and initialChart settings
            for ( let i = 0; i < o.controls.length; i++ ) {
                control = o.controls[i];
                if ( control.collapsible && control.initialCollapsed !== undefined ) {
                    control._origCollapsed = control.initialCollapsed;
                }
                if ( control.initialChart !== undefined ) {
                    if ( control.initialChart ) {
                        initialCharts.push( control.name );
                    }
                    control._origChart = control.initialChart;
                }
            }

            this.sessionStore = apex.storage.getScopedSessionStorage( {
                prefix: "ORA_WWV_apex.facets",
                usePageId: true,
                regionId: o.regionStaticId
            } );
            if ( o.persistState ) {
                let facetName, controlImpl, facetFilterEnabled,
                    store = this.sessionStore;

                // fetch initial collapsible facet collapsed state from session storage
                if ( o.initState !== "reset" ) {
                    try {
                        this.facetCollapsedState = JSON.parse( store.getItem( STATE_KEY ) );
                        initialCharts = JSON.parse( store.getItem( OPEN_CHARTS_KEY ) ) || initialCharts;
                        this.chartConfig = JSON.parse( store.getItem( CHART_CONFIG_KEY ) );
                        this.clientFilteringConfig = JSON.parse( store.getItem( FILTERED_FACETS_KEY ) );
                    } catch ( err ) {
                        debug.warn( "Failed to restore facets state from session", err );
                        this.facetCollapsedState = this.chartConfig = initialCharts = null;
                    }
                } else {
                    this._clearSessionState();
                }
                if ( !$.isPlainObject( this.facetCollapsedState ) ) {
                    this.facetCollapsedState = {};
                }
                if ( !Array.isArray( initialCharts ) ) {
                    initialCharts = [];
                }
                if ( !$.isPlainObject( this.chartConfig ) ) {
                    this.chartConfig = {};
                    // todo more validations?
                }
                if ( !$.isPlainObject( this.clientFilteringConfig ) ) {
                    this.clientFilteringConfig = {};
                }

                // restore initial displayed, collapsed state and initial show chart state
                for ( let i = 0; i < o.controls.length; i++ ) {
                    control = o.controls[i];
                    facetName = control.name;
                    state = this.facetCollapsedState[ facetName ];
                    controlImpl = gControlTypes[ control.type ];
                    facetFilterEnabled = this.clientFilteringConfig[ control.name ];

                    if ( control.collapsible && ( state === 1 || state === 0 ) ) {
                        // override the initialCollapsed setting
                        control.initialCollapsed = state !== 1;
                    }
                    if ( typeof o.showCharts === TYPE_STRING ) {
                        // Note chart order in dashboard is lost. It is a non-requirement to control the order of
                        // initial charts shown in the dashboard (they are in the same order as the facet controls)
                        // todo consider if the user changes the order by remove/add should it be preserved in session state
                        control.initialChart = initialCharts.includes( facetName );
                    }
                    // Value on session storage will be used only if the attribute actionsFilter is true
                    if ( controlImpl.hasFilter( control ) && typeof facetFilterEnabled  !== "undefined" && hasFilter( control ) ) {
                        control.filterValues = facetFilterEnabled;
                    }
                }
            }

            // Setup the handler for when visibility changes, in the case of a show we refresh or fetchCounts as needed.
            widget.util.onVisibilityChange( ctrl$[0],  pShow => {
                if ( pShow ) {
                    if ( this.pendingRefresh ) {
                        this.refreshView();
                        this.fetchCounts();
                    } else if ( this.pendingFetch ) {
                        this.fetchCounts();
                    }
                }
            } );

            apex.region.create( o.regionStaticId, function( baseRegion ) {
                /**
                 * <p>The facetsRegion type is "Facets".</p>
                 * @member type
                 * @memberOf facetsRegion.prototype
                 * @type {string}
                 */
                baseRegion.type = REGION_TYPE;
                baseRegion.widgetName = WIDGET_NAME;
                baseRegion.widget = function() {
                    return ctrl$;
                };
                widget.util.makeInterfaceFromWidget( baseRegion, ctrl$, "facets", ["openConfig"],
                    ["initState", "ajaxIdentifier", "regionStaticId"] );
            } );

            // register Template for validation errors
            let validationErrorTemplate = {};

            gErrorPlaceholderTemplateId = `${ o.regionStaticId }_ET`;
            validationErrorTemplate[ gErrorPlaceholderTemplateId ] = "#ERROR_MESSAGE#";
            message.registerTemplates( validationErrorTemplate );

            this.refreshView();

            if ( o.disabled ) {
                this._setOption( A_DISABLED, o.disabled );
            }
            this.fetchCounts();

            if ( o.showCharts ) {
                // only load JET Chart libraries if showCharts is true
                // currently Faceted Search always makes require/JET available on the page and Smart Filters does not
                this._loadCharts();
            }
        },

        _eventHandlersS: {
            "click .js-expandSearchBar": function( event ) {
                // expand search bar and focus the search input field
                this.element.removeClass( C_COLLAPSED );
                let input$ = this.element.find( ".a-FS-searchBar input" );

                event = event.originalEvent || event;
                input$.trigger( EVENT_FOCUS );
                // event.detail used to distinguish click due to keyboard or mouse
                // Note found while NVDA is running detail was 1 even for keyboard events
                if ( event.detail > 0 ) {
                    // if click from mouse then expand the search drop down
                    input$.mousedown(); // todo maybe an explicit comboSelect API to expand
                }
            },
            focusin: function() {
                // focusin and focusout is just to detect when leaving the search bar control so can collapse if needed
                if ( this.searchBarCollapseTimer ) {
                    clearTimeout( this.searchBarCollapseTimer );
                    this.searchBarCollapseTimer = null;
                }
            },
            focusout: function() {
                if ( this._isSearchBarCollapsible() && !this.searchBarCollapseTimer ) {
                    this.searchBarCollapseTimer = setTimeout( () => {
                        this._checkSearchBarCollapse();
                    }, 10 );
                }
            }
        },

        _eventHandlersF: {
            // todo think this is facet control specific
            // Keep this handler in sync with _renderFilterDialog function
            "click .js-toggleOverflow": function( event ) {
                toggleListOverflow( this, event.target );
            },
            // todo think this is facet control specific
            // Keep this handler in sync with _renderFilterDialog function
            "filterablefilter": function( event ) {
                let el$ = $( event.target ).closest( ".a-FS-control" ),
                    button$ = el$.find( ".js-toggleOverflow" ),
                    control = this._getControl( button$ );

                if ( button$.length ) {
                    this._updateDisplayedItems( button$ );
                    listSetTabTarget( el$, control );
                }
            },
            "click .js-clear": function( event ) {
                this._clear( this._getControl( $( event.target ) ) );
                this._changed();
            },
            "click .js-apply": function() {
                this.apply();
            },
            "click .js-openConfig": function() {
                this.openConfig();
            },
            "click .js-openFilterDialog": function( pEvent ) {
                // show select list anyway
                this.filterDialogPopup$.find( SEL_FACET_SELECTION ).parent().show();
                // update the option of the facet select list
                this._renderFilterDialogFacetSelectOptions();
                $( pEvent.currentTarget ).prop( A_DISABLED, true );
                this.filterDialogPopup$
                    .popup( "option", "parentElement", pEvent.currentTarget )
                    .popup( "option", A_TITLE, getFRMessage( MSG_FILTER ) )
                    .popup( "option", "relativePosition", $( pEvent.currentTarget ).hasClass( "a-Button--stretch" ) ? "after" : "below" )
                    .popup( "open" );
            },
            "click .js-addChart": function( event ) {
                let name,
                    btn$ = $( event.target ),
                    control = this._getControl( btn$ );

                // its possible to click this before JET has loaded so do nothing if not loaded to avoid other errors.
                if ( control && this.chartsLoaded ) {
                    name = control.name;
                    if ( this.currentCharts.includes( name ) ) {
                        // just focus
                        chartForFacet( name ).trigger( EVENT_FOCUS );
                    } else {
                        this._addChart( control, btn$.parent() );
                        this._updateCharts();
                    }
                }
            },
            "click .a-FS-search .js-clearInput": function () {
                let displayedItem$ = $( this.searchId ),
                    searchItemId = '#' + util.escapeCSS( this.options.searchItem );

                // Clear the displayed search item
                displayedItem$.val( '' );

                // Triggers a filter search update only if a search term has been applied before
                if ( $( searchItemId ).val() ) {
                    this._doSearch();
                }
                displayedItem$.trigger( EVENT_FOCUS );
            },
            keydown: function( event ) {
                let type, target$, next$,
                    o = this.options,
                    kc = event.which;

                // In batch mode want enter key to apply changes when focus in the body of the facet control
                if ( o.batch && !o.externalApply && kc === KEYS.ENTER ) {
                    type = event.target.type;
                    // todo think this is facet control specific
                    if ( type === "radio" || type === "checkbox" ) {
                        event.preventDefault();
                        this.apply();
                    }
                } else {
                    // when focus is in the facet control header up and down move to the prev/next facet control header
                    target$ = $( event.target ).closest( SEL_FS_HEADER );
                    if ( target$[0] ) {
                        if ( kc === KEYS.UP || kc === KEYS.DOWN ) {
                            next$ = target$.parent()[kc === KEYS.UP ? "prevAll" : "nextAll"]().filter( SEL_VISIBLE ).first()
                                .find( SEL_FS_HEADER + " " + SEL_TABBABLE ).first();
                            if ( next$[0] ) {
                                next$.trigger( EVENT_FOCUS );
                                event.preventDefault();
                            }
                        }
                    }
                }
            },
            collapsibleexpand: function( event ) {
                if ( !gIgnoreCollapsible && this.options.persistState ) {
                    this._updateCollapsedState( this._getControl( $( event.target ) ), true );
                }
            },
            collapsiblecollapse: function( event ) {
                if ( !gIgnoreCollapsible && this.options.persistState ) {
                    this._updateCollapsedState( this._getControl( $( event.target ) ), false );
                }
            }
        },

        _destroy: function() {
            let ctrl$ = this.element,
                o = this.options;

            this._cleanupHandlers();
            this._cleanupCharts();
            if ( this.itemsContainer$ ) {
                this.itemsContainer$.off( EVENT_CHANGE + EVENT_NS );
            }
            ctrl$.removeClass( [C_FS, C_DISABLED, C_FS_FACETS, C_FS_SMART, C_FS_COLLAPSIBLE, C_COLLAPSED].join( " " ) )
                .empty();
            if ( typeof o.currentFacets === TYPE_STRING && this.currentFacetsArea$ ) {
                this.currentFacetsArea$.removeClass( C_FS_CURRENT + " " + C_DISABLED ).empty();
            }
            if ( typeof o.showTotalCount === TYPE_STRING && this.totalCount$ ) {
                this.totalCount$.empty();
            }
            if ( this.moreFiltersPopup$ ) {
                this.moreFiltersPopup$.parent().remove();
            }
            if ( this.filterDialogPopup$?.length ) {
                this.filterDialogPopup$.parent().remove();
            }
            if ( this.facetUIPopup$ ) {
                this.facetUIPopup$.parent().remove();
            }
        },

        _setOption: function ( key, value ) {
            let ctrl$ = this.element,
                o = this.options;

            if ( ["feedback", "currentFacets", "showTotalCount", "uiMode", "searchItem"].includes( key ) ) {
                throw new Error( `Facets ${key} cannot be set` );
            }
            // Some options can't be set when uiMode is S or F
            if ( ( o.uiMode === "S" && ["searchField", "multipleSearches", "externalApply"].includes( key ) ) ||
                 ( o.uiMode === "F" && ["collapsibleSearchBar", "moreFiltersChip", "maxChips"].includes( key ) ) ) {
                throw new Error( `Facets ${key} cannot be set for this uiMode` );
            }

            this._super( key, value );

            if ( key === A_DISABLED ) {
                ctrl$.toggleClass( C_DISABLED, value );
                if ( typeof o.currentFacets === TYPE_STRING && this.currentFacetsArea$ ) {
                    this.currentFacetsArea$.toggleClass( C_DISABLED, value );
                }
            } else if ( key === "batch" ) {
                let smartFilters = o.uiMode === "S";

                // init each control batch setting
                for ( let i = 0; i < o.controls.length; i++ ) {
                    o.controls[i]._noCtrlApply = ( o.batch || isFilterDialogFacet( o.controls[i] ) );
                }
                if ( smartFilters ) {
                    o.externalApply = o.batch;
                }
                this.refreshView();
            } else if ( key === "showCharts" ||
                ( ( key === "defaultChartPopup" || key === "defaultChartDialog" ) && this.showCharts === true ) ) {
                if ( key === "showCharts" && value === true && !this.chartsLoaded ) {
                    this._loadCharts();
                }
                this.refreshView();
            } else if ( key === "collapsibleSearchBar" ) {
                ctrl$.toggleClass( C_FS_COLLAPSIBLE + " " + C_COLLAPSED, this._isSearchBarCollapsible() );
                this.refreshView();
            } else if ( ["maxChips", "moreFiltersChip"].includes( key ) ) {
                if ( o.maxChips <= 0 ) {
                    o.moreFiltersChip = false;
                }
                this.refreshView();
            }
        },

        _loadCharts: function() {
            if ( window.require ) {
                require( ["ojs/ojcore", "ojs/ojchart"], () => {
                    if ( !this.chartsLoaded && !this.pendingRefresh ) {
                        this._initCharts();
                    }
                    this.chartsLoaded = true;
                } );
            } else {
                debug.warn( "JET Charts not available, option showCharts ignored." );
            }
        },

        _initFacetControls: function() {
            let groupIndex = null,
                o = this.options,
                displayAs = null,
                smartFilters = o.uiMode === "S",
                checkboxOrder = -1;

            if ( this.moreFiltersPopup$ ) {
                this.moreFiltersPopup$.parent().remove();
                this.moreFiltersPopup$ = null;
            }

            if ( this.filterDialogPopup$?.length ) {
                this.filterDialogPopup$.parent().remove();
                this.filterDialogPopup$ = null;
            }
            // init facet control defaults
            this.filterDialogControls = [];
            this.facetControlItems = [];
            for ( let i = 0; i < o.controls.length; i++ ) {
                let control = o.controls[i];
                // check for unknown control type and remove so don't have to check again
                if ( !gControlTypes[control.type] ) {
                    debug.warn( "Unknown control type removed:", control.type );
                    o.controls.splice( i, 1 );
                    i -= 1;
                    continue;
                }

                // xxx smart filters allows standalone checkboxes
                if ( control.type === FCT_CHECKBOX ) {
                    // checkbox items should always follow a group
                    control._groupIndex = groupIndex;
                    control._groupDisplayAs = displayAs;
                    o.controls[ groupIndex ]._children.push( control.name );
                } else {
                    // first non checkbox ends the group
                    groupIndex = null;
                    displayAs = null;
                }

                // flatten groups
                if ( control.type === FCT_GROUP ) {
                    control._children = [];
                    groupIndex = i;
                    displayAs = control.displayAs;
                    if ( control.facets && control.facets.length > 0 ) {
                        for ( let j = 0; j < control.facets.length; j++ ) {
                            let groupControl = control.facets[j];
                            groupControl.showChart = false;
                            groupControl.showCounts = control.showCounts;
                            o.controls.splice( i + 1 + j, 0, groupControl );
                        }
                        delete control.facets;
                    }
                    checkboxOrder = -1;
                    if ( control.checkedFirst || control.disabledLast || control.orderByCount ) {
                        checkboxOrder = 1;
                    }
                }

                if ( control.type === FCT_CHECKBOX && checkboxOrder > 0 ) {
                    control.order = checkboxOrder;
                    checkboxOrder += 1;
                } else {
                    setValuesOrder( control );
                }

                if ( smartFilters ) {
                    delete control.showAllCount; // show more/all not supported for smart filters
                    delete control.showMoreStepSize;
                    control.clearBtn = false;
                    if ( Array.isArray( control.suggestedValues ) && control.suggestedValues.length === 0 ) {
                        // simplify processing later. An empty array is really the same as no suggested Values.
                        control.suggestedValues = false;
                    }
                } else {
                    // If showAllCount is empty, we assign a value larger than the limit so we always display all options
                    control.showAllCount = control.showAllCount === undefined ? SHOW_ALL_STEP_SIZE : control.showAllCount;
                    // Creates property to keep track of the items being displayed in the filter.
                    control.maxItemsDisplayed = control.showAllCount;

                    // Developer can modify showMoreStepSize to control how the facet grows with the Show All button,
                    // we are using a show all behaviour so we assign to showMoreStepSize a huge number to mimic
                    // showing all the records, in this way we can keep the current code-flow of show more, there is
                    // a limit of facet not being larger than 5000 so any number larger than that should be enough
                    control.showMoreStepSize = control.showMoreStepSize === undefined ? SHOW_ALL_STEP_SIZE : control.showMoreStepSize;
                    control.showAllGrace = control.showAllGrace === undefined ? 1 : control.showAllGrace; // the default
                }

                if ( control.includeLabel === undefined || isFilterDialogFacet( control ) ) {
                    control.includeLabel = true;
                }
                if ( control.hasFeedback === undefined ) {
                    // Expect this to be all or nothing for region either all controls get feedback or none do
                    // but are there some non-list based controls for which no feedback is possible? Any other
                    // reason why this could vary per control?
                    // Need to push this down to the control level to make it easier access by the controls
                    control.hasFeedback = o.feedback;
                }

                if ( isFilterDialogFacet( control ) && !control._groupDisplayAs ) {
                    this.filterDialogControls.push( control.name );
                }

                if ( control.showCounts === undefined && control.hasFeedback ) {
                    control.showCounts = true;
                }
                if ( !control.hasFeedback ) {
                    // if no feedback then force showCounts to false to avoid having to check both properties elsewhere
                    control.showCounts = false;
                }
                if ( control.showChart === undefined && control.showCounts ) {
                    control.showChart = o.showCharts !== false;
                }
                if ( control.clearBtn  === undefined )  {
                    control.clearBtn = true; // the default
                }
                // Controls need to know if they should render a control specific apply button (e.g. Go)
                // For smart filters never do that otherwise only if not in batch mode.
                control._noCtrlApply = smartFilters ? true : ( o.batch || isFilterDialogFacet( control ) );
                control._complete = smartFilters; // for smart filters, controls with input should not set the value until it is complete
                if ( control.type !== FCT_GROUP ) { // groups are not control items
                    this.facetControlItems.push( control.name );
                }
                // make sure lovValuesOptimizationSort is only on controls that support it
                // this is important because of the special handling it does processing values and counts in _updateControls (see bug 33104296)
                if ( !["list", "rangeList", "selectList"].includes( control.type ) ) {
                    delete control.lovValuesOptimizationSort;
                }

                // cleanup watch handlers if any
                if ( control._watchId && control.visibleCondition ) {
                    util.unwatchCondition( control.visibleCondition, control._watchId );
                }
                // cleanup depends on handlers if any
                if ( control.lovDependsOn ) {
                    $( "#" + util.escapeCSS( control.lovDependsOn ) ).off( EVENT_CHANGE + ".fsDependsOn" + i );
                }
            }

            if ( o.searchField !== false ) {
                if ( o.searchItem ) {
                    this.facetControlItems.push( o.searchItem );
                } else {
                    throw new Error( `Option searchItem required when searchField is not false` );
                }
            }
        },

        _cleanupHandlers: function() {
            if ( this.searchId ) {
                $( this.searchId ).off( EVENT_NS );
            }
            this.searchId = null;
            if ( this.searchButtonId ) {
                $( this.searchButtonId ).off( EVENT_NS );
            }
            this.searchButtonId = null;
            if ( this.currentFacetsArea$ ) {
                this.currentFacetsArea$.off( EVENT_NS );
            }
        },

        _cleanupCharts: function() {
            this.currentCharts = [];
            if ( this.chartDashboard$ ) {
                this.chartDashboard$.remove();
            }
            if ( this.chartsPopup$ ) {
                this.chartsPopup$.remove();
            }
        },

        // ------
        // Public methods
        //

        /**
         * <p>Renders and initializes the facets UI.</p>
         *
         * @example <caption>This example refreshes the view.</caption>
         * apex.region( "regionId" ).refreshView();
         */
        refreshView: function() {
            let setValue = this._makeSetValueFn(),
                ctrl$ = this.element,
                o = this.options;

            const isSmartFilter = o.uiMode === "S";

            let watchVisible = control => {
                let depControl,
                    cond = control.visibleCondition,
                    cIndex = getControlIndex( o.controls, cond.item ); // the control being watched

                if ( cIndex >= 0 ) {
                    depControl = o.controls[cIndex];
                }
                control._watchId = util.watchCondition( cond, {
                    doSubstitution: true,
                    multiValued: depControl && depControl.multiple
                },  visible => {
                    this._toggleVisibility( control.name, visible, true );
                } );
            };

            let watchDepends = ( control, index, controlImpl, controlEl$ ) => {
                let fcIdPrefix = this.idPrefix + "_" + index,
                    el$ = $( "#" + util.escapeCSS( control.lovDependsOn ) );

                el$.on( EVENT_CHANGE + ".fsDependsOn" + index, () => {
                    let value = el$.val();
                    if ( value === "" && control.lovDependsOnRequired ) {
                        // when the value is empty and the depends on is required we can assume there are no values and avoid asking the server
                        control.values = [];
                        // need to update because the values have changed
                        this._updateControlValues( control, controlImpl, controlEl$, fcIdPrefix, fcIdPrefix + "_lbl" );
                    } else {
                        // need to ask the server for the values in the next request.
                        this.facetValuesNeeded.push( control.name );
                    }
                }  );
            };

            if ( notVisible( this.element, o.currentFacets ) ) {
                this.pendingRefresh = true;
                return;
            } // else

            this.pendingRefresh = false;
            this._initFacetControls();
            this._cleanupHandlers();
            this._cleanupCharts();
            this._render();

            this.currentFacetsArea$ = null;
            if ( o.currentFacets ) {
                if ( o.currentFacets === true ) {
                    this.currentFacetsArea$ = ctrl$.find( "." + C_FS_CURRENT );
                } else {
                    this.currentFacetsArea$ = $( o.currentFacets ).first();
                    this.currentFacetsArea$.addClass( C_FS_CURRENT ).html( CUR_ITEMS_UL );
                }
                this.currentFacets$ = this.currentFacetsArea$.children( "ul" ).first();
                if ( o.showTotalCount === true ) {
                    this.currentFacetsArea$.prepend( renderTotalCountArea( o.text.totalCountLabel,  o.regionStaticId ) );
                    this.totalCount$ = this.currentFacetsArea$.find( "." + C_FS_TOTAL );
                }

                // handle clearing
                this.currentFacetsArea$.on( EVENT_CLICK + EVENT_NS, "button.a-FS-clear, button.a-FS-clearAll", event => {
                    let control, curValues, curValue,
                        target$ = $( event.target ).closest( "button" ),
                        cIndex = toInteger( target$.attr( D_FC ) ),
                        value = target$.attr( D_VALUE ), // use attr because want value as a string always
                        begin = target$.attr( "data-begin" ),
                        end = target$.attr( "data-end" );

                    if ( cIndex >= 0 && value !== "" ) {
                        control = o.controls[cIndex];
                        curValues = stringToValue( getFacetItemValue( control, true ) );

                        // search for and remove the value to be cleared
                        for ( let i = 0 ; i < curValues.length; i++ ) {
                            curValue = curValues[i];
                            if ( value === curValue || ( typeof curValue === TYPE_OBJECT && begin === curValue.b && end === curValue.e ) ) {
                                curValues.splice( i, 1 );
                                break;
                            }
                        }
                        curValues = valueToString( curValues );
                        if ( control.type === FCT_INPUT && control.flexibleOperator ) { // add : to inform server that operator is given
                            curValues = curValues ? `${ curValues }:` : "";
                        }
                        setFacetItemValue( control, curValues );
                        this._setFCValueByIndex( cIndex, curValues );
                        this._changed();
                    } else if ( cIndex < 0 && o.multipleSearches ) {
                        // the value is a search term to remove
                        this._removeSearchTerm( value );
                    } else {
                        this._clearAll( o.multipleSearches ); // if multiple searches then want to clear search term as well
                    }
                }  );
            }
            if ( typeof o.showTotalCount === TYPE_STRING ) {
                this.totalCount$ = $( o.showTotalCount ).first();
            } else if ( o.currentFacets === false && o.showTotalCount === true ) { // explicit tests for false, true are necessary
                this.totalCount$ = ctrl$.find( "." + C_FS_TOTAL );
            }

            if ( isSmartFilter ) {
                this._initSmartFilterMode();
            } else {
                this._initFacetedSearchMode();
            }

            // for each control init and setValue, etc.
            for ( let i = 0; i < o.controls.length; i++ ) {
                let controlImpl, controlEl$, strValue, value,
                    control = o.controls[i],
                    facetId = this.idPrefix + "_" + i;

                if ( control.type === FCT_GROUP ) {
                    continue;
                }
                strValue = getFacetItemValue( control, true );
                value = stringToValue( strValue );
                this._setValue( control, i, value, strValue );
                controlImpl = gControlTypes[control.type];
                controlEl$ = this._getControlElementByIndex( control, i );
                controlImpl.init( controlEl$, control, setValue, isSmartFilter );
                controlImpl.setValue( controlEl$, control, value, isSmartFilter );
                if ( controlImpl.hasFilter( control ) ) {
                    this._initFilterable( controlEl$, control, facetId );
                }
                if ( o.uiMode === "F" ) {
                    this._initFacetMenu( controlEl$, control, facetId );
                }
                if ( control.visibleCondition ) {
                    watchVisible( control );
                }
                if ( control.values && control.lovDependsOn ) {
                    watchDepends( control, i, controlImpl, controlEl$ );
                    if ( control.values.length === 0 ) {
                        // a facet with no values should be hidden
                        this._toggleVisibility( control.name, false );
                    }
                }
            }

            // update the UI to reflect any initial search terms
            if ( o.uiMode === "F" ) {
                if ( !o.multipleSearches ) {
                    this._initSearch();
                }
            } else {
                // smart filter mode
                this._setSearchTerms();
            }

            if ( this.facetValueCounts ) {
                // update with last available counts
                this._updateControls( {counts: this.facetValueCounts}, true );
            }

            if ( this.chartsLoaded ) {
                this._initCharts();
            }
        },

        /**
         * <p>Clears all filters and search terms and resets any persistent settings to their original configured values.</p>
         *
         * @example <caption>This example resets the region.</caption>
         * apex.region( "regionId" ).refreshView();
         */
        reset: function() {
            this._reset();
            this._clearAll( true );
        },

        /**
         * <p>This is a convenience method that simply calls the {@link facetsRegion#fetchCounts} method.</p>
         */
        refresh: function() {
            this.fetchCounts();
        },

        /**
         * <p>Refreshes the counts for all the facets. This is useful if the report is also filtered by controls, such
         * as page items, that are external to the facets region and those external control values have changed.</p>
         * <p>See also {@link facetsRegion#refresh}.</p>
         * @example <caption>In this example there is an input element with id <em>P1_EXTERNAL_FILTER</em> and when
         * it changes the report is refreshed so the facet counts must also be refreshed.</caption>
         * $("#P1_EXTERNAL_FILTER").on( "change", function() {
         *     apex.region( "regionId" ).fetchCounts();
         * } );
         */
        fetchCounts: function() {
            let o = this.options;

            if ( !o.disabled ) {
                if ( notVisible( this.element, o.currentFacets ) ) {
                    this.pendingFetch = true;
                } else {
                    this.pendingFetch = false;
                    this._fetchCounts();
                }
            }
        },

        /**
         * <p>Returns the number of facets that have a non-empty value. This is useful when the
         * facet UI is not always visible (for example it is in a collapsible or dialog region)
         * and you wish to display how many filters are applied.</p>
         *
         * @param {boolean} pIncludeSearchTerms If true the search terms are included in the count.
         * @returns {number}
         */
        getFacetCount: function( pIncludeSearchTerms ) {
            let i, control,
                o = this.options,
                controls = o.controls,
                count = 0;

            // todo think in batch mode these facets have not yet been applied
            // count the facets that have a non-empty value
            for ( i = 0; i < controls.length; i++ ) {
                control = controls[i];
                if ( control.type !== FCT_GROUP && !isEmptyFacet( control ) ) {
                    count += 1;
                }
            }
            if ( pIncludeSearchTerms && o.searchItem ) {
                if ( $v( o.searchItem ).trim() ) {
                    count += 1;
                }
            }
            return count;
        },

        /**
         * <p>Clear all the current (applied) facet values and any search terms.</p>
         * <p>See also {@link facetsRegion#clearFacets}.</p>
         * @example <caption>This example clears all the facet and search term values when the button with
         * id <em>CLEAR_BUTTON</em> is pressed.</caption>
         * $("#CLEAR_BUTTON").on( "click", function() {
         *     apex.region( "regionId" ).clear();
         * } );
         */
        clear: function() {
            this._clearAll( true );
        },

        /**
         * <p>Clear all the current (applied) facet values. Search terms if any are not cleared.</p>
         * <p>See also {@link facetsRegion#clear}.</p>
         * @example <caption>This example defines an action that will clear all the facet values when
         * the keyboard shortcut Ctrl+/,X is pressed. The action could also be associated with a menu item
         * and/or button. See also {@link actions#add}.</caption>
         * apex.actions.add( [ {
         *     name: "clear-search",
         *     label: "Clear Filters",
         *     shortcut: "Ctrl+/,X",
         *     action: function() {
         *         apex.region( "regionId" ).clearFacets();
         *     }
         * } ] );
         */
        clearFacets: function() {
            this._clearAll();
        },

        /**
         * <p>Returns the total number of resources (records) in the report. This is the same value
         * displayed by the {@link facetsRegion#showTotalCount} property, except it is not formatted.
         * Returns null if {@link facetsRegion#feedback} property is false.</p>
         *
         * @returns {number}
         * @example <caption>This example logs the number of records in the report to the console.</caption>
         * console.log("Total records is ", apex.region( "regionId" ).getTotalResourceCount() );
         */
        getTotalResourceCount: function() {
            return this.totalResourceCount;
        },

        /**
         * <p>Returns an object structure with all the counts displayed by the facets UI.</p>
         *
         * @returns {object} Facet value counts. The object properties are the facet control names.
         * The value of each property is an object with the facet value as the property and the
         * count as the property value.
         */
        getFacetValueCounts: function() {
            return this.facetValueCounts;
        },

        /**
         * <p>Shows the specified facet.</p>
         * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
         * <p>See also {@link facetsRegion#hideFacet}.</p>
         * @param {string} pFacetName
         * @example <caption>This example shows the facet named "P1_COMM".</caption>
         * apex.region( "myRegionId" ).showFacet( "P1_COMM" );
         */
        showFacet: function( pFacetName ) {
            const controls = this.options.controls;
            let control;

            if ( pFacetName ) {
                control = controls[ getControlIndex( controls, pFacetName ) ];
            }

            if ( !isFilterDialogFacet( control ) ) {
                this._toggleVisibility( pFacetName, true );
            }
        },

        /**
         * <p>Hides the specified facet. Note that hiding a facet does not clear any value(s) that may currently
         * be filtering the report.</p>
         * </p>
         * <p>In faceted search mode ({@link facetsRegion#uiMode} is "F") the facet
         * header and all choices or other selection UI are hidden.
         * </p>
         * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
         * <p>In smart filter mode ({@link facetsRegion#uiMode} is "S") the hidden facet will not show in the
         * suggestion chip area or in the suggestion drop down.</p>
         * <p>
         * <p>See also {@link facetsRegion#showFacet}.</p>
         *
         * @param {string} pFacetName
         * @example <caption>This example hides the facet named "P1_COMM".</caption>
         * apex.region( "myRegionId" ).hideFacet( "P1_COMM" );
         * @example <caption>This example hides the facet named "P1_COMM" and also clears any values it may have.</caption>
         * apex.item( "P1_COMM" ).setValue( "" );
         * apex.region( "myRegionId" ).hideFacet( "P1_COMM" );
         */
        hideFacet: function( pFacetName ) {
            const controls = this.options.controls;
            let control;

            if ( pFacetName ) {
                control = controls[ getControlIndex( controls, pFacetName ) ];
            }

            if ( !isFilterDialogFacet( control ) ) {
                this._toggleVisibility( pFacetName, false );
            }
        },

        /**
         * <p>Focus the first tabbable element. In faceted search mode ({@link facetsRegion#uiMode} is "F")
         * the search input field is focused if {@link facetsRegion#searchField} is true or the first facet control body
         * otherwise. In smart filter mode ({@link facetsRegion#uiMode} is "S") the search bar search input field
         * or search button is focused.
         * </p>
         * @example <caption>This example puts focus in the Faceted Search or Smart Filters region.</caption>
         * apex.region( "myRegionId" ).focus();
         */
        focus: function() {
            this.element.find( `.a-FS-search,.${C_BODY},.a-FS-searchBarButton,.a-FS-searchBar` )
                .filter( SEL_VISIBLE ).first().find( SEL_TABBABLE ).first().trigger( EVENT_FOCUS );
        },

        /**
         * <p>Apply any outstanding changes to facet values. This method is intended for when
         * both {@link facetsRegion#batch} and {@link facetsRegion#externalApply} are true.</p>
         * @example <caption>In this example the <code class="prettyprint">batch</code> and
         * <code class="prettyprint">externalApply</code> properties are true and the page has
         * a button with id "myApplyButton". The user clicks this button to apply facet choices.</caption>
         * $( "#myApplyButton" ).on( "click", function() {
         *     apex.region( "myRegionId" ).apply();
         * }
         */
        apply: function( pFacetName ) { // don't doc that apply can also work just for one facet at the moment maybe we need an internal apply
            let controls = this.options.controls,
                i,
                changed;

            if ( pFacetName ) {
                let index = getControlIndex( controls, pFacetName );

                controls = [ controls[ index ] ];
            }

            // after batch apply all the current values are updated
            for ( i = 0; i < controls.length; i++ ) {
                const  control = controls[i];
                let value;

                if ( control.type === FCT_GROUP ) {
                    continue;
                }
                value = getFacetItemValue( control, true );
                if ( this.currentValues[control.name] !== value ) {
                    changed = true;
                }
                this.currentValues[control.name] = value;
            }
            if ( changed ) {
                this._changed();
            }
        },

        /**
         * <p>Disables the facets region so that facet values cannot be changed through the UI or API.
         * This is done by the report region associated with this facets region so that multiple requests are not
         * sent to the server at the same time.
         * For every call to {@link facetsRegion#lock} there must be a corresponding call to {@link facetsRegion#unlock}.</p>
         * <p>See {@link facetsRegion#unlock}.</p>
         * @example <caption>This example shows how a report region plug-in would listen for facet value changes and
         * call lock and unlock. </caption>
         * // ajaxIdentifier and facetsStaticId are passed into the report plug-in
         * if ( facetsStaticId ) {
         *     let facetsRegion = apex.region( facetsStaticId );
         *     facetsRegion.widget().on( "facetschange", function() {
         *         facetsRegion.lock();
         *         let p = apex.server.plugin( ajaxIdentifier, ... );
         *         ...
         *         p.always( function() {
         *             facetsRegion.unlock();
         *         } );
         *     } );
         * }
         * @example <caption>This example shows how to set multiple facet item values but only cause the report
         *  and facet counts to be updated once. The region static id is "empFacets" and P2_JOB and P2_MGR are
         *  2 of the facet names.</caption>
         * let facets = apex.region( "empFacets" );
         * facets.lock();
         * $s("P2_JOB", "CLERK");
         * $s("P2_MGR", "7698");
         * facets.unlock(); // only after this will the report and counts be updated
         */
        lock: function() {
            if ( this.lockCount === 0 ) {
                this._setOption( A_DISABLED, true );
            }
            this.lockCount += 1;
        },

        /**
         * <p>Enables the facets region after it was previously disabled with {@link facetsRegion#lock} so
         * that facet values can be changed again. For every call to {@link facetsRegion#lock} there must be a
         * corresponding call to {@link facetsRegion#unlock}.</p>
         * <p>See {@link facetsRegion#lock}.</p>
         * @example <caption>See {@link facetsRegion#lock} for examples.</caption>
         */
        unlock: function() {
            if ( this.lockCount <= 0 ) {
                return; // don't unlock if not locked
            }
            this.lockCount -= 1;
            if ( this.lockCount <= 0 ) {
                this.lockCount = 0;
                this._setOption( A_DISABLED, false );
                if ( this.pendingChange ) {
                    this.pendingChange = false;
                    this._changed();
                }
            }
        },

        /**
         * <p>Add/show a chart for the given facet.</p>
         * <p>This API only works for facets that are displayed inline ({@link facetsRegion#displayAs} is "INLINE").</p>
         * <p>See also {@link facetsRegion#removeChart}.</p>
         *
         * @param {string} pFacetName The facet to add a chart for.
         * @param {jQuery} [pAppendTo$] The element to append the chart to. If not specified then the chart is shown
         *    according to the {@link facetsRegion#showCharts} property.
         *    The {@link facetsRegion#showCharts} option must not be false if <code class="prettyprint">appendTo$</code>
         *    is not specified.
         * @param {object} [pConfig] Optional chart configuration.
         * @param {string} pConfig.type The chart type. One of "bar", "pie".
         * @param {number} pConfig.topN Maximum number of values to show in the chart
         * @example <caption>This example shows a chart for the P1_SAL facet in a non-modal dialog.</caption>
         * apex.region( "myRegionId" ).addChart( "P1_SAL" );
         * @example <caption>This example adds a pie chart for the P1_JOB facet in dashboard area div with id "#chartDashboard".</caption>
         * apex.region( "myRegionId" ).addChart( "P1_JOB", $( "#chartDashboard" ), {type: "pie"});
         */
        addChart: function( pFacetName, pAppendTo$, pConfig ) {
            let control, controls = this.options.controls,
                index = getControlIndex( controls, pFacetName );

            if ( index >= 0 ) {
                control = controls[index];
                if ( control.showCounts &&
                     ( ( pAppendTo$ && pAppendTo$.length ) || this.options.showCharts ) &&
                     !isFilterDialogFacet( control ) ) {
                    if ( this.currentCharts.includes( pFacetName ) ) {
                        // just focus
                        chartForFacet( pFacetName ).trigger( EVENT_FOCUS );
                    } else {
                        this._addChart( control, null, pAppendTo$, pConfig );
                        this._updateCharts();
                    }
                }
            }
        },

        /**
         * <p>Remove the chart for the given facet.</p>
         * <p>See also {@link facetsRegion#addChart}.</p>
         *
         * @param {string} pFacetName The facet name of the chart to remove.
         * @example <caption>This example removes the chart for the P1_SAL facet.</caption>
         * apex.region( "myRegionId" ).removeChart( "P1_SAL" );
         */
        removeChart: function( pFacetName ) {
            this._removeChart( pFacetName );
        },
        /**
         * Hides all facet in the filter dialog popup except the given facet
         *
         * @ignore
         * @param {jQuery} [pFacetName] Facet the should be shown finally
         */
        _toggleFacets: function ( pFacetName ) {
            this._toggleVisibility( pFacetName, true, false, false );
            this.filterDialogControls.forEach( ( controlName ) => {
                if ( controlName !== pFacetName ) {
                    this._toggleVisibility( controlName, false, false, true );
                }
            } );
        },
        /**
         * Enable or disable the filter Dialog Button
         *
         * @ignore
         */
        _enableDisableFilterDialogButton: function() {
            const o = this.options,
                  openFilterButton = this.element.find( `.${ C_JS_OPEN_FILTER_DIALOG }` );
            let disableButton = true;

            if ( o.currentFacets ) {
                this.filterDialogControls.forEach( ( controlName ) => {
                    const control = o.controls[ getControlIndex( o.controls, controlName ) ];
                        if ( isEmptyFacet( control, true ) ) {
                            disableButton = false;
                        }
                } );

                if ( disableButton ) {
                    openFilterButton.prop( A_DISABLED, true );
                } else {
                    openFilterButton.prop( A_DISABLED, false );
                }
            } else {
                openFilterButton.prop( A_DISABLED, false );
            }
        },
        /**
         * Render the option of the facet selection list in the filter dialog
         *
         * @ignore
         */
        _renderFilterDialogFacetSelectOptions: function () {
            const o = this.options,
                  selectItem = item( this.idPrefix + "_fdsi" );
            let data = [];

            // add select list options
            this.filterDialogControls.forEach( ( controlName ) => {
                const control = o.controls[ getControlIndex( o.controls, controlName ) ],
                      label = isEmptyFacet( control, true ) ? control.label : lang.formatMessage( "APEX.FS.FILTER_APPLIED", control.label );

                if ( isEmptyFacet( control, true ) || !o.currentFacets ) {
                    data.push( {
                        "d": label,
                        "r": controlName
                    } );
                }
            } );

            selectItem.choices = { "data": data };
            if (    o.persistState
                 && !o.currentFacets
                 && this.sessionStore.getItem( FILTER_DIALOG_CURRENT_FACET_KEY ) ) {
                selectItem.setValue( this.sessionStore.getItem( FILTER_DIALOG_CURRENT_FACET_KEY ) );
            } else {
                selectItem.setValue( data[0].r );
            }
            this.filterDialogFacet = selectItem.getValue();
            this._toggleFacets( this.filterDialogFacet );
        },
        /**
         * Show filter dialog popup to choose what facets to show or hide
         *
         * @ignore
         */
        _renderFilterDialog: function() {
            const _self = this,
                o = _self.options,
                controls = o.controls,
                cancelButtonClass = "js-cancel",
                clearButtonClass = "js-clear";
            let popup$ = _self.filterDialogPopup$,
                selectList$,
                applyButton$,
                noFacetFilterClear;

            // create popup first time needed
            if ( !popup$ ) {
                let out = util.htmlBuilder();

                out.markup( `<div class="${ C_FILTER_DIALOG_POPUP }">` ); //dialog main div
                out.markup( `<div class="${ C_FC_FACET_SELECTION_WRAP }">` ); //select list wrapper

                // render select one
                out.markup( "<a-select" )
                    .attr( A_ID, _self.idPrefix + "_fdsi" )
                    .attr( "match-type", "contains" )
                    .attr( "min-characters-search", "0" )
                    .attr( "required", true )
                    .attr( A_LABEL, getFRMessage( "INPUT_FACET_SELECTOR" ) );
                out.markup( "></a-select>" );

                out.markup( "</div>" ); //select list wrapper
                out.markup( `<div class="${ C_FS } ${ C_FS }-addFilter-filters"` );
                out.attr( A_ID, _self.idPrefix + "_fdfw" );
                out.markup( "></div>" ); //facet wrapper
                out.markup( `<div class="${ C_FS }-addFilter-actions">` ); //buttons wrapper
                renderButton( out, getFRMessage( "CANCEL" ), cancelButtonClass );
                if ( !o.currentFacets ) {
                    renderButton( out, getFRMessage( "CLEAR" ), clearButtonClass );
                }
                renderButton( out, getFRMessage( "APPLY" ), `t-Button--hot ${ C_CTRL_APPLY }` );
                out.markup( "</div>" ); //buttons wrapper
                out.markup( "</div>" ); //dialog main div
                popup$ = $( out.toString() );
                _self.element.after( popup$ );
                _self.filterDialogPopup$ = popup$;

                popup$.find( `.${ cancelButtonClass }` ).on( EVENT_CLICK, () => {
                    popup$.popup( "close" );
                } );

                if ( !o.currentFacets ) {
                    popup$.find( `.${ clearButtonClass }` ).on( EVENT_CLICK, () => {
                        const control = controls[ getControlIndex( controls, _self.filterDialogFacet ) ];

                        if ( control._children ) {
                            control._children.forEach( ( controlName ) => {
                                const childControl = controls[ getControlIndex( controls, controlName ) ];
                                _self._clear( childControl );
                            } );
                        } else {
                            _self._clear( control );
                        }
                        _self._changed();
                        popup$.popup( "close" );
                    } );
                }

                applyButton$ = popup$.find( `.${ C_CTRL_APPLY }` );
                applyButton$.on( EVENT_CLICK, () => {
                    const control = controls[ getControlIndex( controls, _self.filterDialogFacet ) ];

                    if ( control._children ) {
                        _self.apply();
                    } else {
                        _self.apply( _self.filterDialogFacet );
                    }
                    noFacetFilterClear = true;
                    popup$.popup( "close" );
                } );

                // the popup size can change and, it needs to be calculated again
                function resizePopup() {
                    if ( popup$.length ) {
                        const parent = popup$.parent()[0],
                            parentStyles = parent.getBoundingClientRect(),
                            topParent = parseFloat( parentStyles.top );
                        let newPopupMH;

                        // overwrite template.js setting the height
                        popup$.css( "height", "auto" );
                        newPopupMH = window.innerHeight - topParent - 10;
                        parent.style.maxHeight = newPopupMH + "px";
                    }
                }

                selectList$ = popup$.find( SEL_FACET_SELECTION );
                selectList$.on( EVENT_CHANGE, ( pElement ) => {
                    const currentValue = item( pElement.target ).getValue();

                    if ( currentValue !== "" ) {
                        const control = controls[ getControlIndex( controls, currentValue ) ];

                        _self.filterDialogFacet = currentValue;
                        if ( !o.currentFacets && o.persistState ) {
                            _self.sessionStore.setItem( FILTER_DIALOG_CURRENT_FACET_KEY, currentValue );
                        }

                        if ( o.currentFacets ) {
                            _self._clear( control );
                        }
                        applyButton$.prop( A_DISABLED, false );
                        _self._toggleFacets( currentValue );
                    }
                    queueMicrotask( () => {
                        resizePopup();
                    } );
                } );

                popup$.popup( o.defaultFilterDialogPopup ).on( "keydown", event => {
                    if ( event.which === KEYS.ENTER ) {
                        const control = controls[ getControlIndex( controls, _self.filterDialogFacet ) ];

                        if (    ![ FCT_LIST, FCT_RANGE_LIST, FCT_RADIO ].includes ( control.type )
                             && !$( event.target ).closest( "a-select" ) ) { // not for controls that uses enter
                            event.preventDefault();
                            _self.apply( _self.filterDialogFacet );
                            noFacetFilterClear = true;
                            popup$.popup( "close" );
                        }
                    }
                } )
                .on( "popupclose", () => {
                    const control = controls[ getControlIndex( controls, _self.filterDialogFacet ) ];

                    _self._enableDisableFilterDialogButton();
                    // clear not applied inputs
                    if (    o.currentFacets
                         && !noFacetFilterClear
                         && $( popup$.popup( "option", "parentElement" ) ).hasClass( C_JS_OPEN_FILTER_DIALOG ) ) {
                        _self._clear ( control );
                    }
                    noFacetFilterClear = false;
                } )
                .on ( "popupopen", () => {
                    queueMicrotask( () => {
                        resizePopup();
                    } );
                } )
                .on( EVENT_CLICK, ".js-toggleOverflow", function( event ) {
                    toggleListOverflow( _self, event.target );
                    queueMicrotask( () => {
                        resizePopup();
                    } );
                } )
                .on( EVENT_FILTER, function( event ) {
                    const el$ = $( event.target ).closest( ".a-FS-control" ),
                        button$ = el$.find( ".js-toggleOverflow" ),
                        control = _self._getControl( button$ );

                    if ( button$.length ) {
                        _self._updateDisplayedItems( button$ );
                        listSetTabTarget( el$, control );
                    }
                    queueMicrotask( () => {
                        resizePopup();
                    } );
                } );

                freezeScroll( popup$ );
            }
        },

        // ------
        // Internal methods for Faceted Search mode
        //
        _renderFacetedSearchMode: function() {
            let id, lastGroup, currentFacetsContent,
                o = this.options,
                ctrl$ = this.element,
                text = o.text,
                out = util.htmlBuilder();

            function closeFacetControl( pOut ) {
                pOut.markup( DIV_C + DIV_C ); // close bodyInner and wrap
                if ( o.batch ) {
                    pOut.markup( `<div class='${C_FS_APPLY}' style='display:none;'><button class='a-Button a-Button--hot js-apply' type='button'>` )
                        .content( getFRMessage( "BATCH_APPLY" ) )
                        .markup( "</button></div>" );
                }

                pOut.markup( DIV_C + DIV_C ); // close body and facet control
            }

            if ( hasFilterDialogFacets ( o.controls ) ) {
                this._renderFilterDialog();
            }

            if ( o.searchField === true ) {
                id = this.idPrefix + "_search";
                this.searchId = "#" + id;

                const headerId = id + "_heading";

                // todo want this to be a comboSelect someday
                out.markup( "<div class='a-FS-search' role='region'" )
                    .attr( A_LBLBY, headerId )
                    .markup( ">" );
                renderSearchInput( out, id, text.searchPlaceholder, true, text.searchLabel, true, true, headerId );
                if ( hasFilterDialogFacets ( o.controls ) ) {
                    renderFilterDialogButton( out, true );
                }
                out.markup( '</div>' );
            }

            if ( o.currentFacets === true ) {
                currentFacetsContent = CUR_ITEMS_UL;
            } else if ( o.currentFacets === false && o.showTotalCount === true ) { // explicit tests for false, true are necessary
                // include the current facets wrapping div for proper styling even though it is not a current facets area
                currentFacetsContent = renderTotalCountArea( o.text.totalCountLabel, o.regionStaticId );
            }
            if ( currentFacetsContent ) {
                out.markup( `<div class='${C_FS_CURRENT}'` );

                // When totalCountArea is wrapped inside the current facets div and the current facets are not being displayed
                // the role and aria-label aren't being printed to avoid creating a misleading landmark
                if ( o.currentFacets === true ) {
                    out.attr( A_LABEL, getFRMessage( "CUR_FILTERS_LM" ) )
                        .attr( A_ROLE, "region" );
                }

                out.markup( `>${currentFacetsContent}${DIV_C}` );
            }

            lastGroup = null;
            // render each control
            for ( let i = 0; i < o.controls.length; i++ ) {
                const control = o.controls[i],
                      controlImpl = gControlTypes[control.type],
                      fcIdPrefix = this.idPrefix + "_" + i,
                      hidden = this.hiddenControls.includes( control.name ),
                      label = control.label,
                      filterDialogFacet = isFilterDialogFacet( control ),
                      labelId = filterDialogFacet ? "" : fcIdPrefix + "_lbl";
                let cls,
                    facetOut = util.htmlBuilder(),
                    group = null;

                if ( control.type === FCT_GROUP ) {
                    group = control.name;
                } else if ( control.type === FCT_CHECKBOX && lastGroup ) {
                    group = lastGroup;
                }

                if ( group === null || group !== lastGroup ) {
                    if ( lastGroup ) {
                        renderCloseListGroup( out );
                        // close previous group first
                        closeFacetControl( out );
                    }
                    cls = C_FC + " " + C_JS_CONTROL_ROOT;
                    if ( control.cssClasses ) {
                        cls += " " + control.cssClasses;
                    }
                    if ( control.collapsible ) {
                        cls += " " + C_FC_COLLAPSIBLE;
                    }
                    facetOut.markup( "<div" )
                            .attr( A_CLASS, cls )
                            .attr( D_FC, i )
                            .optionalAttr( "role", filterDialogFacet ? "" : "region" )
                            .optionalAttr( A_LBLBY, labelId )
                            .optionalAttr( "style", hidden ? "display:none;" : "" )
                            .optionalAttr( A_ID, filterDialogFacet ? fcIdPrefix : "" )
                            .markup( ">" );
                    if ( !filterDialogFacet ) {
                        facetOut.markup ( `<div class='${C_FS_HEADER}'` )
                                .attr( A_ID, fcIdPrefix )
                                .markup( ">" );
                        if ( control.collapsible ) {
                            facetOut.markup( "<button class='a-FS-toggle' type='button'" )
                                    .attr( A_LBLBY, labelId )
                                    .markup( "></button>" /* collapsible adds the icon */ );
                        }
                        facetOut.markup( "<h3 class='a-FS-label'" )
                                .attr( A_ID, labelId )
                                .optionalAttr( A_TABINDEX, control.collapsible ? null : "0" )
                                .markup( ">" );
                        if ( control.icon ) {
                            renderIcon( facetOut, control.icon );
                        }
                        facetOut.content( label )
                                .markup( "</h3>" );

                        if ( control.clearBtn ) {
                            facetOut.markup( "<button class='a-FS-clearButton js-clear' type='button'>" )
                                    .content( getFRMessage( "CLEAR" ) )
                                    .markup( "</button>" );
                        }
                        facetOut.markup( "</div>" );
                    }
                    facetOut.markup( `<div class="${C_BODY}"` )
                            .attr( A_ID, fcIdPrefix + "_b" )
                            .markup( ">" );


                    if ( controlImpl.hasFilter( control ) ) {
                        renderValuesFilter( facetOut, fcIdPrefix, control, !filterDialogFacet );
                    }

                    facetOut.markup( `<div class="${C_WRAP + ( control.maxHeight ? " has-max-height" : "" ) }"` )
                            .optionalAttr( "style", control.maxHeight ? ( "max-height:" + control.maxHeight + "px;" ) : null )
                            .markup( `><div class="${C_BODY_INNER}">` );

                    if ( group ) {
                        renderOpenListGroup( facetOut, labelId, true, control, label );
                    }
                    // remember the group if any
                    lastGroup = group;
                }

                // type specific rendering
                controlImpl.render( facetOut, fcIdPrefix, labelId, control, false, label );

                if ( group === null || group !== lastGroup ) {
                    if ( lastGroup ) {
                        renderCloseListGroup( facetOut );
                    }
                    closeFacetControl( facetOut );
                }

                if ( filterDialogFacet ) {
                    const facetsWrapper$ = $( `#${ util.escapeCSS( this.idPrefix + "_fdfw" ) }` );

                    // close any pending group for filter dialog facet
                    if ( lastGroup && i === ( o.controls.length - 1 ) ) {
                        renderCloseListGroup( facetOut );
                        closeFacetControl( facetOut );
                    }

                    if ( lastGroup && control.type === FCT_CHECKBOX && control._groupIndex !== undefined ) {
                        facetsWrapper$.find( `#${ util.escapeCSS( this.idPrefix ) }_${ control._groupIndex } .apex-item-group` ).append( facetOut.toString() );
                    } else {
                        facetsWrapper$.append( facetOut.toString() );
                    }
                } else {
                    out.markup( facetOut.toString() );
                }
            }
            if ( lastGroup ) {
                renderCloseListGroup( out );
                // close any pending group
                closeFacetControl( out );
            }

            if ( !o.searchField && hasFilterDialogFacets ( o.controls ) ) {
                renderFilterDialogButton( out, false, true );
            }

            ctrl$.html( out.toString() );
            if ( hasFilterDialogFacets ( o.controls ) ) {
                this._enableDisableFilterDialogButton();
            }
        },

        _initFacetedSearchMode: function() {
            let o = this.options;

            // initialize facet controls, collapsible behavior
            // todo want the header clickable. consider if should use toggle core
            gIgnoreCollapsible = true;
            this.element.find( "." + C_FC_COLLAPSIBLE ).each( ( i, el ) => {
                let c$ = $( el ),
                    control = o.controls[c$.attr( D_FC )];

                c$.collapsible( {
                    content: c$.find( "." + C_BODY ),
                    controllingElement: c$.find( ".a-FS-toggle" ),
                    heading: SEL_FS_HEADER,
                    collapsed: !!control.initialCollapsed
                } );
            } );
            gIgnoreCollapsible = false;

            if ( typeof o.searchField === TYPE_STRING ) {
                this.searchId = "#" + util.escapeCSS( o.searchField );
                if ( o.searchButton ) {
                    this.searchButtonId = "#" + util.escapeCSS( o.searchButton );
                }
            }

            if ( this.searchId ) {
                // todo want this to be a comboSelect someday
                $( this.searchId ).on( "keydown" + EVENT_NS, event => {
                    if ( event.which === KEYS.ENTER ) {
                        event.preventDefault();
                        this._doSearch();
                    } else if ( event.which === KEYS.ESCAPE && $( this.searchId ).val().trim() !== "" ) {
                        event.preventDefault();
                        $( this.searchId ).val( "" ); // clear
                    }
                } );
            }
            if ( this.searchButtonId ) {
                $( this.searchButtonId ).on( EVENT_CLICK + EVENT_NS, () => {
                    this._doSearch();
                } );
            }
        },

        _initSearch: function() {
            let el$ = $(),
                o = this.options;

            if ( o.searchField === true && o.searchItem ) {
                // initialize the internal search field
                el$ = $( "#" + this.idPrefix + "_search" );
            } else if ( o.searchField ) {
                el$ = $( this.searchId );
            }
            el$.val( $v( o.searchItem ) );
        },

        _doSearch: function() {
            let o = this.options;

            if ( this.searchId ) {
                let input$ = $( this.searchId ),
                    searchTerm = input$.val();

                if ( o.multipleSearches ) {
                    this._addSearchTerm( searchTerm );
                    input$.val( "" );
                } else {
                    setItem( o.searchItem, searchTerm );
                    // trigger change
                    this._changed();
                }
            }
        },

        // must only be called if persistState is true
        _updateCollapsedState: function( control, expanded ) {
            this.facetCollapsedState[control.name] = expanded ? 1 : 0;
            this.sessionStore.setItem( STATE_KEY, JSON.stringify( this.facetCollapsedState ) );
        },

        _updateDisplayedItems: function( button$, action ) {
            let items$, showMore$, showLess$, maxItemsDisplayed, initialVisibleItems, visibleItems,
                hasShowMore = false,
                hasShowLess = false,
                listFooter$ = button$.parent(),
                el$ = listFooter$.parent(),
                control = this._getControl( button$ ),
                filter$ = listFooter$.closest( "." + C_FC ).find( SEL_FILTER ),
                showAllCount = control.showAllCount,
                controlImpl = gControlTypes[control.type],
                isFiltered = controlImpl.isFiltered( el$ );

            if ( isFiltered ) {
                // filtering has a negative impact on show more/show less functionality, when filtering, the set of items
                // to show/hide are limited to those that match the search term.
                items$ = control.matchFilterItems$;
            } else {
                // find the items that can be visible in the list
                items$ = el$.find( SEL_ITEM_OPTION );
                if ( control.hideEmpty ) {
                    items$ = items$.not( "." + C_DISABLED );
                }
            }

            if ( action === SHOW_MORE ) {
                control.maxItemsDisplayed = control.maxItemsDisplayed + control.showMoreStepSize;
                initialVisibleItems = items$.not( SEL_HIDDEN ).length;
            } else if ( action === SHOW_LESS ) {
                control.maxItemsDisplayed = showAllCount;
            }
            maxItemsDisplayed = control.maxItemsDisplayed;

            if ( action && isFiltered ) {
                // When filtering the filterable widget takes care of the show/hide logic
                el$.find( SEL_ITEM_GROUP ).filterable( "refresh" );
            }

            if ( items$.length === ( maxItemsDisplayed + control.showAllGrace ) ) {
                maxItemsDisplayed = maxItemsDisplayed + control.showAllGrace;
            }

            if ( !isFiltered ) {
                items$.each( function ( i ) {
                    let item$ = $( this ),
                        hide = i >= maxItemsDisplayed && !$( this ).hasClass( C_CHECKED ); // don't hide something that is checked
                    item$.toggleClass( C_HIDDEN, hide );
                } );
            }

            if ( control.hasGroups ) {
                // hide the group elements if it doesn't have visible items
                el$.find( SEL_ITEM_SUBGROUP ).each( function () {
                    let item$ = $( this );
                    item$.toggleClass( C_HIDDEN, item$.children( SEL_ITEM_OPTION ).not( SEL_HIDDEN ).length === 0 );
                } );
            }

            visibleItems = items$.not( SEL_HIDDEN ).length;

            // It handles the case where user clicks show more button on facet and nothing happens because all the checked items were
            // already displayed and they were more than the showMoreStepSize, we call this method again until
            // there is a difference between the initial visible items and after when the SHOW_MORE action was executed.
            // If all the items are already display nothing is done.
            if ( !isFiltered && action === SHOW_MORE
                && initialVisibleItems === visibleItems
                && !controlImpl.allItemsDisplayed( el$, control ) ) {
                this._updateDisplayedItems( button$, SHOW_MORE );
            }

            if ( !isFiltered ) {
                // If facet is not being filtered and control attribute filterValue true, we display the filter only if
                // the facet has more possible visible values than the attribute showAllCount
                if ( control.filterValues && controlImpl.canBeFiltered( el$, control ) ) {
                    filter$.show();
                } else {
                    filter$.hide();
                }

                hasShowMore = items$.length > maxItemsDisplayed
                    && items$.length > visibleItems;
                hasShowLess = items$.length > ( showAllCount + control.showAllGrace )
                    && maxItemsDisplayed > showAllCount
                    // Show Less button can be only displayed if there one or more unchecked items option between the showAllCount number
                    // and the current display items, it avoids showing the button and not doing anything
                    && items$.filter( ind => ind >= showAllCount ).not( SEL_HIDDEN ).find( "input:not(:checked)" ).length ;
            }

            showMore$ = listFooter$.find( ".js-showMore" );
            showLess$ = listFooter$.find( ".js-showLess" );
            showMore$.toggleClass( C_HIDDEN, !hasShowMore );
            showLess$.toggleClass( C_HIDDEN, !hasShowLess );
            listFooter$.find( ".a-FS-listFooterButtonSeparator" ).toggleClass( C_HIDDEN, !( hasShowMore && hasShowLess ) );

            // Avoids losing focus when one of the buttons becomes hidden and pass the focus to the next visible button.
            if ( action ) {
                if ( !hasShowMore && hasShowLess ) {
                    showLess$[ 0 ].focus( { preventScroll: true } );
                } else if ( !hasShowLess && hasShowMore ) {
                    showMore$[ 0 ].focus( { preventScroll: true } );
                }
            }
        },

        _initFacetMenu: function( controlEl$, control, fcIdPrefix )  {
            const menuId = fcIdPrefix + MENU_ID_SUFFIX,
                controlRegion$ = controlEl$.closest( ".a-FS-control" ),
                el$ = controlRegion$.find( `.${ C_FS_HEADER }` ),
                menuItems = [],
                o = this.options,
                controlImpl = gControlTypes[control.type];
            let closeMenuF;

            if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( control.type ) && hasFilter( control ) ) {
                menuItems.push( {
                    type: "toggle",
                    label: getFRMessage( MSG_FILTER ),
                    set: ( value ) => {
                        let filter$ = controlRegion$.find( SEL_FILTER ),
                            input$ = filter$.find( HTML_TAG_INPUT ),
                            filteringConfig = this.clientFilteringConfig;

                        if ( value ) {
                            filter$.show();
                        } else {
                            // If hiding the filter, we clear the filter input field and trigger a change to refresh
                            input$.val( "" ).trigger( EVENT_CHANGE );
                            filter$.hide();
                        }

                        filteringConfig[ control.name ] = value;
                        this._persistClientFilteringConfig();

                        control.filterValues = value;

                        return true;
                    } ,
                    get: () => control.filterValues,
                    disabled: () => {
                        return !controlImpl.canBeFiltered( el$, control );
                    }
                } );
            }


            if ( o.showCharts && control.showCounts && control.showChart ) {
                menuItems.push( {
                    type: "action",
                    label: getFRMessage( "SHOW_CHART" ),
                    action: () => {
                        // it's possible to click this before JET has loaded so do nothing if not loaded to avoid other errors.
                        if ( this.chartsLoaded ) {
                            let name = control.name;

                            // If the popup/dialog widget is not open, then we set the focus back to the more options button,
                            // that will allow the jQuery UI default behaviour for those widgets to return the focus to
                            // the button when the dialog is closed and prevent the loss of it.
                            if ( this.options.showCharts === true && !this.chartsPopup$[this.chartWidget]( "isOpen" ) ) {
                                controlRegion$.find( ".js-moreOptions" ).focus();
                            }

                            if ( this.currentCharts.includes( name ) ) {
                                // just focus
                                chartForFacet( name ).trigger( EVENT_FOCUS );
                            } else {
                                this._addChart( control, el$ );
                                this._updateCharts();
                            }
                        }
                    }
                } );
            }

            if ( menuItems.length ) {
                let out = util.htmlBuilder(),
                    buttonLbl = control.label + " " + getFRMessage( "ACTIONS_MENU_BUTTON_LABEL" );

                out.markup( "<button type='button' class='js-moreOptions a-FS-moreOptions a-Button a-Button--noUI a-Button--noLabel a-Button--withIcon'" )
                    .attr( A_TITLE, buttonLbl )
                    .attr( A_LABEL, buttonLbl )
                    .attr( "data-menu", menuId )
                    .markup( ">" );
                renderIcon( out, "icon-facet-actions" );
                out.markup( "</button>" );

                el$.append( out.toString() );
                $( `<div id='${menuId}' />` ).menu( {
                    items: menuItems,
                    beforeOpen: function ( event ) {
                        closeMenuF = function () {
                            $( event.target ).menu( "toggle" );
                        };

                        // scroll event doesn't bubble so no possible to listen to nested events with jQuery so using addEventListener
                        apex.gPageContext$[0].addEventListener( "scroll", closeMenuF, true );
                    },
                    afterClose: function () {
                        apex.gPageContext$[0].removeEventListener( "scroll", closeMenuF, true );
                    }
                } );
            }
        },

        // ------
        // Internal methods for Smart Filter mode
        //
        _renderSmartFilterMode: function() {
            let id, lastGroup, count,
                ctrl$ = this.element,
                o = this.options,
                hasSuggestions = o.maxChips !== 0,
                text = o.text,
                out = util.htmlBuilder(),
                outFacetUI = util.htmlBuilder();

            function closeFacetControl() {
                outFacetUI.markup( DIV_C + DIV_C + DIV_C ); // close body, bodyInner, and wrap
                if ( hasSuggestions ) {
                    out.markup( "</li>" );
                }
            }

            id = this.idPrefix + "_search";
            this.searchId = "#" + id;
            out.markup( `<div class="a-FS-smartFilter"><div class="a-FS-searchBarButton"><button type="button" class="a-Button js-expandSearchBar"` )
                .attr( A_LABEL, text.searchLabel )
                .markup( ">" );
            renderIcon( out, "icon-search" );
            out.markup( "</button>" + DIV_C );
            out.markup( "<div class='a-FS-searchBar'><ul><li>" );
            renderSearchInput( out, id, text.searchPlaceholder, false, text.searchLabel, false );
            out.markup( "</li></ul></div>" );

            if ( hasSuggestions ) {
                out.markup( "<div class='a-FS-suggestionChips'><ul class='a-Chips' role='toolbar'" )
                    .attr( A_LABEL, getFRMessage( "SUGGESTIONS" ) )
                    .markup( ">" );
            }
            // render each control
            // note in this loop rendering to 2 different html buffers
            count = 0;
            for ( let i = 0; i < o.controls.length; i++ ) {
                let controlImpl, cls,
                    control = o.controls[i],
                    fcIdPrefix = this.idPrefix + "_" + i,
                    labelId = fcIdPrefix + "_lbl",
                    hidden = this.hiddenControls.includes( control.name ),
                    label = control.label,
                    group = null;

                if ( control.type === FCT_GROUP ) {
                    group = control.name;
                } else if ( control.type === FCT_CHECKBOX && lastGroup ) {
                    group = lastGroup;
                }

                controlImpl = gControlTypes[control.type];

                if ( group === null || group !== lastGroup ) {
                    if ( lastGroup ) {
                        if ( hasSuggestions ) {
                            renderCloseListGroup( out );
                        }
                        // close previous group first
                        closeFacetControl();
                    }
                    if ( hasSuggestions ) {
                        if ( o.maxChips >= 0 && count >= o.maxChips ) {
                            hidden = true;
                        }
                        cls = C_CHIP;
                        if ( control.cssClasses ) {
                            cls += " " + control.cssClasses;
                        }
                        if ( control.suggestedValues ) {
                            let suggestion = getControlSuggestedValue( control, null );

                            out.markup( "<li" )
                                .attr( A_CLASS, cls )
                                .attr( D_FC, i )
                                .optionalAttr( "style", hidden ? "display:none;" : "" )
                                .markup( ">" );
                            if ( control.includeLabel ) {
                                out.markup( `<span class="a-Chip-label" role="button" aria-haspopup="true"` )
                                    .markup( ">" )
                                    .content( label )
                                    .markup( SPAN_C );
                            }
                            // a control where lovValuesOptimizationSort has a value probably won't have any values initially
                            // but we still want a text element to update later
                            if ( !suggestion && control.lovValuesOptimizationSort ) {
                                suggestion = {
                                    r: "",
                                    d: ""
                                };
                            }
                            if ( suggestion ) {
                                out.markup( `<span class="a-Chip-text" role="button"` )
                                    .attr( D_VALUE, suggestion.r )
                                    .markup( `><span class="a-Chip-value">` )
                                    .content( suggestion.d )
                                    .markup( SPAN_C );
                                if ( control.showCounts ) {
                                    out.markup( `<span class="a-Chip-count"></span>` );
                                }
                                out.markup( SPAN_C );
                            }
                            count += 1;
                        }
                    }

                    cls = C_BODY + " " + C_JS_CONTROL_ROOT;
                    if ( control.cssClasses ) {
                        cls += " " + control.cssClasses;
                    }
                    outFacetUI.markup( "<div" )
                        .attr( A_ID, fcIdPrefix + "_b" )
                        .attr( A_CLASS, cls )
                        .markup( "><span class='u-vh'" )
                        .attr( A_ID, labelId )
                        .markup( ">" )
                        .content( control.label )
                        .markup( SPAN_C );

                    if ( controlImpl.hasFilter( control ) ) {
                        renderValuesFilter( outFacetUI, fcIdPrefix, control, false );
                    }
                    outFacetUI.markup( `<div class="${C_WRAP}"><div class="${C_BODY_INNER}">` );

                    if ( group && hasSuggestions ) {
                        renderOpenListGroup( out, labelId, true, control );
                    }
                    // remember the group if any
                    lastGroup = group;
                }

                // type specific rendering
                controlImpl.render( outFacetUI, fcIdPrefix, labelId, control, o.uiMode === "S" );

                if ( group === null || group !== lastGroup ) {
                    if ( lastGroup && hasSuggestions ) {
                        renderCloseListGroup( out );
                    }
                    closeFacetControl();
                }
            }
            if ( lastGroup ) {
                if ( hasSuggestions ) {
                    renderCloseListGroup( out );
                }
                // close any pending group
                closeFacetControl();
            }

            if ( hasSuggestions && o.maxChips >= 0 && o.moreFiltersChip ) {
                out.markup( `<li tabindex='-1' class='a-Chip js-moreFilters'><span class="a-Chip-label" role="button" aria-haspopup="true">` )
                    .content( getFRMessage( "OPEN_CONFIG" ) ) // More Filters
                    .markup( SPAN_C + "</li>" );
            }

            if ( hasSuggestions ) {
                out.markup( "</ul></div>" );
            }
            out.markup( DIV_C );

            if ( o.showTotalCount === true ) { // explicit tests for false, true are necessary
                // include the current facets wrapping div for proper styling even though it is not a current facets area
                out.markup( `<div class='${C_FS_CURRENT}'>${renderTotalCountArea( o.text.totalCountLabel, o.regionStaticId )}${DIV_C}` );
            }

            out.markup( `<div id="${this.idPrefix}_controls" style="display:none">${outFacetUI.toString()}</div>` );

            ctrl$.html( out.toString() );
        },

        _initSmartFilterMode: function() {
            let openFacetIndex, openFacetControl, openFacetCallback,
                ctrl$ = this.element,
                o = this.options,
                forwardKey = KEYS.RIGHT,
                backwardKey = KEYS.LEFT;

            const applyChip = ( chip$, useValue ) => {
                if ( chip$.hasClass( "js-moreFilters" ) ) {
                    this._openMoreFilters();
                } else {
                    let value$,
                        index = toInteger( chip$.attr( D_FC ) ),
                        value = null,
                        displayValue = null;

                    if ( useValue ) {
                        value$ = chip$.find( ".a-Chip-text" );
                        value = value$.attr( D_VALUE );
                        displayValue = value$.children( ".a-Chip-value" ).text();
                    }

                    this._applyFilterChip( index, value, displayValue );
                }
            };

            const applySuggestion = ( controlIndex, value ) => {
                let control = o.controls[controlIndex];

                // wait until the chip is added to applied chips container
                setTimeout( () => {
                    // if a value is given apply it right away otherwise open the selection UI for the user to choose a facet value
                    if ( value ) {
                        // for a multi valued facet type add the value rather than set
                        if ( control.type === "list" && control.multiple ) {
                            let currentValue = stringToValue( getFacetItemValue( control ) );

                            if ( currentValue[0] !== "" && !currentValue.includes( value ) ) {
                                currentValue.push( value );
                                value = valueToString( currentValue );
                            }
                        }
                        setFacetItemValue( control, value );
                        this._setFCValueByIndex( controlIndex, stringToValue( value ) );
                        this._changed();
                    } else {
                        // open popup
                        this.searchBarInstance.activate( "" + controlIndex );
                    }
                }, 0 );
            };

            const openFacet = ( controlIndex, chip$, callback ) => {
                let popup$ = this.facetUIPopup$,
                    facetSel = "#" + this.idPrefix + "_" + controlIndex + "_b";

                // create popup first time needed
                if ( !popup$ ) {
                    popup$ = $( `<div class='a-FS-facetPopupContent'></div>` );
                    this.element.after( popup$ );

                    popup$.popup( extend( true, {}, o.defaultConfigPopup, {
                        // title gets overridden on each open
                        autoOpen: false,
                        maxHeight: 400,
                        classes: {
                            "ui-dialog": "a-FS-facetPopup"
                        },
                        parentElement: chip$,
                        create: function () {
                            let popup$ = $( this );

                            popup$.keydown( function( event ) {
                                let kc = event.which;

                                // jQuery UI dialog has a tabbing greedy behaviour which traps the tab focus inside the dialog,
                                // if user press TAB on the last tabbable element it takes them to the first tabbable element,
                                // but this doesn't work well with form controls like radio groups which only the first option
                                // is a tab stop and user can move down with the down key, if you press TAB after moving down,
                                // it tabs out of the dialog which is an error, to avoid this problem and being able to close
                                // the popup when user is on the last tabbable element, on the popup we need to add a custom
                                // handle when TAB key is pressed.
                                if ( kc === KEYS.TAB ) {
                                    let lastTabbableElement = popup$.find( ":tabbable:last" )[ 0 ],
                                        firstTabbableElement = popup$.find( ":tabbable:first" )[ 0 ];

                                    // If event.target is the last tabbable element or is positioned after the last tabbable element,
                                    // it closes the popup and TAB will be applied to the last focused element which opened the popup
                                    if ( !isNodePositionedAfter ( event.target, lastTabbableElement ) && !event.shiftKey ) {
                                        popup$.popup( "close" );
                                    } else if ( !isNodePositionedAfter( firstTabbableElement,  event.target ) && event.shiftKey ) {
                                        // If event.target is the first tabbable element, TAB + Shift closes the tab and
                                        // Shift + TAB will be applied to last focused element which opened the popup
                                        popup$.popup( "close" );
                                    }
                                }
                            } );
                        }
                    } ) ).on( "popupclose", () => {
                        let curValue = getFacetItemValue( openFacetControl );

                        // if there are no values selected on close then remove the chip
                        if ( curValue === "" ) {
                            // if no value is chosen when closed remove this chip (count is 0)
                            this.searchBarInstance.removeValueChip( openFacetIndex );
                            this._updateSuggestionChips();
                        }
                        // put the facet control UI back
                        this.facetControlUIArea$.append( popup$.children().first() );
                        openFacetCallback( true ); // labels of chip already updated
                        this.facetUIisExpanded = false;
                        if ( o.batch ) {
                            this.apply();
                        }
                        this._checkSearchBarCollapse();
                    } );
                    freezeScroll( popup$ );

                    this.facetUIPopup$ = popup$;
                }

                // xxx don't open if was already open but this is under the control of initComboSelect

                // change the popup content to be this control value selection UI
                openFacetIndex = controlIndex;
                openFacetControl = o.controls[openFacetIndex];
                openFacetCallback = callback;
                popup$.append( ctrl$.find( facetSel ) );
                // open the popup under this chip
                // and update the title to reflect the facet UI it will contain
                this.facetUIisExpanded = true;
                popup$.popup( "option", A_TITLE, openFacetControl.label )
                    .popup( "option", "parentElement", chip$ )
                    .popup( "open" );
            };

            this.facetControlUIArea$ = $( "#" + this.idPrefix + "_controls" );
            if ( ctrl$.css( "direction" ) === "rtl" ) {
                forwardKey = KEYS.LEFT;
                backwardKey = KEYS.RIGHT;
            }

            this.searchBarInstance = widget.util.initComboSelect( ctrl$.find( ".a-FS-searchBar" ), {
                baseId: this.idPrefix,
                searchIcon: true,
                clearIcon: true,
                multiValued: true,
                activeChipMessage: getFRMessage( "APPLIED_FACET" ),
                enterable: true,
                useOverflow: true,
                escapeChoices: false,
                hasIcons: true,
                popupClasses: "a-FS-suggestionsPopup",
                choices: ( searchValue, callback ) => {
                    this._searchFilter( searchValue, callback );
                },
                // even though choices is a function don't need findChoice because selection state in choices not important here
                getChipLabel: ( chip$ ) => {
                    let label = chip$.find( ".a-Chip-label" ).text(),
                        text$ = chip$.find( SEL_CHIP_TEXT ),
                        aLabel = text$.attr( A_LABEL );

                    if ( aLabel ) {
                        label += " " + aLabel;
                    } else {
                        label += " " + text$.text();
                    }
                    // examples: "FacetX value1", "FacetX 3 selected", "keyword"
                    return label;
                },
                isDisabled: function() {
                    return false;
                },
                removeValue: ( value ) => {
                    // is it a search term or a facet?
                    if ( value.startsWith( "S:" ) ) {
                        value = value.substr( 2 );
                        this._removeSearchTerm( value );
                    } else {
                        let control = o.controls[toInteger( value )],
                            notEmpty = !isEmptyFacet( control );

                        // clear this facet and "add" the chip back to the suggestion chips area
                        if ( notEmpty ) {
                            this._clear( control );
                            this._changed();
                        } else {
                            this._updateSuggestionChips();
                        }
                    }
                },
                addValue: ( value, display ) => {
                    let ret = null;

                    if ( value === display ) {
                        // when value and display are the same the user has entered a search term. Let the value indicate that
                        value = "S:" + value;
                    }
                    // is it a search term or a facet
                    if ( value.startsWith( "S:" ) ) {
                        this._addSearchTerm( display );
                        ret = { value: value, text: display };
                    } else {
                        let m = suggestionValueRE.exec( value );

                        if ( m ) {
                            let controlIndex = toInteger( m[1] ),
                                control = o.controls[controlIndex],
                                value = m[3] || "",
                                operator;

                            applySuggestion( controlIndex, value );
                            if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                                operator = getInputOperator( control );
                            }

                            // Want the display value not the return value for the chip text. xxxx may need special case for single checkbox
                            value = getLabelForValue( control, stringToValue( value )[0], operator );
                            ret = { value: "" + controlIndex, text: value, label: control.label };
                        }
                    }
                    return ret;
                },
                activateChip: ( value, chip$, callback ) => {
                    // is it a search term or a facet
                    if ( value.startsWith( "S:" ) ) {
                        let display = value.substr( 2 );
                        this._removeSearchTerm( display );
                        this.searchBarInstance.editValue( value, display );
                    } else {
                        openFacet( value, chip$, callback );
                        return true;
                    }
                }
            } );

            let suggestionChips$ = ctrl$.find( ".a-FS-suggestionChips .a-Chips" );
            this.suggestionChips$ = suggestionChips$;
            // make the first chip focusable
            suggestionChips$.children().first().addClass( C_JS_TABBABLE )
                .children( SEL_CHIP_LABEL_TEXT ).attr( A_TABINDEX, 0 );

            // todo make suggestions are a conveyor belt

            suggestionChips$.on( EVENT_CLICK, ".a-Chip", event => {
                let target$ = $( event.target ),
                    chip$ = target$.closest( "." + C_CHIP );

                applyChip( chip$, !target$.hasClass( "a-Chip-label" ) );
            } ).on( "keydown", event => {
                let next$,
                    kc = event.which,
                    curChip$ = suggestionChips$.children( SEL_JS_TABBABLE );

                if ( kc === backwardKey ) {
                    next$ = curChip$.prevAll( SEL_VISIBLE ).first();
                } else if ( kc === forwardKey ) {
                    next$ = curChip$.nextAll( SEL_VISIBLE ).first();
                } else if ( kc === KEYS.ENTER ) {
                    let target$ = $( event.target );

                    applyChip( curChip$, !target$.hasClass( "a-Chip-label" ) );
                    event.preventDefault();
                } else if ( kc === KEYS.SPACE ) {
                    // space does the same as enter but must wait until keyup
                    // don't want default behavior which is to scroll
                    event.preventDefault();
                }

                if ( next$ && next$[0] ) {
                    makeCurrentChip( next$, curChip$, true );
                    event.preventDefault();
                }
            } ).on( "keyup", event => {
                let kc = event.which;

                if ( kc === KEYS.SPACE ) {
                    let target$ = $( event.target ),
                        curChip$ = suggestionChips$.children( SEL_JS_TABBABLE );

                    applyChip( curChip$, !target$.hasClass( "a-Chip-label" ) );
                    event.preventDefault();
                }
            } );
        },

        _isSearchBarCollapsible: function() {
            let o = this.options;

            if ( o.maxChips === 0 ) {
                return false;
            }
            return o.collapsibleSearchBar || ( this.isMobile && o.collapsibleSearchBar === null );
        },

        _checkSearchBarCollapse: function() {
            let ctrl$ = this.element;

            if ( this._isSearchBarCollapsible() ) {
                let count = this.getFacetCount( true ); // include search terms

                // Its time to collapse the search bar only when:
                ctrl$.toggleClass( C_COLLAPSED,
                    count === 0 && // there are no facets or search terms
                    !this.facetUIisExpanded && // and no facet selection UI popup is open
                    $( this.searchId ).attr( "aria-expanded" ) !== "true" && // and the input search field is not open
                    !$( document.activeElement ).closest( "." + C_FS )[0] ); // and the focus is not in the smart search
            } else if ( ctrl$.hasClass( C_COLLAPSED ) ) {
                // if the search bar is not collapsible then remove collapsed modifier
                ctrl$.removeClass( C_COLLAPSED );
            }
        },

        _setSearchTerms: function() {
            let searchBarInstance = this.searchBarInstance,
                searchItem = this.options.searchItem,
                terms = getSearchTerms( searchItem ),
                clear = [];

            // first remove all the search terms
            searchBarInstance.getValue().forEach( v => {
                if ( v.value.startsWith( "S:" ) ) {
                    clear.push( v.value );
                }
            } );
            clear.forEach( v => {
                searchBarInstance.removeValueChip( v );
            } );

            // now add all the new terms
            terms.forEach( v => {
                searchBarInstance.addValueChip( "S:" + v, v );
            } );
        },

        _updateAppliedChip: function( control, index, value, canRemove ) {
            let operator,
                searchBarInstance = this.searchBarInstance,
                curValue = value;

            if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                if ( Array.isArray( curValue ) ) {
                    operator = curValue[0];
                    curValue = value[1] || [""];
                } else {
                    curValue = curValue.split( VAL_SEP );
                    operator = curValue[0];
                    curValue = curValue[1] || [""];
                }
            }

            if ( ( curValue.length > 0 && curValue[0] !== "" ) || !canRemove ) {
                let el$,
                    chip$ = this.element.find( ".a-Chips.a-Chips--applied" ).children( `[${D_VALUE}="${index}"]` ),
                    text;

                if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                    text = getLabelForValue( control, curValue, operator ) || "";
                } else {
                    text = curValue.length > 1 ? "" + curValue.length : curValue.length > 0 ? getLabelForValue( control, curValue[0] ) : "";
                }

                // If there is an existing chip update it else add
                if ( chip$[0] ) {
                    chip$.find( SEL_CHIP_TEXT ).text( text );
                } else {
                    searchBarInstance.addValueChip( "" + index,  text, control.label );
                    chip$ = this.element.find( ".a-Chips.a-Chips--applied" ).children( `[${D_VALUE}="${index}"]` );
                }
                el$ = chip$.find( SEL_CHIP_TEXT );
                if ( curValue.length > 1 ) {
                    // It is expected that AT will not read this label on static markup but this is as good a place
                    // as any to store the count message. See how it is used in getChipLabel
                    el$.attr( A_LABEL, " " + lang.formatMessage( "APEX.FS.COUNT_SELECTED", text ) );
                } else {
                    el$.removeAttr( A_LABEL );
                }
                searchBarInstance.updatedValueChip();
            } else if ( canRemove ) {
                searchBarInstance.removeValueChip( "" + index );
            }
        },

        _updateSuggestionChips: function() {
            let o = this.options,
                fmt = o.numberFormat,
                fmtOpt = o.numberFormatOptions,
                threshold = o.numberFormatThreshold;

            function format( number ) {
                return formatNumber( number, fmt, threshold, fmtOpt );
            }

            if ( o.maxChips === 0 ) {
                // there are no suggestions when maxChips is 0
                return;
            }

            let count = 0,
                overflow = 0,
                activateNext = false,
                nextChip$ = null,
                prevChip$ = null;

            for ( let i = 0; i < o.controls.length; i++ ) {
                let control = o.controls[i],
                    isEmpty = isEmptyFacet( control ), // facet does not have a value
                    chip$ = this.suggestionChips$.children( `[${D_FC}="${i}"]` ),
                    fcCounts = this.facetValueCounts[control.name],
                    facetHidden = this.hiddenControls.includes( control.name ),
                    hidden = facetHidden;

                if ( !chip$[0] ) {
                    continue;
                }

                if ( ( o.maxChips >= 0 && count >= o.maxChips ) || !isEmpty ) {
                    hidden = true;
                }

                if ( control.suggestedValues ) {
                    let suggestion = getControlSuggestedValue( control, fcCounts ),
                        controlEl$ = this._getControlElementByIndex( control, i ),
                        wasTabStop = chip$.hasClass( C_JS_TABBABLE );

                    // if no suggestions or the popup for this control is opened then hide the suggestion chip
                    if ( !suggestion || controlEl$.is( ":visible" ) ) {
                        hidden = true;
                    }
                    // show/hide the chip based on hidden
                    chip$.toggle( !hidden );
                    if ( hidden && wasTabStop ) {
                        // if hiding a chip that was the active tab stop need to make the next chip the new tab stop
                        activateNext = true;
                        prevChip$ = chip$;
                    }
                    if ( !hidden ) {
                        let text$ = chip$.find( ".a-Chip-text" ),
                            count$ = chip$.find( ".a-Chip-count" ),
                            value = suggestion.r;

                        if ( activateNext ) {
                            activateNext = false;
                            nextChip$ = chip$;
                        }
                        // update suggestion value
                        text$.attr( D_VALUE, value ).children( ".a-Chip-value" ).text( suggestion.d );
                        count += 1;

                        if ( value && count$[0] && fcCounts ) {
                            let count = fcCounts[value] || 0;

                            count = count === 0 ? "" : format( count );
                            count$.text( count ).attr( A_LABEL, count ? " " + lang.formatMessage( "APEX.FS.COUNT_RESULTS", count ) : "" );
                        }
                    }
                }
                if ( !facetHidden && isEmpty && o.moreFiltersChip ) {
                    // see if this facet would end up on the more filters overflow list
                    if ( hidden || !control.suggestedValues ) { // xxx what about if there are no counts?
                        overflow += 1;
                    }
                }
            }

            let showSuggestions = !( count === 0 || ( o.feedback && this.totalResourceCount < MIN_RESULTS_FOR_SUGGESTIONS ) );
            this.suggestionChips$.parent().toggle( showSuggestions );
            if ( showSuggestions ) {
                // show/hide the more filters chip depending on if there are any overflow facets
                if ( o.moreFiltersChip ) {
                    this.suggestionChips$.children().last().toggle( overflow > 0 );
                }
            }

            // If the last suggestion chip is the one being hidden, we need to activate the last visible suggestion chip
            if ( activateNext ) {
                nextChip$ = this.suggestionChips$.children().not( ".js-moreFilters" ).filter( ":visible" ).last();
            }
            if ( nextChip$ && nextChip$[0] ) {
                makeCurrentChip( nextChip$, prevChip$ );
            }
        },

        /*
         * Returns in the callback the available/matching suggestions
         * The value is:
         *  <integer> - This is a facet. The integer is the facet control index
         *  <integer>:<value> - this is a facet value
         *  S:<string> This is a search suggestion or history entry
         */
        _searchFilter: function( match, callback ) {
            const searchRe = match ? new RegExp( util.escapeRegExp( match ), "ig" ) : null;
            let results = [],
                o = this.options;

                match = match.toLowerCase();

                // todo future include history; use icon icon-search-recent

                for ( let i = 0; i < o.controls.length; i++ ) {
                    const control = o.controls[i],
                    controlIsEmpty = isEmptyFacet( control ),
                    textHighlightingCls  = 'a-ComboSelect-itemHighlight';
                let label = control.label,
                    highlightedLabel = highlightSearchTerm( label, match, textHighlightingCls );

                if ( this.hiddenControls.includes( control.name ) ) {
                    // skip over hidden controls
                    continue;
                }

                if ( match && highlightedLabel ) {
                    results.push( {
                        d: highlightedLabel,
                        r: "" + i,
                        i: control.icon || "icon-search-facet"
                    } );
                } else if ( !match && controlIsEmpty ) {
                    //If there is nothing to highlight, the escaped control label is displayed.
                    results.push( {
                        d: util.escapeHTML( label ),
                        r: "" + i,
                        i: control.icon || "icon-search-facet"
                    } );
                }
                if ( match ) {
                    let values = control.values;

                    // loop over values
                    if ( values ) {
                        for ( let j = 0; j < values.length; j++ ) {
                            let value = values[j],
                                valueLabel = getLabelForValue( control, value.r );

                            label = valueLabel;
                            if ( control.includeLabel ) {
                                label = control.label + ": " + label;
                            }
                            if ( valueLabel.toLowerCase().includes( match ) ||
                                ( match.startsWith( ( control.label + VAL_SEP ).toLowerCase() ) && label.toLowerCase().includes( match ) ) ) {
                                results.push( {
                                    d: highlightSearchTerm( label, match, textHighlightingCls ),
                                    r: i + VAL_SEP + value.r,
                                    i: value.i || control.icon || "icon-search-facet"
                                } );
                            }
                        }
                    }
                }
            }

            if ( o.searchSuggestions ) {
                // todo use ajax how to mix sync and async would like to show what we have right away
                for ( let i = 0; i < o.searchSuggestions.length; i++ ) {
                    let searchTerm = o.searchSuggestions[i];

                    if ( searchTerm.toLowerCase().includes( match ) ) {
                        results.push( {
                            // TODO change highlighting logic to use the same than when looking through the filter values,
                            //  using replace with a regular expression doesn't cover all the possible highlighting cases, and
                            //  could yield wrong results, see bug #33850870
                            d: searchRe ? searchTerm.replace( searchRe, m => `<span class='a-ComboSelect-itemHighlight'>${m}</span>` ) : searchTerm,
                            r: "S:" + searchTerm,
                            i: "icon-search-suggestion"
                        } );
                    }
                }
            }
            callback( results );
        },

        _openMoreFilters: function( opener$ ) {
            let popup$ = this.moreFiltersPopup$,
                ctrl$ = this.element,
                o = this.options,
                id = this.idPrefix + "_moreFilters",
                labelId = id + "Lbl",
                controls = o.controls;

            // create popup first time needed
            if ( !popup$ ) {
                popup$ = $( `<div class='a-FS-overflowFacetsContent' style='display:none;'>\
<div class="${C_BODY}" id="${id}"><span class="u-vh" id="${labelId}">${getFRMessage( "FACETS_LIST" )}</span>\
<div class="${C_WRAP}"><div class="${C_BODY_INNER}"></div></div></div></div>` );
                this.element.after( popup$ );

                popup$.popup( extend( true, {}, o.defaultConfigPopup, {
                    autoOpen: false,
                    title: getFRMessage( "OPEN_CONFIG" ), // override the title
                    maxHeight: 400,
                    classes: {
                        "ui-dialog": "a-FS-facetOverflowPopup"
                    },
                    parentElement: opener$ || this.element.find( ".js-moreFilters" )
                } ) ).on( "popupclose", () => {
                    this.facetUIisExpanded = false;
                    this._checkSearchBarCollapse();
                } );
                freezeScroll( popup$ );
                this.moreFiltersPopup$ = popup$;
            }

            // Update more facets dialog with the list of appropriate facets
            let facetsLOV = [],
                // not a real facet but make it look like one to leverage the radio list rendering and behavior
                moreFacetsControl = {
                    type: "list",
                    showCounts: false,
                    hideRadioButton: true,
                    multiple: false,
                    values: facetsLOV
                },
                count = 0;

            for ( let i = 0; i < controls.length; i++ ) {
                let control = controls[i],
                    isEmpty = isEmptyFacet( control ); // xxx groups are not included because they are "empty" how to handle groups?

                // add to overflow choices if facet is not hidden
                // and not already filtering on it (facet item value is empty)
                // and not already shown as a suggestions chip
                if ( !this.hiddenControls.includes( control.name ) &&
                    isEmpty &&
                    ( !control.suggestedValues || count >= o.maxChips ) ) {

                    facetsLOV.push( {
                        d: control.label,
                        r: i,
                        i: control.icon || "fa fa-cube"  // xxx fa-filter? Need specific icon, be consistent with _searchFilter
                    } );
                }
                if ( control.suggestedValues && isEmpty ) {
                    // count the ones that should be in the suggestions
                    count += 1;
                }
            }

            // todo future renderValuesFilter and _initFilterable as needed for the more filters popup. prob just once and show/hide

            let controlEl$,
                controlImpl = gControlTypes[moreFacetsControl.type],
                out = util.htmlBuilder();

            controlImpl.render( out, id, labelId, moreFacetsControl );
            popup$.find( SEL_BODY_INNER ).html( out.toString() );

            controlEl$ = $( "#" + id + " " + SEL_BODY_INNER );
            controlImpl.init( controlEl$, moreFacetsControl, ( control, values ) => {
                popup$.popup( "close" );
                this._applyFilterChip( toInteger( values[0] ), null, null ); // xxxx for checkbox pass in value
            } );

            // make sure search bar is expanded
            if ( this._isSearchBarCollapsible() && ctrl$.hasClass( C_COLLAPSED ) ) {
                ctrl$.removeClass( C_COLLAPSED );
            }

            // while not facet selection UI it has the same intent to keep the search bar from collapsing
            this.facetUIisExpanded = true;
            popup$.popup( "option", "parentElement", opener$ || this.element.find( ".js-moreFilters" ) )
                .popup( "open" );
        },

        _applyFilterChip: function( index, value, displayValue ) {
            let o = this.options,
                ctrl$ = this.element,
                control = o.controls[index],
                searchBarInstance = this.searchBarInstance;

            // make sure search bar is expanded
            if ( this._isSearchBarCollapsible() && ctrl$.hasClass( C_COLLAPSED ) ) {
                ctrl$.removeClass( C_COLLAPSED );
            }

            // if a value is given apply it right away otherwise open the selection UI for the user to choose a facet value
            if ( value ) {
                // apply
                setFacetItemValue( control, value );
                this._setFCValueByIndex( index, stringToValue( value ) );
                this._changed();
                // focus search input because that is what happens after the popup is closed
                $( this.searchId ).trigger( EVENT_FOCUS );
            } else {
                // add chip to applied filter chips container
                searchBarInstance.addValueChip( "" + index, displayValue || "", control.label );

                // open popup
                searchBarInstance.activate( "" + index );
                // do this while the popup is opened so the chip isn't shown in 2 places
                this._updateSuggestionChips();
            }

        },

        // ------
        // Internal methods
        //
        _makeSetValueFn: function() {
            const o = this.options;

            return ( control, value, done ) => {
                const cIndex = o.controls.indexOf( control );

                if ( this.searchBarInstance ) {
                    this._updateAppliedChip( control, cIndex, value );
                }
                // convert to string
                value = valueToString( value );
                setFacetItemValue( control, value );
                // trigger change
                if ( o.batch || isFilterDialogFacet( control ) ) {
                    let i,
                        len;

                    if ( !o.externalApply ) {
                        let curValue, newValue;

                        if ( control.type === FCT_CHECKBOX && control._groupIndex !== undefined ) {
                            // to show or hide the apply button need to know if all of the checkbox values in the same
                            // group are the same or not
                            curValue = "";
                            newValue = "";
                            for ( i = control._groupIndex + 1; i < o.controls.length; i++ ) {
                                let c = o.controls[i];

                                if ( c.type !== FCT_CHECKBOX ) {
                                    break;
                                }
                                curValue += "|" + this.currentValues[c.name];
                                newValue += "|" + getFacetItemValue( c );
                            }
                        } else if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                            const newInputValue = getInputValue( value );

                            if ( newInputValue !== "" ) { // when input has no value then batch button must not show when operator is changed
                                curValue = this.currentValues[control.name];
                                newValue = value;
                            } else {
                                curValue = this.currentValues[control.name].split( VAL_SEP )[1] || "";
                                newValue = newInputValue;
                            }
                        } else {
                            curValue = this.currentValues[control.name];
                            newValue = value;
                        }
                        // if don't have an external apply button show the one at the end of the facet control
                        if ( cIndex >= 0 && !isFilterDialogFacet ( control ) ) {
                            this.element.find( "#" + this.idPrefix + "_" + cIndex )
                                .closest( "." + C_FC )
                                .find( "." + C_FS_APPLY )[curValue === newValue ? "hide" : "show"]()[0]
                                .scrollIntoView( false ); // todo only want this if needed
                        }
                    }
                    // in batch mode still want to get any dependent (cascade) LOVs
                    len = this.facetValuesNeeded.length;
                    if ( len > 0 ) {
                        for ( i = 0; i < len; i++ ) {
                            this.facetCountsNeeded.push( this.facetValuesNeeded[i] );
                        }
                        this._delayFetchCountsFor();
                    }
                } else {
                    if ( value !== this.currentValues[control.name] ) {
                        this.currentValues[control.name] = value;
                        this._changed();
                    }
                }
                if ( o.uiMode === "S" && done && this.facetUIisExpanded ) {
                    if ( this.facetUIPopup$ && this.facetUIPopup$.popup( "isOpen" ) ) {
                        this.facetUIPopup$.popup( "close" );
                    }
                    if ( this.moreFiltersPopup$ && this.moreFiltersPopup$.popup( "isOpen" ) ) {
                        this.moreFiltersPopup$.popup( "close" );
                    }
                }
            };
        },

        _initFilterable: function( controlEl$, control, fcIdPrefix ) {
            const smartFilter = this.options.uiMode === 'S';
            let filterableInstance$,
                input$ = $( "#" + fcIdPrefix + "_f" ),
                filterFunction =  function ( index, searchValue ) {
                    const item$ = $( this ),
                        itemVal = item$.find( HTML_TAG_INPUT ).val(),
                        controlImpl = gControlTypes[control.type],
                        isHidden = item$.hasClass( 'is-disabled' ) && control.hideEmpty,
                        label$ = item$.find( ".label" ),
                        // If HTML markup is included the matching logic is applied only to the text part
                        itemText = controlImpl.getLabelForValue( control, itemVal ),
                        textHighlightingCls = "a-FS-itemOptionHighlight";
                    let highlightedLabel = highlightSearchTerm( itemText, searchValue, textHighlightingCls ),
                        hideItem = true;

                    if ( index === 0 ) {
                        // keeps track of the number of items being displayed after being filtered
                        control.filteredItemsDisplayed = 0;
                        control.matchFilterItems$ = $();
                    }

                    if ( ( highlightedLabel || !searchValue ) && !isHidden ) {
                        control.matchFilterItems$ = control.matchFilterItems$.add( item$ );
                        control.filteredItemsDisplayed = control.filteredItemsDisplayed + 1;
                        hideItem = false;
                    }

                    if ( highlightedLabel ) {
                        label$.html( highlightedLabel );
                    } else  {
                        // If control escape HTML attribute equal false and no match was found, we print the unescaped display value
                        // so it is restored to how it looked before filtering where the HTML is striped or escaped
                        label$.html( control.escape ? util.escapeHTML( itemText ) : controlImpl.getLabelForValue( control, itemVal, false, false ) );
                    }

                    return hideItem;
                };

            input$.val( "" ); // clear filter

            // event handler to clear the filter value
            input$.closest( SEL_FILTER ).on( EVENT_CLICK, ".js-clearInput", function() {
                //we clear the filter input field and trigger a change to refresh
                input$.val( "" ).trigger( EVENT_CHANGE );
            } );

            if ( smartFilter ) {
                controlEl$.closest( SEL_JS_CONTROL_ROOT ).off( EVENT_FILTER ).on( EVENT_FILTER, function () {
                    listSetTabTarget( controlEl$, control );
                } );
            }

            // todo think this is facet control specific
            filterableInstance$ = controlEl$.find( SEL_ITEM_GROUP ).filterable( {
                enhanced: true,
                input: input$,
                children: SEL_ITEM_OPTION,
                filterCallback: filterFunction
            } );

            return filterableInstance$;
        },

        _clearAll: function( includeSearch ) {
            let i, control,
                o = this.options;

            if ( includeSearch && this.searchId ) {
                $( this.searchId ).val( "" );
                setItem( o.searchItem, "" );
                // for faceted search mode the current facets re rendered but for smart filters need to explicitly update applied chips
                if ( o.uiMode === "S" ) {
                    this._setSearchTerms();
                }
            }
            // for each control clear it
            for ( i = 0; i < o.controls.length; i++ ) {
                control = o.controls[i];
                if ( control.type !== FCT_GROUP ) {
                    this._clear( control );
                }
            }
            this._changed();
        },

        _getControlElementByIndex: function( control, index ) {
            const controlIdSel =  "#" + util.escapeCSS( this.idPrefix + "_" + index );
            let el$ = $( controlIdSel );

            if ( !el$[0] || el$.hasClass( C_CHIP ) ) {
                // if the chip is opened then it is not found within this widget
                el$ = $( controlIdSel + "_b" ).find( SEL_BODY_INNER );
            } else if ( el$.hasClass( C_FS_HEADER ) ) {
                el$ = el$.next().find( SEL_BODY_INNER );
            } else if ( isFilterDialogFacet ( control ) && control.type !== FCT_CHECKBOX ) {
                    el$ = el$.find( SEL_BODY_INNER );
            }

            return el$;
        },

        // currently not used in smart filter mode
        _getControl: function( el$ ) {
            let index = el$.closest( "." + C_FC ).attr( D_FC );
            return this.options.controls[index];
        },

        // reset any saved state other than facet values
        _reset: function() {
            let controls = this.options.controls;

            this._clearSessionState();
            this.element.find( "." + C_FC_COLLAPSIBLE ).each( function() {
                let c$ = $( this ),
                    control = controls[c$.attr( D_FC )];

                c$.collapsible( !control._origCollapsed ? "expand" : "collapse" );
                control.initialCollapsed = control._origCollapsed;
            } );
            this._cleanupCharts();
            this.chartConfig = {};
            for ( let i = 0; i < controls.length; i++ ) {
                let control = controls[i];

                control.initialChart = control._origChart || false;
            }
            this._initCharts();
        },

        _clearSessionState: function() {
            [ STATE_KEY, OPEN_CHARTS_KEY, CHART_CONFIG_KEY, FILTERED_FACETS_KEY ].forEach( x => { this.sessionStore.removeItem( x ); } );
        },

        _changed: function() {
            if ( this.options.disabled || this.pendingRefresh || this.pendingFetch ) {
                this.pendingChange = true;
            } else {
                this._trigger( EVENT_FACETS_CHANGE, {} );
                // give reports a chance to be processed first
                setTimeout( () => {
                    this._fetchCounts();
                }, 200 );
            }
            if ( hasFilterDialogFacets ( this.options.controls ) ) {
                this._enableDisableFilterDialogButton();
            }
        },

        _fetchCounts: function() {
            if ( this.options.feedback ) {
                this._sendFetchCounts();
            } else {
                this._updateControls( {counts: {}}, true );
            }
        },

        /*
         * Clear the value of the given control.
         * Caller should call _changed.
         */
        _clear: function( control ) {
            let o = this.options,
                curValues,
                controls = o.controls,
                cIndex = controls.indexOf( control );

            if ( control.type === FCT_GROUP && cIndex >= 0 ) {
                // clear all the checkboxes in the group
                for ( let i = cIndex + 1; i < controls.length && controls[i].type === FCT_CHECKBOX ; i++ ) {
                    this._clear( controls[i] );
                }
            } else {
                if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                    curValues = getInputOperator( control );
                    curValues = curValues ? `${ curValues }:` : "";
                    setFacetItemValue( control, curValues );
                    this._setFCValueByIndex( cIndex, curValues );
                } else {
                    setFacetItemValue( control, "" );
                    if ( cIndex >= 0 ) {
                        this._setFCValueByIndex( cIndex, [] );
                    }
                }
            }
        },

        /*
         * Set the value of the facet control from the given facet item input.
         */
        _setFCValue: function( input$ ) {
            let name = input$[0].id,
                value = stringToValue( input$.val() ),
                index = getControlIndex( this.options.controls, name );

            if ( index >= 0 ) {
                this._setFCValueByIndex( index, value );
                this._changed();
            }
        },

        _setFCValueByIndex: function( index, value ) {
            let controlImpl, controlEl$,
                control = this.options.controls[index];

            this._setValue( control, index, value );
            controlImpl = gControlTypes[control.type];
            controlEl$ = this._getControlElementByIndex( control, index );
            if ( controlEl$.length ) {
                controlImpl.setValue( controlEl$, control, value, this.options.uiMode === "S" );
            }
        },

        _setValue: function( control, index, value, strValue ) {
            if ( strValue === undefined ) {
                strValue = valueToString( value );
            }
            this.currentValues[control.name] = strValue;
            if ( this.searchBarInstance ) {
                this._updateAppliedChip( control, index, value, true );
            }
        },

        _initCharts: function() {
            const ID_SUFFIX_RE = new RegExp( CHART_ID_SUFFIX + "$" );
            let o = this.options;

            if ( o.showCharts ) {
                this.chartDashboard$ = $( "<div class='a-FS-facetsDashboard'></div>" );

                if ( typeof o.showCharts === TYPE_STRING ) {
                    $( o.showCharts ).html( this.chartDashboard$ );

                    // when there is a "dashboard" then show any initial charts
                    for ( let i = 0; i < o.controls.length; i++ ) {
                        let control = o.controls[i];
                        if ( o.showCharts && control.showCounts && control.showChart && control.initialChart ) {
                            this._addChart( control, null );
                        }
                    }
                    if ( this.currentCharts.length ) {
                        this._updateCharts();
                    }
                } else {
                    let widget, defaultOptions;
                    if ( o.defaultChartDialog ) {
                        widget = "dialog";
                        defaultOptions = o.defaultChartDialog;
                    } else if ( o.defaultChartPopup ) {
                        widget = "popup";
                        defaultOptions = o.defaultChartPopup;
                    } else {
                        throw new Error( "Missing chart dialog or popup options" );
                    }
                    this.chartWidget = widget;
                    this.chartsPopup$ = $( "<div class='a-FS-chartsDialog' style='display:none;' ></div>" );
                    this.chartsPopup$.insertAfter( this.element )[widget]( extend( {}, defaultOptions , {
                            autoOpen: false,
                        } ) )
                        .html( this.chartDashboard$ )
                        .on( "dialogbeforeclose popupbeforeclose", () => { // remove added chart on close
                            let name = this.chartsPopup$.find( "oj-chart" ).prop( A_ID );

                            if ( name ) {
                                // get facet name from chart id
                                name = name.replace( ID_SUFFIX_RE, "" );
                                // popup only holds one chart at a time but API could have charts open elsewhere.
                                this._removeChart( name, true );
                            }
                        } );
                }
            }
        },

        _render: function() {
            if ( this.options.uiMode === "S" ) {
                this._renderSmartFilterMode();
            } else {
                this._renderFacetedSearchMode();
            }
        },

        _sendFetchCounts: function() {
            let hiddenList = [];

            // remove facets we are getting values for from hidden list.
            // If there is a chart still want counts
            // Or if they may be hidden now but we expect they won't be then want counts
            for ( let i = 0; i < this.hiddenControls.length; i++ ) {
                let name = this.hiddenControls[i],
                    control = this.options.controls.find( el => { return el.name === name; } );

                // currentCharts isn't initialized right away so if charts not loaded check initialChart which includes persisted state
                if ( !this.facetValuesNeeded.includes( name ) && !( this.currentCharts.includes( name ) || ( !this.chartsLoaded && control.initialChart ) ) ) {
                    hiddenList.push( name );
                }
            }

            this._send( "FETCH_COUNTS", JSONArrayOrEmptyString( hiddenList ), true );
         },

        _sendFetchCountsFor: function() {
            this._send( "FETCH_COUNTS_FOR", JSONArrayOrEmptyString( this.facetCountsNeeded ), false );
        },

        _send: function( x1, x2, all ) {
            let p, itemsToSubmit,
                o = this.options;

            if ( o.filteredRegionItemsToSubmit ) {
                itemsToSubmit = [...this.facetControlItems, ...o.filteredRegionItemsToSubmit.split( ',' ).filter( e => e ) ];
            } else {
                itemsToSubmit = this.facetControlItems;
            }

            this.lock();
            p = apex.server.plugin( o.ajaxIdentifier, {
                pageItems: itemsToSubmit,
                x01: x1,
                x02: x2,
                x03: JSONArrayOrEmptyString( this.facetValuesNeeded )
            }, {
                dataType: "json",
                // assume that a report is being refreshed at about the same time and it will provide a progress loadingIndicator
                // so no need to set loadingIndicator
                refreshObject: "#" + o.regionStaticId
            } );
            this.facetValuesNeeded  = [];
            // in the all case when getting counts it will get counts for all facets so can remove the specific list that just need counts
            this.facetCountsNeeded = [];
            p.done( data => {
                this._updateControls( data, all );
                this._updateCharts();
            } );
            p.always( () => {
                this.unlock();
            } );
        },

        _delayFetchCountsFor: function() {
            if ( this.delayFetchTimer ) {
                clearTimeout( this.delayFetchTimer );
            }
            this.delayFetchTimer = setTimeout( () => {
                this.delayFetchTimer = null;
                if ( this.facetCountsNeeded.length > 0 ) {
                    this._sendFetchCountsFor();
                }
            }, 100 );
        },

        /*
         * Expects
         * {
         *     values: {} optional map control name => values array
         *     counts: {} optional map control name => map value ==> count
         *     totalCount: <number>
         * }
         */
        _updateControls: function( data, full ) {
            let lastGroup, groupLabel, groupValue, groupImpl, groupEl$, groupFcIdPrefix, groupControl,
                counts = data.counts,
                lovValues = data.values,
                o = this.options,
                smartFilters = o.uiMode === "S",
                fmt = o.numberFormat,
                fmtOpt = o.numberFormatOptions,
                threshold = o.numberFormatThreshold,
                ctrl$ = this.element,
                out = util.htmlBuilder(),
                focusedEl$ = $( document.activeElement ),
                focusLost = false,
                count = 0;

            function format( number ) {
                return formatNumber( number, fmt, threshold, fmtOpt );
            }

            if ( full && ( fmt === "compact" || fmt === true ) &&
                        locale.resourcesLoaded().state() !== "resolved" ) {
                /* The resources needed to format compact numbers isn't loaded yet but want to show the counts etc. asap
                 * so render them now and update once the resources are loaded.
                 */
                fmt = false;
                locale.resourcesLoaded( () => {
                    this._updateControls( data, full );
                } );
            }

            if ( full ) {
                this.facetValueCounts = counts || null; // only do this if updating all facets
            } else if ( counts && this.facetValueCounts ) {
                // else merge in new counts
                extend( this.facetValueCounts, counts );
            }

            if ( o.batch && full ) {
                ctrl$.find( "." + C_FS_APPLY ).hide();
            }

            if ( data.totalCount !== undefined ) {
                this.totalResourceCount = data.totalCount;
            }

            if ( full && o.multipleSearches && o.currentFacets ) {
                let values = getSearchTerms( o.searchItem );

                if ( values.length > 0 ) {
                    out.markup( `<li class='${C_FS_CUR_ITEM} ${C_FS_CUR_ITEM}--search'>` );
                    for ( let j = 0; j < values.length; j++ ) {
                        let value = values[j],
                            accLabel = lang.formatMessageNoEscape( "APEX.FS.CLEAR_VALUE", value );

                        renderClearValueButton( out, value, accLabel, value, -1 ); // -1 indicates a search term to remove
                        count += 1;
                    }
                    out.markup( "</li>" );
                }
            }

            lastGroup = null;
            groupLabel = null;
            for ( let i = 0; i < o.controls.length; i++ ) {
                let value,
                    values,
                    label,
                    accLabel,
                    button$,
                    el$,
                    hasValue = null,
                    operator,
                    group = null,
                    control = o.controls[i],
                    fcIdPrefix = this.idPrefix + "_" + i,
                    fcCounts = counts && counts[control.name],
                    fcValues = lovValues && lovValues[control.name],
                    controlImpl = gControlTypes[control.type],
                    controlEl$ = this._getControlElementByIndex( control, i ),
                    drawFacets = true;

                if ( control.type === FCT_GROUP ) {
                    groupLabel = control.label;
                    groupValue = "";
                    // remember the group so it can be updated on the last checkbox
                    groupImpl = controlImpl;
                    groupEl$ = controlEl$;
                    groupFcIdPrefix = fcIdPrefix;
                    groupControl = control;
                    continue;
                } else if ( control.type !== FCT_CHECKBOX ) {
                    groupLabel = null;
                }
                el$ = $( `#${ util.escapeCSS( fcIdPrefix ) }` );
                if ( control.type === FCT_CHECKBOX ) {
                    el$ = el$.closest( "." + C_FC ).children( SEL_FS_HEADER );
                }

                if ( control.lovValuesOptimizationSort && fcCounts ) {
                    // This is the distinct value optimization case and zero count items are hidden
                    // Didn't get list of values when widget initialized so take the values from the counts
                    // Always replace the values with what is in the counts. This makes it somewhat similar to a cascade in that the set of values can change.
                    // The return and display values are by definition the same.
                    // The server does not order the values so the client sorts ascending.
                    //   (They may be reordered in the UI according to orderByCount, checkedFirst, or control.disabledLast)
                    // It is not possible to have groups or icons in the LOV.
                    fcValues  = [];
                    Object.keys( fcCounts ).forEach( p => {
                        fcValues.push( {r: p, d: p} );
                    } );

                    // It always adds the selected values to the fcValues if the counts doesn't include them, it does
                    // prevent removing them and not being displayed on the currentFacets area, this will help us to show the
                    // selected option even when the count is equal 0 for that item (bug33443995), this behaviour is aligned
                    // with other list items where the selected DOM nodes aren't removed if count = 0
                    let currValues = stringToValue( getFacetItemValue( control ) );
                    currValues.forEach( element => {
                        if ( element && !( element in fcCounts ) ) {
                            fcValues.push( {r: element, d: element} );
                        }
                    } );

                    // client side ordering is not perfect but we accept it to prevent performance issues with the generated sql statement
                    if ( control.lovValuesOptimizationSort === "desc" ) {
                    fcValues.sort( ( a, b ) => {
                        a = a.d;
                        b = b.d;
                        if ( a > b ) {
                                return -1;
                            } else if ( b > a ) {
                            return 1;
                            } // else
                            return 0;
                        } );
                    } else {
                        fcValues.sort( ( a, b ) => {
                            a = a.d;
                            b = b.d;
                            if ( a > b ) {
                                return 1;
                            } else if ( b > a ) {
                                return -1;
                            } // else
                            return 0;
                        } );
                    }
                }

                if ( fcValues ) {
                    control.values = fcValues;
                    this._updateControlValues( control, controlImpl, controlEl$, fcIdPrefix, fcIdPrefix + "_lbl" );
                }
                if ( fcCounts ) {
                    if ( controlImpl.update ) {
                        controlImpl.update( controlEl$, fcIdPrefix, control, fcCounts, format );
                    }
                }
                value = getFacetItemValue( control, true );

                // Check if control has a value. For a group of checkboxes look at all the checkbox values
                // Also update the group on the last checkbox.
                if ( control.type === FCT_CHECKBOX ) {
                    let next = i + 1;
                    // for a group must wait until see all the checkboxes
                    groupValue += value;
                    // if last checkbox in this group
                    if ( next >= o.controls.length || o.controls[next].type !== FCT_CHECKBOX ) {
                        // enable or disable the clear button for the whole group once all the checkboxes have been visited
                        hasValue = groupValue !== "";
                        groupImpl.update( groupEl$, groupFcIdPrefix, groupControl );
                    }
                } else if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                    hasValue = getInputValue( value ) !== "";
                } else {
                    hasValue = value !== "";
                }
                if ( hasValue !== null ) {
                    // this enables or disables the clear button
                    el$.parent().toggleClass( 'has-value', hasValue );
                    if ( !hasValue && focusedEl$.hasClass( "js-clear" ) && focusedEl$.closest( el$ ).length ) {
                        // the clear button will loose focus
                        focusLost = true;
                    }
                }
                if ( control.type === FCT_INPUT && control.flexibleOperator ) { // check if value is really set and not only the operator in the session state
                    drawFacets = stringToValue( value )[1] !== "";
                }

                // update current facets
                if ( full && o.currentFacets && value !== "" && drawFacets ) {
                    label = control.label;
                    if ( groupLabel ) {
                        group = label = groupLabel;
                    }

                    values = stringToValue( value );

                    if ( control.type === FCT_INPUT && control.flexibleOperator ) {
                        operator = values[0];
                        values = [values[1]];
                    }

                    if ( group === null || group !== lastGroup ) {
                        if ( lastGroup ) {
                            // close previous group
                            out.markup( "</li>" );
                        }
                        out.markup( `<li class="${C_FS_CUR_ITEM}${control.includeLabel ? " " + C_FS_CUR_ITEM + "--includeLabel" : ""}">` );
                        if ( isFilterDialogFacet( control ) ) {
                            renderButton( out, label, `${ C_FS }-currentLabel ${ C_JS_OPEN_FILTER_DIALOG_FACET }`, null, null, null, getControlIndex( o.controls, control.name ) );
                        } else if ( control.includeLabel ) {
                            out.markup( "<span class='a-FS-currentLabel'>" )
                               .content( label )
                               .markup( SPAN_C );
                        }

                        lastGroup = group;
                    }

                    for ( let j = 0; j < values.length; j++ ) {
                        value = values[j];
                        label = getLabelForValue( control, value, operator );
                        accLabel = label;
                        if ( control.includeLabel ) {
                            accLabel = control.label + " " + accLabel;
                        }
                        accLabel = lang.formatMessageNoEscape( "APEX.FS.CLEAR_VALUE", accLabel );

                        // todo consider if the count is 0 for a value show the button in a gray state but not disabled
                        renderClearValueButton( out, label, accLabel, value, i );
                        count += 1;
                    }
                    if ( group === null || group !== lastGroup ) {
                        out.markup( "</li>" );
                    }
                }
                // After update some options may be hidden so need to recalculate show-more
                button$ = controlEl$.find( ".js-toggleOverflow" );
                if ( button$.length ) {
                    const filter$ = button$.closest( "." + C_FC ).find( SEL_FILTER ),
                          isFiltered = ( filter$.find( HTML_TAG_INPUT ).val() || "" ).length > 0;

                    if ( isFiltered && control.filterValues ) {
                        controlEl$.find( SEL_ITEM_GROUP ).filterable( 'refresh' );
                    }

                    this._updateDisplayedItems( button$ );
                }
            }
            if ( full ) {
                if ( lastGroup ) {
                    out.markup( "</li>" );
                }

                if ( o.currentFacets ) {
                    if ( focusedEl$.is( ".a-FS-clear,.a-FS-clearAll" ) && focusedEl$.closest( this.currentFacetsArea$ ).length ) {
                        // the clear button will loose focus
                        focusLost = true;
                    }
                    if ( count > 1 ) {
                        out.markup( `<li class='${C_FS_CUR_ITEM} ${C_FS_CUR_ITEM}--all'><button class='a-FS-clearAll' type='button'>` )
                            .content( getFRMessage( "CLEAR_ALL" ) )
                            .markup( "</button></li>" );
                    }
                    if ( o.currentFacets === true ) {
                        this.currentFacetsArea$.toggle( count > 0 || o.showTotalCount === true );
                    }
                    // region landmark identifies the purpose of the list. For internal current facets we add
                    // the region landmark but for external current facets are it is the app developer responsibility.
                    this.currentFacets$.html( out.toString() );
                    this.currentFacets$.find( `.${ C_JS_OPEN_FILTER_DIALOG_FACET }` ).on( EVENT_CLICK, ( pEvent ) => {
                        const index = $( pEvent.currentTarget ).attr( D_FC );
                        let control = o.controls[ index ];

                        // when control is a group checkbox then we need to set the group facet as current control
                        if ( control._groupIndex !== undefined ) {
                            control = o.controls[ control._groupIndex ];
                        }
                        // hide selection field including the wrapper
                        this.filterDialogPopup$.find( SEL_FACET_SELECTION ).parent().hide();
                        this.filterDialogFacet = control.name;
                        this._toggleFacets( control.name );
                        this.filterDialogPopup$
                        .popup( "option", "parentElement", pEvent.target )
                        .popup( "option", A_TITLE, control.label )
                        .popup( "option", "relativePosition", "below" )
                        .popup( "open" );
                    } );
                }

                if ( this.totalCount$ ) {
                    this.totalCount$.text( format( this.totalResourceCount ) );
                    ctrl$.add( this.currentFacetsArea$ || $() ).find( "." + C_FS_TOTAL_AREA ).toggle( this.totalResourceCount !== 0 );
                }
                if ( smartFilters ) {
                    this._updateSuggestionChips();
                    this._checkSearchBarCollapse();
                }
            }
            if ( focusLost ) {
                let next$ = focusedEl$.closest( ".a-FS-control" ).find( SEL_TABBABLE ).first();

                if ( !next$[0] && focusedEl$.parent().hasClass( "a-FS-currentItem" ) ) {
                    next$ = this.currentFacetsArea$.find( SEL_TABBABLE ).first();
                }
                if ( next$[0] ) {
                    next$.trigger( EVENT_FOCUS );
                } else {
                    this.focus();
                }
            }
        },

        _updateControlValues: function( control, controlImpl, controlEl$, fcIdPrefix, labelId ) {
            let found, changed, focusedValue, itemOption$,
                out = util.htmlBuilder(),
                values = control.values,
                curValues = stringToValue( getFacetItemValue( control, true ) ),
                setValue = this._makeSetValueFn(),
                focused$ = $( document.activeElement ),
                input$ = $( "#" + fcIdPrefix + "_f" );

            // If the apex-item-option or the input is clicked, it always set the focused$ to the input element
            if ( focused$.hasClass( C_ITEM_OPTION ) ) {
                focused$ = $( document.activeElement ).find( HTML_TAG_INPUT );
            }
            if ( focused$.closest( controlEl$ ).length ) {
                focusedValue = focused$.val();
            }

            setValuesOrder( control );

            // render with new values
            controlImpl.render( out, fcIdPrefix, labelId, control, true );
            controlEl$.html( out.toString() ); // this destroys all the handlers and filterable

            // If an item option was focused before the re-render, we set the focus to the same item again
            if ( focusedValue ) {
                itemOption$ = controlEl$.find( `input[value='${util.escapeCSS( focusedValue )}']` ).parent();
                // Make the item visible before applying focus because after re-rendering the list the focused item option
                // could be hidden.
                itemOption$.removeClass( C_HIDDEN );
                itemOption$.parent( ".apex-item-subgroup" ).removeClass( SEL_HIDDEN );
                itemOption$.trigger( EVENT_FOCUS );
            }

            // remove values from curValue that no longer exist
            changed = false;
            for ( let i = 0; i < curValues.length; i++ ) {
                found = false;
                for ( let j = 0; j < values.length; j++ ) {
                    if ( curValues[i] === values[j].r ) {
                        found = true;
                        break;
                    }
                }
                if ( !found ) {
                    curValues.splice( i, 1 );
                    i -= 1;
                    changed = true;
                }
            }
            if ( changed ) {
                setFacetItemValue( control, valueToString( curValues ) );
            }
            // init again
            controlImpl.init( controlEl$, control, setValue );
            controlImpl.setValue( controlEl$, control, curValues );

            if ( controlImpl.hasFilter( control ) ) {
                let filterableElement$,
                filterValue = input$.val();

                filterableElement$ = this._initFilterable( controlEl$, control, fcIdPrefix );

                if ( filterValue ) {
                    // After filter widget initialization if user was already filtering the values
                    // we need to apply the values again
                    input$.val( filterValue );
                    filterableElement$.filterable( "refresh" );
                }
            }
            // never hide a LOV Optimized control that has no values
            if ( !control.lovValuesOptimizationSort ) {
                // if was hidden !== is hidden i.e. a change in visibility
                if ( this.hiddenControls.includes( control.name ) !== ( values.length === 0 ) ) {
                    this._toggleVisibility( control.name, values.length > 0, false, true );
                }
            }
        },

        _addSearchTerm: function( value ) {
            let searchItem = this.options.searchItem,
                terms = getSearchTerms( searchItem );

            // value must not already exist in the terms
            if ( !terms.includes( value ) ) {
                terms.push( value );
                setItem( searchItem, terms.join( "\n" ) );
                // trigger change
                this._changed();
            }
        },

        _removeSearchTerm: function( value ) {
            let index,
                searchItem = this.options.searchItem,
                terms = getSearchTerms( searchItem );

            // value must be in the terms
            index = terms.indexOf( value );
            if ( index >= 0 ) {
                terms.splice( index, 1 );
                setItem( searchItem, terms.join( "\n" ) );
                // trigger change
                this._changed();
            }
        },

        _toggleVisibility: function( facetName, visible, clear, noFetch ) {
            const controls = this.options.controls,
                  index = getControlIndex( controls, facetName );
            let   hIndex,
                  control,
                  el$;

            if ( index >= 0 ) {
                control = controls[index];
                hIndex = this.hiddenControls.indexOf( facetName );
                if ( visible ) {
                    if ( hIndex >= 0 ) {
                        this.hiddenControls.splice( hIndex, 1 );
                        // if a facet becomes visible and it hasFeedback and xxx there were no facet value changes then need to just get counts
                        if ( control.hasFeedback && !noFetch ) {
                            this.facetCountsNeeded.push( facetName );
                            this._delayFetchCountsFor(); // batch it
                        }
                    }
                } else {
                    if ( hIndex < 0 ) {
                        this.hiddenControls.push( facetName );
                    }
                }

                el$ = this._getControlElementByIndex( control, index );
                // xxx the rest depends on uiMode
                if ( control.type !== FCT_CHECKBOX ) {
                    el$ = el$.closest( "." + C_FC );
                }
                el$.toggle( visible );
                if ( clear && !visible ) {
                    this._clear( control ); // xxx beware double filters change requests. debounce?
                    this._removeChart( facetName );
                }
            }

        },

        _updateCharts: function() {
            let o = this.options,
                controls = o.controls,
                counts = this.facetValueCounts,
                currentCharts = this.currentCharts;

            // order series based on facet value display
            let order = ( a, b ) => {
                return b.items[0].value - a.items[0].value;
            };

            if ( !counts ) {
                return;
            }

            for ( let f = 0; f < currentCharts.length; f++ ) {
                let i, label, fcCounts, chart, count, topN, values, value, curValues,
                    justChecked = false,
                    facetName = currentCharts[f],
                    config = this.chartConfig[ facetName ],
                    series = [],
                    index = getControlIndex( controls, facetName ),
                    control = controls[index],
                    controlImpl = gControlTypes[control.type];

                if ( control.type === FCT_GROUP ) {
                    // first see if any in the group are checked
                    for ( i = index + 1; i < controls.length && controls[i].type === FCT_CHECKBOX ; i++ ) {
                        let cbControl = controls[i];
                        curValues = getFacetItemValue( cbControl );
                        if ( curValues ) {
                            justChecked = true;
                            break;
                        }
                    }
                    // for a group of checkboxes each value comes from a checkbox facet control
                    for ( i = index + 1; i < controls.length && controls[i].type === FCT_CHECKBOX ; i++ ) {
                        let cbControl = controls[i];
                        label = cbControl.altLabel || cbControl.label;
                        fcCounts = counts[cbControl.name];
                        if ( fcCounts ) {
                            curValues = getFacetItemValue( cbControl );
                            count = fcCounts[cbControl.value];
                            // Add this value count to the chart series if the count is positive or
                            // either none of the facet values are checked or this value is checked
                            if ( count > 0 &&
                                ( !justChecked || curValues ) ) {
                                series.push( {
                                    name: label,
                                    items: [{id: i, value: count, name: label}]
                                } );
                            }
                        }
                    }
                } else {
                    fcCounts = counts[facetName];
                    // the counts could be missing if the facet is not visible
                    if ( fcCounts ) {
                        // checkbox controls should be handled by charting the group but just in case look at value if there are no values
                        values = control.values || [{r: control.value, l: control.altLabel || control.label}];
                        curValues = VAL_SEP + getFacetItemValue( control ) + VAL_SEP;

                        if ( curValues !== VAL_SEP + VAL_SEP ) {
                            justChecked = true;
                        }
                        for ( i = 0; i < values.length; i++ ) {
                            value = values[i];
                            if ( controlImpl.useGetlabelForCharts && controlImpl.getLabelForValue ) {
                                label = controlImpl.getLabelForValue( control, value.r );
                            } else {
                                label = value.l || util.stripHTML( value.d );
                            }
                            count = fcCounts[value.r];
                            // Add this value count to the chart series if the count is positive or
                            // either none of the facet values are checked or this value is checked
                            if ( count > 0 &&
                                ( !justChecked || curValues.includes( VAL_SEP + value.r + VAL_SEP ) ) ) {
                                series.push( {
                                    name: label,
                                    items: [{id: i, value: count, name: label}]
                                } );
                            }
                        }
                    }
                }

                if ( control.orderByCount ) {
                    series.sort( order );
                }
                if ( justChecked ) {
                    topN = series.length; // show all checked
                } else {
                    topN = Math.min( series.length, config.topN || o.chartTopNValues );
                }
                if ( topN < series.length ) {
                    let othersCount = 0,
                        othersLabel = getFRMessage( "CHART_OTHERS" );

                    for ( i = topN; i < series.length; i++ ) {
                        othersCount += series[i].items[0].value;
                    }
                    series[topN] = {
                        name: othersLabel,
                        // make sure the id won't conflict with any other series items.
                        items: [{id: values.length, value: othersCount, name: othersLabel}]
                    };
                    series.length = topN + 1; // truncate the array
                }
                chart = chartForFacet( facetName )[0];
                // want no group label
                chart.groups = [""];
                chart.valueFormats = {
                    value: {
                        converter: {
                            format: val => {
                                return formatNumber( val, o.numberFormat, o.numberFormatThreshold, o.numberFormatOptions );
                            }
                        },
                        tooltipLabel: getFRMessage( "CHART_VALUE_LABEL" )
                    }
                };
                chart.translations = {
                    labelSeries: control.label
                };
                chart.series = series;
            }
        },

        _addChart: function( control, el$, dashboard$, config ) {
            var chart$, chart,
                o = this.options,
                name = control.name,
                currentCharts = this.currentCharts;

            function renderChart( control, type ) {
                var typeBtnLabel, typeBtnIcon,
                    removeBtnLabel = getFRMessage( "REMOVE_CHART" ),
                    out = util.htmlBuilder();

                if ( type === "bar" ) {
                    typeBtnIcon = C_I_PIE;
                    typeBtnLabel = getFRMessage( "CHART_PIE" );
                } else {
                    type = "pie";
                    typeBtnIcon = C_I_BAR;
                    typeBtnLabel = getFRMessage( "CHART_BAR" );
                }
                out.markup( '<div class="' + C_FACET_CHART + '"><div class="a-FS-facetChart-header"><h3 class="a-FS-facetChart-title">' )
                    .content( control.label )
                    .markup( '</h3><div class="a-FS-facetChart-controls">' )
                    .markup( '<button type="button" class="a-FS-changeChartType js-changeChartType a-Button a-Button--noLabel a-Button--withIcon"' )
                    .attr( "data-type", type )
                    .attr( A_TITLE, typeBtnLabel )
                    .attr( A_LABEL, typeBtnLabel )
                    .markup( ">" );
                renderIcon( out, typeBtnIcon );
                out.markup( '</button><button type="button" class="a-FS-removeChart js-removeChart a-Button a-Button--noLabel a-Button--withIcon"' )
                    .attr( A_TITLE, removeBtnLabel )
                    .attr( A_LABEL, removeBtnLabel )
                    .markup( ">" );
                renderIcon( out, "icon-multi-remove" );
                out.markup( `</button>${DIV_C}${DIV_C}<div class="a-FS-facetChart-body"><oj-chart id="` )
                    .attr( control.name + CHART_ID_SUFFIX ) // xxx ACC aria label on the chart
                    .markup( '" style="width:100%;height:100%;" legend.position="bottom" hover-behavior="dim" hide-and-show-behavior="withRescale" sorting="descending" animation-on-display="auto" animation-on-data-change="auto"' )
                    .attr( "type", type )
                    .markup( '></oj-chart></div></div>' );
                return out.toString();
            }

            function configChart( chart, type ) {
                chart.legend.rendered = type === "pie" ? "off" : "on";
                chart.styleDefaults.dataLabelPosition = type === "pie" ? "outsideSlice" : "outsideBarEdge";
                chart.refresh();
            }

            config = config || this.chartConfig[name] || {
                type: "bar",
                topN: o.chartTopNValues
            };
            this._persistChartConfig();
            this.chartConfig[name] = config;

            chart$ = $( renderChart( control, config.type ) );
            this._trigger( EVENT_BEFORE_ADD_CHART, {}, {
                count: currentCharts.length + 1,
                chartName: name,
                chart: chart$[0]
            } );
            chart = chart$.find( "oj-chart" )[0];
            chart.dataLabel = dataContext => {
                let percent, label,
                    value = formatNumber( dataContext.value, o.numberFormat, o.numberFormatThreshold, o.numberFormatOptions );

                if ( dataContext.totalValue ) {
                    // must be a pie
                    percent = Math.round( dataContext.value * 100 / dataContext.totalValue ) + "%";
                    label = dataContext.series + " - " + percent + " (" + value  + ")";
                } else {
                    label = "" + value;
                }
                return label;
            };
            chart$.find( ".js-removeChart" ).on( EVENT_CLICK, () => {
                this._removeChart( name );
            } );
            chart$.find( ".js-changeChartType" ).on( EVENT_CLICK, event => {
                let newType, label, onClass, offClass,
                    btn$ = $( event.target ).closest( "button" ),
                    type = btn$.attr( "data-type" ),
                    chart = btn$.closest( "." + C_FACET_CHART ).find( "oj-chart" )[0];

                if ( type === "bar" ) {
                    // change to pie
                    newType = "pie";
                    label = getFRMessage( "CHART_BAR" );
                    onClass = C_I_BAR;
                    offClass = C_I_PIE;
                } else {
                    // change to bar
                    newType = "bar";
                    label = getFRMessage( "CHART_PIE" );
                    onClass = C_I_PIE;
                    offClass = C_I_BAR;
                }
                btn$.attr( "data-type", newType )
                    .attr( A_TITLE, label )
                    .attr( A_LABEL, label )
                    .children( ".a-Icon" ).removeClass( offClass ).addClass( onClass );
                chart.type = newType;
                configChart( chart, newType );
                this.chartConfig[name].type = newType;
                this._persistChartConfig();
            } );
            if ( dashboard$ && dashboard$.length ) {
                // only used by addChart API
                dashboard$.append( chart$ );
                currentCharts.push( name );
            } else {
                if ( this.options.showCharts === true ) {
                    // when shown in a dialog/popup there can be only one at a time
                    if ( currentCharts.length > 0 ) {
                        // should just be one
                        this._removeChart( currentCharts[0] );
                    }
                }
                this.chartDashboard$.append( chart$ );
                currentCharts.push( name );
                if ( this.options.showCharts === true ) {
                    if ( this.chartWidget === "popup" ) {
                        this.chartsPopup$.popup( "option", "parentElement", el$ );
                    }
                    this.chartsPopup$[this.chartWidget]( "open" );
                } else {
                    this._persistOpenCharts();
                }
            }
            // let the chart set its defaults first
            setTimeout( () => {
                configChart( chart, config.type );
            }, 0 );
        },

        _removeChart: function( name, fromPopupClose ) {
            var currentCharts = this.currentCharts,
                index = currentCharts.indexOf( name ),
                chart$ = chartForFacet( name ).closest( "." + C_FACET_CHART );

            if ( index >= 0 ) {
                currentCharts.splice( index, 1 );
                chart$.remove();
                if ( this.options.showCharts === true ) {
                    if ( !fromPopupClose ) {
                        this.chartsPopup$[this.chartWidget]( "close" );
                    }
                } else {
                    this._persistOpenCharts();
                }
                this._trigger( EVENT_AFTER_REMOVE_CHART, {}, {
                    count: currentCharts.length,
                    chartName: name
                } );
            }
        },

        _persistOpenCharts: function() {
            if ( this.options.persistState ) {
                // persist in session store last viewed charts
                this.sessionStore.setItem( OPEN_CHARTS_KEY, JSON.stringify( this.currentCharts ) );
            }
        },

        _persistChartConfig: function() {
            if ( this.options.persistState ) {
                // persist in session store chart config
                this.sessionStore.setItem( CHART_CONFIG_KEY, JSON.stringify( this.chartConfig ) );
            }
        },

        _persistClientFilteringConfig: function() {
            if ( this.options.persistState ) {
                // persist in session store the client-side filtering config
                this.sessionStore.setItem( FILTERED_FACETS_KEY, JSON.stringify( this.clientFilteringConfig ) );
            }
        }
    } );

    // ------
    // Facet Controls
    //
    const gControlTypes = [];

    function addControlType( typeName, impl ) {
        gControlTypes[typeName] = impl;
    }

    /**
     * @ignore
     * @type {Function}
     */
    $.apex.facets.addControlType = addControlType;

    // todo try again to include shift/ctrl arrow behavior etc. on listbox items

    function renderOpenListGroup( out, labelId, multiple, control, ariaLabel ) {
        let cls = C_ITEM_GROUP + " apex-item-group--rc ",
            aAttributes;

        if ( multiple ) {
            cls += " checkbox_group apex-item-checkbox";
        } else {
            cls += " radio_group apex-item-radio";
        }
        if ( control.listClasses ) {
            cls += " " + control.listClasses;
        }
        if ( control.hideRadioButton && !multiple ) {
            cls += " a-FS--hideRadio";
        }
        if ( control.hideEmpty ) {
            cls += " a-FS--hideEmpty";
        }

        if ( ariaLabel ) { // aria label overwrites aria labelledby
            aAttributes = {
                name: A_LABEL,
                value: ariaLabel
            };
        } else if ( labelId ) {
            aAttributes = {
                name: A_LBLBY,
                value: labelId
            };
        }
        out.markup( `<div tabindex="-1" role="listbox"` )
            .attr( aAttributes.name, aAttributes.value )
            .attr( A_CLASS, cls )
            .optionalAttr( 'aria-multiselectable', multiple ? 'true' : null )
            .markup( ">" );
    }

    function renderCloseListGroup( out ) {
        out.markup( DIV_C );
    }

    function renderCheckboxRadio( out, baseId, suffix, cls, item, escape, showCounts, multiple, facetId ) {
        const id = baseId + "_" + suffix;

        out.markup( "<div" )
            .optionalAttr( A_ID , facetId ) // only when standalone like checkbox facet type
            .attr( A_CLASS, cls )
            .attr( A_ROLE, "option" )
            .attr( "tabindex", "0" )
            .optionalAttr( D_ORDER, item.order )
            .markup( "><input" )
            .attr( "type", multiple ? "checkbox" : "radio" )
            .attr( "tabindex", "-1" )
            .attr( A_CLASS, C_HIDDEN )
            .attr( A_ID, id )
            .optionalAttr( "name", !multiple ? ( baseId + "_r" ) : null )
            .attr( "value", item.r )
            .markup( "><label" )
            .attr( "for", id )
            .markup( ">" );
        // todo may want the icon at the start or end.
        if ( item.i ) {
            out.markup( "<span class='a-Icon " )
                .attr( item.i )
                .markup( "'></span>" );
        }
        out.markup( "<span class='label'>" )[ escape ? "content" : "markup" ]( item.d )
            .markup( SPAN_C );
        if ( showCounts ) {
            out.markup( `<span class='${C_BADGE}'></span>` );
        }
        out.markup( "</label></div>" );
    }

    function renderList( out, baseId, labelId, control, ariaLabel ) {
        let i, maxItemsDisplayed,
            hasGroups = false,
            curGroup = null,
            multiple = control.multiple,
            values = control.values,
            escape = control.escape !== false,
            groupIndex = 0;

        renderOpenListGroup( out, labelId, multiple, control, ariaLabel );
        maxItemsDisplayed = values.length + 1; // assume not doing showAll
        if ( control.maxItemsDisplayed > 0 && values.length > ( control.maxItemsDisplayed + control.showAllGrace ) ) {
            maxItemsDisplayed = control.maxItemsDisplayed;
        }
        for ( i = 0; i < values.length; i++ ) {
            let item = values[i],
                cls = C_ITEM_OPTION,
                groupCls = C_ITEM_SUBGROUP;

            if ( i >= maxItemsDisplayed ) {
                cls += ` ${ C_HIDDEN }`;
                groupCls += ` ${ C_HIDDEN }`;
            }
            if ( item.g && item.g !== curGroup ) {
                let groupLabelId = baseId + "_lsg_" + groupIndex;
                groupIndex += 1;

                if ( curGroup ) {
                    out.markup( DIV_C );
                }
                curGroup = item.g;
                hasGroups = true;
                out.markup( "<div role='group'" )
                    .attr( A_CLASS, groupCls )
                    .attr( A_LBLBY,  groupLabelId )
                    .markup( `><div class='apex-group-label' role='presentation' id='${groupLabelId}'>` )
                    .content( item.g )
                    .markup( DIV_C );
            }

            renderCheckboxRadio( out, baseId, i, cls, item, escape, control.showCounts, multiple );
        }
        if ( curGroup ) {
            out.markup( DIV_C );
        }
        renderCloseListGroup( out );
        control.hasGroups = hasGroups;
        if ( hasGroups ) {
            if ( control.checkedFirst || control.disabledLast || control.orderByCount ) {
                debug.warn( "Facets list options orderByCount, checkedFirst and disabledLast ignored when list has groups" );
            }
            control.orderByCount = control.checkedFirst = control.disabledLast = false;
        }
        if ( control.showMoreStepSize !== undefined ) {
            let showMoreLbl = getFRMessage( SHOW_MORE ),
                showLessLbl = getFRMessage( SHOW_LESS );

            // todo acc should this use aria-expanded?
            out.markup( `<div class="a-FS-listFooter">` )
               .markup( `<button class="a-FS-toggleOverflow js-toggleOverflow js-showMore ${ C_HIDDEN }" type="button"` )
               .attr( A_LABEL, showMoreLbl + ": " + control.label )
               .markup( ">" )
               .content( showMoreLbl )
               .markup( "</button>" )
               .markup( `<span class="a-FS-listFooterButtonSeparator ${ C_HIDDEN }">/</span>` )
               .markup( `<button class="a-FS-toggleOverflow js-toggleOverflow js-showLess ${ C_HIDDEN }" type="button"` )
               .attr( A_LABEL, showLessLbl + ": " + control.label )
               .markup( ">" )
               .content( showLessLbl )
               .markup( "</button>" )
               .markup( "</div>" );
        }
    }

    function addListValues( list$, isRange, values ) {
        // Selected state not announced on checked options in JAWS Forms mode, so use
        // aria-checked as well as aria-selected when option is checked. Note: This has
        // slightly negative side effect of announcing both checked and selected in
        // Virtual PC Cursor mode of JAWS, however it was decided this was an acceptable
        // cost given the benefits in Forms mode.
        list$.find( SEL_ITEM_OPTION )
            .removeClass( C_CHECKED ).attr( A_ARIA_SELECTED, "false" ).removeAttr( A_ARIA_CHECKED );
        list$.find( ":checked" ).each( function () {
            let parts,
                v = this.value;

            $( this ).parent().addClass( C_CHECKED ).attr( A_ARIA_SELECTED, "true" ).attr( A_ARIA_CHECKED, "true" );
            if ( isRange ) {
                parts = this.value.split( RANGE_SEP );
                if ( parts.length === 2 ) {
                    v = { b: parts[0], e: parts[1] };
                }
            }
            values.push( v );
        } );
    }

    // To keep the same Tab navigation behaviour between the different list controls we use tabindex,
    // navigating pressing the Tab key to the list will put the focus on the fist element if no element has been checked,
    // if one or more elements have been checked, we put the focus on the first checked element from top to bottom.
    function listSetTabTarget( el$, control ) {
        if ( !isFilterDialogFacet ( control ) ) {
            let controlImpl = gControlTypes[control.type],
                itemOptions$ = controlImpl.controlItemOptions( el$, control ),
                firstCheckedOption$ = itemOptions$.find( "input:checked" ).first().parent();

            itemOptions$.attr( A_TABINDEX, "-1" );

            if ( firstCheckedOption$.length > 0 ) {
                firstCheckedOption$.attr( A_TABINDEX, "0" );
            } else {
                itemOptions$.first().attr( A_TABINDEX, "0" );
            }
        }
    }

    // noDeselection is used to prevent that the filter type is unselected.
    // This is used by the flexible operator for inputs that is always required.
    function toggleListItemValue( itemOption, onChangeData, noDeselection ) {
        const inputTarget = $( itemOption ).find( HTML_TAG_INPUT )[0],
            optionDisabled = $( itemOption ).hasClass( C_DISABLED );

        if ( inputTarget && [ "checkbox", "radio" ].includes( inputTarget.type ) ) {
            if ( !optionDisabled && ( !noDeselection || ( noDeselection && !inputTarget.checked ) ) ) {
                inputTarget.checked = !inputTarget.checked;
                $( inputTarget ).trigger( EVENT_CHANGE, onChangeData );
            }
        }
    }

    function listOptionKeydown ( event, control, noDeselection ) {
        const kc = event.which,
            selItemOptions =
                `${ SEL_ITEM_OPTION }${ SEL_VISIBLE }${ control.multiple && control.hideEmpty ?  ":not(" + SEL_DISABLED + ")": "" }`;

        if ( kc === KEYS.UP || kc === KEYS.DOWN ) {
            const target$ = $( event.target );

            if ( target$.hasClass( C_ITEM_GROUP ) ) {
                target$.find( selItemOptions ).first().trigger( EVENT_FOCUS );
            } else{
                const curItem$ = target$.closest( SEL_ITEM_OPTION ),
                    travelDirection = kc === KEYS.UP ? "prevAll" : "nextAll",
                    next$ = curItem$[ travelDirection ]( selItemOptions ).first(),
                    nextGroup$ = curItem$.closest( SEL_ITEM_SUBGROUP )[ travelDirection ]().first();

                if ( next$[0] ) {
                    next$.trigger( EVENT_FOCUS );
                } else if ( nextGroup$[0] ) {
                    // If next$ is empty, it is still possible to navigate to the next item in another sub group

                    let groupItems$ = nextGroup$.find( selItemOptions ),
                        groupNextItem$;

                    groupNextItem$ = kc === KEYS.UP ? groupItems$.last() : groupItems$.first();
                    groupNextItem$.trigger( EVENT_FOCUS );
                }
            }

            // This prevents change event on radio groups, which is desired so that the report doesn't refresh just
            // because of moving through the radio group with the keyboard
            event.preventDefault();
        } else if ( kc === KEYS.ENTER || kc === KEYS.SPACE )  {
            const itemOption = $( event.target ).filter( SEL_ITEM_OPTION )[0];

            if ( itemOption ) {
                // enter doesn't typically change a checkbox or radio button but in this case we want something like listbox behavior
                toggleListItemValue( itemOption, { enter: kc === KEYS.ENTER }, noDeselection );
            }

            // Prevents scrolling when in a popup for Smart Filters, and submitting the page on ENTER.
            event.preventDefault();
        }
    }

    function listOptionClick( event, noDeselection ) {
        let itemOption = $( event.target ).filter( SEL_ITEM_OPTION )[ 0 ];

        if ( !itemOption ) { // sometimes in popup dialogs the even is propagated correctly so find option root with this selector
            itemOption = $( event.target ).closest( "div.apex-item-option" )[0];
        }
        if ( itemOption ) {
            toggleListItemValue( itemOption, { enter: false }, noDeselection );
        }
    }

    function listChangeHandler( el$, control, setValue ) {
        let list$ = el$.find( SEL_ITEM_GROUP ),
            isRange = control.type === FCT_RANGE_LIST;

        list$.on( EVENT_CHANGE, ( _, data ) => {
            let begin, end,
                // list changes are 'done' when the enter key is pressed
                done = ( data && data.enter ) || false,
                values = [],
                group$ = el$.find( SEL_ITEM_GROUP );

            addListValues( list$, isRange, values );
            delaySortList( el$, control );
            // if list is single selection and also has a range clear out the range when a list selection is made.
            if ( values.length > 0 && !control.multiple && isRange && !control.noManualEntry ) {
                setRangeValue( el$, control, [] );
            }
            if ( isRange && control.multiple && !control.noManualEntry ) {
                const begin$ = isDateOrTS( control ) ? el$.find( SEL_JS_BEGIN )[0]?._wrappedElement$ : el$.find( SEL_JS_BEGIN ),
                      end$ = isDateOrTS( control ) ? el$.find( SEL_JS_END )[0]?._wrappedElement$ : el$.find( SEL_JS_END );

                begin = convertInputToServer( begin$.val(), control );
                end = convertInputToServer( end$.val(), control );
                if ( rangeIsComplete( control, begin, end ) ) {
                    values.push( {b: begin, e: end} );
                }
            }
            setValue( control, values, done );

            if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( control.type ) ) {
                // TODO Fix duplicated function calling when facet.options.batch == false and they will be called on sortList()
                listSetTabTarget( group$, control );
            }
        } ).on( "keydown", event => {
            listOptionKeydown( event, control );
        } ).on( EVENT_CLICK, listOptionClick );
    }

    function updateList( el$, baseId, control, counts, format ) {
        const values = control.values,
            group$ = el$.find( SEL_ITEM_GROUP ),
            currentValues = stringToValue( getFacetItemValue( control ) );

        for ( let i = 0; i < values.length; i++ ) {
            let strCount,
                item = values[i],
                id = baseId + "_" + i,
                count = counts[item.r] || 0,
                input$ = el$.find( "#" + id ),
                item$ = input$.parent(),
                count$ = item$.find( SEL_BADGE ),
                disabled = control.hasFeedback && count === 0
                    // Item won't be disabled or hidden if it is selected
                    && !currentValues.some( element => {
                        if ( control.type === FCT_RANGE_LIST ) {
                            let itemValue = ( stringToValue( item.r ) || [{ b: '', e: '' }] )[ 0 ] ;
                            return element.b === itemValue.b && element.e === itemValue.e;
                        }

                        return element === item.r;
                    } );

            // Make the option look disabled but don't actually disable the radio input so user can make another choice
            item$.toggleClass( C_DISABLED, disabled );
            if (  [ FCT_CHECKBOX, FCT_RADIO ].includes( input$[0].type ) ) {
                input$.attr( A_DISABLED, disabled );
                input$.parent( SEL_ITEM_OPTION ).attr( "aria-disabled", disabled );
            }
            strCount = count === 0 ? "" : format( count );
            count$.attr( D_COUNT, count )
                .text( strCount )
                .attr( A_LABEL, strCount ? " " + lang.formatMessage( "APEX.FS.COUNT_RESULTS", strCount ) : "" );
        }

        // After disabling or hiding options with count = 0 we need to update the tab target
        if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( control.type ) ) {
            listSetTabTarget( group$, control );
        }
        sortList( el$, control );
    }

    function delaySortList( el$, control ) {
        if ( !control.hasFeedback ) {
            setTimeout( function() {
                sortList( el$, control );
            }, 350 );
        } // otherwise this will happen when update is called
    }

    function sortList( el$, control ) {
        let orderByCount = control.orderByCount,
            checkedFirst = control.checkedFirst,
            disabledLast = control.disabledLast;

        // The client handles sorting the list item UI for these two cases:
        // checkedFirst: move selected to top option. This happens when the list value changes
        // disabledLast: move disabled to end option. This happens when counts are updated
        // In both cases prefer to do just once after the counts are updated (see updateList)
        // but if not getting any feedback then disabled isn't possible so just update after the value changes
        // see delaySortList.
        if ( checkedFirst || disabledLast || orderByCount ) {
            let sorted$, focusedValue,
                focused$ = $( document.activeElement ),
                group$ = el$.find( SEL_ITEM_GROUP );

            // update sort order


            // If the apex-item-option or the input is clicked, it always set the focused$ to the input element
            if ( focused$.hasClass( C_ITEM_OPTION ) ) {
                focused$ = $( document.activeElement ).find( HTML_TAG_INPUT );
            }

            if ( focused$.closest( group$ ).length ) {
                focusedValue = focused$.val();
            }
            sorted$ = group$.children().toArray().sort( ( a, b ) => {
                var ret = 0;

                //  C & !D = 1
                // !C & !D = 2
                //  C &  D = 3
                // !C &  D = 4
                function sortVal1( el ) {
                    var el$ = $( el );
                    return 2 + ( ( checkedFirst && el$.hasClass( C_CHECKED ) ) ? -1 : 0 ) +
                        ( ( disabledLast && el$.hasClass( C_DISABLED ) ) ? 2 : 0 );
                }

                function sortVal2( el ) {
                    return toInteger( $( el ).find( SEL_BADGE ).attr( D_COUNT ) ) || 0;
                }

                function sortVal3( el ) {
                    return toInteger( $( el ).attr( D_ORDER ) );
                }

                if ( checkedFirst || disabledLast ) {
                    ret = sortVal1( a ) - sortVal1( b );
                }
                if ( orderByCount && ret === 0 ) {
                    ret = sortVal2( b ) - sortVal2( a ); // desc
                }
                if ( ret === 0 ) {
                    ret = sortVal3( a ) - sortVal3( b );
                }
                return ret;
            } );
            group$.children().detach();
            group$.append( sorted$ );
            // If an item option was focused before the sorting started, it returns the focus to the option item
            if ( focusedValue ) {
                group$.find( `input[value='${util.escapeCSS( focusedValue )}']` ).parent().trigger( EVENT_FOCUS );
            }

            if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( control.type ) ) {
                // Because the DOM nodes were moved the tab target could have moved, so we set it again
                listSetTabTarget( group$, control );
            }
        }
    }

    // It gets the label for the value that is passed on, by default it will try to return the text only column,
    // if control attribute escape HTML equal true or parameter stripHTML equal true, the return value will be escaped.
    function getLabelForListValue( control, value, stripHTML, textOnlyColumn = true ) {
        let values = control.values;

        if ( typeof value === TYPE_OBJECT ) {
            value = ( value.b || "" ) + RANGE_SEP + ( value.e || "" );
        }
        for ( let i = 0; i < values.length; i++ ) {
            let item = values[i],
                itemLabel;

            if ( value === item.r ) {
                if ( item.l && textOnlyColumn ) {
                    itemLabel = item.l;
                } else if ( ( typeof stripHTML === "undefined" && !control.escape ) || stripHTML )  {
                    itemLabel = util.stripHTML( item.d );
                } else {
                    itemLabel = item.d;
                }
                return itemLabel;

            }
        }
        return null;
    }

    function setListValue( el$, control, value ) {
        let notFound = [],
            group$ = el$.find( SEL_ITEM_GROUP );

        el$.find( HTML_TAG_INPUT )
            .prop( "checked", false )
            .parent()
            .removeClass( C_CHECKED )
            .attr( A_ARIA_SELECTED, "false" )
            .removeAttr( A_ARIA_CHECKED ); // clear all
        for ( let i = 0; i < value.length; i++ ) {
            let v = value[i];

            if ( typeof v === TYPE_OBJECT ) {
                v = ( v.b || "" ) + RANGE_SEP + ( v.e || "" );
            }
            // note this condition has a side effect of checking the input (if found)
            if ( !el$.find( "input[value='" + util.escapeCSS( v ) + "']" )
                    .prop( "checked", true ).parent()
                    .addClass( C_CHECKED ).attr( A_ARIA_SELECTED, "true" ).attr( A_ARIA_CHECKED, "true" ).length ) {
                notFound.push( value[i] );
            }
        }

        if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( control.type ) ) {
            listSetTabTarget( group$, control );
        }
        delaySortList( el$, control );
        return notFound;
    }

    function renderGoButton( out, control ) {
        if ( !control._noCtrlApply ) {
            out.markup( `<button class="a-Button ${ C_CTRL_APPLY }" type="button" disabled>` )
                .content( getFRMessage( "GO" ) )
                .markup( "</button>" );
        }
    }

    function renderNumberInput( pOut, pId, pClass, pControl, pAriaLabelledby, pAriaLabel ) {
        const ariaLabel = pAriaLabelledby ? null : pAriaLabel;

        pOut.markup( `<input type="number" value=""` )
            .attr( "class", `apex-item-text ${ pClass }` )
            .attr( A_ID, pId )
            .optionalAttr( A_MIN, pControl.min )
            .optionalAttr( A_MAX, pControl.max )
            .optionalAttr( "step", pControl.step )
            .optionalAttr( A_LBLBY, pAriaLabelledby )
            .optionalAttr( A_LABEL, ariaLabel )
            .markup( ">" );
    }

    // function to render a date picker
    function renderDatepicker( pOut, pId, pClass, pControl, pIsSmartFilter, pAriaLabelledby, pAriaLabel ) {
        const showTime = ( "" + pControl.formatMask ).toLowerCase().includes( "hh" ) ? true : null,
              validExample = date.format( new Date(), pControl.formatMask ),
              ariaLabel = pAriaLabelledby ? null : pAriaLabel;

        pOut.markup( `<a-date-picker value=""` )
            .attr( "class", pClass )
            .attr( A_ID, pId )
            .attr( "valid-example", validExample )
            .attr( "show-on", ( pIsSmartFilter || isFilterDialogFacet( pControl ) ) ? EVENT_CLICK : EVENT_FOCUS ) // prevent in Smart filters that Date Picker directly shows up
            .optionalAttr( A_LBLBY, pAriaLabelledby )
            .optionalAttr( A_LABEL, ariaLabel )
            .optionalAttr( A_MIN, convertServerToInput( pControl.min, pControl ) )
            .optionalAttr( A_MAX, convertServerToInput( pControl.max, pControl ) )
            .optionalAttr( "show-time", showTime )
            .optionalAttr( "format", pControl.formatMask )
            .markup( `></a-date-picker>` );
    }

    function renderOperatorInput( out, id, cls, control, labelledby, isSmartFilter ) {
        const EQUALS = "EQ",
              NOT_EQUALS = "NEQ",
              LOWER_THAN = "LT",
              LOWER_THAN_OR_EQUALS = "LTE",
              GREATER_THEN = "GT",
              GREATER_THAN_OR_EQUALS = "GTE",
              STARTS_WITH = "STARTS",
              NOT_STARTS_WITH = "NSTARTS",
              CONTAINS = "C",
              NOT_CONTAINS = "NC";

        let optionsArray = [ EQUALS, NOT_EQUALS ]; // options that are needed for every data type

        // add different operator filter types depending on the data type
        switch ( control.dataType ) {
            case DATA_TYPE_NUMBER:
            case DATA_TYPE_DATE:
            case DATA_TYPE_TIMESTAMP:
            case DATA_TYPE_TIMESTAMP_TZ:
            case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
                optionsArray = optionsArray.concat( [ LOWER_THAN, LOWER_THAN_OR_EQUALS, GREATER_THEN, GREATER_THAN_OR_EQUALS ] );
                break;
            case DATA_TYPE_VARCHAR2:
                optionsArray = optionsArray.concat( [ STARTS_WITH, NOT_STARTS_WITH, CONTAINS, NOT_CONTAINS ] );
                break;
            default:
                throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ control.dataType }` );
        }

        if ( isSmartFilter ) { // when it's a smart filter region then render checkboxes
            renderOpenListGroup( out, undefined, false, control, getFRMessage( "INPUT_OPERATOR" ) );

            // render checkboxes
            optionsArray.forEach( function( pValue, pIndex ) {
                const radioId = `${ id }_${ pIndex }`;

                renderCheckboxRadio(
                    out, // out
                    radioId, // baseId
                    "irg", // suffix
                    `${ C_ITEM_OPTION } ${ cls }`, //cls
                    { // item
                        d: getFRMessage( `INPUT_OPERATOR.${ pValue }` ),
                        r: pValue,
                        order: pIndex
                    },
                    true, // escape
                    false, // showCount
                    false // multiple
                );
            } );

            renderCloseListGroup( out );
        } else { // for faceted region render a select list item
            out.markup( `<select class="selectlist apex-item-select ${ cls }" size="1" aria-required="true" value=""` )
                .attr( A_ID, id )
                .optionalAttr( "step", control.step )
                .optionalAttr( A_LABEL, getFRMessage( "INPUT_OPERATOR" ) )
                .markup( ">" );

            // add select list options
            optionsArray.forEach( pValue => {
                out.markup( "<option" )
                   .optionalAttr( "selected", pValue === control.operator ? "true" : "" )
                   .attr( "value", pValue )
                   .markup( ">" )
                   .content( getFRMessage( `INPUT_OPERATOR.${ pValue }` ) )
                   .markup( "</option>" );
            } );

            out.markup( "</select>" );
        }
    }

    function renderTextInput( pOut, pId, pClass, pAriaLabelledby, pAriaLabel ) {
        const ariaLabel = pAriaLabelledby ? null : pAriaLabel;

        pOut.markup( `<input type="text" value=""` )
            .attr( "class", `apex-item-text ${ pClass }` )
            .attr( A_ID, pId )
            .optionalAttr( A_LBLBY, pAriaLabelledby )
            .optionalAttr( A_LABEL, ariaLabel )
            .markup( ">" );
    }

    function getRangeBeginLabel() {
        return getFRMessage( "RANGE_BEGIN" );
    }

    function getRangeEndLabel( pControl ) {
        return pControl.rangeText;
    }

    function getInputLabel() {
        return getFRMessage( "INPUT_VALUE" );
    }

    function renderRangeInput( out, id, labelId, start, control, isSmartFilter ) {
        const jsClass = start ? C_JS_BEGIN : C_JS_END,
              inputAriaLabel = start ? getRangeBeginLabel() : null,
              lblId = id + "_lbl";

        if ( control.prefixText ) {
        out.markup( "<span" )
            .attr( A_ID, lblId )
            .markup( ` class="${ C_FS_RANGE }Prefix">` )
            .content( control.prefixText )
            .markup( SPAN_C );
        }

        switch ( control.dataType ) {
            case DATA_TYPE_DATE:
            case DATA_TYPE_TIMESTAMP:
            case DATA_TYPE_TIMESTAMP_TZ:
            case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
                renderDatepicker( out, id, jsClass, control, isSmartFilter, null, inputAriaLabel );
                break;
            case DATA_TYPE_NUMBER:
                renderNumberInput( out, id, jsClass, control, null, inputAriaLabel );
                break;
            default:
                throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ control.dataType }` );
        }
        if ( control.suffixText ) {
            out.markup( "<span" )
                .attr( A_ID, lblId )
                .markup( ` class="${ C_FS_RANGE }Suffix">` )
                .content( control.suffixText )
                .markup( SPAN_C );
        }
    }

    // check if there are any control that should be shown in filter dialog
    function hasFilterDialogFacets ( pControls ) {
        let returnValue = false;

        pControls.forEach( ( element ) => {
            if ( element.displayAs === DISPLAY_TYPE_FILTER_DIALOG ) {
                returnValue = true;
                return true;
            }
        } );
        return returnValue;
    }

    // check if facet should be shown in filter dialog
    function isFilterDialogFacet ( pControl ) {
        return (   pControl?.displayAs === DISPLAY_TYPE_FILTER_DIALOG
                || pControl?._groupDisplayAs === DISPLAY_TYPE_FILTER_DIALOG );
    }

    // check if control is of type date or timestamp (local) (tz)
    function isDateOrTS( pControl ) {
        return [ DATA_TYPE_DATE, DATA_TYPE_TIMESTAMP, DATA_TYPE_TIMESTAMP_TZ, DATA_TYPE_TIMESTAMP_LOCAL_TZ ].includes( pControl.dataType );
    }

    // check if a facet has a value
    function isEmptyFacet ( pControl, pCheckChildren ) {
        let childHasValue;
        if ( pCheckChildren && pControl._children?.length > 0 ) {
            pControl._children.forEach( ( controlName ) => {
                if ( getFacetItemValue( { name: controlName } ) !== "" ) {
                    childHasValue = true;
                    return false;
                }
            } );

            if ( childHasValue ) {
                return false;
            } else {
                return true;
            }
        } else {
            return ( getFacetItemValue( pControl ) === "" );
        }
    }

    // we have the problem that when values are undefined we show this e.g.
    // in range chip labels, so this function allows to show an empty string
    // instead of undefined in the label
    function formatValueForLabel( pValue ) {
        if ( pValue === undefined ) {
            return "";
        }
        return pValue;
    }

    function renderRange( out, baseId, labelId, control, isSmartFilter ) {
        let id = `${ util.escapeCSS( baseId ) }_ib`;

        out.markup( `<div class="${ C_FS_RANGE } ${ C_FS_RANGE }--${ isDateOrTS( control ) ? `date-picker` : "number" }">` );
        renderRangeInput( out, id, labelId, true, control, isSmartFilter );
        id = `${ baseId }_ie`;
        out.markup( `<label for="${ util.escapeHTMLAttr( id ) + ( isDateOrTS( control ) ? "_input" : "" ) }" class="${ C_FS_RANGE }To">` )
            .content( getRangeEndLabel( control ) )
            .markup( "</label>" );
        renderRangeInput( out, id, labelId, false, control, isSmartFilter );
        renderGoButton( out, control );
        out.markup( DIV_C );
    }

    function rangeIsComplete( control, begin, end ) {
        return ( !control.allowOpen && begin !== "" && end !== "" ) || ( control.allowOpen && (  begin !== "" || end !== "" ) );
    }

    // validate the given inputs and show validation errors if needed
    // this function also hide the batch apply button if needed
    function handleValidation( pElement$, pControl ) {
        const id = pElement$.attr( "id" ),
              placeholderId = `${ id }_error_placeholder`;
        let apexItem,
            label,
            validity,
            ret = true;

        message.clearErrors( id );
        $( "#" + util.escapeCSS( placeholderId ) ).remove(); // remove error placeholder container because it's not auto removed

        switch ( pControl.dataType ) {
            case DATA_TYPE_DATE:
            case DATA_TYPE_TIMESTAMP:
            case DATA_TYPE_TIMESTAMP_TZ:
            case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
                // web component based items automatically support apex.item api, so it makes sense to use also the validation functionality of it
                apexItem = item( id );
                validity = apexItem.getValidity();
                if ( !validity.valid ) {
                    ret = false;
                }
                break;
            case DATA_TYPE_NUMBER:
            case DATA_TYPE_VARCHAR2:
                break;
            default:
                throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ pControl.dataType }` );
        }
        if ( !ret ) {
            // use show Error API to show errors as we do for normal page items
            if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( pControl.type ) && pElement$.hasClass( C_JS_BEGIN ) ) {
                label = getRangeBeginLabel();
            } else if ( [ FCT_LIST, FCT_RANGE_LIST ].includes( pControl.type ) && pElement$.hasClass( C_JS_END ) ) {
                label = getRangeEndLabel( pControl );
            } else {
                label = getInputLabel();
            }

            // render placeholder to keep markup of message.showError under control
            let placeholder = $( "<div>" );

            placeholder.addClass( "a-Form-error" )
                       .attr( A_ID, placeholderId )
                       .attr( "data-template-id", gErrorPlaceholderTemplateId );
            pElement$.append( placeholder );

            message.showErrors( [
                {
                    type:       message.TYPE.ERROR,
                    location:   [ "inline" ],
                    pageItem:   id,
                    message:    apexItem.getValidationMessage( label )
                }
            ] );

            pElement$.closest( `.${ C_FC }` ).find( `.${ C_FS_APPLY }` ).hide(); // maybe not the best place for this but we need to hide the button when validation fails
        }
        return ret;
    }

    function rangeChangeHandler( el$, control, setValue ) {
        let begin$ = isDateOrTS( control ) ? el$.find( SEL_JS_BEGIN )[0]?._wrappedElement$ : el$.find( SEL_JS_BEGIN ),
            end$ = isDateOrTS( control ) ? el$.find( SEL_JS_END )[0]?._wrappedElement$ : el$.find( SEL_JS_END ),
            events = "keyup change";

        function set( complete, begin, end, done = false ) {
            let values = [];

            if ( control.multiple && control.values.length > 0 ) {
                addListValues( el$.find( SEL_ITEM_GROUP ), true, values );
                delaySortList( el$, control );
            }
            if ( complete ) {
                // todo ignore validation errors? some ignores min > max but some switched them. Validate on client or server?
                // distinct value and display value for min, max?
                // todo needs validation data type string, number, integer, date, absolute min and max,  and min < max
                values.push( {
                    b: convertInputToServer( begin, control ),
                    e: convertInputToServer( end, control )
                } );
            }
            setValue( control, values, done );
        }

        // add min max handling for date pickers
        if ( isDateOrTS( control ) ) {
            events = EVENT_CHANGE;
        }

        el$.find( SEL_FS_RANGE ).on( events, function() {
            const begin = begin$.val(),
                  end = end$.val(),
                  complete = rangeIsComplete( control, begin, end ),
                  beginDatePicker$ = el$.find( SEL_JS_BEGIN ),
                  endDatePicker$ = el$.find( SEL_JS_END ),
                  validBegin = handleValidation( beginDatePicker$, control ),
                  validEnd = handleValidation( endDatePicker$, control );

            if ( validBegin ) {
                endDatePicker$.attr( A_MIN, begin );
            } else {
                endDatePicker$.removeAttr( A_MIN );
            }

            if ( validEnd ) {
                beginDatePicker$.attr( A_MAX, end );
            } else {
                beginDatePicker$.removeAttr( A_MAX );
            }

            // maybe something has changed check for both begin and end inputs having a value
            // if starting to enter a manual range and also have a radio group list of values
            if ( control.values && control.values.length > 0 && !control.multiple && ( begin !== "" || end !== "" ) && validBegin && validEnd ) {
                setListValue( el$, control, [] ); // clear any radio selection
            }

            if ( control._noCtrlApply ) {
                if ( isFilterDialogFacet( control )  ) {
                    const applyButton$ = el$.closest( `.${ C_FILTER_DIALOG_POPUP }` ).find( `.${ C_CTRL_APPLY }` );

                    if ( !complete || !( validBegin && validEnd ) ) {
                        applyButton$.prop( A_DISABLED, true );
                    } else {
                        applyButton$.prop( A_DISABLED, false );
                        set( complete, begin, end );
                    }
                } else if ( !control._complete && validBegin && validEnd ) {
                    set( complete, begin, end );
                }
            } else {
                el$.find( `.${ C_CTRL_APPLY }` ).prop( A_DISABLED, !complete || !( validBegin && validEnd ) );
            }
        } ).on( "keydown", HTML_TAG_INPUT, function( event ) {
            let key = event.which;

            if ( key === KEYS.ENTER ) {
                event.preventDefault();
            }
            if ( key === KEYS.ENTER || ( key === KEYS.ESCAPE && control._complete ) ) {
                const begin = begin$.val(),
                  end = end$.val(),
                  complete = rangeIsComplete( control, begin, end ),
                  beginDatePicker$ = el$.find( SEL_JS_BEGIN ),
                  endDatePicker$ = el$.find( SEL_JS_END ),
                  validBegin = handleValidation( beginDatePicker$, control ),
                  validEnd = handleValidation( endDatePicker$, control );

                if ( validBegin ) {
                    endDatePicker$.attr( A_MIN, begin );
                } else {
                    endDatePicker$.removeAttr( A_MIN );
                }

                if ( validEnd ) {
                    beginDatePicker$.attr( A_MAX, end );
                } else {
                    beginDatePicker$.removeAttr( A_MAX );
                }

                if ( validBegin && validEnd ) {
                    set( complete, begin, end, true );
                }
            }
        } );
        el$.find( `.${ C_CTRL_APPLY }` ).on( EVENT_CLICK, function () {
            let begin = begin$.val(),
                end = end$.val(),
                complete = rangeIsComplete( control, begin, end );

            set( complete, begin, end );
        } );
    }

    function getLabelForRangeValue( control, value ) {
        const formatMessage = isDateOrTS( control ) ? lang.formatMessageNoEscape : lang.formatMessage;

        if ( value.b === "" ) {
            return formatMessage( control.currentLabelOpenLow, formatValueForLabel( convertServerToInput( value.e, control ) ) );
        } else if ( value.e === "" ) {
            return formatMessage( control.currentLabelOpenHi, formatValueForLabel( convertServerToInput( value.b, control ) ) );
        } else {
            return formatMessage(
                control.currentLabel,
                formatValueForLabel( convertServerToInput( value.b, control ) ),
                formatValueForLabel( convertServerToInput( value.e, control ) )
            );
        }
    }

    function setRangeValue( el$, control, value ) {
        let begin$ = isDateOrTS( control ) ? el$.find( SEL_JS_BEGIN )[0]?._wrappedElement$ : el$.find( SEL_JS_BEGIN ),
            end$ = isDateOrTS( control ) ? el$.find( SEL_JS_END )[0]?._wrappedElement$ : el$.find( SEL_JS_END );

        if ( typeof value === TYPE_OBJECT ) {
            begin$.val( convertServerToInput( value.b, control ) );
            end$.val( convertServerToInput( value.e, control ) );

            // set min/max for date pickers
            if ( isDateOrTS( control ) ) {
                if ( value.e ) {
                    begin$.attr( A_MAX, value.e );
                }
                if ( value.b ) {
                    end$.attr( A_MIN, value.b );
                }
            }
        } else {
            begin$.val( "" );
            end$.val( "" );
        }
        el$.find( `.${ C_CTRL_APPLY }` ).attr( A_DISABLED, !rangeIsComplete( control, begin$.val(), end$.val() ) );
    }

    // TODO think about refining the element el$ passed to the function so there is no need to travers the DOM up
    function isFiltered ( el$ ) {
        let filter$, isFiltered, control$;

        control$ = el$.closest( SEL_JS_CONTROL_ROOT );
        filter$ = control$.find( SEL_FILTER );
        isFiltered = ( filter$.find( `${ HTML_TAG_INPUT }[type="search"]` ).val() || "" ).length > 0;

        return isFiltered;
    }

    // Returns only the items that can be selected on that moment
    function controlItemOptions( el$, control ) {
        let items$, control$;

        if ( isFiltered( el$ ) ) {
            // filtering has a negative impact on show more/show less functionality, when filtering, the set of items
            // to show/hide are limited to those that match the search term.
            items$ = control.matchFilterItems$;
        } else {
            control$ = el$.closest( SEL_JS_CONTROL_ROOT );

            // find the items that can be visible in the list
            items$ = control$.find( SEL_ITEM_OPTION );
            if ( control.hideEmpty ) {
                items$ = items$.not( "." + C_DISABLED );
            }
        }

        return items$;
    }

    function allItemsDisplayed( el$, control ) {
        const items$ = controlItemOptions( el$, control ) ,
            canBeVisibleItems = items$.length,
            visibleItems = items$.not( SEL_HIDDEN ).length;

        return canBeVisibleItems === visibleItems;
    }

    // Control can be filtered only when possible items to display are greater than the initial displayed entries
    function canBeFiltered( el$, control ) {
        const items$ = controlItemOptions( el$, control );

        return ( items$.length > ( control.showAllCount + control.showAllGrace ) ) || control.showAllCount === SHOW_ALL_STEP_SIZE;
    }

    // Evaluates if the control supports client-side filtering
    function hasFilter( control ) {
        return control.actionsFilter || control.filterValues || false;
    }
    function noFilter() {
        return false;
    }

    // get the value for the input operator
    function getOperatorValue( el$, isSmartFilter, hasFlexibleOperator ) {
        if ( !hasFlexibleOperator ) {
            return null;
        }

        if ( isSmartFilter ) {
            return el$.find( ".a-FS-inputOperatorValue > input:checked" ).val();
        } else {
            return el$.find( ".a-FS-inputOperatorValue" ).val();
        }
    }

    // set the value for the input operator
    function setOperatorValue( el$, control, isSmartFilter, value ) {
        const inputOperator$ = el$.find( ".a-FS-inputOperatorValue" ),
              radioGroup$ = el$.find( ".apex-item-radio" );

        value = value.split( VAL_SEP )[0] || control.operator;
        if ( isSmartFilter ) {
            setListValue( radioGroup$, control, [value] );
            listSetTabTarget( radioGroup$, control );
        } else {
            inputOperator$.val( value );
        }
    }

    //
    // List
    //
    addControlType( "list", {
        render: function( out, baseId, labelId, control, isSmartFilter, ariaLabel ) {
            renderList( out, baseId, labelId, control, ariaLabel );
        },
        init: function( el$, control, setValue ) {
            listChangeHandler( el$, control, setValue );
        },
        update: function( el$, baseId, control, counts, format ) {
            updateList( el$, baseId, control, counts, format );
        },
        getLabelForValue: function( control, value, stripHTML, textOnlyColumn ) {
            return getLabelForListValue( control, value, stripHTML, textOnlyColumn );
        },
        setValue: function( el$, control, value ) {
            setListValue( el$, control, value );
        },
        canBeFiltered: function( el$, control ) {
            return canBeFiltered ( el$, control );
        },
        isFiltered: isFiltered,
        controlItemOptions: function ( el$, control ) {
            return controlItemOptions( el$, control );
        },
        allItemsDisplayed: function ( el$, control ) {
            return allItemsDisplayed( el$, control );
        },
        hasFilter: hasFilter
    } );

    //
    // group
    // A group has no value of its own, no markup and no behavior.
    // It is not really a facet. It just groups checkbox controls
    //
    addControlType( FCT_GROUP, {
        render: function( /* out, baseId, labelId, control */ ) {
            // nothing to render
        },
        init: function( /* el$, control, setValue */ ) {
            // nothing to initialize
        },
        update: function( el$, baseId, control /* , counts, format */ ) {
            // no counts to update but do sort all the checkboxes
            sortList( el$, control );
        },
        setValue: function( /* el$, control, value */ ) {
            // no value to set
        },
        hasFilter: noFilter
    } );

    //
    // checkbox
    //
    addControlType( FCT_CHECKBOX, {
        render: function( out, baseId, labelId, control ) {
            renderCheckboxRadio( out, baseId, "cb", C_ITEM_OPTION, {
                    d: control.label,
                    r: control.value,
                    i: control.icon,
                    order: control.order
                }, control.escape, control.showCounts, true, baseId );
        },
        init: function( el$, control, setValue ) {
            el$.on( EVENT_CHANGE, function() {
                let input$ = el$.find( HTML_TAG_INPUT ),
                    value = "",
                    checked = input$.prop( "checked" );

                if ( checked ) {
                    value = input$.val();
                }
                el$.toggleClass( C_CHECKED, checked );
                setValue( control, value );
            } ).on( "keydown",  event => {
                    listOptionKeydown( event, control );
            } ).on( EVENT_CLICK, listOptionClick );
        },
        update: function( el$, baseId, control, counts, format ) {
            let strCount,
                count = counts[control.value] || 0,
                input$ = el$.find( HTML_TAG_INPUT ),
                count$ = el$.find( SEL_BADGE ),
                disabled = control.hasFeedback && count === 0;

            el$.toggleClass( C_DISABLED, disabled );
            input$.attr( A_DISABLED, disabled );
            strCount = count === 0 ? "" : format( count );
            count$.attr( D_COUNT, count )
                .text( strCount )
                .attr( A_LABEL, strCount ? " " + lang.formatMessage( "APEX.FS.COUNT_RESULTS", strCount ) : "" );
        },
        getLabelForValue: function( control /*, value */ ) {
            return control.altLabel || control.label;
        },
        setValue: function( el$, control, value ) {
            var input$ = el$.find( HTML_TAG_INPUT ),
                checked = input$.val() === value[0]; // value is an array even though this type only deals with single values

            el$.toggleClass( C_CHECKED, checked );
            input$.prop( "checked", checked );
        },
        hasFilter: noFilter
    } );

    //
    // Range List
    //
    addControlType( FCT_RANGE_LIST, {
        render: function( out, baseId, labelId, control, isSmartFilter, ariaLabel ) {
            renderList( out, baseId, labelId, control, ariaLabel );
            if ( !control.noManualEntry ) {
                renderRange( out, baseId, labelId, control, isSmartFilter );
            }
        },
        init: function( el$, control, setValue ) {
            listChangeHandler( el$, control, setValue );
            if ( !control.noManualEntry ) {
                rangeChangeHandler( el$, control, setValue );
            }
        },
        update: function( el$, baseId, control, counts, format ) {
            updateList( el$, baseId, control, counts, format );
        },
        getLabelForValue: function( control, value, stripHTML, textOnlyColumn ) {
            let label = getLabelForListValue( control, value, stripHTML, textOnlyColumn );

            if ( label === null && !control.noManualEntry ) {
                label = getLabelForRangeValue( control, value );
            }
            return label;
        },
        setValue: function( el$, control, value ) {
            let extra = setListValue( el$, control, value );

            if ( !control.noManualEntry ) {
                if ( extra.length > 0 ) {
                    extra = extra[0];
                } else {
                    extra = "";
                }
                setRangeValue( el$, control, extra );
            }
        },
        canBeFiltered: function( el$, control ) {
            return canBeFiltered ( el$, control );
        },
        isFiltered: isFiltered,
        controlItemOptions: function ( el$, control ) {
            return controlItemOptions( el$, control );
        },
        allItemsDisplayed: function ( el$, control ) {
            return allItemsDisplayed( el$, control );
        },
        hasFilter: hasFilter
    } );

    //
    // Range
    //
    // todo future options based on data type; number, date, etc. and related options min, max, calendar display options etc.
    //    dates should use date picker
    addControlType( FCT_RANGE, {
        render: function( out, baseId, labelId, control, isSmartFilter ) {
            renderRange( out, baseId, labelId, control, isSmartFilter );
        },
        init: function( el$, control, setValue ) {
            rangeChangeHandler( el$, control, setValue );
        },
        // There are never any counts to show for a manual entry range
        // update: function( el$, baseId, control, counts, format )
        getLabelForValue: function( control, value ) {
            return getLabelForRangeValue( control, value );
        },
        setValue: function( el$, control, value ) {
            setRangeValue( el$, control, value[0] );
        },
        hasFilter: noFilter
    } );

    //
    // Input
    //
    // todo future options based on data type; number, date, etc. and related options min, max, calendar display options etc.
    //    dates should use date picker
    //
    addControlType( FCT_INPUT, {
        render: function( out, baseId, labelId, control, isSmartFilter ) {
            const id = baseId + "_i",
                  inputAriaLabel = getInputLabel();

            let lblId,
                labelIds = labelId;

            if ( control.flexibleOperator ) {
                out.markup( "<div class='a-FS-inputOperator'>" );
                renderOperatorInput( out, id + "fo", "a-FS-inputOperatorValue", control, labelIds, isSmartFilter );
                out.markup( "</div>" );
            }

            out.markup( "<div class='a-FS-input'>" );
            if ( control.inputLabel ) {
                lblId = id + "_lbl";
                labelIds += " " + lblId;
                out.markup( "<span" )
                    .attr( A_ID, lblId )
                    .markup( ` class="a-FS-inputLabel">` )
                    .content( control.inputLabel )
                    .markup( SPAN_C );
            }
            if ( control.suffixText ) {
                lblId = id + "_lbls";
                labelIds += " " + lblId;
            }

            switch ( control.dataType ) {
                case DATA_TYPE_DATE:
                case DATA_TYPE_TIMESTAMP:
                case DATA_TYPE_TIMESTAMP_TZ:
                case DATA_TYPE_TIMESTAMP_LOCAL_TZ:
                    renderDatepicker( out, id, C_INPUT_VALUE, control, isSmartFilter, lblId, inputAriaLabel );
                    break;
                case DATA_TYPE_NUMBER:
                    renderNumberInput( out, id, C_INPUT_VALUE, control, lblId, inputAriaLabel );
                    break;
                case DATA_TYPE_VARCHAR2:
                    renderTextInput( out, id, C_INPUT_VALUE, lblId, inputAriaLabel );
                    break;
                default:
                    throw new Error( `${ UNKNOWN_DATA_TYPE_MSG }${ control.dataType }` );
            }
            if ( control.suffixText ) {
                out.markup( "<span" )
                    .attr( A_ID, lblId )
                    .markup( " class='a-FS-inputSuffix'>" )
                    .content( control.suffixText )
                    .markup( SPAN_C );
            }
            renderGoButton( out, control );
            out.markup( DIV_C );
        },
        init: function( el$, control, setValue, isSmartFilter ) {
            const input$ = isDateOrTS( control ) ? el$.find( ".a-FS-inputValue" )[0]?._wrappedElement$ : el$.find( SEL_INPUT_VALUE ),
                  inputWrapper$ = el$.find( SEL_INPUT_VALUE ),
                  inputOperator$ = el$.find( ".a-FS-inputOperatorValue" );
            let events = "keyup change";

            function set( pOperator, pValue, pDone = false ) {
                let value = [];

                if ( pOperator ) {
                    value.push( pOperator );
                }
                value.push( convertInputToServer( pValue, control ) );
                setValue( control, value, pDone );
            }

            if ( control.flexibleOperator ) {
                if ( isSmartFilter ) {
                    inputOperator$
                        .on( "keydown",  event => {
                            const value = input$.val();

                            listOptionKeydown( event, control, true );
                            if ( event.which === KEYS.ENTER && value !== "" ) {
                                set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value );
                            }
                        } )
                        .on( EVENT_CLICK, event => {
                            const value = input$.val();

                            listOptionClick( event, true );
                            if ( value !== "" ) {
                                set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value, true );
                            }
                        } )
                        .on( "keyup change", event => {
                            const target$ = $( event.target ),
                                  radioGroup$ = el$.find( ".apex-item-radio" ),
                                  checked = target$.prop( "checked" );
                            let valueOperator;

                            if ( checked ) {
                                valueOperator = target$.val();
                            }
                            if ( valueOperator ) {
                                setListValue( radioGroup$, control, [valueOperator] );
                                listSetTabTarget( el$, control );
                            }
                        } );
                } else {
                    inputOperator$.on( EVENT_CHANGE, util.debounce( () => {
                        const value = input$.val(),
                              valid = handleValidation( inputWrapper$, control );

                        if ( value !== "" && valid ) {
                            set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value, true );
                        }
                    }, 400 ) ); // set debounce to allow keyboard users to select the correct value without firing change event multiple times
                }
            }

            if ( isDateOrTS( control ) ) {
                events = EVENT_CHANGE;
            }

            el$.find( ".a-FS-input" ).on( events, () => {
                const value = input$.val(),
                      hasValue = value !== "",
                      valid = handleValidation( inputWrapper$, control );

                if ( control._noCtrlApply ) {
                    if ( !control._complete && valid ) {
                        set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value, true );
                    }
                } else {
                    if ( isFilterDialogFacet( control )  ) {
                        el$.closest( `.${ C_FILTER_DIALOG_POPUP }` ).find( `.${ C_CTRL_APPLY }` ).prop( A_DISABLED, !hasValue || !valid );
                    } else {
                        el$.find( `.${ C_CTRL_APPLY }` ).attr( A_DISABLED, !hasValue || !valid );
                    }
                }
            } ).on( "keydown", HTML_TAG_INPUT, function( event ) {
                const value = input$.val(),
                      key = event.which;

                if ( key === KEYS.ENTER ) {
                    event.preventDefault();
                }
                if ( key === KEYS.ENTER || ( key === KEYS.ESCAPE && control._complete ) ) {
                    const valid = handleValidation( inputWrapper$, control );
                    if ( valid ) {
                        set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value, true );
                    }
                }
            } );

            el$.find( `.${ C_CTRL_APPLY }` ).on( EVENT_CLICK, function () {
                const value = input$.val();

                set( getOperatorValue( el$, isSmartFilter, control.flexibleOperator ), value, true );
            } );
        },
        // There are never any counts to show for an input control
        // update: function( el$, baseId, control, counts, format )
        getLabelForValue: function( control, value, operator ) {
            let label;

            if ( control.currentLabel && control.currentLabel !== MSG_INPUT_CURRENT_LABEL ) {
                label = control.currentLabel;
                if ( !label.includes( "%0" ) ) {
                    throw new Error( `Current label attribute of the ${ control.name } facet must include %0.` );
                }
            } else {
                label = `${ MSG_INPUT_CURRENT_LABEL }_${ operator || control.operator }`;
            }
            if ( isDateOrTS( control ) ) {
                return lang.formatMessageNoEscape( label, formatValueForLabel( convertServerToInput( value, control ) ) );
            } else {
                return lang.formatMessage( label, formatValueForLabel( convertServerToInput( value, control ) ) );
            }
        },
        controlItemOptions: function ( el$, control ) {
            return controlItemOptions( el$, control );
        },
        setValue: function( el$, control, value, isSmartFilter  ) {
            const input$ = el$.find( SEL_INPUT_VALUE );

            if ( control.flexibleOperator ) {
                let operator = value;

                if ( Array.isArray( value ) ) {
                    operator = value[0] || control.operator;
                    value = value.pop(); // remove operator value from array
                } else {
                    value = value.split( VAL_SEP );
                    operator = value[0];
                    value = value[1];

                }
                setOperatorValue( el$, control, isSmartFilter, operator );
            }

            if ( Array.isArray( value ) ) { // value could be an array but this control only deals with single values.
                value = value[0] || "";
            }
            value = convertServerToInput ( value, control );
            input$.val( value );
            el$.find( `.${ C_CTRL_APPLY }` ).attr( A_DISABLED, value === "" );
        },
        hasFilter: noFilter
    } );

    //
    // Star Rating
    //
    // This is similar to a list with multiple false but the matching is done with a relational operator such as >=.
    // The number of stars is determined by the number of values. The values must be sorted in the desired order.
    addControlType( "starRating", {
        render: function( out, baseId, labelId, control ) {
            var i, j, item, label, color, icon,
                numStars = control.values.length;

            control.multiple = false;
            control.escape = false;
            control.checkedFirst = control.disabledLast = false; // these make no sense for this control type
            if ( control.maxSuffixText === "" ) {
                control.maxSuffixText = " "; // so below defaulting works
            }
            if ( control.activeIcon ) {
                // enhance the display labels
                for ( i = 0; i < numStars ; i++ ) {
                    item = control.values[i];
                    label = "<span class='star-rating-stars' aria-hidden='true'>";
                    color = control.activeColor || "red";
                    icon = control.activeIcon;
                    for ( j = 0; j < numStars; j++ ) {
                        if ( j >= item.r ) {
                            icon = control.inactiveIcon || icon;
                            if ( control.inactiveColor ) {
                                color = control.inactiveColor;
                            } else {
                                break;
                            }
                        }
                        label += "<span class='" +
                            util.escapeHTMLAttr( icon ) + "' style='color:" + util.escapeHTMLAttr( color ) + ";'></span>";
                    }
                    label += item.r < numStars ? ( control.suffixText || "" ) : ( control.maxSuffixText || control.suffixText || "" );
                    label += "</span><span class='u-vh'>" +
                        lang.formatMessage( item.r < numStars ? control.itemLabel : ( control.maxItemLabel || control.itemLabel ) , item.r ) +
                        SPAN_C;
                    item.d = label;
                }
            }
            renderList( out, baseId, labelId, control );
        },
        init: function( el$, control, setValue ) {
            listChangeHandler( el$, control, setValue );
        },
        update: function( el$, baseId, control, counts, format ) {
            updateList( el$, baseId, control, counts, format );
        },
        getLabelForValue: function( control, value ) {
            return lang.formatMessage( value < control.values.length ? control.itemLabel : ( control.maxItemLabel || control.itemLabel ), value );
        },
        setValue: function( el$, control, value ) {
            setListValue( el$, control, value );
        },
        hasFilter: noFilter,
        useGetlabelForCharts: true
    } );

    //
    // Select List
    //
    // todo consider in the future replace with a JET selectOne element. Benefit is style and ability to have icons on the options.
    addControlType( "selectList", {
        render: function( out, baseId, labelId, control ) {
            var i, item, cls,
                curGroup = null,
                values = control.values;

            function option( d, v ) {
                out.markup( "<option" )
                    .attr( "value", v )
                    .markup( ">" )
                    .content( d )
                    .markup( "</option>" );
            }

            cls = "selectlist apex-item-select";
            if ( control.hideEmpty ) {
                cls += " a-FS--hideEmpty";
            }
            out.markup( `<div class='a-FS-selectListFilter'><select aria-labelledby='${labelId}'` )
                .attr( A_CLASS, cls ).markup( ">" );
            option( control.nullLabel, "" );
            for ( i = 0; i < values.length; i++ ) {
                item = values[i];
                if ( item.g && item.g !== curGroup ) {
                    if ( curGroup ) {
                        out.markup( "</optgroup>" );
                    }
                    curGroup = item.g;
                    out.markup( "<optgroup" )
                        .attr( "label", item.g )
                        .markup( ">" );
                }
                option( item.d, item.r );
            }
            if ( curGroup ) {
                out.markup( "</optgroup>" );
            }
            out.markup( "</select></div>" );
        },
        init: function( el$, control, setValue ) {
            const debouncedHandler = util.debounce( function() {
                setValue( control, [$( this ).val()] );
            }, 400 );
            el$.find( ".apex-item-select" ).on( EVENT_CHANGE, debouncedHandler );
        },
        update: function( el$, baseId, control, counts /*, format */ ) {
            var i, item, count, option$, disabled,
                values = control.values;

            for ( i = 0; i < values.length; i++ ) {
                item = values[i];
                count = counts[item.r] || 0;
                option$ = el$.find( "option[value='" + util.escapeCSS( item.r )+ "']" );
                disabled = control.hasFeedback && count === 0;

                if ( control.showCounts ) {
                    option$.text( item.d + ( count > 0 ? " (" + count + ")" : "" ) );
                }
                // make the option look disabled but don't actually disable so the user can easily switch option
                option$.toggleClass( C_DISABLED, disabled );
            }
        },
        getLabelForValue: function( control, value ) {
            return getLabelForListValue( control, value );
        },
        setValue: function( el$, control, value ) {
            value = value.length > 0 ? value[0] : "";
            el$.find( ".apex-item-select" ).val( value );
        },
        hasFilter: noFilter
    } );

} )( apex.util, apex.debug, apex.lang, apex.locale, apex.jQuery, apex.date, apex.item, apex.message, apex.widget );
