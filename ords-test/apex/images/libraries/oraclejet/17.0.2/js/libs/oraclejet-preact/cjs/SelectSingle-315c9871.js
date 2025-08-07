/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Label = require('./Label-d9ad059f.js');
var hooks = require('preact/hooks');
var compat = require('preact/compat');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
require('./Flex-fbba4ad6.js');
require('./FormContext-9452bd30.js');
var useFormContext = require('./useFormContext-4c3091dc.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');

require('./logger-2b636482.js');
require('./UNSAFE_TextField/themes/TextFieldStyles.css.js');




require('./UNSAFE_TextField/themes/redwood/TextFieldVariants.css.js');


require('./UNSAFE_RadioItem/themes/redwood/RadioVariants.css.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./UNSAFE_TextField/themes/FormLayoutStyles.css.js');



require('./UNSAFE_Checkbox/themes/redwood/CheckboxVariants.css.js');
require('./InputGroupContext-05f2a46f.js');
require('./LayerHost-46e4d858.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');

var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');
var CompactUserAssistance = require('./CompactUserAssistance-f88519f9.js');
require('./useTooltipControlled-706a3651.js');
var preact = require('preact');

require('./Popup-881aae20.js');


require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useFocusableTextField = require('./useFocusableTextField-c18d39c2.js');
var useLoadingIndicatorTimer = require('./useLoadingIndicatorTimer-128b4b14.js');
var useTextField = require('./useTextField-3ce8f0d0.js');
var Separator = require('./Separator-85962472.js');
var useSelectCommon = require('./useSelectCommon-8aaf62bd.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var CancelS = require('./CancelS-54815d5d.js');
require('./useAccessibleContext-c49d8d1b.js');
require('./textAlign-f41f49db.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');

require('./UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputVariants.css.js');
var TextField = require('./TextField-0f4e945f.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var View = require('./View-011404a7.js');
var useEffectEvent = require('./useEffectEvent-9bf8acf6.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var keyboardUtils = require('./keyboardUtils-f835e1ee.js');

function SelectSingleDesktopDropdown({ assistiveText, currentKey, data, dropdownId, dropdownRef, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isDisabled, isDropdownAbove, isEmptyResults, isOpen, isReadonly, isUserFiltering, itemRenderer, itemText, label, mainFieldRef, onAddToListAction, onAdvancedSearchAction, onAutoDismiss, onCurrentKeyChange, onItemAction, onLoadRange, onPosition, searchText, selectedKeys, userAssistanceDensity }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const dropdownInlineUserAssistance = isOpen &&
        !isDropdownAbove &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsxRuntime.jsx(useSelectCommon.DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity }) })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown || isAdvancedSearchShown ? undefined : (jsxRuntime.jsx(useSelectCommon.EmptyResults, {}))) : (jsxRuntime.jsx(useSelectCommon.DefaultList, { "aria-label": label ?? '', currentItemVariant: "highlight", currentKey: currentKey, data: data, itemRenderer: itemRenderer, itemText: itemText, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, searchText: isUserFiltering ? searchText : undefined, selectedKeys: selectedKeys, selectionMode: "single" }));
    const addToListContent = isAddToListShown ? (jsxRuntime.jsx(useSelectCommon.LinkItem, { isHighlighted: isEmptyResults, onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    const advancedSearchContent = isAdvancedSearchShown ? (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [!isEmptyResults && (jsxRuntime.jsx("div", { onMouseDown: useSelectCommon.preventDefault, children: jsxRuntime.jsx(Separator.Separator, {}) })), jsxRuntime.jsx(useSelectCommon.LinkItem, { isHighlighted: isEmptyResults, onAction: onAdvancedSearchAction, children: translations.select_moreSearchOptions() })] })) : undefined;
    return (jsxRuntime.jsxs(useSelectCommon.Dropdown, { anchorRef: mainFieldRef, dropdownRef: dropdownRef, id: dropdownId, isOpen: isOpen, onAutoDismiss: onAutoDismiss, onPosition: onPosition, children: [jsxRuntime.jsxs(useSelectCommon.DropdownList, { hasBottomGap: dropdownInlineUserAssistance === undefined, isLoading: data === null, children: [dropdownListContent, addToListContent, advancedSearchContent] }), dropdownInlineUserAssistance] }));
}

