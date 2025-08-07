/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Label = require('./Label-d9ad059f.js');
var hooks = require('preact/hooks');
var compat = require('preact/compat');
var TextFieldInput = require('./TextFieldInput-4904c227.js');

var ReadonlyTextFieldInput = require('./ReadonlyTextFieldInput-fb7ffa5e.js');
var StyledTextField = require('./StyledTextField-351ea57e.js');
var Flex = require('./Flex-fbba4ad6.js');
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
var useSelectCommon = require('./useSelectCommon-8aaf62bd.js');
require('./useAccessibleContext-c49d8d1b.js');
require('./textAlign-f41f49db.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');

require('./UNSAFE_TextField/themes/redwood/ReadonlyTextFieldInputVariants.css.js');
var TextField = require('./TextField-0f4e945f.js');
var UNSAFE_SelectMultiple_themes_SelectedValuesCountStyles_css = require('./UNSAFE_SelectMultiple/themes/SelectedValuesCountStyles.css.js');
var Chip = require('./Chip-a24817e0.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var CancelS = require('./CancelS-54815d5d.js');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');
var useUser = require('./useUser-a6d15333.js');
var keyboardUtils = require('./keyboardUtils-f835e1ee.js');
var classNames = require('./classNames-c14c6ef3.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var Text = require('./Text-aaacb6a0.js');
var Close = require('./Close-2adc0f0f.js');
var useId = require('./useId-6c0eeb27.js');
var UNSAFE_SelectMultiple_themes_TextTagStyles_css = require('./UNSAFE_SelectMultiple/themes/TextTagStyles.css.js');
var UNSAFE_SelectMultiple_themes_TextTagListStyles_css = require('./UNSAFE_SelectMultiple/themes/TextTagListStyles.css.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var View = require('./View-011404a7.js');
var UNSAFE_SelectMultiple_themes_MobileDropdownFooterStyles_css = require('./UNSAFE_SelectMultiple/themes/MobileDropdownFooterStyles.css.js');
var Button = require('./Button-b5af1b23.js');
var useEffectEvent = require('./useEffectEvent-9bf8acf6.js');
var equals = require('./equals-098f7781.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');

function SelectMultipleDesktopDropdown({ assistiveText, currentKey, data, dropdownId, dropdownRef, helpSourceLink, helpSourceText, isAddToListShown, isDisabled, isDropdownAbove, isEmptyResults, isOpen, isReadonly, isSelectedOnlyView, isUserFiltering, itemRenderer, itemText, label, mainFieldRef, searchText, selectedKeys, userAssistanceDensity, onAddToListAction, onAutoDismiss, onCurrentKeyChange, onLoadRange, onPosition, onSelectionChange }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const dropdownInlineUserAssistance = isOpen &&
        !isDropdownAbove &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsxRuntime.jsx(useSelectCommon.DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown ? undefined : (jsxRuntime.jsx(useSelectCommon.EmptyResults, {}))) : (jsxRuntime.jsx(useSelectCommon.DefaultList, { "aria-label": label ?? '', currentItemVariant: "highlight", currentKey: currentKey, data: data, itemRenderer: itemRenderer, itemText: itemText, searchText: isSelectedOnlyView ? undefined : isUserFiltering ? searchText : undefined, selectedKeys: selectedKeys, selectionMode: "multiple", onCurrentKeyChange: onCurrentKeyChange, onLoadRange: onLoadRange, onSelectionChange: onSelectionChange }));
    const addToListContent = isAddToListShown ? (jsxRuntime.jsx(useSelectCommon.LinkItem, { isHighlighted: isEmptyResults, onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    return (jsxRuntime.jsxs(useSelectCommon.Dropdown, { dropdownRef: dropdownRef, id: dropdownId, isOpen: isOpen, anchorRef: mainFieldRef, onAutoDismiss: onAutoDismiss, onPosition: onPosition, children: [jsxRuntime.jsxs(useSelectCommon.DropdownList, { hasBottomGap: dropdownInlineUserAssistance === undefined, isLoading: data === null, children: [dropdownListContent, addToListContent] }), dropdownInlineUserAssistance] }));
}

// This component renders a badge showing the number of selected values
function SelectedValuesCount({ 'aria-label': ariaLabel, count = 0, onKeyDown, onKeyUp, onMouseDown, ...passThroughProps }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const instructions = translations.selectMultiple_showSelectedValues();
    const accLabel = ariaLabel ? `${ariaLabel}. ` : '';
    const ninetyNinePlus = translations.selectMultiple_countPlus({ COUNT: `99` });
    // The Chip shows the number of values selected or 99+ if the number is over 99.
    const chipCount = count > 99 ? `${ninetyNinePlus}` : `${count}`;
    // The screenreader will hear what the number of selected values is along with instructions
    // like Click to see the full list.
    const valuesSelectedText = translations.selectMultiple_valuesSelected({
        VALUE_COUNT: `${count}`
    });
    const label = `${accLabel}${valuesSelectedText} ${instructions}`;
    return (jsxRuntime.jsx("div", { class: UNSAFE_SelectMultiple_themes_SelectedValuesCountStyles_css.selectedValueCountStyles.base, onKeyDown: onKeyDown, onKeyUp: onKeyUp, onMouseDown: onMouseDown, children: jsxRuntime.jsx(Chip.Chip, { "aria-label": label, ...passThroughProps, children: chipCount }) }));
}

function SelectMultipleField({ children, columnSpan, fieldLabel, hasInsideLabel, isBackButtonShown, isClearButtonShown, isDropdownArrowShown, isDropdownSelectedOnlyView, isSelectedValuesCountShown, selectedValuesCount, onBackButtonClick, onClearButtonClick, onDropdownArrowClick, onSelectedValuesCountKeyDown, onSelectedValuesCountKeyUp, onSelectedValuesCountMouseDown, onSelectedValuesCountToggle, ...passThroughTextFieldProps }) {
    const { isDisabled, isLoading } = useFormFieldContext.useFormFieldContext();
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const backButton = isBackButtonShown ? (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": translations.selectMultiple_back(), size: "xs", variant: "ghost", onAction: onBackButtonClick, children: jsxRuntime.jsx(CancelS.SvgNavLeft, {}) })) : null;
    const clearButton = isClearButtonShown ? (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": translations.formControl_clear(), size: "sm", variant: "ghost", onAction: onClearButtonClick, children: jsxRuntime.jsx(CancelS.SvgCancelS, {}) })) : null;
    const dropdownArrow = isDropdownArrowShown ? (jsxRuntime.jsx(useSelectCommon.DropdownArrow, { isDisabled: isDisabled, onClick: onDropdownArrowClick, testId: `${passThroughTextFieldProps.testId}_dropdownarrow` })) : null;
    const endContent = isLoading ? undefined : !isSelectedValuesCountShown ? (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [isClearButtonShown && clearButton, isDropdownArrowShown && dropdownArrow] })) : (jsxRuntime.jsxs(Flex.Flex, { align: "center", justify: "center", gap: [0, '1x'], children: [jsxRuntime.jsx(SelectedValuesCount, { "aria-label": fieldLabel, count: selectedValuesCount, isDisabled: isDisabled, isSelected: isDropdownSelectedOnlyView, onKeyDown: onSelectedValuesCountKeyDown, onKeyUp: onSelectedValuesCountKeyUp, onMouseDown: onSelectedValuesCountMouseDown, onToggle: onSelectedValuesCountToggle }), isClearButtonShown && clearButton, isDropdownArrowShown && dropdownArrow] }));
    return (jsxRuntime.jsx(TextField.TextField, { columnSpan: columnSpan, startContent: isBackButtonShown && backButton, mainContent: children, endContent: endContent, ...passThroughTextFieldProps }));
}

/**
 * The component for rendering selectable/removable TextTag
 *
 * @param param0 The props for the TextTag component
 */
function TextTag({ children, removeIcon = 'never', isSelected = false, onRemoveAction, onSelect, onRemoveIconClick, isFocused, value }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const spanRef = hooks.useRef(null);
    const navigationTextId = useId.useId();
    const rootClasses = classNames.classNames([UNSAFE_SelectMultiple_themes_TextTagStyles_css.textTagStyles.base, isSelected && UNSAFE_SelectMultiple_themes_TextTagStyles_css.textTagStyles.selected]);
    const onRemoveActionCallback = hooks.useCallback(() => {
        onRemoveAction?.(value);
    }, [value, onRemoveAction]);
    const onSelectCallback = hooks.useCallback(() => {
        onSelect?.(value);
    }, [value, onSelect]);
    const onRemoveIconClickCallback = hooks.useCallback(() => {
        onRemoveIconClick?.(value);
    }, [value, onRemoveIconClick]);
    const onKeyUp = hooks.useCallback((event) => {
        if (keyboardUtils.isBackspaceOrDelete(event)) {
            onRemoveActionCallback();
            return;
        }
    }, [onRemoveActionCallback]);
    hooks.useEffect(() => {
        if (isFocused && isSelected) {
            spanRef.current?.focus();
            spanRef.current?.scrollIntoView({ block: 'nearest' });
        }
    }, [isFocused, isSelected]);
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsxs("span", { ref: spanRef, class: rootClasses, tabIndex: -1, onClick: onSelectCallback, onKeyUp: onKeyUp, 
                // Kill mouse down event to prevent focus transfer done by the parent container.
                // We will programmatically take back focus in response to the onClick event.
                onMouseDown: useSelectCommon.preventDefault, role: "option", "aria-describedby": navigationTextId, "aria-selected": isSelected ? 'true' : 'false', children: [jsxRuntime.jsx(Text.Text, { size: "md", variant: "inherit", children: children }), removeIcon === 'always' && (jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: false }, children: jsxRuntime.jsx(IconButton.IconButton, { size: "xs", variant: "ghost", onAction: onRemoveIconClickCallback, children: jsxRuntime.jsx(Close.SvgClose, {}) }) }))] }), jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: navigationTextId, children: translations.selectMultiple_removeSelectedTagInstructionText() })] }));
}

