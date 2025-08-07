/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var BaseNavigationListItem = require('./BaseNavigationListItem-175a3f35.js');
var useNavigationListItem = require('./useNavigationListItem-74009187.js');
var Close = require('./Close-2adc0f0f.js');
var hooks = require('preact/hooks');
var useHover = require('./useHover-910b8e32.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var EmbeddedIconButton = require('./EmbeddedIconButton-cadadca0.js');

function RemovableNavigationListItem({ itemKey, label, badge, metadata, severity }) {
    const { selection, currentKey, onRemove } = useNavigationListItem.useNavigationListContext();
    const isSelected = selection === itemKey;
    const isCurrent = currentKey === itemKey;
    const handleRemove = hooks.useCallback(() => {
        onRemove?.({ value: itemKey });
    }, [onRemove, itemKey]);
    const { hoverProps, isHover } = useHover.useHover({});
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    //instead of specifying flex: '1 0 auto' in cssProps var
    return (jsxRuntime.jsx("div", { ...hoverProps, children: jsxRuntime.jsx(BaseNavigationListItem.BaseNavigationListItem, { itemKey: itemKey, label: label, badge: badge, metadata: metadata, severity: severity, removeIcon: jsxRuntime.jsx("span", { "data-oj-navigationlist-item-remove-icon": true, children: jsxRuntime.jsx(EmbeddedIconButton.EmbeddedIconButton, { "aria-label": translations.tabBarNavigationList_removeCueText(), size: "xs", onAction: handleRemove, children: (isHover || isSelected || isCurrent) && jsxRuntime.jsx(Close.SvgClose, {}) }) }) }) }));
}

exports.RemovableNavigationListItem = RemovableNavigationListItem;
//# sourceMappingURL=RemovableNavigationListItem-eb2c8156.js.map
