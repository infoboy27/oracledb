/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the functions for selecting and deselecting the cells.
 */

import DiagramBuilderSelectionMode from '../DiagramBuilderSelectionMode.mjs';

export function select(selection, models, { add = false, scrollTo = false, mode, paperScroller } = {}) {
    if (mode === DiagramBuilderSelectionMode.NONE) {
        return;
    }

    const { collection } = selection;
    const current = collection.models;
    models = Array.isArray(models) ? models : [models];

    // check whether it contains (multiple) link(s)
    const containsLink = models.findIndex(model => model.isLink()) > -1;
    const containsElement = models.findIndex(model => model.isElement()) > -1;

    // if it is mixed, keep the elements only
    if (containsElement && containsLink) {
        models = models.filter(model => model.isElement());
    }
    // if it is pure links, we can select only 1
    else if (containsLink) {
        collection.reset([models[0]]);
        return;
    }

    // at this point we have only elements in our newly selected models

    if (mode === DiagramBuilderSelectionMode.SINGLE) {
        add = false;
        models.length = models.length ? 1 : 0;
    }

    if (add) {
        // if current is a link
        if (current.length === 1 && current[0].isLink()) {
            collection.reset(models);
        }
        else {
            collection.add(models);
        }
    }
    else {
        collection.reset(models);
    }

    if (scrollTo && paperScroller && !paperScroller.isElementVisible(models[0])) {
        paperScroller.scrollToElement(models[0], { animation: true });
    }
}

export function deselect(selection, models) {
    const { collection } = selection;
    if (!models || !models.length) {
        collection.reset([]);
    }
    else {
        collection.remove(models);
    }
}