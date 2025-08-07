/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ProgressBarRedwoodTheme } from './UNSAFE_ProgressBar/themes/redwood/ProgressBarTheme.js';
import { B as BarTrack, a as BarValue } from './LinearMeter-901ec883.js';

/**
 * A progress bar allows the user to visualize the progression of an extended computer operation.
 */
function ProgressBar({ value, max, ...otherProps }) {
    return value === 'indeterminate' ? (jsx(IndeterminateProgressBar, { ...otherProps })) : (jsx(DeterminateProgressBar, { value: value, max: max, ...otherProps }));
}
const IndeterminateProgressBar = ({ id, width, edge = 'none', ...props }) => {
    const { classes, styles: { valueStyle, indeterminate, animationStyleLTR, animationStyleRTL, highContrastValueStyle, trackBorderEdgeNone, trackBorderEdgeTop } } = useComponentTheme(ProgressBarRedwoodTheme, {
        edge: edge === 'none' ? edge : undefined
    });
    const { direction, forcedColors } = useUser();
    const barValueClasses = classNames([
        valueStyle,
        indeterminate,
        direction === 'rtl' ? animationStyleRTL : animationStyleLTR,
        forcedColors === 'active' ? highContrastValueStyle : ''
    ]);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const ariaProps = {
        'aria-valuetext': props['aria-valuetext'] || translations.progressIndeterminate(),
        role: 'progressbar'
    };
    const trackBorderClass = forcedColors === 'active'
        ? undefined
        : edge === 'none'
            ? trackBorderEdgeNone
            : trackBorderEdgeTop;
    return (jsx(BarTrack, { id: id, ariaProps: ariaProps, class: classNames([classes, trackBorderClass]), length: width, children: jsx(BarValue, { class: barValueClasses }) }));
};
const DeterminateProgressBar = ({ value = 0, max = 100, id, width, edge = 'none' }) => {
    const { forcedColors } = useUser();
    const { classes, styles: { valueStyle, highContrastValueStyle, trackBorderEdgeNone, trackBorderEdgeTop } } = useComponentTheme(ProgressBarRedwoodTheme, {
        edge: edge === 'none' ? edge : undefined
    });
    const barValueClasses = classNames([
        valueStyle,
        forcedColors === 'active' ? highContrastValueStyle : ''
    ]);
    const percentage = `${Math.min(Math.max(0, value / max), 1) * 100}%`;
    const ariaProps = {};
    ariaProps['aria-valuemin'] = value != null ? 0 : undefined;
    ariaProps['aria-valuemax'] = value != null ? max : undefined;
    ariaProps['aria-valuenow'] = value != null ? value : undefined;
    ariaProps['role'] = 'progressbar';
    return (jsx(BarTrack, { ariaProps: ariaProps, id: id, length: width, class: classNames([classes, edge === 'none' ? trackBorderEdgeNone : trackBorderEdgeTop]), children: jsx(BarValue, { class: barValueClasses, length: percentage }) }));
};

export { ProgressBar as P };
//# sourceMappingURL=ProgressBar-afafe39a.js.map
