/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { g as getWeeksInMonth, a as getDaysOfWeekNames, b as getStartOfWeek, c as getDatesInWeek } from './dayUtils-ff585e8d.js';
import './getFormatParse-8a357e1c.js';
import './logger-c92f309c.js';
import { f as formatFullCalendarDate, t as toJSDate, i as isDateOutOfRange } from './calendarDateUtils-d586e25e.js';
import { S as StyledDatePickerButton } from './StyledDatePickerButton-156df9b3.js';
import { u as useUser } from './useUser-99920e02.js';
import { useCallback } from 'preact/compat';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useFocusableCell, a as useCellNavigation } from './useCellNavigation-006fbce0.js';
import { dayCellStyles } from './PRIVATE_MonthView/themes/DayCellStyles.css.js';
import { G as Grid } from './Grid-cfeac922.js';
import { MonthViewRedwoodTheme } from './PRIVATE_MonthView/themes/redwood/MonthViewTheme.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { monthViewScaleVars } from './PRIVATE_MonthView/themes/MonthViewContract.css.js';

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
    const { locale } = useUser();
    // apply day formatting
    const { state } = dayFormatter(date);
    const isDisabledFormat = state === 'disabled';
    const isRestrictedFormat = state === 'restricted';
    // Focus the day cell with isFocused true when the state updates.
    const buttonProps = useFocusableCell({ isFocusable, isFocused });
    // Override onAction to not call it if disabled, readonly or restricted
    const handleAction = useCallback((payload) => {
        if (isDisabled || isReadonly || isDisabledFormat || isRestrictedFormat)
            return;
        onAction(payload);
    }, [isDisabled, isDisabledFormat, isReadonly, isRestrictedFormat, onAction]);
    const buttonEventHandlers = useCellNavigation({
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
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const today = translations.datePicker_today();
    const selected = translations.datePicker_selected();
    const restricted = translations.datePicker_restricted();
    const formattedDate = formatFullCalendarDate(locale, date, 'day');
    let ariaLabel = isToday ? `${today}, ${formattedDate}` : formattedDate;
    ariaLabel = isRestrictedFormat ? `${ariaLabel}, ${restricted}` : ariaLabel;
    ariaLabel = isSelected ? `${ariaLabel}, ${selected}` : ariaLabel;
    const dayOfMonth = toJSDate(date.year, date.month, date.day).getDate().toString();
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
    return (jsx("div", { role: "gridcell", class: dayCellStyles, children: jsx(StyledDatePickerButton, { ...buttonProps }) }));
};

/**
 * A MonthView is a month interface that allows users to select a single date. The MonthView is the week day header
 * abbreviations and the days of the month. A MonthView is used inside of a DatePicker
 * along with the DatePickerHeader and the MonthGridView and YearGridView.
 */
const MonthView = ({ dayFormatter, daysOutsideMonth = 'hidden', isReadonly = false, max, min, onAction, onNavigation, selectedDate, focusableDate, isFocused = false, testId, todaysDate }) => {
    const { locale } = useUser();
    const weeksInMonth = getWeeksInMonth(focusableDate.year, focusableDate.month, locale);
    const { baseTheme, styles } = useComponentTheme(MonthViewRedwoodTheme, {});
    const renderMonthViewHeaderRow = () => {
        const weekDays = getDaysOfWeekNames(locale, 'short');
        return (jsx(Grid, { role: "row", "aria-hidden": "true", gridTemplateColumns: "repeat(7, 1fr)", gap: monthViewScaleVars.columnGap, children: weekDays.map((day) => (jsx("div", { role: "columnheader", class: styles['doyOfTheWeek'], children: jsx("span", { children: day }) }))) }));
    };
    const renderMonthView = () => {
        const calendarGrid = [];
        for (let weekIndex = 0; weekIndex < weeksInMonth; weekIndex++) {
            const startDateOfWeek = getStartOfWeek(focusableDate.year, focusableDate.month, 1, locale);
            const weekDates = getDatesInWeek(weekIndex, startDateOfWeek.year, startDateOfWeek.month, startDateOfWeek.day);
            const weekCells = weekDates.map((dayCellDate) => {
                // This figures out the visual state of the DayCell.
                const isDisabled = isDateOutOfRange(dayCellDate, min, max);
                // Even if the selected date is out of range, the UX design shows it as selected.
                const isSelected = selectedDate ? isSameDate(dayCellDate, selectedDate) : false;
                const isToday = isSameDate(dayCellDate, todaysDate);
                const isFocusable = isSameDate(dayCellDate, focusableDate);
                const isAdjacentMonth = isOutOfMonth(dayCellDate, focusableDate);
                const isHidden = isAdjacentMonth && daysOutsideMonth === 'hidden';
                return (jsx(DayCell, { date: dayCellDate, dayFormatter: dayFormatter, isAdjacentMonth: isAdjacentMonth, isDisabled: isDisabled, isFocusable: isFocusable, isFocused: isFocusable && isFocused, isHidden: isHidden, isReadonly: isReadonly, isSelected: isSelected, isToday: isToday, onAction: onAction, onNavigation: onNavigation }, `${dayCellDate.year}-${dayCellDate.month}-${dayCellDate.day}`));
            });
            calendarGrid.push(jsx(Grid, { role: "row", gridTemplateColumns: "repeat(7, 1fr)", gap: monthViewScaleVars.columnGap, children: weekCells }, weekIndex));
        }
        return calendarGrid;
    };
    const monthViewAriaLabel = formatFullCalendarDate(locale, focusableDate, 'month');
    return (jsx("div", { class: baseTheme, children: jsxs(Grid, { gap: monthViewScaleVars.rowGap, "aria-label": monthViewAriaLabel, role: "grid", testId: testId, children: [renderMonthViewHeaderRow(), renderMonthView()] }) }));
};
function isSameDate(date1, date2) {
    return date1.year === date2.year && date1.month === date2.month && date1.day === date2.day;
}
function isOutOfMonth(date1, currentMonthDate) {
    return date1.month !== currentMonthDate.month;
}

export { MonthView as M };
//# sourceMappingURL=MonthView-cc017afe.js.map
