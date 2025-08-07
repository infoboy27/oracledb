/*
 * Copyright (c) 2012, 2024, Oracle and/or its affiliates.
 */
/*global $s_Split*/
/**
 * <p>The apex.widget namespace stores all the general purpose widget related functions of Oracle APEX.</p>
 *
 * @namespace
 */
apex.widget = ( function( debug, $, util ) {
    "use strict";

    const TRUE = "true",
        FALSE = "false";

    function cap( str ) {
        return str.replace(/^[a-z]/, function( c ) { return c.toUpperCase(); } );
    }

    function getAttr( element, key ) {
        let data;

        element = element.jquery ? element[0] : element;

        if ( element && element.getAttribute ) {
            data = element.getAttribute( "data-" + key );
        }

        try {
            data = data === TRUE ? true :
                data === FALSE ? false :
                    data === "null" ? null :
                        // Only convert to a number if it doesn't change the string
                        +data + "" === data ? +data :
                            RBRACE.test( data ) ? JSON.parse( data ) :
                                data;
        } catch ( err ) { // eslint-ignore-line no-empty
        }

        return data;
    }

    const RBRACE = /(?:{[\s\S]*}|\[[\s\S]*])$/;

    const rcapitals = /[A-Z]/g,
        replaceFunction = function( c ) {
            return "-" + c.toLowerCase();
        };

    // --- Begin selection support
    /*
     * Future considerations
     * - support page up/down keys; will need to know the page size
     * - 2D nav
     * - Tap events
     */
    const SEL_SELECTOR = ".u-selector",
        C_FOCUSED = "is-focused",
        C_SELECTED = "is-selected",
        SEL_SELECTED = "." + C_SELECTED,
        ARIA_SELECTED = "aria-selected",
        ARIA_CHECKED = "aria-checked",
        ARIA_DISABLED = "aria-disabled",
        ARIA_MULTI = "aria-multiselectable",
        SEL_DISABLED = ".is-disabled",
        C_RTL = "u-RTL",
        SEL_VISIBLE = ":visible",
        C_JS_TABBABLE = "js-tabbable",
        SEL_JS_TABBABLE = "." + C_JS_TABBABLE,
        SEL_TABBABLE = ":tabbable",
        ATTR_TABINDEX = "tabindex",
        ATTR_ROLE = "role",
        SEL_INPUT = "input";

    const FOCUS = "focus",
        EVENT_SEL_NAMESPACE = ".selection";

    // many of the following are also used in model selection support, keep in sync
    const SEL_ACTION_SET = "set",
        SEL_ACTION_UNSET= "unset", // todo grid uses it for collapse control break but there are probably other uses as well
        SEL_ACTION_TOGGLE = "toggle",
        SEL_ACTION_RANGE = "range",
        SEL_ACTION_ADD = "add",
        SEl_ACTION_NONE = "none",
        SEL_ACTION_ALL = "all",
        SEL_ACTION_ANCHOR = "anchor";

    const KEY_DOWN = 40,
        KEY_END = 35,
//      KEY_ENTER = 13, for future use
//      KEY_ESCAPE = 27,
        KEY_HOME = 36,
        KEY_LEFT = 37,
//      KEY_PAGE_DOWN = 34,
//      KEY_PAGE_UP = 33,
        KEY_RIGHT = 39,
        KEY_SPACE = 32,
        KEY_UP = 38,
        KEY_F10 = 121,
        isMac = navigator.appVersion.includes( "Mac" );

    const nav_modes = {
        NAV_NONE: "none",
        NAV_FOCUS: "focus",
        NAV_SELECT: "select"
    };
    const { NAV_NONE,
        NAV_FOCUS,
        NAV_SELECT } = nav_modes;

    const toInteger = ( numStr )  => {
        return parseInt( numStr, 10 );
    };

    // todo consider if any of these need to be configured. They are currently a firm requirement
    //    of TMV used for many things
    const DATA_ID = "data-id",
        DATA_ROWNUM = "data-rownum",
        C_GRID_SCROLL_FILLER = "js-ScrollFiller",
        SEL_LOAD_MORE = ".js-load";

    /*
     * todo doc this item selection data transfer format writer interface when option dataTransferFormats is documented
     */
    const textFormatWriterPrototype = {
        begin: function( /* container$, selection$, model, selection */ ) {
            // don't care about container etc.
            this.text = "";
        },
        item: function( index, item$ /*, record, recordId */ ) {
            if ( index > 0 ) {
                this.text += "\r\n";
            }
            this.text += item$[0].innerText.replaceAll( /\s+/g, " " ).trim(); // normalize white space
        },
        end: function() {
        },
        toString: function() {
            return this.text;
        }
    };
    const htmlFormatWriterPrototype = {
        begin: function( container$, selection$ /*, model, selection */ ) {
            // if user copies a single item they probably want just the text not a collection
            if ( selection$.length === 1 ) {
                this.text = "";
            } else {
                // assume list
                this.text = "<ul>";
                this.collectionClose = "</ul>";
                this.itemNode = "li";
            }
        },
        item: function( index, item$ /*, record, recordId */ ) {
            // let the first item override the container markup as a special case just for a TR item$
            if ( index === 0 && item$[0].nodeName.toUpperCase() === "TR" ) {
                this.text = "<table><tbody>";
                this.collectionClose = "</tbody></table>";
                this.itemNode = "tr";
            }
            if ( this.itemNode ) {
                this.text += `\r\n<${this.itemNode}>`;
            }
            this.text += item$[0].innerHTML;
            if ( this.itemNode ) {
                this.text += `</${this.itemNode}>`;
            }
        },
        end: function() {
            if ( this.collectionClose ) {
                this.text += this.collectionClose;
            }
        },
        toString: function() {
            return this.text;
        }
    };

    /*
      TODO
        consider other things that can't be selected
        allowSelectHidden
        consider select all in group with selector control in group heading
     */

    /**
     * Implements selection, focus management, and keyboard navigation for any report with semi-flat
     * list view semantics.
     * Terms:
     * - Report: is a collection or list of items.
     * - Item: corresponds to a record in the report result set. Also known as a record, card, row etc.
     * - Group: a visual, labeled set of items that go together. Membership in the group is typically
     *   determined by one or more specific report record columns having the same value and sorting puts
     *   the items in the group next to each other.
     *
     * This class is designed to work with any kind of report control/widget. The control instantiates
     * an instance of this class and delegates selection handling to it. The control supplies the options and can
     * update most of them at any time. The control must be able to implement the callbacks interface provided
     * in the constructor.
     * The parent control is responsible for:
     * - Providing a selection API; typically simple wrappers around the APIs of this class
     * - Triggering events for selection change and current item change
     * - Displaying the count of selected items
     *
     * Expected Markup:
     * Preferred for best accessibility (layout grid):
     * <div> <!-- control root given by report$ -->
     *     <!-- ... -->
     *     <ul role="grid" aria-label="Example List"> <!-- container returned by getContainer() -->
     *         <li role="row">
     *             <div class="item-selector" role="gridcell"> <!-- item given by itemSelector option -->
     *                 <!-- ... -->
     *                 <!-- an optional selector >
     *                   <span class="u-selector"></span> <!-- for single select add class u-selector--single -->
     *                   <!-- or -->
     *                   <input class="u-selector" type="checkbox"> <!-- for single select use type="radio" -->
     *                 <!-- ... -->
     *             </div>
     *         </li>
     *         <!-- ... -->
     *     </ul>
     * </div>
     * Legacy/minimal markup (non layout grid)
     * <div> <!-- control root given by report$ -->
     *     <!-- ... -->
     *     <ul> <!-- container returned by getContainer() -->
     *         <li class="item-selector"> <!-- item given by itemSelector option -->
     *             <!-- ... -->
     *             <!-- an optional selector >
     *               <span class="u-selector"></span> <!-- for single select add class u-selector--single -->
     *               <!-- or -->
     *               <input class="u-selector" type="checkbox"> <!-- for single select use type="radio" -->
     *             <!-- ... -->
     *         </li>
     *         <!-- ... -->
     *     </ul>
     * </div>
     * Note the element type is not critical. Shown above is UL and LI elements but these could be DIVs.
     *
     * Selection also supports one level of grouping of items. It can do this 2 ways. 1) An item in the collection
     * can serve as a heading providing visual context to the items after it. This is known as flat grouping.
     * 2) Two level nested markup can be used such as a list of lists or a layout grid of layout grids.
     * The first level represents the groups and the second level represents the items in each group.
     * The group element contains the item elements as descendents.
     * This is known as nested grouping. The option groupSelector indicates if items are grouped. This class
     * automatically detects if flat or nested groups are used by checking if a group element contains item elements.
     * Group items can never be selected but they can be focused. A selector control is not supported in group items.
     * Group items can have arbitrary markup including links and buttons. Keyboard navigation is treated the same
     * as for items.
     *
     * For flat grouping the only change to the minimal markup is having a way to identify that an item is
     * also a group:
     *             <div class="item-selector group-selector" role="gridcell"> <!-- item given by itemSelector and groupSelector options -->
     * or
     *         <li class="item-selector group-selector"> <!-- item given by itemSelector and groupSelector options -->
     * The group item typically contains a group heading or label for the group and is visually distinguished from items.
     *
     * For nested grouping the group element contains an element that acts as a heading for the group and a
     * container element that contains the items. The heading element must be the first child of the group element.
     * The following example is for a simple list of lists:
     * <div> <!-- control root given by report$ -->
     *     <!-- ... -->
     *     <ul> <!-- container returned by getContainer() -->
     *         <li class="group-selector"> <!-- group item given by groupSelector option -->
     *             <h4>This is the header for the group</h4>
     *             <ul> <!-- container for the items in the group -->
     *                 <li class="item-selector">
     *                     <!-- ... -->
     *                 </li>
     *             </ul>
     *             <!-- any markup here is not included in navigation or selection -->
     *         </li>
     *     </ul>
     * </div>
     * The following example is for a layout grid of layout grids:
     * <div> <!-- control root given by report$ -->
     *     <!-- ... -->
     *     <ul role="grid" aria-label="Example List"> <!-- container returned by getContainer() -->
     *         <li role="row">
     *             <div class="group-selector" role="gridcell"> <!-- group item given by groupSelector option -->
     *                 <h4>This is the header for the group X</h4>
     *                 <ul role="grid" aria-label="Items in group X">
     *                     <li role="row">
     *                         <div class="item-selector" role="gridcell"> <!-- item given by itemSelector option -->
     *                             <!-- ... -->
     *                         </div>
     *                     </li>
     *                     <!-- ... -->
     *                 </ul>
     *                 <!-- any markup here is not included in navigation or selection -->
     *             </div>
     *         </li>
     *         <!-- ... -->
     *     </ul>
     * </div>
     *
     * Additional markup requirements:
     * - If the report has a load more pagination option the button should be within the report element and
     *   have a "js-load" class to participate in keyboard navigation.
     * - data-rownum The item element should have this attribute and the value is the index of the item in the report
     *     it is used for range selection
     * - data-id The item element should have this attribute and the value is the value of the item and if the
     *     report uses a model it is also the identity of the model record
     * - If the report uses virtual scroll pagination the filler elements are children of the container
     *   (even if container has role=grid) and have class js-ScrollFiller and if needed have role=none.
     *
     * Widgets or controls that use this class may have additional markup requirements.
     *
     * Single or multiple selection follows the Windows standard selection behavior for mouse and keyboard using
     * Shift and Ctrl key modifiers which is also the same as the grid widget. The Arrow keys, Space, Home, and End keys
     * are supported.
     *
     * @ignore
     */
    class ListViewSelection {
        #cb; // callback interface to the report
        #lastFocused = null; // element that last had focus
        #allowCopy = false; // If true the selection can be copied to the clipboard using the browsers copy event.
                            // This can only be set at initialization time. Only applies if supportsSelection
        #itemsAreServerRendered = false; // this is used to distinguish the case where the model contains markup
            // rendered by the server and the normal case where the model contains data that is rendered by the client.
            // This can only be set at initialization time and only applies if supportsSelection and using a model.
            // When selection state is kept in the model it is expected when the items are rendered by the view that
            // the selection state of the model record is used to add the is-selected class to the item. However, in the
            // case of template component reports, which currently use the model but have the server do all
            // the rendering, there is no opportunity to add the is-selected class. This option tells ListViewSelection
            // that it must add the is-selected class after the items are added to the DOM.
        #report$ = null; // the report/widget element
        #selectAnchor = null; // the selection anchor used for multiple selection. Only applies if supportsSelection
            // and multiple
        #forwardKey = KEY_RIGHT; // Used for keyboard navigation. Default for LTR dir
        #backwardKey = KEY_LEFT; // Used for keyboard navigation. Default for LTR dir
        #hasSelection = false; // true if at least one item
        #selNotifyDelay = null; // a debounced selection notification function
        #selNotifyLongDelay = null; // a longer debounced selection notification function
        #savedState = null; // used to save selection, focus state around a re-rendering of the report DOM
        #itemsCache$ = null; // used internally for selection
        #selectAllControl$ = null; // optional selectAll checkbox control
        #isLayoutGrid = false; // true when container markup has role="grid". Expect children to be role="row"
        #isGroupLayoutGrid = false; // this applies to the group level. Only applies when groupSelector is given.
        #groupIsContainer = false; // true when items are nested under groups. Only applies
            // when groupSelector is given.
        #isTable = false; // true when container markup is table or tbody Expect children to be tr
        #allSelected = false; // true when all items are selected so rendering more can select them
        #excludeSelector = SEL_DISABLED; // selector for items that cannot be selected

        /**
         *
         * @param report$ the root report widget/control element jQuery object
         * @param options initialize any class option. The properties are this classes option properties
         *      and allowCopy.
         * @param callbacks
         * @param callbacks.getContainer getContainer() returns the jQuery object for the report items container
         * @param [callbacks.getModel] getModel() returns the report model. If the report doesn't use a model this
         *      should be undefined or null
         * @param callbacks.getValuesForItems getValuesForItems( items$ ) returns array of values associated with
         *      the given items, one for each item in items$
         * @param callbacks.renderItem renderItem( out, record, index, recordId, meta ) only needed when there is a
         *      model, used by copy to clipboard for model records not rendered to the DOM.
         * @param callbacks.isValid isValid() returns true if the report control/widget is still valid
         * @param callbacks.selectionChanged selectionChanged(event) called when selection changes and
         *      used to trigger an event.
         * @param callbacks.currentItemChanged currentItemChanged() called when the current item changes
         * @param callbacks.updateStatus updateStatus() called when selection changes regardless of notify flag
         * @param callbacks.getPagination getPagination() returns pagination configuration options with these
         *      Boolean properties: virtual, scroll, loadMore
         * @param [callbacks.keyboardIgnoreSelector] ignore keyboard events when the target is within
         *      elements matching the selector.
         * @param [callbacks.firstPage] firstPage() go to first page only used with scroll pagination
         * @param [callbacks.lastPage] lastPage() go to last page only used with scroll pagination
         * @param [callbacks.waitForPageChange] waitForPageChange() return a promise that is resolved when a
         *      page is next added. Only used with scroll pagination
         */
        constructor( report$, options, callbacks ) {
            this.#cb = callbacks;
            this.#report$ = report$;

            if ( options.allowCopy != null ) {
                this.#allowCopy = true; // currently this option cannot be changed after construction
            }
            this.#itemsAreServerRendered = options.itemsAreServerRendered || false;
            for ( const p of ["itemNavigationMode", "selectionFollowsFocus",
                        "multiple", "allowSelectAll", "selectAllId", "allowSelectHidden", "clipboardValue",
                        "itemSelector", "groupSelector", "constrainNavigation", "selectionStateItem",
                        "dataTransferFormats", "persistSelection"] ) {
                if ( Object.hasOwn( options, p ) && options[p] !== undefined ) {
                    this[p] = options[p];
                }
            }
            this.#updateExcludeSelector();
        }

        // Begin options
        /**
         * <p>Controls how the focus and selection state is handled for items in the report. It can be one of these
         * values:</p>
         * <ul>
         * <li><strong>none</strong> - The report does not support focus or selection.</li>
         * <li><strong>focus</strong> - The report supports focus state. Focus can be moved among
         *   the items of the report using keyboard or mouse.</li>
         * <li><strong>select</strong> - The report supports focus and selection state.</li>
         * </ul>
         * <p>Except when this value is "none", only one item in the report at a time is in the keyboard tab order.
         * and the arrow, home, and end keys are used to move among the items.</p>
         * </p>
         * @type {string}
         * @default "none"
         */
        #itemNavigationMode = NAV_NONE;
        get itemNavigationMode() {
            return this.#itemNavigationMode;
        }
        set itemNavigationMode( value ) {
            if ( ![NAV_NONE, NAV_FOCUS, NAV_SELECT].includes( value ) ) {
                debug.warn( "Invalid value for itemNavigationMode ignored" );
                value = NAV_NONE;
            }
            if ( this.#itemNavigationMode !== value ) {
                // if changed clear the selection
                this.setSelection( $(), false, false );
            }

            this.#itemNavigationMode = value;
            if ( value === NAV_NONE ) {
                this.#lastFocused = null;
            } else {
                const container$ = this.#cb.getContainer();

                if ( container$ ) {
                    this.#setTabbable( container$.find( this.itemSelector )[0] );
                } else {
                    this.#lastFocused = null;
                }
            }
            this.#updateReport();
        }

        /**
         * <p>For internal use. Should be true.</p>
         * <p>When true selection follows focus and the mouse and keyboard behavior is like Windows.
         * </p>
         * <p>When false selection does not follow focus and the mouse and keyboard behavior is similar to JET/Redwood
         * </p>
         * <p>Only applies when itemNavigationMode is "select"
         * @ignore
         * @type {boolean}
         */
        selectionFollowsFocus = true;

        /**
         * <p>If true multiple items can be selected otherwise only a single item can be selected.</p>
         * <p>This option only applies if selection is supported
         * (when {@link ListViewSelection#itemNavigationMode} is "select").</p>
         *
         * @type {boolean}
         * @default false
         */
        #multiple = false;
        get multiple() {
            return this.#multiple;
        }
        set multiple( value ) {
            if ( this.#multiple && !value ) {
                // changing from multiple to single make sure at most one item is selected
                this.setSelection( this.getSelection().first() );
            }
            this.#multiple = value;
            this.#updateReport();
        }

        /**
         * <p>Only applies when {@link ListViewSelection#multiple} is true. If true then the current page/all visible
         * items can be selected with Ctrl+A keyboard keys, a select all checkbox if configured with
         * {@link ListViewSelection#selectAllId} or with the {@link ListViewSelection#selectAll} method.</p>
         * <p>When {@link ListViewSelection#persistSelection} is false only items that are rendered to the DOM
         * can be selected with Select All. For traditional paging this means that all the items in the current
         * page can be selected.
         * When there is no paging, the report is showing all the items, so they will all be selected.
         * For any kind of scroll pagination only the items that have already been rendered to the DOM
         * can be selected.
         * <p>When {@link ListViewSelection#persistSelection} is true the selection state is kept in
         * the model and only records currently loaded in the model can be selected. The view layer may have
         * a feature to load additional records when it detects that there is an incomplete selection.
         * </p>
         *
         * @type {boolean}
         * @default true
         */
        allowSelectAll = false;

        /**
         * <p>This the id of an element used to select all items. It has checkbox semantics.
         * When all items are selected the checkbox is checked, otherwise it is unchecked.
         * If it is unchecked, clicking it will select all items.
         * If it is checked, clicking it will unselect all items.</p>
         * <p>The expected markup is an input of type=checkbox or a span with checkbox semantics.</p>
         * <p>This only applies if {@link ListViewSelection#allowSelectAll} is true.</p>
         *
         * @type {?string}
         * @default null
         */
        #selectAllId = null;
        get selectAllId() {
            return this.#selectAllId;
        }
        set selectAllId( value ) {
            // remove old handler
            if ( this.#selectAllControl$ ) {
                this.#selectAllControl$.off( EVENT_SEL_NAMESPACE );
            }

            if ( !value ) {
                this.#selectAllControl$ = null;
            } else {
                this.#selectAllControl$ = $( "#" + util.escapeCSS( value ) );
                if ( this.#selectAllControl$[0] ) {
                    const isInput = this.#selectAllControl$.is ( SEL_INPUT ),
                        update = ( allChecked ) => {
                            // if currently all selected then select none otherwise select all.
                            if ( allChecked ) {
                                this.setSelection( $() );
                            } else {
                                this.selectAll( null );
                            }
                        };

                    // add select all handler
                    this.#selectAllControl$.on( "click" + EVENT_SEL_NAMESPACE, () => {
                        if ( this.#disabled ) {
                            return;
                        } // else

                        let allChecked;

                        if ( isInput ) {
                            // on an input the click has already changed the state so infer the previous state
                            allChecked = !this.#selectAllControl$.prop( "checked" );
                        } else {
                            allChecked = this.#selectAllControl$.attr( ARIA_CHECKED ) === TRUE;
                        }
                        update( allChecked );
                    } );
                    if ( !isInput ) {
                        this.#selectAllControl$
                            .on( `keyup${EVENT_SEL_NAMESPACE} keydown${EVENT_SEL_NAMESPACE}`, ( event ) => {

                            if ( this.#disabled ) {
                                return;
                            } // else

                            if ( event.which === KEY_SPACE ) {
                                if ( event.type === "keyup" ) {
                                    const allChecked = this.#selectAllControl$.attr( ARIA_CHECKED ) === TRUE;

                                    update( allChecked );
                                }
                                event.preventDefault();
                            }
                        } );
                    }

                } else {
                    this.#selectAllControl$ = null;
                    // Delay waning until after report is rendered in case selectAll control
                    // is in report header/footer etc. See contentChanged.
                }
            }
            this.#selectAllId = value;
        }

        /**
         * <p>Controls if hidden report items can be selected or stay selected when made hidden.
         * Not all reports support features that can hide items. Examples include collapsible groups
         * or control breaks and client side filtering.</p>
         * <p>Normally hidden report items cannot be selected. This means that range selection across collapsed
         * control breaks will not select any collapsed items and if a control break is collapsed any selected items
         * within it are unselected. This also applies to client side filtering.</p>
         * <p>Setting this option to true will allow hidden items to be selected.</p>
         *
         * @type {boolean}
         * @default false
         */
        allowSelectHidden = false; // todo not yet fully implemented

        /**
         * <p>A CSS selector that selects the outermost item element in the report collection.
         * This is required if {@link tableModelView#itemNavigationMode} is not "none".</p>
         * @type {?string}
         * @default null
         */
        itemSelector = null;

        /**
         * <p>A CSS selector that selects the outermost group item element in the report collection.
         * This is required if {@link tableModelView#itemNavigationMode} is not "none" and markup includes
         * groups.</p>
         * @type {?string}
         * @default null
         */
        #groupSelector = null;
        get groupSelector() {
            return this.#groupSelector;
        }
        set groupSelector( value ) {
            this.#groupSelector = value;
            this.#updateExcludeSelector();
        }

        /**
         * <p>Normally keyboard handling will call preventDefault so that arrow key navigation has no effect outside
         * this control. This prevents text selection and keeps parents from scrolling. By setting this to false
         * it would allow a nested container to respond to arrow navigation keys.</p>
         * <p>This option only applies when {@link ListViewSelection#itemNavigationMode} is not "none".</p>
         *
         * @type {boolean}
         * @default true
         */
        constrainNavigation = true;

        /**
         * <p>A function that allows control over how an item is copied to the clipboard. The function signature is
         * <code class="prettyprint">clipboardValue( index, item$, model, record, recordId ) -> jQuery</code>
         * </p>
         * <p>Only applies when allowCopy is true. The last 3 arguments only apply if there is a model.</p>
         * <p>When copying items to the clipboard the item's inner text is coped for the "text/plain" format
         * and the item's inner HTML is copied for the "text/html" format.</p>
         *
         * @type {function}
         * @default null
         */
        clipboardValue = null;
        /**
         * todo consider doc in future
         * @ignore
         */
        dataTransferFormats = [
            {
                format: "text/plain",
                writer: Object.create( textFormatWriterPrototype )
            },
            // Excel and Calc seem to prefer this format over text/plain
            {
                format: "text/html",
                writer: Object.create( htmlFormatWriterPrototype )
            }
        ];

        /**
         * <p>If true and the view supports selection, the selection state for each item will be saved as
         * record metadata in the model.</p>
         *
         * @type {boolean}
         * @default false
         */
        #persistSelection = false;
        get persistSelection() {
            return this.#persistSelection;
        }
        set persistSelection( value ) {
            if ( !this.#cb.getModel && value ) {
                debug.warn( "No model to persist selection in" );
                value = false;
            }
            this.#persistSelection = value;
        }

        /**
         * <p>Name of an APEX page item that will receive the selection state each time the selection changes.
         * Typically, this is the name of a hidden item and is used to process the selection on the server
         * with a PL/SQL code process.</p>
         * <p>The form item value format is a ":" separated string of selected item values
         * (the item value comes from the value attribute on the item element or, if there is a model,
         * the record identity)</p>
         *
         * @type {?string}
         * @default null
         */
        selectionStateItem = null;

        /**
         * <p>Disable or enable the behaviors of ListViewSelection. When disabled is true all selection and
         * keyboard navigation behavior of this class are disabled. When true it is fully functional.
         */
        #disabled = false;
        get disabled() {
            return this.#disabled;
        }
        set disabled( value ) {
            this.#disabled = value;
            if ( value ) {
                const prevItem$ = this.getCurrentItem();

                if ( prevItem$ ) {
                    // remove old tab stops
                    this.#removeTabStops( prevItem$ );
                }
            } else if ( this.supportsNavigation() ) {
                const tempLast = this.#lastFocused;

                this.#lastFocused = null; // clear so setTabbable will set tabstops
                this.#setTabbable( tempLast );
            }
            this.#updateReport();
        }

        /*
        todo TBD:
        Future options
        selectionRequired future? for single select only?
        2D?
        Select First Record: true/false. The Redwood Cards Selection plug-in has this option. tbd
        Selection Control Visible? (for grid widget this is rowHeaderCheckbox, for tree; nodeSelector, for iconList; itemSelector) > probably itemSelector bool is best. Only if true is selector markup required.
        May need an option to focus item or first focusable in item. See ARIA APG layout grid pattern section 'Whether to Focus on a Cell Or an Element Inside It'.
         */
        // End options

        /**
         * Call when report widget/control is initialized such as from widget _create method.
         */
        initialize() {
            const ctrl$ = this.#report$;

            this.#updateReport();

            this.#lastFocused = null;    // last item that had focus or has focus could be button/link inside a cell
            this.#hasSelection = false;  // is there currently a selection or not, only used when persistSelection

            if ( ctrl$.css( "direction" ) === "rtl" ) {
                ctrl$.addClass( C_RTL );
                this.#forwardKey = KEY_LEFT;
                this.#backwardKey = KEY_RIGHT;
            }

            ctrl$.on( "click" + EVENT_SEL_NAMESPACE, event => {
                this.#handleClick( event );
            } ).on( "keydown" + EVENT_SEL_NAMESPACE, event => {
                this.#handleKeydown( event );
            } ).on( "keyup" + EVENT_SEL_NAMESPACE, event => {
                this.#handleKeyup( event );
            } ).on( "focusin" + EVENT_SEL_NAMESPACE, event => {
                this.#handleFocusin( event );
            } ).on( "focusout" + EVENT_SEL_NAMESPACE, event => {
                this.#handleFocusout( event );
            } );

            if ( this.#allowCopy ) {
                apex.clipboard.addHandler( ctrl$[0], ( dataTransfer ) => {
                    if ( this.#disabled || !this.supportsSelection() ) {
                        return false;
                    } // else
                    this.#copy( dataTransfer );
                    return true;
                } );
            }

            // use debounce (timer) to make sure the focus happens first and also throttle
            // rapid changes from keyboard navigation.
            this.#selNotifyDelay = util.debounce( this.#selChangeNotify, 1 );
            this.#selNotifyLongDelay = util.debounce( this.#selChangeNotify, 350 );
        }

        /**
         * Call when report widget/control is destroyed such as from widget _destroy method
         */
        destroy() {
            apex.clipboard.removeHandler( this.#report$[0] );
            this.#report$.removeClass( C_RTL )
                .off( EVENT_SEL_NAMESPACE );
            // cleanup container just in case it isn't removed by component destroy
            this.#cb.getContainer().removeAttr( ARIA_MULTI ).removeAttr( ARIA_DISABLED );
            if ( this.#selectAllControl$ ) {
                this.#selectAllControl$.off( EVENT_SEL_NAMESPACE );
                this.#selectAllControl$ = null;
            }
        }

        /**
         * returns true if itemNavigationMode supports selection
         * @returns {boolean}
         */
        supportsSelection() {
            return this.itemNavigationMode === NAV_SELECT;
        }

        /**
         * Returns true if itemNavigationMode supports navigation. Selection includes navigation so
         * if supportsSelection is true supportsNavigation will also be true.
         * @returns {boolean}
         */
        supportsNavigation() {
            return this.itemNavigationMode !== NAV_NONE;
        }

        /**
         * Puts focus in the report if possible.
         * If the report supportsNavigation then the last focused element receives focus,
         * otherwise the first focusable element, if there is one, is focused.
         */
        focus() {
            if ( this.supportsNavigation() && this.#lastFocused ) {
                this.#lastFocused.focus();
            } else {
                this.#cb.getContainer().find( ":focusable" ).first().trigger( FOCUS );
            }
        }

        /**
         * Returns the current item as a jQuery object.
         * The current item is the item that has or last had focus.
         * Returns null if navigation isn't supported or report not initialized.
         * @returns {jQuery|null}
         */
        getCurrentItem() {
            if ( this.supportsNavigation() ) {
                if ( this.#lastFocused ) {
                    let selector = this.itemSelector;

                    // for the purpose of focus management and keyboard navigation groups must also be considered items
                    if ( this.groupSelector ) {
                        selector += "," + this.groupSelector;
                    }
                    return $( this.#lastFocused ).closest( selector );
                } // else
                return $();
            } // else
            return null;
        }

        /**
         * Sets the last focused item to the given item. If item$ is not an item
         * or not in the report container the current item is not changed.
         * Notifies the report if the current item changes.
         * Does nothing if supportsNavigation is false.
         * @param {jQuery} pItem$ The item to make current.
         * @param {boolean} [pFocus] If true also focus the item.
         */
        setCurrentItem( pItem$, pFocus ) {
            if ( this.supportsNavigation() ) {
                const container$ = this.#cb.getContainer();
                let selector = this.itemSelector;

                // for the purpose of focus management and keyboard navigation groups must also be considered items
                if ( this.groupSelector ) {
                    selector += "," + this.groupSelector;
                }
                pItem$ = pItem$.first();
                // make sure item is in the report container and is an item
                if ( pItem$.is( selector ) && pItem$.closest( container$ )[0] ) {
                    this.#setTabbable( pItem$[0] );
                    if ( pFocus ) {
                        this.focus();
                    }
                }
            }
        }

        /**
         * Returns a jQuery collection with all the selected item elements.
         * This is limited to just items currently rendered to the DOM.
         * If no items are selected returns an empty jQuery collection.
         * Returns null if selection isn't supported or report not initialized.
         * @returns {jQuery|null}
         */
        getSelection() {
            const container$ = this.#cb.getContainer();

            if ( container$ && this.supportsSelection() ) {
                return container$.find( this.itemSelector + SEL_SELECTED );
            } // else
            return null;
        }

        /**
         * Sets the selection to the items in the items$ jQuery collection.
         * Notifies the report if the selection changes unless pNoNotify is true.
         * Does nothing if supportsSelection is false.
         * @param {jQuery} pItems$ The items to select.
         * @param {boolean} [pFocus] If true the first item is given focus.
         * @param {boolean} [pNoNotify] If true the selection change notification will be suppressed.
         */
        setSelection( pItems$, pFocus, pNoNotify ) {
            const container$ = this.#cb.getContainer();

            if ( container$ && this.supportsSelection() ) {
                if ( !this.multiple ) {
                    pItems$ = pItems$.first();
                }
                this.#select( pItems$, null, pFocus, false, pNoNotify );
            }
        }

        /**
         * <p>Select all the items in the report that can be selected.
         * Only applies if supportsSelection is true and multiple and allowSelectAll are also true.
         * Notifies the report if the selection changes unless pNoNotify is true.</p>
         * Does nothing if supportsSelection is false.</p>
         * @param {?boolean} [pFocus] If true the first selected item is given focus.
         *  If null there is no change to the current item.
         * @param {boolean} [pNoNotify] If true the selection change notification will be suppressed.
         */
        selectAll( pFocus, pNoNotify ) {
            const container$ = this.#cb.getContainer();

            if ( container$ && this.supportsSelection() && this.multiple && this.allowSelectAll ) {
                let items$;

                items$ = container$.find( this.itemSelector );
                this.#select( items$, SEL_ACTION_ALL, pFocus, pNoNotify );
            }
        }

        /**
         * Returns an array of values associated with the selected items. If no items are selected
         * returns an empty array. If the report uses a model the values are records from the model.
         * Otherwise, the values are typically from a data attribute on the item element.
         * Returns null if selection isn't supported or report not initialized.
         * @returns {array|null}
         */
        getSelectedValues() {
            const cb = this.#cb,
                container$ = cb.getContainer();

            if ( container$ && this.supportsSelection() ) {
                if ( this.persistSelection ) {
                    // if selection is persisted in the model then get it from the model
                    return cb.getModel().getSelectedRecords();
                } // else
                return cb.getValuesForItems( this.getSelection() );
            } // else
            return null;
        }

        /**
         * Returns count of the number of selected items. If no items are selected
         * returns zero. If the report uses a model the count comes from the model.
         * Returns null if selection isn't supported or report not initialized.
         * @returns {number|null}
         */
        getSelectedCount() {
            const cb = this.#cb,
                container$ = cb.getContainer();

            if ( container$ && this.supportsSelection() ) {
                if ( this.persistSelection ) {
                    // if selection is persisted in the model then get it from the model
                    return cb.getModel().getSelectedCount();
                } // else
                return this.getSelection()?.length;
            } // else
            return null;
        }

        /**
         * Select the items that correspond to the given values in pValues array.
         * Does nothing if supportsSelection is false.
         * @param {array} pValues
         * @param {boolean} pFocus If true the first selected item is given focus.
         * @param {boolean} pNoNotify If true the selection change notification will be suppressed.
         * @return {number} Count of the items actually selected or -1 if called before the report is initialized or
         *      if selection isn't supported.
         */
        setSelectedValues( pValues, pFocus, pNoNotify ) {
            const cb = this.#cb,
                container$ = cb.getContainer(),
                model = cb.getModel ? cb.getModel() : null;
            let items$,
                items = [],
                count = 0,
                len = pValues.length,
                keys = new Set();

            if ( !container$ || !this.supportsSelection() ) {
                return -1;
            } // else

            if ( !this.multiple && len > 1 ) {
                len = 1;
            }

            if ( model ) {
                // if there is a model then it is expected that the values are model records
                for ( let i = 0; i < len; i++ ) {
                    keys.add( model.getRecordId( pValues[i] ) );
                }
            } else {
                // the values are expected to be found in the data-id attribute
                pValues.forEach( v => {
                    keys.add( v );
                } );
            }

            if ( this.#groupIsContainer ) {
                items$ = container$.find( this.groupSelector + " " + this.itemSelector );
                // groups can't contain groups so items$ is only items
            } else {
                items$ = container$.children();
                if ( this.#isLayoutGrid ) {
                    items$ = items$.children( this.itemSelector );
                } else {
                    items$ = items$.filter( this.itemSelector );
                }
                // exclude things that can't be selected
                items$ = items$.not( this.#excludeSelector );
            }
            items$.each( function() {
                let id = $( this ).attr( DATA_ID );

                if ( keys.has( id ) ) {
                    keys.delete( id );
                    items.push( this );
                    count += 1;
                }
            } );
            this.setSelection( $( items ), pFocus, pNoNotify );

            // if model is keeping the selection and using virtual paging then it is possible to select records that
            // are not in the DOM at the moment
            if ( this.persistSelection ) {
                for ( let id of keys ) {
                    let rec = model.getRecord( id );

                    if ( rec ) {
                        model.setSelectionState( id, true );
                        count += 1;
                    }
                }
                // if there were no items it means there were no rendered records to be selected
                // which means the selection change event would not have been triggered
                if ( items.length === 0 && !pNoNotify ) {
                    // todo don't just assume something changed
                    this.#selNotifyDelay( true, null );
                }
            }
            return count;
        }

        /**
         * Saves state prior to refreshing the report DOM
         */
        saveState() {
            if ( !this.supportsNavigation() ) {
                return;
            }

            let currentItem$,
                state = {};

            if ( this.#savedState ) {
                debug.warn( "Previous selection state overwritten" );
            }
            this.#savedState = state;

            this.#allSelected = false;

            // preserve last focused item by value
            currentItem$ = this.getCurrentItem();
            if ( currentItem$[0] ) {
                state.lastItemValue = currentItem$.attr( DATA_ID );
            }

            if ( this.supportsSelection() ) {
                // preserve selection anchor item by value
                if ( this.#selectAnchor ) {
                    let anchor$;

                    if ( typeof this.#selectAnchor === "string" ) {
                        // in case anchor was not changed since last saveState
                        anchor$ = ( this.#cb.getContainer() || $() )
                            .find( `[${DATA_ID}="${util.escapeCSS( this.#selectAnchor )}"]` );
                    } else {
                        anchor$ = $( this.#selectAnchor );
                    }
                    state.anchorItemValue = anchor$.attr( DATA_ID );
                }

                // preserve current selection
                if ( this.#cb.getContainer() && !this.persistSelection ) {
                    // preserve selection by values can't use getSelectedValues because in the case where a model
                    // is used and getSelectedValues returns records, in some cases the model has already
                    // been cleared by the time refresh is called. So need an array of just the values (record ids).
                    const sel$ = this.getSelection(),
                        selection = [];

                    state.selection = selection;
                    for ( let i = 0; i < sel$.length; i++ ) {
                        let id = sel$.eq(i).attr( DATA_ID );

                        if ( id !== undefined ) {
                            selection.push( id );
                        }
                    }
                } else if ( this.persistSelection ) {
                    // The model may have been cleared in which case the selection is lost. If the model wasn't cleared,
                    // no need to save the selection here because it will be restored as the items are rendered.
                    // Because the model may have lost its selection the view remembers if it once had anything selected
                    // just so that a selection change notification can be given if needed
                    state.hadSelection = this.#hasSelection;
                    this.#hasSelection = false;
                }
            }
        }

        /**
         * Restores state after refreshing the report DOM
         */
        restoreState( forceSelChange ) {
            if ( !this.supportsNavigation() ) {
                return;
            }

            const state = this.#savedState,
                model = this.#cb.getModel(),
                container$ = this.#cb.getContainer();
            let item$,toFocus,
                selectionMade = false;

            this.#savedState = null;

            item$ = container$.find( `[${DATA_ID}="${util.escapeCSS( state.lastItemValue )}"]` );
            if ( item$[0] ) {
                toFocus = this.#getItemFocusable( item$ );
            } else {
                toFocus = container$.find( this.itemSelector )[0];
            }

            if ( this.supportsSelection() ) {
                // restore anchor
                this.#selectAnchor = container$
                    .find( `[${DATA_ID}="${util.escapeCSS( state.anchorItemValue )}"]` )[0] ||
                        state.anchorItemValue || null;
                // the model should still remember the anchor if persistSelection

                // restore selection if any
                if ( state?.selection?.length > 0 ) {
                    let selection = state.selection;

                    // need to turn selection back into records if there is a model
                    if ( model ) {
                        selection = selection.map( x => model.getRecord( x ) )
                            .filter( x => x != null ); // in case the model no longer has the record.
                    }
                    selectionMade = this.setSelectedValues( selection, false, true ) > 0;

                    // there was a selection but not able to make a selection after refresh so the selection has changed
                    if ( !selectionMade || forceSelChange ) {
                        this.#selNotifyDelay( true, null );
                    }
                } else if ( this.persistSelection ) {
                    // Selection state is kept in the model. It could be that there was no selection before refresh, or
                    // it could be that the model was cleared and there was a selection that was lost.
                    // hadSelection is used to distinguish those cases; if true there was a selection and
                    // isn't now so notify
                    if ( state.hadSelection || forceSelChange ) {
                        this.#selNotifyDelay( true, null );
                    }
                }
            }
            if ( toFocus ) {
                this.#setTabbable( toFocus );
            }
        }

        /**
         * Returns markup for the selector control.
         * Don't call until after contentChanged has been called.
         * @returns {string}
         */
        getPreferredSelectorControl() {
            if ( !this.supportsSelection() ) {
                return "";
            } // else

            const selectorCls = "u-selector" + ( this.#multiple ? "" : " u-selector--single" );

            // for layout grid use a span else use an input
            if ( this.#isLayoutGrid ) {
                return `<span class="${selectorCls}" aria-hidden="${TRUE}"></span>`;
            } else {
                // todo consider if this should include title="%0" also
                return `<input class="${selectorCls}" type="${this.#multiple ? "checkbox" : "radio"}" aria-label="%0">`;
            }
        }

        /**
         *
         * @param items$
         * @param event
         * @param {?boolean} focus if true focus first items$, if false make first items$ focusable
         *                          if null no change to lastFocused
         * @param delayTrigger
         * @param [noNotify]
         */
        #select( items$, event, focus, delayTrigger, noNotify = false ) {
            const cb = this.#cb,
                model = cb.getModel ? cb.getModel() : null,
                container$ = cb.getContainer(),
                pagination = cb.getPagination();
            let prevSelected, toFocus, selectableItems$,
                selectable, modelRangeAnchor, prevSel$,
                notFollowFocus = !this.selectionFollowsFocus,
                clearOthers = false,
                setAnchor = false,
                noAnchor = false,
                persistSelection = this.persistSelection,
                actionSelectAll = false,
                checked = null,
                action = SEL_ACTION_SET;

            const updateModelSelectionState = ( rows$, selectState ) => {
                const updateForRows = ( rows$, action ) => {
                    rows$.each( ( i, el ) => {
                        let id = $( el ).attr( DATA_ID );

                        if ( id ) {
                            model.setSelectionState( id, selectState, action );
                        }
                    } );
                };

                if ( persistSelection && !actionSelectAll ) {
                    updateForRows( rows$, action );
                    if ( action !== SEL_ACTION_TOGGLE && rows$.length > 1 && !noAnchor ) {
                        updateForRows( selectableItems$.first(), SEL_ACTION_ANCHOR ); // to set the anchor
                    }
                }
            };

            // un-selecting is allowed for invisible items so don't filter them out
            if ( event !== SEL_ACTION_UNSET && !this.allowSelectHidden ) { // todo unset is not yet used
                // can't select something that isn't visible
                items$ = items$.filter( SEL_VISIBLE );
            }

            // calculate selection action
            if ( event ) {
                if ( this.multiple ) {
                    if ( typeof event === "string" ) {
                        action = event; // override normal event processing
                    } else if ( event.type === "click" ) {
                        if ( notFollowFocus && $( event.target ).is( SEL_SELECTOR ) ) {
                            // special case for click on selector: toggle but don't set the anchor.
                            action = SEL_ACTION_TOGGLE;
                            noAnchor = true;
                        } else {
                            // control+click for Windows and command+click for Mac
                            if ( event.ctrlKey || event.metaKey ) {
                                action = SEL_ACTION_TOGGLE;
                            } else if ( event.shiftKey ) {
                                action = SEL_ACTION_RANGE;
                            }
                        }
                    } else if ( event.type === "keydown" || event.type === "keyup" ) {
                        // Mac has no concept of toggle with the keyboard
                        if ( event.which === KEY_SPACE ) {
                            if ( event.ctrlKey ) {
                                action = SEL_ACTION_TOGGLE;
                            } else if ( event.shiftKey ) {
                                action = SEL_ACTION_RANGE;
                            } else if ( notFollowFocus ) {
                                action = SEL_ACTION_TOGGLE;
                                clearOthers = true;
                            } else {
                                action = SEL_ACTION_ADD;
                            }
                        } else if ( event.ctrlKey ) {
                            action = SEl_ACTION_NONE;
                        } else if ( event.shiftKey ) {
                            action = SEL_ACTION_RANGE;
                            // must be range due to movement keys
                            if ( notFollowFocus )  {
                                setAnchor = true;
                            }
                        }
                    }
                    // if there is no target it is a fake event so get rid of it so not used in notification
                    if ( !event.target ) {
                        event = null;
                    }
                } else {
                    // single selection
                    if ( event.type === "click" && notFollowFocus ) {
                        // control+click for Windows and command+click for Mac
                        if ( event.ctrlKey || event.metaKey ) {
                            action = SEL_ACTION_TOGGLE;
                            clearOthers = true;
                        }
                    } else if ( event.type === "keydown" || event.type === "keyup" ) {
                        if ( event.which === KEY_SPACE && notFollowFocus ) {
                            action = SEL_ACTION_TOGGLE;
                            clearOthers = true;
                        }
                    }
                }
            }

            if ( persistSelection ) {
                modelRangeAnchor = model.getSelectionState().rangeAnchor;
            }
            if ( action === SEL_ACTION_ALL && this.multiple && this.allowSelectAll ) {
                actionSelectAll = true;
                action = SEL_ACTION_SET;
            } else if ( action === SEL_ACTION_RANGE && ( !this.#selectAnchor && !setAnchor && !modelRangeAnchor ) ) {
                action = SEL_ACTION_SET; // when there is no anchor turn range selection into set
            }

            // When selection doesn't follow focus and using Shift+movement keys set the anchor if focused item
            // is not selected
            if ( action === SEL_ACTION_RANGE && setAnchor &&
                    ( !this.#selectAnchor || !this.getCurrentItem().is( SEL_SELECTED + "," + this.#excludeSelector ) ) ) {
                let cur$ = this.getCurrentItem();

                this.#selectAnchor = cur$[0];
                if ( persistSelection ) {
                    model.setSelectionState( cur$.attr( DATA_ID ), null, SEL_ACTION_ANCHOR );
                    modelRangeAnchor = model.getSelectionState().rangeAnchor; // need to get this again after set anchor
                }
            }

            // for toggle actions need to know if the item is already selected
            prevSelected = items$.hasClass( C_SELECTED );

            // clear out previous selection if needed
            if ( action === SEL_ACTION_SET || action === SEL_ACTION_RANGE ||
                ( action === SEL_ACTION_TOGGLE && clearOthers && ( !this.multiple || !prevSelected ) ) ) {
                prevSel$ = container$.find( SEL_SELECTED );
                if ( clearOthers ) {
                    prevSel$ = prevSel$.not( items$ );
                }
                prevSel$.removeClass( C_SELECTED ).removeAttr( ARIA_SELECTED )
                    .find( SEL_SELECTOR ).removeClass( C_SELECTED )
                    .filter( SEL_INPUT ).prop( "checked", false );

                if ( persistSelection ) {
                    model.clearSelection();
                }
            }

            // perform selection action
            if ( persistSelection && actionSelectAll ) {
                model.setSelectionState( null, true, SEL_ACTION_ALL );
            }

            selectableItems$ = items$.filter( this.itemSelector ).not( this.#excludeSelector );
            if ( action === SEL_ACTION_SET ||
                    action === SEL_ACTION_ADD ||
                    ( action === SEL_ACTION_TOGGLE && !prevSelected ) ) {

                selectableItems$.addClass( C_SELECTED );
                if ( this.#isLayoutGrid || this.#isTable ) {
                    // don't add aria attributes where they are not allowed
                    selectableItems$.attr( ARIA_SELECTED, TRUE );
                }
                updateModelSelectionState( selectableItems$, true );
                if ( !noAnchor && selectableItems$[0] && !actionSelectAll ) {
                    this.#selectAnchor = selectableItems$[0];
                }
                checked = true;
            } else if ( action === SEL_ACTION_RANGE ) {
                let start, end, temp, modelAnchorRow, anchorRow, anchor$,
                    endIsGroup = false,
                    end$ = items$.last();

                if ( typeof this.#selectAnchor === "string" ) {
                    // one more chance to find the anchor in case it wasn't in the DOM during restoreState, but it is now
                    anchor$ = container$
                        .find( `[${DATA_ID}="${util.escapeCSS( this.#selectAnchor )}"]` );
                } else {
                    anchor$ = $( this.#selectAnchor );
                }
                anchorRow = toInteger( anchor$.attr( DATA_ROWNUM ) );

                start = this.#itemIndex( anchor$ );
                if ( persistSelection ) {
                    // the model has its own anchor which should take priority over the view anchor if any
                    let meta = model.getRecordMetadata( modelRangeAnchor );

                    if ( meta && meta.serverOffset ) {
                        modelAnchorRow = meta.serverOffset + 1;
                        if ( modelAnchorRow !== anchorRow ) {
                            start = -1;
                        }
                    }
                }
                end = this.#itemIndex( end$ );
                if ( end < 0 ) {
                    // maybe end is a group. If so use first item in the group; it will have the same rownum
                    if ( end$.is( this.groupSelector ) ) {
                        if ( this.#groupIsContainer ) {
                            end$ = end$.find( this.itemSelector ).first();
                        } else {
                            end$ = end$.next();
                        }
                        endIsGroup = true;
                        end = this.#itemIndex( end$ );
                    }
                }
                if ( start < 0 ) {
                    let endRow = toInteger( end$.attr( DATA_ROWNUM ) );

                    anchorRow = modelAnchorRow || anchorRow;
                    if ( pagination.virtual ) {
                        // with virtual scroll paging the anchor may not be in the DOM
                        let fillers = container$.find( "." + C_GRID_SCROLL_FILLER ).toArray();

                        // move anchor to next closest row that is in the DOM
                        if ( endRow > anchorRow ) {
                            for ( let i = 0; i < fillers.length; i++ ) {
                                anchor$ = $( fillers[i] ).next();
                                if ( this.#isLayoutGrid ) {
                                    anchor$ = anchor$.children().first();
                                }
                                if ( toInteger( anchor$.attr( DATA_ROWNUM ) ) > anchorRow ) {
                                    break;
                                }
                            }
                        } else {
                            for ( let i = fillers.length - 1; i >= 0; i-- ) {
                                anchor$ = $( fillers[i] ).prev();
                                if ( this.#isLayoutGrid ) {
                                    anchor$ = anchor$.children().first();
                                }
                                if ( toInteger( anchor$.attr( DATA_ROWNUM ) ) < anchorRow ) {
                                    break;
                                }
                            }
                        }
                        start = this.#itemIndex( anchor$ );
                    } else if ( !pagination.scroll && persistSelection ) {
                        // with traditional paging and selection kept in the model the anchor could be on a different page
                        anchor$ = this.#itemsCache$[endRow > anchorRow ? "first" : "last"]();
                        start = this.#itemIndex( anchor$ );
                    }
                }

                if ( endIsGroup && start < end ) {
                    // adjust the end so that it is just before the group; there must be one because start < end
                    end -= 1;
                    end$ = this.#itemsCache$.eq( end );

                }
                if ( persistSelection ) {
                    updateModelSelectionState( end$, true ); // for range only need to update the last record
                }

                if ( start > end ) {
                    temp = end;
                    end = start;
                    start = temp;
                }
                end += 1;

                selectable = [];
                // because #itemIndex called can be sure #itemsCache$ exist
                this.#itemsCache$.slice( start, end ).each( ( index, el ) => {
                    let el$ = $( el );

                    if ( el$.is( SEL_VISIBLE ) && !el$.is( this.#excludeSelector ) ) { // todo check allowSelectHidden
                        selectable.push( el );
                    }
                } );
                selectableItems$ = $( selectable );
                selectableItems$.addClass( C_SELECTED );
                if ( this.#isLayoutGrid || this.#isTable ) {
                    selectableItems$.attr( ARIA_SELECTED, TRUE );
                }
                checked = true;
            } else if ( (action === SEL_ACTION_TOGGLE && prevSelected) || action === SEL_ACTION_UNSET ) {
                selectableItems$.removeClass( C_SELECTED ).removeAttr( ARIA_SELECTED );
                updateModelSelectionState( selectableItems$, false );
                if ( notFollowFocus && selectableItems$[0] === this.#selectAnchor ) {
                    // special case deselecting the anchor clears it
                    this.#selectAnchor = null;
                    if ( persistSelection ) {
                        model.setSelectionState( null, null, SEL_ACTION_ANCHOR );
                    }
                } else if ( !noAnchor ) {
                    this.#selectAnchor = selectableItems$[0]; // model anchor updated in updateModelSelectionState
                }
                checked = false;
            }

            if ( checked !== null ) {
                selectableItems$.find( SEL_SELECTOR ).toggleClass( C_SELECTED, checked )
                    .filter( SEL_INPUT ).prop( "checked", checked );
            }
            if ( this.multiple && this.allowSelectAll ) {
                this.#updateSelectAll();
            }

            // focus if needed
            if ( items$.length > 0 && focus !== null ) {
                toFocus = this.#getItemFocusable( items$.first() );
                if ( focus ) {
                    this.#setFocus( toFocus, event );
                } else {
                    this.#setTabbable( toFocus );
                }
            }

            if ( persistSelection ) {
                this.#hasSelection = model.getSelectedCount() > 0;
            }

            // notify if needed
            if ( action === SEL_ACTION_TOGGLE ||
                action === SEL_ACTION_UNSET || // assuming at least some of the things to unset were previously selected
                action === SEL_ACTION_RANGE || // todo shift click on range end causes notification when none needed
                action === SEL_ACTION_ADD || // assuming at least some of the things to add were previously not selected
                ( action === SEL_ACTION_SET && !util.arrayEqual( prevSel$, selectableItems$ ) ) ) { // todo what if selection differs in model only
                let doNotify = !noNotify;

                delayTrigger ? this.#selNotifyLongDelay( doNotify, event ) : this.#selNotifyDelay( doNotify, event );
            }
        }

        /**
         * Report widget/control must call this method anytime the item contents of the report collection changes.
         * @param {jQuery} [newChildren$] If the change involved adding new items
         *      this is the new children of the collection.
         */
        contentChanged( newChildren$ ) {
            const container$ = this.#cb.getContainer(),
                model = this.#cb.getModel ? this.#cb.getModel() : null;
            let groupItems$;

            // clear the cache of children items
            this.#itemsCache$ = null;

            // see if selectAllId is still missing
            if ( this.selectAllId && !this.#selectAllControl$ ) {
                debug.warn( "Select All control not found", this.selectAllId );
            }

            if ( this.groupSelector ) {
                groupItems$ = container$.find( this.groupSelector + " " + this.itemSelector );
                this.#groupIsContainer = groupItems$.length > 0;
            }
            // detect if items are wrapped in rows or detect if using table markup
            if ( this.#groupIsContainer ) {
                // there must be at least one group with at least one item
                let groupContainer$ = groupItems$.first().parent();

                if ( groupContainer$.attr( ATTR_ROLE ) === "row" ) {
                    groupContainer$ = groupContainer$.parent();
                }
                this.#isGroupLayoutGrid = container$.attr( ATTR_ROLE ) === "grid";
                this.#isLayoutGrid = groupContainer$.attr( ATTR_ROLE ) === "grid";
                this.#isTable = groupContainer$.is( "table,tbody" );
            } else {
                this.#isLayoutGrid = container$.attr( ATTR_ROLE ) === "grid";
                this.#isTable = container$.is( "table,tbody" );
            }

            // remove tab stops process selection
            if ( newChildren$?.length && this.supportsNavigation() ) {
                let items$ = newChildren$;

                // the items must match the itemSelector class
                if ( this.#isLayoutGrid ) {
                    items$ = items$.children( this.itemSelector );
                } else {
                    items$ = items$.filter( this.itemSelector );
                }
                this.#removeTabStops( items$ );
                // When #groupIsContainer is true newChildren$ will never contain groups so need this special case
                // to update tabbable stuff in header
                if ( this.#groupIsContainer ) {
                    let groupHeader$ = items$.first().closest( this.groupSelector ).children().first();

                    // if the group header for these items hasn't already been processed and isn't the current item
                    if ( groupHeader$.length && !groupHeader$.hasClass( C_JS_TABBABLE ) &&
                            $( this.#lastFocused ).closest ( groupHeader$ ).length === 0  ) {
                        this.#removeTabStops( groupHeader$ );
                    }
                }

                // checking model just in case since it should always be true if persistSelection is.
                if ( this.persistSelection && this.#itemsAreServerRendered && model ) {
                    // set selection for server rendered reports using model for selection

                    items$.each( function() {
                        const item$ = $( this ),
                            id = item$.attr( DATA_ID ),
                            meta = model.getRecordMetadata( id );

                        if ( meta?.sel ) {
                            item$.addClass( C_SELECTED );
                        }
                    } );
                }

                // For initial selection via rendered is-selected class or
                // when selection is saved in the model it will add the selection state to new
                // records that are fetched as needed but tableModelView only renders the is-selected class
                let selected$ = items$.filter( SEL_SELECTED );

                selected$.find( SEL_SELECTOR ).addClass( C_SELECTED )
                    .filter( SEL_INPUT ).prop( "checked", true );
                if ( this.#isLayoutGrid || this.#isTable ) {
                    // don't add aria attributes where they are not allowed
                    selected$.attr( ARIA_SELECTED, TRUE );
                }
                // when all items are selected new items rendered should also be selected
                if ( !this.persistSelection && this.#allSelected ) {
                    // if selectAll is true then new items added must also be selected
                    items$.addClass( C_SELECTED )
                        .find( SEL_SELECTOR ).addClass( C_SELECTED )
                        .filter( SEL_INPUT ).prop( "checked", true );
                    if ( this.#isLayoutGrid || this.#isTable ) {
                        items$.attr( ARIA_SELECTED, TRUE );
                    }
                }
                if ( this.#allSelected || selected$.length ) {
                    this.#selNotifyDelay( true );
                }
            }
            this.#updateReport();
            if ( this.multiple && this.allowSelectAll ) {
                this.#updateSelectAll();
            }
        }

        /**
         * Called when the selection may have changed without the notice of this class
         * Currently should only happen if the selection state is persisted in the model and
         * model data was loaded without adding it to the view while the selection was incomplete.
         * @param originalCount
         */
        checkSelectionChange( originalCount ) {
            // this check is fast but weak and may result in unneeded selection change event
            if ( this.#persistSelection && this.getSelectedCount() !== originalCount ) {
                this.#selNotifyDelay();
            }
        }

        /*
         * --- Private methods
         */
        /*
         * Because of the persistSelection option it is important for the model and view layer (this class)
         * to agree on what can and cannot be selected. Groups from control breaks don't exist in the
         * model so they can't possibly be selected. The model doesn't allow selecting disabled records.
         * todo What to do with aggregates and invisible items is less clear. The model may not know what is
         *   invisible. The model currently doesn't allow select of aggregates but there is no well-defined
         *   or configurable class for that. The grid widget uses "is-aggregate" so use that for now.
         */
        #updateExcludeSelector() {
            this.#excludeSelector = SEL_DISABLED + ",.is-aggregate";
            if ( this.groupSelector ) {
                this.#excludeSelector += "," + this.groupSelector;
            }
            // todo consider in the future an option to add additional things to exclude such as aggregates
        }

        #updateReport() {
            const container$ = this.#cb.getContainer();

            if ( container$ ) {
                // not adding multiselectable for this.#isTable because it is not allowed
                if ( this.supportsSelection() && this.multiple && this.#isLayoutGrid ) {
                    container$.attr( ARIA_MULTI, TRUE );
                } else {
                    container$.removeAttr( ARIA_MULTI );
                }
                if ( this.#disabled ) {
                    container$.attr( ARIA_DISABLED, TRUE );
                } else {
                    container$.removeAttr( ARIA_DISABLED );
                }
            }
            // add report option marker classes
            this.#report$.removeClass( "a-TMV--multipleSelection a-TMV--singleSelection a-TMV--kbdNav js-no-select" );
            if ( this.supportsSelection() ) {
                this.#report$.addClass( this.multiple ? "a-TMV--multipleSelection" : "a-TMV--singleSelection" );
            } else if ( this.supportsNavigation() ) {
                this.#report$.addClass( "a-TMV--kbdNav" );
            }
            if ( !this.supportsSelection() ) {
                this.#report$.addClass( "js-no-select" ); // inform clipboard manager to ignore selection
            }
            // todo marker class for hiding selection control?
        }

        #itemIndex( item$ ) {
            // cache the children collection because it is used often
            if ( !this.#itemsCache$ ) {
                const container$ = this.#cb.getContainer();

                if ( this.#groupIsContainer ) {
                    this.#itemsCache$ = container$.find( this.groupSelector + " " + this.itemSelector );
                } else {
                    this.#itemsCache$ = container$.children();
                    if ( this.#isLayoutGrid ) {
                        // when container is a layout grid then the children are rows
                        // and each row contains exactly one gridcell that is the item
                        this.#itemsCache$ = this.#itemsCache$.children();
                    }
                }
            }
            return this.#itemsCache$.index( item$ );
        }

        // return the item that el is in
        #getItem( el ) {
            return $( el ).closest( this.itemSelector );
        }

        #getItemOrGroup( el ) {
            let item$ = this.#getItem( el );

            if ( this.#groupIsContainer && !item$[0] ) {
                // treating the group like an item for the purpose of updating state classes
                item$ = $( el ).closest( this.groupSelector );
            }
            return item$;
        }

        #getAllItems() {
            let allItems$ = this.#cb.getContainer()
                    .find( this.itemSelector );

            // exclude things that can't be selected
            // group elements do not count as items for the purpose of "all" items.
            allItems$ = allItems$.not( this.#excludeSelector );
            if ( !this.allowSelectHidden ) {
                allItems$ = allItems$.filter( SEL_VISIBLE );
            }
            return allItems$;
        }

        #handleClick( event ) {
            if ( this.supportsNavigation() && !this.#disabled ) {
                let target$ = $( event.target ),
                    item$ = this.#getItemOrGroup( event.target );

                if ( this.#groupIsContainer && item$.is( this.groupSelector ) ) {
                    let groupHeader$ = item$.children().first();

                    // check that target is in the header and ignore click if not
                    if ( target$.closest( groupHeader$ ).length === 0 ) {
                        return;
                    }
                }
                if ( item$[0] ) {
                    if ( this.supportsSelection() ) {
                        if ( target$.is( SEL_SELECTOR ) ) {
                            // when click the selector checkbox/radio always behave like toggle
                            event.ctrlKey = true;
                            event.shiftKey = false;
                        }
                        this.#select( item$, event, true, false, false );
                    }
                    // prevent default unless intend to be clicking on some tabbable content
                    if ( !target$.closest( ":focusable" ).length ||
                            ( target$.is( SEL_SELECTOR ) && item$.is( SEL_DISABLED ) ) ) { // todo is this right? just want to disable checking a checkbox/radio input
                        event.preventDefault();
                    } else {
                        // when click on tabbable content focus it after selection.
                        target$.trigger( FOCUS );
                    }
                }
            }
        }

        #getCurrentItemOrRow() {
            let cur$ = this.getCurrentItem();

            // for an item want the row if using layout grid for items but for groups always want the group item
            // even if isGroupLayoutGrid
            if ( this.#isLayoutGrid && cur$.is( this.itemSelector ) &&
                    !( this.groupSelector && cur$.is( this.groupSelector ) ) ) {
                cur$ = cur$.parent();
            }
            return cur$;
        }

        #handleKeydown( event ) {
            if ( event.isDefaultPrevented() || !this.supportsNavigation() || this.#disabled ) {
                return;
            }

            const target$ = $( event.target ),
                ignoreWithin = this.#cb?.keyboardIgnoreSelector(),
                kc = event.which;
            let cur$,
                handled = false,
                next$ = null;

            if ( ignoreWithin ) {
                if ( target$.closest( ignoreWithin ).length > 0 ) {
                    return;
                }
            }

            if ( kc === KEY_HOME ) {
                this.#navToReportStart( event );
                handled = true;
            } else if ( kc === KEY_END ) {
                this.#navToReportEnd( event );
                handled = true;
            } else if ( kc === KEY_DOWN || kc === this.#forwardKey ) {
                if ( kc === this.#forwardKey && event.altKey ) {
                    return; // let the browser have this key
                }
                // Current behavior is linear even if grid layout so down and forward are the same
                // todo handle 2D grid nav
                cur$ = this.#getCurrentItemOrRow();
                // if a group header is currently focused start from the first item/row in the group
                if ( this.#groupIsContainer && cur$.is( this.groupSelector ) ) {
                    next$ = cur$.find( this.itemSelector ).first();
                    if ( this.#isLayoutGrid ) {
                        // want the row
                        next$ = next$.parent();
                    }
                } else {
                    next$ = cur$.nextAll( SEL_VISIBLE ).first();
                }
                if ( next$.hasClass(C_GRID_SCROLL_FILLER) ) {
                    next$ = null;
                }
                // if there is no next item and using nested groups go to the next group
                if ( this.#groupIsContainer && !next$?.[0] ) {
                    next$ = cur$.closest( this.groupSelector );
                    if ( this.#isGroupLayoutGrid ) {
                        next$ = next$.parent();
                    }
                    next$ = next$.next();
                }
                if ( !next$?.[0] && this.#cb.getPagination().loadMore ) {
                    let load$ = this.#report$.find( SEL_LOAD_MORE );

                    if ( load$[0] ) {
                        if ( load$[0].disabled ) {
                            // let the browser do its default scroll behavior
                            return;
                        } else {
                            // move focus to the load more button
                            load$.trigger( FOCUS );
                            handled = true;
                        }
                    }
                }
                if ( this.constrainNavigation ) {
                    // don't let selection happen or scrolling
                    handled = true;
                }
            } else if ( kc === KEY_UP || kc === this.#backwardKey ) {
                if ( kc === this.#backwardKey && (event.altKey || event.metaKey) ) {
                    return; // let the browser have this key
                }
                if ( target$.is( SEL_LOAD_MORE ) ) {
                    this.focus();
                    handled = true;
                } else {
                    let startedOnGroup = false;

                    // Current behavior is linear even if grid layout so up and backward are the same
                    // todo handle 2D grid nav
                    cur$ = this.#getCurrentItemOrRow();
                    // if a group header is currently focused start from the last item/row in previous group
                    if ( this.#groupIsContainer && cur$.is( this.groupSelector ) ) {
                        let selector = this.itemSelector;

                        startedOnGroup = true;
                        if ( this.#isGroupLayoutGrid ) {
                            cur$ = cur$.parent(); // get to the grid layout row
                            selector = this.groupSelector + " " + selector;
                        }
                        next$ = cur$.prev().find( selector ).last();
                        if ( this.#isLayoutGrid ) {
                            // want the row
                            next$ = next$.parent();
                        }
                    } else {
                        next$ = cur$.prevAll( SEL_VISIBLE ).first();
                    }
                    if ( next$.hasClass(C_GRID_SCROLL_FILLER) ) {
                        next$ = null;
                    }
                    // if there is no previous item and using nested groups go to the containing group
                    if ( this.#groupIsContainer && !startedOnGroup && !next$?.[0] ) {
                        next$ = cur$.closest( this.groupSelector );
                    }
                }
                if ( this.constrainNavigation ) {
                    // don't let selection happen or scrolling
                    handled = true;
                }
                if ( kc === KEY_UP ) {
                    event.stopPropagation(); // Don't let a containing tab or accordion act on Ctrl+Up
                }
            } else if ( kc === 65 && ( ( !isMac && event.ctrlKey ) || ( isMac && event.metaKey ) ) ) {
                // Ctrl+A or Command+A
                this.selectAll( null );
                handled = true;
            } else if ( event.which === KEY_SPACE ) {
                // ignore if on a button todo what elements to ignore?
                if ( ["INPUT", "BUTTON"].includes( event.target.nodeName ) ) {
                    return;
                }
                handled = true; // process space on keyup, don't want default scroll behavior
            }
            // todo page up/down

            if ( next$ && next$[0] ) {
                this.#navNext( next$, event );
                handled = true;
            }
            if ( handled ) {
                event.preventDefault();
            }
        }

        #handleKeyup( event ) {
            if ( event.isDefaultPrevented() || !this.supportsSelection() || this.#disabled  ) {
                return;
            }

            if ( event.which === KEY_SPACE ) {
                // ignore if on a button
                if ( event.target.nodeName === "BUTTON" ) {
                    return;
                }
                // item to select is the current item
                this.#select( this.getCurrentItem(), event, true, true );
                event.preventDefault();
            }
        }

        #handleFocusin( event ) {
            if ( this.supportsNavigation() && !this.#disabled ) {
                let target = event.target,
                    // treating a group like an item for the purpose of updating state classes
                    item$ = this.#getItemOrGroup( target );

                if ( item$[0] ) {
                    item$.addClass( C_FOCUSED );
                    this.#setTabbable( target );
                }
            }
        }

        #handleFocusout( event ) {
            if ( this.supportsNavigation() && !this.#disabled ) {
                let target = event.target,
                    // treating a group like an item for the purpose of updating state classes
                    item$ = this.#getItemOrGroup( target );

                if ( item$[0] ) {
                    item$.removeClass( C_FOCUSED );
                }
            }
        }

        // don't call directly go through #selNotifyDelay, #selNotifyLongDelay
        #selChangeNotify( notify, event ) {
            const cb = this.#cb;

            if ( cb.isValid() ) { // make sure the report has not been destroyed
                if ( this.selectionStateItem ) {
                    let item = apex.item( this.selectionStateItem );

                    if ( item.node ) {
                        let value,
                            values = this.getSelectedValues();

                        if ( !values ) {
                            value = "";
                        } else if ( cb.getModel ) {
                            let model = cb.getModel();

                            value = values.map( r => model.getRecordId( r ) ).join( ":" );
                        } else {
                            value = values.join( ":" );
                        }
                        item.setValue( value );
                    } else {
                        debug.warn( "Item not found ", this.selectionStateItem );
                    }
                }
                cb.updateStatus();
                if ( notify ) {
                    cb.selectionChanged( event );
                }
            }
        }

        #updateSelectAll() {
            let checked;

            if ( this.persistSelection ) {
                let selState = this.#cb.getModel().getSelectionState();

                checked = selState.selectAll;
            } else {
                let allItems$ = this.#getAllItems();

                // checking for more than zero items covers the case where all control breaks are collapsed
                checked = (allItems$.length > 0 && allItems$.length === allItems$.filter( SEL_SELECTED ).length);
            }
            // set all checked
            this.#allSelected = checked;
            if ( this.#selectAllControl$ ) {
                if ( this.#selectAllControl$.is( SEL_INPUT ) ) {
                    this.#selectAllControl$
                        .prop( "checked", checked );
                } else {
                    this.#selectAllControl$
                        .toggleClass( C_SELECTED, checked )
                        .attr( ARIA_CHECKED, checked ? TRUE : FALSE );
                }
            }
        }

        #removeTabStops( items$ ) {
            items$.add( items$.find( SEL_TABBABLE ) )
                .addClass( C_JS_TABBABLE )
                .attr( ATTR_TABINDEX, -1 );
        }

        /**
         * Make an item and contents of an item tabbable. This is what handles the roving tab stops.
         * Should only be called if supportsNavigation.
         * When an item is made tabbable all actionable content (e.g. buttons) in the
         * item is made a tab stop. Any previous item tab stops are removed.
         * @param el could be an item or some focusable element inside the item
         */
        #setTabbable( el ) {
            let newItem$,
                prevItem$ = this.getCurrentItem();

            this.#lastFocused = el;
            newItem$ = this.getCurrentItem();

            // if the current item has changed
            if ( newItem$[0] !== prevItem$[0] ) {
                // remove old tab stops
                this.#removeTabStops( prevItem$ );

                if ( !this.disabled ) {
                    // if it is a nested group only add tabstops for the group header
                    if ( this.#groupIsContainer && newItem$.is( this.groupSelector ) ) {
                        newItem$ = newItem$.children().first();
                    }
                    // add new tab stops
                    newItem$.add( newItem$.find( SEL_JS_TABBABLE ) )
                        .attr( ATTR_TABINDEX, 0 )
                        .removeClass( C_JS_TABBABLE );
                }

                setTimeout( () => {
                    this.#cb.currentItemChanged();
                }, 1 );
            }
        }

        /**
         * Return the first element in item$ that should be focused or the item itself.
         * If the focusable element uses the space key then it can cause problems for selection with the keyboard
         * because in some cases the SPACE key is used to select. Links are about the only interactive element
         * that doesn't use space.
         *
         * The only case where SPACE key is not used is single selection with selectionFollowsFocus true
         * (and can't unselect which is currently the only way) and when nav mode is focus
         *
         * todo think is an option needed to control if the item or something in it is focused?
         * @param item$
         * @returns {Element}
         */
        #getItemFocusable( item$ ) {
            /* Todo tentative change for accessibility
             * It was found that focusing a link inside the item caused AT to miss the selection state
             * Leave this code because we may still want to make this an option
            let selector = ":any-link";

            // is the space key not used for selection/navigation
            if ( this.itemNavigationMode === NAV_FOCUS ||
                ( this.supportsSelection() && !this.#multiple && this.selectionFollowsFocus ) ) {
                selector = ":focusable";
            }

            let el$ = item$.first().find( selector );
             */
            // is this really a group?
            if ( item$.is( this.groupSelector ) ) {
                const group$ = item$,
                    groupHeading$ = group$.children().first();

                return this.#groupIsContainer ? groupHeading$[0] : group$[0];
            } // else a normal item
            let el$ = item$.first().find( "input.u-selector" );

            if ( el$.length ) {
                return el$[0];
            } // else
            return item$[0];
        }

        /**
         * Copy selection to clipboard using dataTransferFormats
         *
         * @param pDataTransfer
         * @private
         */
        #copy( pDataTransfer ) {
            const cb = this.#cb,
                m = cb.getModel != null ? cb.getModel() : null,
                fmts = this.dataTransferFormats,
                out = util.htmlBuilder(),
                container$ = cb.getContainer(),
                selection$ = this.getSelection(), // jquery
                selectedValues = this.getSelectedValues(); // this is a superset of selection$

            if ( selectedValues.length ) {
                let selIndex = 0,
                    curSel$ = selection$.eq( selIndex );

                // begin
                fmts.forEach( x => {
                    x.writer.begin( container$, selection$, m, m ? selectedValues : null );
                } );

                /*
                 * Loop over the whole selection. The selectedValues (records) can, in some cases, be a superset of
                 * the selection$ elements. Need to match up the record and the item element and if there is
                 * no element then need to render the record so that the item element can be passed to the writer.
                 * i is the index into selectedValues and selIndex is index into selection$
                 */
                for ( let i = 0; i < selectedValues.length; i++ ) {
                    let item$, record, recordId, selId, meta, index,
                        clone = true;

                    if ( m ) {
                        record = selectedValues[i];
                        recordId = m.getRecordId( record );
                        selId = curSel$?.attr( DATA_ID );

                        if ( recordId && selId === recordId ) {
                            item$ = curSel$;
                        } else if ( selId ) {
                            meta = m.getRecordMetadata( selId );
                            if ( record === meta?.record ) {
                                item$ = curSel$;
                            } else {
                                meta = null;
                            }
                        }
                        if ( !item$ ) {
                            // the item is not in the DOM so render a temp item
                            if ( !meta && recordId ) {
                                meta = m.getRecordMetadata( recordId );
                            } else {
                                meta = {
                                    sel: true,
                                    record: record
                                };
                            }
                            index = i;
                            if ( meta?.index ) {
                                index = meta.index;
                            }
                            this.#cb.renderItem( out, record, index, recordId, meta );
                            item$ = $( out.toString() );
                            out.clear();
                            clone = false;
                        } else {
                            // found a matching item. move on to the next selection
                            curSel$ = null;
                            selIndex += 1;
                            if ( selIndex < selection$.length ) {
                                curSel$ = selection$.eq( selIndex );
                            }
                        }
                    } else {
                        // if there is no model, selection$ and selectedValues must be the same size
                        item$ = selection$.eq( selIndex );
                        selIndex += 1;
                    }

                    if ( this.clipboardValue ) {
                        item$ = this.clipboardValue( i, item$, m, record, recordId );
                        clone = true;
                    }
                    // Cleanup the DOM. Don't put code from the DOM onto the clipboard!
                    let elements,
                        clone$ = clone ? item$.clone() : item$;

                    clone$.find("script").remove();
                    elements = clone$[0].querySelectorAll( "*" );
                    for ( const element of elements ) {
                        for ( let attrName of element.getAttributeNames() ) {
                            attrName = attrName.toLowerCase();
                            if ( attrName.startsWith( "on" ) ) {
                                element.removeAttribute( attrName );
                            } else if ( attrName === "href" &&
                                /* eslint-disable-next-line no-script-url */
                                element.getAttribute( attrName ).toLowerCase().includes( "javascript:" ) ) {

                                element.setAttribute( attrName, "#" );
                            }
                        }
                    }
                    // item
                    fmts.forEach( function( x ) {
                        x.writer.item( i, clone$, record, recordId );
                    } );
                }

                // end
                fmts.forEach( x => {
                    x.writer.end();
                } );
            }
            // end
            fmts.forEach( x => {
                pDataTransfer.setData( x.format, x.writer.toString() );
            } );
        }

        /*
         * This is for unit testing only
         */
        _copy( pDataTransfer ) {
            this.#copy( pDataTransfer );
        }

        // event object is modified
        #navToReportStart( event ) {
            const cb = this.#cb;
            let next$,
                selector = this.#isLayoutGrid ? "[role='row']" : this.itemSelector;

            if ( cb.getPagination().scroll ) {
                // don't ever expect there to be a filler at the beginning
                cb.firstPage();
            }

            if ( this.#groupIsContainer ) {
                selector = this.#isGroupLayoutGrid ? "[role='row']" : this.groupSelector;
            }
            next$ = cb.getContainer().children( selector ).filter( SEL_VISIBLE ).first();

            if ( next$[0] ) {
                this.#navNext( next$, event );
            }
        }

        // event object is modified
        #navToReportEnd( event ) {
            const cb = this.#cb,
                finish = () => {
                    this.#navNext( next$, {
                        type:"keydown",
                        shiftKey: event.shiftKey,
                        ctrlKey: event.ctrlKey
                    } );
                },
                getContainer = () => {
                    let container$ = cb.getContainer();

                    if ( this.#groupIsContainer ) {
                        container$ = container$.find( this.groupSelector + " " + this.itemSelector ).last().parent();
                        if ( this.#isGroupLayoutGrid ) {
                            container$ = container$.parent();
                        }
                    }
                    return container$;
                };
            let next$,
                selector = this.#isLayoutGrid ? "[role='row']" : this.itemSelector;

            if ( cb.getPagination().scroll ) {
                cb.lastPage();
            }
            next$ = getContainer().children( SEL_VISIBLE ).last();
            // in the case of scroll paging there may not be any items at the end yet
            if ( next$.hasClass( C_GRID_SCROLL_FILLER) ) {
                next$ = null;
                // so wait for the page to load
                cb.waitForPageChange().then( () => {
                    next$ = getContainer().children( selector ).filter( SEL_VISIBLE ).last();
                    finish();
                } );
            } else {
                next$ = next$.filter( selector ).last();
                finish();
            }
        }

        #navNext( next$, event ) {
            const normalSelect = this.itemNavigationMode === NAV_SELECT && this.selectionFollowsFocus,
                selectWithShift = this.itemNavigationMode === NAV_SELECT &&
                    !this.selectionFollowsFocus && this.multiple;

            const selectOrFocus = () => {
                if ( normalSelect || ( selectWithShift && event.shiftKey ) ) {
                    this.#select( next$, event, true, true );
                } else {
                    this.#setFocus( this.#getItemFocusable( next$ ), event );
                }
            };

            if ( this.groupSelector ) {
                // if there are groups check if next$ is a group
                let group$ = next$;

                if ( this.#isGroupLayoutGrid && group$.attr( ATTR_ROLE ) === "row" ) {
                    group$ = group$.children().first();
                }
                if ( group$.is( this.groupSelector ) ) {
                    next$ = group$;
                    selectOrFocus();
                    return;
                }
            } // else not a group
            if ( this.#isLayoutGrid && next$.attr( ATTR_ROLE ) === "row" ) {
                next$ = next$.children().first();
            }
            selectOrFocus();
        }

        #setFocus( toFocus, event ) {
            if ( event?.type === "keydown" ) {
                let selector = this.itemSelector;

                if ( this.groupSelector ) {
                    selector += "," + this.groupSelector;
                }
                // This provides smoother scrolling when using keyboard. It avoids the default browser behavior
                // that moves the focused item to the center of the view port.
                toFocus.focus( {preventScroll: true} );

                let item,
                    item$ = $( toFocus ).closest( selector );

                if ( this.groupSelector && item$.is( this.groupSelector ) ) {
                    item$ = item$.children().first();
                }
                item = item$[0];
                if ( !item ) {
                    // toFocus may be in something other than an item
                    item = toFocus;
                }
                item.scrollIntoView( {block: "nearest"} );
            } else {
                $( toFocus ).trigger( FOCUS );
            }

        }
        /*
         * --- Static members
         */
        static NAV_MODES = nav_modes;
    }
    // --- End selection support ListViewSelection

    /**
     * @lends apex.widget
     */
    const widget = {
        /**
         * <p>Shows a wait popup. A wait popup consists of an overlay div that keeps the user from clicking on any part of the page
         * along with a visual "spinner" animation of some kind. It does not keep the user from interacting with the
         * page using the keyboard.</p>
         *
         * <p>This is intended to be used just prior to submitting the page such that the page (and hence this popup) will soon be
         * replaced with a new page. If you do need to close the popup, use the "remove" function of the returned object.
         * See {@link apex.util.showSpinner} and {@link apex.util.delayLinger} for a low level solution more suitable for ajax requests or
         * other long-running processes.</p>
         *
         * <p>This function is rarely needed because it is automatically called in {@link apex.page.submit} based on the
         * showWait option. Also typically ajax operations don't require an overlay to disable clicking.</p>
         *
         * @param {String} [pContent] HTML code for a wait indicator. If it is not provided, the default CSS animation
         *                            wait indicator will be displayed.
         * @return {Object} Object with a no argument function "remove" that closes the popup.
         * @example <caption>The following example shows a wait spinner and disables clicking on the page while some
         * long-running ajax action takes place and then removes the spinner when it is done.</caption>
         * var popup = apex.widget.waitPopup();
         * var promise = apex.server.process(...);
         * promise.always(function() {
         *     popup.remove();
         * });
         */
        waitPopup: function ( pContent ) {
            let lWaitPopup$,   // DOM for popup and wait overlay
                lPopup$,       // popup only
                lSpinner;      // spinner within wait overlay

            if ( pContent ) {
                lWaitPopup$ = $( '<div id="apex_wait_popup" class="apex_wait_popup"></div><div id="apex_wait_overlay" class="apex_wait_overlay"></div>' ).prependTo( 'body' );
                lPopup$ = lWaitPopup$.first();
                if ( pContent.indexOf( "<img" ) >= 0 ) {
                    lPopup$.hide();
                }
                // Typically if content is supplied then it will include an animated gif image. When the page is submitted right
                // after an image is inserted the browser may not actually bother to load it (why should it - the page is going away).
                // So we insert the content from a timer so that images will get loaded.
                window.setTimeout( function () {
                    lPopup$.html( pContent ).find( "img" ).hide()
                        .on( "load", function () {
                            $( this ).show();
                            lPopup$.show();
                        } );
                }, 10 );
            } else {
                lWaitPopup$ = $( '<div id="apex_wait_overlay" class="apex_wait_overlay"></div>' ).prependTo( "body" );
                window.setTimeout( function () {
                    // do this from a timer because in the fallback case where an image is used it needs to be done
                    // separate from the submit in order for the image to be shown
                    if ( lWaitPopup$ !== undefined ) {
                        lSpinner = apex.util.showSpinner();
                    }
                }, 10 );

                // it is probably already visible but just to make sure
                lWaitPopup$.css( "visibility", "visible" );
            }
            return {
                remove: function () {
                    if ( lSpinner !== undefined ) {
                        lSpinner.remove();
                    }
                    lWaitPopup$.remove();
                    lWaitPopup$ = undefined;
                }
            };
        }, // waitPopup

        /**
         * This function is a wrapper around {@link apex.item.create}. It is for backward compatibility.
         * See {@link apex.item.create} for details.
         * @deprecated
         */
        initPageItem: function ( pName, pOptions ) {
            apex.item.create( pName, pOptions );
        },

        /**
         * Allows to upload the content of a textarea as CLOB
         * Internal use only!
         * @ignore
         * @namespace
         */
        textareaClob: {
            _upload: function ( pItemName, pRequest, pValue ) {
                let p,
                    lArray = $s_Split( $v( pItemName ), 4000 );

                p = apex.server.widget( "apex_utility", {
                    p_flow_step_id: "0",
                    x04: "CLOB_CONTENT",
                    x05: "SET",
                    f01: lArray
                }, {
                    dataType: "text"
                } );
                p.done( function () {
                    $s( pItemName, pValue );
                    apex.submit( pRequest );
                } );
            },

            upload: function ( pItemName, pRequest ) {
                this._upload( pItemName, pRequest, "" );
            },

            uploadNonEmpty: function ( pItemName, pRequest ) {
                // test whether the item is empty or only contains whitespace. Submit
                // only when this is not the case. The item will be set to " " afterward.
                // NOT NULL validations will now succeed.
                if ( $v( pItemName ).replace( /\s/g, "" ).length === 0 || $v( pItemName ) === "" || $v( pItemName ) === "." ) {
                    // If no or only whitespace data, clear the item and submit
                    // NOT NULL validations will now fail.
                    $s( pItemName, "" );
                    apex.submit( pRequest );
                } else {
                    this._upload( pItemName, pRequest, "." );
                }
            }
        },

        /**
         * Used to add context menu support to a jQuery UI widget.
         *
         * @ignore
         * @mixin contextMenuMixin
         */
        contextMenuMixin: {
            options: {
                /**
                 * <p>A callback function that is called when it is time to display a context menu.
                 * <code class="prettyprint">function( event )</code> The function is responsible for showing the
                 * context menu. It is given the event that caused this callback to be called.</p>
                 *
                 * <p>In most cases it is simpler and more consistent to use the
                 * <code class="prettyprint">contextMenu</code> option.
                 * Only specify one of <code class="prettyprint">contextMenu</code>
                 * or <code class="prettyprint">contextMenuId</code> and
                 * <code class="prettyprint">contextMenuAction</code>.
                 * If none of <code class="prettyprint">contextMenu</code>, <code class="prettyprint">contextMenuId</code>
                 * or <code class="prettyprint">contextMenuAction</code> are specified there is no context menu.</p>
                 *
                 * @memberof contextMenuMixin
                 * @instance
                 * @type {function}
                 * @default null
                 * @example
                 *  function( event ) {
                 *     // do something to display a context menu
                 *  }
                 */
                contextMenuAction: null,

                /**
                 * <p>A {@link menu} widget options object use to create the context menu.</p>
                 * <p>Only specify one of <code class="prettyprint">contextMenu</code>
                 * or <code class="prettyprint">contextMenuId</code> and <code class="prettyprint">contextMenuAction</code>.
                 * If none of <code class="prettyprint">contextMenu</code>, <code class="prettyprint">contextMenuId</code>
                 * or <code class="prettyprint">contextMenuAction</code> are specified there is no context menu.</p>
                 *
                 * <p>This option cannot be set or changed after the widget is initialized.</p>
                 *
                 * @memberof contextMenuMixin
                 * @instance
                 * @type {object}
                 * @default null
                 * @example
                 * {
                 *     items:[
                 *         { type:"action", label: "Action 1", action: function() { alert("Action 1"); } },
                 *         { type:"action", label: "Action 2", action: function() { alert("Action 2"); } }
                 *     ]
                 * }
                 */
                contextMenu: null,

                /**
                 * <p>If option <code class="prettyprint">contextMenu</code> is given then this is the element id
                 * to give the context {@link menu} created.
                 * This allows other code to interact with the created context {@link menu} widget.</p>
                 *
                 * <p>If option <code class="prettyprint">contextMenu</code> is not given then this is the
                 * element id of an existing {@link menu} widget.</p>
                 *
                 * <p>This option cannot be set or changed after the widget is initialized.</p>
                 *
                 * @memberof contextMenuMixin
                 * @instance
                 * @type {?string}
                 * @default null
                 * @example "myContextMenu"
                 */
                contextMenuId: null
            },

            /**
             * Call from _create.
             * @param {string} contextSelector A selector to identify the closest element to the event target used to
             *              position the menu.
             * @param {function} ignoreFn Called during context menu event handling.
             *              ignoreFn( event ) -> boolean
             *              Return true if the given event should not result in a context menu opening.
             * @param {function} selectElementFn Called during context menu event handling.
             *              selectElementFn( event ) -> jQuery | bool
             *              Return the element to pass to the _select method if a selection is needed
             *              (typically when the context element is not selected) or true to open the context menu
             *              without changing the selection or false to not open the context menu.
             * @param {function} updateBeforeOpenArgFn Called just before the menu is open to augment the menu
             *              beforeOpen event ui argument.
             *              updateBeforeOpenArgFn( ui )
             *              Only applies when contextMenu or contextMenuId options are set.
             * @param {function} contextArgs Called before the menu is opened to add context arguments object for actions.
             *              contextArgs( ) -> object
             *              Only applies when contextMenu or contextMenuId options are set.
             * @protected
             */
            _initContextMenu: function ( contextSelector, ignoreFn, selectElementFn, updateBeforeOpenArgFn, contextArgs ) {
                let o = this.options,
                    self = this,
                    ctrl$ = this.element,
                    propName = this.widgetName,
                    name = cap( propName );

                if ( o.contextMenu || o.contextMenuId ) {
                    if ( $.apex.menu ) {
                        if ( o.contextMenu ) {
                            if ( o.contextMenu.menubar ) {
                                throw new Error( name + " contextMenu must not be a menubar" );
                            }
                            // augment the menu
                            o.contextMenu._originalBeforeOpen = o.contextMenu.beforeOpen;
                            o.contextMenu.beforeOpen = function ( event, ui ) {
                                ui.menuElement = self.contextMenu$;
                                ui[propName] = ctrl$;
                                if ( self.getSelection ) {
                                    ui.selection = self.getSelection();
                                }
                                if ( updateBeforeOpenArgFn ) {
                                    updateBeforeOpenArgFn( ui ); // todo change args to event, ui
                                }
                                if ( o.contextMenu._originalBeforeOpen ) {
                                    o.contextMenu._originalBeforeOpen( event, ui );
                                }
                            };
                            o.contextMenu._originalAfterClose = o.contextMenu.afterClose;
                            o.contextMenu.afterClose = function ( event, ui ) {
                                ui.menuElement = self.contextMenu$;
                                ui[propName] = ctrl$;
                                if ( o.contextMenu._originalAfterClose ) {
                                    o.contextMenu._originalAfterClose( event, ui );
                                }
                                if ( !ui.actionTookFocus ) {
                                    self.focus();
                                }
                            };
                            this.contextMenu$ = $( "<div style='display:none'></div>" ).appendTo( "body" );
                            if ( o.contextMenuId ) {
                                this.contextMenu$[0].id = o.contextMenuId;
                            }
                            this.contextMenu$.menu( o.contextMenu );
                        } else {
                            // must have only a contextMenuId so use that externally defined menu
                            this.contextMenu$ = $( "#" + o.contextMenuId );
                            if ( this.contextMenu$.length === 0 || !this.contextMenu$.is( ":apex-menu" ) ) {
                                throw new Error( name + " contextMenuId not found" );
                            }
                        }
                        if ( o.contextMenuAction ) {
                            debug.warn( name + " contextMenuAction option ignored when contextMenu option present" );
                        }
                        o.contextMenuAction = function ( event ) {
                            let x, y,
                                args = contextArgs ? contextArgs( event ) : null;

                            if ( event.type === "contextmenu" && event.button !== 0 ) {
                                x = event.pageX;
                                y = event.pageY;
                            } else {
                                let target$ = $( event.target ),
                                    pos = target$.offset();

                                x = pos.left;
                                y = pos.top + target$.closest( contextSelector ).outerHeight();
                            }
                            self.contextMenu$.menu( "toggle", x, y, args );
                        };
                    } else {
                        debug.warn( name + " contextMenu option ignored because menu widget not preset" );
                    }
                }

                function handleEvent( event ) {
                    let el$,
                        action = self.options.contextMenuAction;

                    if ( !action || ignoreFn( event ) ) {
                        return;
                    } // else
                    el$ = selectElementFn( event );
                    if ( el$ ) {
                        event.preventDefault();
                        if ( el$.length ) {
                            self._select( el$, null, true, false ); // force set selection
                        }
                        // give selection change handlers a chance to run before the action
                        setTimeout( () => {
                            action( event );
                        }, 10 );
                    }
                }

                let ignoreContextMenuEvent = false;

                this._on( {
                    keydown: event => {
                        // Some browsers turn Shift+F10 into a contextmenu event and some don't!
                        if ( event.shiftKey && event.which === KEY_F10 ) { // Shift+F10
                            event.preventDefault();
                            ignoreContextMenuEvent = true;
                            setTimeout( () => {
                                handleEvent( event );
                                ignoreContextMenuEvent = false;
                            }, 50 ); // 50 seems to be enough time to ignore the contextmenu event if there is one
                        }
                    },
                    contextmenu: event => {
                        if ( ignoreContextMenuEvent ) {
                            event.preventDefault(); // the menu will already be opened
                        } else {
                            handleEvent( event );
                        }
                    }
                } );

            },

            /**
             * Call from _destroy
             * @protected
             */
            _destroyContextMenu: function () {
                // remove the menu only if we created it
                if ( this.options.contextMenu && this.contextMenu$ ) {
                    this.contextMenu$.remove();
                }
            },

            /**
             * Call from _setOption before calling _super
             * @protected
             */
            _checkContextMenuOptions: function ( key /*, value */ ) {
                let o = this.options,
                    name = cap( this.widgetName );

                if ( key === "contextMenu" || key === "contextMenuId" ) {
                    throw new Error( name + " " + key + " cannot be set" );
                } else if ( key === "contextMenuAction" && ( o.contextMenu || o.contextMenuId ) ) {
                    throw new Error( name + " contextMenuAction cannot be set when the contextMenu or contextMenuId option is used" );
                }
            }
        },

        ListViewSelection: ListViewSelection,

        //
        // The following are utilities needed by widgets forked from jquery mobile
        //

        // Retrieve an attribute from an element and perform some massaging of the value
        getAttribute: getAttr,

        // to be mixed into a widget
        _getCreateOptions: function() {
            let elem = this.element[0],
                options = {};

            if ( !getAttr( elem, "defaults" ) ) {
                for ( const [optionName] of Object.entries( this.options ) ) {
                    let value = getAttr( elem, optionName.replace( rcapitals, replaceFunction ) );

                    if ( value != null ) {
                        options[optionName] = value;
                    }
                }
            }

            return options;
        }

    };

    return widget;

} )( apex.debug, apex.jQuery, apex.util );
