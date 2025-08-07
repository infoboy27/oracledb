/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { T as TrackResizeContainer } from './TrackResizeContainer-8360f2c2.js';
import { itemStyles, layerStyles, labelStyles, panZoomStyles, outerStyles, dimensionStyle } from './UNSAFE_Diagram/themes/DiagramStyles.css.js';
import { u as useResizeObserver } from './useResizeObserver-260ee12b.js';
import { useRef, useCallback, useState } from 'preact/hooks';
import { g as generateAriaLabel } from './accUtils-dc32d20b.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as useTranslationBundle } from './useTranslationBundle-cd815e10.js';
import { u as useUser } from './useUser-99920e02.js';
import { g as getRandomId } from './layoutUtils-2374ab3e.js';
import { u as useVisHover } from './useVisHover-d7a0b2f3.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useDatatip } from './useDatatip-7c661980.js';
import { c as calculateOffset } from './util-c1d41418.js';
import { u as useTextDimensions } from './useTextDimensions-e48f2781.js';
import { u as useSelection } from './useSelection-c12f7802.js';
import { u as useVisTouchResponse } from './useVisTouchResponse-e9ca4766.js';
import { m as merge } from './stringUtils-16f617bc.js';

const ZOOM_TO_FIT_PADDING = 20;
/**
 * Returns the pan properties for the diagram.
 */
function getPanProps(props, contentBounds) {
    return {
        panning: props.panning ? props.panning : 'off',
        panDirection: props.panDirection ? props.panDirection : 'any',
        centerX: props.centerX !== undefined ? props.centerX : contentBounds.w / 2 + contentBounds.x,
        centerY: props.centerY !== undefined ? props.centerY : contentBounds.h / 2 + contentBounds.y,
        onPan: props.onPan
    };
}
/**
 * Returns the zoom properties for the diagram.
 */
function getZoomProps(props, width, height, contentBounds) {
    const minZoom = props.minZoom ? props.minZoom : getZoomToFitZoom(width, height, contentBounds);
    const maxZoom = props.maxZoom !== undefined ? props.maxZoom : 1;
    const zoom = props.zoomValue ? props.zoomValue : getZoomToFitZoom(width, height, contentBounds);
    return {
        zooming: props.zooming ? props.zooming : 'off',
        // default value of 0 indicates zoom-to-fit level
        minZoom: minZoom,
        maxZoom: maxZoom,
        // zoom value of 0 will default to zoom to fit
        zoomValue: constrainZoom(zoom, minZoom, maxZoom),
        onZoom: props.onZoom
    };
}
/**
 * Constructs the json object to be passed into the layout function
 */
function constructLayoutJSON(nodes, nodeItems, linkItems, dimensions, width, height, getTextDimensions) {
    const labelDims = new Map();
    const nodeKeys = Array.from(nodeItems.keys());
    for (const id of nodeKeys) {
        const item = nodeItems.get(id);
        if (item && getTextDimensions && item.label) {
            const label = item.label;
            const fontProps = _getFontProps(item.labelStyle);
            labelDims.set(id, getTextDimensions(label, fontProps));
        }
    }
    const linkKeys = Array.from(linkItems.keys());
    for (const id of linkKeys) {
        const item = linkItems.get(id);
        if (item && getTextDimensions && item.label) {
            const label = item.label;
            const fontProps = _getFontProps(item.labelStyle);
            labelDims.set(id, getTextDimensions(label, fontProps));
        }
    }
    const getLabelDimensions = function (data) {
        return labelDims.get(data.id);
    };
    const getNodeDimensions = function (data) {
        for (let i = 0; i < nodes.length; i++) {
            if (data.id === nodes[i].id) {
                return dimensions[i];
            }
        }
        return dimensions[0];
    };
    return {
        layoutJSON: {
            getNodeDimensions: getNodeDimensions,
            getLabelDimensions: getLabelDimensions,
            componentSize: {
                width: width,
                height: height
            }
        },
        labelDims: labelDims
    };
}
/**
 * Deconstructs the output of the layout function
 */
function deconstructLayoutJSON(layoutJSON, nodeData, linkData) {
    const nodes = layoutJSON.nodes;
    const links = layoutJSON.links;
    const positions = [];
    const nodeLabelPos = [];
    const linkLabelPos = [];
    let hasNodeLabels = false;
    let hasLinkLabels = false;
    let node, link;
    for (let i = 0; i < nodeData.length; i++) {
        node = nodes[nodeData[i].id];
        positions.push(node.position);
        if (node.label)
            hasNodeLabels = true;
        nodeLabelPos.push(node.label);
    }
    if (links) {
        for (let i = 0; i < linkData.length; i++) {
            link = links[linkData[i].id];
            if (link.label)
                hasLinkLabels = true;
            linkLabelPos.push(link.label);
        }
    }
    return {
        nodePoints: positions,
        nodeLabelPos: hasNodeLabels ? nodeLabelPos : undefined,
        linkLabelPos: hasLinkLabels ? linkLabelPos : undefined
    };
}
/**
 * Merges the node points into the dimensions
 */
function mergeDimensions(dimensions, nodePoints) {
    const newBounds = [];
    for (let i = 0; i < dimensions.length; i++) {
        const point = nodePoints[i];
        const dim = dimensions[i];
        newBounds.push({ x: point.x, y: point.y, w: dim.w, h: dim.h });
    }
    return newBounds;
}
/**
 * Returns the text for the diagram datatip.
 */
function getDatatipContent(nodesMap, linksMap, focusedItem, hoveredItem, datatip) {
    let itemInfo;
    const isPointerActive = hoveredItem?.isCurrent;
    if (isPointerActive && hoveredItem.id != null) {
        itemInfo = hoveredItem;
    }
    if (focusedItem && focusedItem.isCurrent) {
        itemInfo = focusedItem;
    }
    if (itemInfo && datatip) {
        return datatip(itemInfo.isNode
            ? { data: nodesMap.get(itemInfo.id), type: 'node' }
            : { data: linksMap.get(itemInfo.id), type: 'link' });
    }
    if (itemInfo) {
        const text = (itemInfo.isNode ? nodesMap.get(itemInfo.id) : linksMap.get(itemInfo.id))?.accessibleLabel;
        return {
            content: text
        };
    }
    return;
}
/**
 * Creates a map with key id and value node or link data
 */
function createItemMap(items) {
    const itemIdToDataMap = new Map();
    const itemIdToIndexMap = new Map();
    const itemIndexToIdMap = new Map();
    for (let i = 0; i < items.length; i++) {
        itemIdToDataMap.set(items[i].id, items[i]);
        itemIdToIndexMap.set(items[i].id, i);
        itemIndexToIdMap.set(i, items[i].id);
    }
    return {
        itemIdToDataMap,
        itemIdToIndexMap,
        itemIndexToIdMap
    };
}
/**
 * Filter out links with no start or end nodes
 */
function filterLinksWithNoEndNodes(links, nodesMap) {
    const newLinks = [];
    for (let i = 0; i < links.length; i++) {
        const link = links[i];
        if (nodesMap.get(link.startNode) && nodesMap.get(link.endNode)) {
            newLinks.push(link);
        }
    }
    return newLinks;
}
/**
 * Pulls out the dimensions from an array of bounds
 */
function getDimensionsFromBounds(bounds) {
    const dims = [];
    for (let i = 0; i < bounds.length; i++) {
        dims.push({ w: bounds[i].w, h: bounds[i].h });
    }
    return dims;
}
/**
 * Returns the center position of the node or link
 * For links, draws a straight line between the centers of the start/end node
 * and returns the center of that line
 */
function getFocusedItemBounds(focusedItemInfo, bounds, links, nodeIdToIndexMap, linkIdToIndexMap) {
    if (focusedItemInfo.isNode) {
        const idx = nodeIdToIndexMap.get(focusedItemInfo.id);
        // Return the first element if cannot find the Node index
        return bounds[idx || 0];
    }
    else {
        // Center of a straight line between start/end node centers
        const link = links[linkIdToIndexMap.get(focusedItemInfo.id) || 0];
        const startNB = bounds[nodeIdToIndexMap.get(link.startNode) || 0];
        const endNB = bounds[nodeIdToIndexMap.get(link.endNode) || 0];
        const startNCenter = { x: startNB.x + startNB.w / 2, y: startNB.y + startNB.h / 2 };
        const endNCenter = { x: endNB.x + endNB.w / 2, y: endNB.y + endNB.h / 2 };
        const minX = Math.min(startNCenter.x, endNCenter.x);
        const minY = Math.min(startNCenter.y, endNCenter.y);
        return {
            x: minX,
            y: minY,
            w: Math.abs(startNCenter.x - endNCenter.x),
            h: Math.abs(startNCenter.y - endNCenter.y)
        };
    }
}
/**
 * Combines the node and link ids into one array
 */
function combineIds(nodeIds, linkIds) {
    const combinedIds = [];
    if (nodeIds) {
        for (let i = 0; i < nodeIds.length; i++) {
            combinedIds.push(nodeIds[i]);
        }
    }
    if (linkIds) {
        for (let i = 0; i < linkIds.length; i++) {
            combinedIds.push(linkIds[i]);
        }
    }
    return combinedIds;
}
/**
 * Returns the bounds of the diagram content
 */
function getContentBounds(nodeBounds, labelBounds) {
    if (nodeBounds.length === 0)
        return { x: 0, w: Infinity, y: 0, h: Infinity };
    let minX = Infinity;
    let minY = Infinity;
    let maxX = -Infinity;
    let maxY = -Infinity;
    let dims;
    for (let i = 0; i < nodeBounds.length; i++) {
        dims = nodeBounds[i];
        minX = dims.x < minX ? dims.x : minX;
        minY = dims.y < minY ? dims.y : minY;
        maxX = dims.x + dims.w > maxX ? dims.x + dims.w : maxX;
        maxY = dims.y + dims.h > maxY ? dims.y + dims.h : maxY;
    }
    if (labelBounds) {
        minX = labelBounds.x < minX ? labelBounds.x : minX;
        minY = labelBounds.y < minY ? labelBounds.y : minY;
        maxX = labelBounds.x + labelBounds.w > maxX ? labelBounds.x + labelBounds.w : maxX;
        maxY = labelBounds.y + labelBounds.h > maxY ? labelBounds.y + labelBounds.h : maxY;
    }
    return { x: minX, w: maxX - minX, y: minY, h: maxY - minY };
}
/**
 * Returns the label bounds
 */
