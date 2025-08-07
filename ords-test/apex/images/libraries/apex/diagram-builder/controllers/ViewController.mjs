/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * The main controller handling basically all the interactions in the diagram.
 * 
 * Exceptions:
 * Selection is handled in the SelectionController.
 * Keyboard interactions are handled in the KeyboardController.
 */

import Controller from './Controller.mjs';
import { highlightView, unhighlightView } from '../actions/highlight.mjs';
import * as diaActions from '../actions/dia.mjs';
import * as toolActions from '../actions/tool.mjs';
import { getAnchorCoords } from '../utils/graph.mjs';
import Link from '../cells/links/Link.mjs';
import Element from '../cells/elements/Element.mjs';
import TargetPlaceholder from '../tools/links/TargetPlaceholder.mjs';
import SourcePlaceholder from '../tools/links/SourcePlaceholder.mjs';
import Placeholder from '../tools/links/Placeholder.mjs';
import { showToast } from '../actions/ui.mjs';
import DiagramBuilderLocale from '../DiagramBuilderLocale.mjs';

const oppositeSides = {
    left: 'right',
    right: 'left',
    top: 'bottom',
    bottom: 'top'
};

const LINK_LENGTH = 160;
const PLACEHOLDER_ALLOW_DROP_CLS = 'allow-drop';
const PLACEHOLDER_HIGHLIGHT_COLOR_STROKE = 'var(--a-diagram-link-placeholder-highlight-border-color, none)';
const PLACEHOLDER_HIGHLIGHT_COLOR_FILL = 'var(--a-diagram-link-placeholder-highlight-background-color, orange)';
const PLACEHOLDER_HIGHLIGHT_COLOR_GLYPH = 'var(--a-diagram-link-placeholder-highlight-text-color, #000)';

let overCellHighlightId;

export default class ViewController extends Controller {

    #paperScrollerResizeObserver;

