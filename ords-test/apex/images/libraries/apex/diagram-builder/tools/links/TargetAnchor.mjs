/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.TargetAnchor with additional functionality and/or overrides.
 * 
 * Anchor tool appears on the element and defines the "anchor point" of the link. The link
 * will always lead/point to/from this point. (But it doesn't need to touch it - this is
 * defined by connection point.)
 */

const { linkTools } = joint;

export default class TargetAnchor extends linkTools.TargetAnchor {

    onPointerUp(e) {
        super.onPointerUp(e);
        const { relatedView } = this;
        relatedView.notify('link:anchor:pointerup', this, 'target', relatedView.model.prop(['target', 'anchor']), e);
    }
}