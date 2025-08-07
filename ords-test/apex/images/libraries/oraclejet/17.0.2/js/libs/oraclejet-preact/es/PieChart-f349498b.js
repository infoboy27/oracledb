/* @oracle/oraclejet-preact: undefined */
import { jsxs, jsx } from 'preact/jsx-runtime';
import { styles, dimensionStyle } from './UNSAFE_PieChart/themes/PieChartStyles.css.js';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { m as moveTo, a as arcTo, l as lineTo, b as closePath } from './pathUtils-1a478322.js';
import { c as getAvailSpace } from './layoutUtils-c9c5367a.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as usePieChartNav } from './usePieChartNav-c37eaae7.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { V as VisTabularDatatip } from './VisTabularDatatip-1f16ca1f.js';
import { g as getColorRamp } from './colorUtils-9c7b574c.js';
import './accUtils-dc32d20b.js';
import { u as useUser } from './useUser-99920e02.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { useRef } from 'preact/hooks';
import { m as merge } from './stringUtils-16f617bc.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const RADIUS_RATIO = 0.45;
const RADIUS_RATIO_WITH_LABELS = 0.38;
const SLICE_GAP_RATIO = 3;
const MIN_ARC_LENGTH = 1.5;
const START_ANGLE = 90;
/**
 * Converts the angle from degrees to radians.
 * @param degree The angle in degrees
 * @returns
 */
function degreesToRads(degree) {
    return degree * (Math.PI / 180);
}
/**
 * Calculates the angle between two vectors.
 * @param vector1X The x component of first vector.
 * @param vector1Y The y component of first vector.
 * @param vector2X The x component of second vector.
 * @param vector2Y The y component of second vector.
 * @returns
 */
function calculateAngleBetweenTwoVectors(vector1X, vector1Y, vector2X, vector2Y) {
    const angle = Math.atan2(vector2Y, vector2X) - Math.atan2(vector1Y, vector1X);
    return angle < 0 ? angle + 2 * Math.PI : angle;
}
/**
 * Get the center coord of the pie chart.
 * @param availSpace The available space.
 * @returns
 */
function getPieCenter(availSpace) {
    return {
        cx: availSpace.x + Math.floor(availSpace.width / 2),
        cy: availSpace.y + Math.floor(availSpace.height / 2)
    };
}
/**
 * Returns the radius of the pie chart.
 * @param availSpace The available space.
 * @param labelPosition The position of labels.
 * @returns
 */
function getRadius(availSpace, isLabelOutside) {
    const radiusScale = isLabelOutside ? RADIUS_RATIO_WITH_LABELS : RADIUS_RATIO;
    return Math.floor(Math.min(availSpace.width, availSpace.height) * radiusScale);
}
/**
 * Returns the total value of the pie chart.
 * @param items
 */
function getPieChartInfo(items) {
    return items.reduce(({ totalValue, isLabelOutside }, item) => {
        return {
            totalValue: totalValue + item.value,
            isLabelOutside
        };
    }, { totalValue: 0, isLabelOutside: false });
}
/**
 * Returns the startAngle and angleOffset for the rendered items.
 * @param items
 * @param totalValue
 */
function getSliceInfo(items, totalValue) {
    let anchorOffset = START_ANGLE;
    let percentage;
    const sliceInfo = [];
    for (let i = 0; i < items.length; i++) {
        const item = items[i];
        const value = item.value;
        if (value === totalValue) {
            percentage = 100;
        }
        else if (totalValue === 0) {
            percentage = 0;
        }
        else {
            // if value is not 100%, cap it at 99.99%
            percentage = Math.min((value / totalValue) * 100, 99.99);
        }
        const arc = percentage * 3.6;
        let angle = anchorOffset - arc;
        if (angle < 0)
            angle += 360;
        sliceInfo.push({
            index: i,
            startAngle: angle,
            angleExtent: arc,
            ...item
        });
        anchorOffset = angle;
    }
    return sliceInfo;
}
/**
 * Returns the pie slice gaps.
 * @param  pieSliceGap The ratio of maximum supported pie slice gap.
 * @returns
 */
function getPieSliceGap(pieSliceGap) {
    return SLICE_GAP_RATIO * pieSliceGap;
}
/**
 * Returns the array of layouts to render without skipping.
 * @param layouts
 * @param hasLargeItemCount
 * @param radius
 * @returns
 */
