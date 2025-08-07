/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useUser = require('./useUser-a6d15333.js');
var hooks = require('preact/hooks');
var mergeProps = require('./mergeProps-e3da7237.js');
var classNames = require('./classNames-c14c6ef3.js');
var meterUtils = require('./meterUtils-b625ddb8.js');
var circleUtils = require('./circleUtils-4af93948.js');
var utils = require('./utils-395027fe.js');
var UNSAFE_MeterCircle_themes_MeterCircleStyles_css = require('./UNSAFE_MeterCircle/themes/MeterCircleStyles.css.js');
var TrackResizeContainer = require('./TrackResizeContainer-cd09fc87.js');
var UNSAFE_MeterCircle_themes_MeterCircleContract_css = require('./UNSAFE_MeterCircle/themes/MeterCircleContract.css.js');
var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');
var utils$1 = require('./utils-b7099be5.js');
var useMeterDatatip = require('./useMeterDatatip-5db0b026.js');
var useKeyboardEvents = require('./useKeyboardEvents-f1a1dfef.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_MeterCircle_themes_redwood_MeterCircleTheme = require('./UNSAFE_MeterCircle/themes/redwood/MeterCircleTheme.js');
var useTestId = require('./useTestId-8234ec1e.js');
var CircularMeter = require('./CircularMeter-fd47e0e5.js');

function CircularReferenceLine({ color, angle, radius, length, section = 'full' }) {
    const centerCoord = circleUtils.getCenterCoord(section);
    const yOffset = `calc(${centerCoord.y * 100}% - ((${Math.sin((angle * 2 * Math.PI) / 360)} * ${radius})))`;
    const xOffset = `calc(${centerCoord.x * 100}%  + ((${Math.cos((angle * 2 * Math.PI) / 360)} * ${radius})))`;
    return (jsxRuntime.jsx("div", { class: classNames.classNames([
            UNSAFE_MeterCircle_themes_MeterCircleStyles_css.styles.referenceBaseLineStyle,
            color ? undefined : UNSAFE_MeterCircle_themes_MeterCircleStyles_css.styles.referenceBorderStyle
        ]), style: {
            left: xOffset,
            top: yOffset,
            width: `calc(${length})`,
            transform: `translate(0, -1px) rotate(${360 - angle}deg)`,
            backgroundColor: color ? utils.getVisThresholdColor(color) : undefined
        } }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the true dimensions of the meter circle after initial render. All dimensions are 0 for initial render.
 * @param element The HTML element that wraps the track and indicator div.
 * @param section The section in which the meter circle lies.
 * @returns The dimensions of the meter circle.
 */
function getDimensions(element, section) {
    if (!element) {
        return {
            width: 0,
            height: 0,
            innerRadius: 0,
            outerRadius: 0
        };
    }
    const circleTrack = element.children[0];
    const rect = circleTrack.getBoundingClientRect();
    return {
        width: Math.round(rect.width),
        height: Math.round(rect.height),
        ...getInnerAndOuterRadius(circleTrack, rect, section)
    };
}
/**
 * Returns the inner and outer radius of the meter circle.
 * @param element The HTML element that wraps the track and indicator div.
 * @param rect The bounding rect of the wrapper HTML element.
 * @param section The section in which the meter circle lies.
 * @returns The inner and outer radius of the meter circle.
 */
function getInnerAndOuterRadius(element, rect, section) {
    const width = element.clientWidth;
    const height = element.clientHeight;
    if (section === 'bottom' || section === 'top') {
        return { outerRadius: rect.width / 2, innerRadius: height };
    }
    else if (section === 'left' || section === 'right') {
        return { outerRadius: rect.height / 2, innerRadius: width };
    }
    return { innerRadius: width / 2, outerRadius: rect.width / 2 };
}
/**
 * Returns the value corresponding to clicked point in the meter circle. Returns undefined if the clicked point is
 * outside the track of the meter circle.
 * @param pageX The pageX of the click event
 * @param pageY The pageY of the click event
 * @param max The max value of the meter circle.
 * @param min The min value of the meter circle.
 * @param step The step of the metercircle.
 * @param dimensionsRef The ref that stores dimensions reference of meter circle.
 * @param startAngle The startAngle of the meter circle.
 * @param angleExtent The angleExtent of the meter circle
 * @returns {number} The value corresponding to clicked point in the meter circle.
 */
function getValue(event, min, max, step, dimensionsRef, startAngle, angleExtent, section, isRtl) {
    const dims = dimensionsRef.current;
    if (!dims) {
        return undefined;
    }
    const center = circleUtils.getCenterCoord(section);
    const { angle } = circleUtils.convertToPolar(dims.width * center.x, dims.height * center.y, event.offsetX, event.offsetY);
    const positiveAngle = circleUtils.getPositiveAngle(angle);
    let val;
    if (isRtl && startAngle + angleExtent > positiveAngle) {
        val = (circleUtils.getPositiveAngle(angle - startAngle) / angleExtent) * (max - min);
    }
    if (!isRtl) {
        const clockwiseArc = circleUtils.getPositiveAngle(startAngle - positiveAngle);
        if (clockwiseArc <= angleExtent) {
            val = (clockwiseArc * (max - min)) / angleExtent;
        }
    }
    if (val != undefined) {
        val = Math.round(val / step) * step;
        val = Math.max(Math.min(max, val), min);
    }
    return val;
}
/**
 * Returns the fraction of angle extent for given delta.
 * @param delta The delta of metric values.
 * @param min The minimum value of the meter circle.
 * @param max The maximum value of the meter circle.
 * @param angleExtent The angle extent of the meter circle.
 * @returns The angle extent corresponding to delta in metric value.
 */
function getAngleExtentFromDelta(delta, min, max, angleExtent) {
    return (delta * angleExtent) / (max - min);
}
/**
 * Returns the start angle for given metric value.
 * @param value The metric value
 * @param min The minimum value of the meter circle.
 * @param max The maximum value of the meter circle.
 * @param startAngle The startAngle of the meter circle.
 * @param angleExtent The angleExtent of the meter circle.
 * @param isRtl Whether the reading mode is 'rtl'
 * @returns The startAngle for the metric value.
 */
function getStartAngleForValue(value, min, max, startAngle, angleExtent, isRtl) {
    const extent = getAngleExtentFromDelta(value - min, min, max, angleExtent);
    return startAngle + (isRtl ? 1 : -1) * extent;
}
/**
 * Returns the center context of for the meter circle.
 */
function getCenterContext(dimensionsRef, section) {
    const dims = dimensionsRef.current;
    if (!dims) {
        return;
    }
    const center = circleUtils.getCenterCoord(section);
    const cx = center.x * dims.width;
    const cy = center.y * dims.height;
    const isHoriz = section === 'top' || section === 'bottom';
    let innerX, innerY, innerW, innerH;
    let outerX, outerY, outerW, outerH;
    if (isHoriz || section === 'full') {
        outerW = 2 * dims.innerRadius;
        outerH = section === 'full' ? 2 * dims.innerRadius : dims.innerRadius;
        outerX = cx - dims.innerRadius;
        outerY = section === 'bottom' ? 0 : cy - dims.innerRadius;
        innerW = Math.sqrt(2) * dims.innerRadius;
        innerH = section === 'full' ? innerW : dims.innerRadius / Math.sqrt(2);
        innerX = cx - dims.innerRadius / Math.sqrt(2);
        innerY = section === 'bottom' ? 0 : cy - dims.innerRadius / Math.sqrt(2);
    }
    else {
        outerH = 2 * dims.innerRadius;
        outerW = dims.innerRadius;
        outerX = section === 'left' ? cx - dims.innerRadius : 0;
        outerY = cy - dims.innerRadius;
        innerH = Math.sqrt(2) * dims.innerRadius;
        innerW = dims.innerRadius / Math.sqrt(2);
        innerX = section === 'left' ? cx - dims.innerRadius / Math.sqrt(2) : 0;
        innerY = cy - dims.innerRadius / Math.sqrt(2);
    }
    return {
        outerBounds: {
            x: outerX,
            y: outerY,
            width: outerW,
            height: outerH
        },
        innerBounds: {
            x: innerX,
            y: innerY,
            width: innerW,
            height: innerH
        }
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const METER_CIRCLE_XS_REF_PROTUSION = 8;
const METER_CIRCLE_SM_REF_PROTUSION = 16;
/**
 * Returns the css variable corresponding to the default size of the meter circle.
 * @param size The size of the meter circle.
 * @returns The css variable corresponding to the default size of the meter circle.
 */
function getSizeVar(size, diameter) {
    return size
        ? size === 'fit'
            ? `${diameter}px`
            : UNSAFE_MeterCircle_themes_MeterCircleContract_css.meterCircleVars.sizes[size]
        : UNSAFE_MeterCircle_themes_MeterCircleContract_css.meterCircleVars.size;
}
/**
 * Returns the css variable corresponding to the default track size of the meter circle.
 * @param size The size of the meter circle.
 * @returns The css variable corresponding to the default track size of the meter circle.
 */
function getTrackSizeVar(size) {
    return size ? UNSAFE_MeterCircle_themes_MeterCircleContract_css.meterCircleVars.trackSizes[size] : UNSAFE_MeterCircle_themes_MeterCircleContract_css.meterCircleVars.trackSize;
}
/**
 * Returns the calculated css variable string for the inner radius when given size and innerRadius of meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns {string} CSS varible string for the calculated inner radius of the meter circle.
 */
function getInnerRadius(size, innerRadius, diameter) {
    if (innerRadius != undefined) {
        return `(${getSizeVar(size, diameter)} * ${innerRadius / 2})`;
    }
    return `(${getSizeVar(size, diameter)} * 0.5 - ${getTrackSizeVar(size)})`;
}
/**
 * Returns the calculated css variable string for meter circle track for a given size and innerRadius of meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns {string} CSS variable for the calculated track size of the meter circle.
 */
function getTrackSize(size, innerRadius, diameter) {
    if (innerRadius != undefined) {
        return `(${getSizeVar(size, diameter)} * ${1 - innerRadius} / 2)`;
    }
    return getTrackSizeVar(size);
}
/**
 * Returns the calculated length of reference line for given size and inner radius of meter circle.
 * The length of reference line runs from the inner radius to slight outside the outer radius.
 * The length outside the outer radius depends on size of the meter circle.
 * @param size The size of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns The calculated CSS var for the length of reference line.
 */
function getRefLineLength(size, innerRadius, isXsSize, diameter) {
    return `${getTrackSize(size, innerRadius, diameter)} +  ${utils$1.xUnits(size === 'fit' && !isXsSize ? 4 : 2)}`;
}
/**
 * Returns the array of calculated props for InnerCircle representing each threshold.
 * @param meterInfo MeterInfo object containing info about given meter circle.
 * @param thresholds thresholds array of the meter circle.
 * @param isTrackRendered Whether track is rendered.
 * @param trackColor The track color of the meter circle.
 * @param innerRadius The inner radius of the meter circle.
 * @returns Array of calculated props object for InnerCircle representing each threshold.
 */
function getThresholdsProps(meterInfo, thresholds, isTrackRendered, trackColor, innerRadius, diameter) {
    const { min, max, startAngle, angleExtent, size, section, isRtl, innerRadius: innerDim } = meterInfo;
    const trackSize = `calc(${getTrackSize(size, innerRadius, diameter)})`;
    const thresholdProps = [];
    const validThresholds = thresholds
        .filter((threshold) => threshold.max > min && threshold.max <= max)
        .sort((a, b) => a.max - b.max);
    const numOfThreshold = validThresholds.length;
    for (let i = 0; i < numOfThreshold; i++) {
        const threshold = validThresholds[i];
        const startValue = i === 0 ? min : validThresholds[i - 1].max;
        const diff = i === 0 ? threshold.max : threshold.max - validThresholds[i - 1].max;
        let thresholdStart = getStartAngleForValue(startValue, min, max, startAngle, angleExtent, isRtl);
        let thresholdExtent = getAngleExtentFromDelta(diff, min, max, angleExtent);
        const { startOffset, extentOffset } = getThresholdsBuffer(innerDim, angleExtent, i === 0, threshold.max === max, isRtl);
        const clipPath = circleUtils.getClipPath(thresholdStart + startOffset, thresholdExtent + extentOffset, isRtl, section);
        thresholdProps.push({
            clipPath,
            color: utils.getVisThresholdColor(threshold.color),
            size: trackSize,
            section
        });
        if (i === numOfThreshold - 1 && threshold.max < max && isTrackRendered) {
            thresholdStart = thresholdStart + (isRtl ? 1 : -1) * thresholdExtent;
            thresholdExtent = getAngleExtentFromDelta(max - threshold.max, min, max, angleExtent);
            const { startOffset, extentOffset } = getThresholdsBuffer(innerDim, angleExtent, false, true, isRtl);
            thresholdProps.push({
                clipPath: circleUtils.getClipPath(thresholdStart + startOffset, thresholdExtent + extentOffset, isRtl, section),
                color: trackColor,
                size: trackSize,
                section
            });
        }
    }
    return thresholdProps;
}
/**
 * Returns the calculated props for CircularReferenceLine.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param refLine The CircularRefLine object
 * @param innerRadius The innerRadius of the meter circle.
 * @returns An bject with calculated props for CircularReferenceLine.
 */
function getReferenceLinesProps(meterInfo, refLine, innerRadius, isXsSize, diameter) {
    const { min, max, startAngle, angleExtent, size, isRtl } = meterInfo;
    return {
        radius: getInnerRadius(size, innerRadius, diameter),
        length: getRefLineLength(size, innerRadius, isXsSize, diameter),
        angle: getStartAngleForValue(refLine.value, min, max, startAngle, angleExtent, isRtl),
        color: refLine.color
    };
}
/**
 * Returns the calculated props for InnerCircle representing the track.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param trackColor The color of the track.
 * @param istrackRendered Whether the track is rendered.
 * @param thresholdDisplay Specifies whether the current threshold is displayed in the track, on the indicator, or if all thresholds are displayed in the track.
 * @param innerRadius The innerRadius of the meter circle.
 * @param thresholds thresholds array of the meter circle.
 * @returns An object with calculated props for InnerCircle that represents the track.
 */
function getTrackProps(meterInfo, isTrackRendered, thresholdDisplay, trackColor, innerRadius, thresholds, diameter) {
    const { startAngle, angleExtent, size, section, isRtl } = meterInfo;
    const color = !isTrackRendered
        ? 'transparent'
        : thresholdDisplay === 'all' && thresholds
            ? `${Common_themes_themeContract_css.colorSchemeVars.dvt.contrastLine}`
            : trackColor;
    return {
        section,
        color,
        clipPath: circleUtils.getClipPath(startAngle, angleExtent, isRtl, section),
        size: `calc(${getTrackSize(size, innerRadius, diameter)})`
    };
}
/**
 * Returns the calculated props for InnerCircle representing the indicator.
 * @param meterInfo MeterInfo object containing info about the meter circle.
 * @param indicatorSize Relative thickness of the indicator to the track.
 * @param innerRadius The innerRadius of the meter circle.
 * @returns An object with calculated props for InnerCircle that represents the indicator.
 */
function getIndicatorProps(meterInfo, indicatorSize, innerRadius, fitDiameter) {
    const { value, min, max, startAngle, angleExtent, size, section, isRtl } = meterInfo;
    const valueExtent = ((value - min) * angleExtent) / (max - min);
    const validIndicatorSize = Math.min(Math.max(0, indicatorSize), 1);
    const isHoriz = section === 'left' || section === 'right';
    const isVert = section === 'top' || section === 'bottom';
    const valueTrackSize = `calc(${getTrackSize(size, innerRadius, fitDiameter)} * ${validIndicatorSize})`;
    const diameter = `${getSizeVar(size, fitDiameter)} - ((1 - ${validIndicatorSize}) * ${getTrackSize(size, innerRadius, fitDiameter)})`;
    const radius = `(${diameter}) / 2`;
    return {
        section,
        width: isHoriz ? `calc(${radius})` : `calc(${diameter})`,
        height: isVert ? `calc(${radius})` : `calc(${diameter})`,
        size: valueTrackSize,
        clipPath: circleUtils.getClipPath(startAngle, valueExtent, isRtl, section)
    };
}
/**
 * Returns the threshold offsets to create the whitespace between the thresholds.
 * @param innerRadius The innerRadius of the meter circle.
 * @param angleExtent The angleExtent of the meter circle.
 * @param firstThreshold Whether the current threshold is the first threshold.
 * @param lastThreshold  Whether the current threshold is the last threshold.
 * @param isRtl Whether the document reading mode is 'rtl'
 * @returns The offsets (startOffset and extentOffset) to add to calculated threshold startAngle and threhsold extent.
 */
function getThresholdsBuffer(innerRadius, angleExtent, firstThreshold, lastThreshold, isRtl) {
    if (!innerRadius) {
        return { startOffset: 0, extentOffset: 0 };
    }
    const offset = 360 / (2 * Math.PI * innerRadius);
    let startOffset = (offset / 2) * (isRtl ? 1 : -1);
    let extentOffset = -1 * offset;
    if (firstThreshold && angleExtent < 360) {
        startOffset = 0;
        extentOffset = -0.5 * offset;
    }
    if (lastThreshold && angleExtent < 360) {
        extentOffset = -0.5 * offset;
    }
    return { startOffset, extentOffset };
}
function getWidthAndHeight(width, height, section) {
    if (section === 'top' || section === 'bottom') {
        return {
            height: Math.min(height, width / 2),
            width: Math.min(height, width / 2) * 2
        };
    }
    else if (section === 'left' || section === 'right') {
        return {
            width: Math.min(width, height / 2),
            height: Math.min(width, height / 2) * 2
        };
    }
    else {
        return {
            width: Math.min(width, height),
            height: Math.min(width, height)
        };
    }
}
function getWidthAndHeightWithReferenceLine(_width, _height, hasReferenceLine, isXsSize, section) {
    if (!hasReferenceLine) {
        return { width: _width, height: _height };
    }
    if (section === 'full') {
        return {
            width: _width - 2 * (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION),
            height: _height - 2 * (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION)
        };
    }
    else if (section === 'top' || section === 'bottom') {
        return {
            width: _width - 2 * (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION),
            height: _height - (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION)
        };
    }
    else {
        return {
            width: _width - (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION),
            height: _height - 2 * (isXsSize ? METER_CIRCLE_XS_REF_PROTUSION : METER_CIRCLE_SM_REF_PROTUSION)
        };
    }
}

const XS_BREAKPOINT = 360;
const FIT_INNERRADIUS = 0.8;
/**
 * A Meter circle displays information graphically in a circular bar, highlighting a specific metric value's progress in relation to its min, max, or thresholds.
 */
function FitMeterCircle({ max = 100, min = 0, value = 0, step = 1, size = 'fit', startAngle = 90, angleExtent = 360, isTrackRendered = true, thresholdDisplay = 'all', indicatorSize = 1, testId, ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    meterUtils.validateRange(min, max, value, step);
    const isInteractive = props.onCommit || props.onInput;
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_MeterCircle_themes_redwood_MeterCircleTheme.MeterCircleRedwoodTheme, {
        size,
        interaction: isInteractive ? 'isInteractive' : undefined
    });
    return (jsxRuntime.jsx(TrackResizeContainer.TrackResizeContainer, { class: classes, width: '100%', height: '100%', children: function _(_width, _height) {
            const { direction } = useUser.useUser();
            const isRtl = direction === 'rtl';
            let sAngle = startAngle;
            if (isRtl) {
                sAngle = 180 - sAngle;
            }
            const section = circleUtils.getCircleSection(sAngle, angleExtent, isRtl);
            const { width: _w } = getWidthAndHeight(_width, _height, section);
            const isXsSize = _w < XS_BREAKPOINT;
            const innerR = props.innerRadius || size === 'fit' ? FIT_INNERRADIUS : undefined;
            const { width: w, height: h } = getWidthAndHeightWithReferenceLine(_width, _height, !!props.referenceLines?.length, isXsSize, section);
            const { width, height } = getWidthAndHeight(w, h, section);
            const radius = section === 'full' ? Math.min(width, height) / 2 : Math.min(width, height);
            const diameter = radius * 2;
            const currentInputRef = hooks.useRef();
            const dimensionsRef = hooks.useRef(getDimensions(null, section));
            const circleWrapperRef = hooks.useRef(null);
            const [isDimsReady, setDimsReady] = hooks.useState(false);
            hooks.useEffect(() => {
                if (props.onCommit || props.onInput || props.children) {
                    dimensionsRef.current = getDimensions(circleWrapperRef.current, section);
                    setDimsReady(true);
                }
            }, [section]);
            const getValueFromEvent = (event) => {
                const circleContainer = circleWrapperRef.current;
                if (event.target == circleContainer) {
                    return getValue(event, min, max, step, dimensionsRef, sAngle, angleExtent, section, isRtl);
                }
                return;
            };
            const isPointerActiveRef = hooks.useRef(false);
            const pointerEventsProps = useMeterDatatip.usePointerEvents(value, getValueFromEvent, circleWrapperRef, currentInputRef, isPointerActiveRef, props.onCommit, props.onInput);
            const keyboardEventsProps = useKeyboardEvents.useKeyboardEvents(value, min, max, step, currentInputRef, props.onCommit, props.onInput);
            const { datatipContent, datatipProps } = useMeterDatatip.useMeterDatatip(value, isPointerActiveRef, props.datatip, props['aria-describedby']);
            const ariaProps = meterUtils.getMeterAriaProps(value, min, max, props['aria-label'], props['aria-labelledby'], props.thresholds);
            const mergedProps = mergeProps.mergeProps(pointerEventsProps, keyboardEventsProps, datatipProps, ariaProps);
            const { trackColor, indicatorColor } = meterUtils.getTrackAndIndicatorColor(value, thresholdDisplay, props.trackColor, props.indicatorColor, props.thresholds);
            const meterInfo = {
                min,
                max,
                value,
                startAngle: sAngle,
                angleExtent,
                size,
                section,
                isRtl,
                innerRadius: dimensionsRef.current.innerRadius
            };
            const { isTabbable } = useTabbableMode.useTabbableMode();
            const centerContext = getCenterContext(dimensionsRef, section);
            return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { class: classNames.classNames([
                            classes,
                            section === 'full' ? `${styles.meterCircleFullSizeStyle}, ${styles.centerDiv}` : ''
                        ]), style: {
                            width: _width,
                            height: _height
                        }, tabIndex: !isTabbable ? -1 : 0, ...testIdProps, ...mergedProps, children: jsxRuntime.jsxs(CircularMeter.CircleWrapper, { wrapperRef: circleWrapperRef, class: classNames.classNames([
                                styles.circleWrapperBaseStyle,
                                props.referenceLines && props.referenceLines.length > 0
                                    ? size && styles[`fit${isXsSize ? 'Sm' : 'Lg'}${section}Style`]
                                    : '',
                                styles.centerDiv
                            ]), width: `${width}px`, height: `${height}px`, children: [jsxRuntime.jsx(CircularMeter.CircleInner, { width: `${width}px`, height: `${height}px`, class: classNames.classNames([styles.circleTrackBaseStyle, styles[`${section}Style`]]), ...getTrackProps(meterInfo, isTrackRendered, thresholdDisplay, trackColor, innerR, props.thresholds, diameter) }), thresholdDisplay === 'all' &&
                                    props.thresholds &&
                                    getThresholdsProps(meterInfo, props.thresholds, isTrackRendered, trackColor, innerR, diameter).map((threshold) => {
                                        return (jsxRuntime.jsx(CircularMeter.CircleInner, { class: classNames.classNames([styles.circleTrackBaseStyle, styles[`${section}Style`]]), ...threshold, width: `${width}px`, height: `${height}px` }));
                                    }), jsxRuntime.jsx(CircularMeter.CircleInner, { color: indicatorColor, class: classNames.classNames([
                                        styles.circleValueBaseStyle,
                                        styles[`circleValue${section}Style`],
                                        styles[`${section}Style`]
                                    ]), ...getIndicatorProps(meterInfo, indicatorSize, innerR, 2 * radius) }), props.referenceLines?.map((refLine) => {
                                    return (jsxRuntime.jsx(CircularReferenceLine, { ...getReferenceLinesProps(meterInfo, refLine, innerR, isXsSize, diameter), section: section }));
                                }), isDimsReady && props.children && centerContext && (jsxRuntime.jsx("div", { class: classNames.classNames([styles.meterCircleCenterContent]), children: props.children(centerContext) }))] }) }), datatipContent] }));
        } }));
}

/**
 * A Meter circle displays information graphically in a circular bar, highlighting a specific metric value's progress in relation to its min, max, or thresholds.
 */
function SizedMeterCircle({ max = 100, min = 0, value = 0, step = 1, size, startAngle = 90, angleExtent = 360, isTrackRendered = true, thresholdDisplay = 'all', indicatorSize = 1, testId, ...props }) {
    const testIdProps = useTestId.useTestId(testId);
    meterUtils.validateRange(min, max, value, step);
    const currentInputRef = hooks.useRef();
    const { direction } = useUser.useUser();
    const isRtl = direction === 'rtl';
    let sAngle = startAngle;
    if (isRtl) {
        sAngle = 180 - sAngle;
    }
    const section = circleUtils.getCircleSection(sAngle, angleExtent, isRtl);
    const dimensionsRef = hooks.useRef(getDimensions(null, section));
    const circleWrapperRef = hooks.useRef(null);
    const [isDimsReady, setDimsReady] = hooks.useState(false);
    hooks.useEffect(() => {
        if (props.onCommit || props.onInput || props.children) {
            dimensionsRef.current = getDimensions(circleWrapperRef.current, section);
            setDimsReady(true);
        }
    }, [size, section, props.onCommit, props.onInput, props.children]);
    const getValueFromEvent = (event) => {
        const circleContainer = circleWrapperRef.current;
        if (event.target == circleContainer) {
            return getValue(event, min, max, step, dimensionsRef, sAngle, angleExtent, section, isRtl);
        }
        return;
    };
    const isPointerActiveRef = hooks.useRef(false);
    const pointerEventsProps = useMeterDatatip.usePointerEvents(value, getValueFromEvent, circleWrapperRef, currentInputRef, isPointerActiveRef, props.onCommit, props.onInput);
    const keyboardEventsProps = useKeyboardEvents.useKeyboardEvents(value, min, max, step, currentInputRef, props.onCommit, props.onInput);
    const { datatipContent, datatipProps } = useMeterDatatip.useMeterDatatip(value, isPointerActiveRef, props.datatip, props['aria-describedby']);
    const ariaProps = meterUtils.getMeterAriaProps(value, min, max, props['aria-label'], props['aria-labelledby'], props.thresholds);
    const mergedProps = mergeProps.mergeProps(pointerEventsProps, keyboardEventsProps, datatipProps, ariaProps);
    const { trackColor, indicatorColor } = meterUtils.getTrackAndIndicatorColor(value, thresholdDisplay, props.trackColor, props.indicatorColor, props.thresholds);
    const orientation = section === 'bottom' || section === 'top'
        ? 'Horizontal'
        : section === 'left' || section === 'right'
            ? 'Vertical'
            : 'Full';
    const meterInfo = {
        min,
        max,
        value,
        startAngle: sAngle,
        angleExtent,
        size,
        section,
        isRtl,
        innerRadius: dimensionsRef.current.innerRadius
    };
    const isInteractive = props.onCommit || props.onInput;
    const { classes, styles } = useComponentTheme.useComponentTheme(UNSAFE_MeterCircle_themes_redwood_MeterCircleTheme.MeterCircleRedwoodTheme, {
        size,
        interaction: isInteractive ? 'isInteractive' : undefined
    });
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const centerContext = getCenterContext(dimensionsRef, section);
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("div", { class: classNames.classNames([classes]), tabIndex: !isTabbable ? -1 : 0, ...testIdProps, ...mergedProps, children: jsxRuntime.jsxs(CircularMeter.CircleWrapper, { wrapperRef: circleWrapperRef, class: classNames.classNames([
                        styles.circleWrapperBaseStyle,
                        props.referenceLines && props.referenceLines.length > 0
                            ? size && styles[`${size}${section}Style`]
                            : '',
                        styles[`meterCircle${orientation}SizeStyle`]
                    ]), children: [jsxRuntime.jsx(CircularMeter.CircleInner, { class: classNames.classNames([styles.circleTrackBaseStyle, styles[`${section}Style`]]), ...getTrackProps(meterInfo, isTrackRendered, thresholdDisplay, trackColor, props.innerRadius, props.thresholds) }), thresholdDisplay === 'all' &&
                            props.thresholds &&
                            getThresholdsProps(meterInfo, props.thresholds, isTrackRendered, trackColor, props.innerRadius).map((threshold) => {
                                return (jsxRuntime.jsx(CircularMeter.CircleInner, { class: classNames.classNames([styles.circleTrackBaseStyle, styles[`${section}Style`]]), ...threshold }));
                            }), jsxRuntime.jsx(CircularMeter.CircleInner, { color: indicatorColor, class: classNames.classNames([
                                styles.circleValueBaseStyle,
                                styles[`circleValue${section}Style`],
                                styles[`${section}Style`]
                            ]), ...getIndicatorProps(meterInfo, indicatorSize, props.innerRadius) }), props.referenceLines?.map((refLine) => {
                            return (jsxRuntime.jsx(CircularReferenceLine, { ...getReferenceLinesProps(meterInfo, refLine, props.innerRadius), section: section }));
                        }), isDimsReady && props.children && centerContext && (jsxRuntime.jsx("div", { class: classNames.classNames([styles.meterCircleCenterContent]), children: props.children(centerContext) }))] }) }), datatipContent] }));
}

/**
 * A Meter circle displays information graphically in a circular bar, highlighting a specific metric value's progress in relation to its min, max, or thresholds.
 */
function MeterCircle({ size, max = 100, min = 0, value = 0, step = 1, startAngle = 90, angleExtent = 360, isTrackRendered = true, thresholdDisplay = 'all', indicatorSize = 1, ...props }) {
    if (size === 'fit') {
        return (jsxRuntime.jsx(FitMeterCircle, { min: min, value: value, max: max, step: step, startAngle: startAngle, angleExtent: angleExtent, isTrackRendered: isTrackRendered, thresholdDisplay: thresholdDisplay, indicatorSize: indicatorSize, ...props }));
    }
    return (jsxRuntime.jsx(SizedMeterCircle, { size: size || 'lg', min: min, value: value, max: max, step: step, startAngle: startAngle, angleExtent: angleExtent, isTrackRendered: isTrackRendered, thresholdDisplay: thresholdDisplay, indicatorSize: indicatorSize, ...props }));
}

exports.MeterCircle = MeterCircle;
//# sourceMappingURL=MeterCircle-71fd9b44.js.map