    startListening() {
        const {
            graph,
            paper,
            stencil,
            paperScroller,
            navigator
        } = this.context;
        // default values, the context obj ref must stay the same!
        Object.assign(this.context, {
            allowDropConnectOnElement: () => { },
            allowDropConnectOnLink: () => { },
            allowDropConnectOnPlaceholder: () => { },
            ...this.context
        });
        this.stopListening();
        this.listenTo(paper, {
            'blank:pointerdown': onPaperBlankPointerDown,
            'cell:mouseenter': onCellMouseEnter,
            'cell:mouseleave': onCellMouseLeave,
            'link:pointerup': onLinkPointerUp,
            'link:placeholder:mouseenter': onLinkPlaceholderMouseEnter,
            'link:placeholder:mouseleave': onLinkPlaceholderMouseLeave,
            'link:placeholder:pointerup': onLinkPlaceholderPointerup,
            'link:placeholder:pointerdown': onLinkPlaceholderPointerdown,
            'element:pointerdown': onElementPointerdown,
            'element:pointerup': onElementPointerup,
            'scale': onPaperScale
        });
        this.listenTo(graph, {
            'readonly': onReadOnlyChange,
            'reset': onGraphReset,
            'add': onCellAdd,
            'remove': onCellRemove,
            'beforeremove': onBeforeRemove,
            'change:position': onPositionChange,
            'change:size': onSizeChange,
            'change:designation': onLinkDesignationChange,
            'change:source': onLinkSourceChange,
            'change:target': onLinkTargetChange,
        });
        this.listenTo(stencil, {
            'element:dragstart': onElementDragStart,
            'element:drop': onElementDrop,
            'element:dragend': onElementDragEnd,
            'element:drag': onElementDrag
        });
        this.listenTo(navigator, {
            'visibility': onNavVisibilityChange
        });

        // Not using the ui.Keyboard to catch ESC press to stop-drag as it cannot handle
        // capture phase.
        this.maybeCancelDrag = this.maybeCancelDrag.bind(this);
        document.addEventListener('keydown', this.maybeCancelDrag, true);

        // Keeps the navigator in sync after resizing the paper-scroller.
        this.#paperScrollerResizeObserver = new ResizeObserver(() => {
            // this function is debounced
            navigator.updateCurrentView();
        });
        this.#paperScrollerResizeObserver.observe(paperScroller.el);
    }

    maybeCancelDrag(e) {
        const {
            stencil,
            stencilDraggedView
        } = this.context;

        if (stencilDraggedView && e.key === 'Escape') {
            e.stopImmediatePropagation();
            stencil.cancelDrag();
        }
    }

    useKeyboard(bool) {
        const {
            paper,
            readOnly,
            hoveredView,
            selection
        } = this.context;
        const { collection } = selection;
        const selectedModel = collection.length === 1 ? collection.at(0) : null;
        const hoveredModel = hoveredView ? hoveredView.model : null;
        const isHoveredModelSelected = (hoveredModel && selectedModel === hoveredModel);

        this.context.usingKeyboard = bool;

        // going to keyboard nav
        if (bool) {
            // if a view was hovered but it is not the selected one, remove the hover tools
            if (hoveredView && !isHoveredModelSelected) {
                toolActions.removeTools(hoveredView);
            }

            // do it only if exactly one cell is selected
            if (selectedModel) {
                const selectedIsEl = selectedModel.isElement();
                const selectedView = selectedModel.findView(paper);
                const toolSetName = selectedIsEl ? toolActions.elementToolSetNames.ELEMENT_SELECTED_HOVERED : toolActions.linkToolSetNames.LINK_SELECTED;
                // if it doesn't have the toolset, add it back on; this can happen e.g. when
                // we hover another cell with the mouse and then use the keyboard to reposition
                if (!toolActions.hasToolSet(selectedView, toolSetName)) {
                    if (selectedIsEl) {
                        toolActions.addElementTools(selectedView, toolSetName);
                    }
                    else {
                        toolActions.addLinkTools(selectedView, toolSetName);
                    }
                }
            }
        }
        // returning from keyboard nav to mouse:
        else {
            // If an element was selected by the keyboard and it is not the hovered view after switching to mouse
            // we have to remove the tools as elements are not using ELEMENT_SELECTED toolset. On cell-out the tools
            // are removed.
            if (selectedModel && selectedModel.isElement() && selectedModel !== hoveredModel) {
                toolActions.removeTools(selectedModel.findView(paper));
            }
            // ...and if something is hovered, show tools on that view
            if (hoveredView) {
                if (hoveredModel.isElement()) {
                    toolActions.addElementTools(hoveredView, isHoveredModelSelected ? toolActions.elementToolSetNames.ELEMENT_SELECTED_HOVERED : toolActions.elementToolSetNames.ELEMENT_HOVERED, readOnly || hoveredModel.isReadOnly());
                }
                else {
                    toolActions.addLinkTools(hoveredView, isHoveredModelSelected ? toolActions.linkToolSetNames.LINK_SELECTED : toolActions.linkToolSetNames.LINK_HOVERED, readOnly || hoveredModel.isReadOnly());
                }
            }
        }
    }

    destroy() {
        super.destroy();
        this.#paperScrollerResizeObserver.unobserve(this.context.paperScroller.el);
        document.removeEventListener('keydown', this.maybeCancelDrag);
    }
}

function onReadOnlyChange(ctx, readOnly) {
    const { graph, paper, paperScroller } = ctx;

    ctx.readOnly = readOnly;

    graph.getLinks().forEach(link => {
        const view = link.findView(paper);
        if (view) {
            if (readOnly) {
                toolActions.removeLinkSourcePlaceholder(view);
                toolActions.removeLinkTargetPlaceholder(view);
            }
            else if (!link.isReadOnly()) {
                if (!link.getSourceCell()) { toolActions.addLinkSourcePlaceholder(view); }
                if (!link.getTargetCell()) { toolActions.addLinkTargetPlaceholder(view); }
            }
        }
    });

    paperScroller.adjustPaper();
}

function onNavVisibilityChange(ctx, visibility) {
    const { navigator } = ctx;
    const visible = visibility === 'visible';
    // pass it around
    ctx.navigatorVisible = visible;
    if (visible) {
        diaActions.updateAllConnections(navigator.targetPaper);
    }
}

