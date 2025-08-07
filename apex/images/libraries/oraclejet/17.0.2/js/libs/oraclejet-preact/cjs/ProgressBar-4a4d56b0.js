/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var useUser = require('./useUser-a6d15333.js');
var useTranslationBundle = require('./useTranslationBundle-9da032d6.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_ProgressBar_themes_redwood_ProgressBarTheme = require('./UNSAFE_ProgressBar/themes/redwood/ProgressBarTheme.js');
var LinearMeter = require('./LinearMeter-3d06349c.js');

/**
 * A progress bar allows the user to visualize the progression of an extended computer operation.
 */
function ProgressBar({ value, max, ...otherProps }) {
    return value === 'indeterminate' ? (jsxRuntime.jsx(IndeterminateProgressBar, { ...otherProps })) : (jsxRuntime.jsx(DeterminateProgressBar, { value: value, max: max, ...otherProps }));
}
const IndeterminateProgressBar = ({ id, width, edge = 'none', ...props }) => {
    const { classes, styles: { valueStyle, indeterminate, animationStyleLTR, animationStyleRTL, highContrastValueStyle, trackBorderEdgeNone, trackBorderEdgeTop } } = useComponentTheme.useComponentTheme(UNSAFE_ProgressBar_themes_redwood_ProgressBarTheme.ProgressBarRedwoodTheme, {
        edge: edge === 'none' ? edge : undefined
    });
    const { direction, forcedColors } = useUser.useUser();
    const barValueClasses = classNames.classNames([
        valueStyle,
        indeterminate,
        direction === 'rtl' ? animationStyleRTL : animationStyleLTR,
        forcedColors === 'active' ? highContrastValueStyle : ''
    ]);
    const translations = useTranslationBundle.useTranslationBundle('@oracle/oraclejet-preact');
    const ariaProps = {
        'aria-valuetext': props['aria-valuetext'] || translations.progressIndeterminate(),
        role: 'progressbar'
    };
    const trackBorderClass = forcedColors === 'active'
        ? undefined
        : edge === 'none'
            ? trackBorderEdgeNone
            : trackBorderEdgeTop;
    return (jsxRuntime.jsx(LinearMeter.BarTrack, { id: id, ariaProps: ariaProps, class: classNames.classNames([classes, trackBorderClass]), length: width, children: jsxRuntime.jsx(LinearMeter.BarValue, { class: barValueClasses }) }));
};
const DeterminateProgressBar = ({ value = 0, max = 100, id, width, edge = 'none' }) => {
    const { forcedColors } = useUser.useUser();
    const { classes, styles: { valueStyle, highContrastValueStyle, trackBorderEdgeNone, trackBorderEdgeTop } } = useComponentTheme.useComponentTheme(UNSAFE_ProgressBar_themes_redwood_ProgressBarTheme.ProgressBarRedwoodTheme, {
        edge: edge === 'none' ? edge : undefined
    });
    const barValueClasses = classNames.classNames([
        valueStyle,
        forcedColors === 'active' ? highContrastValueStyle : ''
    ]);
    const percentage = `${Math.min(Math.max(0, value / max), 1) * 100}%`;
    const ariaProps = {};
    ariaProps['aria-valuemin'] = value != null ? 0 : undefined;
    ariaProps['aria-valuemax'] = value != null ? max : undefined;
    ariaProps['aria-valuenow'] = value != null ? value : undefined;
    ariaProps['role'] = 'progressbar';
    return (jsxRuntime.jsx(LinearMeter.BarTrack, { ariaProps: ariaProps, id: id, length: width, class: classNames.classNames([classes, edge === 'none' ? trackBorderEdgeNone : trackBorderEdgeTop]), children: jsxRuntime.jsx(LinearMeter.BarValue, { class: barValueClasses, length: percentage }) }));
};

exports.ProgressBar = ProgressBar;
//# sourceMappingURL=ProgressBar-4a4d56b0.js.map
