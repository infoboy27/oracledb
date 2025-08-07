/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { useState, useCallback, useReducer, useRef, useEffect, useImperativeHandle } from 'preact/hooks';
import { S as SvgCalendar } from './Calendar-101d4c71.js';
import { H as HiddenAccessible } from './HiddenAccessible-61197e7c.js';
import { I as IconButton } from './IconButton-37310d21.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import './logger-c92f309c.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import './Flex-24628925.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
import './LayerHost-45f545d7.js';
import './TransitionGroup-5fd80dc9.js';
import './MessagesContext-76544845.js';
import './HiddenAccessibleStyles.styles.css';
import './ComponentMessageStyles.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageBaseTheme.styles.css';
import './UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js';
import './Popup-8889a781.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { userAssistanceStyles, dropdownStyles } from './UNSAFE_InputDatePicker/themes/InputDatePickerDropdownStyles.css.js';
import { S as Sheet } from './Sheet-e4121f4a.js';
import { datePickerPropVars } from './UNSAFE_DatePicker/themes/DatePickerContract.css.js';
import { D as DatePicker } from './DatePicker-4356274b.js';
import { a as SectionedContent, S as StickyPositioningDropdown } from './SectionedContent-815e377a.js';
import { m as merge } from './stringUtils-16f617bc.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { u as useId } from './useId-03dbfdf0.js';
import './getFormatParse-8a357e1c.js';
import { c as calendarDatesAreDifferent } from './maskUtils-4bccc3d0.js';
import { w as isCompleteCalendarDate } from './calendarDateUtils-d586e25e.js';
import { a as InputDateMaskContext, I as InputDateMask } from './InputDateMask-7386adfe.js';

/**
 * Component that renders DatePicker either inside a dropdown or sheet; at small screen
 * widths, it renders inside a sheet. Additionally, when a dropdown is being shown beneath
 * the component, we also show any user assistance text or messages below the picker
 * because otherwise that information would be obscured from view. When a sheet is being
 * shown, it will always display UA and messages at the bottom of the sheet.
 */
