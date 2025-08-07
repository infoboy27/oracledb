/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains misc utility functions.
 */

export function isPoint(o) {
    return typeof o.x === 'number' && typeof o.y === 'number' && Object.keys(o).length === 2;
}

export function populateRect(rect) {
    return Object.assign(rect, {
        left: rect.x,
        right: rect.x + rect.width,
        top: rect.y,
        bottom: rect.y + rect.height
    });
}