/**
 * Supported style props
 */
const supportedDimensions = ['maxWidth'];
/**
 * Setting up interpolations
 */
const supportedInterpolations = Array.from(supportedDimensions, (x) => dimensions.dimensionInterpolations[x]);
const styleInterpolations = mergeInterpolations.mergeInterpolations(supportedInterpolations);
/**
 * TextTagList component for rendering the collection of TextTags as well
 * as managing the navigation.
 *
 * @param param0 The props for the TextTagList component
 * @param ref The ref for the component
 */
function _TextTagList(props, ref = () => { }) {
    // destructure props
    const { 'aria-label': ariaLabel, data, hasInsideLabel = false, removeIcon = 'never', onExitNavigation, onRemove } = props;
    // ref for setting the scroll position for the div
    const divRef = hooks.useRef(null);
    // Internal state for storing the current selected tags
    const [selectedTags, setSelectedTags] = hooks.useState([]);
    // The navigation of focus will depend on the reading direction, so we need to
    // get the current reading direction
    const { direction } = useUser.useUser();
    // Create a ref for maintaining the current selected tag. This is used for
    // determining which tag needs to be selected next when pressing ArrowLeft or
    // ArrowRight.
    const currentSelectedTagIndex = hooks.useRef(-1);
    // Create a ref that holds the last tag which is needed when receiving focus
    // programmatically.
    const lastTag = data.at(-1)?.value;
    const lastTagMeta = hooks.useRef({ value: lastTag, index: data.length - 1 });
    lastTagMeta.current = { value: lastTag, index: data.length - 1 };
    // A function to select the tag at the given index
    const selectTagAtIndex = hooks.useCallback((index) => {
        const key = data.at(index)?.value;
        if (key == null)
            return;
        setSelectedTags([key]);
    }, [data] // setSelectedTags is stable and not needed in dep array
    );
    // A function to clear the selection
    const clearSelection = hooks.useCallback(() => {
        setSelectedTags((previousSelectedTags) => {
            currentSelectedTagIndex.current = -1;
            return previousSelectedTags.length ? [] : previousSelectedTags;
        });
    }, []); // setSelectedTags is stable and not needed in dep array
    // Handle the remove & delete events from the tags
    const onTagRemoveIconClick = hooks.useCallback((value) => {
        // on remove icon click we only need to remove the tag that
        // invoked the event
        onRemove?.([value]);
        onExitNavigation?.();
        // Firefox & Safari are not calling onBlur when focusing out of the
        // tag list through onExitNavigation, so clear the selections explicitly
        // here.
        clearSelection();
    }, [clearSelection, onExitNavigation, onRemove]);
    const onTagRemoveAction = hooks.useCallback((value) => {
        // on delete action we need to remove the tag that invoked the delete action
        // as well as the selected tags.
        const valuesToRemove = [...selectedTags];
        if (!selectedTags.includes(value)) {
            valuesToRemove.push(value);
        }
        onRemove?.(valuesToRemove);
        onExitNavigation?.();
        // Firefox & Safari are not calling onBlur when focusing out of the
        // tag list through onExitNavigation, so clear the selections explicitly
        // here.
        clearSelection();
    }, [selectedTags, clearSelection, onExitNavigation, onRemove]);
    // Handle the select event from the tags
    const onTagSelect = hooks.useCallback((value) => {
        setSelectedTags([value]);
        currentSelectedTagIndex.current = data.findIndex((tag) => tag.value === value);
    }, [data, setSelectedTags]);
    // Handle keyDown event on the tags container
    const onTagKeyDown = hooks.useCallback((event) => {
        if (data.length === 0)
            return;
        // Move towards the beginning of the list when pressing
        // Left arrow (or Right arrow in rtl).
        if ((direction === 'ltr' && event.code === 'ArrowLeft') ||
            (direction === 'rtl' && event.code === 'ArrowRight')) {
            if (currentSelectedTagIndex.current === 0)
                return;
            currentSelectedTagIndex.current -= 1;
            selectTagAtIndex(currentSelectedTagIndex.current);
            return;
        }
        // Move towards the end of the list when pressing
        // Right arrow (or Left arrow in rtl). If at the end,
        // invoke onExitNavigation.
        if ((direction === 'ltr' && event.code === 'ArrowRight') ||
            (direction === 'rtl' && event.code === 'ArrowLeft')) {
            if (currentSelectedTagIndex.current === data.length - 1) {
                // We have reached the end, so exit navigation
                onExitNavigation?.();
                return;
            }
            currentSelectedTagIndex.current += 1;
            selectTagAtIndex(currentSelectedTagIndex.current);
            return;
        }
        // When pressing the Home key, move the focus to the first tag
        if (event.code === 'Home') {
            currentSelectedTagIndex.current = 0;
            selectTagAtIndex(currentSelectedTagIndex.current);
            return;
        }
        // When pressing the End key, move the focus to the last tag
        if (event.code === 'End') {
            currentSelectedTagIndex.current = data.length - 1;
            selectTagAtIndex(currentSelectedTagIndex.current);
            return;
        }
        // If it is a Select All event, then select all the tags and do
        // not move the focus
        if (keyboardUtils.isSelectAll(event)) {
            setSelectedTags(data.map((tag) => tag.value));
            // prevent default to prevent selection of the whole screen
            event.preventDefault();
            return;
        }
    }, [data, direction, onExitNavigation, selectTagAtIndex, setSelectedTags]);
    const handleOnFocus = hooks.useCallback(() => {
        setSelectedTags((previousSelectedTags) => {
            // select the tag only if there are no current selected tags
            // and there is data
            if (previousSelectedTags.length || lastTagMeta.current.value === undefined)
                return previousSelectedTags;
            currentSelectedTagIndex.current = lastTagMeta.current.index;
            return [lastTagMeta.current.value];
        });
    }, []); // setSelectedTags is stable and not needed in the dep array
    const handleOnBlur = hooks.useCallback(() => {
        clearSelection();
    }, [clearSelection]);
    // When blurring out of the component, remove all selections
    const { focusProps } = useFocusWithin.useFocusWithin({
        onBlurWithin: handleOnBlur
    });
    // Update the ref to include the handler methods
    hooks.useImperativeHandle(ref, () => ({
        blur: handleOnBlur,
        focus: handleOnFocus
    }), [handleOnBlur, handleOnFocus]);
    hooks.useEffect(() => {
        // every time the data is changed, scroll to the end of the list to show the latest added
        // pill
        // In ltr we need to scroll to the right, so positive value should be passed and in rtl we
        // need to scroll to the left, so negative value should be passed
        divRef.current?.scrollTo({
            left: divRef.current.scrollWidth * (direction === 'ltr' ? 1 : -1)
        });
    }, [data, direction]);
    // the styles for the component
    const styles = styleInterpolations(props);
    // TODO: use theming and multi-variant styles
    // 
    const rootClasses = classNames.classNames([
        UNSAFE_SelectMultiple_themes_TextTagListStyles_css.textTagListStyles.textTagListBase,
        hasInsideLabel && UNSAFE_SelectMultiple_themes_TextTagListStyles_css.textTagListStyles.textTagListInsideLabel
    ]);
    return (jsxRuntime.jsx("div", { class: rootClasses, ref: divRef, tabIndex: -1, onKeyDown: onTagKeyDown, role: "listbox", "aria-label": ariaLabel, "aria-multiselectable": "true", style: styles, ...focusProps, children: data.map((tag, index) => (jsxRuntime.jsx(TextTag, { isFocused: currentSelectedTagIndex.current === index, isSelected: selectedTags.includes(tag.value), onRemoveAction: onTagRemoveAction, onSelect: onTagSelect, onRemoveIconClick: onTagRemoveIconClick, removeIcon: removeIcon, value: tag.value, children: tag.label }, tag.value))) }));
}
const TextTagList = compat.forwardRef(_TextTagList);

