/* @oracle/oraclejet-preact: undefined */
import { a as getElementData } from './eventsUtils-d544e874.js';
import './accUtils-dc32d20b.js';
import { useRef } from 'preact/hooks';
import { u as usePinch } from './usePinch-c57ee02b.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getAxisBoundsByDelta(xViewportExtent, xAxisExtent, yViewportExtent, yAxisExtent, xScale, yScale, xMin, xMax, yMin, yMax, isRtl, isHoriz) {
    const { viewportMin: xViewportMin, viewportMax: xViewportMax } = xViewportExtent;
    const { min: xAxisMin, max: xAxisMax } = xAxisExtent;
    const { viewportMin: yViewportMin, viewportMax: yViewportMax } = yViewportExtent;
    const { min: yAxisMin, max: yAxisMax } = yAxisExtent;
    const deltas = convertToAxisCoord(xMin, xMax, yMin, yMax, isRtl, isHoriz);
    const xExtents = getAxisMinMaxByDelta(xViewportMin, xViewportMax, xAxisMin, xAxisMax, xScale, deltas['xMin'], deltas['xMax']);
    const yExtents = getAxisMinMaxByDelta(yViewportMin, yViewportMax, yAxisMin, yAxisMax, yScale, deltas['yMin'], deltas['yMax']);
    return { xExtents, yExtents };
}
function convertToAxisCoord(xMin, xMax, yMin, yMax, isRtl, isHoriz) {
    const axisCoord = {};
    if (isHoriz) {
        axisCoord['xMin'] = yMin;
        axisCoord['xMax'] = yMax;
        axisCoord['yMin'] = isRtl ? xMax : xMin;
        axisCoord['yMax'] = isRtl ? xMin : xMax;
    }
    else {
        axisCoord['xMin'] = isRtl ? xMax : xMin;
        axisCoord['xMax'] = isRtl ? xMin : xMax;
        axisCoord['yMin'] = yMax;
        axisCoord['yMax'] = yMin;
    }
    return axisCoord;
}
function getAxisMinMaxByDelta(viewportMin, viewportMax, globalMin, globalMax, axisScale, minDelta, maxDelta) {
    const minDeltaVal = axisScale.invert(minDelta) - axisScale.invert(0);
    const maxDeltaVal = axisScale.invert(maxDelta) - axisScale.invert(0);
    let weight = 1;
    const newExtent = viewportMax + maxDeltaVal - (viewportMin + minDeltaVal);
    const minExtent = 1; //axisInfo.getMinExtent();
    if (minDelta != maxDelta && newExtent < minExtent)
        weight = (viewportMax - viewportMin - minExtent) / (minDeltaVal - maxDeltaVal);
    viewportMin += minDeltaVal * weight;
    viewportMax += maxDeltaVal * weight;
    // Limit to global min/max
    if (viewportMax - viewportMin >= globalMax - globalMin) {
        viewportMin = globalMin;
        viewportMax = globalMax;
    }
    else if (viewportMin < globalMin) {
        viewportMax += globalMin - viewportMin;
        viewportMin = globalMin;
    }
    else if (viewportMax > globalMax) {
        viewportMin -= viewportMax - globalMax;
        viewportMax = globalMax;
    }
    return { viewportMin, viewportMax };
}
function getAxisMinMaxDrag(offsetX, offsetY, plotAreaSpace, xViewportExtent, xAxisExtent, isHoriz, isRtl) {
    const deltaX = isRtl ? plotAreaSpace.width - offsetX : offsetX - plotAreaSpace.x;
    const deltaY = offsetY - plotAreaSpace.y;
    const deltaV = xViewportExtent.viewportMax - xViewportExtent.viewportMin;
    const delta = (isHoriz ? deltaY : deltaX) *
        ((xAxisExtent.max - xAxisExtent.min) / (isHoriz ? plotAreaSpace.height : plotAreaSpace.width));
    let xMin = delta - deltaV / 2;
    let xMax = delta + deltaV / 2;
    if (xMin < xAxisExtent.min) {
        xMin = xAxisExtent.min;
        xMax = xMin + deltaV;
    }
    if (xMax > xAxisExtent.max) {
        xMin = xAxisExtent.max - deltaV;
        xMax = xAxisExtent.max;
    }
    return {
        xMin,
        xMax
    };
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const VIEWPORT_SCALE = 0.05;
function useChartViewport({ plotAreaSpace, xViewportExtent, xAxisExtent, yAxisExtent, yViewportExtent, yScale, xScale, onViewportChange, isHoriz, zoomAndScroll, isRtl, rootRef }) {
    const isPointerClicked = useRef(false);
    const handleViewportChange = (delta, origin) => {
        const deltaXMin = delta * (origin.x - plotAreaSpace.x);
        const deltaXMax = -delta * (plotAreaSpace.x + plotAreaSpace.width - origin.x);
        const deltaYMin = delta * (origin.y - plotAreaSpace.y);
        const deltaYMax = -delta * (plotAreaSpace.y + plotAreaSpace.height - origin.y);
        const extents = getAxisBoundsByDelta(xViewportExtent, xAxisExtent, yViewportExtent, yAxisExtent, xScale, yScale, deltaXMin, deltaXMax, deltaYMin, deltaYMax, isRtl, isHoriz);
        onViewportChange?.({
            xMin: extents.xExtents.viewportMin,
            yMin: extents.yExtents.viewportMin,
            xMax: extents.xExtents.viewportMax,
            yMax: extents.yExtents.viewportMax
        });
    };
    const pinchProps = usePinch({
        captureTargetRef: rootRef,
        onPinchZoomChange: ({ delta, origin }) => {
            const d = (isHoriz ? 1 : -1) * -1 * delta * VIEWPORT_SCALE;
            handleViewportChange(d, origin);
        }
    });
    pinchProps.onPointerOut = undefined;
    const onWheel = (event) => {
        const delta = (isHoriz ? 1 : -1) * event.deltaY * VIEWPORT_SCALE;
        handleViewportChange(delta, { x: event.offsetX, y: event.offsetY });
        event.preventDefault();
    };
    const onKeyDown = (event) => {
        const key = event.key;
        const zoomIn = key === '+' || key === '=';
        const zoomOut = key === '-' || key === '_';
        if (!zoomIn && !zoomOut) {
            return;
        }
        const zoomRatio = zoomIn ? 1.5 : 1 / 1.5;
        const shiftRatio = (1 / zoomRatio - 1) / 2;
        const deltaXMin = -1 * shiftRatio * plotAreaSpace.width;
        const deltaXMax = shiftRatio * plotAreaSpace.width;
        const deltaYMin = -1 * shiftRatio * plotAreaSpace.height;
        const deltaYMax = shiftRatio * plotAreaSpace.height;
        const extents = getAxisBoundsByDelta(xViewportExtent, xAxisExtent, yViewportExtent, yAxisExtent, xScale, yScale, deltaXMin, deltaXMax, deltaYMin, deltaYMax, isRtl, isHoriz);
        onViewportChange?.({
            xMin: extents.xExtents.viewportMin,
            yMin: extents.yExtents.viewportMin,
            xMax: extents.xExtents.viewportMax,
            yMax: extents.yExtents.viewportMax
        });
    };
    const onPointerDown = (event) => {
        const obj = getElementData(rootRef, event.target);
        if (obj && obj['ojObject'] === 'scrollBar') {
            isPointerClicked.current = true;
            event.target.setPointerCapture(event.pointerId);
            const { xMin, xMax } = getAxisMinMaxDrag(event.offsetX, event.offsetY, plotAreaSpace, xViewportExtent, xAxisExtent, isHoriz, isRtl);
            onViewportChange?.({
                xMin,
                yMin: yViewportExtent.viewportMin,
                xMax,
                yMax: yViewportExtent.viewportMax
            });
        }
    };
    const onPointerUp = () => {
        isPointerClicked.current = false;
    };
    const onPointerMove = (event) => {
        if (!isPointerClicked.current) {
            return;
        }
        const obj = getElementData(rootRef, event.target);
        if (obj && obj['ojObject'] === 'scrollBar') {
            const { xMin, xMax } = getAxisMinMaxDrag(event.offsetX, event.offsetY, plotAreaSpace, xViewportExtent, xAxisExtent, isHoriz, isRtl);
            onViewportChange?.({
                xMin,
                yMin: yViewportExtent.viewportMin,
                xMax,
                yMax: yViewportExtent.viewportMax
            });
        }
    };
    return onViewportChange && zoomAndScroll === 'live'
        ? mergeProps({ onWheel, onKeyDown, onPointerMove, onPointerDown, onPointerUp }, pinchProps)
        : {};
}

export { useChartViewport as u };
//# sourceMappingURL=useChartViewport-634ea088.js.map
