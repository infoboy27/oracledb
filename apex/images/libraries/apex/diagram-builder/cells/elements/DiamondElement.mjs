/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the model of the diamond element which can display text.
 */

import ShapeElement from './ShapeElement.mjs';

export default class DiamondElement extends ShapeElement {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'rect',
            selector: 'body'
        }, {
            tagName: 'g',
            selector: 'decoration',
            children: [{
                tagName: 'path',
                selector: 'decorationBackground'
            }, {
                tagName: 'path',
                selector: 'decorationPattern',
            }, {
                tagName: 'text',
                selector: 'glyph'
            }]
        }, {
            tagName: 'text',
            selector: 'label'
        }, {
            tagName: 'text',
            selector: 'statusIcon'
        }];
    }

    defaults() {
        const superDef = super.defaults();
        const path = 'M 34.2 1.9 L 58.1 25.8 C 58.1 25.8 62.4 30 58.1 34.2 L 34.2 58.1 C 34.2 58.1 30 62.4 25.8 58.1 L 1.9 34.2 C 1.9 34.2 -2.4 30 1.9 25.8 L 25.8 1.9 C 25.8 1.9 30 -2.4 34.2 1.9';
        return {
            ...superDef,
            type: 'apex.Diamond',
            attrs: {
                ...superDef.attrs,
                decorationBackground: {
                    ...superDef.attrs.decorationBackground,
                    d: path,
                    fill: 'var(--a-diagram-element-diamond-background-color, #aaa)'
                },
                decorationPattern: {
                    ...superDef.attrs.decorationPattern,
                    d: path
                }
            }
        };
    }
}