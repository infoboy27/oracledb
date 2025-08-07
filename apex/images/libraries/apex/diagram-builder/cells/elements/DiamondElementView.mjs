/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the view of the diamond element which can display text.
 */

import ShapeView from './ShapeView.mjs';

const { g, V } = joint;

export default class DiamondElementView extends ShapeView {

    // Override. Because our rounded diamond is not EXACTLY sitting at the very edge of the element,
    // the very small decimal numbers are sometimes throwing the orthogonal routing off. We could
    // either use the model-size by returning getBBox({ useModelGeometry: true }) our round the values
    // in getNodeBBox().
    getNodeBBox(magnet) {
        const r = Math.round;
        const { x, y, width, height } = this.getNodeBoundingRect(magnet);
        const rect = new g.Rect(r(x), r(y), r(width), r(height));
        const transformMatrix = this.getRootTranslateMatrix().multiply(this.getNodeRotateMatrix(magnet));
        const magnetMatrix = this.getNodeMatrix(magnet);
        return V.transformRect(rect, transformMatrix.multiply(magnetMatrix));
    }
}