function getAllLabelBounds(labelDims, nodes, links, nodeLabelPos = [], linkLabelPos = [], isRTL) {
    if (nodeLabelPos.length === 0 && linkLabelPos.length === 0)
        return undefined;
    let minX = Infinity;
    let minY = Infinity;
    let maxX = -Infinity;
    let maxY = -Infinity;
    let dims, label;
    for (let i = 0; i < nodeLabelPos.length; i++) {
        label = nodeLabelPos[i];
        if (!label)
            continue;
        dims = getLabelBounds(label, labelDims.get(nodes[i].id), isRTL);
        minX = dims.x < minX ? dims.x : minX;
        minY = dims.y < minY ? dims.y : minY;
        maxX = dims.x + dims.w > maxX ? dims.x + dims.w : maxX;
        maxY = dims.y + dims.h > maxY ? dims.y + dims.h : maxY;
    }
    for (let i = 0; i < linkLabelPos.length; i++) {
        label = linkLabelPos[i];
        if (!label)
            continue;
        dims = getLabelBounds(label, labelDims.get(links[i].id), isRTL);
        minX = dims.x < minX ? dims.x : minX;
        minY = dims.y < minY ? dims.y : minY;
        maxX = dims.x + dims.w > maxX ? dims.x + dims.w : maxX;
        maxY = dims.y + dims.h > maxY ? dims.y + dims.h : maxY;
    }
    return { x: minX, w: maxX - minX, y: minY, h: maxY - minY };
}
function getLabelBounds(label, dims, isRTL) {
    const labelPos = getLabelPosition(dims, label, isRTL);
    const isRotating = label.rotationAngle;
    if (!isRotating) {
        return { x: labelPos.x, y: labelPos.y, w: dims.width, h: dims.height };
    }
    else {
        // Find the 4 corners of the label bounds relative to the rotation point
        const rotationPoint = label.rotationPoint
            ? label.rotationPoint
            : { x: dims.width / 2, y: dims.height / 2 };
        const angle = label.rotationAngle;
        const topLeft = getCoordsRelToRotPoint({ x: 0, y: 0 }, rotationPoint);
        const topRight = getCoordsRelToRotPoint({ x: dims.width, y: 0 }, rotationPoint);
        const bottomLeft = getCoordsRelToRotPoint({ x: 0, y: dims.height }, rotationPoint);
        const bottomRight = getCoordsRelToRotPoint({ x: dims.width, y: dims.height }, rotationPoint);
        const rotTopLeft = rotatePoint(topLeft, angle);
        const rotBotLeft = rotatePoint(bottomLeft, angle);
        const rotTopRight = rotatePoint(topRight, angle);
        const rotBotRight = rotatePoint(bottomRight, angle);
        const points = [rotTopLeft, rotBotLeft, rotTopRight, rotBotRight].map((pos) => {
            return {
                x: pos.x + labelPos.x + rotationPoint.x,
                y: pos.y + labelPos.y + rotationPoint.y
            };
        });
        return getBoundsFromPoints(points);
    }
}
function getCoordsRelToRotPoint(labelPoint, rotPoint) {
    return { x: labelPoint.x - rotPoint.x, y: labelPoint.y - rotPoint.y };
}
function rotatePoint(pos, angle) {
    return {
        x: pos.x * Math.cos(angle) - pos.y * Math.sin(angle),
        y: pos.x * Math.sin(angle) + pos.y * Math.cos(angle)
    };
}
function getBoundsFromPoints(points) {
    let minX = points[0].x;
    let minY = points[0].y;
    let maxX = points[0].x;
    let maxY = points[0].y;
    for (let i = 1; i < points.length; i++) {
        const point = points[i];
        if (point.x < minX)
            minX = point.x;
        else if (point.x > maxX)
            maxX = point.x;
        if (point.y < minY)
            minY = point.y;
        else if (point.y > maxY)
            maxY = point.y;
    }
    return {
        x: minX,
        y: minY,
        w: maxX - minX,
        h: maxY - minY
    };
}
/**
 * Returns the position of the label
 * @param dimensions
 * @param positionProps
 * @returns position of the label
 */
function getLabelPosition(dimensions, positionProps, isRTL) {
    const position = positionProps.position;
    const hAlign = positionProps.hAlign ? positionProps.hAlign : isRTL ? 'right' : 'left';
    const vAlign = positionProps.vAlign;
    let x, y;
    if (hAlign === 'center') {
        x = position.x - dimensions.width / 2;
    }
    else if (hAlign === 'right') {
        x = position.x - dimensions.width;
    }
    else {
        x = position.x;
    }
    if (vAlign === 'middle') {
        y = position.y - dimensions.height / 2;
    }
    else if (vAlign === 'bottom') {
        y = position.y - dimensions.height;
    }
    else if (vAlign === 'baseline') {
        y = position.y + dimensions.y;
    }
    else {
        y = position.y;
    }
    return {
        x: x,
        y: y
    };
}
/**
 * Converts centerX,Y coordinates to panX,Y coordinates
 */
function centerXYToPanXY(centerX, centerY, zoom, width, height) {
    return {
        panX: width / 2 - centerX * zoom,
        panY: height / 2 - centerY * zoom
    };
}
/**
 * Converts panX,Y coordinates to centerX,Y coordinates
 */
function panXYToCenterXY(panX, panY, zoom, width, height) {
    return {
        centerX: (width / 2 - panX) / zoom,
        centerY: (height / 2 - panY) / zoom
    };
}
/**
 * Compares if two ItemInfo are equal
 */
function isEqualItem(item1, item2) {
    return item1?.id === item2?.id && item1?.isNode === item2?.isNode;
}
/**
 * Returns the item info of the data-oj-node or data-oj-link attribute for a given element.
 */
function getNavigableInfo(element, rootElementRef) {
    let isNode = false;
    let elem = element;
    let navigableId;
    while (!navigableId) {
        navigableId = elem.dataset['node'];
        if (navigableId) {
            isNode = true;
        }
        else {
            navigableId = elem.dataset['link'];
        }
        if (!navigableId) {
            if (elem.parentElement && elem.parentElement !== rootElementRef?.current) {
                elem = elem.parentElement;
            }
            else {
                break;
            }
        }
    }
    return {
        id: navigableId,
        isNode: isNode
    };
}
/**
 * Returns the aria label
 */
function getItemAriaLabel(translations, supportsSelection, isSelected, accessibleLabel) {
    return generateAriaLabel(translations, accessibleLabel || '', {
        isSelected: !supportsSelection ? undefined : isSelected
    });
}
/**
 * Returns the zoom to fit zoom level
 */
function getZoomToFitZoom(width, height, contentBounds) {
    const zoomX = (width - 2 * ZOOM_TO_FIT_PADDING) / contentBounds.w;
    const zoomY = (height - 2 * ZOOM_TO_FIT_PADDING) / contentBounds.h;
    return Math.min(zoomX, zoomY);
}
/**
 * Constrains the zoom level
 */
function constrainZoom(zoom, minZoom, maxZoom) {
    let newZoom = Math.max(minZoom, zoom);
    newZoom = Math.min(maxZoom, newZoom);
    return newZoom;
}
/**
 * Returns the font props for a node or link
 */
function _getFontProps(styles) {
    const fontProps = {};
    if (!styles)
        return fontProps;
    if (styles.fontFamily)
        fontProps.fontFamily = styles.fontFamily;
    if (styles.fontSize)
        fontProps.fontSize = styles.fontSize;
    if (styles.fontStyle)
        fontProps.fontStyle = styles.fontStyle;
    if (styles.fontWeight)
        fontProps.fontWeight = styles.fontWeight;
    return fontProps;
}
/**
 * Returns the panX, panY, and zoom when zooming and centering an item
 */
function zoomAndCenterItemFromInfo(info, linkIdToDataMap, bounds, nodeIdToIndex, width, height, maxZoom) {
    const isNode = info.isNode;
    let totalBounds;
    if (isNode) {
        const nodeIndex = nodeIdToIndex.get(info.id);
        totalBounds = bounds[nodeIndex];
    }
    else {
        const link = linkIdToDataMap.get(info.id);
        const startNodeBounds = bounds[nodeIdToIndex.get(link.startNode)];
        const endNodeBounds = bounds[nodeIdToIndex.get(link.endNode)];
        const minX = Math.min(startNodeBounds.x, endNodeBounds.x);
        const minY = Math.min(startNodeBounds.y, endNodeBounds.y);
        const maxX = Math.max(startNodeBounds.x + startNodeBounds.w, endNodeBounds.x + startNodeBounds.w);
        const maxY = Math.max(startNodeBounds.y + startNodeBounds.h, endNodeBounds.y + endNodeBounds.h);
        totalBounds = { x: minX, y: minY, w: maxX - minX, h: maxY - minY };
    }
    return getPanZoomToCenterNode(totalBounds, maxZoom, width, height);
}
/**
 * Returns the pan and zoom values in order
 * to center a node or link
 */
function getPanZoomToCenterNode(bounds, maxZoom, width, height) {
    const zoomX = (width - 2 * ZOOM_TO_FIT_PADDING) / bounds.w;
    const zoomY = (height - 2 * ZOOM_TO_FIT_PADDING) / bounds.h;
    const zoom = Math.min(zoomX, zoomY, maxZoom);
    const cX = bounds.w / 2 + bounds.x;
    const cY = bounds.h / 2 + bounds.y;
    return { centerX: cX, centerY: cY, zoom: zoom };
}

