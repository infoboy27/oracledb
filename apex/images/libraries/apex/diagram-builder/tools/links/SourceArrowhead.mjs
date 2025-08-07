/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.SourceArrowhead with additional functionality and/or overrides.
 * 
 * Arrowhead is a tool that appears at the end of the link (connection point) and can be
 * dragged by the end-user to reposition the end of the link.
 */

const { linkTools } = joint;

export default class SourceArrowhead extends linkTools.SourceArrowhead {

    preinitialize() {
        super.preinitialize(...arguments);

        const size = 14;
        this.tagName = 'rect';
        this.attributes = {
            x: -size / 2,
            y: -size / 2,
            width: size,
            height: size,
            rx: 4,
            'fill': '#33334F',
            'stroke': '#FFFFFF',
            'stroke-width': 2,
            'cursor': 'move',
            'class': 'source-arrowhead'
        };
    }

    onPointerDown(e) {
        super.onPointerDown(e);
        // need to add pointerdown
        this.relatedView.notifyPointerdown(...arguments);
        this.relatedView.notify('link:arrowhead:pointerdown', this, this.ratio, e);
    }

    onPointerUp(e) {
        super.onPointerUp(e);
        this.relatedView.notify('link:arrowhead:pointerup', this, this.ratio, e);
    }
}