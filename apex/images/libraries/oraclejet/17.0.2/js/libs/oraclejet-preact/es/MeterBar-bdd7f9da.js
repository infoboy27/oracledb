/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { s as sizeToCSS } from './size-782ed57a.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { useRef, useEffect } from 'preact/hooks';
import { u as useUser } from './useUser-99920e02.js';
import { u as usePointerEvents, a as useMeterDatatip } from './useMeterDatatip-262c0e39.js';
import { u as useKeyboardEvents } from './useKeyboardEvents-102b4feb.js';
import { v as validateRange, g as getMeterAriaProps, a as getTrackAndIndicatorColor } from './meterUtils-5d22645f.js';
import { styles } from './UNSAFE_MeterBar/themes/MeterBarStyles.css.js';
import { g as getVisThresholdColor } from './utils-c5b2ab87.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { MeterBarRedwoodTheme } from './UNSAFE_MeterBar/themes/redwood/MeterBarTheme.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { meterBarVars } from './UNSAFE_MeterBar/themes/MeterBarContract.css.js';
import { x as xUnits } from './utils-6eab3a64.js';
import { B as BarTrack, a as BarValue } from './LinearMeter-901ec883.js';

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
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const isStartPos = position === 'start';
    return (jsx("div", { class: classNames([
            styles.referenceLinesBaseStyle,
            isHoriz ? styles.referenceLinesHorizontalStyle : styles.referenceLinesVerticalStyle,
            isStartPos
                ? isHoriz
                    ? styles.referenceLinesHoriontalStartStyle
                    : isRtl
                        ? styles.referenceLinesVerticalStartRtlStyle
                        : styles.referenceLinesVerticalStartLtrStyle
                : ''
        ]), style: {
            left: isHoriz && !isRtl ? percentage : undefined,
            right: isHoriz && isRtl ? percentage : undefined,
            bottom: isHoriz ? undefined : percentage,
            backgroundColor: getVisThresholdColor(color),
            width,
            height
        } }));
}

function ThresholdBar({ color, length, orientation, ...otherProps }) {
    const { direction } = useUser();
    const isHoriz = orientation === 'horizontal';
    const isRtl = direction === 'rtl';
    return (jsx("div", { class: classNames([
            styles.thresholdBarBaseStyle,
            isHoriz
                ? isRtl
                    ? styles.thresholdBarHorizontalBarTrackSectionRtlStyle
                    : styles.thresholdBarHorizontalBarTrackSectionLtrStyle
                : styles.thresholdBarVerticalBarTrackSectionStyle,
            otherProps.class
        ]), style: {
            width: isHoriz ? length : '100%',
            height: isHoriz ? '100%' : length,
            backgroundColor: getVisThresholdColor(color)
        } }));
}

