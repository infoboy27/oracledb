/* @oracle/oraclejet-preact: undefined */
import { jsxs, Fragment, jsx } from 'preact/jsx-runtime';
import { styles } from './PRIVATE_PlotArea/themes/PlotAreaStyles.css.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useColorScheme } from './useColorScheme-e1b17324.js';

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
    return (jsxs(Fragment, { children: [jsx("rect", { ...availSpace, class: styles.plotAreaStyle, style: { fill: color, cursor } }), jsx("line", { ...axisLineProps, class: styles.axisLineStyle }), hasBaseLine && jsx("line", { ...baseLineProps, class: styles.baseLineStyle })] }));
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
    const colorScheme = useColorScheme();
    return (jsxs(Fragment, { children: [yMajorTick?.isRendered && (jsx("path", { d: yLinesPath, class: classNames([
                    styles.noPointerEvents,
                    styles.majorTickLineStyles,
                    yMajorTick?.lineStyle === 'dashed' ? styles.dashedLine : undefined,
                    yMajorTick?.lineStyle === 'dotted' ? styles.dottedLine : undefined
                ]), style: {
                    stroke: yMajorTick.lineColor,
                    strokeWidth: yMajorTick.lineWidth
                } })), xMajorTick?.isRendered && (jsx("path", { d: xLinesPath, class: classNames([
                    styles.noPointerEvents,
                    styles.majorTickLineStyles,
                    xMajorTick?.lineStyle === 'dashed' ? styles.dashedLine : undefined,
                    xMajorTick?.lineStyle === 'dotted' ? styles.dottedLine : undefined
                ]), style: {
                    stroke: xMajorTick.lineColor,
                    strokeWidth: xMajorTick.lineWidth
                } })), isYMinorRendered && (jsx("path", { d: yMinorPath, class: classNames([
                    styles.noPointerEvents,
                    styles.minorTickLineStyles,
                    colorScheme === 'light'
                        ? styles.lightMinorTickLineStroke
                        : styles.darkMinorTickLineStroke,
                    yMinorTick?.lineStyle === 'dashed' ? styles.dashedLine : undefined,
                    yMinorTick?.lineStyle === 'dotted' ? styles.dottedLine : undefined
                ]), style: {
                    stroke: yMinorTick?.lineColor,
                    strokeWidth: yMinorTick?.lineWidth
                } }))] }));
}

export { Gridlines as G, PlotArea as P };
//# sourceMappingURL=Gridlines-428bf909.js.map
