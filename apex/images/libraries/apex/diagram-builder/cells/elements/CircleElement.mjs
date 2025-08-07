/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the model of the circle element which can display text.
 */

import ShapeElement from './ShapeElement.mjs';

export default class CircleElement extends ShapeElement {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'rect',
            selector: 'body'
        }, {
            tagName: 'g',
            selector: 'decoration',
            children: [{
                tagName: 'circle',
                selector: 'decorationBackground',
            }, {
                tagName: 'circle',
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

        return {
            ...superDef,
            type: 'apex.Circle',
            attrs: {
                ...superDef.attrs,
                decorationBackground: {
                    cx: 30,
                    cy: 30,
                    r: 30,
                    fill: '#aaa'
                },
                decorationPattern: {
                    cx: 30,
                    cy: 30,
                    r: 30,
                    fill: '#aaa'
                }
            }
        };
    }
}