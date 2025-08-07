/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var hooks = require('preact/hooks');
var HiddenAccessible = require('./HiddenAccessible-087eb49a.js');
var LiveRegion = require('./LiveRegion-1315adeb.js');
var TabBar = require('./TabBar-e77706d0.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var collectionUtils = require('./collectionUtils-1535080e.js');
require('./LayerHost-46e4d858.js');
require('preact/compat');
var useReorderableItem = require('./useReorderableItem-02ed8243.js');
var UNSAFE_ReorderableTabBar_themes_ReorderableTabBarItemStyles_css = require('./UNSAFE_ReorderableTabBar/themes/ReorderableTabBarItemStyles.css.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');



const ITEM_SELECTOR = '[role="tab"]';
/**
 * A private item that will be used by ReorderableTabBar, location TBD (could be moved to PRIVATE_TabBar)
 */
function ReorderableTabBarItem({ children, dragKey, setDragKey, onReorder, layout, rootRef }) {
    const tabBarItemRef = hooks.useRef(null);
    const getItem = hooks.useCallback(() => tabBarItemRef?.current?.querySelector(ITEM_SELECTOR), []);
    const setTransferData = hooks.useCallback((event) => {
        event.dataTransfer?.setData('text/tabbar-item-key', collectionUtils.getKey(getItem()) + '');
    }, [getItem]);
    const { currentKey } = useTabBarContext.useTabBarContext();
    const { rootProps, isDragged, overlayZoneBeforeProps, overlayZoneAfterProps } = useReorderableItem.useReorderableItem({
        currentKey: currentKey,
        isDisabled: onReorder ? false : true,
        draggable: onReorder ? true : false,
        dragKey,
        setDragKey,
        onReorder,
        rootRef,
        ref: tabBarItemRef,
        getItem,
        setTransferData,
        itemStyles: UNSAFE_ReorderableTabBar_themes_ReorderableTabBarItemStyles_css.styles,
        itemSelector: ITEM_SELECTOR
    });
    //instead of specifying flex: '1 0 auto' in style
    const styleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    return (jsxRuntime.jsxs("div", { ...rootProps, style: flexDimensions, children: [children, !isDragged && dragKey && (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { ...overlayZoneBeforeProps }), jsxRuntime.jsx("div", { ...overlayZoneAfterProps })] }))] }));
}

/**
 * A component that allows reordering of tabs within a TabBar.
 */
function ReorderableTabBar({ 'aria-label': ariaLabel, 'aria-labelledby': ariaLabelledby, children, layout = 'stretch', display = 'standard', size = 'md', edge = 'top', selection, onSelect, onRemove, onReorder, testId }) {
    const rootRef = hooks.useRef(null);
    const [dragKey, setDragKey] = hooks.useState(undefined);
    const displayStackProps = {
        display: display
    };
    const displayNonStackProps = {
        display: display,
        size: size
    };
    const displayProps = display === 'stacked' ? displayStackProps : displayNonStackProps;
    const { reorderProps, reorderContext, reorderInstructionsId, reorderStatus, reorderInstructions } = useReorderableItem.useReorderable({
        onReorder,
        rootRef,
        itemSelector: ITEM_SELECTOR
    });
    return (jsxRuntime.jsxs("div", { ref: rootRef, ...reorderProps, children: [jsxRuntime.jsx(useReorderableItem.ReorderableContext.Provider, { value: reorderContext, children: jsxRuntime.jsx(TabBar.TabBar, { "aria-label": ariaLabel, "aria-labelledby": ariaLabelledby, layout: layout, edge: edge, selection: selection, onSelect: onSelect, onRemove: onRemove, testId: testId, ...displayProps, "aria-describedby": reorderInstructionsId, children: preact.toChildArray(children).map((child) => {
                        return (jsxRuntime.jsx(ReorderableTabBarItem, { dragKey: dragKey, setDragKey: setDragKey, onReorder: onReorder, layout: layout, rootRef: rootRef, children: child }));
                    }) }) }), jsxRuntime.jsx("span", { id: reorderInstructionsId, children: jsxRuntime.jsx(HiddenAccessible.HiddenAccessible, { children: reorderInstructions }) }), jsxRuntime.jsx(LiveRegion.LiveRegion, { children: reorderStatus })] }));
}

exports.ReorderableTabBar = ReorderableTabBar;
//# sourceMappingURL=ReorderableTabBar-025a0d71.js.map
