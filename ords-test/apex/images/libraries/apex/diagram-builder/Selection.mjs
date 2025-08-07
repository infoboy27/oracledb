/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.ui.Selection with additional functionality and/or overrides.
 */

import { highlightView, unhighlightView } from './actions/highlight.mjs';

const { ui } = joint;

const ConnectedLinksTranslation = {
    NONE: 'none',
    SUBGRAPH: 'subgraph',
    ALL: 'all'
};

export default class CellSelection extends ui.Selection {

    // Override to translate the connected links correctly, see comment /FN/
    translateSelectedElements(dx, dy) {

        // This hash of flags makes sure we're not adjusting vertices of one link twice.
        // This could happen as one link can be an inbound link of one element in the selection
        // and outbound link of another at the same time.
        const processedCells = {};
        const { collection } = this;
        const { graph, translateConnectedLinks } = this.options;

        collection.toArray().forEach(cell => {

            // TODO: snap to grid.
            if (processedCells[cell.id]) {
                return;
            }

            // Make sure that selection won't update itself when not necessary
            const opt = {
                selection: this.cid
            };

            // Translate the cell itself.
            cell.translate(dx, dy, opt);
            processedCells[cell.id] = true;

            cell.getEmbeddedCells({ deep: true }).forEach(function(embed) {
                processedCells[embed.id] = true;
            });

            if (translateConnectedLinks !== ConnectedLinksTranslation.NONE) {
                // Translate link vertices as well.
                const connectedLinks = graph.getConnectedLinks(cell);
                connectedLinks.forEach(function(link) {
                    if (processedCells[link.id]) {
                        return;
                    }
                    if (translateConnectedLinks === ConnectedLinksTranslation.SUBGRAPH) {
                        const sourceCell = link.getSourceCell();
                        if (sourceCell && !collection.get(sourceCell)) {
                            return;
                        }
                        const targetCell = link.getTargetCell();
                        if (targetCell && !collection.get(targetCell)) {
                            return;
                        }
                        if (!sourceCell || !targetCell) {
                            return;
                        }
                        // FN: We are handling this case in the LinkView already when the el is not
                        // yet selected but when it is selected it needs to be handled here as well.
                        // If target === source, we translate the link in the drag method
                        if (sourceCell && sourceCell === targetCell) {
                            return;
                        }
                    }
                    link.translate(dx, dy, opt);
                    processedCells[link.id] = true;
                });
            }
        });
    }

    //  BELOW SELECTION WITH MASKING OVERRIDES
    onResetElements(elements, { previousModels = [] }) {
        this.destroyAllSelectionBoxes(previousModels);

        elements.toArray().forEach(this.createSelectionBox.bind(this));

        this.updateSelectionWrapper();
    }

    createSelectionBox(element) {
        const elementView = element.findView(this.options.paper);
        if (elementView) {
            elementView.el.classList.add('selected');
            elementView.el.dataset.selectionHighlightId = highlightView(elementView, {
                padding: 1,
                className: 'selection-highlight',
                layer: 'front',
                attrs: {
                    'stroke': 'var(--a-diagram-cell-selection, orange)',
                    'stroke-width': 2,
                }
            });
            this.showSelected();
            this._boxCount += 1;
        }
    }

    destroyAllSelectionBoxes(cells = []) {
        cells.forEach((cell) => {
            const elementView = cell.findView(this.options.paper);
            if (elementView) {
                if (cell.isElement()) {
                    unhighlightView(elementView, elementView.el.dataset.selectionHighlightId);
                }
                elementView.el.classList.remove('selected');
            }
        });
        this._boxCount = 0;

        this.hide();
    }

    destroySelectionBox(element) {
        const elementView = element.findView(this.options.paper);
        unhighlightView(elementView, elementView.el.dataset.selectionHighlightId);

        //FN: why are/were they using max here instead of just subtracting 1?
        this._boxCount = this._boxCount - 1; // Math.max(0, this._boxCount - 1); 

        if (!this._boxCount) {
            this.hide();
        }
    }

    _updateSelectionBoxes() {
        if (this._boxCount) {
            this.showSelected();
            this.updateSelectionWrapper();
        }
        else {
            this.hide();
        }
    }
}