function getRenderedSlices(itemInfo, hasLargeItemCount, radius) {
    if (!hasLargeItemCount) {
        return itemInfo;
    }
    const perimeter = 2 * Math.PI * radius;
    let prevEndCoord = 0;
    return itemInfo.filter(({ startAngle, angleExtent }) => {
        const arcLength = (angleExtent / 360) * perimeter;
        const endCoord = ((angleExtent + startAngle) / 360) * perimeter;
        if (arcLength < MIN_ARC_LENGTH && Math.abs(prevEndCoord - endCoord) < MIN_ARC_LENGTH) {
            return false;
        }
        else {
            prevEndCoord = endCoord;
            return true;
        }
    });
}
/**
 * Returns the path of the pie slice wedge.
 * @param inset The inset.
 * @param cx The x coordinate of the center of the pie chart.
 * @param cy The y coordinate of the center of the pie chart.
 * @param radiusX The x radius of the slice.
 * @param radiusY The y radius of the slice.
 * @param innerRadius The inner radius.
 * @param angleExtent The angle extent.
 * @param wedgeGap The gap beteen the pie slices.
 * @param startAngle The start angle of the pie slice.
 * @returns
 */
function makeWedgePath(inset, cx, cy, radiusX, radiusY, innerRadius, angleExtent, wedgeGap, startAngle) {
    const rx = Math.max(radiusX - inset, 0);
    const ry = Math.max(radiusY - inset, 0);
    const gap = angleExtent == 360 || rx < inset ? 0 : wedgeGap + 2 * inset;
    const ir = innerRadius ? innerRadius + inset : 0;
    // if angle extent is not 360, cap it  at 359.99
    const angleExtentRads = angleExtent == 360 ? degreesToRads(359.99) : degreesToRads(angleExtent);
    const startAngleRads = degreesToRads(startAngle);
    const dataItemGaps = gap / 2;
    const gapAngle = dataItemGaps < rx ? Math.asin(dataItemGaps / rx) : 0;
    const centerLineAngle = -angleExtentRads / 2 - startAngleRads;
    // cap at 5* dataItemsGap. logic from legacy dvt toolkit
    const distanceToStartPointX = Math.min(dataItemGaps * 5, angleExtentRads > 0 ? Math.abs(dataItemGaps / Math.sin(angleExtentRads / 2)) : 0);
    const distanceToStartPointY = rx == 0 ? distanceToStartPointX : (distanceToStartPointX * ry) / rx;
    const startPointX = cx + Math.cos(centerLineAngle) * distanceToStartPointX;
    const startPointY = cy + Math.sin(centerLineAngle) * distanceToStartPointY;
    const arcPointX = cx + Math.cos(-gapAngle - startAngleRads) * rx;
    const arcPointY = cy + Math.sin(-gapAngle - startAngleRads) * ry;
    const arcPoint2X = cx + Math.cos(-startAngleRads - angleExtentRads + gapAngle) * rx;
    const arcPoint2Y = cy + Math.sin(-startAngleRads - angleExtentRads + gapAngle) * ry;
    let outerAngle = calculateAngleBetweenTwoVectors(arcPoint2X - cx, arcPoint2Y - cy, arcPointX - cx, arcPointY - cy);
    outerAngle = Math.min(outerAngle, angleExtentRads);
    let pathCommands;
    if (ir > 0) {
        const innerGapAngle = dataItemGaps < ir ? Math.asin(dataItemGaps / ir) : 0;
        const innerPointX = cx + Math.cos(-innerGapAngle - startAngleRads) * ir;
        const innerPointY = cy + Math.sin(-innerGapAngle - startAngleRads) * ir;
        const innerPoint2X = cx + Math.cos(-startAngleRads - angleExtentRads + innerGapAngle) * ir;
        const innerPoint2Y = cy + Math.sin(-startAngleRads - angleExtentRads + innerGapAngle) * ir;
        let innerAngle = calculateAngleBetweenTwoVectors(innerPoint2X - cx, innerPoint2Y - cy, innerPointX - cx, innerPointY - cy);
        innerAngle = Math.min(innerAngle, outerAngle, angleExtentRads);
        if (angleExtent == 360) {
            pathCommands = moveTo(arcPoint2X, arcPoint2Y);
            pathCommands += arcTo(rx, ry, angleExtentRads, 1, arcPointX, arcPointY);
            pathCommands += lineTo(arcPoint2X, arcPoint2Y);
            pathCommands += moveTo(innerPointX, innerPointY);
            pathCommands += arcTo(ir, ir, angleExtentRads, 0, innerPoint2X, innerPoint2Y);
        }
        else {
            pathCommands = moveTo(innerPoint2X, innerPoint2Y);
            pathCommands += lineTo(arcPoint2X, arcPoint2Y);
            pathCommands += arcTo(rx, ry, outerAngle, 1, arcPointX, arcPointY);
            pathCommands += lineTo(innerPointX, innerPointY);
            pathCommands += arcTo(ir, ir, innerAngle, 0, innerPoint2X, innerPoint2Y);
        }
    }
    else {
        if (angleExtent == 360) {
            pathCommands = moveTo(arcPoint2X, arcPoint2Y);
            pathCommands += arcTo(rx, ry, angleExtentRads, 1, arcPointX, arcPointY);
        }
        else {
            pathCommands = moveTo(startPointX, startPointY);
            pathCommands += lineTo(arcPoint2X, arcPoint2Y);
            pathCommands += arcTo(rx, ry, outerAngle, 1, arcPointX, arcPointY);
        }
    }
    pathCommands += closePath();
    return pathCommands;
}
/**
 * Returns the pie chart center context.
 * @param cx The x coordinate of the center of the pie chart.
 * @param cy The y coordinate of the center of the pie chart.
 * @param innerRadius The inner radius of the pie chart.
 * @returns
 */
