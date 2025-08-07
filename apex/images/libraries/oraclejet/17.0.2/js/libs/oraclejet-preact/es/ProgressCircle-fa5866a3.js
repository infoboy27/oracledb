/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import './meterUtils-5d22645f.js';
import { e as getProgressClipPath } from './circleUtils-3c9d3ffc.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ProgressCircleRedwoodTheme } from './UNSAFE_ProgressCircle/themes/redwood/ProgressCircleTheme.js';
import { C as CircleWrapper, a as CircleInner } from './CircularMeter-2c50b36e.js';

/**
 * A progress circle allows the user to visualize the progression of an extended computer operation.
 */
function ProgressCircle({ value, max, ...otherProps }) {
    return value === 'indeterminate' ? (jsx(IndeterminateProgressCircle, { ...otherProps })) : (jsx(DeterminateProgressCircle, { value: value, max: max, ...otherProps }));
}
const IndeterminateProgressCircle = ({ id, size, ...props }) => {
    const { classes, styles: { indeterminate } } = useComponentTheme(ProgressCircleRedwoodTheme, {
        size,
        type: 'indeterminate'
    });
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const ariaProps = {
        'aria-valuetext': props['aria-valuetext'] || translations.progressIndeterminate(),
        role: 'progressbar'
    };
    return (jsx(CircleWrapper, { id: id, ariaProps: ariaProps, class: classes, children: jsx(CircleInner, { class: indeterminate }) }));
};
const DeterminateProgressCircle = ({ value = 0, max = 100, id, size }) => {
    const { classes, styles: { determinate, track, valueStyle } } = useComponentTheme(ProgressCircleRedwoodTheme, {
        size
    });
    const percentage = Math.min(Math.max(0, value / max), 1);
    const clipPath = getProgressClipPath(percentage);
    const ariaProps = {};
    ariaProps['aria-valuemin'] = value != null ? 0 : undefined;
    ariaProps['aria-valuemax'] = value != null ? max : undefined;
    ariaProps['aria-valuenow'] = value != null ? value : undefined;
    ariaProps['role'] = 'progressbar';
    return (jsxs(CircleWrapper, { id: id, ariaProps: ariaProps, class: classes, children: [jsx(CircleInner, { class: classNames([determinate, track]) }), jsx(CircleInner, { class: classNames([determinate, valueStyle]), clipPath: clipPath })] }));
};

export { ProgressCircle as P };
//# sourceMappingURL=ProgressCircle-fa5866a3.js.map
