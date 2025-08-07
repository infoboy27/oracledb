/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the model which is the base for all our "shape" elements which can display text.
 */

import Element from './Element.mjs';
import { measureText as utilMeasureText } from '../../utils/text.mjs';
import { staticConsts } from '../../utils/helpers.mjs';
import { isSafari } from '../../utils/browser.mjs';

const { util } = joint;

const FONT_FAMILY = 'var(--a-diagram-element-font-family, sans-serif)';
const FONT_SIZE = 'var(--a-diagram-element-font-size, 14px)';
const MAX_LINE_COUNT = 3;
const ELLIPSIS = true;

// Necessary for the text-wrap override
function isCalcAttribute(value) {
    return typeof value === 'string' && value.includes('calc');
}

export default class ShapeElement extends Element {

    // In jointjs+ 4.0.1 (jointjs 4.0.2) they changed how the textWrap works:
    // it gets the computed style of the node and doesn't rely anymore on the 'attrs' which are
    // passed in. This actually breaks the first render of the element with textWrap because it
    // doesn't respect the font size, family, etc. if they are set in the attributes coming from
    // defaults(). So the 1st wrapping/breaking of the text happens before these attributes are applied
    // to the node, it doesn't account for them but they will be still set on the text (later) and
    // will cause the text's position to be off, and/or text to overflow the element or be too
    // close to the edge.
    // Override to still rely on the 'attrs' instead of the computed style:
    static attributes = {
        'text-wrap': {
            qualify: util.isPlainObject,
            set: function(value, refBBox, node, attrs) {
                const size = {};
                // option `width`
                const width = value.width || 0;
                if (util.isPercentage(width)) {
                    size.width = refBBox.width * parseFloat(width) / 100;
                }
                else if (isCalcAttribute(width)) {
                    // to simplify the override, we won't support 'calc'
                    throw new Error('(text-wrap: width) calc attribute is not implemented');
                }
                else {
                    if (value.width === null) {
                        // breakText() requires width to be specified.
                        size.width = Infinity;
                    }
                    else if (width <= 0) {
                        size.width = refBBox.width + width;
                    }
                    else {
                        size.width = width;
                    }
                }
                // option `height`
                const height = value.height || 0;
                if (util.isPercentage(height)) {
                    size.height = refBBox.height * parseFloat(height) / 100;
                }
                else if (isCalcAttribute(height)) {
                    // to simplify the override, we won't support 'calc'
                    throw new Error('(text-wrap: height) calc attribute is not implemented');
                }
                else {
                    if (value.height === null) {
                        // do nothing
                    }
                    else if (height <= 0) {
                        size.height = refBBox.height + height;
                    }
                    else {
                        size.height = height;
                    }
                }
                // option `text`
                let wrappedText;
                let text = value.text;
                if (text === undefined) {
                    text = attrs.text;
                }
                if (text !== undefined) {
                    const breakTextFn = value.breakText || util.breakText;
                    wrappedText = breakTextFn('' + text, size, {
                        'font-weight': attrs['font-weight'],
                        'font-size': attrs['font-size'],
                        'font-family': attrs['font-family'],
                        'lineHeight': attrs['line-height'],
                        'letter-spacing': attrs['letter-spacing']
                    }, {
                        // Provide an existing SVG Document here
                        // instead of creating a temporary one over again.
                        svgDocument: this.paper.svg,
                        ellipsis: value.ellipsis,
                        hyphen: value.hyphen,
                        separator: value.separator,
                        maxLineCount: value.maxLineCount,
                        preserveSpaces: value.preserveSpaces
                    });
                } else {
                    wrappedText = '';
                }
                ShapeElement.getAttributeDefinition('text').set.call(this, wrappedText, refBBox, node, attrs);
            }
        }
    };

    preinitialize() {
        super.preinitialize(...arguments);
        this.padding = 10;
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

        Object.defineProperty(this, 'safari', {
            value: isSafari(),
            enumerable: true
        });
    }

    initialize() {
        super.initialize(...arguments);
        this.on('change', this.onAttributeChange);
        this.sizeText(this.attr('label/text'));
    }

    measureText(text, attrs) {
        const svgDocument = document.querySelector('svg');
        return utilMeasureText(svgDocument, text, attrs);
    }

    onAttributeChange(model, { propertyPath, propertyValue }) {
        if (propertyPath === 'attrs/label/text') {
            this.sizeText(propertyValue);
        }
    }