function getCenterContext(cx, cy, innerRadius) {
    return {
        innerBounds: {
            width: Math.sqrt(2) * innerRadius,
            height: Math.sqrt(2) * innerRadius,
            x: cx - innerRadius / Math.sqrt(2),
            y: cy - innerRadius / Math.sqrt(2)
        },
        outerBounds: {
            width: 2 * innerRadius,
            height: 2 * innerRadius,
            x: cx - innerRadius,
            y: cy - innerRadius
        }
    };
}
/**
 * Returns the position of the datatip for a given slice.
 * @param startAngle The start angle of the pie slice.
 * @param angleExtent The angle extent of the pie slice.
 * @param cx The x coordinate of the center of the pie slice.
 * @param cy The y coordinate of the center of the pie slice.
 * @param innerRadius The inner radius.
 * @param radius The radius of the pie slice.
 * @returns
 */
function getPieItemCenterCoord(startAngle, angleExtent, cx, cy, innerRadius, radius) {
    const angle = startAngle + angleExtent / 2;
    const theta = (angle / 180) * Math.PI;
    const r = (innerRadius + radius) / 2;
    return {
        x: cx + r * Math.cos(theta),
        y: cy - r * Math.sin(theta),
        width: 0,
        height: 0
    };
}
/**
 * Returns the element bound for active item.
 * @param renderedSlices The array of info for rendered slices.
 * @param cx The x coordinate of pie chart center.
 * @param cy The y coordinate of pie chart center.
 * @param ir The inner radius of the pie chart.
 * @param radius The radius of the pie chart.
 * @param activeItem The active item.
 * @returns
 */
function getElementBounds(renderedSlices, cx, cy, ir, radius, activeItem) {
    return activeItem
        ? getPieItemCenterCoord(renderedSlices[activeItem.itemIndex].startAngle, renderedSlices[activeItem.itemIndex].angleExtent, cx, cy, ir, radius)
        : undefined;
}
/**
 * Returns default border color for datatip.
 * @param colors The color ramp.
 * @param activeItem The active item info.
 * @param activeData The active pie chart data item.
 * @returns
 */
function getDefaultBorderColor(colors, activeItem, activeData) {
    return activeData?.color || activeItem?.itemIndex != undefined
        ? colors[activeItem.itemIndex]
        : undefined;
}

/**
 * The Pie Slice component.
 */
