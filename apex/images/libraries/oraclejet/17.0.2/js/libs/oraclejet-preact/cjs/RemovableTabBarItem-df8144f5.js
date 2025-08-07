/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useHover = require('./useHover-910b8e32.js');
var Close = require('./Close-2adc0f0f.js');
var Flex = require('./Flex-fbba4ad6.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');
var useTabBarContext = require('./useTabBarContext-2a6a796c.js');
var TabBarItem = require('./TabBarItem-2b3039aa.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var EmbeddedIconButton = require('./EmbeddedIconButton-cadadca0.js');

function RemovableTabBarItem({ itemKey, label, icon, badge, metadata, severity, 'aria-controls': ariaControls }) {
    const { selection, currentKey, layout, onRemove } = useTabBarContext.useTabBarContext();
    const isSelected = selection === itemKey;
    const isCurrent = currentKey === itemKey;
    const handleRemove = hooks.useCallback(() => {
        onRemove?.({ value: itemKey });
    }, [onRemove, itemKey]);
    const { hoverProps, isHover } = useHover.useHover({});
    //instead of specifying flex: '1 0 auto' in cssProps var
    const styleInterpolations = mergeInterpolations.mergeInterpolations([
        ...Object.values(flexitem.flexitemInterpolations)
    ]);
    const flexDimensions = styleInterpolations({
        flex: layout === 'stretch' ? '1 0 auto' : '0 0 auto'
    });
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    //TODO: In addition to aria-label a genric instruction is required for keyboard deletion
    //common to al tabs,after feedback from Curt's investigations.
    return (jsxRuntime.jsx("div", { ...hoverProps, style: flexDimensions, children: jsxRuntime.jsx(Flex.Flex, { children: jsxRuntime.jsx(TabBarItem.BaseTabBarItem, { "aria-controls": ariaControls, itemKey: itemKey, label: label, icon: icon, badge: badge, metadata: metadata, severity: severity, removeIcon: jsxRuntime.jsx("span", { "data-oj-tabbar-item-remove-icon": "true", children: jsxRuntime.jsx(EmbeddedIconButton.EmbeddedIconButton, { "aria-label": translations.tabBarNavigationList_removeCueText(), size: "xs", onAction: handleRemove, children: (isHover || isSelected || isCurrent) && jsxRuntime.jsx(Close.SvgClose, {}) }) }) }) }) }));
}

exports.RemovableTabBarItem = RemovableTabBarItem;
//# sourceMappingURL=RemovableTabBarItem-df8144f5.js.map
