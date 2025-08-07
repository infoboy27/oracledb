/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { styles } from './hooks/PRIVATE_useChartDataCursor/themes/DataCursorStyles.css.js';
import { M as Marker } from './Marker-546af001.js';
import './SvgShapesStyles.styles.css';
import { useRef } from 'preact/hooks';
import { colorSchemeVars } from './Common/themes/themeContract.css.js';
import { a as rgb } from './utils-6eab3a64.js';
import { u as useVisHover } from './useVisHover-d7a0b2f3.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getDataCursorCoords(xScale, x, plotAreaSpace, isHoriz, dataCursorStyle) {
    const lineColor = dataCursorStyle?.lineColor;
    const lineStyle = dataCursorStyle?.lineStyle;
    const y1 = isHoriz ? xScale.transform(x) : plotAreaSpace.y + plotAreaSpace.height;
    const x1 = isHoriz ? plotAreaSpace.x : xScale.transform(x);
    const y2 = isHoriz ? xScale.transform(x) : plotAreaSpace.y;
    const x2 = isHoriz ? plotAreaSpace.x + plotAreaSpace.width : xScale.transform(x);
    const lineWidth = dataCursorStyle?.lineWidth || 1;
    return {
        mainLineProps: {
            x1,
            y1,
            x2,
            y2,
            style: {
                stroke: lineColor,
                strokeDashArray: lineStyle === 'dotted' ? 3 : lineStyle === 'dashed' ? 6 : undefined,
                strokeWidth: lineWidth
            }
        },
        contrastLineProps: {
            x1: isHoriz ? x1 : x1 + lineWidth,
            y1: isHoriz ? y1 + lineWidth : y1,
            x2: isHoriz ? x2 : x2 + lineWidth,
            y2: isHoriz ? y2 + lineWidth : y2
        }
    };
}

function useChartDataCursor({ touchResponse, findNearest, dataCursorPosition, onDataCursorPositionChange, isDataCursorEnabled, isHoriz, plotAreaSpace, yScale, xScale, dataCursorStyle, focusedItemInfo, getDataItemPos, getMarkerInfo }) {
    let dataCursorContent = null;
    let x = dataCursorPosition?.x;
    let y = dataCursorPosition?.y;
    const isSnap = dataCursorStyle?.behavior === 'snap';
    const itemInfo = useRef();
    const updateDataCursor = () => {
        const { seriesIndex, groupIndex } = focusedItemInfo;
        const elemBounds = getDataItemPos(seriesIndex, groupIndex);
        if (!elemBounds) {
            return;
        }
        const px = elemBounds?.x + elemBounds.width / 2;
        const py = elemBounds?.y + elemBounds.height / 2;
        let X = xScale.invert(isHoriz ? py : px);
        let Y = yScale.invert(isHoriz ? px : py);
        const neareastItemInfo = findNearest(X, Y);
        itemInfo.current = neareastItemInfo;
        if (isSnap) {
            X = xScale.invert(neareastItemInfo.x);
            Y = yScale.invert(neareastItemInfo.y);
        }
        onDataCursorPositionChange?.({ x: X, y: Y });
    };
    const onHover = (event) => {
        const px = event.offsetX;
        const py = event.offsetY;
        if (px < plotAreaSpace.x ||
            py < plotAreaSpace.y ||
            px > plotAreaSpace.x + plotAreaSpace.width ||
            py > plotAreaSpace.y + plotAreaSpace.height) {
            dataCursorContent = null;
            onDataCursorPositionChange?.({ x: undefined, y: undefined });
            return;
        }
        let X = xScale.invert(isHoriz ? py : px);
        let Y = yScale.invert(isHoriz ? px : py);
        const neareastItemInfo = findNearest(X, Y);
        itemInfo.current = neareastItemInfo;
        if (isSnap) {
            X = xScale.invert(neareastItemInfo.x);
            Y = yScale.invert(neareastItemInfo.y);
        }
        onDataCursorPositionChange?.({ x: X, y: Y });
    };
    const onHoverLeave = () => {
        onDataCursorPositionChange?.({ x: undefined, y: undefined });
        itemInfo.current = undefined;
    };
    const hoverHandlers = useVisHover(onHover, undefined, onHoverLeave, touchResponse);
    const onKeyDown = (event) => {
        if (event.key === 'Tab') {
            onDataCursorPositionChange?.({ x: undefined, y: undefined });
            itemInfo.current = undefined;
            return;
        }
        updateDataCursor();
    };
    const onKeyUp = (event) => {
        if (event.key === 'Tab' && focusedItemInfo.isCurrent) {
            return;
        }
        updateDataCursor();
    };
    if (x != undefined && y != undefined && isDataCursorEnabled) {
        const info = itemInfo.current || findNearest(x, y);
        if (isSnap) {
            x = xScale.invert(info.x);
            y = yScale.invert(info.y);
        }
        const { mainLineProps, contrastLineProps } = getDataCursorCoords(xScale, x, plotAreaSpace, isHoriz, dataCursorStyle);
        const { type, color } = getMarkerInfo(info.seriesIndex, info.groupIndex);
        const markerType = type || 'circle';
        // TODO: JET-65336
        const markerDims = markerType === 'circle' ? 18 : 16;
        dataCursorContent = (jsxs(Fragment, { children: [jsxs("g", { class: styles.dataCursor, children: [jsx("line", { ...mainLineProps, class: styles.dataCursorLine }), jsx("line", { ...contrastLineProps, class: styles.contrastLine })] }), dataCursorStyle?.isMarkerDisplayed && info && (jsx(Marker, { type: markerType, tx: info.x, ty: info.y, isInteractive: true, scale: 1, fill: color, stroke: rgb(colorSchemeVars.palette.neutral[0]), outerStroke: color, width: markerDims, height: markerDims, preserveRectAspectRatio: true }))] }));
    }
    return {
        dataCursorContent,
        dataCursorProps: isDataCursorEnabled
            ? mergeProps(hoverHandlers, {
                onKeyDown,
                onKeyUp
            })
            : {}
    };
}

export { useChartDataCursor as u };
//# sourceMappingURL=useChartDataCursor-8e78a79f.js.map
