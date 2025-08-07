/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var classNames = require('./classNames-c14c6ef3.js');
var usePress = require('./usePress-00deca01.js');
var useUser = require('./useUser-a6d15333.js');
var Text = require('./Text-aaacb6a0.js');
var Flex = require('./Flex-fbba4ad6.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var dimensions = require('./dimensions-b48bf1ab.js');
var boxalignment = require('./boxalignment-5ef612ee.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_TabBarCommon_themes_redwood_TabBarItemTheme = require('./UNSAFE_TabBarCommon/themes/redwood/TabBarItemTheme.js');
var useConveyorBeltItem = require('./useConveyorBeltItem-eb851d33.js');
var WarningS = require('./WarningS-d9a02d39.js');
var ErrorS = require('./ErrorS-bfe081e3.js');
var InformationS = require('./InformationS-5bf32f4c.js');
var SuccessS = require('./SuccessS-862e9e4b.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useTooltipControlled = require('./useTooltipControlled-706a3651.js');
var UNSAFE_TabBarCommon_themes_TabBarItemContract_css = require('./UNSAFE_TabBarCommon/themes/TabBarItemContract.css.js');
var Badge = require('./Badge-0e522f12.js');

const useTabBarItemTooltip = ({ label, isDisabled }) => {
    const [isOpen, setOpen] = hooks.useState(false);
    const { tooltipProps, tooltipContent } = useTooltipControlled.useTooltipControlled({
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
    const { onSelect, selection, currentKey, showFocusRing, hideTooltip, layout, display, size, isEdgeBottom, tabItemPrefix } = useTabBarContext.useTabBarContext();
    const isCurrent = currentKey === itemKey;
    const { ref, ...conveyorBeltProps } = useConveyorBeltItem.useConveyorBeltItem({ isCurrent });
    //Selection
    //Dependency on currentKey because upon removal selectionChange does not change hence no re render
    //and it is still holding the deleted key as selection
    const handlePress = hooks.useCallback(() => {
        onSelect?.({ value: itemKey });
    }, [itemKey, onSelect]);
    const { pressProps } = usePress.usePress(handlePress);
    const isSelected = selection === itemKey;
    const isStacked = display === 'stacked' ? true : false;
    const isIconOnly = display === 'icons' || (displayOverride && displayOverride === 'icons') ? true : false;
    const isTall = size === 'lg' ? true : false;
    const labelRequirement = label && !(label === ' ' || label === undefined);
    const severityRequirement = !(severity === 'none' || severity === undefined);
    const IconComponent = (severityValue) => {
        switch (severityValue) {
            case 'error':
                return jsxRuntime.jsx(ErrorS.SvgErrorS, { color: "danger" });
            case 'warning':
                return jsxRuntime.jsx(WarningS.SvgWarningS, { color: "warning" });
            case 'info':
                return jsxRuntime.jsx(InformationS.SvgInformationS, { color: "info" });
            case 'confirmation':
                return jsxRuntime.jsx(SuccessS.SvgSuccessS, { color: "success" });
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
    const { direction } = useUser.useUser();
    const makeFocusRingVisible = showFocusRingOverride !== undefined ? showFocusRingOverride : showFocusRing;
    const makeSelectionVisible = selectionOverride !== undefined ? selectionOverride : isSelected;
    const { classes, styles: { tabBarItemIcon, tabBarItemIconStacked, tabBarItemMetadata, tabBarItemStackedBadge, tabBarItemStackedBadgeRtl, tabBarItemRemoveIcon } } = useComponentTheme.useComponentTheme(UNSAFE_TabBarCommon_themes_redwood_TabBarItemTheme.TabBarItemRedwoodTheme, {
        selection: makeSelectionVisible ? 'isSelected' : 'notSelected',
        current: isCurrent ? 'isCurrent' : 'notCurrent',
        focusRing: makeFocusRingVisible ? 'showFocusRing' : 'noFocusRing',
        edgeBottom: isEdgeBottom ? 'isBottom' : 'notBottom'
    });
    const tabBarItem = classNames.classNames([classes]);
    const tabBarItemIconClasses = classNames.classNames([
        tabBarItemIcon,
        (isStacked || isIconOnly || !labelRequirement) && tabBarItemIconStacked
    ]);
    const tabBarItemMetadataClasses = classNames.classNames([tabBarItemMetadata]);
    const tabBarItemStackedBadgeClasses = classNames.classNames([
        tabBarItemStackedBadge,
        direction === 'rtl' && tabBarItemStackedBadgeRtl
    ]);
    const removeClass = classNames.classNames([tabBarItemRemoveIcon]);
    const styleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations),
        ...Object.values(dimensions.dimensionInterpolations),
        ...Object.values(boxalignment.boxAlignmentInterpolations)
    ]);
    //This is for simple item where height and width need to be specified on the main div.
    const tabDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto',
        minWidth: '10.5x',
        height: isTall ? UNSAFE_TabBarCommon_themes_TabBarItemContract_css.tabBarItemVars.lgHeight : UNSAFE_TabBarCommon_themes_TabBarItemContract_css.tabBarItemVars.mdHeight,
        //This is needed for gap between icon/ label and remove icon in labelIconRenderer
        gap: '2x'
    });
    //This is for complex item, where only flex dimensions needs to be applied as height and width comes from child Flex component.
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const labelIconRenderer = () => {
        return (jsxRuntime.jsxs("div", { "data-oj-key": itemKey, "data-oj-removable": removeIcon ? 'true' : undefined, id: tabItemPrefix + itemKey, class: tabBarItem, role: "tab", "aria-controls": ariaControls, "aria-selected": isSelected, "aria-haspopup": ariaHasPopup, ...mergeProps.mergeProps(pressProps, tooltipEventHandlerProps, conveyorBeltProps), ref: ref, style: tabDimensions, children: [jsxRuntime.jsxs(Flex.Flex, { align: "center", justify: "center", flex: "1 1 auto", gap: "2x", children: [!isIconOnly && !isStacked && icon && labelRequirement && (jsxRuntime.jsx("span", { class: tabBarItemIconClasses, children: icon })), !isIconOnly && labelRequirement && (jsxRuntime.jsx(Text.Text, { size: "md", weight: "semiBold", children: label }))] }), removeIcon && jsxRuntime.jsx("span", { class: removeClass, children: removeIcon })] }));
    };
    const complexItemRenderer = () => {
        return (jsxRuntime.jsxs("div", { "data-oj-key": itemKey, "data-oj-removable": removeIcon ? 'true' : undefined, id: tabItemPrefix + itemKey, class: tabBarItem, role: "tab", "aria-controls": ariaControls, "aria-selected": isSelected, "aria-haspopup": ariaHasPopup, ...mergeProps.mergeProps(pressProps, tooltipEventHandlerProps, conveyorBeltProps), ref: ref, style: flexDimensions, children: [jsxRuntime.jsxs(Flex.Flex, { flex: "1 1 auto", children: [jsxRuntime.jsxs(Flex.Flex, { minWidth: "10.5x", minHeight: isTall ? UNSAFE_TabBarCommon_themes_TabBarItemContract_css.tabBarItemVars.lgHeight : '100%', height: isStacked && labelRequirement ? UNSAFE_TabBarCommon_themes_TabBarItemContract_css.tabBarItemVars.stackedHeight : UNSAFE_TabBarCommon_themes_TabBarItemContract_css.tabBarItemVars.mdHeight, direction: isStacked && labelRequirement ? 'column' : 'row', gap: "2x", align: "center", justify: "center", alignSelf: "center", flex: "1 1 auto", children: [(isStacked || isIconOnly || (!labelRequirement && icon)) && (jsxRuntime.jsxs("div", { class: tabBarItemIconClasses, children: [icon, jsxRuntime.jsx("span", { class: tabBarItemStackedBadgeClasses, children: badge ? (jsxRuntime.jsx(Badge.Badge, { size: "xs", variant: "neutral", children: badge })) : null })] })), !isIconOnly && !isStacked && icon && labelRequirement && (jsxRuntime.jsx("span", { class: tabBarItemIconClasses, children: icon })), !isIconOnly && labelRequirement && (jsxRuntime.jsx(Text.Text, { size: "md", weight: "semiBold", children: label })), !isStacked && !isIconOnly && badge && labelRequirement && (jsxRuntime.jsx(Badge.Badge, { size: "md", variant: "neutralSubtle", children: badge })), metadata && (jsxRuntime.jsx("span", { class: tabBarItemMetadataClasses, children: jsxRuntime.jsx(Text.Text, { children: '( ' + metadata + ' )' }) })), severityRequirement && (jsxRuntime.jsx("span", { class: tabBarItemIconClasses, children: IconComponent(severity) }))] }), removeIcon && jsxRuntime.jsx("span", { class: removeClass, children: removeIcon })] }), tooltipContent] }));
    };
    return badge || metadata || severity !== 'none' || isStacked || isIconOnly
        ? complexItemRenderer()
        : labelIconRenderer();
}

/**
 * TabBarItem content can be created by using labels or icons or both.
 */
function TabBarItem({ itemKey, label, icon, badge, metadata, severity, 'aria-controls': ariaControls }) {
    return (jsxRuntime.jsx(BaseTabBarItem, { "aria-controls": ariaControls, itemKey: itemKey, label: label, icon: icon, badge: badge, metadata: metadata, severity: severity }));
}

exports.BaseTabBarItem = BaseTabBarItem;
exports.TabBarItem = TabBarItem;
//# sourceMappingURL=TabBarItem-2b3039aa.js.map
