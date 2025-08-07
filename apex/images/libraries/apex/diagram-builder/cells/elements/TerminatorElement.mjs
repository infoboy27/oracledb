/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the model of the single-color circle element with no text, just glyph.
 */

import { isSafari } from '../../utils/browser.mjs';
import Element from './Element.mjs';

export default class TerminatorElement extends Element {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'circle',
            selector: 'body'
        }, {
            tagName: 'text',
            selector: 'glyph'
        }, {
            tagName: 'g',
            selector: 'statusIconContainer',
            children: [{
                tagName: 'circle',
                selector: 'statusIconBackground'
            }, {
                tagName: 'text',
                selector: 'statusIcon'
            }]
        }];
        
        Object.defineProperty(this, 'safari', {
            value: isSafari(),
            enumerable: true
        });
    }

    defaults() {
        const safari = this.safari;
        return {
            ...super.defaults(),
            type: 'apex.Terminator',
            size: { width: 60, height: 60 },
            attrs: {
                body: {
                    cx: 'calc(h / 2)',
                    cy: 'calc(h / 2)',
                    r: 'calc(h / 2)',
                    fill: 'var(--a-diagram-element-terminator-background-color, #000)'
                },
                glyph: {
                    text: '',
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 'calc(h / 2)',
                    width: 'calc(h)',
                    x: 'calc(h / 2)',
                    y: 'calc(h / 2)',
                    textAnchor: 'middle',
                    ...(!safari && { dominantBaseline: 'central' }),
                    ...(safari && { textVerticalAnchor: 'middle' }),
                    fill: 'var(--a-diagram-element-terminator-text-color, #fff)'
                },
                statusIconContainer: {
                    display: 'none',
                    transform: 'translate(calc(w - 10) 10)'
                },
                statusIconBackground: {
                    x: 10,
                    y: 10,
                    r: 10,
                    fill: 'var(--a-diagram-element-terminator-text-color, #fff)',
                    stroke: 'var(--a-diagram-element-terminator-background-color, #000)'
                },
                statusIcon: {
                    text: '',
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 14,
                    width: 20,
                    x: 0,
                    y: 0,
                    textAnchor: 'middle',
                    ...(!safari && { dominantBaseline: 'central' }),
                    ...(safari && { textVerticalAnchor: 'middle' }),
                    fill: '#000000'
                }
            }
        };
    }

    changeToRtl(attrs) {
        attrs.statusIconContainer.transform = 'translate(10 10)';
    }

    statusIcon(icon = '') {
        if (arguments.length) {
            icon = icon == null ? '' : icon;
            this.attr('statusIconContainer/display', icon === '' ? 'none' : '');
            return this.attr('statusIcon/text', icon);
        }

        return this.attr('statusIcon/text');
    }
}