function SelectMultipleFieldInput({ displayValue, isAddToListShown, isKeyboardNavigable, isTextTagListShown, isUserFiltering, liveRegionText, onExitNavigation, onRemove, removeIcon, selectedValuesDescriptionId, selectedValuesKeyboardNavDescriptionId, textTagListData, textTagListRef, userInput, virtualKeyboard, ...passThroughTextFieldInputProps }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const addToListAccText = isAddToListShown ? translations.select_addToListAvailable() : undefined;
    // Add the text tags navigation accessible text to the aria description for the input if there
    // are any selected values and the component is keyboard navigable.
    // Also add an aria live region if the status changes while the input already has focus because
    // at that time the aria description will not be read out again.  Remove the aria live region
    // when the input loses focus.
    const accTextTagsNav = isKeyboardNavigable && displayValue && displayValue.length > 0
        ? translations.selectMultiple_highlightSelectedTagsInstructionText()
        : undefined;
    const { isInputFocused } = useFormFieldContext.useFormFieldContext();
    const [prevAccTextTagsNav, setPrevAccTextTagsNav] = hooks.useState(accTextTagsNav);
    const [isAccTextTagsNavLive, setIsAccTextTagsNavLive] = hooks.useState(false);
    isInputFocused &&
        isTextTagListShown &&
        !prevAccTextTagsNav &&
        accTextTagsNav &&
        !isAccTextTagsNavLive
        ? setIsAccTextTagsNavLive(true)
        : !isInputFocused && isAccTextTagsNavLive
            ? setIsAccTextTagsNavLive(false)
            : {};
    if (prevAccTextTagsNav !== accTextTagsNav) {
        setPrevAccTextTagsNav(accTextTagsNav);
    }
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [isTextTagListShown && (jsxRuntime.jsx(TextTagList, { "aria-label": translations.selectMultiple_selectedValues(), data: textTagListData, hasInsideLabel: passThroughTextFieldInputProps.hasInsideLabel, maxWidth: "50%", onExitNavigation: onExitNavigation, onRemove: onRemove, ref: textTagListRef, removeIcon: removeIcon })), jsxRuntime.jsx(Flex.Flex, { flex: 1, children: jsxRuntime.jsx(TextFieldInput.TextFieldInput, { "aria-autocomplete": "list", autoComplete: "off", 
                    // When focused, we show the tag list, which can be treated as having prefix
                    hasPrefix: isTextTagListShown, role: "combobox", hasEndContent: true, spellcheck: false, type: virtualKeyboard === 'auto' ? 'search' : virtualKeyboard, value: isUserFiltering || isTextTagListShown ? userInput : displayValue, ...passThroughTextFieldInputProps }) }), 
            // Show description text when focused as we will not be
            // showing display text in the input.
            isTextTagListShown && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: selectedValuesDescriptionId, 
                // We want the content to be hidden for screen readers too by default.
                // But, it will be overridden when we link the aria-describedby attribute.
                // Otherwise, the content here will be read twice.
                isHidden: true, children: displayValue })), 
            // Add the text tags navigation accessible text to the aria description for the input
            // if there are any selected values and the component is keyboard navigable.
            // (Don't add it if we're adding a live region for the same text because then it
            // gets read out twice by the screen reader, for some reason.)
            isTextTagListShown && accTextTagsNav && !isAccTextTagsNavLive && (jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { id: selectedValuesKeyboardNavDescriptionId, 
                // We want the content to be hidden for screen readers too by default.
                // But, it will be overridden when we link the aria-describedby attribute.
                // Otherwise, the content here will be read twice.
                isHidden: true, children: accTextTagsNav })), jsxRuntime.jsx(LiveRegion.LiveRegion, { children: liveRegionText }), 
            // Add an aria live region for the text tags navigation accessible text if the status
            // changes while the input already has focus because at that time the aria description
            // will not be read out again.
            // (Add the region itself whenever the text tags are shown so that it's already in the
            // DOM when we want to populate it with text.  If we dynamically add the region itself
            // at that time, the screen reader (JAWS) may not read it at all, for some reason.)
            isTextTagListShown && (jsxRuntime.jsx(LiveRegion.LiveRegion, { children: isAccTextTagsNavLive ? accTextTagsNav : undefined })), isAddToListShown ? jsxRuntime.jsx(LiveRegion.LiveRegion, { children: addToListAccText }) : undefined] }));
}

