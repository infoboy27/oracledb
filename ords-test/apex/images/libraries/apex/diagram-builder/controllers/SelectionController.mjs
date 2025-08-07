/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Controls the selection of the cells in the graph.
 */

import Controller from './Controller.mjs';
import { difference as arrayDifference } from '../utils/array.mjs';
import * as toolActions from '../actions/tool.mjs';
import DiagramBuilderSelectionMode from '../DiagramBuilderSelectionMode.mjs';

const MULTI_SELECTION_BUILT_IN_ACTIONS = ['remove', 'rotate', 'resize'];

export default class SelectionController extends Controller {

    startListening() {
        const { graph, selection, paper } = this.context;
        const { collection } = selection;

        // We will use the context object to pass the hovered view to other handlers
        this.context.hoveredView = null;

        this.stopListening();

        this.listenTo(graph, {
            'readonly': this.#onReadOnlyChange,
            'remove': onCellRemove
        });
        this.listenTo(collection, {
            'reset': onSelectionReset,
            'add': onSelectionAdd,
            'remove': onSelectionRemove
        });
        this.listenTo(paper, {
            'blank:pointerdown': onBlankPointerDown,
            'cell:pointerup': onCellPointerUp,
            'cell:mouseenter': this.#onCellMouseEnter,
            'cell:mouseleave': this.#onCellMouseLeave,
        });
    }

    #onReadOnlyChange(ctx, readOnly) {
        ctx.readOnly = readOnly;
    }

    #onCellMouseEnter(ctx, view) {
        ctx.hoveredView = view;
    }

    #onCellMouseLeave(ctx) {
        ctx.hoveredView = null;
    }
}

function onCellRemove(ctx, cell) {
    const { selection } = ctx;
    const { collection } = selection;
    if (collection.has(cell)) {
        collection.remove(cell);
    }
}

function updateSelectionAllowTranslate(ctx) {
    const { selection } = ctx;
    const { collection } = selection;
    const disallowTranslate = collection.models.some(model => {
        return model.isElement() && model.isReadOnly();
    });

    selection.options.allowTranslate = !disallowTranslate;
}

function onSelectionAdd(ctx, model, collection) {
    const { paper, selection } = ctx;

    // clearSelectionTools(paper, );
    if (collection.length === 1) {
        const cell = collection.first();
        const cellView = paper.requireView(cell);
        selectPrimaryCell(ctx, cellView);
    }
    else if (collection.length > 1) {
        clearSelectionTools(paper, collection.models);
        createHandles(ctx, selection, ctx.multiSelectionHandles, MULTI_SELECTION_BUILT_IN_ACTIONS);
    }
    selection.trigger('change', selection, {
        added: Array.isArray(model) ? model : [model],
        removed: []
    });

    updateSelectionAllowTranslate(ctx);
}

function onSelectionRemove(ctx, model, collection) {
    const { paper, selection } = ctx;
    if (collection.length === 1) {
        const cell = collection.first();
        const cellView = paper.requireView(cell);
        selectPrimaryCell(ctx, cellView);
    }
    selection.trigger('change', selection, {
        added: [],
        removed: Array.isArray(model) ? model : [model]
    });

    updateSelectionAllowTranslate(ctx);
}

function onSelectionReset(ctx, collection, { previousModels }) {
    const { paper, selection } = ctx;
    const currSelModels = collection.models;
    const prevSelModels = previousModels;
    const addedModels = arrayDifference(currSelModels, prevSelModels);
    const removedModels = arrayDifference(prevSelModels, currSelModels);

    // We must have the following condition before the return because the selection box
    // is added by jointjs on reset. Thus even if the selection didn't really change, the
    // box is automatically recreated.
    if (collection.length === 1) {
        const cell = collection.first();
        const cellView = paper.requireView(cell);

        if (cell.isLink()) {
            selection.destroySelectionBox(cell);
        }
        selectPrimaryCell(ctx, cellView);
    }
    else if (collection.length > 1) {
        createHandles(ctx, selection, ctx.multiSelectionHandles, MULTI_SELECTION_BUILT_IN_ACTIONS);
    }

    if (!addedModels.length && !removedModels.length) {
        return;
    }

    clearSelectionTools(paper, removedModels);

    selection.trigger('change', selection, {
        added: addedModels,
        removed: removedModels
    });

    updateSelectionAllowTranslate(ctx);
}

