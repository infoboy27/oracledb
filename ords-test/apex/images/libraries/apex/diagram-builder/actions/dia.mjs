/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the actions (which result in a visual change) of the graph and the paper.
 */

import DiagramBuilderRouter from '../DiagramBuilderRouter.mjs';
import Element from '../cells/elements/Element.mjs';
import Link from '../cells/links/Link.mjs';
import { populateRect } from '../utils/common.mjs';
import { getLink } from '../utils/graph.mjs';

const { g } = joint;

export function scrollIntoView(paperScroller, cell, opt = {}) {
    const {
        padding = 0,
        animation = true,
        strict = true,
        center = true
    } = opt;
    const { paper } = paperScroller.options;
    const visibleArea = populateRect(paperScroller.getVisibleArea());
    const visibleCenter = visibleArea.center();
    let { x: scrollToX, y: scrollToY } = visibleCenter;

    if (cell.isElement()) {
        // We are not going to use paperScroller.isElementVisible because it wouldn't
        // scroll to el if even a tiny portion of the element was in the visible area.
        // Instead, we will focus on the element's center;
        const bbox = cell.getBBox();
        populateRect(bbox);

        if (!paperScroller.isElementVisible(cell, { strict })) {
            if (center) {
                paperScroller.scrollToElement(cell, { animation });
            }
            else {
                // is to the left of the scroller
                if (bbox.x < visibleArea.x + padding) {
                    scrollToX = scrollToX + (bbox.x - visibleArea.x) - padding;
                }
                // is to the right of the scroller
                else if (bbox.right > visibleArea.right - padding) {
                    scrollToX = scrollToX + bbox.right - visibleArea.right + padding;
                }

                // is above
                if (bbox.y < visibleArea.y + padding) {
                    scrollToY = scrollToY + (bbox.y - visibleArea.y) - padding;
                }
                // is below
                else if (bbox.bottom > visibleArea.bottom - padding) {
                    scrollToY = scrollToY + bbox.bottom - visibleArea.bottom + padding;
                }
                paperScroller.scroll(scrollToX, scrollToY, { animation });
            }
        }
    }
    else {
        const { ratio = 0 } = opt;
        const linkView = cell.findView(paper);
        paper.requireView(linkView);
        const point = linkView.getPointAtRatio(ratio);
        const { x, y } = point;

        if (!paperScroller.isPointVisible(point, padding)) {
            if (center) {
                paperScroller.scrollToLink(cell, { animation });
            }
            else {
                // is to the left of the scroller
                if (x < visibleArea.x + padding) {
                    scrollToX = scrollToX + (x - visibleArea.x) - padding;
                }
                // is to the right of the scroller
                else if (x > visibleArea.right - padding) {
                    scrollToX = scrollToX + x - visibleArea.right + padding;
                }

                // is above
                if (y < visibleArea.y + padding) {
                    scrollToY = scrollToY + (y - visibleArea.y) - padding;
                }
                // is below
                else if (y > visibleArea.bottom - padding) {
                    scrollToY = scrollToY + y - visibleArea.bottom + padding;
                }
                paperScroller.scroll(scrollToX, scrollToY, { animation });
            }
        }
    }
}

export function updateConnections(paper, links = []) {
    paper.freeze();

    links.forEach(link => {
        link.findView(paper).requestConnectionUpdate();
    });

    paper.unfreeze();
}

export function updateAllConnections(paper) {
    updateConnections(paper, paper.model.getLinks());
}

// updates only the automatic routing
export function updateAutoRoutedConnections(paper) {
    const R = DiagramBuilderRouter;
    const graph = paper.model;
    const defRouterName = paper.options.defaultRouter.name;
    const defRouterIsAuto = defRouterName === R.MANHATTAN || defRouterName === R.ADVANCED_MANHATTAN;
    const links = graph.getLinks().filter(link => {
        const routerName = link.router()?.name;
        if (routerName == null && defRouterIsAuto) {
            return true;
        }
        if (routerName === R.MANHATTAN || routerName === R.ADVANCED_MANHATTAN) {
            return true;
        }
        return false;
    });

    if (links.length) {
        updateConnections(paper, links);
    }
}

export function addElementToLinkAtRatio(elementView, linkView, ratio = .5) {
    const paper = elementView.paper;
    const graph = paper.model;
    const element = elementView.model;
    const link = linkView.model;
    const { x, y } = linkView.getPointAtRatio(ratio);
    const vertices = link.vertices();
    const target = link.target();
    const source = link.source();
    let elementBBox = element.getBBox();

    // already on the link
    if (target.id === element.id || source.id === element.id) {
        return;
    }

    paper.freeze();

    // set the element's position, point should be in the center
    const p = g.Point(x - elementBBox.width / 2, y - elementBBox.height / 2).snapToGrid(paper.options.gridSize);
    element.position(p.x, p.y);

    let vertexRatios = vertices.map(vertex => {
        return {
            vertex,
            ratio: linkView.getClosestPointRatio(vertex)
        };
    });

    link.target(element);

    const newLink = paper.getDefaultLink();
    newLink.source(element);
    newLink.target(target);
    graph.addCell(newLink);

    paper.requireView(element);

    elementBBox = element.getBBox();

    // remove the vertices that overlap the element
    vertexRatios = vertexRatios.filter(o => !elementBBox.containsPoint(o.vertex));
    // add back the vertices
    newLink.vertices(vertexRatios.filter(o => o.ratio > ratio).map(o => o.vertex));
    link.vertices(vertexRatios.filter(o => o.ratio <= ratio).map(o => o.vertex));

    paper.unfreeze();
}

