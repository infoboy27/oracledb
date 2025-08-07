/*!
 Copyright (c) 2015, 2024, Oracle and/or its affiliates.
*/
// todo consider tooltip support and context menu mixin
/**
 * @uiwidget tableModelView
 * @since 5.1
 * @extends {tableModelViewBase}
 *
 * @classdesc
 * <p>A template driven UI widget report view for table shape data in an APEX {@link model} that supports pagination,
 * selection, and control breaks. Derived from {@link tableModelViewBase}.
 * It does not directly support editing but does respond to model changes. The contents of the report are called
 * items (not to be confused with APEX Page Items or Column Items). The items represent the records from the model.
 * This kind of report is also known as a "list view" or "cards view" depending on what the items look like.
 * </p>
 *
 * <p>Note: Not all the options and methods from the base widget apply to this widget. For example
 * options and methods related to editing do not apply.</p>
 *
 * <p>The expected markup is an empty element; typically a <code class="prettyprint">&lt;div></code>.</p>
 *
 * <p>There are two ways to define the item markup for the view.
 * Configure with options {@link tableModelView#beforeTemplate}, {@link tableModelView#recordTemplate}, and
 * {@link tableModelView#afterTemplate} for complete control over the
 * markup. Or configure with options {@link tableModelView#iconClassColumn}, {@link tableModelView#imageURLColumn},
 * {@link tableModelView#imageAttributes}, {@link tableModelView#labelColumn}, {@link tableModelView#linkTarget},
 * {@link tableModelView#linkTargetColumn}, and {@link tableModelView#linkAttributes} for default list markup.</p>
 *
 * <div class="hw">
 * <h3 id="selection-section">Selection, keyboard navigation, and focus management</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Selection" href="#selection-section"></a>
 * </div>
 * <p>The view supports optional focus management and single or multiple selection. This is controlled by the
 * {@link tableModelView#itemNavigationMode} and {@link tableModelView#multiple} options.
 * When focus or selection is enabled the report manages the focus so that only a single item is a tab stop and
 * arrow keys are used to move the focus to other items. If an item contains elements such as links or buttons that
 * also take focus then just those elements in the currently focused item can be tabbed to.
 * For multiple selection standard keyboard modifiers Shift and Ctrl are combined with arrow keys or mouse clicks
 * to select multiple items. See the <a href="#keyboard-section">Keyboard End User Information</a> section for details.
 * </p>
 * <p>The selection state can be accessed with methods such as {@link tableModelView#getSelectedRecords} and
 * changed with methods such as {@link tableModelView#setSelectedRecords}.
 * The {@link tableModelView#selectionStateItem} option specifies an APEX page
 * item that will have its value updated to reflect the current selection.
 * </p>
 *
 * <div class="hw">
 * <h3 id="markup-section">Template markup</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Selection" href="#markup-section"></a>
 * </div>
 * <p>Templates are processed with {@link apex.util.applyTemplate} and can contain data substitutions, placeholders,
 * and template directives. See {@link apex.util.applyTemplate} for details. See each of the template
 * options ({@link tableModelView#headerTemplate}, {@link tableModelView#beforeTemplate},
 * {@link tableModelView#recordTemplate}, {@link tableModelView#aggregateTemplate},
 * {@link tableModelView#controlBreakTemplate}, {@link tableModelView#controlBreakBeforeTemplate},
 * {@link tableModelView#controlBreakAfterTemplate}, and {@link tableModelView#afterTemplate})
 * for details on any special substitutions or placeholders. See {@link tableModelView#applyTemplateOptions}
 * for how to pass additional options to <code class="prettyprint">applyTemplate</code>.</p>
 *
 * <p>There are a few requirements for the template markup so that the report view functions correctly and is
 * accessible. The following markup patterns are supported:</p>
 * <ul>
 *     <li><strong>Layout grid</strong> This is a collection element with role="grid" containing elements with
 *     role="row" and each row element contains exactly one item element with role="gridcell". This is the most
 *     accessible pattern especially when using selection. The "grid" role element requires an accessible label.
 *     The "gridcell" element requires an <code class="prettyprint">aria-label</code> attribute that identifies
 *     the item. Typically, you would use a data substitution of the same column that is given in the
 *     {@link tableModelView#accLabelColumn} option. Example:
 * <pre class="prettyprint"><code>&lt;ul role="grid" aria-label="My Report">   &lt;!-- beforeTemplate -->
 *   &lt;li role="row">                         &lt;!-- recordTemplate -->
 *     &lt;div class="my-item" role="gridcell" aria-label="&<em>NAME_COLUMN</em>!ATTR.">
 *       ...
 *     &lt;/div>
 *   &lt;/li>
 * &lt;/ul>                                     &lt;!-- afterTemplate -->
 * </code></pre>
 *     <li><strong>Simple list</strong> This is a collection element with items as the children elements. Typically
 *     this is a <code class="prettyprint">&lt;ul></code> containing <code class="prettyprint">&lt;li></code>s,
 *     but it could also be a <code class="prettyprint">&lt;div></code> with <code class="prettyprint">&lt;p></code>
 *     children, for example. Example:
 * <pre class="prettyprint"><code>&lt;ul class="my-list-view">      &lt;!-- beforeTemplate -->
 *   &lt;li class="my-item">         &lt;!-- recordTemplate -->
 *       ...
 *   &lt;/li>
 * &lt;/ul>                          &lt;!-- afterTemplate -->
 * </code></pre>
 *     <li><strong>Simple table</strong> This is table markup where the <code class="prettyprint">&lt;tbody></code>
 *     element is the collection element and the items are the <code class="prettyprint">&lt;tr></code> elements.
 *     Example:
 * <pre class="prettyprint"><code>&lt;table>&lt;tbody>           &lt;!-- beforeTemplate -->
 *   &lt;tr class="my-item">   &lt;!-- recordTemplate -->
 *       ...
 *   &lt;/tr>
 * &lt;/tbody>&lt;/table>         &lt;!-- afterTemplate -->
 * </code></pre>
 * </ul>
 * <p>In the above examples the item element has class "my-item", so ".my-item" is the value to set for option
 * {@link tableModelView#itemSelector}. Any class or other selector can be used. It is the item element that is returned
 * by or passed to the various selection methods. The item element must have attributes
 * <code class="prettyprint">data-id</code> and <code class="prettyprint">data-rownum</code>
 * with values from substitution symbols <code class="prettyprint">&APEX$ROW_ID.</code> and
 * <code class="prettyprint">&APEX$ROW_INDEX.</code> respectively. Or more simply by using
 * the <code class="prettyprint">#APEX$ROW_IDENTIFICATION#</code> placeholder as shown in the example below.</p>
 *
 * <p>If the report will support selection and a selector control is desired add the
 * <code class="prettyprint">#APEX$SELECTOR#</code> placeholder somewhere
 * within the item element in the recordTemplate. This placeholder will be replaced with the appropriate markup
 * for either a radio button or checkbox depending on if single or multiple selection is configured.</p>
 *
 * <p>Control breaks (also known as groups) allow visually grouping related items together. The model data must be
 * configured to have control breaks. Note that the model does not actually contain records that represent
 * the control break. The breaks are synthesized in the view layer when the model data has a change in
 * value of control break columns. There are two cases:</p>
 * <ol>
 *     <li>An item in the collection can serve as a heading providing visual context to the items after it.
 *     This is known as flat grouping.
 * This case uses the {@link tableModelView#controlBreakTemplate} option.
 * </li>
 *     <li>Two level nested markup can be used such as a list of lists or a layout grid of layout grids.
 * The first level represents the groups and the second level is the items in each group.
 * The group element contains the item elements as descendents.
 * This is known as nested grouping. This case uses the {@link tableModelView#controlBreakBeforeTemplate} and
 * {@link tableModelView#controlBreakAfterTemplate} options.
 * <p class="important">Note: Nested groups do not work with virtual scroll pagination or with aggregate records.</p>
 * </li>
 * </ol>
 *
 * <p>For flat grouping the only change to the minimal markup is having a way to identify that an item is
 * also a group. In the above examples the item element would change as follows:
 * <pre class="prettyprint"><code>    &lt;li role="row">    &lt;!-- controlBreakTemplate -->
 *         &lt;div class="my-item my-group" role="gridcell" aria-label="&<em>GROUP_COLUMN</em>!ATTR.">
 *           ...
 *         &lt;/div>
 *     &lt;/li>
 * </code></pre>
 * or
 * <pre class="prettyprint"><code>    &lt;li class="my-item my-group">    &lt;!-- controlBreakTemplate -->
 *       ...
 *     &lt;/li>
 * </code></pre>
 * or
 * <pre class="prettyprint"><code>    &lt;tr class="my-item my-group">    &lt;!-- controlBreakTemplate -->
 *       ...
 *     &lt;/tr>
 * </code></pre>
 *
 * <p>In the above examples the "my-group" class indicates that the element is a group so ".my-group" is the
 * value to set for option {@link tableModelView#controlBreakSelector}.
 * The group item typically contains a group heading or label for the group and
 * is visually distinguished from items.
 * </p>
 *
 * <p>For nested grouping the group element contains an element that acts as a heading for the group and a
 * container element that contains the items. The heading element must be the first child of the group element.
 * The group heading need not be an HTML heading element. An &lt;h4> is just used as an example below.
 * </p>
 * <p>The following example is for a simple list of lists:</p>
 * <pre class="prettyprint"><code>&lt;ul>    &lt;!-- beforeTemplate -->
 *     &lt;li class="my-group">    &lt;!-- controlBreakBeforeTemplate -->
 *         &lt;h4><em>This is the header for the &GROUP_COLUMN.</em>&lt;/h4>
 *         &lt;ul> &lt;!-- container for the items in the group -->
 *             &lt;li class="my-item">    &lt;!-- recordTemplate -->
 *               ...
 *             &lt;/li>
 *         &lt;/ul>    &lt;!-- controlBreakAfterTemplate -->
 *         &lt;!-- any text or markup here is not included in navigation or selection, so may not be accessible -->
 *     &lt;/li>
 * &lt;/ul>    &lt;!-- afterTemplate -->
 * </code></pre>
 *
 * <p>The following example is for a layout grid of layout grids:</p>
 * <pre class="prettyprint"><code>&lt;ul role="grid" aria-label="Example List">    &lt;!-- beforeTemplate -->
 *     &lt;li role="row">    &lt;!-- controlBreakBeforeTemplate -->
 *         &lt;div class="my-group" role="gridcell">
 *             &lt;h4><em>This is the header for the &GROUP_COLUMN.</em>&lt;/h4>
 *             &lt;ul role="grid" aria-label="Group &GROUP_COLUMN!ATTR."> &lt;!-- container for the items in the group -->
 *                 &lt;li role="row">    &lt;!-- recordTemplate -->
 *                     &lt;div class="my-item" role="gridcell" aria-label="&<em>NAME_COLUMN</em>!ATTR.">
 *                       ...
 *                     &lt;/div>
 *                 &lt;/li>
 *             &lt;/ul> &lt;!-- controlBreakAfterTemplate -->
 *         &lt;/div>
 *         &lt;!-- any markup here is not included in navigation or selection -->
 *     &lt;/li>
 * &lt;/ul>    &lt;!-- afterTemplate -->
 * </code></pre>
 *
 * <p>In both cases the group element must have attributes <code class="prettyprint">data-group-id</code> and
 * <code class="prettyprint">data-rownum</code> with values from substitution symbols
 * <code class="prettyprint">&APEX$GROUP_ID.</code> and <code class="prettyprint">&APEX$ROW_INDEX.</code> respectively.
 * Or more simply by using the <code class="prettyprint">#APEX$GROUP_IDENTIFICATION#</code> placeholder.
 *
 * <p>Group items can never be selected but they can be focused. A selector control is not supported in group items.
 * Group items can have arbitrary markup including links and buttons. Keyboard navigation is treated the same
 * as for items.</p>
 *
 * <div class="hw">
 * <h3 id="keyboard-section">Keyboard End User Information</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark Keyboard End User Information" href="#keyboard-section"></a>
 * </div>
 * <table>
 * <caption>List of keyboard shortcuts</caption>
 * <thead>
 * <tr><th scope="col">Key</th><th scope="col">Action</th></tr>
 * </thead>
 * <tbody>
 * <tr><th scope="row">Up Arrow</th>             <td>Moves focus or selection to the previous item.</td></tr>
 * <tr><th scope="row">Down Arrow</th>           <td>Moves focus or selection to the next item.</td></tr>
 * <tr><th scope="row">Left Arrow</th>           <td>Moves focus or selection to the previous item.</td></tr>
 * <tr><th scope="row">Right Arrow</th>          <td>Moves focus or selection to the next item.</td></tr>
 * <tr><th scope="row">Home</th>                 <td>Moves focus or selection to the first item.</td></tr>
 * <tr><th scope="row">End</th>                  <td>Moves focus or selection to the last item.</td></tr>
 * <tr><th scope="row">Space</th>                <td>Selects the focused item</td></tr>
 * <tr><th scope="row">Ctrl+A</th>               <td>Selects all items if allowed.</td></tr>
 * </tbody>
 * </table>
 * <p>These keys are only supported when focus or selection is enabled
 * ({@link tableModelView#itemNavigationMode} is not "none"). Space and Ctrl+A only apply for multiple selection.
 * For multiple selection the Ctrl and Shift keys modify how the arrow, Home, and End keys and Space key
 * affect the selection. The Shift key extends the selection to include the new item.
 * The Ctrl key moves focus without changing the selection. The Space key selects the currently focused item.
 * Ctrl+Space will toggle selection for the current item.</p>
 *
 * <div class="hw">
 * <h3 id="classes-section">CSS Classes</h3>
 * <a class="bookmarkable-link" title="Bookmarkable Link" aria-label="Bookmark CSS Classes" href="#classes-section"></a>
 * </div>
 * <p>Most of the classes are provided by the template configuration, however there are a few classes added by
 * this widget that you can use in your CSS rules.
 * <table>
 * <caption>List of CSS Classes used by tableModelView widget</caption>
 * <thead>
 * <tr><th scope="col">Class</th><th scope="col">Purpose</th></tr>
 * </thead>
 * <tbody>
 * <tr><th scope="row">a-TMV</th>           <td>The root widget element.</td></tr>
 * <tr><th scope="row">a-TMV-item</th>      <td>Item element class only if
 *     {@link tableModelView#recordTemplate} is null.</td></tr>
 * <tr><th scope="row">is-selected</th>     <td>A state class on selected item elements.</td></tr>
 * <tr><th scope="row">is-focused</th>      <td>A state class on the focused (current) item element.</td></tr>
 * </tbody>
 * </table>
 *
 * @desc Creates a tableModelView widget.
 *
 * @param {Object} options A map of option-value pairs to set on the widget.
 *
 * @example <caption>Create a tableModelView for name value pairs displayed in a simple table.</caption>
 *   var fields = {
 *           PARTNO: {
 *               index: 0
 *           },
 *           PART_DESC: {
 *               index: 1
 *           }
 *       },
 *       data = [
 *           ["B-10091", "Spark plug"],
 *           ["A-12872", "Radiator hose"],
 *           ...
 *       ];
 *   apex.model.create("parts", {
 *           shape: "table",
 *           recordIsArray: true,
 *           fields: fields,
 *           paginationType: "progressive"
 *       }, data, data.length );
 *   $("#partsView").tableModelView( {
 *       modelName: "parts",
 *       beforeTemplate: '<table class="u-Report"><thead><tr><th>Part No</th><th>Description</th></tr></thead><tbody>',
 *       afterTemplate: '</tbody></table>',
 *       recordTemplate: '<tr #APEX$ROW_IDENTIFICATION#><td>&PARTNO.</td><td>&PART_DESC.</td></tr>',
 *       pagination: {
 *           scroll: true
 *       }
 *   } );
 */
