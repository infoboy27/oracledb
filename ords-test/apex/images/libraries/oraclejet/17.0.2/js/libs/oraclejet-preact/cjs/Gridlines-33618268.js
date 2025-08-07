/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var PRIVATE_PlotArea_themes_PlotAreaStyles_css = require('./PRIVATE_PlotArea/themes/PlotAreaStyles.css.js');
var classNames = require('./classNames-c14c6ef3.js');
var useColorScheme = require('./useColorScheme-d2c4adcc.js');

function getAxisLineProps(availSpace, axisPosition, axisLine) {
    return {
        x1: axisPosition === 'right' ? availSpace.x + availSpace.width : availSpace.x,
        x2: axisPosition === 'left' ? availSpace.x : availSpace.x + availSpace.width,
        y1: axisPosition === 'bottom' ? availSpace.y + availSpace.height : availSpace.y,
        y2: axisPosition === 'top' ? availSpace.y : availSpace.y + availSpace.height,
        stroke: axisLine?.lineColor,
        strokeWidth: axisLine?.lineWidth
    };
}
function getBaseLineProps(availSpace, coord, axisPosition) {
    let x1, x2, y1, y2;
    if (axisPosition === 'bottom') {
        x1 = availSpace.x;
        x2 = availSpace.x + availSpace.width;
        y1 = coord;
        y2 = coord;
    }
    else {
        x1 = coord;
        x2 = coord;
        y1 = availSpace.y;
        y2 = availSpace.y + availSpace.height;
    }
    return { x1, x2, y1, y2 };
}

function PlotArea({ color, yScale, isLog, availSpace, xAxisPosition, cursor }) {
    const hasBaseLine = !isLog && yScale.domain()[0] < 0 && yScale.domain()[1] > 0;
    const axisLineProps = getAxisLineProps(availSpace, xAxisPosition);
    const baseLineProps = getBaseLineProps(availSpace, yScale.transform(0), xAxisPosition);
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx("rect", { ...availSpace, class: PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.plotAreaStyle, style: { fill: color, cursor } }), jsxRuntime.jsx("line", { ...axisLineProps, class: PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.axisLineStyle }), hasBaseLine && jsxRuntime.jsx("line", { ...baseLineProps, class: PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.baseLineStyle })] }));
}

const TICK_DEFAULT = {
    yMajorTick: {
        isRendered: true
    },
    yMinorTick: {
        isRendered: false
    },
    xMajorTick: {
        isRendered: false
    }
};
function Gridlines({ plotArea = TICK_DEFAULT, yMinorTicks, xScale, yScale, isLog, xViewportMin, xViewportMax, yTicks, yAxisPosition }) {
    const isHoriz = yAxisPosition === 'top' || yAxisPosition === 'bottom';
    const [x1, x2] = xScale.range();
    const [y1, y2] = yScale.range();
    let yLinesPath = '';
    let xLinesPath = '';
    let yMinorPath = '';
    const { yMajorTick: _yMajorTick, yMinorTick: _yMinorTick, xMajorTick: _xMajorTick } = plotArea;
    const yMajorTick = { ...TICK_DEFAULT.yMajorTick, ..._yMajorTick };
    const yMinorTick = { ...TICK_DEFAULT.yMinorTick, ..._yMinorTick };
    const xMajorTick = { ...TICK_DEFAULT.xMajorTick, ..._xMajorTick };
    const isYMinorRendered = yMinorTick?.isRendered === true || isLog;
    if (yMajorTick?.isRendered) {
        for (let i = 1; i < yTicks.length; i++) {
            let y = yScale.transform(yTicks[i]);
            // last grid line get's clipped due to plot area clippath. Slightly adjust
            // coord so that it's not clipped.
            if (i === yTicks.length - 1) {
                y += isHoriz ? -1 : 1;
            }
            yLinesPath += isHoriz ? `M${y},${x1}L${y},${x2}` : `M${x1},${y}L${x2},${y}`;
        }
    }
    if (xMajorTick?.isRendered) {
        const xStartIndex = Math.floor(xViewportMin - 0.5) + 1.5;
        for (let i = xStartIndex; i < xViewportMax; i++) {
            const x = xScale.transform(i);
            xLinesPath += isHoriz ? `M${y1},${x}L${y2},${x}` : `M${x},${y1}L${x},${y2}`;
        }
    }
    if (isYMinorRendered) {
        for (let i = 0; i < yMinorTicks.length; i++) {
            const y = yScale.transform(yMinorTicks[i]);
            yMinorPath += isHoriz ? `M${y},${x1}L${y},${x2}` : `M${x1},${y}L${x2},${y}`;
        }
    }
    const colorScheme = useColorScheme.useColorScheme();
    return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [yMajorTick?.isRendered && (jsxRuntime.jsx("path", { d: yLinesPath, class: classNames.classNames([
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.noPointerEvents,
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.majorTickLineStyles,
                    yMajorTick?.lineStyle === 'dashed' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dashedLine : undefined,
                    yMajorTick?.lineStyle === 'dotted' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dottedLine : undefined
                ]), style: {
                    stroke: yMajorTick.lineColor,
                    strokeWidth: yMajorTick.lineWidth
                } })), xMajorTick?.isRendered && (jsxRuntime.jsx("path", { d: xLinesPath, class: classNames.classNames([
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.noPointerEvents,
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.majorTickLineStyles,
                    xMajorTick?.lineStyle === 'dashed' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dashedLine : undefined,
                    xMajorTick?.lineStyle === 'dotted' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dottedLine : undefined
                ]), style: {
                    stroke: xMajorTick.lineColor,
                    strokeWidth: xMajorTick.lineWidth
                } })), isYMinorRendered && (jsxRuntime.jsx("path", { d: yMinorPath, class: classNames.classNames([
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.noPointerEvents,
                    PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.minorTickLineStyles,
                    colorScheme === 'light'
                        ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.lightMinorTickLineStroke
                        : PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.darkMinorTickLineStroke,
                    yMinorTick?.lineStyle === 'dashed' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dashedLine : undefined,
                    yMinorTick?.lineStyle === 'dotted' ? PRIVATE_PlotArea_themes_PlotAreaStyles_css.styles.dottedLine : undefined
                ]), style: {
                    stroke: yMinorTick?.lineColor,
                    strokeWidth: yMinorTick?.lineWidth
                } }))] }));
}

exports.Gridlines = Gridlines;
exports.PlotArea = PlotArea;
//# sourceMappingURL=Gridlines-33618268.js.map
