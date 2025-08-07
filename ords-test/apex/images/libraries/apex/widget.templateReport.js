/*!
 * Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
 */

( function( util, widgetUtil, region, $, server, lang, widget, debug, model ) {
    "use strict";

    // attributes
    const ELEMENT_ATTR_ROWNUM = "data-rownum",
        ELEMENT_ATTR_ID = "data-id",
        SEL_ATTR_ID = "[" + ELEMENT_ATTR_ID + "]",
        // messages
        MSG_NO_DATA_FOUND_DEFAULT = "APEX.IG.NO_DATA_FOUND",
        MSG_NO_DATA_FOUND_ENTITY = "APEX.NO_DATA_FOUND_ENTITY",
        // events
        EVENT_SELECTION_CHANGE = "apexselectionchange",
        EVENT_CURRENT_ROW_CHANGE = "apexcurrentrowchange";

    /**
     * @interface templateReportRegion
     * @since 24.1
     * @extends {region}
     * @classdesc
     * <p>The templateReportRegion interface is used to access the properties and methods of any
     * Template Component Report region.
     * You get access to the templateReportRegion interface with the {@link apex.region} function when passed
     * the regionId (static ID) of a Template Component Report region.
     * </p>
     * <p>Template Component Reports are server rendered regions and have only a few client side API methods.
     * The contents of the report are called rows even if the template component UI may look different such as
     * with cards where multiple cards/rows are on the same visual row.</p>
     */
    /*
     * templateReportRegion interface
     * It would be nice if we could use (at)borrows but, we need to change too much of the wording
     */
    /**
     * <p>Set focus to the templateReport if possible. If the view supports selection or focus
     * then the last focused (current) row will be focused. Otherwise, the first focusable
     * element within the report, if any, will be focused.</p>
     *
     * @method focus
     * @memberOf templateReportRegion.prototype
     * @example <caption>This example puts focus in the report.</caption>
     * apex.region( "regionStaticId" ).focus();
     */
    /**
     * <p>Returns the current row as a jQuery object.
     * The current row is the row that has or last had focus.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     *
     * @method getCurrentRow
     * @memberOf templateReportRegion.prototype
     * @returns {jQuery} The current row or null if not supported.
     * @example <caption>This example get the current row in the report.</caption>
     * var current$ = apex.region( "regionStaticId" ).getCurrentRow();
     * console.log( "make use of current row", current$ );
     */
    /**
     * <p>Sets the last focused row to the given pRow$. If pRow$ is not a row
     * or not in the report container the current row is not changed.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * <p>The {@link apex.event:apexcurrentrowchange} event is triggered any time the current row changes.</p>
     *
     * @method setCurrentRow
     * @memberOf templateReportRegion.prototype
     * @param {jQuery} pRow$ The row to make current.
     * @param {boolean} [pFocus] If true also focus the row.
     * @example <caption>This example finds a particular row using jQuery and then makes it the
     * current row and sets focus to it. In this example report rows have class "my-item".</caption>
     * var current$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setCurrentRow( current$, true );
     */
    /**
     * <p>Returns the value of the current row.
     * The current row is the row that has or last had focus.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     *
     * @method getCurrentRowValue
     * @memberOf templateReportRegion.prototype
     * @returns {string} The current row value or null if not supported.
     */
    /**
     * <p>Sets the last focused row to the one with the given pRowValue. If no row has the given value
     * the current row is not changed. The row must be rendered in order to be made the current row.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.</p>
     * <p>This is only applicable if the report supports selection or focus navigation.</p>
     * <p>The {@link apex.event:apexcurrentrowchange} event is triggered any time the current row changes.</p>
     *
     * @method setCurrentRowValue
     * @memberOf templateReportRegion.prototype
     * @param {string} pRowValue The value of a row.
     * @param {boolean} [pFocus] If true also focus the row.
     */
    /**
     * <p>Return the currently selected rows as a jQuery collection.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * <p>Because this returns a jQuery collection it can only return selected rows that are
     * currently in the DOM. When using virtual scroll pagination with show total count on,
     * it is better to use {@link templateReportRegion#getSelectedValues}</p>
     * <p>See also {@link templateReportRegion#setSelection}.</p>
     *
     * @method getSelection
     * @memberOf templateReportRegion.prototype
     * @return {?jQuery} The selected row elements as a jQuery collection.
     * Returns null if selection isn't supported or the report is not initialized.
     * @example <caption>This example get the current selection.</caption>
     * var selection$ = apex.region( "regionStaticId" ).getSelection();
     * console.log( "make use of selected rows", selection$ );
     */
    /**
     * <p>Set the selected rows. Triggers the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     * <p>See also {@link templateReportRegion#getSelection}.</p>
     *
     * @method setSelection
     * @memberOf templateReportRegion.prototype
     * @param {jQuery} pElements$ A jQuery object with row elements such as the return value of getSelection.
     * @param {boolean} [pFocus] If true the first row element of the selection is given focus.
     * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
     * @example <caption>This example finds a particular row using jQuery and then selects it
     * and sets focus to it. In this example report rows have class "my-item".</caption>
     * var toSelect$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setSelection( toSelect$, true );
     */
    /**
     * <p>Select all the rows in the report that can be selected. Triggers the
     * {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports multiple selection and
     * if the report has a select all control.</p>
     *
     * @method selectAll
     * @memberOf templateReportRegion.prototype
     * @param {?boolean} [pFocus] If true the first selected row is given focus.
     * @param {boolean} [pNoNotify] If true the selection change notification will be suppressed.
     * @example <caption>This example selects all the rows in the report.</caption>
     * apex.region( "regionStaticId" ).selectAll();
     */
    /**
     * <p>Returns the value for each selected row.
     * The value of a row is its primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     *
     * @method getSelectedValues
     * @memberOf templateReportRegion.prototype
     * @returns {?string[]} Array of selected record values.
     * Returns null if selection is not supported.
     */
    /**
     * <p>Selects the report rows that correspond to the given values.
     * The value of a row is the primary key in the <code class="prettyprint">data-id</code> attribute.
     * This attribute is typically added with the #APEX$ROW_IDENTIFICATION# placeholder.
     * Triggers the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the report supports selection.</p>
     *
     * @method setSelectedValues
     * @memberOf templateReportRegion.prototype
     * @param {string[]} pValues Array of row values to select.
     * @param {boolean} [pFocus] If true the first row of the selection is given focus.
     * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
     * @return {number} Count of the rows actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    /**
     * <p>Display the first page of rows. If pagination type is scroll
     * then this simply scrolls to the top of the viewport
     * and a new page of rows is added if needed. If pagination type is not scroll
     * and not already on the first page the view is refreshed and shows the first page.</p>
     *
     * @method firstPage
     * @memberOf templateReportRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the first page.</caption>
     * apex.region( "regionStaticId" ).firstPage();
     */
    /**
     * <p>Display the previous page of rows. If pagination type is scroll
     * the viewport scrolls up one page and
     * rows are added if needed. If pagination type is not scroll
     * and not on the first page refresh the view to show the previous page.</p>
     *
     * @method previousPage
     * @memberOf templateReportRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the previous page.</caption>
     * apex.region( "regionStaticId" ).previousPage();
     */
    /**
     * <p>Display the next page of rows. If pagination type is scroll
     * the viewport scrolls down one page and
     * rows are added if needed. If pagination type is not scroll
     * and not on the last page refresh the view to show the next page.</p>
     *
     * @method nextPage
     * @memberOf templateReportRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the next page.</caption>
     * apex.region( "regionStaticId" ).nextPage();
     */
    /**
     * <p>Display the last page of rows. If pagination type is scroll
     * this simply scrolls to the bottom of the viewport
     * and a new page of rows is added if needed. pagination type is not scroll
     * and not already on the last page the view is refreshed and shows the last page.
     * This method only works correctly if the report knows the total number of rows.</p>
     *
     * @method lastPage
     * @memberOf templateReportRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the last page.</caption>
     * apex.region( "regionStaticId" ).lastPage();
     */
    /* document this if TCR ever supports load more pagination */
    /**
     * <p>Load more records into the view. If pagination type is load more
     * this adds a new page of rows to the end.
     * If pagination type is not load more this is the same as <code class="prettyprint">nextPage</code>.</p>
     *
     * @ignore
     * @method loadMore
     * @memberOf templateReportRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     */
    // don't doc methods/properties that don't apply to templateReportRegion
    /**
     * @ignore
     * @member widgetName
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @member parentRegionId
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @method call
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @method on
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @method off
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @method widget
     * @memberOf templateReportRegion.prototype
     */
    /**
     * @ignore
     * @method alternateLoadingIndicator
     * @memberOf templateReportRegion.prototype
     */

    /**
     * @interface cardsRegion
     * @since 24.1
     * @extends {region}
     *
     * @classdesc
     * <p>The cardsRegion interface is used to access the properties and methods of Cards regions.
     * You get access to the cardsRegion interface with the {@link apex.region} function when passed
     * the regionId (static ID) of a Cards region.
     * </p>
     * <p>Cards is a client rendered region using {@link model} for the data layer and {@link tableModelView}
     * widget for the view layer. This interface is a convenient wrapper for most of the methods
     * of {@link tableModelView}. The cards in the report are called items
     * (not to be confused with APEX Page Items or Column Items).
     * See {@link tableModelView} for information about report markup requirements.</p>
     */
    /**
     * <p>Set focus to the cards region if possible. If the view supports selection or focus
     * then the last focused (current) item will be focused. Otherwise, the first focusable
     * element within the report, if any, will be focused.</p>
     *
     * @method focus
     * @memberOf cardsRegion.prototype
     * @example <caption>This example puts focus in the report.</caption>
     * apex.region( "regionStaticId" ).focus();
     */
    /**
     * <p>Return the model currently being used by this view.
     * The model can change over time so the returned model should not be saved and used later.
     * If you need to store a reference to the model use {@link apex.model.get} and release it with
     * {@link apex.model.release}.
     * </p>
     *
     * @method getModel
     * @memberOf cardsRegion.prototype
     * @returns {model} The current {@link model}.
     */
    /**
     * <p>Return information about the current pagination state of the view.
     * Returns null if there is no data in the report.</p>
     *
     * @method getPageInfo
     * @memberOf cardsRegion.prototype
     * @return {?tableModelViewBase.pageInfo}
     * @example <caption>This example logs to the console the current page and total number of pages
     * The Cards region pagination type must be Page and Show Total Count must be on.</caption>
     * var info = apex.region( "regionStaticId" ).getPageInfo();
     * console.log("current and total pages", info.currentPage, info.totalPages );
     */
    /**
     * <p>Returns the current item as a jQuery object.
     * The current item is the item that has or last had focus.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#setCurrentItem}.</p>
     *
     * @method getCurrentItem
     * @memberOf cardsRegion.prototype
     * @returns {jQuery} The current item or null if not supported.
     * @example <caption>This example get the current item in the report.</caption>
     * var currentItem$ = apex.region( "regionStaticId" ).getCurrentItem();
     * console.log( "make use of current item", currentItem$ );
     */
    /**
     * <p>Sets the last focused item to the given pItem$. If pItem$ is not an item
     * or not in the report container the current item is not changed.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#getCurrentItem}.</p>
     *
     * <p>The {@link tableModelView#event:currentitemchange} event
     * and the {@link apex.event:apexcurrentrowchange} event are triggered any time the current item changes.</p>
     *
     * @method setCurrentItem
     * @memberOf cardsRegion.prototype
     * @param {jQuery} pItem$ The item to make current.
     * @param {boolean} [pFocus] If true also focus the item.
     * @example <caption>This example finds a particular item using jQuery and then makes it the
     * current item and sets focus to it. In this example report items have class "my-item".</caption>
     * var currentItem$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setCurrentItem( currentItem$, true );
     */
    /**
     * <p>Returns the value of the current item.
     * The current item is the item that has or last had focus.
     * The value of an item is its unique identifier as returned by {@link model#getRecordId}.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "focus"
     * or "select". See also {@link cardsRegion#setCurrentItemValue}.</p>
     *
     * @method getCurrentItemValue
     * @memberOf cardsRegion.prototype
     * @returns {string} The current item value or null if not supported.
     */
    /**
     * <p>Sets the last focused item to the one with the given pItemValue. If no item has the given value
     * the current item is not changed. The item must be rendered in order to be made the current item.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * or "focus". See also {@link cardsRegion#getCurrentItemValue}.</p>
     *
     * <p>The {@link tableModelView#event:currentitemchange} event
     * and the {@link apex.event:apexcurrentrowchange} event are triggered any time the current item changes.</p>
     *
     * @method setCurrentItemValue
     * @memberOf cardsRegion.prototype
     * @param {string} pItemValue The value of an item.
     * @param {boolean} [pFocus] If true also focus the item.
     */
    /**
     * <p>Return the currently selected items as a jQuery collection.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>Because this returns a jQuery collection it can only return selected items that are
     * currently in the DOM. When using virtual scroll pagination and {@link tableModelView#persistSelection} is
     * true it is better to use {@link cardsRegion#getSelectedRecords}</p>
     * <p>See also {@link cardsRegion#setSelection}.</p>
     *
     * @method getSelection
     * @memberOf cardsRegion.prototype
     * @return {?jQuery} The selected item elements as a jQuery collection.
     * Returns null if selection isn't supported or the report is not initialized.
     */
    /**
     * <p>Set the selected items. Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>See also {@link cardsRegion#getSelection}.</p>
     *
     * @method setSelection
     * @memberOf cardsRegion.prototype
     * @param {jQuery} pElements$ A jQuery object with item elements such as the return value of
     *   {@Link cardsRegion#getSelection}.
     * @param {boolean} [pFocus] If true the first item element of the selection is given focus.
     * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
     * @example <caption>This example finds a particular item using jQuery and then selects it
     * and sets focus to it. In this example report items have class "my-item".</caption>
     * var item$ = $( "#regionStaticId .my-item" ).first();
     * apex.region( "regionStaticId" ).setSelection( item$, true );
     */
    /**
     * <p>Select all the items in the report that can be selected. Triggers the
     * {@link tableModelView#event:selectionchange} event and the
     * {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@link tableModelView#itemNavigationMode} option is "select"
     * and {@link tableModelView#multiple} and {@link tableModelView#selectAll(1)} options are both true.</p>
     *
     * <p>This only applies to the current page or what has been rendered so far unless the selection
     * state is persisted in the model.
     * See {@link tableModelView#selectAll(1)} for details about how pagination settings and
     * {@link tableModelView#persistSelection} affect the meaning of "all items".</p>
     *
     * @method selectAll
     * @memberOf cardsRegion.prototype
     * @param {?boolean} [pFocus] If true the first selected item is given focus.
     * @param {boolean} [pNoNotify] If true the selection change notification will be suppressed.
     * @example <caption>This example selects all the items in the report.</caption>
     * apex.region( "regionStaticId" ).selectAll();
     */
    /**
     * <p>Returns the value for each record returned by {@link cardsRegion#getSelectedRecords}.
     * The value of a record is its unique identifier as returned by {@link model#getRecordId}.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     *
     * @method getSelectedValues
     * @memberOf cardsRegion.prototype
     * @returns {?string[]} Array of selected record values.
     * Returns null if selection is not supported.
     */
    /**
     * <p>Selects the report items that correspond to the given values.
     * The value of an item is the unique identifier of the corresponding model record
     * as returned by {@link model#getRecordId}
     * and also the value of the item's <code class="prettyprint">data-id</code> attribute.
     * Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     *
     * @method setSelectedValues
     * @memberOf cardsRegion.prototype
     * @param {string[]} pValues Array of item/record values to select.
     * @param {boolean} [pFocus] If true the first record of the selection is given focus.
     * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
     * @return {number} Count of the items actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    /**
     * <p>Given a jQuery object with one or more item elements return the corresponding model records.
     * For this to work the elements must have a <code class="prettyprint">data-id</code>
     * attribute with the value of the record id.</p>
     *
     * @method getRecords
     * @memberOf cardsRegion.prototype
     * @param {jQuery} pElements$ A jQuery object of item elements such as returned
     *   by {@link cardsRegion#getSelection}.
     * @return {model.Record[]} Array of records from the model corresponding to the item elements.
     */
    /**
     * <p>Return the underlying data model records corresponding to the current selection.</p>
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     *
     * <p>When using virtual scroll pagination and {@link tableModelView#persistSelection} is
     * true it is possible for the user to select a range of records or all records when the model
     * does not yet contain all the selected records. In this case the selection is incomplete
     * and only the records currently in the model will be returned. See option
     * {@link tableModelView#loadIncompleteSelection} for how an incomplete selection is handled.</p>
     * <p>See also {@link cardsRegion#setSelectedRecords}.</p>
     *
     * @method getSelectedRecords
     * @memberOf cardsRegion.prototype
     * @return {?model.Record[]} Array of records from the model corresponding to the selected items.
     * Returns null if selection is not supported.
     */
    /**
     * <p>Selects the report items that correspond to the given data model records.
     * Triggers the {@link tableModelView#event:selectionchange} event
     * and the {@link apex.event:apexselectionchange} event if the selection
     * changes unless <code class="prettyprint">pNoNotify</code> is true.</p>
     *
     * <p>This is only applicable if the {@Link tableModelView#itemNavigationMode} option is "select".</p>
     * <p>See also {@link cardsRegion#getSelectedRecords}.</p>
     *
     * @method setSelectedRecords
     * @memberOf cardsRegion.prototype
     * @param {model.Record[]} pRecords Array of data model records to select.
     * @param {boolean} [pFocus] If true the first record of the selection is given focus.
     * @param {boolean} [pNoNotify] If true the selection change event will be suppressed.
     * @return {number} Count of the items actually selected or -1 if called before the report is initialized or
     * there is no data or selection is not supported.
     */
    /**
     * <p>Display the first page of items. If option <code class="prettyprint">pagination.scroll</code>
     * is true simply scrolls to the top of the viewport
     * and a new page of items is added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not already on the first page the view is refreshed and shows the first page.</p>
     *
     * @method firstPage
     * @memberOf cardsRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the first page.</caption>
     * apex.region( "regionStaticId" ).firstPage();
     */
    /**
     * <p>Display the previous page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true the viewport scrolls up one page and
     * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not on the first page refresh the view to show the previous page.</p>
     *
     * @method previousPage
     * @memberOf cardsRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the previous page.</caption>
     * apex.region( "regionStaticId" ).previousPage();
     */
    /**
     * <p>Display the next page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true the viewport scrolls down one page and
     * records are added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not on the last page refresh the view to show the next page.</p>
     *
     * @method nextPage
     * @memberOf cardsRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the next page.</caption>
     * apex.region( "regionStaticId" ).nextPage();
     */
    /**
     * <p>Display the last page of items. If <code class="prettyprint">pagination.scroll</code>
     * is true simply scrolls to the bottom of the viewport
     * and a new page of items is added if needed. If <code class="prettyprint">pagination.scroll</code>
     * is false and not already on the last page the view is refreshed and shows the last page.
     * This method only works correctly if the model knows the total number of rows.</p>
     *
     * @method lastPage
     * @memberOf cardsRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to the last page.</caption>
     * apex.region( "regionStaticId" ).lastPage();
     */
    /**
     * <p>Go to the specified page number. This should only be used when
     * <code class="prettyprint">pagination.scroll</code> is false and the model knows the total number of records.</p>
     *
     * @method gotoPage
     * @memberOf cardsRegion.prototype
     * @param {number} pPageNumber zero based page number
     * @return {boolean} true for success, false if a page is currently being rendered.
     * @example <caption>This example goes to 4th page. Note that the page numbers are zero based.
     * If there are not that many pages then nothing happens.</caption>
     * apex.region( "regionStaticId" ).gotoPage( 3 );
     */
    /**
     * <p>Load more records into the view. If option <code class="prettyprint">pagination.scroll</code>
     * is true this adds a new page of items to the end.
     * If <code class="prettyprint">pagination.scroll</code> is false this is the same as
     * <code class="prettyprint">nextPage</code>.
     * This is intended to be used when <code class="prettyprint">pagination.loadMore</code> is true.</p>
     *
     * @method loadMore
     * @memberOf cardsRegion.prototype
     * @return {boolean} true for success, false if a page is currently being rendered.
     */
    // don't doc methods/properties that don't apply to cardsRegion
    /**
     * @ignore
     * @member parentRegionId
     * @memberOf cardsRegion.prototype
     */
    /**
     * @ignore
     * @method alternateLoadingIndicator
     * @memberOf cardsRegion.prototype
     */

    /**
     * Initialization function for template based reports such as cards.
     * Expected markup:
     * <div id="{regionStaticId}">...
     *   <div id="{regionStaticId}_tmv"></div>
     *   ...
     * </div>
     *
     * @ignore
     * @param {object} options Required options object. This is the options object to be passed to tableModelView widget
     *   with the following additional properties:
     * @param {string} options.regionType
     * @param {string} options.regionId
     * @param {string} options.regionStaticId
     * @param {string} options.ajaxIdentifier
     * @param {string} options.ajaxColumns used by template reports for regionData
     * @param {string} options.ajaxActions used by template reports for regionData
     * @param {string} options.ajaxActionMenus used by template reports for regionData
     * @param {string|string[]} options.itemsToSubmit
     * @param {string} options.parentRegionStaticId  todo when master detail supported
     * @param {boolean} options.trackParentSelection todo when master detail supported
     * @param {boolean} options.lazyLoading
     * @param {string} options.filterRegionId
     * @param {number} options.reportHeight todo for future use?
     * @param {string} options.modelName
     * @param {object} options.modelOptions options object to be passed to apex.model.create.
     *   shape, recordIsArray, fields regionId, ajaxIdentifier, and pageItemsToSubmit are set automatically.
     *   The following are just some of the model options that may be important to set
     * @param {string|string[]} options.modelOptions.identityField
     * @param {string} options.modelOptions.metaField
     * @param {string} options.modelOptions.paginationType
     * @param {boolean} options.modelOptions.hasTotalRecords
     * @param {boolean} options.pagination.savePaginationToServer send page change event to server as callback
     *
     * @param {string|object} [initialData] optional initial data. If it is a string it is the id of a
     *   application/json type script element that contains an object as described below. If it is
     *   an object then it has the following properties.
     * @param {array} initialData.values an array of records
     * @param {number} initialData.firstDisplayedRow row number of the first record that is prerendered
     * @param {boolean} initialData.moreData true if the server has more records and false otherwise
     * @param {number} [initialData.totalRows] optional total number of rows in the result set
     */
    widget.templateReportRegionInit = function( options, initialData ) {
        const report$ = $( "#" + util.escapeCSS( options.regionStaticId + "_" + options.regionType ) );
        let moreData /* intentionally undefined */,
            values = null,
            total = null,
            ajaxOnPageChange = false;

        debug.info( "Init template report region: ", options );

        function resize( init ) {
            let w = sizer$.width(),
                h = sizer$.height();

            // make sure the widget still exists
            if ( !report$.data( "apexTableModelView" ) ) {
                return;
            }

            // todo temporary hack for template reports for cleaner markup.
            //  We need to check in 23.2 how we optimize this or maybe we don't need this
            if ( !options._isTemplateReport ) {
                util.setOuterWidth( report$, w );
            }
            if ( options.hasSize ) {
                util.setOuterHeight( report$, h );
            }
            if ( !init ) {
                report$.tableModelView( "resize" );
            }
        }

        function setPositionInfo( pOptions ) {
            const pageInfo = report$.tableModelView( "getPageInfo" ) || {};
            let rowNum = null;

            $.each( report$.find( SEL_ATTR_ID ), function ( i, e ) {
                const el$ = $( e );

                if ( pageInfo.scrollOffset ) {
                    const offset = el$.offset().top;
                    if ( ( offset - ( pageInfo.rowHeight/2 || 0 ) ) >= pageInfo.scrollOffset ) {
                        rowNum = el$.attr( ELEMENT_ATTR_ROWNUM );
                        return false;
                    }
                } else {
                    rowNum = el$.attr( ELEMENT_ATTR_ROWNUM );
                    return false;
                }
            } );

            const regionData = {
                ajaxIdentifier: pOptions.ajaxIdentifier,
                id: pOptions.regionId,
                pageChange: {
                    offset: pageInfo.pageOffset,
                    count: pageInfo.pageSize,
                    firstDisplayRow: rowNum
                }
            };

            server.plugin ( {
                regions: [
                    regionData
                ]
            } );
        }

        function onPageChange () {
            // menu needs an init call after they where rendered
            // todo we need to have such a button as web component that handles
            // the create and destroy of the menu when it connect/disconnects
            $( "button[data-menu^='tc_menu_a']", report$ ).each( function() {
                const menuId = util.escapeCSS( this.getAttribute( "data-menu" ) );

                $( `div.a-Menu[id=${ menuId }]` ).remove();
                $( `#${ menuId }` ).menu();
            } );

            // remove is-loading class
            report$.removeClass( "is-loading" );

            // scroll to last element
            /* TODO RW
            if ( options.pagination.scroll && data && data.firstDisplayedRow > 1 && report$.is( ":visible" ) ) {
                const lastElement$ = report$.find( "[" + ELEMENT_ATTR_ROWNUM + "=" + data.firstDisplayedRow +"]" );

                if ( lastElement$ && lastElement$.offset() ) {
                 //   $( "body" ).scrollTop( lastElement$.offset().top );
                }
            }*/
        }

        initialData = model.initialModelData( initialData );

        if ( initialData?.firstDisplayedRow > 1 ) {
            options.firstDisplayedRow = initialData.firstDisplayedRow - 1;
        }

        if ( !options.lazyLoading && initialData ) {
            if ( initialData.totalRows ) {
                total = initialData.totalRows;
            }
            moreData = initialData.moreData;
            values = initialData.values;
        }

        const reportModel = model.create( options.modelName, $.extend( {}, options.modelOptions, {
            shape: "table",
            recordIsArray: true,
            delayClearData: true, // todo the server should set this?
            fields: options.columns[0],
            regionId: options.regionId,
            ajaxIdentifier: options.ajaxIdentifier,
            regionData: {
                // checksums needed next to ajaxIdentifier by the server to handle ajax requests
                ajaxColumns: options.ajaxColumns,
                ajaxActions: options.ajaxActions,
                ajaxActionMenus: options.ajaxActionMenus
            },
            pageItemsToSubmit: options.itemsToSubmit
        } ), values, total, moreData );

        // after the model is created don't use the initial data anymore
        total = values = null;
        moreData = undefined;

        const sizer$ = report$.parent();

        // already overwritten by the theme that's why code is disabled; can be removed in future
        //sizer$.css( "overflow", "hidden" );

        if ( options.hasSize ) {
            sizer$.css( "height", options.reportHeight || sizer$.height() );
        }
        resize( true ); // before tmv widget is created

        // todo this should be moved into tmvbase
        // entityTitlePlural should be a new standard to allow customers better message customization
        if ( options.entityTitlePlural ) {
            options.noDataMessage = lang.formatMessage( MSG_NO_DATA_FOUND_ENTITY, options.entityTitlePlural );
        } else if ( options.noDataMessage === undefined ) {
            options.noDataMessage = lang.getMessage( MSG_NO_DATA_FOUND_DEFAULT );
        }

        // todo consider that these settings should have declarative configuration consistent with
        //  all regions that do pagination:
        //  loadMore, showPageLinks, maxLinks, showPageSelector, showRange, firstAndLastButtons, hideSinglePage
        // Currently some are defaulted based on other options.
        // Note that showTotalRowCount is really a model setting that views also use to control pagination
        let pagination = options.pagination;

        // send pageChange event data to server to store pagination status
        if ( pagination.savePaginationToServer ) {
            // add scroll listener when pagination is scroll
            // todo this does not work on dialogs at the moment, needs the same implementation or
            //  util function that is still missing im TMV
            if ( options.pagination.scroll ) {
                const window$ = $( window );
                // debounce the firing of the event
                window$.on( "scroll", util.debounce( function() {
                    // check if report is visible and that we scroll on the report
                    if ( report$.is( ":visible" ) &&
                         window$.scrollTop() >= ( report$.offset().top - window.innerHeight ) &&
                         window$.scrollTop() <= ( report$.offset().top + report$.height() ) ) {
                        setPositionInfo( options );
                    }
                }, 600 ) );

                options.pageChange = onPageChange;
            } else {
                // if there page pagination then react on the page change event
                options.pageChange = function() {
                    onPageChange();

                    if ( ajaxOnPageChange ) {
                        setPositionInfo( options );
                    }
                    ajaxOnPageChange = true;
                };
            }
        }

        // todo move this to the server. for now assume variable height rows/items
        options.fixedRowHeight = false;

        // Special case for server rendered control breaks
        if ( options._isTemplateReport && ( options.controlBreakBeforeTemplate || options.controlBreakTemplate ) ) {
            // This overwrites any applyTemplateOptions property
            options.applyTemplateOptions = {
                iterationCallback: function( loopArg, model, record, index, placeholders, extraSubstitutions ) {
                    // todo want to find a way to do this only when rendering a control break
                    let controlBreakId = model.getControlBreakId( record ),
                        meta = model.getRecordMetadata( model.getRecordId( record ) );

                    if ( !meta.controlBreakBefore ) {
                        let cbInfo = model.getControlBreaks( controlBreakId );

                        if ( cbInfo?.firstId ) {
                            meta = model.getRecordMetadata( cbInfo.firstId );
                        }
                    }
                    extraSubstitutions.APEX$BEFORE_GROUP = meta?.controlBreakBefore || "";
                    extraSubstitutions.APEX$AFTER_GROUP = meta?.controlBreakAfter || "";
                }
            };
        }

        // wrap tableModelView events
        /**
         * <p>This event is triggered when the selection changes in a region that supports selection.
         * This event is debounced, which means that it is not triggered until up to a few hundred
         * milliseconds after the last change in selection state. This avoids rapid event triggering
         * while the user moves quickly through the report with the keyboard.</p>
         * <p>Note that some regions and widgets have their own more specific selection change event.
         * See for example {@link interactiveGrid#event:selectionchange}.</p>
         *
         * @event apexselectionchange
         * @memberof apex
         * @property {Event} event <code class="prettyprint">jQuery</code> event object.
         * @property {object} data Additional event data.
         * @property {string[]} data.selectedValues An array of the values for the currently
         * selected items/rows/records in the report. If nothing is selected the array is empty.
         * The values are typically configured to be the primary key of the records.
         * @example <caption>A selection change event handler for a report region with static id
         * "myReport".</caption>
         * apex.region( "myReport" ).element.on( "apexselectionchange", function( event, data ) {
         *     console.log( "do something with selected values", data.selectedValues );
         * } );
         */
        report$.on( "tablemodelviewselectionchange", () => {
            report$.trigger( EVENT_SELECTION_CHANGE, [{
                selectedValues: report$.tableModelView( "getSelectedValues" )
            }] );
        } );
        /**
         * <p>This event is triggered when the current item/row/record changes in a region that supports
         * keyboard navigation and focus management.
         * This event happens a few milliseconds after the last focused item/row/record changes.</p>
         * <p>Note that some widgets have their own more specific focus management event.
         * See for example {@link grid#event:currentcellchange}.</p>
         *
         * @event apexcurrentrowchange
         * @memberof apex
         * @property {Event} event <code class="prettyprint">jQuery</code> event object.
         * @property {object} data Additional event data.
         * @property {string[]} data.currentValue The value for the current
         * item/row/record in the report or null if there is none. The value is typically configured
         * to be the primary key of the record.
         * @example <caption>A current item change event handler for a report region with static id
         * "myReport".</caption>
         * apex.region( "myReport" ).element.on( "apexcurrentrowchange", function( event, data ) {
         *     console.log( "do something with current value", data.currentValue );
         * } );
         */
        report$.on( "tablemodelviewcurrentitemchange", () => {
            report$.trigger( EVENT_CURRENT_ROW_CHANGE, [{
                currentValue: report$.tableModelView( "getCurrentItem" )?.attr( ELEMENT_ATTR_ID )
            }] );
        } );

        report$.tableModelView( options );

        // todo temporary hack for template reports for cleaner markup.
        //  We need to check in 23.2 how we optimize this or maybe we don't need this
        if ( options._isTemplateReport ) {
            const resizeObserver = new ResizeObserver( util.debounce( function() {
                resize();
            }, 100 ) );

            resizeObserver.observe( report$.parent()[0] );
        } else {
            // todo consider if/when this resize logic is needed
            widgetUtil.onElementResize( report$.parent()[0], () => {
                resize();
            } );
        }

        widgetUtil.onVisibilityChange( report$[0], ( show ) => {
            if ( show ) {
                if ( !options._isTemplateReport ) {
                    widgetUtil.updateResizeSensors( sizer$[0] );
                }
                resize();
            }
        } );

        // todo master/detail handling

        const serverRenderedMethods = ["focus", "getSelectedValues", "selectAll",
                "setSelectedValues", "getSelection", "setSelection", "firstPage", "lastPage",
                "nextPage", "previousPage"],
            clientRenderedMethods = [...serverRenderedMethods, "getCurrentItem",  "setCurrentItem",
                "getCurrentItemValue", "setCurrentItemValue",
                "getRecords", "getModel",
                "getSelectedRecords", "setSelectedRecords", "getPageInfo", "gotoPage", "loadMore"];

        region.create( options.regionStaticId, function( baseRegion ) {
            const widgetName = "tableModelView",
                widgetInst = report$[widgetName]( "instance" );

            $.extend( baseRegion, {
                /**
                 * <p>The templateReportRegion type is "TemplateComponent".</p>
                 * @member type
                 * @memberOf templateReportRegion.prototype
                 * @type {string}
                 */
                /**
                 * <p>The cardsRegion type is "Cards".</p>
                 * @member type
                 * @memberOf cardsRegion.prototype
                 * @type {string}
                 */
                type: options.regionType,
                parentRegionId: options.parentRegionStaticId,
                filterRegionId: options.filterRegionId,
                /**
                 * <p>Refreshes the report with new data from the server.</p>
                 * @method refresh
                 * @memberOf templateReportRegion.prototype
                 * @returns {Promise} A promise that is resolved with no arguments when the refresh is complete.
                 */
                /**
                 * <p>Refreshes the report with new data from the server.</p>
                 * @method refresh
                 * @memberOf cardsRegion.prototype
                 * @returns {Promise} A promise that is resolved with no arguments when the refresh is complete.
                 */
                refresh: function() {
                    return new Promise( resolve => {
                        // emulating a single use event handler
                        const viewId = reportModel.subscribe( {
                            onChange: ( changeType ) => {
                                if ( changeType === "refresh" ) {
                                    reportModel.unSubscribe( viewId );
                                    resolve();
                                }
                            }
                        } );

                        if ( !reportModel.clearData() ) {
                            // if clearData returns false there will be no refresh event so just resolve
                            // and unsubscribe otherwise the promise will never be resolved (unless something else
                            // causes another refresh);
                            reportModel.unSubscribe( viewId );
                            resolve();
                        }
                    } );
                }
            } );

            if ( !options._isTemplateReport ) {
                // only client rendered reports provide access to the underlying widget
                baseRegion.widgetName = widgetName;
                baseRegion.widget = function() {
                    return report$;
                };
                /**
                 * <p>Refreshes the view (re-renders the DOM) without fetching new data from the server.</p>
                 *
                 * @method refreshView
                 * @memberOf cardsRegion.prototype
                 */
                baseRegion.refreshView = function() {
                    widgetInst.refresh();
                };
            }

            // copy methods from tableModelView
            let methods = options._isTemplateReport ? serverRenderedMethods : clientRenderedMethods;

            methods.forEach( p => {
                baseRegion[p] = widgetInst[p].bind( widgetInst );
            } );

            if ( options._isTemplateReport ) {
                // a few special cases for methods that get renamed
                baseRegion.getCurrentRow = widgetInst.getCurrentItem.bind( widgetInst );
                baseRegion.setCurrentRow = widgetInst.setCurrentItem.bind( widgetInst );
                baseRegion.getCurrentRowValue = widgetInst.getCurrentItemValue.bind( widgetInst );
                baseRegion.setCurrentRowValue = widgetInst.setCurrentItemValue.bind( widgetInst );
            }
            // todo think about what options to expose even if some are readonly
        } );

    };
} )( apex.util, apex.widget.util, apex.region, apex.jQuery, apex.server, apex.lang, apex.widget, apex.debug,
    apex.model );
