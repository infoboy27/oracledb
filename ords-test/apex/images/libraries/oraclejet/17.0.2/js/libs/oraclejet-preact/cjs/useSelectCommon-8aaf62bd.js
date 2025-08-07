/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var HighlightText = require('./HighlightText-c76eb17a.js');
var Flex = require('./Flex-fbba4ad6.js');
require('./Grid-03d487e5.js');

var ListItemText = require('./ListItemText-4c20b365.js');
var Skeleton = require('./Skeleton-f0f86df2.js');
var logger = require('./logger-2b636482.js');
var PRIVATE_SelectCommon_themes_dropdownStyles_css = require('./PRIVATE_SelectCommon/themes/dropdownStyles.css.js');
var List = require('./List-bd9ecebb.js');
var Floating = require('./Floating-1280c2ce.js');
var Layer = require('./Layer-3700cd37.js');
var compat = require('preact/compat');
require('./LayerHost-46e4d858.js');
var keyboardUtils = require('./keyboardUtils-f835e1ee.js');
var useOutsideMousedown = require('./useOutsideMousedown-a8c09ad9.js');
var usePress = require('./usePress-00deca01.js');
var CaretDown = require('./CaretDown-f123fd41.js');
var classNames = require('./classNames-c14c6ef3.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme = require('./UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js');
var useTestId = require('./useTestId-8234ec1e.js');
var UNSAFE_BaseButton_themes_redwood_BaseButtonTheme = require('./UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js');
var useCollectionGestureContext = require('./useCollectionGestureContext-daada886.js');
var FormFieldContext = require('./FormFieldContext-8418dc68.js');
require('./TabbableModeContext-e99d527e.js');


require('./UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js');
var InlineUserAssistance = require('./InlineUserAssistance-ad3fa8cc.js');


require('./UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js');
require('preact');
require('./useTooltipControlled-706a3651.js');

require('./IconButton-94f8ca5c.js');

require('./MessageFormattingUtils-42d84399.js');
require('./TransitionGroup-b239d98f.js');
require('./MessagesContext-4e939750.js');



require('./UNSAFE_ComponentMessage/themes/redwood/ComponentMessageVariants.css.js');
require('./Popup-881aae20.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Label/themes/redwood/LabelVariants.css.js');
require('./InputGroupContext-05f2a46f.js');

require('./UNSAFE_Popup/themes/redwood/PopupVariants.css.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var Link = require('./Link-98de6624.js');
var useFocusWithin = require('./useFocusWithin-eb7f956a.js');
var useHover = require('./useHover-910b8e32.js');
var Separator = require('./Separator-85962472.js');
var WindowOverlay = require('./WindowOverlay-d255542f.js');
var PRIVATE_SelectCommon_themes_mobileDropdownStyles_css = require('./PRIVATE_SelectCommon/themes/mobileDropdownStyles.css.js');
var PRIVATE_SelectCommon_themes_selectMobileDropdownStyles_css = require('./PRIVATE_SelectCommon/themes/selectMobileDropdownStyles.css.js');
var textAlign = require('./textAlign-f41f49db.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var useFormFieldContext = require('./useFormFieldContext-20f419ef.js');
var PRIVATE_SelectCommon_themes_SelectMobileFieldInputStyles_css = require('./PRIVATE_SelectCommon/themes/SelectMobileFieldInputStyles.css.js');
var TextFieldUtils = require('./TextFieldUtils-96baac38.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var Text = require('./Text-aaacb6a0.js');
var useAccessibleContext = require('./useAccessibleContext-c49d8d1b.js');
var stringUtils = require('./stringUtils-4e4a6b2b.js');
var UNSAFE_TextField_themes_redwood_TextFieldInputTheme = require('./UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js');
var clientHints = require('./clientHints-9e411b6e.js');
var tabbableUtils = require('./tabbableUtils-b49673af.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function renderItemText(item, itemText) {
    // if item-text is a string and the data has the specified field, return it;
    // otherwise log an error
    if (typeof itemText === 'string') {
        if (item.data?.hasOwnProperty(itemText)) {
            const retData = item.data[itemText];
            return String(retData);
        }
        logger.error('SelectMultiple: itemText specifies field that does not exist: ' + itemText);
        // return undefined if the field doesn't exist
        return undefined;
    }
    // if item-text is a function, call it to create a display label
    return itemText(item);
}

const noOp = () => { };
function DefaultList({ 'aria-label': ariaLabel, currentItemVariant, currentKey, data, itemRenderer, itemText, onCurrentKeyChange, onItemAction, onLoadRange = noOp, onSelectionChange, searchText, selectedKeys, selectionMode }) {
    const listItemRenderer = hooks.useCallback((listItemContext) => {
        // specify the listItemContext props that we want to expose individually instead of
        // spreading the whole object so that we don't automatically include any new props that
        // may be added to it
        const itemRendererProps = {
            data: listItemContext.data,
            index: listItemContext.index,
            metadata: listItemContext.metadata,
            selector: listItemContext.selector,
            searchText,
            selectedKeys,
            onSelectionChange: ({ target, value }) => {
                onSelectionChange?.({
                    target,
                    value: { all: false, keys: value }
                });
            }
        };
        const itemContext = {
            data: listItemContext.data,
            key: listItemContext.metadata.key,
            metadata: listItemContext.metadata
        };
        return itemRenderer ? (itemRenderer(itemRendererProps)) : (jsxRuntime.jsxs(Flex.Flex, { align: "center", children: [listItemContext.selector && (jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.selectorWrapper, children: listItemContext.selector() })), jsxRuntime.jsx("div", { class: selectionMode === 'single'
                        ? PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.singleSelectItem
                        : PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.multiSelectItem, children: jsxRuntime.jsx(ListItemText.ListItemText, { variant: "primary", children: jsxRuntime.jsx(HighlightText.HighlightText, { matchText: searchText, children: renderItemText(itemContext, itemText) }) }) })] }));
    }, [itemRenderer, itemText, onSelectionChange, searchText, selectedKeys, selectionMode]);
    const keys = hooks.useMemo(() => {
        return { all: false, keys: selectedKeys ?? new Set() };
    }, [selectedKeys]);
    return (jsxRuntime.jsx(List.List, { "aria-label": ariaLabel, allowTabbableMode: false, currentItemVariant: currentItemVariant, currentKey: currentKey, data: data ?? null, loadingIndicator: loadingIndicator, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, onSelectionChange: onSelectionChange, role: "listbox", selectedKeys: keys, selectionMode: selectionMode, children: (context) => listItemRenderer(context) }));
}
/**
 * Custom 3 Skeleton loader for select multiple
 * TODO: to remove this once  is solved
 */
const loadingIndicator = (jsxRuntime.jsx(List.SkeletonContainer, { minimumCount: 3, children: () => {
        return (jsxRuntime.jsx(Flex.Flex, { height: "12x", align: "center", children: jsxRuntime.jsx(Skeleton.Skeleton, { height: "4x" }) }));
    } }));

const isSimpleClick = (event) => {
    return event.button === 0 && !event.ctrlKey;
};
const preventDefault = (event) => {
    event.preventDefault();
};
const preventDefaultForCurrentTarget = (event) => {
    if (event.currentTarget === event.target) {
        event.preventDefault();
    }
};

const DEFAULT_PLACEMENT = 'bottom-start';
//TODO: Start consuming PRIVATE_Dropdown. JET-62565
function Dropdown({ anchorRef, children, dropdownRef, id, isOpen, onAutoDismiss, onPosition }) {
    const [placement, setPlacement] = hooks.useState(DEFAULT_PLACEMENT);
    const [prevIsOpen, setPrevIsOpen] = hooks.useState(isOpen);
    if (prevIsOpen !== isOpen) {
        // reset the placement to the default when the dropdown closes, not opens, so that it doesn't
        // initially open in the previous position and then move to the default position on the
        // rerender after the state is updated
        if (!isOpen) {
            setPlacement(DEFAULT_PLACEMENT);
        }
    }
    const handlePosition = hooks.useCallback((positionData) => {
        // update the placement so that the dropdown stays where it is until there is a collision,
        // i.e. it no longer fits, instead of letting it try to move back to the default position
        // on every render
        setPlacement(positionData.placement);
        // call the callback that was passed in through props
        onPosition?.(positionData);
    }, [onPosition, setPlacement]);
    const handleAutoDismiss = hooks.useCallback((event) => {
        onAutoDismiss?.(event);
    }, [onAutoDismiss]);
    const handleKeyDown = hooks.useCallback((event) => {
        if (event.defaultPrevented || keyboardUtils.isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.ESC:
            case keyboardUtils.KEYS.TAB:
                handleAutoDismiss(event);
                break;
        }
    }, [handleAutoDismiss]);
    // use the mousedown event to be consistent with legacy JET and so that we're hiding the dropdown
    // on the same event where focus will transfer
    useOutsideMousedown.useOutsideMousedown({
        isDisabled: !isOpen,
        ref: [anchorRef, dropdownRef],
        handler: handleAutoDismiss
    });
    // TODO: get dropdown y (mainAxis) offset from --oj-c-PRIVATE-DO-NOT-USE-private-core-global-dropdown-offset
    const offsetValue = { mainAxis: 4, crossAxis: 0 };
    const inlineStyle = isOpen
        ? {
            minWidth: `${anchorRef.current?.offsetWidth}px`
        }
        : {};
    if (prevIsOpen !== isOpen) {
        setPrevIsOpen(isOpen);
    }
    return !isOpen ? null : (jsxRuntime.jsx(Layer.Layer, { logicalParentRef: anchorRef, children: jsxRuntime.jsx(Floating.Floating, { anchorRef: anchorRef, sizeOptions: {
                isMaxHeightAdjusted: true,
                maxHeightCeiling: 400
            }, ref: dropdownRef, placement: placement, offsetValue: offsetValue, onPosition: handlePosition, children: jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.base, id: id, style: inlineStyle, onKeyDown: handleKeyDown, onMouseDown: preventDefaultForCurrentTarget, children: children }) }) }));
}