function SelectSingleField({ children, hasInsideLabel, isBackButtonShown, isClearButtonShown, isDropdownArrowShown, onBackButtonClick, onClearButtonClick, onDropdownArrowClick, ...passThroughTextFieldProps }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const { isDisabled, isLoading } = useFormFieldContext.useFormFieldContext();
    const startContent = isBackButtonShown ? (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": translations.selectMultiple_back(), size: "xs", variant: "ghost", onAction: onBackButtonClick, children: jsxRuntime.jsx(CancelS.SvgNavLeft, {}) })) : null;
    const endContent = isLoading ? undefined : (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [isClearButtonShown && (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": translations.formControl_clear(), size: "sm", variant: "ghost", onAction: onClearButtonClick, children: jsxRuntime.jsx(CancelS.SvgCancelS, {}) })), isDropdownArrowShown && (jsxRuntime.jsx(useSelectCommon.DropdownArrow, { isDisabled: isDisabled, onClick: onDropdownArrowClick, testId: `${passThroughTextFieldProps.testId}_dropdownarrow` }))] }));
    return (jsxRuntime.jsx(TextField.TextField, { startContent: startContent, mainContent: children, endContent: endContent, ...passThroughTextFieldProps }));
}

function SelectSingleFieldInput({ displayValue, isAddToListShown, isAdvancedSearchShown, isUserFiltering, liveRegionText, userInput, virtualKeyboard, ...passThroughTextFieldInputProps }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const addToListAccText = translations.select_addToListAvailable();
    const advancedSearchAccText = translations.select_moreSearchOptionsAvailable();
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(TextFieldInput.TextFieldInput, { ...passThroughTextFieldInputProps, hasEndContent: true, "aria-autocomplete": "list", autoComplete: "off", role: "combobox", spellcheck: false, type: virtualKeyboard === 'auto' ? 'search' : virtualKeyboard, value: isUserFiltering ? userInput : displayValue }), jsxRuntime.jsx(LiveRegion.LiveRegion, { children: liveRegionText }), isAddToListShown ? jsxRuntime.jsx(LiveRegion.LiveRegion, { children: addToListAccText }) : undefined, isAdvancedSearchShown ? jsxRuntime.jsx(LiveRegion.LiveRegion, { children: advancedSearchAccText }) : undefined] }));
}

function useMobileDropdown({ clearValue, displayValue, inputRef, isDropdownOpen, userInput, setDropdownOpen, stopFiltering, setUserInput }) {
    // Create a ref for the input in the dropdown
    const dropdownInputRef = hooks.useRef(null);
    const closeDropdown = hooks.useCallback(() => {
        setDropdownOpen(false);
        // stop filtering before closing the dropdown
        stopFiltering();
        // revert the focus back to the main field
        inputRef.current?.focus();
    }, [inputRef, setDropdownOpen, stopFiltering]);
    const onBackButtonClick = hooks.useCallback(() => {
        closeDropdown();
    }, [closeDropdown]);
    const onClearButtonClick = hooks.useCallback(() => {
        // reset the user filter and the value of the component
        stopFiltering();
        // clear the value but do not close the dropdown
        clearValue(false);
        // set focus to the dropdown input field
        dropdownInputRef.current?.focus();
    }, [clearValue, stopFiltering]);
    const wasDropdownOpen = hooks.useRef(isDropdownOpen);
    hooks.useEffect(() => {
        // if the dropdown is open, ignore any valueItems update
        if (isDropdownOpen) {
            // this dropdown is opened now, so set the focus on the input field
            setTimeout(() => dropdownInputRef.current?.focus(), 0);
        }
        wasDropdownOpen.current = isDropdownOpen;
    }, [isDropdownOpen]);
    const isInitialRender = hooks.useRef(true);
    if (isInitialRender.current) {
        isInitialRender.current = false;
        setUserInput(displayValue);
    }
    return {
        selectSingleFieldInputProps: {
            displayValue: userInput ?? '',
            hasEmptyLabel: false,
            hasInsideLabel: true,
            inputRef: dropdownInputRef,
            isUserFiltering: true,
            removeIcon: 'always',
            userInput
        },
        selectSingleFieldProps: {
            hasInsideLabel: true,
            isBackButtonShown: true,
            isClearButtonShown: !useSelectCommon.isSearchTextEmptyOrUndefined(userInput) || !useSelectCommon.isSearchTextEmptyOrUndefined(displayValue),
            isDropdownArrowShown: false,
            styleVariant: 'embedded',
            onBackButtonClick,
            onClearButtonClick
        }
    };
}

