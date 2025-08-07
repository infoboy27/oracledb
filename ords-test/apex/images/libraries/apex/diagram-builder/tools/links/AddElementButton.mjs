/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains a tool to display on links at a given length or ratio.
 */

const { linkTools, util } = joint;

const COLOR_STROKE = 'var(--a-diagram-link-placeholder-border-color, none)';
const COLOR_FILL = 'var(--a-diagram-link-placeholder-background-color, #666)';
const COLOR_GLYPH = 'var(--a-diagram-link-placeholder-text-color, #fff)';

export default class AddElementButton extends linkTools.Button {

    preinitialize() {
        super.preinitialize(...arguments);

        this.name = 'add-element-button';

        this.events = {
            'mousedown': 'onPointerDown',
            'touchstart': 'onPointerDown',
            'mouseup': 'onPointerUp',
            'touchend': 'onPointerUp',
            'touchcancel': 'onPointerUp'
        };
        this.children = [{
            tagName: 'circle',
            selector: 'button',
            attributes: {
                r: 15,
                fill: COLOR_FILL,
                stroke: COLOR_STROKE,
                cursor: 'pointer'
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
    }

    onRender() {
        super.onRender();
        this.showOffsetConnector();
    }

    onRemove() {
        super.onRemove();
        this.hideOffsetConnector();
    }

    show() {
        super.show();
        this.showOffsetConnector();
    }

    hide() {
        super.hide();
        this.hideOffsetConnector();
    }

    onPointerDown(e) {
        super.onPointerDown(e);
        this.relatedView.notify('link:addelement:pointerdown', this, this.getLinkPoint(), e);
    }

    onPointerUp(e) {
        this.relatedView.notify('link:addelement:pointerup', this, this.getLinkPoint(), e);
    }

    getLinkPoint() {
        const view = this.relatedView;
        const { model } = view;
        const ratio = model.offsetConnectorRatio();
        const length = ratio == null ? model.offsetConnectorLength() : null;
        return ratio != null ? view.getPointAtRatio(ratio) : view.getPointAtLength(length);
    }

    showOffsetConnector() {
        const {
            toggleOffsetConnector = false,
            offset = -30,
            distance = '50%'
        } = this.options;
        const { relatedView } = this;
        const { model } = relatedView;
        if (toggleOffsetConnector) {
            const distanceIsPerc = util.isPercentage(distance);
            if (distanceIsPerc) {
                model.offsetConnectorRatio(parseFloat(distance) / 100, offset);
            }
            else {
                model.offsetConnectorLength(distance, offset);
            }
            relatedView.showOffsetConnector();
        }
    }

    hideOffsetConnector() {
        const {
            toggleOffsetConnector = false
        } = this.options;
        const { relatedView } = this;

        if (toggleOffsetConnector) {
            relatedView.hideOffsetConnector();
        }
    }
}