function onPaperScale(ctx, sx) {
    const { locale, style, el } = ctx;
    showToast(`${locale[DiagramBuilderLocale.STR_ZOOM_LEVEL].replaceAll('{0}', Math.round(sx * 10) * 10)}`, {
        foregroundContainerCls: style.toastForegroundContainerCls,
        target: el
    });
}

function onElementPointerdown(ctx, view) {
    ctx.paperDraggedElementView = view;
}

function onElementPointerup(ctx) {
    ctx.paperDraggedElementView = null;
}

function onElementDragStart(ctx, cloneView) {
    ctx.stencilDraggedView = cloneView;
}

function onElementDrag(ctx, view, e) {
    const {
        hoveredView,
        dropConnectOnElements
    } = ctx;

    if (hoveredView) {
        const hoveredModel = ctx.hoveredView.model;
        if (!hoveredModel.isElement() || !dropConnectOnElements || validateDropOnElement(ctx, hoveredView, view) === false) {
            return;
        }

        addElementDropConnectDatasetFromEvent(ctx, e);
    }
}

function onElementDragEnd(ctx) {
    ctx.stencilDraggedView = null;
}

function onElementDrop(ctx, view, e, x, y, hoveredView, hoveredTool) {
    const {
        paper,
        graph,
        dropConnectOnElements,
        dropConnectOnLinks,
        snaplines
    } = ctx;

    // We are interested only in drops over links and elements so if it is over
    // blank, just return and let the default built-in functionality happen.
    if (!hoveredView || hoveredView.model.isReadOnly()) {
        return;
    }

    const { model } = view;
    const { model: hoveredModel } = hoveredView;

    if (overCellHighlightId != null) {
        unhighlightView(hoveredView, overCellHighlightId);
    }

    if (hoveredModel.isElement() && (!dropConnectOnElements || validateDropOnElement(ctx, hoveredView, view, true) === false)) {
        return;
    }
    if (hoveredModel.isLink()) {
        const tool = hoveredTool;
        const isPlaceholderTool = tool instanceof Placeholder;
        if (isPlaceholderTool) {
            if (validateDropOnPlaceholder(ctx, hoveredView, view, tool, true) === false) {
                return;
            }
        }
        else if (!dropConnectOnLinks || validateDropOnLink(ctx, hoveredView, view, true) === false) {
            return;
        }
    }

    if (hoveredModel.isElement()) {
        const { x: elX, y: elY } = hoveredModel.position();
        const side = elementSide(hoveredModel, x - elX, y - elY);
        const { x: hX, y: hY } = hoveredModel.position();
        const { width: hElW, height: hElH } = hoveredModel.size();
        const { width: newElW, height: newElH } = model.size();
        let posX = hX;
        let posY = hY;
        switch (side) {
            case 'left':
                posX = hX - LINK_LENGTH - newElW;
                posY = hY + (hElH - newElH) / 2;
                break;
            case 'right':
                posX = hX + hoveredModel.size().width + LINK_LENGTH;
                posY = hY + (hElH - newElH) / 2;
                break;
            case 'bottom':
                posX = hX + (hElW - newElW) / 2;
                posY = hY + hoveredModel.size().height + LINK_LENGTH;
                break;
            default: // 'top'
                posX = hX + (hElW - newElW) / 2;
                posY = hY - LINK_LENGTH - newElH;
        }
        model.position(posX, posY);

        const link = paper.getDefaultLink();
        // x and y are not important here as it is passed only to connection strategy... where we don't rely on it
        // because the side is passed so the link is set relatively without x and y.
        link.set({
            source: hoveredView.getLinkEnd(hoveredView.el, x, y, link, 'source', side),
            target: view.getLinkEnd(view.el, x, y, link, 'target', oppositeSides[side]),
        });
        graph.addCell(link);

    }
    else {
        const tool = toolActions.getToolByEl(hoveredView, e.target);
        if (isPlaceholderTool(tool)) {
            const ratio = tool.ratio;
            if (ratio === 0) {
                hoveredModel.source(model);
            }
            else if (ratio === 1) {
                hoveredModel.target(model);
            }
            else {
                diaActions.addElementToLinkAtRatio(view, hoveredView, ratio);
            }
        }
        else {
            const ratio = hoveredView.getClosestPointRatio({ x, y });
            diaActions.addElementToLinkAtRatio(view, hoveredView, ratio);
        }
    }
    snaplines.enable();
}