function clearSelectionTools(paper, models = []) {
    models = Array.isArray(models) ? models : [models];
    models.forEach(model => {

        if (model.isElement()) {
            toolActions.removeTools(paper.findViewByModel(model));
        }
        else {
            toolActions.removeTools(paper.findViewByModel(model), true);
        }
    });
}

function onCellPointerUp(ctx, cellView, e) {
    const { model } = cellView;
    const { selection, keyboard, mode } = ctx;
    const { collection } = selection;
    const containsLink = model.isLink() || collection.find(cell => cell.isLink());
    const isSelected = collection.includes(model);
    const selectable = model.isSelectable() && model.graph;

    if (!selectable) {
        return;
    }

    if (keyboard.isActive('ctrl meta', e)) {
        if (mode === DiagramBuilderSelectionMode.SINGLE) {
            if (isSelected) {
                collection.reset([]);
            }
            else {
                collection.reset([model]);
            }
        }
        else { // multi
            if (isSelected) {
                collection.remove(model);
            }
            else {
                if (containsLink) {
                    collection.reset([model]);
                }
                else {
                    collection.add(model);
                }
            }
        }
    }
    else if (!isSelected) {
        collection.reset([model]);
    }
}

function onBlankPointerDown(ctx, e, x, y) {
    const {
        paper,
        paperScroller,
        keyboard,
        selection,
        mode
    } = ctx;

    if (mode === DiagramBuilderSelectionMode.MULTI && keyboard.isActive('shift', e)) {
        selection.startSelecting(e);
    }
    else {
        clearSelectionTools(paper, selection.collection.models);
        selection.collection.reset([]);
        paperScroller.startPanning(e, x, y);
    }
}

function selectPrimaryCell(ctx, view) {
    const { hoveredView, readOnly, paper } = ctx;
    const { model } = view;

    if (model.isElement()) {
        const name = hoveredView === view ? toolActions.elementToolSetNames.ELEMENT_SELECTED_HOVERED : toolActions.elementToolSetNames.ELEMENT_SELECTED;
        toolActions.addElementTools(view, name, readOnly || model.isReadOnly());
    }
    else {
        paper.requireView(model);
        toolActions.addLinkTools(view, toolActions.linkToolSetNames.LINK_SELECTED, readOnly || model.isReadOnly());
    }
    // else: elements are added tools on pointer-up
}


function createHandles(ctx, owner, wanted, builtIn) {
    const removeHandles = arrayDifference(builtIn, wanted.map(cfg => cfg.name));
    removeHandles.forEach(handle => owner.removeHandle(handle));
    wanted.forEach(handle => {
        if (hasHandle(owner, handle.name)) {
            const h = getHandle(owner, handle.name);
            if (h.position !== handle.position) {
                owner.changeHandle(handle.name, { position: handle.position });
            }
        }
        else {
            owner.addHandle({
                name: handle.name,
                position: handle.position
            });
            owner.on(`action:${handle.name}:pointerdown`, e => handle.action(ctx, e));
        }
    });
}

function hasHandle(owner, name) {
    if (typeof owner.hasHandle === 'function') {
        return owner.hasHandle(name);
    }
    else {
        return owner.handles?.findIndex(handle => handle.name === name) > -1;
    }
}

function getHandle(owner, name) {
    if (typeof owner.getHandle === 'function') {
        return owner.getHandle(name);
    }
    else {
        return owner.handles?.find(handle => handle.name === name);
    }
}