/*!
 * Copyright (c) 2012, 2024, Oracle and/or its affiliates.
 */

/**
 * The {@link apex.widget.util} namespace is used to store all widget utility functions of Oracle APEX.
 **/

/**
 * @namespace
 **/
apex.widget.util = {};

( function( widgetUtil, util, lang, navigation, $ ) {
    "use strict";

    const hasOwnProperty = util.hasOwnProperty,
        objectEntries = Object.entries,
        extend = $.extend;

    // this module loads before jQuery UI so can't rely on $.ui.keyCodes
    const KEY_BACKSPACE = 8,
        KEY_TAB = 9,
        KEY_ENTER = 13,
        KEY_ESCAPE = 27,
        KEY_SPACE = 32,
        KEY_LEFT = 37,
        KEY_UP = 38,
        KEY_RIGHT = 39,
        KEY_DOWN = 40,
        KEY_DELETE = 46,
        MAIN_MOUSE_BUTTON = 0;

    const E_MOUSEDOWN = "mousedown",
        E_CLICK = "click",
        E_FOCUSOUT = "focusout",
        E_KEYUP = "keyup",
        E_KEYDOWN = "keydown",
        E_FOCUS = "focus";

    const C_CHIP = "a-Chip",
        C_COMBOSELECT_LIST = "a-ComboSelect-list",
        SEL_COMBOSELECT_LIST = "." + C_COMBOSELECT_LIST,
        C_CHIPS = "a-Chips",
        C_CHIP_APPLIED = "a-Chip--applied",
        C_CHIP_INPUT = "a-Chip--input",
        SEL_CHIP_APPLIED = "." + C_CHIP_APPLIED,
        SEL_CHIP_LABEL= ".a-Chip-label",
        SEL_CHIP_TEXT = ".a-Chip-text > .a-Chip-value",
        C_CHIP_OVERFLOW = "a-Chip--overflow",
        SEL_CHIP_OVERFLOW = "." + C_CHIP_OVERFLOW,
        C_IS_ACTIVE = "is-active",
        SEL_IS_ACTIVE = "." + C_IS_ACTIVE,
        C_IS_FOCUSED = "is-focused",
        SEL_IS_FOCUSED = "." + C_IS_FOCUSED,
        C_IS_OVERFLOW = "is-overflow",
        C_IS_EMPTY = "is-empty",
        C_IS_SELECTED = "is-selected",
        C_IS_PRESELECTED = "is-preselected",
        SEL_IS_PRESELECTED = "." + C_IS_PRESELECTED,
        C_IS_PLACEHOLDER = "is-placeholder",
        C_NO_MATCHES = "has-no-matches",
        SEL_VISIBLE = ":visible",
        C_COMBO_ITEM = "a-ComboSelect-item",
        SEL_COMBO_ITEM = "." + C_COMBO_ITEM,
        C_EXPAND_BUTTON = "a-Button--comboSelect",
        SEL_EXPAND_BUTTON = "." + C_EXPAND_BUTTON,
        C_CHIPS_COUNTER = "a-ComboSelect-counter",
        SEL_CHIPS_COUNTER = "." + C_CHIPS_COUNTER,
        C_HIDDEN = "u-hidden",
        A_DATA_VALUE = "data-value",
        A_ARIA_EXPANDED = "aria-expanded",
        A_ARIA_SELECTED = "aria-selected",
        A_ARIA_CHECKED = "aria-checked",
        A_ARIA_PRESSED = "aria-pressed",
        A_ARIA_ACTIVEDESCENDANT = "aria-activedescendant",
        A_ARIA_CONTROLS = "aria-controls",
        A_ARIA_BUSY = "aria-busy",
        A_TABINDEX = "tabindex",
        A_LABELLEDBY = "aria-labelledby",
        A_LABEL = "aria-label",
        ACTION_SELECTION = "ITEM_SELECTED",
        ACTION_DELETION = "ITEM_DELETED",
        CHIPS = "chips",
        SEPARATED = "separated",
        START = "START",
        END = "END";

    const stringMatchTypes = {
        CONTAINS: "contains",
        START_WITH: "starts-with"
    };

    const REMOVE_ICON = `<span class="a-Chip-divider"></span>\
<span class="a-Chip-remove js-removeChip"><span class="a-Icon icon-multi-remove" aria-hidden="true"></span></span>`;

    /**
     * Internal use
     * Common code for combobox, select list and similar things
     *
     * Primary use cases
     * - Combobox (enterable) and Many or One/Single (multiValued):
     *                      multiValued
     *                      true        false
     * enterable    true    Combo Many  Combo One
     *              false   Select Many Select One
     *
     * - Control over the popup UI and filtering:
     *    This code handles popup UI and filtering and highlighting
     *        choices is an array of all the choices
     *    This code handles popup UI but external filtering and highlighting through callbacks
     *        choices is a function called to get filtered/highlighted choices
     *        findChoice callback must be implemented
     *    External popup UI and filtering
     *        onOpen callback required
     *        Ignored options: choiceTemplate, choices, autoComplete,
     *
     * Expected Markup
     *
     * <div>
     *   <ul class=""> // a-Chips a-Chips--applied and others added
     *     <li class="" [data-value="..."]>LABEL | <span class="a-Chip-label">...</span>
     *       <span class="a-Chip-text">...</span>
     *     </li>
     *     ...
     *     [<li class="a-Chip a-Chip--applied a-Chip--overflow">
     *       <span class="a-Chip-value">+3</span>
     *     </li>]
     * [<li class="apex-item-multi-item ...">
     * <input type="..." id="P9_PLOV5" name="P9_PLOV5" ???aria-describedby="P9_PLOV5_inline_help"
     * class="..." size="..." maxlength="" value=""/>
     * </li>] // added if not present
     * </ul>
     * [<button [aria-hidden="true"] type="button" class="a-Button a-Button--comboSelect" id="..." tabindex="-1">
     * <span class="a-Icon icon-popup-lov-under"></span>
     * </button>] // added if not preseet
     * </div>
     * xxx where to get the options from DOM, init options, model given in options or none
     *
     * Minimum:
     *   <div><ul><li><input type=""></li></ul></div> (multi valued) or
     *   <div><input type=""></div> (single valued) or
     *   <div>...</div> (single button)?
     *
     * @param {jQuery} element$
     * @param {Object} options
     * @param {string} options.baseId
     * @param {boolean} [options.searchIcon]
     * @param {boolean} [options.clearIcon]
     * @param {boolean|string} [options.expandIcon] Typically only true when multiValued is false.
     *      If true a default icon is used. Can also be the CSS class of the icon to use.
     *      A separator line is used if enterable is true
     * @param {boolean} [options.enterable] If true then combobox semantics, If false then select list semantics
     * @param {boolean} [options.multiValued] If true has applied chips.
     * @param {boolean} [options.multiSelect] If true, the dropdown with choices will be left open after each selection,
     *  only applies if multiValued set to true.
     * @param {string} [options.activeChipMessage] Only used if multiValued is true.
     * @param {string} [options.noMatchesMessage] The message to be displayed if not matches are found.
     * @param {boolean} [options.useOverflow] If true limit to one line and show overflow chip as needed.
     *   click overflow chip to see all values. Only applies if multiValued.
     *   todo option to edit on activate
     * @param {string} [options.autoComplete] xxx no, starts-with, full
     * @param {boolean} [options.hasIcons] True if the choices have icons. Default false.
     *  TODO remove property, and fix or remove ComboSelectInterface unit tests
     * @param {boolean} [options.hasGroups] True if the choices have groups. Default false.
     * TODO remove property, and fix or remove ComboSelectInterface unit tests
     * @param {Array|Element|Function} [options.choices] An array of objects with these properties
     *   d display
     *   r return value
     *   i icon
     *   gOpenTag boolean value that indicates if that choice object is the group opening tag
     *   gCloseTag boolean value that indicates if that choice object is the group closing tag
     *   todo label (l)? disabled?
     *   or an object that contains a property named data with an array of objects using above described structure, a property named
     *   fields with information regarding columns to be included on the template directive. Fields property and choice cols
     *   property must be ordered on the same order to match them. e.g.
     *   {
     *       data: [ {
     *                  d: "Display <span class='a-ComboSelect-itemHighlight'>Value</span>",
     *                  i: "fa fa-globe",
     *                  pristineDisplayValue: "Display Value",
     *                  cols: [ "ColumnValue1", "ColumnValue2" ]
     *              } ],
     *       fields: [
     *           { name: "Column1" },
     *           { name: "Column2" }
     *       ]
     *   }
     *   If an element then the choices array is created by parsing the markup. The element must be a UL and the
     *   choice items come from the LI children. The display value is the text of the LI. The value comes from the
     *   LI attribute "data-value". xxx group, label?
     *   If a function then the function is called to return an array of choices. The function is passed
     *   a filter string to match and a callback function return the choices. Calls are debounced.
     *   The function is responsible for highlighting the display value if that is desired. Wrap the
     *   highlighted characters in <span class='a-ComboSelect-itemHighlight'>. This means escapeChoices needs to be false.
     * @param {string} [options.choiceTemplate] Template to use for choices. It will be render inside a <li> element.
     *   Access any properties of the choice objects with APEX$ITEM%<property-name> Example: &APEX$ITEM%d. for the display text.
     * @param {string} [options.itemLabelSelector] selector of the item display label. Default ".a-ComboSelect-label".
     * @param {boolean} [options.escapeChoices] Default escape for template processing. Default is true.
     * @param {boolean} [options.popupClasses] Classes to add to the popup.
     * @param {function} [options.autoTagCreation] f( inputVal ). A function that returns an array of tags to be created,
     *   it is called on input event. If array is empty, search term is removed and not filter is executed, if undefined return,
     *   the user input will follow the normal item behaviour, if array contains elements a chip will be created per element.
     *   Only applies if multiValued true.
     * @param {boolean} [options.minCharactersSearch] Defines the minimum of characters needed to execute the search. Default 0
     * @param {boolean} [options.multiValueSeparator] Defines characters for which the filter won't execute.
     * @param {boolean} [options.asyncLoading] If true it will treat the function passed to the choices option as async
     *   and show loading behaviours. It should be set to false when that function isn't async to avoid flashing the loading
     *   dropdown when the function may only do light work on client-side data. It only applies if choices option is a function. Default is false
     * @param {boolean} [options.closeOnEmpty] If true it will close the dropdown when not results returned
     * @param {boolean} [options.displayValuesAs] Default chips, it defines how the values will be displayed when the focus
     *  is not on the item. Possible values chips, separated. It only applies if multiValued true and enterable false.
     * @param {boolean} [options.maxHeight] Max dropdown height, in pixels. If dropdown is bigger than this a scroll bar will be displayed.
     * @param {boolean} [options.containerClasses] Classes to be added to the combobox container
     * @param {function} [options.onOpen] f( searchChar, callback ). Optional. Provide this function to have custom popup choice
     *   UI such as opening a dialog. When using custom UI for selecting a value the choices, escapeChoices, popupClasses,
     *     choiceTemplate, and autoComplete don't apply.
     *   In this case the dialog or popup must take focus. This is called on mouse down so
     *   focus may be set after; causing focus to be taken away from the dialog or popup. The implementation of onOpen
     *   should set focus or open the dialog or popup after setTimeout. If no selection UI is opened then the function
     *   must return false. If selection UI (a popup or dialog) is opened then the callback must be called once the
     *   selection UI is closed for any reason. If a choice was made pass an object with properties:
     *     r (the return value)
     *     d (the display value).
     *   If no choice was made pass in null.
     * // callbacks
     * @param {function} options.isDisabled f() Return true if the control is disabled xxx needed? use disabled state of input?
     * @param {function} [options.removeValue] f( value ) Called when a value chip is removed. Only applies when multiValued is true.
     * @param {function} [options.addValue] f( value, displayValue ) Called when the input or selected value is added. Only applies when multiValued is true.
     *                              The callback can optionally return an object to influence the chip: {value: "", text: "", label: "", skip: true|false}
     *                              If property of return object skip equal false, the chip won't be added.
     * @param {function} [options.setValue] f( value, displayValue, existingChoice ) Called when the input or selected value is added, and multiValued is false.
     *   The callback can optionally return an object to influence the value to be set: { value: "", text: "", }, it can be called passing undefined
     *   to value, and displayValue parameters to clear the item value
     * @param {function} [options.activateChip] f( value, chip$, cb? ) return true if take focus
     * @param {function} [options.findChoice] f( value, displayValue ) return the choice object for the given value. Required when choices is a function.
     * @param {function} [options.getChipLabel] f( chip$ ) return the accessible label for the chip
     *
     * @returns Object
     * return interface:
     *   addValueChip
     *   removeValueChip
     *   activate
     *   getValue
     *   isShowingSelectedOnly
     *   destroy
     *   clearValues?
     *   in-place edit chip
     *   todo need a way to update choices if they change such as from a cascade
     *
     * @ignore
     */
    widgetUtil.initComboSelect = function( element$, options ) {
        const comboSelectInterface = {};
        let values$, valuesActiveDescription$, valuesDescription$, resultsDescription$, filteredResultsCount,
            input$, popup$, originalPlaceholder, popupId, popupResult, counter$,
            numberOfChips = 0, // only used when displayValuesAs equal separated
            externalFiltering = false, // when have choices array we do our own filtering (false) otherwise the options.choices function will do filtering
            choices$ = null,
            popupListContainer$ = null,
            isFiltering = false,
            fetchingQueueSize = 0, // Track fetching requests on queue. Only increments if options.asyncLoading true
            currentValue = null, // save the value while filtering
            forwardKey = KEY_RIGHT,
            backwardKey = KEY_LEFT,
            topJQuery = util.getTopApex().jQuery,
            ignoreFocusout = false,
            popupIsOpen = false,
            popupIsClosing = false,
            excludeItemSelector = ".u-hidden",
            shouldTriggerChange = false, // Used on the custom change event implementation to track if event needs to be fired
            setOldValue = true, // Track if the oldValue should be set on focus
            hasFilterValueChanged = false, // Track if the filter value has change since item was focused
            oldItemValue, // Track item old value on focus
            blurEvent, mousedownEvent, inputFocusEvent, popupMockUp$, isAutocomplete, currentChoices;
        /*
         * The PopupLOV item could be in an APEX modal page iframe but needs to open in the top level APEX context
         * so that it is not constrained to the iframe window boundary.
         * The dialog itself will be created and opened in the top APEX context because of using showDialog.
         * However we can't assume that the top context will have all the needed libraries loaded and don't want
         * to store the models there anyway.
         * So the jQuery content of the dialog needs to be created in this context. This happens in the init callback.
         */
        let messageContent = function() {
            // Adds non-responsive class to avoid theme.js to set a fixed height, we will manage the popup responsive
            // behaviour.
            return "<div class='a-ComboSelect-popup non-responsive'></div>";
        };

        // Note there is no easy way to know for sure if a printing character will result. This is a reasonable
        // approximation. It may include some key combinations that could be used for keyboard shortcuts.
        // See key handling in actions.js for more info.
        function isKeyPrintable ( kc, ctrlKey, metaKey ) {
            let isPrintable;

            isPrintable = !( ( kc >= 112 && kc <= 123 ) || ( kc >= 33 && kc <= 46 ) || kc < 32 );
            // a few printable keys are used for editing when used with a modifier
            if ( isPrintable && ( ctrlKey || metaKey ) &&
                {
                    65: 1, // "A"
                    67: 1, // "C"
                    86: 1, // "V"
                    88: 1, // "X"
                    89: 1, // "Y"
                    90: 1 // "Z"
                }[kc] ) {
                isPrintable = false;
            }

            return isPrintable;
        }

        function renderChoices( choices ) {
            let lChoices = Array.isArray( choices ) ? choices : choices.data, // Choices can be an array or an object, variable wil contain the data only
                option_id_prefix = "CS_" + apex.env.APP_PAGE_ID + "_" + options.baseId + "_option_",
                resultsHasIcons, template;

            lChoices.forEach( ( element, index ) => {
                element.id = option_id_prefix + index;

                if ( element.i ) {
                    // If the result set contains one icon or more the template used will be the icon one for all the rows.
                    resultsHasIcons = true;
                }
            } );
            currentChoices = lChoices;

            template = "{loop APEX$CHOICES/}";
            if ( options.hasIcons ) {

                template = template + `{if APEX$ITEM%gOpenTag/}<li role="none"  class="a-ComboSelect-group">\
<div role="presentation" id="&APEX$ITEM%id!ATTR." class="a-ComboSelect-groupLabel">&APEX$ITEM%d.</div><ul role="group" ${A_LABELLEDBY}="&APEX$ITEM%id!ATTR.">\
{elseif APEX$ITEM%gCloseTag/}</ul></li>\
{else/}<li id='&APEX$ITEM%id!ATTR.' data-index="&APEX$I!ATTR." role="option" data-value="&APEX$ITEM%r!ATTR." ${A_TABINDEX}='-1' {if APEX$ITEM%selected/}aria-selected="true"{endif/} \
class='a-ComboSelect-item{if APEX$ITEM%s/} ${C_IS_SELECTED}{endif/}' `;
                if ( options.multiSelect && options.multiValued ) {
                    template = template + `${A_ARIA_CHECKED}="{if APEX$ITEM%s/}true{else/}false{endif/}">\
<span class="a-ComboSelect-action u-selector{if APEX$ITEM%s/} ${C_IS_SELECTED}{endif/}" aria-hidden="true"></span>`;
                } else {
                    template = template + ">";
                }
                if ( resultsHasIcons ) {
                    template = template + `<span class="a-ComboSelect-icon a-Icon &APEX$ITEM%i!RAW." aria-hidden="true"></span>`;
                }
                if ( options.choiceTemplate ) {
                    template = template + `{if !APEX$ITEM%g/}<div class="a-ComboSelect-customContent">${options.choiceTemplate}{endif/}</div>`;
                } else {
                    template = template + `<span class="a-ComboSelect-label">&APEX$ITEM%d.</span>`;
                }
                template = template + `</li>{endif/}`;
            } else {
                template = template + defaultTemplate;
            }
            template = template + "{endloop/}";


            return util.applyTemplate( template, {
                extraSubstitutions: { "APEX$CHOICES": lChoices },
                defaultEscapeFilter: options.escapeChoices ? "HTML" : "RAW",
                iterationCallback: function ( loopArg, model, record, index, placeholders, extraSubstitutions ) {
                    const element = extraSubstitutions.APEX$ITEM;

                    extraSubstitutions.APEX$LOV = {
                        display: element.d,
                        return: element.r,
                        icon: element.i
                    };

                    // TODO this needs to be removed when applyTemplate stop sharing the extraSubstitutions between iterations.
                    // It removes all non-standard key on the extraSubstitutions object
                    // it fixes the problem when rendering chocies that it doesn't have the columns
                    // context, the extraSubstitutions was carrying values from the last record printed.
                    Object.keys( extraSubstitutions ).forEach(key => {
                        if ( ![ "APEX$LOV", "APEX$I", "APEX$ITEM" ].includes( key )) {
                            delete extraSubstitutions[key];
                        }
                    });

                    // If more columns are included we add them as individual properties to the substitution strings available,
                    // so the developer can access them as normal columns with the syntax &COLUMN_NAME.
                    if ( element.cols ) {
                        element.cols.forEach( ( value, index ) => {
                            extraSubstitutions[ choices.fields[ index ].name ] = value;
                        } );
                    }
                }
            } );
        }

        function renderMockUpChoices( choices ) {
            const template = `{loop APEX$CHOICES/} \
<li role="option" id='&APEX$ITEM%id!ATTR.' ><span>&APEX$ITEM%d.</span></li>
            {endloop/}`;

            return util.applyTemplate( template, {
                extraSubstitutions: { "APEX$CHOICES": choices },
                defaultEscapeFilter: options.escapeChoices ? "HTML" : "RAW"
            } );
        }

        function updateResults( count ) {
            let empty = count === 0,
                pastResultsText = resultsDescription$.text(),
                newResultsText;

            if ( empty ) {
                newResultsText = lang.getMessage( "APEX.CS.NO_MATCHES" );
            } else if ( count === 1 ) {
                newResultsText = lang.getMessage( "APEX.CS.MATCH_FOUND" );
            } else {
                newResultsText = lang.formatMessage( "APEX.CS.MATCHES_FOUND", count );
            }

            if ( !popupIsClosing ) {
                // If result count text is the same, aria-live won't announce it because it hasn't change,
                // a non-breaking space character is added to fabricate a "change"
                if (newResultsText === pastResultsText) {
                    newResultsText = newResultsText + "\u00A0";
                }

                resultsDescription$.text( newResultsText );
            }

            if ( empty && options.closeOnEmpty ) {
                popup$.popup( "close" );
            }
        }

        // It set position option in the popup widget to request a re-calculation, because after a content update
        // the popup size can change and, it needs to be calculated again, so it is moved to the top or bottom of the screen.
        function recalculatePopupPosition() {
            if ( popup$.length ) {
                const position = popup$.popup( "option" ).position;

                if ( position ) {
                    position.collision = "fit flip";

                    popup$.popup( { position: position } );
                }
            }
        }

        function resizePopup() {
            if ( popup$.length ) {
                const parent = popup$.parent()[0],
                    popup = popup$[0],
                    parentStyles = window.getComputedStyle( parent ),
                    topParent = parseFloat( parentStyles.top ),
                    bottomParent = parseFloat( parentStyles.bottom ),
                    height = parseFloat( window.getComputedStyle( popup$[0] ).height );
                let newPopupMH;

                if ( bottomParent < 0  ) {
                    newPopupMH = height + bottomParent;
                    popup.style.maxHeight = newPopupMH + "px";
                }

                if ( topParent < 0 ) {
                    newPopupMH = height + topParent;
                    popup.style.maxHeight = newPopupMH + "px";
                    parent.style.top = "0px";
                }
            }
        }

        function externalFilter( searchValue, selectedValuesOnly = false ) {
            let fetchSequence = 0;

            if ( !options.multiValued ) {
                input$.attr( A_ARIA_BUSY, "true" );
                input$.removeAttr( A_ARIA_ACTIVEDESCENDANT );
            }

            if ( options.asyncLoading ) {
                // Add one fetch to the count and get queue position
                fetchSequence = fetchingQueueSize + 1;
                fetchingQueueSize += 1;

                if ( !selectedValuesOnly ) {
                    const choices$ = popupListContainer$.find( "li" ),
                        skeletonTemplate = `<span class="a-ComboSelect-label"></span>`;

                    if ( choices$.length > 0 ) {
                        choices$.html( skeletonTemplate );
                        choices$.removeClass( [C_IS_FOCUSED, C_IS_PRESELECTED, C_IS_SELECTED] ).find( ".a-ComboSelect-icon" ).remove();
                    } else {
                        popupListContainer$.html( `
                            <li role="option" class="a-ComboSelect-item" >
                                ${skeletonTemplate}
                            </li>
                        ` );
                    }
                    popupListContainer$.addClass( C_IS_PLACEHOLDER );
                }
            }

            options.choices( searchValue, function( choices ) {
                const lChoices = Array.isArray( choices ) ? choices : choices.data;
                let choicesContent = renderChoices( choices );

                // Checking if this is the last fetch queued will avoid showing outdated results if asynchronous function
                // takes a long time to bring results and batch the UI changes in one refresh. On the case of an synchronous
                // call, this condition will be always true.
                if ( fetchSequence === fetchingQueueSize ) {
                    let focusedElement, focusedElementInsideDropdown;

                    // If element is being rendered in an iframe, content needs to be duplicated so screen reader has access to it
                    if ( window.self !== window.parent ) {
                        const mockupContent = renderMockUpChoices( lChoices );
                        popupMockUp$ = element$.find(".a-ComboSelect-popup-mockup" );
                        if ( !popupMockUp$.length ) {
                            popupMockUp$ = element$.append( `<div role="dialog" id="${popupId}"\
${A_LABEL}="${util.escapeHTMLAttr(lang.getMessage( "APEX.POPUP_LOV.TITLE" ))}" class="a-Combobox-popup-mockup u-vh"> \
<ul role="listbox"></ul></div>`).find( `#${popupId}` );
                        }
                        popupMockUp$.find( "ul" ).html( mockupContent );
                    }

                    if ( !lChoices.length ) {
                        let noMatchesMessage
                            = options.noMatchesMessage ? options.noMatchesMessage : lang.getMessage( "APEX.CS.NO_MATCHES" );

                        choicesContent = `<li role="option" class="a-ComboSelect-item a-ComboSelect-item--no-results" >${noMatchesMessage}</li>`;
                    }

                    // If the dropdown is already created only the content should be updated,
                    if ( popupListContainer$ ) {
                        if ( options.asyncLoading ) {
                            focusedElement = document.activeElement;
                            focusedElementInsideDropdown = popupListContainer$[0].contains( focusedElement );
                        }

                        popupListContainer$.removeClass( [ C_IS_PLACEHOLDER, C_NO_MATCHES ] );

                        popupListContainer$.html( choicesContent );

                        // If a skeleton item was clicked while loading, to avoid losing the capabilities of moving down/up with the keys,
                        // the first option gets focused. This is only a problem if the results takes enough time loading and using the
                        // asyncLoading optimization flag
                        if ( options.asyncLoading && focusedElementInsideDropdown ) {
                            popupListContainer$.find( ".a-ComboSelect-item" ).first().addClass( C_IS_FOCUSED ).trigger( "focus" );
                        }
                    }

                    // If it is being called synchronously we open the popup if choices were retrieved and closeOnEmpty is true,
                    // if closeOnEmpty is false, we always open the dropdown to show the 'No matches found' custom hint
                    if ( !popupIsOpen && ( ( options.closeOnEmpty && lChoices.length ) || !options.closeOnEmpty ) 
                        && ( !options.asyncLoading || selectedValuesOnly ) ) {
                        openDropDown( searchValue, choicesContent );
                    }

                    // If there is no choices, and closeOnEmpty false, we add the no matches class
                    if ( !lChoices.length && !options.closeOnEmpty ) {
                        popupListContainer$?.addClass( C_NO_MATCHES );
                    }

                    // Position recalculation is only needed when the popup is already opened.
                    if ( popupIsOpen ) {
                        // If the instance is not enterable, we set a highlighting class on the first item on the list
                        // when the list is being filtered.
                        if ( searchValue && !options.enterable && lChoices.length > 0 ) {
                            popupListContainer$.find( `${SEL_COMBO_ITEM}:not(${ excludeItemSelector })` ).first().addClass( C_IS_PRESELECTED );
                        }

                        recalculatePopupPosition();
                        // Popup size adjustment needs to be done after the position has been recalculated.
                        resizePopup();

                        // It restores the scroll position to the top on every search if dropdown is already opened
                        popup$.scrollTop( 0 );
                    }

                    if ( options.asyncLoading ) {
                        // reset queue size
                        fetchingQueueSize = 0;
                    }

                    if ( !options.multiValued ) {
                        input$.attr( A_ARIA_BUSY, "false" );
                    }

                    // just in case the call back is made synchronous don't take a chance closing the dialog while it is opening (see bug 33303310)
                    setTimeout( () => {
                        // It filters out group data from the array to avoid counting them as results.
                        updateResults( lChoices.filter( el => { return !el.gOpenTag && !el.gCloseTag; } ).length );
                    }, 0 );
                }
            }, selectedValuesOnly );
        }

        // only used when this is in control of the popup and has a choices array
        function filterHighlight( index, searchValue ) {
            // the list markup was generated from options.choices and must be kept in sync with it
            // so use choices array for filtering
            const searchRe = new RegExp( "([<>&;])|(" + util.escapeRegExp( searchValue ) + ")", "ig" );
            let ignore = null,
                choice = options.choices[index],
                match = !( options.multiValued && choice.selected )
                    && ( !isFiltering || choice.lc.includes( searchValue.toLowerCase() ) );

            // xxx groups. keep a count and count by group after all done hide empty groups and close popup if empty

            if ( match ) {
                filteredResultsCount += 1;
                // highlight
                $( this ).find( options.itemLabelSelector ).html( isFiltering ? choice.d.replace( searchRe, function ( m, p1, p2 ) {
                    // don't highlight inside tags <...> or character entities &...;
                    // see RE object defined above
                    if ( p1 ) {
                        switch ( p1 ) {
                            case "<":
                                ignore = p1;
                                break;
                            case ">":
                                if ( ignore === "<" ) {
                                    ignore = null;
                                }
                                break;
                            case "&":
                                if ( !ignore ) {
                                    ignore = p1;
                                }
                                break;
                            case ";":
                                if ( ignore === "&" ) {
                                    ignore = null;
                                }
                                break;
                        }
                        return p1;
                    } else {
                        if ( ignore || !p2.length ) {
                            return p2;
                        } // else
                        return "<span class='a-ComboSelect-itemHighlight'>" + p2 + "</span>";
                    }
                } ) : choice.d );
            }
            return !match;
        }

        function selectItem( item$ ) {
            const choice = currentChoices[ Number( item$.attr( "data-index" ) ) - 1 ];
            let displayValue = choice.pristineDisplayValue || item$.find( ".a-ComboSelect-label" ).text(),
                returnValue = item$.attr( A_DATA_VALUE );

            displayValue = util.unescapeHTML( displayValue ); // Text maybe already escaped, it needs to be cleaned.

            if ( options.multiValued && options.multiSelect ) {
                const itemAction$ =  item$.find( ".a-ComboSelect-action" ),
                    itemSelected = itemAction$.hasClass( C_IS_SELECTED );

                if ( itemSelected ) {
                    options.removeValue( options.enterable ? displayValue : returnValue );
                    removeValueChip( options.enterable ? displayValue : returnValue );
                    itemAction$.removeClass( C_IS_SELECTED );
                    item$.removeClass( C_IS_SELECTED )
                        .attr( A_ARIA_CHECKED, "false" );
                } else {
                    addChoice( returnValue, displayValue, true );
                    itemAction$.addClass( C_IS_SELECTED );
                    item$.addClass( C_IS_SELECTED )
                        .attr( A_ARIA_CHECKED, "true" );
                    // Because the element grows the dropdown needs to be repositioned.
                    recalculatePopupPosition();
                }
            } else {
                popupResult = {
                    r: returnValue,
                    d: displayValue
                };
                popup$.popup( "close" );
            }
        }

        function dropDownClosed( result ) {
            // the popup is closing
            // if a choice was made apply it
            if ( result ) {
                let text = result.d,
                    value = result.r;

                if ( options.multiValued ) {
                    // If multiple values then picking something is to add rather than set.
                    addChoice( value, text, true );
                } else {
                    // otherwise set the value to the choice that was picked
                    setChoice( value, text, true );
                }
            }

            // Remove event handlers
            $( window ).off( blurEvent );
            $( "html" ).off( mousedownEvent );
            input$.off( inputFocusEvent );

            // If the counter is present, we always toggle it off when dropdown closed
            if ( counter$ ) {
                counter$.removeClass( C_IS_ACTIVE ).attr( A_ARIA_PRESSED, "false" );

                updateCounterVisibility();
            }

            if ( popup$ ) {
                let focusedChoice$ = popup$.find( ".a-ComboSelect-list" ).children( SEL_IS_FOCUSED );
                focusedChoice$.removeClass( C_IS_FOCUSED );

                if ( !options.multiValued && options.enterable ) {
                    focusedChoice$.removeAttr( A_ARIA_SELECTED );
                }
            }
            input$.attr( A_ARIA_EXPANDED, "false" )
                .removeAttr( A_ARIA_ACTIVEDESCENDANT )
                .removeAttr( A_ARIA_CONTROLS )
                .attr( A_ARIA_BUSY, "false" );


            if ( popupMockUp$ ) {
                popupMockUp$.remove();
                popupMockUp$ = null;
            }
            // because this flag is checked in focus handling give things a chance to settle down first
            popupIsClosing = true;
            setTimeout( () => {
                popupIsClosing = false;
                popupIsOpen = false;

                // For input search we remove the IG class helper to ignore enter keys
                if ( options.enterable && !options.multiValued ) {
                    input$.parent().removeClass( "js-uses-enter" );
                }
            }, 0 );
        }

        function openDropDown( searchChar, choicesContent ) {
            // If the component is deleted from the page while waiting for the debounce timer to finish values to be fetched
            // it will still open a popup and leave it lingering because the cleaning logic has been already executed.
            // To avoid that we just continue with the opening if the component is still connnected to the DOM.
            const componentConnected = element$ && element$[0]?.isConnected === true;

            if ( componentConnected ) {
                let keepFocus = true;
    
                popupIsOpen = true;
                if ( options.multiValued ) {
                    values$.children( SEL_IS_ACTIVE ).removeClass( C_IS_ACTIVE );
                }
                if ( options.onOpen ) {
                    keepFocus = false;
                    if ( !options.onOpen( searchChar, dropDownClosed ) ) {
                        popupIsOpen = false;
                        return; // no popup was opened
                    }
                } else {
    
                    // externalFiltering is async so don't know right away if there is anything to show
                    // todo externalFiltering should provide away to indicate that there are no results to show when the search term is "" to avoid flash of empty drop down
                    if (
                        // first make sure there are choices to show when not external filtering
                        ( !externalFiltering && ( !options.choices || options.choices.length === 0 ))
                    ) {
                        popupIsOpen = false;
                        return; // no popup was opened
                    }
    
                    // todo issue for popup is when it displays above and during filtering it gets less tall it is no longer attached to the input.
                    // todo maybe don't recreated this each time called?
                    let popupOptions = {
                        id: popupId,
                        title: lang.getMessage( "APEX.POPUP.SEARCH" ), // todo acc what is a reasonable title or how to keep the title from being read?
                        isPopup: true,
                        parentElement: element$,
                        returnFocusTo: input$[0],
                        noOverlay: true,
                        takeFocus: false,
                        closeDeadAreas: !options.enterable && options.multiValued ? element$ : null,
                        width: 200, // something just in case
                        minHeight: 20,
                        maxHeight: options.maxHeight || 480,
                        okButton: false,
                        dialogClass: "ui-dialog-comboSelect" + ( options.popupClasses ? " " + options.popupClasses : "" ),
                        notification: false, // keeps the role as 'dialog'
                        callback: () => {
                            dropDownClosed( popupResult );
                        },
                        init: function ( popup$ ) {
                            /*
                             * Create the dialog content in this context. Add to dialog later.
                             */
                            let cls = "a-ComboSelect-list";
                            if ( options.multiValued ) {
                                cls += " a-ComboSelect--multi";
                            }
    
                            popupListContainer$ = $( `<ul class="${cls}" role="listbox" ${ options.multiSelect
                                ? "aria-multiselectable='true'" : "" }></ul>` );
    
                            popup$.append( popupListContainer$ );
    
                            if ( !externalFiltering ) {
                                popupListContainer$.html( choices$ );
    
                                popupListContainer$.filterable( {
                                    enhanced: true,
                                    filterCallback: filterHighlight,
                                    input: input$, // xxx distinguish value from filter, maybe don't filter if popup not open?
                                    children: "li", // xxx todo handle groups
                                    beforefilter: () => {
                                        // todo think maybe don't filter if not open but then need to filter once opened
                                        filteredResultsCount = 0;
                                    },
                                    filter: () => {
                                        updateResults( filteredResultsCount );
                                    }
                                } );
                                // xxx also after filtering is where the autocomplete type-ahead is set
                            } else if ( externalFiltering && ( !options.asyncLoading || ( counter$ && counter$.hasClass( C_IS_ACTIVE ) ) ) ) {
                                // If options.choices function is not async the content of the dropdown will be known before creating the dropdown
                                // then its content will be updated from the externalFilter function
                                popupListContainer$.html( choicesContent );
                            }
                            popupListContainer$.keydown( function ( event ) {
                                let next$,
                                    kc = event.which,
                                    item$ = popupListContainer$.children( SEL_IS_FOCUSED );
    
                                if ( kc === KEY_DOWN ) {
                                    next$ = item$.nextAll( ".a-ComboSelect-item" ).not( excludeItemSelector ).first();
                                } else if ( kc === KEY_UP ) {
                                    next$ = item$.prevAll( ".a-ComboSelect-item" ).not( excludeItemSelector ).first();
                                } else if ( kc === KEY_ENTER || kc === KEY_TAB ) {
                                    if ( item$[0] ) {
                                        selectItem( item$ );
                                    }
                                    if ( kc === KEY_ENTER ) {
                                        event.preventDefault(); // because focus returns to input keep page from submitting
                                    }
                                    // tabbing from the popup shouldn't work as desired because the popup is at the end of the the page
                                    // but because the dialog is closed on keydown it seems focus is put back in the input field
                                    // and the default tab behavior picks up from there.
                                }
                                if ( next$ && next$[0] ) {
                                    item$.removeClass( C_IS_FOCUSED );
                                    next$.addClass( C_IS_FOCUSED )
                                        .trigger( "focus" );
                                    event.preventDefault();
                                }
                            } ).on( E_CLICK, function ( event ) {
                                let item$ = $( event.target ).closest( ".a-ComboSelect-item" ),
                                    hasNoMatchesMessage = item$.parent( SEL_COMBOSELECT_LIST ).hasClass( C_NO_MATCHES );
    
                                // Item is saved only if not fetching other results.
                                if ( fetchingQueueSize === 0 && item$.length && !hasNoMatchesMessage ) {
                                    // If focus is not on the input element like when it is on the counter,
                                    // it returns the focus to the input element  
                                    if ( document.activeElement !== input$[0] ) {
                                        input$.trigger( E_FOCUS );
                                    }
    
                                    selectItem( item$ );
    
                                    if( !options.multiValued ) {
                                        input$.parent().removeClass( C_IS_EMPTY );
                                    }
                                }
                            } );

                            popup$.popup( "widget" ).on( E_MOUSEDOWN, function ( event ) {
                                // The dropdown should never take focus.
                                event.preventDefault();
                            } );
    
                            // because the popup just contains a listbox no need to give the dialog role application
                        },
                        open: function ( event ) {
                            let width, height, ww, wh,
                                popup$ = topJQuery( event.target ),
                                inputVal = input$.val();
    
                            popupResult = null;
    
                            // We set the opener to the input$ because we open the dropdown on mousedown,
                            // and the focus hasn't been transferred to the input$, so the opener in jQuery ui
                            // is set to the last focusable element which is incorrect.
                            popup$.data( "apex-popup" ).opener = input$;
    
                            if ( externalFiltering && options.asyncLoading 
                                // If it is showing selected records when counter is active the dropdown is not showing skeleton placeholders
                                // therefore it is not need to trigger a search for choices
                                && ( !counter$ || !counter$.hasClass( C_IS_ACTIVE ) ) ) {
                                // We overwrite the inputVal to an empty string if not enterable and not multi value
                                // therefore if filter hasn't changed, the dropdown shows an unfiltered result set
                                if ( !hasFilterValueChanged && !options.enterable && !options.multiValued ) {
                                    inputVal = "";
                                }
                                externalFilter( inputVal );
                            } else if ( !externalFiltering ) {
                                popupListContainer$.filterable( "refresh" );
                            }
    
                            if ( !options.width ) {
                                // Use the method .css( "width" ) as recommended by the jQuery documentation
                                // to take in consideration the box-sizing model.
                                width = Number( element$.css( "width" ).replace( "px", "" ) ); // dialog min width keeps this from getting too small
                            }
                            // A dialog is responsive at least in UT and that will adjust its size for small screens
                            // but a popup is not so make sure it isn't bigger than the window
                            ww = $( window ).width() - 10;
                            wh = $( window ).height() - 10;
                            if ( (options.width || width) > ww ) {
                                width = ww;
                            }
                            if ( options.height > wh ) {
                                height = wh;
                            }
                            // todo think if too big may just want to center
                            if ( width ) {
                                popup$.popup( "option", "width", width );
                            }
                            if ( height ) {
                                popup$.popup( "option", "height", height );
                            }
    
                            // After the popup is display even if it is smaller than the viewport a part of it could have been
                            // positioned out of the view port, so after the jQuery UI flipfit position algorithm has been applied,
                            // we will shrink the popup to fit the available space, so it is not crop out of the viewport.
                            input$.on( inputFocusEvent, function() {
                                // It needs to be done on a micro task because on the moment the focus handler is executed the
                                // scroll navigation that happens on focus hasn't been executed, and we still don't know if the dropdown will be out of the
                                // view port.
                                queueMicrotask( () => { resizePopup(); } );
                            } );
                        }
                    };
    
                    ignoreFocusout = true;
                    // todo think the comboSelect input owns the popup; is this a problem if it is in a parent iframe?
                    popup$ = apex.message.showDialog( messageContent, popupOptions );
                    input$.attr( A_ARIA_CONTROLS, popupId );
                    // It sets the scroll position to the top everytime the dropdown is opened
                    popup$.scrollTop( 0 );
                }
    
                input$.attr( A_ARIA_EXPANDED, "true" );
    
                // We add helper IG to stop enter key processing, probably it should be added to the web component itself,
                // but it will require a before opening and after opening callback functions or events.
                if ( options.enterable && !options.multiValued ) {
                    input$.parent().addClass( "js-uses-enter" );
                }
    
                if ( keepFocus ) {
                    // TODO test if we can take away this for all the implementation of this interface,
                    // it has been taken away for Select Multiple, because it is not needed anymore with the
                    // new attribute for Popup that allows to keep the focus.
                    if ( options.displayValuesAs !== SEPARATED ) {
                        input$.trigger( "focus" );
                    }
                    ignoreFocusout = false;
                }
            }
        }

        function closeDropDown() {
            if ( popupIsOpen ) {
                popup$.popup( "close" );
            }
        }

        function makeChipActive( chip$, scrollDirection ) {
            let label;

            chip$.addClass( C_IS_ACTIVE );
            if ( options.getChipLabel ) {
                label = options.getChipLabel( chip$ );
            } else {
                label = chip$.find( SEL_CHIP_TEXT ).text();
            }
            valuesActiveDescription$.attr( "aria-live", "assertive" ).text( lang.format( options.activeChipMessage, label ) );

            if ( options.displayValuesAs === SEPARATED && chip$.length > 0 ) {
                scrollToChip( chip$, scrollDirection );
            }
        }

        function moveToFirstChip() {
            if ( options.enterable ) {
                closeDropDown();
            }
            makeChipActive( input$.parent().prevAll( SEL_CHIP_APPLIED + "," + SEL_CHIP_OVERFLOW )
                .filter( SEL_VISIBLE ).first(), END );
        }

        function setChoiceSelection( value, sel = true) {
            if ( choices$ ) {
                choices$.each( function () {
                    let choice$ = $( this );

                    if ( choice$.attr( A_DATA_VALUE ) === value ) {
                        choice$.attr( "aria-selected", sel ? "true" : "false" );
                    }
                } );
            }
        }

        function updateCounterVisibility() {
            if ( numberOfChips > 0 ) {
                counter$.removeClass( C_HIDDEN );
            } else {
                if ( !counter$.hasClass( C_IS_ACTIVE ) ) {
                    counter$.addClass( C_HIDDEN );
                }
            }
        }

        function updateCounterValue() {
            const lNumberOfChips = numberOfChips <= 99 ? numberOfChips : "99+";
            let counterLabel;

            counterLabel = lang.formatMessage( "APEX.CS.SELECTED_VALUES_COUNTER", lNumberOfChips );
            counter$.attr( A_LABEL, counterLabel );

            counter$.text( lNumberOfChips );

            // It updates the counter visibility only if the focus is not on the
            // counter toggle button, to avoid disappearing it if the count reach 0
            // while focusing it.
            if ( document.activeElement !== counter$[0] ) {
                updateCounterVisibility();
            }
        }

        function toggleCounter() {
            const counterChecked = counter$.hasClass( C_IS_ACTIVE ),
                inputValue = input$.val();
                    
            if ( counterChecked ) {
                counter$.removeClass( C_IS_ACTIVE )
                    .attr( A_ARIA_PRESSED, "false" );

                if ( inputValue.length >= options.minCharactersSearch ) {
                    if ( externalFiltering ) {
                        externalFilter( inputValue );
                    } else {
                        openDropDown();
                    }
                } else {
                    closeDropDown();
                }

                updateCounterVisibility();
            } else {
                counter$.addClass( C_IS_ACTIVE )
                    .attr( A_ARIA_PRESSED, "true" );
                
                externalFilter( undefined, true );
            }
        }

        function navigateItems( event, kc ) {
            let inputVal = input$.val(),
                focusedComboItem$;

            if ( popup$.length ) {
                focusedComboItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_FOCUSED}` );
            }

            // We overwrite the inputValue to an empty string if not enterable and not multi
            // therefor if filter hasn't changed, the dropdown shows an unfiltered result set
            if ( !hasFilterValueChanged && !options.enterable && !options.multiValued ) {
                inputVal = "";
            }

            // If enterable in opens the dropdown only if the min number of characters to search is fulfilled
            if ( !popupIsOpen &&  ( !options.enterable || inputVal.length >= options.minCharactersSearch ) ) {

                if ( externalFiltering && !options.asyncLoading ) {
                    externalFilter( inputVal );
                } else {
                    openDropDown( inputVal );
                }
            } else if ( !options.onOpen && popupIsOpen && ( ( options.asyncLoading && fetchingQueueSize === 0 ) || !options.asyncLoading ) ) {
                // Navigating with the arrow key to the dropdown is prevented when results are being loaded.
                let item$;

                popup$.find( SEL_IS_PRESELECTED ).removeClass( C_IS_PRESELECTED );

                if ( !options.onOpen ) {
                    let firstGroup$, next$,
                        first$ = popup$.find( `${SEL_COMBO_ITEM}:not(${ excludeItemSelector })` ).first();

                    if ( focusedComboItem$.length > 0 ) {

                        if ( kc === KEY_DOWN ) {
                            next$ = focusedComboItem$.nextAll( ".a-ComboSelect-item" ).not( excludeItemSelector ).first();

                            // If nothing is found, it could be that groups are being used and there is another element on the next group
                            if ( next$.length === 0 ) {
                                next$ = focusedComboItem$
                                    .parents( ".a-ComboSelect-group" ).next()
                                    .find( `${SEL_COMBO_ITEM}:not(${ excludeItemSelector })` ).first();
                            }
                        } else if ( kc === KEY_UP ) {
                            next$ = focusedComboItem$.prevAll(".a-ComboSelect-item").not( excludeItemSelector ).first();

                            if ( next$.length === 0 ) {
                                next$ = focusedComboItem$
                                    .parents( ".a-ComboSelect-group" ).prev()
                                    .find( `${SEL_COMBO_ITEM}:not(${ excludeItemSelector })` ).last();
                            }
                        }

                        // If it is the last element on the list, it shouldn't lose the focused class
                        if ( next$.length === 0 ) {
                            next$ = focusedComboItem$;
                        } else {
                            focusedComboItem$.removeClass( C_IS_FOCUSED )
                                .removeAttr( A_ARIA_SELECTED );
                        }

                        if ( next$[0] === first$[0] ) {
                            firstGroup$ = next$.parent( ".a-ComboSelect-group" );
                        }
                    } else {
                        next$ = first$;
                    }

                    if ( next$.length ) {
                        // We need to scroll to the group if using groups on the case that is the first item,
                        // because if not the group label cannot be displayed.
                        const itemToScroll = ( firstGroup$ && firstGroup$.length ) ? firstGroup$[0] : next$[0];

                        next$.addClass( C_IS_FOCUSED )
                            .attr( A_ARIA_SELECTED, "true" );
                        input$.attr( A_ARIA_ACTIVEDESCENDANT, next$[0].id );

                        // If the element is not, it's scrolled into view
                        if ( !isVisible( itemToScroll, popup$[0] ) ) {
                            let scrollTop = kc === KEY_UP;
                            itemToScroll.scrollIntoView( scrollTop );
                        }
                    }
                } else {
                    // move focus into popup
                    if ( !options.multiValued ) {
                        // first try for the selected item
                        item$ = popup$.find( ".a-ComboSelect-item[aria-selected='true']" ).first();
                    }
                    if ( !item$ || !item$[0] ) {
                        item$ = popup$.find( ".a-ComboSelect-item" ).not( excludeItemSelector ).first();
                    }

                    item$.addClass( C_IS_FOCUSED ).focus();
                    input$.prop( "A_TABINDEX", -1 );
                }


                event.preventDefault();
            }
        }

        // only for multivalued
        function updateAccessibleValues( ) {
            let values = [];

            values$.children( SEL_CHIP_APPLIED ).each( function() {
                let label, value,
                    chip$ = $(this);

                if ( options.getChipLabel ) {
                    value = options.getChipLabel( chip$ );
                } else {
                    value = chip$.find( SEL_CHIP_TEXT ).text();
                    label = chip$.find( SEL_CHIP_LABEL ).text();
                    if ( label ) {
                        value = label + " " + value;
                    }
                }
                values.push( value );
            } );
            valuesDescription$.text( values.join( ", " ) );
        }

        function findChoice( returnValue, displayValue ) {
            let choice = null;

            if ( Array.isArray( options.choices ) ) {
                choice = options.choices.find( item => item.r === returnValue );
            } else if ( options.findChoice ) {
                choice = options.findChoice( returnValue, displayValue );
            }
            return choice;
        }

        function isShowingSelectedOnly() {
            return counter$ && counter$.hasClass( C_IS_ACTIVE );
        }

        // external: for multiValued
        function addValueChip( value, text, label = "" ) {
            let choice,
                chips$ = values$.children( SEL_CHIP_APPLIED );

            // find the value in the list of choices
            choice = findChoice( value, text );
            // if not enterable there must be a matching choice
            if ( options.enterable || choice) {
                // text is optional if there is a choice take the text from it
                if ( choice && ( !text || !options.enterable ) ) {
                    text = choice.d;
                }

                // Only add if not already added
                if ( chips$.filter( function () { return $( this ).attr( A_DATA_VALUE ) === value; } ).length === 0 ) {
                    let lastChip$ = chips$.last(),
                        chip$ = $( `<li class="${C_CHIP} ${C_CHIP_APPLIED}" aria-hidden="true" data-value="${util.escapeHTMLAttr( value )}">\
${label ? `<span class="a-Chip-label">${util.escapeHTML( label )}</span>` : ""}\
<span class="a-Chip-text"><span class="a-Chip-value">${util.escapeHTML( text )}</span></span>${REMOVE_ICON}</li>` );

                    // mark the choice selected
                    if ( choice ) {
                        choice.selected = true;
                        setChoiceSelection( value );
                    }

                    // add the chip
                    if ( lastChip$[0] ) {
                        lastChip$.after( chip$ );
                    } else {
                        values$.prepend( chip$ );
                    }
                    updateAccessibleValues();
                    checkIfEmpty();

                    if ( options.displayValuesAs === SEPARATED ) {
                        scrollToChip( chip$, END );
                    }

                    if ( counter$ ) {
                        numberOfChips += 1;
                        updateCounterValue();
                    }

                    return true;
                }
            }
            return false;
        }

        // external: for multiValued
        function removeValueChip( value, pSuppressEvents = false ) {
            let result = false,
                choice = findChoice( value );

            // unselect choice
            if ( choice ) {
                delete choice.selected;
                setChoiceSelection( value, false );
            }

            values$.children( SEL_CHIP_APPLIED ).each( function() {
                let chip$ = $( this );

                if ( chip$.attr( A_DATA_VALUE ) === value ) {
                    const inputEvent = $.Event( "input" );

                    chip$.remove();
                    updateAccessibleValues();
                    checkIfEmpty();

                    if ( !pSuppressEvents ) {
                        inputEvent.apexData = { action: ACTION_DELETION };
                        element$.trigger( inputEvent, inputEvent.apexData );
                    }

                    result = true;
                    return false;
                }
            } );

            // If the dropdown opened and not enterable, the dropdown will kept opened when a chip is removed
            // therefore we also need to uncheck it from the dropdown to keep it synced
            if ( !options.enterable && popupIsOpen ) {
                let listItem$ = popup$.find( `${SEL_COMBO_ITEM}[data-value=${util.escapeCSS( value )}]` );
                
                if ( listItem$ ) {
                    listItem$.removeClass( C_IS_SELECTED )
                        .attr( A_ARIA_CHECKED, "false" )
                        .find( ".a-ComboSelect-action" )
                        .removeClass( C_IS_SELECTED );
                }
            }

            if ( counter$ && result ) {
                numberOfChips -= 1;
                updateCounterValue();
            }

            return result;
        }

        // external: for multiValued
        function activate( value ) {
            values$.children( SEL_IS_ACTIVE ).removeClass( C_IS_ACTIVE );
            values$.children( SEL_CHIP_APPLIED ).each( function() {
                let focus = false,
                    chip$ = $( this );

                if ( chip$.attr( A_DATA_VALUE ) === value ) {
                    focus = callActivate( focus, chip$ );
                    if ( focus ) {
                        input$.trigger( "focus" );
                    }
                    return false;
                }
            } );

        }

        // external: for single or multiple values
        function getValue() {
            let value;

            if ( options.multiValued ) {
                value = [];
                values$.children( SEL_CHIP_APPLIED ).each( function() {
                    let li$ = $(this),
                        chip = {
                            value: li$.attr( A_DATA_VALUE ),
                            displayValue: li$.find( SEL_CHIP_TEXT ).text()
                        },
                        label = li$.find( SEL_CHIP_LABEL ).text();

                    if ( label ) {
                        chip.label = label;
                    }
                    value.push( chip );
                } );
            } else {
                let returnValue = input$.attr( A_DATA_VALUE );

                if ( returnValue ) {
                    value = {
                        value: returnValue,
                        displayValue: input$.val()
                    };
                } else {
                    value = null;
                }
            }
            return value;
        }

        // external: for single values
        function setValue( value, displayValue, triggerInput = true ) {
            let choice = findChoice( value, displayValue ),
                curSel = findChoice( input$.attr( A_DATA_VALUE ) );

            // remove selected choice
            if ( choices$ ) {
                choices$.filter( "[aria-selected='true']" ).attr( "aria-selected", "false" ); // todo acc maybe remove aria-selected
            }
            if ( curSel ) {
                delete curSel.selected;
            }

            // if not enterable there must be a matching choice
            if ( options.enterable || choice) {
                if ( choice ) {
                    choice.selected = true;
                    displayValue = choice.d; // display value from list overrides
                    setChoiceSelection( value );
                } else if ( !displayValue ) {
                    displayValue = value;
                }

                isFiltering = false;
                input$.attr( A_DATA_VALUE, value )
                    .val( displayValue );

                // Reset the flag to show an unfiltered result set after selecting an item
                hasFilterValueChanged = false;

                // To keep a consistent behaviour with the text field, an input event is triggered when an option is selected,
                // disregarding if the value hasn't changed, based on the fact that an input event is triggered when copy/paste
                // even when the value is the same and doesn't result on a changed event being triggered.
                if ( ( isAutocomplete || ( !options.multiValued ) ) && triggerInput ) {
                    const inputEvent = $.Event( "input" );
                    inputEvent.apexData = { action: ACTION_SELECTION };

                    // we copy the reference of the apexData object to the data parameter therefore it is easily accessible on Dynamic Actions.
                    input$.trigger( inputEvent, inputEvent.apexData );
                }

                return true;
            } // else
            return false;
        }

        // external: for single values only, it checks if the value is empty and set the empty class
        function setEmpty() {
            input$.parent().toggleClass( C_IS_EMPTY, input$.val() === "" );
        }

        // internal
        function callActivate( focus, chip$ ) {
            chip$.addClass( C_IS_ACTIVE );
            if ( options.activateChip ) {
                focus = !options.activateChip( chip$.attr( A_DATA_VALUE ), chip$, function( focusAfter, newLabel = null, newValue = null ) {
                    if ( newLabel != null ) {
                        chip$.find( SEL_CHIP_LABEL ).text( newLabel );
                    }
                    if ( newValue != null ) {
                        chip$.find( SEL_CHIP_TEXT ).text( newValue );
                    }
                    checkOverflow();
                    if ( focusAfter ) {
                        input$.trigger( "focus" );
                    }
                } );
                if ( !focus ) {
                    // this means activating the chip took focus and the focusout handler will clear the active class so add it back
                    chip$.addClass( C_IS_ACTIVE );
                }
            }
            return focus;
        }

        // internal
        function clearInput( suppressInputEvent = false ) {

            input$.attr( A_DATA_VALUE, "" )
            .val( "" )
            .parent().addClass( C_IS_EMPTY );

            if ( !suppressInputEvent ) {
                const inputEvent = $.Event( "input" );

                inputEvent.apexData = { action: ACTION_DELETION };
                // we copy the reference of the apexData object to the data parameter therefore it is easily accessible on Dynamic Actions.
                input$.trigger( inputEvent, inputEvent.apexData );
            }
        }

        // only for multiValued
        function checkOverflow() {
            if ( options.useOverflow ) {
                let chips$, overflowChip$, lastIndex,
                    availWidth = values$.width(),
                    usedWidth = 0,
                    overflowCount = 0,
                    overflow = false;

                values$.removeClass( "a-Chips--wrap" );

                availWidth -= availWidth / 3; // leave room for input todo consider other ways to reserve space for input
                chips$ = values$.children( SEL_CHIP_APPLIED );
                lastIndex = chips$.length - 1;
                // new chips are added to the right/end so hide them from left/start (least recently added)
                for ( let i = lastIndex; i >= 0; i-- ) {
                    let chip$ = chips$.eq( i );

                    usedWidth += chip$.removeClass( C_IS_OVERFLOW ).width();
                    if ( usedWidth > availWidth && i <= lastIndex ) {
                        overflow = true;
                        overflowCount += 1;
                    }
                    if ( usedWidth > availWidth ) {
                        chip$.addClass( C_IS_OVERFLOW );
                    }
                }
                overflowChip$ = values$.children( SEL_CHIP_OVERFLOW );
                overflowChip$.toggleClass( C_IS_OVERFLOW, overflow );
                if ( overflow ) {
                    overflowChip$.find( ".a-Chip-value" ).text( "+" + overflowCount );
                }
            }
        }

        // only for multiValued
        function checkIfEmpty() {
            let empty = values$.children( SEL_CHIP_APPLIED ).length === 0;

            if ( originalPlaceholder ) {
                input$.attr( "placeholder", empty ? originalPlaceholder : "" );
            }
            checkOverflow();
        }

        function removeChip( chip$ ) {
            const value = chip$.attr( A_DATA_VALUE );

            options.removeValue( value );
            removeValueChip( value );
        }

        // internal only when enterable
        function addInputText( triggerInput = true ) {
            let choice,
                text = input$.val(),
                textLC = text.toLowerCase(),
                returnValue = text;

            if ( Array.isArray( options.choices ) ) { // xxx when external filtering or custom popup there is no way to default the return value
                // if text is in list of choices get value from choice
                choice = options.choices.find( item => item.lc === textLC );
                if ( choice ) {
                    returnValue = choice.r;
                }
            }

            if ( options.multiValued ) {
                addChoice( returnValue, text );
            } else {
                setChoice( returnValue, text, false, triggerInput );
            }
        }

        /**
         *  internal non-multiValued set value from choice list
         *
         * @param {string} returnValue chip value
         * @param {string} displayValue chip display value
         * @param {boolean} [existingChoice] when true it indicates if the choice is an existing value on the data-set
         * @param {boolean} [triggerInput] indicates if the selection should trigger an input event.
         * @ignore
         */
        function setChoice( returnValue, displayValue, existingChoice = false, triggerInput = true ) {
            let lReturnValue = returnValue,
                lDisplayValue = displayValue,
                details;

            if ( options.setValue ) {
                details = options.setValue( returnValue, displayValue, existingChoice );

                // External setValue function can modify the current
                if ( details ) {
                    if ( details.text != null ) {
                        lDisplayValue = details.text;
                    }
                    if ( details.value != null ) {
                        lReturnValue = details.value;
                    }
                }
            }

            setValue( lReturnValue, lDisplayValue, triggerInput );

            if ( !options.enterable ) {
                oldItemValue = getValue();
            }
        }

        /**
         *  Internal multiValued add value from choice list
         *
         * @param {string} returnValue chip value
         * @param {string} text chip display value
         * @param {boolean} [existingChoice] when true it indicates if the choice is an existing value on the data-set
         * @ignore
         */
        function addChoice( returnValue, text, existingChoice = false ) {
            let details, label;

            // The callback may return chip data: value, text, label to influence the chip details
            details = options.addValue( returnValue, text, existingChoice );
            if ( details ) {
                if ( details.text != null ) {
                    text = details.text;
                }
                if ( details.value != null ) {
                    returnValue = details.value;
                }
                label = details.label || "";
            }

            // If option.addValue return has property skip set to true, we don't create anything
            if ( !details || !details.skip ) {
                const inputEvent = $.Event( "input" );

                addValueChip( returnValue, text, label );

                inputEvent.apexData = {};
                if ( existingChoice ) {
                    inputEvent.apexData.action = ACTION_SELECTION;
                }

                // we copy the reference of the apexData object to the data parameter therefore it is easily accessible on Dynamic Actions.
                element$.trigger( inputEvent, inputEvent.apexData );
            }

            clearInput( true );
        }

        // It returns true if the element is fully visible inside the container.
        function isVisible ( element, container ) {
            const elementRect = element.getBoundingClientRect(),
                containerRect = container.getBoundingClientRect();

            return elementRect.top >= containerRect.top && elementRect.bottom <= containerRect.bottom;
        }

        // Scroll the chip into view if needed
        function scrollToChip( chip$, scrollDirection ) {
            const containerDOM = chip$.parent( `.${C_CHIPS}` )[0],
                elementDOM = chip$[0],
                inputDOM = element$.find( `.${C_CHIP_INPUT}` )[0],
                containerRect = containerDOM.getBoundingClientRect(),
                elementRect = elementDOM.getBoundingClientRect(),
                inputRect = inputDOM.getBoundingClientRect(),
                elementRelativeLeftPos = elementRect.left - containerRect.left,
                containerWidth = containerRect.right - containerRect.left,
                elementWidth = elementRect.right - elementRect.left,
                inputWidth = inputRect.right - inputRect.left,
                horizontallyFullyVisible =
                    elementRect.right <= ( containerRect.right - inputWidth ) && elementRect.left >= containerRect.left;

            // It checks if the element is fully visible horizontally, if not some scrolling needs to be applied
            if ( !horizontallyFullyVisible ) {
                if ( scrollDirection === END ) {
                    // When the element scroll position needs to be moved to the right,
                    // because the scroll position is calculate from the left corner, we need to compute the element relative
                    // position and then substract the scrolling surplus to align right element corner with the right container corner.
                    // Due to the input chip to be on the same container and being positioned sticky, we need to reduce the
                    // container width  by the input width so the scroll position doesn't use that space on the scrolling,
                    // computation.
                    containerDOM.scrollBy(  elementRelativeLeftPos - ( containerWidth - elementWidth - inputWidth ) , 0);
                } else if ( scrollDirection === START ) {
                    containerDOM.scrollBy( elementRelativeLeftPos, 0 );
                }
            }
        }

        // Cleaning steps needed to fully remove the comboSelect element.
        function destroy() {
            if ( popup$ ) {
                // We need to clean the popup instance, due to not being inside the comboSelect markup, it won't be removed by
                // simpling removing the elements.
                popup$.popup( "destroy" );
            }
        }

        // Change event management
        // Text field with Autocomplete should trigger only a change event on lose of focus. When an suggestion is selected
        // on the dropdown the value is set programmatically therefore there is not a way to mark the item as changed so the
        // native change event implementation kick in when lose of focus, to overcome this shortcoming, a custom implementation
        // for the change event was created.
        // TODO extends this change event custom behaviour to all the other possible configurations for the common combobox code.
        function triggerChangeEvent ( oldValue, newValue, refreshOldValue ) {
            if ( newValue !== oldValue ) {
                const changeEvent = $.Event( "change" );
                changeEvent.apexData = { oldValue: oldValue, value: newValue };

                shouldTriggerChange = true;
                // we copy the reference of the apexData object to the data parameter therefore it is easly accesible on Dynamic Actions.
                input$.trigger( changeEvent, changeEvent.apexData );

                if ( refreshOldValue ) {
                    oldItemValue = newValue;
                }
            }
        }

        // only used when externalFiltering is true
        const debounceFilter = util.debounce( function( skip = false ) {
            // Evaluating the skip parameter allows to "cancel" a queued filter action, our current debounce implementation
            // does not provide a way to do it.
            if ( !skip ) {
                const minChars = options.minCharactersSearch;
                let curFilter = input$.val(),
                curLen = curFilter.length;

                if ( counter$ && counter$.hasClass( C_IS_ACTIVE ) ) {
                    toggleCounter();
                };

                hasFilterValueChanged = true;

                // We need to make sure that the focus is still on the input element, that avoids
                // the problem of tabbing to another element and then the focus is taken back to the item,
                // this check is only necessary when filtering is done with the user typing on the element
                if ( curLen >= minChars && document.activeElement === input$[0] ) {
                    if ( options.asyncLoading && !popupIsOpen ) {
                        // If function is async we need to open the dialog first to show loading behaviour
                        openDropDown( curFilter);
                    } else {
                        // If not async we call the external filter function that will open the dropdown if content found
                        externalFilter( curFilter );
                    }
                } else if ( curLen < minChars && popupIsOpen ) {
                    closeDropDown();
                }
            }
        }, 250 );

        // apply default options
        // because listbox is single select only need aria-selected='true' never false.
        let defaultTemplate = `<li id='&APEX$ITEM%id!ATTR.' data-index="&APEX$I!ATTR." role="option" class="a-ComboSelect-item" \
data-value="&APEX$ITEM%r!ATTR." \
${A_TABINDEX}="-1" {if APEX$ITEM%selected/}aria-selected="true"{endif/}>\
<span class="a-ComboSelect-label">&APEX$ITEM%d.</span></li>`;

        if ( options.hasIcons && options.hasGroups ) {
            defaultTemplate = `<li id='&APEX$ITEM%id!ATTR.' data-index="&APEX$I!ATTR." role="option" class="{if APEX$ITEM%g/}a-ComboSelect-itemGroup{else/}a-ComboSelect-item{endif/}" \
data-value="&APEX$ITEM%r!ATTR." \
${A_TABINDEX}="-1" {if APEX$ITEM%selected/}aria-selected="true"{endif/}>\
<span class="a-ComboSelect-icon a-Icon &APEX$ITEM%i!ATTR." aria-hidden="true"></span> <span class="a-ComboSelect-label">&APEX$ITEM%d.</span></li>`;
        } else if ( options.hasIcons ) {
            defaultTemplate = `<li id='&APEX$ITEM%id!ATTR.' data-index="&APEX$I!ATTR." role="option" class='a-ComboSelect-item' data-value='&APEX$ITEM%r!ATTR.' \
${A_TABINDEX}='-1' {if APEX$ITEM%selected/}aria-selected="true"{endif/} > \
<span class="a-ComboSelect-icon a-Icon &APEX$ITEM%i!ATTR." aria-hidden="true"></span> <span class="a-ComboSelect-label">&APEX$ITEM%d.</span></li>`;
        } else if ( options.hasGroups ) {
            defaultTemplate = `<li id='&APEX$ITEM%id!ATTR.' data-index="&APEX$I!ATTR." role="option" class="{if APEX$ITEM%g/}a-ComboSelect-itemGroup{else/}a-ComboSelect-item{endif/}" \
data-value="&APEX$ITEM%r!ATTR." \
${A_TABINDEX}="-1" {if APEX$ITEM%selected/}aria-selected="true"{endif/}>\
<span class="a-ComboSelect-label">&APEX$ITEM%d.</span></li>`;
        }

        // We evaluate if an autocomplete configuration is being used, this will be evaluated only creation,
        // and it cannot being changed afterwards
        isAutocomplete = options.enterable && !options.multiValued && !options.expandIcon;

        options = $.extend( {
            escapeChoices: true, // default escape mode for choices
            searchIcon: false,
            clearIcon: false,
            expandIcon: false,
            enterable: false,
            multiValued: false,
            multiSelect: false,
            activeChipMessage: lang.getMessage( "APEX.CS.ACTIVE_VALUE_CHIP" ),
            useOverflow: false,
            hasIcons: false,
            hasGroups: false,
            itemLabelSelector: ".a-ComboSelect-label",
            asyncLoading: false,
            closeOnEmpty: true,
            displayValuesAs: CHIPS,
            minCharactersSearch: 0,
            containerClasses: "apex-item-comboselect",
            isDisabled: () => { return true; }
        }, options );

        popupId = "CS_" + $("#pFlowStepId").val() + "_" + options.baseId;
        // xxx maybe the popup widget should not get reused. perhaps one popup for all is good enough.
        popup$ = topJQuery( "#" + util.escapeCSS( popupId ) ); // the popup is in the top context.
        popup$.parent().remove();

        blurEvent = "blur.csPopupTracking" + popupId;
        mousedownEvent = "mousedown.csPopupTracking" + popupId;
        inputFocusEvent = "focus.csPopupTracking" + popupId;

        if ( options.multiValued ) {
            excludeItemSelector += ",[aria-selected='true']";
        } else {
            // if not multiValued useOverflow doesn't apply so force false
            options.useOverflow = false;
        }

        //
        // Upgrade the simple element markup
        //
        if ( options.containerClasses ) {
            // todo consider require this class be present?
            element$.addClass( options.containerClasses );
        }

        input$ = element$.find( "input" );

        input$.attr( {
            role: "combobox",
            "aria-expanded": "false",
            autocomplete: "off",
            autocorrect: "off", // not a standard but seems to be a thing
            autocapitalize: "none",
            spellcheck: "false",
            "aria-autocomplete": "list"
            // xxx aria-busy? if we know getting choices async
        } );

        if ( !options.multiValued && input$[0].value === "" ) {
            input$.parent().addClass( C_IS_EMPTY );
        }

        if ( options.searchIcon ) {
            // Add search icon at the start
            element$.prepend( `<span class="a-Icon icon-search" ${A_TABINDEX}="-1" aria-hidden="true"></span>` );
        }
        if ( !options.enterable && options.displayValuesAs === SEPARATED ) {
            counter$ = $( `<button type="button" class="${C_CHIPS_COUNTER} ${C_HIDDEN}" ${A_ARIA_PRESSED}="false">0</button>` );
            element$.append( counter$ ); 
        }
        // todo add back icon button for mobile
        if ( options.expandIcon ) {
            let iconName = options.expandIcon;

            // Add drop/open/expand icon at the end
            if ( iconName === true ) {
                iconName = "icon-popup-lov-under";  // todo better icon name?
            }
            if ( options.enterable ) {
                element$.append( '<span class="a-Chip-divider"></span>' ); // todo better divider class name
            }
            // todo better button class
            element$.append( `<button class="a-Button ${C_EXPAND_BUTTON} js-expand" type="button" ${A_TABINDEX}="-1" aria-hidden="true">\
<span class="a-Icon ${iconName}"></span></button>` );
        }

        if ( !options.onOpen ) {
            // unless there is a custom popup add a place for accessible messages about results
            element$.append( `<div class="u-vh js-results-description" aria-live="polite"></div>` );
            resultsDescription$ = element$.children().last();
        }

        // configure choices
        if ( typeof options.choices === "function" ) {
            externalFiltering = true;
        } else if ( options.choices != null && !Array.isArray( options.choices ) ) {
            // if not an array or function must be an element with the choices as children. Extract the choices from the markup
            let choices$ = $( options.choices ).children(),
                choices = [];

            choices$.each( function() {
                let choice$ = $( this ),
                    value = choice$.attr( A_DATA_VALUE ),
                    selected = choice$.attr( "data-selected" ),
                    display = choice$.text(),
                    c = {
                        r: value,
                        d: display
                    };

                if ( selected && selected.toLowerCase() === "true" ) {
                    c.selected = true;
                }
                choices.push( c );
            } );
            choices$.parent().remove();
            options.choices = choices;
        }
        if ( Array.isArray( options.choices ) ) {
            // add a lower case clean version of the display for use in case independent filtering
            options.choices.forEach( c => {
                c.lc = util.stripHTML( c.d.toLowerCase() );
            } );
            // choices$ created just once from renderChoices aria selected state managed from setValue, setChoiceSelection (add/remove chips) set as popup content just once when popup created
            // xxx when choices is a function this fails > maybe choices$ is null when choices is a function (external filtering)
            choices$ = $( renderChoices( options.choices ) );
            // xxx at this point the selection property of choices should match the initial value. verify?
        }

        if ( options.multiValued ) {
            let foundInput = false,
                lastChip$ = null;

            if ( !options.enterable && options.displayValuesAs === SEPARATED ) {
                element$.addClass( "apex-item-comboselect--separated" );
            }

            input$.val( "" ); // for multiValued input must start out empty
            values$ = element$.find( "ul" ).first();
            if ( !values$[0] ) {
                values$ = $("<ul>");
                element$.prepend( values$ );
            }
            values$.addClass( "a-Chips a-Chips--applied" + ( !options.useOverflow ? " a-Chips--wrap" : "" ) )
                .attr( "role", "presentation" ) // avoid AT reading list because the values of the combobox are presented via described by
                .children().each( function( i ) {
                let label,
                    li$ = $(this);

                if ( li$.has( "input" )[0] ) {
                    foundInput = true;
                    li$.addClass( `${C_CHIP} ${C_CHIP_INPUT} ${C_IS_EMPTY}` );
                } else {
                    // if the chip has any spans then it must be either or both of
                    // <span class="a-Chip-label">...</span><span class="a-Chip-text"><span class="a-Chip-value">...</span></span>
                    if ( !li$.has( "span" )[0] ) {
                        // otherwise it is just text to turn into a display text
                        label = li$.text();
                        li$.html( `<span class="a-Chip-text"><span class="a-Chip-value">${util.escapeHTML( label )}</span></span>` );
                    }
                    li$.append( REMOVE_ICON )
                        .addClass( C_CHIP + " " + C_CHIP_APPLIED );

                    if ( !li$.attr( A_DATA_VALUE ) ) {
                        li$.attr( A_DATA_VALUE, "" + ( i + 1 ) );
                    }
                    lastChip$ = li$;
                }

            } );

            if ( options.useOverflow ) {
                let overflow$ = $( `<li class="${C_CHIP} ${C_CHIP_OVERFLOW}"><span class="a-Chip-text"><span class="a-Chip-value"></span></span></li>` );
                if ( lastChip$ ) {
                    lastChip$.after( overflow$ );
                } else {
                    // make sure overflow chip comes before input "chip"
                    values$.prepend( overflow$ );
                }
            }
            if ( !foundInput ) {
                // input not found in the chips container so add a chip and move the input to it
                values$.append( `<li class="${C_CHIP} ${C_CHIP_INPUT} ${C_IS_EMPTY}"></li>` );
                values$.find( `.${C_CHIP_INPUT}` ).append( input$ );
            }
            values$.after( `<div class="u-vh js-active-description"></div><div id="${options.baseId}_desc" class="apex-item-comboselect-display"></div>` );
            valuesActiveDescription$ = values$.next();
            valuesDescription$ = valuesActiveDescription$.next();
            input$.attr( "aria-describedby", options.baseId + "_desc" );
            updateAccessibleValues();
        }
        if ( options.clearIcon ) {
            input$.after( `<span class="a-Chip-clear js-clearInput" ><span class="a-Icon icon-multi-remove" aria-hidden="true"></span></span>` );
        }

        //
        // End of upgrade
        //

        // The interface to return
        comboSelectInterface.options = options;
        comboSelectInterface.getValue = getValue;
        comboSelectInterface.destroy = destroy;

        if ( options.multiValued ) {
            comboSelectInterface.addValueChip = addValueChip;
            comboSelectInterface.removeValueChip = removeValueChip;
            comboSelectInterface.activate = activate;
            comboSelectInterface.updatedValueChip = function() {
                updateAccessibleValues();
            };
            comboSelectInterface.editValue = function( value, displayValue = value ) {
                // todo edit the value in place of the chip
                removeValueChip( value );
                input$.val( displayValue )[0].select();
            };
            comboSelectInterface.isShowingSelectedOnly = isShowingSelectedOnly;

            // todo acc should the focus move to the other items
            originalPlaceholder = input$.attr( "placeholder" );
            if ( values$.css( "direction" ) === "rtl" ) {
                forwardKey = KEY_LEFT;
                backwardKey = KEY_RIGHT;
            }
            checkIfEmpty();
            /* todo determine if this resize logic is needed
                        // keep the list (apex-item-multi) from stretching the field (apex-item-group--popup-lov). The field
                        // can stretch if and how ever it may be configured to do so (theme dependent) and the list should
                        // adjust but adding more values to the list must not stretch the field.
                        // for resize sensor to work the field group must be position relative
                        field$ = values$.parent();
                        field$.css( "position", "relative" );
                        input$.css( "flex-grow", 0 );
                        fixMultipleWidth = function() {
                            var w = field$.width() - button$.outerWidth(true);
                            // it is very important that the width set on the values ul exactly fits (with the button) in the
                            // width of the field otherwise if the field doesn't have a fixed given size it will grow or
                            // shrink continuously because of the resize tracker.
                            values$.css( "max-width", w );
                            valuesWidth = w - parseInt(values$.css("border-left-width"), 10) -
                                parseInt(values$.css("border-right-width"), 10) -
                                parseInt(values$.css("padding-left"), 10) -
                                parseInt(values$.css("padding-right"), 10);
                        }; */
            /* xxx try without this
            widget.util.onElementResize( field$[0], function() {
                fixMultipleWidth();
                theItem.afterModify(); // let the input width adjust
            } );
            widget.util.onVisibilityChange( field$[0], function( pShow ) {
                if ( pShow ) {
                    // In the case of show, we need to update any resize sensors used by the widget, as they will not
                    // work properly if only initialised in a hidden state (with 'display: none').
                    widget.util.updateResizeSensors( field$[0] );
                }
            });
            */
//xxx            fixMultipleWidth();

        } else {
            // single value
            comboSelectInterface.setValue = setValue;
            comboSelectInterface.setEmpty = setEmpty;
        }

        //
        // Add handlers
        //
        /* xxx This is causing some issues where in some cases after click overflow chip it snaps back to no overflow after the 300ms delay.
        const resizeDelay = util.debounce( checkOverflow, 300 );

        widgetUtil.onElementResize( element$, () => {
            resizeDelay();
        } );
        */

        element$.on( E_CLICK, function( event ) {
            let focus = true,
                target$ = $( event.target ),
                removeButton$ = target$.closest( ".js-removeChip" ),
                clearButton$ = target$.closest( ".js-clearInput" ),
                overflowChip$ = target$.closest( SEL_CHIP_OVERFLOW ),
                chip$ = target$.closest( SEL_CHIP_APPLIED );

            if ( options.isDisabled() ) {
                return;
            }
            if ( overflowChip$[0] ) {
                values$.addClass( "a-Chips--wrap" );
            } else if ( removeButton$[0] ) {
                removeChip( chip$ );
            } else if ( clearButton$[0] ) {
                // If multiValued we suppress the input event, because only the filtering value is cleared and it is not affecting the value
                clearInput( options.multiValued );
            } else if ( chip$[0] ) {
                values$.children( SEL_IS_ACTIVE ).removeClass( C_IS_ACTIVE );
                focus = callActivate( true, chip$ );
                // Click a chip clears the filter value, navigating left and right or even deleting with BACKSPACE/DELETE
                // doesn't work correctly when there is a value on the filter
                input$.val( "" );
            }
            // If the "click" was cause by the keyboard like ENTER or SPACE on a button that has focus, no focus is moved.
            // Event.detail is used to check that, when 1 is is a mouse event and 0 it is not, but when we are testing with 
            // our unit tests, event.detail is undefined so we also let it pass on that case, so the tests run correctly.
            if ( focus && ( event.detail || event.detail === undefined ) ) {
                setTimeout( () => {
                    // Triggering focus when the input element has focus is unnecessary, therefore it is checked that 
                    // the focus is not on the input element before triggering
                    if ( ( ( !options.enterable && options.multiValued ) && ( !element$[0].contains( document.activeElement ) 
                            // If the focus is not on the input element but it is on the element, any mousedown will return the focus to the input element
                            || ( element$[0].contains( document.activeElement ) && counter$ && document.activeElement !== input$[0] ) ) )
                        || ( options.enterable || !options.multiValued ) ) {
                        input$.trigger( "focus" );
                    }
                }, 0 );
            }
        } ).on( E_MOUSEDOWN, function( event ) {
            let target$ = $( event.target ),
                clearButton$ = target$.closest( ".js-clearInput" ),
                chip$ = target$.closest( SEL_CHIP_APPLIED + "," + SEL_CHIP_OVERFLOW ),
                expandButton$ = target$.closest( SEL_EXPAND_BUTTON ),
                mouseDownOnCounter = target$.closest( SEL_CHIPS_COUNTER ).length > 0,
                preventFocus = false;

            // If mouse down on an element inside the ComboSelect we don't want the focusout logic to be performed.
            if ( element$.has( $( document.activeElement ) ).length && chip$[0] ) {
                ignoreFocusout = true;
            } 

            if ( event.button === MAIN_MOUSE_BUTTON ) {
                if ( !options.enterable && options.multiValued ) {
                    if ( !element$[0].contains( document.activeElement ) && event.target !== input$[0] ) {
                        preventFocus = true;
                    } else if ( element$[0].contains( document.activeElement ) 
                        && ( event.target !== input$[0] ) ) {
                        // It allows only a subset of elements to take focus when the focus is on   
                        preventFocus = true;    
                    }
                } else {
                    if ( event.target !== input$[0] ) {
                        preventFocus = true;
                    }
                }
            }

            if ( preventFocus ) {
                event.preventDefault();
            }

            // for primary mouse down only (Ignore the context menu mouse down)
            event = event.originalEvent || event;
            if ( ( event.buttons || 1 ) & 1 ) { // eslint-disable-line no-bitwise
                let inputValue = input$.val();

                if ( !popupIsOpen && !chip$[0] && !clearButton$[0] && !mouseDownOnCounter ) {
                    // We overwrite the inputValue to an empty string if not enterable and not multi
                    // and if filter hasn't changed, the dropdown shows an unfiltered result set
                    if ( !hasFilterValueChanged && !options.enterable && !options.multiValued ) {
                        inputValue = "";
                    }

                    if ( inputValue.length >= options.minCharactersSearch ) {
                        if ( externalFiltering && !options.asyncLoading ) {
                            externalFilter( inputValue );
                        } else {
                            openDropDown();
                        }
                    }
                } else if ( mouseDownOnCounter ) {
                    if ( !element$[0].contains( document.activeElement ) ) {
                        input$.trigger( "focus" );
                    }
                    toggleCounter();
                } else if ( popupIsOpen && !options.enterable && options.multiValued && expandButton$.length ) {
                    closeDropDown();
                }
            } 
        } ).on( E_FOCUSOUT, function( event ) {
            if ( values$ ) {
                values$
                    .removeClass( C_IS_FOCUSED )
                    .children( SEL_IS_ACTIVE ).removeClass( C_IS_ACTIVE );
            }
            // if enterable and a value is entered add it but not if loose focus because of opening popup
            if ( options.enterable && !isAutocomplete ) {
                if ( ( input$.val() || ( !options.multiValued && !input$.val() ) )  && !ignoreFocusout ) {
                    addInputText( false );
                }
            }

            if ( !ignoreFocusout ) {
                if ( !options.enterable ) {
                    // If not enterable and single value, we need to revert the changes to the last valid state
                    if ( !options.multiValued ) {
                        if ( input$.val() !== "" && oldItemValue ) {
                            input$.val( oldItemValue.displayValue );
                        } else if ( input$.val() === "" || ( input$.val() !== "" && !oldItemValue ) ) {
                            // If item is cleaned up, we cal setValue and pass undefined to clean it up.
                            options.setValue( undefined, undefined, false );
                        }

                        setOldValue = true;
                        hasFilterValueChanged = false;
                    } else {
                        // When focusout and not enterable we always clear the filtering value
                        input$.val( "" );
                    }

                }


                element$.trigger( $.Event( "comboSelectFocusOut" ) );
            }

            // If the focus out is outside the element it closes the dropdown down, if it was triggered by 
            // changes of focus on the element it ignores it. 
            if ( !options.enterable && options.multiValued && !element$[0].contains( event.originalEvent.relatedTarget ) ) {
                if ( counter$ ) {
                    counter$.removeAttr( A_TABINDEX, "0" );
                    input$.removeAttr( A_TABINDEX );
                }
                closeDropDown();
            }

            isFiltering = false;
            ignoreFocusout = false;
        } );

        if ( counter$ ) {
            counter$.on( E_KEYDOWN, function( event ) {
                const kc = event.which;
                let focusedComboItem$,
                    itemFocused;

                if ( popup$.length ) {
                    focusedComboItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_FOCUSED}` );
                    itemFocused = focusedComboItem$ && focusedComboItem$.length;
                };

                if ( kc === KEY_ENTER || kc === KEY_SPACE ) {
                    // If an item is already has focus we don't toggle the counter
                    if ( itemFocused && popupIsOpen ) {
                        selectItem( focusedComboItem$ );
                    } else {
                        toggleCounter();
                    }
                } else if ( kc === KEY_ESCAPE ) {
                    if ( popupIsOpen ) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    if ( itemFocused && popupIsOpen ) {
                        // If an item is being focused we return the focus to the input element on closing on ESCAPE
                        input$.trigger( E_FOCUS );
                    }
                    
                    closeDropDown();
                } else if ( kc === KEY_DOWN || kc === KEY_UP ) {
                    navigateItems( event, kc );
                    // We re-compute it because it will be modified by the navigateItems function
                    focusedComboItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_FOCUSED}` );

                    if ( focusedComboItem$ && focusedComboItem$.length && popupIsOpen ) {
                        input$.trigger( E_FOCUS );
                    }
                } else if ( kc === KEY_TAB ) {
                    let willCloseDropdown = false;
                    if ( focusedComboItem$ && focusedComboItem$.length && popupIsOpen ) {
                        if ( event.altKey ) {
                            input$.attr( A_TABINDEX, "-1" );
                            willCloseDropdown = true;
                        }
                    } else {
                        if ( !event.shiftKey ) {
                            willCloseDropdown = true;
                        }
                    }

                    if ( willCloseDropdown ) {
                        closeDropDown();
                    }
                }  
            } );
        }

        input$.on( E_FOCUS, function() {
            if ( values$ ) {
                values$.addClass( C_IS_FOCUSED );
            }
            if ( !options.enterable && !currentValue ) {
                currentValue = getValue();
            }

            if ( isAutocomplete || ( !options.enterable && !options.multiValued ) ) {
                // We need to use a flag to set the old value only once because jQuery UI dialog code trigger focus event
                // on popup closed, also our own code does it on message.js, it could be possible to add a logic to evaluate
                // if the event is being triggered programmatically or if it is an actual event, but that would make this behaviour
                // untestable on our unit tests which relies on simulated user interactions.
                if ( setOldValue ) {
                    if ( isAutocomplete ) {
                        oldItemValue = input$.val();
                    } else {
                        oldItemValue = getValue();
                    }
                    setOldValue = false;
                }
            }

            if ( options.displayValuesAs === SEPARATED ) {
                const lastChip$ = element$.find( `.${C_CHIPS} .${C_CHIP_APPLIED}` ).last();

                // It moves the scroll all the way to the right if necessary, so the user always sees the last chip added
                if ( lastChip$.length ) {
                    scrollToChip( lastChip$, END );
                }
            }
        } ).on( E_KEYDOWN, function( event ) {
            let kc = event.which,
                printable = false,
                focusedComboItem$,
                displayingNoMatchesMsg = popup$.find( SEL_COMBOSELECT_LIST ).hasClass( C_NO_MATCHES ) && popupIsOpen;

            if ( popup$.length ) {
                focusedComboItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_FOCUSED}` );
            }

            if ( options.multiValued ) {
                let handled = false,
                    curChip$ = values$.children( SEL_IS_ACTIVE );

                if ( input$.val() === "" ) {
                    if ( kc === KEY_DELETE || kc === KEY_BACKSPACE ) {
                        if ( event.target === input$[0] && kc === KEY_BACKSPACE && !curChip$[0] ) {
                            // if focus is in the input and no other item is active
                            // then backspace should act like backwardKey
                            moveToFirstChip();
                        }
                        if ( curChip$[0] ) {
                            removeChip( curChip$ );
                        }
                        handled = true;
                    } else if ( kc === backwardKey ) {
                        if ( curChip$[0] ) {
                            let prev$ = curChip$.prevAll().filter( SEL_VISIBLE );
                            if ( prev$[0] ) {
                                curChip$.removeClass( C_IS_ACTIVE );
                                makeChipActive( prev$.first(), START );
                            }
                        } else {
                            moveToFirstChip();
                        }
                        handled = true;
                    } else if ( kc === forwardKey ) {
                        if ( curChip$[0] ) {
                            let next$ = curChip$.nextAll().filter( SEL_VISIBLE );
                            if ( next$[0] ) {
                                curChip$.removeClass( C_IS_ACTIVE );
                                curChip$ = next$.first();
                                if ( !curChip$.hasClass( C_CHIP_INPUT ) ) {
                                    makeChipActive( curChip$, END );
                                } else {
                                    valuesActiveDescription$.attr( "aria-live", "off" ).text( "" );
                                }
                            }
                        }
                        handled = true;
                    } else if ( kc === KEY_ENTER || kc === KEY_SPACE ) {
                        if ( curChip$[0] ) {
                            if ( curChip$.hasClass( C_CHIP_OVERFLOW ) ) {
                                values$.addClass( "a-Chips--wrap" );
                            } else if ( kc === KEY_ENTER ) {
                                // space does the same thing but must be handled on keyup
                                callActivate( true, curChip$ );
                            }
                            handled = true;
                        }
                    }
                    if ( handled ) {
                        event.preventDefault();
                        return;
                    }
                } else if ( curChip$ && input$.val() !== "" ) {
                    // If the input element is not empty the BACKWARDS and FOWARDS keys move
                    // between the characters in the input element and not between the chips
                    // therefore we removed the active class of any active chip
                    curChip$.removeClass( C_IS_ACTIVE );
                }
            }

            if ( ( kc === KEY_DOWN || kc === KEY_UP ) && !displayingNoMatchesMsg ) {
                navigateItems( event, kc );
            } else if ( kc === KEY_ENTER ) {
				if ( !options.onOpen  ) {
                    let preselectedItem$ = $();

                    if ( popup$.length ) {
                        preselectedItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_PRESELECTED}` );
                    }

                    // If item has been preselected or an item has been focused, on enter with select the item
                    if ( ( ( focusedComboItem$ && focusedComboItem$.length) || preselectedItem$.length ) && popupIsOpen ) {
                        selectItem( focusedComboItem$.length ? focusedComboItem$ : preselectedItem$ );

                        if( !options.multiValued ) {
                            input$.parent().removeClass( C_IS_EMPTY);
                        }
                    } else if ( !isAutocomplete && input$.val() && options.multiValued && options.enterable ) {
                        // if enterable, multiValued and a value is entered add it.
                        addInputText();
                        debounceFilter( true ); // If a filter action was queued it overwrites it and do nothing.
                        closeDropDown();

                        event.stopPropagation(); // this keeps higher level controls like grid from acting on the enter key
                        event.stopImmediatePropagation();
                    } else if ( isAutocomplete && ( ( options.onOpen || !popupIsOpen ) || ( !options.onOpen && popupIsOpen ) ) ) {
                        triggerChangeEvent( oldItemValue, input$.val(), true );
                    }
                }

                // prevent the browser default to submit the page when this is the only text item on the page
                event.preventDefault();
            } else if ( kc === KEY_ESCAPE ) {
                if ( popupIsOpen ) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                closeDropDown();
            } else if ( kc === KEY_TAB ) {
                let preselectedItem$ = $();

                if ( popup$.length ) {
                    preselectedItem$ = popup$.find( `${SEL_COMBO_ITEM}${SEL_IS_PRESELECTED}` );
                }

                if ( options.enterable && options.multiValued && input$.val() ) {
                    // if enterable and a value is entered add it.
                    addInputText();
                }

                if ( counter$ ) {
                    let willCloseDropdown = false;
                    
                    if ( focusedComboItem$ && focusedComboItem$.length && popupIsOpen ) {
                        counter$.attr( A_TABINDEX, "-1" );
                        willCloseDropdown = true;
                    } else {
                        if ( event.shiftKey ) {
                            willCloseDropdown = true;
                        } else {
                            if ( !counter$.is( ":visible" ) ) {
                                willCloseDropdown = true;
                            }
                        }
                    }

                    if ( willCloseDropdown ) {
                        closeDropDown();
                    }
                }

                // If item is not multi-value we select the selected or preselected item on TAB
                if ( !options.multiValued && !options.onOpen && popupIsOpen && ( focusedComboItem$.length || preselectedItem$.length ) ) {
                    selectItem( focusedComboItem$.length ? focusedComboItem$ : preselectedItem$ );
                    input$.parent().removeClass( C_IS_EMPTY );
                } else if ( !counter$ ) {
                    closeDropDown();
                }
            } else if ( !options.enterable ) {
                // If select list semantics (not enterable) then typing keys should open the dialog/popup and start filtering
                printable = isKeyPrintable ( kc, event.ctrlKey, event.metaKey );

                if ( printable ) {
                    isFiltering = true;
                }
            }

        } ).on( E_KEYUP, function( event ) {
            let kc = event.which,
                printable = isKeyPrintable ( kc, event.ctrlKey, event.metaKey ),
                callFilter = true,
                o = options;

            if ( options.multiValued && kc === KEY_SPACE ) {
                let curChip$ = values$.children( SEL_IS_ACTIVE );

                if ( curChip$[0] && !curChip$.hasClass( C_CHIP_OVERFLOW ) ) {
                    //Avoids calling the filter when a chip has been targeted
                    callFilter = false;
                    callActivate( true, curChip$ );
                }
            }

            if (  o.multiValueSeparator && o.multiValueSeparator.includes( event.key ) ) {
                callFilter = false;
            }

            if ( externalFiltering && printable && callFilter ) {
                debounceFilter();
            }
        } ).on( "input", function( e ) {
            const o = options;

            // If the input event was triggered when selecting an option, no action is taken
            if ( !e.apexData || ( e.apexData && e.apexData.action !== ACTION_SELECTION ) ) {
                let callFilter = true,
                    empty = input$[0].value === "";

                if ( !empty && o.multiValued ) {
                    values$.children( SEL_IS_ACTIVE ).removeClass( C_IS_ACTIVE );
                }

                if ( o.autoTagCreation && o.multiValued ) {
                    const chips = o.autoTagCreation( input$.val() );

                    if ( chips ) {
                        chips.forEach( el => {
                            // We add a chip per evey chip detected on the field
                            addChoice( el, el );
                        } );

                        // If at least one chip is created, then we close the dropdown
                        if ( chips.length ) {
                            closeDropDown();
                            debounceFilter( true ); // If a filter action was queued it overwrites it and do nothing.
                        }

                        // Clear input value
                        callFilter = false;
                        input$.val( "" );
                        empty = true;
                    }
                }

                input$.parent().toggleClass( C_IS_EMPTY, empty );
                if ( externalFiltering && callFilter ) {
                    debounceFilter();
                }
            }
        } ).on( E_FOCUSOUT, function () {
            if ( isAutocomplete ) {
                // When focusout out if value is different from the old value a change event will be triggered.
                triggerChangeEvent( oldItemValue, input$.val() );
                setOldValue = true;
            }
        } ).on( "change", function( e ) {
            // Due to the custom change event logic, we need to create a proxy to allow only the needed change events
            // to be triggered for the element, flag shouldTriggerChange is the one used for this purpose
            if ( isAutocomplete ) {
                if ( !shouldTriggerChange ) {
                    e.stopPropagation();
                } else {
                    shouldTriggerChange = false;
                }
            }
        } );

        return comboSelectInterface;
    };

    const WIDGET_IGNORE_METHODS = ["constructor", "widget", "option"],
        WIDGET_IGNORE_OPTIONS = ["create"];

    /**
     * Internal use
     * Adds to object instance all the public methods and options of the given widget.
     *
     * @ignore
     * @param {object} instance An object such as a region interface to have the methods and properties added to.
     * @param {jQuery} el$ The widget element jQuery object
     * @param {string} widgetName The name of the widget
     * @param {array} excludeMethods An array of method names that are not to be copied
     * @param {array} excludeOptions An array of option names that are not to be copied
     * @returns {*}
     */
    widgetUtil.makeInterfaceFromWidget = function( instance, el$, widgetName, excludeMethods = [], excludeOptions = [] ) {
        let widgetInst = el$[widgetName]("instance"),
            options = widgetInst.options;

        function get(prop) {
            return widgetInst.option( prop );
        }

        function set(prop, value) {
            widgetInst.option( prop, value );
        }

        for ( let p in widgetInst ) {
            if ( typeof widgetInst[p] === "function" && p[0] !== "_" &&
                !excludeMethods.includes( p ) && !WIDGET_IGNORE_METHODS.includes( p ) ) {

                // focus and refresh are common methods to allow being overwritten
                if ( p !== "refresh" && p !== "focus" && instance[p] !== undefined ) {
                    throw new Error( `Can't overwrite method '${p}'` );
                }
                instance[p] = widgetInst[p].bind(widgetInst);
            }
        }
        for ( let p in options ) {
            if ( !excludeOptions.includes( p ) && !WIDGET_IGNORE_OPTIONS.includes( p ) ) {
                if ( instance[p] !== undefined ) {
                    throw new Error( `Can't overwrite property '${p}'` );
                }
                Object.defineProperty( instance, p, {
                    enumerable: true,
                    get: () => { return get( p ); },
                    set: value => { set( p , value ); }
                });
            }
        }

        instance.widget = function() {
            return el$;
        };

        return instance;
    };

    /**
     * Function that implements cascading LOV functionality for an item type plug-in. This function is a wrapper of the
     * apex.server.plugin function but provides additional features.
     *
     * @param {string | jQuery | DOM} pList Identifies the page item of the item type plug-in.
     * @param {String} pAjaxIdentifier        Use the value returned by the PL/SQL package apex_plugin.get_ajax_identifier to identify your item type plug-in.
     * @param {Object} [pData]                Object which can optionally be used to set additional values which are send with the
     *                                        AJAX request. For example pData can be used to set the scalar parameters x01 - x10 and the
     *                                        arrays f01 - f20
     * @param {Object} [pOptions]             Object which can optionally be used to set additional options for the AJAX call. See apex.server.plugin
     *                                        for standard attributes. In addition pOptions supports the attributes:
     *                                          - "optimizeRefresh" Boolean to specify if the AJAX call should not be performed if one off the page items
     *                                                              specified in dependingOn is empty.
     *                                          - "dependingOn"     jQuery selector, jQuery- or DOM object which identifies the DOM element
     *                                                              of which the current page item is depending on.
     * @return {jqXHR}
     *
     * @example
     *
     * apex.widget.util.cascadingLov ( pItem, pAjaxIdentifier, {
     *     x01: "test"
     *     }, {
     *     optimizeRefresh:   true,
     *     dependingOn:       "#P1_DEPTNO",
     *     pageItemsToSubmit: "#P1_LOCATION",
     *     clear:   function() { ... do something here ... },
     *     success: function( pData ) { ... do something here ... }
     *     } );
     *
     * @memberOf apex.widget.util
     **/
    widgetUtil.cascadingLov = function( pList, pAjaxIdentifier, pData, pOptions ) {
        var lList$     = $( pList, apex.gPageContext$ ),
            lQueueName = lList$[0] ? lList$[0].id : "lov",
            lOptions   = extend( {
                optimizeRefresh: true,
                queue: { name: lQueueName, action: "replace" }
            }, pOptions ),
            lNullFound = false;

        // Always fire the before and after refresh event and show a load indicator next to the list
        if ( !lOptions.refreshObject ) {
            lOptions.refreshObject    = lList$;
        }
        if ( !lOptions.loadingIndicator ) {
            lOptions.loadingIndicator = lList$;
        }

        // We only have to refresh if all our depending values are not null
        if ( lOptions.optimizeRefresh ) {
            $( lOptions.dependingOn, apex.gPageContext$ ).each( function() {
                if ( apex.item( this ).isEmpty() ) {
                    lNullFound = true;
                    return false; // stop execution of the loop
                }
            });

            // All depending values are NULL, let's take a shortcut and not perform the AJAX call
            // because the result will always be an empty list
            if ( lNullFound ) {
                // trigger the before refresh event if defined
                lOptions.refreshObject.trigger( 'apexbeforerefresh' );

                // Call clear callback if the attribute has been specified and if it's a function
                if ( typeof lOptions.clear === "function" ) {
                    lOptions.clear();
                }

                // Trigger the change event for the list because the current value might have changed.
                // The change event is also needed by cascading LOVs so that they are refreshed with the
                // current selected value as well (bug# 9907473)
                // If the select list actually reads data, the change event is fired in the _addResult as soon as
                // a new value has been set (in case the LOV doesn't contain a null display entry)
                lList$.trigger( "change" );

                // trigger the after refresh event if defined
                lOptions.refreshObject.trigger( 'apexafterrefresh' );
                return; // we are done, exit cascadingLov
            }
        }

        // Include dependingOn page items into the pageItems list
        pData.pageItems = $( pData.pageItems, apex.gPageContext$ ).add( lOptions.dependingOn );
        return apex.server.plugin( pAjaxIdentifier, pData, lOptions );
    }; // cascadingLov

    /*
     * Internal use
     * Creates and opens the dialog or popup associated with a Popup LOV item.
     * Side effect is setting the model name on the item under key "popupLovModelName" and search state
     * info under key "popupSearchState".
     *
     * todo issues:
     *     control break/groups for tmv, disabled items,
     *     for groups icon view needs to support column breaks and have option for breaks to not be collapsible
     *     frozen column issue where non-frozen table shifts to a new row.
     *     In grid view may want home/end to go to first/last row not column in row.
     *     Icon view uses home/end to go to first/last row but doesn't support page up/down.
     *     How can user choose between scroll and load more paging?
     *
     * boolean forceRefresh if true the search results should be refreshed (or cleared if initialFetch option is "none")
     * string searchText if not null use this as the initial value of the search field
     * boolean typeAhead if true the searchText (likely just a single character) is from the user starting to type in the combobox field
     * object options:
     *  string itemId
     *  string title
     *  boolean isPopup
     *  boolean enterable
     *  number width
     *  number height
     *  object extraOut
     *  boolean persistState
     *  string initialSearch only applies when dialog is first created/initialized
     *  boolean incrementalSearch
     *  number minSearchChars
     *  boolean multiple
     *  string displayColumn
     *  string valueColumn
     *  string iconColumn
     *  boolean hasDisplayValue
     *  string display list|grid
     *  object columns If there is a meta column it must be called "_meta". Extra property bool canSearch controls highlighting
     *  object defaultGridOptions
     *  object defaultIconListOptions
     *  string ajaxIdentifier
     *  Array of strings itemsToSubmit
     *  Element pluginTarget
     */
    widgetUtil.openPopupLov = function( forceRefresh, searchText, typeAhead, options, callback ) {
        var model, view$, viewInstance, dialog$, dialogOptions,
            searchBar$, searchInput$, clearButton$, messageContent, sessionStore,
            topJQuery = util.getTopApex().jQuery,
            persistentState = null,
            isPopup = options.isPopup || false,
            noData = lang.getMessage( "APEX.POPUP_LOV.NO_RESULTS" ),
            filterRequiredNoData = null,
            incrementalSearch = options.incrementalSearch,
            initialSearch = options.initialSearch || "",
            item$ = $( "#" + util.escapeCSS( options.itemId ) ),
            baseId = "PopupLov_" + $("#pFlowStepId").val() + "_" + options.itemId, // including page to help keep it unique on top level apex page
            dialogId = baseId + "_dlg",
            result = null;

        function resize() {
            // Don't need to calculate height because dialog uses flex layout
            // but do need to let grid or tmv know about the new size.
            viewInstance.resize();
        }

        function refresh( searchControl, search, sortCol, sortDir ) {
            let searchRe,
                change = false,
                noFetch = false,
                fetchData = model.getOption( "fetchData" );

            if ( searchControl.forceRefresh ) {
                change = true;
                if ( options.initialFetch === "none" && !( searchControl.typeAhead && incrementalSearch ) ) {
                    noFetch = true;
                }
                fetchData.search = null;
                searchControl.forceRefresh = false; // reset this so that subsequent fetches work
            }

            if ( search !== null && search !== fetchData.search ) {
                fetchData.search = search;
                change = true;
            }
            if ( sortCol && sortDir && ( sortCol !== fetchData.sortColumn || sortDir !== fetchData.sortDirection ) ) {
                fetchData.sortColumn = sortCol;
                fetchData.sortDirection = sortDir;
                change = true;
            }
            if ( change ) {
                // todo consider in future server could have search options for doing some other kind of search such as case insensitive or exact or regular expression
                // This assumes that the backend is using LIKE with no escape character. Turn this into a RE.
                // '_' -> '.' '%' -> '.*'
                // Rather than any character (.) exclude markup characters because they cause confusion with markup in highlightSearchTerm
                searchRe = util.escapeRegExp( fetchData.search ).replace( /[_%]/g, function ( m ) {
                    return "[^<>&]" + ( m === "%" ? "*" : "" );
                } );
                viewInstance.options.highlighterContext = {
                    term: fetchData.search,
                    re: new RegExp( "([<>&;])|(" + searchRe + ")", "ig" )
                };
                if ( filterRequiredNoData ) {
                    if ( search.length >= options.minSearchChars && !( noFetch || searchControl.typeAhead ) ) {
                        viewInstance._setOption( "noDataMessage", noData );
                        model.clearData();
                    } else {
                        viewInstance._setOption( "noDataMessage", filterRequiredNoData );
                        model.setData( [] );
                        fetchData.search = null; // forget the search so in the case of no initial search can force to search on nothing
                    }
                } else {
                    if ( searchControl.typeAhead && !incrementalSearch ) {
                        model.setData( [] );
                        fetchData.search = null; // forget the search char so can search on it if desired
                    } else {
                        model.clearData();
                    }
                }
                searchControl.typeAhead = false;
            }
        }

        function saveState() {
            sessionStore.setItem( "state", JSON.stringify( persistentState ) );
        }

        function loadState() {
            var obj;

            sessionStore = apex.storage.getScopedSessionStorage( {
                prefix: "ORA_WWV_apex." + baseId,
                usePageId: true,
                useAppId: true
            } );

            persistentState = {};
            if ( options.display === "grid" ) {
                persistentState.columnWidths = {};
            }
            obj = sessionStore.getItem( "state" );
            if ( obj ) {
                try {
                    obj = JSON.parse( obj );
                    // Must validate data from session storage. All are optional.
                    // dialog size
                    if ( !isPopup ) {
                        persistentState.width = parseInt( obj.width, 10 ) || options.width;
                        persistentState.height = parseInt( obj.height, 10 ) || options.height;
                    }
                    // sort info
                    if ( obj.sortDirection && /^(asc|desc)$/.test( obj.sortDirection ) ) {
                        persistentState.sortDirection = obj.sortDirection;
                    }
                    if ( options.columns[obj.sortColumn] ) {
                        persistentState.sortColumn = obj.sortColumn;
                    }
                    // column widths
                    for ( let [ prop, w ] of Object.entries( obj.columnWidths ) ) {
                        w = parseInt( w, 10 );
                        if ( w ) {
                            persistentState.columnWidths[prop] = w;
                        }
                    }
                } catch ( ex ) {
                    // Ignore any exception. If someone has messed with the state object no worries the next saveState will set things right
                }
            }
        }

        if ( options.persistState ) {
            loadState();
        }

        /*
         * The PopupLOV item could be in an APEX modal page iframe but needs to open in the top level APEX context
         * so that it is not constrained to the iframe window boundary.
         * The dialog itself will be created and opened in the top APEX context because of using showDialog.
         * However we can't assume that the top context will have all the needed libraries loaded and don't want
         * to store the models there anyway.
         * So the jQuery content of the dialog needs to be created in this context. This happens in the init callback.
         */
        messageContent = function() {
            return "<div class='a-PopupLOV-dialog'></div>";
        };

        // Set some values on the input for use by init and open
        item$.data( "popupSearchState", {
            forceRefresh: forceRefresh,
            typeAhead: typeAhead,
            searchText: searchText
        } );

        dialog$ = topJQuery( "#" + util.escapeCSS( dialogId ) ); // the dialog is in the top context.
        if ( !dialog$[0] && persistentState ) {
            // load options from persistent state for dialog creation
            options.width = persistentState.width || options.width;
            options.height = persistentState.height || options.height;
            if ( persistentState.sortColumn && persistentState.sortDirection ) {
                for ( const [ prop, def ] of Object.entries( options.columns ) ) {
                    if ( prop === persistentState.sortColumn && def.canSort ) {
                        def.sortIndex = 1; // assume there can be just one sort column
                        def.sortDirection = persistentState.sortDirection;
                    } else {
                        delete def.sortIndex;
                        delete def.sortDirection;
                    }
                }
            }
            if ( persistentState.columnWidths ) {
                for ( const [prop, w] of objectEntries( persistentState.columnWidths ) ) {
                    if ( options.columns[prop] ) {
                        options.columns[prop].width = w;
                    }
                }
            }
        }

        dialogOptions = {
            id: dialogId,
            title: options.title || lang.getMessage( "APEX.POPUP_LOV.TITLE" ), // "Search" see bug 31972864,
            isPopup: isPopup,
            parentElement: isPopup ? item$.closest( ".apex-item-group--popup-lov" ) : null,
            returnFocusTo: item$[0], // set explicit return because of potential isPopup AND open from input trap
            noOverlay: true, // only applies if isPopup
            draggable: true,
            resizable: true,
            width: 200, // something just in case
            height: options.height,
            okButton: false,
            dialogClass: "ui-dialog-popuplov",
            notification: false,    // keeps the role as 'dialog'
            callback: function() {
                var map, value, display,
                    setAddMethod = "setValue",
                    theItem = apex.item( options.itemId );

                if ( options.multiple ) {
                    // If multiple values then picking something is to add rather than set.
                    setAddMethod = "addValue";
                }
                if ( result ) {
                    if ( typeof result === "object" && hasOwnProperty( result, "d" ) && hasOwnProperty( result, "v" ) ) {
                        theItem[setAddMethod]( result.v, result.d );
                    } else if ( typeof result === "object" && hasOwnProperty( result, "v" ) ) {
                        theItem[setAddMethod]( result.v );
                    } else {
                        theItem[setAddMethod]( result );
                    }
                    if ( !options.multiple ) {
                        // with multiple values extra outputs makes no sense.
                        map = options.extraOut;
                        if ( map ) {
                            // store additional outputs
                            for ( const [p, entry] of objectEntries( map ) ) {
                                value = result[p];
                                display = null;
                                if ( value !== null && typeof value === "object" && hasOwnProperty( value, "d" ) ) {
                                    value = value.v;
                                    display = value.d;
                                }
                                $s( entry.item, value, display );
                            }
                        }
                    }
                }
                viewInstance.setSelectedRecords( [], false ); // clear the selection when leaving the dialog
                if ( callback ) {
                    callback( result );
                }
            },
            init: function( dialog$ ) {
                var gridOptions, listOptions, grid$, template, displayCol, debounceSearch, content$,
                    searchButton$,
                    sortColumn = null,
                    sortDirection = null,
                    modelName = baseId + "_m",
                    widget = dialog$.is( ":data(apexPopup)" ) ? "popup" : "dialog",
                    searchLabel = lang.getMessage( "APEX.POPUP.SEARCH" ),
                    searchControl = {
                        forceRefresh: forceRefresh,
                        typeAhead: typeAhead,
                        searchText: initialSearch || searchText
                    },
                    out = util.htmlBuilder();

                function makeSubstitution( name ) {
                    if ( name.match( /^[A-Z0-9_$#]+$/ ) ) {
                        return "&" + name + ".";
                    } // else
                    return '&"' + name + '".';
                }

                function save() {
                    var rec = viewInstance.getSelectedRecords()[0];

                    if ( rec ) {
                        result = {
                            v: model.getValue( rec, options.valueColumn )
                        };
                        if ( options.hasDisplayValue && options.displayColumn ) {
                            result.d = model.getValue( rec, options.displayColumn );
                        }
                        if ( options.extraOut ) {
                            Object.keys( options.extraOut ).forEach( function( p ) {
                                result[p] = model.getValue( rec, p );
                            } );
                        }

                        dialog$[widget]( "close" );
                    }
                }

                function saveNullValue() {
                    result = {
                        v: options.nullValue,
                        d: options.nullDisplayValue
                    };
                    // Assume best thing to do with extra outputs is clear them when the Popup LOV is set to the null value.
                    if ( options.extraOut ) {
                        Object.keys( options.extraOut ).forEach( function( p ) {
                            result[p] = "";
                        } );
                    }
                    dialog$[widget]( "close" );
                }

                function highlightSearchTerm( context, value, col ) {
                    let ignore = null;

                    if ( !context.term || ( col && col.canSearch === false ) ) {
                        // if no search term or column doesn't support searching then nothing to highlight
                        return value;
                    } // else
                    return value.replace( context.re, function( m, p1, p2 ) {
                        // don't highlight inside tags <...> or character entities &...;
                        // see context object defined above
                        if ( p1 ) {
                            switch ( p1 ) {
                            case "<":
                                ignore = p1;
                                break;
                            case ">":
                                if ( ignore === "<" ) {
                                    ignore = null;
                                }
                                break;
                            case "&":
                                if ( !ignore ) {
                                    ignore = p1;
                                }
                                break;
                            case ";":
                                if ( ignore === "&" ) {
                                    ignore = null;
                                }
                                break;
                            }
                            return p1;
                        } else {
                            if ( ignore || !p2.length ) {
                                return p2;
                            } // else
                            return "<span class='popup-lov-highlight'>" + p2 + "</span>";
                        }
                    } );
                }

                // for use by open
                item$.data( "popupSearchState", searchControl );

                out.markup( "<div><div" )
                    .attr( "class", "a-PopupLOV-searchBar" + ( incrementalSearch ? " a-PopupLOV--incremental" : "" ) )
                    .markup( `><input type='text' ${A_LABEL}='${searchLabel}' maxlength='100' class='a-PopupLOV-search apex-item-text'` )
                    .attr( "value", initialSearch )
                    .markup( ">" );
                // with incremental search there is no need for a button
                if ( !incrementalSearch ) {
                    out.markup( `<button type='button' class='a-Button a-PopupLOV-doSearch' ${A_LABEL}='${searchLabel}'>` );
                }
                out.markup( "<span class='a-Icon icon-search' aria-hidden='true'></span>" );
                if ( !incrementalSearch ) {
                    out.markup( "</button>" );
                }
                out.markup( "</div>" );
                if ( options.nullDisplayValue ) {
                    out.markup( "<div class='a-PopupLOV-clear'><button class='a-PopupLOV-clearButton' type='button'>" )
                        .content( options.nullDisplayValue )
                        .markup( "</button></div>" );
                }
                out.markup( "<div class='a-PopupLOV-results'></div></div></div>" );
                /*
                 * Create the dialog content in this context. Add to dialog later.
                 */
                content$ = $( out.toString() );

                view$ = content$.find( ".a-PopupLOV-results" );

                searchBar$ = content$.find( ".a-PopupLOV-searchBar" );
                searchInput$ = searchBar$.find( ".a-PopupLOV-search" );
                searchButton$ = searchBar$.find( ".a-PopupLOV-doSearch" );
                clearButton$ = content$.find( ".a-PopupLOV-clearButton" );

                for ( const [ prop, def ] of Object.entries( options.columns ) ) {
                    // assume only one sort column
                    if ( def.sortIndex ) {
                        sortColumn = prop;
                        sortDirection = def.sortDirection;
                        break;
                    }
                }

                model = apex.model.create( modelName, {
                    shape: "table",
                    hasTotalRecords: false,
                    recordIsArray: true,
                    identityField: options.valueColumn,
                    metaField: options.columns._meta ? "_meta" : null,
                    fields: options.columns,
                    paginationType: "progressive",
                    regionId: options.itemId, // model assumes it is dealing with a region but shouldn't really care
                    fetchData: {
                        search: null,
                        sortColumn: sortColumn,
                        sortDirection: sortDirection
                    },
                    requestOptions: options.pluginTarget ? { target: options.pluginTarget } : null,
                    ajaxIdentifier: options.ajaxIdentifier,
                    pageItemsToSubmit: options.itemsToSubmit
                }, [], 0, false );

                // store the model name on the item
                item$.data( "popupLovModelName", modelName );

                displayCol = options.displayColumn || options.valueColumn; // fall back to using the value for display if there is no display column
                if ( options.display === "grid" ) {
                    options.columns[displayCol].usedAsRowHeader = true;
                    // if there is an icon column add a template to show the icon along with the display column
                    if ( options.iconColumn ) {
                        template = "<span class='" + makeSubstitution( options.iconColumn ) + "'></span> " +
                            makeSubstitution( displayCol );
                        options.columns[displayCol].cellTemplate = template;
                    }
                    gridOptions = extend( {
                        modelName: modelName,
                        columns: [options.columns],
                        columnSort: true,
                        columnSortMultiple: false, // sorting by more than one column seems like too much
                        collapsibleControlBreaks: false,
                        footer: false,
                        hasSize: true,
                        noDataMessage: noData,
                        multiple: false,
                        pagination: {
                            scroll: true,
                            loadMore: true // xxx false scroll paging broken
                        },
                        constrainNavigation: false, // let arrow navigation include search field
                        reorderColumns: false,
                        resizeColumns: true,
                        highlighter: highlightSearchTerm,
                        activateCell: function( event ) {
                            var cell$ = $( event.target ).closest( ".a-GV-cell" );

                            if ( ( event.type === "keydown" && event.which !== KEY_ENTER ) ||
                                cell$.hasClass( "a-GV-selHeader" ) || cell$.hasClass( "has-button" ) ) {
                                return;
                            }
                            save();
                        },
                        selectionChange: function( event ) {
                            // Assume not multiple selection
                            // This doesn't catch the case where click on current selection see click handler below
                            if ( event.originalEvent && event.originalEvent.type === "click" ) {
                                save();
                            }
                        },
                        sortChange: function( event, ui ) {
                            var i, col, index,
                                originalIndex = ui.column.sortIndex,
                                columns = grid$.grid( "getColumns" );

                            index = 1;
                            for ( i = 0; i < columns.length; i++ ) {
                                col = columns[i];
                                if ( col.sortIndex ) {
                                    if ( ui.action === "change" ) {
                                        if ( col === ui.column ) {
                                            index = col.sortIndex;
                                        }
                                    } else if ( ui.action === "add" ) {
                                        if ( col.sortIndex >= index ) {
                                            index = col.sortIndex + 1;
                                        }
                                    } else if ( ui.action === "remove" ) {
                                        if ( col === ui.column ) {
                                            delete col.sortIndex;
                                            delete col.sortDirection;
                                        } else if ( col.sortIndex > originalIndex ) {
                                            col.sortIndex -= 1;
                                        }
                                    } else if ( ui.action === "clear" || ui.action === "set" ) {
                                        delete col.sortIndex;
                                        delete col.sortDirection;
                                    }
                                }
                            }

                            if ( ui.action !== "clear" && ui.action !== "remove" ) {
                                ui.column.sortIndex = index;
                                ui.column.sortDirection = ui.direction;
                            }
                            grid$.grid( "refreshColumns" );
                            refresh( searchControl, null, ui.column.property, ui.direction );
                            if ( persistentState ) {
                                persistentState.sortColumn = ui.column.property;
                                persistentState.sortDirection = ui.direction;
                                saveState();
                            }
                        },
                        columnResize: function( event, ui ) {
                            if ( persistentState ) {
                                persistentState.columnWidths[ui.column.property] = parseInt( ui.width, 10 );
                                saveState();
                            }
                        }
                    }, options.defaultGridOptions );

                    grid$ = view$;
                    grid$.grid( gridOptions );
                    viewInstance = grid$.data( "apex-grid" );
                    grid$.on( "click", function( event ) {
                        var row$ = $( event.target ).closest( ".a-GV-row" );
                        // if click on a row that is already selected there is no selection event so check and save if needed
                        if ( row$.hasClass( C_IS_SELECTED ) ) {
                            save();
                        }
                    } );
                } else if ( options.display === "list" ) {
                    template = options.recordTemplate;
                    if ( template ) {
                        template = template.replace("&DISPLAY.", "&" + displayCol + "." )
                            .replace( "&ICON.", "&" + options.iconColumn + "." )
                            .replace( "&RETURN.", "&" + options.valueColumn + "." );
                    } else {
                        template = "<li data-id='" + makeSubstitution( options.valueColumn ) + "'>";
                        if ( options.iconColumn ) {
                            template += "<span class='" + makeSubstitution( options.iconColumn ) + "'></span> "; // xxx acc should this have aria-hidden="true"?
                        }
                        template += makeSubstitution( displayCol ) + "</li>";
                    }

                    listOptions = extend( {
                        modelName: modelName,
                        // default before and after template is for list markup <ul>, </ul>
                        recordTemplate: template,
                        footer: false,
                        hasSize: true,
                        noDataMessage: noData,
                        highlighter: highlightSearchTerm,
                        useIconList: true,
                        constrainNavigation: false, // let arrow navigation include search field
                        iconListOptions: {
                            navigation: true,
                            multiple: false,
                            activate: function( event ) {
                                save();
                                event.preventDefault();
                            }
                        },
                        pagination: {
                            scroll: true,
                            loadMore: true // xxx false
                        }
                    }, options.defaultIconListOptions );

                    view$.tableModelView( listOptions );
                    viewInstance = view$.data( "apex-tableModelView" );
                } else {
                    throw new Error( "Invalid display value" );
                }

                dialog$.append( content$.children() );

                if ( options.minSearchChars > 0 ) {
                    filterRequiredNoData = lang.formatMessage( "APEX.POPUP_LOV.FILTER_REQ", options.minSearchChars );
                }
                if ( !filterRequiredNoData && options.initialFetch === "none" ) {
                    filterRequiredNoData = lang.getMessage( "APEX.POPUP_LOV.INITIAL_FILTER_REQ" );
                }

                if ( incrementalSearch ) {
                    debounceSearch = util.debounce( function() {
                        refresh( searchControl, searchInput$.val() );
                    }, 400 );
                }

                view$.keydown( function( event ) {
                    var kc = event.which;

                    if ( event.isDefaultPrevented() ) {
                        return;
                    }
                    if ( kc === KEY_DOWN ) {
                        // wrap around to the search field
                        topJQuery( searchInput$ ).trigger( "focus" );
                    } else if ( kc === KEY_UP ) {
                        // move back up to the clear button or search field if present.
                        if ( clearButton$[0] ) {
                            clearButton$.add( searchInput$ ).last().trigger( "focus" );
                        } else {
                            topJQuery( searchInput$ ).trigger( "focus" );
                            event.preventDefault();
                        }
                    }
                } ).focusin( function() {
                    var sel = viewInstance.getSelection();
                    if ( sel.length === 0 ) {
                        // use ownerDocument because document may not be the right document
                        sel = $( view$[0].ownerDocument.activeElement ).closest( ".a-IconList-item,.a-GV-row" );
                        if ( sel[0] ) {
                            viewInstance.setSelection( sel );
                        }
                    }
                } );

                searchInput$.keydown( function( event ) {
                    var rec,
                        kc = event.which;

                    if ( kc === KEY_DOWN ) {
                        if ( clearButton$[0] ) {
                            clearButton$.trigger( "focus" );
                        } else {
                            viewInstance.focus();
                        }
                        event.preventDefault();
                    } else if ( kc === KEY_UP ) {
                        viewInstance.focus();
                        event.preventDefault();
                    } else if ( kc === KEY_TAB && incrementalSearch ) {
                        if ( model.getTotalRecords() === 1 ) {
                            // make sure something is selected
                            if ( grid$ ) {
                                grid$.grid( "setSelection", grid$.find( ".a-GV-cell" ).eq( 0 ) );
                            } else {
                                viewInstance.focus();
                            }
                            save();
                            event.preventDefault();
                            event.stopPropagation();
                        }
                    } else if ( kc === KEY_ENTER ) {
                        // prevent the browser default to submit the page when this is the only text item on the page
                        event.preventDefault();
                        if ( incrementalSearch && options.enterable && isPopup && searchInput$.val() ) {
                            // Special case when enter pressed in search input and doing incremental search and inline
                            // popup under and the field is enterable/no display then the value entered is the value to be selected.
                            // This makes it easier to enter things not in the list while searching to see if maybe they are.
                            // save searchInput not a selected item/record
                            result = {
                                v: searchInput$.val()
                            };
                            dialog$[widget]( "close" );
                        } else if ( incrementalSearch && !options.enterable && model.getTotalRecords() === 1 ) {
                            // special case to make it easier to select the one and only result found
                            rec = null;
                            model.forEach( function(r) { rec = r; } );
                            if ( rec ) {
                                viewInstance.setSelectedRecords([rec]);
                                save();
                            }
                        } else {
                            refresh( searchControl, searchInput$.val() );
                        }
                    } else if ( incrementalSearch ) {
                        debounceSearch();
                    }
                } );
                searchButton$.on( "click", function() {
                    refresh( searchControl, searchInput$.val() );
                } );
                clearButton$.on( "click", function() {
                    saveNullValue();
                } ).keydown( function( event ) {
                    var kc = event.which;
                    if ( kc === KEY_DOWN ) {
                        viewInstance.focus();
                        event.preventDefault();
                    } else if ( kc === KEY_UP ) {
                        topJQuery( searchInput$ ).trigger( "focus" );
                        event.preventDefault();
                    }
                } );

                // The Popup LOV dialog widget manages its own keyboard interactions, and we want screen reader
                // users to always benefit from this same keyboard support, so make the dialog$ content element a landmark
                // application role to allow these keystrokes through
                dialog$.attr( "role", "application" );

            },
            open: function( event ) {
                var width, height, ww, wh,
                    searchControl = item$.data( "popupSearchState" ),
                    search = searchControl.searchText || "",
                    dialog$ = topJQuery( event.target ),
                    widget = dialog$.is( ":data(apexPopup)" ) ? "popup" : "dialog";

                if ( !options.width ) {
                    width = item$.closest( ".apex-item-group--popup-lov" ).width(); // dialog min width keeps this from getting too small
                }
                if ( isPopup ) {
                    // A dialog is responsive at least in UT and that will adjust its size for small screens
                    // but a popup is not so make sure it isn't bigger than the window
                    ww = $( window ).width() - 10;
                    wh = $( window ).height() - 10;
                    if ( ( options.width || width ) > ww ) {
                        width = ww;
                    }
                    if ( options.height > wh ) {
                        height = wh;
                    }
                    // todo think if too big may just want to center
                }
                if ( width ) {
                    dialog$[widget]( "option", "width", width );
                }
                if ( height ) {
                    dialog$[widget]( "option", "height", height );
                }
                resize( event.target );

                result = null;
                if ( search || searchControl.forceRefresh ) {
                    searchInput$.val( search );
                    refresh( searchControl, search );
                }

                // dialog widget has logic to set the focus on open which works very well except for Firefox when
                // opened from an APEX modal dialog page. So set the focus here to be sure.
                searchInput$.trigger( "focus" );
            },
            resize: function( event ) {
                resize( event.target );
            },
            resizeStop: function( event, ui ) {
                // popup should never resize but double check just in case because don't want to ever persist the size
                if ( persistentState && !isPopup ) {
                    persistentState.height = ui.size.height;
                    persistentState.width = ui.size.width;
                    saveState();
                }
            }
        };
        [ "draggable", "resizable", "width", "height", "minWidth", "minHeight", "maxWidth", "maxHeight", "noOverlay" ].forEach( function( prop ) {
            if ( options[prop] !== undefined ) {
                dialogOptions[prop] = options[prop];
            }
        } );
        apex.message.showDialog( messageContent, dialogOptions );
    };

    /**
     * helper function: Sort the chart data, to ensure the order of the series items matches the groups array
     * @param pItems
     * @param pOrder
     * @ignore
     */
    var chartSortArray = function( pItems, pOrder ) {
        pItems.sort( function( a, b ) {
            if ( a.name < b.name ) {
                return -1;
            } else if ( a.name > b.name ) {
                return 1;
            }
            return 0;
        });

        if ( pOrder === 'label-desc' ) {
            pItems.reverse();
        }
    }; // chartSortArray

    widgetUtil.chartSortArray = chartSortArray;

    /**
     * helper function: Fill gaps for missing data points, to ensure each group has an associated data point in each series
     * @ignore
     */
    widgetUtil.chartFillGaps = function( pGroups, pItems, pOrder, pConnect ) {
        chartSortArray( pItems, pOrder );

        for ( var groupIdx = 0; groupIdx < pGroups.length; groupIdx++ ) {
            // Each group entry must have a corresponding entry in the items array, required by JET
            if ( !pItems[ groupIdx ] || pItems[ groupIdx ].name !== pGroups[ groupIdx ].name ) {
                // Add a new entry for a missing data point
                // The setting of value depends on user's 'Connect Null Data Points' setting.
                // A value of 0 will result in a continuous line; a value of null will result in a broken line
                //items.splice( groupIdx, 0, pConnect ? { name: groups[ groupIdx ].name, value: 0 } : { name: groups[ groupIdx ].name, value: null } );
                pItems.splice( groupIdx, 0, { name: pGroups[ groupIdx ].name, value:  pConnect ? 0 : null } );
            } else if ( pItems[ groupIdx ].id !== groupIdx ) {
                // Correct the id if we have added new data points
                pItems[ groupIdx ].id = groupIdx;
            }
        }
    };  // chartFillGaps

    /**
     * Utility function to enable any icons descendant of $pContainer
     * If passing pClickHandler to rebind the icon's click handler, the
     * $pContainer must be the same as the element you wish to bind the
     * handler to (eg the icon's wrapping anchor).
     *
     * @param {jQuery}   $pContainer
     * @param {String}   pHref
     * @param {Function} [pClickHandler]
     *
     * @ignore
     * @memberOf apex.widget.util
     **/
    widgetUtil.enableIcon = function( $pContainer, pHref, pClickHandler ) {
        $pContainer
            .find( "img" )           // locate any images descendant of $pContainer
            .css({ "opacity" : 1,
                "cursor"  : "" }) // set their opacity and remove cursor
            .parent( "a" )           // go to parent, which should be an anchor
            .attr( "href", pHref );  // add the href
        // check if pClickHandler is passed, if so, bind it
        if ( pClickHandler ) {
            $pContainer.on( "click", pClickHandler ); // rebind the click handler
        }
    }; // enableIcon

    /**
     * Utility function to disable any icons descendant of $pContainer
     *
     * @param {jQuery} $pContainer
     *
     * @ignore
     * @memberOf apex.widget.util
     **/
    widgetUtil.disableIcon = function( $pContainer ) {
        $pContainer
            .find( "img" )
            .css({ "opacity" : 0.5,
                "cursor"  : "default" })
            .parent( "a" )
            .removeAttr( "href" )
            .off( "click" );
    }; // disableIcon

    /**
     * Gets the index of the first occurrence of the search term in a string, return -1 if searchTerm not found.
     * Accepts comparisons modificators.
     *
     * For internal use only
     * @ignore
     *
     * @param {string} baseString The string where the searchTerm will be searched
     * @param {string} searchTerm A substring to search for in the baseString
     * @param {string} matchType Indicates the comparison method to use, possible values contains, start-with
     * @param {boolean} caseSensitive Indicates if the search is case sensitive
     * @return {number} The index of the first occurrence found.
     */
    widgetUtil.indexOfMatch = function ( baseString, searchTerm, matchType, caseSensitive ) {
        let index = -1, lBaseString, lSearchTerm;

        if ( !caseSensitive ) {
            lBaseString = baseString.toLowerCase();
            lSearchTerm = searchTerm.toLowerCase();
        } else {
            lBaseString = baseString;
            lSearchTerm = searchTerm;
        }

        if ( matchType === stringMatchTypes.START_WITH ) {
            index = lBaseString.startsWith( lSearchTerm ) ? 0 : -1;
        } else if ( matchType === stringMatchTypes.CONTAINS ) {
            index = lBaseString.indexOf( lSearchTerm );
        }

        return index;
    };

    /**
     * Search on the base string the search term and highlight it if found, it has a side effect of escaping the HTML.
     * Accepts comparisons modificators.
     *
     * For internal use only
     * @ignore
     *
     * @param {string} baseString The string where the searchTerm will be searched and highlighted
     * @param {string} searchTerm A substring to search for in the baseString
     * @param {string} matchType Indicates the comparison method to use, possible values contains, start-with
     * @param {boolean} caseSensitive Indicates if the search is case sensitive
     * @param {string} textHighlightingCls The class use for the function to highlight the text
     * @return {string} Return the base string with the search term highlighted on it, null if search term not found
     */
    widgetUtil.highlightSearchTerm = function( baseString, searchTerm, matchType, caseSensitive, textHighlightingCls ) {
        let highlightedString;
        const matchStart = widgetUtil.indexOfMatch( baseString, searchTerm, matchType, caseSensitive );

        if ( searchTerm && matchStart > -1 ) {
            const matchEnd = matchStart + searchTerm.length - 1,
                beforeMatch = baseString.slice( 0, matchStart ),
                matchedText = baseString.slice( matchStart, matchEnd + 1  ),
                afterMatch = baseString.slice( matchEnd + 1 );

            highlightedString = `${util.escapeHTML( beforeMatch )}<span class='${textHighlightingCls}'>${util.escapeHTML( matchedText )}</span>${util.escapeHTML( afterMatch )}`;
        }

        return highlightedString;
    };

    /*
     * Common functionality for widgets to check if the become visible or hidden
     */
    const visibleCheckList = [];

    function findInVisibleCheckList( element ) {
        for ( let i = 0; i < visibleCheckList.length; i++ ) {
            if ( visibleCheckList[i].el === element ) {
                return i;
            }
        }
        return null;
    }

    /**
     * todo
     * @param pElement
     * @param pCallback
     */
    widgetUtil.onVisibilityChange = function( pElement, pCallback ) {
        const index = findInVisibleCheckList( pElement ),
            c = {
                el: pElement,
                    cb: pCallback
            };

        if ( index !== null ) {
            visibleCheckList[index] = c;
        } else {
            visibleCheckList.push( c );
        }
    };

    /**
     * todo
     * @param pElement
     */
    widgetUtil.offVisibilityChange = function( pElement ) {
        const index = findInVisibleCheckList( pElement );

        if ( index !== null ) {
            visibleCheckList.splice( index, 1 );
        }
    };

    // todo think: It is confusing that pElement is type jQuery for isVisible and whenBecomesVisible but
    //   of type Element for the other visibility related functions.

    /**
     * Determines whether or not the element specified is visible.
     * Checks both that the element is directly visible and that it's on the active tab if it is within a tab region.
     * @param {jQuery} pElement
     * @return {boolean}
     * @memberOf apex.widget.util
     * @ignore
     */
    widgetUtil.isVisible = function( pElement ) {
        let tabRegion$,
            activeTab$,
            isVisible = pElement.is(':visible'),
            isInTab   = pElement.closest( "div.apex-tabs-region" ).length > 0;

        // separate test for APEX tabs needed, because of timing issues
        if ( isInTab ) {
            tabRegion$ = apex.region( pElement.closest( "div.apex-tabs-region" ).attr( "id" ) ).widget();

            if ( tabRegion$ ) {
                activeTab$ = tabRegion$.aTabs( "getActive" ).el$;
                if ( pElement.parents( "#" + activeTab$.attr( "id" ) ).length === 0 ) {
                    isVisible = false;
                }
            }
        }
        return isVisible;
    };

    /**
     * Execute a supplied callback function as soon as the specified element becomes visible.
     * If the element is visible at page load then the callback will be executed immediately.
     * Otherwise it will be executed when the element becomes visible, for example; when its containing tab is activated.
     * This is similar to the onVisibilityChange functionality except that it will only fire when an element becomes visible
     * (not when a visible element is hidden) and will only fire once, the first time an element becomes visible.
     * It is only useful for components that do not manage their size and can be initialized or refreshed while hidden.
     * The callback is passed the jQuery object which was originally supplied to this function.
     * @param {jQuery} pElement
     * @param {Function} pCallback
     * @memberOf apex.widget.util
     * @ignore
     */
    widgetUtil.whenBecomesVisible = function ( pElement, pCallback ) {

        setTimeout( function () {
            if ( !widgetUtil.isVisible( pElement ) ) {
                widgetUtil.onVisibilityChange( pElement[ 0 ], function ( show ) {
                    if ( show ) {
                        pCallback( pElement );
                        widgetUtil.offVisibilityChange( pElement[ 0 ] );
                    }
                });
            } else {
                pCallback( pElement );
            }
        }, 0 );
    };

    /**
     * todo
     * @param pElement
     * @param pShow
     * @memberOf apex.widget.util
     */
    const visibilityChange = widgetUtil.visibilityChange = function( pElement, pShow ) {
        const parent$ = $( pElement ),
            // Copy array because whenBecomesVisible (and possibly other callbacks) can modify the list
            // during the loop causing some notifications to be skipped (or duplicated). (bug 35215238);
            list = visibleCheckList.slice( 0 );

        pShow = !!pShow; // force true/false
        for ( let i = 0; i < list.length; i++ ) {
            const c = list[i],
                check$ = $( c.el );

            // todo can get false results because :visible may be true even if not visible because of a hidden ancestor.
            if ( pShow === check$.is( SEL_VISIBLE ) && check$.closest(parent$ ).length ) {
                c.cb( pShow );
            }
        }
    };

    // setup handler for DA Show/Hide
    $( document ).on( "apexaftershow", function( e ) {
        visibilityChange( e.target, true );
    }).on( "apexafterhide", function( e ) {
        visibilityChange( e.target, false );
    } );

    const DATA_RESIZE_SENSOR = "apex-resize-sensor";

    /**
     * Register a callback for when a DOM element's dimensions change. The element must allow element content.
     *
     * @param {Element|String} pElement DOM element or string ID of a DOM element to detect size changes on.
     * @param {Function} pResizeCallback no argument function to call when the size of the element changes
     */
    widgetUtil.onElementResize = function( pElement, pResizeCallback ) {
        var el$, tracker;
        if ( typeof pElement === "string" ) {
            pElement = "#" + pElement;
        }
        el$ = $( pElement ).first();
        tracker = el$.data( DATA_RESIZE_SENSOR );
        if ( !tracker ) {
            tracker = new ResizeTracker( el$[0] );
            el$.data( DATA_RESIZE_SENSOR, tracker );
            tracker.start();
        }
        tracker.addListener( pResizeCallback );

    /*
         DON'T use ResizeSensor for now
            var rs, el$;

            if ( typeof pElement === "string" ) {
                pElement = "#" + pElement;
            }
            el$ = $( pElement ).first();
            if ( el$.length ) {
                rs = new ResizeSensor( el$[0], pResizeCallback );
                el$.data( DATA_RESIZE_SENSOR, rs);
            }
     */
    };

    /**
     * Remove the callback registered with onElementResize for the given element.
     *
     * @param {Element|String} pElement DOM element or string ID of a DOM element to detect size changes on.
     * @param {Function} pResizeCallback no argument function to call when the size of the element changes
     */
    widgetUtil.offElementResize = function( pElement, pResizeCallback ) {
        var el$, tracker;
        if ( typeof pElement === "string" ) {
            pElement = "#" + pElement;
        }
        el$ = $( pElement ).first();
        tracker = el$.data( DATA_RESIZE_SENSOR );
        if ( tracker ) {
            if ( pResizeCallback ) {
                tracker.removeListener( pResizeCallback );
                if ( tracker.isEmpty() ) {
                    tracker.stop();
                    el$.removeData( DATA_RESIZE_SENSOR );
                }
            } else {
                tracker.destroy();
                el$.removeData( DATA_RESIZE_SENSOR );
            }
        }
    /*
     DON'T use ResizeSensor for now
        var rs, el$;

        if ( typeof pElement === "string" ) {
            pElement = "#" + pElement;
        }
        el$ = $( pElement ).first();
        rs = el$.data( DATA_RESIZE_SENSOR );
        rs.detach();
        el$.removeData( DATA_RESIZE_SENSOR );
    */
    };

    /**
     * Updates any resize sensors added when onElementResize is used. Call this function
     * when an element containing a resize sensor has been made visible or is connected to the DOM.
     *
     * @param {!Element} pElement DOM element or string ID of a DOM element that has become visible and may contain
     *                            resize sensors.
     */
    widgetUtil.updateResizeSensors = function( pElement ) {
        if ( typeof pElement === "string" ) {
            pElement = "#" + pElement;
        }
        $( pElement ).find( ".js-resize-sensor" ).parent().each( function( i, el ) {
            var tracker = $( el ).data( DATA_RESIZE_SENSOR );
            if ( tracker != null ) {
                tracker.init( true );
            }
        }
        );
    };

    /*
     * This JET code doesn't follow all the same lint rules APEX does so turn them off
     * Keep this at the end of the file or turn the rules back on after
     */
    /* eslint-disable no-plusplus, eqeqeq */

    /**
     * @preserve Oracle JET TouchProxy, ResizeTracker
     * Copyright (c) 2014, 2018, Oracle and/or its affiliates.
     * The Universal Permissive License (UPL), Version 1.0
     */
    // TODO would like to use these things directly from JET library but the global symbols are compiled away
    /*
     * Temp? replacement for ResizeSensor library
     * extracted from JET
     * Utility class for tracking resize events for a given element and dispatching them to listeners
     * Updated with changes from JET 4.2.0 but not including code for _collapsingManagers, _collapsingListeners.
     */
    var ResizeTracker = function(div) {
        var _listeners = $.Callbacks(),
            _RETRY_MAX_COUNT = 2,
            _retrySetScroll = 0,
            _invokeId = null,
            _oldWidth  = null,
            _oldHeight = null,
            _detectExpansion = null,
            _detectContraction = null,
            _resizeListener = null,
            _scrollListener = null;

        this.addListener = function(listener) {
            _listeners.add(listener);
        };

        this.removeListener = function(listener) {
            _listeners.remove(listener);
        };

        this.isEmpty = function() {
            return !_listeners.has();
        };

        this.destroy = function() {
            _listeners.empty();
            this.stop();
        };

        this.start = function() {

            function setStyles( s1, s2 ) {
                s1.direction = "ltr";
                s1.position = s2.position = "absolute";
                s1.left = s1.top = s1.right = s1.bottom = "0";
                s1.overflow = "hidden";
                s1.zIndex = "-1";
                s1.visibility = "hidden";
                s2.left = s2.top = "0";
                s2.transition = "0s";
            }

            _scrollListener = _handleScroll.bind(this);

            // : Use native onresize support on teh DIV in IE9/10 and  since no scroll events are fired on the
            // contraction/expansion DIVs in IE9
            if (div.attachEvent) {
                _resizeListener = _handleResize.bind(this);
                div.attachEvent('onresize', _resizeListener);
            } else {
                var firstChild = div.childNodes[0];

                // This child DIV will track expansion events. It is meant to be 1px taller and wider than the DIV
                // whose resize events we are tracking. After we set its scrollTop and scrollLeft to 1, any increate in size
                // will fire a scroll event
                _detectExpansion = document.createElement("div");
                // don't want css dependencies but need to find later
                _detectExpansion.className = "js-resize-sensor";

                var expansionChild = document.createElement("div");
                setStyles( _detectExpansion.style, expansionChild.style );
                _detectExpansion.appendChild(expansionChild);
                if ( firstChild ) {
                    div.insertBefore(_detectExpansion, firstChild);
                } else {
                    div.appendChild(_detectExpansion);
                }

                _detectExpansion.addEventListener("scroll", _scrollListener, false);

                // This child DIV will track contraction events. Its height and width are set to 200%. After we set its scrollTop and
                // scrollLeft to the current height and width of its parent, any decrease in size will fire a scroll event
                _detectContraction = document.createElement("div");
                // don't want css dependencies: _detectContraction.className = "oj-helper-detect-contraction";

                var contractionChild = document.createElement("div");
                setStyles( _detectContraction.style, contractionChild.style );
                contractionChild.style.width = "200%";
                contractionChild.style.height = "200%";
                _detectContraction.appendChild(contractionChild);
                div.insertBefore(_detectContraction, _detectExpansion);

                _detectContraction.addEventListener("scroll", _scrollListener, false);

                this.init(false);
            }
        };

        this.stop = function() {
            if (_invokeId !== null) {
                util.cancelInvokeAfterPaint(_invokeId);
                _invokeId = null;
            }
            if (_detectExpansion !== null) {
                _detectExpansion.removeEventListener("scroll", _scrollListener);
                _detectContraction.removeEventListener("scroll", _scrollListener);
                // Check before removing to prevent CustomElement polyfill from throwing
                // a NotFoundError when removeChild is called with an element not in the DOM
                if (_detectExpansion.parentNode) {
                    div.removeChild( _detectExpansion );
                }
                if (_detectContraction.parentNode) {
                    div.removeChild( _detectContraction );
                }
            } else {
                // assume IE9/10
                div.detachEvent('onresize', _resizeListener);
            }
        };

        this.init = function(isFixup) {
            var adjusted = _checkSize(isFixup);
            if (isFixup && !adjusted && _detectExpansion.offsetParent != null) {
                _adjust(_oldWidth, _oldHeight);
            }
        };

        function _checkSize(fireEvent) {
            var adjusted = false;
            if (_detectExpansion.offsetParent != null) {
                var newWidth = _detectExpansion.offsetWidth;
                var newHeight = _detectExpansion.offsetHeight;

                if (_oldWidth !== newWidth || _oldHeight !== newHeight) {
                    _retrySetScroll = _RETRY_MAX_COUNT;
                    _adjust(newWidth, newHeight);
                    adjusted = true;

                    if (fireEvent) {
                        _notifyListeners(true);
                    }
                }
            }

            return adjusted;
        }

        function _notifyListeners(useAfterPaint) {
            var newWidth = div.offsetWidth;
            var newHeight = div.offsetHeight;
            if (_listeners.has()) {
                if (!useAfterPaint) {
                    _listeners.fire(newWidth, newHeight);
                } else {
                    if (_invokeId !== null) {
                        util.cancelInvokeAfterPaint(_invokeId);
                    }

                    _invokeId = util.invokeAfterPaint(
                        function() {
                            _invokeId = null;
                            _listeners.fire(newWidth, newHeight);
                        }
                    );
                }
            }
        }

        function _handleScroll(evt) {
            evt.stopPropagation();
            if (!_checkSize(true)) {
                // Workaround for the WebKit issue where scrollLeft gets reset to 0 without the DIV being expanded
                // We will retry to the set the scrollTop only twice to avoid infinite loops
                if (_retrySetScroll > 0 && _detectExpansion.offsetParent != null &&
                    (_detectExpansion.scrollLeft == 0 || _detectExpansion.scrollTop == 0)) {
                    _retrySetScroll--;
                    _adjust(_oldWidth, _oldHeight);
                }
            }
        }

        function _handleResize() {
            _notifyListeners(false);
        }

        function _adjust(width, height) {
            _oldWidth = width;
            _oldHeight = height;

            var expansionChildStyle = _detectExpansion.firstChild.style;

            var delta = 1;

            // The following loop is a workaround for the WebKit issue with zoom < 100% -
            // the scrollTop/Left gets reset to 0 because it gets computed to a value less than 1px.
            // We will try up to the delta of 5 to support scaling down to 20% of the original size
            do {
                expansionChildStyle.width = width + delta + 'px';
                expansionChildStyle.height = height + delta + 'px';
                _detectExpansion.scrollLeft = _detectExpansion.scrollTop = delta;
                delta++;
            } while ((_detectExpansion.scrollTop == 0 || _detectExpansion.scrollLeft == 0) && delta <= 5);


            _detectContraction.scrollLeft = width;
            _detectContraction.scrollTop = height;
        }
    };

    /**
     * @preserve jQuery UI Touch Punch 0.2.3
     *
     * Copyright 2011-2014, Dave Furfero
     * Dual licensed under the MIT or GPL Version 2 licenses.
     */

    /**
     * Utility class for proxying touch events for a given element and mapping them to mouse events
     * @constructor
     * @ignore
     * @private
     */
    widgetUtil.TouchProxy = function(elem) {
        this._init(elem);
    };

    /**
     * Initializes the TouchProxy instance
     *
     * @param {Object} elem
     * @private
     */
    widgetUtil.TouchProxy.prototype._init = function(elem) {
        this._elem = elem;

        this._touchHandled = false;
        this._touchMoved = false;

        //add touchListeners
        this._touchStartHandler = $.proxy(this._touchStart, this);
        this._touchEndHandler = $.proxy(this._touchEnd, this);
        this._touchMoveHandler = $.proxy(this._touchMove, this);

        if( this._elem[0] ) {
            this._elem[0].addEventListener( "touchstart", this._touchStartHandler, { passive: false } );
            this._elem[0].addEventListener( "touchend", this._touchEndHandler, { passive: false } );
            this._elem[0].addEventListener( "touchmove", this._touchMoveHandler, { passive: false } );
            this._elem[0].addEventListener( "touchcancel", this._touchEndHandler, { passive: false } );
        }
    };

    widgetUtil.TouchProxy.prototype._destroy = function() {
        if (this._elem && this._touchStartHandler) {

            this._elem[0].removeEventListener( "touchstart", this._touchStartHandler );
            this._elem[0].removeEventListener( "touchend", this._touchEndHandler );
            this._elem[0].removeEventListener( "touchmove", this._touchMoveHandler );
            this._elem[0].removeEventListener( "touchcancel", this._touchEndHandler );

            this._touchStartHandler = undefined;
            this._touchEndHandler = undefined;
            this._touchMoveHandler = undefined;
        }
    };

    /**
     * Simulate a mouse event based on a corresponding touch event
     * @param {Object} event A touch event
     * @param {string} simulatedType The corresponding mouse event
     *
     * @private
     */
    widgetUtil.TouchProxy.prototype._touchHandler = function(event, simulatedType) {
        // Ignore multi-touch events
        if (event.originalEvent.touches.length > 1) {
            return;
        }

        // - contextmenu issues: presshold should launch the contextmenu on touch devices
        if (event.type != "touchstart" && event.type != "touchend") {
            event.preventDefault();
        }

        var touch = event.originalEvent.changedTouches[0],
            simulatedEvent = document.createEvent("MouseEvent");

        // Initialize the simulated mouse event using the touch event's coordinates
        // initMouseEvent(type, canBubble, cancelable, view, clickCount,
        //                screenX, screenY, clientX, clientY, ctrlKey,
        //                altKey, shiftKey, metaKey, button, relatedTarget);
        simulatedEvent.initMouseEvent(simulatedType, true, true, window, 1,
            touch.screenX, touch.screenY,
            touch.clientX, touch.clientY, false,
            false, false, false, 0/*left*/, null);

        touch.target.dispatchEvent(simulatedEvent);
    };

    /**
     * Handle touchstart events
     * @param {Object} event The element's touchstart event
     *
     * @private
     */
    widgetUtil.TouchProxy.prototype._touchStart = function(event) {
        // Ignore the event if already being handled
        if (this._touchHandled) {
            return;
        }

        // set the touchHandled flag
        this._touchHandled = true;

        // Track movement to determine if interaction was a click
        this._touchMoved = false;

        // Simulate the mouseover, mousemove and mousedown events
        this._touchHandler(event, "mouseover");
        this._touchHandler(event, "mousemove");
        this._touchHandler(event, "mousedown");
    };

    /**
     * Handle the touchmove events
     * @param {Object} event The element's touchmove event
     *
     * @private
     */
    widgetUtil.TouchProxy.prototype._touchMove = function(event) {
        // Ignore event if not handled
        if (! this._touchHandled) {
            return;
        }

        // Interaction was not a click
        this._touchMoved = true;

        // Simulate the mousemove event
        this._touchHandler(event, "mousemove");
    };

    /**
     * Handle the touchend events
     * @param {Object} event The element's touchend event
     *
     * @private
     */
    widgetUtil.TouchProxy.prototype._touchEnd = function(event) {
        // Ignore event if not handled
        if (!this._touchHandled) {
            return;
        }

        // Simulate the mouseup and mouseout events
        this._touchHandler(event, "mouseup");
        this._touchHandler(event, "mouseout");

        // If the touch interaction did not move, it should trigger a click
        // except that the browser already creates a click and we don't want two of them
        /*
        if (!this._touchMoved && event.type == "touchend") {
            // Simulate the click event
            this._touchHandler(event, "click");
        } */

        // Unset the flag
        this._touchHandled = false;
    };

    widgetUtil.TouchProxy._TOUCH_PROXY_KEY = "apexTouchProxy";

    widgetUtil.TouchProxy.prototype.touchMoved = function() {
        return this._touchMoved;
    };

    /**
     * Adds touch event listeners
     * @param {Object} elem
     * @ignore
     */
    widgetUtil.TouchProxy.addTouchListeners = function(elem) {
        var jelem = $(elem),
            proxy = jelem.data(widgetUtil.TouchProxy._TOUCH_PROXY_KEY);

        if (!proxy) {
            proxy = new widgetUtil.TouchProxy(jelem);
            jelem.data(widgetUtil.TouchProxy._TOUCH_PROXY_KEY, proxy);
        }

        return proxy;
    };

    /**
     * Removes touch event listeners
     * @param {Object} elem
     * @ignore
     */
    widgetUtil.TouchProxy.removeTouchListeners = function(elem) {
        var jelem = $(elem),
            proxy = jelem.data(widgetUtil.TouchProxy._TOUCH_PROXY_KEY);

        if (proxy) {
            proxy._destroy();
            jelem.removeData(widgetUtil.TouchProxy._TOUCH_PROXY_KEY);
        }
    };

})( apex.widget.util, apex.util, apex.lang, apex.navigation, apex.jQuery );