function elementSide(el, x, y) {
    const sides = ['left', 'right', 'top', 'bottom'];
    const { width, height } = el.size();
    const y1 = height * x / width; // y of 1st diagonal at x
    const y2 = height - y1; // y of 2nd diagonal at x
    return sides[x < 0 || width <= x || y < 0 || height <= y ? -1 : y < y1 ? (y < y2 ? 2 : 1) : (y < y2 ? 0 : 3)] || 'out';
}

function onGraphReset(ctx, { models = [] }) {
    const { paper, readOnly } = ctx;
    ctx.hoveredView = null;
    if (!readOnly) {
        models.forEach(model => {
            if (model.isLink() && !model.isReadOnly()) {
                addLinkPlaceholders(paper, model);
            }
        });
    }
}

function onLinkDesignationChange(ctx, link, val) {
    const { linkDesignations, style } = ctx;
    const labels = link.labels();
    const indexDesignation = labels.findIndex(l => 'designation' in l);
    // we have an existing label but no new val, should be removed
    if (indexDesignation > -1 && val == null) {
        link.removeLabel(indexDesignation);
        return;
    }

    if (val) {
        let designation,
            tooltip,
            tooltipPosition;
        if (typeof val === 'object') {
            ({ typeId: designation, tooltip, tooltipPosition } = val);
        }
        else {
            designation = val;
        }
        // find the designation in the app's config
        const cfg = linkDesignations.find(cfg => cfg.typeId === designation);
        // if we have a cfg, it is allowed
        if (cfg) {
            const newDesCfg = Link.getLinkDesignationCfg({
                distance: 30,
                glyph: cfg.glyph,
                designation,
                tooltip,
                tooltipPosition,
                cls: style.linkDesignationCls || []
            });

            // update label
            if (indexDesignation > -1) {
                link.label(indexDesignation, newDesCfg);
            }
            // create new
            else {
                link.insertLabel(0, newDesCfg);
            }
        }
        else {
            link.designation(null);
        }
    }
}

function onLinkPointerUp(ctx, view, e) {
    const { action, arrowhead } = view.eventData(e);

    if (action === 'arrowhead-move') {
        const { model } = view;
        if (arrowhead === 'source') {
            if (!model.getSourceCell()) {
                toolActions.addLinkSourcePlaceholder(view);
            }
            else if (toolActions.hasTool(view, toolActions.linkToolNames.SOURCE_PLACEHOLDER)) {
                toolActions.removeLinkSourcePlaceholder(view);
            }
        }
        else {
            if (!model.getTargetCell()) {
                toolActions.addLinkTargetPlaceholder(view);
            }
            else if (toolActions.hasTool(view, toolActions.linkToolNames.TARGET_PLACEHOLDER)) {
                toolActions.removeLinkTargetPlaceholder(view);
            }
        }
    }
}

function onLinkSourceChange(ctx, model) {
    const { paper, readOnly } = ctx;
    const view = model.findView(paper);
    const action = view._dragData?.action;

    if (action === 'arrowhead-move' || readOnly) {
        return;
    }

    if (!model.getSourceCell()) {
        toolActions.addLinkSourcePlaceholder(view);
    }
    else if (toolActions.hasTool(view, toolActions.linkToolNames.SOURCE_PLACEHOLDER)) {
        toolActions.removeLinkSourcePlaceholder(view);
    }
}

function onLinkTargetChange(ctx, model) {
    const { paper } = ctx;
    const view = model.findView(paper);
    const action = view._dragData?.action;

    if (action === 'arrowhead-move') {
        return;
    }

    if (!model.getTargetCell()) {
        toolActions.addLinkTargetPlaceholder(view);
    }
    else if (toolActions.hasTool(view, toolActions.linkToolNames.TARGET_PLACEHOLDER)) {
        toolActions.removeLinkTargetPlaceholder(view);
    }
}

