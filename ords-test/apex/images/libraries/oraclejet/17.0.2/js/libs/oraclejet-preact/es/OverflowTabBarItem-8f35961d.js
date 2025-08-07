/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { createRef } from 'preact';
import { useRef, useCallback } from 'preact/hooks';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { I as Icon } from './Icon-90c3a630.js';
import { u as useTabBarContext } from './useTabBarContext-0071d2a7.js';
import { D as Dropdown } from './Dropdown-717319bb.js';
import { S as Sheet } from './Sheet-e4121f4a.js';
import { B as BaseTabBarItem } from './TabBarItem-c681fa07.js';
import { styles } from './UNSAFE_TabBarCommon/themes/OverflowTabBarItemStyles.css.js';
import { N as NavigationList, a as NavigationListItem } from './NavigationListItem-ea899fab.js';
import { R as RemovableNavigationListItem } from './RemovableNavigationListItem-4c86bec8.js';

const SvgOverflowH = (props) => (jsx(Icon, { viewBox: "0 0 24 24", ...props, children: jsx("g", { fill: "none", children: jsx("path", { d: "M6 12a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm8 0a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm8 0a2 2 0 1 1-4 0 2 2 0 0 1 4 0z", fill: "currentcolor" }) }) }));

/**
 * An OverflowTabBarItem renders TabBarItems in a device appropriate popup. OverflowTabBarItem is used internally in an OverflowTabBar.
 */
function OverflowTabBarItem({ overflowItemKey, icon, badge, overflowItems, isOpen, onClose }) {
    const { selection, showFocusRing, isEdgeBottom, onSelect, onRemove, layout } = useTabBarContext();
    const isPointerSelection = useRef(false);
    const overflowTabBarItemRef = useRef(null);
    const navigationListRef = createRef();
    const handleSelectionChange = useCallback((detail) => {
        if (detail.reason === 'pointer') {
            isPointerSelection.current = true;
        }
        onSelect?.({ value: detail.value });
        onClose?.({ reason: 'itemAction' });
    }, [onSelect, onClose]);
    const handleDropdownClose = useCallback((e) => {
        onClose?.({ reason: e.reason });
    }, [onClose]);
    const handleSheetClose = useCallback(() => {
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
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const isSelected = selection !== undefined && overflowContainsKey(selection);
    //instead of specifying flex: '1 0 auto' in cssProps var
    const styleInterpolations = mergeInterpolations([
        ...Object.values(flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const navContainerClasses = classNames([styles.navContainerBase]);
    const navContainerRef = useRef(null);
    const handleKeyDown = useCallback((event) => {
        if (event.key === 'ArrowDown') {
            event.preventDefault();
            navigationListRef.current?.focus();
        }
    }, [navigationListRef]);
    const getNavigationList = useCallback(() => {
        return (jsx("div", { onKeyDown: handleKeyDown, tabIndex: 0, ref: navContainerRef, class: navContainerClasses, children: jsx(NavigationList, { ref: navigationListRef, selection: selection, onSelectionChange: handleSelectionChange, onRemove: onRemove, children: overflowItems?.map((item) => item.isRemovable ? (jsx(RemovableNavigationListItem, { itemKey: item.itemKey, label: item.label, badge: item.badge, metadata: item.metadata, severity: item.severity })) : (jsx(NavigationListItem, { itemKey: item.itemKey, label: item.label, badge: item.badge, metadata: item.metadata, severity: item.severity }))) }) }));
    }, [
        handleKeyDown,
        navContainerClasses,
        navigationListRef,
        selection,
        handleSelectionChange,
        onRemove,
        overflowItems
    ]);
    return (jsxs(Fragment, { children: [overflowItems && overflowItems.length > 0 && (jsx("div", { ref: overflowTabBarItemRef, style: flexDimensions, children: jsx(BaseTabBarItem, { "aria-controls": currentPanelId, itemKey: overflowItemKey, label: translations.overflowItemLabel(), icon: icon ? icon : jsx(SvgOverflowH, {}), badge: badge, showFocusRingOverride: focusRingRequirement, selectionOverride: isSelected, displayOverride: 'icons', "aria-haspopup": true }) })), getIsMobile() ? (jsx(Sheet, { isOpen: isOpen, onClose: handleSheetClose, children: getNavigationList() })) : (jsx(Dropdown, { initialFocus: "firstFocusable", isOpen: isOpen, onClose: handleDropdownClose, placement: isEdgeBottom ? 'top-end' : 'bottom-end', anchorRef: overflowTabBarItemRef, children: getNavigationList() }))] }));
}
const getIsMobile = () => {
    const { deviceType } = getClientHints();
    return deviceType === 'phone';
};

export { OverflowTabBarItem as O };
//# sourceMappingURL=OverflowTabBarItem-8f35961d.js.map
