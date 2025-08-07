/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var hooks = require('preact/hooks');
var Calendar = require('./Calendar-b9385151.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var clientHints = require('./clientHints-9e411b6e.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
require('./logger-2b636482.js');
require('./TabbableModeContext-e99d527e.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');
require('./Flex-fbba4ad6.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');


require('./MessageFormattingUtils-42d84399.js');
require('./LayerHost-46e4d858.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');



require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./InputGroupContext-05f2a46f.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var UNSAFE_InputDatePicker_themes_InputDatePickerDropdownStyles_css = require('./UNSAFE_InputDatePicker/themes/InputDatePickerDropdownStyles.css.js');
var Sheet = require('./Sheet-a6267b5f.js');
var UNSAFE_DatePicker_themes_DatePickerContract_css = require('./UNSAFE_DatePicker/themes/DatePickerContract.css.js');
var DatePicker = require('./DatePicker-3be1de5c.js');
var SectionedContent = require('./SectionedContent-0c0f96fb.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var useId = require('./useId-6c0eeb27.js');
require('./getFormatParse-4a697b8f.js');
var maskUtils = require('./maskUtils-f03f9c47.js');
var calendarDateUtils = require('./calendarDateUtils-ca9bde6d.js');
var InputDateMask = require('./InputDateMask-f15d926d.js');

/**
 * Component that renders DatePicker either inside a dropdown or sheet; at small screen
 * widths, it renders inside a sheet. Additionally, when a dropdown is being shown beneath
 * the component, we also show any user assistance text or messages below the picker
 * because otherwise that information would be obscured from view. When a sheet is being
 * shown, it will always display UA and messages at the bottom of the sheet.
 */
const InputDatePickerDropdown = ({ anchorRef, assistiveText, dayFormatter, daysOutsideMonth, helpSourceLink, helpSourceText, isDisabled, isOpen, isReadonly, label, onClose, onCommit, max, messages, min, monthAndYearPicker, testId, todayButton, todayTimeZone, userAssistanceDensity, value }) => {
    // If the dropdown opens above the component, we don't want to show UA or messages.
    const [isDropdownAbove, setDropdownAbove] = hooks.useState(false);
    const [prevIsOpen, setPrevIsOpen] = hooks.useState(isOpen);
    const handleDropdownPosition = hooks.useCallback((data) => {
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
    const { datePicker_label } = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const datePickerAriaLabel = datePicker_label();
    const datePickerMainContent = (jsxRuntime.jsx(DatePicker.DatePicker, { dayFormatter: dayFormatter, daysOutsideMonth: daysOutsideMonth, onCommit: onCommit, max: max, min: min, 
        // for sheet, we want the width to grow to the width of the sheet, otherwise it will use the theme default.
        maxWidth: shouldShowSheet ? '100%' : undefined, 
        // for dropdown, we want a fixed width, so set width to the same var used for default maxWidth
        width: !shouldShowSheet ? UNSAFE_DatePicker_themes_DatePickerContract_css.datePickerPropVars.maxWidth : '100%', monthAndYearPicker: monthAndYearPicker, testId: testId, todayTimeZone: todayTimeZone, todayButton: todayButton, value: value }));
    const inlineUserAssistanceFooter = isOpen &&
        (!isDropdownAbove || shouldShowSheet) &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink || (messages && messages.length > 0)) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: { isFocused: true }, children: jsxRuntime.jsx("div", { class: UNSAFE_InputDatePicker_themes_InputDatePickerDropdownStyles_css.userAssistanceStyles, children: jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, userAssistanceDensity: userAssistanceDensity }) }) })) : undefined;
    const contentTestId = testId ? testId + (shouldShowSheet ? '_sheet' : '_dropdown') : undefined;
    // The same content is displayed either in a dropdown or sheet: date picker and inline UA.
    // Add styling to the dropdown to enforce a fixed width.
    const dropdownContent = (jsxRuntime.jsx("div", { class: UNSAFE_InputDatePicker_themes_InputDatePickerDropdownStyles_css.dropdownStyles, children: jsxRuntime.jsx(SectionedContent.SectionedContent, { "aria-label": datePickerAriaLabel, footer: inlineUserAssistanceFooter, hasFocusTrap: true, main: datePickerMainContent, role: "dialog", testId: contentTestId }) }));
    const dropdown = shouldShowSheet ? (jsxRuntime.jsx(Sheet.Sheet, { initialFocus: "firstFocusable", isOpen: isOpen, onClose: onClose, children: jsxRuntime.jsx(SectionedContent.SectionedContent, { "aria-label": datePickerAriaLabel, footer: inlineUserAssistanceFooter, hasFocusTrap: true, main: datePickerMainContent, role: "dialog", testId: contentTestId }) })) : (jsxRuntime.jsx(SectionedContent.StickyPositioningDropdown, { anchorRef: anchorRef, initialFocus: "firstFocusable", isOpen: isOpen, onClose: onClose, onPosition: handleDropdownPosition, sizeOptions: sizeOptions, children: dropdownContent }));
    return dropdown;
};
const isPhone = () => {
    return clientHints.getClientHints().deviceType === 'phone';
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
    return !dateVal || !calendarDateUtils.isCompleteCalendarDate(dateVal)
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
    const [state, dispatch] = hooks.useReducer(inputDatePickerReducer, {
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
    const [isOpen, setIsOpen] = hooks.useState(false);
    // Ref to the calendar icon button.
    const iconRef = hooks.useRef(null);
    // Ref to the InputDateMask component.
    const maskRef = hooks.useRef(null);
    // Keep track of whether the dropdown was just dismissed from an outside mousedown event.
    const outsideMousedownRef = hooks.useRef(false);
    const outsideMousedownTimerRef = hooks.useRef();
    // Keep track of whether the calendar icon is focused after a date is selected
    // and the date picker is closed.
    const calendarFocusAfterSelect = hooks.useRef(false);
    const calendarFocusAfterSelectTimerRef = hooks.useRef();
    // Keep track of the last date values passed to onInput and onCommit.
    const lastCommittedDateRef = hooks.useRef(currentValue);
    const lastDateRef = hooks.useRef(currentValue);
    // Keep track of the last controlled value passed from the parent, so we can detect a programmatic change.
    const lastValueFromParentRef = hooks.useRef(currentValue);
    // Keep track of whether a date was selected in the date picker.
    const dateSelectedRef = hooks.useRef(false);
    const { state, dispatch } = useInputDatePickerState({ value: currentValue });
    // If a new value is being pushed from the parent, and that value differs from
    // the current value of the reducer, then this is a programmatic update
    // and we need to call 'reset' to update the reducer state. Otherwise, the only
    // time the reducer state is updated from the value is on mount.
    if (maskUtils.calendarDatesAreDifferent(lastValueFromParentRef.current, currentValue)) {
        lastValueFromParentRef.current = currentValue;
        if (maskUtils.calendarDatesAreDifferent(currentValue, state.dateValue)) {
            dispatch({ type: 'reset', data: currentValue });
            lastDateRef.current = currentValue;
            lastCommittedDateRef.current = currentValue;
        }
    }
    // Reducer updates are async, so wait until the state updates and then call our callbacks.
    hooks.useEffect(() => {
        if (maskUtils.calendarDatesAreDifferent(state.dateValue, lastDateRef.current)) {
            onInput({ previousValue: lastDateRef.current, value: state.dateValue });
            lastDateRef.current = state.dateValue;
        }
        if (dateSelectedRef.current &&
            maskUtils.calendarDatesAreDifferent(state.dateValue, lastCommittedDateRef.current)) {
            onCommit?.({ previousValue: lastCommittedDateRef.current, value: state.dateValue });
            lastCommittedDateRef.current = state.dateValue;
            dateSelectedRef.current = false;
        }
    }, [onCommit, onInput, state.dateValue]);
    // Handle onInput from InputDateMask as segment values are being added or changed in the input field.
    // We wait for the state to update before calling onInput.
    const maskInputHandler = hooks.useCallback((detail) => {
        dispatch({ type: 'dateChanged', data: detail.value });
    }, [dispatch]);
    // Handle onCommit from InputDateMask, which is called when the user presses Enter or the field is blurred.
    const maskCommitHandler = hooks.useCallback(() => {
        // If the current date value differs from the last committed value, then call onCommit.
        if (maskUtils.calendarDatesAreDifferent(lastCommittedDateRef.current, state.dateValue)) {
            onCommit?.({ value: state.dateValue, previousValue: lastCommittedDateRef.current });
            lastCommittedDateRef.current = state.dateValue;
        }
    }, [onCommit, state.dateValue]);
    // Respond to onAction event from the calendar icon button. Toggles the date picker dropdown.
    const calendarIconActionHandler = hooks.useCallback(() => {
        // Only toggle the value of isOpen if we didn't just dismiss the dropdown.
        if (!outsideMousedownRef.current && !calendarFocusAfterSelect.current) {
            setIsOpen((prevIsOpen) => !prevIsOpen);
        }
        outsideMousedownRef.current = false;
        calendarFocusAfterSelect.current = false;
    }, []);
    const dropdownCloseHandler = hooks.useCallback((detail) => {
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
    const datePickerCommitHandler = hooks.useCallback((detail) => {
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
const InputDatePicker = compat.forwardRef(({ 'aria-describedby': propDescribedBy, assistiveText, dayFormatter, daysOutsideMonth, helpSourceLink, helpSourceText, isDisabled, isReadonly, label, max, messages, min, monthAndYearPicker, todayTimeZone, todayButton, value, onCommit, onInput, testId, userAssistanceDensity: propUserAssistanceDensity, ...dateMaskProps }, ref) => {
    const { calendarIconActionHandler, datePickerCommitHandler, completeDateValue, dateValue, dropdownCloseHandler, iconRef, isOpen, maskCommitHandler, maskInputHandler, maskRef } = useInputDatePicker({
        onCommit,
        onInput,
        value
    });
    const mainFieldRef = hooks.useRef(null);
    const { inputDatePicker_selectDate, inputDatePicker_instruction } = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const calendarIconAriaLabel = inputDatePicker_selectDate();
    // We need this to determine if UA/messaging should be shown in the dropdown.
    const { userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    hooks.useImperativeHandle(ref, () => ({
        focus: () => {
            maskRef.current?.focus();
        },
        blur: () => {
            maskRef.current?.blur();
        }
    }));
    const maskFieldInstructionId = useId.useId();
    const maskFieldInstructionText = inputDatePicker_instruction();
    const maskFieldInstruction = !isDisabled && !isReadonly ? (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: maskFieldInstructionId, isHidden: true, children: maskFieldInstructionText })) : undefined;
    const ariaDescribedBy = !isDisabled && !isReadonly
        ? stringUtils.merge([propDescribedBy, maskFieldInstructionId])
        : propDescribedBy;
    const endContent = (jsxRuntime.jsx(IconButton.IconButton, { "aria-haspopup": "dialog", "aria-label": calendarIconAriaLabel, isDisabled: isDisabled, ref: iconRef, size: "sm", testId: testId ? testId + '_calendarIcon' : undefined, variant: "ghost", onAction: calendarIconActionHandler, children: jsxRuntime.jsx(Calendar.SvgCalendar, {}) }));
    const shouldShowDropdown = isOpen;
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(InputDateMask.InputDateMaskContext.Provider, { value: { isDropdownOpen: isOpen, isInputDatePickerParent: true }, children: jsxRuntime.jsx(InputDateMask.InputDateMask, { "aria-describedby": ariaDescribedBy, assistiveText: assistiveText, endContent: endContent, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, label: label, onCommit: maskCommitHandler, onInput: maskInputHandler, mainFieldRef: mainFieldRef, messages: messages, testId: testId, ref: maskRef, userAssistanceDensity: propUserAssistanceDensity, value: dateValue, ...dateMaskProps }) }), maskFieldInstruction, shouldShowDropdown && (jsxRuntime.jsx(InputDatePickerDropdown, { anchorRef: mainFieldRef, assistiveText: assistiveText, dayFormatter: dayFormatter, daysOutsideMonth: daysOutsideMonth, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isDisabled: isDisabled, isReadonly: isReadonly, isOpen: isOpen, label: label, onClose: dropdownCloseHandler, onCommit: datePickerCommitHandler, max: max, messages: messages, min: min, monthAndYearPicker: monthAndYearPicker, testId: testId ? testId + '_datePicker' : undefined, todayTimeZone: todayTimeZone, todayButton: todayButton, userAssistanceDensity: userAssistanceDensity, value: completeDateValue }))] }));
});

exports.InputDatePicker = InputDatePicker;
//# sourceMappingURL=InputDatePicker-005c03d0.js.map
