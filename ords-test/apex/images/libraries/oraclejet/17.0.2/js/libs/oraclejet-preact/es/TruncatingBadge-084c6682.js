/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { BadgeRedwoodTheme } from './UNSAFE_Badge/themes/redwood/BadgeTheme.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import { u as useDetectTruncation } from './useDetectTruncation-a99bfd14.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';

function TruncatingBadge({ variant, size, edge, children }) {
    const { classes } = useComponentTheme(BadgeRedwoodTheme, {
        variant,
        size,
        edge
    });
    const { isTabbable } = useTabbableMode();
    const { detectTruncationProps, isTextTruncated } = useDetectTruncation();
    const { tooltipContent, tooltipProps } = useTooltip({
        text: children,
        isDisabled: !isTextTruncated
    });
    return (jsxs(Fragment, { children: [jsx("span", { ...detectTruncationProps, ...tooltipProps, tabIndex: isTextTruncated && isTabbable ? 0 : -1, class: classes, children: children }), tooltipContent] }));
}

export { TruncatingBadge as T };
//# sourceMappingURL=TruncatingBadge-084c6682.js.map
