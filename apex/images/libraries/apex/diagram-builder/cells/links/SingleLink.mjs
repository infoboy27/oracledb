/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

import Link from './Link.mjs';

const COLOR_NORMAL = 'var(--a-diagram-link-border-color, #666)';
const COLOR_ERROR = 'var(--a-palette-danger, #f00)';
const COLOR_ROUTE = 'var(--a-diagram-route-default, #808080)';

export default class SingleLink extends Link {

    preinitialize() {
        super.preinitialize(...arguments);
        this.markup = [{
            tagName: 'path',
            selector: 'wrapper',
            attributes: {
                'fill': 'none',
                'cursor': 'pointer',
                'stroke': 'transparent',
                'stroke-linecap': 'round'
            }
        }, {
            tagName: 'path',
            selector: 'line',
            attributes: {
                'fill': 'none',
                'pointer-events': 'none'
            }
        }, {
            tagName: 'path',
            selector: 'offsetConnector'
        }];
    }

    constructor() {
        super(...arguments);
        if (this.prop('error')) {
            this.attr('line/stroke', COLOR_ERROR);
            this.attr('line/targetMarker/stroke', COLOR_ERROR);
        }
    }

    defaults() {
        return {
            ...super.defaults,
            type: 'apex.SingleLink',
            designation: null,
            attrs: {
                ...super.defaults.attrs,
                line: {
                    ...super.defaults.attrs.line,
                    stroke: COLOR_NORMAL,
                    targetMarker: {
                        type: 'path',
                        stroke: COLOR_NORMAL,
                        'stroke-width': 2,
                        fill: 'none',
                        d: 'M 6 -6 L 0 0 L 6 6',
                    }
                },
                offsetConnector: {
                    d: 'M 0 0 0 -30',
                    stroke: COLOR_NORMAL,
                    strokeDasharray: '4 4',
                    'stroke-width': 2,
                }
            }
        };
    }

    error(b) {
        if (!arguments.length) {
            return this.prop('error') || false;
        }
        else {
            this.prop('error', b);
            const color = b ? COLOR_ERROR : COLOR_NORMAL;
            this.attr('line/stroke', color);
            this.attr('line/targetMarker/stroke', color);
        }
    }

    route(b, color = COLOR_ROUTE) {
        if (b) {
            this.attr({
                line: {
                    stroke: color,
                    'stroke-width': 4,
                    targetMarker: {
                        stroke: color,
                        fill: color,
                        d: 'M 11 -7 L -3 0 L 11 7Z'
                    }
                }
            });
        }
        else {
            this.attr({
                line: {
                    'stroke-width': 2,
                    targetMarker: {
                        fill: 'none',
                        d: 'M 6 -6 L 0 0 L 6 6'
                    }
                }
            });
            // redraw in correct color
            this.error() ? this.error(true) : this.error(false);
        }
    }

    designation(des) {
        if (!arguments.length) {
            return this.prop('designation');
        }
        else {
            this.prop('designation', des);
        }
    }

    offsetConnectorRatio(ratio, distance = 0) {
        if (!arguments.length) {
            return this.attr('offsetConnector/atConnectionRatio');
        }
        this.removeAttr('offsetConnector/atConnectionLength');
        this.attr('offsetConnector/atConnectionRatio', ratio);
        this.attr('offsetConnector/d', `M 0 0 0 ${distance}`);
    }

    offsetConnectorLength(length, distance = 0) {
        if (!arguments.length) {
            return this.attr('offsetConnector/atConnectionLength');
        }
        this.removeAttr('offsetConnector/atConnectionRatio');
        this.attr('offsetConnector/atConnectionLength', length);
        this.attr('offsetConnector/d', `M 0 0 0 ${distance}`);
    }
}