const noop = () => { };
function DropdownArrow({ isDisabled = false, onClick, testId }) {
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_ButtonLabelLayout_themes_redwood_ButtonLabelLayoutTheme.ButtonLabelLayoutRedwoodTheme, { size: 'sm' });
    const { baseTheme } = useComponentTheme.useComponentTheme(UNSAFE_BaseButton_themes_redwood_BaseButtonTheme.BaseButtonRedwoodTheme);
    const preventDefault = hooks.useCallback((event) => {
        event.preventDefault();
    }, []);
    const { pressProps } = usePress.usePress(onClick ?? noop, { isDisabled });
    // TODO: JET-67410 replace this with a icon button
    const styleClasses = classNames.classNames([
        classes,
        baseTheme,
        PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.arrow.base,
        isDisabled ? PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.arrow.disabled : PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.arrow.enabled
    ]);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("span", { "aria-hidden": "true", class: styleClasses, tabIndex: -1, onMouseDown: preventDefault, ...testIdProps, ...pressProps, children: jsxRuntime.jsx(CaretDown.SvgCaretDown, {}) }));
}

function DropdownList({ children, hasTopGap = true, hasBottomGap = true, isLoading = false }) {
    const styleClasses = classNames.classNames([
        PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.list.base,
        hasTopGap && PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.list.topGap,
        hasBottomGap && PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.list.bottomGap,
        isLoading && PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.list.loading
    ]);
    return (jsxRuntime.jsx(useCollectionGestureContext.CollectionGestureContext.Provider, { value: 'embedded', children: jsxRuntime.jsx("div", { class: styleClasses, onMouseDown: preventDefaultForCurrentTarget, children: children }) }));
}

