/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { L as Label } from './Label-6674b3f2.js';
import { useRef, useCallback, useEffect, useMemo, useState } from 'preact/hooks';
import { forwardRef } from 'preact/compat';
import { T as TextFieldInput } from './TextFieldInput-3c39cb7b.js';
import './ObfuscatedTextFieldInputStyles.styles.css';
import { R as ReadonlyTextFieldInput } from './ReadonlyTextFieldInput-4392c7aa.js';
import { R as ReadonlyTextField } from './StyledTextField-c79f5438.js';
import './Flex-24628925.js';
import './FormContext-4d71f9c7.js';
import { u as useFormContext } from './useFormContext-875cacd7.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import './LabelValueLayoutStyles.styles.css';
import './logger-c92f309c.js';
import './UNSAFE_TextField/themes/TextFieldStyles.css.js';
import './SkeletonStyles.styles.css';
import './TextFieldLoadingStyles.styles.css';
import './TextFieldStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/TextFieldBaseTheme.styles.css';
import './UNSAFE_TextField/themes/redwood/TextFieldVariants.css.js';
import './RadioStyles.styles.css';
import './UNSAFE_RadioItem/themes/redwood/RadioBaseTheme.styles.css';
import './UNSAFE_RadioItem/themes/redwood/RadioVariants.css.js';
import './LabelStyles.styles.css';
import './UNSAFE_Label/themes/redwood/LabelBaseTheme.styles.css';
import './UNSAFE_Label/themes/redwood/LabelVariants.css.js';
import './UNSAFE_TextField/themes/FormLayoutStyles.css.js';
import './UNSAFE_TextField/themes/redwood/FormLayoutBaseTheme.styles.css';
import './CheckboxStyles.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxBaseTheme.styles.css';
import './UNSAFE_Checkbox/themes/redwood/CheckboxVariants.css.js';
import './InputGroupContext-20bdbd6e.js';
import './LayerHost-45f545d7.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import './LiveRegionStyles.styles.css';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import { C as CompactUserAssistance } from './CompactUserAssistance-41c32c6f.js';
import './useTooltipControlled-2044f639.js';
import { Fragment as Fragment$1 } from 'preact';
import './IconStyle.styles.css';
import './Popup-8889a781.js';
import './HiddenAccessibleStyles.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupBaseTheme.styles.css';
import './UNSAFE_Popup/themes/redwood/PopupVariants.css.js';
import { u as useFocusableTextField } from './useFocusableTextField-1cdf65e0.js';
import { u as useLoadingIndicatorTimer } from './useLoadingIndicatorTimer-898d4e3e.js';
import { u as useTextField } from './useTextField-f57cfb8d.js';
import { S as Separator } from './Separator-93c70737.js';
import { d as DropdownUserAssistance, E as EmptyResults, D as DefaultList, L as LinkItem, p as preventDefault, a as Dropdown, c as DropdownList, b as DropdownArrow, l as isSearchTextEmptyOrUndefined, S as SelectMobileDropdown, r as renderItemText, u as useSelectCommon, k as isBeforeDataFetch, h as isPhone, j as isTablet, f as SelectMobileFieldInput } from './useSelectCommon-b6d67057.js';
import { I as IconButton } from './IconButton-37310d21.js';
import { S as SvgNavLeft, a as SvgCancelS } from './CancelS-90fa1514.js';
import './useAccessibleContext-5744de8b.js';
import './textAlign-ad252afa.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import './ReadonlyTextFieldInputStyles.styles.css';
import './UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputVariants.css.js';
import { T as TextField } from './TextField-323fe0e9.js';
import { L as LiveRegion } from './LiveRegion-81216fe6.js';
import { V as View } from './View-6013acac.js';
import { u as useEffectEvent } from './useEffectEvent-e320381e.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { K as KEYS, i as isControlOrFunctionKey } from './keyboardUtils-4db21770.js';

