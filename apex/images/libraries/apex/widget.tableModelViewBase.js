/*!
 Copyright (c) 2015, 2024, Oracle and/or its affiliates.
*/
/**
 * @uiwidget tableModelViewBase
 * @abstract
 * @since 5.1
 *
 * @classdesc
 * <p>This is a base widget that supports pagination over a {@link model} as well as base support for model editing.
 * It is not intended to be used directly. The examples may use a specific derived widget such as grid or
 * a generic "derived-view". See the {@link grid} and {@link tableModelView} widgets.</p>
 *
 * <p>Any widget that uses column items to edit a model can benefit from the editing support in this base widget.
 * Even if this base widget isn't used similar logic should be implemented for initializing column items,
 * setting model values from the column items, setting column item values from the model, rendering read only
 * view of model field values, and triggering the {@link apex.event:apexbeginrecordedit} and
 * {@link apex.event:apexendrecordedit} events.</p>
 */
/* Todo:
 * - Control break rows don't count in the auto rows per page calculation and no way to know how many there will be so
 * end up with scroll bars. Consider if there is anyway to solve this. Meaning avoid nested scroll bars.
 *
 * Depends:
 *    jquery.ui.core.js
 *    jquery.ui.widget.js
 *    util.js
 *    lang.js
 *    debug.js
 *    model.js
 *    item.js
 *    tooltipManager.js
 *    widget.stickyWidget.js (only if stickyFooter or stickyTop is not false)
 */
/* About pagination:
 * Kinds of pagination:
 * 1) Page at a time (aka traditional)
 * 1.a) fetch markup (or data) from server for each page. This is not supported by this widget,
 *   which always uses a model.
 *   In theory if the model has paginationType set to "one" and the model and view have the same page size
 *   it would in effect be an example of 1.a.
 * 1.b) local client side model to fetch data as needed and keep data in the model. View shows just one page at a time
 *   Set pagination.scroll: false
 * With page at a time there are different options for controls to move among the pages and control how many
 * items are on a page. See options pagination.* and rowsPerPage.
 * The model option hasTotalRecords only controls if the total number of records/items is shown.
 * There are 2 kinds of scroll pagination.
 * 2) Add More Scroll (aka high-water-mark)
 * 2.a) Auto add more. As you scroll near to the end of the report more content is added automatically.
 *   Set pagination.scroll: true, model option hasTotalRecords: false
 *       pagination.loadMore: false
 * 2.b) Manual add more. At the bottom of the report is a "load more" button. User clicks the button to add
 *   more content.
 *   Set pagination.scroll: true, model option hasTotalRecords: false
 *       pagination.loadMore: true
 * TODO currently data is only added to the DOM never removed
 * Note it is possible to do add more scroll pagination without a model (see listview widget for an example)
 * but this base widget always uses a model.
 * 3) Virtual scrolling (aka true virtual scrolling)
 * Viewport always looks like it holds all the data even though not all records are rendered to the DOM.
 * 3.a) Add to DOM only
 * In this case empty filler content is added so that it looks like all the data is in the report
 * (you can see this by looking at the proportional scroll bar thumb size). As you scroll the fillers are replaced with
 * report data.
 *   Set pagination.scroll: true, model option hasTotalRecords: true
 * Note: Which kind of scroll pagination is used (2. add more or 3. virtual) depends on the model option hasTotalRecords.
 * Todo consider if a distinct pagination option is needed for this. It would allow the model to know the total records but
 * still do add more scrolling.
 * 3.b) Add and Remove
 * Like 3.a but as records are scrolled out of the viewport they are removed from the DOM (but not the model)
 * Todo implement this option
 * For this to work with selection the selection state must be kept in the model.
 * Note: twitter also does virtual scrolling (3.b) but uses a different technique. Rather than a filler item it puts
 * an ever growing min-height on item container and uses cssTransform on the items.
 * Todo consider that 2 and 3 are the same except that the total
 * Todo work this information into the tmvbase widget overview doc
 */
