/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useRef, useCallback, useEffect, useReducer, useContext, useMemo } from 'preact/hooks';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import { C as CompactUserAssistance } from './CompactUserAssistance-41c32c6f.js';
import './useTooltipControlled-2044f639.js';
import { createContext } from 'preact';
import './IconStyle.styles.css';
import './Popup-8889a781.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './LayerHost-45f545d7.js';
import './HiddenAccessibleStyles.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { a as isSelectAll, b as isBackspaceOrDelete } from './keyboardUtils-4db21770.js';
import './getFormatParse-8a357e1c.js';
import { i as isNumberOnlyString, g as getMonthName, a as getTodayAsCalendarDate, c as calendarDatesAreDifferent, t as translateCustomMasks } from './maskUtils-4bccc3d0.js';
import { segmentStyles } from './UNSAFE_InputDateMask/themes/SegmentStyles.css.js';
import { u as useUser } from './useUser-99920e02.js';
import { F as Flex } from './Flex-24628925.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';
import { m as merge } from './stringUtils-16f617bc.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { M as MAX_ISO_YEAR, p as getMonthsInYear, l as getDaysInMonth, q as MIN_ISO_DAY, r as MIN_ISO_YEAR, s as MIN_ISO_MONTH, f as formatFullCalendarDate, u as getDatePlaceholderMasks, v as formatShortCalendarDate } from './calendarDateUtils-d586e25e.js';
import { u as useDoubleTap } from './useDoubleTap-4e290707.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { TextFieldInputRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js';
import { L as Label } from './Label-6674b3f2.js';
import './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import { T as TextField } from './TextField-323fe0e9.js';
import './LiveRegionStyles.styles.css';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';

// Used to disable browser cut and paste, which don't really work with segments (copy is fine).
const preventDefaultHandler = (e) => {
    e.preventDefault();
};
const isIos = () => getClientHints().platform === 'ios';
/**
 * A DateSegment renders a part of a calendar date, e.g. the day, month, or year.
 * It can be used as a spinbutton to step or spin its value.
 */