function PieSlice({ cx, cy, r, startAngle, angleExtent, gap, innerRadius, color, id, itemIndex, isFocused = false, isHovered = false, ...props }) {
    const path = makeWedgePath(0, cx, cy, r, r, innerRadius, angleExtent, gap, startAngle);
    let innerPath;
    if (isFocused) {
        innerPath = makeWedgePath(2, cx, cy, r, r, innerRadius, angleExtent, gap, startAngle);
        return (jsxs("g", { id: id, role: props.accessibleLabel ? 'img' : undefined, "data-oj-item-index": itemIndex, "data-oj-object": "pieSlice", "aria-label": props.accessibleLabel, children: [jsx("path", { d: path, fill: color, stroke: color, className: styles.innerShapes }), jsx("path", { d: innerPath, fill: color, className: classNames([styles.contrastBorder, styles.innerShapes]) })] }));
    }
    return (jsx("path", { role: props.accessibleLabel ? 'img' : undefined, "aria-label": props.accessibleLabel, d: path, "data-oj-object": "pieSlice", fill: color, id: id, "data-oj-item-index": itemIndex }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the nav util for pie chart.
 * @param data
 * @param isRtl
 * @returns
 */
function getPieChartNavUtils(data, isRtl) {
    const getNextChartItem = ({ itemIndex }, arrow) => {
        let newItemIndex = itemIndex;
        if ((isRtl && (arrow === 'ArrowRight' || arrow === 'ArrowUp')) ||
            (!isRtl && (arrow === 'ArrowLeft' || arrow === 'ArrowDown'))) {
            newItemIndex = itemIndex - 1;
        }
        else {
            newItemIndex = itemIndex + 1;
        }
        return {
            itemIndex: ((newItemIndex % data.length) + data.length) % data.length
        };
    };
    return getNextChartItem;
}

const NUM_PIE_SLICE_THRESHOLD = 100;
function PieChartWithDimensions({ width, height, testId, innerRadius = 0, ...props }) {
    const rootRef = useRef(null);
    const colors = getColorRamp();
    const { totalValue, isLabelOutside } = getPieChartInfo(props.data);
    const sliceInfos = getSliceInfo(props.data, totalValue);
    // default data item gaps is 0.5. TODO: replace 0.5 with pie dataItemGaps/pieSliceGaps
    const pieSliceGap = getPieSliceGap(0.5);
    const hasLargeSeriesCount = props.data.length > NUM_PIE_SLICE_THRESHOLD;
    const { direction } = useUser();
    const testIdProps = useTestId(testId);
    const availSpace = getAvailSpace(width, height);
    const { cx, cy } = getPieCenter(availSpace);
    const radius = getRadius(availSpace, isLabelOutside);
    const ir = innerRadius * radius;
    const renderedSlices = getRenderedSlices(sliceInfos, hasLargeSeriesCount, radius);
    const getNextChartItem = getPieChartNavUtils(renderedSlices, direction === 'rtl');
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({
        type: 'auto',
        supportsTouchDragGestures: false,
        rootRef
    });
    const { activeId, navProps, focusedItemInfo, hoveredItemInfo } = usePieChartNav({
        touchResponse,
        getNextChartItem
    });
    const activeItem = focusedItemInfo.isFocusVisible ? focusedItemInfo : hoveredItemInfo;
    const activeData = activeItem
        ? props.data[renderedSlices[activeItem.itemIndex].index]
        : undefined;
    const defaultDatatip = (activeData, activeItem) => {
        if (!activeData) {
            return {
                content: undefined,
                borderColor: undefined
            };
        }
        if (activeData.accessibleLabel) {
            return {
                content: activeData.accessibleLabel,
                borderColor: getDefaultBorderColor(colors, activeItem, activeData)
            };
        }
        return {
            content: (jsx(VisTabularDatatip, { tableData: [
                    {
                        key: 'Value',
                        value: activeData.value
                    }
                ] })),
            borderColor: getDefaultBorderColor(colors, activeItem, activeData)
        };
    };
    const { content: datatipString, borderColor } = activeData && props.datatip
        ? props.datatip({ data: activeData })
        : defaultDatatip(activeData, activeItem);
    const anchor = focusedItemInfo.isFocusVisible ? 'element' : 'pointer';
    const elementBounds = activeItem?.isFocusVisible
        ? getElementBounds(renderedSlices, cx, cy, ir, radius, activeItem)
        : undefined;
    const { datatipContent, datatipProps } = useDatatip({
        content: datatipString,
        offset: calculateOffset(direction === 'rtl', width, elementBounds),
        anchor,
        placement: 'top-start',
        borderColor,
        touchResponse
    });
    datatipProps['aria-describedby'] = merge([
        props['aria-describedby'],
        datatipProps['aria-describedby']
    ]);
    const mergedProps = mergeProps(navProps, datatipProps);
    return (jsxs("div", { ref: rootRef, tabIndex: 0, "aria-label": props['aria-label'], "aria-labelledby": props['aria-labelledby'], "aria-activedescendant": activeId, role: "application", ...mergedProps, ...testIdProps, className: styles.chart, style: {
            width,
            height,
            ...touchResponseStyle
        }, children: [renderedSlices.length > 0 && (jsx("svg", { className: styles.svg, children: renderedSlices.map((item, index) => {
                    return (jsx(PieSlice, { cx: cx, cy: cy, itemIndex: index, id: focusedItemInfo.itemIndex === index ? activeId : undefined, isFocused: focusedItemInfo?.itemIndex === index && focusedItemInfo?.isFocusVisible, isHovered: hoveredItemInfo?.itemIndex === index, r: radius, startAngle: item.startAngle, gap: pieSliceGap, innerRadius: ir, angleExtent: item.angleExtent, color: item.color || colors[index % colors.length], accessibleLabel: item.accessibleLabel }, item.id));
                }) })), props.children?.(getCenterContext(cx, cy, ir)), datatipContent] }));
}

/**
 * Pie charts are useful for visualizing parts of a whole, but do not display zero or negative values so they are not recommended for data sets that may have negative or null data
 */
function PieChart({ width, height, ...props }) {
    return (jsx(TrackResizeContainer, { width: width, height: height, class: dimensionStyle, children: (width, height) => jsx(PieChartWithDimensions, { width: width, height: height, ...props }) }));
}

export { PieChart as P };
//# sourceMappingURL=PieChart-f349498b.js.map
