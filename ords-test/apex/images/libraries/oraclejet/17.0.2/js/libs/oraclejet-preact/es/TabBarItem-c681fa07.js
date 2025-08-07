/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { useState, useCallback } from 'preact/hooks';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { u as useUser } from './useUser-99920e02.js';
import { T as Text } from './Text-da8588ce.js';
import { F as Flex } from './Flex-24628925.js';
import { u as useTabBarContext } from './useTabBarContext-0071d2a7.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { b as boxAlignmentInterpolations } from './boxalignment-486c5ac9.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { TabBarItemRedwoodTheme } from './UNSAFE_TabBarCommon/themes/redwood/TabBarItemTheme.js';
import { u as useConveyorBeltItem } from './useConveyorBeltItem-ce7d69d6.js';
import { S as SvgWarningS } from './WarningS-dc71c91a.js';
import { S as SvgErrorS } from './ErrorS-e6e7e0e2.js';
import { S as SvgInformationS } from './InformationS-170eee52.js';
import { S as SvgSuccessS } from './SuccessS-b342103c.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useTooltipControlled } from './useTooltipControlled-2044f639.js';
import { tabBarItemVars } from './UNSAFE_TabBarCommon/themes/TabBarItemContract.css.js';
import { B as Badge } from './Badge-a458c469.js';

const useTabBarItemTooltip = ({ label, isDisabled }) => {
    const [isOpen, setOpen] = useState(false);
    const { tooltipProps, tooltipContent } = useTooltipControlled({
        isOpen: isOpen,
        isDisabled,
        focusStrategy: 'logical',
        text: label,
        onToggle: ({ value }) => {
            setOpen(value);
        }
    });
    const { onLogicalFocus, onLogicalBlur, ...tooltipEventHandlerProps } = tooltipProps;
    return { tooltipContent, tooltipEventHandlerProps, onLogicalFocus, onLogicalBlur };
};

