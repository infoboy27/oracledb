/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains link -> element connection point calculations.
 */

import ShapeElement from '../cells/elements/ShapeElement.mjs';
import TerminatorElement from '../cells/elements/TerminatorElement.mjs';

const { V, g } = joint;

export function createConnectionPoint() {
    return function(pathSegmentLine, view, magnet, opt) {
        // 'this' is the linkView
        const ns = this.paper.options.connectionPointNamespace;
        let conPointFn = ns.boundary;

        if (view.model instanceof ShapeElement) {
            const startPoint = pathSegmentLine.start;
            const endPoint = pathSegmentLine.end;
            const decorationBg = getShape(view, 'decorationBackground', 'decoration');
            const body = getShape(view, 'body');
            const intersections = [];
            let point = new g.Point(endPoint.x, endPoint.y);

            // something not set or point inside
            if (!body || !decorationBg || body.containsPoint(startPoint) || decorationBg.containsPoint(startPoint)) {
                conPointFn = ns.bbox;
            }
            // the point is outside of our element
            else {
                intersections.push(...(decorationBg.intersectionWithLine(pathSegmentLine) || []));
                intersections.push(...(body.intersectionWithLine(pathSegmentLine) || []));

                point = intersections.reduce((prev, curr) => {
                    if (prev == null) {
                        return curr;
                    }
                    const currDistance = curr.distance(startPoint);
                    const prevDistance = prev.distance(startPoint);
                    return currDistance < prevDistance ? curr : prev;
                }, intersections[0]);

                return point;
            }
        }
        else if (view.model instanceof TerminatorElement) {
            const startPoint = pathSegmentLine.start;
            const endPoint = pathSegmentLine.end;
            const decorationBg = getShape(view, 'statusIconBackground', 'statusIconContainer');
            const body = getShape(view, 'body');
            const intersections = [];
            let point = new g.Point(endPoint.x, endPoint.y);

            // something not set or point inside
            if (!decorationBg || body.containsPoint(startPoint) || decorationBg.containsPoint(startPoint)) {
                conPointFn = ns.boundary;
            }
            // the point is outside of our element
            else {
                intersections.push(...(decorationBg.intersectionWithLine(pathSegmentLine) || []));
                intersections.push(...(body.intersectionWithLine(pathSegmentLine) || []));

                point = intersections.reduce((prev, curr) => {
                    if (prev == null) {
                        return curr;
                    }
                    const currDistance = curr.distance(startPoint);
                    const prevDistance = prev.distance(startPoint);
                    return currDistance < prevDistance ? curr : prev;
                }, intersections[0]);

                return point;
            }
        }

        return conPointFn.call(this, pathSegmentLine, view, magnet, opt);

        function getShape(view, elSelector, containerElSelector) {
            const el = view.getChildEl(elSelector);
            const containerEl = view.getChildEl(containerElSelector);
            if (containerEl?.getAttribute('display') === 'none') {
                return;
            }
            const bbox = view.model.getBBox();
            let shape;

            switch (el.nodeName) {
                case 'path':
                    shape = g.Path.parse(el.getAttribute('d'));
                    break;

                case 'rect':
                    shape = new g.Rect(
                        parseFloat(el.getAttribute('x')) || 0,
                        parseFloat(el.getAttribute('y')) || 0,
                        parseFloat(el.getAttribute('width')),
                        parseFloat(el.getAttribute('height'))
                    );
                    break;

                case 'circle': { // const declaration - block "needed"
                    const radius = parseFloat(el.getAttribute('r'));
                    shape = new g.Ellipse(
                        new g.Point(parseFloat(el.getAttribute('cx')) || 0, parseFloat(el.getAttribute('cy')) || 0),
                        radius,
                        radius
                    );
                    break;
                }
            }
            if (shape) {
                let offsetY = 0;
                let offsetX = 0;
                if (containerEl) {
                    const decMatrix = V.decomposeMatrix(V.transformStringToMatrix(containerEl.getAttribute('transform')));
                    offsetY = decMatrix.translateY;
                    offsetX = decMatrix.translateX;
                }
                // ellipse has no translate!
                if (typeof shape.translate == 'function') {
                    shape.translate(bbox.x + offsetX, bbox.y + offsetY);
                }
                else {
                    shape.x += bbox.x + offsetX;
                    shape.y += bbox.y + offsetY;
                }
                return shape;
            }
        }
    };
}