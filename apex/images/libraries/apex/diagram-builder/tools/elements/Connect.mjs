/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the tool to display on elements - to be able to connect them to other elements.
 * 
 * Clicking the tool dispatches an event upon which an external scripts should perform some
 * action, e.g. opening a menu or creating and connecting a new element using the Diagram
 * Builder's public API.
 * 
 * Dragging outside the tool with the mouse pointer draws a link to the target.
 */

import mixin from '../mixin.mjs';
import { getAnchorCoords } from '../../utils/graph.mjs';

const { elementTools, util } = joint;

export default class Connect extends elementTools.Connect {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'connect-button';
        this.events = {
            mousedown: 'mousedown',
            mouseup: 'mouseup',
            mouseleave: 'mouseleave',
        };
        this.documentEvents = {
            mousemove: 'drag',
            touchmove: 'drag',
            mouseup: 'dragend',
            touchend: 'dragend',
            touchcancel: 'dragend'
        };
        this.children = [{
            tagName: 'circle',
            selector: 'button',
            attributes: {
                r: 10,
                fill: 'var(--a-diagram-button-background-color, #eee)',
                stroke: 'var(--a-diagram-button-border-color, #666)',
                cursor: 'pointer'
            }
        }, {
            tagName: 'text',
            selector: 'label',
            textContent: '\ue069',
            attributes: {
                'font-family': 'apex-5-icon-font',
                'dominant-baseline': 'central',
                'text-anchor': 'middle',
                'pointer-events': 'none',
                fill: '#666',
                stroke: 'none',
                'style': 'user-select: none'
            }
        }];
    }

    constructor() {
        super(...arguments);
        Object.assign(this, mixin);
    }

    onRender() {
        this.mPosition();
        super.onRender();
    }

    mousedown(e) {
        this.isMouseDown = true;
        e.stopPropagation();
    }

    mouseup(e) {
        const { position, x, y } = this.options;
        this.isMouseDown = false;
        this.relatedView.notify('element:connectbutton:pointerup', this, position, { x, y }, e);

    }

    mouseleave(e) {
        if (this.isMouseDown && !this.isDragging) {
            this.dragLinkStart(e);
        }
    }

    dragLinkStart(e) {
        const { paper, relatedView } = this;
        const normalizedEvent = util.normalizeEvent(e);
        const { x, y } = paper.clientToLocalPoint(normalizedEvent.clientX, normalizedEvent.clientY);

        this.isDragging = true;
        relatedView.dragLinkStart(normalizedEvent, this.getMagnetNode(), x, y, this.options.position);
        paper.undelegateEvents();
        this.delegateDocumentEvents(null, normalizedEvent.data);
        this.focus();
    }

    dragend(e) {
        const { linkView } = this.relatedView.eventData(e);
        const { model: linkModel } = linkView;

        this.isMouseDown = false;
        this.isDragging = false;

        super.dragend(e);

        if (linkModel.hasLoop()) {
            const { position } = this.options;
            const targetAnchor = linkModel.target().anchor;
            const v1 = {}, v2 = {}, v3 = {};
            const bbox = this.relatedView.model.getBBox();
            const targetPoint = getAnchorCoords(targetAnchor, bbox);
            const offset = 30; // NOTE: Offset must be bigger than the router's padding!
            let targetSide;

            switch (position) {
                case 'top':
                    targetSide = this.getTargetSide(targetAnchor, bbox, 'horizontal');
                    v1.x = bbox.x + bbox.width / 2;
                    v1.y = v2.y = bbox.y - offset;
                    v2.x = v3.x = targetSide === 'right' ? (bbox.x + bbox.width + offset) : (bbox.x - offset);
                    v3.y = targetPoint.y;
                    break;
                case 'bottom':
                    targetSide = this.getTargetSide(targetAnchor, bbox, 'horizontal');
                    v1.x = bbox.x + bbox.width / 2;
                    v1.y = v2.y = bbox.y + bbox.height + offset;
                    v2.x = v3.x = targetSide === 'right' ? (bbox.x + bbox.width + offset) : (bbox.x - offset);
                    v3.y = targetPoint.y;
                    break;
                case 'left':
                    targetSide = this.getTargetSide(targetAnchor, bbox, 'vertical');
                    v1.x = v2.x = bbox.x - offset;
                    v1.y = bbox.y + bbox.height / 2;
                    v2.y = v3.y = targetSide === 'top' ? (bbox.y - offset) : (bbox.y + bbox.height + 20);
                    v3.x = targetPoint.x;
                    break;
                default:
                    targetSide = this.getTargetSide(targetAnchor, bbox, 'vertical');
                    v1.x = v2.x = bbox.x + bbox.width + offset;
                    v1.y = bbox.y + bbox.height / 2;
                    v2.y = v3.y = targetSide === 'top' ? (bbox.y - offset) : (bbox.y + bbox.height + 20);
                    v3.x = targetPoint.x;
                    break;
            }

            linkModel.vertices([v1, v2, v3]);
        }
    }

    getTargetSide(anchor, bbox, direction) {
        if (direction === 'vertical') {
            const { dy } = anchor.args;
            return (typeof dy == 'string' ? parseFloat(dy) >= 50 : (dy >= bbox.y + bbox.height / 2)) ? 'bottom' : 'top';
        }
        // else
        const { dx } = anchor.args;
        return (typeof dx == 'string' ? parseFloat(dx) >= 50 : (dx >= bbox.x + bbox.width / 2)) ? 'right' : 'left';
    }
}