function SelectSingleMobileDropdown({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, assistiveText, clearValue, currentKey, data, displayValue, dropdownId, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isEmptyResults, isFocused, isLoading, isOpen = false, isRequired, isUserFiltering, itemRenderer, itemText, label, liveRegionText, mainFieldInputRef, onAddToListAction, onAdvancedSearchAction, onCurrentKeyChange, onFieldBlur, onFieldFocus, onFieldInput, onFieldKeyDown, onFieldKeyUp, onItemAction, onLoadRange, placeholder, propIsLoading, searchText, selectedKeys, setDropdownOpen, setUserInput, stopFiltering, textAlign, userAssistanceDensity, userInput, virtualKeyboard }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
        ariaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled: false,
        isFocused,
        isLoading,
        isReadonly: false,
        isRequiredShown: false,
        labelEdge: 'inside',
        styleVariant: 'default',
        value: ''
    });
    const { selectSingleFieldInputProps, selectSingleFieldProps } = useMobileDropdown({
        clearValue,
        displayValue,
        inputRef: mainFieldInputRef,
        isDropdownOpen: isOpen,
        setDropdownOpen,
        setUserInput,
        stopFiltering,
        userInput
    });
    // JET-54256 - inside label animates up on initial display with selected value
    // If we're waiting for the selected values to load, the component should look like it
    // has a value in the meantime.
    // Use the original propIsLoading instead of isLoading because we don't want to delay
    // the inside label position by a timer like we do the progressive loading indicator.
    formFieldContext.hasValue = propIsLoading || formFieldContext.hasValue;
    const mobileDropdownFieldLabelProps = {
        label: jsxRuntime.jsx(Label.Label, { ...labelProps, children: label }),
        labelEdge: 'inside'
    };
    const dropdownInlineUserAssistance = isOpen &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsxRuntime.jsx(useSelectCommon.DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown || isAdvancedSearchShown ? undefined : (jsxRuntime.jsx(useSelectCommon.EmptyResults, {}))) : (jsxRuntime.jsx(useSelectCommon.DefaultList, { "aria-label": label ?? '', currentKey: currentKey, data: data, itemRenderer: itemRenderer, itemText: itemText, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, searchText: isUserFiltering ? searchText : undefined, selectedKeys: selectedKeys, selectionMode: "single" }));
    const addToListContent = isAddToListShown ? (jsxRuntime.jsx(useSelectCommon.LinkItem, { onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    const advancedSearchContent = isAdvancedSearchShown ? (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { onMouseDown: useSelectCommon.preventDefault, children: jsxRuntime.jsx(Separator.Separator, {}) }), jsxRuntime.jsx(useSelectCommon.LinkItem, { onAction: onAdvancedSearchAction, children: translations.select_moreSearchOptions() })] })) : undefined;
    return (jsxRuntime.jsx(useSelectCommon.SelectMobileDropdown, { header: jsxRuntime.jsxs(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: [jsxRuntime.jsx(View.View, { children: jsxRuntime.jsx(SelectSingleField, { ...textFieldProps, ...mobileDropdownFieldLabelProps, ...selectSingleFieldProps, onFocus: onFieldFocus, onBlur: onFieldBlur, children: jsxRuntime.jsx(SelectSingleFieldInput, { ...inputProps, ...selectSingleFieldInputProps, "aria-controls": dropdownId, "aria-expanded": isOpen, "aria-label": ariaLabel, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isRequired: isRequired, liveRegionText: liveRegionText, placeholder: placeholder, textAlign: textAlign, virtualKeyboard: virtualKeyboard, onInput: onFieldInput, onKeyDown: onFieldKeyDown, onKeyUp: onFieldKeyUp }) }) }), dropdownInlineUserAssistance, advancedSearchContent] }), hasHeaderSeparator: !(isAdvancedSearchShown && isEmptyResults), id: dropdownId, isOpen: isOpen, children: jsxRuntime.jsxs(useSelectCommon.DropdownList, { isLoading: data === null, hasTopGap: !(isAddToListShown || isAdvancedSearchShown), children: [dropdownListContent, addToListContent] }) }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useDisplayValue(itemText, valueItem) {
    // create the text displayed in the field from the selected value
    const displayValue = hooks.useMemo(() => {
        return valueItem === undefined ? '' : useSelectCommon.renderItemText(valueItem, itemText) ?? '';
    }, [valueItem, itemText]);
    return displayValue;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages SelectSingle state and behavior.  This hook creates state variables and
 * event listeners, returning properties to apply to components internally rendered by
 * SelectSingle, as well as state information.
 *
 * @param data Specifies data for the dropdown list.
 * @param inputRef Ref to the input element.
 * @param isDisabled Specifies whether the component is disabled.
 * @param isFocused Specifies whether the component has focus.
 * @param isReadonly Specifies whether the component is readonly.
 * @param onCommit Callback invoked when the selected value is committed.
 * @param onFilter Callback function to trigger loading data for the dropdown list,
 * which may or may not be filtered by user entered text.
 * @param valueItem Specifies the key, data, and optional metadata for the selected value.
 *
 * @returns Properties to apply to internal components that SelectSingle renders, and component
 * state.
 */
function useSelectSingle({ addToList, advancedSearch, data, inputRef, isDisabled, isFocused: propIsFocused, isReadonly, onAddToListAction, onAdvancedSearchAction, onCommit: propOnCommit, onFilter, valueItem }) {
    const { currentRow, dropdownRef, getDropdownTabbableElems, handleDropdownArrowClick, handleDropdownAutoDismiss: baseHandleDropdownAutoDismiss, handleDropdownPosition, handleInput, handleMainFieldKeyDown: baseHandleMainFieldKeyDown, handleMainFieldKeyUp, isDropdownAbove, isDropdownOpen, isFocused, isUserFiltering, mainFieldRef, onCurrentKeyChange, onMouseDown, searchText, setCurrentRow, setDropdownOpen, setUserInput, stopFiltering, userInput } = useSelectCommon.useSelectCommon({
        data,
        inputRef,
        isFocused: propIsFocused,
        onFilter
    });
    const [selectedKeys, setSelectedKeys] = hooks.useState();
    const [isBlurClearValue, setBlurClearValue] = hooks.useState(false);
    const [prevIsFocused, setPrevIsFocused] = hooks.useState(isFocused);
    const [isTabbingOutOfDropdown, setTabbingOutOfDropdown] = hooks.useState(false);
    // refs used by some of the effects below to determine whether the effect needs to run,
    // for when the list of dependencies is longer than what we want the trigger to actually be
    const prevDataRef = hooks.useRef(data);
    const prevDropdownOpenRef = hooks.useRef(isDropdownOpen);
    const prevSearchText = hooks.useRef(searchText);
    const isAdvancedSearchShown = advancedSearch === 'on' && isUserFiltering && searchText != null && searchText.length > 0;
    const isDataFetched = data !== undefined && data !== null && !useSelectCommon.isBeforeDataFetch(data);
    const isEmptyResults = isDataFetched && data?.totalSize === 0;
    // advanced search and add to list should not be shown at the same time, so if both are on,
    // let advanced search win because it is shown more often than add to list in the dropdown
    // (even when the list is not empty) and its external UI could potentially include the
    // ability to add to list too
    const isAddToListShown = addToList === 'on' &&
        advancedSearch !== 'on' &&
        isUserFiltering &&
        searchText != null &&
        searchText.length > 0 &&
        isEmptyResults;
    const handleAddToListAction = hooks.useCallback(() => {
        setDropdownOpen(false);
        stopFiltering();
        onAddToListAction?.({ searchText: isUserFiltering ? searchText : undefined });
    }, [isUserFiltering, onAddToListAction, searchText, setDropdownOpen, stopFiltering]);
    const handleAdvancedSearchAction = hooks.useCallback(() => {
        setDropdownOpen(false);
        stopFiltering();
        onAdvancedSearchAction?.({ searchText: isUserFiltering ? searchText : undefined });
    }, [isUserFiltering, onAdvancedSearchAction, searchText, setDropdownOpen, stopFiltering]);
    const onCommit = hooks.useCallback((value) => {
        propOnCommit?.({
            value: value,
            previousValue: valueItem !== undefined ? valueItem.key : undefined
        });
    }, [propOnCommit, valueItem]);
    const clearValue = hooks.useCallback((shouldCloseDropdown = true) => {
        if (shouldCloseDropdown) {
            setDropdownOpen(false);
        }
        setSelectedKeys(new Set());
        // call the onCommit callback so that the consuming code can update the valueItem
        onCommit(undefined);
    }, [onCommit, setDropdownOpen]);
    // determine if we need to clear the value because the user has deleted all the text
    const isClearValueNeeded = hooks.useCallback(() => {
        return isUserFiltering && userInput === '' && valueItem !== undefined;
    }, [isUserFiltering, userInput, valueItem]);
    const clearValueIfNeeded = hooks.useCallback(() => {
        if (isClearValueNeeded()) {
            clearValue();
            return true;
        }
        return false;
    }, [clearValue, isClearValueNeeded]);
    // JET-65757 - Empty value rejected when not confirmed by Enter/Tab
    // When the field loses focus, check to see if we need to clear the value and set a state flag
    // to later check in a useEffect.
    // (We have to make this check outside of the useEffect itself because by the time the useEffect
    // is called, the state we check here to see if we need to clear the value may have already
    // been changed.)
    if (prevIsFocused &&
        !isFocused &&
        !isTabbingOutOfDropdown &&
        !isBlurClearValue &&
        isClearValueNeeded()) {
        setBlurClearValue(true);
    }
    // Create this function with useEffectEvent so that it is stable and by itself won't cause
    // the below dependent useEffect to trigger.
    const handleBlur_stable = useEffectEvent.useEffectEvent(() => {
        // if we need to clear the value, do it now and reset the flag
        if (isBlurClearValue) {
            clearValue();
            setBlurClearValue(false);
        }
        // if we were tabbing out of the dropdown, reset the flag now that we've lost focus
        if (isTabbingOutOfDropdown) {
            setTabbingOutOfDropdown(false);
        }
    });
    // only run this effect when focus changes (handleBlur_stable has to be listed
    // as a dependency, but it's stable and won't change across renders)
    hooks.useEffect(() => {
        if (!isFocused) {
            handleBlur_stable();
        }
    }, [handleBlur_stable, isFocused]);
    // JET-60376 - Evaluate unit test driving strategy for SelectSingle
    // Add a _changeValue method to the root DOM element so that a test adapter can call it
    // to simulate the user changing the value, similar to what we do in the core pack select
    // component test adapters.
    const textFieldRef = hooks.useRef();
    const changeValue = hooks.useCallback((value) => {
        // we always want this method available on the DOM element so that a test can call it,
        // but we only want it to change the value when the component is enabled because that's
        // the only time the user could change the value through the UI
        if (!isReadonly && !isDisabled) {
            onCommit(value);
            return Promise.resolve();
        }
        return Promise.reject('Component is readonly or disabled');
    }, [isDisabled, isReadonly, onCommit]);
    hooks.useEffect(() => {
        const ref = isReadonly ? mainFieldRef : textFieldRef;
        if (ref.current) {
            ref.current._changeValue = changeValue;
        }
    }, [changeValue, isReadonly, mainFieldRef]);
    const focusInput = hooks.useCallback(() => {
        inputRef.current?.focus();
    }, [inputRef]);
    const removeDropdown = hooks.useCallback(() => {
        dropdownRef.current?.parentElement?.removeChild(dropdownRef.current);
    }, [dropdownRef]);
    const myHandleDropdownAutoDismiss = hooks.useCallback((event) => {
        if (isDropdownOpen) {
            if (event?.type === 'keydown') {
                const keyboardEvent = event;
                switch (keyboardEvent.code) {
                    case keyboardUtils.KEYS.TAB:
                        // if there are multiple tabbable elements in the dropdown, like the list and
                        // the advanced search link, then leave the dropdown open when tabbing among them
                        const isShift = keyboardEvent.shiftKey;
                        const tabbableElems = getDropdownTabbableElems();
                        if (tabbableElems && tabbableElems.length > 1) {
                            const firstTabbableElem = tabbableElems[0];
                            const lastTabbableElem = tabbableElems[tabbableElems.length - 1];
                            // check if tabbing forwards and focus is not on the last tabbable elem or
                            // tabbing backwards and focus is not on the first tabbable elem,
                            // then keep the dropdown open and simply return
                            if ((!isShift && document.activeElement !== lastTabbableElem) ||
                                (isShift && document.activeElement !== firstTabbableElem)) {
                                setDropdownOpen(true);
                                return;
                            }
                        }
                        // if there is a currentRow in the dropdown, select it and commit it
                        if (currentRow !== undefined &&
                            currentRow.rowKey !== undefined &&
                            data != null &&
                            data.data.length > 0) {
                            setSelectedKeys(new Set([currentRow.rowKey]));
                            onCommit(currentRow.rowKey);
                            // set flag that we're tabbing out of dropdown so that we can check it in a
                            // useEffect that gets executed when we lose focus
                            setTabbingOutOfDropdown(true);
                        }
                        // Put focus on an element in the main field, but don't kill the event, so that
                        // the browser can naturally transfer focus to the next focusable item relative
                        // to the element in the main field.
                        focusInput();
                        // Remove the dropdown immediately, without waiting for a rerender based on changing
                        // state, so that the open dropdown cannot get focus when the browser handles the
                        // Tab key.
                        removeDropdown();
                        break;
                }
            }
        }
    }, [
        currentRow,
        data,
        focusInput,
        getDropdownTabbableElems,
        isDropdownOpen,
        onCommit,
        removeDropdown,
        setDropdownOpen
    ]);
    const myHandleMainFieldKeyDown = hooks.useCallback((event) => {
        // ignore control key and function key
        if (keyboardUtils.isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.TAB:
                // if we're not going to clear the value when the component loses focus,
                // check whether we need to select the current item
                const isValueClearedTab = isClearValueNeeded();
                if (!isValueClearedTab && isDropdownOpen && data != null && data.data.length > 0) {
                    // if there is a currentRow in the dropdown (meaning a highlighted item that would
                    // have keyboard focus if the dropdown list had physical focus, which may be different
                    // from the currently selected item), select it and commit it;
                    // otherwise commit the currently selected value again so that a valueAction event
                    // will be fired
                    if (currentRow !== undefined && currentRow.rowKey !== undefined) {
                        setSelectedKeys(new Set([currentRow.rowKey]));
                        onCommit(currentRow.rowKey);
                    }
                    else {
                        onCommit(valueItem?.key ?? undefined);
                    }
                }
                // Remove the dropdown immediately, without waiting for a rerender based on changing
                // state, so that the open dropdown cannot get focus when the browser handles the
                // Tab key.
                removeDropdown();
                setDropdownOpen(false);
                break;
            case keyboardUtils.KEYS.ENTER:
                // if this is on a mobile device (only phone and not in tablet devices), do not do anything
                if (useSelectCommon.isPhone()) {
                    return;
                }
                // if add to list is shown, there are no results, so trigger the add to list link
                if (isAddToListShown) {
                    handleAddToListAction();
                    return;
                }
                // if advanced search is shown and there are no results, trigger the advanced
                // search link
                if (isAdvancedSearchShown && isEmptyResults) {
                    handleAdvancedSearchAction();
                    return;
                }
                // check whether we need to clear the value;
                // if not, check whether we need to select the current item
                const isValueCleared = clearValueIfNeeded();
                if (!isValueCleared && isDropdownOpen && data != null && data.data.length > 0) {
                    setDropdownOpen(false);
                    // after selecting a value, the user is no longer actively filtering, so update related
                    // state accordingly so that the newly selected value appears in the field
                    stopFiltering();
                    // if there is a currentRow in the dropdown, select it and commit it;
                    // otherwise commit the currently selected value again
                    if (currentRow !== undefined && currentRow.rowKey !== undefined) {
                        setSelectedKeys(new Set([currentRow.rowKey]));
                        onCommit(currentRow.rowKey);
                    }
                    else {
                        onCommit(valueItem?.key ?? undefined);
                    }
                }
                break;
        }
    }, [
        clearValueIfNeeded,
        currentRow,
        data,
        handleAddToListAction,
        handleAdvancedSearchAction,
        isAddToListShown,
        isAdvancedSearchShown,
        isClearValueNeeded,
        isDropdownOpen,
        isEmptyResults,
        onCommit,
        removeDropdown,
        setDropdownOpen,
        stopFiltering,
        valueItem
    ]);
    // when the valueItem changes, save the new selectedKeys
    hooks.useEffect(() => {
        setSelectedKeys(valueItem === undefined ? undefined : new Set([valueItem.key]));
    }, [valueItem]);
    const onItemAction = hooks.useCallback((detail) => {
        focusInput();
        setDropdownOpen(false);
        // after selecting a value, the user is no longer actively filtering, so update related
        // state accordingly so that the newly selected value appears in the field
        stopFiltering();
        const newKey = detail.context.metadata.key;
        // update the selectedKeys so that the selection visual state of the collection
        // updates immediately while waiting for a new valueItem to be set
        setSelectedKeys(new Set([newKey]));
        // call the onCommit callback so that the consuming code can update the valueItem
        onCommit(newKey);
    }, [focusInput, onCommit, setDropdownOpen, stopFiltering]);
    hooks.useEffect(() => {
        // only run this effect when data changes because we need to wait for the new set of
        // filtered data to be set before highlighting the first result
        if (data === prevDataRef.current) {
            return;
        }
        // when filtering, set the first result of the filtered data set to be the current item
        // (check the data offset so we don't try to highlight again if the user scrolls through
        // the list and more data is fetched)
        if (isDropdownOpen &&
            isUserFiltering &&
            data != null &&
            data.offset === 0 &&
            data.data.length > 0) {
            // if there are results and search text, highlight the first row, otherwise clear
            // an existing highlight
            setCurrentRow({
                rowKey: !useSelectCommon.isSearchTextEmptyOrUndefined(searchText) ? data.data[0].metadata.key : undefined
            });
        }
    }, [data, isDropdownOpen, isUserFiltering, searchText, setCurrentRow]);
    hooks.useEffect(() => {
        // only run this effect when the state of the dropdown changes
        if (isDropdownOpen === prevDropdownOpenRef.current) {
            return;
        }
        // JET-66783 - <oj-c-select-single> scroll position is not at selected item when we open the list second time.
        // set the current item to the selected item (if there is one)
        // when the dropdown opens if there is no filter text
        if (isDropdownOpen &&
            (!isUserFiltering || searchText === undefined || searchText.length === 0)) {
            setCurrentRow({ rowKey: [...(selectedKeys ?? [undefined])][0] });
        }
    }, [isDropdownOpen, isUserFiltering, searchText, selectedKeys, setCurrentRow]);
    const dropdownEventHandlers = hooks.useMemo(() => {
        return mergeProps.mergeProps({
            onAutoDismiss: baseHandleDropdownAutoDismiss,
            onPosition: handleDropdownPosition
        }, { onAutoDismiss: myHandleDropdownAutoDismiss });
    }, [baseHandleDropdownAutoDismiss, handleDropdownPosition, myHandleDropdownAutoDismiss]);
    const inputEventHandlers = hooks.useMemo(() => {
        return mergeProps.mergeProps({
            onInput: handleInput,
            onKeyDown: baseHandleMainFieldKeyDown,
            onKeyUp: handleMainFieldKeyUp
        }, { onKeyDown: myHandleMainFieldKeyDown });
    }, [baseHandleMainFieldKeyDown, handleInput, handleMainFieldKeyUp, myHandleMainFieldKeyDown]);
    if (isFocused !== prevIsFocused) {
        setPrevIsFocused(isFocused);
    }
    // update refs used in some of the above effects in a useEffect on every render so that they
    // update after the above effects run
    hooks.useEffect(() => {
        prevDataRef.current = data;
        prevDropdownOpenRef.current = isDropdownOpen;
        prevSearchText.current = searchText;
    });
    return {
        addToListEventHandlers: {
            onAction: handleAddToListAction
        },
        advancedSearchEventHandlers: {
            onAction: handleAdvancedSearchAction
        },
        collectionProps: {
            currentKey: currentRow.rowKey,
            onCurrentKeyChange,
            onItemAction,
            selectedKeys
        },
        dropdownArrowEventHandlers: {
            onClick: handleDropdownArrowClick
        },
        clearValue,
        dropdownEventHandlers,
        dropdownRef,
        inputEventHandlers,
        inputRef,
        isAddToListShown,
        isAdvancedSearchShown,
        isDataFetched,
        isDropdownAbove,
        isDropdownOpen,
        isEmptyResults,
        isFocused,
        isUserFiltering,
        mainFieldRef,
        mouseProps: isDisabled || isReadonly ? {} : { onMouseDown },
        searchText,
        setDropdownOpen,
        setUserInput,
        stopFiltering,
        textFieldRef,
        userInput
    };
}

/**
 * A SelectSingle is a dropdown list that supports single selection and search filtering.
 */
const SelectSingle = compat.forwardRef(({ addToList = 'off', advancedSearch = 'off', 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, data, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isLoading: propIsLoading, isReadonly: propIsReadonly, isRequired, isRequiredShown, itemRenderer, itemText, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onAddToListAction, onAdvancedSearchAction, onCommit, onFilter, onLoadRange, placeholder, testId, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, valueItem, variant = 'default', virtualKeyboard }, ref) => {
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const { enabledElementRef, focusProps, isFocused: origIsFocused, readonlyElementRef } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref });
    const { addToListEventHandlers, advancedSearchEventHandlers, clearValue, collectionProps, dropdownArrowEventHandlers, dropdownEventHandlers, dropdownRef, inputEventHandlers, isAddToListShown, isAdvancedSearchShown, isDataFetched, isDropdownAbove, isDropdownOpen, isEmptyResults, isFocused, isUserFiltering, mainFieldRef, mouseProps, searchText, setDropdownOpen, setUserInput, stopFiltering, textFieldRef, userInput } = useSelectSingle({
        addToList,
        advancedSearch,
        data,
        inputRef: enabledElementRef,
        isDisabled,
        isFocused: origIsFocused,
        isReadonly,
        onAddToListAction,
        onAdvancedSearchAction,
        onCommit,
        onFilter,
        valueItem
    });
    // The incoming propIsLoading tells us that we are in a loading state, but we don't want to
    // show the loading indicator until after a delay, because showing it immediately could result
    // in unwanted flashing.  The isLoading var below will be set to true by useLoadingIndicatorTimer
    // after the delay, when the timer expires, at which point we should show the loading indicator.
    // If propIsLoading is set to false before the timer expires, then the timer will be cancelled
    // and no loading indicator will be shown.
    // (ListView detects its loading state by checking data === null.  While it would be nice for
    // us to be consistent and check valueItems === null, we need to use a separate isLoading prop.
    // If valueItems === null triggers our loading state, then the selections in the dropdown
    // are cleared for that period of time, which is undesirable.)
    const isLoading = useLoadingIndicatorTimer.useLoadingIndicatorTimer(propIsLoading ?? false);
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField.useTextField({
        ariaDescribedBy,
        helpSourceLink,
        helpSourceText,
        isDisabled,
        isFocused,
        isLoading,
        isReadonly,
        isRequiredShown,
        labelEdge,
        messages,
        styleVariant: variant,
        userAssistanceDensity,
        value: valueItem !== undefined ? true : undefined
    });
    // JET-54256 - inside label animates up on initial display with selected value
    // If we're waiting for the selected values to load, the component should look like it
    // has a value in the meantime.
    // Use the original propIsLoading instead of isLoading because we don't want to delay
    // the inside label position by a timer like we do the progressive loading indicator.
    formFieldContext.hasValue = propIsLoading || formFieldContext.hasValue;
    const dropdownId = `${baseId}-dropdown`;
    const displayValue = useDisplayValue(itemText, valueItem);
    const labelComp = labelEdge !== 'none' ? jsxRuntime.jsx(Label.Label, { ...labelProps, children: label }) : undefined;
    const fieldLabelProps = {
        label: labelEdge !== 'none' ? labelComp : undefined,
        labelEdge: labelEdge !== 'none' ? labelEdge : undefined,
        labelStartWidth: labelEdge !== 'none' ? labelStartWidth : undefined
    };
    const ariaLabel = labelEdge === 'none' ? label : undefined;
    const isInlineDensity = userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow';
    const inlineUserAssistance = isInlineDensity ? (isDisabled || isReadonly ? (
    // save space for user assistance if density is 'efficient', even though we don't
    // render user assistance for disabled or readonly fields
    userAssistanceDensity !== 'efficient' ? undefined : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsxRuntime.jsx(CompactUserAssistance.CompactUserAssistance, { anchorRef: mainFieldRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    if (isReadonly) {
        const mainContent = (jsxRuntime.jsx(ReadonlyTextFieldInput.ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", elementRef: readonlyElementRef, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside', textAlign: textAlign, value: displayValue }));
        return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(StyledTextField.ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: mainFieldRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
    }
    const hasInsideLabel = labelComp !== undefined && labelEdge === 'inside';
    const liveRegionText = isDropdownOpen && isDataFetched
        ? data?.totalSize === 0
            ? translations.select_noMatchesFound()
            : data?.totalSize === 1
                ? translations.select_oneMatchFound()
                : data?.sizePrecision === 'exact'
                    ? translations.select_sizeMatchesFound({ TOTAL_SIZE: `${data?.totalSize}` })
                    : translations.select_sizeOrMoreMatchesFound({ TOTAL_SIZE: `${data?.totalSize}` })
        : '';
    const hasEmptyLabel = label === '' && labelEdge === 'none';
    // Use the mobile field if the component is being rendered in a phone
    // and it is not disabled.
    const isPhoneMainFieldInput = useSelectCommon.isPhone() && !isDisabled;
    const mainContent = !isPhoneMainFieldInput ? (jsxRuntime.jsx(SelectSingleFieldInput, { "aria-controls": dropdownId, "aria-expanded": isDropdownOpen, "aria-label": ariaLabel, displayValue: displayValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel, inputRef: enabledElementRef, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isRequired: isRequired, isUserFiltering: isUserFiltering, liveRegionText: liveRegionText, placeholder: placeholder, textAlign: textAlign, userInput: userInput, 
        // In tablet, we would want to show the virtual keyboard
        virtualKeyboard: useSelectCommon.isTablet() ? virtualKeyboard : undefined, ...inputProps, ...inputEventHandlers })) : (jsxRuntime.jsx(useSelectCommon.SelectMobileFieldInput, { "aria-controls": dropdownId, "aria-describedby": inputProps['aria-describedby'], "aria-expanded": isDropdownOpen, "aria-invalid": inputProps['aria-invalid'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, displayValue: displayValue, hasEmptyLabel: hasEmptyLabel, hasInsideLabel: hasInsideLabel, isRequired: isRequired, onBlur: inputProps.onBlur, onFocus: inputProps.onFocus, placeholder: placeholder, ref: enabledElementRef, textAlign: textAlign, variant: inputProps.variant }));
    const shouldShowDropdown = isDropdownOpen &&
        data !== undefined &&
        (data === null || data.totalSize > 0 || useSelectCommon.isBeforeDataFetch(data) || isEmptyResults);
    const dropdown = !shouldShowDropdown ? null : useSelectCommon.isPhone() ? (jsxRuntime.jsx(SelectSingleMobileDropdown, { ...collectionProps, "aria-describedby": ariaDescribedBy, "aria-label": ariaLabel, assistiveText: assistiveText, clearValue: clearValue, data: data, displayValue: displayValue, dropdownId: dropdownId, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isEmptyResults: isEmptyResults, isFocused: isFocused, isLoading: isLoading, isOpen: shouldShowDropdown, isRequired: isRequired, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, liveRegionText: liveRegionText, mainFieldInputRef: enabledElementRef, onAddToListAction: addToListEventHandlers.onAction, onAdvancedSearchAction: advancedSearchEventHandlers.onAction, onFieldBlur: focusProps.onFocusOut, onFieldFocus: focusProps.onFocusIn, onFieldInput: inputEventHandlers.onInput, onFieldKeyDown: inputEventHandlers.onKeyDown, onFieldKeyUp: inputEventHandlers.onKeyUp, onLoadRange: onLoadRange, placeholder: placeholder, propIsLoading: propIsLoading, searchText: searchText, setDropdownOpen: setDropdownOpen, stopFiltering: stopFiltering, setUserInput: setUserInput, textAlign: textAlign, userAssistanceDensity: userAssistanceDensity, userInput: userInput, virtualKeyboard: virtualKeyboard })) : (jsxRuntime.jsx(SelectSingleDesktopDropdown, { ...collectionProps, ...dropdownEventHandlers, assistiveText: assistiveText, data: data, dropdownId: dropdownId, dropdownRef: dropdownRef, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isDisabled: isDisabled, isDropdownAbove: isDropdownAbove, isEmptyResults: isEmptyResults, isOpen: shouldShowDropdown, isReadonly: isReadonly, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, mainFieldRef: mainFieldRef, onAddToListAction: addToListEventHandlers.onAction, onAdvancedSearchAction: advancedSearchEventHandlers.onAction, onLoadRange: onLoadRange, searchText: searchText, userAssistanceDensity: userAssistanceDensity }));
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(SelectSingleField, { columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, hasInsideLabel: hasInsideLabel, inlineUserAssistance: inlineUserAssistance, isDropdownArrowShown: true, mainFieldRef: mainFieldRef, onBlur: focusProps?.onFocusOut, onDropdownArrowClick: dropdownArrowEventHandlers.onClick, onFocus: focusProps?.onFocusIn, rootRef: textFieldRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...mouseProps, children: mainContent }) }), dropdown] }));
});

exports.SelectSingle = SelectSingle;
//# sourceMappingURL=SelectSingle-315c9871.js.map
