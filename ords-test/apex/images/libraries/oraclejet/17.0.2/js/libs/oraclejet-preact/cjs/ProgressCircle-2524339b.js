/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
require('./meterUtils-b625ddb8.js');
var circleUtils = require('./circleUtils-4af93948.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_ProgressCircle_themes_redwood_ProgressCircleTheme = require('./UNSAFE_ProgressCircle/themes/redwood/ProgressCircleTheme.js');
var CircularMeter = require('./CircularMeter-fd47e0e5.js');

/**
 * A progress circle allows the user to visualize the progression of an extended computer operation.
 */
function ProgressCircle({ value, max, ...otherProps }) {
    return value === 'indeterminate' ? (jsxRuntime.jsx(IndeterminateProgressCircle, { ...otherProps })) : (jsxRuntime.jsx(DeterminateProgressCircle, { value: value, max: max, ...otherProps }));
}
const IndeterminateProgressCircle = ({ id, size, ...props }) => {
    const { classes, styles: { indeterminate } } = useComponentTheme.useComponentTheme(UNSAFE_ProgressCircle_themes_redwood_ProgressCircleTheme.ProgressCircleRedwoodTheme, {
        size,
        type: 'indeterminate'
    });
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const ariaProps = {
        'aria-valuetext': props['aria-valuetext'] || translations.progressIndeterminate(),
        role: 'progressbar'
    };
    return (jsxRuntime.jsx(CircularMeter.CircleWrapper, { id: id, ariaProps: ariaProps, class: classes, children: jsxRuntime.jsx(CircularMeter.CircleInner, { class: indeterminate }) }));
};
const DeterminateProgressCircle = ({ value = 0, max = 100, id, size }) => {
    const { classes, styles: { determinate, track, valueStyle } } = useComponentTheme.useComponentTheme(UNSAFE_ProgressCircle_themes_redwood_ProgressCircleTheme.ProgressCircleRedwoodTheme, {
        size
    });
    const percentage = Math.min(Math.max(0, value / max), 1);
    const clipPath = circleUtils.getProgressClipPath(percentage);
    const ariaProps = {};
    ariaProps['aria-valuemin'] = value != null ? 0 : undefined;
    ariaProps['aria-valuemax'] = value != null ? max : undefined;
    ariaProps['aria-valuenow'] = value != null ? value : undefined;
    ariaProps['role'] = 'progressbar';
    return (jsxRuntime.jsxs(CircularMeter.CircleWrapper, { id: id, ariaProps: ariaProps, class: classes, children: [jsxRuntime.jsx(CircularMeter.CircleInner, { class: classNames.classNames([determinate, track]) }), jsxRuntime.jsx(CircularMeter.CircleInner, { class: classNames.classNames([determinate, valueStyle]), clipPath: clipPath })] }));
};

exports.ProgressCircle = ProgressCircle;
//# sourceMappingURL=ProgressCircle-2524339b.js.map
