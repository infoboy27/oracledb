/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.dia.Graph with additional functionality and/or overrides.
 * 
 * Graph is the main model.
 */

const { dia } = joint;

export default class Graph extends dia.Graph {

    disconnectOutboundLinks(model, opt) {
        this.getConnectedLinks(model, { outbound: true }).forEach(function(link) {
            link.set('source', { x: 0, y: 0 }, opt);
        });
    }

    disconnectInboundLinks(model, opt) {
        this.getConnectedLinks(model, { inbound: true }).forEach(function(link) {
            link.set('target', { x: 0, y: 0 }, opt);
        });
    }

    // Override to be able to trigger beforeremove.
    _removeCell(cell, collection, options) {

        options = options || {};

        if (!options.clear) {
            this.trigger('beforeremove', cell, options);
            // Applications might provide a `disconnectLinks` option set to `true` in order to
            // disconnect links when a cell is removed rather then removing them. The default
            // is to remove all the associated links.
            if (options.disconnectLinks) {
                this.disconnectLinks(cell, options);

            }
            else {
                this.removeLinks(cell, options);
            }
        }
        // Silently remove the cell from the cells collection. Silently, because
        // `joint.dia.Cell.prototype.remove` already triggers the `remove` event which is
        // then propagated to the graph model. If we didn't remove the cell silently, two `remove` events
        // would be triggered on the graph model.
        this.get('cells').remove(cell, { silent: true });

        if (cell.graph === this) {
            // Remove the element graph reference only if the cell is the member of this graph.
            cell.graph = null;
        }
    }
}