/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Contains the functions for attaching and detaching the tools.
 * 
 * Every cell, be it an element or a link, can have tools attached to it, such as
 * Menu (button), Connect (button), vertices, placeholders, etc. This file provides
 * all the functions to display them correctly so that the view controllers are
 * not polluted with tool-management.
 */

import Connect from '../tools/elements/Connect.mjs';
import Menu from '../tools/Menu.mjs';
import AddElementButton from '../tools/links/AddElementButton.mjs';
import SourceArrowhead from '../tools/links/SourceArrowhead.mjs';
import TargetArrowhead from '../tools/links/TargetArrowhead.mjs';
import DiagramBuilderRouter from '../DiagramBuilderRouter.mjs';
import SourceAnchor from '../tools/links/SourceAnchor.mjs';
import TargetAnchor from '../tools/links/TargetAnchor.mjs';
import ShapeElement from '../cells/elements/ShapeElement.mjs';
import Link from '../cells/links/Link.mjs';
import Element from '../cells/elements/Element.mjs';
import SourcePlaceholder from '../tools/links/SourcePlaceholder.mjs';
import TargetPlaceholder from '../tools/links/TargetPlaceholder.mjs';
import Boundary from '../tools/links/Boundary.mjs';
import Vertices from '../tools/links/Vertices.mjs';
import Segments from '../tools/links/Segments.mjs';

const { dia } = joint;

export const linkToolNames = Object.freeze({
    BOUNDARY: 'boundary',
    VERTICES: 'vertices',
    SOURCE_PLACEHOLDER: 'source-placeholder',
    TARGET_PLACEHOLDER: 'target-placeholder',
    SOURCE_ARROWHEAD: 'source-arrowhead',
    TARGET_ARROWHEAD: 'target-arrowhead',
    SOURCE_ANCHOR: 'source-anchor',
    TARGET_ANCHOR: 'target-anchor',
    SEGMENTS: 'segments',
    MENU_BUTTON: 'menu-button',
    REMOVE_BUTTON: 'remove-button',
    ADD_ELEMENT_BUTTON: 'add-element-button'
});

export const linkToolSetNames = Object.freeze({
    LINK_HOVERED: 'link-hovered',
    LINK_SELECTED: 'link-selected'
});

export const elementToolNames = Object.freeze({
    CONNECT: 'connect-button',
    MENU_BUTTON: 'menu-button'
});

export const elementToolSetNames = Object.freeze({
    ELEMENT_SELECTED: 'element-selected',
    ELEMENT_SELECTED_HOVERED: 'element-selected-hovered',
    ELEMENT_HOVERED: 'element-hovered',
});

// Not exposed
const LINK_PLACEHOLDERS = 'link-placeholders';

const linkToolsOrder = {
    [linkToolNames.BOUNDARY]: 0,
    [linkToolNames.VERTICES]: 10,
    [linkToolNames.SOURCE_PLACEHOLDER]: 20,
    [linkToolNames.TARGET_PLACEHOLDER]: 30,
    [linkToolNames.SOURCE_ARROWHEAD]: 40,
    [linkToolNames.TARGET_ARROWHEAD]: 50,
    [linkToolNames.SOURCE_ANCHOR]: 60,
    [linkToolNames.TARGET_ANCHOR]: 70,
    [linkToolNames.SEGMENTS]: 80,
    [linkToolNames.MENU_BUTTON]: 90,
    [linkToolNames.ADD_ELEMENT_BUTTON]: 100
};

