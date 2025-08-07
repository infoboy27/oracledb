/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the highlighting functionality for the cells.
 */

const { highlighters } = joint;

const HIGHLIGHT_ID_STR = 'cell-highlight-{0}';

let seq = 0;

export function highlightModel(paper, cell, opt = {}) {
    const view = getView(paper, cell);

    if (view) {
        return highlightView(view, opt);
    }
}

export function unhighlightModel(paper, cell, highlightId) {
    const view = getView(paper, cell);
    if (view) {
        unhighlightView(view, highlightId);
    }
}

export function highlightView(view, opt = {}) {
    const {
        duration = 0,
        ...rest
    } = opt;

    const highlightId = HIGHLIGHT_ID_STR.replace('{0}', seq);
    doHighlight(view, highlightId, rest);
    if (duration > 0) {
        (highlightId => setTimeout(() => doUnhighlight(view, highlightId), duration))(highlightId);
    }
    seq += 1;
    return highlightId;
}

export function unhighlightView(view, highlightId) {
    doUnhighlight(view, highlightId);
}

function getView(paper, cell) {
    const graph = paper.model;
    const model = cell.isElement() || cell.isLink() ? cell : graph.getCell(cell);

    if (!model) {
        return;
    }

    return model.findView(paper);
}

function doHighlight(view, highlightId, opt) {
    const {
        deep = true,
        layer = 'back',
        padding = 5,
        className = 'cell-highlight',
        attrs = {
            'stroke': 'var(--a-diagram-cell-highlight, orange)',
            'stroke-width': 2,
        },
        ...rest
    } = opt;

    highlighters.mask.add(view, { selector: 'root' }, highlightId, {
        deep,
        layer,
        padding,
        className,
        attrs,
        ...rest
    });
}

function doUnhighlight(view, highlightId) {
    highlightId == null ? highlighters.mask.remove(view) : highlighters.mask.remove(view, highlightId);
}