/*
 * Depends:
 *    jquery.ui.core.js
 *    jquery.ui.widget.js
 *    util.js
 *    lang.js
 *    debug.js
 *    model.js
 *    item.js
 *    widget.stickyWidget.js (only if stickyFooter or stickyTop is not false)
 *    widget.tableModelViewBase.js
 */
( function ( util, model, debug, lang, item, $ ) {
    "use strict";

    const C_DEFAULT_CLASS_PREFIX = "a-GV",
        C_LOAD_MORE_BUTTON = "loadMoreButton",
        C_DELETED = "is-deleted",
        C_SELECTED = "is-selected",
        SEL_VISIBLE = ":visible",
        DATA_ID = "data-id",
        DATA_GROUP_ID = "data-group-id",
        DATA_ROWNUM = "data-rownum",
        ATTR_CLASS = "class",
        ARIA_DISABLED = "aria-disabled",
        OPT_DISABLED = "disabled";

    const INSERT_AFTER = "after",
        SAFE_DEFAULT_ROW_HEIGHT = 43; // nothing special about this number other than it is a reasonable size and not 0.

    const objectEntries = Object.entries,
        applyTemplate = util.applyTemplate;

    const toInteger = ( numStr ) => {
        return parseInt( numStr, 10 );
    };

    // todo this probably shouldn't be needed here
    function getFullCSSClass( pClassSuffix, pOptions ) {
        const prefix = pOptions.cssClassPrefix || C_DEFAULT_CLASS_PREFIX;

        return util.escapeHTMLAttr( prefix + "-" + pClassSuffix );
    }

    // todo this probably shouldn't be needed here currently used to find footer and load more button
    function getFullCSSClassSel( pClass, pOption ) {
        return "." + getFullCSSClass( pClass, pOption );
    }

    const C_TMV = "a-TMV",
        C_TMV_VARHEIGHT = C_TMV + "--variableHeight",
        C_TMV_BODY = "a-TMV-body",
        C_TMV_WRAP_SCROLL = "a-TMV-w-scroll",
        SEL_TMV_WRAP_SCROLL = "." + C_TMV_WRAP_SCROLL,
        C_TMV_HEADER = "a-TMV-hdr",
        SEL_TMV_HEADER = "." + C_TMV_HEADER,
        C_DISABLED = "is-disabled",
        SEL_DISABLED = "." + C_DISABLED;

    const EVENT_SELECTION_CHANGE = "selectionChange",
        EVENT_CURRENT_ITEM_CHANGE = "currentItemChange";

    const { NAV_NONE} = apex.widget.ListViewSelection.NAV_MODES;

    const keys = $.ui.keyCode,
        // This is not a rigorous match for a tag. It only needs to detect a likely start of a tag. It doesn't use
        // what is matched.
        startsWithTagRE = /^\s*<\w+[^>]*>/;

    function clearSubstitutions(opt) {
        opt.APEX$ROW_STATE_CLASSES = opt.APEX$AGG = opt.APEX$AGG_TOTAL = opt.APEX$ROW_URL = opt.APEX$ROW_ID
            = opt.APEX$ROW_INDEX = opt.APEX$VALIDATION_MESSAGE = opt.APEX$GROUP_ID = null;
    }

    $.widget( "apex.tableModelView", $.apex.tableModelViewBase,
        /**
         * @lends tableModelView.prototype
         */
        {
        widgetEventPrefix: "tableModelView",
        options: {
            /**
             * <p>Optional markup for a header to render before the report. The header does not scroll
             * with the report and depending on <code class="prettyprint">stickyTop</code> option may stick to the
             * top of the page. See also option {@link tableModelView#syncHeaderHScroll}.</p>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$HAS_SELECTOR - "Y" if the report supports selection.</li>
             *     <li>APEX$HAS_SELECT_ALL - "Y" if the report supports select all.</li>
             * </ul>
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "<h4>My Report</h4>"
             * @example "<h4>My Report</h4>"
             */
            // todo consider documenting APEX$COLUMNS
            headerTemplate: "",
            /**
             * <p>Markup to render before the report items.
             * The markup must include an opening element that will contain all the records/items.
             * For example <code class="prettyprint">&lt;ul></code>.</p>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$HAS_SELECTOR - "Y" if the report supports selection.</li>
             * </ul>
             * <p>See also {@link tableModelView#afterTemplate} and {@link tableModelView#recordTemplate}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default "&lt;ul>"
             * @example "<ol>"
             * @example "<ol>"
             */
            beforeTemplate: "<ul>",
            /**
             * <p>Markup to render the body when no beforeTemplate and afterTemplate is given.
             * For example <code class="prettyprint">{if APEX$HAS_MESSAGE/}
             * No data found
             * {else/}
             * &lt;div&gt;
             * #APEX$ROWS#
             * &lt;/div&gt;
             * {endif/}</code>.</p>
             * @ignore
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "{if APEX$HAS_MESSAGE/}
             * No data found
             * {else/}
             * <div>
             * #APEX$ROWS#
             * </div>
             * {endif/}"
             */
            bodyTemplate: "",
            /**
             * <p>Markup to render for each record. Can use substitution tokens from the
             * model using column names. In addition, you can use the following special substitution symbols:</p>
             * <ul>
             *     <li>APEX$ROW_ID - The record id</li>
             *     <li>APEX$ROW_INDEX - The record index</li>
             *     <li>APEX$ROW_URL - The record url if any</li>
             *     <li>APEX$ROW_STATE_CLASSES - Various record states such as "is-inserted" or "is-deleted"</li>
             *     <li>APEX$VALIDATION_MESSAGE - If the record is in a validation error or warning state this
             *         is the associated message</li>
             * </ul>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$SELECTOR - Markup for a selector control when using single or multiple selection.</li>
             *     <li>APEX$ROW_IDENTIFICATION - Markup for data-id and data-rownum attributes. Easier than
             *       providing your own markup using APEX$ROW_ID and APEX$ROW_INDEX.</li>
             * </ul>
             * <p>See also the widget description for more information about markup requirements.</p>
             * <p>At a minimum one of {@link tableModelView#labelColumn} or {@link tableModelView#recordTemplate}
             * is required.</p>
             * <p>See also {@link tableModelView#beforeTemplate} and {@link tableModelView#afterTemplate}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default Markup depends on several other options.
             * @example "<li #APEX$ROW_IDENTIFICATION#>&NAME. - &SALARY.</li>"
             * @example "<li #APEX$ROW_IDENTIFICATION#>&NAME. - &SALARY.</li>"
             */
            recordTemplate: "",
            /**
             * <p>Markup to render for a control break. This should only be set if the model data
             * has control breaks. This option requires the {@link tableModelView#controlBreakSelector}
             * option be set.
             * The template should only reference control break columns. In addition,
             * you can use the following special substitution symbols:</p>
             * <ul>
             *     <li>APEX$GROUP_ID - The control break id. See {@link model#getControlBreakId}.</li>
             *     <li>APEX$ROW_INDEX - The control break index, which is the same as the first record in the
             *     control break.</li>
             * </ul>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$GROUP_IDENTIFICATION - Markup for data-group-id and data-rownum attributes. Easier than
             *       providing your own markup using APEX$GROUP_ID and APEX$ROW_INDEX.</li>
             * </ul>
             * <p>See also {@link tableModelView#recordTemplate}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "<li #APEX$GROUP_IDENTIFICATION#><h4>&CATEGORY%heading. &CATEGORY.</h4></li>"
             * @example "<li #APEX$GROUP_IDENTIFICATION#><h4>&CATEGORY%heading. &CATEGORY.</h4></li>"
             */
            controlBreakTemplate: "",
            /**
             * <p>Markup to render before a group of items/rows defined by a control break.
             * This should only be set if the model data has control breaks.
             * This option requires the {@link tableModelView#controlBreakSelector} and
             * {@link tableModelView#itemSelector} options be set.
             * </p>
             * <p>The <code class="prettyprint">controlBreakBeforeTemplate</code> and
             * <code class="prettyprint">controlBreakAfterTemplate</code> templates are used together to create one
             * level of nested list report markup. They can't be combined with
             * {@link tableModelView#controlBreakTemplate}. Nested control break markup cannot currently
             * be combined with aggregates so the {@link tableModelView#aggregateTemplate} option must not be used
             * in combination.
             * </p>
             * <p>This template should typically include the control break heading and the start of any nesting markup.
             * The template should only reference control break columns.
             * This template supports the following special substitution symbols:</p>
             * <ul>
             *     <li>APEX$GROUP_ID - The control break id. See {@link model#getControlBreakId}.</li>
             *     <li>APEX$ROW_INDEX - The control break index, which is the same as the first record in the
             *     control break.</li>
             * </ul>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$GROUP_IDENTIFICATION - Markup for data-group-id and data-rownum attributes. Easier than
             *       providing your own markup using APEX$GROUP_ID and APEX$ROW_INDEX.</li>
             * </ul>
             * <p>See also {@link tableModelView#controlBreakAfterTemplate}, {@link tableModelView#recordTemplate}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "<li #APEX$GROUP_IDENTIFICATION#><h4>&CATEGORY%heading. &CATEGORY.</h4><ul>"
             * @example "<li #APEX$GROUP_IDENTIFICATION#><h4>&CATEGORY%heading. &CATEGORY.</h4><ul>"
             */
            controlBreakBeforeTemplate: "",
            /**
             * <p>Markup to render after a group of items/rows defined by a control break.
             * This template should include any markup needed to close nesting introduced in
             * {@link tableModelView#controlBreakBeforeTemplate}.
             * This should only be set if the model data has control breaks.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "</ul></li>"
             * @example "</ul></li>"
             */
            controlBreakAfterTemplate: "",
            /**
             * <p>Markup to render for an aggregate record. This should only be set if the model data
             * contains aggregate records. In addition, you use the following special substitution symbols:</p>
             * <ul>
             *     <li>APEX$ROW_ID - The record id from the model as if from {@link model#recordId}.</li>
             *     <li>APEX$ROW_INDEX - The record index</li>
             *     <li>APEX$AGG - The name of the aggregate function.
             *     One of: "COUNT", "COUNT_DISTINCT", "SUM", "AVG", "MIN" ,"MAX", "MEDIAN"</li>
             *     <li>APEX$AGG_TOTAL - This is true ("Y") when the aggregate record is a grand total
             *      and false ("") otherwise.</li>
             * </ul>
             * <p>These are the available placeholders:</p>
             * <ul>
             *     <li>APEX$ROW_IDENTIFICATION - Markup for data-id and data-rownum attributes. Easier than
             *       providing your own markup using APEX$ROW_ID and APEX$ROW_INDEX.</li>
             * </ul>
             * <p>See also {@link tableModelView#recordTemplate}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default ""
             * @example "<li #APEX$ROW_IDENTIFICATION#>{case APEX$AGG/}{when SUM/}Total:</b> &SALARY.{endcase/}</li>"
             * @example "<li #APEX$ROW_IDENTIFICATION#>{case APEX$AGG/}{when SUM/}Total:</b> &SALARY.{endcase/}</li>"
             */
            aggregateTemplate: "",
            /**
             * <p>Markup to render after the report items.
             * The markup must include elements that close the opening elements from the
             * {@link tableModelView#beforeTemplate} option.
             * For example <code class="prettyprint">&lt;/ul></code>.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default "&lt;/ul>"
             * @example "</ol>"
             * @example "</ol>"
             */
            afterTemplate: "</ul>",
            /**
             * <p>If there is a {@link tableModelView#headerTemplate} and this is true the horizontal scroll offset
             * will be synchronized between the header and the view body. This is useful in cases such as a table
             * where the header columns need to align with the body columns.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            syncHeaderHScroll: false,
            /**
             * <p>Extra CSS classes to add to the element that is the parent of the collection of records.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default "a-TMV-defaultIconView" if {@link tableModelView#recordTemplate} is null and null otherwise.
             * @example "EmployeeList"
             * @example "EmployeeList"
             */
            collectionClasses: null,
            /**
             * <p>The CSS class column to use for the icon. At most one of <code class="prettyprint">iconClassColumn</code>
             * and <code class="prettyprint">imageURLColumn</code> should be given.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "PERSON_AVATAR"
             * @example "PERSON_AVATAR"
             */
            iconClassColumn: null,
            /**
             * <p>The URL column of image to use for the icon. At most one of <code class="prettyprint">iconClassColumn</code>
             * and <code class="prettyprint">imageURLColumn</code> should be given.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "PROD_IMAGE_URL"
             * @example "PROD_IMAGE_URL"
             */
            imageURLColumn: null,
            /**
             * <p>Attributes for the <code class="prettyprint">&lt;img></code> element.
             * Only used if {@link tableModelView#imageURLColumn} is specified.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             */
            imageAttributes: null,
            /**
             * <p>Name of the column that contains the label text.</p>
             * <p>At a minimum one of {@link tableModelView#labelColumn} or {@link tableModelView#recordTemplate} is required.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "EMP_NAME"
             * @example "EMP_NAME"
             */
            labelColumn: null,
            /**
             * <p>If true the record metadata should contain a <code class="prettyprint">url</code> property that contains the link target.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            linkTarget: false,
            /**
             * <p>The name of the column that contains the anchor <code class="prettyprint">href</code>.
             * If not given the <code class="prettyprint">href</code> comes from the record field metadata
             * <code class="prettyprint">url</code> property. If there is no <code class="prettyprint">url</code>
             * property then this item has no link.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "PROD_TARGET"
             * @example "PROD_TARGET"
             */
            linkTargetColumn: null,
            /**
             * <p>Additional anchor attributes. Ignored unless a link is present.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "target='_blank'"
             * @example "target='_blank'"
             */
            linkAttributes: null,
            /**
             * <p>If true use the {@link iconList} widget to display the records.
             * The iconList widget supports selection but does not support the
             * {@link tableModelView#selectAll(1)}, {@link tableModelView#selectionStateItem}, or
             * {@link tableModelView#persistSelection} options or the {@link tableModelView#getCurrentItem} method.</p>
             *
             * @deprecated
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            useIconList: false,
            /**
             * <p>Additional options to pass to the {@link iconList} widget. See {@link iconList} for information about the
             * options it supports. Only applies if {@link tableModelView#useIconList} option is true.</p>
             *
             * @deprecated
             * @memberof tableModelView
             * @instance
             * @type {object}
             * @default {}
             */
            iconListOptions: {},

            // begin selection related options
            /**
             * <p>Controls how the focus and selection state is handled for items in the report. It can be one of these
             * values:</p>
             * <ul>
             * <li><strong>none</strong> - The report does not support focus or selection.</li>
             * <li><strong>focus</strong> - The report supports focus state. Focus can be moved among
             *   the items of the report using keyboard or mouse.</li>
             * <li><strong>select</strong> - The report supports focus and selection state. A selection control
             * such as a checkbox is not required but if one is desired it must be included in the template markup.
             * Use the #APEX$SELECTOR# placeholder in the {@link tableModelView#recordTemplate} option.</li>
             * </ul>
             * <p>Except when this value is "none", only one item in the report at a time is in the keyboard tab order.
             * and the arrow keys are used to move among the items.</p>
             * <p>When set to "focus" or "select" the {@link tableModelView#itemSelector} option is required.
             * When {@link tableModelView#useIconList} is true this is forced to "none" because the icon list
             * handles selection.
             * </p>
             * <p>See also {@link tableModelView#multiple} and <a href="#markup-section">Template markup</a>.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {string}
             * @default "none"
             * @example "select"
             * @example "select"
             */
            itemNavigationMode: NAV_NONE,
            /**
             * Controls details of selection behavior. This is for internal use only at this time and should always
             * be true.
             *
             * @ignore
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default true
             */
            selectionFollowsFocus: true,
            /**
             * <p>If true multiple items can be selected otherwise only a single item can be selected.</p>
             * <p>This option only applies when {@link tableModelView#itemNavigationMode} is "select".
             * See also {@link tableModelView#selectAll(1)}.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            multiple: false,
            /**
             * <p>If true then all the items in the current page or all rendered items or all items in the model,
             * depending on pagination settings, can be selected with Ctrl+A or a select all checkbox (if one is
             * provided with {@link tableModelView#selectAllId})
             * or using the {@link tableModelView#selectAll(2)} method.</p>
             * <p>Only applies when {@link tableModelView#multiple} is true.</p>
             * <p>When {@link tableModelView#persistSelection} is false only items that are rendered to the DOM
             * can be selected with Select All. For traditional paging this means that all the items in the current
             * page can be selected.
             * For any kind of scroll pagination, only the items that have already been and are currently
             * rendered to the DOM can be selected.
             * <p>When {@link tableModelView#persistSelection} is true the selection state is kept in
             * the model and only records currently loaded in the model can be selected. The
             * {@link tableModelView#loadIncompleteSelection} option controls if and how additional records are loaded
             * in the model so that the selection becomes complete.
             * </p>
             *
             * @memberof tableModelView
             * @instance
             * @variation 1
             * @type {boolean}
             * @default true
             * @example false
             * @example false
             */
            selectAll: false,
            /**
             * <p>This is the id of an element used to select all items. It has checkbox semantics.
             * When all items are selected the checkbox is checked, otherwise it is unchecked.
             * If it is unchecked, clicking it will select all items.
             * If it is checked, clicking it will unselect all items.</p>
             * <p>This only applies if {@link tableModelView#selectAll(1)} is true.</p>
             * <p>The expected markup is an input of type=checkbox or a span with checkbox role.</p>
             * <h3>Example of input markup:</h3>
             * <pre class="prettyprint"><code>&lt;input id="extSelAll" type="checkbox">&lt;label for="extSelAll">Select All&lt;/label>
             * </code></pre>
             * <h3>Example of span with checkbox role markup:</h3>
             * <pre class="prettyprint"><code>&lt;span id="extSelAll" tabindex="0" role="checkbox" class="u-selector" aria-labelledby="extSelAllLabel">&lt;/span>
             * &lt;span id="extSelAllLabel">Select All&lt;/span>
             * </code></pre>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "extSelAll"
             * @example "extSelAll"
             */
            selectAllId: null,
            /**
             * <p>Normally hidden rows cannot be selected. This means that range selection across collapsed
             * control breaks will not select any collapsed rows and if a control break is collapsed any selected rows
             * within it are unselected. Setting this option to true will allow hidden rows to be selected.</p>
             *
             * @memberof tableModelView
             * @ignore
             * @instance
             * @type {boolean}
             * @default false
             * @example true
             * @example true
             */
            allowSelectHidden: false,
            /**
             * <p>A CSS selector that selects the outermost item element in the view collection.
             * This is required if {@link tableModelView#itemNavigationMode} is not "none".
             * See also <a href="#markup-section">Template markup</a>.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default "a-TMV-item" if {@link tableModelView#recordTemplate} is null and null otherwise.
             * @example ".my-card-item"
             * @example ".my-card-item"
             */
            itemSelector: null,
            /**
             * <p>A CSS selector that selects the outermost control break item element in the view collection.
             * This is required if the report has control breaks.
             * See also <a href="#markup-section">Template markup</a>.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example ".my-card-group"
             * @example ".my-card-group"
             */
            controlBreakSelector: null,
            /**
             * <p>Name of the column that contains the value that identifies the item for use in accessible labels.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "EMP_NAME"
             * @example "EMP_NAME"
             */
            accLabelColumn: null,
            /**
             * <p>Normally keydown handling will call preventDefault so that arrow key navigation has no effect outside
             * this control. This prevents text selection and keeps parent elements from scrolling. By setting this
             * to false it allows a nested container to respond to arrow navigation keys.</p>
             * <p>This option only applies when {@link tableModelView#itemNavigationMode} is not "none".</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default true
             * @example false
             * @example false
             */
            constrainNavigation: true,
            /**
             * <p>If true the selection can be copied to the clipboard using the browsers copy event.
             * This can only be set at initialization time.</p>
             * <p>This option only applies when {@link tableModelView#itemNavigationMode} is "select".</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {boolean}
             * @default true
             * @example false
             */
            allowCopy: true,
            /**
             * <p>A function that allows control over how an item is copied to the clipboard. The function signature is
             * <code class="prettyprint">clipboardValue( index, item$, model, record, recordId ) -> jQuery</code>
             * </p>
             * <p>Only applies when {@Link tableModelView#allowCopy} is true.</p>
             * <p>When copying items to the clipboard the item's inner text is coped for the "text/plain" format
             * and the item's inner HTML is copied for the "text/html" format. This callback function allows
             * changing what gets put on the clipboard by returning a substitute item as a jQuery object.
             * Either the item$ passed in can be cloned and then modified or a new jQuery object can
             * be created using data from the model record passed in.
             * The inputs must not be modified.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {function}
             * @default null
             * @example <caption>The following function returns a new element wrapped in a jQuery object
             * with data from the record to copy to the clipboard. The model has columns NAME and PHONE.</caption>
             * $( ".selector" ).tableModelView( "option", "clipboardValue", function( index, item$, model, record, recordId ) {
             *     return $( `<li><span>${model.getValue(record, "NAME")}</span>
             *         <span>${model.getValue(record, "PHONE")}</span>
             *         </li>` );
             * } );
             * @example <caption>The following function returns a clone of the input item$ with buttons
             * removed because it is not useful to copy the text or markup of buttons to the clipboard.</caption>
             * $( ".selector" ).tableModelView( "option", "clipboardValue", function( index, item$, model, record, recordId ) {
             *     let temp$ = item$.clone();
             *
             *     temp$.find( "button" ).remove();
             *     return temp$;
             * } );
             */
            clipboardValue: null,
            /**
             * <p>Name of an APEX page item that will receive the selection state each time the selection changes.
             * Typically, this is the name of a hidden page item and is used to process the selection on the server
             * with a PL/SQL code process.</p>
             * <p>The format of the selection state value is a ":" separated string of the selected report items'
             * record identity.</p>
             *
             * @memberof tableModelView
             * @instance
             * @type {?string}
             * @default null
             * @example "P1_REPORT_SELECTION"
             * @example "P1_REPORT_SELECTION"
             */
            selectionStateItem: null,
            // can't set the default for dataTransferFormats here
            // end selection related options

            //
            // events:
            //

            /**
             * Triggered when the selection state changes. It has no additional data.
             * Only tableModelViews with {@link tableModelView#itemNavigationMode} = "select" or
             * {@link tableModelView#useIconList} true support selection.
             *
             * @event selectionchange
             * @memberof tableModelView
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             *
             * @example <caption>Initialize the tableModelView with the <code class="prettyprint">selectionChange</code> callback specified:</caption>
             * $( ".selector" ).tableModelView({
             *     selectionChange: function( event ) {}
             * });
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">tablemodelviewselectionchange</code> event:</caption>
             * $( ".selector" ).on( "tablemodelviewselectionchange", function( event ) {} );
             */
            selectionChange: null,
            /**
             * Triggered when the current item changes. It has no additional data.
             * Only tableModelViews with {@link tableModelView#itemNavigationMode} = "select" or "focus"
             * will trigger this event.
             *
             * @event currentitemchange
             * @memberof tableModelView
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             *
             * @example <caption>Initialize the tableModelView with the <code class="prettyprint">currentItemChange</code> callback specified:</caption>
             * $( ".selector" ).tableModelView({
             *     currentItemChange: function( event ) {}
             * });
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">tablemodelviewcurrentitemchange</code> event:</caption>
             * $( ".selector" ).on( "tablemodelviewcurrentitemchange", function( event ) {} );
             */
            currentItemChange: null,
            /**
             * Triggered when there is a pagination event that results in new records being displayed.
             *
             * @event pagechange
             * @memberof tableModelView
             * @instance
             * @property {Event} event <code class="prettyprint">jQuery</code> event object.
             * @property {Object} data Additional data for the event.
             * When there are no records to display <code class="prettyprint">offset</code> and <code class="prettyprint">count</code> are 0.
             * @property {number} data.offset the offset of the first record in the page.
             * @property {number} data.count the number of records in the page that were added to the view.
             *
             * @example <caption>Initialize the tableModelView with the <code class="prettyprint">pageChange</code> callback specified:</caption>
             * $( ".selector" ).tableModelView({
             *     pageChange: function( event, data ) {}
             * });
             *
             * @example <caption>Bind an event listener to the <code class="prettyprint">tablemodelviewpagechange</code> event:</caption>
             * $( ".selector" ).on( "tablemodelviewpagechange", function( event, data ) {} );
             */
            pageChange: null
        },

        _create: function () {
            const o = this.options,
                ctrl$ = this.element;

            debug.info( `TableModelView '${ctrl$[0].id}' created. Model: ${o.modelName}` );

            ctrl$.addClass( C_TMV );
            if ( !o.fixedRowHeight ) {
                ctrl$.addClass( C_TMV_VARHEIGHT );
            }

            this.gotoItemPending = null;

            // set this default just once and before selection initialization
            if ( !o.recordTemplate && !o.itemSelector ) {
                o.itemSelector = ".a-TMV-item";
            }

            this._sel = new apex.widget.ListViewSelection( this.element,{
                itemNavigationMode: o.itemNavigationMode,
                selectionFollowsFocus: o.selectionFollowsFocus,
                multiple: o.multiple,
                allowSelectAll: o.selectAll,
                selectAllId: o.selectAllId,
                allowSelectHidden: o.allowSelectHidden,
                itemSelector: o.itemSelector,
                groupSelector: o.controlBreakSelector,
                constrainNavigation: o.constrainNavigation,
                selectionStateItem: o.selectionStateItem,
                persistSelection: o.persistSelection,
                itemsAreServerRendered: o._isTemplateReport || false,
                allowCopy: o.allowCopy,
                clipboardValue: o.clipboardValue,
                dataTransferFormats: o.dataTransferFormats
            }, {
                isValid: () => {
                    return this.element.hasClass( C_TMV );
                },
                getContainer: () => {
                    return this._getDataContainer();
                },
                getModel: () => {
                    return this.model;
                },
                getValuesForItems: ( items$ ) => {
                    return this.getRecords( items$ );
                },
                renderItem: ( out, record, index, recordId, meta ) => {
                    this._renderRecord( out, record, index, recordId, meta );
                },
                selectionChanged: ( event ) => {
                    this._trigger( EVENT_SELECTION_CHANGE, event );
                },
                currentItemChanged: () => {
                    this._trigger( EVENT_CURRENT_ITEM_CHANGE );
                },
                updateStatus: () => {
                    this._updateStatus();
                },
                getPagination: () => {
                    return o.pagination;
                },
                keyboardIgnoreSelector: () => {
                    // todo consider if the class prefix needs to be customizable.
                    return ".a-GV-footer, .a-TMV-hdr";
                },
                firstPage: () => {
                    this.firstPage();
                },
                lastPage: () => {
                    this.lastPage();
                },
                waitForPageChange: () => {
                    return new Promise( ( resolve ) => {
                        this.element.one( "tablemodelviewpagechange", () => {
                            resolve();
                        } );
                    } );
                }
            } );
            // resync our options in case ListViewSelection adjusted any
            o.itemNavigationMode = this._sel.itemNavigationMode;
            o.persistSelection = this._sel.persistSelection;

            this._enforceOptionConstraints();

            this._super(); // init table model view base

            this.recordHeight = null;
            this.recPerRow = null;

            // get the model
            this._initModel( o.modelName );

            this._initRecordTemplate();

            this._on( this._eventHandlers );
            this._sel.initialize();

            this.refresh();

            if ( o.disabled ) {
                this._setOption( OPT_DISABLED, o.disabled );
            }
        },

        _eventHandlers: {
            keydown: function( event ) {
                const o = this.options,
                    kc = event.which;

                if ( event.isDefaultPrevented() ) {
                    return;
                }

                if ( o.useIconList ) {
                    let iconListOpts = this.getIconList().options;
                    if ( !iconListOpts.navigation && iconListOpts.noNavKeyContent && $( event.target ).closest( iconListOpts.noNavKeyContent ).length ) {
                        // don't do key processing if focus is in an element that needs all the keys
                        return;
                    }

                    // let down arrow or forward arrow move to load more button if there is one
                    if ( ( kc === keys.DOWN || kc === this.getIconList().forwardKey ) && o.pagination.loadMore ) {
                        let load$ = this.element.find( ".js-load" );

                        if ( load$[0] ) {
                            if ( load$[0].disabled ) {
                                // let the browser do its default scroll behavior (bug 25802101)
                                return;
                            } else {
                                load$.trigger( "focus" );
                                event.preventDefault();
                            }
                        } // else should navigate through the list items
                    } else if ( ( kc === keys.UP || kc === this.getIconList().backwardKey ) &&
                                o.pagination.loadMore && $( event.target ).hasClass( "js-load" ) ) {
                        this.getIconList().focus();
                        event.preventDefault();
                    }
                    if ( o.constrainNavigation &&
                            [keys.DOWN, keys.UP, keys.LEFT, keys.RIGHT, keys.PAGE_UP, keys.PAGE_DOWN].includes( kc ) ) {
                        event.preventDefault();
                    }
                }
            },
            resize: function( event ) {
                if (event.target !== this.element[0]) {
                    return;
                }
                this.resize();
                event.stopPropagation();
            }
        },

        _destroy: function() {
            const ctrl$ = this.element;

            this._tableModelViewDestroy();
            ctrl$
                .removeClass( C_TMV + " " + C_DISABLED )
                .empty(); // this will destroy the iconList if any
            this._sel.destroy();
            this._sel = null;

            debug.info( `TableModelView '${ctrl$[0].id}' destroyed. Model: ${this.options.modelName}` );

            this.data$ = null;

            // disconnect from the model
            this._initModel( null ); // this will cleanup change listener
        },

        _setOption: function ( key, value ) {
            const o = this.options;

            debug.info( `TableModelView '${this.element[0].id}' set option '${key}' to: ${value}` );

            if ( key === "iconListOptions" ) {
                throw new Error( `TableModelView '${key}' cannot be set. Set options directly on the iconList widget` );
            }
            if ( key === "allowCopy" ) {
                throw new Error( `TableModelView '${key}' cannot be set` );
            }

            // keep specific options in sync with ListViewSelection options
            if ( ["itemNavigationMode", "selectionFollowsFocus", "multiple", "selectAll", "selectAllId",
                "allowSelectHidden", "itemSelector", "controlBreakSelector", "constrainNavigation",
                "dataTransferFormats", "clipboardValue",
                "persistSelection", "selectionStateItem", OPT_DISABLED].includes( key ) ) {

                let lvKey = key;

                // a few options have different names
                if ( key === "selectAll" ) {
                    lvKey = "allowSelectAll";
                } else if ( key === "controlBreakSelector" ) {
                    lvKey = "groupSelector";
                }

                this._sel[lvKey] = value;
                value = this._sel[lvKey]; // update the value in case it was modified
            }

            this._super( key, value );

            this._enforceOptionConstraints();

            if ( key === OPT_DISABLED ) {
                this.element.toggleClass( C_DISABLED, value );
                if ( o.useIconList ) {
                    return this.getIconList().option( key, value );
                }
                if ( value ) {
                    // when enabling do this just in case it was resized while disabled
                    this.resize();
                }
            } else if ( key === "modelName" ) {
                this._initModel( value );
                this.refresh( false );
            } else if ( key === "highlights" ) {
                this._updateHighlights();
            } else if ( key === "hideEmptyFooter" ) {
                this._updateTotalRecords();
            } else if ( key === "fixedRowHeight" ) {
                this.element.toggleClass( C_TMV_VARHEIGHT, !value );
                this.refresh();
            } else if ( ["beforeTemplate", "recordTemplate", "afterTemplate", "collectionClasses",
                        "iconClassColumn", "imageURLColumn", "imageAttributes",
                        "labelColumn", "linkTarget", "linkTargetColumn", "linkAttributes", "bodyTemplate",
                        "entityTitleSingular", "entityTitlePlural",
                        "multiple", "itemNavigationMode"].includes( key ) ) {
                // multiple and itemNavigationMode require init record template and refresh because
                // the selector placeholder may change
                if ( this.options.labelColumn ) {
                    // remove default record template so it will be created again
                    this.options.recordTemplate = null;
                }
                this._initRecordTemplate();
                this.refresh();// todo allow multiple set option but refresh just once
            } else if ( ["footer", "useIconList", "pagination", "rowsPerPage"].includes( key ) ) {
                this.refresh();
            }
        },

        _enforceOptionConstraints: function() {
            const o = this.options;

            if ( o.useIconList && this._sel.supportsNavigation() ) {
                debug.warn( "Forced itemNavigationMode to none when useIconList is true" );
                o.itemNavigationMode = NAV_NONE;
                this._sel.itemNavigationMode = NAV_NONE;
            }
            if ( this._sel.supportsNavigation() && !o.itemSelector ) {
                debug.warn( "Forced itemNavigationMode to none because itemSelector not defined" );
                o.itemNavigationMode = NAV_NONE;
                this._sel.itemNavigationMode = NAV_NONE;
            }
            if ( !this._sel.supportsSelection() && o.persistSelection ) {
                // can't persist selection if not doing selection
                debug.warn( "Forced persistSelection to false when itemNavigationMode is not selection" );
                o.persistSelection = false;
                this._sel.persistSelection = false;
            }
            if ( o.controlBreakBeforeTemplate && o.controlBreakAfterTemplate && o.controlBreakTemplate ) {
                debug.warn( "Forced controlBreakTemplate to empty string in favor of before and after control break templates" );
                o.controlBreakTemplate = "";
            }
            if ( o.useIconList && ( o.controlBreakBeforeTemplate || o.controlBreakAfterTemplate ||
                    o.controlBreakTemplate || o.aggregateTemplate ) ) {
                debug.warn( "Control break and aggregate templates cannot be used when useIconList is true" );
                o.aggregateTemplate = o.controlBreakTemplate = o.controlBreakBeforeTemplate =
                    o.controlBreakAfterTemplate = "";
            }
            if ( ( o.controlBreakBeforeTemplate || o.controlBreakAfterTemplate ||
                    o.controlBreakTemplate ) && ( !o.itemSelector || !o.controlBreakSelector ) ) {
                debug.warn( "Control break requires itemSelector and controlBreakSelector" );
                o.controlBreakTemplate = o.controlBreakBeforeTemplate = o.controlBreakAfterTemplate = "";
            }
        },

        /**
         * <p>Refresh the view. Typically no need to call this method because it is called automatically when
         * the model data is refreshed.</p>
         *
         * @param {boolean} [pFocus] if true put focus in the view, if false don't. If undefined/omitted maintain
         * focus if the view already has focus.
         */
        refresh: function( pFocus ) {
            const o = this.options,
                self = this,
                ctrl$ = this.element;
            let paginationFocus = false;

            if ( pFocus !== true ) {
                paginationFocus = this._paginationHasFocus();
            }
            if ( pFocus === undefined ) {
                pFocus = $( document.activeElement ).closest( ctrl$ ).length > 0;
            }

            if ( !this._refreshCheckIfVisible() ) {
                return; // be lazy and don't refresh if invisible
            }
            if ( this._checkDelayRefresh( pFocus ) ) {
                return; // refresh will be called back after fetch model data completes
            }

            // has the model changed since the last refresh?
            let modelChanged = this.modelChanged;
            this.modelChanged = false;

            // save focus, selection state while report is getting refreshed
            this._sel.saveState();

            if ( !o.hasSize && this.data$ ) {
                // when the widget doesn't have a height it will get very small during a refresh
                // don't want to mess up scroll offsets
                ctrl$.css( "min-height", ctrl$.height() + "px" ); // removed after data is rendered
            }
            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            // when it's template report then no scroll region should be added to tmv. That's why this switch was added. Hopefully we get completely
            // rid of the scroll region in future so we can remove this switch
            if ( o._isTemplateReport ) {
                this._refreshPagination( ctrl$ );
            } else {
                this._refreshPagination( ctrl$.find( SEL_TMV_WRAP_SCROLL ) );
            }

            // todo don't redraw everything unless needed xxx this wipes out the footer which clears state icons which is not desired also want to keep the header
            this._initView();

            this._updateStatus();
            this.resize();
            // need to read internal this.model._data because getTotalRecords returns -1
            this._addPageOfRecords( function() {
                // this code is needed because when region is not pre-rendered and body template is used then the _initView function does not know
                // if it should print no data or not. This code is not optimal, because best would be to know if data is available on first _initView call
                if ( self.noData && o.bodyTemplate ) {
                    self._initView( true );
                }

                // favor returning focus to pagination area if it was there unless pFocus is true to explicitly set focus to the data.
                if ( paginationFocus ) {
                    self._restorePaginationFocus( paginationFocus );
                    pFocus = false;
                }

                if ( !o.hasSize ) {
                    ctrl$.css( "min-height", "" );
                }

                self._sel.restoreState( modelChanged );
                self._updateHeaderFooter( ctrl$.find( SEL_TMV_HEADER ) );
                if ( pFocus ) {
                    self.focus();
                }
            } );
        },

        /**
         * <p>This method must be called if the size of the container changes so that pagination state, footer position,
         * and nested {@link iconList} if any can be updated to reflect the new size.</p>
         */
        resize: function() {
            const ctrl$ = this.element,
                  o = this.options,
                  ctrlH = ctrl$.height(),
                  body$ = ctrl$.children().first(),
                  wrapper$ = ctrl$.find( SEL_TMV_WRAP_SCROLL );
            let w, h;

            if ( ctrl$[0].offsetParent === null ) {
                // View is invisible so nothing to resize. Expect a resize or refresh later when made visible
                return;
            }
            if ( !body$.length || this.pendingRefresh ) {
                // view was never initialized probably because it was initially invisible
                // or was refreshed while invisible. So do that now unless refresh is in progress
                if ( !this.renderInProgress ) {
                    this.refresh();
                }
                return; // because refresh calls resize
            }

            w = ctrl$.width();
            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            // in template reports we don't want to set the with as style maybe in future we can completely remove this static with from the element
            if ( !o._isTemplateReport ) {
                wrapper$.width( w );
            }

            this.recordHeight = null;
            this.recPerRow = null;

            if ( o.hasSize ) {
                h = ctrlH - this._footerHeight();
                body$.height( h );
                wrapper$.height( h - (ctrl$.find( SEL_TMV_HEADER ).height() || 0) );
            }
            if ( !this.data$ ) {
                return; // if resize called before data is rendered then can't continue.
                  // shouldn't be a problem because resize is called again from render
            }
            if ( o.useIconList ) {
                this.data$.iconList( "resize" );
            }
            this._initPageSize();
            this._updateHeaderFooter( ctrl$.find( SEL_TMV_HEADER ) );
        },

        /**
         * <p>Set focus to the tableModelView if possible. If the view supports selection or focus
         * then the last focused item will be focused otherwise, the first focusable
         * element, if any, will be focused.</p>
         * @example <caption>This example focuses the view.</caption>
         * $( ".selector" ).tableModelView( "focus" );
         */
        focus: function() {
            const iconList = this.getIconList();

            if ( iconList ) {
                iconList.focus();
            } else {
                this._sel.focus();
            }
        },

        /**
         * <p>Returns the current item as a jQuery object.
         * The current item is the item that has or last had focus. This includes control break
         * group headings.</p>
         *
         * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
         * or "focus". See also {@link tableModelView#setCurrentItem}.</p>
         *
         * @returns {jQuery} The current item or null if not supported.
         */
        getCurrentItem: function() {
            return this._sel.getCurrentItem();
        },

        /**
         * <p>Sets the last focused item to the given pItem$. If pItem$ is not an item
         * or not in the report container the current item is not changed.
         * This also works for control break group headings.</p>
         *
         * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
         * or "focus". See also {@link tableModelView#getCurrentItem}.</p>
         * @param {jQuery} pItem$ The item to make current.
         * @param {boolean} [pFocus] If true also focus the item.
         */
        setCurrentItem: function( pItem$, pFocus ) {
            this._sel.setCurrentItem( pItem$, pFocus );
        },

        /**
         * <p>Returns the value of the current item.
         * The current item is the item that has or last had focus.
         * The value of an item is its unique identifier as returned by {@link model#getRecordId}.</p>
         *
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "focus"
         * or "select". See also {@link tableModelView#setCurrentItemValue}.</p>
         *
         * <p>If a control break group heading currently has focus then this returns the
         * value of the <code class="prettyprint">data-group-id</code> attribute, which should be the same as
         * the value returned from {@link model#getControlBreakId}.</p>
         *
         * @returns {string} The current item value or null if not supported.
         */
        getCurrentItemValue: function() {
            let item$ = this.getCurrentItem();

            if ( item$?.is( this.options.controlBreakSelector ) ) {
                return item$.attr( DATA_GROUP_ID );
            } else if ( item$ ) {
                let rec = this.getRecords( item$ )[0];

                return this.model.getRecordId( rec );
            }
            return null;
        },

        /**
         * <p>Sets the last focused item to the one with the given pItemValue. If no item has the given value
         * the current item is not changed. The item must be rendered in order to be made the current item.
         * The value of an item is its unique identifier as returned by {@link model#getRecordId}.</p>
         *
         * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
         * or "focus". See also {@link tableModelView#getCurrentItemValue}.</p>
         *
         * @param {string} pItemValue The value of an item. If the report has control breaks this can
         *   also be the value returned for a control break group heading.
         * @param {boolean} [pFocus] If true also focus the item.
         */
        setCurrentItemValue: function( pItemValue, pFocus ) {
            const container$ = this._getDataContainer();
            let item$ = container$.find( `[${DATA_ID}="${util.escapeCSS( pItemValue )}"]` );

            if ( !item$[0] && this._hasControlBreaks() ) {
                // maybe the value is a group id?
                item$ = container$.find( `[${DATA_GROUP_ID}="${util.escapeCSS( pItemValue )}"]` );
            }
            this.setCurrentItem( item$, pFocus );
        },

        /**
         * <p>Put focus in the item given by <code class="prettyprint">pRecordId</code>.
         * This will scroll or change pages as needed to focus the item. The record must be in the model.
         * The row containing the cell is selected.</p>
         * todo should support focus or selection
         * @ignore
         * @param pRecordId
         */
        gotoItem: function( pRecordId ) {
            // todo need something that can scroll into view and focus a record item similar to grid gotoCell
            // do we want it by id or rownum?
            const o = this.options;
            let record, index, sp$, st,
                needRefresh = false,
                row$ = this.element.find( `[${DATA_ID}="${util.escapeCSS( pRecordId )}"]` );

            this.gotoItemPending = null;

            if ( !this.data$ ) {
                return; // not yet initialized
            }
            if ( !row$.length ) {
                record = this.model.getRecord( pRecordId );
                if ( !record ) {
                    // if the record is not in the model then can't go to it
                    debug.warn( "Warning record not found " + pRecordId );
                    return;
                }
                index = this.model.indexOf( record );
                // todo this scrolling/pageing may not be accurate if the model has aggregate records and/or the view has control breaks
                // may need to hunt for the record but make sure no infinite loop
                this.gotoItemPending = pRecordId;
                if ( o.pagination.scroll ) {
                    sp$ = this.scrollParent$;
                    // calculate scroll offset based on index of record and average height of records
                    // todo for non virtual scroll may need to to scroll multiple times to get to the
                    //  right spot; optimize this
                    st = Math.floor( index * this.avgRowHeight );
                    sp$.scrollTop( st ); // this will trigger a refresh as needed
                } else {
                    this.pageOffset = Math.floor( index / this.pageSize ) * this.pageSize;
                    needRefresh = true;
                }
            }

            if ( needRefresh ) {
                this.refresh( false );
            }
            if ( this.gotoItemPending ) {
                // we will be called back after the view has been refreshed
                return;
            }
            this.setSelection( row$, true );
        },

        /**
         * <p>Return the currently selected items as a jQuery collection.</p>
         *
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select"
         * or the {@link tableModelView#useIconList} option is true.</p>
         * <p>Because this returns a jQuery collection it can only return selected items that are
         * currently in the DOM. When using virtual scroll pagination and {@link tableModelView#persistSelection} is
         * true it is better to use {@link tableModelView#getSelectedRecords}</p>
         * <p>See also {@link tableModelView#setSelection}.</p>
         *
         * @return {?jQuery} The selected item elements as a jQuery collection.
         * Returns null if selection isn't supported or the report is not initialized.
         */
        getSelection: function() {
            const o = this.options,
                iconList = this.getIconList();

            if ( o.useIconList ) {
                // it is possible (because of preserve selection) to try to get the selection
                // before the icon list has been initialized
                return iconList ? iconList.getSelection() : $();
            } // else
            return this._sel.getSelection();
        },

        /**
         * <p>Set the selected items. Triggers the {@link tableModelView#event:selectionchange} event if the selection
         * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
         *
         * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
         * or if the {@link tableModelView#useIconList} option is true.</p>
         * <p>See also {@link tableModelView#getSelection}.</p>
         *
         * @param {jQuery} pElements$ A jQuery object with item elements such as the return
         *   value of {@link tableModelView#getSelection}.
         * @param {boolean} [pFocus] If true the first item element of the selection is given focus.
         * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
         */
        setSelection: function( pElements$, pFocus, pNoNotify ) {
            const iconList = this.getIconList();

            if ( iconList ) {
                iconList.setSelection( pElements$, pFocus, pNoNotify );
            } else {
                this._sel.setSelection( pElements$, pFocus, pNoNotify );
            }
        },

        /**
         * <p>Select all the items in the report that can be selected. Triggers the
         * {@link tableModelView#event:selectionchange} event if the selection
         * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
         *
         * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
         * and {@link tableModelView#multiple} and {@link tableModelView#selectAll(1)} options are both true.
         * This is not supported when the {@link tableModelView#useIconList} option is true.</p>
         *
         * <p>This only applies to the current page or what has been rendered so far unless the selection
         * state is persisted in the model.
         * See {@link tableModelView#selectAll(1)} for details about how pagination settings and
         * {@link tableModelView#persistSelection} affect the meaning of "all items".</p>
         *
         * @variation 2
         * @param {?boolean} [pFocus] If true the first selected item is given focus.
         * @param {boolean} [pNoNotify] If true the selection change notification will be suppressed.
         */
        selectAll: function( pFocus, pNoNotify ) {
            if ( !this.options.useIconList ) {
                this._sel.selectAll( pFocus, pNoNotify );
            }
        },

        /**
         * <p>Given a jQuery object with one or more item elements return the corresponding model records.
         * For this to work the elements must have a <code class="prettyprint">data-id</code>
         * attribute with the value of the record id.</p>
         *
         * @param {jQuery} pElements$ A jQuery object of item elements such as returned
         *   by {@link tableModelView#getSelection}.
         * @return {model.Record[]} Array of records from the model corresponding to the item elements.
         */
        getRecords: function( pElements$ ) {
            let thisModel = this.model,
                records = [];

            pElements$.each( function() {
                let value,
                    id = $( this ).attr( DATA_ID );

                if ( id ) {
                    value = thisModel.getRecord( id );
                    if ( value ) {
                        records.push( value );
                    }
                }
            } );

            return records;
        },

        /**
         * <p>Return the underlying data model records corresponding to the current selection.</p>
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select"
         * or the {@link tableModelView#useIconList} option is true.</p>
         *
         * <p>When using virtual scroll pagination and {@link tableModelView#persistSelection} is
         * true it is possible for the user to select a range of records or all records when the model
         * does not yet contain all the selected records. In this case the selection is incomplete
         * and only the records currently in the model will be returned. See option
         * {@link tableModelView#loadIncompleteSelection} for how an incomplete selection is handled.</p>
         * <p>See also {@link tableModelView#setSelectedRecords}.</p>
         *
         * @return {?model.Record[]} Array of records from the model corresponding to the selected items.
         * Returns null if selection is not supported.
         */
        getSelectedRecords: function() {
            if ( this.data$ ) {
                if ( this.options.useIconList ) {
                    return this.getRecords( this.getSelection() );
                } else if ( this._sel.supportsSelection() ) {
                    return this._sel.getSelectedValues();
                }
            } // else
            return null;
        },

        /**
         * <p>Returns the value for each record returned by {@link tableModelView#getSelectedRecords}.
         * The value of a record is its unique identifier as returned by {@link model#getRecordId}.</p>
         *
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select"
         * or the {@link tableModelView#useIconList} option is true.</p>
         *
         * @returns {?string[]} Array of selected record values.
         * Returns null if selection is not supported.
         */
        getSelectedValues: function() {
            const records = this.getSelectedRecords();

            if ( !records ) {
                return null;
            } // else
            return records.map( r => {
                return this.model.getRecordId( r );
            } );
        },

        /**
         * <p>Selects the report items that correspond to the given data model records.
         * Triggers the {@link tableModelView#event:selectionchange} event if the selection
         * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
         *
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select"
         * or the {@link tableModelView#useIconList} option is true.</p>
         * <p>See also {@link tableModelView#getSelectedRecords}.</p>
         *
         * @param {model.Record[]} pRecords Array of data model records to select.
         * @param {boolean} [pFocus] If true the first record of the selection is given focus.
         * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
         * @return {number} Count of the items actually selected or -1 if called before the report is initialized or
         * there is no data or selection is not supported.
         */
        setSelectedRecords: function( pRecords, pFocus, pNoNotify ) {
            const o = this.options,
                data$ = this.data$;

            if ( !data$ || this.renderInProgress ) {
                return -1;
            } // else

            if ( o.useIconList ) {
                let items = [],
                    count = 0,
                    len = pRecords.length,
                    keys = new Set();

                if ( !o.multiple && len > 1 ) {
                    len = 1;
                }
                for ( let i = 0; i < len; i++ ) {
                    keys.add( this.model.getRecordId( pRecords[i] ) );
                }
                // this is OK because icon list doesn't support nested control breaks
                data$.children().each( function () {
                    let id = $( this ).attr( DATA_ID );

                    if ( keys.has( id ) ) {
                        keys.delete( id );
                        items.push( this );
                        count += 1;
                    }
                } );
                this.setSelection( $( items ), pFocus, pNoNotify );
                return count;
            } // else
            return this._sel.setSelectedValues( pRecords, pFocus, pNoNotify );
        },

        /**
         * <p>Selects the report items that correspond to the given values.
         * The value of an item is the unique identifier of the corresponding model record
         * as returned by {@link model#getRecordId}
         * and also the value of the item's <code class="prettyprint">data-id</code> attribute.
         * Triggers the {@link tableModelView#event:selectionchange} event if the selection
         * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
         *
         * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select"
         * or the {@link tableModelView#useIconList} option is true.</p>
         *
         * @param {string[]} pValues Array of item/record values to select.
         * @param {boolean} [pFocus] If true the first record of the selection is given focus.
         * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
         * @return {number} Count of the items actually selected or -1 if called before the report is initialized or
         * there is no data or selection is not supported.
         */
        setSelectedValues: function( pValues, pFocus, pNoNotify ) {
            let records = [];

            pValues.forEach( v => {
                const r = this.model.getRecord( v );

                if ( r ) {
                    records.push( r );
                }
            } );
            return this.setSelectedRecords( records, pFocus, pNoNotify );
        },


        /**
         * <p>Return the iconList instance if option {@link tableModelView#useIconList} is true,
         * and null otherwise.</p>
         * <p>Note: This returns the instance and not the jQuery object.</p>
         *
         * @deprecated
         * @return {?object} iconList The {@link iconList} widget instance.
         * @example <caption>This example gets the iconList and calls the getColumns method.</caption>
         * $(".selector").tableModelView("getIconList").getColumns();
         */
        getIconList: function() {
            if ( this.options.useIconList && this.data$ ) {
                return this.data$.data( "apex-iconList" );
            }
            return null;
        },

        //
        // Internal methods
        //

        _initRecordTemplate: function() {
            const o = this.options;

            if ( !o.recordTemplate ) {
                let template, closeTag, href;

                if ( !o.collectionClasses ) {
                    o.collectionClasses = "a-TMV-defaultIconView";
                }
                if ( !o.labelColumn ) {
                    throw new Error( "Option recordTemplate or labelColumn is required" );
                }

                o.beforeTemplate = "<ul>";
                o.afterTemplate = "</ul>";

                template = `<li ${DATA_ID}='&APEX$ROW_ID.' ${DATA_ROWNUM}='&APEX$ROW_INDEX.' class='a-TMV-item &APEX$ROW_STATE_CLASSES.'>`;
                if ( o.linkTarget || o.linkTargetColumn ) {
                    if ( o.linkTargetColumn ) {
                        href = o.linkTargetColumn;
                    } else {
                        href = "APEX$ROW_URL";
                    }
                    template += `<a href='&${href}.' class='a-IconList-content' ${o.linkAttributes ? o.linkAttributes : ""}>`;
                    closeTag = "</a>";
                } else {
                    template += "<span class='a-IconList-content'>";
                    closeTag = "</span>";
                }
                if ( this._sel.supportsSelection() ) {
                    template += "<div class='a-IconList-selection'>#APEX$SELECTOR#</span>";
                }
                if ( o.iconClassColumn || o.imageURLColumn ) {
                    template += "<span class='a-IconList-icon'>";
                    if ( o.iconClassColumn ) {
                        template += `<span class='&${o.iconClassColumn}.'></span>`;
                    } else {
                        // todo acc should have alt attr
                        template += `<img src='&${o.imageURLColumn}.' ${o.imageAttributes ? o.imageAttributes : ""}/>`;
                    }
                    template += "</span>";
                }
                template += `<span class='a-IconList-label'>&${o.labelColumn}.</span>${closeTag}</li>`;
                o.recordTemplate = template;
            }

            // just processing the template to test the markup used so no need to supply any data
            let atOptions = this.atOptions;

            atOptions.model = this.model;
            atOptions.record = null;
            clearSubstitutions(atOptions.extraSubstitutions);

            // This is an extra check to ensure that the record template is wrapped in a reasonable element.
            // The best practice is to make sure the record template starts with an appropriate element.
            // todo this doesn't work if the recordTemplate has no markup such as when the whole value comes from
            //  a substitution or placeholder or a with/apply directive.
            let m = startsWithTagRE.exec( applyTemplate( o.recordTemplate, atOptions ) );
            if ( !m && !o._isTemplateReport ) {
                if ( applyTemplate( o.beforeTemplate, atOptions ).toLowerCase().match( /<ul|<ol/ ) ) {
                    o.recordTemplate = `<li>${o.recordTemplate}</li>`;
                } else {
                    o.recordTemplate = `<div>${o.recordTemplate}</div>`;
                }
            }
        },

        _initView: function( pNoData = false ) {
            const self = this,
                  ctrl$ = this.element,
                  o = this.options,
                  scrollEvent = "scroll.tmvss",
                  out = this._getDataRenderContext(),
                  atOptions = this.atOptions,
                  substs = atOptions.extraSubstitutions;
            let loadMore$,
                hdr$,
                main$,
                curScrollLeft = 0,
                lastScrollLeft = 0,
                timerID = null;

            function syncScroll() {
                if ( curScrollLeft !== lastScrollLeft ) {
                    hdr$[0].scrollLeft = curScrollLeft = lastScrollLeft;
                    main$[0].scrollLeft = curScrollLeft;
                    loadMore$.css( "left", curScrollLeft );
                }
                timerID = null;
            }

            atOptions.model = this.model;
            atOptions.record = null; // no record to render here
            clearSubstitutions( substs );

            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            // TMV-Body should not be rendered when it'S a template report. Hopefully we can get rid of this element to all report types.
            if ( !o._isTemplateReport ) {
                out.markup( "<div" )
                .attr( ATTR_CLASS, C_TMV_BODY )
                .markup( ">" );
            }

            if ( !o.bodyTemplate ) {
                this._renderAltDataMessages( out );
            }

            let columns = [];
            for ( const [name, col] of objectEntries( this.model.getOption( "fields" ) ) ) {
                let newCol = $.extend( {fieldName: name}, col );

                columns.push( newCol );
            }
            columns.sort( (a, b) => {
                return a.seq - b.seq;
            } );
            substs.APEX$COLUMNS = columns; // this extra substitution is intentionally not cleared

            // Template Component Report (_isTemplateReport) doesn't support headerTemplate but that is no
            // problem because it never sets this option.
            if ( o.headerTemplate ) {
                atOptions.placeholders.APEX$HAS_SELECTOR = this._sel.supportsSelection() ? "Y" : "N";
                atOptions.placeholders.APEX$HAS_SELECT_ALL = this._sel.supportsSelection() &&
                    o.multiple && o.selectAll ? "Y" : "N";
                atOptions.placeholders.APEX$SELECTOR = "";
                out.markup( `<div class='${C_TMV_HEADER}'>${applyTemplate( o.headerTemplate, atOptions )}</div>` );
            }

            // set initial offset
            if ( o.firstDisplayedRow > 0 ) {
                this.pageOffset = o.firstDisplayedRow;
                delete o.firstDisplayedRow;
                // this is needed to prevent endless getData loop when offset is > 0
                if ( this.pageOffset > 0 && o.lazyLoading ) {
                    // Workaround a failed assumption in the model that the first request
                    // will be for offset 0.
                    this.model._data.length = 1;
                }
            }

            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            //   scroll region should not be rendered when it's a template report. Maybe we can remove this for other/all report types
            if ( !o._isTemplateReport ) {
                out.markup( "<div" )
                .attr( ATTR_CLASS, C_TMV_WRAP_SCROLL )
                .markup( " tabindex='-1'>" );
            }

            // Need to detect the report parent element (this.data$); this is the element that contains the
            // row/record items. But at this time we don't have a record to render.
            // Also need to detect the record element (the outer element of the recordTemplate).
            // It is not possible to reliably detect the recordElement because the entire markup could come from
            // a symbol substitution or with/apply.
            // The technique used to find the container is to insert dummy row markup, render the whole template
            // and then find the dummy row and get its parent.
            // The only thing that can be reliably contained inside any element is a comment
            // Previously used a div which is close but doesn't work in table markup.
            // This means that we have to pick the recordElement not by the row/item element but by the
            // parent element. See below where recordElement is set after inserting the markup.
            let rows = "<!--$row$-->";

            if ( o.bodyTemplate ) {
                atOptions.placeholders.APEX$HAS_MESSAGE = pNoData ? "T" : "";
                atOptions.placeholders.APEX$MESSAGE = o.noDataMessage;
                atOptions.placeholders.APEX$MESSAGE_ICON = o.noDataIcon;
                atOptions.placeholders.APEX$COMPONENT_CSS_CLASSES = o.componentCssClasses || "";
                atOptions.placeholders.APEX$ROWS = rows;

                out.markup( applyTemplate( o.bodyTemplate, atOptions ) );
            } else {
                atOptions.placeholders.APEX$HAS_SELECTOR = this._sel.supportsSelection() ? "Y" : "N";
                atOptions.placeholders.APEX$SELECTOR = "";
                out.markup( applyTemplate( o.beforeTemplate, atOptions ) )
                        .markup( rows )
                   .markup( applyTemplate( o.afterTemplate, atOptions ) );

                this._renderLoadMore( out );
            }

            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            //   in template report TMV-Body and Scroll are not rendered but for all the other report types
            if ( !o._isTemplateReport ) {
                out.markup( "</div></div>" );
            }

            if ( !pNoData ) {
                if ( this.footer$ && this.footer$.prop( "outerHTML" ) ) {
                    out.markup( this.footer$.prop( "outerHTML" ) );
                } else {
                    this._renderFooter( out );
                }
            }

            ctrl$.html( out.toString() );
            this.data$ = this._findRowsPlaceholderParent();

            switch ( this.data$[0]?.nodeName ) {
                case "UL":
                case "OL":
                    this.recordElement = "li";
                    break;
                case "TBODY":
                case "THEAD":
                case "TABLE":
                    this.recordElement = "tr";
                    break;
                default:
                    this.recordElement = "div";
            }

            this.data$.addClass( o.collectionClasses || "" );
            // if the selectAll control is in the header need to reinitialize the option because it wasn't present
            // when _sel was initialized or was recreated on refresh
            if ( o.headerTemplate && this._sel.selectAllId && ctrl$.find( "#" + this._sel.selectAllId)[0] ) {
                // eslint-disable-next-line no-self-assign
                this._sel.selectAllId = this._sel.selectAllId; // this does still call the setter
            }
            this._sel.contentChanged();
            this.selectorPlaceholder = this._sel.supportsSelection() ? this._sel.getPreferredSelectorControl() : "";

            if ( o.useIconList ) {
                this.data$.iconList( o.iconListOptions );
                this.data$.on("iconlistselectionchange", function( event ) {
                    self._updateStatus();
                    self._trigger( EVENT_SELECTION_CHANGE, event );
                } );
            }

            // todo temporary hack for template reports for cleaner markup. We need to check in 23.2 how we optimize this or maybe we don't need this
            // scroll region does not exist when it's a template report
            if ( o._isTemplateReport ) {
                main$ = ctrl$;
            } else {
                main$ = ctrl$.find( SEL_TMV_WRAP_SCROLL );
            }

            hdr$ = ctrl$.find( SEL_TMV_HEADER );
            this._initPagination( hdr$, main$ );

            if ( o.headerTemplate && o.syncHeaderHScroll ) {
                // coordinate the scrolling of the various areas
                loadMore$ = this.data$.find( getFullCSSClassSel( C_LOAD_MORE_BUTTON, o ) );
                main$.on( scrollEvent, function () {
                    lastScrollLeft = this.scrollLeft;
                    if ( !timerID ) {
                        timerID = util.invokeAfterPaint( syncScroll );
                    }
                } );
                hdr$.on( scrollEvent, function () {
                    lastScrollLeft = this.scrollLeft;
                    if ( !timerID ) {
                        timerID = util.invokeAfterPaint( syncScroll );
                    }
                } );
            }
        },

        _initRecordMetrics: function() {
            const o = this.options,
                atOptions = this.atOptions,
                hasNestedControlBreaks = this._hasNestedControlBreaks();
            let r$, tempRecords$,
                recordHeight = 0,
                substs = this.atOptions.extraSubstitutions;

            clearSubstitutions( substs );
            atOptions.record = null; // no data to render here
            this.recPerRow = 1;

            if ( hasNestedControlBreaks ) {
                // the items are not children of the report container
                r$ = this.data$.find( o.controlBreakSelector + " " + o.itemSelector );
            } else {
                r$ = this.data$.children();
            }
            r$ = r$.filter( SEL_VISIBLE ).first();
            // Don't care if this isn't the real preferred selector.
            // Assume that any selector will render with the same height.
            atOptions.placeholders.APEX$SELECTOR = this._sel.getPreferredSelectorControl();
            if ( !r$.length ) {
                let markup = "";

                if ( hasNestedControlBreaks ) {
                    atOptions.placeholders.APEX$GROUP_IDENTIFICATION = `data-group-id="0" data-rownum="0"`;
                    markup += applyTemplate( o.controlBreakBeforeTemplate, atOptions );
                }
                // assume won't be more than 20 records in a row
                for ( let i = 0; i < 20; i++ ) {
                    atOptions.placeholders.APEX$ROW_IDENTIFICATION = `data-id="${i}" data-rownum="${i}"`;
                    markup += applyTemplate( o.recordTemplate, atOptions );
                }
                if ( hasNestedControlBreaks ) {
                    markup += applyTemplate( o.controlBreakAfterTemplate, atOptions );
                }
                tempRecords$ = $( markup );
                this.data$.append( tempRecords$ );
                if ( hasNestedControlBreaks ) {
                    r$ = this.data$.find( o.controlBreakSelector + " " + o.itemSelector );
                } else {
                    r$ = this.data$.children();
                }
                r$ = r$.filter( SEL_VISIBLE ).first();
                if ( o.useIconList ) {
                    // can't just resize because need fixup to list items that refresh does
                    this.getIconList().refresh();
                }
            }

            if ( o.useIconList ) {
                this.recPerRow = this.getIconList().getColumns();
            } else {
                let cur$ = r$,
                    initOffset = cur$.length > 0 ? Math.trunc( cur$.offset().top ) : 0,
                    lastOffset = initOffset,
                    count = 0;

                while ( lastOffset === initOffset && cur$[0] ) {
                    count += 1;
                    cur$ = cur$.next();
                    if ( cur$[0] ) {
                        lastOffset = Math.trunc( cur$.offset().top );
                    }
                }
                this.recPerRow = count;
                recordHeight = lastOffset - initOffset;
            }
            if ( this.recPerRow < 1 ) {
                this.recPerRow = 1; // just in case, don't let this be zero otherwise pageSize could be NaN due to divide by 0
            }
            if ( recordHeight === 0 ) {
                recordHeight = r$.outerHeight( true ); // include margins
                if ( this.data$.css( "display" ) === "grid" ) {
                    // include grid layout grid gap as part of row height
                    recordHeight += toInteger( this.data$.css( "grid-row-gap" ) );
                }
            }
            this.recordHeight = recordHeight || SAFE_DEFAULT_ROW_HEIGHT;

            // if dummy records were rendered just for the purpose of measuring remove them now
            if ( tempRecords$ ) {
                tempRecords$.remove();
            }
        },

        //
        // Methods to override
        //

        _getHeaderHeight: function() {
            return this.element.find( SEL_TMV_HEADER ).outerHeight();
        },

        // This is used when all records are the same height, which means all rows will be the same height.
        // It is also used as a starting point to calculate the average row height.
        _getFixedRecordHeight: function() {
            if ( !this.recordHeight ) {
                this._initRecordMetrics();
            }
            return this.recordHeight;
        },

        _getRecordsPerRow: function() {
            if ( !this.recPerRow ) {
                this._initRecordMetrics();
            }
            return this.recPerRow;
        },

        _getDataContainer: function() {
            return this.data$;
        },

        _checkSelectionChange: function( originalCount ) {
            if ( !this.options.useIconList ) {
                this._sel.checkSelectionChange( originalCount );
            }
        },

        _selectedCount: function() {
            let o = this.options;

            if ( o.useIconList ) {
                return this.getIconList().getSelection().length;
            } else if ( this._sel.supportsSelection() ) {
                return this._sel.getSelectedCount();
            } // else
            return 0;
        },

        _deletedRowsHidden: function() {
            // todo make sure none of the deleted rows are selected something like this?
            //   this.element.find( SEL_DELETED ).removeClass( C_SELECTED ).removeAttr( ARIA_SELECTED );
            //   may need to move last focused too
        },

        _hasControlBreaks: function() {
            const o = this.options;

            return this.model.hasControlBreaks() && Boolean( o.controlBreakTemplate || (
                o.controlBreakAfterTemplate && o.controlBreakBeforeTemplate ) );
        },

        _hasNestedControlBreaks: function() {
            const o = this.options;

            // Currently assuming that before and after templates means the group will be nested
            // todo see if this limitation can be lifted. Would need to determine or be told if nested or not
            return this.model.hasControlBreaks() &&
                Boolean( o.controlBreakAfterTemplate && o.controlBreakBeforeTemplate );
        },

        _controlBreakSelector: function() {
            return this.options.controlBreakSelector;
        },

        _itemSelector: function() {
            return this.options.itemSelector;
        },

        _elementsFromRecordIds: function( ids ) {
            let elements = [];

            for ( let i = 0; i < ids.length; i++ ) {
                let item = this.data$[0].querySelector( `[${DATA_ID}="${util.escapeCSS( ids[i] )}"]` ); // using querySelector for performance

                if ( item ) {
                    elements.push( $( item ) );
                }
            }
            return elements;
        },

        _renderFillerRecord: function ( out, cssClass ) {
            out.markup( `<${this.recordElement} aria-hidden="true" class="${cssClass}"></${this.recordElement}>` );
            // todo consider putting placeholders inside the filler
        },

        _insertFiller: function( out, curFiller$ ) {
            let filler$ = $( out.toString() );

            if ( curFiller$ ) {
                curFiller$.before( filler$ );
            } else {
                // todo derived class should not know about controlBreakGroupContainer$ when base class doesn't know about data$?
                ( this.controlBreakGroupContainer$ || this.data$ ).html( filler$ );
            }
            this._sel.contentChanged(); // xxx needed?
            return filler$;
        },

        _insertData: function( out, filler$, how ) {
            const o = this.options;
            let items$ = $( out.toString() );

            if ( !filler$ ) {
                // todo derived class should not know about controlBreakGroupContainer$ when base class doesn't know about data$?
                ( this.controlBreakGroupContainer$ || this.data$ ).append( items$ );
            } else {
                // else must have filler$ and how must be before or after
                filler$[how]( items$ );
            }
            // setting aria-disabled after rendering to keep template requirements simpler
            items$.find( SEL_DISABLED )
                .add( items$.filter( SEL_DISABLED ) ).attr( ARIA_DISABLED, "true" );
            this._sel.contentChanged( items$ );

            if ( o.useIconList ) {
                let vp$ = this.element.find( SEL_TMV_WRAP_SCROLL ),
                    top = vp$.scrollTop(),
                    iconList = this.getIconList();

                iconList.refresh();
                vp$.scrollTop( top ); // restore the scroll offset that was changed by refresh
            }
            // after all records rendered set to clear cache for next time
            this.atOptions.clearItemCache = true;

            if ( this.gotoItemPending ) {
                setTimeout( ()=> {
                    this.gotoItem( this.gotoItemPending );
                }, 0 );
            }
        },

        _controlBreakData: function( record ) {
            return {
                record: record
            };
        },

        _renderBreak: function ( out, expandControl, breakData, serverOffset ) {
            const o = this.options;
            let itemMarkup,
                atOptions = this.atOptions,
                substs = atOptions.extraSubstitutions,
                template = ( o.controlBreakBeforeTemplate && o.controlBreakAfterTemplate ) ?
                    o.controlBreakBeforeTemplate : o.controlBreakTemplate;

            clearSubstitutions( substs );
            // todo what if anything to do with expandControl?
            atOptions.model = this.model;
            atOptions.record = breakData.record;
            // break records have no id but do have a group id.
            substs.APEX$GROUP_ID = this.model.getControlBreakId( breakData.record );
            substs.APEX$ROW_INDEX = serverOffset != null ? "" + ( serverOffset + 1 ) : "";
            delete atOptions.placeholders.APEX$ROW_IDENTIFICATION;
            atOptions.placeholders.APEX$GROUP_IDENTIFICATION =
                `data-group-id="${util.escapeHTMLAttr( substs.APEX$GROUP_ID )}" data-rownum="${substs.APEX$ROW_INDEX}"`;
            // todo consider if control breaks can have selector checkboxes
            delete atOptions.placeholders.APEX$SELECTOR;

            itemMarkup = applyTemplate( template, atOptions );
            // todo does it make sense to run the highlighter here?
            if ( o.highlighter ) {
                itemMarkup = o.highlighter( o.highlighterContext, itemMarkup );
            }
            // todo think is interactive content allowed in break record?
            out.markup( itemMarkup );
            // after rendering the first record don't clear the item cache again until all records are rendered.
            this.atOptions.clearItemCache = false;
        },

        _renderEndBreak: function( out, breakData ) {
            const o = this.options;
            let itemMarkup,
                atOptions = this.atOptions,
                substs = atOptions.extraSubstitutions,
                template = ( o.controlBreakBeforeTemplate && o.controlBreakAfterTemplate ) ?
                    o.controlBreakAfterTemplate : null;

            if ( !template ) {
                return;
            }
            clearSubstitutions( substs );
            atOptions.model = this.model;
            atOptions.record = breakData.record;
// todo think what if any substitutions or placeholders are needed for the end break template?
//            substs.APEX$GROUP_ID = "";
//            substs.APEX$ROW_INDEX = "";
//            atOptions.placeholders.APEX$GROUP_IDENTIFICATION = `data-rownum="${substs.APEX$ROW_INDEX}"`;
            delete atOptions.placeholders.APEX$ROW_IDENTIFICATION;
            delete atOptions.placeholders.APEX$GROUP_IDENTIFICATION;
            delete atOptions.placeholders.APEX$SELECTOR;

            itemMarkup = applyTemplate( template, atOptions );
            out.markup( itemMarkup );
        },

        _renderRecord: function( out, record, index, id, meta ) {
            const o = this.options,
                atOptions = this.atOptions,
                substs = atOptions.extraSubstitutions;
            let highlight, itemMarkup,
                template = o.recordTemplate,
                label = "",
                cls = "";

            clearSubstitutions( substs );

            if ( meta.agg ) {
                if ( o.aggregateTemplate ) {
                    template = o.aggregateTemplate;
                    // add special symbols
                    substs.APEX$AGG = meta.agg;
                    substs.APEX$AGG_TOTAL = meta.grandTotal ? "Y" : "";
                    substs.APEX$ROW_STATE_CLASSES = "is-aggregate";
                } else {
                    // aggregate records are not supported when there is no template
                    return;
                }
            } else {
                // add special symbols
                if ( meta.url ) {
                    substs.APEX$ROW_URL = meta.url;
                }
                if ( meta.hidden ) {
                    cls += " u-hidden";
                }
                if ( this.model.isDisabled( record, meta ) ) {
                    cls += " " + C_DISABLED;
                }
                if ( meta.sel ) {
                    cls += " " + C_SELECTED;
                }
                if ( meta.deleted ) {
                    cls += " " + C_DELETED;
                } else {
                    if ( meta.inserted ) {
                        cls += " is-inserted";
                    } else if ( meta.updated ) {
                        cls += " is-updated";
                    }
                    if ( meta.error ) {
                        cls += " is-error";
                    } else if ( meta.warning ) {
                        cls += " is-warning";
                    }
                    if ( meta.highlight ) {
                        highlight = o.highlights[meta.highlight];
                        if ( highlight && highlight.cssClass ) {
                            cls += " " + highlight.cssClass;
                        } else {
                            cls += " " + meta.highlight;
                        }
                    }
                    if ( meta.message ) {
                        substs.APEX$VALIDATION_MESSAGE = meta.message;
                    }
                }
                if ( cls ) {
                    substs.APEX$ROW_STATE_CLASSES = cls;
                }
            }

            // add special symbols
            substs.APEX$ROW_ID = "" + id;
            substs.APEX$ROW_INDEX = "" + ( index + 1 );
            delete atOptions.placeholders.APEX$GROUP_IDENTIFICATION;
            atOptions.placeholders.APEX$ROW_IDENTIFICATION =
                `data-id='${util.escapeHTMLAttr( substs.APEX$ROW_ID )}' data-rownum="${substs.APEX$ROW_INDEX}"`;
            label = o.accLabelColumn ?
                lang.formatMessage( "APEX.TMV.SELECTOR_LABEL_1", this.model.getValue( record, o.accLabelColumn ) ) :
                lang.getMessage( "APEX.TMV.SELECTOR_LABEL" );
            atOptions.placeholders.APEX$SELECTOR = this.selectorPlaceholder.replaceAll( "%0", label );

            atOptions.model = this.model;
            atOptions.record = record;
            itemMarkup = applyTemplate( template, atOptions );
            if ( o.highlighter && !meta.agg ) {
                itemMarkup = o.highlighter( o.highlighterContext, itemMarkup );
            }
            out.markup( itemMarkup );
            // after rendering the first record don't clear the item cache again until all records are rendered.
            this.atOptions.clearItemCache = false;
        },

        _removeRecord: function( element ) {
            element.remove();
            this._sel.contentChanged();
        },

        _insertRecord: function( element, record, id, meta, where ) {
            const out = util.htmlBuilder();

            this._renderRecord( out, record, null, id, meta );
            this.atOptions.clearItemCache = true;
            let newItem$ = $( out.toString() );

            if ( where === INSERT_AFTER && element ) {
                element.after( newItem$ );
            } else {
                // todo xxx if have nested groups need to know what group it goes in
                this.data$.prepend( newItem$ );
            }
            newItem$.find( SEL_DISABLED )
                .add( newItem$.filter( SEL_DISABLED ) ).attr( ARIA_DISABLED, "true" );

            if ( this.options.useIconList ) {
                this.getIconList().refresh(); // note, this messes up the scroll offset
                // xxx any way to delay until visible?
            } else {
                this._sel.contentChanged( newItem$ );
            }
            return newItem$;
        },

        _afterInsert: function( /* insertedElements, copy */ ) {
        },

        _identityChanged: function( prevId, id ) {
            const element$ = this._elementsFromRecordIds( [prevId] )[0];

            if ( element$ ) {
                let rec = this.model.getRecord( id ),
                    meta = this.model.getRecordMetadata( id );

                // Don't know details of presentation so can't update identity. Just render record and replace.
                this._replaceRecord( element$, rec, prevId, id, meta );
            }
        },

        _replaceRecord: function( element$, record, oldId, id, meta ) {
            const o = this.options,
                out = util.htmlBuilder();
            let item$,
                wasSelected = element$.hasClass( C_SELECTED ),
                index = element$.attr( DATA_ROWNUM ) || null;

            if ( index !== null ) {
                index = toInteger( index ) - 1;
            }
            if ( wasSelected && !o.persistSelection ) {
                // use meta.sel to preserve the selection state
                meta = $.extend( {}, meta ); // make a copy, shallow is OK, works even if meta is null/undefined
                meta.sel = true;
            }
            this._renderRecord( out, record, index, id, meta );
            this.atOptions.clearItemCache = true;
            item$ = $( out.toString() );
            // expect that the top level element returned by _renderRecord is the item or in the case of
            // layout grid markup is the parent of the item.
            if ( o.itemSelector && !item$.is( o.itemSelector ) ) {
                element$ = element$.parent();
            }
            element$.replaceWith( item$ );

            if ( o.useIconList ) {
                this.getIconList().refresh(); // note, this messes up the scroll offset
                // set record in list to the matching ID after refresh
                this.getIconList().setSelection( $( `[${DATA_ID}="${util.escapeCSS( id )}"]` ) );
                this.focus();
                // xxx any way to delay until visible?
            } else {
                this._sel.contentChanged( item$ );
            }
        },

        // _updateRecordField: function( element, record, field, meta )
        // this view doesn't know about fields or cells so can't update them but the whole item is updated due to _updateRecordState

        _removeFocus: function( /* element */ ) {
            // todo delegate to _sel?
        },

        _checkAllHidden: util.debounce( function() {
            const pagination = this.options.pagination;
            let items$;

            if ( this._hasNestedControlBreaks() ) {
                items$ = this.data$.find( this._controlBreakSelector() + " " + this._itemSelector() );
            } else {
                items$ = this.data$.children();
                if ( this._controlBreakSelector() ) {
                    items$ = items$.not( this._controlBreakSelector() );
                }
            }
            if ( !items$.is( ":visible" ) ) {
                // no items are visible so switch to showing no data
                this.noData$.show();
                this.data$.hide();
                this.noData = true;
            } else {
                // at least one item is visible
                // but some may be hidden so check if need to render more items
                if ( pagination.scroll && !pagination.loadMore && !pagination.virtual) {
                    if ( this.data$.height() < this.scrollParent$.height() ) {
                        // If add more scrolling it is possible for visible items to be smaller than the viewport but still
                        // not have all the data. In this case it is not possible to add more data because can't scroll.
                        this._addNextPage();
                    }
                }
                // todo think when all items in a group are hidden should the group heading also be hidden?

                // Note client side filtering works best when all the records are rendered. This means it makes
                // no sense for pagination.page unless the rowsPerPage includes all records. It does not work
                // for virtual scroll pagination. It works somewhat for non-virtual scroll pagination. For
                // load more it works but it can get tedious clicking on load more button.
                // Pagination footer info may be confusing while filtering
                // Doesn't work with highlighter because record not re-rendered
                // TODO doc these limitations
                // TODO need to keep adding pages in _addPageOfRecords if the viewport is not full
            }
        }, 10 ),

        _updateRecordState: function( element$, id, record, meta, property ) {
            if ( property === "hidden" ) {
                // just showing or hiding.
                if ( this.noData && !meta.hidden ) {
                    // was showing no data and now something is visible so switch to showing data
                    this.noData$.hide();
                    this.data$.show();
                    this.noData = false;
                }
                element$.toggleClass( "u-hidden", meta.hidden );
                if ( !this.noData ) {
                    // check if all items are hidden after all the calls to update the hidden state
                    this._checkAllHidden();
                }
                return;
            } // else
            // Don't know details of presentation so can't update state. Just render record and replace.
            this._replaceRecord( element$, record, id, id, meta );
        }
    } );

})( apex.util, apex.model, apex.debug, apex.lang, apex.item, apex.jQuery );