const DateSegment = ({ 'aria-label': ariaLabel, 'aria-valuemax': ariaValueMax, 'aria-valuemin': ariaValueMin, 'aria-valuenow': ariaValueNow, 'aria-valuetext': ariaValueText, inputRef, isComplete, isDisabled, isHidden, isHighlighted, isInvalid, isRequired, isSelected, onChange, placeholder, text, type }) => {
    const hasDisplayValue = text && text.length > 0;
    const rootClasses = classNames([
        segmentStyles.base,
        isSelected && segmentStyles.selected,
        isHighlighted && segmentStyles.highlighted
    ]);
    const placeholderClasses = classNames([
        segmentStyles.placeholder,
        isHidden || hasDisplayValue ? segmentStyles.hidden : segmentStyles.notHidden
    ]);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const emptySegmentValueText = translations.inputDateMask_empty_segment();
    // If a ref was passed in, use it, otherwise get a ref.
    const sRef = useRef(null);
    const segmentRef = inputRef ?? sRef;
    const hasLeadingZero = useRef(false);
    const { locale } = useUser();
    const onKeyDown = useCallback((event) => {
        if (isDisabled ||
            event.key === 'Tab' ||
            event.key === 'ArrowLeft' ||
            event.key === 'ArrowRight' ||
            event.key === 'Enter' ||
            isSelectAll(event)) {
            // Let the event pass through.
            return;
        }
        if (isHighlighted) {
            // If date is selected, ignore edits and let backspace/delete pass through to clear.
            if (isBackspaceOrDelete(event) || event.key === 'Backspace') {
                return;
            }
        }
        else if (event.key === '0' && (isComplete || text === undefined)) {
            // Typing '0' is considered a leading zero if the segment is complete, in which case
            // the user is typing a new value, or if there is no current value.
            hasLeadingZero.current = true;
        }
        else if (isNumberOnlyString(event.key)) {
            onChange?.({
                actionType: 'updateSegment',
                data: { type, text: event.key, hasLeadingZero: hasLeadingZero.current, locale }
            });
            hasLeadingZero.current = false;
        }
        else if (isBackspaceOrDelete(event) || event.key === 'Backspace') {
            // Android sends Backspace as event.key, not event.code, so check for it.
            onChange?.({ actionType: 'clearSegment', data: { type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'ArrowUp') {
            onChange?.({ actionType: 'step', data: { direction: 'increase', locale, type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'ArrowDown') {
            onChange?.({ actionType: 'step', data: { direction: 'decrease', locale, type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'PageUp') {
            onChange?.({ actionType: 'page', data: { direction: 'increase', locale, type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'PageDown') {
            onChange?.({ actionType: 'page', data: { direction: 'decrease', locale, type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'Home') {
            onChange?.({ actionType: 'goToHome', data: { locale, type } });
            hasLeadingZero.current = false;
        }
        else if (event.key === 'End') {
            onChange?.({ actionType: 'goToEnd', data: { locale, type } });
            hasLeadingZero.current = false;
        }
        event.preventDefault();
        event.stopPropagation();
    }, [isComplete, isDisabled, isHighlighted, locale, onChange, text, type]);
    // Used to focus the segment when isSelected is true.
    useEffect(() => {
        if (isSelected) {
            segmentRef.current?.focus();
        }
    }, [isSelected, segmentRef]);
    // This attribute is used to distinguish between segments when clicked (see DateField.tsx).
    const customDataAttribute = { 'data-segment': [type] };
    // If ariaValueText is undefined, substitute a string that indicates the segment is empty.
    // If ariaValueNow and ariaValueText represent the same value, omit the value text; this
    // is the same as what we do in NumberInputText.
    const valueText = ariaValueText === undefined
        ? emptySegmentValueText
        : ariaValueNow?.toString() === ariaValueText
            ? undefined
            : ariaValueText;
    return (
    // Introduce a div wrapper around the contentEditable element to prevent it from grabbing focus.
    // https://stackoverflow.com/questions/34354085/clicking-outside-a-contenteditable-div-stills-give-focus-to-it
    // JET-64874: We change the segment's role to "textbox" on iOS to work around a VoiceOver bug.
    jsx("div", { children: jsxs("div", { ref: segmentRef, role: isIos() ? 'textbox' : 'spinbutton', "aria-disabled": isDisabled, "aria-invalid": isInvalid || undefined, "aria-label": ariaLabel, "aria-required": isRequired, "aria-valuemin": isIos() ? undefined : ariaValueMin, "aria-valuemax": isIos() ? undefined : ariaValueMax, "aria-valuenow": isIos() ? undefined : ariaValueNow, "aria-valuetext": isIos() ? undefined : valueText, autocapitalize: "off", autocorrect: "off", class: rootClasses, contentEditable: !isDisabled, ...customDataAttribute, enterkeyhint: isDisabled ? undefined : 'done', inputMode: isDisabled ? 'none' : 'numeric', onCut: preventDefaultHandler, onKeyDown: onKeyDown, onPaste: preventDefaultHandler, spellcheck: false, tabIndex: isSelected ? 0 : -1, children: [jsx("span", { "aria-hidden": "true", class: placeholderClasses, ...customDataAttribute, children: placeholder }), text] }) }));
};

/**
 * LiteralSegment is used to represent a literal separator in a calendar date,
 * such as the '/' in 11/29/2023.
 */
const LiteralSegment = ({ isHidden, isHighlighted, isPlaceholder, text }) => {
    const spanClasses = classNames([
        segmentStyles.literalBase,
        isPlaceholder && segmentStyles.placeholder,
        isHighlighted && segmentStyles.highlighted,
        isHidden ? segmentStyles.hidden : segmentStyles.notHidden
    ]);
    return (jsx("span", { "aria-hidden": "true", class: spanClasses, children: text }));
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Reducer function for updating DateFieldState per the specified DateFieldAction.
 * @param state
 * @param action
 */
const dateReducer = (state, action) => {
    // On mount, the reducer is initialized with initial state derived from the DateField's value.
    // If that value is changed programmatically afterwards, the only way to push that update
    // into the reducer is to define a "reset" action.
    if (action.actionType === 'reset') {
        return action.data;
    }
    const segmentType = action.data?.type;
    const segmentState = findSegment$1(state.segments, segmentType);
    switch (action.actionType) {
        case 'clearDate': {
            const updatedSegments = selectFirst(clearDate(state.segments), state.orderedSegments);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'clearSegment': {
            const updatedSegment = clearSegment(segmentState);
            return createDateFieldState(state, segmentType, updatedSegment);
        }
        case 'commit': {
            const updatedSegments = clearSelectionAndComplete(state.segments);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'goToEnd': {
            const updatedSegment = goToEnd(segmentType, segmentState, state.segments, action.data?.locale);
            return createDateFieldState(state, segmentType, updatedSegment, false);
        }
        case 'goToHome': {
            const updatedSegment = goToHome(segmentType, segmentState, state.segments, action.data?.locale);
            return createDateFieldState(state, segmentType, updatedSegment, false);
        }
        case 'page': {
            const direction = action.data?.direction;
            const locale = action.data?.locale;
            const updatedSegment = doStepOrPage(segmentType, segmentState, state.segments, 'page', direction, locale);
            return createDateFieldState(state, segmentType, updatedSegment, false);
        }
        case 'selectDateOrSegment': {
            return selectDateOrSegment(state);
        }
        case 'selectFirst': {
            const updatedSegments = selectFirst(state.segments, state.orderedSegments);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'selectNext': {
            const updatedSegments = selectNext(state.segments, state.orderedSegments);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'selectPrevious': {
            const updatedSegments = selectPrevious(state.segments, state.orderedSegments);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'selectSegment': {
            const updatedSegments = selectSegment(state.segments, segmentType);
            return createDateFieldStateWithSelectedDate(state, updatedSegments, false);
        }
        case 'step': {
            const direction = action.data?.direction;
            const locale = action.data?.locale;
            const updatedSegment = doStepOrPage(segmentType, segmentState, state.segments, 'step', direction, locale);
            return createDateFieldState(state, segmentType, updatedSegment, false);
        }
        case 'updateSegment': {
            const updatedSegment = updateSegment(segmentType, segmentState, action, state.segments);
            return createDateFieldState(state, segmentType, updatedSegment);
        }
        default: {
            throw new Error('Unknown action type');
        }
    }
};
const stringToNumber = (s) => +s;
const numberToString = (n) => n.toString();
const withinRange = (n, min, max) => n >= min && n <= max;
const findSegment$1 = (segments, type) => {
    return segments.find((segment) => segment.type === type);
};
// A segment is considered complete if appending a zero to the current value causes it
// to exceed the max. For instance, if you type 2-9 into month or 4-9 into day, the
// segment is complete because you can't type any more digits and have it be a valid value.
const isSegmentComplete = (val, max) => {
    const num = stringToNumber(numberToString(val) + '0');
    return num > max;
};
// A date is considered complete if all of its segments have values.
const isDateComplete = (allSegments) => {
    return allSegments.every((seg) => seg.text && seg.text.length > 0);
};
// A date is considered a partial date if at least one segment has a value.
const isPartialDate = (allSegments) => {
    return allSegments.some((seg) => seg['aria-valuenow'] !== undefined);
};
// Construct a calendar date that reflects the values of each segment.
// If none of the segments have a value, return undefined.
const createCalendarDateFromSegments = (segments) => {
    const hasAnySegmentWithAValue = isPartialDate(segments);
    if (!hasAnySegmentWithAValue) {
        return undefined;
    }
    // This returns something that looks like [ {month: 12}, {day: 25}, {year: 2020} ].
    // Note: we use the aria-valuenow to get the current value as a number (not string).
    const segmentValues = segments.map((seg) => {
        return { [seg.type]: seg['aria-valuenow'] };
    });
    // Iterate over segmentValues and spread each value to get {month: 12, day:25, year: 2020}.
    const iterator = segmentValues.values();
    let cd = {};
    for (const segValue of iterator) {
        cd = { ...cd, ...segValue };
    }
    return cd;
};
// Find the current value for year.
const getYearValue = (segments) => {
    const yearState = findSegment$1(segments, 'year');
    return yearState['aria-valuenow'];
};
// Find the current value for month.
const getMonthValue = (segments) => {
    const monthState = findSegment$1(segments, 'month');
    return monthState['aria-valuenow'];
};
// Determine the aria-valuetext for the given month, which includes the month name.
const getMonthAria = (locale, month, year) => {
    const monthName = getMonthName(locale, month, year ?? '*', 'long');
    return `${month} - ${monthName}`;
};
// Return a copy of the ordered segments array.
const getOrderedSegments = (currentState) => {
    return [...currentState.orderedSegments];
};
// Replace the updated segment and return a new DateSegmentState[].
const replaceDateSegment = (existingSegments, updatedSegmentType, updatedSegment) => {
    return existingSegments.map((seg) => (seg.type === updatedSegmentType ? updatedSegment : seg));
};
// Return a new DateSegmentState[] that reflects changes across all segments.
// When you change the month this can affect the day, for instance.
const createDateSegmentStates = (existingSegments, orderedSegments, updatedSegmentType, updatedSegment, autoAdvance) => {
    const modifiedSegments = replaceDateSegment(existingSegments, updatedSegmentType, updatedSegment);
    let updatedSegments = modifiedSegments;
    if (updatedSegmentType === 'month' || updatedSegmentType === 'year') {
        // If month was changed, update the day as needed; this includes adjusting the
        // day value if it now exceeds the max number of days in the month.
        // If year was changed, that can also affect the max number of days (if month is February).
        const daySeg = findSegment$1(modifiedSegments, 'day');
        if (daySeg) {
            const monthValue = updatedSegmentType == 'month'
                ? updatedSegment['aria-valuenow']
                : getMonthValue(modifiedSegments);
            const yearValue = updatedSegmentType === 'year'
                ? updatedSegment['aria-valuenow']
                : getYearValue(modifiedSegments);
            const dayMax = getDaysInMonth(monthValue ?? '*', yearValue ?? '*');
            const currentDay = daySeg['aria-valuenow'];
            const dayValue = !!currentDay && currentDay > dayMax ? dayMax : currentDay;
            const dayValueStr = !!dayValue ? numberToString(dayValue) : undefined;
            const updatedDaySeg = {
                ...daySeg,
                'aria-valuemax': dayMax,
                'aria-valuenow': dayValue,
                'aria-valuetext': dayValueStr,
                text: dayValueStr
            };
            updatedSegments = replaceDateSegment(modifiedSegments, 'day', updatedDaySeg);
        }
    }
    // If the updatedSegment is complete, automatically select the next segment.
    updatedSegments =
        updatedSegment.isComplete && autoAdvance
            ? selectNext(updatedSegments, orderedSegments)
            : updatedSegments;
    return updatedSegments;
};
// Construct a new DateFieldState from a set of updated segments.
const createDateFieldStateFromSegments = (currentState, updatedSegments) => {
    return {
        currentDate: createCalendarDateFromSegments(updatedSegments),
        isCompleteDate: isDateComplete(updatedSegments),
        isDateSelected: currentState.isDateSelected,
        isPartialDate: isPartialDate(updatedSegments),
        orderedSegments: getOrderedSegments(currentState),
        segments: updatedSegments
    };
};
// Construct a new DateFieldState given an updated segment, which may affect other segments.
const createDateFieldState = (currentState, updatedSegmentType, updatedSegment, autoAdvance = true) => {
    const updatedSegments = createDateSegmentStates(currentState.segments, currentState.orderedSegments, updatedSegmentType, updatedSegment, autoAdvance);
    return createDateFieldStateFromSegments(currentState, updatedSegments);
};
// Return a new copy of the segment with the value cleared.
const clearSegment = (segmentState) => {
    return {
        ...segmentState,
        'aria-valuetext': undefined,
        'aria-valuenow': undefined,
        text: undefined,
        isComplete: false
    };
};
// Return a new copy of segments with all values cleared and aria-valuemax adjusted.
const clearDate = (segments) => {
    return segments.map((segmentState) => {
        const cleared = clearSegment(segmentState);
        const valueMax = cleared.type === 'year'
            ? MAX_ISO_YEAR
            : cleared.type === 'month'
                ? getMonthsInYear('*')
                : getDaysInMonth('*', '*');
        return { ...cleared, 'aria-valuemax': valueMax };
    });
};
// Return a new copy of the segment with updated values.
const updateSegment = (segmentType, segmentState, action, segments) => {
    const actionText = action.data?.text;
    const hasLeadingZero = action.data?.hasLeadingZero;
    const locale = action.data?.locale;
    const minValue = segmentState['aria-valuemin'];
    const maxValue = segmentState['aria-valuemax'];
    const wasComplete = segmentState.isComplete;
    // If the segment was already complete, replace any existing text with actionText.
    // Otherwise append actionText onto existing text to get the requested string.
    // For instance if the existing text is '1' and actionText (i.e. that the user typed)
    // is '2' then requestedValStr is '12'.
    const requestedValStr = wasComplete ? actionText : segmentState.text + actionText;
    // If the requested value is out of range, discard the existing text/value and only
    // keep the new one. Check if the segment is complete.
    const requestedVal = stringToNumber(requestedValStr);
    const inRange = withinRange(requestedVal, minValue, maxValue);
    const newValStr = inRange ? requestedValStr : actionText;
    const newVal = inRange ? requestedVal : stringToNumber(actionText);
    const isComplete = isSegmentComplete(newVal, maxValue) || (!!hasLeadingZero && segmentType !== 'year');
    // For month changes, aria-valuetext includes the month name.
    const ariaValueText = segmentType === 'month'
        ? getMonthAria(locale, newVal, getYearValue(segments))
        : newValStr;
    // Create a new segment state that reflects the updated value.
    return {
        ...segmentState,
        'aria-valuetext': ariaValueText,
        'aria-valuenow': newVal,
        text: newValStr,
        isComplete
    };
};
// Return a new DateSegmentState[] where the specified segment is selected, all others cleared.
const selectSegment = (segments, segmentType) => {
    return segments.map((seg) => {
        return { ...seg, isSelected: seg.type === segmentType ? true : false };
    });
};
// Return a new DateSegmentState[] where the first segment is selected.
const selectFirst = (segments, orderedSegments) => {
    return selectSegment(segments, orderedSegments[0]);
};
// Find the index of the selected segment in the ordered list; return -1 if there is no selection.
const getSelectedSegmentIndex = (segments, orderedSegments) => {
    const sel = segments.find((seg) => seg.isSelected === true);
    return sel === undefined ? -1 : orderedSegments.findIndex((type) => type === sel.type);
};
// Convenience function to mark the selected segment complete.
const markSelectedSegmentComplete = (segments) => {
    return segments.map((seg) => (seg.isSelected ? { ...seg, isComplete: true } : seg));
};
// Select the segment following the one that is currently selected.
const selectNext = (segments, orderedSegments) => {
    const selectedIndex = getSelectedSegmentIndex(segments, orderedSegments);
    const max = orderedSegments.length - 1;
    // If we're already at the last position, do nothing. Note if nothing was currently selected
    // then selectedIndex is -1. The first segment will be selected.
    return selectedIndex === max
        ? segments
        : selectSegment(markSelectedSegmentComplete(segments), orderedSegments[selectedIndex + 1]);
};
// Select the segment prior to the one that is currently selected.
const selectPrevious = (segments, orderedSegments) => {
    const selectedIndex = getSelectedSegmentIndex(segments, orderedSegments);
    return selectedIndex === 0
        ? segments
        : selectedIndex === -1
            ? selectFirst(segments, orderedSegments)
            : selectSegment(markSelectedSegmentComplete(segments), orderedSegments[selectedIndex - 1]);
};
// Return a new DateSegmentState[] where all segments are unselected and any values are
// marked complete. We want to do this when the user commits the DateField value (on blur).
const clearSelectionAndComplete = (segments) => {
    return segments.map((seg) => {
        return { ...seg, isSelected: false, isComplete: !!seg.text };
    });
};
// Return a new DateSegmentState[] where all segments are unselected.
const clearSelection = (segments) => {
    return segments.map((seg) => {
        return { ...seg, isSelected: false };
    });
};
// Return a new DateFieldState where the entire date is selected if the date is complete,
// or the first segment is selected.
const selectDateOrSegment = (currentState) => {
    if (currentState.isCompleteDate) {
        return createDateFieldStateWithSelectedDate(currentState, clearSelection(currentState.segments), true);
    }
    else {
        const updatedSegments = selectFirst(currentState.segments, currentState.orderedSegments);
        return createDateFieldStateFromSegments(currentState, updatedSegments);
    }
};
// Create a new DateFieldState from the updatedSegments and isDateSelected params.
const createDateFieldStateWithSelectedDate = (currentState, updatedSegments, isDateSelected) => {
    return {
        currentDate: createCalendarDateFromSegments(updatedSegments),
        isCompleteDate: isDateComplete(updatedSegments),
        isDateSelected,
        isPartialDate: isPartialDate(updatedSegments),
        orderedSegments: getOrderedSegments(currentState),
        segments: updatedSegments
    };
};
const YEAR_HOME_VALUE = 1900;
const YEAR_END_VALUE = 2100;
// If a segment is empty, use today's date as a starting point for any step or page action.
const getDefaultSegmentValue = (segmentType) => {
    const { year: yearDefault, month: monthDefault, day: dayDefault } = getTodayAsCalendarDate();
    const defaults = { year: yearDefault, month: monthDefault, day: dayDefault };
    return defaults[segmentType];
};
// Get the minimum value for the segment.
const getHomeSegmentValue = (segmentType, segmentState) => {
    return segmentType === 'year' ? YEAR_HOME_VALUE : segmentState['aria-valuemin'];
};
// Get the maximum value for the segment (for year, this is YEAR_END_VALUE).
const getEndSegmentValue = (segmentType, segmentState) => {
    return segmentType === 'year' ? YEAR_END_VALUE : segmentState['aria-valuemax'];
};
// Return the result of stepping currentValue in the requested direction, taking into account min and max.
const getSteppedSegmentValue = (currentValue, direction, min, max) => {
    const newValue = direction === 'increase'
        ? currentValue + 1 > max
            ? min
            : currentValue + 1
        : currentValue - 1 < min
            ? max
            : currentValue - 1;
    return newValue;
};
// Return the result of paging the value up or down, taking into account min and max.
const getPagedSegmentValue = (currentValue, direction, min, max, segmentType) => {
    const step = segmentType === 'month' ? 2 : segmentType === 'year' ? 5 : 7;
    const newValue = direction === 'increase'
        ? currentValue + step > max
            ? (currentValue + step) % max
            : currentValue + step
        : currentValue - step < min
            ? currentValue - step + max
            : currentValue - step;
    return newValue;
};
// Create a new segment with an updated value from a keyboard action such as step, page, Home, or End.
const createSegmentFromKeyboardAction = (newVal, locale, segmentType, segmentState, segments) => {
    const newValStr = numberToString(newVal);
    // For month changes, aria-valuetext includes the month name.
    const ariaValueText = segmentType === 'month'
        ? getMonthAria(locale, newVal, getYearValue(segments))
        : newValStr;
    // Create a new segment state that reflects the updated value.
    // After any keyboard action, the value is complete so that if the user types anything,
    // it will replace the stepped value.
    return {
        ...segmentState,
        'aria-valuetext': ariaValueText,
        'aria-valuenow': newVal,
        text: newValStr,
        isComplete: true
    };
};
// Set the segment to its minimum value.
const goToHome = (segmentType, segmentState, segments, locale) => {
    const newValue = getHomeSegmentValue(segmentType, segmentState);
    return createSegmentFromKeyboardAction(newValue, locale, segmentType, segmentState, segments);
};
// Set the segment to its maximum value.
const goToEnd = (segmentType, segmentState, segments, locale) => {
    const newValue = getEndSegmentValue(segmentType, segmentState);
    return createSegmentFromKeyboardAction(newValue, locale, segmentType, segmentState, segments);
};
// Step or page a segment's value.
const doStepOrPage = (segmentType, segmentState, segments, type, direction, locale) => {
    const valueNow = segmentState['aria-valuenow'];
    const min = segmentState['aria-valuemin'];
    const max = segmentState['aria-valuemax'];
    const newValue = valueNow === undefined
        ? getDefaultSegmentValue(segmentType)
        : type === 'page'
            ? getPagedSegmentValue(valueNow, direction, min, max, segmentType)
            : getSteppedSegmentValue(valueNow, direction, min, max);
    return createSegmentFromKeyboardAction(newValue, locale, segmentType, segmentState, segments);
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that returns a DateFieldState and a dispatch method to request changes to that state.
 */
const useDateField = ({ ariaLabels, dateMasks, granularity, locale, value: currentValue }) => {
    // Construct an ordered list of the editable segments, i.e. ['month', 'day', 'year'].
    const fdm = dateMasks.filter(({ type }) => type !== 'literal');
    const orderedSegments = fdm.map(({ type }) => type);
    // Derive some data from currentValue that will become part of our initial state.
    const yearValue = currentValue?.year;
    const monthValue = currentValue?.month;
    const dayValue = currentValue?.day;
    const monthMax = getMonthsInYear(yearValue ?? '*');
    const dayMax = getDaysInMonth(monthValue ?? '*', yearValue ?? '*');
    const isCompleteDate = !!yearValue && !!monthValue && (granularity === 'month' || !!dayValue);
    const isPartialDate = !!yearValue || !!monthValue || !!dayValue;
    const yearValueStr = yearValue ? numberToString(yearValue) : undefined;
    const monthValueStr = monthValue ? numberToString(monthValue) : undefined;
    const dayValueStr = dayValue ? numberToString(dayValue) : undefined;
    const monthAria = monthValue ? getMonthAria(locale, monthValue, yearValue) : undefined;
    const daySeg = [
        {
            type: 'day',
            'aria-label': ariaLabels.day,
            'aria-valuemin': MIN_ISO_DAY,
            'aria-valuemax': dayMax,
            'aria-valuenow': dayValue,
            'aria-valuetext': dayValueStr,
            isComplete: !!dayValue,
            isSelected: false,
            text: dayValueStr
        }
    ];
    // Create state for each editable segment of a date, i.e. year, month, or day.
    const editableSegments = [
        {
            type: 'year',
            'aria-label': ariaLabels.year,
            'aria-valuemin': MIN_ISO_YEAR,
            'aria-valuemax': MAX_ISO_YEAR,
            'aria-valuenow': yearValue,
            'aria-valuetext': yearValueStr,
            isComplete: !!yearValue,
            isSelected: false,
            text: yearValueStr
        },
        {
            type: 'month',
            'aria-label': ariaLabels.month,
            'aria-valuemin': MIN_ISO_MONTH,
            'aria-valuemax': monthMax,
            'aria-valuenow': monthValue,
            'aria-valuetext': monthAria,
            isComplete: !!monthValue,
            isSelected: false,
            text: monthValueStr
        },
        ...(granularity === 'day' ? daySeg : [])
    ];
    // Create the initial state to pass to our reducer.
    const initialState = {
        currentDate: currentValue,
        isCompleteDate,
        isDateSelected: false,
        isPartialDate,
        orderedSegments,
        segments: editableSegments
    };
    const [state, dispatch] = useReducer(dateReducer, initialState);
    // currentValue is the controlled value passed from the parent.
    const lastValueFromParentRef = useRef(currentValue);
    const dateResetRef = useRef(false);
    // If a new value is being pushed from the parent, and that value differs from
    // the current value of the reducer, then this is a programmatic update
    // and we need to call 'reset' to update the reducer state. Otherwise, the only
    // time the reducer state is updated from the value is on mount.
    if (calendarDatesAreDifferent(lastValueFromParentRef.current, currentValue)) {
        lastValueFromParentRef.current = currentValue;
        if (calendarDatesAreDifferent(currentValue, state.currentDate)) {
            dispatch({ actionType: 'reset', data: initialState });
            dateResetRef.current = true;
        }
    }
    return { dateResetRef, dispatch, state };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function isMobile() {
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}
/**
 * A hook that creates various handlers and manages effects for a DateField.
 */
const useDateFieldHandlers = ({ dateResetRef, direction, dispatch, groupRef, isDisabled, isFocused, isInputFocused, onCommit, onInput, state, value: currentValue }) => {
    const { tabbableModeProps } = useTabbableMode();
    const { tabIndex: tabbableModeIndex } = tabbableModeProps;
    const anySegmentSelected = state.segments.some((segment) => !!segment.isSelected);
    // If any segment is selected, it is contenteditable=true and it has the focus. If you shift-Tab, you will
    // land on the outer div (DateField) first meaning it takes 2 shift-tab keys to get the previous element.
    // To prevent this, if any segment is selected the tabindex on the div is set to -1.
    // We also need to set tabindex to -1 for the disabled case, since we are dealing with a div instead
    // of an intrinsic input and have to handle it directly.
    const updatedTabIndex = tabbableModeIndex === -1 || anySegmentSelected || isDisabled ? -1 : 0;
    // Keep track of the last changed and last committed date values.
    const lastDateRef = useRef(state.currentDate);
    const lastCommittedDateRef = useRef(state.currentDate);
    // Keep track whether the date was cleared.
    const dateClearedRef = useRef(false);
    const lastFocusedRef = useRef(!!isFocused);
    // If the value was programmatically changed (see useDateField.ts), then update the
    // last changed and last committed date refs to stay in sync.
    // currentValue is the controlled value passed from the parent.
    if (dateResetRef.current) {
        lastDateRef.current = currentValue;
        lastCommittedDateRef.current = currentValue;
    }
    // Handle requested segment changes by calling the reducer dispatch function.
    const onChange = useCallback((action) => {
        dispatch(action);
    }, [dispatch]);
    // If the user clicked on a segment, dispatch a request to select it.
    // If they clicked on the date field itself, select the first segment.
    const onClick = useCallback((e) => {
        const segmentType = e.target.getAttribute('data-segment');
        !!segmentType
            ? dispatch({ actionType: 'selectSegment', data: { type: segmentType } })
            : dispatch({ actionType: 'selectFirst' });
    }, [dispatch]);
    // If complete, select the date.
    const selectAll = useCallback((isGroupFocus = true) => {
        if (state.isCompleteDate) {
            dispatch({ actionType: 'selectDateOrSegment' });
            // Focus can end up in different places depending on if the user selected a segment
            // first (via click or arrow key), and then did select all. To make shift-tabbing
            // consistent in all cases, set focus to the group when selecting the date.
            isGroupFocus && groupRef?.current?.focus();
        }
    }, [dispatch, groupRef, state.isCompleteDate]);
    const onDoubleClick = useCallback(() => {
        selectAll();
    }, [selectAll]);
    const onDoubleTap = useCallback((e) => {
        const segmentType = e.target.getAttribute('data-segment');
        // Only do select all if a segment was double tapped, which means the
        // mobile keyboard will stay up.
        !!segmentType && selectAll(false);
    }, [selectAll]);
    const doubleTapHandlers = useDoubleTap({ onDoubleTap: onDoubleTap, onSingleTap: onClick });
    // Handle arrow key navigation between segments. If no segment is currently selected, then select the first one.
    const onKeyDown = useCallback((event) => {
        if ((direction === 'ltr' && event.key === 'ArrowLeft') ||
            (direction === 'rtl' && event.key === 'ArrowRight')) {
            // Select the previous segment when pressing Left arrow (or Right arrow in rtl).
            dispatch({ actionType: 'selectPrevious' });
            event.stopPropagation();
        }
        else if ((direction === 'ltr' && event.key === 'ArrowRight') ||
            (direction === 'rtl' && event.key === 'ArrowLeft')) {
            // Select the next segment when pressing Right arrow (or Left arrow in rtl).
            dispatch({ actionType: 'selectNext' });
            event.stopPropagation();
        }
        else if ((isBackspaceOrDelete(event) || event.key === 'Backspace') &&
            state.isDateSelected) {
            // Clear the entire date.
            dispatch({ actionType: 'clearDate' });
            dateClearedRef.current = true;
            // Kill the event to prevent weird issue with placeholders getting deleted on iOS only.
            event.preventDefault();
            event.stopPropagation();
            event.stopImmediatePropagation();
        }
        else if (isSelectAll(event)) {
            selectAll();
            event.preventDefault();
            event.stopPropagation();
        }
        else if (event.key === 'Enter') {
            // Hitting Enter commits any changes.
            if (calendarDatesAreDifferent(lastCommittedDateRef.current, lastDateRef.current)) {
                // Call onCommit only if the value is different.
                onCommit?.({ value: lastDateRef.current });
                lastCommittedDateRef.current = lastDateRef.current;
            }
            event.preventDefault();
            event.stopPropagation();
        }
    }, [direction, dispatch, onCommit, selectAll, state.isDateSelected]);
    // Blurring commits the date value; clear any selected segments and mark non-empty segments as complete.
    useEffect(() => {
        if (lastFocusedRef.current && !isFocused) {
            dispatch({ actionType: 'commit' });
            if (calendarDatesAreDifferent(lastCommittedDateRef.current, lastDateRef.current)) {
                // Call onCommit only if the value is different.
                onCommit?.({ value: lastDateRef.current });
                lastCommittedDateRef.current = lastDateRef.current;
            }
        }
        lastFocusedRef.current = !!isFocused;
    }, [dispatch, isFocused, onCommit]);
    // If you try to call onInput from onChange directly it doesn't work. The value of
    // state.currentDate is from the current render, not the render *after* the dispatch.
    // So wait for the state to finish updating.
    useEffect(() => {
        if (calendarDatesAreDifferent(lastDateRef.current, state.currentDate) &&
            !dateResetRef.current) {
            const frozenDate = state.currentDate !== undefined
                ? Object.freeze({ ...state.currentDate })
                : state.currentDate;
            onInput({ value: frozenDate });
            lastDateRef.current = frozenDate;
        }
        dateResetRef.current = false;
    }, [onInput, state.currentDate, dateResetRef]);
    // The following is a simplified version of how we detect keyboard vs. mouse focus
    // in the useCollectionFocusRing hook. If the user tabs onto the field, we want to
    // automatically select the first segment.
    const recentPointerRef = useRef(false);
    const pointerDownTimerRef = useRef();
    const onPointerDown = () => {
        recentPointerRef.current = true;
        clearTimeout(pointerDownTimerRef.current);
        pointerDownTimerRef.current = setTimeout(() => {
            recentPointerRef.current = false;
        }, 200);
    };
    useEffect(() => {
        // If we receive focus that is *not* due to the user clicking in the field, i.e. the user
        // tabbed onto the field, then select the first segment.
        // Note: we cannot check isFocused because it includes the ? icon in compact UAD, and we don't
        // want the date selected when the help icon is focused.
        isInputFocused && !recentPointerRef.current && dispatch({ actionType: 'selectFirst' });
        // If we lose focus due to the keyboard, i.e. shift-tabbing onto the compact UAD help icon,
        // then 'commit' which will clear any selected segments.
        !isInputFocused && !recentPointerRef.current && dispatch({ actionType: 'commit' });
        recentPointerRef.current = false;
    }, [dispatch, isInputFocused]);
    const handlers = isMobile()
        ? { ...doubleTapHandlers, onKeyDown }
        : { onClick, onDoubleClick, onKeyDown, onPointerDown };
    return {
        dateClearedRef,
        dateFieldHandlers: isDisabled ? {} : handlers,
        segmentHandlers: isDisabled ? {} : { onChange },
        tabIndex: updatedTabIndex
    };
};

const findSegment = (segments, type) => {
    return segments.find((segment) => segment.type === type);
};
/**
 * Container for Segment children that represent different parts of a date with no time.
 */
const DateField = ({ 'aria-describedby': describedBy, 'aria-invalid': ariaInvalid, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, baseId, fieldRef, granularity = 'day', hasInsideLabel, isRequired, masks: dateMasks, onBlur, onCommit, onFocus, onInput, textAlign, value, variant = 'default' }) => {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const announceDateCleared = translations.inputDateMask_date_cleared();
    const labels = {
        month: translations.formControl_month(),
        day: translations.formControl_day(),
        year: translations.formControl_year()
    };
    const { direction, locale } = useUser();
    const { isDisabled, isFocused, isInputFocused } = useFormFieldContext();
    const hasValue = value !== undefined;
    // DateField is similar to TextFieldInput for styling. The main difference
    // is TextFieldInput renders a textarea or input and DateField renders a div, so the positioning with
    // padding is different. DateField and TextFieldInput are both the mainContent
    // of a TextField component.
    const { classes } = useComponentTheme(TextFieldInputRedwoodTheme, {
        type: 'notPassword',
        styleVariant: variant,
        textarea: 'notTextArea',
        input: 'notInput',
        div: 'isDiv',
        prefix: 'noPrefix',
        suffix: 'noSuffix',
        startContent: 'noStartContent',
        endContent: 'noEndContent',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        value: hasValue ? 'hasValue' : 'noValue',
        focused: isFocused ? 'isFocused' : 'notFocused',
        disabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    const compClasses = classNames([classes]);
    const { state, dispatch, dateResetRef } = useDateField({
        ariaLabels: labels,
        dateMasks,
        granularity,
        locale,
        value
    });
    const { isDateSelected, isPartialDate, segments: editableSegments } = state;
    const yearSegment = findSegment(editableSegments, 'year');
    const monthSegment = findSegment(editableSegments, 'month');
    const daySegment = granularity === 'day' ? findSegment(editableSegments, 'day') : undefined;
    const segmentsMap = {
        year: yearSegment,
        month: monthSegment,
        day: daySegment
    };
    const groupRef = useRef(null);
    const { dateClearedRef, dateFieldHandlers, segmentHandlers, tabIndex } = useDateFieldHandlers({
        dateResetRef,
        direction,
        dispatch,
        groupRef,
        isDisabled,
        isFocused,
        isInputFocused,
        onCommit,
        onInput,
        state,
        value
    });
    // Like other form components, don't show placeholders for inside labels unless focused.
    // This flag causes the segment placeholders to be hidden.
    const isHidden = value === undefined && hasInsideLabel && !isFocused;
    // If the date is complete, create a hidden accessible region with the full formatted date.
    const formattedDateStr = !state.isCompleteDate
        ? ''
        : formatFullCalendarDate(locale, state.currentDate, granularity);
    const formattedDateAriaId = `${baseId}-date`;
    const formattedDateAria = state.isCompleteDate ? (jsx(HiddenAccessible, { id: formattedDateAriaId, children: formattedDateStr })) : undefined;
    const ariaDescribedBy = state.isCompleteDate
        ? merge([describedBy, formattedDateAriaId])
        : describedBy;
    // Add an announcement to the live region if the date was cleared.
    // Note: we deliberately do not reset dateClearedRef because there are multiple
    // rerenders after clearing the date and we want to make sure the announcement
    // has time to be heard.
    const announceText = dateClearedRef.current ? announceDateCleared : '';
    // firstSegmentType is 'day', 'month', or 'year' and is used to determine
    // where to put the fieldRef.
    const firstSegmentType = state.orderedSegments[0];
    return (jsxs("div", { "aria-describedby": ariaDescribedBy, "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, class: compClasses, onFocusIn: onFocus, onFocusOut: onBlur, ref: groupRef, role: "group", tabIndex: tabIndex, ...dateFieldHandlers, children: [jsx(Flex, { direction: "row", wrap: "nowrap", justify: textAlign, children: dateMasks.map(({ type, value: placeholder }) => {
                    const segmentProps = type !== 'literal' ? segmentsMap[type] : {};
                    if (type === 'literal') {
                        return (jsx(LiteralSegment, { isHidden: isHidden, isHighlighted: isDateSelected, isPlaceholder: !isPartialDate, text: placeholder }));
                    }
                    else {
                        return (jsx(DateSegment, { inputRef: type === firstSegmentType ? fieldRef : undefined, isDisabled: isDisabled, isInvalid: !!ariaInvalid, isHidden: isHidden, isHighlighted: isDateSelected, isRequired: isRequired, placeholder: placeholder, type: type, ...segmentHandlers, ...segmentProps }));
                    }
                }) }), formattedDateAria, jsx(LiveRegion, { children: announceText })] }));
};

/**
 * Context used to indicate when the component is being used in
 * composition within some parent, such as InputDatePicker.
 */
const InputDateMaskContext = createContext({
    isInputDatePickerParent: false,
    isDropdownOpen: false
});
const useInputDateMaskContext = () => useContext(InputDateMaskContext);

/**
 * An InputDateMask allows you to edit the month, day, and year fields of a calendar date.
 */
const InputDateMask = forwardRef(({ 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, endContent, granularity = 'day', helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isReadonly: propIsReadonly, isRequired, isRequiredShown, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, mainFieldRef, messages, masks, testId, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, value, variant, onCommit, onInput }, ref) => {
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const { enabledElementRef, readonlyElementRef, focusProps, isFocused } = useFocusableTextField({ isDisabled, isReadonly, ref });
    const { isDropdownOpen, isInputDatePickerParent } = useInputDateMaskContext();
    const isComponentFocused = isFocused || (isInputDatePickerParent && isDropdownOpen);
    const { baseId, formFieldContext, inputProps, labelProps: origLabelProps, textFieldProps, userAssistanceProps } = useTextField({
        ariaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled,
        isFocused: isComponentFocused,
        isReadonly,
        isRequiredShown,
        labelEdge,
        messages,
        styleVariant: variant,
        userAssistanceDensity,
        value
    });
    // When using a div with role=group (i.e. DateField), you need aria-labelledby instead of a
    // for-id association with a label. Remove forId and id and use aria-labelledby instead.
    const { forId, ...labelProps } = origLabelProps;
    const { id, ...dateFieldProps } = inputProps;
    const ariaLabelledBy = labelProps.id;
    // Because we don't use for-id, clicking the label does not automatically focus the field.
    // We have to do it manually.
    const onClick = useCallback(() => {
        enabledElementRef.current?.focus();
    }, [enabledElementRef]);
    const labelComp = labelEdge !== 'none' ? (jsx(Label, { ...(!isDisabled && !isReadonly ? { onClick } : {}), ...labelProps, children: label })) : undefined;
    const fieldLabelProps = {
        label: labelEdge !== 'none' ? labelComp : undefined,
        labelEdge: labelEdge !== 'none' ? labelEdge : undefined,
        labelStartWidth: labelEdge !== 'none' ? labelStartWidth : undefined
    };
    const ariaLabel = labelEdge === 'none' ? label : undefined;
    const hasInsideLabel = label !== undefined && labelEdge === 'inside';
    const isInlineDensity = userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow';
    const inlineUserAssistance = isInlineDensity ? (isDisabled || isReadonly ? (
    // save space for user assistance if density is 'efficient', even though we don't
    // render user assistance for disabled or readonly fields
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const aRef = useRef(null);
    const anchorRef = mainFieldRef ?? aRef;
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: anchorRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    const { locale } = useUser();
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const monthPlaceholder = translations.inputDateMask_monthPlaceholder();
    const dayPlaceholder = translations.inputDateMask_dayPlaceholder();
    const yearPlaceholder = translations.inputDateMask_yearPlaceholder();
    // The DatePlaceholders type already ensures the masks contain the right placeholders,
    // for either full calendar dates or month-year dates. This check ensures the masks,
    // if provided, match the granularity. E.g. for granularity=month, you should pass
    // month and year placeholders, and a separator.
    if (masks &&
        ((granularity === 'day' && masks.length !== 5) ||
            (granularity === 'month' && masks.length !== 3))) {
        throw new Error('Specified masks must match the granularity');
    }
    const dateMasks = useMemo(() => {
        // Determine the locale specific placeholder masks and separators in the correct order
        // for the locale, unless a custom set of masks was passed in. Each mask represents a
        // placeholder for a segment of a date (i.e. mm/dd/yyyy). Memoize because we shouldn't
        // need to recreate this data often.
        const placeholderMasks = masks
            ? translateCustomMasks(masks, monthPlaceholder, dayPlaceholder, yearPlaceholder)
            : getDatePlaceholderMasks(locale, granularity, monthPlaceholder, dayPlaceholder, yearPlaceholder);
        return placeholderMasks;
    }, [masks, locale, granularity, dayPlaceholder, monthPlaceholder, yearPlaceholder]);
    if (isReadonly) {
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: anchorRef, testId: testId, mainContent: jsx(ReadonlyTextFieldInput, { "aria-describedby": dateFieldProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", elementRef: readonlyElementRef, textAlign: textAlign, value: value === undefined ? '' : formatShortCalendarDate(value, granularity, dateMasks), hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel }), ...fieldLabelProps }) }));
    }
    // The main content inside TextField is a DateField (not TextFieldInput) in this case.
    // We reuse the TextField building blocks and hooks, but recompose them.
    const mainContent = (jsx(DateField, { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledBy, baseId: baseId, fieldRef: enabledElementRef, granularity: granularity, hasInsideLabel: labelComp !== undefined && labelEdge === 'inside', isRequired: isRequired, masks: dateMasks, onCommit: onCommit, onInput: onInput, textAlign: textAlign, value: value, ...dateFieldProps }));
    return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(TextField, { columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, endContent: endContent, inlineUserAssistance: inlineUserAssistance, mainContent: mainContent, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, mainFieldRef: anchorRef, testId: testId, ...textFieldProps, ...fieldLabelProps }) }));
});

export { InputDateMask as I, InputDateMaskContext as a, useInputDateMaskContext as u };
//# sourceMappingURL=InputDateMask-7386adfe.js.map