function MobileDropdownFooter({ onApply }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    return (jsxRuntime.jsx("div", { class: UNSAFE_SelectMultiple_themes_MobileDropdownFooterStyles_css.mobileDropdownFooterStyles.base, children: jsxRuntime.jsx(Button.Button, { display: "label", edge: "bottom", label: translations.selectMultiple_apply(), size: "sm", variant: "callToAction", onAction: onApply }) }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useDisplayValues(itemText, valueItems) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const separator = translations.plural_separator();
    // create the text displayed in the field from the selected values
    const concatenatedDisplayValues = hooks.useMemo(() => {
        if (valueItems === undefined) {
            return '';
        }
        const displayValues = createDisplayValues(itemText, valueItems);
        const concatenatedDisplayValues = concatDisplayValues(displayValues, separator);
        return concatenatedDisplayValues;
    }, [itemText, separator, valueItems]);
    // create the text tags to display when the component is focused
    const textTags = hooks.useMemo(() => (valueItems === undefined ? [] : createTextTags(itemText, valueItems)), [itemText, valueItems]);
    return {
        displayValue: concatenatedDisplayValues,
        textTags
    };
}
function concatDisplayValues(displayValues, separator) {
    return Array.from(displayValues.values()).join(separator);
}
function createDisplayValues(itemText, selectedItems) {
    const arValues = selectedItems ? [...selectedItems?.values()] : [];
    const mapFunc = (itemContext) => useSelectCommon.renderItemText(itemContext, itemText);
    const mappedArray = arValues.map(mapFunc);
    return new Set(mappedArray);
}
function createTextTags(itemText, selectedItems = []) {
    return selectedItems.map((item) => ({
        label: useSelectCommon.renderItemText(item, itemText) ?? '',
        value: item.key
    }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Get the data to show in the dropdown for the selected-only view.
 * While the component is showing only selected values in the dropdown, that list of values should
 * not change as the user deselects items within it.  For example, if the list initially shows
 * selected items "Item A" and "Item B", and the user deselects "Item B", we do not want to remove
 * "Item B" from the list.  The reason is that the user may want to reselect it again.  So the
 * list should remain static as of the time the user toggled the selected-only view on.
 * If isDropdownSelectedOnlyView is false, then the data returned from this hook will be undefined.
 * If isDropdownSelectedOnlyView is true, then the data returned from this hook will consist of
 * all of the valueItems that were selected at the time isDropdownSelectedOnlyView was set to true.
 * @param isDropdownSelectedOnlyView Whether the component is showing only selected
 * values in the dropdown: true if so, false if not.
 * @param valueItems The keys, data, and optional metadata for the selected values.
 * @returns An object with data and onLoadRange properties that can be passed on to the
 * list in the dropdown.
 */
function useSelectedOnlyData({ isDropdownSelectedOnlyView = false, valueItems }) {
    const STABLE_dataStateFactory = useEffectEvent.useEffectEvent((isDropdownSelectedOnlyView) => !isDropdownSelectedOnlyView || !valueItems || valueItems.length === 0
        ? undefined
        : {
            offset: 0,
            totalSize: valueItems.length,
            sizePrecision: 'exact',
            data: valueItems.map((valueItem) => {
                return { data: valueItem.data, metadata: valueItem.metadata ?? { key: valueItem.key } };
            })
            // Need to specify type of useMemo here so that dependent code in SelectMultiple and
            // useSelectMultiple doesn't show a type error related to the sizePrecision prop on DataState:
            //   Type 'string' is not assignable to type '"exact" | "atLeast"'.
        });
    // Note that useMemo here only depends on isDropdownSelectedOnlyView because we only want to
    // recalculate when that value changes.  While the selected only view is shown, we want the
    // data set to remain static with the set of valueItems as of the time the view was changed to
    // only show selected items so that the user can deselect and reselect items.
    // If useMemo depended on the valueItems too, then the data set would change as the user
    // deselected items, which means those items would disappear from the dropdown and the user
    // could not reselect them.
    // STABLE_dataStateFactory is guaranteed to be stable, so its reference will not change between
    // renders.
    const data = hooks.useMemo(() => {
        return STABLE_dataStateFactory(isDropdownSelectedOnlyView);
    }, [STABLE_dataStateFactory, isDropdownSelectedOnlyView]);
    return {
        data,
        onLoadRange: undefined
    };
}

// use const for default valueItems so that it doesn't create a new empty array on every render
const DEFAULT_VALUE_ITEMS = [];
function useMobileDropdown({ data, inputRef, isDropdownOpen, isDropdownSelectedOnlyView, itemText, textTagListRef, userInput, valueItems = DEFAULT_VALUE_ITEMS, onCommit, onLoadRange, setDropdownOpen, setUserInput, stopFiltering }) {
    const [currentRow, setCurrentRow] = hooks.useState({
        rowKey: undefined
    });
    const [dropdownSelectedKeys, setDropdownSelectedKeys] = hooks.useState(keysFromValueItems(valueItems));
    const [isInternalSelectedOnlyView, setIsInternalSelectedOnlyView] = hooks.useState(isDropdownSelectedOnlyView);
    const dataCache = hooks.useRef(new Map());
    const currentValueItems = hooks.useMemo(() => {
        const items = [];
        dropdownSelectedKeys.forEach((key) => {
            // Initially check if they are in valueItems
            const item = valueItems.find((item) => item.key === key);
            if (item) {
                items.push(item);
                return;
            }
            // otherwise check if it is available in the dataCache
            if (dataCache.current.has(key)) {
                items.push(dataCache.current.get(key));
            }
        });
        return items;
    }, [dropdownSelectedKeys, valueItems]);
    const { textTags, displayValue } = useDisplayValues(itemText, currentValueItems);
    // Create a ref for the input in the dropdown
    const dropdownInputRef = hooks.useRef(null);
    // show only the selected values in the dropdown if isDropdownSelectedOnlyView is true,
    // otherwise show the full data set
    // TODO: We may need to revisit this for hierarchical data because the selected valueItems
    // won't have any information about ancestor group nodes, and we should probably show selected
    // items in context within the hierarchy.  Also, the order of the items in the selected-only
    // view right now follows the order in which they were selected, not the order in which they
    // would appear in the full data set.  This may be more of a problem for hierarchical data
    // if items have to appear within the correct group ancestors.  We may need to move
    // construction of the selected-only DataState out of the component to the consuming code,
    // and take a callback that we can call as a notification that the app should provide this
    // special DataState to us (kind of like onLoadRange).  Note that we may also need an
    // enhancement on the DataProvider API to be able to specify a filterCriterion to filter by
    // the selected keys through a fetchFirst call, because a regular fetchByKeys call would
    // still return results in the order in which the keys were specified and would not return
    // data for the ancestor group nodes.
    const { data: selectedOnlyData, onLoadRange: selectedOnlyOnLoadRange } = useSelectedOnlyData({
        isDropdownSelectedOnlyView: isInternalSelectedOnlyView,
        valueItems: currentValueItems
    });
    const onCurrentKeyChange = hooks.useCallback((detail) => {
        setCurrentRow({ rowKey: detail.value });
    }, [setCurrentRow]);
    const onSelectionChange = hooks.useCallback((detail) => {
        const newKeys = new Set(detail.value.keys?.values());
        // update the dropdownSelectedKeys so that the selection visual state of the collection
        // updates immediately while waiting for new valueItems to be set
        setDropdownSelectedKeys(newKeys);
        // clear the filter text typed by the user, but do NOT clear the actual filter criterion
        // or highlighting in the list
        setUserInput('');
        // update the data cache on each selection if data is present
        if (data) {
            updateCache(dataCache.current, data, newKeys);
        }
    }, [data, setDropdownSelectedKeys, setUserInput]);
    const onSelectedValuesCountToggle = hooks.useCallback(({ value = false }) => {
        setIsInternalSelectedOnlyView((currentIsInternalSelectedOnlyView) => {
            // if the selected only toggle is enabled, we need to stop user filtering
            if (currentIsInternalSelectedOnlyView !== value) {
                stopFiltering();
            }
            return value;
        });
    }, [setIsInternalSelectedOnlyView, stopFiltering]);
    const closeDropdown = hooks.useCallback(() => {
        // reset dropdownSelectedKeys as you close the dropdown so that
        // the next time the dropdown is opened, it will have the actual component's valueItems
        setDropdownSelectedKeys(new Set(valueItems.map((v) => v.key)));
        // Empty the cached map
        dataCache.current.clear();
        setDropdownOpen(false);
        // stop filtering before closing the dropdown
        stopFiltering();
        // revert the focus back to the main field
        inputRef.current?.focus();
    }, [inputRef, setDropdownOpen, stopFiltering, valueItems]);
    const onApply = hooks.useCallback(() => {
        // Commit the current value items and close the dropdown
        onCommit({
            previousValue: keysFromValueItems(valueItems),
            value: dropdownSelectedKeys
        });
        closeDropdown();
    }, [dropdownSelectedKeys, valueItems, closeDropdown, onCommit]);
    const onBackButtonClick = hooks.useCallback(() => {
        closeDropdown();
    }, [closeDropdown]);
    const onClearButtonClick = hooks.useCallback(() => {
        setDropdownSelectedKeys(new Set());
        stopFiltering();
    }, [stopFiltering]);
    const onTextTagRemove = hooks.useCallback((keys) => {
        const newSelectedKeys = new Set(dropdownSelectedKeys);
        keys.forEach((key) => newSelectedKeys.delete(key));
        setDropdownSelectedKeys(newSelectedKeys);
    }, [dropdownSelectedKeys]);
    const onTextTagExitNavigation = hooks.useCallback(() => {
        // Focus the input on the next tick. Doing it in the same event cycle will
        // trigger the key press on the input element which makes the caret move by
        // one character.
        setTimeout(() => dropdownInputRef.current?.focus(), 0);
    }, []);
    const wasDropdownOpen = hooks.useRef(isDropdownOpen);
    hooks.useEffect(() => {
        // if the dropdown is open, ignore any valueItems update
        if (isDropdownOpen) {
            // if it was open before, then this is a valueItems change, so no action
            if (wasDropdownOpen.current)
                return;
            // otherwise this dropdown is opened now, so set the focus on the input field
            setTimeout(() => dropdownInputRef.current?.focus(), 0);
            wasDropdownOpen.current = true;
            return;
        }
        wasDropdownOpen.current = false;
    }, [isDropdownOpen]);
    const [prevValueItems, setPrevValueItems] = hooks.useState(valueItems);
    if (prevValueItems !== valueItems) {
        // if dropdown is closed, keep the valueItems in sync with the dropdown selected keys
        if (!isDropdownOpen) {
            setDropdownSelectedKeys((prevDropdownSelectedKeys) => {
                const nextDropdownSelectedKeys = keysFromValueItems(valueItems);
                // since valueItems can be a different array with the same values and keysFromValueItems
                // will create a new set every time, compare the value and update the set only if the
                // values have changed
                return equals.equals(prevDropdownSelectedKeys, nextDropdownSelectedKeys)
                    ? prevDropdownSelectedKeys
                    : nextDropdownSelectedKeys;
            });
        }
        setPrevValueItems(valueItems);
    }
    return {
        collectionProps: {
            currentKey: currentRow.rowKey,
            data: isInternalSelectedOnlyView ? selectedOnlyData : data,
            selectedKeys: dropdownSelectedKeys,
            onCurrentKeyChange,
            onLoadRange: isInternalSelectedOnlyView ? selectedOnlyOnLoadRange : onLoadRange,
            onSelectionChange
        },
        footerProps: {
            onApply
        },
        selectMultipleFieldInputProps: {
            displayValue,
            hasEmptyLabel: false,
            hasInsideLabel: true,
            inputRef: dropdownInputRef,
            isTextTagListShown: textTags.length > 0,
            isUserFiltering: true,
            removeIcon: 'always',
            userInput,
            textTagListData: textTags,
            textTagListRef: textTagListRef,
            onExitNavigation: onTextTagExitNavigation,
            onRemove: onTextTagRemove
        },
        selectMultipleFieldProps: {
            hasInsideLabel: true,
            isBackButtonShown: true,
            isClearButtonShown: !useSelectCommon.isSearchTextEmptyOrUndefined(userInput) || textTags.length !== 0,
            isDropdownArrowShown: false,
            isDropdownSelectedOnlyView: isInternalSelectedOnlyView,
            isSelectedValuesCountShown: dropdownSelectedKeys.size > 0 || isInternalSelectedOnlyView,
            selectedValuesCount: dropdownSelectedKeys.size,
            styleVariant: 'embedded',
            onBackButtonClick,
            onClearButtonClick
        },
        selectedValuesCountProps: {
            onSelectedValuesCountToggle
        },
        isDropdownSelectedOnlyView: isInternalSelectedOnlyView
    };
}
/**
 * A function to cache the data for the current set of keys from the current data state
 * and current set of keys.
 *
 * The idea is that, the data state might not contain all the selected keys. However, as
 * a key is selected, if we update the cache, it will always contain the data for the selected
 * keys. Reason is that, when a key is selected, at that moment it will be in the current data
 * state. We will fetch that information and store it. While the current data state might not
 * contain information about all the selected keys, it will always have the information about
 * current selected key.
 *
 * @param cache The data cache
 * @param data The current data state
 * @param keys The current set of keys
 */
const updateCache = (cache, data, keys) => 
// iterate through the data and if a selected key's match is found, update the cache
data.data.forEach((item) => {
    if (!keys.has(item.metadata.key))
        return;
    cache.set(item.metadata.key, {
        data: item.data,
        key: item.metadata.key,
        metadata: item.metadata
    });
});
/**
 * Extract keys from a value items array.
 *
 * @param valueItems The value items from which the keys are to be extracted
 * @returns The set of keys
 */
const keysFromValueItems = (valueItems) => new Set(valueItems.map((i) => i.key));

function SelectMultipleMobileDropdown({ 'aria-describedby': ariaDescribedBy, 'aria-label': ariaLabel, assistiveText, data, dropdownId, enabledElementRef, helpSourceLink, helpSourceText, isAddToListShown, isDisabled, isEmptyResults, isFocused, isLoading, isOpen, isReadonly, isRequired, isSelectedOnlyView: propIsSelectedOnlyView, isUserFiltering, itemRenderer, itemText, label, liveRegionText, placeholder, propIsLoading, searchText, selectedValuesDescriptionId, setDropdownOpen, setUserInput, stopFiltering, textAlign, textTagListRef, userAssistanceDensity, userInput, valueItems, virtualKeyboard, onAddToListAction, onCommit, onFieldBlur, onFieldFocus, onFieldInput, onFieldKeyDown, onFieldKeyUp, onLoadRange }) {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const { collectionProps: mobileDropdownCollectionProps, footerProps: mobileDropdownFooterProps, selectMultipleFieldInputProps: mobileDropdownSelectMultipleFieldInputProps, selectMultipleFieldProps: mobileDropdownSelectMultipleFieldProps, selectedValuesCountProps: mobileDropdownSelectedValueCountProps, isDropdownSelectedOnlyView } = useMobileDropdown({
        data,
        inputRef: enabledElementRef,
        isDropdownOpen: isOpen,
        isDropdownSelectedOnlyView: propIsSelectedOnlyView,
        itemText,
        textTagListRef,
        userInput,
        valueItems,
        onCommit,
        onLoadRange,
        setDropdownOpen,
        setUserInput,
        stopFiltering
    });
    // for dropdown field
    const { formFieldContext: mobileDropdownFormFieldContext, inputProps: mobileDropdownInputProps, labelProps: mobileDropdownLabelProps, textFieldProps: mobileDropdownTextFieldProps, userAssistanceProps: mobileDropdownUserAssistanceProps } = useTextField.useTextField({
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
        value: mobileDropdownSelectMultipleFieldProps.selectedValuesCount > 0 ? true : undefined
    });
    // JET-54256 - inside label animates up on initial display with selected value
    // If we're waiting for the selected values to load, the component should look like it
    // has a value in the meantime.
    // Use the original propIsLoading instead of isLoading because we don't want to delay
    // the inside label position by a timer like we do the progressive loading indicator.
    mobileDropdownFormFieldContext.hasValue =
        propIsLoading || mobileDropdownFormFieldContext.hasValue;
    const mobileDropdownFieldLabelProps = {
        label: jsxRuntime.jsx(Label.Label, { ...mobileDropdownLabelProps, children: label }),
        labelEdge: 'inside'
    };
    const dropdownInlineUserAssistance = isOpen &&
        !isDisabled &&
        !isReadonly &&
        (assistiveText || helpSourceLink) &&
        (userAssistanceDensity === 'efficient' || userAssistanceDensity === 'reflow') ? (jsxRuntime.jsx(useSelectCommon.DropdownUserAssistance, { assistiveText: assistiveText, fieldLabel: label, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, userAssistanceDensity: userAssistanceDensity, ...mobileDropdownUserAssistanceProps })) : undefined;
    const dropdownListContent = isEmptyResults ? (isAddToListShown ? undefined : (jsxRuntime.jsx(useSelectCommon.EmptyResults, {}))) : (jsxRuntime.jsx(useSelectCommon.DefaultList, { ...mobileDropdownCollectionProps, "aria-label": label ?? '', itemRenderer: itemRenderer, itemText: itemText, searchText: isDropdownSelectedOnlyView ? undefined : isUserFiltering ? searchText : undefined, selectionMode: "multiple" }));
    const addToListContent = isAddToListShown ? (jsxRuntime.jsx(useSelectCommon.LinkItem, { onAction: onAddToListAction, children: translations.select_addToList() })) : undefined;
    return (jsxRuntime.jsx(useSelectCommon.SelectMobileDropdown, { header: jsxRuntime.jsxs(FormFieldContext.FormFieldContext.Provider, { value: mobileDropdownFormFieldContext, children: [jsxRuntime.jsx(View.View, { children: jsxRuntime.jsx(SelectMultipleField, { fieldLabel: label, onBlur: onFieldBlur, onFocus: onFieldFocus, ...mobileDropdownFieldLabelProps, ...mobileDropdownTextFieldProps, ...mobileDropdownSelectMultipleFieldProps, ...mobileDropdownSelectedValueCountProps, children: jsxRuntime.jsx(SelectMultipleFieldInput, { "aria-controls": dropdownId, "aria-expanded": isOpen, "aria-label": ariaLabel, isAddToListShown: isAddToListShown, isRequired: isRequired, liveRegionText: liveRegionText, placeholder: placeholder, selectedValuesDescriptionId: selectedValuesDescriptionId, textAlign: textAlign, virtualKeyboard: virtualKeyboard, onInput: onFieldInput, onKeyDown: onFieldKeyDown, onKeyUp: onFieldKeyUp, ...mobileDropdownInputProps, ...mobileDropdownSelectMultipleFieldInputProps }) }) }), dropdownInlineUserAssistance] }), footer: jsxRuntime.jsx(MobileDropdownFooter, { ...mobileDropdownFooterProps }), id: dropdownId, isOpen: isOpen, children: jsxRuntime.jsxs(useSelectCommon.DropdownList, { hasTopGap: !addToListContent, hasBottomGap: true, isLoading: data === null, children: [dropdownListContent, addToListContent] }) }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages SelectMultiple state and behavior.  This hook creates state variables and
 * event listeners, returning properties to apply to components internally rendered by
 * SelectMultiple, as well as state information.
 *
 * @param ariaDescribedBy Specifies the ID of elements that describe the input.
 * @param data Specifies data for the dropdown list.
 * @param inputRef Ref to the input element (this can be an input in desktop and a div in mobile).
 * @param isDisabled Specifies whether the component is disabled.
 * @param isFocused Specifies whether the component has focus.
 * @param isReadonly Specifies whether the component is readonly.
 * @param onCommit Callback invoked when the selected values are committed.
 * @param onFilter Callback function to trigger loading data for the dropdown list,
 * which may or may not be filtered by user entered text.
 * @param onLoadRange Callback function to handle when the viewport of the dropdown list has
 * changed, including the case where the user scrolls to the end of the list and there are more
 * items to load.  The function should set a new DataState on the component for the specified
 * range.
 * @param valueItems Specifies the keys, data, and optional metadata for the selected values.
 *
 * @returns Properties to apply to internal components that SelectMultiple renders, and component
 * state.
 */
function useSelectMultiple({ addToList, ariaDescribedBy, data: propData, inputRef, isDisabled, isFocused: propIsFocused, isReadonly, onAddToListAction, onCommit, onFilter, onLoadRange: propOnLoadRange, valueItems }) {
    const [isDropdownSelectedOnlyView, setDropdownSelectedOnlyView] = hooks.useState(false);
    const selectedValuesCount = valueItems?.length;
    const hasSelectedValuesCount = (selectedValuesCount !== undefined && selectedValuesCount > 0) || isDropdownSelectedOnlyView;
    // show only the selected values in the dropdown if isDropdownSelectedOnlyView is true,
    // otherwise show the full data set
    // TODO: We may need to revisit this for hierarchical data because the selected valueItems
    // won't have any information about ancestor group nodes, and we should probably show selected
    // items in context within the hierarchy.  Also, the order of the items in the selected-only
    // view right now follows the order in which they were selected, not the order in which they
    // would appear in the full data set.  This may be more of a problem for hierarchical data
    // if items have to appear within the correct group ancestors.  We may need to move
    // construction of the selected-only DataState out of the component to the consuming code,
    // and take a callback that we can call as a notification that the app should provide this
    // special DataState to us (kind of like onLoadRange).  Note that we may also need an
    // enhancement on the DataProvider API to be able to specify a filterCriterion to filter by
    // the selected keys through a fetchFirst call, because a regular fetchByKeys call would
    // still return results in the order in which the keys were specified and would not return
    // data for the ancestor group nodes.
    const selectedOnlyDataProps = useSelectedOnlyData({
        isDropdownSelectedOnlyView,
        valueItems
    });
    const data = isDropdownSelectedOnlyView ? selectedOnlyDataProps.data : propData;
    const onLoadRange = isDropdownSelectedOnlyView
        ? selectedOnlyDataProps.onLoadRange
        : propOnLoadRange;
    const handleOnFilter = hooks.useCallback((args) => {
        // when the user is filtering, we need to toggle out from selected only view
        // we consider it filtering only if there is a non-empty filter text is present
        if (!useSelectCommon.isSearchTextEmptyOrUndefined(args.searchText)) {
            setDropdownSelectedOnlyView(false);
        }
        onFilter?.(args);
    }, [onFilter]); // setDropdownSelectedOnlyView is stable so not needed in dep array
    const { currentRow, dropdownRef, handleDropdownArrowClick, handleDropdownAutoDismiss: baseHandleDropdownAutoDismiss, handleDropdownPosition, handleInput, handleMainFieldKeyDown: baseHandleMainFieldKeyDown, handleMainFieldKeyUp, handleUpDownArrowKeys, isDropdownAbove, isDropdownOpen, isFocused, isUserFiltering, mainFieldRef, onCurrentKeyChange, onMouseDown, searchText, setCurrentRow, setDropdownOpen, setUserInput, stopFiltering, userInput } = useSelectCommon.useSelectCommon({
        data,
        inputRef,
        isFocused: propIsFocused,
        onFilter: handleOnFilter
    });
    const [prevIsDropdownOpen, setPrevIsDropdownOpen] = hooks.useState(isDropdownOpen);
    const [prevValueItems, setPrevValueItems] = hooks.useState(valueItems);
    const [selectedKeys, setSelectedKeys] = hooks.useState(createKeysFromValueItems(valueItems));
    const isDataFetched = data !== undefined && data !== null && !useSelectCommon.isBeforeDataFetch(data);
    const isEmptyResults = isDataFetched && data?.totalSize === 0;
    const isAddToListShown = addToList === 'on' &&
        isUserFiltering &&
        searchText != null &&
        searchText.length > 0 &&
        isEmptyResults;
    const handleAddToListAction = hooks.useCallback(() => {
        setDropdownOpen(false);
        stopFiltering();
        onAddToListAction?.({ searchText: isUserFiltering ? searchText : undefined });
    }, [isUserFiltering, onAddToListAction, searchText, setDropdownOpen, stopFiltering]);
    const textTagListRef = hooks.useRef(null);
    const { direction } = useUser.useUser();
    const selectedValuesDescriptionId = useId.useId();
    const selectedValuesKeyboardNavDescriptionId = useId.useId();
    const combinedAriaDescribedBy = stringUtils.merge([
        // when focused, we will show the text tag list.
        // so, we need the screen readers to read them when focusing on the input.
        isFocused && selectedValuesKeyboardNavDescriptionId,
        isFocused && selectedValuesDescriptionId,
        ariaDescribedBy
    ]);
    const removeDropdown = hooks.useCallback(() => {
        dropdownRef.current?.parentElement?.removeChild(dropdownRef.current);
    }, [dropdownRef]);
    const shouldSelectCurrentRow = hooks.useCallback((currentRowArg) => {
        // current row needs to be selected if all the conditions below are satisfied
        // 1. user is filtering
        // 2. dropdown is open
        // 3. user has entered a search text
        // 4. current data state has data
        // 5. currentRow exists
        return (isUserFiltering &&
            isDropdownOpen &&
            !useSelectCommon.isSearchTextEmptyOrUndefined(userInput) &&
            (data?.data.length ?? 0) > 0 &&
            currentRowArg.rowKey !== undefined);
    }, [data, isDropdownOpen, isUserFiltering, userInput]);
    const selectRow = hooks.useCallback((key) => {
        // If the key is already selected, do nothing
        if (selectedKeys?.has(key))
            return;
        // If it is not already selected, add it to the selection
        const newValue = selectedKeys === undefined ? new Set([key]) : new Set([...selectedKeys.values(), key]);
        onCommit({ previousValue: selectedKeys, value: newValue });
        setSelectedKeys(newValue);
    }, [onCommit, selectedKeys, setSelectedKeys]);
    const myHandleDropdownAutoDismiss = hooks.useCallback((event) => {
        if (isDropdownOpen) {
            if (event?.type === 'keydown') {
                const keyboardEvent = event;
                switch (keyboardEvent.code) {
                    case keyboardUtils.KEYS.TAB:
                        // Put focus on an element in the main field, but don't kill the event, so that
                        // the browser can naturally transfer focus to the next focusable item relative
                        // to the element in the main field.
                        if (keyboardEvent.shiftKey || !hasSelectedValuesCount) {
                            inputRef.current?.focus();
                        }
                        else {
                            chipRef.current?.focus();
                        }
                        // Remove the dropdown immediately, without waiting for a rerender based on changing
                        // state, so that the open dropdown cannot get focus when the browser handles the
                        // Tab key.
                        removeDropdown();
                        break;
                }
            }
        }
    }, [hasSelectedValuesCount, inputRef, isDropdownOpen, removeDropdown]);
    const myHandleMainFieldKeyDown = hooks.useCallback((event) => {
        // const target = event.target as HTMLElement;
        // ignore control key and function key
        if (keyboardUtils.isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.TAB:
                if (isDropdownOpen && (event.shiftKey || (!hasSelectedValuesCount && !event.shiftKey))) {
                    // Remove the dropdown immediately, without waiting for a rerender based on changing
                    // state, so that the open dropdown cannot get focus when the browser handles the
                    // Tab key.
                    removeDropdown();
                    setDropdownOpen(false);
                }
                // JET-53183 - core pack compat: stop propagation of handled events
                // we don't want a parent collection component to jump focus to the next cell and skip
                // over the selected values count chip
                if (hasSelectedValuesCount && !event.shiftKey) {
                    event.stopPropagation();
                }
                break;
            case keyboardUtils.KEYS.LEFT:
                // Move focus to the text tag if we are in LTR and the cursor is at the
                // beginning of the text (and there is no selection)
                if (direction === 'ltr' &&
                    inputRef.current instanceof HTMLInputElement &&
                    inputRef.current?.selectionStart === 0 &&
                    inputRef.current?.selectionEnd === 0) {
                    textTagListRef.current?.focus();
                }
                break;
            case keyboardUtils.KEYS.RIGHT:
                // Move focus to the text tag if we are in RTL and the cursor is at the
                // beginning of the text (and there is no selection)
                if (direction === 'rtl' &&
                    inputRef.current instanceof HTMLInputElement &&
                    inputRef.current?.selectionStart === 0 &&
                    inputRef.current?.selectionEnd === 0) {
                    textTagListRef.current?.focus();
                }
                break;
            case keyboardUtils.KEYS.ENTER:
            case keyboardUtils.KEYS.NUMPAD_ENTER:
                // if this is on a mobile device (only phone and not a tablet device), do not do anything
                if (useSelectCommon.isPhone()) {
                    return;
                }
                // if add to list is shown, there are no results, so trigger the add to list link
                if (isAddToListShown) {
                    handleAddToListAction();
                    return;
                }
                // if there is a currentRow in the dropdown (meaning a highlighted item that would
                // have keyboard focus if the dropdown list had physical focus, which may be different
                // from the currently selected item), select it and commit it;
                if (shouldSelectCurrentRow(currentRow)) {
                    setDropdownOpen(false);
                    // after selecting a value, the user is no longer actively filtering, so update related
                    // state accordingly so that the newly selected value appears in the field
                    stopFiltering();
                    selectRow(currentRow.rowKey);
                }
                break;
        }
    }, [
        currentRow,
        direction,
        handleAddToListAction,
        hasSelectedValuesCount,
        inputRef,
        isAddToListShown,
        isDropdownOpen,
        removeDropdown,
        selectRow,
        setDropdownOpen,
        shouldSelectCurrentRow,
        stopFiltering
    ]);
    // when the array of valueItems changes, pull out the new set of selectedKeys
    // (don't need to set selectedKeys here on first render because the state was initialized with
    // the correct value)
    if (prevValueItems !== valueItems) {
        const keys = createKeysFromValueItems(valueItems);
        setSelectedKeys(keys);
    }
    const chipRef = hooks.useRef(null);
    hooks.useEffect(() => {
        chipRef.current =
            hasSelectedValuesCount && mainFieldRef.current?.querySelector
                ? mainFieldRef.current.querySelector('[role="switch"]')
                : null;
    }, [hasSelectedValuesCount, isDisabled, isReadonly, mainFieldRef]);
    const handleSelectedValuesCountKeyDown = hooks.useCallback((event) => {
        switch (event.code) {
            case keyboardUtils.KEYS.TAB:
                if (isDropdownOpen && !event.shiftKey) {
                    // Remove the dropdown immediately, without waiting for a rerender based on changing
                    // state, so that the open dropdown cannot get focus when the browser handles the
                    // Tab key.
                    removeDropdown();
                    setDropdownOpen(false);
                }
                // JET-53183 - core pack compat: stop propagation of handled events
                // we don't want a parent collection component to jump focus to the next cell and skip
                // over the input
                if (event.shiftKey) {
                    event.stopPropagation();
                }
                break;
            case keyboardUtils.KEYS.UP:
            case keyboardUtils.KEYS.DOWN:
                // prevent the page from scrolling
                event.preventDefault();
                break;
            case keyboardUtils.KEYS.ESC:
                if (isDropdownOpen) {
                    setDropdownOpen(false);
                    event.preventDefault();
                    // JET-53183 - core pack compat: stop propagation of handled events
                    // we don't want a parent collection component to stop editing the row when we close
                    // the dropdown
                    event.stopPropagation();
                }
                break;
            case keyboardUtils.KEYS.ENTER:
                // JET-53183 - core pack compat: stop propagation of handled events
                // we don't want a parent collection component to move focus to the next row when
                // we toggle between the full and selected only list in the dropdown
                event.stopPropagation();
                break;
        }
    }, [isDropdownOpen, removeDropdown, setDropdownOpen]);
    const handleSelectedValuesCountKeyUp = hooks.useCallback((event) => {
        switch (event.code) {
            case keyboardUtils.KEYS.UP:
            case keyboardUtils.KEYS.DOWN:
                handleUpDownArrowKeys(event);
                break;
        }
    }, [handleUpDownArrowKeys]);
    const handleSelectedValuesCountMouseDown = hooks.useCallback((event) => {
        // call preventDefault so that the dropdown doesn't open showing the full list on mousedown
        // on the chip before switching to show only the selected values on mouseup when the click
        // is handled
        event.preventDefault();
        // explicitly focus the input because it won't happen naturally due to preventDefault()
        inputRef.current?.focus();
    }, [inputRef]);
    const handleSelectedValuesCountToggle = hooks.useCallback((detail) => {
        if (!isDropdownOpen) {
            setDropdownOpen(true);
        }
        const value = detail.value ?? false;
        if (value !== isDropdownSelectedOnlyView) {
            setDropdownSelectedOnlyView(value);
            // if the selected only toggle is enabled, we need to stop user filtering
            if (value) {
                stopFiltering();
            }
        }
    }, [isDropdownOpen, isDropdownSelectedOnlyView, setDropdownOpen, stopFiltering]);
    // when the dropdown closes, automatically turn off isDropdownSelectedOnlyView
    if (!isDropdownOpen && isDropdownSelectedOnlyView) {
        setDropdownSelectedOnlyView(false);
    }
    const onSelectionChange = hooks.useCallback((detail) => {
        const newKeys = new Set(detail.value.keys?.values());
        // update the selectedKeys so that the selection visual state of the collection
        // updates immediately while waiting for new valueItems to be set
        setSelectedKeys(newKeys);
        // clear the filter text typed by the user, but do NOT clear the actual filter criterion
        // or highlighting in the list
        setUserInput('');
        // call the onCommit callback so that the consuming code can update the valueItems
        onCommit?.({ value: newKeys, previousValue: selectedKeys });
    }, [onCommit, selectedKeys, setSelectedKeys, setUserInput]);
    const onTextTagListExitNavigation = hooks.useCallback(() => {
        // Focus the input on the next tick. Doing it in the same event cycle will
        // trigger the key press on the input element which makes the caret move by
        // one character.
        setTimeout(() => inputRef.current?.focus(), 0);
    }, [inputRef]);
    const onTextTagListRemove = hooks.useCallback((keys) => {
        const previousValue = selectedKeys;
        const value = new Set(selectedKeys);
        keys.forEach((key) => value.delete(key));
        onCommit?.({ previousValue, value });
    }, [onCommit, selectedKeys]);
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
    const textTagListProps = hooks.useMemo(() => ({
        textTagListRef,
        onExitNavigation: onTextTagListExitNavigation,
        onRemove: onTextTagListRemove
    }), [onTextTagListExitNavigation, onTextTagListRemove]);
    // clear the current item when the dropdown opens
    if (isDropdownOpen && !prevIsDropdownOpen) {
        setCurrentRow({ rowKey: undefined });
    }
    // when the dropdown closes, if the user input is empty, reset filtering
    const isDropdownClosing = prevIsDropdownOpen && !isDropdownOpen;
    if (isDropdownClosing && !userInput) {
        stopFiltering();
    }
    // We need to highlight the first result whenever the data changes
    // We cannot use state for the prevData and update it during the render as it is
    // returned by a useMemo hook.
    // There is a bug in preact where if a return value of a useMemo is used for
    // updating a state during the render, it creates an infinite render cycle.
    // See https://github.com/preactjs/preact/issues/4422.
    // Till this issue is fixed, we need to use a ref for this use case.
    const prevData = hooks.useRef(data);
    if (prevData.current !== data) {
        // when filtering, set the first result of the filtered data set to be the current item
        // (check the data offset so we don't try to highlight again if the user scrolls through
        // the list and more data is fetched)
        const firstResultKey = data?.data[0]?.metadata.key;
        if (isDropdownOpen && isUserFiltering && firstResultKey != null && data?.offset === 0) {
            // if there are results and search text, highlight the first row, otherwise clear
            // an existing highlight
            setCurrentRow({
                rowKey: useSelectCommon.isSearchTextEmptyOrUndefined(searchText) ? undefined : firstResultKey
            });
        }
        prevData.current = data;
    }
    if (prevIsDropdownOpen !== isDropdownOpen) {
        setPrevIsDropdownOpen(isDropdownOpen);
    }
    if (prevValueItems !== valueItems) {
        setPrevValueItems(valueItems);
    }
    return {
        addToListEventHandlers: {
            onAction: handleAddToListAction
        },
        ariaProps: {
            ariaDescribedBy: combinedAriaDescribedBy
        },
        collectionProps: {
            currentKey: currentRow.rowKey,
            data,
            onCurrentKeyChange,
            onSelectionChange,
            onLoadRange,
            selectedKeys
        },
        data,
        dropdownArrowEventHandlers: {
            onClick: handleDropdownArrowClick
        },
        dropdownEventHandlers,
        dropdownRef,
        hasSelectedValuesCount,
        inputEventHandlers,
        inputRef,
        isAddToListShown,
        isDataFetched,
        isDropdownAbove,
        isDropdownOpen,
        isDropdownSelectedOnlyView,
        isEmptyResults,
        isFocused,
        isUserFiltering,
        mainFieldRef,
        mouseProps: isDisabled || isReadonly ? {} : { onMouseDown },
        searchText,
        selectedValuesCountProps: {
            onKeyDown: handleSelectedValuesCountKeyDown,
            onKeyUp: handleSelectedValuesCountKeyUp,
            onMouseDown: handleSelectedValuesCountMouseDown,
            onToggle: handleSelectedValuesCountToggle
        },
        selectedValuesDescriptionId,
        selectedValuesKeyboardNavDescriptionId,
        setDropdownOpen,
        setUserInput,
        stopFiltering,
        textTagListProps,
        userInput
    };
}
function createKeysFromValueItems(valueItems) {
    const keys = valueItems?.reduce((accumKeys, currentItem) => {
        accumKeys.add(currentItem.key);
        return accumKeys;
    }, new Set());
    return keys;
}

/**
 * A SelectMultiple is a dropdown list that supports multiple selection and search filtering.
 */
const SelectMultiple = compat.forwardRef(({ addToList = 'off', 'aria-describedby': propAriaDescribedBy, assistiveText, columnSpan, data: propData, helpSourceLink, helpSourceText, isDisabled: propIsDisabled, isLoading: propIsLoading, isReadonly: propIsReadonly, isRequired, isRequiredShown, itemRenderer, itemText, label, labelEdge: propLabelEdge, labelStartWidth: propLabelStartWidth, messages, onAddToListAction, onCommit, onFilter, onLoadRange: propOnLoadRange, placeholder, testId, textAlign: propTextAlign, userAssistanceDensity: propUserAssistanceDensity, valueItems, variant = 'default', virtualKeyboard }, ref) => {
    const { isDisabled: isFormDisabled, isReadonly: isFormReadonly, labelEdge: formLabelEdge, labelStartWidth: formLabelStartWidth, textAlign: formTextAlign, userAssistanceDensity: formUserAssistanceDensity } = useFormContext.useFormContext();
    // default to FormContext values if component properties are not specified
    const isDisabled = propIsDisabled ?? isFormDisabled;
    const isReadonly = propIsReadonly ?? isFormReadonly;
    const labelEdge = propLabelEdge ?? formLabelEdge;
    const labelStartWidth = propLabelStartWidth ?? formLabelStartWidth;
    const textAlign = propTextAlign ?? formTextAlign;
    const userAssistanceDensity = propUserAssistanceDensity ?? formUserAssistanceDensity;
    const { enabledElementRef, focusProps, isFocused: origIsFocused, readonlyElementRef } = useFocusableTextField.useFocusableTextField({ isDisabled, isReadonly, ref });
    const { addToListEventHandlers, ariaProps, collectionProps, data, dropdownArrowEventHandlers, dropdownEventHandlers, dropdownRef, hasSelectedValuesCount, inputEventHandlers, isAddToListShown, isDataFetched, isDropdownAbove, isDropdownOpen, isDropdownSelectedOnlyView, isEmptyResults, isFocused, isUserFiltering, mainFieldRef, mouseProps, searchText, selectedValuesCountProps, selectedValuesDescriptionId, selectedValuesKeyboardNavDescriptionId, setDropdownOpen, setUserInput, stopFiltering, textTagListProps, userInput } = useSelectMultiple({
        addToList,
        ariaDescribedBy: propAriaDescribedBy,
        data: propData,
        inputRef: enabledElementRef,
        isDisabled,
        isFocused: origIsFocused,
        isReadonly,
        onAddToListAction,
        onCommit,
        onFilter,
        onLoadRange: propOnLoadRange,
        valueItems
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
        ariaDescribedBy: ariaProps.ariaDescribedBy,
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
        value: valueItems !== undefined && valueItems.length > 0 ? true : undefined
    });
    // JET-54256 - inside label animates up on initial display with selected value
    // If we're waiting for the selected values to load, the component should look like it
    // has a value in the meantime.
    // Use the original propIsLoading instead of isLoading because we don't want to delay
    // the inside label position by a timer like we do the progressive loading indicator.
    formFieldContext.hasValue = propIsLoading || formFieldContext.hasValue;
    const dropdownId = `${baseId}-dropdown`;
    const { displayValue, textTags } = useDisplayValues(itemText, valueItems);
    // Do not set a forId in phone as we will be using aria-labelledby instead.
    // This is because we will using a div and not input when rendering in a phone.
    const labelComp = labelEdge !== 'none' ? (jsxRuntime.jsx(Label.Label, { ...labelProps, ...(useSelectCommon.isPhone() ? { forId: undefined } : {}), children: label })) : undefined;
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
    const hasInsideLabel = labelEdge === 'inside';
    const liveRegionText = isDropdownOpen && isDataFetched
        ? data?.totalSize === 0
            ? translations.select_noMatchesFound()
            : data?.totalSize === 1
                ? translations.select_oneMatchFound()
                : data?.sizePrecision === 'exact'
                    ? translations.select_sizeMatchesFound({ TOTAL_SIZE: `${data?.totalSize}` })
                    : translations.select_sizeOrMoreMatchesFound({ TOTAL_SIZE: `${data?.totalSize}` })
        : '';
    const shouldShowDropdown = isDropdownOpen &&
        data !== undefined &&
        (data === null || data.totalSize > 0 || useSelectCommon.isBeforeDataFetch(data) || isEmptyResults);
    const hasEmptyLabel = label === '' && labelEdge === 'none';
    // Use the mobile field if the component is being rendered in a phone
    // and it is not disabled.
    const isPhoneMainFieldInput = useSelectCommon.isPhone() && !isDisabled;
    const mainFieldInput = !isPhoneMainFieldInput ? (jsxRuntime.jsx(SelectMultipleFieldInput, { "aria-controls": dropdownId, "aria-expanded": isDropdownOpen, "aria-label": ariaLabel, displayValue: displayValue, hasEmptyLabel: hasEmptyLabel, hasInsideLabel: hasInsideLabel, inputRef: enabledElementRef, isAddToListShown: isAddToListShown, isKeyboardNavigable: !isDisabled && !useSelectCommon.isMobile(), isRequired: isRequired, isTextTagListShown: isFocused && textTags.length !== 0, isUserFiltering: isUserFiltering, liveRegionText: liveRegionText, placeholder: placeholder, 
        // we only want the remove icon in the main field for tablets
        removeIcon: useSelectCommon.isTablet() ? 'always' : 'never', selectedValuesDescriptionId: selectedValuesDescriptionId, selectedValuesKeyboardNavDescriptionId: selectedValuesKeyboardNavDescriptionId, textAlign: textAlign, textTagListData: textTags, userInput: userInput, 
        // In tablet, we would want to show the virtual keyboard
        virtualKeyboard: useSelectCommon.isTablet() ? virtualKeyboard : undefined, ...inputEventHandlers, ...inputProps, ...textTagListProps })) : (jsxRuntime.jsx(useSelectCommon.SelectMobileFieldInput, { "aria-controls": dropdownId, "aria-describedby": inputProps['aria-describedby'], "aria-expanded": isDropdownOpen, "aria-invalid": inputProps['aria-invalid'], "aria-label": ariaLabel, "aria-labelledby": labelProps.id, displayValue: displayValue, hasEmptyLabel: hasEmptyLabel, hasInsideLabel: hasInsideLabel, isRequired: isRequired, onBlur: inputProps.onBlur, onFocus: inputProps.onFocus, placeholder: placeholder, ref: enabledElementRef, textAlign: textAlign, variant: inputProps.variant }));
    const dropdown = !shouldShowDropdown ? null : useSelectCommon.isPhone() ? (jsxRuntime.jsx(SelectMultipleMobileDropdown, { "aria-describedby": ariaProps.ariaDescribedBy, "aria-label": ariaLabel, assistiveText: assistiveText, 
        // We always pass the whole data here. As the change made in the mobile dropdown
        // exists only in the mobile dropdown, we let it decide how to render the data.
        data: propData, dropdownId: dropdownId, enabledElementRef: enabledElementRef, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isDisabled: isDisabled, isEmptyResults: isEmptyResults, isFocused: isFocused, isLoading: isLoading, isOpen: shouldShowDropdown, isReadonly: isReadonly, isRequired: isRequired, isSelectedOnlyView: isDropdownSelectedOnlyView, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, liveRegionText: liveRegionText, placeholder: placeholder, propIsLoading: propIsLoading, searchText: searchText, selectedValuesDescriptionId: selectedValuesDescriptionId, setDropdownOpen: setDropdownOpen, setUserInput: setUserInput, stopFiltering: stopFiltering, textAlign: textAlign, textTagListRef: textTagListProps.textTagListRef, userAssistanceDensity: userAssistanceDensity, userInput: userInput, valueItems: valueItems, virtualKeyboard: virtualKeyboard, onAddToListAction: addToListEventHandlers.onAction, onCommit: onCommit, onFieldBlur: focusProps.onFocusOut, onFieldFocus: focusProps.onFocusIn, onFieldInput: inputEventHandlers.onInput, onFieldKeyDown: inputEventHandlers.onKeyDown, onFieldKeyUp: inputEventHandlers.onKeyUp, onLoadRange: propOnLoadRange })) : (jsxRuntime.jsx(SelectMultipleDesktopDropdown, { ...collectionProps, ...dropdownEventHandlers, assistiveText: assistiveText, dropdownId: dropdownId, dropdownRef: dropdownRef, helpSourceLink: helpSourceLink, helpSourceText: helpSourceText, isAddToListShown: isAddToListShown, isDisabled: isDisabled, isDropdownAbove: isDropdownAbove, isEmptyResults: isEmptyResults, isOpen: shouldShowDropdown, isReadonly: isReadonly, isSelectedOnlyView: isDropdownSelectedOnlyView, isUserFiltering: isUserFiltering, itemRenderer: itemRenderer, itemText: itemText, label: label, mainFieldRef: mainFieldRef, onAddToListAction: addToListEventHandlers.onAction, searchText: searchText, userAssistanceDensity: userAssistanceDensity }));
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: formFieldContext, children: jsxRuntime.jsx(SelectMultipleField, { columnSpan: columnSpan, compactUserAssistance: compactUserAssistance, fieldLabel: label, hasInsideLabel: hasInsideLabel, inlineUserAssistance: inlineUserAssistance, isDropdownArrowShown: true, isDropdownSelectedOnlyView: isDropdownSelectedOnlyView, isSelectedValuesCountShown: hasSelectedValuesCount, mainFieldRef: mainFieldRef, onBlur: focusProps.onFocusOut, onFocus: focusProps.onFocusIn, onDropdownArrowClick: dropdownArrowEventHandlers.onClick, onSelectedValuesCountKeyDown: selectedValuesCountProps.onKeyDown, onSelectedValuesCountKeyUp: selectedValuesCountProps.onKeyUp, onSelectedValuesCountMouseDown: selectedValuesCountProps.onMouseDown, onSelectedValuesCountToggle: selectedValuesCountProps.onToggle, selectedValuesCount: valueItems?.length, testId: testId, ...fieldLabelProps, ...mouseProps, ...textFieldProps, children: mainFieldInput }) }), dropdown] }));
});

exports.SelectMultiple = SelectMultiple;
//# sourceMappingURL=SelectMultiple-3af44d48.js.map