const DiagramNodeElement = ({ id, state, previousState, position, activeId, nodeRenderer, onNodeSizeChanged, nodeIndex, data, accessibleLabel, isDimmed, supportsSelection }) => {
    const { nodeStyles, dimmedItemStyle } = itemStyles;
    const context = {
        state: state,
        previousState: previousState,
        data: data
    };
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const ref = useRef(null);
    // TODO JET-62472 change to one resize observer function
    const optionsRef = useRef({ box: 'border-box' });
    useResizeObserver(ref, useCallback((entry) => {
        const boxSize = entry.borderBoxSize;
        const width = boxSize[0].inlineSize;
        const height = boxSize[0].blockSize;
        onNodeSizeChanged(width, height, nodeIndex);
    }, [nodeIndex, onNodeSizeChanged]), optionsRef.current);
    return (jsx("div", { ref: ref, class: classNames([nodeStyles, isDimmed ? dimmedItemStyle : undefined]), "data-node": id, role: "img", "aria-label": getItemAriaLabel(translations, supportsSelection, state.selected, accessibleLabel), style: {
            top: position.y,
            left: position.x
        }, id: state.focused || state.hovered ? activeId : undefined, children: nodeRenderer(context) }, id));
};

function DiagramNodeLayer({ nodes, states, previousStates, nodeRenderer, nodeBounds, onNodeSizeChanged, supportsSelection }) {
    return (jsx("div", { class: layerStyles, children: nodes.map((node, i) => {
            // this is for initial render before the layout function so render all nodes at 0,0
            const position = nodeBounds && nodeBounds[i] ? { x: nodeBounds[i].x, y: nodeBounds[i].y } : { x: 0, y: 0 };
            const state = {
                selected: states.selectedNodeIds.includes(node.id),
                focused: states.focusedId === node.id,
                hovered: states.hoveredId === node.id,
                zoom: states.zoom
            };
            const previousState = {
                selected: previousStates.selectedNodeIds.includes(node.id),
                focused: previousStates.focusedId === node.id,
                hovered: previousStates.hoveredId === node.id,
                zoom: previousStates.zoom
            };
            return (jsx(DiagramNodeElement, { id: node.id, position: position, state: state, previousState: previousState, isDimmed: states.highlightedIds.length !== 0 && !states.highlightedIds.includes(node.id), activeId: states.activeId, nodeRenderer: nodeRenderer, onNodeSizeChanged: onNodeSizeChanged, nodeIndex: i, accessibleLabel: node.accessibleLabel, data: node, supportsSelection: supportsSelection }));
        }) }));
}

const DiagramLinkElement = ({ id, state, previousState, activeId, data, linkRenderer, accessibleLabel, isDimmed, supportsSelection }) => {
    const translations = useTranslationBundle('@oracle/oraclejet-preact');
    const { dimmedItemStyle, linkStyles } = itemStyles;
    const context = {
        state: state,
        previousState: previousState,
        data: data
    };
    return (jsx("g", { id: state.focused ? activeId : undefined, "aria-label": getItemAriaLabel(translations, supportsSelection, state.selected, accessibleLabel), "data-link": id, role: "img", class: classNames([linkStyles, isDimmed && dimmedItemStyle]), children: linkRenderer(context) }, id));
};

function DiagramLinkLayer({ links, states, previousStates, linkRenderer, width, height, supportsSelection }) {
    return (jsx("svg", { class: layerStyles, width: width, height: height, children: links.map((link) => {
            const state = {
                selected: states.selectedLinkIds.includes(link.id),
                focused: states.focusedId === link.id,
                hovered: states.hoveredId === link.id,
                zoom: states.zoom
            };
            const previousState = {
                selected: previousStates.selectedLinkIds.includes(link.id),
                focused: previousStates.focusedId === link.id,
                hovered: previousStates.hoveredId === link.id,
                zoom: previousStates.zoom
            };
            return (jsx(DiagramLinkElement, { id: link.id, label: link.label, state: state, previousState: previousState, isDimmed: states.highlightedIds.length !== 0 && !states.highlightedIds.includes(link.id), activeId: states.activeId, accessibleLabel: link.accessibleLabel, data: link, linkRenderer: linkRenderer, supportsSelection: supportsSelection }));
        }) }));
}

const DiagramLabel = ({ text, position, styles, dimensions, isRTL }) => {
    const { labelStyle, labelBorderStyle } = labelStyles;
    const labelPosition = getLabelPosition(dimensions, position, isRTL);
    const labelRotation = getLabelRotation(position);
    return (jsx("div", { class: classNames([labelStyle, styles && styles.borderColor && labelBorderStyle]), style: {
            top: labelPosition.y,
            left: labelPosition.x,
            ...styles,
            ...labelRotation
        }, children: text }));
};
/**
 * Returns the label rotation props
 * @param position
 * @returns rotation props
 */
function getLabelRotation(position) {
    const rotationAngle = position.rotationAngle;
    const rotationPoint = position.rotationPoint;
    const rotation = {};
    if (rotationAngle) {
        rotation['transform'] = `rotate(${rotationAngle}deg)`;
    }
    if (rotationPoint) {
        rotation['transform-origin'] = `${rotationPoint.x}px ${rotationPoint.y}px`;
    }
    return rotation;
}

function DiagramLabelLayer({ labelPosition, itemProps, labelDimensions }) {
    const { direction } = useUser();
    return (jsx("div", { class: layerStyles, children: itemProps.map((item, i) => {
            if (item.label && labelPosition[i]) {
                return (jsx(DiagramLabel, { styles: item.labelStyle, text: item.label, position: labelPosition[i], dimensions: labelDimensions.get(item.id), isRTL: direction === 'rtl' }));
            }
            return undefined;
        }) }));
}

function DiagramLayers({ nodes, links, nodeRenderer, linkRenderer, states, previousStates, nodeBounds, onNodeSizeChanged, width, height, nodeLabelPositions, linkLabelPositions, labelDimensions, supportsSelection }) {
    return (jsxs(Fragment, { children: [links.length > 0 && linkRenderer && width !== Infinity && (jsx(DiagramLinkLayer, { links: links, states: states, previousStates: previousStates, linkRenderer: linkRenderer, width: width, height: height, supportsSelection: supportsSelection })), jsx(DiagramNodeLayer, { nodes: nodes, nodeBounds: nodeBounds, states: states, previousStates: previousStates, nodeRenderer: nodeRenderer, onNodeSizeChanged: onNodeSizeChanged, supportsSelection: supportsSelection }), labelDimensions ? (jsxs("div", { children: [nodeLabelPositions ? (jsx(DiagramLabelLayer, { labelPosition: nodeLabelPositions, itemProps: nodes, labelDimensions: labelDimensions })) : undefined, links && linkLabelPositions ? (jsx(DiagramLabelLayer, { labelPosition: linkLabelPositions, itemProps: links, labelDimensions: labelDimensions })) : undefined] })) : undefined] }));
}

function DiagramPanZoomContainer({ centerX, centerY, children, zoom, width, height }) {
    const panValues = centerXYToPanXY(centerX, centerY, zoom, width, height);
    return (jsx("div", { class: panZoomStyles, style: {
            //TODO JET-62471 look at using matrices or both in transform instead
            translate: `${panValues.panX}px ${panValues.panY}px`,
            transform: `scale(${zoom})`
        }, children: children }));
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Returns the node data based on node info in a diagram.
 * @param itemInfo
 * @returns
 */
function getNodeDetailFromInfo(itemInfo, nodes) {
    let node;
    for (let i = 0; i < nodes.length; i++) {
        node = nodes[i];
        if (itemInfo.id === node.id) {
            return node;
        }
    }
    return undefined;
}
/**
 * Returns the link data based on link info in a diagram.
 * @param itemInfo
 * @returns
 */
function getLinkDetailFromInfo(itemInfo, links) {
    let link;
    for (let i = 0; i < links.length; i++) {
        link = links[i];
        if (itemInfo.id === link.id) {
            return link;
        }
    }
    return undefined;
}
/**
 * Creates a map with key node id and value node bounds
 */
function createNodeBoundsMap(nodes, bounds) {
    const nodeBounds = new Map();
    for (let i = 0; i < nodes.length; i++) {
        nodeBounds.set(nodes[i].id, bounds[i]);
    }
    return nodeBounds;
}
/**
 * Utility method that adds sorting attributes of each link to an array
 */
function addSortingAttributes(node, listOfLinks, nodes, nodeBounds) {
    let angle, distance, direction;
    const linkDetail = [];
    for (let i = 0; i < listOfLinks.length; i++) {
        const link = listOfLinks[i];
        angle = _getClockwiseAngle(node, link, nodes, nodeBounds);
        distance = _getNodesDistance(link, nodes, nodeBounds);
        direction = _getLinkDirection(node, link);
        linkDetail.push({ id: link.id, angle: angle, distance: distance, direction: direction });
    }
    return linkDetail;
}
/**
 * Returns a function that compares two link around a given node
 * The links are analyzed by angle, distance from the node and direction. The sorting attributes are added to the links before sorting.
 */
function getLinkComparator() {
    return (link1, link2) => {
        const { angle: linkAngle1, distance: linkDistance1, direction: linkDirection1 } = link1;
        const { angle: linkAngle2, distance: linkDistance2, direction: linkDirection2 } = link2;
        let res = -1;
        if (!_anglesAreEqualWithinTolerance(linkAngle1, linkAngle2) && linkAngle1 > linkAngle2) {
            res = 1;
        }
        else if (_anglesAreEqualWithinTolerance(linkAngle1, linkAngle2)) {
            //check distance and direction
            if (linkDistance1 > linkDistance2) {
                res = 1;
            }
            else if (linkDistance2 == linkDistance1 && linkDirection1 > linkDirection2) {
                //outgoing to ingoing
                res = 1;
            }
            else if (linkDistance2 == linkDistance1 && linkDirection1 == linkDirection2) {
                res = 0;
            }
        }
        return res;
    };
}
/**
 * Returns navigable links for a given node
 */
function getNavigableLinksForNodeId(nodeId, listOfLinks) {
    const links = [];
    listOfLinks.forEach((link) => {
        const startId = link.startNode;
        const endId = link.endNode;
        if (startId == nodeId || endId == nodeId)
            links.push(link);
    });
    return links;
}
/**
 * Get the clockwise angle for the link given node as a center
 */
function _getClockwiseAngle(node, link, nodes, nodeBounds) {
    //find opposite node
    let currNode;
    let startNode = nodes[0];
    let endNode = nodes[0];
    for (let i = 0; i < nodes.length; i++) {
        currNode = nodes[i];
        if (currNode.id === link.startNode) {
            startNode = currNode;
        }
        else if (currNode.id === link.endNode) {
            endNode = currNode;
        }
    }
    const oppositeNode = node.id == startNode.id ? endNode : startNode;
    const p1 = _getNodeCenter(node, nodeBounds);
    const p2 = _getNodeCenter(oppositeNode, nodeBounds);
    let angle = Math.atan2(p2.y - p1.y, p2.x - p1.x);
    angle = angle < 0 ? angle + Math.PI * 2 : angle;
    return angle;
}
/**
 * Get the distance between start and end nodes for the given link
 */
function _getNodesDistance(link, nodes, nodeBounds) {
    let currNode;
    let startNode = nodes[0];
    let endNode = nodes[0];
    for (let i = 0; i < nodes.length; i++) {
        currNode = nodes[i];
        if (currNode.id === link.startNode) {
            startNode = currNode;
        }
        else if (currNode.id === link.endNode) {
            endNode = currNode;
        }
    }
    const p1 = _getNodeCenter(startNode, nodeBounds);
    const p2 = _getNodeCenter(endNode, nodeBounds);
    return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2));
}
/**
 * Get link direction for the given node.  1 if the node is the end node
 * and 0 if it is the start node
 */
