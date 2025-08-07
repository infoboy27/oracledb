/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the small (stencil) version of them model of the diamond element
 * which can display text.
 */

import ElementSmall from './ElementSmall.mjs';

export default class DiamondElementSmall extends ElementSmall {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'g',
            selector: 'decoration',
            children: [{
                tagName: 'path',
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
            type: 'apex.DiamondSmall',
            attrs: {
                ...superDef.attrs,
                decorationBackground: {
                    ...superDef.attrs.decorationBackground,
                    d: 'M 0 calc(h / 2) L calc(w / 2) 0 L calc(w) calc(h / 2) L calc(w / 2) calc(h) Z'
                }
            }
        };
    }
}