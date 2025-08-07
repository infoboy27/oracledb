/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the base view definition for all our elements.
 */

const { dia, g } = joint;

class ElementView extends dia.ElementView {

    initialize() {
        super.initialize(...arguments);

        const model = this.model;
        const typeId = model.prop('typeId');
        const typeLower = model.get('type').toLowerCase();
        const [prefix, elementShape] = typeLower.split('.');
        let cls = model.prop('cls');
        cls = cls ? (Array.isArray(cls) ? cls : cls.split(' ')) : [];
        // replace placeholders in the classNames, e.g. 'myclass-{0}-{1}' -> 'myclass-apex-rect'
        cls = cls.map(name => name.replaceAll('{0}', prefix).replaceAll('{1}', elementShape));

        const el = this.el;
        const classList = el.classList;

        classList.add(`${typeLower.replaceAll('.', '-')}-element`);
        if (cls.length) {
            classList.add(...cls);
        }

        const filters = model.get('filters');
        if (filters?.length) {
            el.setAttribute('filter', filters.reduce((prev, curr) => `${prev} url(#${curr})`, ''));
        }

        el.dataset.typeId = typeId;
    }


    getChildEl(jointSelector) {
        return this.el.querySelector(`[joint-selector="${jointSelector}"]`);
    }

    // override to translate the link whose source == target (this el) together with the el
    drag(e) {
        super.drag(...arguments);
        const { model } = this;
        const { graph } = model;
        const { x, y } = model.position();
        const data = this.eventData(e);
        const { initialPosition, lastPosition } = data;
        const dx = x - (lastPosition != null ? lastPosition.x : initialPosition.x);
        const dy = y - (lastPosition != null ? lastPosition.y : initialPosition.y);

        if (dx || dy) {
            // Translate link vertices whose source AND target is this element
            const connectedLinks = graph.getConnectedLinks(model);
            connectedLinks.forEach(function(link) {
                const sourceEl = link.getSourceElement();
                const targetEl = link.getTargetElement();
                if (sourceEl && sourceEl === targetEl) {
                    link.translate(dx, dy);
                }
            });
        }

        this.eventData(e, {
            lastPosition: { x, y }
        });
    }

    // override to be able to pass the source of the newly created link (passing down side param)
    dragLinkStart(evt, magnet, x, y, side) {
        this.model.startBatch('add-link');
        const linkView = this.addLinkFromMagnet(magnet, x, y, side);
        // backwards compatibility events
        linkView.notifyPointerdown(evt, x, y);
        linkView.eventData(evt, linkView.startArrowheadMove('target', { whenNotAllowed: 'remove' }));
        this.eventData(evt, { linkView });
    }

    // override to be able to pass the source of the newly created link (passing down side param)
    addLinkFromMagnet(magnet, x, y, side) {

        const paper = this.paper;
        const graph = paper.model;

        const link = paper.getDefaultLink(this, magnet);
        link.set({
            source: this.getLinkEnd(magnet, x, y, link, 'source', side),
            target: { x: x, y: y }
        }).addTo(graph, {
            async: false,
            ui: true
        });

        return link.findView(paper);
    }

    // getLinkEnd: passes ...args - no need to do anything to pass the side

    // override to be able to pass the source of the newly created link (passing down side param)
    customizeLinkEnd(end, magnet, x, y, link, endType, side) {
        const { paper } = this;
        const { connectionStrategy } = paper.options;
        if (typeof connectionStrategy === 'function') {
            const strategy = connectionStrategy.call(paper, end, this, magnet, new g.Point(x, y), link, endType, paper, side);
            if (strategy) {
                return strategy;
            }
        }
        return end;
    }
}

export default ElementView;