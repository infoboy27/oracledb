/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

import { isSafari } from '../../utils/browser.mjs';

const { dia, g, util, V } = joint;

// Needed for: Fix for Safari not rendering markers
// TODO: remove after joint (core) is >=4.0.4 as it won't be needed anymore
const Flags = {
    TOOLS: dia.CellView.Flags.TOOLS,
    RENDER: 'RENDER',
    UPDATE: 'UPDATE',
    LABELS: 'LABELS',
    SOURCE: 'SOURCE',
    TARGET: 'TARGET',
    CONNECTOR: 'CONNECTOR'
};

class SingleLinkView extends dia.LinkView {

    initialize() {
        super.initialize(...arguments);

        const model = this.model;
        const typeLower = model.get('type').toLowerCase();
        const [prefix, linkType] = typeLower.split('.');
        let cls = model.prop('cls');
        cls = cls ? (Array.isArray(cls) ? cls : cls.split(' ')) : [];
        // replace placeholders in the classNames, e.g. 'myclass-{0}-{1}' -> 'myclass-apex-rect'
        cls = cls.map(name => name.replaceAll('{0}', prefix).replaceAll('{1}', linkType));

        const el = this.el;
        const classList = el.classList;

        classList.add(`${typeLower.replaceAll('.', '-')}-link`);
        if (cls.length) {
            classList.add(...cls);
        }
        // Fix for Safari not rendering the markers
        if (isSafari()) {
            this.listenTo(model, 'change:attrs', (/*model, attrs, property */) => {
                el.style.display = 'none';
                requestAnimationFrame(() => el.style.display = '');
            });
        }
    }

    onRender() {
        super.onRender(...arguments);
        this.hideOffsetConnector();
    }

    addCls(cls) {
        this.el.classList.add(cls);
    }

    removeCls(cls) {
        this.el.classList.remove(cls);
    }

    showOffsetConnector() {
        const connectorEl = this.findNode('offsetConnector');
        connectorEl.style.display = '';
    }

    hideOffsetConnector() {
        const connectorEl = this.findNode('offsetConnector');
        connectorEl.style.display = 'none';
    }

    renderLabels() {
        const cache = this._V;
        const labelCache = this._labelCache = {};
        const labelSelectors = this._labelSelectors = {};
        const model = this.model;
        const labels = model.attributes.labels || [];
        const labelsCount = labels.length;
        let vLabels = cache.labels;

        if (labelsCount === 0) {
            if (vLabels) {
                vLabels.remove();
            }
            return this;
        }

        if (vLabels) {
            vLabels.empty();
        }
        else {
            // there is no label container in the markup but some labels are defined
            // add a <g class="labels" /> container
            vLabels = cache.labels = V('g').addClass('labels');
            if (this.options.labelsLayer) {
                vLabels.addClass(util.addClassNamePrefix(util.result(this, 'className')));
                vLabels.attr('model-id', model.id);
            }
        }

        for (let i = 0; i < labelsCount; i++) {
            const label = labels[i];
            const labelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(label.markup));
            let labelNode;
            let selectors;
            if (labelMarkup) {
                labelNode = labelMarkup.node;
                selectors = labelMarkup.selectors;

            }
            else {
                const builtinDefaultLabel = model._builtins.defaultLabel;
                const builtinDefaultLabelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(builtinDefaultLabel.markup));
                const defaultLabel = model._getDefaultLabel();
                const defaultLabelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(defaultLabel.markup));
                const defaultMarkup = defaultLabelMarkup || builtinDefaultLabelMarkup;

