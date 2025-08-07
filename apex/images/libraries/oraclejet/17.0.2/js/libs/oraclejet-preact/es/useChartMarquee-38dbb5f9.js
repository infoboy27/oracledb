/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { useRef, useState } from 'preact/hooks';
import { a as isMobile } from './clientUtils-c580ab1f.js';
import { S as SvgButton } from './Button-46d35870.js';
import { S as SvgMove } from './Move-3084420d.js';
import { styles } from './hooks/PRIVATE_useChartMarquee/themes/useChartMarquee.css.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { S as SvgZoomAlt } from './ZoomAlt-d2b4fd6e.js';
import { B as ButtonSetSingle } from './ButtonSetSingle-060efe4c.js';
import { B as ButtonSetItem } from './ButtonSetItem-e4688ce4.js';
import { I as IconToggleButton } from './IconToggleButton-f57e5484.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function getResolvedDragMode(isZoomAndScroll, isMultiSelection, isMobile, dragMode) {
    if ((!isMultiSelection && dragMode === 'select') ||
        (!isZoomAndScroll && dragMode === 'zoom') ||
        dragMode === 'off') {
        return 'off';
    }
    if (dragMode === 'user') {
        if (isMobile) {
            return isZoomAndScroll ? 'pan' : 'off';
        }
        if (!isZoomAndScroll && isMultiSelection) {
            return isMobile ? 'select' : 'off';
        }
        if (!isZoomAndScroll && !isMultiSelection) {
            return 'off';
        }
        return 'pan';
    }
    return dragMode;
}
function isPanButtonVisible(isZoomAndScroll, dragMode, isMobile) {
    if (!isMobile || !isZoomAndScroll) {
        return false;
    }
    return dragMode !== 'select' && dragMode !== 'off';
}
function isZoomButtonVisible(isZoomAndScroll, isMobile, dragMode) {
    if (isMobile || !isZoomAndScroll) {
        return false;
    }
    return dragMode === 'user';
}
function isSelectButtonVisible(isMobile, isMultiSelection, isZoomAndScroll, dragMode) {
    if (!isMultiSelection) {
        return false;
    }
    if (!isMobile && !isZoomAndScroll && isMultiSelection) {
        return false;
    }
    return isMobile ? true : dragMode === 'user';
}
function getMarqueeDims(xScale, initialPoint, finalPoint) {
    if (initialPoint && finalPoint) {
        const x1 = Math.min(initialPoint.x, finalPoint.x);
        const x2 = Math.max(initialPoint.x, finalPoint.x);
        const y1 = Math.min(initialPoint.y, finalPoint.y);
        const y2 = Math.max(initialPoint.y, finalPoint.y);
        const width = Math.abs(x2 - x1);
        const height = Math.abs(y2 - y1);
        const delta = finalPoint.x - initialPoint.x;
        const axisDelta = xScale.invert(finalPoint.x) - xScale.invert(initialPoint.x);
        return {
            x1,
            y1,
            width,
            height,
            x2,
            y2,
            delta,
            axisDelta
        };
    }
    return;
}
function getCursorType(currentDragMode, isPointerDown) {
    if (currentDragMode === 'zoom' || currentDragMode === 'select') {
        return 'crosshair';
    }
    if (currentDragMode === 'pan') {
        return isPointerDown ? 'grabbing' : 'grab';
    }
    return;
}

