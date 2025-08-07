/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { useContext, useCallback, useRef } from 'preact/hooks';
import { T as Text } from './Text-da8588ce.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { createContext } from 'preact';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { NavigationListItemRedwoodTheme } from './UNSAFE_NavigationListCommon/themes/redwood/NavigationListItemTheme.js';
import { F as Flex } from './Flex-24628925.js';
import { S as SvgWarningS } from './WarningS-dc71c91a.js';
import { S as SvgErrorS } from './ErrorS-e6e7e0e2.js';
import { S as SvgInformationS } from './InformationS-170eee52.js';
import { S as SvgSuccessS } from './SuccessS-b342103c.js';
import { B as Badge } from './Badge-a458c469.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Context used to pass navlist information without having to pass it to navlist children props.
 * We want to communicate information down to any interested navlist item children.
 */
const NavigationListContext = createContext(null);

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the NavigationListContext
 *
 * @returns The value of NavigationListContext provider
 */
function useNavigationListContext() {
    return useContext(NavigationListContext);
}

const flexItemStyleInterpolations = mergeInterpolations([
    ...Object.values(flexitemInterpolations)
]);
const { class: labelContainerFlexItemClasses, ...labelContainerFlexItemStyle } = flexItemStyleInterpolations({
    alignSelf: 'center'
});
function useNavigationListItem({ itemKey }) {
    const { onSelectionChange, selection, currentKey, showFocusRing, navigationListItemPrefix } = useNavigationListContext();
    //Selection and focus state
    const isCurrent = currentKey === itemKey;
    const isSelected = selection === itemKey;
    //Styling
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle, applyActiveStyle } = useInteractionStyle();
    const { classes: listItemClasses, styles: { labelContainerClasses } } = useComponentTheme(NavigationListItemRedwoodTheme, {
        focusRing: showFocusRing ? 'isFocusRing' : 'notFocusRing',
        current: isCurrent ? 'isCurrent' : 'notCurrtent',
        selected: isSelected ? 'isSelected' : 'notSelected',
        hybridHover: applyHoverStyle ? 'isHybridHover' : 'notHybridHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        active: applyActiveStyle ? 'isActive' : 'notActive'
    });
    //Item handlers
    const handlePress = useCallback(() => {
        onSelectionChange?.({ value: itemKey, reason: 'pointer' });
    }, [itemKey, onSelectionChange]);
    //Legacy navlist makes selection on keyDown, but since preact tabbar made selection after keyUp, will do the same
    //for preact navlist
    const { pressProps } = usePress(handlePress);
    return {
        itemId: navigationListItemPrefix + itemKey,
        itemHandlers: mergeProps(interactionProps, pressProps /*,onFocusProps*/),
        itemClasses: classNames([listItemClasses]),
        isSelected,
        labelContainerClasses: classNames([labelContainerClasses, labelContainerFlexItemClasses]),
        labelContainerStyle: labelContainerFlexItemStyle
    };
}

/*TODO: JET-58535. Add ripple effect when touching navigationListItem. */
function BaseNavigationListItem({ itemKey, label, badge, metadata, severity = 'none', removeIcon }) {
    const itemRef = useRef(null);
    //Logic of the component handled here
    const { itemId, itemHandlers, itemClasses, isSelected, labelContainerClasses, labelContainerStyle } = useNavigationListItem({
        itemKey
    });
    const severityRequirement = !(severity === 'none' || severity === undefined);
    const IconComponent = (severityValue) => {
        switch (severityValue) {
            case 'error':
                return jsx(SvgErrorS, { color: "danger" });
            case 'warning':
                return jsx(SvgWarningS, { color: "warning" });
            case 'info':
                return jsx(SvgInformationS, { color: "info" });
            case 'confirmation':
                return jsx(SvgSuccessS, { color: "success" });
            default:
                return null;
        }
    };
    const { styles: { iconLabelContainer, iconContainer, navigationItemMetadata } } = useComponentTheme(NavigationListItemRedwoodTheme);
    const navigationItemMatadata = classNames([navigationItemMetadata]);
    const endIconContainerClasses = classNames([iconLabelContainer, iconContainer]);
    const { styles: { navigationlistRemoveIcon } } = useComponentTheme(NavigationListItemRedwoodTheme);
    const removeClass = classNames([navigationlistRemoveIcon]);
    return (jsxs("li", { role: "tab", ...itemHandlers, "data-oj-key": itemKey, id: itemId, class: itemClasses, "aria-selected": isSelected, ref: itemRef, children: [label && (jsx("span", { class: labelContainerClasses, style: labelContainerStyle, children: jsx(Text, { size: "inherit", weight: "inherit", variant: "inherit", children: label }) })), (metadata || severityRequirement || badge || removeIcon) && (jsxs(Flex, { gap: "2x", align: "center", justify: "end", flex: "1 1 auto", children: [' ', badge && (jsx("span", { class: endIconContainerClasses, children: jsx(Badge, { size: "md", variant: "neutralSubtle", children: badge }) })), metadata && (jsx("span", { class: navigationItemMatadata, children: jsx(Text, { children: '( ' + metadata + ' )' }) })), severityRequirement && (jsx("span", { class: endIconContainerClasses, children: IconComponent(severity) })), removeIcon && jsx("span", { class: removeClass, children: removeIcon })] }))] }));
}

export { BaseNavigationListItem as B, NavigationListContext as N, useNavigationListContext as u };
//# sourceMappingURL=BaseNavigationListItem-3a377d46.js.map
