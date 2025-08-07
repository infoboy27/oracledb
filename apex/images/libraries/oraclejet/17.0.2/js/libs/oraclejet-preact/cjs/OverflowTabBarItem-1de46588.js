/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var hooks = require('preact/hooks');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var clientHints = require('./clientHints-9e411b6e.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var classNames = require('./classNames-c14c6ef3.js');
var NavigationList = require('./NavigationList-5218562e.js');
var NavigationListItem = require('./NavigationListItem-b80c41dc.js');
var Icon = require('./Icon-3ffd13dc.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');
var Dropdown = require('./Dropdown-820dc3fe.js');
var Sheet = require('./Sheet-a6267b5f.js');
var TabBarItem = require('./TabBarItem-2b3039aa.js');
var UNSAFE_TabBarCommon_themes_OverflowTabBarItemStyles_css = require('./UNSAFE_TabBarCommon/themes/OverflowTabBarItemStyles.css.js');
var RemovableNavigationListItem = require('./RemovableNavigationListItem-eb2c8156.js');

const SvgOverflowH = (props) => (jsxRuntime.jsx(Icon.Icon, { viewBox: "0 0 24 24", ...props, children: jsxRuntime.jsx("g", { fill: "none", children: jsxRuntime.jsx("path", { d: "M6 12a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm8 0a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm8 0a2 2 0 1 1-4 0 2 2 0 0 1 4 0z", fill: "currentcolor" }) }) }));

/**
 * An OverflowTabBarItem renders TabBarItems in a device appropriate popup. OverflowTabBarItem is used internally in an OverflowTabBar.
 */
function OverflowTabBarItem({ overflowItemKey, icon, badge, overflowItems, isOpen, onClose }) {
    const { selection, showFocusRing, isEdgeBottom, onSelect, onRemove, layout } = useTabBarContext.useTabBarContext();
    const isPointerSelection = hooks.useRef(false);
    const overflowTabBarItemRef = hooks.useRef(null);
    const navigationListRef = preact.createRef();
    const handleSelectionChange = hooks.useCallback((detail) => {
        if (detail.reason === 'pointer') {
            isPointerSelection.current = true;
        }
        onSelect?.({ value: detail.value });
        onClose?.({ reason: 'itemAction' });
    }, [onSelect, onClose]);
    const handleDropdownClose = hooks.useCallback((e) => {
        onClose?.({ reason: e.reason });
    }, [onClose]);
    const handleSheetClose = hooks.useCallback(() => {
        onClose?.({ reason: 'dismissed' });
    }, [onClose]);
    //When NavigationList steals focus the app resets it. Not always would it be reset to
    //parent of OverflowTabBarItem. Though currentKey would be correct, but focusRing would would not be visible
    //Hence we check for isPointerSelection.current
    const focusRingRequirement = showFocusRing && !isPointerSelection.current && !getIsMobile();
    const overflowContainsKey = (searchKey) => {
        return overflowItems?.find((item) => item.itemKey === searchKey) != null;
    };
    const currentPanelId = overflowItems?.find((item) => item.itemKey === selection)?.tabPanelId;
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const isSelected = selection !== undefined && overflowContainsKey(selection);
    //instead of specifying flex: '1 0 auto' in cssProps var
    const styleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const navContainerClasses = classNames.classNames([UNSAFE_TabBarCommon_themes_OverflowTabBarItemStyles_css.styles.navContainerBase]);
    const navContainerRef = hooks.useRef(null);
    const handleKeyDown = hooks.useCallback((event) => {
        if (event.key === 'ArrowDown') {
            event.preventDefault();
            navigationListRef.current?.focus();
        }
    }, [navigationListRef]);
    const getNavigationList = hooks.useCallback(() => {
        return (jsxRuntime.jsx("div", { onKeyDown: handleKeyDown, tabIndex: 0, ref: navContainerRef, class: navContainerClasses, children: jsxRuntime.jsx(NavigationList.NavigationList, { ref: navigationListRef, selection: selection, onSelectionChange: handleSelectionChange, onRemove: onRemove, children: overflowItems?.map((item) => item.isRemovable ? (jsxRuntime.jsx(RemovableNavigationListItem.RemovableNavigationListItem, { itemKey: item.itemKey, label: item.label, badge: item.badge, metadata: item.metadata, severity: item.severity })) : (jsxRuntime.jsx(NavigationListItem.NavigationListItem, { itemKey: item.itemKey, label: item.label, badge: item.badge, metadata: item.metadata, severity: item.severity }))) }) }));
    }, [
        handleKeyDown,
        navContainerClasses,
        navigationListRef,
        selection,
        handleSelectionChange,
        onRemove,
        overflowItems
    ]);
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [overflowItems && overflowItems.length > 0 && (jsxRuntime.jsx("div", { ref: overflowTabBarItemRef, style: flexDimensions, children: jsxRuntime.jsx(TabBarItem.BaseTabBarItem, { "aria-controls": currentPanelId, itemKey: overflowItemKey, label: translations.overflowItemLabel(), icon: icon ? icon : jsxRuntime.jsx(SvgOverflowH, {}), badge: badge, showFocusRingOverride: focusRingRequirement, selectionOverride: isSelected, displayOverride: 'icons', "aria-haspopup": true }) })), getIsMobile() ? (jsxRuntime.jsx(Sheet.Sheet, { isOpen: isOpen, onClose: handleSheetClose, children: getNavigationList() })) : (jsxRuntime.jsx(Dropdown.Dropdown, { initialFocus: "firstFocusable", isOpen: isOpen, onClose: handleDropdownClose, placement: isEdgeBottom ? 'top-end' : 'bottom-end', anchorRef: overflowTabBarItemRef, children: getNavigationList() }))] }));
}
const getIsMobile = () => {
    const { deviceType } = clientHints.getClientHints();
    return deviceType === 'phone';
};

exports.OverflowTabBarItem = OverflowTabBarItem;
//# sourceMappingURL=OverflowTabBarItem-1de46588.js.map