function DragModeControls({ position, divRef, dragMode, onDragModeChange, showZoomButton, showPanButton, showSelectButton }) {
    const { right, left, top, bottom } = position;
    const onButtonAction = ({ value }) => {
        onDragModeChange(value === dragMode ? undefined : value);
    };
    const showOnlyOne = (showPanButton && !showSelectButton && !showZoomButton) ||
        (!showPanButton && !showSelectButton && showZoomButton) ||
        (!showPanButton && showSelectButton && !showZoomButton);
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const zoomAriaLabel = translations.vis_marqueeZoomTooltip();
    const panAriaLabel = translations.vis_panTooltip();
    const selectAriaLabel = translations.vis_marqueeSelectTooltip();
    return showZoomButton || showPanButton || showSelectButton ? (jsx("div", { ref: divRef, class: styles.background, style: {
            right,
            left,
            top,
            bottom
        }, children: !showOnlyOne ? (jsxs(ButtonSetSingle, { size: "sm", value: dragMode, onCommit: onButtonAction, display: "icons", variant: "outlined", children: [showPanButton && (jsx(ButtonSetItem, { value: "pan", label: panAriaLabel, startIcon: jsx(SvgMove, {}) })), showZoomButton && (jsx(ButtonSetItem, { value: "zoom", label: zoomAriaLabel, startIcon: jsx(SvgZoomAlt, {}) })), showSelectButton && (jsx(ButtonSetItem, { value: "select", label: selectAriaLabel, startIcon: jsx(SvgButton, {}) }))] })) : (jsxs(Fragment, { children: [showPanButton && (jsx(IconToggleButton, { accessibleLabel: panAriaLabel, isSelected: dragMode === 'pan', onToggle: (value) => {
                        onDragModeChange(value ? 'pan' : undefined);
                    }, variant: "outlined", size: "sm", children: jsx(SvgMove, {}) })), showZoomButton && (jsx(IconToggleButton, { accessibleLabel: zoomAriaLabel, isSelected: dragMode === 'zoom', onToggle: () => {
                        onDragModeChange(dragMode === 'zoom' ? undefined : 'zoom');
                    }, variant: "outlined", size: "sm", children: jsx(SvgZoomAlt, {}) })), showSelectButton && (jsx(IconToggleButton, { accessibleLabel: selectAriaLabel, isSelected: dragMode === 'select', onToggle: (value) => {
                        onDragModeChange(value ? 'select' : undefined);
                    }, variant: "outlined", size: "sm", children: jsx(SvgButton, {}) }))] })) })) : null;
}

function useDragModeControls({ chartWidth, plotAreaSpace, isRtl, isZoomScroll, isMultiSelection, dragMode }) {
    const isDeviceMobile = isMobile();
    const dragButtonDivRef = useRef(null);
    const showPanButton = isPanButtonVisible(isZoomScroll, dragMode, isDeviceMobile);
    const showZoomButton = isZoomButtonVisible(isZoomScroll, isDeviceMobile, dragMode);
    const showSelectButton = isSelectButtonVisible(isDeviceMobile, isMultiSelection, isZoomScroll, dragMode);
    const [userDragMode, setUserDragMode] = useState(isDeviceMobile && isZoomScroll ? 'pan' : undefined);
    const toggleButtonContent = (jsx(DragModeControls, { position: {
            top: `${plotAreaSpace.y}px`,
            right: isRtl ? undefined : `${chartWidth - plotAreaSpace.x - plotAreaSpace.width}px`,
            left: isRtl ? `${plotAreaSpace.x}px` : undefined
        }, divRef: dragButtonDivRef, showSelectButton: showSelectButton, showZoomButton: showZoomButton, showPanButton: showPanButton, dragMode: userDragMode, onDragModeChange: setUserDragMode }));
    return {
        dragButtonDivRef,
        toggleButtonContent,
        userDragMode
    };
}

function Marquee({ x1, y1, width, height }) {
    return (jsxs(Fragment, { children: [jsx("rect", { x: x1, y: y1, width: width, height: height, class: styles.visMarquee }), jsx("rect", { x: x1 + 1, y: y1 + 1, width: Math.max(0, width - 2), height: Math.max(0, height - 2), class: styles.visMarqueeInnerArea })] }));
}

