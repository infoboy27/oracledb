/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

import { staticConsts } from '../../utils/helpers.mjs';

const { shapes } = joint;

export default class Link extends shapes.standard.Link {

    static getLabelCfg(text = '', opt = {}) {
        const {
            position = {},
        } = opt;
        const {
            distance = .5,
            offset = 0
        } = position;
        let { cls = '' } = opt;

        if (cls) {
            cls = Array.isArray(cls) ? cls : cls.split(' ');
        }
        return {
            cls,
            markup: [{
                tagName: 'rect',
                selector: 'body'
            }, {
                tagName: 'text',
                selector: 'label'
            }],
            attrs: {
                label: {
                    text,
                    textWrap: {
                        width: 150,
                        height: 100,
                        ellipsis: true
                    },
                    fill: 'var(--a-diagram-label-text-color, #000)',
                    fontFamily: 'var(--a-diagram-label-font-family, sans-serif)',
                    fontSize: 'var(--a-diagram-label-font-size, 12px)',
                    textAnchor: 'middle',
                    yAlignment: 'middle',
                    pointerEvents: 'none'
                },
                body: {
                    ref: 'label',
                    fill: 'var(--a-diagram-label-background-color, #aaa)',
                    width: 'calc(w + 10)',
                    height: 'calc(h + 6)',
                    x: 'calc(w / -2 - 5)',
                    y: 'calc(h / -2 - 3)',
                    rx: 5
                }
            },
            position: {
                distance,
                offset
            }
        };
    }

    static getLabelTextPath() {
        return 'attrs/label/text';
    }

    static getLinkDesignationCfg(opt = {}) {
        const {
            glyph = '',
            distance = .5,
            designation,
            tooltip = '',
            tooltipPosition = 'bottom'
        } = opt;
        let { cls = '' } = opt;

        if (cls) {
            cls = Array.isArray(cls) ? cls : cls.split(' ');
        }

        const cfgObj = {
            designation,
            cls,
            markup: [{
                tagName: 'circle',
                selector: 'body'
            }, {
                tagName: 'text',
                selector: 'label'
            }],
            attrs: {
                label: {
                    text: glyph,
                    fontFamily: 'apex-5-icon-font',
                    fontSize: 'var(--a-diagram-link-icon-font-size, 14px)',
                    textAnchor: 'middle',
                    yAlignment: 'middle',
                    pointerEvents: 'none',
                    fill: 'var(--a-diagram-link-icon-text-color, #fff)'
                },
                body: {
                    ref: 'label',
                    fill: 'var(--a-diagram-link-icon-background-color, #666)',
                    r: 13,
                    cx: 0,
                    cy: 0
                }
            },
            position: {
                distance
            }
        };

        // if there are any tooltips, add them to the config
        if (tooltip) {
            cfgObj.attrs['.'] = {
                'data-tooltip': tooltip,
                'data-tooltip-position': tooltipPosition,
            };
        }

        return cfgObj;
    }

    isReadOnly() {
        return this.prop('readOnly') === true;
    }

    allow(what) {
        const prop = `allow${what.charAt(0).toUpperCase()}${what.slice(1)}`;
        return this.get(prop) !== false;
    }

    hasMenu() {
        return this.get('hasMenu') !== false;
    }

    isSelectable() {
        return this.get('selectable') !== false;
    }

    // Override to be able to dispatch an event
    removeVertex(idx, opt) {
        const vertices = this.vertices();
        // eslint-disable-next-line no-bitwise
        idx = isFinite(idx) && idx !== null ? idx | 0 : -1;
        const removedVertex = vertices.splice(idx, 1);
        const newVertices = this.vertices(vertices, opt);
        this.trigger('remove:vertex', this, removedVertex[0], idx);
        return newVertices;
    }
}

staticConsts(Link, {
    ALLOW_SOURCE_CHANGE: 'sourceChange',
    ALLOW_TARGET_CHANGE: 'targetChange',
    ALLOW_LABEL_CHANGE: 'labelChange',
    ALLOW_DESGINATION_CHANGE: 'designationChange',
    ALLOW_REMOVE: 'remove'
});