/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.linkTools.Vertices with additional functionality and/or overrides.
 * 
 * Adds handles above link vertices which enable pathing adjustments of the links.
 */

const { linkTools, util } = joint;

export default class Vertices extends linkTools.Vertices {

    #changedHandleInitialPosition;

    // Override to be able to save the initial vertex position.
    onHandleWillChange(handle, e) {
        this.focus();
        const {
            relatedView,
            options
        } = this;
        const [normalizedEvt, x, y] = relatedView.paper.getPointerArgs(e);
        relatedView.model.startBatch('vertex-move', {
            ui: true,
            tool: this.cid
        });

        // FN: Keep the initial vertex position
        if (!this.eventData(e).vertexAdded) {
            this.#changedHandleInitialPosition = { ...relatedView.model.vertex(handle.options.index) };
        }

        if (!options.stopPropagation) {
            relatedView.notifyPointerdown(normalizedEvt, x, y);
        }
    }

    // Override to be able to dispatch a custom event with the new and the old (initial) vertex position.
    onHandleChanged(handle, e) {
        const {
            options,
            relatedView: linkView
        } = this;
        const { model } = linkView;
        let dispatchPointerUp = true;

        if (options.vertexAdding) {
            this.updatePath();
        }
        if (!options.redundancyRemoval) {
            linkView.checkMouseleave(util.normalizeEvent(e));
            return;
        }

        // FN: get the vertex before the redundant are removed
        const vertex = model.vertex(handle.options.index);

        const verticesRemoved = linkView.removeRedundantLinearVertices({
            ui: true,
            tool: this.cid
        });
        if (verticesRemoved) {
            this.render();
        }
        this.blur();
        linkView.model.stopBatch('vertex-move', {
            ui: true,
            tool: this.cid
        });
        if (this.eventData(e).vertexAdded) {
            linkView.model.stopBatch('vertex-add', {
                ui: true,
                tool: this.cid
            });
            // FN: was the recently added removed due to redudancy? Then don't dispatch pointerup event
            const index = model.vertices().findIndex(v => v.x === vertex.x && v.y === vertex.y);
            // FN: not found in the current vertices, it was removed
            if (index === -1) {
                dispatchPointerUp = false;
            }
        }
        const [normalizedEvt, x, y] = linkView.paper.getPointerArgs(e);

        // FN: Dispatch a custom event. This fires only when the user initiated it and not when redundant vertices
        // are removed (note: there might still be removed redundant vertices as well - see the call a few lines above).
        // If it is a recently added vertex that's immediately removed (redundant), this event is not fired
        if (dispatchPointerUp) {
            const { x: vertexNewX, y: vertexNewY } = vertex; // when the current vertex's removed because of redundancy
            const { x: vertexOldX, y: vertexOldY } = this.#changedHandleInitialPosition || {}; // when no value = new vertex
            linkView.notify('link:vertexhandle:pointerup', this, handle, { x: vertexNewX, y: vertexNewY }, { x: vertexOldX, y: vertexOldY }, normalizedEvt, x, y);
        }
        this.#changedHandleInitialPosition = null;

        if (!options.stopPropagation) {
            linkView.notifyPointerup(normalizedEvt, x, y);
        }
        linkView.checkMouseleave(normalizedEvt);
    }
}