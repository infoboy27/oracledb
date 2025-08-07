/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the small (stencil) version of them model of the circle element
 * which can display text.
 */

import ElementSmall from './ElementSmall.mjs';

class CircleElementSmall extends ElementSmall {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'path',
            selector: 'body'
        }, {
            tagName: 'g',
            selector: 'decoration',
            children: [{
                tagName: 'circle',
                selector: 'decorationBackground',
            }, {
                tagName: 'text',
                selector: 'glyph'
            }]
        }];
    }

    defaults() {
        const superDef = super.defaults();

        return {
            ...superDef,
            type: 'apex.CircleSmall',
            attrs: {
                ...superDef.attrs,
                decorationBackground: {
                    cx: 'calc(h / 2)',
                    cy: 'calc(h / 2)',
                    r: 'calc(h / 2)',
                    fill: '#aaa'
                }
            }
        };
    }
}

export default CircleElementSmall;