/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.dia.Paper with additional functionality and/or overrides.
 * 
 * Paper is the view that displays all the cells.
 */

const { dia } = joint;

export default class Paper extends dia.Paper {

    // Override to pass through the drag-data.
    linkAllowed(linkView, dragData) {

        if (!(linkView instanceof dia.LinkView)) {
            throw new Error('Must provide a linkView.');
        }

        const link = linkView.model;
        const paperOptions = this.options;
        const graph = this.model;
        const ns = graph.constructor.validations;

        if (!paperOptions.multiLinks) {
            if (!ns.multiLinks.call(this, graph, link)) {
                return false;
            }
        }

        if (!paperOptions.linkPinning) {
            // Link pinning is not allowed and the link is not connected to the target.
            if (!ns.linkPinning.call(this, graph, link)) {
                return false;
            }
        }

        if (typeof paperOptions.allowLink === 'function') {
            if (!paperOptions.allowLink.call(this, linkView, this, dragData)) {
                return false;
            }
        }

        return true;
    }
}