function _getLinkDirection(node, link) {
    if (link.endNode === node.id) {
        return 1;
    }
    return 0;
}
/**
 * Get node center
 */
function _getNodeCenter(node, nodeBounds) {
    const nodeBB = nodeBounds.get(node.id);
    return { x: nodeBB.x + nodeBB.w / 2, y: nodeBB.y + nodeBB.h / 2 };
}
/**
 * Calculates the angle weighted by distance
 */
function calcDistanceAngleWeighted(objectBB, currentBB, direction) {
    // Variables used for calculating penalties when calculating distances between two navigables.
    const optimalAngle1 = (15 / 180) * Math.PI;
    const optimalAngle2 = (40 / 180) * Math.PI;
    const suboptimalAnglePenalty1 = 2; // multiplier to the distance
    const suboptimalAnglePenalty2 = 6; // multiplier to the distance
    const objCenterX = objectBB.x + objectBB.w / 2;
    const objCenterY = objectBB.y + objectBB.h / 2;
    const curCenterX = currentBB.x + currentBB.w / 2;
    const curCenterY = currentBB.y + currentBB.h / 2;
    const x_dist = Math.abs(objCenterX - curCenterX);
    const y_dist = Math.abs(objCenterY - curCenterY);
    const angle = Math.atan2(y_dist, x_dist);
    let distance = Math.sqrt(x_dist * x_dist + y_dist * y_dist);
    // Angle penalty based on direction
    if ((angle > optimalAngle1 && (direction == 'right' || direction == 'left')) ||
        (angle < Math.PI / 2 - optimalAngle1 && (direction == 'up' || direction == 'down'))) {
        if ((angle > optimalAngle2 && (direction == 'right' || direction == 'left')) ||
            (angle < Math.PI / 2 - optimalAngle2 && (direction == 'up' || direction == 'down'))) {
            distance *= suboptimalAnglePenalty2;
        }
        else {
            distance *= suboptimalAnglePenalty1;
        }
    }
    return distance;
}
/**
 * Given a direction, is a certain node is a valid destination to navigate to
 */
function isValidDestination(objBB, curBB, direction, compareCenters) {
    // compare the centers of the navigable and to be valid, the navigable must be in the right direction
    // without tolerance
    if (compareCenters) {
        const objCenterX = objBB.x + 0.5 * objBB.w;
        const curCenterX = curBB.x + 0.5 * curBB.w;
        const objCenterY = objBB.y + 0.5 * objBB.h;
        const curCenterY = curBB.y + 0.5 * curBB.h;
        switch (direction) {
            case 'up':
                return objCenterY < curCenterY;
            case 'down':
                return objBB.y > curCenterY;
            case 'right':
                return objCenterX > curCenterX;
            case 'left':
                return objCenterX < curCenterX;
        }
        return true;
    }
    switch (direction) {
        case 'up':
            return objBB.y < curBB.y || _areEqualWithinTolerance(objBB.y, curBB.y);
        case 'down':
            return objBB.y > curBB.y || _areEqualWithinTolerance(objBB.y, curBB.y);
        case 'right':
            return objBB.x > curBB.x || _areEqualWithinTolerance(objBB.x, curBB.x);
        case 'left':
            return objBB.x < curBB.x || _areEqualWithinTolerance(objBB.x, curBB.x);
    }
    return true;
}
/**
 * Returns true if two nodes are in contact
 */
function calcInContact(objRect, curRect, direction) {
    switch (direction) {
        case 'up':
            return (_isVerticallyAligned(objRect, curRect) &&
                (curRect.y <= objRect.y + objRect.h ||
                    _areEqualWithinTolerance(curRect.y, objRect.y + objRect.h)));
        case 'down':
            return (_isVerticallyAligned(objRect, curRect) &&
                (objRect.y <= curRect.y + curRect.h ||
                    _areEqualWithinTolerance(objRect.y, curRect.y + curRect.h)));
        case 'right':
            return (_isHorizontallyAligned(objRect, curRect) &&
                (objRect.x <= curRect.x + curRect.w ||
                    _areEqualWithinTolerance(objRect.x, curRect.x + curRect.w)));
        case 'left':
            return (_isHorizontallyAligned(objRect, curRect) &&
                (curRect.x <= objRect.x + objRect.w ||
                    _areEqualWithinTolerance(curRect.x, objRect.x + objRect.w)));
    }
    return false;
}
function _isVerticallyAligned(rect1, rect2) {
    return ((rect1.x >= rect2.x && rect1.x <= rect2.x + rect2.w) ||
        (rect2.x >= rect1.x && rect2.x <= rect1.x + rect1.w));
}
function _isHorizontallyAligned(rect1, rect2) {
    return ((rect1.y >= rect2.y && rect1.y <= rect2.y + rect2.h) ||
        (rect2.y >= rect1.y && rect2.y <= rect1.y + rect1.h));
}
function _areEqualWithinTolerance(a, b) {
    return Math.abs(a - b) <= 0.0000001;
}
function _anglesAreEqualWithinTolerance(a1, a2) {
    let res = Math.abs(a1 - a2) <= 0.0000001;
    if (!res) {
        res = Math.abs(Math.PI * 2 + Math.min(a1, a2) - Math.max(a1, a2)) <= 0.0000001;
    }
    return res;
}

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
function useDiagramNavigation(nodes, links, bounds, linkIdToDataMap) {
    const currentKeyboardFocusNode = useRef();
    const nodeBoundsById = createNodeBoundsMap(nodes, bounds);
    function getNextNavigableNode(direction, compareCenters, current, listOfObjects) {
        if (!listOfObjects)
            return current;
        if (!current)
            return listOfObjects[0];
        const currBB = nodeBoundsById.get(current.id);
        if (!currBB)
            return listOfObjects[0];
        let nextObject = current; //init to current object
        let nextDistance = Number.MAX_VALUE;
        // If an object is in contact it overrules all other attributes
        // Only another in contact object with better attributes will have higher precedence
        let nextInContact = false;
        // Whether or not the for loop has encountered the current object
        let hasFoundCurrent = false;
        let object, inContact, distance;
        for (let i = 0; i < listOfObjects.length; i++) {
            object = listOfObjects[i];
            if (object === current) {
                hasFoundCurrent = true;
                continue;
            }
            const objBB = nodeBoundsById.get(object.id);
            if (!objBB)
                continue;
            const objBounds = { x: objBB.x, y: objBB.y, w: objBB.w, h: objBB.h };
            const currBounds = { x: currBB.x, y: currBB.y, w: currBB.w, h: currBB.h };
            if (!isValidDestination(objBounds, currBounds, direction, compareCenters))
                continue;
            inContact = calcInContact(objBounds, currBounds, direction);
            if (nextInContact && !inContact)
                continue;
            distance = calcDistanceAngleWeighted(objBounds, currBounds, direction);
            if (distance == 0 && !hasFoundCurrent)
                continue;
            // Make sure incontact flag have highest precedence
            if ((!nextInContact && inContact) ||
                (distance < nextDistance && ((nextInContact && inContact) || !nextInContact))) {
                nextDistance = distance;
                nextObject = object;
                nextInContact = inContact;
            }
        }
        return nextObject;
    }
    /**
     * Get next navigavle link depending on direction - clockwise or conter clockwise.
     * The decision is made based on location of nodes centers rather than link paths or link angles.
     */
    function getNextNavigableLink(direction, listOfNodes, currentLink, listOfLinks) {
        if (!listOfLinks)
            return currentLink;
        if (!currentLink)
            return listOfLinks[0];
        const keyboardFocusNode = currentKeyboardFocusNode.current;
        const nodeId = keyboardFocusNode ? keyboardFocusNode : currentLink.startNode;
        const node = getNodeDetailFromInfo({ id: nodeId, isNode: true }, listOfNodes);
        if (!node)
            return currentLink;
        const adjLinks = getNavigableLinksForNodeId(node.id, listOfLinks);
        listOfLinks = adjLinks;
        const linksWithSortingAttributes = addSortingAttributes(node, listOfLinks, listOfNodes, nodeBoundsById);
        linksWithSortingAttributes.sort(getLinkComparator());
        //clockwise direction
        const bForward = direction == 'down' ? true : false;
        let index = 0;
        for (let i = 0; i < linksWithSortingAttributes.length; i++) {
            const link = linksWithSortingAttributes[i];
            if (link.id === currentLink.id) {
                if (bForward)
                    index = i == linksWithSortingAttributes.length - 1 ? 0 : i + 1;
                else
                    index = i == 0 ? linksWithSortingAttributes.length - 1 : i - 1;
                break;
            }
        }
        return linksWithSortingAttributes[index];
    }
    /**
     * Returns the link detail when a node to link navigation occurs
     */
    function navigateFromNodeToLink(listOfLinks, event, node) {
        if (!node)
            return undefined;
        const adjLinks = getNavigableLinksForNodeId(node.id, listOfLinks);
        if (adjLinks.length < 1)
            return undefined;
        let link = adjLinks[0];
        const nodeBB = nodeBoundsById.get(node.id);
        let object, currNode, currNodeBB, currNodeBBCenterX;
        const nodeCenterX = nodeBB.x + nodeBB.w / 2;
        currentKeyboardFocusNode.current = node.id;
        for (let i = 0; i < adjLinks.length; i++) {
            object = adjLinks[i];
            currNode = object.startNode === node.id ? object.endNode : object.startNode;
            currNodeBB = nodeBoundsById.get(currNode);
            currNodeBBCenterX = currNodeBB.x + currNodeBB.w / 2;
            if (
            // equivalent of ≤ and ≥
            (event.altKey && event.code === 'Comma' && currNodeBBCenterX <= nodeCenterX) ||
                (event.altKey && event.code === 'Period' && currNodeBBCenterX >= nodeCenterX)) {
                link = object;
                break;
            }
        }
        return { id: link.id, isNode: false };
    }
    /**
     * Returns the node detail when a link to node navigation occurs
     */
    function navigateFromLinkToNode(linkId, event) {
        const key = event.key;
        const linkData = linkIdToDataMap.get(linkId);
        const startNodeBB = nodeBoundsById.get(linkData.startNode);
        const endNodeBB = nodeBoundsById.get(linkData.endNode);
        if (!startNodeBB || !endNodeBB)
            return undefined;
        const startNodeCenterX = startNodeBB.x + startNodeBB.w / 2;
        const endNodeCenterX = endNodeBB.x + endNodeBB.w / 2;
        const newNode = (endNodeCenterX > startNodeCenterX && key === 'ArrowRight') ||
            (endNodeCenterX < startNodeCenterX && key === 'ArrowLeft')
            ? linkData.endNode
            : linkData.startNode;
        return { id: newNode, isNode: true };
    }
    return {
        isNode: (itemInfo) => {
            let node, link;
            for (let i = 0; i < nodes.length; i++) {
                node = nodes[i];
                link = links[i];
                if (itemInfo.id === node.id) {
                    return true;
                }
                if (itemInfo.id === link.id) {
                    return true;
                }
            }
            return false;
        },
        getNextNavigableNode,
        getNextNavigableLink,
        navigateFromNodeToLink,
        navigateFromLinkToNode
    };
}

