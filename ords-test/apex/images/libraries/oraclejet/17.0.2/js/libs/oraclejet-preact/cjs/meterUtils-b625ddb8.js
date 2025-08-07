/* @oracle/oraclejet-preact: undefined */
'use strict';

var utils$1 = require('./utils-395027fe.js');
var utils = require('./utils-b7099be5.js');

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Validates the min, max, value and step passed to the meter are in appropriate range.
 * @throws { RangeError }
 * @param min The minimum value of the meter.
 * @param max The maximum value of the meter.
 * @param value The metric value of the meter.
 * @param step The step value of the meter.
 */
function validateRange(min, max, value, step) {
    if (min > max) {
        throw new RangeError('The min must be lower or equal to max.');
    }
    if (value < min || value > max) {
        throw new RangeError('The value must be between min and max.');
    }
    if (step > max - min) {
        throw new RangeError('The step value must be less than the difference of max and min');
    }
}
/**
 * Returns the threshold that the current value belongs to. Returns undefined if the current value does not belong to
 * any threshold or if thresholds is undefined.
 * @param value The value in meter.
 * @param thresholds The list of thresholds.
 * @returns The Threshold that current value belongs to.
 */
function findThreshold(value, thresholds) {
    if (!thresholds) {
        return;
    }
    if (value <= thresholds[0].max) {
        return thresholds[0];
    }
    let minValue = thresholds[0].max;
    for (let i = 1; i < thresholds.length; i++) {
        if (minValue < value && value <= thresholds[i].max) {
            return thresholds[i];
        }
        minValue = thresholds[i].max;
    }
    return;
}
/**
 * Returns the color of track for the meter.
 * @param trackColor The color provided via trackColor prop of the meter.
 * @param thresholdDisplay  Specifies whether current threshold to display in track, indicator or all thresholds in track.
 * @param currentThreshold Current threshold for the meter value.
 * @returns The color of the track for the meter.
 */
function getTrackColor(thresholdDisplay, currentThreshold, trackColor) {
    if (thresholdDisplay === 'track' && currentThreshold?.color) {
        return utils$1.getVisThresholdColor(currentThreshold?.color);
    }
    return trackColor;
}
/**
 * Returns the color of indicator for the meter.
 * @param indicatorColor The color provided via indicatorColor prop of the meter.
 * @param thresholdDisplay  Specifies whether current threshold to display in track, indicator or all thresholds in track.
 * @param currentThreshold Current threshold for the meter value.
 * @returns The color of the indicator of the meter.
 */
function getIndicatorColor(thresholdDisplay, currentThreshold, indicatorColor) {
    if (currentThreshold?.color && thresholdDisplay === 'indicator') {
        return utils$1.getVisThresholdColor(currentThreshold.color);
    }
    return indicatorColor;
}
/**
 * Returns the color of track and indicator of the meter.
 * @param value The value of the meter.
 * @param trackColor The color provided via trackColor prop.
 * @param indicatorColor The color provided via indicatorColor prop.
 * @param thresholdDisplay Specifies whether current threshold to display in track, indicator or all thresholds in track.
 * @param thresholds The thresholds for metric value of the meter.
 * @returns The color of the indicator and track of the meter.
 */
function getTrackAndIndicatorColor(value, thresholdDisplay, trackColor, indicatorColor, thresholds) {
    const currentThreshold = findThreshold(value, thresholds);
    return {
        trackColor: getTrackColor(thresholdDisplay, currentThreshold, trackColor),
        indicatorColor: getIndicatorColor(thresholdDisplay, currentThreshold, indicatorColor)
    };
}
/**
 * Returns the aria properties of the meter bar.
 * @param value The value of the meter bar.
 * @param min The minimum value of the meter bar.
 * @param max The maximum value of the meter bar.
 * @param ariaLabel The aria label of the meter bar.
 * @param ariaLabelledby The ariaLabelledBy of the meter bar.
 * @param thresholds The thresholds values for the meter bar.
 * @param isDisabled The gauge is disabled or not.
 * @param isReadonly the gauge is readonly or not.
 * @param tooltip The tooltip values for the rating gauge.
 * @returns The aria properties of the meter
 */
function getMeterAriaProps(value, min, max, ariaLabel, ariaLabelledby, thresholds, isDisabled, isReadonly, tooltip) {
    const currentThreshold = findThreshold(value, thresholds);
    const ariaValueText = currentThreshold?.accessibleLabel
        ? `${value} ${currentThreshold.accessibleLabel}`
        : `${value}`;
    const ariaLabelText = ariaLabel
        ? ariaLabel
        : tooltip && isReadonly && !isDisabled
            ? tooltip
            : undefined;
    return {
        'aria-label': ariaLabelText,
        'aria-valuenow': value,
        'aria-valuemin': min,
        'aria-valuetext': ariaValueText,
        'aria-valuemax': max,
        'aria-labelledby': ariaLabelledby,
        'aria-disabled': isDisabled ? true : undefined,
        'aria-readonly': isReadonly && !isDisabled ? true : undefined,
        role: 'slider'
    };
}
/**
 * Returns the threshold color that the current value belongs to. Returns component color if the current value does not belong to
 * any threshold or if thresholds is undefined.
 * @param value The value in meter.
 * @param thresholds The list of thresholds.
 * @returns The threshold color that current value belongs to.
 */
function getThresholdColorFromValue(value, color, thresholds) {
    const currentThreshold = findThreshold(value, thresholds);
    if (currentThreshold?.color) {
        return currentThreshold?.color;
    }
    return color;
}
/**
 * Returns the resolved values for the legend vars.
 */
[
    {
        tokenVar: utils.xUnits(1),
        key: 'unit',
        cssProp: 'padding'
    }
];

exports.findThreshold = findThreshold;
exports.getMeterAriaProps = getMeterAriaProps;
exports.getThresholdColorFromValue = getThresholdColorFromValue;
exports.getTrackAndIndicatorColor = getTrackAndIndicatorColor;
exports.validateRange = validateRange;
//# sourceMappingURL=meterUtils-b625ddb8.js.map
