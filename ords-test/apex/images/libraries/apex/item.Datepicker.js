/*!
 Date Picker - APEX component for picking dates. Supports rendering as date/datetimepicker or native date form controls
 Copyright (c) 2022, 2024, Oracle and/or its affiliates.
 */
/**
 * @interface datePickerItem
 * @since 22.2
 * @extends {item}
 * @classdesc
 *  <p>APEX item component for picking dates, supports rendering as date/date-time-picker or as native date (datetime-local) input</p>
 *  <p>Expected markup:</p>
 *
 *  <p>
 *      <code class="prettyprint">
 *          &lt;a-date-picker
 *              id=&quot;P1_DATEPICKER_POPUP&quot;
 *              name=&quot;P1_DATEPICKER_POPUP&quot;
 *              display-as=&quot;popup&quot;
 *              value=&quot;2016-05-27&quot;
 *              format=&quot;YYYY-MM-DD&quot;
 *              valid-example=&quot;2016-05-27&quot;&gt;&lt;/a-date-picker&gt;
 *      </code>
 *  </p>
 *  <p>
 *      <table>
 *          <caption>Attributes common to Popup, Inline and Native types</caption>
 *          <thead>
 *              <tr>
 *                  <th scope="col">Attribute</th>
 *                  <th scope="col">Type</th>
 *                  <th scope="col">Description</th>
 *                  <th scope="col">Options</th>
 *                  <th scope="col">Delegated to the input element</th>
 *                  <th scope="col">Synced with the input element</th>
 *              </tr>
 *          </thead>
 *          <tr>
 *              <th scope="row">display-as</th>
 *              <td>string</td>
 *              <td>Set the display format of the calendar</td>
 *              <td>"inline", "popup", "native"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">min</th>
 *              <td>string</td>
 *              <td>The minimum allowed value</td>
 *              <td></td>
 *              <td></td>
 *              <td>Yes</td>
 *          </tr>
 *          <tr>
 *              <th scope="row">max</th>
 *              <td>string</td>
 *              <td>The maximum allowed value</td>
 *              <td></td>
 *              <td></td>
 *              <td>Yes</td>
 *          </tr>
 *          <tr>
 *              <th scope="row">value</th>
 *              <td>string</td>
 *              <td>Date value in oracle date format</td>
 *              <td></td>
 *              <td></td>
 *              <td>Yes</td>
 *          </tr>
 *          <tr>
 *              <th scope="row">disabled</th>
 *              <td>boolean</td>
 *              <td>Disables the item</td>
 *              <td></td>
 *              <td></td>
 *              <td>Yes</td>
 *          </tr>
 *          <tr>
 *              <th scope="row">name</th>
 *              <td>string</td>
 *              <td>Set the name of input (Important for page submit)</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">required</th>
 *              <td>boolean</td>
 *              <td>Set wether the item is a required field or not</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">placeholder</th>
 *              <td>string</td>
 *              <td>Set the placeholder for the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">autocomplete</th>
 *              <td>string</td>
 *              <td>Set wether the input should be autocomplete or not</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">size</th>
 *              <td>number</td>
 *              <td>Set the size of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">minlength</th>
 *              <td>number</td>
 *              <td>Set the min length of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">maxlength</th>
 *              <td>number</td>
 *              <td>Set the max length of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">aria-describedby</th>
 *              <td>string</td>
 *              <td>Set the aria described of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">aria-labelledby</th>
 *              <td>string</td>
 *              <td>Set the aria labelledby of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">autofocus</th>
 *              <td>boolean</td>
 *              <td>Set the autofocus of the input</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">readonly</th>
 *              <td>boolean</td>
 *              <td>Set if the input is readonly</td>
 *              <td></td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *      </table>
 *  </p>
 *  <p>
 *      <table>
 *          <caption>Attributes common to native types ("display-as"="native")</caption>
 *          <thead>
 *              <tr>
 *                  <th scope="col">Attribute</th>
 *                  <th scope="col">Type</th>
 *                  <th scope="col">Description</th>
 *                  <th scope="col">Options</th>
 *                  <th scope="col">Delegated to the input element</th>
 *                  <th scope="col">Synced with the input element</th>
 *              </tr>
 *          </thead>
 *          <tr>
 *              <th scope="row">type</th>
 *              <td>string</td>
 *              <td>Set the type of the input</td>
 *              <td>"date", "datetime-local"</td>
 *              <td>Yes</td>
 *              <td></td>
 *          </tr>
 *      </table>
 *      <br>
 *      <table>
 *          <caption>Attributes common to non-native types ("display-as"="popup" or "inline")</caption>
 *          <thead>
 *              <tr>
 *                  <th scope="col">Attribute</th>
 *                  <th scope="col">Type</th>
 *                  <th scope="col">Description</th>
 *                  <th scope="col">Options</th>
 *                  <th scope="col">Delegated to the input element</th>
 *                  <th scope="col">Synced with the input element</th>
 *              </tr>
 *          </thead>
 *          <tr>
 *              <th scope="row">change-month</th>
 *              <td>string</td>
 *              <td>Enable/disable Month selection list</td>
 *              <td>"select", "none"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">change-year</th>
 *              <td>string</td>
 *              <td>Enable/disable Year selection list</td>
 *              <td>"select", "none"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">display-weeks</th>
 *              <td>string</td>
 *              <td>Show/hide ISO-Weeks</td>
 *              <td>"number", "none"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">format</th>
 *              <td>string</td>
 *              <td>Set the format of the date</td>
 *              <td></td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">number-of-months</th>
 *              <td>number</td>
 *              <td>Set how many month are shown</td>
 *              <td>Positive number (1..5)</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">previous-next-distance</th>
 *              <td>string</td>
 *              <td>Set the jump distance when multiple months are activated. When click next/previous you can jump one month or the number of showed months</td>
 *              <td>"number-of-month", "one-month"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">show-days-outside-month</th>
 *              <td>string</td>
 *              <td>Show/hide days outside of the current month e.g. the first day of the next month</td>
 *              <td>"hidden", "selectable", "visible"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">show-time</th>
 *              <td>boolean</td>
 *              <td>Enable/disable timepicker in the datepicker</td>
 *              <td></td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">show-on</th>
 *              <td>string</td>
 *              <td>Set when the calendar in popup is shown</td>
 *              <td>"focus", "image", "click"</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">time-increment-minute</th>
 *              <td>number</td>
 *              <td>Set the increment of the minutes e.g. 15 to set only 15, 30, 45, 00</td>
 *              <td>Positive number (1..60)</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">valid-example</th>
 *              <td>string</td>
 *              <td>Attribute to show a valid example in the validation message</td>
 *              <td></td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">year-selection-range</th>
 *              <td>number</td>
 *              <td>Set a range for the years in the selection list</td>
 *              <td>Positive number (1..&infin;)</td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *          <tr>
 *              <th scope="row">today-button</th>
 *              <td>boolean</td>
 *              <td>Show/hide the today button</td>
 *              <td></td>
 *              <td></td>
 *              <td></td>
 *          </tr>
 *      </table>
 *      <br>
 *      <table>
 *          <caption>Day formatter functionality</caption>
 *          <thead>
 *              <tr>
 *                  <th scope="col">Property</th>
 *                  <th scope="col">Type</th>
 *                  <th scope="col">Description</th>
 *              </tr>
 *          </thead>
 *          <tr>
 *              <th scope="row">dayFormatter</th>
 *              <td>function</td>
 *              <td>
 *                  <p>Set a function (<code class="prettyprint">apex.items.P1_DATE_PICKER.dayFormatter</code>) that is called for each day, to set certain attributes for that day.
 *                  <p>The function is called with parameter <code class="prettyprint">pDateISOString</code>. This parameter is a date string with the format: 
 *                     <code class="prettyprint">YYYY-MM-DD</code>.</p>
 *                  <p>The function must return a JSON object in the following format:</p>
 *                  <pre class="prettyprint">{ disabled: false, class: &quot;myDayStyleClass&quot;, tooltip: &quot;Build with APEX&quot; }</pre>
 *                  <p>This functionality can be added e.g. in a Dynamic Action in a "Execute JavaScript Code" Action on page load or on demand.
 *                     If the results of the function should change at runtime or are not yet available during rendering, then you can trigger a "Refresh"
 *                     on the Date Picker Item via a Dynamic Action.</p>
 *                  <p><strong>IMPORTANT</strong>: The "disabled" attribute is only used to prevent that value can be selected in calendar table.
 *                     It's not validated or respected by keyboard navigation at the moment. In Native or Popup mode the value can
 *                     be set by item, so server-side validation is needed.</p>
 *                  <p>Example:</p>
 *<pre class="prettyprint">apex.items.P1_DATE_PICKER.dayFormatter = function ( pDateISOString ) {
 *   const weekDay = apex.date.parse( pDateISOString, &quot;YYYY-MM-DD&quot; ).getDay();
 *   return {
 *       // disable when day is Saturday or Sunday
 *       disabled: [0, 6].includes( weekDay ),
 *       // set a predefined color to the cell from ut theme
 *       class: weekDay === 5 ? &quot;u-color-35-bg&quot; : null,
 *       // set a tooltip that is shown on hover
 *       tooltip: weekDay === 5 ? &quot;Great it's friday!&quot;: null
 *   };
 *};
 *apex.items.P1_DATE_PICKER.refresh();</pre>
 *              </td>
 *          </tr>
 *      </table>
 *  </p>
 */
 ( function ( item, $, util, lang, date, debug, locale, message, WebComponent ) {
    "use strict";

    // constants
    const TOP_JQUERY = util.getTopApex().jQuery,
          DAY_FORMATTER_FUNCTION_NAME = "dayFormatter",
          // classes
          CLASS_DISABLED = "apex_disabled",
          CLASS_ITEM_DATEPICKER = "apex-item-datepicker",
          CLASS_A_DATEPICKER = "a-DatePicker",
          CLASS_ICONS = "a-Icon",
          CLASS_VISUALLY_HIDDEN = "u-vh",
          CLASS_DIALOG = "ui-dialog-datepicker",
          CLASS_IS_SELECTED = "is-selected",
          CLASS_IS_CURRENT = "is-current",
          CLASS_IS_DISABLED = "is-disabled",
          CLASS_CALENDAR_ICON_TIME = 'icon-calendar-time',
          CLASS_CALENDAR_ICON = 'icon-calendar',
          CLASS_A_DATEPICKER_ACTIONS = CLASS_A_DATEPICKER + "-actions",
          // date stuff
          DATE_PART_ALL = "ALL",
          DATE_PART_DAY = "DAY",
          DATE_PART_HOUR = "HOUR",
          DATE_PART_MINUTE = "MINUTE",
          DATE_FORMAT_ISO_SHORT = "YYYY-MM-DD",
          DATE_FORMAT_NATIVE_DATE_TIME_LOCAL = "YYYY-MM-DD\"T\"HH24:MI",
          DATE_FORMAT_ISO = "YYYY-MM-DD\"T\"HH24:MI:SS",
          DATE_FORMAT_APEX_NUMERIC = "YYYYMMDDHH24MI",
          // events
          EVENT_CHANGE = "change",
          EVENT_CLICK = "click",
          // attributes
          ATTRIBUTE_ID = "id",
          ATTRIBUTE_MIN = "min",
          ATTRIBUTE_MAX = "max",
          ATTRIBUTE_SIZE = "size",
          ATTRIBUTE_PLACEHOLDER = "placeholder",
          ATTRIBUTE_VALID_EXAMPLE = "valid-example",
          ATTRIBUTE_REQUIRED = "required",
          ATTRIBUTE_MAXLENGTH = "maxlength",
          ATTRIBUTE_MINLENGTH = "minlength",
          ATTRIBUTE_DISABLED = "disabled",
          ATTRIBUTE_ARIA_LABEL = "aria-label",
          ATTRIBUTE_ARIA_HASPOPUP = "aria-haspopup",
          ATTRIBUTE_TABINDEX = "tabindex",
          ATTRIBUTE_ARIA_LABELLEDBY = "aria-labelledby",
          ATTRIBUTE_ARIA_CONTROLS = "aria-controls",
          ATTRIBUTE_ARIA_HIDDEN = "aria-hidden",
          ATTRIBUTE_ROLE = "role",
          ATTRIBUTE_VALUE = "value",
          ATTRIBUTE_NAME = "name",
          ATTRIBUTE_TYPE = "type",
          ATTRIBUTE_TITLE = "title",
          ATTRIBUTE_READONLY = "readonly",
          ATTRIBUTE_AUTOFOCUS = "autofocus",
          ATTRIBUTE_AUTOCOMPLETE = "autocomplete",
          ATTRIBUTE_PREVIOUS_NEXT_DISTANCE = "previous-next-distance",
          ATTRIBUTE_ARIA_DESCRIBEDBY = "aria-describedby",
          ATTRIBUTE_ARIA_EXPANDED = "aria-expanded",
          ATTRIBUTE_ARIA_DISABLED = "aria-disabled",
          ATTRIBUTE_ARIA_SELECTED = "aria-selected",
          ATTRIBUTE_DISPLAY_AS = "display-as",
          // attribute values
          ATTRIBUTE_VALUE_REGION = "region",
          ATTRIBUTE_VALUE_NONE = "none",
          ATTRIBUTE_VALUE_LINK = "link",
          ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE = "inline",
          ATTRIBUTE_VALUE_DAYS_OUTSIDE_MONTH_SELECTABLE = "selectable",
          ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP = "popup",
          ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE = "native",
          ATTRIBUTE_VALUE_SHOW_ON_FOCUS = "focus",
          ATTRIBUTE_VALUE_SHOW_ON_CLICK_IMAGE = "image",
          ATTRIBUTE_VALUE_SHOW_ON_CLICK = "click",
          ATTRIBUTE_VALUE_DATETIME_LOCAL = "datetime-local",
          ATTRIBUTE_VALUE_DATE = "date",
          ATTRIBUTE_VALUE_DISPLAY_WEEKS = "number",
          ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_NUMBER_OF_MONTH = "number-of-month",
          ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_ONE_MONTH = "one-month",
          ATTRIBUTE_VALUE_VISIBLE = "visible",
          ATTRIBUTE_VALUE_HIDDEN = "hidden",
          ATTRIBUTE_VALUE_SELECTABLE = "selectable",
          ATTRIBUTE_VALUE_TIME_INCREMENT_MINUTE_DEFAULT = 1,
          // messages
          MSG = lang.getMessage,
          MSG_PREFIX = "APEX.DATEPICKER.",
          MESSAGE_SELECT_DATE_AND_TIME = MSG_PREFIX + "SELECT_DATE_AND_TIME",
          MESSAGE_SELECT_DATE = MSG_PREFIX + "SELECT_DATE",
          MESSAGE_DAY_PICKER = MSG_PREFIX + "SELECT_DAY",
          MESSAGE_ISO_WEEK = MSG_PREFIX + "ISO_WEEK",
          MESSAGE_ISO_WEEK_ABBR = MSG_PREFIX + "ISO_WEEK_ABBR",
          MESSAGE_TIME_PICKER = MSG_PREFIX + "SELECT_TIME",
          MESSAGE_HOUR = MSG_PREFIX + "HOUR",
          MESSAGE_MINUTES = MSG_PREFIX + "MINUTES",
          MESSAGE_AM_PM = MSG_PREFIX + "AM_PM",
          MESSAGE_ACTIONS = MSG_PREFIX + "ACTIONS",
          MESSAGE_MONTH = MSG_PREFIX + "MONTH",
          MESSAGE_YEAR = MSG_PREFIX + "YEAR",
          MESSAGE_PREVIOUS_MONTH = MSG_PREFIX + "PREVIOUS_MONTH",
          MESSAGE_NEXT_MONTH = MSG_PREFIX + "NEXT_MONTH",
          MESSAGE_DONE = MSG_PREFIX + "DONE",
          MESSAGE_TODAY = MSG_PREFIX + "TODAY",
          MESSAGE_CLEAR = MSG_PREFIX + "CLEAR",
          MESSAGE_SELECT_MONTH_AND_YEAR = MSG_PREFIX + "SELECT_MONTH_AND_YEAR",
          MESSAGE_VISUALLY_HIDDEN_EDIT = MSG_PREFIX + "VISUALLY_HIDDEN_EDIT",
          MESSAGE_REQUIRED = "APEX.PAGE_ITEM_IS_REQUIRED",
          // formatted messages
          MESSAGE_POPUP = MSG_PREFIX + "POPUP",
          MESSAGE_VALUE_MUST_BE_BETWEEN = MSG_PREFIX + "VALUE_MUST_BE_BETWEEN",
          MESSAGE_VALUE_MUST_BE_ON_OR_AFTER = MSG_PREFIX + "VALUE_MUST_BE_ON_OR_AFTER",
          MESSAGE_VALUE_MUST_BE_ON_OR_BEFORE = MSG_PREFIX + "VALUE_MUST_BE_ON_OR_BEFORE",
          MESSAGE_VALUE_INVALID = MSG_PREFIX + "VALUE_INVALID",
          // Keys
          KEY_RIGHT = "ArrowRight",
          KEY_LEFT = "ArrowLeft";

    // util functions
    const tools = {
        /**
        * Return the total number of days in a month including additional days from others months
        *
        * @param {number} [pFirstDayIndex] Index of the first of a week
        * @param {number} [pNumberOfMonthDays] Number of days the current month has
        * @return {number}
        *
        * @function tools.getNumberOfDays
        * @memberOf item.Datepicker.js
        */
        getNumberOfDays: function( pFirstDayIndex, pNumberOfMonthDays ) {
            let index = pFirstDayIndex + pNumberOfMonthDays;
            while ( index % 7 !== 0 ) {
                index = index + 1;
            }
            return index;
        },
        /**
        * This function does the same like native setMonth JavaScript function but it's secures e.g. when Date is 31st of January
        * and one wants to set February where the 31st not exists
        *
        * @param {date} [pDate] a valid javascript date
        * @param {number} [pIndex] an index for the month that should be set
        * @return {date}
        *
        * @function tools.setMonth
        * @memberOf item.Datepicker.js
        */
        setMonth: function( pDate, pIndex ) {
            let day = pDate.getDate();

            pDate.setMonth( pIndex );
            // check if month switched, if yes then switch to the last day of previous month
            if ( pDate.getDate() !== day ) {
                pDate.setDate( 0 );
            }
            return pDate;
        },
        /**
        * Return the an array of select options for the minutes depending on the increment
        *
        * @param {number} [pTimeIncrement] Value between 1 and 60 that sets how the minute selection is incremented
        * @return {array}
        *
        * @function tools.getMinuteOptions
        * @memberOf item.Datepicker.js
        */
        getMinuteOptions: function( pTimeIncrement ) {
            let timeIncrement = pTimeIncrement;
            // check that increment is a positive number and not zero
            if ( pTimeIncrement < 1 || pTimeIncrement > 60 ) {
                timeIncrement = ATTRIBUTE_VALUE_TIME_INCREMENT_MINUTE_DEFAULT;
            }

            const minutes = Math.ceil( 60 / timeIncrement ),
                  minuteOptions = [];
            for ( let i = 0; i < minutes; i++ ) {
                const time = i * timeIncrement;
                minuteOptions.push( time );
            }

            return minuteOptions;
        },
        /**
        * Return the difference of two dates in year
        *
        * @param {date} [pStartDate]
        * @param {date} [pEndDate]
        * @return {number}
        *
        * @function tools.getYearDifference
        * @memberOf item.Datepicker.js
        */
        getYearDifference: function( pStartDate, pEndDate ) {
            let difference = ( pStartDate.getTime() - pEndDate.getTime() ) / 1000;
            difference /= ( 60 * 60 * 24 );
            return Math.ceil( Math.abs( difference / 365.25 ) );
        },
        /**
        * Return a number where the given minute is closest depending on the minute increment
        *
        * @param {number} [pTimeIncrement] Value between 1 and 60 that sets how the minute selection is incremented
        * @param {number} [pNumber] Given minute
        * @return {number}
        *
        * @function tools.findClosestMinute
        * @memberOf item.Datepicker.js
        */
        findClosestMinute: function( pTimeIncrement, pNumber ) {
            let minuteOptions = tools.getMinuteOptions( pTimeIncrement );
            minuteOptions.push( 60 );

            return minuteOptions.reduce( ( a, b ) => {
                const aDifference = Math.abs( a - pNumber ),
                      bDifference = Math.abs( b - pNumber );

                if ( aDifference === bDifference ) {
                    return a > b ? a : b;
                } else {
                    return bDifference < aDifference ? b : a;
                }
            } );
        },
        /**
        * Checks that a given date fits into the limits of min and/or max
        *
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @param {date} [pDate] Date to check
        * @param {string} [pUnit] Unit in which level of detail the check is done
        * @return {boolean}
        *
        * @function tools.checkMinMax
        * @memberOf item.Datepicker.js
        */
        checkMinMax: function ( pV, pDate, pUnit = date.UNIT.SECOND ) {
            if ( pV.minDate && pV.maxDate ) {
                return date.isSameOrAfter( pDate, pV.minDate, pUnit ) && date.isSameOrBefore( pDate, pV.maxDate, pUnit );
            } else if ( pV.minDate ) {
                return date.isSameOrAfter( pDate, pV.minDate, pUnit );
            } else if ( pV.maxDate ) {
                return date.isSameOrBefore( pDate, pV.maxDate, pUnit );
            } else {
                return true;
            }
        },
        /**
        * Parses min/max dates
        *
        * @param {date} [pDate] Date to parse
        * @param {string} [pFormat] Format of the item
        * @return {date}
        *
        * @function tools.parseMinMax
        * @memberOf item.Datepicker.js
        */
        parseMinMax: function( pDate, pFormat ) {
            // try to parse the date with the format of the item
            try {
                return date.parse( pDate, pFormat );
            } catch( e ) {
                // ok do nothing and try next format
            }

            // Historically due to older date picker items APEX supports this format, too, according to documentation.
            try {
                return date.parse( pDate, DATE_FORMAT_ISO );
            } catch( e ) {
                // ok do nothing and try next format
            }

            // Support also native date picker
            try {
                return date.parse( pDate, DATE_FORMAT_NATIVE_DATE_TIME_LOCAL );
            } catch( e ) {
                // ok do nothing and try next format
            }

            // Support also native date picker without time
            try {
                return date.parse( pDate, DATE_FORMAT_ISO_SHORT );
            } catch( e ) {
                // ok do nothing and try next format
            }

            // Historically due to older date picker items APEX supports this format, too, according to documentation.
            try {
                return date.parse( pDate, DATE_FORMAT_APEX_NUMERIC );
            } catch( e ) {
                // ok do nothing and try next format
            }

            return null;
        },
        /**
        * Sets the internal variables minDate and maxDate from the item attributes min and/or max
        *
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.updateMinMax
        * @memberOf item.Datepicker.js
        */
        updateMinMax: function ( pV ) {
            if ( pV.min ) {
                pV.minDate = tools.parseMinMax( pV.min, pV.format );

                // nothing could be parsed so throw an error
                if ( pV.minDate === null ) {
                    debug.error (
                        `Min must (${pV.min}) match the following formats:`,
                        [pV.format, DATE_FORMAT_ISO, DATE_FORMAT_APEX_NUMERIC ]
                    );
                }
            } else {
                pV.minDate = null;
            }

            if ( pV.max ) {
                pV.maxDate = tools.parseMinMax( pV.max, pV.format );

                if ( pV.maxDate === null ) {
                    debug.error (
                        `Max must (${pV.max}) match the following formats:`,
                        [pV.format, DATE_FORMAT_ISO, DATE_FORMAT_APEX_NUMERIC]
                    );
                }
            } else {
                pV.maxDate = null;
            }
        },
        /**
        * Moves the current view of the calendar to the set date
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @param {string} [pFocusSelector] jQuery selector to set the focus
        * @param {date} [pGoToDate] Given date where the focus should be set to
        *
        * @function tools.moveCalendarView
        * @memberOf item.Datepicker.js
        */
        moveCalendarView: function ( pThis, pV, pFocusSelector, pGoToDate ) {
            let focusSelector = pFocusSelector;

            tools.render( pThis, pV );
            // reset focus
            if ( !focusSelector ) {
                const setAttribute = date.format( tools.calcCurrentCalendarDate( pThis, pV, pGoToDate ) || pThis._currentCalendarDate, DATE_FORMAT_ISO_SHORT );
                focusSelector = "td[data-date='" + util.escapeCSS( setAttribute ) + "']";
            }

            // queue micro task to get shure element is there on rerender
            queueMicrotask( function() {
                TOP_JQUERY( pThis._calendar ).find( focusSelector ).trigger( "focus" );
            } );
        },
        /**
        * Calculates a date where the calendar date can be set to while respecting e.g. min and/or max
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @param {date} [pDate] Date where the calendar date should be set so
        * @return {date}
        *
        * @function tools.calcCurrentCalendarDate
        * @memberOf item.Datepicker.js
        */
        calcCurrentCalendarDate: function ( pThis, pV, pDate ) {
            let retDate = null;

            if ( !pDate ) {
                return retDate;
            }

            if ( pThis._currentCalendarDate ) {
                retDate = date.clone ( pThis._currentCalendarDate );
            }

            // when min and/or max is set then the current date can't be outside of this limits
            if ( tools.checkMinMax( pV, pDate, date.UNIT.DAY ) ) {
                retDate = date.clone ( pDate );
            } else if ( pV.minDate && date.isBefore( pDate, pV.minDate, date.UNIT.DAY ) ) {
                retDate = date.clone ( pV.minDate );
            } else if ( pV.maxDate && date.isAfter( pDate, pV.maxDate, date.UNIT.DAY ) ) {
                retDate = date.clone( pV.maxDate );
            }

            // when given minute is not available in the select list change that date so that if fit to the closest available minute from the list
            // even when it's 12:00 AM the next day, month or year
            const closestMinute = tools.findClosestMinute( pV.timeIncrementMinute, retDate.getMinutes() );

            if ( closestMinute === 60 ) {
                const diff = closestMinute - retDate.getMinutes();
                retDate = date.add( retDate, diff, date.UNIT.MINUTE );
            } else {
                retDate.setMinutes( closestMinute );
            }

            return retDate;
        },
        /**
        * Commits the pending (internal) date to the item value and set the current calendar date
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.commitValue
        * @memberOf item.Datepicker.js
        */
        commitValue: function( pThis, pV ) {
            let value;

            if ( pThis._pendingValue ) {
                // set seconds to zero if it's not done yet because seconds cannot be set by time picker
                pThis._pendingValue.setSeconds( 0 );
                value = date.format( pThis._pendingValue, pV.format );
            }

            pThis.setValue( value );
        },
        /**
        * Used to set the pending (internal) date value
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @param {date} [pSetDate] Date that incudes the specific value where the pending date should be set
        * @param {string} [pDateParts] Define the part of the date that should be set e.g. hours or day
        * @param {boolean} [pSkipCommit] set if commit of the pending value should be skipped
        *
        * @function tools.setDateToValue
        * @memberOf item.Datepicker.js
        */
        setDateToValue: function ( pThis, pV, pSetDate, pDateParts, pSkipCommit ){
            let setDate = pThis._pendingValue || pThis._currentCalendarDate || new Date();

            if ( pSetDate ) {
                if ( [DATE_PART_DAY, DATE_PART_ALL].includes( pDateParts ) ) {
                    setDate = new Date(
                        pSetDate.getFullYear(),
                        pSetDate.getMonth(),
                        pSetDate.getDate(),
                        setDate.getHours(),
                        setDate.getMinutes(),
                        setDate.getSeconds(),
                        0
                    );
                }

                if ( [DATE_PART_HOUR, DATE_PART_ALL].includes( pDateParts ) ) {
                    setDate.setHours( pSetDate.getHours() );
                }

                if ( [DATE_PART_MINUTE, DATE_PART_ALL].includes( pDateParts ) ) {
                    setDate.setMinutes( pSetDate.getMinutes() );
                }
            } else {
                setDate = null;
            }

            pThis._pendingValue = setDate;

            if ( !pSkipCommit && ( !pThis.showTime || pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) ) {
                tools.commitValue( pThis, pV );
            }
        },
        elements: {
            /**
            * Used to get the active date jQuery object from the calendar
            *
            * @param {object} [pThis] the webComponent object
            * @return {object}
            *
            * @function tools.elements.getActive
            * @memberOf item.Datepicker.js
            */
            getActive: function( pThis ) {
                return TOP_JQUERY( pThis._calendar ).find( ".is-selected" );
            },
            /**
            * Used to get an array of selectable jQuery object from the calendar
            *
            * @param {object} [pThis] the webComponent object
            * @return {object}
            *
            * @function tools.elements.getSelectable
            * @memberOf item.Datepicker.js
            */
            getSelectable: function( pThis ) {
                return TOP_JQUERY( pThis._calendar ).find( "td[data-date]" );
            },
            /**
            * Used to get the element the should/is focused
            *
            * @param {object} [pThis] the webComponent object
            * @return {object}
            *
            * @function tools.elements.getFocusElement
            * @memberOf item.Datepicker.js
            */
            getFocusElement: function( pThis ) {
                const activeElement = tools.elements.getActive( pThis );
                if ( activeElement.length ) {
                    return activeElement;
                } else {
                    return tools.elements.getSelectable( pThis ).first();
                }
            }
        },
        /**
        * Used add listeners for keyboard navigation the the logic to navigate in the calendar by keyboard
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.addKeyBoardNavigation
        * @memberOf item.Datepicker.js
        */
        addKeyBoardNavigation: function ( pThis, pV ) {
        // remove listeners at first if they are already set
            tools.elements.getSelectable( pThis ).off( "keydown.document" + pThis._elementIDSafe );

            if ( !pV.disabled ) {
                tools.elements.getSelectable( pThis ).on( "keydown.document" + pThis._elementIDSafe, function( event ) {
                    const currentDate = date.parse( $( event.currentTarget ).attr( "data-date" ), DATE_FORMAT_ISO_SHORT );
                    let tdDateAttribute = "td[data-date='#DATADATE#']";

                    let goToDate,
                        distance = pV.previousNextDistanceSteps,
                        unit = date.UNIT.MONTH,
                        setAttribute,
                        focusElement$;

                    switch( event.code ) {
                    case "Home":
                        event.preventDefault();
                        focusElement$ = TOP_JQUERY( event.currentTarget ).closest( "tr" ).find( "td[data-date]" ).first();
                        focusElement$.trigger( "focus" );
                        break;
                    case "End":
                        event.preventDefault();
                        focusElement$ = TOP_JQUERY( event.currentTarget ).closest( "tr" ).find( "td[data-date]" ).last();
                        focusElement$.trigger( "focus" );
                        break;
                    case "PageDown":
                        event.preventDefault();
                        if ( event.shiftKey === true ) {
                            unit = date.UNIT.YEAR;
                            distance = 1;
                        }
                        goToDate = date.add( date.clone( currentDate ), 1, unit );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).first();
                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.add( date.clone( pThis._currentCalendarDate ), distance, unit )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case "PageUp":
                        event.preventDefault();
                        if ( event.shiftKey === true ) {
                            unit = date.UNIT.YEAR;
                            distance = 1;
                        }
                        goToDate = date.subtract( date.clone( currentDate ), 1, unit );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).first();
                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.subtract( date.clone( pThis._currentCalendarDate ), distance, unit )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case pThis._backwardkey:
                        event.preventDefault();
                        goToDate = date.subtract( date.clone( currentDate ), 1, date.UNIT.DAY );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).last();

                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.lastOfMonth( date.subtract( date.clone( pThis._currentCalendarDate ), distance, date.UNIT.MONTH ) )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case pThis._forwardKey:
                        event.preventDefault();
                        goToDate = date.add( date.clone( currentDate ), 1, date.UNIT.DAY );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).first();

                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.firstOfMonth( date.add( date.clone( pThis._currentCalendarDate ), distance, date.UNIT.MONTH ) )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case "ArrowDown":
                        event.preventDefault();
                        goToDate = date.add( date.clone( currentDate ), 7, date.UNIT.DAY );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).first();

                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.add( date.clone( pThis._currentCalendarDate ), distance, date.UNIT.MONTH )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case "ArrowUp":
                        event.preventDefault();
                        goToDate = date.subtract( date.clone( currentDate ), 7, date.UNIT.DAY );
                        setAttribute = date.format( goToDate, DATE_FORMAT_ISO_SHORT );
                        focusElement$ = TOP_JQUERY( pThis._calendar ).find( tdDateAttribute.replace( "#DATADATE#", util.escapeCSS( setAttribute ) ) ).first();

                        if ( focusElement$.length ) {
                            focusElement$.trigger( "focus" );
                        } else {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.subtract( date.clone( pThis._currentCalendarDate ), distance, date.UNIT.MONTH )
                            );
                            tools.moveCalendarView( pThis, pV, null, goToDate );
                        }
                        break;
                    case "Enter":
                        event.preventDefault();
                        event.stopPropagation();
                        TOP_JQUERY( this ).click();
                        break;
                    case "Space":
                        event.preventDefault();
                        event.stopPropagation();
                        TOP_JQUERY( this ).click();
                        break;
                    case "Escape":
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                            event.preventDefault();
                            event.stopPropagation();
                            tools.dialog.close ( pThis );
                        }
                        break;
                    }
                } );
            }
        },
        dialog: {
            /**
            * Used to show the popup dialog
            *
            * @param {object} [pThis] the webComponent object
            *
            * @function tools.dialog.show
            * @memberOf item.Datepicker.js
            */
            show: function( pThis ) {
                if ( !pThis._dialogOpen ) {
                    const dialogOptions = {
                        id: pThis._elementIDSafe + "_dialog",
                        // escaping is done by dialog api
                        title: lang.formatMessageNoEscape( MESSAGE_POPUP, pThis._elementLabelSafe ),
                        isPopup: true,
                        parentElement: pThis,
                        returnFocusTo: pThis._wrappedElement$,
                        noOverlay: true,
                        draggable: true,
                        resizable: false,
                        width: "auto",
                        height: "auto",
                        okButton: false,
                        dialogClass: CLASS_DIALOG,
                        notification: false,
                        callback: function() {
                            pThis._skipFocus = true;
                            pThis._popupButton$.removeClass( CLASS_DISABLED );
                            pThis._popupButton$.attr( ATTRIBUTE_ARIA_EXPANDED, "false" );
                            pThis._wrappedElement$.attr( ATTRIBUTE_ARIA_EXPANDED, "false" );
                            pThis._dialogOpen = false;
                            // queue micro task to make it possible that the popup could be opened when focus again on the text
                            queueMicrotask( function(){
                                pThis._skipFocus = false;
                            } );
                        },
                        init: function ( dialog$ ) {
                            dialog$.empty();
                            // only used to prevent jQuery UI dialog widget to set focus into popup
                            dialog$.append( "<input type=\"hidden\" autofocus=\"autofocus\" />" );
                            dialog$.append( pThis._calendar );
                        },
                        open: function( event ) {
                            pThis._dialog$ = TOP_JQUERY( event.target );

                            // hide title but don't remove for aria dependencies
                            const parentDialog = pThis._dialog$.closest( "." + CLASS_DIALOG );
                            parentDialog.find( ".ui-dialog-titlebar" ).addClass( CLASS_VISUALLY_HIDDEN );

                            pThis._popupButton$.addClass( CLASS_DISABLED );
                            pThis._popupButton$.attr( ATTRIBUTE_ARIA_EXPANDED, "true" );
                            pThis._wrappedElement$.attr( ATTRIBUTE_ARIA_EXPANDED, "true" );
                            pThis._dialogOpen = true;
                        }
                    };

                    pThis._dialog$ = message.showDialog( "", dialogOptions );
                }
            },
            /**
            * Used to close the popup dialog
            *
            * @param {object} [pThis] the webComponent object
            *
            * @function tools.dialog.close
            * @memberOf item.Datepicker.js
            */
            close: function( pThis ) {
                // close only if existing and open
                if ( pThis._dialog$ ) {
                    pThis._dialog$.popup( "close" );
                }
            },
            /**
            * Used to destroy the instance of the popup dialog
            *
            * @param {object} [pThis] the webComponent object
            *
            * @function tools.dialog.close
            * @memberOf item.Datepicker.js
            */
            destroy: function ( pThis ) {
                // remove the existing dialog from the page to cleanup everything that is left
                if ( pThis._dialog$ ) {
                    pThis._dialog$.popup( "close" );
                    pThis._dialog$.closest( "." + CLASS_DIALOG ).remove();
                    pThis._dialog$ = null;
                }
            }
        },
        /**
        * Used to set correct hour when e.g. when am/pm is changed
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @param {object} [pHourItem] jQuery object of the hour select item
        * @param {object} [pAmPMItem] jQuery object of the am/pm select item
        *
        * @function tools.setCalendarHours
        * @memberOf item.Datepicker.js
        */
        setCalendarHours: function( pThis, pV, pHourItem, pAmPMItem ) {
            let selectedHour = parseInt( pHourItem.val(), 10 );

            // handling for am/pm selection
            if ( pThis._ampm && pAmPMItem ) {
                if ( pAmPMItem.val() === "PM" && selectedHour !== 12 ) {
                    selectedHour = selectedHour + 12;
                }

                if ( pAmPMItem.val() === "AM" && selectedHour === 12 ) {
                    selectedHour = 0;
                }
            }

            const newDate = new Date().setHours( selectedHour );
            tools.setDateToValue( pThis, pV, new Date( newDate ), DATE_PART_HOUR );
        },
        /**
        * Used to set add/change or remove and attribute with an value to a given jQuery object
        *
        * @param {object} [pElement] Given jQuery object where the attribute should be set/removed
        * @param {string} [pAttribute] Name of the attribute the should be set/removed
        * @param {object} [pValue] Value of the attribute, when the value is null then attribute is removed
        *
        * @function tools.addOrRemoveAttributes
        * @memberOf item.Datepicker.js
        */
        addOrRemoveAttributes: function( pElement, pAttribute, pValue ) {
            if ( typeof pValue === "boolean" ) {
                pElement.prop( pAttribute, pValue );
            } else {
                if ( pValue ) {
                    pElement.attr( pAttribute, pValue );
                } else {
                    pElement.removeAttr( pAttribute );
                }
            }
        },
        /**
        * Used to create or update input
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.createOrUpdateInput
        * @memberOf item.Datepicker.js
        */
        createOrUpdateInput: function ( pThis, pV ) {
            if ( !pThis._wrappedElement$ ) {
                pThis._wrappedElement$ = pThis.element.find( "input" );
            }
            // generate item if not exists
            if ( pThis._wrappedElement$.length === 0 ) {
                pThis._wrappedElement$ = $( "<input>" );
                pThis.element.append( pThis._wrappedElement$ );
                pThis._wrappedElement$.val( pThis.element.val() );
            }

            // sync datepicker when input is changed
            pThis._wrappedElement$.off( "change." + pThis._elementID );
            pThis._wrappedElement$.on( "change." + pThis._elementID, function() {
                // need to update calendar view after update of the value
                pThis.refresh();
            } );

            pThis._wrappedElement$.attr( ATTRIBUTE_ID, pThis._inputIDSafe );
            pThis._wrappedElement$.addClass( "apex-item-text" );
            pThis._wrappedElement$.addClass( "apex-item-datepicker" );
            pThis._wrappedElement$.addClass( CLASS_ITEM_DATEPICKER );

            // native
            if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE ) {
                pThis.element.addClass( CLASS_ITEM_DATEPICKER + "-" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE );
                pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "-" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP );
                pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "-" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE );

                // when minDate has value the min can be used because it's parsable
                if ( pV.minDate ) {
                    tools.addOrRemoveAttributes( pThis._wrappedElement$, ATTRIBUTE_MIN, pV.min );
                }

                // when maxDate has value the max can be used because it's parsable
                if ( pV.maxDate ) {
                    tools.addOrRemoveAttributes( pThis._wrappedElement$, ATTRIBUTE_MAX, pV.max );
                }

                if ( pV.showTime ) {
                    pThis._wrappedElement$.attr( ATTRIBUTE_TYPE, ATTRIBUTE_VALUE_DATETIME_LOCAL );
                    pV.format = DATE_FORMAT_NATIVE_DATE_TIME_LOCAL;
                } else {
                    pThis._wrappedElement$.attr( ATTRIBUTE_TYPE, ATTRIBUTE_VALUE_DATE );
                    pV.format = DATE_FORMAT_ISO_SHORT;
                }
            } else {
                pThis._wrappedElement$.attr( ATTRIBUTE_TYPE, "text" );
            }

            // inline
            if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                pThis._wrappedElement$.prop( ATTRIBUTE_READONLY, true );
                pThis._wrappedElement$.attr( ATTRIBUTE_TABINDEX, "-1" );
                pThis._wrappedElement$.attr( "aria-roledescription", MSG( MESSAGE_VISUALLY_HIDDEN_EDIT ) );
                pThis._wrappedElement$.addClass( CLASS_VISUALLY_HIDDEN );
            } else {
                pThis._wrappedElement$.prop( ATTRIBUTE_READONLY, pV.readonly );
                if ( pV.tabindex || "" + pV.tabindex === "0" ) {
                    pThis._wrappedElement$.attr( ATTRIBUTE_TABINDEX, pV.tabindex );
                } else {
                    pThis._wrappedElement$.removeAttr( ATTRIBUTE_TABINDEX, pV.tabindex );
                }
                pThis._wrappedElement$.removeAttr( "aria-roledescription" );
                pThis._wrappedElement$.removeClass( CLASS_VISUALLY_HIDDEN );
            }

            // popup
            if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                pThis._wrappedElement$.attr( ATTRIBUTE_ARIA_HASPOPUP, "dialog" );
                pThis._wrappedElement$.attr( ATTRIBUTE_ROLE, "combobox" );
            } else {
                pThis._wrappedElement$.removeAttr( ATTRIBUTE_ARIA_HASPOPUP, "dialog" );
            }

            pThis._wrappedElement$.prop( ATTRIBUTE_DISABLED, pV.disabled );
            pThis._wrappedElement$.prop( ATTRIBUTE_REQUIRED, pV.required );

            if ( !pThis._inputRegistered ) {
                // add handler for popup
                // register open calendar on focus only if needed
                if ( [ ATTRIBUTE_VALUE_SHOW_ON_FOCUS, ATTRIBUTE_VALUE_SHOW_ON_CLICK ].includes( pV.showOn ) ) {
                    pThis._wrappedElement$.on( pV.showOn, function() {
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP && !pThis._dialogOpen && !pThis._skipFocus ) {
                            // Queue Micro Task is needed to prevent error when item is moved in dome e.g. in IG
                            queueMicrotask( () => {
                                // check if item is still connected and that focus is still on the input before open
                                if ( pThis.isConnected && pThis._wrappedElement$.is( ":focus" ) ) {
                                    tools.dialog.show( pThis );
                                }
                            } );
                        }
                        // ensure that _skipFocus is set to false in that case
                        pThis._skipFocus = false;
                    } );
                }

                pThis._wrappedElement$.on( "keydown", function( event ) {
                    if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                        if ( ["ArrowDown", "ArrowUp" ].includes( event.key ) ) {
                            tools.dialog.show( pThis );
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        } else if ( ["Tab", "Escape" ].includes( event.key ) ) {
                            tools.dialog.close( pThis );
                            if ( event.key === "Escape" ) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                        }
                    }
                } );

                pThis._inputRegistered = true;
            }
        },
        /**
        * Used to create, update or delete popup button
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.createUpdateOrDeletePopupButton
        * @memberOf item.Datepicker.js
        */
        createUpdateOrDeletePopupButton: function ( pThis, pV ) {
            if ( !pThis._popupButton$ ) {
                pThis._popupButton$ = pThis.element.find( "button.a-Button--calendar" );
            }

            // generate button if not exits and display format is popup
            if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                if ( pThis._popupButton$.length === 0 ) {
                    pThis._popupButton$ = generate.defaultElements.button(
                        pThis, // pThis
                        pV, // pV
                        null, // pText
                        "a-Button--calendar ui-datepicker-trigger" // pClass
                    );
                    pThis.element.append( pThis._popupButton$ );
                }

                if ( !pThis._popupButtonRegistered ) {
                    // toggle calendar when click on button
                    pThis._popupButton$.on( EVENT_CLICK, function( event ) {
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                            tools.dialog.show( pThis );
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        }
                        event.preventDefault();
                    } );
                    pThis._popupButtonRegistered = true;
                }

                if ( pThis._popupButton$.find( "span" ).length === 0 ) {
                    const span = $( "<span>" );
                    span.addClass( "a-Icon" );
                    if ( pThis.showTime ) {
                        span.addClass( "icon-calendar-time" );
                    } else {
                        span.addClass( "icon-calendar" );
                    }
                    pThis._popupButton$.append( span );
                }

                if ( pThis._elementLabelIDSafe ) {
                    pThis._popupButton$.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }

                // when disabled
                if ( pV.disabled ) {
                    pThis._popupButton$.addClass( CLASS_DISABLED );
                } else {
                    if ( !pThis._dialogOpen ) {
                        pThis._popupButton$.removeClass( CLASS_DISABLED );
                    }
                }

                pThis._popupButton$.attr( "aria-controls", pThis._inputIDSafe );
                pThis._popupButton$.attr( ATTRIBUTE_ARIA_HASPOPUP, "dialog" );

                if ( pV.showOn === ATTRIBUTE_VALUE_SHOW_ON_FOCUS ) {
                    pThis._popupButton$.attr( ATTRIBUTE_TABINDEX, "-1" );
                } else {
                    pThis._popupButton$.removeAttr( ATTRIBUTE_TABINDEX );
                }

                if ( pV.showTime ) {
                    pThis._popupButton$.attr( ATTRIBUTE_TITLE, MSG( MESSAGE_SELECT_DATE_AND_TIME ) );
                    pThis._popupButton$.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_SELECT_DATE_AND_TIME ) );
                    pThis._popupButton$.find( "span" ).addClass( CLASS_CALENDAR_ICON_TIME );
                    pThis._popupButton$.find( "span" ).removeClass( CLASS_CALENDAR_ICON );
                } else {
                    pThis._popupButton$.attr( ATTRIBUTE_TITLE, MSG( MESSAGE_SELECT_DATE ) );
                    pThis._popupButton$.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_SELECT_DATE ) );
                    pThis._popupButton$.find( "span" ).removeClass( CLASS_CALENDAR_ICON_TIME );
                    pThis._popupButton$.find( "span" ).addClass( CLASS_CALENDAR_ICON );
                }
            } else {
                if ( pThis._popupButton$ ) {
                    pThis._popupButton$.remove();
                }
                pThis._popupButton$ = null;
                pThis._popupButtonRegistered = null;
            }
        },
        /**
        * Used to render calendar container and call generate functionality
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        *
        * @function tools.render
        * @memberOf item.Datepicker.js
        */
        render: function ( pThis, pV ) {
            if ( pThis._calendar ) {
                pThis._calendar.empty();
            }

            // only do this for the non native item
            if ( pV.displayAs !== ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE ) {

                // add helper classes for theme
                if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                    pThis.element.addClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP );
                    pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE );
                    pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE );
                }

                if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                    pThis.element.addClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE );
                    pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP );
                    pThis.element.removeClass( CLASS_ITEM_DATEPICKER + "--" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE );
                }

                if ( !pThis._calendar ) {
                    pThis._calendar = generate.calendar( pThis, pV );
                }

                const container = generate.container( pThis, pV );
                pThis._calendar.append( container );

                if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                    pThis.element.append( pThis._calendar );
                    if ( pV.disabled ) {
                        pThis.element.addClass( CLASS_DISABLED );
                    } else {
                        pThis.element.removeClass( CLASS_DISABLED );
                    }
                }
                tools.addKeyBoardNavigation( pThis, pV );
            }
        }
    };

    // html generate functions
    const generate = {
        defaultElements: {
            /**
            * Used to generate a jQuery button object
            *
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @param {string} [pText] Text that should be set, when button has icon this is set as aria-label attribute
            * @param {string} [pClass] Class(es) that should be added to the button
            * @param {string} [pIconType] icon that should be set
            * @param {string} [pTabIndex] value of the tabindex that should be set
            * @param {string} [pAriaControls] value for the aria-controls the should be set
            * @return {object}
            *
            * @function generate.defaultElements.button
            * @memberOf item.Datepicker.js
            */
            button: function ( pThis, pV, pText, pClass, pIconType, pTabIndex, pAriaControls ) {
                const button = $( "<button>" );
                button.addClass( "a-Button" );
                button.attr( ATTRIBUTE_TYPE, "button" );

                if ( pIconType ) {
                    button.attr( ATTRIBUTE_TITLE, pText );
                    const icon = $( "<span>" );
                    icon.addClass( CLASS_ICONS );
                    icon.addClass( pIconType );
                    icon.attr( ATTRIBUTE_ARIA_HIDDEN, "true" );
                    button.append( icon );
                    button.attr( ATTRIBUTE_ARIA_LABEL, pText );
                } else {
                    button.text( pText );
                }
                button.addClass( pClass );

                if ( pTabIndex ) {
                    button.attr( ATTRIBUTE_TABINDEX, pTabIndex );
                }

                if ( pAriaControls ) {
                    button.attr( ATTRIBUTE_ARIA_CONTROLS, pAriaControls );
                }

                if ( pV.displayAs !== ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP && pThis._elementLabelIDSafe ) {
                    button.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }

                return button;
            },
            /**
            * Used to generate a jQuery label object
            *
            * @param {string} [pText] Text that should be set
            * @param {string} [pID] ID of the object where the label is for
            * @return {object}
            *
            * @function generate.defaultElements.label
            * @memberOf item.Datepicker.js
            */
            label: function( pText, pID ) {
                const label = $( "<label>" );
                label.addClass( CLASS_VISUALLY_HIDDEN );
                label.attr( "for", pID );
                label.text( pText );
                return label;
            }
        },
        /**
        * Used to generate the main calendar region as jQuery object
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @return {object}
        *
        * @function generate.calendar
        * @memberOf item.Datepicker.js
        */
        calendar: function ( pThis, pV ) {
            const calendar = $( "<div>" );
            calendar.addClass( CLASS_A_DATEPICKER );
            calendar.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_REGION );

            const ariaLabel = ( pV.showTime ) ? MSG( MESSAGE_SELECT_DATE_AND_TIME ) : MSG( MESSAGE_SELECT_DATE );
            if ( pThis._elementLabelSafe ) {
                calendar.attr( ATTRIBUTE_ARIA_LABEL, pThis._elementLabelSafe + " - " + ariaLabel );
            } else {
                calendar.attr( ATTRIBUTE_ARIA_LABEL, ariaLabel );
            }

            if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                calendar.addClass( CLASS_A_DATEPICKER + "-" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE );
            } else {
                calendar.removeClass( CLASS_A_DATEPICKER + "-" + ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE );
            }

            return calendar;
        },
        /**
        * Used to generate a container in the main calendar region with all sub elements that are created by functions
        *
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @return {object}
        *
        * @function generate.calendar
        * @memberOf item.Datepicker.js
        */
        container: function ( pThis, pV ) {
            const container = pThis._calendar;

            const header = generate.header();
            container.append( header );

            const monthYearSelection = generate.monthYearSelection.container();
            header.append( monthYearSelection );
            monthYearSelection.append( generate.monthYearSelection.monthSelection( pThis, pV ) );
            monthYearSelection.append( generate.monthYearSelection.yearSelection( pThis, pV ) );

            header.append( generate.buttons.prevMonth( pThis, pV ) );
            header.append( generate.buttons.nextMonth( pThis, pV ) );

            const tablesContainer = $( "<div>" );
            tablesContainer.attr ( ATTRIBUTE_ID, pThis._calendarTableIDSafe );
            tablesContainer.addClass( CLASS_A_DATEPICKER + "-calendars" );
            tablesContainer.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_REGION );
            tablesContainer.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_DAY_PICKER ) );
            container.append( tablesContainer );

            // add functionality for multiple calendar
            for ( let i = 0; i < pV.numberOfMonths; i++ ) {
                let currentCalendarDate = date.clone ( pThis._currentCalendarDate );

                if ( pV.numberOfMonths > 1 ) {
                    const previousMonth = pV.numberOfMonths - Math.trunc( pV.numberOfMonths / 2 ) - 1;
                    currentCalendarDate = date.add( currentCalendarDate, ( -previousMonth + i ) , date.UNIT.MONTH );
                    pThis._calendar.addClass( CLASS_A_DATEPICKER + "--multiple" );
                } else {
                    pThis._calendar.removeClass( CLASS_A_DATEPICKER + "--multiple" );
                }

                const ariaLabelledBy = pThis._elementIDSafe + "_" + date.format( currentCalendarDate, "month_YYYY" ) + "_header";

                const tableContainer = $( "<div>" );
                tableContainer.addClass( CLASS_A_DATEPICKER + "-calendarContainer" );
                tableContainer.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_REGION );
                tableContainer.attr( ATTRIBUTE_ARIA_LABELLEDBY, ariaLabelledBy );
                tablesContainer.append( tableContainer );

                const containerTitle = $( "<div>" );
                containerTitle.addClass( CLASS_A_DATEPICKER + "-calendarTitle" );
                containerTitle.text( date.format( currentCalendarDate, "Month YYYY" ) );
                containerTitle.attr( ATTRIBUTE_ID, ariaLabelledBy );
                containerTitle.attr( "aria-live", "polite" );
                tableContainer.append( containerTitle );

                const table = generate.table.container( currentCalendarDate, ariaLabelledBy );
                tableContainer.append( table );

                table.append( generate.table.head( pV ) );
                table.append( generate.table.body( pThis, pV, currentCalendarDate ) );
            }

            if ( pV.showTime || pV.todayButton || ( !pV.required && pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) ) {
                const footer = generate.footer.container();

                if ( pV.showTime ) {
                    const timePicker = generate.footer.timePicker ( pThis, pV );
                    footer.append( timePicker );
                }

                const actions = generate.footer.actions ( pThis, pV );
                // only append actions when it has content
                if ( actions.html() !== "" ) {
                    footer.append( actions );
                }

                // only append the footer when it has content
                if ( footer.html() !== "" ) {
                    container.append( footer );
                }
            }

            return container;
        },
        /**
        * Used to generate a container for the calendar header
        *
        * @return {object}
        *
        * @function generate.header
        * @memberOf item.Datepicker.js
        */
        header: function () {
            const container = $( "<div>" );
            container.addClass( CLASS_A_DATEPICKER + "-header" );
            container.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_SELECT_MONTH_AND_YEAR ) );
            container.attr( ATTRIBUTE_ROLE, "navigation" );

            return container;
        },
        table: {
            /**
            * Used to generate a jQuery table object
            *
            * @param {date} [pCurrentCalendarDate] the current date of the calendar
            * @return {object}
            *
            * @function generate.table.container
            * @memberOf item.Datepicker.js
            */
            container: function ( pCurrentCalendarDate, pAriaLabelledBy ) {
                const table = $( "<table>" );
                table.addClass( CLASS_A_DATEPICKER + "-calendar" );
                table.attr( ATTRIBUTE_ARIA_LABELLEDBY, pAriaLabelledBy );
                table.attr( ATTRIBUTE_ROLE, "grid" );

                return table;
            },
            /**
            * Used to generate a jQuery table head object
            *
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.table.head
            * @memberOf item.Datepicker.js
            */
            head: function ( pV ) {
                const head = $( "<thead>" );
                head.attr( ATTRIBUTE_ROLE, "rowgroup" );

                const tr = $( "<tr>" );
                tr.attr( ATTRIBUTE_ROLE, "row" );
                head.append( tr );

                if ( pV.displayWeeks === ATTRIBUTE_VALUE_DISPLAY_WEEKS ) {
                    const thW = $( "<th>" );
                    tr.append( thW );
                    thW.attr( ATTRIBUTE_ROLE, "columnheader" );
                    thW.addClass( CLASS_A_DATEPICKER + "-weekColumn" );

                    const thWVS = $( "<span>" );
                    thWVS.attr( ATTRIBUTE_ARIA_HIDDEN, "true" );
                    thWVS.text( MSG( MESSAGE_ISO_WEEK_ABBR ) );
                    thW.append( thWVS );

                    const thWS = $( "<span>" );
                    thWS.addClass( CLASS_VISUALLY_HIDDEN );
                    thWS.text( MSG( MESSAGE_ISO_WEEK ) );
                    thW.append( thWS );
                }

                for ( let i = 0; i <= 6; i++ ) {
                    const th = $( "<th>" );
                    tr.append( th );
                    th.attr( ATTRIBUTE_ROLE, "columnheader" );

                    const thVS = $( "<span>" );
                    thVS.attr( ATTRIBUTE_ARIA_HIDDEN, "true" );
                    thVS.text( locale.getAbbrevDayNames()[i] );
                    th.append( thVS );

                    const thS = $( "<span>" );
                    thS.addClass( CLASS_VISUALLY_HIDDEN );
                    thS.text( locale.getDayNames()[i] );
                    th.append( thS );
                }

                return head;
            },
            /**
            * Used to generate a jQuery table body object
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @param {date} [pCurrentCalendarDate] the current date of the calendar
            * @return {object}
            *
            * @function generate.table.body
            * @memberOf item.Datepicker.js
            */
            body: function ( pThis, pV, pCurrentCalendarDate ) {
                const firstDayDate = date.firstOfMonth( pCurrentCalendarDate ),
                      indexOfFirstDay = date.localeDayOfWeek( firstDayDate ),
                      numberOfDays = date.daysInMonth( firstDayDate ),
                      totalDays = tools.getNumberOfDays( indexOfFirstDay, numberOfDays ),
                      currentDate = pThis._pendingValue,
                      today = new Date(),
                      daysPerWeek = 7,
                      body = $( "<tbody>" );

                let printError = true,
                    printExecutionError = true,
                    tr = $( "<tr>" );

                body.attr( ATTRIBUTE_ROLE, "rowgroup" );

                for ( let i = 0; i < totalDays; i++ ) {
                    const dayDate = date.add( date.clone( firstDayDate ), i - indexOfFirstDay, date.UNIT.DAY ),
                          dayNumber = parseInt( date.format( dayDate, "DD" ), 10 ),
                          dayDateStr = date.format( dayDate, DATE_FORMAT_ISO_SHORT );

                    let onClick = true,
                        dayFormat = {
                            disabled: false,
                            class: null,
                            tooltip: null
                        };

                    if ( i % daysPerWeek === 0 || i === 0 ) {
                        tr = $( "<tr>" );
                        tr.attr( ATTRIBUTE_ROLE, "row" );
                        body.append( tr );

                        // add iso week number when enabled
                        if ( pV.displayWeeks === ATTRIBUTE_VALUE_DISPLAY_WEEKS ) {
                            const weekDate = date.add( date.clone( dayDate ), 1, date.UNIT.DAY ),
                                  isoWeek = date.ISOWeek( weekDate );

                            const thW = $( "<th>" );
                            tr.append( thW );
                            thW.attr( ATTRIBUTE_TABINDEX, "-1" );
                            thW.attr( ATTRIBUTE_ROLE, "rowheader" );
                            thW.addClass( CLASS_A_DATEPICKER + "-weekColumn" );
                            thW.text( isoWeek );
                            thW.attr( "abbr", MSG( MESSAGE_ISO_WEEK ) + " " + isoWeek );
                            thW.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_ISO_WEEK ) + " " + isoWeek );
                        }
                    }

                    const td = $( "<td>" );
                    tr.append( td );

                    // span is needed for accessability
                    const tdText = $( "<span>" );
                    tdText.text( dayNumber );
                    tdText.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_LINK );
                    td.append( tdText );

                    // days outside of month that are hidden don't should get formatting
                    if ( ( pV.showDaysOutsideMonth !== ATTRIBUTE_VALUE_HIDDEN || ( i >= indexOfFirstDay && i < indexOfFirstDay + numberOfDays ) ) ) {
                    // if a day formatter function is set then call this function and set the attributes json
                        if ( pThis[DAY_FORMATTER_FUNCTION_NAME] ) {
                            let dayFormatterErrorState = 0;
                            try {
                                if ( typeof pThis[DAY_FORMATTER_FUNCTION_NAME] === "function" ) {
                                    const dayFormatterObject = pThis[DAY_FORMATTER_FUNCTION_NAME]( dayDateStr );
                                    if ( dayFormatterObject && typeof dayFormatterObject === "object" ) {
                                        $.extend( dayFormat, dayFormatterObject );

                                        if ( dayFormat.class ) {
                                            td.addClass( dayFormat.class );
                                        }

                                        if ( dayFormat.tooltip ) {
                                            td.attr( ATTRIBUTE_TITLE, dayFormat.tooltip );
                                        }
                                    } else {
                                        dayFormatterErrorState = 1;
                                    }
                                } else {
                                    dayFormatterErrorState = 2;
                                }

                                // print this error only for the first day
                                if ( dayFormatterErrorState > 0 && printError ) {
                                    if ( dayFormatterErrorState === 1 ) {
                                        debug.trace( "dayFormatter function must return as valid JSON object in format { disabled: false, class: null, tooltip: null }." );
                                    } else {
                                        debug.error( "dFormatter must be a function (apex.items.P1_DATE_PICKER.dayFormatter = function () {...};) that returns as valid JSON object." );
                                    }
                                    // prevent that error is called for next day
                                    printError = false;
                                }
                            } catch ( e ) {
                                if ( printExecutionError ) {
                                    debug.error( "dayFormatter function returned with an error", e );
                                }
                                // prevent that error is called for next day
                                printExecutionError = false;
                            }
                        }
                    }

                    // add aria-selected and tabindex for the selected date
                    if ( currentDate &&
                    pCurrentCalendarDate &&
                    date.isSame( tools.calcCurrentCalendarDate( pThis, pV, currentDate ), currentDate , date.UNIT.DAY ) &&
                    date.isSame( currentDate, dayDate, date.UNIT.DAY ) &&
                    date.isSame( pCurrentCalendarDate, dayDate, date.UNIT.MONTH ) &&
                    !pV.disabled &&
                    !dayFormat.disabled &&
                    ( pThis.getValue() || pThis._pendingValue )
                    ) {
                        td.attr( ATTRIBUTE_ARIA_SELECTED, "true" );
                        td.attr( ATTRIBUTE_TABINDEX, "0" );
                        td.addClass( CLASS_IS_SELECTED );
                    } else {
                        td.attr( ATTRIBUTE_TABINDEX, "-1" );
                    }

                    // add aria-current for current date
                    if ( date.isSame( today, dayDate, date.UNIT.DAY ) &&
                     ( pV.showDaysOutsideMonth === ATTRIBUTE_VALUE_DAYS_OUTSIDE_MONTH_SELECTABLE ||
                      date.isSame( pCurrentCalendarDate, dayDate, date.UNIT.MONTH ) )
                    ) {
                        td.attr( "aria-current", "date" );
                        td.addClass( CLASS_IS_CURRENT );
                    }

                    if ( !tools.checkMinMax( pV, dayDate, date.UNIT.DAY ) ) {
                        onClick = false;
                        td.addClass( CLASS_IS_DISABLED );
                        td.attr( ATTRIBUTE_ARIA_DISABLED, "true" );
                        tdText.removeAttr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_LINK );
                    } else if ( ( i < indexOfFirstDay || i >= indexOfFirstDay + numberOfDays ) &&
                            pV.showDaysOutsideMonth !== ATTRIBUTE_VALUE_DAYS_OUTSIDE_MONTH_SELECTABLE ) {
                        if ( pV.showDaysOutsideMonth === ATTRIBUTE_VALUE_VISIBLE ) {
                            onClick = false;
                            td.addClass( CLASS_IS_DISABLED );
                            tdText.removeAttr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_LINK );
                        } else if ( pV.showDaysOutsideMonth === ATTRIBUTE_VALUE_HIDDEN ){
                            onClick = false;
                            td.addClass( CLASS_IS_DISABLED );
                            td.text( "" );
                        }
                        td.attr( ATTRIBUTE_ARIA_DISABLED, "true" );
                    } else {
                        td.attr( "data-date", dayDateStr );
                        td.attr( ATTRIBUTE_ROLE, "gridcell" );
                        td.on( "keydown", function( event ) {
                            if ( event.key === "Tab" && event.shiftKey ) {
                                event.preventDefault();
                                TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--next" ).trigger( "focus" );
                            }
                        } );

                        if ( !pV.disabled && !dayFormat.disabled && onClick ) {
                            td.on( EVENT_CLICK, function() {
                            // remove all aria selected and set tabindex to -1
                                const tds = body.closest( "." + CLASS_A_DATEPICKER + "-calendars" ).find( "td" );
                                tds.attr( ATTRIBUTE_ARIA_SELECTED, "false" );
                                tds.removeClass( CLASS_IS_SELECTED );
                                tds.attr( ATTRIBUTE_TABINDEX, "-1" );

                                // set aria selected and tabindex 0 to the clicked element
                                td.attr( ATTRIBUTE_ARIA_SELECTED, "true" );
                                td.attr( ATTRIBUTE_TABINDEX, "0" );
                                td.addClass( CLASS_IS_SELECTED );

                                // calendar should not execute rerender in this case because the month where date is selected
                                // will become month in the middle when multiple month are set
                                // this happens because in inline mode the setDateToValue is directly commited
                                if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                                    pThis._skipRender = true;
                                }

                                if ( !pV.showTime && pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                                    tools.dialog.close( pThis );
                                }
                                tools.setDateToValue( pThis, pV, dayDate, DATE_PART_DAY );
                            } );
                        }
                    }

                    // disable when disabled by dayFormatter, allow keyboard navigation at the moment maybe this could be added later
                    if ( dayFormat.disabled ) {
                        td.addClass( CLASS_IS_DISABLED );
                        td.attr( ATTRIBUTE_ARIA_DISABLED, "true" );
                        tdText.removeAttr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_LINK );
                    }
                }

                return body;
            }
        },
        /**
        * Used to generate the footer jQuery object of the calendar container with time selector and action buttons
        * @param {object} [pThis] the webComponent object
        * @param {object} [pV] object that includes all attributes of the webComponent
        * @return {object}
        *
        * @function generate.footer
        * @memberOf item.Datepicker.js
        */
        footer: {
            container: function() {
                const container = $( "<div>" );
                container.addClass( CLASS_A_DATEPICKER + "-footer" );
                return container;
            },
            timePicker: function( pThis, pV ) {
                const timePicker = $( "<div>" );
                timePicker.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_TIME_PICKER ) );
                timePicker.addClass( CLASS_A_DATEPICKER + "-timePicker" );
                timePicker.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_REGION );

                const icon = $( "<span>" );
                icon.addClass( CLASS_ICONS + " icon-time" );
                icon.attr( ATTRIBUTE_ARIA_HIDDEN, "true" );
                timePicker.append( icon );

                // when click on the clock the calendar jumps to initial Date
                if ( !pV.disabled && pThis._initialValueDate ) {
                    icon.on( EVENT_CLICK, function( event ) {
                        event.stopPropagation();
                        pThis._currentCalendarDate = tools.calcCurrentCalendarDate( pThis, pV, pThis._initialValueDate );
                        tools.setDateToValue( pThis, pV, date.clone( pThis._currentCalendarDate ), DATE_PART_ALL );
                        tools.moveCalendarView( pThis, pV, null, date.clone( pThis._currentCalendarDate ) );
                    } );
                }

                // hours
                const idHour = pThis._elementIDSafe + "_hours",
                      hour = $( "<div>" );
                hour.addClass( CLASS_A_DATEPICKER + "-timeHours" );
                timePicker.append( hour );

                hour.append( generate.defaultElements.label( MSG( MESSAGE_HOUR ), idHour ) );

                const hourSelect= $( "<select>" );
                hourSelect.attr( ATTRIBUTE_ID, idHour );
                if ( pThis._elementLabelIDSafe ) {
                    hourSelect.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }
                hourSelect.attr( ATTRIBUTE_ARIA_CONTROLS, pThis._calendarTableIDSafe );
                hourSelect.prop( ATTRIBUTE_DISABLED, pV.disabled );
                hour.append( hourSelect );


                // set focus to calendar on back tab even when there no focusable element
                if ( !pV.disabled ) {
                    hourSelect.on( "keydown", function( event ) {
                        if ( event.key === "Tab" && event.shiftKey ) {
                            event.preventDefault();
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        }
                    } );
                }

                const valueDate = pThis._pendingValue || pThis._currentCalendarDate,
                      valueDateHour = valueDate.getHours();

                if ( pThis._ampm ) {
                    let ampmValueDateHour = valueDateHour % 12;

                    ampmValueDateHour = ampmValueDateHour ? ampmValueDateHour : 12;

                    for ( let i = 1; i <= 12; i++ ) {
                        const hourOption = $( "<option>" );
                        hourOption.text( i );
                        hourOption.attr( ATTRIBUTE_VALUE, i );
                        if ( ampmValueDateHour === i ) {
                            hourOption.prop( "selected", true );
                        }
                        hourSelect.append( hourOption );
                    }
                } else {
                    for ( let i = 0; i < 24; i++ ) {
                        const hourOption = $( "<option>" );
                        hourOption.text( ( "0" + i ).slice( -2 ) );
                        hourOption.attr( ATTRIBUTE_VALUE, i );
                        if ( valueDateHour === i ) {
                            hourOption.prop( "selected", true );
                        }
                        hourSelect.append( hourOption );
                    }
                }

                // minutes
                const idMinute = pThis._elementIDSafe + "_minutes",
                      minute = $( "<div>" );
                minute.addClass( CLASS_A_DATEPICKER + "-timeMinutes" );
                timePicker.append( minute );

                minute.append( generate.defaultElements.label( MSG( MESSAGE_MINUTES ), idMinute ) );

                const minuteSelect= $( "<select>" );
                minuteSelect.attr( ATTRIBUTE_ID, idMinute );
                if ( pThis._elementLabelIDSafe ) {
                    minuteSelect.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }
                minuteSelect.attr( ATTRIBUTE_ARIA_CONTROLS, pThis._calendarTableIDSafe );
                minute.append( minuteSelect );

                const minuteOptions = tools.getMinuteOptions( pV.timeIncrementMinute );

                minuteOptions.forEach( function( element ) {
                    const minuteOption = $( "<option>" );
                    minuteOption.text( ( "0" + ( element ) ).slice( -2 ) );
                    minuteOption.attr( ATTRIBUTE_VALUE, ( element ) );
                    if ( element === valueDate.getMinutes() ) {
                        minuteOption.prop( "selected", true );
                    }
                    minuteSelect.append( minuteOption );
                } );

                minuteSelect.on( EVENT_CHANGE, function() {
                    const minutesValue = parseInt( minuteSelect.val(), 10 ),
                          newDate = new Date().setMinutes( minutesValue );

                    tools.setDateToValue( pThis, pV, new Date( newDate ), DATE_PART_MINUTE );
                    if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                        queueMicrotask( function(){
                            TOP_JQUERY( "#" + idMinute ).trigger( "focus" );
                        } );
                    }
                } );

                minuteSelect.prop( ATTRIBUTE_DISABLED, pV.disabled );

                // am/pm
                if( pThis._ampm ) {
                    const idAMPM = pThis._elementIDSafe + "_ampm",
                          amPM = $( "<div>" );
                    amPM.addClass( CLASS_A_DATEPICKER + "-timeAmPm" );
                    timePicker.append( amPM );

                    amPM.append( generate.defaultElements.label( MSG( MESSAGE_AM_PM ), idAMPM ) );

                    const amPMSelect= $( "<select>" );
                    amPMSelect.attr( ATTRIBUTE_ID, idAMPM );
                    if ( pThis._elementLabelIDSafe ) {
                        amPMSelect.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                    }
                    amPMSelect.attr( ATTRIBUTE_ARIA_CONTROLS, pThis._calendarTableIDSafe );
                    amPMSelect.prop( ATTRIBUTE_DISABLED, pV.disabled );
                    amPM.append( amPMSelect );

                    const amPMOptionAm = $( "<option>" );
                    amPMOptionAm.text( locale.getSettings().calendar.amFormat );
                    amPMOptionAm.attr( ATTRIBUTE_VALUE, "AM" );
                    amPMSelect.append( amPMOptionAm );

                    const amPMOptionPm = $( "<option>" );
                    amPMOptionPm.text( locale.getSettings().calendar.pmFormat );
                    amPMOptionPm.attr( ATTRIBUTE_VALUE, "PM" );
                    amPMSelect.append( amPMOptionPm );

                    if ( valueDateHour >= 12 ) {
                        amPMOptionPm.prop( "selected", true );
                    } else {
                        amPMOptionAm.prop( "selected", true );
                    }

                    amPMSelect.on( EVENT_CHANGE, function() {
                        tools.setCalendarHours( pThis, pV, hourSelect, amPMSelect );
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                            queueMicrotask( function(){
                                TOP_JQUERY( "#" + idAMPM ).trigger( "focus" );
                            } );
                        }
                    } );

                    hourSelect.on( EVENT_CHANGE, function() {
                        tools.setCalendarHours( pThis, pV, hourSelect, amPMSelect );
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                            queueMicrotask( function(){
                                TOP_JQUERY( "#" + idHour ).trigger( "focus" );
                            } );
                        }
                    } );

                } else {
                    hourSelect.on( EVENT_CHANGE, function() {
                        tools.setCalendarHours( pThis, pV, hourSelect );
                        if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                            queueMicrotask( function(){
                                TOP_JQUERY( "#" + idHour ).trigger( "focus" );
                            } );
                        }
                    } );
                }

                return timePicker;
            },
            actions: function ( pThis, pV ) {
                const actionContainer = $( "<div>" );
                actionContainer.addClass( CLASS_A_DATEPICKER_ACTIONS );
                actionContainer.attr( ATTRIBUTE_ROLE, ATTRIBUTE_VALUE_REGION );
                actionContainer.attr( ATTRIBUTE_ARIA_LABEL, MSG( MESSAGE_ACTIONS ) );

                // when time is not shown then today button is also activated when day matches
                let unit = date.UNIT.DAY;

                if ( pV.showTime ) {
                    unit = date.UNIT.MINUTE;
                }

                // add button to set current time as date picker value ( not submitted in when shoe time is enabled )
                if ( tools.checkMinMax( pV, new Date(), unit ) && pV.todayButton ) {
                    actionContainer.append( generate.buttons.today( pThis, pV ) );
                }

                // add button to clear the value of the date picker ( not submitted in when shoe time is enabled )
                if ( !pV.required && pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                    actionContainer.append( generate.buttons.clear( pThis, pV ) );
                }

                // add button to close the dialog when in popup mode and time is enabled. This button also submits then current pending value.
                if ( pV.showTime && pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                    actionContainer.append( generate.buttons.close( pThis, pV ) );
                }

                return actionContainer;
            }
        },
        monthYearSelection: {
            /**
            * Used to generate a container for the month and year selection
            * @return {object}
            *
            * @function generate.monthYearSelection.container
            * @memberOf item.Datepicker.js
            */
            container: function () {
                const container = $( "<div>" );
                container.attr( "aria-live", "polite" );
                container.addClass( CLASS_A_DATEPICKER + "-monthPicker" );
                return container;
            },
            /**
            * Used to generate a the jQuery objects for the selection of months
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.monthYearSelection.monthSelection
            * @memberOf item.Datepicker.js
            */
            monthSelection: function ( pThis, pV ) {
                const id = pThis._elementIDSafe + "_month",
                      container = $( "<div>" );

                container.addClass( CLASS_A_DATEPICKER + "-month" );
                container.append( generate.defaultElements.label( MSG( MESSAGE_MONTH ), id ) );

                const select = $( "<select>" );
                select.attr( ATTRIBUTE_ID, id );
                if ( pThis._elementLabelIDSafe ) {
                    select.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }
                select.attr( ATTRIBUTE_ARIA_CONTROLS, pThis._calendarTableIDSafe );
                container.append( select );

                if ( pV.disabled || !pV.changeMonth ) {
                    select.prop( ATTRIBUTE_DISABLED, true );
                    select.addClass( CLASS_IS_DISABLED );
                }

                const monthDate = date.clone( pThis._currentCalendarDate );

                locale.getMonthNames().forEach( function ( month, index ) {
                    tools.setMonth( monthDate, index );
                    if ( tools.checkMinMax( pV, monthDate, date.UNIT.MONTH ) ) {
                        const option = $( "<option>" );
                        option.text( month );
                        option.attr( ATTRIBUTE_VALUE, index );

                        if ( pThis._currentCalendarDate && index === pThis._currentCalendarDate.getMonth() ) {
                            option.prop( "selected", true );
                        }
                        select.append( option );
                    }
                } );

                if ( !pV.disabled ) {
                    select.on( EVENT_CHANGE, function () {
                        const selectionValue = parseInt( select.val(), 10 );
                        pThis._currentCalendarDate = tools
                            .calcCurrentCalendarDate( pThis, pV, new Date( tools.setMonth( pThis._currentCalendarDate, selectionValue ) ) );
                        tools.moveCalendarView( pThis, pV, "#" + id );
                    } );


                    if ( !pV.changeYear ) {
                        select.on( "keydown", function( event ) {
                            if ( event.key === "Tab" && !event.shiftKey ) {
                                TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                                event.preventDefault();
                            }
                        } );
                    }
                }

                return container;
            },
            /**
            * Used to generate a the jQuery objects for the selection of years
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.monthYearSelection.yearSelection
            * @memberOf item.Datepicker.js
            */
            yearSelection: function ( pThis, pV ) {
                const id = pThis._elementIDSafe + "_year",
                      container = $( "<div>" );
                container.addClass( CLASS_A_DATEPICKER + "-year" );

                container.append( generate.defaultElements.label( MSG( MESSAGE_YEAR ), id ) );

                const select = $( "<select>" );
                select.attr( ATTRIBUTE_ID, id );
                if ( pThis._elementLabelIDSafe ) {
                    select.attr( ATTRIBUTE_ARIA_DESCRIBEDBY, pThis._elementLabelIDSafe );
                }
                select.attr( ATTRIBUTE_ARIA_CONTROLS, pThis._calendarTableIDSafe );
                container.append( select );

                if ( pV.disabled || !pV.changeYear ) {
                    select.prop( ATTRIBUTE_DISABLED, true );
                    select.addClass( CLASS_IS_DISABLED );
                }

                let currentCalendarYear = pThis._currentCalendarDate.getFullYear(),
                    yearDate = date.clone( pThis._currentCalendarDate ),
                    pastSelectionRange = pV.yearSelectionRange * 3,
                    futureSelectionRange = pV.yearSelectionRange;

                if ( pV.minDate && date.isBefore( pV.minDate, yearDate, date.UNIT.YEAR ) ) {
                    pastSelectionRange = tools.getYearDifference( pV.minDate, yearDate );
                }

                if ( pV.maxDate && date.isAfter( pV.maxDate, yearDate, date.UNIT.YEAR ) ) {
                    futureSelectionRange = tools.getYearDifference( pV.maxDate, yearDate );
                }

                for ( let i = -pastSelectionRange; i <= futureSelectionRange; i++ ) {
                    const year = currentCalendarYear + i;

                    yearDate.setFullYear( year );

                    if ( tools.checkMinMax( pV, yearDate, date.UNIT.YEAR ) ) {
                        const option = $( "<option>" );
                        option.text( year );
                        if ( currentCalendarYear === year ) {
                            option.prop( "selected", true );
                        }
                        select.prepend( option );
                    }
                }

                if ( !pV.disabled ) {
                    select.on( EVENT_CHANGE, function () {
                        const selectionValue = parseInt( select.val(), 10 );
                        pThis._currentCalendarDate = tools
                            .calcCurrentCalendarDate( pThis, pV, new Date( pThis._currentCalendarDate.setFullYear( selectionValue ) ) );
                        tools.moveCalendarView( pThis, pV, "#" + id );
                    } );

                    select.on( "keydown", function( event ) {
                        if ( event.key === "Tab" && !event.shiftKey ) {
                            event.preventDefault();
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                        }
                    } );
                }

                return container;
            }
        },
        buttons: {
            /**
            * Used to generate a button to jump to previous month
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.buttons.prevMonth
            * @memberOf item.Datepicker.js
            */
            prevMonth: function ( pThis, pV ) {
                let tabindex = "-1";

                if ( pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE &&
                !pV.changeMonth &&
                !pV.changeYear ) {
                    tabindex = null;
                }

                const button = generate.defaultElements.button(
                    pThis, // pThis
                    pV, // pV
                    MSG( MESSAGE_PREVIOUS_MONTH ), // pText
                    CLASS_A_DATEPICKER + "-nav " + CLASS_A_DATEPICKER + "-nav--prev", // pClass
                    "icon-prev", // pIconType
                    tabindex, // pTabIndex
                    pThis._calendarTableIDSafe // pAriaControls
                );

                // allow use of arrow left key to navigate
                if ( !pV.disabled ) {
                    button.on( "keydown", function( event ) {
                        if ( event.key === pThis._backwardkey ) {
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.subtract( date.clone( pThis._currentCalendarDate ),
                                    pV.previousNextDistanceSteps,
                                    date.UNIT.MONTH )
                            );
                            tools.moveCalendarView( pThis, pV, "." + CLASS_A_DATEPICKER + "-nav--prev" );
                        } else if ( event.key === "Tab" && !event.shiftKey ) {
                            event.preventDefault();
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--next" ).trigger( "focus" );
                        } else if ( event.key === "Tab" &&
                                event.shiftKey &&
                                !pV.changeMonth &&
                                !pV.changeYear &&
                                pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP ) {
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER_ACTIONS ).children().last().trigger( "focus" );
                            event.preventDefault();
                        }
                    } );

                    button.on( EVENT_CLICK, function ( event ) {
                        event.preventDefault();
                        event.stopPropagation();
                        pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                            pThis,
                            pV,
                            date.subtract( date.clone( pThis._currentCalendarDate ), pV.previousNextDistanceSteps, date.UNIT.MONTH )
                        );
                        tools.moveCalendarView( pThis, pV, "." + CLASS_A_DATEPICKER + "-nav--prev" );
                    } );
                }

                return button;
            },
            /**
            * Used to generate a button to jump to next month
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.buttons.prevMonth
            * @memberOf item.Datepicker.js
            */
            nextMonth: function ( pThis, pV ) {
                const button = generate.defaultElements.button(
                    pThis, // pThis
                    pV, // pV
                    MSG( MESSAGE_NEXT_MONTH ), // pText
                    CLASS_A_DATEPICKER + "-nav " + CLASS_A_DATEPICKER + "-nav--next", // pClass
                    "icon-next", // pIconType
                    "-1", // pTabIndex
                    pThis._calendarTableIDSafe // pAriaControls
                );

                // set focus to calendar on tab even when there no focusable element
                if ( !pV.disabled ) {
                    button.on( "keydown", function( event ) {
                        if ( event.key === "Tab" && !event.shiftKey ) {
                            event.preventDefault();
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        } else if ( event.key === "Tab" && event.shiftKey ) {
                            event.preventDefault();
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                        } else if ( event.key === pThis._forwardKey ) {
                            // allow also arrow right key to navigate
                            pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                                pThis,
                                pV,
                                date.add( date.clone( pThis._currentCalendarDate ), pV.previousNextDistanceSteps, date.UNIT.MONTH )
                            );
                            tools.moveCalendarView( pThis, pV, "." + CLASS_A_DATEPICKER + "-nav--next" );
                        }
                    } );

                    button.on( EVENT_CLICK, function ( event ) {
                        event.preventDefault();
                        event.stopPropagation();
                        pThis._currentCalendarDate = tools.calcCurrentCalendarDate(
                            pThis,
                            pV,
                            date.add( date.clone( pThis._currentCalendarDate ), pV.previousNextDistanceSteps, date.UNIT.MONTH )
                        );
                        tools.moveCalendarView( pThis, pV, "." + CLASS_A_DATEPICKER + "-nav--next" );
                    } );
                }

                return button;
            },
            /**
            * Used to generate a button to close the dialog and commit the date
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.buttons.close
            * @memberOf item.Datepicker.js
            */
            close: function( pThis, pV ) {
                const button = generate.defaultElements.button(
                    pThis, // pThis
                    pV, // pV
                    MSG( MESSAGE_DONE ), // pText
                    CLASS_A_DATEPICKER + "--close", // pClass
                    null, // pIconType,
                    null, // pTabIndex
                    pThis._inputIDSafe // pAriaControls
                );

                if ( !pV.disabled ) {
                    button.on( EVENT_CLICK, function ( event ) {
                        event.preventDefault();
                        event.stopPropagation();
                        tools.dialog.close( pThis );
                        tools.commitValue( pThis, pV );
                    } );

                    if ( !pV.changeMonth && !pV.changeYear ) {
                        button.on( "keydown", function( event ) {
                            if ( event.key === "Tab" && !event.shiftKey ) {
                                event.preventDefault();
                                TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                            }

                            if ( event.key === "Tab" && event.shiftKey && !pV.showTime && !pV.todayButton ) {
                                event.preventDefault();
                                tools.elements.getFocusElement( pThis ).trigger( "focus" );
                            }
                        } );
                    }
                }

                return button;
            },
            /**
            * Used to generate a button to set current date to the calendar. This set value of the calendar is not commited to the item value in popup mode.
            * You need to close calendar first to commit the value
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.buttons.today
            * @memberOf item.Datepicker.js
            */
            today: function( pThis, pV ) {
                const buttonSuffix = "--today",
                      button = generate.defaultElements.button(
                          pThis, // pThis
                          pV, // pV
                          MSG( MESSAGE_TODAY ), // pText
                          CLASS_A_DATEPICKER + buttonSuffix, // pClass
                          null, // pIconType
                          ( pV.disabled ) ? "-1": null, // pTabIndex
                          pThis._inputIDSafe // pAriaControls
                      );

                if ( !pV.disabled ) {
                    button.on( EVENT_CLICK, function ( event ) {
                        event.preventDefault();
                        event.stopPropagation();
                        pThis._currentCalendarDate = tools.calcCurrentCalendarDate( pThis, pV, new Date() );
                        pThis._pendingValue = pThis._currentCalendarDate;
                        tools.setDateToValue( pThis, pV, date.clone( pThis._currentCalendarDate ), DATE_PART_ALL );

                        if ( pV.showTime ) {
                            tools.moveCalendarView(
                                pThis,
                                pV,
                                "." + CLASS_A_DATEPICKER + buttonSuffix,
                                date.clone( pThis._currentCalendarDate )
                            );
                        } else {
                            tools.dialog.close( pThis );
                        }
                    } );

                    button.on( "keydown", function( event ) {
                        if ( event.key === "Tab" &&
                                 !event.shiftKey &&
                                 !pV.changeMonth &&
                                 !pV.changeYear &&
                                 ( !pV.showTime || pV.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) ) {
                            event.preventDefault();
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                        }

                        if ( event.key === "Tab" && event.shiftKey && !pV.showTime ) {
                            event.preventDefault();
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        }
                    } );
                }

                return button;
            },
            /**
            * Used to generate a button to clear the current value of the calendar. This set value of the calendar is not commited to the item value in popup mode.
            * You need to close calendar first to commit the value
            * @param {object} [pThis] the webComponent object
            * @param {object} [pV] object that includes all attributes of the webComponent
            * @return {object}
            *
            * @function generate.buttons.clear
            * @memberOf item.Datepicker.js
            */
            clear: function( pThis, pV ) {
                const buttonSuffix = "--clear",
                      button = generate.defaultElements.button(
                          pThis, // pThis
                          pV, // pV
                          MSG( MESSAGE_CLEAR ), // pText
                          CLASS_A_DATEPICKER + buttonSuffix, // pClass
                          null, // pIconType
                          ( pV.disabled ) ? "-1": null, // pTabIndex
                          pThis._inputIDSafe // pAriaControls
                      );

                if ( !pV.disabled ) {
                    button.on( EVENT_CLICK, function ( event ) {
                        event.preventDefault();
                        event.stopPropagation();
                        tools.setDateToValue( pThis, pV, null, DATE_PART_ALL );

                        // queue micro task to prevent that new element not exists when rerender is finished
                        queueMicrotask( function() {
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + buttonSuffix ).trigger( "focus" );
                        } );
                    } );

                    button.on( "keydown", function( event ) {
                        if ( event.key === "Tab" &&
                                 !event.shiftKey &&
                                 !pV.changeMonth &&
                                 !pV.changeYear &&
                                 !pV.todayButton &&
                                 !pV.showTime ) {
                            event.preventDefault();
                            TOP_JQUERY( pThis._calendar ).find( "." + CLASS_A_DATEPICKER + "-nav--prev" ).trigger( "focus" );
                        }

                        if ( event.key === "Tab" && event.shiftKey && !pV.showTime && !pV.todayButton ) {
                            event.preventDefault();
                            tools.elements.getFocusElement( pThis ).trigger( "focus" );
                        }
                    } );
                }

                return button;
            }
        }
    };

    const componentMetaData = {
        name: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        type: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        value: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        tabindex: {
            type: WebComponent.dataTypes.number,
            reactive: true
        },
        showTime: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        todayButton: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true,
            reactive: true
        },
        changeMonth: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true,
            reactive: true
        },
        changeYear: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: true,
            reactive: true
        },
        displayWeeks: {
            type: WebComponent.dataTypes.enum,
            defaultValue: ATTRIBUTE_VALUE_NONE,
            enumValues: [
                ATTRIBUTE_VALUE_DISPLAY_WEEKS,
                ATTRIBUTE_VALUE_NONE
            ],
            reactive: true
        },
        format: {
            type: WebComponent.dataTypes.string,
            defaultValue: locale.getDateFormat(),
            reactive: true
        },
        displayAs: {
            type: WebComponent.dataTypes.enum,
            defaultValue: ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP,
            enumValues: [
                ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE,
                ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP,
                ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE
            ],
            reactive: true
        },
        showOn: {
            type: WebComponent.dataTypes.enum,
            defaultValue: ATTRIBUTE_VALUE_SHOW_ON_FOCUS,
            enumValues: [
                ATTRIBUTE_VALUE_SHOW_ON_FOCUS,
                ATTRIBUTE_VALUE_SHOW_ON_CLICK,
                ATTRIBUTE_VALUE_SHOW_ON_CLICK_IMAGE
            ],
            /* not fully supported at the moment
            reactive: true*/
        },
        showDaysOutsideMonth: {
            type: WebComponent.dataTypes.enum,
            enumValues: [
                ATTRIBUTE_VALUE_VISIBLE,
                ATTRIBUTE_VALUE_HIDDEN,
                ATTRIBUTE_VALUE_SELECTABLE
            ],
            defaultValue: ATTRIBUTE_VALUE_VISIBLE,
            reactive: true
        },
        numberOfMonths: {
            type: WebComponent.dataTypes.number,
            defaultValue: 1,
            range: { min: 0, max: 5 },
            reactive: true
        },
        timeIncrementMinute: {
            type: WebComponent.dataTypes.number,
            defaultValue: ATTRIBUTE_VALUE_TIME_INCREMENT_MINUTE_DEFAULT,
            range: { min: 1, max: 60 },
            reactive: true
        },
        yearSelectionRange: {
            type: WebComponent.dataTypes.number,
            defaultValue: 5,
            range: { min: 1 },
            reactive: true
        },
        disabled: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false,
            reactive: true
        },
        required: {
            type: WebComponent.dataTypes.boolean,
            defaultValue: false
        },
        previousNextDistance: {
            type: WebComponent.dataTypes.enum,
            defaultValue: ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_ONE_MONTH,
            enumValues: [
                ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_NUMBER_OF_MONTH,
                ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_ONE_MONTH
            ],
            reactive: true
        },
        min: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        max: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        placeholder: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        autofocus: {
            type: WebComponent.dataTypes.boolean,
            reactive: true
        },
        readonly: {
            type: WebComponent.dataTypes.boolean,
            reactive: true,
            defaultValue: false
        },
        autocomplete: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        size: {
            type: WebComponent.dataTypes.number,
            range: { min: 1 },
            reactive: true
        },
        maxlength: {
            type: WebComponent.dataTypes.number,
            range: { min: 1 },
            reactive: true
        },
        minlength: {
            type: WebComponent.dataTypes.number,
            range: { min: 1 },
            reactive: true
        },
        ariaDescribedby: {
            type: WebComponent.dataTypes.string,
            reactive: true
        },
        ariaLabelledby: {
            type: WebComponent.dataTypes.string,
            reactive: true
        }
    };

    WebComponent._addHyphenCaseAttrNames( componentMetaData );

    const observedAttributes = WebComponent._configObservedAttributes( componentMetaData );

    // main class of the web component with listener, constructor and apex.item api
    class DatePicker extends item.ItemComponent {
        item_type = "DATE_PICKER";

        // define private variable #v as json object
        #v = {};

        constructor() {
            super();
            this._configPrivateState( this.#v );
        }

        // function for calendar rendering
        _render( pAttributeChanges ) {
            const _self = this;

            // this is used when element is clicked so calendar should not rerender;
            if ( _self._skipRender ) {
                _self._skipRender = false;
                return;
            }

            // setup some things in general

            if ( !_self._rendered ) {
                // this code does not work in some cases in the constructor
                _self._elementID = _self.getAttribute( ATTRIBUTE_ID );
                _self._elementIDSafe = util.escapeCSS( _self._elementID );
                // IMPORTANT if you change this behaviour you have to keep in mind that this brakes SAVE_HIGHLIGHT feature for IR in wwv_flow_ir_ajax
                _self._inputIDSafe = _self._elementIDSafe + "_input";
                _self._calendarTableIDSafe = _self._elementIDSafe + "_calendar";
            }

            // check if min or max is set
            tools.updateMinMax( _self.#v );

            _self._elementLabelIDSafe = util.escapeCSS( _self.element.attr( ATTRIBUTE_ARIA_LABELLEDBY ) );
            if ( _self._elementLabelIDSafe ) {
                _self._elementLabelSafe = $( "#" + _self._elementLabelIDSafe ).text();
            }

            if ( _self.getAttribute( ATTRIBUTE_PREVIOUS_NEXT_DISTANCE ) === ATTRIBUTE_VALUE_PREVIOUS_NEXT_DISTANCE_NUMBER_OF_MONTH ) {
                _self.#v.previousNextDistanceSteps = _self.#v.numberOfMonths;
            } else {
                _self.#v.previousNextDistanceSteps = 1;
            }

            _self._ampm = false;
            // check if am/pm is used in format mask
            if ( !_self._ampm ) {
                if ( _self.#v.format.toLowerCase().includes( "pm" ) || _self.#v.format.toLowerCase().includes( "am" ) ) {
                    _self._ampm = true;
                }
            }

            if ( !_self._rendered ) {
                tools.createOrUpdateInput( _self, _self.#v );
                _self._initialValueDate = _self.getNativeValue();
            }

            tools.createUpdateOrDeletePopupButton( _self, _self.#v );

            if ( !_self._currentCalendarDate ) {
                _self._currentCalendarDate = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() || new Date() );
                _self._pendingValue = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() );
            }

            // setup some things only before rendered
            if ( !_self._rendered ) {
                // finalize wrapper element if something is missing
                // move some attributes to the wrapped element
                [
                    ATTRIBUTE_NAME,
                    ATTRIBUTE_ARIA_LABELLEDBY,
                    ATTRIBUTE_TYPE,
                    ATTRIBUTE_PLACEHOLDER,
                    ATTRIBUTE_AUTOCOMPLETE,
                    ATTRIBUTE_SIZE,
                    ATTRIBUTE_MAXLENGTH,
                    ATTRIBUTE_MINLENGTH,
                    ATTRIBUTE_ARIA_DESCRIBEDBY,
                    ATTRIBUTE_AUTOFOCUS,
                    ATTRIBUTE_TABINDEX,
                    ATTRIBUTE_ARIA_LABEL
                ].forEach( name => {
                    _self._moveAttribute( name, _self._wrappedElement$ );
                } );
            }

            // setup some things only when attribute changes where done
            if ( pAttributeChanges ) {
                for ( const obj of pAttributeChanges ) {
                    switch ( obj.attributeName ) {
                    case ATTRIBUTE_VALUE:
                        if ( _self._wrappedElement$ ) {
                            _self._wrappedElement$.val( obj.newValue );
                        }
                        _self._currentCalendarDate = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() || new Date() );
                        _self._pendingValue = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() );
                        break;
                    case ATTRIBUTE_NAME:
                    case ATTRIBUTE_ARIA_DESCRIBEDBY:
                    case ATTRIBUTE_TYPE:
                    case ATTRIBUTE_ARIA_LABELLEDBY:
                    case ATTRIBUTE_PLACEHOLDER:
                    case ATTRIBUTE_AUTOCOMPLETE:
                    case ATTRIBUTE_SIZE:
                    case ATTRIBUTE_MAXLENGTH:
                    case ATTRIBUTE_MINLENGTH:
                    case ATTRIBUTE_AUTOFOCUS:
                    case ATTRIBUTE_TABINDEX:
                    case ATTRIBUTE_ARIA_LABEL:
                        _self._moveAttribute( obj.attributeName, _self._wrappedElement$ );
                        break;
                    case ATTRIBUTE_REQUIRED:
                    case ATTRIBUTE_DISABLED:
                    case ATTRIBUTE_READONLY:
                        _self._wrappedElement$.prop( obj.attributeName, _self.#v[ obj.attributeName ] );
                        break;
                    case ATTRIBUTE_MIN:
                    case ATTRIBUTE_MAX:
                        _self._currentCalendarDate = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() || new Date() );
                        _self._pendingValue = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() );
                        break;
                    case ATTRIBUTE_DISPLAY_AS:
                        tools.createOrUpdateInput( _self, _self.#v );
                        if ( _self._calendar ) {
                            _self._calendar.remove();
                            _self._calendar = undefined;
                        }
                        tools.dialog.destroy ( _self );
                        break;
                    default: break;
                    }
                }
            }

            // when direction is set to rtl then change also forward and backward key direction
            if ( _self.element.css( "direction" ) === "rtl" ) {
                _self._backwardkey = KEY_RIGHT;
                _self._forwardKey = KEY_LEFT;
            } else {
                _self._backwardkey = KEY_LEFT;
                _self._forwardKey = KEY_RIGHT;
            }

            if ( !_self._rendered || pAttributeChanges ) {
                tools.render( _self, _self.#v );
            }

            _self._rendered = true;
        }

        disconnectedCallback() {
            // Queue Micro Task is needed to prevent error when item is moved in dome e.g. in IG
            queueMicrotask( () => {
                if ( !this.isConnected ) {
                    tools.dialog.destroy ( this );
                }
            } );
        }

        // apex.item apis
        // used from item.js: disable, enable, hide, isDisabled, show, whenReady, setStyle, getValue, isChanged
        // not needed: addValue, removeValue, isReady
        // added below: displayValueFor, getValidationMessage, getValidity, getNativeValue, hasDisplayValue, setFocusTo, getPopupSelector, refresh, setValue

        getNativeValue() {
            const value = this.getValue();

            if ( value ) {
                try {
                    return date.parse( value, this.#v.format );
                } catch( e ) {
                    debug.info( "The date must match the format " + this.#v.format, e );
                    return null;
                }
            } else {
                return null;
            }
        }

        hasDisplayValue() {
            if ( [ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE, ATTRIBUTE_VALUE_DISPLAY_FORMAT_NATIVE].includes( this.#v.displayAs ) ) {
                return true;
            } else {
                if ( this._wrappedElement$.val().length ) {
                    return true;
                } else {
                    const placeholder = this._wrappedElement$.attr( ATTRIBUTE_PLACEHOLDER );
                    if ( placeholder && placeholder.length ) {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        }

        getValidity() {
            let dateValue,
                validationStatus = {
                    valid: true,
                    valueMissing: false,
                    rangeOverflow: false,
                    rangeUnderflow: false
                };

            // check value is missing
            if ( this.#v.required && this.isEmpty() ) {
                validationStatus.valid = false;
                validationStatus.valueMissing = true;
                return validationStatus;
            }

            // is valid if it's not required and empty
            if ( this.isEmpty() ) {
                return validationStatus;
            }

            // check that input fits format mask
            try {
                dateValue = date.parse( this.getValue(), this.#v.format );
            } catch ( e ) {
                debug.trace( e );
                validationStatus.valid = false;
                return validationStatus;
            }

            // check min
            if ( this.#v.minDate && date.isBefore( dateValue, this.#v.minDate, date.UNIT.SECOND ) ) {
                validationStatus.rangeUnderflow = true;
                validationStatus.valid = false;
                return validationStatus;
            }

            // check max
            if ( this.#v.maxDate && date.isAfter( dateValue, this.#v.maxDate, date.UNIT.SECOND ) ) {
                validationStatus.rangeOverflow = true;
                validationStatus.valid = false;
                return validationStatus;
            }

            return validationStatus;
        }

        _getValidationMessage() {
            let message = "",
                validationStatus = this.getValidity();

            if ( !validationStatus.valid ) {
                if ( validationStatus.valueMissing ) {
                    message = MSG( MESSAGE_REQUIRED );
                } else if ( this.#v.minDate && this.#v.maxDate && ( validationStatus.rangeOverflow || validationStatus.rangeUnderflow ) ) {
                    // No escape is needed to prevent double escaping #34544424
                    message = lang.formatMessageNoEscape(
                        MESSAGE_VALUE_MUST_BE_BETWEEN,
                        date.format( this.#v.minDate, this.#v.format ), date.format( this.#v.maxDate, this.#v.format )
                    );
                } else if ( validationStatus.rangeUnderflow ) {
                    // No escape is needed to prevent double escaping #34544424
                    message = lang.formatMessageNoEscape( MESSAGE_VALUE_MUST_BE_ON_OR_AFTER, date.format( this.#v.minDate, this.#v.format ) );
                } else if ( validationStatus.rangeOverflow ) {
                    // No escape is needed to prevent double escaping #34544424
                    message = lang.formatMessageNoEscape( MESSAGE_VALUE_MUST_BE_ON_OR_BEFORE, date.format( this.#v.maxDate, this.#v.format ) );
                } else {
                    const validExample = ( this.element.attr( ATTRIBUTE_VALID_EXAMPLE ) )
                        ? this.element.attr( ATTRIBUTE_VALID_EXAMPLE )
                        : date.format( new Date(), this.#v.format );
                    // No escape is needed to prevent double escaping #34544424
                    message = lang.formatMessageNoEscape( MESSAGE_VALUE_INVALID, validExample );
                }
            }

            return message;
        }

        displayValueFor( pDate ) {
            if ( date.isValid( pDate ) ) {
                return date.format( pDate, this.#v.format );
            } else {
                return pDate;
            }
        }

        getPopupSelector() {
            if ( this.#v.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                return null;
            }
            return "." + CLASS_DIALOG;
        }

        setFocusTo() {
            if ( this.#v.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_INLINE ) {
                return tools.elements.getFocusElement( this );
            } else {
                return this._wrappedElement$;
            }
        }

        refresh() {
            const _self = this;

            _self._currentCalendarDate = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() || new Date() );
            _self._pendingValue = tools.calcCurrentCalendarDate( _self, _self.#v, _self.getNativeValue() );
            tools.render( _self, _self.#v );
            if ( _self.#v.displayAs === ATTRIBUTE_VALUE_DISPLAY_FORMAT_POPUP && _self._dialogOpen ) {
                queueMicrotask( function() {
                    tools.elements.getFocusElement( _self ).trigger( "focus" );
                } );
            }
        }

        setValue ( pValue, pDisplayValue, pSuppressChange ) {
            if ( this._wrappedElement$ ) {
                this._wrappedElement$.val( pValue );
                // need to update calendar view after update of the value
                this.refresh();
            }
            if ( !pSuppressChange ) {
                this.element.trigger( EVENT_CHANGE );
            }
        }

        // Static methods
        static get observedAttributes() {
            return WebComponent._configObservedAttributes( componentMetaData, observedAttributes );
        }

        static get componentMetaData() {
            return componentMetaData;
        }
    }

    customElements.define( "a-date-picker", DatePicker );

} )( apex.item, apex.jQuery, apex.util, apex.lang, apex.date, apex.debug, apex.locale, apex.message, apex.WebComponent );