function SelectSingleDesktopDropdown({ assistiveText, currentKey, data, dropdownId, dropdownRef, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isDisabled, isDropdownAbove, isEmptyResults, isOpen, isReadonly, isUserFiltering, itemRenderer, itemText, label, mainFieldRef, onAddToListAction, onAdvancedSearchAction, onAutoDismiss, onCurrentKeyChange, onItemAction, onLoadRange, onPosition, searchText, selectedKeys, userAssistanceDensity }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const dropdownInlineUserAssistance = isOpen &&
        !isDropdownAbove &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsx(TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsx(DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity }) })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown || isAdvancedSearchShown ? undefined : (jsx(EmptyResults, {}))) : (jsx(DefaultList, { "aria-label": label ?? '', currentItemVariant: "highlight", currentKey: currentKey, data: data, itemRenderer: itemRenderer, itemText: itemText, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, searchText: isUserFiltering ? searchText : undefined, selectedKeys: selectedKeys, selectionMode: "single" }));
    const addToListContent = isAddToListShown ? (jsx(LinkItem, { isHighlighted: isEmptyResults, onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    const advancedSearchContent = isAdvancedSearchShown ? (jsxs(Fragment, { children: [!isEmptyResults && (jsx("div", { onMouseDown: preventDefault, children: jsx(Separator, {}) })), jsx(LinkItem, { isHighlighted: isEmptyResults, onAction: onAdvancedSearchAction, children: translations.select_moreSearchOptions() })] })) : undefined;
    return (jsxs(Dropdown, { anchorRef: mainFieldRef, dropdownRef: dropdownRef, id: dropdownId, isOpen: isOpen, onAutoDismiss: onAutoDismiss, onPosition: onPosition, children: [jsxs(DropdownList, { hasBottomGap: dropdownInlineUserAssistance === undefined, isLoading: data === null, children: [dropdownListContent, addToListContent, advancedSearchContent] }), dropdownInlineUserAssistance] }));
}

function SelectSingleField({ children, hasInsideLabel, isBackButtonShown, isClearButtonShown, isDropdownArrowShown, onBackButtonClick, onClearButtonClick, onDropdownArrowClick, ...passThroughTextFieldProps }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const { isDisabled, isLoading } = useFormFieldContext();
    const startContent = isBackButtonShown ? (jsx(IconButton, { "aria-label": translations.selectMultiple_back(), size: "xs", variant: "ghost", onAction: onBackButtonClick, children: jsx(SvgNavLeft, {}) })) : null;
    const endContent = isLoading ? undefined : (jsxs(Fragment, { children: [isClearButtonShown && (jsx(IconButton, { "aria-label": translations.formControl_clear(), size: "sm", variant: "ghost", onAction: onClearButtonClick, children: jsx(SvgCancelS, {}) })), isDropdownArrowShown && (jsx(DropdownArrow, { isDisabled: isDisabled, onClick: onDropdownArrowClick, testId: `${passThroughTextFieldProps.testId}_dropdownarrow` }))] }));
    return (jsx(TextField, { startContent: startContent, mainContent: children, endContent: endContent, ...passThroughTextFieldProps }));
}

function SelectSingleFieldInput({ displayValue, isAddToListShown, isAdvancedSearchShown, isUserFiltering, liveRegionText, userInput, virtualKeyboard, ...passThroughTextFieldInputProps }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const addToListAccText = translations.select_addToListAvailable();
    const advancedSearchAccText = translations.select_moreSearchOptionsAvailable();
    return (jsxs(Fragment, { children: [jsx(TextFieldInput, { ...passThroughTextFieldInputProps, hasEndContent: true, "aria-autocomplete": "list", autoComplete: "off", role: "combobox", spellcheck: false, type: virtualKeyboard === 'auto' ? 'search' : virtualKeyboard, value: isUserFiltering ? userInput : displayValue }), jsx(LiveRegion, { children: liveRegionText }), isAddToListShown ? jsx(LiveRegion, { children: addToListAccText }) : undefined, isAdvancedSearchShown ? jsx(LiveRegion, { children: advancedSearchAccText }) : undefined] }));
}

function useMobileDropdown({ clearValue, displayValue, inputRef, isDropdownOpen, userInput, setDropdownOpen, stopFiltering, setUserInput }) {
    // Create a ref for the input in the dropdown
    const dropdownInputRef = useRef(null);
    const closeDropdown = useCallback(() => {
        setDropdownOpen(false);
        // stop filtering before closing the dropdown
        stopFiltering();
        // revert the focus back to the main field
        inputRef.current?.focus();
    }, [inputRef, setDropdownOpen, stopFiltering]);
    const onBackButtonClick = useCallback(() => {
        closeDropdown();
    }, [closeDropdown]);
    const onClearButtonClick = useCallback(() => {
        // reset the user filter and the value of the component
        stopFiltering();
        // clear the value but do not close the dropdown
        clearValue(false);
        // set focus to the dropdown input field
        dropdownInputRef.current?.focus();
    }, [clearValue, stopFiltering]);
    const wasDropdownOpen = useRef(isDropdownOpen);
    useEffect(() => {
        // if the dropdown is open, ignore any valueItems update
        if (isDropdownOpen) {
            // this dropdown is opened now, so set the focus on the input field
            setTimeout(() => dropdownInputRef.current?.focus(), 0);
        }
        wasDropdownOpen.current = isDropdownOpen;
    }, [isDropdownOpen]);
    const isInitialRender = useRef(true);
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
            isClearButtonShown: !isSearchTextEmptyOrUndefined(userInput) || !isSearchTextEmptyOrUndefined(displayValue),
            isDropdownArrowShown: false,
            styleVariant: 'embedded',
            onBackButtonClick,
            onClearButtonClick
        }
    };
}

