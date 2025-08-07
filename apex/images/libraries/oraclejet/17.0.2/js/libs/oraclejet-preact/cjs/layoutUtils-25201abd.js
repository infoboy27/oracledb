/* @oracle/oraclejet-preact: undefined */
'use strict';

var scale = require('./scale-22a7b539.js');
var labelUtils = require('./labelUtils-7f684e1a.js');
var dimensionUtils = require('./dimensionUtils-3919753d.js');
var utils = require('./utils-1d526d92.js');
var getLocale = require('./getLocale-8e17dc46.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const MAX_NUMBER_OF_GRIDS_AUTO = 10;
const MINOR_TICK_COUNT = 2;
const MAJOR_TICK_INCREMENT_BUFFER = 0.0000000001;
class DataAxisInfo {
    constructor({ scale = 'linear', baselineScaling = 'zero', dataMax, dataMin, min, max, viewportMin, viewportMax, ...options }) {
        this.isLog = scale === 'log';
        this.isZeroBaseline = !this.isLog && baselineScaling === 'zero';
        this.setDataRange(dataMin, dataMax);
        this.setViewportRange(viewportMin, viewportMax, min, max);
        this.majorIncrement = this.actualToLinear(options.step);
        this.minorIncrement = this.actualToLinear(options.minorStep);
        this.minMajorIncrement = this.actualToLinear(options.minStep);
        this.calcAxisExtents();
    }
    /**
     * Set the dataMin and dataMax.
     * @param dataMin The minimum of the data.
     * @param dataMax The maximum of the data.
     */
    setDataRange(dataMin, dataMax) {
        this.dataMin = this.actualToLinear(dataMin);
        this.dataMax = this.actualToLinear(dataMax);
        if (this.isZeroBaseline) {
            this.dataMin = Math.min(0, this.dataMin);
            this.dataMax = Math.max(0, this.dataMax);
        }
    }
    setViewportRange(viewportMin, viewportMax, min, max) {
        this.min = this.actualToLinear(min);
        this.max = this.actualToLinear(max);
        this.viewportMin = viewportMin == null ? this.min : this.actualToLinear(viewportMin);
        this.viewportMax = viewportMax == null ? this.max : this.actualToLinear(viewportMax);
    }
    setDefaultMin(scaleUnit) {
        // if already set in setViewportRange
        if (this.min != null) {
            return;
        }
        if (this.isZeroBaseline && this.dataMin >= 0) {
            this.min = 0;
        }
        else if (!this.isZeroBaseline && this.max != null) {
            this.min = this.max - scaleUnit * (Math.floor((this.max - this.dataMin) / scaleUnit) + 1);
        }
        else {
            this.min = (Math.ceil(this.dataMin / scaleUnit) - 1) * scaleUnit;
        }
        // If all data points are positive, the axis min shouldn't be less than zero
        if (this.dataMin >= 0 && !this.isLog) {
            this.min = Math.max(this.min, 0);
        }
    }
    setDefaultMax(scaleUnit) {
        if (this.max != null) {
            return;
        }
        if (this.isZeroBaseline && this.dataMax <= 0) {
            this.max = 0;
        }
        else if (!this.isZeroBaseline && this.min != null) {
            this.max = this.min + scaleUnit * (Math.floor((this.dataMax - this.min) / scaleUnit) + 1);
        }
        else {
            this.max = (Math.floor(this.dataMax / scaleUnit) + 1) * scaleUnit;
        }
        // If all data points are negative, the axis max shouldn't be more that zero
        if (this.dataMax <= 0) {
            this.max = Math.min(this.max, 0);
        }
    }
    calcAxisExtents() {
        const maxValue = this.max != null ? this.max : this.dataMax;
        const minValue = this.min != null ? this.min : this.dataMin;
        const axisStep = this.calcAxisStep(minValue, maxValue);
        let scaleUnit = this.minMajorIncrement ? Math.max(axisStep, this.minMajorIncrement) : axisStep;
        // If there's only a single value on the axis, we need to adjust the
        // this.dataMin and this.dataMax to produce a nice looking axis with around 6 ticks.
        if (this.dataMin === this.dataMax) {
            if (this.dataMin === 0) {
                this.dataMax += 5 * scaleUnit;
            }
            else {
                this.dataMin -= 2 * scaleUnit;
                this.dataMax += 2 * scaleUnit;
            }
        }
        this.setDefaultMin(scaleUnit);
        this.setDefaultMax(scaleUnit);
        if (this.max === this.min) {
            // happens if this.dataMin === this.dataMax === 0
            this.max = 100;
            this.min = 0;
            scaleUnit = (this.max - this.min) / MAX_NUMBER_OF_GRIDS_AUTO;
        }
        if ((this.viewportMin !== this.min || this.viewportMax !== this.max) &&
            this.viewportMax != null &&
            this.viewportMin != null) {
            scaleUnit = this.calcAxisStep(this.viewportMin, this.viewportMax);
        }
        if (this.viewportMin == null) {
            this.viewportMin = this.min;
        }
        if (this.viewportMax == null) {
            this.viewportMax = this.max;
        }
        this.calcMajorMinorSteps(scaleUnit);
    }
    /**
     * Determines the number of major and minor tick counts and increments for the axis if values were not given.
     * The default minor tick count is 2.
     * @param {number} scaleUnit The scale unit of the axis.
     * @private
     */
    calcMajorMinorSteps(scaleUnit) {
        if (this.max == null || this.min == null) {
            return;
        }
        if (!this.majorIncrement) {
            if (this.majorTickCount) {
                this.majorIncrement = (this.viewportMax - this.viewportMin) / this.majorTickCount;
            }
            else {
                this.majorIncrement = this.minMajorIncrement
                    ? Math.max(scaleUnit, this.minMajorIncrement)
                    : scaleUnit;
            }
        }
        if (!this.majorTickCount) {
            this.majorTickCount = (this.viewportMax - this.viewportMin) / this.majorIncrement;
            // Check if we have a floating point inaccuracy that causes the tick count to be undercalculated
            // within the allowable buffer. If so, tick count is supposed to be the rounded up integer.
            if (Math.ceil(this.majorTickCount) - this.majorTickCount < MAJOR_TICK_INCREMENT_BUFFER) {
                this.majorTickCount = Math.ceil(this.majorTickCount);
            }
        }
        if (!this.minorTickCount) {
            if (this.minorIncrement) {
                this.minorTickCount = this.majorIncrement / this.minorIncrement;
            }
            else if (this.isLog) {
                this.minorTickCount = this.majorIncrement;
            }
            else {
                this.minorTickCount = MINOR_TICK_COUNT;
            }
        }
        if (!this.minorIncrement) {
            this.minorIncrement = this.majorIncrement / this.minorTickCount;
        }
    }
    calcAxisStep(minValue, maxValue) {
        if (this.majorIncrement) {
            return this.majorIncrement;
        }
        const spread = maxValue - minValue;
        if (spread === 0) {
            if (minValue === 0) {
                return 10;
            }
            return Math.pow(10, Math.floor(Math.log10(minValue)) - 1);
        }
        if (this.isLog) {
            return Math.floor(spread / 8) + 1;
        }
        if (this.majorTickCount) {
            const increment = spread / this.majorTickCount;
            const testVal = Math.pow(10, Math.ceil(Math.log10(increment) - 1));
            let firstDigit = increment / testVal;
            if (firstDigit > 1 && firstDigit <= 1.5) {
                firstDigit = 1.5;
            }
            else if (firstDigit > 5) {
                firstDigit = 10;
            }
            else {
                firstDigit = Math.ceil(firstDigit);
            }
            return firstDigit * testVal;
        }
        return this.getDefaultAxisStep(spread);
    }
    /**
     * Aesthetically choose a step depending of the spread value.
     * @param spread The spread of the data values.
     * @returns The step for the axis.
     */
    getDefaultAxisStep(spread) {
        const t = Math.log10(spread);
        const testVal = Math.pow(10, Math.ceil(t) - 2);
        const first2Digits = Math.round(spread / testVal);
        let scaleFactor = 1;
        if (first2Digits >= 10 && first2Digits <= 14) {
            scaleFactor = 2;
        }
        else if (first2Digits >= 15 && first2Digits <= 19) {
            scaleFactor = 3;
        }
        else if (first2Digits >= 20 && first2Digits <= 24) {
            scaleFactor = 4;
        }
        else if (first2Digits >= 25 && first2Digits <= 45) {
            scaleFactor = 5;
        }
        else if (first2Digits >= 46 && first2Digits <= 80) {
            scaleFactor = 10;
        }
        else {
            scaleFactor = 20;
        }
        return scaleFactor * testVal;
    }
    linearToActual(value) {
        return this.isLog ? Math.pow(10, value) : value;
    }
    actualToLinear(value) {
        if (value == null) {
            return;
        }
        if (this.isLog) {
            return Math.log10(value);
        }
        return value;
    }
    getScale(range) {
        const { viewportMin, viewportMax } = this.getAxisViewport();
        const domain = [
            this.linearToActual(viewportMin),
            this.linearToActual(viewportMax)
        ];
        if (this.isLog) {
            return new scale.ScaleLog(domain, range);
        }
        return new scale.ScaleLinear(domain, range);
    }
    getFirstTick() {
        if (this.isZeroBaseline) {
            return Math.ceil(this.viewportMin / this.majorIncrement) * this.majorIncrement;
        }
        return (this.min +
            Math.ceil((this.viewportMin - this.min) / this.majorIncrement) * this.majorIncrement);
    }
    getAxisViewport() {
        return {
            viewportMin: this.viewportMin,
            viewportMax: this.viewportMax
        };
    }
    /**
     * Returns the min and max extent of the axis.
     */
    getAxisExtent() {
        return {
            min: this.min,
            max: this.max
        };
    }
    /**
     * Returns the major ticks.
     */
    getTicks() {
        let firstTick = this.getFirstTick();
        const ticks = [];
        while (firstTick <= this.viewportMax) {
            ticks.push(this.linearToActual(firstTick));
            firstTick += this.majorIncrement;
        }
        return ticks;
    }
    getMinorTicks() {
        const coords = [];
        for (let i = -1; i <= this.majorTickCount; i++) {
            const value = i * this.majorIncrement + this.getFirstTick();
            if (this.isLog && this.majorIncrement == 1 && this.minorIncrement == 1) {
                // draw linear ticks from 2 to 9
                for (let j = 2; j <= 9; j++) {
                    const linearValue = value + Math.log10(j);
                    if (linearValue > this.max)
                        break;
                    if (linearValue < this.min)
                        continue;
                    coords.push(this.linearToActual(linearValue));
                }
            }
            else {
                for (let j = 1; j < this.minorTickCount; j++) {
                    const minorValue = value + j * this.minorIncrement;
                    if (minorValue > this.max)
                        break;
                    if (minorValue < this.min)
                        continue;
                    coords.push(minorValue);
                }
            }
        }
        return coords;
    }
    getStep() {
        return this.majorIncrement;
    }
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
// increased the axis max ratio temporarily before chart can support
// axis label truncation. This provides more space to chart axis for
// really long tick labels for smaller decimal values.
const AXIS_MAX_RATIO = 0.3;
/**
 * Returns resolved axis position.
 */
function getAxesPosition(yAxis, isHoriz, isRtl) {
    let xAxisPosition, yAxisPosition;
    if (isHoriz) {
        yAxisPosition = yAxis?.position === 'top' ? 'top' : 'bottom';
        xAxisPosition = (isRtl ? 'right' : 'left');
    }
    else {
        xAxisPosition = 'bottom';
        const isYEnd = yAxis?.position === 'end';
        yAxisPosition = isYEnd ? (isRtl ? 'left' : 'right') : isRtl ? 'right' : 'left';
    }
    return { xAxisPosition, yAxisPosition };
}
/**
 * Returns the tick label anchor position for axis.
 * @param position
 * @param isRtl
 */
function getTickLabelAnchor(position, isRtl) {
    if (!isRtl) {
        return position === 'left' ? 'end' : position === 'right' ? 'start' : 'middle';
    }
    return position === 'left' ? 'start' : position === 'right' ? 'end' : 'middle';
}
/**
 * Returns the scale for the axis.
 * @param availSpace
 * @param axisViewportMin
 * @param axisViewportMax
 * @param position
 * @returns
 */
function getAxisRange(availSpace, position, isRtl) {
    const { x, y, width, height } = availSpace;
    const y2 = y + height;
    const x2 = x + width;
    let rangeStart;
    let rangeEnd;
    if (position === 'left' || position === 'right') {
        rangeStart = y2;
        rangeEnd = y;
    }
    else {
        rangeStart = isRtl ? x2 : x;
        rangeEnd = isRtl ? x : x2;
    }
    return [rangeStart, rangeEnd];
}
/**
 * Returns the maximum possible size of the axis.
 * @param availSpace The available space.
 * @param isHoriz If the axis is horizontal.
 * @param axisSize The ratio of axis to the chart.
 * @returns
 */
function getAxisMaxSize(availSpace, isHoriz, axisSize) {
    const size = Math.max(0, Math.min(1, axisSize != undefined ? axisSize : AXIS_MAX_RATIO));
    return (isHoriz ? availSpace.height : availSpace.width) * size;
}
/**
 * Returns the num of labels to skip safely.
 * @param groupWidth
 * @param tickLabelStyle
 * @param getTextDimensions
 * @returns
 */
function getSafeSkips(groupWidth, tickLabelStyle, getTextDimensions) {
    if (!getTextDimensions) {
        return 0;
    }
    const textDims = getTextDimensions('MW', tickLabelStyle);
    const gaps = labelUtils.AXIS_DEFAULTS.labelGap;
    return Math.floor((0.5 * textDims.width + gaps) / (2 * groupWidth));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const defaultTitleProps = {
    text: '',
    lines: [],
    lineProps: [],
    titleDim: 0,
    dims: {
        width: 0,
        height: 0,
        x: 0,
        y: 0
    },
    isTruncated: false,
    isRotated: false
};
/**
 * Returns the title props.
 * @returns
 */
function getTitleProps(title, titleStyle, maxHeight, availSpace, position, isRtl, getTextDimensions) {
    if (!title || !getTextDimensions) {
        return defaultTitleProps;
    }
    const isHoriz = position === 'top' || position === 'bottom';
    const maxWidth = isHoriz ? availSpace.width : availSpace.height;
    const { lines, height, width, dims, lineHeight, isTruncated } = utils.getTextInfo(title, titleStyle, maxWidth, maxHeight, true, getTextDimensions);
    if (height > maxHeight || width === 0 || height === 0) {
        // title does not fit or not rendered
        return defaultTitleProps;
    }
    const isRotated = position === 'left' || position === 'right';
    const lineProps = utils.positionMultilineText(lines, dims, lineHeight, position, availSpace, isRtl);
    const textDim = dimensionUtils.getSectionDims(availSpace, position, width, height);
    return {
        text: title,
        dims: textDim,
        titleDim: height,
        isTruncated,
        lines: position === 'left' || position === 'top' ? lines : lines.reverse(),
        lineProps,
        isRotated
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const SCALING_FACTOR_DIFFERENCE = 3;
const scales = ['none', 'thousand', 'million', 'billion', 'trillion', 'quadrillion'];
const scalesOrder = scales.map((_, i) => ({ scaleFactor: i * SCALING_FACTOR_DIFFERENCE }));
function getLinearAxisValueFormatter(minValue, maxValue, tickStep, locale) {
    const scaleFactor = getScaleFactor(minValue, maxValue);
    const decimalPlaces = getDecimalPlaces(minValue, maxValue, tickStep, scaleFactor);
    const scale = Math.pow(10, scaleFactor);
    const scaleConverterOptions = {
        style: 'decimal',
        notation: 'compact',
        numberingSystem: 'latn',
        useGrouping: false
    };
    let defaultConverter = new Intl.NumberFormat(locale, scaleConverterOptions);
    // Formatting for scale
    const _SCALE_REGEXP = /(\d+)(.*$)/;
    const formattedScale = defaultConverter.format(scale);
    const formattedScaleParts = _SCALE_REGEXP.exec(formattedScale);
    const numberConverterOptions = {
        style: 'decimal',
        minimumFractionDigits: decimalPlaces,
        maximumFractionDigits: decimalPlaces
    };
    defaultConverter = new Intl.NumberFormat(locale, numberConverterOptions);
    return (value) => {
        if (!formattedScaleParts) {
            return '';
        }
        const suffix = formattedScaleParts[2]; // Reset the suffix
        const fsn = (Number(formattedScaleParts[1]) / scale) * value;
        let formattedScaledNumber = fsn.toString();
        formattedScaledNumber = defaultConverter.format(fsn);
        // Add the scale factor suffix, unless value is zero
        if (typeof suffix === 'string' && value !== 0) {
            formattedScaledNumber += suffix;
        }
        return formattedScaledNumber;
    };
}
/**
 * Returns the number of decimal places to use for given minValue, maxValue, tickStep, scaleFactor.
 * @param minValue The minValue of the axis.
 * @param maxValue The maxValue of the axis.
 * @param tickStep The step of the axis.
 * @param scaleFactor The scale factor of the scaling of the axis.
 * @returns
 */
function getDecimalPlaces(minValue, maxValue, tickStep, scaleFactor) {
    let decimalPlaces;
    if (tickStep === 0 && minValue === maxValue) {
        const valuePowerOfTen = getPowerOfTen(maxValue);
        const scaleFactorDiff = scaleFactor - valuePowerOfTen;
        if (scaleFactorDiff <= 0) {
            // Value is same or larger than the scale factor, ensure 4 significant digits.
            // Make sure that the number of decimal places is at least zero. Bug 18677330
            decimalPlaces = Math.max(scaleFactorDiff + 3, 0);
        }
        else {
            // Value is smaller, ensure enough decimals to show 1 significant digit
            decimalPlaces = Math.max(scaleFactorDiff, 4);
        }
    }
    else {
        // get the number of decimal places in the number by subtracting
        // the order of magnitude of the tick step from the order of magnitude
        // of the scale factor
        // (e.g.: scale to K, tick step of 50 -> 3 - 1 = 2 decimal places)
        const tickStepPowerOfTen = getPowerOfTen(tickStep);
        decimalPlaces = Math.max(scaleFactor - tickStepPowerOfTen, 0);
    }
    return decimalPlaces;
}
/**
 * Returns scale factor of scale given by scale name.
 * @param {string} scaleName
 * @return {number} scale factor of scale given by scale name
 */
function getScaleFactor(minValue, maxValue) {
    const absMax = Math.max(Math.abs(minValue), Math.abs(maxValue));
    const power = getPowerOfTen(absMax);
    return findNearestLEScaleFactor(power);
}
/**
 * Returns the log base 10 for a given value.
 * @param {number} value
 * @returns
 */
function getPowerOfTen(value) {
    // more comprehensive and easier than working with
    // value returned by Math.log(value)/Math.log(10)
    let val = value >= 0 ? value : -value;
    let power = 0;
    // Check for degenerate and zero values
    if (val < 1e-15) {
        return 0;
    }
    else if (val === Infinity) {
        return Number.MAX_VALUE;
    }
    if (val >= 10) {
        // e.g. for 1000 the power should be 3
        while (val >= 10) {
            power += 1;
            val /= 10;
        }
    }
    else if (val < 1) {
        while (val < 1) {
            power -= 1;
            val *= 10;
        }
    }
    return power;
}
/**
 * Finds a scale factor 'x' such that x <= value (e.g. if value equals 4 then returned scale factor equals 3)
 * @param {number} value value representing an order of magnitude
 * @return {number} a scale factor 'x' such that x <= value
 */
function findNearestLEScaleFactor(value) {
    let scaleFactor = 0;
    if (value <= scalesOrder[0].scaleFactor) {
        // if the number is less than 10, don't scale
        scaleFactor = scalesOrder[0].scaleFactor;
    }
    else if (value >= scalesOrder[scalesOrder.length - 1].scaleFactor) {
        // if the data is greater than or equal to 10 quadrillion, scale to quadrillions
        scaleFactor = scalesOrder[scalesOrder.length - 1].scaleFactor;
    }
    else {
        // else find the nearest scaleFactor such that scaleFactor <= value
        const end = scalesOrder.length - 1;
        for (let i = end; i >= 0; i--) {
            if (scalesOrder[i].scaleFactor <= value) {
                scaleFactor = scalesOrder[i].scaleFactor;
                break;
            }
        }
    }
    return scaleFactor;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * The function that returns the y axis properties.
 * @param dataAxisInfo The DataAxisInfo.
 * @param dataAxis The dataAxis props.
 * @param groups The chart groups.
 * @param position The position of axis in the given space.
 * @param availSpace The available space.
 * @param isRtl Whether the reading direction is right to left.
 * @param getTextDimensions Function for text measurement.
 * @returns
 */
function getDataAxisProps(position, availSpace, isRtl, locale, dataAxis, dataAxisInfo, axisFontSize, getTextDimensions) {
    const [start, end] = getAxisRange(availSpace, position, isRtl);
    const axisInfo = dataAxisInfo || new DataAxisInfo({ ...dataAxis });
    const scale = axisInfo.getScale([start, end]);
    const isHoriz = position === 'top' || position === 'bottom';
    const axisMaxDim = getAxisMaxSize(availSpace, isHoriz, dataAxis?.size);
    const titleStyle = { fontSize: axisFontSize, ...dataAxis?.titleStyle };
    const { titleDim, ...titleProps } = getTitleProps(dataAxis?.title, titleStyle, axisMaxDim, availSpace, position, isRtl, getTextDimensions);
    const { width: titleWidth, height: titleHeight } = titleProps.dims;
    const isTitleRendered = titleWidth > 0 && titleHeight > 0;
    const axisDim = isTitleRendered ? titleDim + labelUtils.AXIS_DEFAULTS.titleGap : 0;
    const isRotated = position === 'left' || position === 'right';
    if (isTitleRendered) {
        if (isRotated) {
            availSpace.width -= axisDim;
            availSpace.x += position === 'left' ? axisDim : 0;
        }
        else {
            availSpace.height -= axisDim;
            availSpace.y += position === 'top' ? axisDim : 0;
        }
    }
    const tickLabelStyle = {
        fontSize: axisFontSize,
        fill: dataAxis?.tickLabel?.style?.color,
        ...dataAxis?.tickLabel?.style,
        textAnchor: getTickLabelAnchor(position, isRtl),
        dominantBaseline: 'middle'
    };
    const ticks = axisInfo.getTicks();
    const linearFormatter = getLinearAxisValueFormatter(ticks[0], ticks[ticks.length - 1], axisInfo.getStep(), locale);
    let isLabelRendered = dataAxis?.tickLabel?.isRendered != false;
    const labels = isLabelRendered
        ? ticks.map((i) => {
            if (dataAxis?.tickLabel?.format) {
                return dataAxis.tickLabel.format(i);
            }
            if (dataAxis?.scale === 'log') {
                const formatter = getLinearAxisValueFormatter(i, i, i, locale);
                return formatter(i);
            }
            return linearFormatter(i);
        })
        : [];
    const maxLabelHeight = axisMaxDim - axisDim - labelUtils.AXIS_DEFAULTS.labelGap;
    const getLabelInfo = (tick, index, _) => {
        const coord = scale.transform(ticks[index]);
        return labelUtils.getTickLabelInfo(coord, tick, tickLabelStyle, isHoriz, false, false, false, isHoriz ? maxLabelHeight : axisMaxDim - axisDim, isHoriz ? axisMaxDim - axisDim : maxLabelHeight, availSpace, getTextDimensions);
    };
    const { maxWidth, maxHeight, tickLabels } = labelUtils.getDataAxisLabelsInfo(labels, getLabelInfo, isHoriz);
    isLabelRendered =
        isLabelRendered && isHoriz
            ? maxHeight + labelUtils.AXIS_DEFAULTS.labelGap < axisMaxDim - axisDim
            : maxWidth + labelUtils.AXIS_DEFAULTS.labelGap < axisMaxDim - axisDim;
    const getAxisPos = (index) => {
        return scale.transform(ticks[index]);
    };
    let labelDims = 0;
    if (isLabelRendered) {
        labelUtils.updateLabelsDims(maxWidth, maxHeight, tickLabels, getAxisPos, availSpace, position);
        labelDims = isHoriz ? maxHeight + labelUtils.AXIS_DEFAULTS.labelGap : maxWidth + labelUtils.AXIS_DEFAULTS.labelGap;
    }
    return {
        title: isTitleRendered ? dataAxis?.title : undefined,
        titleStyle,
        titleProps: isTitleRendered ? titleProps : undefined,
        axisDim: isTitleRendered ? labelDims + axisDim : labelDims,
        tickLabels,
        tickLabelStyle,
        scale
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const TIME_SECOND = 1000;
const TIME_MINUTE = 60 * TIME_SECOND;
const TIME_HOUR = 60 * TIME_MINUTE;
const TIME_DAY = 24 * TIME_HOUR;
const TIME_MONTH_MIN = 28 * TIME_DAY;
const TIME_MONTH_MAX = 31 * TIME_DAY;
const TIME_YEAR_MIN = 365 * TIME_DAY;
const TIME_YEAR_MAX = 366 * TIME_DAY;
function getTimeAxisProps(groups, position, availSpace, viewportMin, viewportMax, averageInterval, isRtl, xAxis, axisFontSize, getTextDimensions) {
    const isHoriz = position === 'top' || position === 'bottom';
    const axisMaxDim = getAxisMaxSize(availSpace, isHoriz, xAxis?.size);
    const titleStyle = { fontSize: axisFontSize, ...xAxis?.titleStyle };
    const timeAxisType = xAxis?.timeAxisType || 'regular';
    const { titleDim, ...titleProps } = getTitleProps(xAxis?.title, titleStyle, axisMaxDim, availSpace, position, isRtl, getTextDimensions);
    const { width: titleWidth, height: titleHeight } = titleProps.dims;
    const isTitleRendered = titleWidth > 0 && titleHeight > 0;
    let axisDim = isTitleRendered ? titleDim + labelUtils.AXIS_DEFAULTS.titleGap : 0;
    const isRotated = position === 'left' || position === 'right';
    if (isTitleRendered) {
        if (isRotated) {
            availSpace.width -= axisDim;
            availSpace.x += position === 'left' ? axisDim : 0;
        }
        else {
            availSpace.height -= axisDim;
            availSpace.y += position === 'top' ? axisDim : 0;
        }
    }
    const [start, end] = getAxisRange(availSpace, position, isRtl);
    const tickLabelStyle = {
        fontSize: axisFontSize,
        fill: xAxis?.tickLabel?.style?.color,
        ...xAxis?.tickLabel?.style,
        textAnchor: position === 'left' ? 'end' : position === 'bottom' ? 'middle' : 'start',
        dominantBaseline: 'middle'
    };
    const valueToCoord = (value) => {
        return getCoordFromValue(value, viewportMin, viewportMax, start, end, averageInterval, groups, xAxis?.timeAxisType);
    };
    const locale = getLocale.getLocale();
    let axisStep = xAxis?.step;
    const gap = labelUtils.AXIS_DEFAULTS.labelGap;
    let times = [];
    if (axisStep != null) {
        times = getLabelPos(viewportMin, viewportMax, axisStep);
    }
    else if (timeAxisType === 'mixedFrequency') {
        axisStep = getMixedFrequencyStep(viewportMax - viewportMin);
        times = getLabelPos(viewportMin, viewportMax, axisStep);
    }
    else {
        for (let i = 0; i < groups.length; i++) {
            const date = new Date(groups[i].id).getTime();
            if (date >= viewportMin && date <= viewportMax)
                times.push(date);
        }
        axisStep = averageInterval;
    }
    const level1Formatter = Array.isArray(xAxis?.tickLabel?.format)
        ? xAxis?.tickLabel?.format[0]
        : xAxis?.tickLabel?.format;
    const level2Formatter = Array.isArray(xAxis?.tickLabel?.format)
        ? xAxis?.tickLabel?.format[1]
        : undefined;
    if (timeAxisType != 'skipGaps') {
        const granularity = calculateGranularity(axisStep, viewportMax - viewportMin);
        times = treatMissingValues(times, granularity);
        if (times.length > 1) {
            // Since the contents of the times array might have been updated, the step value should
            // be updated.
            // The step value is approximated to the estimated average of the intervals in the updated
            // times array.
            // It is safe to do so even when there were no missing values as it should not have any side-effects
            // on rendering the axis.
            // If there are less than 2 values in the times array, proceed with the existing step value.
            axisStep = (times[times.length - 1] - times[0]) / (times.length - 1);
        }
        const label = formatAxisLabel(new Date(times[0] || viewportMin), undefined, !isHoriz, false, locale, granularity, level1Formatter, level2Formatter)[0];
        const labelDims = getTextDimensions?.(label, tickLabelStyle);
        if (labelDims) {
            const labelDim = isHoriz ? labelDims.width : labelDims.height;
            const totalWidth = (labelDim + getTickLabelGap(labelDims.height, isHoriz)) * (times.length - 1);
            if (totalWidth > Math.abs(end - start)) {
                axisStep = getMixedFrequencyStep(viewportMax - viewportMin);
                times = getLabelPos(viewportMin, viewportMax, axisStep);
            }
        }
    }
    if (times.length === 0) {
        times = [viewportMin];
    }
    const granularity = calculateGranularity(axisStep, viewportMax - viewportMin);
    const isLabelRendered = xAxis?.tickLabel?.isRendered != false;
    let isLabel1Rendered = isLabelRendered;
    let isLabel2Rendered = isLabelRendered;
    let tickLabels = [];
    const groupWidth = Math.abs(end - start) / times.length;
    if (isLabelRendered) {
        const { labelInfos1, labelInfos2 } = generateLabels(times, granularity, valueToCoord, level1Formatter, level2Formatter);
        const numOfSafeSkips = getSafeSkips(groupWidth, tickLabelStyle, getTextDimensions);
        const getLabel1Dims = (label, index) => {
            const rangeValue = labelInfos1[index].coord;
            if (!rangeValue || !label) {
                return {
                    text: '',
                    dims: { width: 0, height: 0, x: 0, y: 0 },
                    lines: [],
                    isTruncated: false,
                    didNotFit: false,
                    lineProps: []
                };
            }
            return labelUtils.getTickLabelInfo(rangeValue, label, tickLabelStyle, isHoriz, false, false, false, Infinity, Infinity, availSpace, getTextDimensions);
        };
        const getLabel2Dims = (label, index) => {
            const rangeValue = labelInfos2[index]?.coord;
            if (!rangeValue || !label) {
                return {
                    text: '',
                    dims: { width: 0, height: 0, x: 0, y: 0 },
                    lines: [],
                    lineProps: [],
                    didNotFit: false,
                    isTruncated: false
                };
            }
            return labelUtils.getTickLabelInfo(rangeValue, label, tickLabelStyle, isHoriz, false, false, false, Infinity, Infinity, availSpace, getTextDimensions);
        };
        const { maxWidth: label1MaxWidth, maxHeight: label1MaxHeight, tickLabels: tickLabels1 } = labelUtils.getGroupAxisLabelsInfo(labelInfos1.map((i) => i.text), getLabel1Dims, isHoriz, false, false, numOfSafeSkips);
        axisDim = isHoriz ? label1MaxHeight + gap : label1MaxWidth + gap;
        isLabel1Rendered =
            isTitleRendered && isHoriz
                ? axisDim < axisMaxDim - titleHeight
                : axisDim < axisMaxDim - titleHeight;
        const { maxWidth: label2MaxWidth, maxHeight: label2MaxHeight, tickLabels: tickLabels2 } = labelUtils.skipLabelsGreedy(labelInfos2.map((i) => i.label2), getLabel2Dims, isHoriz);
        const level2AxisDim = isHoriz
            ? axisDim + label2MaxHeight + gap
            : axisDim + label2MaxWidth + gap;
        isLabel2Rendered = isHoriz
            ? level2AxisDim < axisMaxDim - titleHeight
            : level2AxisDim < axisMaxDim - titleHeight;
        if (isLabel1Rendered) {
            const getAxisPos = (index) => {
                return labelInfos1[index].coord;
            };
            labelUtils.updateLabelsDims(label1MaxWidth, label1MaxHeight, tickLabels1, getAxisPos, availSpace, position);
            tickLabels = tickLabels.concat(tickLabels1);
            axisDim = axisDim + titleHeight;
        }
        if (isLabel2Rendered) {
            const getAxisPos = (index) => {
                return labelInfos2[index].coord;
            };
            labelUtils.updateLabelsDims(label2MaxWidth, label2MaxHeight, tickLabels2, getAxisPos, availSpace, position);
            tickLabels.forEach((value) => {
                if (value.lineProps[0]) {
                    value.lineProps[0].y -= value.lineProps[0].height;
                }
            });
            tickLabels = tickLabels.concat(tickLabels2);
            axisDim = level2AxisDim + titleHeight;
        }
    }
    const scale = {
        transform: valueToCoord,
        range: () => {
            return [start, end];
        },
        domain: () => {
            return [viewportMin, viewportMax];
        },
        invert: (coord) => {
            return getValueFromCoord(coord, start, end, viewportMin, viewportMax, averageInterval, groups, xAxis?.timeAxisType || 'enabled');
        }
    };
    return {
        title: isTitleRendered ? xAxis?.title : undefined,
        titleProps: isTitleRendered ? titleProps : undefined,
        titleStyle,
        axisDim,
        scale,
        tickLabels,
        groupWidth,
        tickLabelStyle
    };
}
/**
 * Calculates the granularity of the time axis.
 * @param step The step of the axis.
 * @param timeRange The time range of the axis.
 * @returns
 */
function calculateGranularity(step, timeRange) {
    if (step >= TIME_YEAR_MIN || timeRange >= 6 * TIME_YEAR_MIN)
        return TIME_YEAR_MIN;
    if (step >= TIME_MONTH_MIN || timeRange >= 6 * TIME_MONTH_MIN)
        return TIME_MONTH_MIN;
    if (step >= TIME_DAY || timeRange >= 6 * TIME_DAY)
        return TIME_DAY;
    if (step >= TIME_HOUR || timeRange >= 6 * TIME_HOUR)
        return TIME_HOUR;
    if (step >= TIME_MINUTE || timeRange >= 6 * TIME_MINUTE)
        return TIME_MINUTE;
    return TIME_SECOND;
}
/**
 * Returns the step for mixed frequency time range.
 * @param timeRange
 * @returns
 */
function getMixedFrequencyStep(timeRange) {
    if (timeRange >= 6 * TIME_YEAR_MIN)
        return TIME_YEAR_MIN;
    if (timeRange >= 6 * TIME_MONTH_MIN)
        return TIME_MONTH_MIN;
    if (timeRange >= 6 * TIME_DAY)
        return TIME_DAY;
    if (timeRange >= TIME_DAY)
        return 3 * TIME_HOUR;
    if (timeRange >= 6 * TIME_HOUR)
        return TIME_HOUR;
    if (timeRange >= TIME_HOUR)
        return 15 * TIME_MINUTE;
    if (timeRange >= 30 * TIME_MINUTE)
        return 5 * TIME_MINUTE;
    if (timeRange >= 6 * TIME_MINUTE)
        return TIME_MINUTE;
    if (timeRange >= TIME_MINUTE)
        return 15 * TIME_SECOND;
    if (timeRange >= 30 * TIME_SECOND)
        return 5 * TIME_SECOND;
    return TIME_SECOND;
}
function formatLabelWithFormatter(date, prevDate, formatter) {
    if (!formatter) {
        return '';
    }
    const label = formatter(date.getTime());
    const prevLabel = prevDate ? formatter?.(prevDate.getTime()) : undefined;
    if (prevLabel !== label || label == null) {
        return label;
    }
    // TODO: JET-65541. This is not as straightforward for format function. See old jet logic formatLabelWithConverter.
    // do not skip label when it is same as prevLabel checking for granularity
    // for eg. if June and July both convert to 'J' and granularity is TIME_MONTH_MIN, we want to keep both 'J's
    // for eg. if Saturday and Sunday both convert to 'S' and granularity is TIME_MONTH_DAY, we want to keep both 'S's
    return '';
}
function formatAxisLabel(date, prevDate, bOneLabel, isVert, locale, granularity, label1Formatter, label2Formatter) {
    let label1 = null; // level 1 label
    let label2 = null; // level 2 label
    // If dateTimeFormatter is used, use it
    if (label1Formatter || label2Formatter) {
        if (label1Formatter)
            label1 = formatLabelWithFormatter(date, prevDate, label1Formatter);
        if (label2Formatter)
            label2 = formatLabelWithFormatter(date, prevDate, label2Formatter);
        return [label1, label2];
    }
    if (granularity === TIME_YEAR_MIN) {
        label1 = formatDate(date, locale, false, false, true); // Year
    }
    else if (granularity === TIME_MONTH_MIN) {
        if (prevDate == null || prevDate.getMonth() != date.getMonth())
            label1 = formatDate(date, locale, false, true, false); // Month
        if (prevDate == null || prevDate.getFullYear() != date.getFullYear())
            label2 = formatDate(date, locale, false, false, true); // Year
    }
    else if (granularity === TIME_DAY) {
        if (bOneLabel) {
            label1 = formatDate(date, locale, true, true, true); // Day, Month, Year
        }
        else {
            if (prevDate == null || prevDate.getDate() != date.getDate())
                label1 = formatDate(date, locale, true, false, false); // Day
            if (prevDate == null || prevDate.getFullYear() != date.getFullYear())
                label2 = formatDate(date, locale, false, true, true); // Year, Month
            else if (prevDate.getMonth() != date.getMonth())
                label2 = formatDate(date, locale, false, true, false); // Month
        }
    }
    else {
        if (granularity === TIME_HOUR) {
            if (prevDate == null || prevDate.getHours() != date.getHours())
                label1 = formatTime(date, locale, false, false); // HH AM/PM or HH:MM
        }
        else if (granularity === TIME_MINUTE) {
            if (prevDate == null || prevDate.getMinutes() != date.getMinutes())
                label1 = formatTime(date, locale, true, false); // HH:MM
        }
        else {
            if (prevDate == null || prevDate.getSeconds() != date.getSeconds())
                label1 = formatTime(date, locale, true, true); // HH:MM:SS
        }
        if (isVert) {
            if (prevDate == null || prevDate.getDate() != date.getDate())
                label2 = formatDate(date, locale, true, true, false); // Month, Day
        }
        else {
            if (prevDate == null || prevDate.getFullYear() != date.getFullYear())
                label2 = formatDate(date, locale, true, true, true); // Year, Month, Day
            else if (prevDate.getMonth() != date.getMonth())
                label2 = formatDate(date, locale, true, true, false); // Month, Day
            else if (prevDate.getDate() != date.getDate())
                label2 = formatDate(date, locale, true, false, false); // Day
        }
    }
    return [label1, label2];
}
/**
 * Returns the formatted date string.
 * @param date
 * @param locale
 * @param showDay
 * @param showMonth
 * @param showYear
 * @returns
 */
function formatDate(date, locale, showDay, showMonth, showYear) {
    // this function is equivalent to _formatDate present in DvtTimeAxisInfo
    // replacing the impl to use toLocaleDateString
    const options = {
        year: showYear ? 'numeric' : undefined,
        month: showMonth ? 'short' : undefined,
        day: showDay ? 'numeric' : undefined
    };
    return date.toLocaleDateString(locale, options);
}
/**
 * Returns the formatted time string.
 * @param date
 * @param locale
 * @param showMinute
 * @param showSecond
 * @returns
 */
function formatTime(date, locale, showMinute, showSecond) {
    // this function is equivalent to _formatDate present in DvtTimeAxisInfo
    // replacing the impl to use toLocaleDateString
    const options = {
        hour: '2-digit',
        minute: showMinute ? '2-digit' : undefined,
        second: showSecond ? '2-digit' : undefined
    };
    return date.toLocaleTimeString(locale, options);
}
function getLabelPos(start, end, step) {
    // The time positions has to be at even intervals from the beginning of a year (January 1, 12:00:00 AM), otherwise
    // we may have labels such as [2013, 2014, 2015, ...] that are drawn at [June 8 2013, June 8 2014, June 8 2015, ...],
    // which is data misrepresentation.
    const anchor = new Date(start);
    const initialTimezoneOffset = anchor.getTimezoneOffset();
    anchor.setMonth(0, 1); // January 1
    anchor.setHours(0, 0, 0, 0); // 00:00:00
    let time = anchor.getTime();
    const times = [];
    if (step >= TIME_YEAR_MIN && step <= TIME_YEAR_MAX) {
        // Assume that the step is one year, which can mean different # of days depending on the year
        while (time < start)
            time = addOneYear(time);
        while (time <= end) {
            times.push(time);
            time = addOneYear(time);
        }
    }
    else if (step >= TIME_MONTH_MIN && step <= TIME_MONTH_MAX) {
        // Assume that the step is one month, which can mean different # of days depending on the month
        while (time < start)
            time = addOneMonth(time);
        while (time <= end) {
            times.push(time);
            time = addOneMonth(time);
        }
    }
    else {
        // Bug 26396791. Correction is needed due to daylight savings.
        // Only apply daylight correction when step is less than a month. Daylight savings does not impact any step higher than month.
        // JET-52348 - Ideally we should be using Date api to add and substract date offsets to calculate labels since
        // Date will automatically handle daylight savings. This approach should solve issues for steps greater than month but we could encounter
        // offsets in axis labels when dataset values are in different daylight savings and chart step is low (eg day or hour);
        const timezoneCorrection = (initialTimezoneOffset - anchor.getTimezoneOffset()) * 60 * 1000;
        const correction = step < TIME_MONTH_MIN ? timezoneCorrection : 0;
        time += Math.ceil((start - time - correction) / step) * step + correction;
        while (time <= end) {
            times.push(time);
            time += step;
        }
    }
    return times;
}
function generateLabels(times, granularity, getCoordFromValue, label1Formatter, label2Formatter) {
    const locale = getLocale.getLocale();
    const labelInfos1 = [];
    const coords1 = [];
    const labelInfos2 = [];
    const coords2 = [];
    let isOneLevel = true;
    let prevDate = undefined;
    for (let i = 0; i < times.length; i++) {
        const time = times[i];
        const coord = getCoordFromValue(time);
        const date = new Date(time);
        const [label1, label2] = formatAxisLabel(date, prevDate, false, false, locale, granularity, label1Formatter, label2Formatter);
        if (label1 != null) {
            labelInfos1.push({ text: label1, coord });
            coords1.push(coord);
        }
        if (label2 != null) {
            labelInfos2.push({ label2, coord });
            coords2.push(coord);
            isOneLevel = false;
        }
        prevDate = date;
    }
    return {
        labelInfos1,
        labelInfos2,
        coords1,
        coords2,
        isOneLevel
    };
}
/**
 * Adds the time by one year, e.g. 2014 January 15 -> 2015 January 15 -> ...
 */
function addOneYear(time) {
    const date = new Date(time);
    date.setFullYear(date.getFullYear() + 1);
    return date.getTime();
}
/**
 * Adds the time by one month, e.g. January 15 -> February 15 -> March 15 -> ...
 */
function addOneMonth(time) {
    const date = new Date(time);
    date.setMonth(date.getMonth() + 1);
    return date.getTime();
}
/**
 * Returns the corresponding index for the given time in time axis.
 * @param time The time stamp.
 * @param averageInterval The average interval of the time axis.
 * @param groups The groups array.
 * @returns
 */
function timeToIndex(time, averageInterval, groups) {
    let endIndex = groups.length;
    // TODO: can do binary search to make this fast
    for (let i = 0; i < groups.length; i++) {
        if (time <= new Date(groups[i].id).getTime()) {
            endIndex = i;
            break;
        }
    }
    const startIndex = endIndex - 1;
    const startTime = groups[startIndex] !== undefined
        ? new Date(groups[startIndex].id).getTime()
        : new Date(groups[0].id).getTime() - averageInterval;
    const endTime = groups[endIndex] !== undefined
        ? new Date(groups[endIndex].id).getTime()
        : new Date(groups[groups.length - 1].id).getTime() + averageInterval;
    return startIndex + (time - startTime) / (endTime - startTime);
}
/**
 * Returns the time stamp for given index.
 * @param index The index.
 * @param averageInterval The average interval of the axis.
 * @param groups The groups array.
 * @returns
 */
function indexToTime(index, averageInterval, groups) {
    const endIndex = Math.min(Math.max(Math.ceil(index), 0), groups.length);
    const startIndex = endIndex - 1;
    const startTime = groups[startIndex] !== undefined
        ? getTime(groups[startIndex].id)
        : getTime(groups[0].id) - averageInterval;
    const endTime = groups[endIndex] !== undefined
        ? getTime(groups[endIndex].id)
        : getTime(groups[groups.length - 1].id) + averageInterval;
    return startTime + (index - startIndex) * (endTime - startTime);
}
function getTime(uxTime) {
    return new Date(uxTime).getTime();
}
function getCoordFromValue(value, minValue, maxValue, startCoord, endCoord, averageInterval, groups, timeAxisType) {
    let ratio;
    if (timeAxisType === 'skipGaps') {
        if (groups.length < 1) {
            return startCoord;
        }
        const minVal = timeToIndex(minValue, averageInterval, groups);
        const maxVal = timeToIndex(maxValue, averageInterval, groups);
        const val = timeToIndex(value, averageInterval, groups);
        ratio = (val - minVal) / (maxVal - minVal);
    }
    else {
        ratio = (value - minValue) / (maxValue - minValue);
    }
    return startCoord + ratio * (endCoord - startCoord);
}
function getValueFromCoord(coord, startCoord, endCoord, minValue, maxValue, averageInterval, groups, timeAxisType) {
    const ratio = (coord - startCoord) / (endCoord - startCoord);
    if (timeAxisType === 'skipGaps') {
        const minVal = timeToIndex(minValue, averageInterval, groups);
        const maxVal = timeToIndex(maxValue, averageInterval, groups);
        return indexToTime(minVal + ratio * (maxVal - minVal), averageInterval, groups);
    }
    else
        return minValue + ratio * (maxValue - minValue);
}
function isoToNumber(dateString) {
    if (!dateString) {
        return;
    }
    return new Date(dateString).getTime();
}
/**
 * Returns the average interval for the time axis.
 * @param groups The number of groups.
 * @param start The earliest time among all data points.
 * @param end The latest time among all data points.
 * @returns
 */
function getAverageInterval(groups, start, end) {
    if (end != start && groups.length > 1) {
        return (end - start) / (groups.length - 1);
    }
    else if (end - start > 0) {
        return end - start;
    }
    return 6 * TIME_MINUTE;
}
/**
 * Returns the time axis info.
 * @param groups The groups array.
 * @param xAxis The xAxis props.
 * @param offset The start and end offset for the axis.
 * @param timeAxisRange The start and end of the time range.
 * @returns
 */
function getTimeAxisInfo(groups, xAxis = {}, offset, timeAxisRange) {
    let { start, end } = timeAxisRange;
    const { viewportMin, viewportMax, viewportEndGroup, viewportStartGroup } = xAxis;
    let minValue = isoToNumber((viewportMin || viewportStartGroup));
    let maxValue = isoToNumber((viewportMax || viewportEndGroup));
    // if start or end are undefined, use the application set viewport settings
    if (start == undefined) {
        start = minValue;
    }
    if (end == undefined) {
        end = maxValue;
    }
    const averageInterval = getAverageInterval(groups, start, end);
    const axisOffset = offset * averageInterval;
    const globalMin = start - axisOffset;
    const globalMax = end + axisOffset;
    minValue = minValue || globalMin;
    maxValue = maxValue || globalMax;
    let startIndex = 0;
    let endIndex = Math.max(0, groups.length - 1);
    // TODO: since groups is expected to be sorted, can binary search here
    groups.forEach((group, index) => {
        const timeStamp = new Date(group.id).getTime();
        if (timeStamp < minValue) {
            startIndex = index;
        }
        if (timeStamp < maxValue) {
            endIndex = index;
        }
    });
    return {
        viewportMin: minValue,
        viewportMax: maxValue,
        viewportStartGroup,
        viewportEndGroup,
        startIndex,
        endIndex,
        min: globalMin,
        max: globalMax,
        averageInterval
    };
}
/**
 * Returns the maximum of time stamps for the given dataset
 * and time axis type.
 * @param groups The array of groups.
 * @param series The array of series.
 * @param getDataItem The function that returns item for given seriesIndex and groupIndex.
 * @param timeAxisType The time axis type.
 * @returns
 */
function getStartAndEndTime(groups, series, getDataItem, timeAxis) {
    const range = {
        start: Number.MAX_VALUE,
        end: -Number.MAX_VALUE
    };
    const numGroups = groups.length;
    const timeAxisType = timeAxis.timeAxisType;
    if (timeAxisType != 'mixedFrequency' && numGroups > 0) {
        range.start = isoToNumber(groups[0].id);
        range.end = isoToNumber(groups[numGroups - 1].id);
    }
    else {
        // TODO: this is inefficient. We should precompute all the repeated necessary
        // infomation and reuse whereever needed.
        series.forEach((_, seriesIndex) => {
            groups.forEach((_, groupIndex) => {
                const num = isoToNumber(getDataItem(seriesIndex, groupIndex)?.x);
                if (num) {
                    range.start = Math.min(range.start, num);
                    range.end = Math.max(range.end, num);
                }
            });
        });
    }
    // if we can't determine valid range, let the application set viewportMin and viewportMax
    // or viewportStartGroup, viewportEndGroup to determine the axis range.
    if (range.start === Number.MAX_VALUE && range.end === -Number.MAX_VALUE) {
        range.start = undefined;
        range.end = undefined;
    }
    return range;
}
/**
 * Treat missing values when there are large gaps in time axis.
 * @param times
 * @param granularity
 * @returns
 */
function treatMissingValues(times, granularity) {
    let initialInterval;
    const intervals = new Set();
    let hasMissingValues = false;
    let ret = times; // If there are no missing values, the original array will be returned.
    const intervalsCache = [];
    const timeLength = times.length;
    let previousDate = new Date(times[0]);
    for (let i = 1; i < timeLength; i++) {
        // Calculate the current interval.
        const currentDate = new Date(times[i]);
        const currentInterval = calculateGranularInterval(previousDate, currentDate, granularity);
        previousDate = currentDate;
        // Cache the result so as to not calculate again while filling the missing values
        // Since the cache is only used for filling in the missing values, and the operation
        // is performed in the same order as this one, having the cache key in the format
        // '1546318800000-1514782800000' should be fine.
        intervalsCache.push(currentInterval);
        // Proceed only if the current interval is greater than the current
        // granularity level.
        if (currentInterval <= 0) {
            continue;
        }
        // Add the current interval to the set.
        // The GCD of all the intervals will be used to fill in the missing the
        // values.
        intervals.add(currentInterval);
        // During the initial iteration, we will not have any information on intervals,
        // so, store the current interval and continue.
        if (!initialInterval) {
            initialInterval = currentInterval;
            continue;
        }
        // Check if the current interval is regular.
        if (currentInterval !== initialInterval) {
            hasMissingValues = true;
        }
    }
    // If missing values are present, treat them.
    if (hasMissingValues) {
        // Get the GCD of intervals and it will be the minimum interval in the new set of times
        const minimumInterval = getGCDInterval([...intervals]);
        ret = [];
        ret.push(times[0]);
        for (let i = 1; i < timeLength; i++) {
            const currentValue = times[i];
            let previousValue = times[i - 1];
            // Retrieve the interval from cache.
            // As we are looping through the same array the cache will have the interval value
            // and will never be undefined.
            const currentInterval = intervalsCache[i - 1];
            // If no values are missing in this interval,
            // add current value to the return array and continue.
            // Note: Values are considered missing only when the interval is greater than the current granularity level (minimumInterval).
            // Example: Jan 1, Jan 15, Feb 1, Mar 1, May 1, Jun 1
            // Granularity = Month; Minimum Interval = 1 (1 month)
            // Mar 1, May 1 => has one missing value: Apr
            // Jan 1, Jan 15 => has no missing value
            if (currentInterval <= minimumInterval) {
                ret.push(currentValue);
                continue;
            }
            // Calculate the interval at which the values are to be filled
            const ratioOfCurrentIntervalToMinimumInterval = currentInterval / minimumInterval; // Should be a round number as minimumInterval is a divisor of currentInterval
            const numMissingValues = ratioOfCurrentIntervalToMinimumInterval - 1;
            const fillIntervalInMilliseconds = Math.round((currentValue - previousValue) / ratioOfCurrentIntervalToMinimumInterval);
            // Fill in the missing values
            for (let j = 1; j <= numMissingValues; j++) {
                previousValue += fillIntervalInMilliseconds;
                ret.push(previousValue);
            }
            ret.push(currentValue); // Finally, add the current value
            previousValue = currentValue; // Update the previous value
        }
    }
    return ret;
}
/**
 * Calculates the granual interval.
 * @param previousDate
 * @param currentDate
 * @param granularity
 * @returns
 */
function calculateGranularInterval(previousDate, currentDate, granularity) {
    // Treat times for the day light savings.
    const prevTimezoneOffset = previousDate.getTimezoneOffset();
    const currentTimezoneOffset = currentDate.getTimezoneOffset();
    const currentTime = currentDate.getTime();
    const currentTimezoneOffsetCorrection = (prevTimezoneOffset - currentTimezoneOffset) * 1000 * 60;
    if (currentTimezoneOffsetCorrection > 0) {
        currentDate.setTime(currentTime + currentTimezoneOffsetCorrection);
    }
    let granularInterval;
    if (granularity === TIME_YEAR_MIN)
        granularInterval = currentDate.getFullYear() - previousDate.getFullYear();
    else if (granularity === TIME_MONTH_MIN)
        granularInterval =
            12 * (currentDate.getFullYear() - previousDate.getFullYear()) +
                (currentDate.getMonth() - previousDate.getMonth());
    else
        granularInterval = Math.round((currentDate.getTime() - previousDate.getTime()) / granularity);
    if (currentTimezoneOffsetCorrection > 0) {
        currentDate.setTime(currentTime); // reset to original value
    }
    return granularInterval;
}
/**
 * Returns the greatest common denominator.
 * @param interval1
 * @param interval2
 * @returns
 */
function gcd(interval1, interval2) {
    if (interval1 === 0)
        return interval2;
    return gcd(interval2 % interval1, interval1);
}
/**
 * Returns the gcd of the intervals.
 * @param intervals
 * @returns
 */
function getGCDInterval(intervals) {
    let result = intervals[0];
    for (let i = 1; i < intervals.length; i++) {
        result = gcd(result, intervals[i]);
        if (result === 1)
            return 1;
    }
    return result;
}
/**
 * Retuns the tick label gap.
 * @param labelHeight The height of the label.
 * @param isHoriz Whether the axis is horizontal.
 * @returns
 */
function getTickLabelGap(labelHeight, isHoriz) {
    // legacy numbers.
    return isHoriz ? labelHeight * 0.79 : labelHeight * 0.28;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the min and max value among the items rendered in the viewport.
 * @param series The array of chart series.
 * @param viewportMin The current viewport min.
 * @param viewportMax The current viewport max.
 * @returns
 */
function getDataMinMax(series, groups, xStartIndex, xEndIndex, getDataItem, isStacked, isLog, hiddenSet, hideAndShowBehavior) {
    let dataMin = Number.MAX_VALUE;
    let dataMax = -Number.MAX_VALUE;
    const idToDataMap = new Map();
    for (let groupIndex = 0; groupIndex < groups.length; groupIndex++) {
        let posCumulValue = 0;
        let negCumulValue = 0;
        series.forEach((_, seriesIndex) => {
            const item = getDataItem(seriesIndex, groupIndex);
            if (!item || item.value == null) {
                return;
            }
            idToDataMap.set(item.id, item);
            if (groupIndex >= xStartIndex && groupIndex <= xEndIndex) {
                const skipData = item?.id != null && hiddenSet.has(item.id) && hideAndShowBehavior === 'withRescale';
                if (skipData || (item.value <= 0 && isLog)) {
                    return;
                }
                if (isStacked) {
                    posCumulValue += item.value > 0 ? item.value : 0;
                    negCumulValue += item.value < 0 ? item.value : 0;
                    dataMin = Math.min(isLog ? posCumulValue : negCumulValue, dataMin);
                    dataMax = Math.max(posCumulValue, dataMax);
                }
                else {
                    dataMin = Math.min(dataMin, item.value);
                    dataMax = Math.max(dataMax, item.value);
                }
            }
        });
    }
    return { dataMin, dataMax, idToDataMap };
}
/**
 * Returns the dataMin and dataMax, used for axis extend calculations, from the chart data.
 * @param series
 * @param hiddenIds
 * @param xStartIndex
 * @param xEndIndex
 * @param yAxis
 * @returns
 */
function getDataExtent(series, groups, getDataItem, xStartIndex, xEndIndex, isStacked, hiddenSet, hideAndShowBehavior, yAxis) {
    let dataMin = yAxis?.dataMin;
    let dataMax = yAxis?.dataMax;
    //TODO: For performance optimization we can return early if we donot need idToDataMap i.e when selectionMode is off.
    // if (dataMin != null && dataMax != null) {
    //   return { dataMin, dataMax };
    // }
    const data = getDataMinMax(series, groups, xStartIndex, xEndIndex, getDataItem, isStacked, yAxis?.scale === 'log', hiddenSet, hideAndShowBehavior);
    if (dataMin == null) {
        dataMin = data.dataMin;
    }
    if (dataMax == null) {
        dataMax = data.dataMax;
    }
    return { dataMax, dataMin, idToDataMap: data.idToDataMap };
}
/**
 * For a given groupIndex gIndex, and seriesIndex sIndex, returns the next groupIndex that has not null data.
 * @param gIndex The groupIndex.
 * @param sIndex The seriesIndex.
 * @param groups The groups arrray.
 * @param getDataItem The function that returns data item for given seriesIndex and groupIndex.
 * @returns
 */
function findNextGroupWithData(gIndex, sIndex, groups, getDataItem) {
    let right = gIndex;
    while (right < groups.length) {
        const hasData = !!getDataItem(sIndex, right);
        if (hasData) {
            return right;
        }
        right += 1;
    }
    return -1;
}
/**
 * For a given groupIndex gIndex, and seriesIndex sIndex, returns the prev groupIndex that has not null data.
 * @param gIndex The groupIndex.
 * @param sIndex The seriesIndex.
 * @param groups The groups arrray.
 * @param getDataItem The function that returns data item for given seriesIndex and groupIndex.
 * @returns
 */
function findPreviousGroupWithData(gIndex, sIndex, getDataItem) {
    let left = gIndex;
    while (left >= 0) {
        const hasData = !!getDataItem(sIndex, left);
        if (hasData) {
            return left;
        }
        left -= 1;
    }
    return -1;
}
/**
 * Finds the nearest data group/item for the given x axis coordinate.
 * @param x The x coordinate.
 * @param groups The groups array.
 * @param series The series array.
 * @param getDataItem The function that returns data item for given seriesIndex and groupIndex.
 * @returns
 */
function findNearestRegularAxisIndex(x, groups, series, getDataItem) {
    const keyFunc = (index) => getTime(groups[index].id);
    if (groups.length < 2) {
        return 0;
    }
    if (keyFunc(0) > x) {
        return Math.min(...series.map((_, sIndex) => findNextGroupWithData(0, sIndex, groups, getDataItem)));
    }
    if (keyFunc(groups.length - 1) < x) {
        return Math.max(...series.map((_, sIndex) => findPreviousGroupWithData(groups.length - 1, sIndex, getDataItem)));
    }
    const groupIndex = findGroup(0, groups.length - 1, x, keyFunc);
    const prevIndex = Math.max(...series.map((_, sIndex) => findPreviousGroupWithData(groupIndex, sIndex, getDataItem)));
    if (prevIndex === groupIndex)
        return prevIndex;
    const nextIndex = Math.min(...series.map((_, sIndex) => findNextGroupWithData(groupIndex, sIndex, groups, getDataItem)));
    if (keyFunc(nextIndex) - x < x - keyFunc(prevIndex)) {
        return nextIndex;
    }
    return prevIndex;
}
/**
 * Finds the nearest data group/item for the given x axis coordinate in mixed frequency time axis chart.
 * @param x The x axis coordinate
 * @param groups The chart groups.
 * @param series The chart series.
 * @param getDataItem The function that returns data item for each series and groups.
 */
function getNearestMixedFrequencyDataItem(target, series, groups, getDataItem) {
    /**
     * first find the data items in each series closest to the given value and
     * then find the closest among them.
     * TODO: make this O(log(n))
     */
    return series.map((_, seriesIndex) => {
        let min = Number.MAX_VALUE;
        let minIndex = 0;
        for (let groupIndex = 0; groupIndex < groups.length; groupIndex++) {
            const x = getDataItem(seriesIndex, groupIndex)?.x;
            if (!x) {
                continue;
            }
            const time = getTime(x);
            const dist = Math.abs(target - time);
            if (dist < min) {
                min = dist;
                minIndex = groupIndex;
            }
        }
        return { seriesIndex, groupIndex: minIndex };
    });
}
/**
 * For a given target value, binary searches the index between min and max. The keyFunc returns the
 * value for each given index.
 * @param min The minimum index to search.
 * @param max The maximum index to search.
 * @param target The target value to find the neareast index to.
 * @param keyFunc The function that returns the target value for each given index.
 * @returns
 */
function findGroup(min, max, target, keyFunc) {
    let left = min;
    let right = max;
    const foundIndex = (ll, rr) => {
        return rr - ll === 1 && keyFunc(ll) <= target && target <= keyFunc(rr);
    };
    let moveRight = 0;
    let step = Math.floor((right - left) / 2);
    while (!foundIndex(left, right)) {
        const newIndex = moveRight ? Math.floor(left + step) : Math.ceil(right - step);
        const diff = target - keyFunc(newIndex);
        if (0 <= diff) {
            left = newIndex;
            moveRight = moveRight ? 0 : 1;
        }
        else {
            right = newIndex;
        }
        step = Math.floor((right - left) / 2);
    }
    return target - keyFunc(left) < keyFunc(right) - target ? left : right;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Retuns the groups axis labels.
 * @param groups The groups array.
 * @param startIndex The viewport start index.
 * @param endIndex The viewport end index.
 * @returns
 */
function getGroupAxisLabels(groups, startIndex, endIndex) {
    const ticks = [];
    for (let i = startIndex; i <= endIndex; i++) {
        ticks.push(groups[i].name || groups[i].id);
    }
    return ticks;
}
/**
 * Retuns the info about group axis.
 * @param groups The groups array.
 * @param xAxis The xAxis props.
 * @param offset The start and end offset for the chart.
 * @returns
 */
function getGroupAxisInfo(groups, xAxis = {}, offset) {
    let { viewportMin, viewportMax, viewportEndGroup, viewportStartGroup } = xAxis;
    if (viewportMin != null) {
        viewportStartGroup = groups[Math.max(0, Math.ceil(viewportMin))].id;
    }
    if (viewportStartGroup != null && viewportMin == null) {
        viewportMin = groups.findIndex((value) => value.id === viewportStartGroup);
    }
    if (viewportMin == null) {
        viewportMin = -1 * offset;
        viewportStartGroup = groups[0]?.id;
    }
    if (viewportMax != null) {
        viewportEndGroup = groups[Math.min(groups.length - 1, Math.floor(viewportMax))].id;
    }
    if (viewportEndGroup != null && viewportMax == null) {
        viewportMax = groups.findIndex((value) => value.id === viewportEndGroup);
    }
    if (viewportMax == null) {
        viewportMax = groups.length - 1 + offset;
        viewportEndGroup = groups[Math.floor(viewportMax)]?.id;
    }
    return {
        min: -1 * offset,
        max: groups.length - offset,
        viewportMin,
        viewportMax,
        viewportStartGroup,
        viewportEndGroup,
        startIndex: Math.max(0, Math.ceil(viewportMin)),
        endIndex: Math.min(Math.floor(viewportMax), viewportMax)
    };
}
/**
 * The function that returns the x axis properties.
 * @param groupAxisIno The GroupAxisInfo.
 * @param groupAxis The groupAxis props.
 * @param groups The chart groups.
 * @param position The position of axis in the given space.
 * @param availSpace The available space.
 * @param isRtl Whether the reading direction is right to left.
 * @param getTextDimensions Function for text measurement.
 * @returns
 */
function getGroupAxisProps(groups, position, availSpace, isRtl, viewportMin, viewportMax, startIndex, endIndex, isDomainFlipped, groupAxis, axisFontSize, getTextDimensions) {
    const isHoriz = position === 'top' || position === 'bottom';
    const axisMaxDim = getAxisMaxSize(availSpace, isHoriz, groupAxis?.size);
    const titleStyle = { fontSize: axisFontSize, ...groupAxis?.titleStyle };
    const { titleDim, ...titleProps } = getTitleProps(groupAxis?.title, titleStyle, axisMaxDim, availSpace, position, isRtl, getTextDimensions);
    const { width: titleWidth, height: titleHeight } = titleProps.dims;
    const isTitleRendered = titleWidth > 0 && titleHeight > 0;
    const axisDim = isTitleRendered ? titleDim + labelUtils.AXIS_DEFAULTS.titleGap : 0;
    const isRotated = position === 'left' || position === 'right';
    if (isTitleRendered) {
        if (isRotated) {
            availSpace.width -= axisDim;
            availSpace.x += position === 'left' ? axisDim : 0;
        }
        else {
            availSpace.height -= axisDim;
            availSpace.y += position === 'top' ? axisDim : 0;
        }
    }
    const [start, end] = getAxisRange(availSpace, position, isRtl);
    const domain = isDomainFlipped
        ? [viewportMax, viewportMin]
        : [viewportMin, viewportMax];
    const scale$1 = new scale.ScaleLinear(domain, [start, end]);
    const groupWidth = Math.abs(end - start) / (viewportMax - viewportMin);
    const tickLabelStyle = {
        fontSize: axisFontSize,
        fill: groupAxis?.tickLabel?.style?.color,
        ...groupAxis?.tickLabel?.style,
        textAnchor: getTickLabelAnchor(position, isRtl),
        dominantBaseline: 'middle'
    };
    let isLabelRendered = groupAxis?.tickLabel?.isRendered != false;
    const labelsInView = getGroupAxisLabels(groups, startIndex, endIndex);
    const numOfSafeSkips = getSafeSkips(groupWidth, tickLabelStyle, getTextDimensions);
    const maxLabelDim = axisMaxDim - axisDim - labelUtils.AXIS_DEFAULTS.labelGap;
    const isWrapAllowed = tickLabelStyle.whiteSpace != 'nowrap';
    const getLabelInfo = (label, index, isRotated, allowTruncate, isWrapAllowed) => {
        const rangeValue = scale$1.transform(index + startIndex);
        return labelUtils.getTickLabelInfo(rangeValue, label, tickLabelStyle, isHoriz, isRotated, isWrapAllowed, allowTruncate, isHoriz ? groupWidth : maxLabelDim, isHoriz ? maxLabelDim : groupWidth, availSpace, getTextDimensions);
    };
    const autoRotate = groupAxis?.tickLabel?.autoRotate != false;
    const { maxWidth, maxHeight, tickLabels } = labelUtils.getGroupAxisLabelsInfo(labelsInView, getLabelInfo, isHoriz, autoRotate, isWrapAllowed, numOfSafeSkips);
    isLabelRendered =
        isLabelRendered && isHoriz
            ? maxHeight + labelUtils.AXIS_DEFAULTS.labelGap < axisMaxDim - axisDim
            : maxWidth + labelUtils.AXIS_DEFAULTS.labelGap < axisMaxDim - axisDim;
    const getAxisPos = (index) => {
        return scale$1.transform(startIndex + index);
    };
    let labelDims = 0;
    if (isLabelRendered) {
        labelUtils.updateLabelsDims(maxWidth, maxHeight, tickLabels, getAxisPos, availSpace, position);
        labelDims = isHoriz ? maxHeight + labelUtils.AXIS_DEFAULTS.labelGap : maxWidth + labelUtils.AXIS_DEFAULTS.labelGap;
    }
    tickLabels.forEach((label) => {
        label['dataProps'] = {
            'data-oj-object': 'group',
            'data-oj-group-index': label.index.toString(),
            'data-oj-text': label.isTruncated ? label.text : undefined
        };
    });
    return {
        title: isTitleRendered ? groupAxis?.title : undefined,
        titleProps: isTitleRendered ? titleProps : undefined,
        titleStyle,
        tickLabels,
        tickLabelStyle,
        axisDim: isTitleRendered ? labelDims + axisDim : labelDims,
        scale: scale$1,
        groupWidth
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const OUTER_GAP_WIDTH = 10;
const OUTER_GAP_HEIGHT = 8;
const MIN_SCROLL_SIZE = 12;
const SCROLL_GAP = 6;
/**
 * Returns the chart layout info.
 * @returns
 */
function getLayoutInfo(series, groups, getDataItem, xAxis, yAxis, availSpace, hiddenSet, hideAndShowBehavior, isHoriz, isRtl, isStacked, axisFontSize, offset, locale, getTextDimensions) {
    const isTimeAxis = xAxis?.timeAxisType != null;
    const { xAxisPosition, yAxisPosition } = getAxesPosition(yAxis, isHoriz, isRtl);
    let xAxisInfo;
    if (isTimeAxis) {
        const timeAxisRange = getStartAndEndTime(groups, series, getDataItem, xAxis);
        xAxisInfo = getTimeAxisInfo(groups, xAxis, offset, timeAxisRange);
    }
    else {
        xAxisInfo = getGroupAxisInfo(groups, xAxis, offset);
    }
    const { dataMax, dataMin, idToDataMap } = getDataExtent(series, groups, getDataItem, xAxisInfo.startIndex, xAxisInfo.endIndex, isStacked, hiddenSet, hideAndShowBehavior, yAxis);
    const yAxisInfo = new DataAxisInfo({ ...yAxis, dataMax, dataMin });
    const { axisDim: yDim } = getDataAxisProps(yAxisPosition, dimensionUtils.cloneDimension(availSpace), isRtl, locale, yAxis, yAxisInfo, axisFontSize, getTextDimensions);
    const isXAxisHoriz = xAxisPosition === 'bottom';
    // get updated available space for x axis.
    const { xSpace: xAvailSpace } = getSpaces(availSpace, xAxisPosition, yAxisPosition, isXAxisHoriz ? availSpace.height : availSpace.width, yDim);
    const { axisDim: xMaxDim, scale: xScale, groupWidth, ...xProps } = isTimeAxis
        ? getTimeAxisProps(groups, xAxisPosition, xAvailSpace, xAxisInfo.viewportMin, xAxisInfo.viewportMax, 
        // @ts-ignore
        xAxisInfo.averageInterval, isRtl, xAxis, axisFontSize, getTextDimensions)
        : getGroupAxisProps(groups, xAxisPosition, xAvailSpace, isRtl, xAxisInfo.viewportMin, xAxisInfo.viewportMax, xAxisInfo.startIndex, xAxisInfo.endIndex, isHoriz, xAxis, axisFontSize, getTextDimensions);
    // recalculate y axis props after the x axis.
    const { ySpace: newYSpace } = getSpaces(availSpace, xAxisPosition, yAxisPosition, xMaxDim, isXAxisHoriz ? availSpace.width : availSpace.height);
    const newYProps = getDataAxisProps(yAxisPosition, newYSpace, isRtl, locale, yAxis, yAxisInfo, axisFontSize, getTextDimensions);
    const { axisDim: yMaxDim, scale: yScale, ...yProps } = newYProps;
    const { plotAreaSpace } = getSpaces(availSpace, xAxisPosition, yAxisPosition, xMaxDim, yMaxDim);
    return {
        xViewportExtent: { viewportMin: xAxisInfo.viewportMin, viewportMax: xAxisInfo.viewportMax },
        xIndexExtent: { startIndex: xAxisInfo.startIndex, endIndex: xAxisInfo.endIndex },
        yViewportExtent: yAxisInfo.getAxisViewport(),
        yAxisExtent: yAxisInfo.getAxisExtent(),
        xAxisExtent: { min: xAxisInfo.min, max: xAxisInfo.max },
        xProps,
        xScale,
        xAxisPosition,
        groupWidth,
        yProps,
        yScale,
        yMaxDim,
        yAxisPosition,
        yMajorTicks: yAxisInfo.getTicks(),
        yMinorTicks: yAxisInfo.getMinorTicks(),
        plotAreaSpace,
        idToDataMap
    };
}
/**
 * Returns the available space for x axis and y axis.
 * @param availSpace The available space of the chart.
 * @param xAxisPosition The position of x axis.
 * @param yAxisPosition The position of y axis.
 * @param xMaxDim The max dimension of x axis.
 * @param yMaxDim The max dimension of y axis.
 * @returns
 */
function getSpaces(availSpace, xAxisPosition, yAxisPosition, xMaxDim, yMaxDim) {
    const isXHoriz = xAxisPosition === 'bottom' || xAxisPosition === 'top';
    const isYLeft = yAxisPosition === 'left';
    let xSpace;
    let ySpace;
    let plotAreaSpace;
    if (isXHoriz) {
        xSpace = getHorizSpace(availSpace, xAxisPosition, isYLeft ? yMaxDim : 0, !isYLeft ? yMaxDim : 0, xMaxDim);
        ySpace = getVertSpace(availSpace, yAxisPosition, xAxisPosition === 'bottom' ? xMaxDim : 0, xAxisPosition === 'top' ? xMaxDim : 0, yMaxDim);
        plotAreaSpace = {
            x: xSpace.x,
            y: ySpace.y,
            width: xSpace.width,
            height: ySpace.height
        };
    }
    else {
        xSpace = getVertSpace(availSpace, xAxisPosition, yAxisPosition === 'bottom' ? yMaxDim : 0, yAxisPosition === 'bottom' ? 0 : yMaxDim, xMaxDim);
        ySpace = getHorizSpace(availSpace, yAxisPosition, xAxisPosition === 'left' ? xMaxDim : 0, xAxisPosition === 'left' ? 0 : xMaxDim, yMaxDim);
        plotAreaSpace = {
            x: ySpace.x,
            y: xSpace.y,
            width: ySpace.width,
            height: xSpace.height
        };
    }
    return { xSpace, ySpace, plotAreaSpace };
}
/**
 * Returns the vertical sub section of given available space.
 * @param availSpace The available space.
 * @param position The position of the vertical section.
 * @param bottomOffset The bottom offset of the vertical section.
 * @param topOffset The top offset of the vertical section.
 * @param width The width of the section.
 * @returns
 */
function getVertSpace(availSpace, position, bottomOffset, topOffset, width) {
    return {
        x: position === 'left' ? availSpace.x : availSpace.x + availSpace.width - width,
        width: width,
        y: availSpace.y + topOffset,
        height: availSpace.height - bottomOffset - topOffset
    };
}
/**
 * Returns the horizontal sub section of given available space.
 * @param availSpace The available space.
 * @param position The position of the horizontal section.
 * @param leftOffset The left offset of the horizontal section.
 * @param rightOffset The right offset of the horizontal section.
 * @param height The height of the section.
 * @returns
 */
function getHorizSpace(availSpace, position, leftOffset, rightOffset, height) {
    return {
        x: availSpace.x + leftOffset,
        width: availSpace.width - leftOffset - rightOffset,
        y: position === 'top' ? availSpace.y : availSpace.y + availSpace.height - height,
        height: height
    };
}
/**
 * Returns the outer spacing for the chart.
 * @param width The height of the chart.
 * @param height The width of the chart.
 * @returns
 */
function getOuterGaps(width, height) {
    const widthRatio = Math.min(width / 400, 1);
    const heightRatio = Math.min(height / 300, 1);
    return {
        width: widthRatio * OUTER_GAP_WIDTH,
        height: heightRatio * OUTER_GAP_HEIGHT
    };
}
/**
 * Returns the default available space for chart.
 * @param width The width of the chart.
 * @param height The height of the chart.
 * @returns
 */
function getAvailSpace(width, height) {
    const gaps = getOuterGaps(width, height);
    return {
        width: width - 2 * gaps.width,
        height: height - 2 * gaps.height,
        x: gaps.width,
        y: gaps.height
    };
}
/**
 * Retuns the available space for the scrollbar.
 * @param availSpace
 * @param zoomAndScroll
 * @param xAxisPosition
 * @returns
 */
function getScrollBarSpace(availSpace, zoomAndScroll, xAxisPosition) {
    const dims = { x: 0, y: 0, height: 0, width: 0 };
    const avSpace = dimensionUtils.cloneDimension(availSpace);
    if (zoomAndScroll === 'off') {
        return { scrollDims: dims, availSpace: avSpace };
    }
    if (xAxisPosition === 'left') {
        dims.x = availSpace.x;
        dims.y = availSpace.y;
        dims.width = MIN_SCROLL_SIZE;
        dims.height = availSpace.height;
        avSpace.x += dims.width + SCROLL_GAP;
        avSpace.width -= dims.width + SCROLL_GAP;
    }
    else if (xAxisPosition === 'right') {
        dims.x = availSpace.x + availSpace.width - MIN_SCROLL_SIZE;
        dims.width = MIN_SCROLL_SIZE;
        dims.height = availSpace.height;
        dims.y = availSpace.y;
        avSpace.width -= dims.width + SCROLL_GAP;
    }
    else {
        dims.x = availSpace.x;
        dims.y = availSpace.y + availSpace.height - MIN_SCROLL_SIZE;
        dims.height = MIN_SCROLL_SIZE;
        dims.width = availSpace.width;
        avSpace.height -= dims.height + SCROLL_GAP;
    }
    return { scrollDims: dims, availSpace: avSpace };
}
/**
 * Updates the scrollbar space
 * @param availSpace
 * @param isHoriz
 * @param yMaxDim
 */
function updateScrollBarSpace(availSpace, isHoriz, isRtl, yMaxDim) {
    const newDims = dimensionUtils.cloneDimension(availSpace);
    if (isHoriz) {
        newDims.width -= yMaxDim;
        newDims.x += isRtl ? 0 : yMaxDim;
    }
    else {
        newDims.height -= yMaxDim;
    }
    return newDims;
}
function findNearestDataPoint(series, groups, xScale, yScale, getDataItem, isStacked, getSeriesDataInfo, getYCoord, isLog, dataItemGaps, hiddenIds, timeAxisType) {
    return (x, y) => {
        let candidates = [];
        let neareastGroupIndex = Math.round(x);
        let groupCenter = xScale.transform(neareastGroupIndex);
        const isMixedFrequency = timeAxisType === 'mixedFrequency';
        if (timeAxisType === 'enabled' || timeAxisType === 'skipGaps') {
            neareastGroupIndex = findNearestRegularAxisIndex(x, groups, series, getDataItem);
            groupCenter = xScale.transform(getTime(groups[neareastGroupIndex].id));
        }
        candidates = series.map((_, sIndex) => ({
            groupIndex: neareastGroupIndex,
            seriesIndex: sIndex
        }));
        if (isMixedFrequency) {
            candidates = getNearestMixedFrequencyDataItem(x, series, groups, getDataItem);
        }
        let posCummValue = 0;
        let negCummValue = 0;
        let minDistance = Number.MAX_VALUE;
        let minDistanceDims2 = Number.MAX_VALUE;
        let minSeriesIndex = 0;
        let minSeriesCenter = groupCenter;
        let yCoord;
        // Currently this logic is aware of various chart settings. Another approach is
        // purely geometric (save dims of each chart item and sort by some distance measure).
        // Not sure which one is faster but can consider for performance evaluation.
        candidates.forEach(({ seriesIndex, groupIndex }) => {
            const item = getDataItem(seriesIndex, groupIndex);
            if (!item || hiddenIds?.has(item.id) || item.value == null || (isLog && item.value <= 0)) {
                return;
            }
            let dist = 0;
            let dist2 = 0;
            if (isMixedFrequency) {
                dist = Math.abs(xScale.transform(getTime(item?.x)) - xScale.transform(x));
                dist2 = Math.abs(yScale.transform(item.value) - yScale.transform(y));
            }
            else if (!isStacked) {
                const { offset, dataWidth } = getSeriesDataInfo(seriesIndex);
                const seriesCenter = offset + groupCenter + dataWidth / 2;
                if (dataWidth === 0) {
                    dist = Math.abs(yScale.transform(item.value) - yScale.transform(y));
                }
                else {
                    dist = Math.abs(xScale.transform(x) - seriesCenter);
                    if (dist < minDistance) {
                        minSeriesCenter = seriesCenter;
                    }
                }
            }
            else {
                const itemY = (item.value < 0 ? negCummValue : posCummValue) + item.value / 2;
                dist = Math.abs(y - itemY);
            }
            if (dist < minDistance) {
                minDistance = dist;
                minSeriesIndex = seriesIndex;
                neareastGroupIndex = groupIndex;
                yCoord = getYCoord(item.value, yScale, isStacked, isLog, dataItemGaps, negCummValue, posCummValue);
                if (isMixedFrequency) {
                    minDistanceDims2 = dist2;
                }
            }
            else if (dist === minDistance) {
                if (isMixedFrequency && dist2 < minDistanceDims2) {
                    minDistance = dist;
                    minSeriesIndex = seriesIndex;
                    neareastGroupIndex = groupIndex;
                    minDistanceDims2 = dist2;
                    yCoord = getYCoord(item.value, yScale, isStacked, isLog, dataItemGaps, negCummValue, posCummValue);
                }
            }
            if (isStacked) {
                posCummValue += item.value > 0 ? item.value : 0;
                negCummValue += item.value < 0 ? item.value : 0;
            }
        });
        return {
            seriesIndex: minSeriesIndex,
            groupIndex: neareastGroupIndex,
            y: yCoord,
            x: isMixedFrequency
                ? xScale.transform(getTime(getDataItem(minSeriesIndex, neareastGroupIndex)?.x))
                : isStacked
                    ? groupCenter
                    : minSeriesCenter
        };
    };
}
function getGroupCenterCoord(group, groupIndex, xScale, item, timeAxisType) {
    if (!timeAxisType) {
        return xScale.transform(groupIndex);
    }
    else if (timeAxisType === 'mixedFrequency') {
        return xScale.transform(new Date(item.x).getTime());
    }
    else {
        return xScale.transform(new Date(group.id).getTime());
    }
}
function getMixedFreqGroupCenter(xScale, item) {
    return xScale.transform(new Date(item.x).getTime());
}

exports.findNearestDataPoint = findNearestDataPoint;
exports.getAvailSpace = getAvailSpace;
exports.getAxesPosition = getAxesPosition;
exports.getGroupCenterCoord = getGroupCenterCoord;
exports.getLayoutInfo = getLayoutInfo;
exports.getMixedFreqGroupCenter = getMixedFreqGroupCenter;
exports.getScrollBarSpace = getScrollBarSpace;
exports.updateScrollBarSpace = updateScrollBarSpace;
//# sourceMappingURL=layoutUtils-25201abd.js.map
