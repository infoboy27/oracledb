/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.ui.Stencil with additional functionality and/or overrides.
 * 
 * Stencil is the "palette" where the user can drag new elements from.
 */

import { getToolByEl } from './actions/tool.mjs';

const { dia, ui, util } = joint;

export default class Stencil extends ui.Stencil {

    // Override to add before_drop event.
    onDrop(cloneView, evt, point, snapToGrid) {

        const { options } = this;
        const { paper, graph } = options;
        const { embeddingMode } = paper.options;
        const { model: dragClone } = cloneView;

        // Start the dragging batch
        // Batch might contain `add`, `change:parent`, `change:embeds` events.
        graph.startBatch('stencil-drag');

        const endClone = options.dragEndClone(dragClone);
        if (dragClone === endClone || !(endClone instanceof dia.Cell)) {
            throw new Error('ui.Stencil: `dragEndClone` must return a clone of the cell');
        }

        // FN: before event
        const droppedOverView = paper.findView(evt.target) || null;
        const droppedOverTool = droppedOverView ? getToolByEl(droppedOverView, evt.target) : null;
        this.trigger('element:beforedrop', cloneView, endClone, evt, point.x, point.y, droppedOverView, droppedOverTool);

        this.drop(endClone, point, snapToGrid);

        // embedding
        if (embeddingMode && dragClone.isElement()) {
            cloneView.eventData(evt, {
                model: endClone,
                paper,
                initialParentId: util.uuid(), // dummy parent id
                whenNotAllowed: 'remove'
            });
            cloneView.finalizeEmbedding(cloneView.eventData(evt));
        }

        // snaplines
        // it's hide on document mouseup by the plugin itself

        // If the element is not in the graph, it must have been invalid unembedding
        if (graph.getCell(endClone)) {
            this.trigger('element:drop', endClone.findView(paper), evt, point.x, point.y, droppedOverView, droppedOverTool); // FN: added dropped over
            this.removePaperAfterDragging(dragClone);
        } else {
            this.onDropInvalid(cloneView, evt, point, snapToGrid);
        }

        // End the dragging batch.
        graph.stopBatch('stencil-drag');
    }
}