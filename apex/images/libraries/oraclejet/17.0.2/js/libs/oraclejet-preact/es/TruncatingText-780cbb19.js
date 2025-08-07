/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { u as useDetectTruncation } from './useDetectTruncation-a99bfd14.js';
import { u as useTooltip } from './useTooltip-9dec25b3.js';
import './useTooltipControlled-2044f639.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { multiVariantStyles, styles } from './UNSAFE_Text/themes/TextStyles.css.js';

const interpolations = [
    ({ lineClamp }) => !lineClamp ? {} : { class: styles.lineClamp, webkitLineClamp: lineClamp }
];
const styleInterpolations = mergeInterpolations(interpolations);
function TruncatingText({ children, hyphens, size, truncation, variant = 'inherit', weight, overflowWrap = 'anywhere', ...props }) {
    const variantClasses = multiVariantStyles({
        hyphens,
        size,
        truncation,
        variant,
        weight,
        overflowWrap
    });
    const { class: interpolatedClasses, ...styles } = styleInterpolations(props);
    const classes = classNames([variantClasses, interpolatedClasses]);
    const { isTabbable } = useTabbableMode();
    const { detectTruncationProps, isTextTruncated } = useDetectTruncation();
    const { tooltipContent, tooltipProps } = useTooltip({
        text: children,
        isDisabled: !isTextTruncated
    });
    return (jsxs(Fragment, { children: [jsx("span", { ...detectTruncationProps, ...tooltipProps, tabIndex: isTextTruncated && isTabbable ? 0 : -1, class: classes, style: styles, id: props.id, children: children }), tooltipContent] }));
}

export { TruncatingText as T };
//# sourceMappingURL=TruncatingText-780cbb19.js.map