const elementToolSets = Object.freeze({
    [elementToolSetNames.ELEMENT_SELECTED_HOVERED]: (model, readOnly) => {
        const allowLinkOut = model.allow(Element.ALLOW_LINK_OUT);
        const hasMenu = model.hasMenu();
        const arr = [];

        if (hasMenu) {
            arr.push(new Menu({
                ...getMenuPosition(model),
                markup: getMenuMarkup(model),
                scale
            }));
        }
        if (!readOnly && allowLinkOut) {
            arr.push(...[
                new Connect({ position: 'top', scale }),
                new Connect({ position: 'right', scale }),
                new Connect({ position: 'bottom', scale }),
                new Connect({ position: 'left', scale }),
            ]);
        }
        return arr;
    },
    [elementToolSetNames.ELEMENT_SELECTED]: (model, readOnly) => {
        const allowLinkOut = model.allow(Element.ALLOW_LINK_OUT);
        const hasMenu = model.hasMenu();
        const arr = [];

        if (hasMenu) {
            arr.push(new Menu({
                ...getMenuPosition(model),
                markup: getMenuMarkup(model),
                scale
            }));
        }
        if (!readOnly && allowLinkOut) {
            arr.push(...[
                new Connect({ position: 'top', scale }),
                new Connect({ position: 'right', scale }),
                new Connect({ position: 'bottom', scale }),
                new Connect({ position: 'left', scale }),
            ]);
        }
        return arr;
    },
    [elementToolSetNames.ELEMENT_HOVERED]: (model, readOnly) => {
        const allowLinkOut = model.allow(Element.ALLOW_LINK_OUT);
        const hasMenu = model.hasMenu();
        const arr = [];

        if (hasMenu) {
            arr.push(new Menu({
                ...getMenuPosition(model),
                markup: getMenuMarkup(model),
                scale
            }));
        }
        if (!readOnly && allowLinkOut) {
            arr.push(...[
                new Connect({ position: 'top', scale }),
                new Connect({ position: 'right', scale }),
                new Connect({ position: 'bottom', scale }),
                new Connect({ position: 'left', scale }),
            ]);
        }
        return arr;
    }
});

const linkToolSets = Object.freeze({
    [linkToolSetNames.LINK_SELECTED]: (view, readOnly) => {
        const { model, paper } = view;
        const hasMenu = model.hasMenu();
        const tools = [
            new Boundary({ padding: 6 * scale })
        ];

        if (!readOnly) {
            if (model.allow(Link.ALLOW_SOURCE_CHANGE)) {
                tools.push(new SourceArrowhead({ scale }));
            }
            if (model.allow(Link.ALLOW_TARGET_CHANGE)) {
                tools.push(
                    new TargetArrowhead({ scale }),
                    new AddElementButton({
                        scale,
                        offset: -30,
                        distance: '50%',
                        toggleOffsetConnector: true
                    }),
                );
            }
            if (model.router()?.name === DiagramBuilderRouter.NORMAL || paper.options.defaultRouter.name === DiagramBuilderRouter.NORMAL) {
                tools.push(new Segments({ scale, stopPropagation: true }));
            }
            if (hasMenu) {
                tools.push(new Menu({
                    offset: 20,
                    distance: -30,
                    markup: getMenuMarkup(model),
                    scale
                }));
            }
            tools.push(
                new Vertices({
                    scale,
                    stopPropagation: true,
                }),
                new SourceAnchor({ scale, snap: snapAnchor }),
                new TargetAnchor({ scale, snap: snapAnchor })
            );
        }
        return tools;
    },
    [linkToolSetNames.LINK_HOVERED]: (view, readOnly) => {
        const { model } = view;
        const tools = [];
        if (!readOnly) {
            tools.push(
                new Vertices({
                    scale,
                    vertexAdding: false,
                    stopPropagation: true
                })
            );
            if (model.allow(Link.ALLOW_SOURCE_CHANGE)) {
                tools.push(new SourceArrowhead({ scale }));
            }
            if (model.allow(Link.ALLOW_TARGET_CHANGE)) {
                tools.push(new TargetArrowhead({ scale }));
            }
        }
        return tools;
    }
});

// Currently not used - placeholder, just sets the scale config of every tool in case we use scaling
// in the future.
let scale = 1;

function sortLinkTools(tools = []) {
    tools.sort((a, b) => {
        const oA = linkToolsOrder[a.name] || 0;
        const oB = linkToolsOrder[b.name] || 0;
        return oA - oB;
    });
    return tools;
}

function addTools(view, name, arr) {
    const { model } = view;
    // There is a weird issue when placeholders are not removed after a link has been
    // disallowed with the action: "remove" (i.e. new links, not already existing and repositioned).
    // The view seems to be removed but occasionaly the placeholder stays in place/is created
    // after (?). Very likely connected to the async rendering of the paper.
    // Let's try to prevent it with checking whether the model exists in the graph.
    if (model.graph == null) {
        return;
    }

    const toolsView = new dia.ToolsView({
        name,
        tools: arr
    });

    view.addTools(toolsView);
}