function DropdownUserAssistance(props) {
    // Prevent the focus from transferring when the user clicks on an empty/non-clickable area
    // of the user assistance
    const handleMouseDown = hooks.useCallback((event) => {
        // Don't call preventDefault when the user clicks on the help source link, so that the
        // focus is allowed to transfer in that case.
        if (event.target?.tagName !== 'A') {
            event.preventDefault();
        }
    }, []);
    return (jsxRuntime.jsx(FormFieldContext.FormFieldContext.Provider, { value: { isFocused: true }, children: jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.userAssistance, onMouseDown: handleMouseDown, children: jsxRuntime.jsx(InlineUserAssistance.InlineUserAssistance, { ...props }) }) }));
}

function EmptyResults() {
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    // call preventDefault for mousedown on this div so that focus does not transfer from
    // the input
    return (jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.results.extraItem, onMouseDown: preventDefaultForCurrentTarget, children: translations.select_noMatchesFound() }));
}

/**
 * This component renders a link that looks like a list item in a Select* component dropdown.
 * It fires an action when the user triggers it, and is intended to be used for launching
 * external application UI from within the dropdown, for example to provide advanced search or
 * add to list functionality.
 * The LinkItem would typically be shown in a fixed position above or below the list itself.
 */
const LinkItem = ({ children, isHighlighted, onAction }) => {
    const { isHover, hoverProps } = useHover.useHover();
    const { isFocused, focusProps } = useFocusWithin.useFocusWithin();
    const handleClick = hooks.useCallback((e) => {
        // prevent the link from actually navigating by preventing default and returning false
        e.preventDefault();
        onAction?.();
        return false;
    }, [onAction]);
    const rootClasses = classNames.classNames([isFocused ? PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.results.linkItemFocus : undefined]);
    const linkClasses = classNames.classNames([
        PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.results.extraItem,
        isHover || isFocused || isHighlighted ? PRIVATE_SelectCommon_themes_dropdownStyles_css.dropdownStyles.results.linkItemHighlight : undefined
    ]);
    return (jsxRuntime.jsx("div", { class: rootClasses, ...focusProps, children: jsxRuntime.jsx(Link.Link, { href: "#", onClick: handleClick, children: jsxRuntime.jsx("div", { class: linkClasses, ...hoverProps, children: children }) }) }));
};

