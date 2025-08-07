/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a button tool used on both links and elements which dispatches an event
 * when clicked. External script should show a menu or otherwise react to this event.
 */

import mixin from './mixin.mjs';
import { staticConst } from '../utils/helpers.mjs';

const { elementTools } = joint;

export default class Menu extends elementTools.Button {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'menu-button';
        this.children = Menu.MARKUP_SHAPE_ELEMENT;
    }

    constructor() {
        super(...arguments);
        Object.assign(this, mixin);
    }

    onRender() {
        this.mPosition();
        super.onRender(...arguments);
    }

    onPointerDown(e) {
        super.onPointerDown(...arguments);
        this.relatedView.notify('cell:menubutton:pointerdown', this, e);
    }
}

staticConst(Menu, 'MARKUP_SHAPE_ELEMENT', [{
    tagName: 'rect',
    selector: 'button',
    attributes: {
        width: 20,
        height: 20,
        x: -10,
        y: -10,
        rx: 3,
        fill: 'var(--a-diagram-element-menu-button-background-color, #fff)',
        cursor: 'pointer',
        'user-select': 'none'
    }
}, {
    tagName: 'text',
    selector: 'label',
    textContent: '\ue259',
    attributes: {
        'font-family': 'apex-5-icon-font',
        'font-size': 14,
        'dominant-baseline': 'central',
        'text-anchor': 'middle',
        'pointer-events': 'none',
        fill: 'var(--a-diagram-element-menu-button-text-color, #666)',
        stroke: 'none',
        'style': 'user-select: none'
    }
}]);

staticConst(Menu, 'MARKUP_TERMINATOR_ELEMENT', [{
    tagName: 'circle',
    selector: 'button',
    attributes: {
        r: 10,
        fill: 'var(--a-diagram-element-terminator-menu-button-background-color, #eee)',
        stroke: 'var(--a-diagram-element-terminator-menu-button-border-color, #666)',
        cursor: 'pointer'
    }
}, {
    tagName: 'text',
    selector: 'label',
    textContent: '\ue259',
    attributes: {
        'font-family': 'apex-5-icon-font',
        'dominant-baseline': 'central',
        'text-anchor': 'middle',
        'pointer-events': 'none',
        fill: 'var(--a-diagram-element-terminator-menu-button-text-color, #666)',
        stroke: 'none',
        'style': 'user-select: none'
    }
}]);

staticConst(Menu, 'MARKUP_LINK', [{
    tagName: 'circle',
    selector: 'button',
    attributes: {
        r: 10,
        fill: 'var(--a-diagram-link-menu-button-background-color, #eee)',
        stroke: 'var(--a-diagram-link-menu-button-border-color, #666)',
        cursor: 'pointer'
    }
}, {
    tagName: 'text',
    selector: 'label',
    textContent: '\ue259',
    attributes: {
        'font-family': 'apex-5-icon-font',
        'dominant-baseline': 'central',
        'text-anchor': 'middle',
        'pointer-events': 'none',
        fill: 'var(--a-diagram-link-menu-button-text-color, #666)',
        stroke: 'none',
        'style': 'user-select: none'
    }
}]);