( function ( util, model, debug, lang, item, $ ) {
    "use strict";

    const C_DEFAULT_CLASS_PREFIX = "a-GV",
        C_GRID_NO_DATA = "noDataMsg",
        C_GRID_MORE_DATA = "moreDataMsg",
        C_GRID_ALT_MSG = "altMessage",
        C_GRID_ALT_MSG_TEXT = C_GRID_ALT_MSG + "-text",
        C_GRID_ALT_MSG_ICON = C_GRID_ALT_MSG + "-icon",
        C_GRID_FOOTER = "footer",
        C_GRID_HIDE_DELETED = "-hideDeleted",
        C_GRID_SCROLL_FILLER = "js-ScrollFiller",
        SEL_GRID_SCROLL_FILLER = "." + C_GRID_SCROLL_FILLER,
        C_LOAD_MORE = "loadMore",
        C_LOAD_MORE_BUTTON = "loadMoreButton",
        C_ACTIVE = "is-active",
        C_SELECTED = "is-selected",
        SEL_SELECTED = "." + C_SELECTED,
        SEL_AGGREGATE = ".is-aggregate",
        ARIA_LABELLEDBY = "aria-labelledby",
        ARIA_LABEL = "aria-label",
        ARIA_CURRENT = "aria-current",
        ARIA_CONTROLS = "aria-controls",
        ARIA_HIDDEN = "aria-hidden",
        C_JS_TABBABLE = "js-tabbable",
        SEL_JS_TABBABLE = "." + C_JS_TABBABLE,
        C_RANGE_DISPLAY = "js-rangeDisplay",
        SEL_RANGE_DISPLAY = "." + C_RANGE_DISPLAY,
        SEL_TABBABLE = ":tabbable",
        SEL_VISIBLE = ":visible",
        DATA_START = "data-start",
        DATA_END = "data-end",
        DATA_ID = "data-id",
        DATA_ROWNUM = "data-rownum",
        DATA_STATE = "data-state",
        DATA_PAGE = "data-page",
        ATTR_CLASS = "class",
        ATTR_DISABLED = "disabled",
        ATTR_ROLE = "role",
        REGION = "region",
        SEL_PAGE_CONTROLS = ".js-pg-prev,.js-pg-next,.js-pg-first,.js-pg-last",
        MSG_PREFIX = "APEX.GV.",
        TRUE = "true",
        FALSE = "false";

    const SCROLL_PAGE_CHECK = 300, // ms between check if paging needed
        INSERT_BEFORE = "before",
        INSERT_AFTER = "after",
        MIN_SCROLL_PAGE_SIZE = 20,
        VAR_HEIGHT_AUTO_PAGE_SIZE = 20,
        SAFE_DEFAULT_ROW_HEIGHT = 43; // nothing special about this number other than it is a reasonable size and not 0.

    /**
     * <p>This event is triggered when a {@link model} row/record is about to be edited (when a new row/record is
     * selected or enters edit mode).</p>
     *
     * @event apexbeginrecordedit
     * @memberof apex
     * @property {Event} event <code class="prettyprint">jQuery</code> event object.
     * @property {object} data Additional event data.
     * @property {model} data.model The {@link model} that is being edited.
     * @property {model.Record} data.record The record that is beginning to be edited.
     * @property {string} data.recordId The record id that is beginning to be edited.
     */
    /**
     * <p>This event is triggered when a {@link model} row/record is done being edited (when a new row/record is
     * selected or exits edit mode).</p>
     *
     * @event apexendrecordedit
     * @memberof apex
     * @property {Event} event <code class="prettyprint">jQuery</code> event object.
     * @property {object} data Additional event data.
     * @property {model} data.model The {@link model} that is being edited.
     * @property {model.Record} data.record The record that is done being edited.
     * @property {string} data.recordId The record id that is done being edited.
     */

    const EVENT_BEGIN_RECORD_EDIT = "apexbeginrecordedit",
        EVENT_END_RECORD_EDIT = "apexendrecordedit",
        EVENT_PAGE_CHANGE = "pageChange";

    const hasOwnProperty = util.hasOwnProperty,
        objectEntries = Object.entries,
        applyTemplate = util.applyTemplate,
        isArray = Array.isArray;

    const toInteger = ( numStr )  => {
        return parseInt( numStr, 10 );
    };

    // Because multiple widgets can share the same column items we use a cache to avoid having
    // to recreate the items multiple times. This assumes that item elements are not destroyed and recreated with the
    // same id. If they were the widgets using them would also need to be recreated.
    let gColumnItemCache = new Map();

    function getMessage( key ) {
        return lang.getMessage( MSG_PREFIX + key );
    }

    function formatMessage( key, ...args ) {
        return lang.formatMessage( MSG_PREFIX + key, ...args );
    }

    function formatMessageNoEscape( key, ...args ) {
        return lang.formatMessageNoEscape( MSG_PREFIX + key, ...args );
    }

    function pageBoundary( offset, pageSize ) {
        return Math.floor( offset / pageSize ) * pageSize;
    }

    function setFillerHeight( f$, start, end, recPerRow, rowHeight ) {
        let h = Math.ceil( ( end + 1 - start ) / recPerRow ) * rowHeight;
        f$.css( "height", h );
    }

    function getFullCSSClass( pClassSuffix, pOptions ) {
        const prefix = pOptions.cssClassPrefix || C_DEFAULT_CLASS_PREFIX;

        return util.escapeHTMLAttr( prefix + "-" + pClassSuffix );
    }

    function getFullCSSClassSel( pClass, pOption ) {
        return "." + getFullCSSClass( pClass, pOption );
    }

    function updateFillerHeights( dataContainer$, recPerRow, avgRowHeight ) {
        dataContainer$.find( SEL_GRID_SCROLL_FILLER ).each( function () {
            let f$ = $( this ),
                start = toInteger( f$.attr( DATA_START ) ),
                end = toInteger( f$.attr( DATA_END ) );

            setFillerHeight( f$, start, end, recPerRow, avgRowHeight );
        } );
    }

    // the filler rows need to be measurable so can't use show/hide i.e. display:none; Need to get their offset.
    function fillerVisible( filler$ ) {
        return filler$.css( "visibility" ) !== "collapse";
    }

    function toggleFillerVisible( filler$, show ) {
        filler$.css( "visibility", show ? "" : "collapse" ).toggleClass( "is-hidden", !show );
    }

    function modelHasTotalRecords( model ) {
        return model.getOption( "hasTotalRecords" );
    }

    $.widget( "apex.tableModelViewBase",
        /**
         * @lends tableModelViewBase.prototype
         */
        {
        widgetEventPrefix: "tableModelViewBase",
        options: {
            /**
             * <p>Identifier of model that this view widget will display data from. Can include an instance as well.
             * The model must already exist. This option is required. See {@link apex.model.create}
             * <code class="prettyprint">modelId</code> argument.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {model.ModelId}
             * @example [ "myModel", "1011" ]
             * @example "myModel"
             */
            modelName: null,
            /**
             * <p>Options object to pass to {@link apex.util.showSpinner}. The default depends on the
             * <code class="prettyprint">hasSize</code> option.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {object}
             * @default { fixed: !options.hasSize }
             * @example null
             * @example null
             */
            progressOptions: null,
            /**
             * <p>Text to display when there is no data.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default ""
             * @example "No employees found."
             * @example "No records found."
             */
            noDataMessage: "",
            /**
             * <p>The text message key to use for showing the number of selected items/records in the footer.
             * The message key must have exactly one parameter %0 which is replaced with the number of items/records
             * selected. It is often better to use {@link tableModelViewBase#entityTitleSingular} and
             * {@link tableModelViewBase#entityTitlePlural} rather than this option.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default "APEX.TMV.SELECTION_COUNT"
             * @example "MY_SELECTION_MESSAGE"
             * @example "MY_SELECTION_MESSAGE"
             */
            selectionStatusMessageKey: "APEX.TMV.SELECTION_COUNT",
            // todo consider a similar option to override APEX.GV.DELETED_COUNT
            /**
             * <p>This is the singular form of the entity that is the subject of the report.
             * This text is displayed in the total count message and in the selection count message.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {?string}
             * @default null
             * @example "Customer"
             * @example "Employee"
             */
            entityTitleSingular: null,
            /**
             * <p>This is the name of the singular form of the entity that is the subject of the report.
             * This text is displayed in the total count message and in the selection count message.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {?string}
             * @default null
             * @example "Customers"
             * @example "Employees"
             */
            entityTitlePlural: null,
            /**
             * <p>Prefix for the used CSS Classes. If null the original will be used.</p>
             *
             * @ignore
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default ""
             * @example "a-TMV"
             * @example "a-GV"
             */
            cssClassPrefix: "",
            /**
             * <p>Icon to display when there is no data. The icon is displayed above the
             * <code class="prettyprint">noDataMessage</code> text.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default "icon-irr-no-results"
             * @example "fa fa-warning"
             * @example "fa fa-warning"
             */
            noDataIcon: "icon-irr-no-results",
            /**
             * <p>Max records exceeded message to display if the server has more data than the configured maximum</p>
             * todo determine if this is needed and if so finish implementation
             * @ignore
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default ""
             */
            moreDataMessage: "",
            /**
             * <p>Determine if the view allows editing. If true the {@link model} must also allow editing but
             * if false the model could still allow editing.
             * If true the view data can be edited according to what the model allows. Only applies if the
             * view supports editing.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            editable: false,
            /**
             * <p>Specifies if a new record should be automatically added when the model doesn't contain any data.
             * If supported by the derived view a new record may be added when moving beyond the last record in the view
             * while editing.
             * Must only be true if the model and view are editable and the model allows adding records.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            autoAddRecord: false,
            /**
             * <p>Determine if deleted rows (records) are removed from the view right away or shown with a visual effect
             * to indicate they are going to be deleted. If true (and the view is editable) deleted records will not be visible,
             * otherwise they are visible but have a visual indication that they are deleted. The actual records are not
             * deleted on the server until the model is saved. The visual effect is determined by CSS rules and is
             * typically strike through. See also {@link apex.model.create}
             * <code class="prettyprint">onlyMarkForDelete</code> option.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            hideDeletedRows: false,
            /**
             * <p>This affects scrolling and how any header (if the view has a header) or footer position is handled.</p>
             *
             * <p>Set to true if the view is in a container that has a specific height defined. When hasSize is true
             * the record content will scroll within the bounds of the region.</p>
             * <p>Set to false if the view does not have a defined height. The view height will be as large as needed to
             * contain the view records as determined by pagination settings. The view may scroll within the browser
             * window. Other options may control if the header (if the view has a header) or footer sticks to the
             * window.
             * </p>
             * <p>The container width must always be defined.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             */
            // todo consider if/why the width must always be defined was this specific to grid?
            // todo consider that this option should not be changed or if it is need to do a re-render refresh
            // Used in resize logic and in figuring out the scroll parent. Also helps with busy spinner placement.
            // Grid needs it for frozen cols logic.
            // Dependent options: stickyTop, stickyFooter, scrollParentOverride
            hasSize: false,
            /**
             * <p>Determine if the view will include a footer to show status and pagination controls and information.
             * If true a footer is shown at the bottom of the view. If false no footer is shown.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default true
             * @example false
             * @example false
             */
            footer: true,
            /**
             * <p>Specify if all the rows will have the same height or variable heights.
             * </p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default true
             * @example false
             * @example false
             */
            fixedRowHeight: true,
            /**
             * <p>Text to display when a field/column value is null or empty string.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {string}
             * @default "-"
             * @example "- null -"
             * @example "- null -"
             */
            showNullAs: "-",
            /**
             * <p>Options to pass to the {@link apex.util.applyTemplate} function when processing any templates.
             * See {@link apex.util.applyTemplate} for details on the option properties.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {object}
             * @default {}
             * @example {
             *         // This example would enable you to use the placeholder #TODAY# in any templates.
             *         placeholders: { TODAY: (new Date()).toISOString() }
             *     }
             * @example {
             *     // This example would enable you to use the placeholder #TODAY# in any templates.
             *     placeholders: { TODAY: (new Date()).toISOString() }
             * }
             */
            applyTemplateOptions: {},
            /**
             * <p>Determine if the header will stick to the top of the page as it scrolls.</p>
             * <p>Only applies if {@link tableModelViewBase#hasSize} is false.
             * If false the header will not stick to the page.
             * If true or a function the header will stick to the top of the page using the
             * undocumented <code class="prettyprint">stickyWidget</code> widget.
             * If the value is a function then it is passed to the
             * <code class="prettyprint">stickyWidget</code> as the top option.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {(boolean|function)}
             * @default false
             * @example true
             * @example true
             */
            stickyTop: false,
            /**
             * <p>Determine if the footer will stick to the bottom of the page. Only applies if
             * <code class="prettyprint">hasSize</code> is false and
             * <code class="prettyprint">footer</code> is true.
             * If false the footer will not stick to the bottom of the page.
             * If true the footer will stick to the bottom of the page.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            stickyFooter: false,
            /**
             * <p>Hide the footer if there is no data. This only applies if
             * <code class="prettyprint">footer</code> is true.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            hideEmptyFooter: false,
            /**
             * <p>Pagination settings.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {object}
             * @property {boolean} scroll If true the scroll bar is used to page through the results a.k.a. infinite
             *   scrolling or virtual paging. If false then next and previous buttons are shown. This is
             *   'page at a time' or traditional pagination. Default is false.
             * @property {boolean} virtual Only applies if <code class="prettyprint">scroll</code> is true.
             *   If false new records are rendered and added to the DOM as the user scrolls to the bottom of
             *   the view. Records are never removed from the DOM. This is 'add more' (aka high-water-mark)
             *   scroll pagination.
             *   If true records can be removed from the DOM as the user scrolls and the records are no longer visible.
             *   If true and in addition <code class="prettyprint">loadMore</code> is false and the model knows the
             *   total number of records (model option <code class="prettyprint">hasTotalRecords</code> is true) then
             *   the view looks as if it contains all the records but only the records that are currently visible
             *   are rendered. This allows virtual scroll paging in both directions. This is 'virtual' scroll
             *   pagination (aka true virtual scrolling).
             *   In this case, if the view supports selection the {@link tableModelViewBase#persistSelection}
             *   option should be true so that selection state isn't lost when records are removed from the DOM.
             *   Default is false.
             * @property {boolean} loadMore If true show a load more button rather than auto paging.
             *   Only applies if <code class="prettyprint">scroll</code> is true. Default is false.
             * @property {boolean} showPageLinks If true show page links between buttons. Only applies if
             *   <code class="prettyprint">scroll</code> is false
             *   The model must know the total number of rows for this to be true. Default is false.
             * @property {number} maxLinks The maximum number of links to show when
             *   <code class="prettyprint">showPageLinks</code> is true. Default is 5.
             * @property {boolean} showPageSelector If true show a drop-down page selector between the buttons.
             *   Only applies if <code class="prettyprint">scroll</code> is false.
             *   The model must know the total number of rows for this to be true. Default is false.
             * @property {boolean} showRange If true the range of rows/records is shown. It is shown between the
             *   buttons unless <code class="prettyprint">showPageLinks</code> or
             *   <code class="prettyprint">showPageSelector</code> is true. The range is shown as "X to Y" if the
             *   model doesn't know the total rows and "X to Y of Z" if the model does know the total number of rows.
             *   Default is true.
             * @property {boolean} firstAndLastButtons Only applies if <code class="prettyprint">scroll</code> is false.
             *   If true first and last buttons are included. For this to be true the model must know the total number of rows.
             *   Default is false.
             * @property {boolean} hideSinglePage Hide the pagination controls when there is only one page of results.
             *   When true and there is just one page of results the pagination controls are hidden.
             *   When false the pagination controls are disabled when there is just one page.
             *   Pagination controls include the "first", "next", "previous", and "last" buttons when
             *   <code class="prettyprint">scroll</code> is false and "load more" button when
             *   <code class="prettyprint">scroll</code> and <code class="prettyprint">loadMore</code> are true.
             *   In addition, when true, if the page range typically shows X - Y of Z it will just show the
             *   total records when there is just one page.
             *   The default is false.
             * @example
             *     {
             *         showRange: true,
             *         showPageLinks: true,
             *         maxLinks: 6,
             *         firstAndLastButtons: true
             *     }
             *  @example {...}
             */
            pagination: {
                scroll: false,
                virtual: false,
                loadMore: false,
                showPageLinks: false,
                maxLinks: 5,
                showPageSelector: false,
                showRange: true,
                firstAndLastButtons: false,
                hideSinglePage: false
            },
            /**
             * <p>If true and the view supports selection, the selection state for each row or item will be saved as
             * record metadata in the model.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example jsinit(Interactive Grid [defaultGridViewOptions])
             *     {
             *         persistSelection: true
             *     }
             * @example jsinit(Interactive Grid [defaultDetailViewOptions])
             *     {
             *         persistSelection: true
             *     }
             * @example true
             */
            persistSelection: false,
            /**
             * <p>Controls what happens when the selection is incomplete. When selection state is saved in the model,
             * and because the model can fetch data on demand, it is possible to select records that are not yet
             * loaded into the model resulting in an incomplete selection. This can happen when selecting all
             * rows/items or when range selecting a large enough range.</p>
             * <p>Only applies if {@link tableModelViewBase#persistSelection} is true and with virtual pagination.
             * The value is one of: "always", "never", or "on-demand". The default is "on-demand".
             * When the selection is incomplete:</p>
             * <ul>
             *     <li>"always": start fetching all the model data as soon as there is an incomplete selection</li>
             *     <li>"never": do nothing</li>
             *     <li>"on-demand": display a link for the user to click to cause
             *     all the model data to be fetched. The footer must be displayed for the user to access the link.
             *     If the footer is turned off and showing the selection count externally the developer is
             *     responsible for providing a button (or link) to load the model data on demand by calling
             *     {@link tableModelViewBase#fetchAllData}. See also {@link tableModelViewBase#updateStatus}.</li>
             * </ul>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {boolean}
             * @default "on-demand"
             * @example "always"
             * @example jsinit(Interactive Grid [defaultGridViewOptions])
             *     {
             *         loadIncompleteSelection: "always"
             *     }
             * @example jsinit(Interactive Grid [defaultDetailViewOptions])
             *     {
             *         loadIncompleteSelection: "always"
             *     }
             * @example "always"
             */
            loadIncompleteSelection: "on-demand",
            /**
             * <p>Defines highlight color information for the view. Only applies to views that support highlighting.
             * Style rules are injected into the document based on the highlight object.</p>
             * <p>The object is a mapping of highlight id to color definition.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {object}
             * @property {object} * A highlight ID. A unique ID for the highlight rule. The object can contain
             *   any number of highlight rules. The {@link model} record or field <code class="prettyprint">highlight</code>
             *   metadata (see {@link model.RecordMetadata}) is used to associate the model data with the
             *   highlight rule. One of <code class="prettyprint">color</code> or
             *   <code class="prettyprint">background</code> must be given.
             * @property {number} *.seq A number that defines the order of the CSS rule that is added.
             * @property {boolean} *.row If true the highlight applies to the record/row.
             * @property {string} [*.color] The foreground color. If given, must be a valid CSS color value.
             * @property {string} [*.background] The background color. If given, must be a valid CSS color value.
             * @property {string} [*.cssClass] The class name for the rule. This is the class used in the rule and
             *   given to the appropriate element in the view so that the desired highlight colors are applied.
             *   The cssClass defaults to the highlight id prefixed with "hlr_" if row is true and  "hlc_" otherwise.
             * @example
             *     {
             *         "hlid0001": {
             *             seq: 1,
             *             row: true,
             *             color: "#FF7755"
             *         },
             *         ...
             *     }
             * @example {...}
             */
            highlights: {},
            /**
             * A function to call to post process cell/field or record output just prior to rendering to the DOM.
             * Only applies to cells/fields that have a template or a value. Derived views may apply this function
             * to a whole record rather than cell by cell.
             * function( context, value, [col])
             * currently internal use only
             * todo doc?
             * @ignore
             * @memberof tableModelViewBase
             * @instance
             * @type {?function}
             * @default null
             */
            highlighter: null,
            /**
             * A value to pass to the highlighter function. Typically an object.
             * currently internal use only
             * todo doc? todo consider make this an array of 1 so it doesn't get deep copied
             * @ignore
             * @memberof tableModelViewBase
             * @instance
             * @type {*}
             * @default null
             */
            highlighterContext: null,
            /**
             * <p>Determine how many records to show in one page.
             * Only applies if <code class="prettyprint">pagination.scroll</code> is false or
             * <code class="prettyprint">pagination.loadMore</code> and
             * <code class="prettyprint">pagination.scroll</code> are both true,
             * otherwise this value is ignored.
             * </p>
             * <p>Note the name of this option is a little confusing because some views put more than one
             * record on the same visual row. This value is the number of records (or items) shown on a page.
             * For example if <code class="prettyprint">rowsPerPage</code> is 10 and the view shows
             * two records per row then there will be a total of 5 rows showing 10 records.
             * </p>
             * <p>For traditional pagination this is the number of records to show in a report page.
             * For load more pagination this is the number of records to add to the report.
             * If null, the number of records is determined by the viewport height and the average row/item height.
             * This works best if all the rows/items have the same fixed height.
             * </p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {?number}
             * @default null
             * @example 50
             * @example 50
             */
            rowsPerPage: null,
            /**
             * Experimental; to be used for UT maximize region
             * Only applies if hasSize is false.
             * Optional setting for scrollParent$ rather than window.
             * @ignore
             * @memberof tableModelViewBase
             * @instance
             * @type {Element}
             * @default null
             */
            scrollParentOverride: null,
            /**
             * <p>A callback function that will handle display of report status information such as the count
             * of selected items/rows. The function receives an object with properties:</p>
             * <ul>
             *     <li>deletedCount: The number of deleted records if option
             *         <code class="prettyprint">hideDeletedRows</code> is true
             *         and null otherwise.</li>
             *     <li>selectedCount: The number of selected records</li>
             *     <li>total: The total number of records if model option
             *         <code class="prettyprint">hasTotalRecords</code> is true and null otherwise.</li>
             *     <li>incomplete: True if the selection is incomplete and false otherwise.
             *         The selection is incomplete if the view has selected more records than the
             *         model currently has loaded. See option {@Link tableModelViewBase#loadIncompleteSelection}.</li>
             * </ul>
             * <p>Use this callback to display the selected record count in a custom location in the page.
             * This is most useful when the report footer is not shown {@link tableModelViewBase#footer} is false.</p>
             *
             * @memberof tableModelViewBase
             * @instance
             * @type {function}
             * @default null
             * @example function( status ) {
             *         let message = "",
             *             el$ = $( "#selectionCount" ) // the element to display the count in
             *
             *         if ( status.selectedCount > 0 ) {
             *             message = `${status.selectedCount} things selected`;
             *         }
             *         el$.text( message );
             *     }
             */
            updateStatus: null
        },

        //
        // Public pagination methods
        //

        /**
         * <p>Display the first page of records. If option <code class="prettyprint">pagination.scroll</code>
         * is true simply scrolls to the top of the viewport
         * and a new page of records is added if needed. If <code class="prettyprint">pagination.scroll</code>
         * is false and not already on the first page the view is refreshed and shows the first page.</p>
         *
         * @return {boolean} true for success, false if a page is currently being rendered.
         * @example <caption>This example goes to the first page.</caption>
         * $( ".selector" ).grid( "firstPage" );
         */
        firstPage: function() {
            let sp$;

            if ( this.renderInProgress ) {
                return false;
            } // else
            if ( this.options.pagination.scroll ) {
                sp$ = this.scrollParent$;
                sp$.scrollTop( this.scrollDelta );
            } else {
                if ( this.pageOffset > 0 ) {
                    this.pageOffset = 0;
                    this.refresh( false );
                }
            }
            return true;
        },

        /**
         * <p>Display the previous page of records. If <code class="prettyprint">pagination.scroll</code>
         * is true the viewport scrolls up one page and
         * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
         * is false and not on the first page refresh the view to show the previous page.</p>
         *
         * @return {boolean} true for success, false if a page is currently being rendered.
         * @example <caption>This example goes to the previous page.</caption>
         * $( ".selector" ).grid( "previousPage" );
         */
        previousPage: function() {
            let sp$, st;

            if ( this.renderInProgress ) {
                return false;
            } // else
            if ( this.options.pagination.scroll ) {
                sp$ = this.scrollParent$;
                st = sp$.scrollTop() - this.scrollDelta - this.viewportHeight;
                if ( st < 0 ) {
                    st = 0;
                }
                sp$.scrollTop( st + this.scrollDelta );
            } else {
                if ( this.pageOffset > 0 ) {
                    this.pageOffset -= this.pageSize;
                    if ( this.pageOffset < 0 ) {
                        this.pageOffset = 0;
                    }
                    this.refresh( false );
                }
            }
            return true;
        },

        /**
         * <p>Display the next page of records. If <code class="prettyprint">pagination.scroll</code>
         * is true the viewport scrolls down one page and
         * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
         * is false and not on the last page refresh the view to show the next page.</p>
         *
         * @return {boolean} true for success, false if a page is currently being rendered.
         * @example <caption>This example goes to the next page.</caption>
         * $( ".selector" ).grid( "nextPage" );
         */
        nextPage: function() {
            let sp$, max, st, total;

            if ( this.renderInProgress ) {
                return false;
            } // else
            if ( this.options.pagination.scroll ) {
                sp$ = this.scrollParent$;
                max = this._getDataContainer().height() - this.viewportHeight;
                st = sp$.scrollTop() - this.scrollDelta + this.viewportHeight;
                if ( st > max ) {
                    st = max;
                }
                sp$.scrollTop( st + this.scrollDelta );
            } else {
                total = this.model.getTotalRecords();
                if ( total < 0 || this.pageOffset + this.pageCount < total ) { // page size can change so use pageCount to check bounds
                    this.pageOffset += this.pageSize; // ok to use pageSize here; page boundary is forced in _addPageOfRecords
                    this.refresh( false );
                }
            }
            return true;
        },

        /**
         * <p>Display the last page of records. If <code class="prettyprint">pagination.scroll</code>
         * is true simply scrolls to the bottom of the viewport
         * and a new page of records is added if needed. If <code class="prettyprint">pagination.scroll</code>
         * is false and not already on the last page the view is refreshed and shows the last page.
         * This method only works correctly if the model knows the total number of rows.</p>
         *
         * @return {boolean} true for success, false if a page is currently being rendered.
         * @example <caption>This example goes to the last page.</caption>
         * $( ".selector" ).grid( "lastPage" );
         */
        lastPage: function() {
            let totalPages, sp$, max, total;

            if ( this.renderInProgress ) {
                return false;
            } // else
            if ( this.options.pagination.scroll ) {
                sp$ = this.scrollParent$;
                max = this._getDataContainer().height() - this.viewportHeight;
                sp$.scrollTop( max + this.scrollDelta );
            } else {
                total = this.model.getTotalRecords();
                if ( total > 0 && this.pageOffset + this.pageCount < total ) {
                    totalPages = Math.ceil( total / this.pageSize );
                    this.pageOffset = ( totalPages - 1 ) * this.pageSize;
                    this.refresh( false );
                }
            }
            return true;
        },

        /**
         * <p>Load more records into the view. If option <code class="prettyprint">pagination.scroll</code>
         * is true this adds a new page of records to the end.
         * If <code class="prettyprint">pagination.scroll</code> is false this is the same as <code class="prettyprint">nextPage</code>.
         * This is intended to be used when <code class="prettyprint">pagination.loadMore</code> is true.</p>
         *
         * @return {boolean} true for success, false if a page is currently being rendered.
         */
        loadMore: function() {
            if ( this.options.pagination.scroll && !this._scrollHandler ) {
                return this._addNextPage();
            } else {
                return this.nextPage();
            }
        },

        /**
         * <p>Fetch all report data into the view's model. This is mostly a
         * simple wrapper around the {@link model#fetchAll} method that doesn't
         * provide access to the callback function and therefore there is no way to be notified when all the
         * data is fetched. This method keeps the selection state up to date.</p>
         * <p>If you need notification use the model <code class="prettyprint">fetchAll</code> method.
         * </p>
         * @param {boolean} [pShowProgress] If true show progress while fetching the data. The default is true.
         */
        fetchAllData: function( pShowProgress = true ) {
            if ( this.fetchAllDataActive ) {
                return;
            } // else
            let originalCount,
                checkSelection = this.options.persistSelection && modelHasTotalRecords( this.model );

            if ( checkSelection ) {
                originalCount = this._selectedCount();
            }
            this.fetchAllDataActive = true;
            this.model.fetchAll( data => {
                this._updateStatus();
                if ( data.done ) {
                    // fetchAllData is often called because the selection kept in the model is incomplete
                    // the selection state may have changed after fetchAll but only the derived view would know
                    // or know what to do about it.
                    if ( checkSelection ) {
                        this._checkSelectionChange( originalCount );
                    }
                    this.fetchAllDataActive = false;
                }
            }, !pShowProgress );
        },

        /**
         * <p>An object with properties that describe the current pagination state.</p>
         *
         * @typedef tableModelViewBase.pageInfo
         * @type {object}
         *
         * @property {number} rowHeight The height of a view row. Some views show multiple records per view row.
         *   If records have variable heights
         *   (option {@link tableModelViewBase#fixedRowHeight} is false) then this is a running approximate
         *   average based on the rows currently rendered to the DOM.
         * @property {number} recordsPerRow The number of records displayed in a view row.
         * @property {number} firstOffset The 1 based offset of the first record in the page for 'page at a time' pagination.
         * @property {number} lastOffset The 1 based offset of the last record in the page for 'page at a time' pagination.
         * @property {number} pageSize The number of records requested from the model and rendered at a time.
         *   For 'page at a time' pagination this is the number of records shown in a full report page and depends on
         *   option {@link tableModelViewBase#rowsPerPage}.
         * @property {number} pageOffset The 0 based offset of the page most recently retrieved from the model.
         *   For 'page at a time' pagination this is the current page.
         * @property {number} [total] The number of records in the report. Only present if the model
         *   knows the total number of records (model option <code class="prettyprint">hasTotalRecords</code> is true).
         * @property {number} [scrollOffset] This is the viewport scroll offset in pixels.
         *   Only present for scroll pagination.
         * @property {number} [viewOffset] The 0 based offset of the first record in the vieport.
         *   Only present for scroll pagination.
         * @property {number} [currentPage] The 0 based current page number. Only present for 'page at a time' pagination.
         * @property {number} [totalPages] The total number of pages. Only present for 'page at a time' pagination and
         *   when the model knows the total number of records (model option <code class="prettyprint">hasTotalRecords</code>
         *   is true).
         */

        /**
         * <p>Return information about the current pagination state of the view.
         * Returns null if there is no data in the report.</p>
         *
         * @return {?tableModelViewBase.pageInfo}
         */
        getPageInfo: function() {
            let result = null,
                hasTotalRecords = modelHasTotalRecords( this.model ),
                pagination = this.options.pagination,
                total = this.model.getTotalRecords(),
                serverTotal = this.model.getServerTotalRecords();

            if ( !this.noData ) {
                result = {
                    rowHeight: this.avgRowHeight, // with variable height items/records this will be a rough average
                    recordsPerRow: this._getRecordsPerRow(), // assumes all (but possibly last) rows have same number of records
                    firstOffset: this.pageFirstOffset || null,
                    lastOffset: this.pageLastOffset || null,
                    pageSize: this.pageSize, // how many records get rendered at a time
                    pageOffset: this.pageOffset // offset of last page of records fetched
                };
                if ( hasTotalRecords ) {
                    result.total = serverTotal;
                }
                if ( pagination.scroll ) {
                    const dataContainer$ = this._getDataContainer(),
                        spIsWindow = this.scrollParent$[0] === window,
                        isTable = dataContainer$[0].nodeName === "TBODY",
                        isLayoutGrid = dataContainer$.attr( ATTR_ROLE ) === "grid",
                        hasNestedControlBreaks = this._hasNestedControlBreaks();
                    let index, item$, items$, itemSelector;

                    if ( hasNestedControlBreaks ) {
                        // find the items in the groups
                        itemSelector = this._controlBreakSelector() + " " + this._itemSelector();
                        items$ = dataContainer$.find( itemSelector );
                    } else {
                        items$ = dataContainer$.children();
                    }
                    items$ = items$.not( SEL_AGGREGATE ); // todo make it clear that this is a requirement for aggregate items
                                                          //  what to do about layout grid? require is-aggregate on row element?

                    result.scrollOffset = this.scrollParent$.scrollTop();
                    index = util.binarySearch( items$, result.scrollOffset, ( a, b ) => {
                        let el$ = $(b),
                            curOffset = spIsWindow ? el$.offset().top : el$.position().top;

                        if ( !( spIsWindow || isTable ||
                            el$.offsetParent().closest( this.scrollParent$ ).length > 0 ) ) {
                            curOffset += result.scrollOffset;
                        }
                        return a - curOffset;
                    } );
                    item$ = items$.eq( index );
                    if ( isLayoutGrid ) {
                        // the item is role=row and should have only one child role=gridcell
                        item$ = item$.children().first();
                    }
                    result.viewOffset = toInteger( item$.attr( DATA_ROWNUM ) ) - 1;
                } else {
                    result.currentPage = Math.floor( this.pageOffset / this.pageSize );
                    if ( total >= 0 ) {
                        result.totalPages = Math.ceil( total / this.pageSize );
                    }
                }
            }
            return result;
        },

        /**
         * <p>Go to the specified page number. This should only be used when
         * <code class="prettyprint">pagination.scroll</code> is false and the model knows the total number of records.</p>
         *
         * @param {number} pPageNumber zero based page number
         * @return {boolean} true for success, false if a page is currently being rendered.
         */
        gotoPage: function( pPageNumber ) {
            let totalPages,
                total = this.model.getTotalRecords();

            if ( this.renderInProgress ) {
                return false;
            } // else
            if ( total > 0 ) {
                totalPages = Math.ceil( total / this.pageSize );
                if ( pPageNumber >= 0 && pPageNumber < totalPages ) {
                    this.pageOffset = pPageNumber * this.pageSize;
                    this.refresh( false );
                }
            }
            return true;
        },

        //
        // Public methods
        //

        /**
         * <p>Returns the identity of the active record or null if there is no active record.
         * The active record is the one currently being edited.</p>
         *
         * @return {string} Active record id.
         */
        getActiveRecordId: function() {
            return this.activeRecordId;
        },

        /**
         * <p>Returns the active record or null if there is no active record.
         * The active record is the one currently being edited.</p>
         *
         * @return {model.Record} Active record.
         */
        getActiveRecord: function() {
            return this.activeRecord;
        },

        /**
         * <p>Return the model currently being used by this view.
         * The model can change over time so the returned model should not be saved and used later.
         * If you need to store a reference to the model use {@link apex.model.get} and release it with
         * {@link apex.model.release}.
         * </p>
         * @returns {model} The current {@link model}.
         */
        getModel: function() {
            return this.model;
        },

        /**
         * <p>Use after a column item value is set without triggering a change event to update the model and grid view.
         * Has no effect if there is no active record.</p>
         * <p>When a dynamic action or other event handler on a change event updates the value of the same item that
         * triggered the change event, the change event from setting the value should be suppressed to avoid
         * an infinite loop. However the model is only updated from a change event. This method offers a solution
         * to the model not being updated if the value is set asynchronously.
         * Call this method anytime a column item is updated and the change event is suppressed.</p>
         * @param {string} pColumn The name of the column.
         * @example <caption>This example updates the "SALARY" column, which has static id "C_SALARY", in
         * interactive grid with static id "MyGrid", to add 10 to whatever the user enters.
         * <code class="prettyprint">setTimeout</code> is used to simulate an async value update.
         * The active row must be locked around the async update.</caption>
         * var salary = apex.item( "C_SALARY" );
         * $( salary.node ).change( function( event ) {
         *     // assume the current view is grid and not single row view.
         *     var grid$ = apex.region( "MyGrid" ).call( "getCurrentView" ).view$;
         *     grid$.grid("lockActive");
         *     setTimeout( function() {
         *         // suppress this change otherwise this handler will be triggered again
         *         salary.setValue( parseFloat( salary.getValue() ) + 10, null, true );
         *         // suppressing the value means the grid model is not updated so call setActiveRecordValue
         *         grid$.grid( "setActiveRecordValue", "SALARY" )
         *             .grid( "unlockActive" );
         *     }, 10 ):
         * } );
         */
        setActiveRecordValue: function( pColumn ) {
            const ci = this.columnItems[pColumn];

            if ( this.activeRecord && ci ) {
                this.ignoreItemChange = true;
                this._setModelValue( null, ci.item, this.activeRecord, pColumn, true );
                this.ignoreItemChange = false;
            }
        },

        /**
         * <p>Call to lock the active row while async processing is in progress.</p>
         *
         * <p>The view edits one row/record at a time. This is known as the active row. In edit mode as the user changes
         * the focused cell with the mouse, tab or enter keys if the new cell is on a different row the previous row
         * is deactivated and the new row is activated. Any dynamic actions or other code that manipulates Column items
         * are acting on the active row. If any actions are asynchronous such as using Ajax to set a column item value
         * then the row must not be deactivated while the async action is in progress otherwise the result would be applied
         * to the wrong row!</p>
         *
         * <p>So this method must be called before starting an async operation. It can be called multiple times if there are
         * multiple async operations. For each call to <code class="prettyprint">lockActive</code>
         * there must be exactly one call to <code class="prettyprint">unlockActive</code>. See also
         * See {@link tableModelViewBase#unlockActive}</p>
         *
         * <p>If the view is part of an APEX region plugin, that region should implement the
         * <code class="prettyprint">beforeAsync</code> and <code class="prettyprint">afterAsync</code>
         * functions on the object returned from {@link region#getSessionState} by calling
         * <code class="prettyprint">lockActive</code> and <code class="prettyprint">unlockActive</code>
         * respectively. Then if an appropriate target option is passed to {@Link apex.server.plugin} then the locking
         * will be done automatically. Dynamic Actions that act on column items pass the correct target option.
         * The bottom line is that for Dynamic Actions on columns of an Interactive Grid these lock/unlock methods are
         * called automatically.</p>
         * @example <caption>See {@link grid#setActiveRecordValue} for an example.</caption>
         */
        lockActive: function() {
            if ( this.activeRecord ) {
                this.activeLockCount += 1;
            }
        },

        /**
         * <p>Call to unlock the active row after async processing is complete.</p>
         * <p>Call after the async operation completes. See {@link tableModelViewBase#lockActive} for more information.
         * @example <caption>See {@link grid#setActiveRecordValue} for an example.</caption>
         */
        unlockActive: function() {
            if ( this.activeRecord ) {
                this.activeLockCount -= 1;
                // just in case don't let it go negative
                if ( this.activeLockCount < 0 ) {
                    this.activeLockCount = 0;
                }
                if ( this.activeLockCount === 0 ) {
                    if ( this.activeUnlockCallback ) {
                        this.activeUnlockCallback();
                        this.activeUnlockCallback = null;
                    }
                    if ( this.finishEditingCallback ) {
                        this.finishEditingCallback();
                        this.finishEditingCallback = null;
                    }
                }
            }
        },

        /**
         * <p>This method makes sure that the model is up to date with all current edits.
         * While the active row is being edited it may at times be out of sync with the model.</p>
         * <p>Any code that wants to interact with the model should call this method
         * to make sure the view and model are in sync and then interact with the model
         * when the returned promise is resolved. You must still check for changes in the model.
         * Just because the promise is resolved doesn't mean there were or are any changes.</p>
         * <p>Note: This does not affect any edit mode.</p>
         * @returns {Promise} A promise that is resolved when the model has been synchronized with the view.
         * @example <caption>The following function saves the grid view model for the Interactive Grid region
         * given by static id <code>igRegion</code>. This shows how <code>finishEditing</code> is used but it is
         * generally much better to use the built-in Interactive Grid "save" action.</caption>
         * function doSave( igRegion ) {
         *     var p, finished,
         *         grid = apex.region( igRegion ).call( "getViews" ).grid;
         *
         *     finished = grid.view$.grid( "finishEditing" );
         *     finished.done( function() {
         *         // now the model has all the current changes from the view
         *         p = apex.model.save( null, null, grid.modelName, true );
         *         p.done( function( data ) {
         *             // do something after save completes
         *         } );
         *     } );
         * }
         */
        finishEditing: function() {
            const self = this,
                deferred = $.Deferred();

            function finish() {
                if ( self._finishEditing ) {
                    self._finishEditing( deferred );
                } else {
                    deferred.resolve();
                }
            }

            if ( this.activeLockCount > 0 ) {
                this.finishEditingCallback = finish;
            } else {
                finish();
            }
            return deferred.promise();
        },

        addStateIcon: function( pStateName, pIconClass, pMessage ) {
            const out = util.htmlBuilder();

            this.stateIconMessages[pStateName] = pMessage;
            if ( this._findStateIcon( pStateName ).length === 0 ) {
                out.markup( "<span role='img'" )
                    .attr( ATTR_CLASS, pIconClass )
                    .attr( DATA_STATE, pStateName )
                    .attr( ARIA_LABEL, pMessage ? pMessage : pStateName )
                    .markup( "></span>");
                this.stateIcons$.append( out.toString() );
            }
        },

        removeStateIcon: function( pStateName ) {
            this._findStateIcon( pStateName ).remove();
            delete this.stateIconMessages[pStateName];
        },

        //
        // Methods for derived views to call
        //

        _create: function() {
            const o = this.options;

            if ( o.hideDeletedRows ) {
                this.element.addClass( getFullCSSClass( C_GRID_HIDE_DELETED, o ) );
            }

            // ** Model and data related
            // this.modelName The name of the model used by this view instance. Given to _initModel.
            // this.model The model used by this view instance set in _initModel.
            // this.modelViewId The model viewId returned by model.subscribe, set in _initModel.
            this.noData = true; // true when the view has no data because the model has no data, false otherwise
            // this.noData$ the element containing the no data message. See options noDataMessage, noDataIcon
            this.pendingRefresh = null; // used for lazy rendering; don't refresh if invisible
            this.renderInProgress = false;
            this._refreshNeeded = false; // used by modelChangeHandler

            // ** Pagination related
            this.pageOffset = 0; // The model offset of the first record in the current page for traditional pagination.
                // The offset of the next page of records to get from the model.
                // init to 0 when model name changes or model reset notification, and also for scroll pagination in _initPagination
                // pageOffset and pageCount generally set to 0 at the same time
                // used by all the pagination APIs such as nextPage and by _scrollPage
                // used to update pagination footer
            this.highWaterMark = 0; // the offset of the last most rendered record
            this.pageCount = 0; // The number of records displayed in the current page for traditional pagination.
                // cleared along with pageOffset. Set after addPageOfRecords finishes.
                // used to update pagination footer
            this.totalRenderedRecords = 0; // Tracks the number of records currently rendered. Doesn't include control breaks.
            this.pageSize = 10; // How many records in a page for traditional paging
                // and also how any records to request from the model. Used by nextPage, previousPage, gotoPage etc.
                // and determines what the current page is and total pages.
                // this can change over time either by setting the rowsPerPage option (if not scroll paging) or by resize
                // set in _create from rowsPerPage (only if rowsPerPage is set and it is cleared if pagination.scroll)
                // in _initPageSize if not set set to: o.pagination.scroll ? Math.max( 40, 2 * pageSize ) : pageSize;
                // used in _addPageOfRecords for how much to get from model
                // used to calculate a page boundary
                // used to update the pagination footer data (_updateTotalRecords)
            this.onLastPage = false; // true when on the last page. Can be used by derived views.
            // this.scrollParent$ Either value passed into _updateScrollHandler, o.scrollParentOverride, or window.
                // Set in _updateScrollHandler.
                // Used in pagination methods like nextPage etc. when scroll paging,
                // in _initPageSize to get the viewport height
                // in _updateScrollHandler
                // in _scrollPage for scroll pagination
                // in _updateTotalRecords to restore scroll offsets
            // this.scrollDelta Used when setting scrollTop to account for full page scrolling case. Set in _updateScrollHandler
            this.lastScrollLeft = null; // used to preserve scroll offsets
            this.lastScrollTop = null; // used to preserve scroll offsets
            // this.pageFirstOffset Server offset of first record in page. Used to display the page range in footer.
            // this.pageLastOffset Server offset of last record in page. Used to display the page range in footer.
            // this.avgRowHeight The running average row height. If option fixedRowHeight is true then this
                // is the fixed row height.
            // this.viewportHeight Viewport height adjusted to be a multiple of avg row height.
                // set in _initPageSize and used by pagination APIs such as nextPage when scroll paging
            this.scrollPageTimer = null; // Used to delay/debounce scroll pagination processing. See _scrollPage
            this.hasScrollFillers = false; // true when fillers are used in virtual scrolling
            // this.controlBreakCollapsed Coordinate collapsed control break behavior between addPageOfRecords and
                // derived view.
            this._scrollHandler = null; // Handler function stored here so it can be turned off easily.
                // Set in _updateScrollHandler, turned off and cleared in _scrollPage.

            // ** footer related
            this.stateIconMessages = {};
            // this.footer$ Footer element. Set in _initPagination
            // this.pageRange$ Page range element within the footer. Set in _initPagination, used in _updateTotalRecords.
            // this.pageSelector$ Page selector element within the footer. Set in _initPagination, used in _updateTotalRecords.
            // this.status$ Status element within footer. Set in _initPagination, used in _updateStatus.
            // stateIcons$ State icon element within footer. Set in _initPagination, see add/removeStateIcon
            // pageKey Used by pagination.showPageLinks, showPageSelector to know when to update the page selector UI.
            this.prevSelCount = 0; // used to track selection changes when inserting data

            // ** Editing related
            this.ignoreFieldChange = null; // name of field/prop being set by the UI while it is being set, null otherwise
            this.reinitCallbacks = null;
            this.activeRecord = null; // tracks the record currently being edited
            this.activeRecordId = null; // tracks the record currently being edited
            this.activeLockCount = 0; // managed by [un]lockActive; if there are async operations pending this is > 0
            this.activeUnlockCallback = null; // function to call once lock count goes back to zero. Just one thing not a queue
            this.columnItems = null; // map from field property to column item (element and item) that edits the field
            this.columnItemsContainer$ = null; // container of all the column items for this record view

            if ( !o.progressOptions ) {
                o.progressOptions = { fixed: !o.hasSize };
            }

            if ( o.pagination.scroll && !o.pagination.loadMore ) {
                o.rowsPerPage = null;
            }
            if ( o.rowsPerPage ) {
                this.pageSize = o.rowsPerPage;
            }
            this._setOption( "applyTemplateOptions", o.applyTemplateOptions );
        },

        /**
         * Call from _destroy
         * @private
         */
        _tableModelViewDestroy: function() {
            if ( this.footer$ ) {
                this.footer$.remove();
                this.footer$ = null;
            }
            this.pageRange$ = null;
            this.pageSelector$ = null;
            this.status$ = null;
            this.stateIcons$ = null;
            this.element.removeClass( getFullCSSClass( C_GRID_HIDE_DELETED, this.options ) );
            this._removeScrollHandler();
        },

        /**
         * Call from refresh method of derived view to support lazy rendering. If not visible
         * set pendingRefresh true return false so that the view will not be initialized/refreshed.
         * If visible set pendingRefresh false and return true to proceed as usual.
         * @returns {boolean} true if visible and false if not visible
         * @private
         */
        _refreshCheckIfVisible: function() {
            // This offsetParent method of checking visibility is OK because view widget should never be position fixed
            if ( this.element[0].offsetParent === null ) {
                // View is invisible so don't bother rendering anything expect a resize or refresh later
                this.pendingRefresh = true;
                return false;
            }
            this.pendingRefresh = false;
            return true;
        },

        /**
         * Used when refreshing to delay rendering until after the model has the needed data.
         * This is to avoid a flash of empty report. The delay only kicks in if the model
         * delayClearData option is on and the model doesn't have the data about to be rendered on refresh.
         * @private
         */
        _checkDelayRefresh: function( focus ) {
            const wantDelay = this.model.getOption( "delayClearData" ); // let this model option determine if delay
                // refresh to avoid empty report during ajax

            if ( !wantDelay || this.forceRefresh ) {
                this.forceRefresh = false;
                return false;
            } // else

            // probe to see if the model has data at the offset we want to render from (or has no data)
            if ( this.model.getTotalRecords( true ) === 0 || this.model.recordAt( this.pageOffset ) ) {
                return false;
            } // else

            // using return value just to see if fetch was initiated
            let fetchStarted = this.model.fetch( this.pageOffset, () => {
                this.renderInProgress = false;
                this.pendingRefresh = false;
                this.forceRefresh = true; // guard against endless loop
                this.refresh( focus );
            } );
            if ( fetchStarted ) {
                this.renderInProgress = true; // keep pagination from happening
                this.pendingRefresh = true; // keep resize from trying to refresh
            }
            return true;
        },

        /**
         * Call to initialize the model. Typically, done when the widget is created and anytime the modelName option
         * is changed. Also call with null for model name when the widget is destroyed or any other time the model is
         * no longer needed.
         *
         * @param modelName
         * @param altHandler
         * @private
         */
        _initModel: function( modelName, altHandler ) {
            const o = this.options,
                self = this;
            let markDeletes;

            function modelChangeHandler(type, change) {
                let rows, row, rec, id, oldId, meta, row$, inserted, records, copy,
                    refreshNeeded = false;

                if ( self.pendingRefresh ) {
                    // Ignore any changes that happen before the view is initialized. This can happen if view
                    // is initially invisible
                    return;
                }
                if ( type === "refresh" ) {
                    if ( !change.keepPagination ) { // todo wip may need special case for non virtual scroll pagination
                        self.pageOffset = 0;
                        self.highWaterMark = 0;
                        self.pageCount = 0;
                    }
                    if ( change.clearDataPending  && self._refreshCheckIfVisible() ) {
                        // using return value just to see if fetch was initiated
                        let fetchStarted = self.model.fetch( self.pageOffset, function() {
                            self.renderInProgress = false;
                            self.refresh();
                        } );
                        if ( fetchStarted ) {
                            // while waiting for model to load new data can't do any other pagination
                            self.renderInProgress = true;
                        }
                    } else {
                        self.refresh();
                    }
                } else if ( type === "refreshRecords" || type === "revert" ) {
                    rows = self._elementsFromRecordIds( change.recordIds );
                    for ( let i = 0; i < rows.length; i++ ) {
                        row = rows[i];
                        if (!row) {
                            continue;
                        }
                        rec = change.records[i];
                        // for update after insert this is the previous (temp) id and newIds holds the new value
                        // for revert after identity field was changed this is the changed value and newIds holds the
                        // new original/reverted value
                        oldId = change.recordIds[i];
                        id = change.newIds[oldId] || oldId;
                        meta = self.model.getRecordMetadata( id );
                        self._replaceRecord( row, rec, oldId, id, meta );
                    }
                    if ( type === "refreshRecords" && !o.pagination.scroll &&
                            Object.keys( change.newIds ).length > 0 ) {
                        refreshNeeded = true;
                    }
                } else if ( type === "move" ) {
                    // TODO consider if/when move should be handled as a refresh?
                    records = change.records;
                    if ( change.insertAfterId ) {
                        rows = self._elementsFromRecordIds( [change.insertAfterId] );
                        row = rows.length > 0 ? rows[0] : null;
                    }
                    // remove each moved record then insert in new place
                    for ( let i = records.length - 1; i >= 0; i-- ) {
                        rec = records[i];
                        id = self.model.getRecordId( rec );
                        meta = self.model.getRecordMetadata( id );

                        rows = self._elementsFromRecordIds( [id] );
                        if ( rows.length > 0 ) {
                            if ( rows[0] ) {
                                self._removeRecord( rows[0] );
                            }
                        }
                        row$ = self._insertRecord( row, rec, id, meta, row ? INSERT_AFTER : INSERT_BEFORE );
                    }
                } else if ( type === "insert" || type === "copy" ) {
                    if ( type === "insert" ) {
                        copy = false;
                        records = [change.record];
                    } else { // else copy
                        copy = true;
                        records = change.records;
                    }
                    if ( change.insertAfterId ) {
                        rows = self._elementsFromRecordIds( [change.insertAfterId] );
                        row = rows.length > 0 ? rows[0] : null;
                    }
                    if ( self.noData ) {
                        // This insert happens during _addPageOfRecords completion processing due to model refresh event
                        // so make sure that has completed before refreshing again to pick up the newly inserted record.
                        setTimeout( function() {
                            self.refresh();
                            rows = self._elementsFromRecordIds( [self.model.getRecordId(records[0])] );
                            // make sure the row is found
                            if ( rows.length > 0 && rows[0] ) {
                                self._afterInsert( rows, copy );
                            }
                        }, 1 );
                    } else {
                        // insert each added record
                        inserted = [];
                        for ( let i = records.length - 1; i >= 0; i-- ) {
                            rec = records[i];
                            id = self.model.getRecordId( rec );
                            meta = self.model.getRecordMetadata( id );

                            row$ = self._insertRecord( row, rec, id, meta, row ? INSERT_AFTER : INSERT_BEFORE );
                            inserted.unshift( row$ );
                        }
                        self._afterInsert( inserted, copy );
                    }
                } else if ( type === "clearChanges") {
                    if ( markDeletes ) {
                        rows = self._elementsFromRecordIds( change.deletedIds );
                        for ( let i = 0; i < rows.length; i++ ) {
                            if ( rows[i] ) {
                                self._removeRecord( rows[i] );
                            }
                        }
                        if ( change.deletedIds.length > 0 && !o.pagination.scroll ) {
                            refreshNeeded = true;
                        }
                    }
                    rows = self._elementsFromRecordIds( change.changedIds );
                    for ( let i = 0; i < rows.length; i++ ) {
                        row = rows[i];
                        if ( row ) {
                            id = change.changedIds[i];
                            meta = self.model.getRecordMetadata( id );
                            rec = self.model.getRecord( id );
                            self._updateRecordState( row, id, rec, meta );
                        }
                    }
                } else if ( change.recordIds ) {
                    rows = self._elementsFromRecordIds( change.recordIds );
                    for ( let i = 0; i < rows.length; i++ ) {
                        row = rows[i];
                        if ( !row ) {
                            continue;
                        }
                        id = change.recordIds[i];
                        meta = self.model.getRecordMetadata( id );
                        rec = change.records[i];

                        if ( type === "delete" ) {
                            // if record will be removed or if hideDeletedRows and the record is focused then need to
                            // select the next (or prev if at end) row only the derived view knows if the record
                            // is focused
                            if ( o.hideDeletedRows || !markDeletes || meta === null ) {
                                self._removeFocus( row );
                            }
                            if ( !markDeletes || meta === null ) {
                                // when meta is null it means the record was really deleted from the model
                                // such as in the case of deleting an inserted record
                                self._removeRecord( row );
                            } else {
                                self._updateRecordState( row, id, rec,  meta );
                            }
                        } else {
                            self._updateRecordState( row, id, rec, meta );
                        }
                    }
                    if ( type === "delete" ) {
                        if ( self.model.getTotalRecords() === 0 ) {
                            refreshNeeded = true;
                        } else if ( !markDeletes && !o.pagination.scroll ) {
                            refreshNeeded = true;
                        } else if ( o.hideDeletedRows ) {
                            self._deletedRowsHidden();
                            self._updateStatus();
                        }
                    }
                } else if ( type === "set" || type === "metaChange" ) {
                    // Ignore if change came from user editing cell in this widget
                    if ( self.ignoreFieldChange === null || self.ignoreFieldChange !== change.field ) {
                        let property = change.property; // only exists for metaChange notification

                        rec = change.record;
                        id = self.model.getRecordId( rec );
                        if ( change.oldIdentity ) {
                            self._identityChanged( change.oldIdentity, id );
                        }
                        meta = self.model.getRecordMetadata( id );
                        rows = self._elementsFromRecordIds( [id] );
                        if ( rows.length > 0 && rows[0] ) {
                            if ( type === "set" ) {
                                self._updateRecordField( rows[0], rec, change.field, meta );
                            }
                            self._updateRecordState( rows[0], id, rec, meta, property );
                        }
                    }
                } else if ( type === "instanceRename" ) {
                    // update our name for the model so it can be released
                    if ( self.modelName[1] === change.oldInstance ) {
                        self.modelName[1] = change.newInstance;
                    }
                }

                if ( refreshNeeded ) {
                    // In some cases multiple model notifications cause a refresh but only want to do it once.
                    // Example is after a save can get both clearChanges with deletes and refreshRecords with inserts.
                    if ( !self._refreshNeeded ) {
                        self._refreshNeeded = true;
                        queueMicrotask( () => {
                            self.refresh();
                            self._refreshNeeded = false;
                        } );
                    }
                } else if ( type !== "refresh" ) {
                    self._updateTotalRecords();
                } // else refresh was called so no need to total record update
            }

            let modelChanged = true;

            if ( this.model ) {
                // if there was a model unbind our listener
                this.model.unSubscribe( this.modelViewId );
                if ( isArray( this.modelName ) && isArray( modelName ) ) {
                    modelChanged = !util.arrayEqual(this.modelName, modelName);
                } else {
                    modelChanged = this.modelName !== modelName;
                }
                if ( modelChanged ) {
                    // and release the model if it is different from what is being set
                    model.release( this.modelName );
                    this.model = null;
                    this.modelName = null;
                }
            }
            // modelChanged property used to coordinate between _initModel and view refresh.
            // there are many reasons for a view to be refreshed and it may need to know if the refresh was due to
            // the model changing but changing the model can happen distinct from refresh so let it be known here
            // and in the view refresh this flag should be set back to false
            this.modelChanged = modelChanged;
            if ( modelName ) {
                if ( modelChanged ) {
                    this.modelName = modelName;
                    this.model = model.get( modelName );
                    if ( !this.model ) {
                        throw new Error( "Model not found: " + modelName );
                    }
                }
                this.modelViewId = this.model.subscribe( {
                    onChange: altHandler || modelChangeHandler,
                    progressView: this.element,
                    progressOptions: o.progressOptions
                } );
                markDeletes = this.model.getOption( "onlyMarkForDelete" );
                // When the model changes need to go back to the beginning
                if ( this.options.pagination.scroll && this.scrollParent$ ) {
                    // only adjust the scroll top if scrolled past the start of the view already. When scroll parent
                    // is window, this is unlikely to be the case because typically the master comes before the detail
                    // and you have to see the master records to select them.
                    // But for hasSize true (heading fixed to region) it is important to reset the scroll top.
                    if ( this.scrollParent$.scrollTop() > this.scrollDelta ) {
                        this.scrollParent$.scrollTop( this.scrollDelta );
                    }
                }
                this.pageOffset = 0;
                this.highWaterMark = 0;
                this.pageCount = 0;
            }
        },

        /**
         * Call to render a button.
         * @param out
         * @param cls
         * @param icon
         * @param label
         * @param [expanded]
         * @private
         */
        _renderButton: function( out, cls, icon, label, expanded ) {
            out.markup( `<button class='${cls}' type='button'` )
                .attr( ARIA_LABEL, label )
                .attr( "title", label )
                .optionalAttr( "aria-expanded", expanded == null ? null : expanded ? TRUE : FALSE )
                .markup( "><span aria-hidden='true' class='a-Icon " )
                .attr( icon )
                .markup( "'></span></button>" );
        },

        /**
         * Call to render the no data message area
         * @param out
         * @param baseId
         * @private
         */
        _renderAltDataMessages: function( out, baseId ) {
            const o = this.options;

            function msg( cls, suffix, iconCls, text, landmarkRole, landmarkLabel ) {
                out.markup( `<div class='${cls} ${ getFullCSSClass( C_GRID_ALT_MSG, o ) }' style='display:none;' ` )
                    .optionalAttr( ATTR_ROLE, landmarkRole )
                    .optionalAttr( ARIA_LABEL, landmarkLabel )
                    .markup( `><div class='${ getFullCSSClass( C_GRID_ALT_MSG_ICON, o ) }' ` )
                    .optionalAttr( ATTR_ROLE, landmarkLabel ? "img" : null )
                    .optionalAttr( ARIA_LABEL, landmarkLabel )
                    .optionalAttr( ARIA_HIDDEN, landmarkLabel ? null : TRUE )
                    .markup( `><span class='a-Icon ${iconCls}'></span></div>` )
                    .markup( `<div role='status'><span class='${ getFullCSSClass( C_GRID_ALT_MSG_TEXT, o ) }'` )
                    .optionalAttr( "id", baseId ? baseId + suffix + "_msg" : null ) // an id is added to the message so it can be included in the widget's accessible label
                    .markup( `>${text}</span></div></div>` ); // the message may contain markup just like IR
            }
            msg( getFullCSSClass( C_GRID_NO_DATA, o ), "_no", o.noDataIcon , o.noDataMessage, "region", lang.getMessage( "APEX.IG.NO_DATA_FOUND" ) );
            // todo add landmark once more data fully implemented
            msg( getFullCSSClass( C_GRID_MORE_DATA, o ), "_more", "icon-warning", o.moreDataMessage );
        },

        /**
         * Call during rendering of the widget after all the data but inside the scroll view port
         * @param out
         * @param landmarkLabel
         * @private
         */
        _renderLoadMore: function( out, landmarkLabel ) {
            const o = this.options,
                  pagination = o.pagination;

            if ( pagination.scroll && pagination.loadMore ) {
                out.markup( `<div class="${ getFullCSSClass( C_LOAD_MORE, o ) }"` )
                    .optionalAttr( "role", landmarkLabel ? "region" : "" )
                    .optionalAttr( ARIA_LABEL, landmarkLabel )
                    .markup( `><button type="button" class="a-Button js-load ${ getFullCSSClass( C_LOAD_MORE_BUTTON, o ) }">`)
                    .content( getMessage( "LOAD_MORE" ) )
                    .markup( "</button></div>" );
            }
        },

        /**
         * Call during rendering of the widget at the very end
         * @param out
         * @param baseId
         * @private
         */
        _renderFooter: function( out, baseId ) {
            const o = this.options;

            function pageRange() {
                // is set as attribute so no escaping is needed
                let label = o.entityTitlePlural ? formatMessageNoEscape( "PAGE_RANGE_ENTITY", o.entityTitlePlural ) : getMessage( "PAGE_RANGE" );
                out.markup( "<span " )
                    .attr( ATTR_CLASS, C_RANGE_DISPLAY )
                    .optionalAttr( "id", baseId ? baseId + "_pageRange" : null )
                    .attr( "title", label )
                    .markup( `><span class="${ getFullCSSClass( "pageRange", o )} "></span></span>` );
            }

            if ( o.footer ) {
                // Pagination landmark label
                let paginationLandmark;
                if ( o.pagination ) {
                    if ( o.pagination.scroll ) {
                        paginationLandmark = getMessage( "RANGE_DISPLAY" );
                    } else {
                        paginationLandmark = getMessage( "PAGINATION_LANDMARK" );
                    }
                } else {
                    paginationLandmark = null;
                }

                out.markup( `<div class="${ getFullCSSClass( C_GRID_FOOTER, o ) }" style="display:none;" ` )
                    .attr( ATTR_ROLE, REGION )
                    .attr( ARIA_LABEL, getMessage( "FOOTER_LANDMARK" ) )
                    .markup( `><div class="${ getFullCSSClass( "stateIcons", o ) }" ` )
                    .attr( ATTR_ROLE, REGION )
                    .attr( ARIA_LABEL, getMessage( "STATE_ICONS_LANDMARK" ) )
                    .markup( "></div><div " )
                    .attr( ATTR_ROLE, REGION ) // A landmark for the inner status region with implicit aria-live=polite
                    .attr( ARIA_LABEL, getMessage( "STATUS_LANDMARK" ) )
                    .markup( "><div " ) // inner div with implicit aria-live=polite
                    .optionalAttr( "id", baseId ? baseId + "_status" : null )
                    .attr( ATTR_CLASS, getFullCSSClass( "status", o ) )
                    .attr( ATTR_ROLE, "status" ) // implicit aria-live=polite
                    .markup( `></div></div><div class="${ getFullCSSClass( "pagination", o ) }" `)
                    .optionalAttr( ATTR_ROLE, paginationLandmark ? REGION : null )
                    .optionalAttr( ARIA_LABEL, paginationLandmark )
                    .markup( ">" );

                if ( o.pagination ) {
                    const
                        buttonClassArray = [ getFullCSSClass( "pageButton", o ), getFullCSSClass( "pageButton--nav", o ), "a-Button" ],
                        modelHasTotal = modelHasTotalRecords( this.model );
                    let rangeAdded = false;

                    if ( !o.pagination.scroll ) {
                        if ( modelHasTotal && o.pagination.firstAndLastButtons ) {
                            this._renderButton( out, buttonClassArray.join( " " ) + " js-pg-first", "icon-first",
                                getMessage( "FIRST_PAGE" ) );
                        }
                        this._renderButton( out, buttonClassArray.join( " " ) + " js-pg-prev", "icon-prev",
                            getMessage( "PREV_PAGE" ) );
                    }

                    if ( modelHasTotal && ( o.pagination.showPageLinks || o.pagination.showPageSelector ) ) {
                        out.markup( `<span class="${ getFullCSSClass( "pageSelector", o ) }"></span>` );
                    } else if ( o.pagination.showRange ) {
                        pageRange();
                        rangeAdded = true;
                    }

                    if ( !o.pagination.scroll ) {
                        this._renderButton( out, buttonClassArray.join( " " ) + " js-pg-next", "icon-next",
                            getMessage( "NEXT_PAGE" ) );
                        if ( modelHasTotal && o.pagination.firstAndLastButtons ) {
                            this._renderButton( out, buttonClassArray.join( " " ) + " js-pg-last", "icon-last",
                                getMessage( "LAST_PAGE" ) );
                        }
                    }

                    if ( !rangeAdded && o.pagination.showRange ) {
                        pageRange();
                    }
                }
                out.markup( "</div></div>" );
            }

        },

        /**
         * Call when the view is being refreshed before it is rendered.
         * @param scrollParent$
         * @private
         */
        _refreshPagination: function( scrollParent$ ) {
            const o = this.options,
                pagination = o.pagination;

            this.hasScrollFillers = pagination.scroll && pagination.virtual && !pagination.loadMore;

            // preserve scroll offsets
            this.lastScrollTop = null;
            this.lastScrollLeft = null;
            if ( scrollParent$.length ) {
                if ( !o.hasSize ) {
                    scrollParent$ = o.scrollParentOverride ? $( o.scrollParentOverride ) : $( window );
                }
                this.lastScrollLeft = scrollParent$.scrollLeft();
                this.lastScrollTop = scrollParent$.scrollTop();
            }
        },

        /**
         * Return an opaque indication of what in the pagination area has focus or false if nothing has focus.
         * Derived widgets use this method and _restorePaginationFocus to maintain focus in pagination area after view
         * or pagination area has been re-rendered.
         * @private
         */
        _paginationHasFocus: function() {
            const o = this.options,
                  activeElement$ = $( document.activeElement );

            if ( activeElement$.closest( getFullCSSClassSel( C_GRID_FOOTER, o ) ).length > 0 ) {
                if ( activeElement$.parent().hasClass( getFullCSSClass( "pageSelector-item", o ) ) ) {
                    return activeElement$.parent().attr( DATA_PAGE );
                } else {
                    const m = /js-pg-\S+/.exec( activeElement$.attr( ATTR_CLASS ) );
                    if ( m ) {
                        return "." + m[0];
                    }
                }
            }
            return false;
        },

        /**
         * Call after the view has been refreshed to restore the focus in the pagination area if it was there.
         *
         * @param prevFocus the return value from _paginationHasFocus.
         * @private
         */
        _restorePaginationFocus: function( prevFocus ) {
            if ( prevFocus ) {
                let btn$,
                    sel = prevFocus;

                if ( sel >= 0 ) {
                    sel = `[${DATA_PAGE}='${prevFocus}'] button`;
                }
                btn$ = this.footer$.find( sel );
                if ( btn$[0] && btn$[0].disabled ) {
                    btn$ = this.footer$.find( ":focusable" ).eq( 0 );
                }
                btn$.trigger( "focus" );
            }
        },

        /**
         * Call after the footer (and the rest of the view) has been rendered and inserted into the DOM.
         * @private
         */
        _initPagination: function( header$, scrollParent$ ) {
            const o = this.options,
                  ctrl$ = this.element,
                  tooltipEdge = ctrl$.hasClass("u-RTL") ? "right" : "left",
                  footer$ = this.footer$ = ctrl$.find( getFullCSSClassSel( C_GRID_FOOTER, o ) );

            this.pageKey = null; // cause the pagination if any to get updated

            this.status$ = footer$.find( getFullCSSClassSel( "status", o ) );
            this.stateIcons$ = footer$.find( getFullCSSClassSel( "stateIcons", o ) );
            this.pageRange$ = footer$.find( getFullCSSClassSel( "pageRange", o ) );
            this.pageSelector$ = footer$.find( getFullCSSClassSel( "pageSelector", o ) );
            this.noData$ = ctrl$.find( getFullCSSClassSel( C_GRID_NO_DATA, o ) );
            this.moreData$ = ctrl$.find( getFullCSSClassSel( C_GRID_MORE_DATA, o ) );

            if ( $.ui.tooltip ) {
                let messages = this.stateIconMessages;
                this.stateIcons$.tooltip( {
                    content: function() { // can't use arrow function here because this is the item element
                        let name = $( this ).attr( DATA_STATE );
                        return messages[name];
                    },
                    items: `[${DATA_STATE}]`,
                    show: apex.tooltipManager.defaultShowOption(),
                    tooltipClass: getFullCSSClass( "tooltip", o ),
                    position: {
                        my: tooltipEdge + " bottom",
                        at: tooltipEdge + " top-10",
                        collision: "flipfit"
                    }
                });
            }

            this._updateScrollHandler( scrollParent$ );

            if ( o.pagination.scroll ) {
                this.pageOffset = 0;
                this.highWaterMark = 0;
                this.pageCount = 0;
                this.totalRenderedRecords = 0;
            }

            // if the region has no defined height and the stickyWidget is available then stick the
            // header to the top of the page and/or the footer to the bottom of the page
            if ( !o.hasSize && $.apex.stickyWidget ) {
                if ( o.stickyTop ) {
                    let swOpt = {
                        stickToEnd: true,
                        toggleWidth: true,
                        bottom: () => {
                            return ctrl$.offset().top + ctrl$.outerHeight() - this._footerHeight();
                        }
                    };
                    if ( typeof o.stickyTop === "function" ) {
                        swOpt.top = o.stickyTop;
                    }
                    // overflow hidden so that header controls don't cause horizontal scrollbar. (case 2 of bug 26171679)
                    header$.css( "overflow", "hidden" ).stickyWidget( swOpt );
                }
                if ( o.footer && o.stickyFooter ) {
                    footer$.stickyWidget( {
                        isFooter: true,
                        toggleWidth: true,
                        stickToEnd: true,
                        top: () => {
                            return ctrl$.offset().top + this._getHeaderHeight();
                        }
                    } );
                }
            }

            if ( o.pagination.showPageLinks ) {
                this.pageSelector$.on( "click", event => {
                    let item$ = $( event.target ).parent();
                    if ( item$.length ) {
                        this.gotoPage( toInteger( item$.attr( DATA_PAGE ) ) );
                    }
                    event.preventDefault();
                } );
            } else if ( o.pagination.showPageSelector ) {
                this.pageSelector$.on( "change", event => {
                    this.gotoPage( toInteger( $( event.target ).val() ) );
                } );
            }

            footer$.find( ".js-pg-first" ).on( "click", () => {
                this.firstPage();
            } );
            footer$.find( ".js-pg-prev" ).on( "click", () => {
                this.previousPage();
            } );
            footer$.find( ".js-pg-next" ).on( "click", () => {
                this.nextPage();
            } );
            footer$.find( ".js-pg-last" ).on( "click", () => {
                this.lastPage();
            } );
            ctrl$.find( ".js-load" ).on( "click", () => {
                const top = this.scrollParent$.scrollTop();

                this.loadMore();
                // want to shift the focus back to the report but not change the scroll offset (bug 25802101)
                this.focus();
                this.scrollParent$.scrollTop( top );
            } );
            footer$.on( "click", ".js-loadAll", ( event ) => {
                this.focus();
                $( event.target ).closest( ".js-loadAll" ).remove(); // remove button link so it can't be clicked again
                this.fetchAllData();
            } );
        },

        /**
         * Call after the first page of records has been rendered after refresh and on resize
         * to make sure sticky widgets are refreshed to account for any size change.
         * @private
         */
        _updateHeaderFooter( header$ ) {
            const o = this.options;

            if ( !o.hasSize && $.apex.stickyWidget ) {
                if ( header$[0] && o.stickyTop ) {
                    header$.stickyWidget( "refresh" );
                }
                if ( this.footer$[0] && o.stickyFooter ) {
                    this.footer$.stickyWidget( "refresh" );
                }
            }
        },

        /**
         * Call during resizing or anytime you need to make adjustments for the footer height
         * @return {number}
         * @private
         */
        _footerHeight: function() {
            return this.footer$.outerHeight() || 0;
        },

        /**
         * Call to add the next page
         * Only for scroll pagination!
         * @private
         */
        _addNextPage: function() {
            if ( this.renderInProgress ) {
                return false;
            } // else
            let total = this.model.getTotalRecords();

            if ( total < 0 || this.pageOffset + this.pageCount < total ) {
                this.pageOffset += this.pageCount; // pageSize can change so use pageCount see bug 28834484.
                this._addPageOfRecords();
            }
            return true;
        },

        /**
         * Call to add records from the model to the view
         * @private
         */
        _addPageOfRecords: function( callback ) {
            const self = this,
                o = this.options,
                hasControlBreaks = this._hasControlBreaks(),
                hasNestedControlBreaks = this._hasNestedControlBreaks(),
                hasTotalRecords = modelHasTotalRecords( this.model ),
                controlBreakSel = this._controlBreakSelector(),
                itemSel = this._itemSelector(); // only used when there are nested control breaks
            let count, pageSize, pageOffset, lastRenderOffset, dataContainer$, data$, insertControlBreak,
                // startTime, // uncomment for performance timing
                out = this._getDataRenderContext(),
                groupItem$ = null;

            /*
             * filler rows/items are special elements in the collection that are not
             * actually collection rows/items but take up height equivalent to the missing content that it represents.
             * The fillers are the "holes" in the collection. The data-start and data-end attribute are the zero
             * based index into the model collection of the first and last rows that would replace the filler element
             * respectively.
             */
            function updateFiller( start, end, f$, recPerRow, rowHeight) {
                if ( start > end ) { // start = end represents one row/item (bug 35717714)
                    // updateFiller is done before inserting new data in an attempt to not disturb the scroll offset too much
                    // but the filler can't be removed before inserting so just indicated to remove empty filler
                    return true;
                } else {
                    // adjust filler size
                    f$.attr( DATA_START, start );
                    f$.attr( DATA_END, end );
                    setFillerHeight( f$, start, end, recPerRow, rowHeight );
                    return false;
                }
            }

            function getItemsToRemove( items$, begin, end, skip ) {
                let a = skip || 0,
                    b = end - begin;

                if ( hasControlBreaks && !hasNestedControlBreaks ) { // todo will this even be used for nested breaks?
                    // when there are control breaks (not nested ones) have to filter all the items
                    // because the break columns don't count as report rows but they do take up space in the DOM
                    a = begin + a;
                    b = end;
                    // expand the slice range to filter
                    begin = 0;
                    end += items$.filter( controlBreakSel ).length;
                }

                return items$.slice( begin, end ).filter( ( i, el ) => {
                    let el$ = $(el);

                    if ( hasControlBreaks && !hasNestedControlBreaks &&
                            el$.is( controlBreakSel ) ) {
                        // for each break item the index range shifts
                        if ( i < a) {
                            a += 1;
                        }
                        b += 1;
                    }
                    if ( el$.hasClass( C_GRID_SCROLL_FILLER ) ) {
                        b = i;
                    }
                    return i >= a && i < b;
                } );
            }

            function nextVisible( filler$, removeOffset, next ) {
                let resultOffset = removeOffset,
                    row$ = dataContainer$.find( `[${DATA_ROWNUM}="${removeOffset + 1}"]` );

                if ( ( filler$ && !fillerVisible( filler$ ) ) || !row$.is( SEL_VISIBLE ) ) {
                    // todo This is grid view specific because of a-GV-row!!! must be general but currently grid view is the only one with collapsible breaks
                    resultOffset = toInteger( row$[next ? "nextAll" : "prevAll"]( ` ${ getFullCSSClassSel( "row", o ) } [${DATA_ROWNUM}]:visible` ).first().attr( DATA_ROWNUM ) ) || 0;
                }
                return resultOffset;
            }

            function insertGroup( f$, how ) {
                let curGroup$ = f$.closest( controlBreakSel );

                // todo groups is how always after?
                curGroup$[how]( groupItem$ );
            }

            function renderData() {
                let fillers$, outFiller, totalEnd, recPerRow, prevEnd, refItem$, prevTop,
                    renderCount = count - ( lastRenderOffset - pageOffset ),
                    rowHeight = self.avgRowHeight;

                // todo virtual scroll pagination does not work for nested control break groups
                //   Support is WIP marked with issues marked todo groups
                if ( self.hasScrollFillers ) {
                    // The table consists of actual rows and filler rows. Filer rows have a height that represents
                    // the height of the not yet rendered rows.
                    // Find all the filler rows
                    fillers$ = dataContainer$.find( SEL_GRID_SCROLL_FILLER );
                    totalEnd = self.model.getTotalRecords( true ) - 1;
                    prevEnd = totalEnd;
                    if ( fillers$.length === 0 && hasTotalRecords ) {
                        // if there are none it must mean that the view is empty (and doing full virtual) so add
                        // initial filler record that represents all the data
                        if ( groupItem$ ) {
                            self._getDataContainer().append( groupItem$ );
                            groupItem$ = null;
                        }
                        outFiller = self._getDataRenderContext();
                        self._renderFillerRecord( outFiller, C_GRID_SCROLL_FILLER );
                        fillers$ = self._insertFiller( outFiller, null );
                        fillers$.attr(DATA_START, 0);
                        fillers$.attr(DATA_END, totalEnd);
                        fillers$ = fillers$.last();
                    } else if ( fillers$.last().next().length === 0 ) {
                        // todo groups this can be true even when filler not in last group so not really at the end.
                        // if there is a filler at the end then it has the previous totalEnd records
                        prevEnd = toInteger( fillers$.last().attr(DATA_END) );
                    }
                    if ( totalEnd !== prevEnd ) {
                        fillers$.last().attr( DATA_END, totalEnd );
                    }
                    recPerRow = self._getRecordsPerRow();
                    // figure out where to insert the rendered data
                    let fillerIndex = -1,
                        found = false;

                    fillers$.each( function( i ) {
                        let newFiller$,
                            remove = false,
                            f$ = $( this ),
                            start = toInteger( f$.last().attr( DATA_START ) ),
                            end = toInteger( f$.last().attr( DATA_END ) ),
                            endOffset = lastRenderOffset + renderCount;

                        // because of logic in _scrollPage the lastRenderOffset should be start or somewhere between start and end.
                        if ( lastRenderOffset === start ) {
                            if ( groupItem$ ) {
                                // add new group after the containing group item
                                insertGroup( f$, INSERT_AFTER );
                                // move this filler to the new group
                                self.controlBreakGroupContainer$.append( f$ );
                            } else if ( hasNestedControlBreaks && f$.parent()[0] !== self.controlBreakGroupContainer$[0] ) {
                                self.controlBreakGroupContainer$.prepend( f$ );
                            }
                            // insert just before the filler
                            remove = updateFiller( endOffset, end, f$, recPerRow, rowHeight );
                            self._insertData( out, f$, INSERT_BEFORE );
                            fillerIndex = i;
                            found = true;
                        } else if ( endOffset < end ) {
                            let prevGroupContainer$;

                            if ( groupItem$ ) {
                                // add new group after the containing group item
                                prevGroupContainer$ = f$.parent();
                                insertGroup( f$, INSERT_AFTER );
                                // move this filler to the new group
                                // insert new group after this one move current filler to new group and insert new filler in prev group
                                self.controlBreakGroupContainer$.append( f$ );
                            }
                            // the new rows go in the middle of the filler so split it by adding a new filler
                            // before this one and then insert the rows just before this filler
                            // first adjust the size of the current filter Note: start should not equal end
                            updateFiller( endOffset, end, f$, recPerRow, rowHeight );
                            outFiller = self._getDataRenderContext();
                            self._renderFillerRecord( outFiller, C_GRID_SCROLL_FILLER );
                            newFiller$ = self._insertFiller( outFiller, f$ );
                            if ( prevGroupContainer$ ) {
                                // move the newFiller to the previous group
                                prevGroupContainer$.append( newFiller$ );
                            }
                            updateFiller( start, lastRenderOffset - 1, newFiller$, recPerRow, rowHeight );
                            self._insertData( out, f$, INSERT_BEFORE );
                            fillerIndex = i + 1;
                            found = true;
                        } else if ( lastRenderOffset <= end && endOffset > end )  {
                            if ( groupItem$ ) {
                                // add new group after the containing group item
                                insertGroup( f$, INSERT_AFTER );
                                // move this filler to the new group
                                self.controlBreakGroupContainer$.append( f$ );
                                // todo group new group at end of filler?
                            }
                            // insert just after the filler
                            remove = updateFiller( start, lastRenderOffset - 1, f$, recPerRow, rowHeight );
                            self._insertData( out, f$, INSERT_AFTER );
                            fillerIndex = i + 1;
                            found = true;
                        }
                        if ( found ) {
                            if ( remove ) {
                                if ( fillerIndex === i ) {
                                    fillerIndex = i + 1;
                                }
                                f$.remove();
                            }
                            return false; // exit each early
                        }
                    } );
                    if ( !found ) {
                        // if the data doesn't replace a filler then it goes at the end
                        self._insertData( out );
                        fillerIndex = fillers$.length;
                    }
                    // check if records should be removed and replaced with a filler
                    // Want to leave some extra records rendered in pagesize chunks. The current viewport plus
                    // 2 pages before and 2 after = 5 + 2 at the beginning and 1 at the end totals 8 pages
                    // todo groups for now excluded nested control breaks from removing
                    //   records WIP remove !hasNestedControlBreaks
                    if ( !hasNestedControlBreaks && self.totalRenderedRecords > 8 * self.pageSize ) { // todo consider other criteria such as > 999 rows
                        let start, end, show, toRemove$, removeOffset, mergeFiller$, lastFiller,
                            distance = 0,
                            newFiller$ = null,
                            removeCount = 0,
                            firstFiller = 0,
                            addFiller = false;

                        if ( !o.fixedRowHeight ) {
                            refItem$ = dataContainer$.find( `[${DATA_ROWNUM}="${self.pageOffset + 1}"]` );
                            if ( refItem$[0] ) {
                                prevTop = refItem$.offset().top;
                            }
                        }
                        // the set of fillers may have changed
                        fillers$ = dataContainer$.find( SEL_GRID_SCROLL_FILLER );
                        lastFiller = fillers$.length - 1;

                        // first try to remove from the beginning
                        if ( firstFiller >= fillerIndex ) {
                            firstFiller = -1;
                            removeOffset = 2 * self.pageSize;
                        } else {
                            newFiller$ = fillers$.eq( firstFiller );
                            // todo groups dead code
                            if ( hasNestedControlBreaks ) {
                                let foundFullGroup = false,
                                    nextFiller$ = newFiller$;

                                // need to scan ahead to find either a filler that has row items after it
                                //  in this case remove from after that filler
                                // or the last filler that has no rows after it
                                //  in this case remove from the next group
                                while ( nextFiller$[0] && firstFiller < fillerIndex ) {
                                    if ( nextFiller$.next().length === 0 ) {
                                        foundFullGroup = true;
                                        removeOffset = toInteger( newFiller$.attr( DATA_END ) );

                                    } else {
                                        newFiller$ = nextFiller$;
                                        removeOffset = toInteger( newFiller$.attr( DATA_END ) );
                                        break;
                                    }
                                    firstFiller += 1;
                                    newFiller$ = nextFiller$;
                                    nextFiller$ = fillers$.eq( firstFiller );
                                }

                                if ( foundFullGroup ) {
                                    // remove from next group
                                    firstFiller = -1;
                                    removeOffset += 1;
                                }
                            } else {
                                // if there are multiple adjacent fillers (due to different visibility) want the last one
                                while ( newFiller$.next().is( SEL_GRID_SCROLL_FILLER ) ) {
                                    newFiller$ = newFiller$.next();
                                }
                                removeOffset = toInteger( newFiller$.attr( DATA_END ) );
                            }
                        }
                        if ( removeOffset > 0 ) {
                            // check distance between place to remove from and current page
                            // note because of collapsed breaks can't just look at the removeOffset but must consider
                            // the next closest visible row.
                            distance = Math.abs( self.pageOffset - nextVisible( newFiller$, removeOffset + 1, true ) );
                        }
                        if ( distance >= 3 * self.pageSize ) {
                            /*
                             * possible cases
                             * - the rows to remove leave no rows between 2 fillers so merge them
                             * - the rows to remove are next to a filler so just extend the filler
                             *    - if the rows to remove and the adjacent filler have different visibility then add a new filler
                             * - the rows are not next to a filler so add a new filler
                             */
                            if ( firstFiller >= 0 ) {
                                // remove the next page size records but don't run into a new filler
                                toRemove$ = getItemsToRemove( newFiller$.nextAll(), 0, self.pageSize );
                                removeCount = toRemove$.not( controlBreakSel ).length;
                                // consider if the rows to remove are hidden because of collapsed control break
                                // by checking only the start and end for visibility the fillers only approximately
                                // align with collapsed control breaks
                                show = toRemove$.first().is( SEL_VISIBLE ) && toRemove$.last().is( SEL_VISIBLE );
                                //console.log("xxx to remove from start ", distance, removeCount, show)
                                mergeFiller$ = toRemove$.last().next().filter( SEL_GRID_SCROLL_FILLER );
                                if ( mergeFiller$.length && show === fillerVisible( mergeFiller$ ) ) {
                                    // merge adjacent fillers
                                    start = toInteger( newFiller$.attr( DATA_START ) );
                                    end = toInteger( mergeFiller$.attr( DATA_END ) );
                                    updateFiller( start, end, mergeFiller$, recPerRow, rowHeight );
                                    newFiller$.remove();
                                } else if ( show === fillerVisible( newFiller$ ) ) {
                                    // extend filler
                                    start = toInteger( newFiller$.attr( DATA_START ) );
                                    end = toInteger( newFiller$.attr( DATA_END ) ) + removeCount;
                                    updateFiller( start, end, newFiller$, recPerRow, rowHeight );
                                } else {
                                    start = toInteger( newFiller$.attr( DATA_END ) ) + 1;
                                    addFiller = true;
                                }
                            } else {
                                // todo groups for nested group need to find the group that the start row is in
                                //  then while more
                                start = removeOffset;
                                end = start + self.pageSize;
                                toRemove$ = getItemsToRemove( dataContainer$.children(), start, end ); // todo groups?
                                // todo groups need to distinguish items from break items. using .last is weak
                                //  item$ = dataContainer$.find( `[${DATA_ROWNUM}="${start + 1}"]` ).last();
                                //  toRemove$ = getItemsToRemove( item$.nextAll().addBack(), 0, self.pageSize );
                                // todo groups dead code
                                if ( hasNestedControlBreaks ) {
                                    removeCount = toRemove$.length;
                                } else {
                                    removeCount = toRemove$.not( controlBreakSel ).length;
                                }
                                show = toRemove$.first().is( SEL_VISIBLE ) && toRemove$.last().is( SEL_VISIBLE );
                                //console.log("xxx to remove from start add new ", distance, removeCount, show)
                                addFiller = true;
                            }
                            if ( addFiller ) {
                                outFiller = self._getDataRenderContext();
                                self._renderFillerRecord( outFiller, C_GRID_SCROLL_FILLER );
                                newFiller$ = self._insertFiller( outFiller, toRemove$.eq( 0 ) );
                                updateFiller( start, start + removeCount - 1, newFiller$, recPerRow, rowHeight );
                                toggleFillerVisible( newFiller$, show );
                            }
                        } else {
                            let last$;

                            distance = 0;
                            // next try to remove from the end
                            if ( lastFiller < fillerIndex ) {
                                lastFiller = -1;
                                removeOffset = -1;
                                // may not have rendered all the way to the end so really want the offset of the last rendered record
                                last$ = dataContainer$.children().not( SEL_AGGREGATE ).last(); // don't include aggregate records because they don't have a rownum
                                if ( last$.attr( DATA_ID ) ) {
                                    removeOffset = self.model.indexOf( self.model.getRecord( last$.attr( DATA_ID ) ) );
                                    // leave just one page rendered at the end so that more rows are available to render in the middle
                                    removeOffset = pageBoundary( removeOffset, self.pageSize ) - self.pageSize;
                                }
                            } else {
                                newFiller$ = fillers$.eq( lastFiller );
                                // if there are multiple adjacent fillers (due to different visibility) want the first one
                                while ( newFiller$.prev().is( SEL_GRID_SCROLL_FILLER ) ) {
                                    newFiller$ = newFiller$.prev();
                                }
                                removeOffset = toInteger( newFiller$.attr( DATA_START ) );
                            }
                            if ( removeOffset > 0 ) {
                                // check distance between place to remove from and current page
                                distance = Math.abs( self.pageOffset + self.pageSize - nextVisible( newFiller$, removeOffset - 1, false ) );
                            }
                            if ( distance >= 3 * self.pageSize ) {
                                // same possible cases as removing from the start
                                if ( lastFiller >= 0 ) {
                                    // remove the next page size records but don't run into a new filler
                                    toRemove$ = getItemsToRemove( newFiller$.prevAll(), 0, self.pageSize );
                                    removeCount = toRemove$.not( controlBreakSel ).length;
                                    show = toRemove$.first().is( SEL_VISIBLE ) && toRemove$.last().is( SEL_VISIBLE );
                                    //console.log("xxx to remove from end ", distance, removeCount, show)
                                    mergeFiller$ = toRemove$.prev( SEL_GRID_SCROLL_FILLER );
                                    if ( mergeFiller$.length && show === fillerVisible( mergeFiller$ ) ) {
                                        // merge adjacent fillers
                                        start = toInteger( mergeFiller$.attr( DATA_START ) );
                                        end = toInteger( newFiller$.attr( DATA_END ) );
                                        updateFiller( start, end, mergeFiller$, recPerRow, rowHeight );
                                        newFiller$.remove();
                                    } else if ( show === fillerVisible( newFiller$ ) ) {
                                        // extend filler
                                        start = toInteger( newFiller$.attr( DATA_START ) ) - removeCount;
                                        end = toInteger( newFiller$.attr( DATA_END ) );
                                        updateFiller( start, end, newFiller$, recPerRow, rowHeight );
                                    } else {
                                        start = toInteger( newFiller$.attr( DATA_START ) ) - removeCount;
                                        end = start + removeCount - 1;
                                        addFiller = true;
                                    }
                                } else {
                                    start = totalEnd - removeOffset;
                                    end = start + self.pageSize;
                                    toRemove$ = getItemsToRemove( last$.prevAll(), 0, end, start );
                                    removeCount = toRemove$.not( controlBreakSel ).length;
                                    if ( removeCount > 0 ) {
                                        show = toRemove$.first().is( SEL_VISIBLE ) && toRemove$.last().is( SEL_VISIBLE );
                                        //console.log( "xxx to remove from end add new ", distance, removeCount, show, last$ )
                                        addFiller = true;
                                        end = removeOffset - 1;
                                        start = removeOffset - removeCount;
                                    }
                                }
                                if ( addFiller ) {
                                    outFiller = self._getDataRenderContext();
                                    self._renderFillerRecord( outFiller, C_GRID_SCROLL_FILLER );
                                    newFiller$ = self._insertFiller( outFiller, toRemove$.eq( 0 ) );
                                    updateFiller( start, end, newFiller$, recPerRow, rowHeight );
                                    toggleFillerVisible( newFiller$, show );
                                }
                            }
                        }
                        if ( removeCount > 0 ) {
                            toRemove$.remove(); // todo give derived view a chance to remove
                            self.totalRenderedRecords -= removeCount;
                        }
                    }
                    // With variable height rows, after rendering more data the average height may have changed
                    // so in the case of virtual scrolling adjust the heights of fillers to be more accurate
                    if ( !o.fixedRowHeight ) {
                        let delta = 0;

                        // todo think this gets done a second time when heading fixed to page because the region
                        //   resizes which ends up calling _initPageSize where updateFillerHeights is done again
                        self._updateAvgRowHeight(); // after this rowHeight is out of date
                        updateFillerHeights( self._getDataContainer(), recPerRow, self.avgRowHeight );
                        if ( refItem$ && refItem$[0] ) {
                            delta = refItem$.offset().top - prevTop;
                        }
                        if ( delta !== 0 ) {
                            self.scrollParent$.scrollTop( self.scrollParent$.scrollTop() + delta );
                        }
                    }
                } else {
                    // for non-scroll paging or (non-virtual scroll paging) just append the new records.
                    // In the first case the container is already empty. In the second case "load more" adds
                    // to the existing records.
                    self._insertData( out );
                }
            } // end renderData

            function finish( error ) {
                const endOffset = self.pageOffset + count;
                let fillers$;

                // check if empty
                self.pageCount = count;
                self.totalRenderedRecords += count;
                if ( endOffset > self.highWaterMark ) {
                    self.highWaterMark = endOffset;
                }
                if ( self.pageOffset === 0 && count === 0 ) {
                    self.noData = true;
                    data$.hide();
                    self.moreData$.hide();
                    self.noData$.show();
                    self._trigger( EVENT_PAGE_CHANGE, null, {
                        offset: 0,
                        count: 0
                    } );
                    if ( o.autoAddRecord && self.model.allowAdd() && !error ) {
                        self._autoAddRecord();
                    }
                } else {
                    if ( count === 0 ) {
                        self.renderInProgress = false;
                        if ( !o.pagination.scroll ) {
                            // page offset is not zero and yet count is zero so somehow went off the end of the model xxx or there was an error
                            self.pageOffset -= self.pageSize; // go back one page
                            if ( self.pageOffset < 0 ) {
                                self.pageOffset = 0;
                            }
                            self._addPageOfRecords(); // and try again. todo consider loss of callback
                        }
                        return;
                    }
                    self.noData = false;
                    self.noData$.hide();
                    if ( self.model.getDataOverflow() && o.moreDataMessage ) {
                        self.moreData$.show();
                        // todo consider if want to show the data under the more data warning message
                        data$.hide();
                    } else {
                        self.moreData$.hide();
                        data$.show();
                    }
                    renderData();
                    // todo think (24.2) diff in moving this here is that it now fires after virtual paging removes records
                    //   should be OK because shouldn't mess with the DOM and those were going to be removed anyway
                    //   if this is a problem move back into renderData outside _insertData and pass in a finished flag.
                    self._trigger( EVENT_PAGE_CHANGE, null, {
                        offset: pageOffset,
                        count: count
                    } );
                }
                self._updateTotalRecords();
                self.renderInProgress = false;

                // begin uncomment for performance timing
                //debug.timeEnd("TMVforEachInPage");
                //debug.info("Render page of records duration:", performance.now() - startTime);
                // end uncomment for performance timing

                // There are 2 cases where after getting a page of records we may need to get another page both
                // have to do with scroll paging and collapsible control breaks
                // 1) If data is added to a control break that is collapsed want to keep going until the next
                //    control break is found because collapsed data is not seen.
                // 2) If the report height is less than the scroll viewport height (because of a control break
                //    getting collapsed) need to get more because scrolling is not possible.
                // there must be data (bug 33336777)
                if ( !self.noData && o.pagination.scroll && ( self.controlBreakCollapsed ||
                        !hasTotalRecords && dataContainer$.height() < self.scrollParent$.height() ) ) {
                    let total = self.model.getTotalRecords(),
                        nextOffset = self.hasScrollFillers ? self.pageOffset + self.pageCount : self.highWaterMark;

                    if ( total < 0 || nextOffset < total ) {
                        let needData = true;

                        self.pageOffset = nextOffset;
                        if ( self.hasScrollFillers ) {
                            needData = false;
                            // make sure it is not data we already have; find a filler where it belongs
                            fillers$ = dataContainer$.find( SEL_GRID_SCROLL_FILLER );
                            fillers$.each( function () {
                                if ( self.pageOffset === toInteger( $( this ).attr( DATA_START ) ) ) {
                                    needData = true;
                                    return false; // no need to keep looking
                                }
                            } );
                        }
                        if ( needData ) {
                            self._addPageOfRecords( callback );
                            return;
                        }
                    }
                }

                if ( callback ) {
                    callback();
                }
            } // end finish

            if ( this.renderInProgress ) {
                return;
            }

            data$ = self.noData$.parent().children().not( getFullCSSClassSel( C_GRID_ALT_MSG, o ) ); // this is all but the alternative message elements
            // it is possible for a view to not use the altDataMessages so check that nodData$ exists
            if ( ( this.noData || this.moreData$.is( SEL_VISIBLE ) ) && this.noData$.length ) {
                // assume there will be data and show the data areas so the content can be sized correctly
                this.noData$.hide();
                this.moreData$.hide();
                data$.show();
                this.resize();
            }
            // need to know where the data is going to go to be able to search for filler and control break elements
            dataContainer$ = self._getDataContainer();

            if ( this.pageOffset === 0 || !o.pagination.scroll ) {
                this.pageFirstOffset = "";
                this.pageLastOffset = "";
            }
            if ( !o.pagination.scroll ) {
                this.totalRenderedRecords = 0;
            }

            // if report has control breaks start out unknown else false for NA.
            this.controlBreakCollapsed = hasControlBreaks ? null : false;

            if ( hasControlBreaks ) {
                if ( this.pageOffset === 0 || !o.pagination.scroll ) {
                    // if at the beginning or for page pagination always start with a control break
                    insertControlBreak = true;
                } else if ( !( hasNestedControlBreaks && self.hasScrollFillers ) ) { // todo groups
                    let metaKey = this.model.getOption( "metaField" );

                    // todo think does this have a problem if the endControl break is at the end of a
                    //   model data block that is not in memory?
                    // a meta field is required when using control breaks but check just in case
                    if ( metaKey ) {
                        // look at record just before the ones about to render
                        let index = this.pageOffset - 1;

                        while ( index > 0 ) {
                            let meta,
                                rowItem = this.model.recordAt( index );

                            if ( rowItem ) {
                                meta = this.model.getValue( rowItem, metaKey );
                                // skip aggregate records when looking for endControlBreak. See bug 33384701.
                                if ( !meta.agg ) {
                                    insertControlBreak = meta.endControlBreak === true;
                                    break;
                                }
                            }
                            index -= 1;
                        }
                    }
                }
                // else it is the case of nested control breaks with virtual scroll pagination and we can't
                // tell if a new control break needs to be inserted until we have a record see below
            } else {
                // just in case previously had nested control breaks and now don't
                this.controlBreakGroupContainer$ = null;
            }

            count = 0;
            pageSize = this.pageSize;
            if ( !o.pagination.scroll ) {
                // the page size could have changed need to get back on the new page size boundary
                this.pageOffset = pageBoundary( this.pageOffset, pageSize );
            } else if ( self.hasScrollFillers ) {
                // if pagination is scroll make sure count doesn't go off end of current filler
                let fillers$ = dataContainer$.find( SEL_GRID_SCROLL_FILLER );

                fillers$.each( function() {
                    let f$ = $( this ),
                        start = toInteger( f$.attr( DATA_START ) ),
                        end = toInteger( f$.attr( DATA_END ) );

                    if ( self.pageOffset >= start && self.pageOffset < end ) {
                        // trim page size to keep it within filler otherwise end up with duplicate records rendered
                        pageSize = Math.min( pageSize, end + 1 - self.pageOffset );
                        return false; // no need to keep looking
                    }
                });
            }
            lastRenderOffset = pageOffset = this.pageOffset;

            // begin uncomment for performance timing
            //debug.timeBegin("TMVforEachInPage");
            //startTime = performance.now();
            // end uncomment for performance timing

            this.renderInProgress = true;
            this.model.forEachInPage( this.pageOffset, pageSize, function( rowItem, index, id, error ) {
                if ( rowItem ) {
                    const meta = id ? this.model.getRecordMetadata( id ) : {};
                    let expandControl, currentBreakData, outGroupBreak,
                        serverOffset = meta.serverOffset;

                    if ( hasControlBreaks && !meta.agg ) {
                        // for nested control breaks and virtual scroll pagination the records can come in any
                        // order and need to find out which control break group this record belongs to and if
                        // it needs to be inserted todo groups
                        if ( !insertControlBreak && count === 0 && hasNestedControlBreaks && self.hasScrollFillers ) {
                            const controlBreakId = this.model.getControlBreakId( rowItem ),
                                group$ = this._getDataContainer()
                                    .find( `[${DATA_ID}="${util.escapeCSS( controlBreakId )}"]` );

                            // need to see if this record is in a group that has not yet been rendered.
                            if ( !group$[0] ) {
                                // if no group exists add a new one
                                insertControlBreak = true;
                                // todo groups maybe at this point need to figure out where the group goes
                            } else {
                                // make sure the current control break container is the one this item goes in
                                this.controlBreakGroupContainer$ =
                                    group$.find( itemSel + "," + SEL_GRID_SCROLL_FILLER ).first().parent();
                            }

                        }
                        expandControl = true; // todo not currently used, waiting for option to control initial state
                                              // this will impact virtual scrolling. setting expandControl to false
                                              // causes all rows to be rendered as hidden all at once; not desired
                        // todo groups
                        if ( insertControlBreak && hasNestedControlBreaks && self.hasScrollFillers ) {
                            // make sure the break to be inserted isn't already rendered
                            const controlBreakId = this.model.getControlBreakId( rowItem ),
                                group$ = this._getDataContainer()
                                    .find( `[${DATA_ID}="${util.escapeCSS( controlBreakId )}"]` );

                            if ( group$[0] ) {
                                insertControlBreak = false;
                                // make sure the current control break container is the one this item goes in
                                this.controlBreakGroupContainer$ =
                                    group$.find( itemSel + "," + SEL_GRID_SCROLL_FILLER ).first().parent();
                            }
                        }
                        if ( insertControlBreak ) {
                            insertControlBreak = false;

                            if ( hasNestedControlBreaks ) {
                                outGroupBreak = this._getDataRenderContext();
                            } else {
                                outGroupBreak = out; // write control breaks like regular records
                            }

                            currentBreakData = this._controlBreakData( rowItem );
                            this._renderBreak( outGroupBreak, expandControl, currentBreakData, serverOffset );

                            if ( hasNestedControlBreaks ) {
                                // need to render the closing break group markup
                                // this comment is just used to identify the group collection element
                                // a comment is used because it is the only thing that is allowed inside any element.
                                outGroupBreak.markup( "<!--$row$-->" );
                                this._renderEndBreak( outGroupBreak, currentBreakData );
                                groupItem$ = $( outGroupBreak.toString() );
                                this.controlBreakGroupContainer$ = this._findRowsPlaceholderParent( groupItem$ );
                                if ( !( this.hasScrollFillers && hasTotalRecords ) ) {
                                    this._getDataContainer().append( groupItem$ );
                                    groupItem$ = null;
                                }
                                // else for virtual scroll pagination the group item will be added during data rendering
                                // todo groups
                            }
                        }
                        if ( meta.endControlBreak ) {
                            insertControlBreak = true;
                        }
                    }
                    this._renderRecord( out, rowItem, index, id, meta );
                    if ( serverOffset !== undefined ) {
                        serverOffset += 1;
                        if ( this.pageFirstOffset === "" ) {
                            this.pageFirstOffset = serverOffset;
                        }
                        if ( serverOffset > this.pageLastOffset ) {
                            this.pageLastOffset = serverOffset;
                        }
                    }
                    count += 1;
                }
                if ( count === pageSize || !rowItem || error ) {
                    finish( error );
                } else if ( (insertControlBreak && this.controlBreakGroupContainer$ ) || error === false ) {
                    // render what we have so far if at the end of a group or there is a pause where the
                    // model has to fetch more data (indicated by error being false)
                    renderData();
                    lastRenderOffset = lastRenderOffset + count;
                    out.clear();
                }
            }, this );
        },

        /**
         * Finds the parent element of a comment element with value $row$
         * and the comment is removed.
         * @private
         */
        _findRowsPlaceholderParent: function( context$ = this.element ) {
            let dataPlaceholder$, comment,
                parent$ = $(),
                // context$ may be in a different document bug 37169072
                comments = context$[0].ownerDocument.evaluate( "descendant::comment()", context$[0],
                    null, XPathResult.ANY_TYPE, null);

            comment = comments.iterateNext();
            while ( comment ) {
                if ( comment.nodeValue.trim() === "$row$" ) {
                    dataPlaceholder$ = $( comment );
                    break;
                }
                comment = comments.iterateNext();
            }
            if ( dataPlaceholder$ ) {
                parent$ = dataPlaceholder$.parent();
                dataPlaceholder$.remove();
            }
            return parent$;
        },

        /**
         * Call when widget is created and anytime the size changes
         *
         * @private
         */
        _initPageSize: function() {
            let rowHeight, viewportHeight, pageSize, top,
                o = this.options,
                recPerRow = this._getRecordsPerRow();

            if ( this.hasScrollFillers ) {
                // number of records per row may have changed so first update fillers based
                // on new rows per page but with current row height
                if ( this.recPerRow !== recPerRow ) {
                    // adjust the height of the filler items
                    updateFillerHeights( this._getDataContainer(), recPerRow, this.avgRowHeight );
                }
                // just in case the scroll offset changed since last initialized page size
                this._scrollPage();
            }
            this.recPerRow = recPerRow;

            this._updateAvgRowHeight();
            rowHeight = this.avgRowHeight;
            if ( !o.hasSize ) {
                viewportHeight = this.scrollParent$.height();

                // if there is a sticky header or footer (even if not currently stuck) subtract the height of each
                if ( this.footer$.hasClass( "js-stickyWidget-toggle" ) ) {
                    viewportHeight -= this._footerHeight();
                }
                top = this._getStickyTop();
                if ( top > 0 ) {
                    viewportHeight -= top + this._getHeaderHeight();
                }
            } else {
                viewportHeight = this.scrollParent$[0].offsetHeight; // doesn't include the scroll bar
            }
            // always leave room for possible horizontal scroll bar
            viewportHeight -= util.getScrollbarSize().height;
            pageSize = Math.floor( viewportHeight / rowHeight );
            if ( pageSize < 1 ) {
                pageSize = 1; // don't ever let page size be 0
            }
            this.viewportHeight = pageSize * rowHeight; // adjust to be a multiple of row height

            // if the user has specified how many rows make a page use it otherwise ...
            if ( !o.rowsPerPage ) {
                if ( !o.fixedRowHeight && !o.pagination.scroll ) {
                    // for traditional paging the "auto" setting for rows per page doesn't make sense for variable
                    // height rows (can't have page size keep shifting) so auto is VAR_HEIGHT_AUTO_PAGE_SIZE.
                    this.pageSize = VAR_HEIGHT_AUTO_PAGE_SIZE;
                } else {
                    // Note for a grid (of items) view, rows per page really means records (or items) per page because
                    // multiple records fit on one row
                    pageSize = pageSize * recPerRow;

                    // if scroll paging want the page size to be a little bigger than what is visible (keep in mind that when
                    // scroll paging rowsPerPage is forced to null) otherwise the "auto" page size is just what fits
                    // in the view
                    if ( o.pagination.scroll ) {
                        this.pageSize = Math.round( Math.max( MIN_SCROLL_PAGE_SIZE, 1.5 * pageSize ) );
                        // make a multiple of recPerRow
                        this.pageSize = Math.ceil( this.pageSize / recPerRow ) * recPerRow;
                    } else {
                        this.pageSize = pageSize;
                    }
                }
            }
        },

        /**
         * Call any time the selection state changes or the deleted state of any records may have changed or
         * the hideDeletedRows option changes, or any other case that could affect the status area of the footer.
         * @private
         */
        _updateStatus: function() {
            const o = this.options,
                selCount = this._selectedCount(),
                hasTotalRecords = modelHasTotalRecords( this.model ),
                total = hasTotalRecords ? this.model.getTotalRecords() : null,
                incomplete = this.model.getSelectionState().incomplete;
            let deletedCount = null,
                text = "";

            this.prevSelCount = selCount;
            if ( this.options.hideDeletedRows ) {
                deletedCount = this._deletedCount();
            }
            if ( selCount > 0 ) {
                text += this._selectedStatusMessage( selCount );
            }

            if ( incomplete && !this.fetchAllDataActive ) {
                if ( o.loadIncompleteSelection === "on-demand" ) {
                    text += ` <button type="button" class="a-Button a-Button--link js-loadAll">\
 ${getMessage( "LOAD_ALL" )}</button> `;
                } else if ( o.loadIncompleteSelection === "always" ) {
                    this.fetchAllData( true );
                }
            }
            if ( deletedCount > 0 ) {
                if ( text ) {
                    text += ", ";
                }
                text += formatMessage( "DELETED_COUNT", deletedCount ) + " ";
            }

            this.status$.html( text );

            // allow for external display of report status
            if ( o.updateStatus ) {
                o.updateStatus( {
                    deletedCount: deletedCount,
                    selectedCount: selCount,
                    total: total,
                    incomplete: incomplete
                } );
            }
        },

        /**
         * Call to update the model with a new value from a column item
         * @param [element$] the active element (an ancestor of the column item element)
         * @param columnItem the column item
         * @param record the model record
         * @param property the column/field/property of the model record
         * @param {boolean} [notify]
         * @private
         */
        _setModelValue: function( element$, columnItem, record, property, notify ) {
            let result, value, prevValue, prevId;

            if ( element$ ) {
                element$.removeClass( C_ACTIVE );
            }
            value = columnItem.getValue();
            if ( !notify ) {
                this.ignoreFieldChange = property; // ignore the update that this setValue *may* cause
            }
            prevId = this.model.getRecordId( record );
            prevValue = this.model.getValue( record, property );
            if ( prevValue !== null && typeof prevValue === "object" && hasOwnProperty( prevValue, "v" ) ) {
                value = {
                    v: value,
                    d: columnItem.displayValueFor( value )
                };
            }
            result = this.model.setValue( record, property, value );
            if ( result === "DUP" ) {
                this._setColumnItemValue( columnItem, record, property );
                apex.message.alert( getMessage( "DUP_REC_ID" ) );
            } else {
                let validity = columnItem.getValidity(),
                    id = this.model.getRecordId( record );

                if ( !validity.valid ) {
                    this.model.setValidity( "error", id, property, columnItem.getValidationMessage() );
                } else {
                    this.model.setValidity( "valid", id, property );
                }
                if ( id !== prevId ) {
                    this._identityChanged( prevId, id );
                }
            }
            if ( !notify ) {
                this.ignoreFieldChange = null;
            }
        },

        _initColumnItems: function( fields ) {
            const o = this.options;
            let allFromCache = true;

            this.columnItems = {};
            this.columnItemsContainer$ = null;
            this.asyncColumnItems = [];

            for ( let i = 0; i < fields.length; i++ ) {
                let curItem,
                    column = fields[i],
                    eid = column.elementId,
                    ci = null;

                if ( eid ) {
                    // Because multiple widgets can share the same column items we use a cache to avoid having
                    // to recreate the items multiple times.
                    // first check if in cache
                    if ( gColumnItemCache.has( eid ) ) {
                        ci = this.columnItems[column.property] = gColumnItemCache.get( eid );
                        curItem = ci.item;
                    } else {
                        // if not create a column item and save in cache
                        curItem = item( eid );

                        if ( curItem.node ) { // make sure the item really exists
                            allFromCache = false;
                            ci = this.columnItems[column.property] = {
                                element$: curItem.element.closest( getFullCSSClassSel( "columnItem", o ) ),
                                item: curItem
                            };
                            gColumnItemCache.set( eid, ci );
                            // keep track of any items that may take a little longer to load
                            if ( curItem.whenReady ) {
                                this.asyncColumnItems.push( curItem.whenReady() );
                            }
                        }
                    }
                    if ( ci && !this.columnItemsContainer$ ) {
                        this.columnItemsContainer$ = ci.element$.parent();
                    }
                }
            }
            if ( !this.columnItemsContainer$ ) {
                if ( this.editable ) {
                    debug.error( `An editable ${this.widgetName} must have at least one column with a column item.` );
                }
            } else {
                if ( !allFromCache ) {
                    // take the hidden off-screen column items out of the tab order
                    this.columnItemsContainer$.find( SEL_TABBABLE ).addClass( C_JS_TABBABLE ).attr( "tabindex", -1);
                }
            }
        },

        _waitForColumnItems: function() {
            return $.when( ...this.asyncColumnItems );
        },

        // must only be used on an editable widget
        _activateColumnItem: function( columnItem, labelId ) {
            const el$ = columnItem.element$;

            // deactivate marks the item's tabbable elements, this makes them tabbable again
            el$.find( SEL_JS_TABBABLE ).attr( "tabindex", 0 ).removeClass( C_JS_TABBABLE );
            if ( labelId ) {
                // No need to add aria-labelledby, if labelId  points to the <label> tag
                if ( !$( "label[id='" + labelId + "']" ).length ) {
                    // Adds aria-labelledby, sync with _deactivateColumnItem
                    // todo: This works for our radio and checkbox group items but if a customer were to create
                    // an APEX item plug-in with radio group or checkbox group semantics (role = group
                    // or role = radiogroup) then this fix wouldn't work for that plug-in.
                    // See OraHub MR 747, bug-36455535 IG, Edit mode, Radio and checkbox groups hide first option...
                    if ( columnItem?.item?.item_type === "RADIO_GROUP" ) {
                        el$.find( "[role='radiogroup']" ).attr( ARIA_LABELLEDBY, labelId );
                    } else if ( columnItem?.item?.item_type === "CHECKBOX_GROUP" ) {
                        el$.find( "[role='group']" ).attr( ARIA_LABELLEDBY, labelId );
                    } else {
                        // todo should be a better way to find the element that is to be labeled
                        el$.find( SEL_TABBABLE ).first()
                            .attr( ARIA_LABELLEDBY, labelId );
                    } // item_type
                }
            }
        },

        // must only be used on an editable widget
        _deactivateColumnItem: function( columnItem ) {
            const el$ = columnItem.element$,
                tabs$ = el$.find( SEL_TABBABLE );

            // Remove label, sync with _activateColumnItem
            if ( columnItem?.item?.item_type === "RADIO_GROUP" ) {
                el$.find( "[role='radiogroup']" ).removeAttr( ARIA_LABELLEDBY );
            } else if ( columnItem?.item?.item_type === "CHECKBOX_GROUP" ) {
                el$.find( "[role='group']" ).removeAttr( ARIA_LABELLEDBY );
            } else {
                tabs$.first().removeAttr( ARIA_LABELLEDBY );
            }
            this.columnItemsContainer$.append( el$ ); // return it to the off-screen container
            // take it out of the tab order: make the item's tabbable elements focusable (if it was visible) and remember them
            tabs$.addClass( C_JS_TABBABLE ).attr( "tabindex", -1);
        },

        /*
        * This supports the derived widget having these column fields
        * linkTargetColumn
        * linkText
        * linkAttributes
        * cellTemplate
        * escape
        * readonly (only for inserted records identity fields)
        * And the widget options supported are:
        * showNullAs, highlighter, highlighterContext
        */
        // todo make a public static version of this in model, util, or here
        _renderFieldDataValue: function( out, col, rowItem, meta, cellMeta ) {
            const o = this.options;
            let value, substOptions, columnItem,
                targetUrl = null;

            // check if the cell has a target url. It can come from cell metadata or linkTargetColumn; aggregate rows cannot have links
            if ( ( ( cellMeta && cellMeta.url ) || col.linkTargetColumn ) && !meta.agg ) {
                if ( col.linkTargetColumn ) {
                    targetUrl = this.model.getValue( rowItem, col.linkTargetColumn ) || null;
                } else {
                    targetUrl = cellMeta.url;
                }
            }

            value = this.model.getValue( rowItem, col.property );

            // don't show the internally generated primary key unless it is an editable inserted row
            if ( ( meta.agg || ( meta.inserted && col.readonly ) ) && this.model.isIdentityField( col.property ) ) {
                value = "";
            }

            if ( col.linkText || col.linkAttributes || col.cellTemplate ) {
                substOptions = this.atOptions;
                substOptions.model = this.model;
                substOptions.record = rowItem;
            }

            // the anchor wraps the whole cell value
            if ( targetUrl ) {
                out.markup( "<a")
                    .attr( "href", targetUrl );
                if ( col.linkAttributes ) {
                    out.markup( applyTemplate( col.linkAttributes, substOptions ) );
                }
                out.markup( " tabindex='-1'>" );
            }

            if ( targetUrl && col.linkText ) {
                out.markup( applyTemplate( col.linkText, substOptions ) );
            } else if ( col.cellTemplate ) {
                if ( meta.agg ) {
                    // If value is undefined (row actions column) or null just use empty string, otherwise use the value
                    value = value == null ? "" : value;
                    out.content( "" + value );
                } else {
                    value = applyTemplate( col.cellTemplate, substOptions );
                    if ( o.highlighter ) {
                        value = o.highlighter( o.highlighterContext, value, col );
                    }
                    out.markup( value );
                }
            } else {
                if ( ( value === null || value === "" ) && ( o.showNullAs || meta.agg || targetUrl ) ) {
                    if ( meta.agg || meta.inserted || ( cellMeta && ( cellMeta.changed || cellMeta.error || cellMeta.warning ) ) ) {
                        value = "";
                    } else if ( targetUrl ) {
                        // strange to have a link with no text but also don't want to use showNulAs so default to the url
                        value = targetUrl;
                    } else {
                        value = o.showNullAs;
                    }
                    out.content( value );
                } else {
                    if ( value === null ) {
                        value = "";
                    }
                    // check to see if the model has a display value
                    if ( typeof value === "object" && hasOwnProperty( value, "d" ) ) {
                        value = value.d;
                    } else {
                        // otherwise if there is a column item it may have a display value
                        columnItem = this.columnItems[ col.property ];
                        if ( columnItem ) {
                            value = columnItem.item.displayValueFor( value, {
                                readonly: ( cellMeta && !!cellMeta.ck ) || col.readonly || meta.deleted || false,
                                disabled: ( cellMeta && cellMeta.disabled ) || false,
                                labelBy: col.domId
                            });
                        }
                    }

                    // if escape is false then value can contain markup otherwise it is escaped as element content
                    // note that the !== false test is so that anything else defaults to true.
                    if ( col.escape !== false ) {
                        value = util.escapeHTML( "" + value );
                    }
                    // todo to be removed once #35154278 is fixed
                    // currently only used by a Display Only column in HTML mode
                    if ( col.sanitize === true ) {
                        value = util.sanitizeHtml( "" + value );
                    }
                    if ( o.highlighter ) {
                        value = o.highlighter( o.highlighterContext, value, col );
                    }
                    out.markup( value );
                }
            }
            if ( targetUrl ) {
                out.markup( "</a>" );
            }
        },

        _beginSetColumnItems: function() {
            this.reinitCallbacks = [];
        },

        _setColumnItemValue: function( columnItem, record, field, meta ) {
            let cb,
                display = null,
                value = this.model.getValue( record, field );

            if ( value !== null && typeof value === "object" && hasOwnProperty( value, "d" ) ) {
                display = value.d;
                value = value.v;
            }
            if ( this.reinitCallbacks ) {
                // reinit does not cause a change event and if needed returns a function
                // to call after all items have been set
                cb = columnItem.reinit( value, display );
                if ( cb ) {
                    this.reinitCallbacks.push( cb );
                }
            } else {
                // tree this as a normal set, which includes the change event
                columnItem.setValue( value, display );
            }
            // update item disabled state from model metadata if available
            if ( meta ) {
                if ( meta.fields && meta.fields[field] && meta.fields[field].disabled ) {
                    columnItem.disable();
                } else {
                    columnItem.enable();
                }
            }
        },

        _endSetColumnItems: function() {
            const cbList = this.reinitCallbacks;

            if ( cbList ) {
                for ( let i = 0; i < cbList.length; i++ ) {
                    cbList[i]();
                }
            }
            this.reinitCallbacks = null;
        },

        _autoAddRecord: function( after ) {
            const newPK = this.model.insertNewRecord( null, after ); // this may cause a refresh

            this.model.getRecordMetadata( newPK ).autoInserted = true;
        },

        _triggerBeginEditing: function( record, recordId ) {
            this.element.trigger( EVENT_BEGIN_RECORD_EDIT, [{
                model: this.model,
                record: record,
                recordId: recordId
            }]);
        },

        _triggerEndEditing: function( record, recordId ) {
            this.element.trigger( EVENT_END_RECORD_EDIT, [{
                model: this.model,
                record: record,
                recordId: recordId
            }]);
        },

        _updateHighlights: function() {
            let o = this.options,
                sortedHighlights = [],
                styles = "";

            for ( const [i, h] of objectEntries( o.highlights ) ) {
                h.id = i;
                sortedHighlights.push(h);
            }
            // highlight style rules must be added in reverse order
            sortedHighlights.sort( ( a, b ) => {
                return b.seq - a.seq;
            } );

            for (let i = 0; i < sortedHighlights.length; i++) {
                let h = sortedHighlights[i];
                if ( !h.cssClass ) {
                    h.cssClass = ( h.row ? "hlr_" : "hlc_" ) + h.id;
                }
                if ( h.color || h.background ) {
                    if ( h.row ) {
                        styles += "." + h.cssClass + " td"; // todo think td doesn't seem right
                    } else {
                        styles += "td." + h.cssClass;
                    }
                    styles += " { ";
                    if ( h.color ) {
                        styles += "color: " + h.color + " !important; ";
                    }
                    if ( h.background ) {
                        styles += "background-color: " + h.background + " !important; ";
                    }
                    styles += "}\n";
                }
            }
            if ( !this.gridStyles$ && styles ) {
                this.gridStyles$ = $( "<style></style>" );
                $( "head" ).append( this.gridStyles$ );
            }
            if ( this.gridStyles$ ) {
                this.gridStyles$ = this.gridStyles$.text( styles );
            }
        },

        /**
         * Internal
         * @private
         */

        _findStateIcon: function ( pStateName ) {
            return this.stateIcons$.find( `[${DATA_STATE}='${pStateName}']` );
        },

        _setOption: function ( key, value ) {
            const o = this.options;

            this._super( key, value );

            if ( key === "noDataMessage" ) {
                // "No data found" message is wrapped into a landmark.
                // This landmark label must not be changed by the customized value
                //  "No data found" message has a decorative icon exposed to screen reader,
                // do not change the label for this icon by the customized value
                this.element.find( getFullCSSClassSel( C_GRID_ALT_MSG, o ) + " > div > " + getFullCSSClassSel( C_GRID_ALT_MSG_TEXT, o ) ).text( value );
            } else if ( key === "noDataIcon" ) {
                    this.element.find( getFullCSSClassSel( C_GRID_ALT_MSG, o ) + " > " + getFullCSSClassSel( C_GRID_ALT_MSG_ICON, o ) + " span" ).attr( ATTR_CLASS, "a-Icon " + value );
            } else if ( key === "rowsPerPage" ) {
                if ( o.pagination.scroll && !o.pagination.loadMore ) {
                    debug.warn("Ignoring rowsPerPage when scroll pagination.");
                    o.rowsPerPage = null;
                }
                if ( o.rowsPerPage ) {
                    this.pageSize = o.rowsPerPage;
                }
            } else if ( key === "hideDeletedRows" ) {
                this.element.toggleClass( getFullCSSClass( C_GRID_HIDE_DELETED, o ), value );
                if ( value === true ) {
                    this._deletedRowsHidden();
                }
                this._updateStatus();
            } else if ( key === "scrollParentOverride" ) {
                if ( o.hasSize ) {
                    debug.warn("Ignoring scrollParentOverride when hasSize is true.");
                } else {
                    this._updateScrollHandler();
                }
            } else if ( key === "applyTemplateOptions" ) {
                this.atOptions = $.extend( true, {}, o.applyTemplateOptions || {}, {
                    extraSubstitutions: {},
                    placeholders: {}
                } );
            }
        },

        /*
         * Call as part of view refresh. Either via _initPagination or directly.
         * scrollParent$ is only used when hasSize option is true
         */
        _updateScrollHandler: function( scrollParent$ ) {
            let o = this.options,
                prevScrollParent$ = this.scrollParent$,
                scrollParentOverride = o.scrollParentOverride;

            if ( o.hasSize ) {
                this.scrollParent$ = scrollParent$;
                this.scrollDelta = 0;
            } else {
                // if the widget has no fixed height then the scrollParent will never scroll and what is really
                // needed is to use the window as the scrollParent - scroll page when the window scrolls
                this.scrollParent$ = scrollParentOverride ? $( scrollParentOverride ) : $( window );
                this.scrollDelta = this.element.offset().top - this._getStickyTop();
            }

            this.totalRenderedRecords = 0;

            if ( o.pagination.scroll && !o.pagination.loadMore ) {
                if ( prevScrollParent$ && this._scrollHandler ) {
                    prevScrollParent$.off( "scroll", this._scrollHandler );
                } else {
                    this._scrollHandler = () => {
                        // only handle scroll paging if visible
                        if ( this.element[0].clientWidth > 0 ) {
                            this._scrollPage();
                        }
                    };
                }
                this.scrollParent$.on( "scroll", this._scrollHandler );
            }
        },

        _removeScrollHandler: function() {
            if ( this._scrollHandler ) {
                this.scrollParent$.off( "scroll", this._scrollHandler );
                this._scrollHandler = null;
            }
        },

        /*
         * This method is called by the _scrollHandler set up by _updateScrollHandler.
         * It is used for auto load-more (no fillers) and virtual scrolling (fillers).
         * Fillers are processed in:
         * - addPageOfRecords: finish: where to put the data and update fillers and checking bounds of collapsible control break
         * - _scrollPage handler: what offset to fetch new data at
         * - _initPageSize (due to resize) need to update filler heights.
         * - focus/selection navigation needs to be aware of fillers, collapse/expand also
         */
        _scrollPage: function() {
            const self = this,
                  st = this.scrollParent$.scrollTop();

            // When user scrolls need to determine what range of data to render if any (pageOffset).
            // This is done by comparing the offset of the filler rows to the scroll view port
            // to see if any of the filler rows are in or near the view port.

            // throttle how often we check the scroll offset for paging
            if ( st !== this.lastScrollTop ) {
                this.lastScrollTop = st;

                if ( !this.scrollPageTimer ) {
                    this.scrollPageTimer = setTimeout( function() {
                        // Because of the delay it is possible for the view/model to be destroyed; exit if so
                        if ( !self.model ) {
                            return;
                        }
                        let dataCont$, st, prevOffset, vpHeight, vpTop, vpBottom, total, isTable,
                            fillers$ = null,
                            pageAdded = false,
                            hasTotalRecords = modelHasTotalRecords( self.model ),
                            spIsWindow = self.scrollParent$[0] === window,
                            rowHeight = self.avgRowHeight;

                        self.scrollPageTimer = null;

                        // while rendering the start, end bounds of fillers are in flux so just wait for next scroll event
                        if ( self.renderInProgress ) {
                            // avoid dup scroll page checks but try again just in case another scroll event doesn't
                            // happen soon so that we are not left with blank area showing.
                            self.lastScrollTop = null;
                            self._scrollPage();
                            return;
                        }
                        vpHeight = self.scrollParent$.height();
                        vpTop = 0 - ( vpHeight / 2 ); // widen the view port bounds to render more rows early to avoid blank spaces
                        vpHeight *= 2; // because of widening the view port
                        vpBottom = vpTop + vpHeight;

                        dataCont$ = self._getDataContainer();
                        st = self.scrollParent$.scrollTop();
                        if ( self.hasScrollFillers ) {
                            // if the data container has more than one element they should each have the same filter offsets so only need the first one
                            fillers$ = dataCont$.find( SEL_GRID_SCROLL_FILLER );
                            if ( !fillers$.length && hasTotalRecords ) {
                                // if there are no more filler then must have all the data and can remove this scroll paging handler
                                self._removeScrollHandler();
                            }
                            prevOffset = self.pageOffset;

                            if ( dataCont$[0] ) {
                                isTable = dataCont$[0].nodeName === "TBODY";
                            }

                            fillers$.each(function() {
                                const f$ = $( this ),
                                    // want the actual property value. don't measure with f$.height() because of collapsed fillers
                                    fHeight = toInteger( this.style.height ),
                                    // start and end are zero based indexes
                                    start = toInteger( f$.attr( DATA_START ) ),
                                    end = toInteger( f$.attr( DATA_END ) );
                                let bottom, top;

                                // empty filler rows should be removed but just in case
                                if ( start > end ) { // start = end represents one row/item (bug 35717714)
                                    return;
                                }
                                // want the top of the filler adjusted by the scroll offset to determine where
                                // it is relative to the viewport.
                                top = spIsWindow ? f$.offset().top : f$.position().top;
                                // in some cases the scroll position is already included otherwise subtract the scroll offset
                                if ( spIsWindow || isTable ||
                                    f$.offsetParent().closest( self.scrollParent$ ).length > 0 ) {
                                    top -= st;
                                }
                                bottom = top + fHeight;
                                if ( top <= vpBottom && bottom >= vpTop ) {
                                    // Figure out if adding to start, middle or end of filler based on where the filler is
                                    // within the view port.
                                    if ( fHeight < ( vpHeight * 2 ) || top > vpTop  ) {
                                        self.pageOffset = start;
                                    } else if ( bottom < vpBottom ) {
                                        self.pageOffset = pageBoundary( end, self.pageSize );
                                    } else {
                                        self.pageOffset = pageBoundary( start + Math.ceil( ( vpTop + vpHeight/2 - top ) * self._getRecordsPerRow() / rowHeight ), self.pageSize );
                                    }

                                    if ( self.pageOffset !== prevOffset ) {
                                        // just in case don't add pages for offset already at
                                        self._addPageOfRecords();
                                    }
                                    pageAdded = true;
                                    if ( !fillerVisible( f$ ) ) {
                                        // if the filler is invisible that means the rows were in a collapsed control break
                                        // need to make the filler visible again
                                        toggleFillerVisible( f$, true );
                                    }
                                    return false; // no need to check any more fillers
                                }
                            } );
                        }
                        if ( !pageAdded && ( !hasTotalRecords || !self.hasScrollFillers ) ) { // when have total records there will be a filler at the end if needed
                            let bottom = dataCont$.height();

                            if ( spIsWindow || dataCont$.offsetParent().closest( self.scrollParent$ ).length > 0 ) {
                                bottom += spIsWindow ? dataCont$.offset().top : dataCont$.position().top;
                            }
                            bottom = bottom - st;
                            if ( bottom > 0 && bottom <= ( vpHeight * 1.5 ) ) {
                                total = self.model.getTotalRecords();
                                // Check highWaterMark to see if more data should be added at the very end.
                                // Can't use pageOffset here because with virtual paging it can be at random places
                                // not just at the end.
                                if ( total < 0 || self.highWaterMark < total ) {
                                    self.pageOffset = self.highWaterMark;
                                    self._addPageOfRecords();
                                } else if ( ( fillers$ && fillers$.length === 0 ) || ( !fillers$ && total === self.totalRenderedRecords ) ) {
                                    self._removeScrollHandler();
                                }
                            }
                        }

                    }, SCROLL_PAGE_CHECK );
                }
            }

        },

        /**
         * Internal
         * @private
         */
        _updateTotalRecords: function() {
            const o = this.options,
                footer$ = this.footer$,
                pageSelector$ = this.pageSelector$,
                pagination = o.pagination,
                total = this.model.getTotalRecords(),
                serverTotal = this.model.getServerTotalRecords(),
                hasTotalRecords = modelHasTotalRecords( this.model );
            let start, end, range, pages, pageKey, ellip,
                totalPages = null,
                currentPage = null;

            function getTotalMessage( pSeverTotal ) {
                if ( pSeverTotal === 1 && o.entityTitleSingular ) {
                    // is added as text so no escaping should be used
                    return formatMessageNoEscape( "TOTAL_ENTITY_SINGULAR", o.entityTitleSingular );
                } else if ( pSeverTotal > 1 && o.entityTitlePlural ) {
                    // is added as text so no escaping should be used
                    return formatMessageNoEscape( "TOTAL_ENTITY_PLURAL", serverTotal, o.entityTitlePlural );
                } else {
                    return formatMessage( "TOTAL_PAGES", serverTotal );
                }
            }

            if ( hasTotalRecords ) {
                this._updateStatus(); // because total records can potentially change
            }

            if ( total >= 0 ) {
                totalPages = Math.ceil( total / this.pageSize );
                currentPage = Math.floor( this.pageOffset / this.pageSize );
            }

            // if data is added after _refreshPagination (as when being refreshed) preserve scroll offsets
            if ( this.lastScrollLeft !== null )  {
                this.scrollParent$.scrollLeft( this.lastScrollLeft );
                this.scrollParent$.scrollTop( this.lastScrollTop );
                this.lastScrollLeft = null;
                this.lastScrollTop = null;
            }

            this.onLastPage = false;
            if ( this.pageCount === 0 && this.pageOffset === 0 ) {
                range = "";
                this.onLastPage = true;
                footer$.find( SEL_PAGE_CONTROLS ).attr( ATTR_DISABLED, true );
                // Bug 35033882
                // This span element has no visual content, but has a title attribute,
                // screen readers expose this title attribute as a plain text  when this span is visually empty.
                // As the result, screen reader exposes orphan "Page rows" without pagination for grids with no data.
                footer$.find( SEL_RANGE_DISPLAY ).attr( ARIA_HIDDEN, TRUE );
            } else {
                footer$.find( SEL_PAGE_CONTROLS ).attr( ATTR_DISABLED, false );
                // Bug 35033882
                // This span element could have no visual content, but has a title attribute,
                // screen readers expose this title attribute as a plain text  when this span is visually empty.
                // Therefore, this element should be hidden from screen reader when no rows,
                // and shown back when rows are back (after refresh).
                footer$.find( SEL_RANGE_DISPLAY ).removeAttr( ARIA_HIDDEN );
                this.element.find( ".js-load" ).attr( ATTR_DISABLED, false );
                if ( this.pageOffset === 0 ) {
                    // at the beginning disable prev and first
                    footer$.find( ".js-pg-prev,.js-pg-first" ).attr( ATTR_DISABLED, true );
                }
                if ( total > 0 && currentPage === totalPages - 1 ) {
                    this.onLastPage = true;
                    // at the end disable next and last and loadMore
                    footer$.find( ".js-pg-next,.js-pg-last" ).attr( ATTR_DISABLED, true );
                    this.element.find( ".js-load" ).attr( ATTR_DISABLED, true );
                }
                // The hideSinglePage option applies to loadMore button as a pagination control
                if ( pagination.loadMore && pagination.hideSinglePage ) {
                    this.element.find( ".js-load" ).toggle( totalPages !== 1 );
                }
                if ( pagination.scroll && pagination.virtual && !pagination.loadMore && hasTotalRecords ) {
                    // todo maybe it should be more than just model hasTotalRecords. Maybe also model paginationType is none
                    range = getTotalMessage( serverTotal );
                } else {
                    if ( hasTotalRecords ) {
                        if ( pagination.hideSinglePage && totalPages === 1 ) {
                            range = getTotalMessage( serverTotal );
                        } else {
                            range = formatMessage( "PAGE_RANGE_XYZ", this.pageFirstOffset, this.pageLastOffset, serverTotal );
                        }
                    } else {
                        range = formatMessage( "PAGE_RANGE_XY", this.pageFirstOffset, this.pageLastOffset );
                    }
                }
            }

            // The active element is sometimes null on IE11 and according to the spec null is in general possible
            if ( document.activeElement && document.activeElement.disabled ) {
                // When at the end of load more paging don't lose focus
                if ( $( document.activeElement ).hasClass( "js-load" ) ) {
                    this.focus();
                }
                // todo consider if focus should be adjusted if any of the page buttons are focused but disabled
            }

            if ( this.pageRange$ ) {
                this.pageRange$.text( range );
            }

            if ( totalPages > 0 ) {
                if ( pagination.showPageLinks ) {
                    // only update the page links if the total pages, page size changes, or the current page changes because the links need to slide
                    pageKey = `${total}_${this.pageSize}_${currentPage}`;
                    if ( this.pageKey !== pageKey ) {
                        ellip = `<li class="${ getFullCSSClass( "pageSelector-item", o ) }">&hellip;</li>`;
                        this.pageKey = pageKey;

                        pages = `<ul class="${ getFullCSSClass( "pageSelector-list", o ) }">`;
                        // at most maxLinks links
                        start = currentPage - Math.floor( pagination.maxLinks / 2 );
                        if ( start < 0 ) {
                            start = 0;
                        }
                        end = start + pagination.maxLinks;
                        if ( end >= totalPages ) {
                            end = totalPages;
                            start = end - pagination.maxLinks;
                            if ( start < 0 ) {
                                start = 0;
                            }
                        }

                        if ( start > 0 ) {
                            pages += ellip;
                        }
                        for ( let i = start; i < end; i++ ) {
                            pages += `<li class="${ getFullCSSClass( "pageSelector-item", o ) }" ${DATA_PAGE}='${i}'><button class="${ getFullCSSClass( "pageButton", o ) }" type='button'>${i + 1}</button></li>`;
                        }
                        if ( end < totalPages ) {
                            pages += ellip;
                        }
                        pages += "</ul>";
                        pageSelector$.html( pages );
                    }
                    pageSelector$.find( SEL_SELECTED )
                        .removeClass( C_SELECTED )
                        .removeAttr( ARIA_CURRENT )
                        .attr( ARIA_CONTROLS );
                    pageSelector$.find( `[${DATA_PAGE}='${currentPage}']` )
                        .addClass( C_SELECTED )
                        .attr( ARIA_CURRENT, "page" )
                        .attr( ARIA_CONTROLS, this.element[0].id );
                } else if ( pagination.showPageSelector ) {
                    // only update the page selector if the total pages or page size changes
                    pageKey = `${total}_${this.pageSize}`;
                    if ( this.pageKey !== pageKey ) {
                        this.pageKey = pageKey;

                        pages = `<select class="${ getFullCSSClass( "pageSelectlist", o ) }" size='1' aria-label='${getMessage( "PAGE_SELECTION" )}' aria-controls='${ this.element[0].id }'>`;
                        for ( let i = 0; i < totalPages; i++ ) {
                            pages += `<option value='${i}'>${formatMessage( "SELECT_PAGE_N", i + 1 )}</option>`;
                        }
                        pages += "</select>";
                        pageSelector$.html( pages );
                    }
                    pageSelector$.children( "select" ).val( currentPage );
                }
            } else {
                // no pages so need to clear out page selector if any.
                pageSelector$.empty();
                this.pageKey = null;
            }

            if ( pagination.hideSinglePage && !pagination.scroll ) {
                footer$
                    .find( SEL_PAGE_CONTROLS )
                    .add( pageSelector$ )[totalPages === 1 ? "hide" : "show"]();

                footer$.find( SEL_RANGE_DISPLAY )[hasTotalRecords ? "show" : "hide"]();
            }

            footer$[this.noData && o.hideEmptyFooter ? "hide" : "show"]();
        },

        /**
         * Internal
         * @private
         */
        _updateAvgRowHeight: function() {
            let newAvgHeight,
                o = this.options;

            if ( o.fixedRowHeight ) {
                newAvgHeight = this._getFixedRecordHeight();
            } else {
                let totalHeight,
                    recPerRow = this._getRecordsPerRow(),
                    renderedRows = Math.ceil( this.totalRenderedRecords / recPerRow );

                if ( renderedRows <= 0 ) {
                    newAvgHeight = this.avgRowHeight || this._getFixedRecordHeight();
                } else {
                    totalHeight = this._getDataContainer().height();
                    // todo maybe the total filler height can be tracked rather than measured each time
                    this._getDataContainer().find( SEL_GRID_SCROLL_FILLER ).each( function () {
                        totalHeight -= $( this ).height();
                    } );
                    newAvgHeight = totalHeight / renderedRows;
                }
            }
            // just in case never let row height be non-positive
            if ( newAvgHeight <= 0 ) {
                // could be because view not visible? must never let row height be 0 to avoid divide by 0
                newAvgHeight = SAFE_DEFAULT_ROW_HEIGHT;
            }
            this.avgRowHeight = newAvgHeight;
        },

        /**
         * Return the height of the stickyTop of the header.
         * Return 0 if there is no sticky header.
         * @return {Number}
         * @private
         */
        _getStickyTop: function() {
            let stickyTop = this.options.stickyTop;

            return typeof stickyTop === "function" ? stickyTop() : 0;
        },

        //
        // Methods to implement/override
        //

        // refresh

        /**
         * Return the height of a widget header that should be considered when the footer is stuck.
         * Return 0 if there is no header.
         * @return {Number}
         * @private
         */
        _getHeaderHeight: function() {
            return 0;
        },

        /**
         * Return the number of records displayed on a row. Typically this is 1.
         * @return {Number}
         * @private
         */
        _getRecordsPerRow: function() {
            return 1;
        },

        /**
         * Return the height of a record in the view.
         * @return {Number}
         * @private
         */
// Derived widget must implement so no need for base implementation
//        _getFixedRecordHeight: function() {
//            return 40;
//        },

        /**
         * Return a html builder rendering context to be passed to all the rendering functions.
         * Typically, this is just a html builder, but it can be an object including more context.
         * @return {*}
         * @private
         */
        _getDataRenderContext: function () {
            return util.htmlBuilder();
        },

        /**
         * Return a jQuery object for the element
         * that will contain all the records. It is the element that scrolls not the scroll view port.
         * @return {jQuery}
         * @private
         */
// Derived widget must implement so no need for base implementation
//        _getDataContainer: function() {
//            return $();
//        },

        /**
         * Return the number of selected records.
         * @return {Number}
         * @private
         */
        _selectedCount: function() {
            return 0;
        },

        /**
         * Return a localized message string used to display the number of things selected.
         * The string must contain the %0 parameter that will be replaced with the actual count.
         * @returns {string}
         * @private
         */
        _selectedStatusMessage: function( count ) {
            const o = this.options;

            if ( o.entityTitlePlural && o.entityTitleSingular ) {
                return formatMessageNoEscape( "SELECTED_ENTITY_COUNT", count,
                    count === 1 ? o.entityTitleSingular : o.entityTitlePlural );

            } // else
            // don't use the local formatMessage function here
            return lang.formatMessage( o.selectionStatusMessageKey, count );
        },

        /**
         * Called when the selection might have changed because of adding data to the model
         * @private
         */
// Derived widget must implement so no need for base implementation
//        _checkSelectionChange: function( originalCount ) {
//        },

        /**
         * Called when deleted rows are hidden or when a new row is deleted while deleted rows are hidden
         * @private
         */
        _deletedRowsHidden: function() {
        },

        /**
         * Return the number of deleted records.
         * @return {Number}
         * @private
         */
        _deletedCount: function() {
            return 0;
        },

        _hasControlBreaks: function() {
            return false;
        },

        _hasNestedControlBreaks: function() {
            return false;
        },

        _controlBreakSelector: function() {
            return null;
        },

        // only needed when _hasNestedControlBreaks is true
        _itemSelector: function() {
            return null;
        },

        _elementsFromRecordIds: function( /* ids */ ) {
            return [];
        },

        _renderFillerRecord: function ( /* out, cssClass */ ) {
        },

// Derived widget must implement so no need for base implementation
//        _insertFiller: function( /* out, curFiller$ */ ) {
//            return $();
//        },

// Derived widget must implement so no need for base implementation
//        _insertData: function( out, filler$, how ) {
//        },

        // returns break data such as { label: "" ...}
        _controlBreakData: function( /* record */ ) {
            return {};
        },

        _renderBreak: function ( out, expandControl, breakData /*, serverOffset */ ) {
            out.markup( "<h3>" )
                .content( breakData.label )
                .markup( "</h3>" );
        },

        _renderEndBreak: function( /* out, breakData */ ) {
        },

        _renderRecord: function( /* out, record, index, id, meta */ ) {
        },

        _removeRecord: function( /* element */ ) {
        },

        _insertRecord: function( /* element, record, id, meta, where */ ) {
            return $();
        },

        _afterInsert: function( /* insertedElements, copy */ ) {
        },

        _identityChanged: function( /* prevId, id */ ) {
        },

        _replaceRecord: function( /* element, record, oldId, id, meta */ ) {
        },

        _updateRecordField: function( /* element, record, field, meta */ ) {
        },

        _removeFocus: function( /* element */ ) {
        },

        _updateRecordState: function( /* element, id, record, meta, property */ ) {
        }
    });

    /**
     * For unit testing and cases where the editable column items get destroyed and/or recreated.
     * This is rarely needed because items and regions generally exist for the whole lifetime of a page.
     * When editable views and items can be destroyed and recreated this static method should be
     * used to remove any of the old items from the internal column item cache.
     * todo consider if this needs to be documented
     * @param {Element} [pItemContainer]
     * @ignore
     */
    $.apex.tableModelViewBase.clearColumnItemCache = function( pItemContainer ) {
        if ( pItemContainer ) {
            for ( const [prop, ci] of gColumnItemCache.entries() ) {
                if ( ci.element$.parent()[0] === pItemContainer ) {
                    gColumnItemCache.delete( prop );
                }
            }
        } else {
            gColumnItemCache.clear();
        }
    };

})( apex.util, apex.model, apex.debug, apex.lang, apex.item, apex.jQuery );
