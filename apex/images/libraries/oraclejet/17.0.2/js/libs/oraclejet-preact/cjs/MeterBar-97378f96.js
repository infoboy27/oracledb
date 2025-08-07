/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var TrackResizeContainer = require('./TrackResizeContainer-cd09fc87.js');
var size = require('./size-4e606ce4.js');
var classNames = require('./classNames-c14c6ef3.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var hooks = require('preact/hooks');
var useUser = require('./useUser-a6d15333.js');
var useMeterDatatip = require('./useMeterDatatip-5db0b026.js');
var useKeyboardEvents = require('./useKeyboardEvents-f1a1dfef.js');
var meterUtils = require('./meterUtils-b625ddb8.js');
var UNSAFE_MeterBar_themes_MeterBarStyles_css = require('./UNSAFE_MeterBar/themes/MeterBarStyles.css.js');
var utils = require('./utils-395027fe.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_MeterBar_themes_redwood_MeterBarTheme = require('./UNSAFE_MeterBar/themes/redwood/MeterBarTheme.js');
var useTestId = require('./useTestId-8234ec1e.js');
var UNSAFE_MeterBar_themes_MeterBarContract_css = require('./UNSAFE_MeterBar/themes/MeterBarContract.css.js');
var utils$1 = require('./utils-b7099be5.js');
var LinearMeter = require('./LinearMeter-3d06349c.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const FIT_REF_BAR_PROTRUSION = 16;
/**
 * Returns the metric value of the clicked point.
 * @param event The PointerEvent
 * @param dimensionsRef Ref to stored dimensions of the meter bar.
 * @param min The minimum value of the meter bar.
 * @param max The maximum value of the meter bar.
 * @param step The step value of the meter bar.
 * @param orientation The orientation of the meter bar.
 * @param isRtl Whether the reading mode is 'rtl'
 * @returns The metric value of the clicked point.
 */
function getValue(event, dimensionsRef, min, max, step, orientation, isRtl) {
    const dims = dimensionsRef.current;
    if (!dims || dims.width === 0) {
        return undefined;
    }
    let val;
    if (orientation === 'horizontal') {
        const width = event.offsetX;
        val = min + ((max - min) * (isRtl ? dims.width - width : width)) / dims.width;
    }
    else {
        const height = dims.height - event.offsetY;
        val = min + ((max - min) * height) / dims.height;
    }
    val = Math.round(val / step) * step;
    return Math.max(min, Math.min(max, val));
}
/**
 * Returns the true dimension of the meter bar after first render. All dimensions are 0 for initial render.
 * @param element The meter bar track HTML element
 * @returns The dimension of the meter bar.
 */
function getDimensions(element) {
    if (!element) {
        return {
            width: 0,
            height: 0
        };
    }
    const trackDims = element.getBoundingClientRect();
    return {
        width: trackDims.width,
        height: trackDims.height
    };
}
/**
 * Returns object with 'start' and 'end' keys. Value for each key will be true if at least one ref line with correposnding position is present in meter bar.
 * @param lines The array of reference lines.
 * @returns Returns object with start and end keys.
 */
function getRefLinesInfo(lines) {
    let refLineInfo = { start: false, end: false };
    if (lines) {
        refLineInfo = lines.reduce((acc, cur) => {
            acc.start = acc.start || cur.position === 'start';
            acc.end = acc.end || cur.position === 'end' || cur.position == null;
            return acc;
        }, refLineInfo);
    }
    return refLineInfo;
}
const getMarginClass = function (info, isHoriz, barTrackMarginTopStyle, barTrackMarginStartStyle, barTrackMarginBottomStyle, barTrackMarginEndStyle) {
    const className = [];
    if (info.start) {
        className.push(isHoriz ? barTrackMarginTopStyle : barTrackMarginStartStyle);
    }
    if (info.end) {
        className.push(isHoriz ? barTrackMarginBottomStyle : barTrackMarginEndStyle);
    }
    return className;
};
const getFitMarginClass = function (info, isHoriz, barTrackMarginTopFitStyle, barTrackMarginStartFitStyle, barTrackMarginBottomFitStyle, barTrackMarginEndFitStyle) {
    const className = [];
    if (info.start) {
        className.push(isHoriz ? barTrackMarginTopFitStyle : barTrackMarginStartFitStyle);
    }
    if (info.end) {
        className.push(isHoriz ? barTrackMarginBottomFitStyle : barTrackMarginEndFitStyle);
    }
    return className;
};
const getFitTrackWidth = function (info, width, isHoriz) {
    if (width) {
        if (info.start && !isHoriz) {
            width = width - FIT_REF_BAR_PROTRUSION;
        }
        if (info.end && !isHoriz) {
            width = width - FIT_REF_BAR_PROTRUSION;
        }
    }
    return width;
};
const getFitTrackHeight = function (info, height, isHoriz) {
    if (height) {
        if (info.start && isHoriz) {
            height = height - FIT_REF_BAR_PROTRUSION;
        }
        if (info.end && isHoriz) {
            height = height - FIT_REF_BAR_PROTRUSION;
        }
    }
    return height;
};

function ReferenceLineBar({ orientation, percentage, color, position, width, height }) {
    const isHoriz = orientation === 'horizontal';
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    const isStartPos = position === 'start';
    return (jsxRuntime.jsx("div", { class: classNames.classNames([
            UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesBaseStyle,
            isHoriz ? UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesHorizontalStyle : UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesVerticalStyle,
            isStartPos
                ? isHoriz
                    ? UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesHoriontalStartStyle
                    : isRtl
                        ? UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesVerticalStartRtlStyle
                        : UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.referenceLinesVerticalStartLtrStyle
                : ''
        ]), style: {
            left: isHoriz && !isRtl ? percentage : undefined,
            right: isHoriz && isRtl ? percentage : undefined,
            bottom: isHoriz ? undefined : percentage,
            backgroundColor: utils.getVisThresholdColor(color),
            width,
            height
        } }));
}

function ThresholdBar({ color, length, orientation, ...otherProps }) {
    const { direction } = useUser.useUser();
    const isHoriz = orientation === 'horizontal';
    const isRtl = direction === 'rtl';
    return (jsxRuntime.jsx("div", { class: classNames.classNames([
            UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.thresholdBarBaseStyle,
            isHoriz
                ? isRtl
                    ? UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.thresholdBarHorizontalBarTrackSectionRtlStyle
                    : UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.thresholdBarHorizontalBarTrackSectionLtrStyle
                : UNSAFE_MeterBar_themes_MeterBarStyles_css.styles.thresholdBarVerticalBarTrackSectionStyle,
            otherProps.class
        ]), style: {
            width: isHoriz ? length : '100%',
            height: isHoriz ? '100%' : length,
            backgroundColor: utils.getVisThresholdColor(color)
        } }));
}

function MeterBarWithDimensions({ max = 100, min = 0, value = 0, step = 1, length = '100%', width, height, size: size$1, orientation = 'horizontal', isTrackRendered = true, thresholdDisplay = 'all', indicatorSize = 1, testId, ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    meterUtils.validateRange(min, max, value, step);
    const currentInputRef = hooks.useRef();
    const isHoriz = orientation === 'horizontal';
    const barTrackRef = hooks.useRef(null);
    const dimensionsRef = hooks.useRef(getDimensions(null));
    const { direction, forcedColors } = useUser.useUser();
    const isRtl = direction === 'rtl';
    hooks.useEffect(() => {
        if (props.onCommit || props.onInput) {
            dimensionsRef.current = getDimensions(barTrackRef.current);
        }
    }, [size$1, length, orientation, props.onCommit, props.onInput]);
    const getValueFromEvent = (event) => {
        // only evaluate value from bar track
        if (event.target == barTrackRef.current) {
            return getValue(event, dimensionsRef, min, max, step, orientation, isRtl);
        }
        return;
    };
    const isPointerActiveRef = hooks.useRef(false);
    const pointerEventsProps = useMeterDatatip.usePointerEvents(value, getValueFromEvent, barTrackRef, currentInputRef, isPointerActiveRef, props.onCommit, props.onInput);
    const keyboardEventsProps = useKeyboardEvents.useKeyboardEvents(value, min, max, step, currentInputRef, props.onCommit, props.onInput);
    const { datatipContent, datatipProps } = useMeterDatatip.useMeterDatatip(value, isPointerActiveRef, props.datatip, props['aria-describedby']);
    const ariaLabelProps = meterUtils.getMeterAriaProps(value, min, max, props['aria-label'], props['aria-labelledby'], props.thresholds);
    const mergedProps = mergeProps.mergeProps(pointerEventsProps, keyboardEventsProps, datatipProps, ariaLabelProps);
    const validIndicatorSize = Math.max(0, Math.min(1, indicatorSize));
    const valueBarLength = `${((value - min) * 100) / (max - min)}%`;
    const valueBarSize = `${validIndicatorSize * 100}%`;
    const { trackColor, indicatorColor } = meterUtils.getTrackAndIndicatorColor(value, thresholdDisplay, props.trackColor, props.indicatorColor, props.thresholds);
    const refLineInfo = getRefLinesInfo(props.referenceLines);
    const isInteractive = props.onCommit || props.onInput;
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { classes, styles: { interactiveStyle, barValueBaseStyle, barValueVerticalStyle, barValueHorizontalStyle, barValueHighContrastStyle, barTrackBaseStyle, barTrackHorizontalSizeStyle, barTrackVerticalSizeStyle, barTrackBorderStyle, barTrackMarginTopStyle, barTrackMarginStartStyle, barTrackMarginBottomStyle, barTrackMarginEndStyle, barTrackMarginTopFitStyle, barTrackMarginStartFitStyle, barTrackMarginBottomFitStyle, barTrackMarginEndFitStyle, trackSectionHorizontalFirstStyle, trackSectionHorizontalLastStyle, trackSectionVerticalFirstStyle, trackSectionVerticalLastStyle, trackSectionRoundedCornersStyle } } = useComponentTheme.useComponentTheme(UNSAFE_MeterBar_themes_redwood_MeterBarTheme.MeterBarRedwoodTheme, {
        size: size$1,
        orientation
    });
    const isFit = size$1 === 'fit';
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { tabIndex: !isTabbable ? -1 : 0, ...testIdProps, ...mergedProps, style: {
                    width: isFit
                        ? getFitTrackWidth(refLineInfo, width, isHoriz)
                        : isHoriz
                            ? size.sizeToCSS(length)
                            : undefined,
                    height: isFit
                        ? getFitTrackHeight(refLineInfo, height, isHoriz)
                        : isHoriz
                            ? undefined
                            : size.sizeToCSS(length)
                }, class: classNames.classNames([
                    classes,
                    ...(isFit
                        ? getFitMarginClass(refLineInfo, isHoriz, barTrackMarginTopFitStyle, barTrackMarginStartFitStyle, barTrackMarginBottomFitStyle, barTrackMarginEndFitStyle)
                        : [])
                ]), children: jsxRuntime.jsxs(LinearMeter.BarTrack, { ref: barTrackRef, orientation: orientation, color: !isTrackRendered || (thresholdDisplay === 'all' && props.thresholds)
                        ? 'transparent'
                        : trackColor, class: classNames.classNames([
                        barTrackBaseStyle,
                        isInteractive ? interactiveStyle : '',
                        isHoriz ? barTrackHorizontalSizeStyle : barTrackVerticalSizeStyle,
                        !isTrackRendered || (thresholdDisplay === 'all' && props.thresholds)
                            ? undefined
                            : barTrackBorderStyle,
                        ...(!isFit
                            ? getMarginClass(refLineInfo, isHoriz, barTrackMarginTopStyle, barTrackMarginStartStyle, barTrackMarginBottomStyle, barTrackMarginEndStyle)
                            : '')
                    ]), children: [thresholdDisplay === 'all' &&
                            props.thresholds
                                ?.filter((threshold) => threshold.max > min && threshold.max <= max)
                                .sort((a, b) => a.max - b.max)
                                .map((threshold, index, thresholds) => {
                                const diff = index === 0 ? threshold.max - min : threshold.max - thresholds[index - 1].max;
                                const trackSectionLastStyle = isHoriz
                                    ? trackSectionHorizontalLastStyle
                                    : trackSectionVerticalLastStyle;
                                let trackSectionStyleClass = index === 0
                                    ? isHoriz
                                        ? trackSectionHorizontalFirstStyle
                                        : trackSectionVerticalFirstStyle
                                    : '';
                                if (threshold.max === max)
                                    trackSectionStyleClass =
                                        index === 0
                                            ? trackSectionRoundedCornersStyle // Single threshold from min to max
                                            : trackSectionLastStyle;
                                return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(ThresholdBar, { class: trackSectionStyleClass, orientation: orientation, length: `${(diff * 100) / (max - min)}%`, color: threshold.color }), isTrackRendered && index === thresholds.length - 1 && threshold.max < max ? (jsxRuntime.jsx(ThresholdBar, { class: trackSectionLastStyle, color: trackColor, orientation: orientation, length: `${((max - thresholds[index].max) * 100) / (max - min)}%` })) : ('')] }));
                            }), jsxRuntime.jsx(LinearMeter.BarValue, { length: valueBarLength, size: valueBarSize, orientation: orientation, class: classNames.classNames([
                                barValueBaseStyle,
                                isHoriz ? barValueHorizontalStyle : barValueVerticalStyle,
                                forcedColors === 'active' ? barValueHighContrastStyle : ''
                            ]), color: indicatorColor }), props.referenceLines?.map((item) => (jsxRuntime.jsx(ReferenceLineBar, { color: item.color, orientation: orientation, percentage: `${((item.value - min) * 100) / (max - min)}%`, position: item.position, width: isFit
                                ? isHoriz
                                    ? undefined
                                    : `calc(${utils$1.xUnits(4)} + ${UNSAFE_MeterBar_themes_MeterBarContract_css.meterBarVars.size})`
                                : undefined, height: isFit
                                ? isHoriz
                                    ? `calc(${utils$1.xUnits(4)} + ${UNSAFE_MeterBar_themes_MeterBarContract_css.meterBarVars.size})`
                                    : undefined
                                : undefined })))] }) }), datatipContent] }));
}

/**
 * A Meter bar displays information graphically in a rectangular bar, highlighting a specific metric value's progress in relation to its min, max, or thresholds.
 */
function MeterBar({ orientation, length, size, ...props }) {
    return (jsxRuntime.jsx(jsxRuntime.Fragment, { children: size === 'fit' ? (jsxRuntime.jsx(TrackResizeContainer.TrackResizeContainer, { width: "100%", height: "100%", children: (width, height) => (jsxRuntime.jsx(MeterBarWithDimensions, { width: width, height: height, orientation: orientation, size: size, ...props })) })) : (jsxRuntime.jsx(MeterBarWithDimensions, { size: size, length: length, orientation: orientation, ...props })) }));
}

exports.MeterBar = MeterBar;
//# sourceMappingURL=MeterBar-97378f96.js.map
