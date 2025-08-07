/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.TargetArrowhead with additional functionality and/or overrides.
 * 
 * Arrowhead is a tool that appears at the end of the link (connection point) and can be
 * dragged by the end-user to reposition the end of the link.
 */

const { linkTools } = joint;

export default class TargetArrowhead extends linkTools.TargetArrowhead {

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