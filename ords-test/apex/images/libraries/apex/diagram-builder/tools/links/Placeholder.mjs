/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a link tool that should serve as a placeholder for a potential
 * element.
 */

const { dia, V } = joint;

const COLOR_STROKE = 'var(--a-diagram-link-placeholder-border-color, none)';
const COLOR_FILL = 'var(--a-diagram-link-placeholder-background-color, #666)';
const COLOR_GLYPH = 'var(--a-diagram-link-placeholder-text-color, #fff)';

export default class Placeholder extends dia.ToolView {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'placeholder';

        this.events = {
            mouseenter: 'onMouseEnter',
            mouseleave: 'onMouseLeave',
            mousedown: 'onPointerDown',
            mouseup: 'onPointerUp'
        };
        this.radius = 15;
        this.tagName = 'g';
        this.children = [{
            tagName: 'circle',
            selector: 'button',
            attributes: {
                r: this.radius,
                cx: 0,
                fill: COLOR_FILL,
                stroke: COLOR_STROKE,
                cursor: 'pointer',
                'user-select': 'none',
            }
        }, {
            tagName: 'text',
            selector: 'label',
            textContent: '\ue069',
            attributes: {
                'font-family': 'apex-5-icon-font',
                'font-size': 20,
                'dominant-baseline': 'central',
                'text-anchor': 'middle',
                'pointer-events': 'none',
                fill: COLOR_GLYPH,
                stroke: 'none',
                x: 0,
                style: 'user-select: none'
            }
        }];

        this.options = {
            scale: null
        };
    }

    constructor(opt) {
        super();
        Object.assign(this.options, opt);
    }

    onRender() {
        this.renderChildren();
        this.update();
    }

    update() {
        const { ratio, translate } = this;
        const view = this.relatedView;
        const tangent = view.getTangentAtRatio(ratio);
        const { scale } = this.options;
        let position;

        if (tangent) {
            position = tangent.start;
            if (translate) {
                const dX = tangent.end.x - tangent.start.x;
                const dY = tangent.end.y - tangent.start.y;
                const hypo = Math.sqrt(Math.pow(dX, 2) + Math.pow(dY, 2));
                const sinA = dY / hypo;
                const cosA = dX / hypo;
                const dY2 = sinA * this.radius * (scale || 1);
                const dX2 = cosA * this.radius * (scale || 1);

                position.x += dX2 * translate;
                position.y += dY2 * translate;
            }
        }
        else {
            position = view.getPointAtRatio(ratio);
        }

        let matrix = V.createSVGMatrix().translate(position.x, position.y);
        if (scale) {
            matrix = matrix.scale(scale);
        }
        this.vel.transform(matrix, { absolute: true });
        return this;
    }

    setColors({ stroke, fill, glyph, reset = false } = {}) {
        const { button, label } = this.childNodes;
        if (reset) {
            this.resetColors();
        }
        else {
            if (stroke) {
                button.setAttribute('stroke', stroke);
            }
            if (fill) {
                button.setAttribute('fill', fill);
            }
            if (glyph) {
                label.setAttribute('fill', glyph);
            }
        }
    }

    resetColors() {
        this.setColors({
            stroke: COLOR_STROKE,
            fill: COLOR_FILL,
            glyph: COLOR_GLYPH
        });
    }

    getLinkPoint() {
        return this.relatedView.getPointAtRatio(this.ratio);
    }

    onMouseEnter(e) {
        this.relatedView.notify('link:placeholder:mouseenter', this, this.ratio, this.getLinkPoint(), e);
    }

    onMouseLeave(e) {
        this.relatedView.notify('link:placeholder:mouseleave', this, this.ratio, this.getLinkPoint(), e);
    }

    onPointerDown(e) {
        if (this.guard(e)) {
            return;
        }
        this.relatedView.notify('link:placeholder:pointerdown', this, this.ratio, this.getLinkPoint(), e);
    }

    onPointerUp(e) {
        if (this.guard(e)) {
            return;
        }
        this.relatedView.notify('link:placeholder:pointerup', this, this.ratio, this.getLinkPoint(), e);
    }
}