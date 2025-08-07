/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the base model definition for all our elements.
 */

import { staticConsts } from '../../utils/helpers.mjs';

const { dia } = joint;

export default class Element extends dia.Element {

    defaults() {
        return {
            ...super.defaults,
            type: 'apex.Base'
        };
    }

    initialize(cfg) {
        super.initialize(...arguments);
        if (cfg?.rtl) {
            this.changeToRtl(this.attributes.attrs);
        }
    }

    changeToRtl() { }

    text() { }

    glyph(unicode = '') {
        if (arguments.length) { return this.attr('glyph/text', unicode); }

        return this.attr('glyph/text');
    }

    glyphColor(color = '#ffffff') {
        if (arguments.length) { return this.attr('glyph/fill', color); }

        return this.attr('glyph/fill');
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

    statusIcon(icon = '') {
        if (arguments.length) {
            icon = icon == null ? '' : icon;
            return this.attr('statusIcon/text', icon);
        }

        return this.attr('statusIcon/text');
    }

    statusIconColor(color = '#000000') {
        if (arguments.length) {
            return this.attr('statusIcon/fill', color);
        }

        return this.attr('statusIcon/fill');
    }
}

staticConsts(Element, {
    ALLOW_LINK_OUT: 'linkOut',
    ALLOW_LINK_IN: 'linkIn',
    ALLOW_REMOVE: 'remove',
    ALLOW_TYPE_CHANGE: 'typeChange',
    ALLOW_TEXT_CHANGE: 'textChange',
    ALLOW_GLYPH_CHANGE: 'glyphChange'
});