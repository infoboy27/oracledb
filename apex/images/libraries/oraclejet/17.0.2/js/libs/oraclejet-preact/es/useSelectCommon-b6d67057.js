/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useCallback, useMemo, useState, useRef, useEffect } from 'preact/hooks';
import { H as HighlightText } from './HighlightText-180e29f6.js';
import { F as Flex } from './Flex-24628925.js';
import './Grid-cfeac922.js';
import './ListItemLayoutStyles.styles.css';
import { L as ListItemText } from './ListItemText-b03ca283.js';
import { S as Skeleton } from './Skeleton-c1d24eea.js';
import { e as error } from './logger-c92f309c.js';
import { dropdownStyles } from './PRIVATE_SelectCommon/themes/dropdownStyles.css.js';
import { S as SkeletonContainer, L as List } from './List-9026206d.js';
import { F as Floating } from './Floating-9703160e.js';
import { L as Layer } from './Layer-9b06412e.js';
import { forwardRef } from 'preact/compat';
import './LayerHost-45f545d7.js';
import { i as isControlOrFunctionKey, K as KEYS } from './keyboardUtils-4db21770.js';
import { u as useOutsideMousedown } from './useOutsideMousedown-7307de8b.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { S as SvgCaretDown } from './CaretDown-36ae16fe.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ButtonLabelLayoutRedwoodTheme } from './UNSAFE_ButtonLabelLayout/themes/redwood/ButtonLabelLayoutTheme.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { BaseButtonRedwoodTheme } from './UNSAFE_BaseButton/themes/redwood/BaseButtonTheme.js';
import { C as CollectionGestureContext } from './useCollectionGestureContext-f18b492f.js';
import { F as FormFieldContext } from './FormFieldContext-68eb5946.js';
import './TabbableModeContext-7d8ad946.js';
import './UserAssistanceStyles.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceBaseTheme.styles.css';
import './UNSAFE_UserAssistance/themes/redwood/UserAssistanceVariants.css.js';
import { a as InlineUserAssistance } from './InlineUserAssistance-bb690d93.js';
import './MessageBannerStyles.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerBaseTheme.styles.css';
import './UNSAFE_MessageBanner/themes/redwood/MessageBannerVariants.css.js';
import 'preact';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './IconButton-37310d21.js';
import './MessageStyles.styles.css';
import './MessageFormattingUtils-34c9b1aa.js';
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
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { L as Link } from './Link-bfa35319.js';
import { u as useFocusWithin } from './useFocusWithin-30b1e2d8.js';
import { u as useHover } from './useHover-d5088fcd.js';
import { S as Separator } from './Separator-93c70737.js';
import { W as WindowOverlay } from './WindowOverlay-e14f8324.js';
import { mobileDropdownStyles } from './PRIVATE_SelectCommon/themes/mobileDropdownStyles.css.js';
import { selectMobileDropdownStyles } from './PRIVATE_SelectCommon/themes/selectMobileDropdownStyles.css.js';
import { t as textInterpolations } from './textAlign-ad252afa.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { u as useFormFieldContext } from './useFormFieldContext-626574fd.js';
import { selectMobileFieldInputStyles } from './PRIVATE_SelectCommon/themes/SelectMobileFieldInputStyles.css.js';
import { i as isInputPlaceholderShown } from './TextFieldUtils-8232bca7.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { T as Text } from './Text-da8588ce.js';
import { u as useAccessibleContext } from './useAccessibleContext-5744de8b.js';
import { m as merge } from './stringUtils-16f617bc.js';
import { TextFieldInputRedwoodTheme } from './UNSAFE_TextField/themes/redwood/TextFieldInputTheme.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { a as allTabbableElements } from './tabbableUtils-dca964ca.js';

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
        error('SelectMultiple: itemText specifies field that does not exist: ' + itemText);
        // return undefined if the field doesn't exist
        return undefined;
    }
    // if item-text is a function, call it to create a display label
    return itemText(item);
}

