/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the base model definition for all our small (stencil) elements.
 */

const { dia } = joint;

class ElementSmall extends dia.Element {

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
                selector: 'glyph'
            }]
        }];
    }

    defaults() {
        return {
            ...super.defaults,
            type: 'apex.BaseSmall',
            size: {
                width: 60,
                height: 60
            },
            attrs: {
                decorationBackground: {
                    width: 'calc(h)',
                    height: 'calc(h)',
                    fill: '#aaa',
                },
                glyph: {
                    text: '\uec01',
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 'calc(h / 2.5)',
                    width: 'calc(h)',
                    x: 'calc(h / 2)',
                    y: 'calc(h / 2)',
                    textAnchor: 'middle',
                    textVerticalAnchor: 'middle',
                    fill: '#fff'
                }
            },
        };
    }

    glyph(unicode = '') {
        if (arguments.length) { return this.attr('glyph/text', unicode); }

        return this.attr('glyph/text');
    }

    glyphColor(color = '#ffffff') {
        if (arguments.length) { return this.attr('glyph/fill', color); }

        return this.attr('glyph/fill');
    }

    decorationBackgroundColor(color = '#eee') {
        if (arguments.length) { return this.attr('decorationBackground/fill', color); }

        return this.attr('decorationBackground/fill');
    }
}

export default ElementSmall;