function BaseTabBarItem({ itemKey, label, icon, badge, metadata, severity = 'none', removeIcon, showFocusRingOverride, selectionOverride, displayOverride, 'aria-controls': ariaControls, 'aria-haspopup': ariaHasPopup }) {
    const { onSelect, selection, currentKey, showFocusRing, hideTooltip, layout, display, size, isEdgeBottom, tabItemPrefix } = useTabBarContext();
    const isCurrent = currentKey === itemKey;
    const { ref, ...conveyorBeltProps } = useConveyorBeltItem({ isCurrent });
    //Selection
    //Dependency on currentKey because upon removal selectionChange does not change hence no re render
    //and it is still holding the deleted key as selection
    const handlePress = useCallback(() => {
        onSelect?.({ value: itemKey });
    }, [itemKey, onSelect]);
    const { pressProps } = usePress(handlePress);
    const isSelected = selection === itemKey;
    const isStacked = display === 'stacked' ? true : false;
    const isIconOnly = display === 'icons' || (displayOverride && displayOverride === 'icons') ? true : false;
    const isTall = size === 'lg' ? true : false;
    const labelRequirement = label && !(label === ' ' || label === undefined);
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
    const showTooltip = isIconOnly;
    const { tooltipContent, tooltipEventHandlerProps, onLogicalFocus, onLogicalBlur } = useTabBarItemTooltip({ label, isDisabled: !showTooltip });
    if (showTooltip) {
        if (isCurrent && showFocusRing && !hideTooltip) {
            onLogicalFocus(ref.current);
        }
        else if (!isCurrent || (isCurrent && !showFocusRing) || hideTooltip) {
            onLogicalBlur();
        }
    }
    const { direction } = useUser();
    const makeFocusRingVisible = showFocusRingOverride !== undefined ? showFocusRingOverride : showFocusRing;
    const makeSelectionVisible = selectionOverride !== undefined ? selectionOverride : isSelected;
    const { classes, styles: { tabBarItemIcon, tabBarItemIconStacked, tabBarItemMetadata, tabBarItemStackedBadge, tabBarItemStackedBadgeRtl, tabBarItemRemoveIcon } } = useComponentTheme(TabBarItemRedwoodTheme, {
        selection: makeSelectionVisible ? 'isSelected' : 'notSelected',
        current: isCurrent ? 'isCurrent' : 'notCurrent',
        focusRing: makeFocusRingVisible ? 'showFocusRing' : 'noFocusRing',
        edgeBottom: isEdgeBottom ? 'isBottom' : 'notBottom'
    });
    const tabBarItem = classNames([classes]);
    const tabBarItemIconClasses = classNames([
        tabBarItemIcon,
        (isStacked || isIconOnly || !labelRequirement) && tabBarItemIconStacked
    ]);
    const tabBarItemMetadataClasses = classNames([tabBarItemMetadata]);
    const tabBarItemStackedBadgeClasses = classNames([
        tabBarItemStackedBadge,
        direction === 'rtl' && tabBarItemStackedBadgeRtl
    ]);
    const removeClass = classNames([tabBarItemRemoveIcon]);
    const styleInterpolations = mergeInterpolations([
        ...Object.values(flexitemInterpolations),
        ...Object.values(dimensionInterpolations),
        ...Object.values(boxAlignmentInterpolations)
    ]);
    //This is for simple item where height and width need to be specified on the main div.
    const tabDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto',
        minWidth: '10.5x',
        height: isTall ? tabBarItemVars.lgHeight : tabBarItemVars.mdHeight,
        //This is needed for gap between icon/ label and remove icon in labelIconRenderer
        gap: '2x'
    });
    //This is for complex item, where only flex dimensions needs to be applied as height and width comes from child Flex component.
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const labelIconRenderer = () => {
        return (jsxs("div", { "data-oj-key": itemKey, "data-oj-removable": removeIcon ? 'true' : undefined, id: tabItemPrefix + itemKey, class: tabBarItem, role: "tab", "aria-controls": ariaControls, "aria-selected": isSelected, "aria-haspopup": ariaHasPopup, ...mergeProps(pressProps, tooltipEventHandlerProps, conveyorBeltProps), ref: ref, style: tabDimensions, children: [jsxs(Flex, { align: "center", justify: "center", flex: "1 1 auto", gap: "2x", children: [!isIconOnly && !isStacked && icon && labelRequirement && (jsx("span", { class: tabBarItemIconClasses, children: icon })), !isIconOnly && labelRequirement && (jsx(Text, { size: "md", weight: "semiBold", children: label }))] }), removeIcon && jsx("span", { class: removeClass, children: removeIcon })] }));
    };
    const complexItemRenderer = () => {
        return (jsxs("div", { "data-oj-key": itemKey, "data-oj-removable": removeIcon ? 'true' : undefined, id: tabItemPrefix + itemKey, class: tabBarItem, role: "tab", "aria-controls": ariaControls, "aria-selected": isSelected, "aria-haspopup": ariaHasPopup, ...mergeProps(pressProps, tooltipEventHandlerProps, conveyorBeltProps), ref: ref, style: flexDimensions, children: [jsxs(Flex, { flex: "1 1 auto", children: [jsxs(Flex, { minWidth: "10.5x", minHeight: isTall ? tabBarItemVars.lgHeight : '100%', height: isStacked && labelRequirement ? tabBarItemVars.stackedHeight : tabBarItemVars.mdHeight, direction: isStacked && labelRequirement ? 'column' : 'row', gap: "2x", align: "center", justify: "center", alignSelf: "center", flex: "1 1 auto", children: [(isStacked || isIconOnly || (!labelRequirement && icon)) && (jsxs("div", { class: tabBarItemIconClasses, children: [icon, jsx("span", { class: tabBarItemStackedBadgeClasses, children: badge ? (jsx(Badge, { size: "xs", variant: "neutral", children: badge })) : null })] })), !isIconOnly && !isStacked && icon && labelRequirement && (jsx("span", { class: tabBarItemIconClasses, children: icon })), !isIconOnly && labelRequirement && (jsx(Text, { size: "md", weight: "semiBold", children: label })), !isStacked && !isIconOnly && badge && labelRequirement && (jsx(Badge, { size: "md", variant: "neutralSubtle", children: badge })), metadata && (jsx("span", { class: tabBarItemMetadataClasses, children: jsx(Text, { children: '( ' + metadata + ' )' }) })), severityRequirement && (jsx("span", { class: tabBarItemIconClasses, children: IconComponent(severity) }))] }), removeIcon && jsx("span", { class: removeClass, children: removeIcon })] }), tooltipContent] }));
    };
    return badge || metadata || severity !== 'none' || isStacked || isIconOnly
        ? complexItemRenderer()
        : labelIconRenderer();
}

/**
 * TabBarItem content can be created by using labels or icons or both.
 */
function TabBarItem({ itemKey, label, icon, badge, metadata, severity, 'aria-controls': ariaControls }) {
    return (jsx(BaseTabBarItem, { "aria-controls": ariaControls, itemKey: itemKey, label: label, icon: icon, badge: badge, metadata: metadata, severity: severity }));
}

export { BaseTabBarItem as B, TabBarItem as T };
//# sourceMappingURL=TabBarItem-c681fa07.js.map