function onCellAdd(ctx, cell, _, { ui }) {
    const {
        paper,
        readOnly,
        elementProps = {},
        linkProps = {},
    } = ctx;
    const props = cell.isElement() ? elementProps : linkProps;

    // Currently applies only to elements as all link props can be set through
    // the defaultLink option (we have only 1 link type). Will leave this here
    // for possible future improvement.
    for (let prop in props) {
        if (Object.hasOwn(props, prop)) {
            const curr = cell.prop(prop);
            // if no prop on the cell, add it
            if (curr === undefined) {
                cell.prop(prop, elementProps[prop]);
            }
        }
    }

    if (cell.isElement()) {
        updateLinkRouting(ctx);
    }
    // set placeholders only if it is not dragged from a connect tool
    else if (!ui && !readOnly && !cell.isReadOnly()) {
        addLinkPlaceholders(paper, cell);
    }
}

function onCellRemove(ctx, cell) {
    if (ctx.hoveredView && ctx.hoveredView.model === cell) {
        ctx.hoveredView = null;
    }
}

function onBeforeRemove(ctx, cell) {
    const { graph } = ctx;
    if (cell.isElement()) {
        const keepOutbound = cell.get('onRemoveKeepOutboundLinks');
        const keepInbound = cell.get('onRemoveKeepInboundLinks');
        if (keepOutbound) {
            graph.getConnectedLinks(cell, { outbound: true }).forEach(function(link) {
                const sourcePoint = getAnchorCoords(link.source().anchor, cell.getBBox());
                link.source(sourcePoint);

            });
        }
        if (keepInbound) {
            graph.getConnectedLinks(cell, { inbound: true }).forEach(function(link) {
                const targetPoint = getAnchorCoords(link.target().anchor, cell.getBBox());
                link.target(targetPoint);
            });
        }
    }
}

function addLinkPlaceholders(paper, link) {
    const s = link.getSourceCell();
    const t = link.getTargetCell();
    const view = link.findView(paper);
    if (!s) {
        toolActions.addLinkSourcePlaceholder(view);
    }
    if (!t) {
        toolActions.addLinkTargetPlaceholder(view);
    }
}

function onPositionChange(ctx) {
    updateLinkRouting(ctx);
}

function onSizeChange(ctx) {
    updateLinkRouting(ctx);
}

function updateLinkRouting({ paper, navigator, navigatorVisible }) {
    diaActions.updateAutoRoutedConnections(paper);
    if (navigator && navigatorVisible) {
        diaActions.updateAutoRoutedConnections(navigator.targetPaper);
    }
}

function addElementDropConnectDatasetFromEvent(ctx, e) {
    const view = ctx.hoveredView;
    const { model } = view;
    const { paper } = ctx;
    const { x, y } = paper.clientToLocalPoint(e.clientX, e.clientY);
    const { x: elX, y: elY } = model.position();
    view.el.dataset.dropConnectSide = elementSide(model, x - elX, y - elY);
}