const noOp = () => { };
function DefaultList({ 'aria-label': ariaLabel, currentItemVariant, currentKey, data, itemRenderer, itemText, onCurrentKeyChange, onItemAction, onLoadRange = noOp, onSelectionChange, searchText, selectedKeys, selectionMode }) {
    const listItemRenderer = useCallback((listItemContext) => {
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
        return itemRenderer ? (itemRenderer(itemRendererProps)) : (jsxs(Flex, { align: "center", children: [listItemContext.selector && (jsx("div", { class: dropdownStyles.selectorWrapper, children: listItemContext.selector() })), jsx("div", { class: selectionMode === 'single'
                        ? dropdownStyles.singleSelectItem
                        : dropdownStyles.multiSelectItem, children: jsx(ListItemText, { variant: "primary", children: jsx(HighlightText, { matchText: searchText, children: renderItemText(itemContext, itemText) }) }) })] }));
    }, [itemRenderer, itemText, onSelectionChange, searchText, selectedKeys, selectionMode]);
    const keys = useMemo(() => {
        return { all: false, keys: selectedKeys ?? new Set() };
    }, [selectedKeys]);
    return (jsx(List, { "aria-label": ariaLabel, allowTabbableMode: false, currentItemVariant: currentItemVariant, currentKey: currentKey, data: data ?? null, loadingIndicator: loadingIndicator, onCurrentKeyChange: onCurrentKeyChange, onItemAction: onItemAction, onLoadRange: onLoadRange, onSelectionChange: onSelectionChange, role: "listbox", selectedKeys: keys, selectionMode: selectionMode, children: (context) => listItemRenderer(context) }));
}
/**
 * Custom 3 Skeleton loader for select multiple
 * TODO: to remove this once  is solved
 */
