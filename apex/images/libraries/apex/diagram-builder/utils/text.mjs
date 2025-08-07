/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains text-related utility functions.
 */

const { V } = joint;

export function measureText(svgDocument, text, attrs) {
    const vText = V('text').attr(attrs).text(text);
    vText.appendTo(svgDocument);
    const bbox = vText.getBBox();
    vText.remove();
    return bbox;
}

export function sanitize(str = '') {
    return str.replace(/</g, '&lt;').replace(/>/g, '&gt;');
}