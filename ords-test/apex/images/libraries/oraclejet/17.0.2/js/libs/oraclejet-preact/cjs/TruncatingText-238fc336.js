/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useDetectTruncation = require('./useDetectTruncation-d9a97f76.js');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var classNames = require('./classNames-c14c6ef3.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var UNSAFE_Text_themes_TextStyles_css = require('./UNSAFE_Text/themes/TextStyles.css.js');

const interpolations = [
    ({ lineClamp }) => !lineClamp ? {} : { class: UNSAFE_Text_themes_TextStyles_css.styles.lineClamp, webkitLineClamp: lineClamp }
];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
function TruncatingText({ children, hyphens, size, truncation, variant = 'inherit', weight, overflowWrap = 'anywhere', ...props }) {
    const variantClasses = UNSAFE_Text_themes_TextStyles_css.multiVariantStyles({
        hyphens,
        size,
        truncation,
        variant,
        weight,
        overflowWrap
    });
    const { class: interpolatedClasses, ...styles } = styleInterpolations(props);
    const classes = classNames.classNames([variantClasses, interpolatedClasses]);
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { detectTruncationProps, isTextTruncated } = useDetectTruncation.useDetectTruncation();
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: children,
        isDisabled: !isTextTruncated
    });
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("span", { ...detectTruncationProps, ...tooltipProps, tabIndex: isTextTruncated && isTabbable ? 0 : -1, class: classes, style: styles, id: props.id, children: children }), tooltipContent] }));
}

exports.TruncatingText = TruncatingText;
//# sourceMappingURL=TruncatingText-238fc336.js.map
