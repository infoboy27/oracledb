/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { multiVariantStyles, styles } from './UNSAFE_Text/themes/TextStyles.css.js';

const interpolations = [
    ({ lineClamp }) => !lineClamp ? {} : { class: styles.lineClamp, webkitLineClamp: lineClamp }
];
const styleInterpolations = mergeInterpolations(interpolations);
/**
 * Text shows written or printed work.
 */
function Text({ children, hyphens, size, truncation, variant = 'inherit', weight, overflowWrap = 'anywhere', ...props }) {
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
    return (jsx("span", { class: classes, style: styles, id: props.id, children: children }));
}

export { Text as T };
//# sourceMappingURL=Text-da8588ce.js.map