const loadingIndicator = (jsx(SkeletonContainer, { minimumCount: 3, children: () => {
        return (jsx(Flex, { height: "12x", align: "center", children: jsx(Skeleton, { height: "4x" }) }));
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
    const [placement, setPlacement] = useState(DEFAULT_PLACEMENT);
    const [prevIsOpen, setPrevIsOpen] = useState(isOpen);
    if (prevIsOpen !== isOpen) {
        // reset the placement to the default when the dropdown closes, not opens, so that it doesn't
        // initially open in the previous position and then move to the default position on the
        // rerender after the state is updated
        if (!isOpen) {
            setPlacement(DEFAULT_PLACEMENT);
        }
    }
    const handlePosition = useCallback((positionData) => {
        // update the placement so that the dropdown stays where it is until there is a collision,
        // i.e. it no longer fits, instead of letting it try to move back to the default position
        // on every render
        setPlacement(positionData.placement);
        // call the callback that was passed in through props
        onPosition?.(positionData);
    }, [onPosition, setPlacement]);
    const handleAutoDismiss = useCallback((event) => {
        onAutoDismiss?.(event);
    }, [onAutoDismiss]);
    const handleKeyDown = useCallback((event) => {
        if (event.defaultPrevented || isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case KEYS.ESC:
            case KEYS.TAB:
                handleAutoDismiss(event);
                break;
        }
    }, [handleAutoDismiss]);
    // use the mousedown event to be consistent with legacy JET and so that we're hiding the dropdown
    // on the same event where focus will transfer
    useOutsideMousedown({
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
    return !isOpen ? null : (jsx(Layer, { logicalParentRef: anchorRef, children: jsx(Floating, { anchorRef: anchorRef, sizeOptions: {
                isMaxHeightAdjusted: true,
                maxHeightCeiling: 400
            }, ref: dropdownRef, placement: placement, offsetValue: offsetValue, onPosition: handlePosition, children: jsx("div", { class: dropdownStyles.base, id: id, style: inlineStyle, onKeyDown: handleKeyDown, onMouseDown: preventDefaultForCurrentTarget, children: children }) }) }));
}

const noop = () => { };
function DropdownArrow({ isDisabled = false, onClick, testId }) {
    const { classes } = useComponentTheme(ButtonLabelLayoutRedwoodTheme, { size: 'sm' });
    const { baseTheme } = useComponentTheme(BaseButtonRedwoodTheme);
    const preventDefault = useCallback((event) => {
        event.preventDefault();
    }, []);
    const { pressProps } = usePress(onClick ?? noop, { isDisabled });
    // TODO: JET-67410 replace this with a icon button
    const styleClasses = classNames([
        classes,
        baseTheme,
        dropdownStyles.arrow.base,
        isDisabled ? dropdownStyles.arrow.disabled : dropdownStyles.arrow.enabled
    ]);
    const testIdProps = useTestId(testId);
    return (jsx("span", { "aria-hidden": "true", class: styleClasses, tabIndex: -1, onMouseDown: preventDefault, ...testIdProps, ...pressProps, children: jsx(SvgCaretDown, {}) }));
}

function DropdownList({ children, hasTopGap = true, hasBottomGap = true, isLoading = false }) {
    const styleClasses = classNames([
        dropdownStyles.list.base,
        hasTopGap && dropdownStyles.list.topGap,
        hasBottomGap && dropdownStyles.list.bottomGap,
        isLoading && dropdownStyles.list.loading
    ]);
    return (jsx(CollectionGestureContext.Provider, { value: 'embedded', children: jsx("div", { class: styleClasses, onMouseDown: preventDefaultForCurrentTarget, children: children }) }));
}

function DropdownUserAssistance(props) {
    // Prevent the focus from transferring when the user clicks on an empty/non-clickable area
    // of the user assistance
    const handleMouseDown = useCallback((event) => {
        // Don't call preventDefault when the user clicks on the help source link, so that the
        // focus is allowed to transfer in that case.
        if (event.target?.tagName !== 'A') {
            event.preventDefault();
        }
    }, []);
    return (jsx(FormFieldContext.Provider, { value: { isFocused: true }, children: jsx("div", { class: dropdownStyles.userAssistance, onMouseDown: handleMouseDown, children: jsx(InlineUserAssistance, { ...props }) }) }));
}

function EmptyResults() {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    // call preventDefault for mousedown on this div so that focus does not transfer from
    // the input
    return (jsx("div", { class: dropdownStyles.results.extraItem, onMouseDown: preventDefaultForCurrentTarget, children: translations.select_noMatchesFound() }));
}

/**
 * This component renders a link that looks like a list item in a Select* component dropdown.
 * It fires an action when the user triggers it, and is intended to be used for launching
 * external application UI from within the dropdown, for example to provide advanced search or
 * add to list functionality.
 * The LinkItem would typically be shown in a fixed position above or below the list itself.
 */
const LinkItem = ({ children, isHighlighted, onAction }) => {
    const { isHover, hoverProps } = useHover();
    const { isFocused, focusProps } = useFocusWithin();
    const handleClick = useCallback((e) => {
        // prevent the link from actually navigating by preventing default and returning false
        e.preventDefault();
        onAction?.();
        return false;
    }, [onAction]);
    const rootClasses = classNames([isFocused ? dropdownStyles.results.linkItemFocus : undefined]);
    const linkClasses = classNames([
        dropdownStyles.results.extraItem,
        isHover || isFocused || isHighlighted ? dropdownStyles.results.linkItemHighlight : undefined
    ]);
    return (jsx("div", { class: rootClasses, ...focusProps, children: jsx(Link, { href: "#", onClick: handleClick, children: jsx("div", { class: linkClasses, ...hoverProps, children: children }) }) }));
};

function MobileDropdown({ children, id, isOpen }) {
    return !isOpen ? null : (jsx(Layer, { children: jsx(WindowOverlay, { children: jsx("div", { id: id, class: mobileDropdownStyles.base, role: "dialog", "aria-modal": "true", children: jsx(Flex, { width: "100%", height: "100%", maxHeight: "100%", direction: "column", children: children }) }) }) }));
}

function SelectMobileDropdown({ children, footer, hasHeaderSeparator = true, header, id, isOpen }) {
    return (jsxs(MobileDropdown, { id: id, isOpen: isOpen, children: [header, hasHeaderSeparator && jsx(Separator, {}), jsx("div", { class: selectMobileDropdownStyles.content, children: children }), jsx(Separator, {}), footer] }));
}

const interpolations = [...Object.values(textInterpolations)];
const styleInterpolations = mergeInterpolations(interpolations);
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
const SelectMobileFieldInput = forwardRef(({ 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, 'aria-expanded': ariaExpanded, 'aria-invalid': ariaInvalid, 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledBy, displayValue, hasEmptyLabel, hasInsideLabel = false, isRequired, onBlur, onFocus, placeholder, textAlign, variant = 'default' }, ref) => {
    // consume required contexts
    const { isDisabled, isFocused, hasValue = false } = useFormFieldContext();
    const { isTabbable, tabbableModeProps } = useTabbableMode();
    // setup properties
    const myPlaceholder = isInputPlaceholderShown(hasInsideLabel, hasValue, isFocused)
        ? placeholder
        : undefined;
    // Add unsafe API for specifying an external label which is added to ariaLabelledBy on the input,
    // only when labelEdge is 'none' and label is ''. Since ariaLabelledBy takes precedence over all other
    // kinds of labels, this helps to ensure we don't override a meaningful label.
    const { UNSAFE_ariaLabelledBy } = useAccessibleContext();
    const mergedAriaLabelledBy = hasEmptyLabel
        ? merge([ariaLabelledBy, UNSAFE_ariaLabelledBy])
        : ariaLabelledBy;
    // setup style classes
    const { class: styleInterpolationClasses } = styleInterpolations({ textAlign });
    const { classes: themeClasses } = useComponentTheme(TextFieldInputRedwoodTheme, {
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
    const rootDivStyleClasses = classNames([
        selectMobileFieldInputStyles.base,
        styleInterpolationClasses,
        themeClasses
    ]);
    return (jsx("div", { "aria-autocomplete": "list", "aria-controls": ariaControls, "aria-describedby": ariaDescribedBy, "aria-expanded": ariaExpanded, "aria-invalid": ariaInvalid, "aria-label": ariaLabel, "aria-labelledby": mergedAriaLabelledBy, "aria-required": isRequired ? 'true' : undefined, class: rootDivStyleClasses, onBlur: onBlur, onFocus: onFocus, ref: ref, role: "combobox", ...(isTabbable && tabbableModeProps), children: jsx("div", { class: selectMobileFieldInputStyles.content, children: jsx(Text, { variant: displayValue ? 'inherit' : 'secondary', children: displayValue || myPlaceholder }) }) }));
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
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone' || deviceType === 'tablet';
}
/**
 * Helper function to determine whether the current device is a phone
 * @returns true if running on a phone, false otherwise
 */
function isPhone() {
    return getClientHints().deviceType === 'phone';
}
/**
 * Helper function to determine whether the current device is a tablet
 * @returns true if running on a tablet, false otherwise
 */
function isTablet() {
    return getClientHints().deviceType === 'tablet';
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
    const mainFieldRef = useRef(null);
    const dropdownRef = useRef(null);
    const [isDropdownOpen, setDropdownOpen] = useState(false);
    const [isDropdownAbove, setDropdownAbove] = useState(false);
    const [currentRow, setCurrentRow] = useState({
        rowKey: undefined
    });
    const [isUserFiltering, setUserFiltering] = useState(false);
    const [userInput, setUserInput] = useState();
    const [searchText, setSearchText] = useState();
    const [prevIsDropdownOpen, setPrevIsDropdownOpen] = useState(isDropdownOpen);
    const [prevIsFocused, setPrevIsFocused] = useState(isFocused);
    const [prevIsUserFiltering, setPrevIsUserFiltering] = useState(isUserFiltering);
    const onMouseDown = useCallback((event) => {
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
    const handleDropdownArrowClick = useCallback(() => {
        setDropdownOpen(!isDropdownOpen);
        // focus the input so that if the user Tabs afterwards, it loses focus and the dropdown closes
        inputRef.current?.focus();
    }, [inputRef, isDropdownOpen]);
    const handleDropdownAutoDismiss = useCallback((event) => {
        if (isDropdownOpen) {
            setDropdownOpen(false);
            switch (event?.type) {
                case 'keydown':
                    const keyboardEvent = event;
                    switch (keyboardEvent.code) {
                        case KEYS.ESC:
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
    const handleDropdownPosition = useCallback((data) => {
        setDropdownAbove(data.placement.startsWith('top'));
    }, []);
    const getDropdownTabbableElems = useCallback(() => {
        return isDropdownOpen && dropdownRef.current
            ? allTabbableElements(dropdownRef.current)
            : undefined;
    }, [isDropdownOpen]);
    const handleUpDownArrowKeys = useCallback((event) => {
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
    const handleMainFieldKeyDown = useCallback((event) => {
        // const target = event.target as HTMLElement;
        // ignore control key and function key
        if (isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case KEYS.PAGE_UP:
            case KEYS.PAGE_DOWN:
                // prevent the page from scrolling
                event.preventDefault();
                return;
            case KEYS.UP:
            case KEYS.DOWN:
                // prevent the page from scrolling
                event.preventDefault();
                break;
            case KEYS.ESC:
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
    const handleMainFieldKeyUp = useCallback((event) => {
        // ignore control key and function key
        if (isControlOrFunctionKey(event)) {
            return;
        }
        switch (event.code) {
            case KEYS.UP:
            case KEYS.DOWN:
                handleUpDownArrowKeys(event);
                break;
        }
    }, [handleUpDownArrowKeys]);
    const handleInput = useCallback((detail) => {
        if (!isDropdownOpen) {
            setDropdownOpen(true);
        }
        setUserFiltering(true);
        setUserInput(detail.value);
        const str = detail.value;
        setSearchText(str);
        onFilter?.({ searchText: str });
    }, [isDropdownOpen, onFilter]);
    const onCurrentKeyChange = useCallback((detail) => {
        setCurrentRow({ rowKey: detail.value });
    }, []);
    const stopFiltering = useCallback(() => {
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
    useEffect(() => {
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

export { DefaultList as D, EmptyResults as E, LinkItem as L, MobileDropdown as M, SelectMobileDropdown as S, Dropdown as a, DropdownArrow as b, DropdownList as c, DropdownUserAssistance as d, preventDefaultForCurrentTarget as e, SelectMobileFieldInput as f, isMobile as g, isPhone as h, isSimpleClick as i, isTablet as j, isBeforeDataFetch as k, isSearchTextEmptyOrUndefined as l, preventDefault as p, renderItemText as r, useSelectCommon as u };
//# sourceMappingURL=useSelectCommon-b6d67057.js.map
