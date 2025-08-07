/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks_PRIVATE_useChartDataCursor_themes_DataCursorStyles_css = require('./hooks/PRIVATE_useChartDataCursor/themes/DataCursorStyles.css.js');
var Marker = require('./Marker-8747d07b.js');

var hooks = require('preact/hooks');
var Common_themes_themeContract_css = require('./Common/themes/themeContract.css.js');
var utils = require('./utils-b7099be5.js');
var useVisHover = require('./useVisHover-ad36112d.js');
var mergeProps = require('./mergeProps-e3da7237.js');

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
    const itemInfo = hooks.useRef();
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
    const hoverHandlers = useVisHover.useVisHover(onHover, undefined, onHoverLeave, touchResponse);
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
        dataCursorContent = (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsxs("g", { class: hooks_PRIVATE_useChartDataCursor_themes_DataCursorStyles_css.styles.dataCursor, children: [jsxRuntime.jsx("line", { ...mainLineProps, class: hooks_PRIVATE_useChartDataCursor_themes_DataCursorStyles_css.styles.dataCursorLine }), jsxRuntime.jsx("line", { ...contrastLineProps, class: hooks_PRIVATE_useChartDataCursor_themes_DataCursorStyles_css.styles.contrastLine })] }), dataCursorStyle?.isMarkerDisplayed && info && (jsxRuntime.jsx(Marker.Marker, { type: markerType, tx: info.x, ty: info.y, isInteractive: true, scale: 1, fill: color, stroke: utils.rgb(Common_themes_themeContract_css.colorSchemeVars.palette.neutral[0]), outerStroke: color, width: markerDims, height: markerDims, preserveRectAspectRatio: true }))] }));
    }
    return {
        dataCursorContent,
        dataCursorProps: isDataCursorEnabled
            ? mergeProps.mergeProps(hoverHandlers, {
                onKeyDown,
                onKeyUp
            })
            : {}
    };
}

exports.useChartDataCursor = useChartDataCursor;
//# sourceMappingURL=useChartDataCursor-7f36d497.js.map
