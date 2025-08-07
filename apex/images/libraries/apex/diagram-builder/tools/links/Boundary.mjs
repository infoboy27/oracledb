/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.Boundary with additional functionality and/or overrides.
 * 
 * Boundary tool draws a rectangle around the link's bbox.
 */

const { linkTools } = joint;

export default class Boundary extends linkTools.Boundary {

    preinitialize() {
        this.attributes = {
            'fill': 'none',
            'stroke': 'var(--a-diagram-cell-selection, #333)',
            'stroke-width': .5,
            'stroke-dasharray': '5, 5',
            'pointer-events': 'none'
        };
    }
}