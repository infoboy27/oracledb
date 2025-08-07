/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the small (stencil) version of them model of the rectangle element
 * which can display text.
 */

import ElementSmall from './ElementSmall.mjs';

export default class RectElementSmall extends ElementSmall {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'g',
            selector: 'decoration',
            children: [{
                tagName: 'rect',
                selector: 'decorationBackground',
            }, {
                tagName: 'text',
                selector: 'statusIcon'
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
            type: 'apex.RectSmall',
            attrs: {
                ...superDef.attrs,
                decorationBackground: {
                    ...superDef.attrs.decorationBackground,
                    width: 'calc(w)',
                    height: 'calc(h)'
                }
            }
        };
    }
}