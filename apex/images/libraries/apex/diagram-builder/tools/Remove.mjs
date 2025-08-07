/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.elementTools.Remove with additional functionality and/or overrides.
 * 
 * Despite it being under the elmentTools ns in joint, it can be used on both links
 * and elements. It removes the cell from the graph and paper.
 * 
 * NOTE: Currently not used. Phased-out in favor of the Menu tool.
 */

import mixin from './mixin.mjs';

const { elementTools } = joint;

export default class Remove extends elementTools.Remove {

    preinitialize() {
        super.preinitialize(...arguments);
        this.name = 'remove-button';
        this.children = [{
            tagName: 'circle',
            selector: 'button',
            attributes: {
                r: 10,
                fill: 'red',
                stroke: '#d40000',
                cursor: 'pointer',
                'user-select': 'none'
            }
        }, {
            tagName: 'text',
            selector: 'label',
            textContent: '\ue0a2',
            attributes: {
                'font-family': 'apex-5-icon-font',
                'font-size': 12,
                'dominant-baseline': 'central',
                'text-anchor': 'middle',
                'pointer-events': 'none',
                fill: '#ffffff',
                stroke: 'none',
                'style': 'user-select: none'
            }
        }];
    }

    constructor() {
        super(...arguments);
        Object.assign(this, mixin);
    }

    onRender() {
        this.mPosition();
        super.onRender();
    }
}