function onCellMouseEnter(ctx, view, e) {
    const {
        selection,
        readOnly,
        dropConnectOnElements,
        dropConnectOnLinks,
        stencilDraggedView,
        snaplines,
        usingKeyboard,
        style
    } = ctx;
    const { collection } = selection;
    const { model, el } = view;
    const selected = collection.length === 1 && collection.has(model);

    if (ctx.hoveredView === view) {
        return;
    }

    if (readOnly) {
        if (model.isElement()) {
            el.style = 'cursor: default';
        }
        else {
            el.querySelector('[joint-selector="wrapper"]').style = 'cursor: default';
        }
    }

    ctx.hoveredView = view;

    if (usingKeyboard) {
        return;
    }

    if (style.hoverCls?.length && !stencilDraggedView) {
        const { hoverCls } = style;
        el.classList.add(...(Array.isArray(hoverCls) ? hoverCls : hoverCls.split(' ')));
    }

    if (model.isElement()) {
        if (dropConnectOnElements && stencilDraggedView && !model.isReadOnly()) {
            if (validateDropOnElement(ctx, view, stencilDraggedView) !== false) {
                overCellHighlightId = highlightView(view);
                addElementDropConnectDatasetFromEvent(ctx, e);
                snaplines.disable();
                // One may expect disable would also hide but it is not so...
                snaplines.hide();
            }
        }
        // add tools only when not dragging from stencil
        if (!stencilDraggedView) {
            toolActions.addElementTools(view, selected ? toolActions.elementToolSetNames.ELEMENT_SELECTED_HOVERED : toolActions.elementToolSetNames.ELEMENT_HOVERED, readOnly || model.isReadOnly());
        }
    }
    else {
        if (!model.isReadOnly()) {
            const tool = toolActions.getToolByEl(view, e.target);
            // if it is a placeholder tool, it is handled by onLinkPlaceholderMouseEnter & onLinkPlaceholderMouseLeave
            // if not:
            if (!isPlaceholderTool(tool) && dropConnectOnLinks && stencilDraggedView) {
                if (validateDropOnLink(ctx, view, stencilDraggedView) !== false) {
                    overCellHighlightId = highlightView(view);
                    snaplines.disable();
                    snaplines.hide();
                }
            }
        }
        // add tools only when not dragging from stencil
        if (!stencilDraggedView) {
            toolActions.addLinkTools(view, selected ? toolActions.linkToolSetNames.LINK_SELECTED : toolActions.linkToolSetNames.LINK_HOVERED, readOnly || model.isReadOnly());
        }
    }
}

function onLinkPlaceholderPointerdown(ctx, view, tool, ratio, point, e) {
    e.stopPropagation();
}

function onLinkPlaceholderPointerup(ctx, view, tool, ratio) {
    const {
        paperDraggedElementView
    } = ctx;
    const link = view.model;

    if (paperDraggedElementView && validateDropOnPlaceholder(ctx, view, paperDraggedElementView, tool, true) !== false) {
        if (ratio === 0) {
            link.source(paperDraggedElementView.model);
        }
        else if (ratio === 1) {
            link.target(paperDraggedElementView.model);
        }
        else {
            diaActions.addElementToLinkAtRatio(paperDraggedElementView, view, ratio);
        }
    }
}

function onLinkPlaceholderMouseEnter(ctx, view, tool, ratio, point, e) {
    const {
        paper,
        dropConnectOnLinks,
        stencilDraggedView,
        paperDraggedElementView,
        snaplines
    } = ctx;
    const { relatedTarget } = e;
    const relatedView = paper.findView(relatedTarget);
    const draggedView = stencilDraggedView || paperDraggedElementView;

    // At this point cell mouse enter has not yet fired, so hoveredView is null!
    // We need to use the view arg.

    if (draggedView) {
        if (validateDropOnPlaceholder(ctx, view, draggedView, tool) !== false) {
            tool.el.classList.add(PLACEHOLDER_ALLOW_DROP_CLS);
            // Show highlight colors
            tool.setColors({
                stroke: PLACEHOLDER_HIGHLIGHT_COLOR_STROKE,
                fill: PLACEHOLDER_HIGHLIGHT_COLOR_FILL,
                glyph: PLACEHOLDER_HIGHLIGHT_COLOR_GLYPH
            });
        }
    }

    // unhighlight the linkview if dropping on it is allowed
    if (dropConnectOnLinks && relatedView && relatedView === view && stencilDraggedView) {
        unhighlightView(relatedView, overCellHighlightId);
        snaplines.enable();
    }
}

function onLinkPlaceholderMouseLeave(ctx, view, tool, ratio, point, e) {
    const {
        paper,
        dropConnectOnLinks,
        hoveredView,
        stencilDraggedView,
        snaplines
    } = ctx;
    const { relatedTarget } = e;
    const relatedView = paper.findView(relatedTarget);

    tool.el.classList.remove(PLACEHOLDER_ALLOW_DROP_CLS);
    tool.resetColors();

    if (dropConnectOnLinks && relatedView && relatedView === hoveredView && stencilDraggedView) {
        overCellHighlightId = highlightView(relatedView);
        snaplines.disable();
        snaplines.hide();
    }
}