const InputDatePickerDropdown = ({ anchorRef, assistiveText, dayFormatter, daysOutsideMonth, helpSourceLink, helpSourceText, isDisabled, isOpen, isReadonly, label, onClose, onCommit, max, messages, min, monthAndYearPicker, testId, todayButton, todayTimeZone, userAssistanceDensity, value }) => {
    // If the dropdown opens above the component, we don't want to show UA or messages.
    const [isDropdownAbove, setDropdownAbove] = useState(false);
    const [prevIsOpen, setPrevIsOpen] = useState(isOpen);
    const handleDropdownPosition = useCallback((data) => {
        setDropdownAbove(data.placement.startsWith('top'));
    }, []);
    // Reset the flag when the dropdown is closed.
    if (prevIsOpen !== isOpen) {
        setPrevIsOpen(isOpen);
        if (!isOpen) {
            setDropdownAbove(false);
        }
    }
    const sizeOptions = {
        isMaxWidthAdjusted: false,
        isMaxHeightAdjusted: true
    };
    // On mobile phones, the dropdown becomes a sheet.
    const shouldShowSheet = isPhone();
    const { datePicker_label } = useTranslationBundle('@oracle/oraclejet-preact');
    const datePickerAriaLabel = datePicker_label();
    const datePickerMainContent = (jsx(DatePicker, { dayFormatter: dayFormatter, daysOutsideMonth: daysOutsideMonth, onCommit: onCommit, max: max, min: min, 
        // for sheet, we want the width to grow to the width of the sheet, otherwise it will use the theme default.
        maxWidth: shouldShowSheet ? '100%' : undefined, 
        // for dropdown, we want a fixed width, so set width to the same var used for default maxWidth
        width: !shouldShowSheet ? datePickerPropVars.maxWidth : '100%', monthAndYearPicker: monthAndYearPicker, testId: testId, todayTimeZone: todayTimeZone, todayButton: todayButton, value: value }));
    const inlineUserAssistanceFooter = isOpen &&
        (!isDropdownAbove || shouldShowSheet) &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink || (messages && messages.length > 0)) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsx(FormFieldContext.Provider, { value: { isFocused: true }, children: jsx("div", { class: userAssistanceStyles, children: jsx(InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, userAssistanceDensity: userAssistanceDensity }) }) })) : undefined;
    const contentTestId = testId ? testId + (shouldShowSheet ? '_sheet' : '_dropdown') : undefined;
    // The same content is displayed either in a dropdown or sheet: date picker and inline UA.
    // Add styling to the dropdown to enforce a fixed width.
    const dropdownContent = (jsx("div", { class: dropdownStyles, children: jsx(SectionedContent, { "aria-label": datePickerAriaLabel, footer: inlineUserAssistanceFooter, hasFocusTrap: true, main: datePickerMainContent, role: "dialog", testId: contentTestId }) }));
    const dropdown = shouldShowSheet ? (jsx(Sheet, { initialFocus: "firstFocusable", isOpen: isOpen, onClose: onClose, children: jsx(SectionedContent, { "aria-label": datePickerAriaLabel, footer: inlineUserAssistanceFooter, hasFocusTrap: true, main: datePickerMainContent, role: "dialog", testId: contentTestId }) })) : (jsx(StickyPositioningDropdown, { anchorRef: anchorRef, initialFocus: "firstFocusable", isOpen: isOpen, onClose: onClose, onPosition: handleDropdownPosition, sizeOptions: sizeOptions, children: dropdownContent }));
    return dropdown;
};
const isPhone = () => {
    return getClientHints().deviceType === 'phone';
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
// If dateVal is a complete date, return it as a CalendarDateRequired
// otherwise return undefined.
const convertToCalendarDateRequired = (dateVal) => {
    return !dateVal || !isCompleteCalendarDate(dateVal)
        ? undefined
        : dateVal;
};
// Use a reducer function to manage InputDatePickerState.
const inputDatePickerReducer = (state, action) => {
    switch (action.type) {
        case 'dateChanged': {
            return {
                ...state,
                dateValue: action.data,
                completeDateValue: convertToCalendarDateRequired(action.data)
            };
        }
        case 'dateSelected': {
            return { ...state, dateValue: action.data, completeDateValue: action.data };
        }
        case 'reset': {
            return {
                completeDateValue: convertToCalendarDateRequired(action.data),
                dateValue: action.data
            };
        }
        default:
            return state;
    }
};
/**
 * useInputDatePickerState calls useReducer to determine the initial state. Any changes to that state
 * are managed by dispatching actions to the reducer function.
 */
const useInputDatePickerState = ({ value }) => {
    const [state, dispatch] = useReducer(inputDatePickerReducer, {
        completeDateValue: convertToCalendarDateRequired(value),
        dateValue: value
    });
    return { state, dispatch };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that provides handlers and other functionality for InputDatePicker.
 */
const useInputDatePicker = ({ onCommit, onInput, value: currentValue }) => {
    // Whether the dropdown is open.
    const [isOpen, setIsOpen] = useState(false);
    // Ref to the calendar icon button.
    const iconRef = useRef(null);
    // Ref to the InputDateMask component.
    const maskRef = useRef(null);
    // Keep track of whether the dropdown was just dismissed from an outside mousedown event.
    const outsideMousedownRef = useRef(false);
    const outsideMousedownTimerRef = useRef();
    // Keep track of whether the calendar icon is focused after a date is selected
    // and the date picker is closed.
    const calendarFocusAfterSelect = useRef(false);
    const calendarFocusAfterSelectTimerRef = useRef();
    // Keep track of the last date values passed to onInput and onCommit.
    const lastCommittedDateRef = useRef(currentValue);
    const lastDateRef = useRef(currentValue);
    // Keep track of the last controlled value passed from the parent, so we can detect a programmatic change.
    const lastValueFromParentRef = useRef(currentValue);
    // Keep track of whether a date was selected in the date picker.
    const dateSelectedRef = useRef(false);
    const { state, dispatch } = useInputDatePickerState({ value: currentValue });
    // If a new value is being pushed from the parent, and that value differs from
    // the current value of the reducer, then this is a programmatic update
    // and we need to call 'reset' to update the reducer state. Otherwise, the only
    // time the reducer state is updated from the value is on mount.
    if (calendarDatesAreDifferent(lastValueFromParentRef.current, currentValue)) {
        lastValueFromParentRef.current = currentValue;
        if (calendarDatesAreDifferent(currentValue, state.dateValue)) {
            dispatch({ type: 'reset', data: currentValue });
            lastDateRef.current = currentValue;
            lastCommittedDateRef.current = currentValue;
        }
    }
    // Reducer updates are async, so wait until the state updates and then call our callbacks.
    useEffect(() => {
        if (calendarDatesAreDifferent(state.dateValue, lastDateRef.current)) {
            onInput({ previousValue: lastDateRef.current, value: state.dateValue });
            lastDateRef.current = state.dateValue;
        }
        if (dateSelectedRef.current &&
            calendarDatesAreDifferent(state.dateValue, lastCommittedDateRef.current)) {
            onCommit?.({ previousValue: lastCommittedDateRef.current, value: state.dateValue });
            lastCommittedDateRef.current = state.dateValue;
            dateSelectedRef.current = false;
        }
    }, [onCommit, onInput, state.dateValue]);
    // Handle onInput from InputDateMask as segment values are being added or changed in the input field.
    // We wait for the state to update before calling onInput.
    const maskInputHandler = useCallback((detail) => {
        dispatch({ type: 'dateChanged', data: detail.value });
    }, [dispatch]);
    // Handle onCommit from InputDateMask, which is called when the user presses Enter or the field is blurred.
    const maskCommitHandler = useCallback(() => {
        // If the current date value differs from the last committed value, then call onCommit.
        if (calendarDatesAreDifferent(lastCommittedDateRef.current, state.dateValue)) {
            onCommit?.({ value: state.dateValue, previousValue: lastCommittedDateRef.current });
            lastCommittedDateRef.current = state.dateValue;
        }
    }, [onCommit, state.dateValue]);
    // Respond to onAction event from the calendar icon button. Toggles the date picker dropdown.
    const calendarIconActionHandler = useCallback(() => {
        // Only toggle the value of isOpen if we didn't just dismiss the dropdown.
        if (!outsideMousedownRef.current && !calendarFocusAfterSelect.current) {
            setIsOpen((prevIsOpen) => !prevIsOpen);
        }
        outsideMousedownRef.current = false;
        calendarFocusAfterSelect.current = false;
    }, []);
    const dropdownCloseHandler = useCallback((detail) => {
        // Keep track of when the dropdown is closed via outside mousedown, including when the calendar icon
        // is clicked. We need this in order to toggle visibility of the picker and dropdown.
        if (detail.reason === 'outsideMousedown') {
            outsideMousedownRef.current = true;
            clearTimeout(outsideMousedownTimerRef.current);
            // Clear the flag after a short delay to ensure the dropdown can be opened again.
            outsideMousedownTimerRef.current = setTimeout(() => {
                outsideMousedownRef.current = false;
            }, 200);
        }
        else if (detail.reason === 'dismissed' || detail.reason === 'keyboardDismissed') {
            // Focus the calendar icon when the dropdown is closed.
            iconRef.current?.focus();
        }
        setIsOpen(false);
    }, []);
    // Handle date selection in the picker.
    //   - Updates the value in state.
    //   - Closes the dropdown.
    //   - Sets focus to the date field.
    const datePickerCommitHandler = useCallback((detail) => {
        // Set focus to the calendar icon when a date is selected.
        iconRef.current?.focus();
        // If user is using the keyboard, date selection happens on keyDown.
        // If we transfer focus to the calendar icon, it then sees the corresponding
        // keyUp and thinks the button was triggered again (usePress reacts to
        // keyUp, not keyDown). Maintain a flag that prevents this from happening,
        // and clear it after a short delay in case selection was made with the mouse.
        // TODO: Investigate a better way to prevent the dropdown from reopening (JET-67580).
        calendarFocusAfterSelect.current = true;
        clearTimeout(calendarFocusAfterSelectTimerRef.current);
        calendarFocusAfterSelectTimerRef.current = setTimeout(() => {
            calendarFocusAfterSelect.current = false;
        }, 500);
        // Set a ref indicating a date was selected.
        dateSelectedRef.current = true;
        dispatch({ type: 'dateSelected', data: detail.value });
        setIsOpen(false);
    }, [dispatch]);
    return {
        calendarIconActionHandler,
        datePickerCommitHandler,
        dropdownCloseHandler,
        completeDateValue: state.completeDateValue,
        dateValue: state.dateValue,
        iconRef,
        isOpen,
        maskCommitHandler,
        maskInputHandler,
        maskRef
    };
};

/**
 * InputDatePicker allows users to enter or select a single date using a calendar interface.
 */
const InputDatePicker = forwardRef(({ 'aria-describedby': propDescribedBy, assistiveText, dayFormatter, daysOutsideMonth, helpSourceLink, helpSourceText, isDisabled, isReadonly, label, max, messages, min, monthAndYearPicker, todayTimeZone, todayButton, value, onCommit, onInput, testId, userAssistanceDensity: propUserAssistanceDensity, ...dateMaskProps }, ref) => {
    const { calendarIconActionHandler, datePickerCommitHandler, completeDateValue, dateValue, dropdownCloseHandler, iconRef, isOpen, maskCommitHandler, maskInputHandler, maskRef } = useInputDatePicker({
        onCommit,
        onInput,
        value
    });
    const mainFieldRef = useRef(null);
    const { inputDatePicker_selectDate, inputDatePicker_instruction } = useTranslationBundle('@oracle/oraclejet-preact');
    const calendarIconAriaLabel = inputDatePicker_selectDate();
    // We need this to determine if UA/messaging should be shown in the dropdown.
    const { userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    useImperativeHandle(ref, () => ({
        focus: () => {
            maskRef.current?.focus();
        },
        blur: () => {
            maskRef.current?.blur();
        }
    }));
    const maskFieldInstructionId = useId();
    const maskFieldInstructionText = inputDatePicker_instruction();
    const maskFieldInstruction = !isDisabled && !isReadonly ? (jsx(HiddenAccessible, { id: maskFieldInstructionId, isHidden: true, children: maskFieldInstructionText })) : undefined;
    const ariaDescribedBy = !isDisabled && !isReadonly
        ? merge([propDescribedBy, maskFieldInstructionId])
        : propDescribedBy;
    const endContent = (jsx(IconButton, { "aria-haspopup": "dialog", "aria-label": calendarIconAriaLabel, isDisabled: isDisabled, ref: iconRef, size: "sm", testId: testId ? testId + '_calendarIcon' : undefined, variant: "ghost", onAction: calendarIconActionHandler, children: jsx(SvgCalendar, {}) }));
    const shouldShowDropdown = isOpen;
    return (jsxs(Fragment, { children: [jsx(InputDateMaskContext.Provider, { value: { isDropdownOpen: isOpen, isInputDatePickerParent: true }, children: jsx(InputDateMask, { "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, endContent: endContent, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, label: label, onCommit: maskCommitHandler, onInput: maskInputHandler, mainFieldRef: mainFieldRef, messages: messages, testId: testId, ref: maskRef, userAssistanceDensity: propUserAssistanceDensity, value: dateValue, ...dateMaskProps }) }), maskFieldInstruction, shouldShowDropdown && (jsx(InputDatePickerDropdown, { anchorRef: mainFieldRef, assistiveText: assistiveText, dayFormatter: dayFormatter, daysOutsideMonth: daysOutsideMonth, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, isOpen: isOpen, label: label, onClose: dropdownCloseHandler, onCommit: datePickerCommitHandler, max: max, messages: messages, min: min, monthAndYearPicker: monthAndYearPicker, testId: testId ? testId + '_datePicker' : undefined, todayTimeZone: todayTimeZone, todayButton: todayButton, userAssistanceDensity: userAssistanceDensity, value: completeDateValue }))] }));
});

export { InputDatePicker as I };
//# sourceMappingURL=InputDatePicker-aa02a34c.js.map