function useChartMarquee({ plotAreaSpace, dragMode, chartWidth, isMultiSelection, onViewportChange, isZoomScroll, xAxisExtent, xScale, selectedIds, getDataById, onSelectionChange, viewportMax, viewportMin, isRtl }) {
    const isHovered = useRef(false);
    const numOfActiveTouches = useRef(0);
    const initialPointRef = useRef();
    const { dragButtonDivRef, toggleButtonContent, userDragMode } = useDragModeControls({
        chartWidth,
        plotAreaSpace,
        isRtl,
        isZoomScroll,
        isMultiSelection,
        dragMode
    });
    // for drag --> dragging cursor rerender in pan mode
    const [isPointerDown, setIsPointerDown] = useState(false);
    const [finalPoint, setFinalPoint] = useState();
    const selectedIdsRef = useRef(new Set());
    const isDeviceMobile = isMobile();
    const resolvedDragMode = getResolvedDragMode(isZoomScroll, isMultiSelection, isDeviceMobile, dragMode);
    const mode = resolvedDragMode != 'off' ? userDragMode || resolvedDragMode : 'off';
    const dims = getMarqueeDims(xScale, initialPointRef.current, finalPoint);
    const onPointerEnter = () => {
        isHovered.current = true;
    };
    const onPointerDown = (event) => {
        // prevent setIsPointerDown(true) when clicked on button
        // otherwise the button will disapper before being clicked.
        if (dragButtonDivRef.current?.contains(event.target)) {
            return;
        }
        const x = event.offsetX;
        const y = event.offsetY;
        setIsPointerDown(true);
        if (x < plotAreaSpace.x ||
            x > plotAreaSpace.x + plotAreaSpace.width ||
            y < plotAreaSpace.y ||
            y > plotAreaSpace.y + plotAreaSpace.height) {
            return;
        }
        initialPointRef.current = { x, y };
    };
    const onPointerLeave = (event) => {
        isHovered.current = false;
        if (dims && isDeviceMobile && mode != 'off') {
            event.currentTarget.setPointerCapture(event.pointerId);
        }
    };
    const onPointerMove = (event) => {
        if (!isPointerDown) {
            return;
        }
        if (event.metaKey && initialPointRef.current) {
            initialPointRef.current.isMeta = true;
        }
        const x = event.offsetX;
        const y = event.offsetY;
        if (x < plotAreaSpace.x ||
            x > plotAreaSpace.x + plotAreaSpace.width ||
            y < plotAreaSpace.y ||
            y > plotAreaSpace.y + plotAreaSpace.height) {
            return;
        }
        if (mode === 'pan' &&
            onViewportChange &&
            (!isDeviceMobile || (isDeviceMobile && numOfActiveTouches.current === 1))) {
            const axisDelta = xScale.invert(x) - xScale.invert((finalPoint?.x || initialPointRef.current?.x));
            const viewportRange = viewportMax - viewportMin;
            let xMin = viewportMin - axisDelta;
            let xMax = viewportMax - axisDelta;
            if (xMin < xAxisExtent.min) {
                xMin = xAxisExtent.min;
                xMax = xMin + viewportRange;
            }
            if (xMax > xAxisExtent.max) {
                xMax = xAxisExtent.max;
                xMin = xMax - viewportRange;
            }
            if (xMin != viewportMin && xMax != viewportMax) {
                onViewportChange({
                    xMin,
                    xMax
                });
            }
        }
        setFinalPoint({ x, y });
    };
    const onPointerUp = (event) => {
        setIsPointerDown(false);
        setFinalPoint(undefined);
        initialPointRef.current = undefined;
        if (dragButtonDivRef.current?.contains(event.target)) {
            return;
        }
        if (!dims) {
            return;
        }
        const { x1, x2 } = dims;
        if (mode === 'zoom') {
            const xMin = Math.min(xScale.invert(x1), xScale.invert(x2));
            const xMax = Math.max(xScale.invert(x1), xScale.invert(x2));
            onViewportChange?.({
                xMin,
                xMax
            });
        }
        if (mode === 'select') {
            const ids = [
                ...new Set([
                    ...selectedIdsRef.current,
                    ...(event.metaKey ? selectedIds || new Set() : new Set())
                ])
            ];
            const data = ids.map((id) => getDataById(id));
            onSelectionChange?.({ ids, data });
            selectedIdsRef.current = new Set();
        }
    };
    // if mode is 'off', we still want to show the toggleButton.
    // pointerUp will not fire because browser will have already claimed the
    // pointer
    const onTouchEnd = (event) => {
        setIsPointerDown(false);
        setFinalPoint(undefined);
        initialPointRef.current = undefined;
        numOfActiveTouches.current = event.touches.length;
    };
    const onTouchStart = (event) => {
        numOfActiveTouches.current = event.touches.length;
    };
    let marqueeContent;
    const isPointInsideMarquee = mode === 'select' && dims
        ? (id, point) => {
            if (initialPointRef.current?.isMeta && selectedIds?.has(id)) {
                return true;
            }
            const { x1, x2, y1, y2 } = dims;
            const { x, y } = point;
            if (x <= x2 && x >= x1 && y <= y2 && y >= y1) {
                selectedIdsRef.current?.add(id);
                return true;
            }
            else {
                selectedIdsRef.current?.delete(id);
            }
            return false;
        }
        : undefined;
    if (dims && (mode === 'zoom' || mode === 'select')) {
        marqueeContent = jsx(Marquee, { ...dims });
    }
    return {
        cursor: getCursorType(mode, isPointerDown),
        marqueeContent,
        toggleButtonContent: !isPointerDown &&
            ((!isDeviceMobile && isHovered.current) || isDeviceMobile) &&
            toggleButtonContent,
        isPointInsideMarquee,
        dragMode: mode,
        marqueeProps: dragMode != 'off'
            ? {
                onPointerDown,
                onPointerMove,
                onPointerUp,
                onPointerLeave,
                onPointerEnter,
                onTouchEnd,
                onTouchStart
            }
            : {}
    };
}

export { useChartMarquee as u };
//# sourceMappingURL=useChartMarquee-38dbb5f9.js.map