function onCellMouseLeave(ctx, view) {
    const {
        selection,
        readOnly,
        paper,
        dropConnectOnLinks,
        dropConnectOnElements,
        snaplines,
        usingKeyboard,
        style
    } = ctx;
    const { model, el } = view;
    const { collection } = selection;
    const selected = collection.length === 1 && collection.has(model);

    if (readOnly) {
        el.style = '';
    }

    ctx.hoveredView = null;

    if (usingKeyboard) {
        return;
    }

    if (style.hoverCls?.length) {
        const { hoverCls } = style;
        el.classList.remove(...(Array.isArray(hoverCls) ? hoverCls : hoverCls.split(' ')));
    }

    if (model.isElement()) {
        if (dropConnectOnElements) {
            if (overCellHighlightId != null) {
                unhighlightView(view, overCellHighlightId);
            }
            snaplines.enable();
        }

        // We will always remove tools - even tho we have ELEMENT_SELECTED set, it should all be hidden on mouse out
        // but will still need it to be displayed for keyboard navigation.
        toolActions.removeTools(view);
    }
    if (model.isLink()) {
        if (dropConnectOnLinks) {
            if (overCellHighlightId != null) {
                unhighlightView(view, overCellHighlightId);
            }
            snaplines.enable();
        }
        if (selected) {
            paper.requireView(model);
            toolActions.addLinkTools(view, toolActions.linkToolSetNames.LINK_SELECTED, readOnly || model.isReadOnly());
        }
        else {
            toolActions.removeTools(view, true);
        }
    }
}

function onPaperBlankPointerDown(ctx, e, x, y) {
    const { paperScroller, keyboard } = ctx;
    if (!keyboard.isActive('shift', e)) {
        paperScroller.startPanning(e, x, y);
    }
}

function isPlaceholderTool(tool) {
    return tool && (tool instanceof SourcePlaceholder || tool instanceof TargetPlaceholder);
}

function validateDropOnLink(ctx, hoveredView, draggedView, isDrop = false) {
    const {
        readOnly,
        allowDropConnectOnLink
    } = ctx;
    const link = hoveredView.model;
    const draggedEl = draggedView.model;
    if (
        readOnly ||
        link.isReadOnly() ||
        !link.allow(Link.ALLOW_TARGET_CHANGE) ||
        !draggedEl.allow(Element.ALLOW_LINK_IN) ||
        !draggedEl.allow(Element.ALLOW_LINK_OUT)
    ) {
        return false;
    }

    return allowDropConnectOnLink(hoveredView, draggedView, isDrop);
}

function validateDropOnElement(ctx, hoveredView, draggedView, isDrop = false) {
    const {
        readOnly,
        allowDropConnectOnElement
    } = ctx;
    const el = hoveredView.model;
    const draggedEl = draggedView.model;
    if (
        readOnly ||
        el.isReadOnly() ||
        !el.allow(Element.ALLOW_LINK_OUT) ||
        !draggedEl.allow(Element.ALLOW_LINK_IN)
    ) {
        return false;
    }

    return allowDropConnectOnElement(hoveredView, draggedView, isDrop);
}

function validateDropOnPlaceholder(ctx, linkView, draggedView, tool, isDrop = false) {
    const {
        readOnly,
        allowDropConnectOnPlaceholder
    } = ctx;
    const link = linkView.model;
    const draggedEl = draggedView.model;
    const ratio = tool.ratio;

    if (readOnly || link.isReadOnly()) {
        return false;
    }

    if (ratio === 0) {
        if (!link.allow(Link.ALLOW_SOURCE_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_OUT)) {
            return false;
        }
    }
    else if (ratio === 1) {
        if (!link.allow(Link.ALLOW_TARGET_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_IN)) {
            return false;
        }
    }
    else {
        if (!link.allow(Link.ALLOW_TARGET_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_OUT) || !draggedEl.allow(Element.ALLOW_LINK_IN)) {
            return false;
        }
    }

    return allowDropConnectOnPlaceholder(linkView, draggedView, tool, isDrop);
}