function SelectSingleMobileDropdown({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, assistiveText, clearValue, currentKey, data, displayValue, dropdownId, helpSourceLink, helpSourceText, isAddToListShown, isAdvancedSearchShown, isEmptyResults, isFocused, isLoading, isOpen = false, isRequired, isUserFiltering, itemRenderer, itemText, label, liveRegionText, mainFieldInputRef, onAddToListAction, onAdvancedSearchAction, onCurrentKeyChange, onFieldBlur, onFieldFocus, onFieldInput, onFieldKeyDown, onFieldKeyUp, onItemAction, onLoadRange, placeholder, propIsLoading, searchText, selectedKeys, setDropdownOpen, setUserInput, stopFiltering, textAlign, userAssistanceDensity, userInput, virtualKeyboard }) {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const { formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
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
        label: jsx(Label, { ...labelProps, children: label }),
        labelEdge: 'inside'
    };
    const dropdownInlineUserAssistance = isOpen &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsx(DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown || isAdvancedSearchShown ? undefined : (jsx(EmptyResults, {}))) : (jsx(DefaultList, { "aria-label": label ?? '', currentKey: currentKey, data: data, itemRenderer: itemRenderer, itemText: itemText, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, searchText: isUserFiltering ? searchText : undefined, selectedKeys: selectedKeys, selectionMode: "single" }));
    const addToListContent = isAddToListShown ? (jsx(LinkItem, { onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    const advancedSearchContent = isAdvancedSearchShown ? (jsxs(Fragment, { children: [jsx("div", { onMouseDown: preventDefault, children: jsx(Separator, {}) }), jsx(LinkItem, { onAction: onAdvancedSearchAction, children: translations.select_moreSearchOptions() })] })) : undefined;
    return (jsx(SelectMobileDropdown, { header: jsxs(FormFieldContext.Provider, { value: formFieldContext, children: [jsx(View, { children: jsx(SelectSingleField, { ...textFieldProps, ...mobileDropdownFieldLabelProps, ...selectSingleFieldProps, onFocus: onFieldFocus, onBlur: onFieldBlur, children: jsx(SelectSingleFieldInput, { ...inputProps, ...selectSingleFieldInputProps, "aria-controls": dropdownId, "aria-expanded": isOpen, "aria-label": ariaLabel, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isRequired: isRequired, liveRegionText: liveRegionText, placeholder: placeholder, textAlign: textAlign, virtualKeyboard: virtualKeyboard, onInput: onFieldInput, onKeyDown: onFieldKeyDown, onKeyUp: onFieldKeyUp }) }) }), dropdownInlineUserAssistance, advancedSearchContent] }), hasHeaderSeparator: !(isAdvancedSearchShown && isEmptyResults), id: dropdownId, isOpen: isOpen, children: jsxs(DropdownList, { isLoading: data === null, hasTopGap: !(isAddToListShown || isAdvancedSearchShown), children: [dropdownListContent, addToListContent] }) }));
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
    const displayValue = useMemo(() => {
        return valueItem === undefined ? '' : renderItemText(valueItem, itemText) ?? '';
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
    const { currentRow, dropdownRef, getDropdownTabbableElems, handleDropdownArrowClick, handleDropdownAutoDismiss: baseHandleDropdownAutoDismiss, handleDropdownPosition, handleInput, handleMainFieldKeyDown: baseHandleMainFieldKeyDown, handleMainFieldKeyUp, isDropdownAbove, isDropdownOpen, isFocused, isUserFiltering, mainFieldRef, onCurrentKeyChange, onMouseDown, searchText, setCurrentRow, setDropdownOpen, setUserInput, stopFiltering, userInput } = useSelectCommon({
        data,
        inputRef,
        isFocused: propIsFocused,
        onFilter
    });
    const [selectedKeys, setSelectedKeys] = useState();
    const [isBlurClearValue, setBlurClearValue] = useState(false);
    const [prevIsFocused, setPrevIsFocused] = useState(isFocused);
    const [isTabbingOutOfDropdown, setTabbingOutOfDropdown] = useState(false);
    // refs used by some of the effects below to determine whether the effect needs to run,
    // for when the list of dependencies is longer than what we want the trigger to actually be
    const prevDataRef = useRef(data);
    const prevDropdownOpenRef = useRef(isDropdownOpen);
    const prevSearchText = useRef(searchText);
    const isAdvancedSearchShown = advancedSearch === 'on' && isUserFiltering && searchText != null && searchText.length > 0;
    const isDataFetched = data !== undefined && data !== null && !isBeforeDataFetch(data);
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
    const handleAddToListAction = useCallback(() => {
        setDropdownOpen(false);
        stopFiltering();
        onAddToListAction?.({ searchText: isUserFiltering ? searchText : undefined });
    }, [isUserFiltering, onAddToListAction, searchText, setDropdownOpen, stopFiltering]);
    const handleAdvancedSearchAction = useCallback(() => {
        setDropdownOpen(false);
        stopFiltering();
        onAdvancedSearchAction?.({ searchText: isUserFiltering ? searchText : undefined });
    }, [isUserFiltering, onAdvancedSearchAction, searchText, setDropdownOpen, stopFiltering]);
    const onCommit = useCallback((value) => {
        propOnCommit?.({
            value: value,
            previousValue: valueItem !== undefined ? valueItem.key : undefined
        });
    }, [propOnCommit, valueItem]);
    const clearValue = useCallback((shouldCloseDropdown = true) => {
        if (shouldCloseDropdown) {
            setDropdownOpen(false);
        }
        setSelectedKeys(new Set());
        // call the onCommit callback so that the consuming code can update the valueItem
        onCommit(undefined);
    }, [onCommit, setDropdownOpen]);
    // determine if we need to clear the value because the user has deleted all the text
    const isClearValueNeeded = useCallback(() => {
        return isUserFiltering && userInput === '' && valueItem !== undefined;
    }, [isUserFiltering, userInput, valueItem]);
    const clearValueIfNeeded = useCallback(() => {
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
    const handleBlur_stable = useEffectEvent(() => {
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
    useEffect(() => {
        if (!isFocused) {
            handleBlur_stable();
        }
    }, [handleBlur_stable, isFocused]);
    // JET-60376 - Evaluate unit test driving strategy for SelectSingle
    // Add a _changeValue method to the root DOM element so that a test adapter can call it
    // to simulate the user changing the value, similar to what we do in the core pack select
    // component test adapters.
    const textFieldRef = useRef();
    const changeValue = useCallback((value) => {
        // we always want this method available on the DOM element so that a test can call it,
        // but we only want it to change the value when the component is enabled because that's
        // the only time the user could change the value through the UI
        if (!isReadonly && !isDisabled) {
            onCommit(value);
            return Promise.resolve();
        }
        return Promise.reject('Component is readonly or disabled');
    }, [isDisabled, isReadonly, onCommit]);
    useEffect(() => {
        const ref = isReadonly ? mainFieldRef : textFieldRef;
        if (ref.current) {
            ref.current._changeValue = changeValue;
        }
    }, [changeValue, isReadonly, mainFieldRef]);
    const focusInput = useCallback(() => {
        inputRef.current?.focus();
    }, [inputRef]);
    const removeDropdown = useCallback(() => {
        dropdownRef.current?.parentElement?.removeChild(dropdownRef.current);
    }, [dropdownRef]);
    const myHandleDropdownAutoDismiss = useCallback((event) => {
        if (isDropdownOpen) {
            if (event?.type === 'keydown') {
                const keyboardEvent = event;
                switch (keyboardEvent.code) {
                    case KEYS.TAB:
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
    const myHandleMainFieldKeyDown = useCallback((event) => {
        // ignore control key and function key
        if (isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case KEYS.TAB:
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
            case KEYS.ENTER:
                // if this is on a mobile device (only phone and not in tablet devices), do not do anything
                if (isPhone()) {
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
    useEffect(() => {
        setSelectedKeys(valueItem === undefined ? undefined : new Set([valueItem.key]));
    }, [valueItem]);
    const onItemAction = useCallback((detail) => {
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
    useEffect(() => {
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
                rowKey: !isSearchTextEmptyOrUndefined(searchText) ? data.data[0].metadata.key : undefined
            });
        }
    }, [data, isDropdownOpen, isUserFiltering, searchText, setCurrentRow]);
    useEffect(() => {
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
    const dropdownEventHandlers = useMemo(() => {
        return mergeProps({
            onAutoDismiss: baseHandleDropdownAutoDismiss,
            onPosition: handleDropdownPosition
        }, { onAutoDismiss: myHandleDropdownAutoDismiss });
    }, [baseHandleDropdownAutoDismiss, handleDropdownPosition, myHandleDropdownAutoDismiss]);
    const inputEventHandlers = useMemo(() => {
        return mergeProps({
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
    useEffect(() => {
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
const SelectSingle = forwardRef(({ addToList = 'off', advancedSearch = 'off', 'aria-describedby': ariaDescribedBy, assistiveText, columnSpan, data, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isLoading: propIsLoading, isReadonly: propIsReadonly, isRequired, isRequiredShown, itemRenderer, itemText, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onAddToListAction, onAdvancedSearchAction, onCommit, onFilter, onLoadRange, placeholder, testId, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, valueItem, variant = 'default', virtualKeyboard }, ref) => {
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const { enabledElementRef, focusProps, isFocused: origIsFocused, readonlyElementRef } = useFocusableTextField({ isDisabled, isReadonly, ref });
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
    const isLoading = useLoadingIndicatorTimer(propIsLoading ?? false);
    const { baseId, formFieldContext, inputProps, labelProps, textFieldProps, userAssistanceProps } = useTextField({
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
    const labelComp = labelEdge !== 'none' ? jsx(Label, { ...labelProps, children: label }) : undefined;
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
    userAssistanceDensity !== 'efficient' ? undefined : (jsx(InlineUserAssistance, { userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : (jsx(InlineUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, messages: messages, isRequiredShown: isRequiredShown, userAssistanceDensity: userAssistanceDensity, ...userAssistanceProps }))) : undefined;
    const compactUserAssistance = userAssistanceDensity === 'compact' ? (jsx(CompactUserAssistance, { anchorRef: mainFieldRef, messages: messages, assistiveText: assistiveText, ...userAssistanceProps })) : undefined;
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    if (isReadonly) {
        const mainContent = (jsx(ReadonlyTextFieldInput, { "aria-describedby": inputProps['aria-describedby'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, as: "div", elementRef: readonlyElementRef, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: label !== undefined && labelEdge === 'inside', textAlign: textAlign, value: displayValue }));
        return (jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(ReadonlyTextField, { role: "presentation", columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, inlineUserAssistance: inlineUserAssistance, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, ref: mainFieldRef, mainContent: mainContent, testId: testId, ...fieldLabelProps }) }));
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
    const isPhoneMainFieldInput = isPhone() && !isDisabled;
    const mainContent = !isPhoneMainFieldInput ? (jsx(SelectSingleFieldInput, { "aria-controls": dropdownId, "aria-expanded": isDropdownOpen, "aria-label": ariaLabel, displayValue: displayValue, hasEmptyLabel: label === '' && labelEdge === 'none', hasInsideLabel: hasInsideLabel, inputRef: enabledElementRef, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isRequired: isRequired, isUserFiltering: isUserFiltering, liveRegionText: liveRegionText, placeholder: placeholder, textAlign: textAlign, userInput: userInput, 
        // In tablet, we would want to show the virtual keyboard
        virtualKeyboard: isTablet() ? virtualKeyboard : undefined, ...inputProps, ...inputEventHandlers })) : (jsx(SelectMobileFieldInput, { "aria-controls": dropdownId, "aria-describedby": inputProps['aria-describedby'], "aria-expanded": isDropdownOpen, "aria-invalid": inputProps['aria-invalid'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, displayValue: displayValue, hasEmptyLabel: hasEmptyLabel, hasInsideLabel: hasInsideLabel, isRequired: isRequired, onBlur: inputProps.onBlur, onFocus: inputProps.onFocus, placeholder: placeholder, ref: enabledElementRef, textAlign: textAlign, variant: inputProps.variant }));
    const shouldShowDropdown = isDropdownOpen &&
        data !== undefined &&
        (data === null || data.totalSize > 0 || isBeforeDataFetch(data) || isEmptyResults);
    const dropdown = !shouldShowDropdown ? null : isPhone() ? (jsx(SelectSingleMobileDropdown, { ...collectionProps, "aria-describedby": ariaDescribedBy, "aria-label": ariaLabel, assistiveText: assistiveText, clearValue: clearValue, data: data, displayValue: displayValue, dropdownId: dropdownId, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isEmptyResults: isEmptyResults, isFocused: isFocused, isLoading: isLoading, isOpen: shouldShowDropdown, isRequired: isRequired, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, liveRegionText: liveRegionText, mainFieldInputRef: enabledElementRef, onAddToListAction: addToListEventHandlers.onAction, onAdvancedSearchAction: advancedSearchEventHandlers.onAction, onFieldBlur: focusProps.onFocusOut, onFieldFocus: focusProps.onFocusIn, onFieldInput: inputEventHandlers.onInput, onFieldKeyDown: inputEventHandlers.onKeyDown, onFieldKeyUp: inputEventHandlers.onKeyUp, onLoadRange: onLoadRange, placeholder: placeholder, propIsLoading: propIsLoading, searchText: searchText, setDropdownOpen: setDropdownOpen, stopFiltering: stopFiltering, setUserInput: setUserInput, textAlign: textAlign, userAssistanceDensity: userAssistanceDensity, userInput: userInput, virtualKeyboard: virtualKeyboard })) : (jsx(SelectSingleDesktopDropdown, { ...collectionProps, ...dropdownEventHandlers, assistiveText: assistiveText, data: data, dropdownId: dropdownId, dropdownRef: dropdownRef, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isAdvancedSearchShown: isAdvancedSearchShown, isDisabled: isDisabled, isDropdownAbove: isDropdownAbove, isEmptyResults: isEmptyResults, isOpen: shouldShowDropdown, isReadonly: isReadonly, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, mainFieldRef: mainFieldRef, onAddToListAction: addToListEventHandlers.onAction, onAdvancedSearchAction: advancedSearchEventHandlers.onAction, onLoadRange: onLoadRange, searchText: searchText, userAssistanceDensity: userAssistanceDensity }));
    return (jsxs(Fragment$1, { children: [jsx(FormFieldContext.Provider, { value: formFieldContext, children: jsx(SelectSingleField, { columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, hasInsideLabel: hasInsideLabel, inlineUserAssistance: inlineUserAssistance, isDropdownArrowShown: true, mainFieldRef: mainFieldRef, onBlur: focusProps?.onFocusOut, onDropdownArrowClick: dropdownArrowEventHandlers.onClick, onFocus: focusProps?.onFocusIn, rootRef: textFieldRef, testId: testId, ...textFieldProps, ...fieldLabelProps, ...mouseProps, children: mainContent }) }), dropdown] }));
});

export { SelectSingle as S };
//# sourceMappingURL=SelectSingle-8a8d1f5e.js.map