export function label(graph, link, text = '', opt = {}) {
    const {
        rewrite = false,
        ...restOpt
    } = opt;

    link = getLink(graph, link);

    if (!link) {
        return;
    }

    let labels = link.labels();
    let count = labels.length;
    // if first is a designation label, our "normal" label has to be appended at index 1
    let hasDesignation = !!(labels[0]?.designation);
    let index = 0;

    // there is designation - should be placed at 1
    if (hasDesignation) {
        index = 1;
        // only designation label exists    
        if (count === 1) {
            link.label(index, Link.getLabelCfg(text, restOpt));
        }
        // both designation and normal labels exist
        else {
            if (rewrite) {
                // opt: rewrite - disregard old properties, do not merge new props to old ones
                link.label(index, Link.getLabelCfg(text, restOpt), { rewrite });
            }
            else {
                link.prop(`labels/${index}/${Link.getLabelTextPath()}`, text);
            }
        }
    }
    // no designation - should be placed at 0
    else {
        if (!count) {
            link.label(index, Link.getLabelCfg(text, restOpt));
        }
        else {
            if (rewrite) {
                // opt: rewrite - disregard old properties, do not merge new props to old ones
                link.label(index, Link.getLabelCfg(text, restOpt), { rewrite });
            }
            else {
                link.prop(`labels/${index}/${Link.getLabelTextPath()}`, text);
            }
        }
    }
}

export function removeLabel(graph, link) {
    link = getLink(graph, link);
    if (!link) { return; }

    removeLabelAt(link, 0, graph);
}

export function appendLabel(graph, link, text = '', opt = {}) {
    link = getLink(link, graph);
    if (!link) { return; }

    link.appendLabel(Link.getLabelCfg(text, opt));
}

export function removeLabelAt(graph, link, index) {
    link = getLink(link, graph);
    if (!link) { return; }

    const first = link.label(index);

    if (first?.designation) {
        index = 1;
    }

    link.removeLabel(index);
}

export function removeCells(graph, cells) {
    graph[Array.isArray(cells) ? 'removeCells' : 'removeCell'](cells);
}

export function changeElementInPlace(graph, elToChange, newEl) {
    const inboundLinks = graph.getConnectedLinks(elToChange, { inbound: true }).map(link => {
        return {
            target: link.target(),
            vertices: link.vertices(),
            link
        };
    });
    const outboundLinks = graph.getConnectedLinks(elToChange, { outbound: true }).map(link => {
        return {
            source: link.source(),
            vertices: link.vertices(),
            link
        };
    });

    const newElId = newEl.get('id');
    // Must not be async! Otherwise the sorting will bug out.
    graph.addCell(newEl, { async: false });
    // Add the links to the new element before removing the old one. Otherwise the VC will
    // trigger an "alignment" target change again and set the placeholders!
    // Restore the links to their original anchors and routing.
    inboundLinks.forEach(({ link, target, vertices }) => {
        target.id = newElId;
        link.target(target);
        link.vertices(vertices);
    });
    outboundLinks.forEach(({ link, source, vertices }) => {
        source.id = newElId;
        link.source(source);
        link.vertices(vertices);
    });

    // at the very end, remove the old element
    elToChange.remove();
}

export function toFront(cells) {
    cells = Array.isArray(cells) ? cells : [cells];
    cells.forEach(cell => cell.toFront({ deep: true }));
}

export function toBack(cells) {
    cells = Array.isArray(cells) ? cells : [cells];
    cells.forEach(cell => cell.toBack({ deep: true }));
}

export function fitToContent(paper, padding = 30) {
    paper.fitToContent({
        allowNewOrigin: 'any',
        allowNegativeBottomRight: true,
        padding
    });
}

export function canRemoveElements(els = []) {
    els = Array.isArray(els) ? els : [els];
    let canRemove = els.every(el => el.allow(Element.ALLOW_REMOVE) && !el.isReadOnly());

    // If it is possible to remove the els, check the links that these els "own": if a link
    // cannot be removed, its source/target changed, etc. - we will not allow the el to be
    // removed either.
    if (canRemove) {
        const processedLink = [];
        canRemove = els.every(el => {
            const { graph } = el;
            const connectedLinks = graph.getConnectedLinks(el);
            return connectedLinks.every(link => {
                if (processedLink.includes(link.id)) {
                    return true;
                }
                processedLink.push(link.id);

                const sourceEl = link.getSourceElement();
                const targetEl = link.getTargetElement();
                const sourceElToBeDeleted = sourceEl ? els.includes(sourceEl) : false;
                const targetElToBeDeleted = targetEl ? els.includes(targetEl) : false;

                // listing conditions separately for better readability

                // read only links
                if (link.isReadOnly()) {
                    return false;
                }
                // if both source and target are gonna be deleted...
                if (sourceElToBeDeleted && targetElToBeDeleted) {
                    // there is so many conditions here that we will just ignore link's allow_remove
                    // because it will collide with everything else
                    return true;
                }
                // can the link be without source el?
                if (sourceElToBeDeleted && (link.prop('requireSourceElement') || !link.allow(Link.ALLOW_SOURCE_CHANGE))) {
                    return false;
                }
                // can the link be without target el?
                if (targetElToBeDeleted && (link.prop('requireTargetElement') || !link.allow(Link.ALLOW_TARGET_CHANGE))) {
                    return false;
                }
                return true;
            });
        });
    }
    return canRemove;
}

export function canRemoveLinks(links = []) {
    links = Array.isArray(links) ? links : [links];
    return links.every(link => {
        return !link.isReadOnly() && link.allow(Link.ALLOW_REMOVE);
    });
}