/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the model of the unconfigured shape element which can display text.
 */

import ShapeElement from './ShapeElement.mjs';

export default class UnconfiguredElement extends ShapeElement {

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
                selector: 'decorationBackground',
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
        const width = 60;
        const radius = ShapeElement.CORNER_RADIUS;
        const d = `M ${radius} 0 L ${width} 0 L ${width} calc(h) L ${radius} calc(h) C ${radius} calc(h) 0 calc(h) 0 calc(h - ${radius}) L 0 ${radius} C 0 ${radius} 0 0 ${radius} 0`;
        return {
            ...superDef,
            type: 'apex.Unconfigured',
            attrs: {
                ...superDef.attrs,
                decoration: {
                    height: 'calc(h)',
                    width
                },
                decorationBackground: {
                    ...superDef.attrs.decorationBackground,
                    d,
                    fill: '#eee',
                    stroke: '#aaa',
                    strokeWidth: 1,
                    strokeDasharray: '3,3'
                },
                decorationPattern: {
                    ...superDef.attrs.decorationPattern,
                    d
                },
                body: {
                    ...superDef.attrs.body,
                    stroke: '#aaa',
                    strokeWidth: 1,
                    strokeDasharray: '3,3',
                },
                label: {
                    ...superDef.attrs.label,
                    fill: '#aaa',
                },
                glyph: {
                    ...superDef.attrs.glyph,
                    fill: '#aaa'
                }
            }
        };
    }

    changeToRtl(attrs) {
        super.changeToRtl(attrs);
        const width = 60;
        const radius = ShapeElement.CORNER_RADIUS;
        const d = `M 0 0 L ${width - radius} 0 C ${width} 0 ${width} 6 ${width} 6 L ${width} calc(h - ${radius}) C ${width} calc(h) ${width - radius} calc(h) ${width - radius} calc(h) L 0 calc(h) L 0 0`;

        attrs.decoration.transform = 'translate(calc(w - 60) 0)';
        attrs.decorationBackground.d = d;
        attrs.decorationPattern.d = d;
    }
}