function MobileDropdown({ children, id, isOpen }) {
    return !isOpen ? null : (jsxRuntime.jsx(Layer.Layer, { children: jsxRuntime.jsx(WindowOverlay.WindowOverlay, { children: jsxRuntime.jsx("div", { id: id, class: PRIVATE_SelectCommon_themes_mobileDropdownStyles_css.mobileDropdownStyles.base, role: "dialog", "aria-modal": "true", children: jsxRuntime.jsx(Flex.Flex, { width: "100%", height: "100%", maxHeight: "100%", direction: "column", children: children }) }) }) }));
}

function SelectMobileDropdown({ children, footer, hasHeaderSeparator = true, header, id, isOpen }) {
    return (jsxRuntime.jsxs(MobileDropdown, { id: id, isOpen: isOpen, children: [header, hasHeaderSeparator && jsxRuntime.jsx(Separator.Separator, {}), jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_selectMobileDropdownStyles_css.selectMobileDropdownStyles.content, children: children }), jsxRuntime.jsx(Separator.Separator, {}), footer] }));
}

const interpolations = [...Object.values(textAlign.textInterpolations)];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * This component is used for rendering the main field in mobile phones. This is a bit different from the
 * normal main field (TextFieldInput) that we use for desktop & tablet devices in the way that
 * a user will not be able to edit the value of this field. But, one can still have other functionalities
 * of having a placeholder, tab in & out of it, and other such functionalities of an enabled field.
 *
 * This also differs from ReadonlyTextFieldInput in the following ways:
 * 1. This will be rendered as div as well, but has a role of combobox set on it
 * 2. This will not be read as readonly input by the screen readers
 * 3. This has the stylings much similar to the TextFieldInput component
 * 4. This supports the use of placeholder and shows it when there is no value present
 * 5. This supports having the variant property and styles accordingly
 *
 * As such, this is very similar to the TextFieldInput except that this does not allow user input.
 * Note: we cannot use TextFieldInput with readonly set on it; even though it might provide us the
 * behavior we need, it will make the field as readonly and screen readers read the same about this
 * field. This will be an incorrect representation contextually as one can still edit the value by opening
 * the dropdown and changing the selection.
 */
