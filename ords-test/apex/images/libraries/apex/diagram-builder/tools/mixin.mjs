/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a mix-in with shared functionality for the tools.
 */

const POS_RE = /(top|bottom|center)?(right$|left$|center$)?/i;

export default {
    mPosition() {
        if (!Object.hasOwn(this.options, 'position')) {
            return;
        }
        let x, y;
        const [, v = 'center', h = 'center'] = POS_RE.exec(this.options.position);
        switch (v.toLowerCase()) {
            case 'top':
                y = 0;
                break;
            case 'bottom':
                y = '100%';
                break;
            default:
                y = '50%';
        }
        switch (h.toLowerCase()) {
            case 'left':
                x = 0;
                break;
            case 'right':
                x = '100%';
                break;
            default:
                x = '50%';
        }
        this.options.x = x;
        this.options.y = y;
    }
};