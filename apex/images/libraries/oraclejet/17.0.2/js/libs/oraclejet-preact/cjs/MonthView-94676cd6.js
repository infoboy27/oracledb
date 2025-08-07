/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var dayUtils = require('./dayUtils-fd8310fc.js');
require('./getFormatParse-4a697b8f.js');
require('./logger-2b636482.js');
var calendarDateUtils = require('./calendarDateUtils-ca9bde6d.js');
var StyledDatePickerButton = require('./StyledDatePickerButton-d6fb1f86.js');
var useUser = require('./useUser-a6d15333.js');
var compat = require('preact/compat');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var useCellNavigation = require('./useCellNavigation-24bff833.js');
var PRIVATE_MonthView_themes_DayCellStyles_css = require('./PRIVATE_MonthView/themes/DayCellStyles.css.js');
var Grid = require('./Grid-03d487e5.js');
var PRIVATE_MonthView_themes_redwood_MonthViewTheme = require('./PRIVATE_MonthView/themes/redwood/MonthViewTheme.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var PRIVATE_MonthView_themes_MonthViewContract_css = require('./PRIVATE_MonthView/themes/MonthViewContract.css.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * The useDayCell hook returns properties for an individual DayCell. The properties returned should be spread on the StyledDatePickerButton.
 * These include the event handlers for keydown and click.
 */
const useDayCell = ({ date, dayFormatter = defaultDayFormatter, isAdjacentMonth, isDisabled, isFocusable, isFocused, isHidden, isReadonly, isSelected, isToday, onAction, onNavigation }) => {
    const { locale } = useUser.useUser();
    // apply day formatting
    const { state } = dayFormatter(date);
    const isDisabledFormat = state === 'disabled';
    const isRestrictedFormat = state === 'restricted';
    // Focus the day cell with isFocused true when the state updates.
    const buttonProps = useCellNavigation.useFocusableCell({ isFocusable, isFocused });
    // Override onAction to not call it if disabled, readonly or restricted
    const handleAction = compat.useCallback((payload) => {
        if (isDisabled || isReadonly || isDisabledFormat || isRestrictedFormat)
            return;
        onAction(payload);
    }, [isDisabled, isDisabledFormat, isReadonly, isRestrictedFormat, onAction]);
    const buttonEventHandlers = useCellNavigation.useCellNavigation({
        navigationMap: {
            ArrowLeft: { ltr: 'previousDay', rtl: 'nextDay' },
            ArrowRight: { ltr: 'nextDay', rtl: 'previousDay' },
            ArrowDown: 'nextWeek',
            ArrowUp: 'previousWeek',
            PageDown: 'nextMonth',
            PageUp: 'previousMonth',
            Home: 'firstDayOfMonth',
            End: 'lastDayOfMonth',
            ShiftPageDown: 'nextYear',
            ShiftPageUp: 'previousYear',
            CtrlAltT: 'today'
        },
        payload: { date },
        onAction: handleAction,
        onNavigation
    });
    // For accessibility, we want a full date.
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const today = translations.datePicker_today();
    const selected = translations.datePicker_selected();
    const restricted = translations.datePicker_restricted();
    const formattedDate = calendarDateUtils.formatFullCalendarDate(locale, date, 'day');
    let ariaLabel = isToday ? `${today}, ${formattedDate}` : formattedDate;
    ariaLabel = isRestrictedFormat ? `${ariaLabel}, ${restricted}` : ariaLabel;
    ariaLabel = isSelected ? `${ariaLabel}, ${selected}` : ariaLabel;
    const dayOfMonth = calendarDateUtils.toJSDate(date.year, date.month, date.day).getDate().toString();
    return {
        buttonProps: {
            'aria-label': ariaLabel,
            ...((isHidden || isDisabled || isDisabledFormat || isRestrictedFormat) && {
                'aria-disabled': true
            }),
            isActivable: !(isDisabled || isReadonly || isDisabledFormat || isRestrictedFormat),
            isAdjacentMonth,
            isDimmed: isDisabled || isDisabledFormat,
            isHidden,
            isHoverable: !(isDisabled || isReadonly || isDisabledFormat || isRestrictedFormat),
            isReadonly,
            isSelected,
            isRestricted: isRestrictedFormat,
            isToday,
            label: dayOfMonth,
            ...buttonProps,
            ...buttonEventHandlers
        }
    };
};
/**
 * A default day formatter that always formats as enabled state.
 */
const defaultDayFormatter = () => ({ state: 'enabled' });

/**
 * The DayCell is the cell within the DatePicker's month view that contains the day in the month view.
 * This component will format the date for the aria-label.
 * The DayCell components uses the useDayCell hook to handle the user interactions with the day cell.
 */
const DayCell = (props) => {
    const { buttonProps } = useDayCell(props);
    // buttonProps, e.g., tabIndex, aria-label, onclick, onkeydown and visual states
    return (jsxRuntime.jsx("div", { role: "gridcell", class: PRIVATE_MonthView_themes_DayCellStyles_css.dayCellStyles, children: jsxRuntime.jsx(StyledDatePickerButton.StyledDatePickerButton, { ...buttonProps }) }));
};

/**
 * A MonthView is a month interface that allows users to select a single date. The MonthView is the week day header
 * abbreviations and the days of the month. A MonthView is used inside of a DatePicker
 * along with the DatePickerHeader and the MonthGridView and YearGridView.
 */
const MonthView = ({ dayFormatter, daysOutsideMonth = 'hidden', isReadonly = false, max, min, onAction, onNavigation, selectedDate, focusableDate, isFocused = false, testId, todaysDate }) => {
    const { locale } = useUser.useUser();
    const weeksInMonth = dayUtils.getWeeksInMonth(focusableDate.year, focusableDate.month, locale);
    const { baseTheme, styles } = useComponentTheme.useComponentTheme(PRIVATE_MonthView_themes_redwood_MonthViewTheme.MonthViewRedwoodTheme, {});
    const renderMonthViewHeaderRow = () => {
        const weekDays = dayUtils.getDaysOfWeekNames(locale, 'short');
        return (jsxRuntime.jsx(Grid.Grid, { role: "row", "aria-hidden": "true", gridTemplateColumns: "repeat(7, 1fr)", gap: PRIVATE_MonthView_themes_MonthViewContract_css.monthViewScaleVars.columnGap, children: weekDays.map((day) => (jsxRuntime.jsx("div", { role: "columnheader", class: styles['doyOfTheWeek'], children: jsxRuntime.jsx("span", { children: day }) }))) }));
    };
    const renderMonthView = () => {
        const calendarGrid = [];
        for (let weekIndex = 0; weekIndex < weeksInMonth; weekIndex++) {
            const startDateOfWeek = dayUtils.getStartOfWeek(focusableDate.year, focusableDate.month, 1, locale);
            const weekDates = dayUtils.getDatesInWeek(weekIndex, startDateOfWeek.year, startDateOfWeek.month, startDateOfWeek.day);
            const weekCells = weekDates.map((dayCellDate) => {
                // This figures out the visual state of the DayCell.
                const isDisabled = calendarDateUtils.isDateOutOfRange(dayCellDate, min, max);
                // Even if the selected date is out of range, the UX design shows it as selected.
                const isSelected = selectedDate ? isSameDate(dayCellDate, selectedDate) : false;
                const isToday = isSameDate(dayCellDate, todaysDate);
                const isFocusable = isSameDate(dayCellDate, focusableDate);
                const isAdjacentMonth = isOutOfMonth(dayCellDate, focusableDate);
                const isHidden = isAdjacentMonth && daysOutsideMonth === 'hidden';
                return (jsxRuntime.jsx(DayCell, { date: dayCellDate, dayFormatter: dayFormatter, isAdjacentMonth: isAdjacentMonth, isDisabled: isDisabled, isFocusable: isFocusable, isFocused: isFocusable && isFocused, isHidden: isHidden, isReadonly: isReadonly, isSelected: isSelected, isToday: isToday, onAction: onAction, onNavigation: onNavigation }, `${dayCellDate.year}-${dayCellDate.month}-${dayCellDate.day}`));
            });
            calendarGrid.push(jsxRuntime.jsx(Grid.Grid, { role: "row", gridTemplateColumns: "repeat(7, 1fr)", gap: PRIVATE_MonthView_themes_MonthViewContract_css.monthViewScaleVars.columnGap, children: weekCells }, weekIndex));
        }
        return calendarGrid;
    };
    const monthViewAriaLabel = calendarDateUtils.formatFullCalendarDate(locale, focusableDate, 'month');
    return (jsxRuntime.jsx("div", { class: baseTheme, children: jsxRuntime.jsxs(Grid.Grid, { gap: PRIVATE_MonthView_themes_MonthViewContract_css.monthViewScaleVars.rowGap, "aria-label": monthViewAriaLabel, role: "grid", testId: testId, children: [renderMonthViewHeaderRow(), renderMonthView()] }) }));
};
function isSameDate(date1, date2) {
    return date1.year === date2.year && date1.month === date2.month && date1.day === date2.day;
}
function isOutOfMonth(date1, currentMonthDate) {
    return date1.month !== currentMonthDate.month;
}

exports.MonthView = MonthView;
//# sourceMappingURL=MonthView-94676cd6.js.map