const SelectMobileFieldInput = compat.forwardRef(({ 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, 'aria-expanded': ariaExpanded, 'aria-invalid': ariaInvalid, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, displayValue, hasEmptyLabel, hasInsideLabel = false, isRequired, onBlur, onFocus, placeholder, textAlign, variant = 'default' }, ref) => {
    // consume required contexts
    const { isDisabled, isFocused, hasValue = false } = useFormFieldContext.useFormFieldContext();
    const { isTabbable, tabbableModeProps } = useTabbableMode.useTabbableMode();
    // setup properties
    const myPlaceholder = TextFieldUtils.isInputPlaceholderShown(hasInsideLabel, hasValue, isFocused)
        ? placeholder
        : undefined;
    // Add unsafe API for specifying an external label which is added to ariaLabelledBy on the input,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext.useAccessibleContext();
    const mergedAriaLabelledBy = hasEmptyLabel
        ? stringUtils.merge([ariaLabelledBy, UNSAFE_ariaLabelledBy])
        : ariaLabelledBy;
    // setup style classes
    const { class: styleInterpolationClasses } = styleInterpolations({ textAlign });
    const { classes: themeClasses } = useComponentTheme.useComponentTheme(UNSAFE_TextField_themes_redwood_TextFieldInputTheme.TextFieldInputRedwoodTheme, {
        type: 'notPassword',
        styleVariant: variant,
        textarea: 'notTextArea',
        input: 'isInput',
        prefix: 'noPrefix',
        suffix: 'noSuffix',
        startContent: 'noStartContent',
        endContent: 'hasEndContent',
        insideLabel: hasInsideLabel ? 'hasInsideLabel' : 'noInsideLabel',
        value: hasValue ? 'hasValue' : 'noValue',
        focused: isFocused ? 'isFocused' : 'notFocused',
        disabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    const rootDivStyleClasses = classNames.classNames([
        PRIVATE_SelectCommon_themes_SelectMobileFieldInputStyles_css.selectMobileFieldInputStyles.base,
        styleInterpolationClasses,
        themeClasses
    ]);
    return (jsxRuntime.jsx("div", { "aria-autocomplete": "list", "aria-controls": ariaControls, "aria-describedby": ariaDescribedBy, "aria-expanded": ariaExpanded, "aria-invalid": ariaInvalid, "aria-label": ariaLabel, "aria-labelledby": mergedAriaLabelledBy, "aria-required": isRequired ? 'true' : undefined, class: rootDivStyleClasses, onBlur: onBlur, onFocus: onFocus, ref: ref, role: "combobox", ...(isTabbable && tabbableModeProps), children: jsxRuntime.jsx("div", { class: PRIVATE_SelectCommon_themes_SelectMobileFieldInputStyles_css.selectMobileFieldInputStyles.content, children: jsxRuntime.jsx(Text.Text, { variant: displayValue ? 'inherit' : 'secondary', children: displayValue || myPlaceholder }) }) }));
});

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if running on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = clientHints.getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}
/**
 * Helper function to determine whether the current device is a phone
 * @returns true if running on a phone, false otherwise
 */
function isPhone() {
    return clientHints.getClientHints().deviceType === 'phone';
}
/**
 * Helper function to determine whether the current device is a tablet
 * @returns true if running on a tablet, false otherwise
 */
function isTablet() {
    return clientHints.getClientHints().deviceType === 'tablet';
}
function isBeforeDataFetch(data) {
    return data.sizePrecision === 'atLeast' && data.totalSize === 0;
}
function isSearchTextEmptyOrUndefined(searchText) {
    return searchText === undefined || searchText.length === 0;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Hook that manages state and behavior for a Select* component.  This hook creates state
 * variables and event listeners, returning properties to apply to components internally
 * rendered by a Select* component, as well as state information.
 *
 * @param data Specifies data for the dropdown list.
 * @param inputRef Ref to the input element.
 * @param isFocused Specifies whether the component has focus.
 * @param onFilter Callback function to trigger loading data for the dropdown list,
 * which may or may not be filtered by user entered text.
 *
 * @returns Component state and event listeners.
 */
function useSelectCommon({ data, inputRef, isFocused, onFilter }) {
    const mainFieldRef = hooks.useRef(null);
    const dropdownRef = hooks.useRef(null);
    const [isDropdownOpen, setDropdownOpen] = hooks.useState(false);
    const [isDropdownAbove, setDropdownAbove] = hooks.useState(false);
    const [currentRow, setCurrentRow] = hooks.useState({
        rowKey: undefined
    });
    const [isUserFiltering, setUserFiltering] = hooks.useState(false);
    const [userInput, setUserInput] = hooks.useState();
    const [searchText, setSearchText] = hooks.useState();
    const [prevIsDropdownOpen, setPrevIsDropdownOpen] = hooks.useState(isDropdownOpen);
    const [prevIsFocused, setPrevIsFocused] = hooks.useState(isFocused);
    const [prevIsUserFiltering, setPrevIsUserFiltering] = hooks.useState(isUserFiltering);
    const onMouseDown = hooks.useCallback((event) => {
        // const target = event.target as HTMLElement;
        if (event.defaultPrevented || !isSimpleClick(event)) {
            return;
        }
        if (!isDropdownOpen) {
            setDropdownOpen(true);
        }
        // this is needed to focus the input when clicking on the inside label when there is no
        // value;  otherwise the component looks focused but doesn't actually have physical focus
        setTimeout(function () {
            inputRef.current?.focus();
        }, 0);
    }, [inputRef, isDropdownOpen]);
    const handleDropdownArrowClick = hooks.useCallback(() => {
        setDropdownOpen(!isDropdownOpen);
        // focus the input so that if the user Tabs afterwards, it loses focus and the dropdown closes
        inputRef.current?.focus();
    }, [inputRef, isDropdownOpen]);
    const handleDropdownAutoDismiss = hooks.useCallback((event) => {
        if (isDropdownOpen) {
            setDropdownOpen(false);
            switch (event?.type) {
                case 'keydown':
                    const keyboardEvent = event;
                    switch (keyboardEvent.code) {
                        case keyboardUtils.KEYS.ESC:
                            // focus the input when the user cancels out of the dropdown
                            inputRef.current?.focus();
                            break;
                    }
                    break;
                case 'mousedown':
                    // if focus is in the dropdown, focus the input before the dropdown is hidden so that
                    // focus will transfer correctly when the target is not focusable;
                    // otherwise the text cursor appears in the input again
                    if (dropdownRef.current?.contains(document.activeElement)) {
                        inputRef.current?.focus();
                    }
                    break;
            }
        }
    }, [inputRef, isDropdownOpen]);
    const handleDropdownPosition = hooks.useCallback((data) => {
        setDropdownAbove(data.placement.startsWith('top'));
    }, []);
    const getDropdownTabbableElems = hooks.useCallback(() => {
        return isDropdownOpen && dropdownRef.current
            ? tabbableUtils.allTabbableElements(dropdownRef.current)
            : undefined;
    }, [isDropdownOpen]);
    const handleUpDownArrowKeys = hooks.useCallback((event) => {
        if (!isDropdownOpen) {
            setDropdownOpen(true);
        }
        else {
            // JET-64909 - focus / 'current' dropped when arrow keying during loading
            // Transfer physical focus into the dropdown only if the data is present and the dropdown
            // has rendered the data. Otherwise, keep the focus in the field.
            if (data != null) {
                const tabbableElems = getDropdownTabbableElems();
                tabbableElems?.[0]?.focus();
                // if there is no current item set, make the first item current
                if (currentRow.rowKey === undefined) {
                    setCurrentRow({ rowKey: data.data[0]?.metadata?.key });
                }
            }
        }
        // prevent the page from scrolling
        event.preventDefault();
    }, [currentRow, data, getDropdownTabbableElems, isDropdownOpen]);
    const handleMainFieldKeyDown = hooks.useCallback((event) => {
        // const target = event.target as HTMLElement;
        // ignore control key and function key
        if (keyboardUtils.isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.PAGE_UP:
            case keyboardUtils.KEYS.PAGE_DOWN:
                // prevent the page from scrolling
                event.preventDefault();
                return;
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
        }
    }, [isDropdownOpen]);
    const handleMainFieldKeyUp = hooks.useCallback((event) => {
        // ignore control key and function key
        if (keyboardUtils.isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case keyboardUtils.KEYS.UP:
            case keyboardUtils.KEYS.DOWN:
                handleUpDownArrowKeys(event);
                break;
        }
    }, [handleUpDownArrowKeys]);
    const handleInput = hooks.useCallback((detail) => {
        if (!isDropdownOpen) {
            setDropdownOpen(true);
        }
        setUserFiltering(true);
        setUserInput(detail.value);
        const str = detail.value;
        setSearchText(str);
        onFilter?.({ searchText: str });
    }, [isDropdownOpen, onFilter]);
    const onCurrentKeyChange = hooks.useCallback((detail) => {
        setCurrentRow({ rowKey: detail.value });
    }, []);
    const stopFiltering = hooks.useCallback(() => {
        setUserFiltering(false);
        setUserInput('');
        setSearchText('');
    }, []);
    // the user is not actively filtering if the dropdown is closed and the component doesn't
    // have focus
    if (prevIsDropdownOpen !== isDropdownOpen ||
        prevIsFocused !== isFocused ||
        prevIsUserFiltering !== isUserFiltering) {
        if (!isDropdownOpen && !isFocused && isUserFiltering) {
            stopFiltering();
        }
    }
    // need to call onFilter with undefined searchText when the dropdown opens and the
    // user is NOT filtering
    hooks.useEffect(() => {
        if (isDropdownOpen && !isUserFiltering) {
            onFilter?.({ searchText: undefined });
        }
    }, [isDropdownOpen, isUserFiltering, onFilter]);
    // when the dropdown closes, reset the isDropdownAbove flag
    if (prevIsDropdownOpen !== isDropdownOpen) {
        if (!isDropdownOpen) {
            setDropdownAbove(false);
        }
        setPrevIsDropdownOpen(isDropdownOpen);
    }
    if (prevIsFocused !== isFocused) {
        setPrevIsFocused(isFocused);
    }
    if (prevIsUserFiltering !== isUserFiltering) {
        setPrevIsUserFiltering(isUserFiltering);
    }
    return {
        currentRow,
        dropdownRef,
        getDropdownTabbableElems,
        handleDropdownArrowClick,
        handleDropdownAutoDismiss,
        handleDropdownPosition,
        handleInput,
        handleMainFieldKeyDown,
        handleMainFieldKeyUp,
        handleUpDownArrowKeys,
        isDropdownAbove,
        isDropdownOpen,
        // the field should remain to look focused while the dropdown is open,
        // in case physical focus is in the dropdown
        isFocused: isFocused || isDropdownOpen,
        isUserFiltering,
        mainFieldRef,
        onCurrentKeyChange,
        onMouseDown,
        searchText,
        setCurrentRow,
        setDropdownOpen,
        setUserInput,
        stopFiltering,
        userInput
    };
}

exports.DefaultList = DefaultList;
exports.Dropdown = Dropdown;
exports.DropdownArrow = DropdownArrow;
exports.DropdownList = DropdownList;
exports.DropdownUserAssistance = DropdownUserAssistance;
exports.EmptyResults = EmptyResults;
exports.LinkItem = LinkItem;
exports.MobileDropdown = MobileDropdown;
exports.SelectMobileDropdown = SelectMobileDropdown;
exports.SelectMobileFieldInput = SelectMobileFieldInput;
exports.isBeforeDataFetch = isBeforeDataFetch;
exports.isMobile = isMobile;
exports.isPhone = isPhone;
exports.isSearchTextEmptyOrUndefined = isSearchTextEmptyOrUndefined;
exports.isSimpleClick = isSimpleClick;
exports.isTablet = isTablet;
exports.preventDefault = preventDefault;
exports.preventDefaultForCurrentTarget = preventDefaultForCurrentTarget;
exports.renderItemText = renderItemText;
exports.useSelectCommon = useSelectCommon;
//# sourceMappingURL=useSelectCommon-8aaf62bd.js.map