function MeterBarWithDimensions({ max = 100, min = 0, value = 0, step = 1, length = '100%', width, height, size, orientation = 'horizontal', isTrackRendered = true, thresholdDisplay = 'all', indicatorSize = 1, testId, ...props }) {
    const testIdProps = useTestId(testId);
    validateRange(min, max, value, step);
    const currentInputRef = useRef();
    const isHoriz = orientation === 'horizontal';
    const barTrackRef = useRef(null);
    const dimensionsRef = useRef(getDimensions(null));
    const { direction, forcedColors } = useUser();
    const isRtl = direction === 'rtl';
    useEffect(() => {
        if (props.onCommit || props.onInput) {
            dimensionsRef.current = getDimensions(barTrackRef.current);
        }
    }, [size, length, orientation, props.onCommit, props.onInput]);
    const getValueFromEvent = (event) => {
        // only evaluate value from bar track
        if (event.target == barTrackRef.current) {
            return getValue(event, dimensionsRef, min, max, step, orientation, isRtl);
        }
        return;
    };
    const isPointerActiveRef = useRef(false);
    const pointerEventsProps = usePointerEvents(value, getValueFromEvent, barTrackRef, currentInputRef, isPointerActiveRef, props.onCommit, props.onInput);
    const keyboardEventsProps = useKeyboardEvents(value, min, max, step, currentInputRef, props.onCommit, props.onInput);
    const { datatipContent, datatipProps } = useMeterDatatip(value, isPointerActiveRef, props.datatip, props['aria-describedby']);
    const ariaLabelProps = getMeterAriaProps(value, min, max, props['aria-label'], props['aria-labelledby'], props.thresholds);
    const mergedProps = mergeProps(pointerEventsProps, keyboardEventsProps, datatipProps, ariaLabelProps);
    const validIndicatorSize = Math.max(0, Math.min(1, indicatorSize));
    const valueBarLength = `${((value - min) * 100) / (max - min)}%`;
    const valueBarSize = `${validIndicatorSize * 100}%`;
    const { trackColor, indicatorColor } = getTrackAndIndicatorColor(value, thresholdDisplay, props.trackColor, props.indicatorColor, props.thresholds);
    const refLineInfo = getRefLinesInfo(props.referenceLines);
    const isInteractive = props.onCommit || props.onInput;
    const { isTabbable } = useTabbableMode();
    const { classes, styles: { interactiveStyle, barValueBaseStyle, barValueVerticalStyle, barValueHorizontalStyle, barValueHighContrastStyle, barTrackBaseStyle, barTrackHorizontalSizeStyle, barTrackVerticalSizeStyle, barTrackBorderStyle, barTrackMarginTopStyle, barTrackMarginStartStyle, barTrackMarginBottomStyle, barTrackMarginEndStyle, barTrackMarginTopFitStyle, barTrackMarginStartFitStyle, barTrackMarginBottomFitStyle, barTrackMarginEndFitStyle, trackSectionHorizontalFirstStyle, trackSectionHorizontalLastStyle, trackSectionVerticalFirstStyle, trackSectionVerticalLastStyle, trackSectionRoundedCornersStyle } } = useComponentTheme(MeterBarRedwoodTheme, {
        size,
        orientation
    });
    const isFit = size === 'fit';
    return (jsxs(Fragment, { children: [jsx("div", { tabIndex: !isTabbable ? -1 : 0, ...testIdProps, ...mergedProps, style: {
                    width: isFit
                        ? getFitTrackWidth(refLineInfo, width, isHoriz)
                        : isHoriz
                            ? sizeToCSS(length)
                            : undefined,
                    height: isFit
                        ? getFitTrackHeight(refLineInfo, height, isHoriz)
                        : isHoriz
                            ? undefined
                            : sizeToCSS(length)
                }, class: classNames([
                    classes,
                    ...(isFit
                        ? getFitMarginClass(refLineInfo, isHoriz, barTrackMarginTopFitStyle, barTrackMarginStartFitStyle, barTrackMarginBottomFitStyle, barTrackMarginEndFitStyle)
                        : [])
                ]), children: jsxs(BarTrack, { ref: barTrackRef, orientation: orientation, color: !isTrackRendered || (thresholdDisplay === 'all' && props.thresholds)
                        ? 'transparent'
                        : trackColor, class: classNames([
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
                                return (jsxs(Fragment, { children: [jsx(ThresholdBar, { class: trackSectionStyleClass, orientation: orientation, length: `${(diff * 100) / (max - min)}%`, color: threshold.color }), isTrackRendered && index === thresholds.length - 1 && threshold.max < max ? (jsx(ThresholdBar, { class: trackSectionLastStyle, color: trackColor, orientation: orientation, length: `${((max - thresholds[index].max) * 100) / (max - min)}%` })) : ('')] }));
                            }), jsx(BarValue, { length: valueBarLength, size: valueBarSize, orientation: orientation, class: classNames([
                                barValueBaseStyle,
                                isHoriz ? barValueHorizontalStyle : barValueVerticalStyle,
                                forcedColors === 'active' ? barValueHighContrastStyle : ''
                            ]), color: indicatorColor }), props.referenceLines?.map((item) => (jsx(ReferenceLineBar, { color: item.color, orientation: orientation, percentage: `${((item.value - min) * 100) / (max - min)}%`, position: item.position, width: isFit
                                ? isHoriz
                                    ? undefined
                                    : `calc(${xUnits(4)} + ${meterBarVars.size})`
                                : undefined, height: isFit
                                ? isHoriz
                                    ? `calc(${xUnits(4)} + ${meterBarVars.size})`
                                    : undefined
                                : undefined })))] }) }), datatipContent] }));
}

/**
 * A Meter bar displays information graphically in a rectangular bar, highlighting a specific metric value's progress in relation to its min, max, or thresholds.
 */
function MeterBar({ orientation, length, size, ...props }) {
    return (jsx(Fragment, { children: size === 'fit' ? (jsx(TrackResizeContainer, { width: "100%", height: "100%", children: (width, height) => (jsx(MeterBarWithDimensions, { width: width, height: height, orientation: orientation, size: size, ...props })) })) : (jsx(MeterBarWithDimensions, { size: size, length: length, orientation: orientation, ...props })) }));
}

export { MeterBar as M };
//# sourceMappingURL=MeterBar-bdd7f9da.js.map