function snapAnchor(coords, view, magnet, type, relatedView, toolView) {
    const snapRadius = toolView.options.snapRadius;
    const getCoord = n => Math.round(n / snapRadius) * snapRadius;
    coords.x = getCoord(coords.x);
    coords.y = getCoord(coords.y);
    return coords;
}

function getMenuPosition(model) {
    const rtl = model.get('rtl');
    if (model instanceof ShapeElement) {
        return {
            x: rtl ? 12 : 'calc(w - 12)',
            y: 'calc(h - 12)'
        };
    }
    else {
        return {
            x: rtl ? '15%' : '85%',
            y: '85%'
        };
    }
}

function getMenuMarkup(model) {
    if (model.isElement()) {
        return model instanceof ShapeElement ? Menu.MARKUP_SHAPE_ELEMENT : Menu.MARKUP_TERMINATOR_ELEMENT;
    }
    // links
    return Menu.MARKUP_LINK;
}

// Exported functions
export function addLinkSourcePlaceholder(view) {
    const { model } = view;

    if (hasTool(view, linkToolNames.SOURCE_PLACEHOLDER) || !model.allow(Link.ALLOW_SOURCE_CHANGE)) {
        return;
    }

    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);

    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
        addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
            new SourcePlaceholder({ scale }),
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
    else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
        addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
            new SourcePlaceholder({ scale }),
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
    else {
        addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
            new SourcePlaceholder({ scale }),
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
}

export function removeLinkSourcePlaceholder(view) {
    if (!hasTool(view, linkToolNames.SOURCE_PLACEHOLDER)) {
        return;
    }

    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);

    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
        addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
    else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
        addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
    else {
        addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
            ...(tp ? [new TargetPlaceholder({ scale })] : [])
        ]));
    }
}

export function addLinkTargetPlaceholder(view) {
    const { model } = view;

    if (hasTool(view, linkToolNames.TARGET_PLACEHOLDER) || !model.allow(Link.ALLOW_TARGET_CHANGE)) {
        return;
    }

    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);

    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
        addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
            new TargetPlaceholder({ scale }),
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
    else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
        addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
            new TargetPlaceholder({ scale }),
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
    else {
        addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
            new TargetPlaceholder({ scale }),
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
}

export function removeLinkTargetPlaceholder(view) {
    if (!hasTool(view, linkToolNames.TARGET_PLACEHOLDER)) {
        return;
    }

    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);

    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
        addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
    else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
        addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
            ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
    else {
        addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
            ...(sp ? [new SourcePlaceholder({ scale })] : [])
        ]));
    }
}

export function addLinkTools(view, name, readOnly = false) {
    if (!linkToolSets[name] || view.hasTools(name)) {
        return; // no tool set found
    }

    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);

    addTools(view, name, sortLinkTools([
        ...linkToolSets[name](view, readOnly),
        ...(sp ? [new SourcePlaceholder({ scale })] : []),
        ...(tp ? [new TargetPlaceholder({ scale })] : [])
    ]));
}

export function addElementTools(view, name, readOnly = false) {
    if (!elementToolSets[name] || view.hasTools(name)) {
        return; // no tool set found
    }

    addTools(view, name, elementToolSets[name](view.model, readOnly));
}

export function removeTools(view, keepLinkPlaceholders = true) {
    const { model } = view;
    if (model.isElement() || !keepLinkPlaceholders) {
        view.removeTools();
    }
    else {
        const hasOtherTools = view.hasTools(linkToolSetNames.LINK_SELECTED) || view.hasTools(linkToolSetNames.LINK_HOVERED);
        if (!hasOtherTools) {
            return;
        }
        const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
        const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);
        if (sp || tp) {
            addTools(view, LINK_PLACEHOLDERS, [
                ...(sp ? [new SourcePlaceholder({ scale })] : []),
                ...(tp ? [new TargetPlaceholder({ scale })] : [])
            ]);
        }
        else {
            view.removeTools();
        }
    }
}

export function hasToolSet(view, name) {
    return view.hasTools(name);
}

export function hasTool(view, name) {
    return !!view._toolsView?.tools.some(tool => tool.name === name);
}

export function getToolByEl(view, el) {
    return view._toolsView?.tools.find(tool => tool.el.contains(el));
}

export function getToolBy(view, fn) {
    return view._toolsView?.tools.find(tool => fn(view, tool));
}