const DEFAULT_KB_PAN = 15;
const DEFAULT_KB_ZOOM = 0.15;
function useEvents(touchResponse, initNode, nodes, links, nodeBounds, linkIdToDataMap, nodeIdToDataMap, nodeIdToIndexMap, width, height, maxZoom, onItemHover, onItemFocus, kbPanCallback, kbZoomCallback) {
    const { getNextNavigableNode, getNextNavigableLink, navigateFromNodeToLink, navigateFromLinkToNode } = useDiagramNavigation(nodes, links, nodeBounds, linkIdToDataMap);
    const [focusedItemInfo, setfocusedItemInfo] = useState({
        id: initNode.id,
        isNode: true
    });
    const [hoveredItemInfo, sethoveredItemInfo] = useState();
    const activeId = useRef();
    const cancelEvent = (event) => {
        event.preventDefault();
        event.stopPropagation();
    };
    const keyDownHandler = (event) => {
        const key = event.key;
        let eventConsumed = false;
        // tabbing out of the diagram
        if (key === 'TAB') {
            return;
        }
        // if this a switch from node to link or vice versa
        if (isChangeItemType(event)) {
            const nextItemInfo = focusedItemInfo.isNode
                ? navigateFromNodeToLink(links, event, getNodeDetailFromInfo(focusedItemInfo, nodes))
                : navigateFromLinkToNode(focusedItemInfo.id, event);
            handleKeyboardInput(nextItemInfo);
            eventConsumed = true;
        }
        else if (isNavigationEvent(key)) {
            const nextItemInfo = handleKeyboardNavigationEvent(key);
            handleKeyboardInput(nextItemInfo);
            eventConsumed = true;
        }
        else {
            switch (key) {
                case 'PageUp': {
                    kbPanCallback &&
                        kbPanCallback({
                            dPan: {
                                dx: event.shiftKey ? -DEFAULT_KB_PAN : 0,
                                dy: event.shiftKey ? 0 : -DEFAULT_KB_PAN
                            }
                        });
                    eventConsumed = true;
                    break;
                }
                case 'PageDown': {
                    kbPanCallback &&
                        kbPanCallback({
                            dPan: {
                                dx: event.shiftKey ? DEFAULT_KB_PAN : 0,
                                dy: event.shiftKey ? 0 : DEFAULT_KB_PAN
                            }
                        });
                    eventConsumed = true;
                    eventConsumed = true;
                    break;
                }
                case '+':
                case '=': {
                    kbZoomCallback && kbZoomCallback({ dZoom: DEFAULT_KB_ZOOM });
                    eventConsumed = true;
                    break;
                }
                case '-':
                case '_': {
                    kbZoomCallback && kbZoomCallback({ dZoom: -DEFAULT_KB_ZOOM });
                    eventConsumed = true;
                    break;
                }
                case '0': {
                    if (event.ctrlKey && event.altKey) {
                        const { centerX, centerY, zoom } = zoomAndCenterItemFromInfo(focusedItemInfo, linkIdToDataMap, nodeBounds, nodeIdToIndexMap, width, height, maxZoom);
                        kbZoomCallback && kbZoomCallback({ nZoom: zoom });
                        kbPanCallback && kbPanCallback({ nPan: { cx: centerX, cy: centerY } });
                    }
                    else {
                        // zoom to fit
                        kbZoomCallback && kbZoomCallback({});
                        kbPanCallback && kbPanCallback({ center: true });
                    }
                    eventConsumed = true;
                }
            }
        }
        if (eventConsumed) {
            cancelEvent(event);
        }
    };
    const keyUpHandler = (event) => {
        const key = event.code;
        switch (key) {
            case 'Tab': {
                updatefocusedItemInfo({
                    ...focusedItemInfo,
                    isCurrent: true,
                    isFocusVisible: true
                });
                break;
            }
        }
    };
    const blurHandler = () => {
        if (hoveredItemInfo != null || focusedItemInfo.isCurrent) {
            onItemFocus?.({ id: undefined, data: undefined });
        }
        const itemInfo = { ...focusedItemInfo, isCurrent: false, isFocusVisible: false };
        setfocusedItemInfo(itemInfo);
    };
    const onHover = (event) => {
        const itemInfo = getNavigableInfo(event.target);
        if (itemInfo && !isEqualItem(itemInfo, hoveredItemInfo)) {
            sethoveredItemInfo({ ...itemInfo, isCurrent: true });
            activeId.current = getRandomId();
            setfocusedItemInfo({ ...focusedItemInfo, isCurrent: false });
            if (itemInfo.isNode) {
                onItemHover?.({
                    id: itemInfo.id,
                    type: 'node',
                    data: nodeIdToDataMap.get(itemInfo.id)
                });
            }
            else {
                onItemHover?.({
                    id: itemInfo.id,
                    type: 'link',
                    data: linkIdToDataMap.get(itemInfo.id)
                });
            }
        }
    };
    const onHoverLeave = () => {
        sethoveredItemInfo(undefined);
        activeId.current = undefined;
        onItemHover?.({ id: undefined, data: undefined });
    };
    const hoverHandlers = useVisHover(onHover, undefined, onHoverLeave, touchResponse);
    const pointerUpHandler = (event) => {
        const itemInfo = getNavigableInfo(event.target);
        if (itemInfo.id != null) {
            setfocusedItemInfo(itemInfo);
            activeId.current = getRandomId();
        }
    };
    function updatefocusedItemInfo(itemInfo) {
        if (itemInfo.isNode) {
            onItemFocus?.({
                id: itemInfo.id,
                type: 'node',
                data: nodeIdToDataMap.get(itemInfo.id)
            });
        }
        else {
            onItemFocus?.({
                id: itemInfo.id,
                type: 'link',
                data: linkIdToDataMap.get(itemInfo.id)
            });
        }
        activeId.current = getRandomId();
        setfocusedItemInfo(itemInfo);
    }
    function handleKeyboardInput(item) {
        if (!item)
            return;
        if (!isEqualItem(item, focusedItemInfo)) {
            item.isCurrent = true;
            item.isFocusVisible = true;
            if (hoveredItemInfo) {
                sethoveredItemInfo({ ...hoveredItemInfo, isCurrent: false });
            }
            updatefocusedItemInfo(item);
        }
    }
    function isNavigationEvent(key) {
        switch (key) {
            case 'ArrowDown':
            case 'ArrowUp':
            case 'ArrowRight':
            case 'ArrowLeft': {
                return true;
            }
        }
        return false;
    }
    function isChangeItemType(event) {
        const key = event.code;
        // check if switching from node to link
        // equivalent of ≤ and ≥
        if (focusedItemInfo.isNode && event.altKey && (key === 'Period' || key === 'Comma')) {
            return true;
            // check if switching from link to node
        }
        else if (!focusedItemInfo.isNode && (key === 'ArrowLeft' || key === 'ArrowRight')) {
            return true;
        }
        return false;
    }
    function handleKeyboardNavigationEvent(key) {
        let direction = 'down';
        switch (key) {
            case 'ArrowDown': {
                direction = 'down';
                break;
            }
            case 'ArrowUp': {
                direction = 'up';
                break;
            }
            case 'ArrowRight': {
                direction = 'right';
                break;
            }
            case 'ArrowLeft': {
                direction = 'left';
                break;
            }
        }
        if (focusedItemInfo.isNode) {
            const itemDetail = getNextNavigableNode(direction, true, getNodeDetailFromInfo(focusedItemInfo, nodes), nodes);
            return itemDetail ? { id: itemDetail.id, isNode: true } : focusedItemInfo;
        }
        else {
            const linkDetail = getLinkDetailFromInfo(focusedItemInfo, links);
            const itemDetail = getNextNavigableLink(direction, nodes, linkDetail, links);
            return itemDetail ? { id: itemDetail.id } : { id: focusedItemInfo.id };
        }
    }
    return {
        focusedItemInfo,
        hoveredItemInfo,
        activeId: activeId.current,
        eventsProps: mergeProps(hoverHandlers, {
            onKeyUp: keyUpHandler,
            onKeyDown: keyDownHandler,
            onBlur: blurHandler,
            onPointerUp: pointerUpHandler
        })
    };
}

