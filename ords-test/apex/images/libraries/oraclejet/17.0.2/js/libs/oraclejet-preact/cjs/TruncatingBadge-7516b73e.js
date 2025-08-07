/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_Badge_themes_redwood_BadgeTheme = require('./UNSAFE_Badge/themes/redwood/BadgeTheme.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var useDetectTruncation = require('./useDetectTruncation-d9a97f76.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');

function TruncatingBadge({ variant, size, edge, children }) {
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_Badge_themes_redwood_BadgeTheme.BadgeRedwoodTheme, {
        variant,
        size,
        edge
    });
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { detectTruncationProps, isTextTruncated } = useDetectTruncation.useDetectTruncation();
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: children,
        isDisabled: !isTextTruncated
    });
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("span", { ...detectTruncationProps, ...tooltipProps, tabIndex: isTextTruncated && isTabbable ? 0 : -1, class: classes, children: children }), tooltipContent] }));
}

exports.TruncatingBadge = TruncatingBadge;
//# sourceMappingURL=TruncatingBadge-7516b73e.js.map