                labelNode = defaultMarkup.node;
                selectors = defaultMarkup.selectors;
            }

            labelNode.setAttribute('label-idx', i); // assign label-idx

            if (label.cls) {
                const cls = Array.isArray(label.cls) ? label.cls : label.cls.split(' ');
                labelNode.classList.add(...cls);
            }

            if (label.designation) {
                labelNode.dataset.designation = label.designation;
            }
            vLabels.append(labelNode);
            labelCache[i] = labelNode; // cache node for `updateLabels()` so it can just update label node positions

            const rootSelector = this.selector;
            if (selectors[rootSelector]) {
                throw new Error('dia.LinkView: ambiguous label root selector.');
            }
            selectors[rootSelector] = labelNode;

            labelSelectors[i] = selectors; // cache label selectors for `updateLabels()`
        }
        if (!vLabels.parent()) {
            this.mountLabels();
        }

        this.updateLabels();

        return this;
    }

    updateLabels() {
        if (!this._V.labels) {
            return this;
        }

        const model = this.model;
        const labels = model.get('labels') || [];
        const canLabelMove = this.can('labelMove');

        const builtinDefaultLabel = model._builtins.defaultLabel;
        const builtinDefaultLabelAttrs = builtinDefaultLabel.attrs;

        const defaultLabel = model._getDefaultLabel();
        const defaultLabelMarkup = defaultLabel.markup;
        const defaultLabelAttrs = defaultLabel.attrs;
        const defaultLabelSize = defaultLabel.size;

        for (let i = 0, n = labels.length; i < n; i++) {
            const labelNode = this._labelCache[i];
            // FN:
            if (this.isDesignationLabel(labelNode)) {
                labelNode.setAttribute('cursor', 'pointer');
            }
            else {
                labelNode.setAttribute('cursor', (canLabelMove ? 'move' : 'default'));
            }

            const selectors = this._labelSelectors[i];

            const label = labels[i];
            const labelMarkup = label.markup;
            const labelAttrs = label.attrs;
            const labelSize = label.size;

            const attrs = this._mergeLabelAttrs(
                (labelMarkup || defaultLabelMarkup),
                labelAttrs,
                defaultLabelAttrs,
                builtinDefaultLabelAttrs
            );

            const size = this._mergeLabelSize(
                labelSize,
                defaultLabelSize
            );

            this.updateDOMSubtreeAttributes(labelNode, attrs, {
                rootBBox: new g.Rect(size),
                selectors: selectors
            });
        }

        return this;
    }

    // Override to disable dragging of the designation label
    dragLabelStart(e, x, y) {
        const labelEl = e.currentTarget;
        const isDesignation = this.isDesignationLabel(labelEl);

        if (isDesignation) {
            this.eventData(e, { stopPropagation: true });
            this.paper.delegateDragEvents(this, e.data);
        }
        else {
            super.dragLabelStart(e, x, y);
        }
    }

    // Override to pass drag data to linkAllowed()
    dragArrowheadEnd(evt, x, y) {
        const data = this.eventData(evt);
        const { paper } = this;

        if (paper.options.snapLinks) {
            this._snapArrowheadEnd(data);
        } else {
            this._connectArrowheadEnd(data, x, y);
        }
        if (!paper.linkAllowed(this, data)) { // FN: passing drag data
            // If the changed link is not allowed, revert to its previous state.
            this._disallow(data);
        } else {
            this._finishEmbedding(data);
            this._notifyConnectEvent(data, evt);
        }

        this._afterArrowheadMove(data);
    }

    isDesignationLabel(el) {
        return !!el.dataset.designation;
    }

    // Fix for Safari not rendering markers
    // TODO: remove after joint (core) is >=4.0.4 as it won't be needed anymore
    confirmUpdate(flags, opt = {}) {
        if (this.hasFlag(flags, Flags.SOURCE)) {
            if (!this.updateEndProperties('source')) {
                return flags;
            }
            flags = this.removeFlag(flags, Flags.SOURCE);
        }
        if (this.hasFlag(flags, Flags.TARGET)) {
            if (!this.updateEndProperties('target')) {
                return flags;
            }
            flags = this.removeFlag(flags, Flags.TARGET);
        }
        const { paper, sourceView, targetView } = this;
        if (paper && ((sourceView && !paper.isViewMounted(sourceView)) || (targetView && !paper.isViewMounted(targetView)))) {
            // Wait for the sourceView and targetView to be rendered
            return flags;
        }
        if (this.hasFlag(flags, Flags.RENDER)) {
            this.render();
            this.updateHighlighters(true);
            this.updateTools(opt);
            flags = this.removeFlag(flags, [Flags.RENDER, Flags.UPDATE, Flags.LABELS, Flags.TOOLS, Flags.CONNECTOR]);

            if (isSafari()) {
                // Safari has a bug where any change after the first render is not reflected in the DOM.
                // https://bugs.webkit.org/show_bug.cgi?id=268376
                const { el } = this;
                const childNodes = Array.from(el.childNodes);
                const fragment = document.createDocumentFragment();
                for (let i = 0, n = childNodes.length; i < n; i++) {
                    el.removeChild(childNodes[i]);
                    fragment.appendChild(childNodes[i]);
                }
                el.appendChild(fragment);
            }

            return flags;
        }

        let updateHighlighters = false;
        const { model } = this;
        const { attributes } = model;
        let updateLabels = this.hasFlag(flags, Flags.LABELS);
        if (updateLabels) {
            this.onLabelsChange(model, attributes.labels, opt);
            flags = this.removeFlag(flags, Flags.LABELS);
            updateHighlighters = true;
        }
        const updateAll = this.hasFlag(flags, Flags.UPDATE);
        const updateConnector = this.hasFlag(flags, Flags.CONNECTOR);
        if (updateAll || updateConnector) {
            if (!updateAll) {
                // Keep the current route and update the geometry
                this.updatePath();
                this.updateDOM();
            }
            else if (opt.translateBy && model.isRelationshipEmbeddedIn(opt.translateBy)) {
                // The link is being translated by an ancestor that will
                // shift source point, target point and all vertices
                // by an equal distance.
                this.translate(opt.tx, opt.ty);
            }
            else {
                this.update();
            }
            this.updateTools(opt);
            flags = this.removeFlag(flags, [Flags.UPDATE, Flags.TOOLS, Flags.CONNECTOR]);
            updateLabels = false;
            updateHighlighters = true;
        }
        if (updateLabels) {
            this.updateLabelPositions();
        }
        if (updateHighlighters) {
            this.updateHighlighters();
        }
        if (this.hasFlag(flags, Flags.TOOLS)) {
            this.updateTools(opt);
            flags = this.removeFlag(flags, Flags.TOOLS);
        }
        return flags;
    }
}

export default SingleLinkView;