/**
 * Returns the datatip.
 * @param text The text string for the diagram item.
 * @param rootRef The ref for root of the diagram.
 * @param focusedItemBoundsRef The ref for focused item bounds.
 * @param focusedItemInfo The ItemInfo for focused item.
 * @returns
 */
const useDiagramDatatip = ({ touchResponse, datatip, focusedItemBoundsRef, focusedItemInfo, panState, zoom, width, nodesMap, linksMap, hoveredItem }) => {
    const { direction } = useUser();
    const isRtl = direction === 'rtl';
    const datatipC = getDatatipContent(nodesMap, linksMap, focusedItemInfo, hoveredItem, datatip);
    const elementBounds = focusedItemInfo?.isCurrent
        ? {
            x: focusedItemBoundsRef.current.x * zoom + panState.panX,
            y: focusedItemBoundsRef.current.y * zoom + panState.panY,
            width: focusedItemBoundsRef.current.w * zoom,
            height: focusedItemBoundsRef.current.h * zoom
        }
        : undefined;
    const { datatipContent, datatipProps } = useDatatip({
        content: datatipC?.content,
        borderColor: datatipC?.borderColor,
        placement: 'top-start',
        offset: calculateOffset(isRtl, width, elementBounds),
        anchor: focusedItemInfo?.isCurrent ? 'element' : 'pointer',
        touchResponse
    });
    return { datatipContent: datatipContent, datatipProps: datatipProps };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const usePointerGesture = ({ captureTargetRef, numPointers = 1, onPointerGestureDown, onPointerGestureMove, onPointerGestureEnd, onExtraneousPointerDown, isDisabled = false }) => {
    const activePointers = useRef([]);
    if (isDisabled) {
        activePointers.current = [];
    }
    const onPointerDown = (e) => {
        activePointers.current.push(e);
        if (activePointers.current.length === numPointers) {
            onPointerGestureDown && onPointerGestureDown({ pointers: activePointers.current });
        }
        else if (activePointers.current.length > numPointers) {
            onExtraneousPointerDown && onExtraneousPointerDown({ pointers: activePointers.current });
        }
    };
    const onPointerMove = (e) => {
        if (activePointers.current.length === 0)
            return;
        const index = activePointers.current.findIndex((pointerEvent) => pointerEvent.pointerId === e.pointerId);
        if (index === -1)
            return;
        activePointers.current[index] = e;
        if (activePointers.current.length === numPointers) {
            activePointers.current.forEach((e) => captureTargetRef.current.setPointerCapture(e.pointerId));
            onPointerGestureMove && onPointerGestureMove({ pointers: activePointers.current });
        }
    };
    const onPointerUp = (e) => {
        const index = activePointers.current.findIndex((pointerEvent) => pointerEvent.pointerId === e.pointerId);
        if (index === -1)
            return;
        activePointers.current[index] = e;
        if (activePointers.current.length === numPointers) {
            onPointerGestureEnd && onPointerGestureEnd({ pointers: activePointers.current });
        }
        activePointers.current.splice(index, 1);
    };
    const onPointerCancel = onPointerUp;
    const onPointerLeave = onPointerUp;
    return isDisabled
        ? {}
        : {
            onPointerDown,
            onPointerMove,
            onPointerUp,
            onPointerCancel,
            onPointerLeave
        };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Whether point with coordinates are in the draggable region
 */
const inDraggableRegion = (x, y, region) => {
    if (!region)
        return true;
    const { xMin, xMax, yMin, yMax } = region;
    return x >= xMin && x <= xMax && y >= yMin && y <= yMax;
};
/**
 * Returns region offset
 */
const getRegionOffset = (x, y, region) => {
    if (!region)
        return { regionOffsetX: x, regionOffsetY: y };
    return { regionOffsetX: x - region.xMin, regionOffsetY: y - region.yMin };
};
const useDrag = ({ captureTargetRef, draggableRegion, onDragStart, onDragMove, onDragEnd, isDisabled = false }) => {
    const inactiveState = { isDragging: false, x0: -1, y0: -1, regionOffsetX: -1, regionOffsetY: -1 };
    const dragState = useRef(inactiveState);
    const handlePointerEvent = (e, cb) => {
        const { isDragging, x0, y0, regionOffsetX, regionOffsetY } = dragState.current;
        if (!isDragging)
            return;
        const x = e.pageX;
        const y = e.pageY;
        cb && cb({ x, y, dx: x - x0, dy: y - y0, regionOffsetX, regionOffsetY, originalEvent: e });
    };
    const dragProps = usePointerGesture({
        captureTargetRef,
        numPointers: 1, // Only allow 1 pointer dragging
        onExtraneousPointerDown: () => {
            dragState.current = inactiveState;
        },
        onPointerGestureDown: ({ pointers: [e] }) => {
            const x = e.pageX;
            const y = e.pageY;
            if (e.button !== 0 || !inDraggableRegion(x, y, draggableRegion))
                return;
            const { regionOffsetX, regionOffsetY } = getRegionOffset(x, y, draggableRegion);
            dragState.current = { isDragging: true, x0: x, y0: y, regionOffsetX, regionOffsetY };
            onDragStart && onDragStart({ x, y, regionOffsetX, regionOffsetY, originalEvent: e });
        },
        onPointerGestureMove: ({ pointers: [e] }) => {
            handlePointerEvent(e, onDragMove);
        },
        onPointerGestureEnd: ({ pointers: [e] }) => {
            handlePointerEvent(e, onDragEnd);
            dragState.current = inactiveState;
        }
    });
    return isDisabled ? {} : dragProps;
};

const constrainPan = (previousPan, nextPan, panBounds, panDirection) => {
    const panX = panDirection !== 'y' ? nextPan.panX : previousPan.panX;
    const panY = panDirection !== 'x' ? nextPan.panY : previousPan.panY;
    return {
        panX: panX > panBounds.maxX || panX < panBounds.minX ? previousPan.panX : panX,
        panY: panY > panBounds.maxY || panY < panBounds.minY ? previousPan.panY : panY
    };
};
const pan = (previousPan, nextPan, panDirection, zoom, width, height, panBounds, onPanChange) => {
    if (!panBounds) {
        //On initial render before nodes are rendered
        return { newPan: { panX: 0, panY: 0 } };
    }
    const newPan = constrainPan(previousPan, nextPan, panBounds, panDirection);
    const isPanChanged = newPan.panX !== previousPan.panX || newPan.panY !== previousPan.panY;
    const center = panXYToCenterXY(newPan.panX, newPan.panY, zoom, width, height);
    isPanChanged &&
        onPanChange &&
        onPanChange({
            centerX: center.centerX,
            centerY: center.centerY
        });
    return { newPan };
};
const getPanBounds = (width, height, elemBounds, panType, zoom, minZoom, initPanZoomState) => {
    const { x, y, w, h } = elemBounds;
    let minX, maxX, minY, maxY;
    if (panType === 'centerContent') {
        minX = width / 2 - (w + x) * zoom;
        minY = height / 2 - (h + y) * zoom;
        maxX = width / 2 - x * zoom;
        maxY = height / 2 - y * zoom;
    }
    else {
        // panType equals fixed
        const zoomRatio = zoom / minZoom;
        // Find left corner of the content at min zoom and content is centered
        const minZoomX = (width - w * minZoom) / 2 - x * minZoom;
        const minZoomY = (height - h * minZoom) / 2 - y * minZoom;
        // When we pan all the way to the right, the left corner of displayable area is 0,0 as in min zoom.
        // When we pan all the way to the left, lets find the corner of the displayable area
        const leftCornerX = width - width * zoomRatio;
        const leftCornerY = height - height * zoomRatio;
        // Now we have everything to calculate pan zoom constraints
        minX = leftCornerX + minZoomX * zoomRatio;
        minY = leftCornerY + minZoomY * zoomRatio;
        maxX = minZoomX * zoomRatio;
        maxY = minZoomY * zoomRatio;
    }
    const initZoom = initPanZoomState.zoom;
    const initCenterX = initPanZoomState.centerX;
    const initCenterY = initPanZoomState.centerY;
    // If an initial panZoomState is set, should expand pan bounds to include it
    let dx, dy;
    if (initCenterX) {
        const boundsX = initCenterX * initZoom - width / 2;
        if (-boundsX * initZoom < minX) {
            dx = minX - boundsX * initZoom;
            minX -= dx;
            maxX += dx;
        }
        else if (-boundsX * initZoom > maxX) {
            dx = -boundsX * initZoom - maxX;
            minX -= dx;
            maxX += dx;
        }
    }
    if (initCenterY) {
        const boundsY = initCenterY * initZoom - height / 2;
        if (-boundsY * initZoom < minY) {
            dy = minY - boundsY * initZoom;
            minY -= dy;
            maxY += dy;
        }
        else if (-boundsY * initZoom > maxY) {
            dy = -boundsY * initZoom - maxY;
            minY -= dy;
            maxY += dy;
        }
    }
    return {
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY
    };
};

const useDragPan = ({ panProps, captureTargetRef, panBounds, width, height, zoom, onDragPanStart, onDragPanEnd }) => {
    const prevPanState = useRef({ panX: 0, panY: 0 });
    const initialPanState = useRef({ panX: 0, panY: 0 });
    const dragProps = useDrag({
        captureTargetRef,
        onDragStart: () => {
            const panValues = centerXYToPanXY(panProps.centerX, panProps.centerY, zoom, width, height);
            initialPanState.current = {
                panX: panValues.panX,
                panY: panValues.panY
            };
            onDragPanStart && onDragPanStart();
        },
        onDragMove: ({ dx, dy }) => {
            const nextPan = {
                panX: initialPanState.current.panX + dx,
                panY: initialPanState.current.panY + dy
            };
            const { newPan } = pan(prevPanState.current, nextPan, panProps.panDirection, zoom, width, height, panBounds, panProps.onPan);
            prevPanState.current = newPan;
        },
        onDragEnd: ({ originalEvent }) => {
            // If panning occurred, call preventDefault to prevent selection from occurring
            if (initialPanState.current.panX !== prevPanState.current.panX ||
                initialPanState.current.panY !== prevPanState.current.panY)
                originalEvent.preventDefault();
            onDragPanEnd && onDragPanEnd();
        },
        isDisabled: panProps.panning === 'off'
    });
    return dragProps;
};

const PX_FACTOR_PER_LINE = 15; // Value used in Toolkit
const PX_FACTOR_PER_PAGE = 40; // Value copied from datagrid; this is not handled in Toolkit
const getNormalizedDelta = (e) => {
    const { deltaX, deltaY, deltaMode } = e;
    switch (deltaMode) {
        case e.DOM_DELTA_PIXEL:
            return { deltaX: -deltaX, deltaY: -deltaY };
        case e.DOM_DELTA_LINE:
            return { deltaX: -deltaX * PX_FACTOR_PER_LINE, deltaY: -deltaY * PX_FACTOR_PER_LINE };
        case e.DOM_DELTA_PAGE:
            return { deltaX: -deltaX * PX_FACTOR_PER_PAGE, deltaY: -deltaY * PX_FACTOR_PER_PAGE };
        default:
            return { deltaX: -deltaX, deltaY: -deltaY };
    }
};
const useWheel = ({ onWheel: onWheelCallback, preventDefault = true, isDisabled = false }) => {
    const onWheel = (e) => {
        const { deltaX, deltaY } = getNormalizedDelta(e);
        if (preventDefault)
            e.preventDefault();
        onWheelCallback({
            x: e.offsetX,
            y: e.offsetY,
            deltaX,
            deltaY,
            ctrlKey: e.ctrlKey || e.metaKey
        });
    };
    return isDisabled ? {} : { onWheel };
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const ZOOM_INCREMENT = 0.05;
const zoom = (nextZoom, zoom, minZoom, maxZoom, onZoomChange) => {
    const newZoom = nextZoom > maxZoom || nextZoom < minZoom ? zoom : nextZoom;
    const isZoomChanged = newZoom !== zoom;
    isZoomChanged &&
        onZoomChange &&
        onZoomChange({
            zoomValue: newZoom
        });
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const useWheelZoom = ({ zooming, minZoom, maxZoom, zoomValue, onZoom }) => {
    const wheelProps = useWheel({
        onWheel: ({ deltaY }) => {
            const newZoom = zoomValue * (1 + ZOOM_INCREMENT * deltaY);
            zoom(newZoom, zoomValue, minZoom, maxZoom, onZoom);
        },
        isDisabled: zooming === 'off'
    });
    return wheelProps;
};

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
const getMidpoint = (p1, p2) => ({ x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2 });
const getDistance = (p1, p2) => Math.sqrt((p2.x - p1.x) ** 2 + (p2.y - p2.y) ** 2);
const usePinch = ({ captureTargetRef, onPinchZoomStart, onPinchZoomChange, onPinchZoomEnd, isDisabled = false }) => {
    const origin = useRef({ x: -1, y: -1 });
    const prevDistance = useRef(-1);
    const reset = () => {
        origin.current = { x: -1, y: -1 };
        prevDistance.current = -1;
    };
    if (isDisabled)
        reset();
    const pinchProps = usePointerGesture({
        captureTargetRef,
        numPointers: 2, // Pinch gesture requires 2 pointers
        onPointerGestureDown: ({ pointers: [pointer1, pointer2] }) => {
            const p1 = { x: pointer1.offsetX, y: pointer1.offsetY };
            const p2 = { x: pointer2.offsetX, y: pointer2.offsetY };
            origin.current = getMidpoint(p1, p2);
            prevDistance.current = getDistance(p1, p2);
            onPinchZoomStart &&
                onPinchZoomStart({
                    origin: origin.current,
                    delta: 0
                });
        },
        onPointerGestureMove: ({ pointers: [pointer1, pointer2] }) => {
            const p1 = { x: pointer1.offsetX, y: pointer1.offsetY };
            const p2 = { x: pointer2.offsetX, y: pointer2.offsetY };
            const distance = getDistance(p1, p2);
            const delta = distance - prevDistance.current;
            prevDistance.current = distance;
            onPinchZoomChange &&
                onPinchZoomChange({
                    origin: origin.current,
                    delta
                });
        },
        onPointerGestureEnd: () => {
            reset();
            onPinchZoomEnd && onPinchZoomEnd();
        }
    });
    return isDisabled ? {} : pinchProps;
};

const usePinchZoom = ({ captureTargetRef, zooming, minZoom, maxZoom, zoomValue, onZoom }) => {
    const pinchProps = usePinch({
        captureTargetRef,
        onPinchZoomChange: ({ delta }) => {
            const newZoom = zoomValue * (1 + ZOOM_INCREMENT * delta);
            zoom(newZoom, zoomValue, minZoom, maxZoom, onZoom);
        },
        isDisabled: zooming === 'off'
    });
    return pinchProps;
};

const usePanZoom = ({ props, captureTargetRef, width, height, contentBounds }) => {
    const [cursor, setCursor] = useState();
    const zoomProps = getZoomProps(props, width, height, contentBounds);
    const panProps = getPanProps(props, contentBounds);
    const panBounds = useRef();
    const prevZoom = useRef();
    const panning = useRef();
    const initPanZoomState = useRef({
        zoom: props.zoomValue || 0,
        centerX: props.centerX,
        centerY: props.centerY
    });
    if (contentBounds.w !== Infinity &&
        (zoomProps.zoomValue !== prevZoom.current || panProps.panning !== panning.current)) {
        panBounds.current = getPanBounds(width, height, contentBounds, panProps.panning, zoomProps.zoomValue, zoomProps.minZoom, initPanZoomState.current);
        prevZoom.current = zoomProps.zoomValue;
        panning.current = panProps.panning;
    }
    const dragPanProps = useDragPan({
        panProps: panProps,
        captureTargetRef: captureTargetRef,
        panBounds: panBounds.current,
        zoom: zoomProps.zoomValue,
        width,
        height,
        onDragPanStart: () => setCursor('grabbing'),
        onDragPanEnd: () => setCursor('auto')
    });
    //dZoom or nZoom is required
    const kbZoomCallback = (props) => {
        const newZoom = props.dZoom
            ? zoomProps.zoomValue + props.dZoom
            : getZoomToFitZoom(width, height, contentBounds);
        zoom(props.nZoom ? props.nZoom : newZoom, zoomProps.zoomValue, zoomProps.minZoom, zoomProps.maxZoom, zoomProps.onZoom);
    };
    const prevPanState = useRef({ panX: 0, panY: 0 });
    // dPan or nPan is required
    const kbPanCallback = (props) => {
        let centerX;
        let centerY;
        if (props.center) {
            centerX = contentBounds.x + contentBounds.w / 2;
            centerY = contentBounds.y + contentBounds.h / 2;
        }
        else if (props.dPan) {
            centerX = panProps.centerX + props.dPan.dx;
            centerY = panProps.centerY + props.dPan.dy;
        }
        else {
            centerX = props.nPan.cx;
            centerY = props.nPan.cy;
        }
        const panValues = centerXYToPanXY(centerX, centerY, zoomProps.zoomValue, width, height);
        const { newPan } = pan(prevPanState.current, panValues, panProps.panDirection, zoomProps.zoomValue, width, height, panBounds.current, panProps.onPan);
        prevPanState.current = newPan;
    };
    const wheelZoomProps = useWheelZoom(zoomProps);
    const pinchZoomProps = usePinchZoom({
        captureTargetRef,
        zooming: zoomProps.zooming,
        minZoom: zoomProps.minZoom,
        maxZoom: zoomProps.maxZoom,
        zoomValue: zoomProps.zoomValue,
        onZoom: zoomProps.onZoom
    });
    const panZoomProps = mergeProps(dragPanProps, wheelZoomProps, pinchZoomProps);
    return {
        panZoomProps,
        cursor,
        centerX: panProps.centerX,
        centerY: panProps.centerY,
        zoomValue: zoomProps.zoomValue,
        kbPanCallback: panProps.panning !== 'off' ? kbPanCallback : undefined,
        kbZoomCallback: zoomProps.zooming !== 'off' ? kbZoomCallback : undefined
    };
};

function useDiagramSelection({ selectedIds, selectionMode, nodeMap, linkMap, focusedItemInfo, onSelectionChange, rootRef }) {
    const nodeIdToIndexMap = nodeMap.itemIdToIndexMap;
    const nodeIndexToIdMap = nodeMap.itemIndexToIdMap;
    const linkIdToIndexMap = linkMap.itemIdToIndexMap;
    const linkIndexToIdMap = linkMap.itemIndexToIdMap;
    const encodeNodeId = (id) => `N_${nodeIdToIndexMap.get(id)}`;
    const decodeNodeId = (id) => nodeIndexToIdMap.get(Number(id.slice(2)));
    const encodeLinkId = (id) => `L_${linkIdToIndexMap.get(id)}`;
    const decodeLinkId = (id) => linkIndexToIdMap.get(Number(id.slice(2)));
    const encodedNodesSelection = selectedIds.nodes ? selectedIds.nodes.map(encodeNodeId) : [];
    const encodedLinksSelection = selectedIds.links ? selectedIds.links.map(encodeLinkId) : [];
    const encodedSelection = [...encodedNodesSelection, ...encodedLinksSelection];
    const idExtracter = (event) => {
        // return encodeNodeId(id) or encodeLinkId(id) depending on node or link selection or undefined if clicked on empty space
        const info = event.type === 'keyup'
            ? focusedItemInfo
            : getNavigableInfo(event.target, rootRef);
        return info.id !== undefined
            ? info.isNode
                ? encodeNodeId(info.id)
                : encodeLinkId(info.id)
            : undefined;
    };
    const onEncodedSelectionChange = (detail) => {
        const newSelectedNodeIds = detail.ids
            .filter((encId) => encId[0] === 'N')
            .map((encId) => decodeNodeId(encId));
        const newSelectedLinkIds = detail.ids
            .filter((encId) => encId[0] === 'L')
            .map((encId) => decodeLinkId(encId));
        const nodeData = newSelectedNodeIds.map((selectedId) => {
            return nodeMap.itemIdToDataMap.get(selectedId);
        });
        const linkData = newSelectedLinkIds.map((selectedId) => {
            return linkMap.itemIdToDataMap.get(selectedId);
        });
        return (onSelectionChange &&
            onSelectionChange({
                nodes: newSelectedNodeIds,
                links: newSelectedLinkIds,
                nodeData,
                linkData
            }));
    };
    const getDataById = (id) => {
        let data;
        if (id[0] === 'N') {
            const nodeId = decodeNodeId(id);
            data = nodeMap.itemIdToDataMap.get(nodeId);
        }
        else if (id[0] === 'L') {
            const linkId = decodeLinkId(id);
            data = linkMap.itemIdToDataMap.get(linkId);
        }
        return data;
    };
    const { selectionContent, selectionProps } = useSelection({
        selection: encodedSelection,
        idExtracter,
        selectionMode,
        getDataById,
        onChange: onEncodedSelectionChange
    });
    return { selectionContent, selectionProps };
}

function DiagramWithDimensions({ nodes = [], links = [], width, height, selectedIds = {}, selectionMode = 'none', layout, nodeRenderer, linkRenderer, onSelectionChange, onItemHover, onItemFocus, highlightedIds = {}, datatip, ...otherProps }) {
    const focusedItemBoundsRef = useRef(null);
    const rootRef = useRef(null);
    //TODO JET-62563 change bounds to a MAP
    const [bounds, setBounds] = useState([]);
    const [combinedLabelBounds, setCombinedLabelBounds] = useState();
    const { direction } = useUser();
    const diagramNodes = nodes;
    const nodeMap = createItemMap(diagramNodes);
    const nodeIdToDataMap = nodeMap.itemIdToDataMap;
    const diagramLinks = filterLinksWithNoEndNodes(links, nodeIdToDataMap);
    const linkMap = createItemMap(diagramLinks);
    const linkIdToDataMap = linkMap.itemIdToDataMap;
    const resizeThrottling = useRef(false);
    const newDimensions = getDimensionsFromBounds(bounds);
    const { textMeasureContent, getTextDimensions } = useTextDimensions();
    const labelDimensions = useRef(new Map());
    const nodeLabelPosRef = useRef([]);
    const linkLabelPosRef = useRef([]);
    const contentBounds = getContentBounds(bounds, combinedLabelBounds);
    const { panZoomProps, cursor, centerX, centerY, zoomValue, kbPanCallback, kbZoomCallback } = usePanZoom({
        props: otherProps,
        captureTargetRef: rootRef,
        width: width,
        height: height,
        contentBounds
    });
    const { touchResponse, touchResponseStyle } = useVisTouchResponse({
        type: 'auto',
        supportsTouchDragGestures: otherProps.zooming === 'on' || (!!otherProps.panning && otherProps.panning !== 'off'),
        rootRef
    });
    const { focusedItemInfo, hoveredItemInfo, activeId, eventsProps } = useEvents(touchResponse, diagramNodes[0], diagramNodes, diagramLinks, bounds, linkIdToDataMap, nodeIdToDataMap, nodeMap.itemIdToIndexMap, width, height, otherProps.maxZoom || 1, onItemHover, onItemFocus, kbPanCallback, kbZoomCallback);
    const { selectionProps, selectionContent } = useDiagramSelection({
        selectedIds,
        selectionMode,
        nodeMap,
        linkMap,
        focusedItemInfo,
        onSelectionChange,
        rootRef
    });
    // This is for the datatip kb position
    if (focusedItemInfo && bounds.length > 0) {
        focusedItemBoundsRef.current = getFocusedItemBounds(focusedItemInfo, bounds, diagramLinks, nodeMap.itemIdToIndexMap, linkMap.itemIdToIndexMap);
    }
    const { datatipContent, datatipProps: { 'aria-describedby': datatipAriaDescribedby, ...datatipProps } } = useDiagramDatatip({
        touchResponse,
        datatip,
        focusedItemInfo,
        focusedItemBoundsRef,
        panState: centerXYToPanXY(centerX, centerY, zoomValue, width, height),
        zoom: zoomValue,
        width: width,
        nodesMap: nodeIdToDataMap,
        linksMap: linkIdToDataMap,
        hoveredItem: hoveredItemInfo
    });
    const style = {
        width: width,
        height: height,
        cursor: cursor,
        ...touchResponseStyle
    };
    const states = useRef();
    const previousState = states.current // states.current is previous state
        ? states.current
        : {
            selectedNodeIds: [],
            selectedLinkIds: [],
            focusedId: undefined,
            hoveredId: undefined,
            activeId: undefined,
            highlightedIds: [],
            zoom: 0
        };
    states.current = {
        // update states to new state
        selectedNodeIds: selectedIds.nodes ?? [],
        selectedLinkIds: selectedIds.links ?? [],
        focusedId: focusedItemInfo.isCurrent && focusedItemInfo.isFocusVisible ? focusedItemInfo.id : undefined,
        hoveredId: hoveredItemInfo?.isCurrent ? hoveredItemInfo.id : undefined,
        activeId,
        highlightedIds: combineIds(highlightedIds.nodes, highlightedIds.links),
        zoom: zoomValue
    };
    const mergedEventProps = mergeProps(panZoomProps, eventsProps, selectionProps, datatipProps);
    // Called anytime node changes size
    const onNodeSizeChanged = (nodeWidth, nodeHeight, idx) => {
        newDimensions[idx] = { w: nodeWidth, h: nodeHeight };
        if (resizeThrottling.current) {
            return;
        }
        resizeThrottling.current = true;
        // performs layout at the next available animation frame when all measurements should be ready
        window.requestAnimationFrame(() => {
            const { labelDims, layoutJSON } = constructLayoutJSON(diagramNodes, nodeIdToDataMap, linkIdToDataMap, newDimensions, width, height, getTextDimensions);
            labelDimensions.current = labelDims;
            const { nodePoints, nodeLabelPos, linkLabelPos } = deconstructLayoutJSON(layout(layoutJSON), diagramNodes, diagramLinks);
            nodeLabelPosRef.current = nodeLabelPos;
            linkLabelPosRef.current = linkLabelPos;
            const nodeBounds = mergeDimensions(newDimensions, nodePoints);
            setBounds(nodeBounds);
            const labelBounds = getAllLabelBounds(labelDims, diagramNodes, diagramLinks, nodeLabelPos, linkLabelPos, direction === 'rtl');
            setCombinedLabelBounds(labelBounds);
            resizeThrottling.current = false;
        });
    };
    return (jsxs("div", { ref: rootRef, class: outerStyles, ...mergedEventProps, style: style, tabIndex: 0, role: "application", "aria-label": otherProps['aria-label'], "aria-labelledby": otherProps['aria-labelledby'], "aria-describedby": merge([otherProps['aria-describedby'], datatipAriaDescribedby]), "aria-activedescendant": activeId, children: [getTextDimensions ? (jsx(DiagramPanZoomContainer, { centerX: centerX, centerY: centerY, zoom: zoomValue, width: width, height: height, children: jsx(DiagramLayers, { nodes: diagramNodes, links: diagramLinks, nodeRenderer: nodeRenderer, linkRenderer: linkRenderer, width: width, height: height, nodeBounds: bounds, states: states.current, previousStates: previousState, onNodeSizeChanged: onNodeSizeChanged, nodeLabelPositions: nodeLabelPosRef.current, linkLabelPositions: linkLabelPosRef.current, labelDimensions: labelDimensions.current, supportsSelection: selectionMode !== 'none' ||
                        !!(selectedIds?.nodes && selectedIds.nodes.length > 0) ||
                        !!(selectedIds?.links && selectedIds.links.length > 0) }) })) : undefined, textMeasureContent, datatipContent, selectionContent] }));
}

/**
 * Diagrams are used to display a set of nodes and the links between them.
 */
function Diagram({ width, height, ...otherProps }) {
    return otherProps.nodes && otherProps.nodes.length > 0 ? (jsx(TrackResizeContainer, { width: width, height: height, class: dimensionStyle, children: (width, height) => jsx(DiagramWithDimensions, { width: width, height: height, ...otherProps }) })) : null;
}

export { Diagram as D };
//# sourceMappingURL=Diagram-214e374c.js.map