    sizeText(text) {
        const brokenText = util.breakText(text, {
            width: this.attr('label/textWrap/width'),
            // height: ShapeElement.MAX_TEXT_HEIGHT
        }, {
            'font-size': FONT_SIZE,
            'font-family': FONT_FAMILY
        }, {
            ellipsis: ELLIPSIS,
            maxLineCount: MAX_LINE_COUNT
        });
        const { width, height } = this.size();

        const { height: textHeight } = this.measureText(brokenText, {
            'font-size': FONT_SIZE,
            'font-family': FONT_FAMILY
        });

        let newHeight = textHeight + 2 * this.padding < 60 ? 60 : Math.ceil(textHeight / 10) * 10 + 2 * this.padding;
        // make it divisible by 20 so two elements can always be center-aligned (the grid is 10px)
        if (newHeight % 20 > 0) {
            newHeight += newHeight % 20;
        }
        const labelY = this.safari ? Math.round(newHeight / 2) :  Math.round((newHeight - textHeight) / 2);
        this.attr('label/y', labelY);

        if (height !== newHeight) {
            this.resize(width, newHeight);
        }
    }

    defaults() {
        const radius = ShapeElement.CORNER_RADIUS;
        const bodyX = 26;
        const decoWidth = 60;
        const safari = this.safari;
        return {
            ...super.defaults(),
            type: 'apex.Shape',
            size: { width: 220, height: 60 },
            attrs: {
                body: {
                    fill: 'var(--a-diagram-element-background-color, #fff)',
                    x: bodyX,
                    rx: radius,
                    ry: radius,
                    width: `calc(w - ${bodyX})`,
                    height: 'calc(h)'
                },
                decoration: {
                    // NOTE: We cannot use "y" as "g" element doesn't support positioning.
                    // If we used "svg" instead of "g", it would work, but would break the mask-highlighting.
                    transform: 'translate(0 calc(h / 2 - 30))'
                },
                decorationBackground: {
                    width: decoWidth,
                    height: decoWidth,
                    rx: radius,
                    ry: radius,
                    fill: 'var(--a-diagram-element-icon-background-color, #aaa)'
                },
                decorationPattern: {
                    width: decoWidth,
                    height: decoWidth,
                    rx: radius,
                    ry: radius,
                    fill: 'none'
                },
                glyph: {
                    ref: 'decorationBackground',
                    text: '',
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 24,
                    x: 'calc(w / 2)',
                    y: 'calc(h / 2)',
                    textAnchor: 'middle',
                    ...(!safari && { dominantBaseline: 'central' }),
                    ...(safari && { textVerticalAnchor: 'middle' }),
                    fill: 'var(--a-diagram-element-icon-color, #000)'
                },
                statusIcon: {
                    text: '',
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 16,
                    width: 'calc(h)',
                    x: 'calc(w - 4)',
                    y: 4,
                    textAnchor: 'end',
                    ...(!safari && { dominantBaseline: 'text-before-edge' }),
                    ...(safari && { textVerticalAnchor: 'top' }),
                    fill: '#000000'
                },
                label: {
                    ...(!safari && { dominantBaseline: 'text-before-edge' }),
                    ...(safari && { textVerticalAnchor: 'middle' }),
                    textAnchor: 'start',
                    text: '',
                    textWrap: {
                        width: 220 - decoWidth - 20, // e.g. totalWidth - decoWidth (= visible body) - paddings => width = 140, 10 offset from the shape
                        ellipsis: ELLIPSIS,
                        // height: ShapeElement.MAX_TEXT_HEIGHT,
                        maxLineCount: MAX_LINE_COUNT
                    },
                    x: decoWidth + 10,
                    fontSize: FONT_SIZE,
                    fontFamily: FONT_FAMILY,
                    fill: 'var(--a-diagram-element-text-color, #333)'
                },
            },
        };
    }

    changeToRtl(attrs) {
        attrs.body.x = 0;

        attrs.decoration.transform = 'translate(calc(w - 60) calc(h / 2 - 30))';

        attrs.statusIcon.x = 4;

        attrs.label.x = 150; // 220 - 70; // el width - offset from the side of shape
    }

    text(text = '') {
        if (arguments.length) {
            return this.attr('label/text', text);
        }

        return this.attr('label/text');
    }

    decorationBackgroundColor(fill) {
        if (arguments.length) {
            return this.attr('decorationBackground/fill', fill);
        }

        return this.attr('decorationBackground/fill');
    }

    decorationPattern(fill) {
        if (arguments.length) {
            return this.attr('decorationPattern/fill', fill);
        }

        return this.attr('decorationBackground/fill');
    }
}

staticConsts(ShapeElement, {
    // MAX_TEXT_HEIGHT: 120,
    CORNER_RADIUS: 6
});