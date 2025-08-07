/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Manages the interactions with the keyboard.
 * 
 * The default shortcuts can be overridden by the user by providing the 'keyboardNavigationMap'
 * configuration.
 * 
 * All the available constants are stored in the DiagramBuilderKeyboardAction and exposed under
 * DiagramBuilder.KeyboardAction namespace.
 */

import { deselect, select } from '../actions/selection.mjs';
import Controller from './Controller.mjs';
import * as diaActions from '../actions/dia.mjs';
import * as toolActions from '../actions/tool.mjs';
import { staticConsts } from '../utils/helpers.mjs';
import DiagramBuilderKeyboardAction from '../DiagramBuilderKeyboardAction.mjs';
import Connect from '../tools/elements/Connect.mjs';
import Menu from '../tools/Menu.mjs';
import SourcePlaceholder from '../tools/links/SourcePlaceholder.mjs';
import TargetPlaceholder from '../tools/links/TargetPlaceholder.mjs';
import AddElementButton from '../tools/links/AddElementButton.mjs';

const { g } = joint;

const BEFORE_ACTION = 'beforeaction';
const KEYBOARD_INDEX_KEY = 'keyboardCycleIndex';
const A = DiagramBuilderKeyboardAction;
const functionMap = {
    [A.DESELECT]: onDeselect,
    [A.CYCLE_UP]: onCycleUp,
    [A.CYCLE_DOWN]: onCycleDown,
    [A.CYCLING_MODE_CHANGE]: onCyclingModeChange,
    [A.CELL_MENU_SHOW]: onMenu,
    [A.CELL_REMOVE]: onRemove,
    [A.SELECTION_MOVE_UP]: onSelectionMoveUp,
    [A.SELECTION_MOVE_DOWN]: onSelectionMoveDown,
    [A.SELECTION_MOVE_LEFT]: onSelectionMoveLeft,
    [A.SELECTION_MOVE_RIGHT]: onSelectionMoveRight,
    [A.PAPER_PAN_UP]: onPanUp,
    [A.PAPER_PAN_DOWN]: onPanDown,
    [A.PAPER_PAN_LEFT]: onPanLeft,
    [A.PAPER_PAN_RIGHT]: onPanRight,
    [A.ELEMENT_CONNECT_TOP_TRIGGER]: onElementConnectTop,
    [A.ELEMENT_CONNECT_BOTTOM_TRIGGER]: onElementConnectBottom,
    [A.ELEMENT_CONNECT_LEFT_TRIGGER]: onElementConnectLeft,
    [A.ELEMENT_CONNECT_RIGHT_TRIGGER]: onElementConnectRight,
    [A.LINK_PLACEHOLDER_SOURCE_TRIGGER]: onLinkPlaceholderSourceTrigger,
    [A.LINK_PLACEHOLDER_TARGET_TRIGGER]: onLinkPlaceholderTargetTrigger,
    [A.LINK_ADD_ELEMENT_BUTTON_TRIGGER]: onLinkAddElementButtonTrigger,
    [A.ZOOM_IN]: onZoomIn,
    [A.ZOOM_OUT]: onZoomOut,
    [A.ZOOM_RESET]: onZoomReset
};
const selectionModeNoneEnabledActions = [
    A.PAPER_PAN_DOWN,
    A.PAPER_PAN_LEFT,
    A.PAPER_PAN_RIGHT,
    A.PAPER_PAN_UP,
    A.ZOOM_IN,
    A.ZOOM_OUT,
    A.ZOOM_RESET
];

export default class KeyboardController extends Controller {

    #usingKeyboard = false;

    startListening() {
        const {
            graph,
            keyboard,
            selectionMode,
            map = {
                'esc': A.DESELECT,
                'shift+up shift+right': A.CYCLE_UP,
                'shift+down shift+left': A.CYCLE_DOWN,
                'shift+F10': A.CELL_MENU_SHOW,
                'up': A.SELECTION_MOVE_UP,
                'down': A.SELECTION_MOVE_DOWN,
                'left': A.SELECTION_MOVE_LEFT,
                'right': A.SELECTION_MOVE_RIGHT,
                'w': A.PAPER_PAN_UP,
                's': A.PAPER_PAN_DOWN,
                'a': A.PAPER_PAN_LEFT,
                'd': A.PAPER_PAN_RIGHT,
                'i': [A.ELEMENT_CONNECT_TOP_TRIGGER, A.LINK_ADD_ELEMENT_BUTTON_TRIGGER],
                'k': [A.ELEMENT_CONNECT_BOTTOM_TRIGGER, A.LINK_ADD_ELEMENT_BUTTON_TRIGGER],
                'j': [A.ELEMENT_CONNECT_LEFT_TRIGGER, A.LINK_PLACEHOLDER_SOURCE_TRIGGER],
                'l': [A.ELEMENT_CONNECT_RIGHT_TRIGGER, A.LINK_PLACEHOLDER_TARGET_TRIGGER],
                'delete backspace': A.CELL_REMOVE,
                'shift+c': A.CYCLING_MODE_CHANGE,
                'ctrl+plus meta+plus': A.ZOOM_IN,
                'ctrl+minus meta+minus': A.ZOOM_OUT,
                'ctrl+0 meta+0': A.ZOOM_RESET,

                // disabled for now:
                // 'ctrl+c meta+c': onCopy,
                // 'ctrl+x meta+x': onCut,
                // 'ctrl+v meta+v': onPaste,
            }
        } = this.context;

        this.context.cellCache = [];
        this.context.keyboardController = this;

        this.stopListening();
        this.listenTo(graph, {
            'readonly': onReadOnlyChange,
            'add remove reset': onGraphChange,
            'change:source change:target': onLinkChange
        });

        let finShortcuts = {};
        for (let prop in map) {
            if (Object.hasOwn(map, prop)) {
                let action = map[prop];
                if (Array.isArray(action)) {
                    // Allow only existing actions and if 'none' selection mode is set, filter out the unsuitable actions
                    const actions = action.filter(a => {
                        if (selectionMode === 'none' && !selectionModeNoneEnabledActions.includes(a)) {
                            return false;
                        }
                        return functionMap[a];
                    });
                    const len = actions.length;
                    if (len === 1) {
                        finShortcuts[prop] = functionMap[actions[0]];
                    }
                    else if (len > 1) {
                        finShortcuts[prop] = (ctx, e) => {
                            actions.forEach(action => functionMap[action].call(this, ctx, e));
                        };
                    }
                }
                // Allow only existing actions and if 'none' selection mode is set, filter out the unsuitable actions
                else if (functionMap[action]) {
                    if (selectionMode === 'none' && !selectionModeNoneEnabledActions.includes(action)) {
                        continue;
                    }
                    finShortcuts[prop] = functionMap[action];
                }
            }
        }
        // Merge some 'required' ones but only if multiselection is enabled
        if (selectionMode === 'multi') {
            Object.assign(finShortcuts, {
                'keydown:shift': onShiftDown,
                'keyup:shift': onShiftUp,
            });
        }

        this.listenTo(keyboard, finShortcuts);

        this.useMouse = this.useMouse.bind(this);
    }

    setUsingKeyboard(bool) {
        if (this.#usingKeyboard !== bool) {
            this.#usingKeyboard = bool;
            this.trigger('change:usage', this, bool);
            if (bool) {
                document.addEventListener('mousemove', this.useMouse);
            }
        }
    }

    useMouse() {
        this.setUsingKeyboard(false);
        document.removeEventListener('mousemove', this.useMouse);
    }

    destroy() {
        super.destroy();
        document.removeEventListener('mousemove', this.useMouse);
    }
}

/* Graph */
function onReadOnlyChange(ctx, readOnly) {
    ctx.readOnly = readOnly;
}

function onGraphChange(ctx) {
    buildCellCache(ctx);
    reindex(ctx);
}

function onLinkChange(ctx, model) {
    const { paper } = ctx;
    const view = model.findView(paper);
    const action = view._dragData?.action;

    if (action !== 'arrowhead-move') {
        reindex(ctx);
    }
}

/* Keyboard */
function processKeyboardAction(ctx, fn, e) {
    const { keyboardController } = ctx;
    // find the action name (DiagramBuilderKeyboardAction)
    const action = Object.entries(functionMap).find(([, value]) => value === fn)[0];
    const processObj = { process: true };
    keyboardController.trigger(BEFORE_ACTION, keyboardController, action, e, processObj);

    return processObj.process !== false;
}

function onDeselect(ctx, e) {
    const { keyboardController } = ctx;

    if (!processKeyboardAction(ctx, onDeselect, e)) {
        return;
    }

    keyboardController.setUsingKeyboard(true);
    deselect(ctx.selection);
}

function onSelectionMoveUp(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveUp, e) && moveSelection(ctx, 'up', e);
}

function onSelectionMoveDown(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveDown, e) && moveSelection(ctx, 'down', e);
}

function onSelectionMoveLeft(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveLeft, e) && moveSelection(ctx, 'left', e);
}

function onSelectionMoveRight(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveRight, e) && moveSelection(ctx, 'right', e);
}

function moveSelection(ctx, dir, e) {
    const {
        selection,
        paper,
        paperScroller,
        keyboardController,
        readOnly
    } = ctx;
    const { collection } = selection;
    const modelCount = collection.length;
    const step = paper.options.gridSize || 1;
    let dx = 0, dy = 0;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    if (readOnly) {
        return;
    }

    switch (dir) {
        case 'up':
            dy = -step;
            break;
        case 'down':
            dy = step;
            break;
        case 'left':
            dx = -step;
            break;
        case 'right':
            dx = step;
            break;
    }
    if (modelCount) {
        const { models } = collection;
        // Allow only when every cell allows it... however, for links this is more complicated
        // as they would be moved around even by e.g. translating source/target elements. For
        // now we will just check for read-only.
        const stop = models.some(model => model.isReadOnly());

        if (!stop) {
            const paperScale = paper.scale();
            // Dispatching the event with keyboard: true to be able to distinguish between
            // position changes caused by mouse / keyboard.
            selection.translateSelectedElements(dx, dy, { keyboard: true });
            // Translate the `selection-wrapper`.
            const wrapper = selection.$selectionWrapper[0];
            let { left = 0, top = 0 } = wrapper.style;
            left = parseFloat(left);
            top = parseFloat(top);
            wrapper.style.left = `${left + dx * paperScale.sx}px`;
            wrapper.style.top = `${top + dy * paperScale.sy}px`;

            // Always keep some selected element visible in the viewport when scrolling with keys:
            // 1 el
            if (modelCount === 1 && !paperScroller.isElementVisible(models[0], { strict: false })) {
                diaActions.scrollIntoView(paperScroller, models[0], { animation: false, center: false });
            }
            // multiple els
            else {
                // Get the union of unscaled selected model-bboxes.
                const selectionBBox = g.Rect.fromRectUnion(...models.reduce((all, cell) => {
                    all.push(cell.getBBox());
                    return all;
                }, []));
                const visibleArea = paperScroller.getVisibleArea();
                const selectionInViewport = !!visibleArea.intersect(selectionBBox);

                if (!selectionInViewport) {
                    const visibleAreaCenter = visibleArea.center();
                    let elsTouchingSelectionEdge;
                    const { y: sy, x: sx, width: sWidth, height: sHeight } = selectionBBox;
                    switch (dir) {
                        case 'up':
                            elsTouchingSelectionEdge = models.filter(model => {
                                const { y, height } = model.getBBox();
                                return y + height === sy + sHeight;
                            });
                            break;
                        case 'down':
                            elsTouchingSelectionEdge = models.filter(model => {
                                const { y } = model.getBBox();
                                return y === sy;
                            });
                            break;
                        case 'left':
                            elsTouchingSelectionEdge = models.filter(model => {
                                const { x, width } = model.getBBox();
                                return x + width === sx + sWidth;
                            });
                            break;
                        case 'right':
                            elsTouchingSelectionEdge = models.filter(model => {
                                const { x } = model.getBBox();
                                return x === sx;
                            });
                            break;
                    }
                    // this should always happen because at least 1 element must be touching the edge...
                    if (elsTouchingSelectionEdge.length) {
                        // scroll in the closest cell to the visible area's center
                        const scrollToEl = elsTouchingSelectionEdge.reduce((prev, curr) => {
                            const currDistance = visibleAreaCenter.distance(curr.getBBox().center());
                            const prevDistance = visibleAreaCenter.distance(prev.getBBox().center());
                            return currDistance < prevDistance ? curr : prev;
                        }, elsTouchingSelectionEdge[0]);

                        diaActions.scrollIntoView(paperScroller, scrollToEl, { animation: false, center: false });
                    }
                }
            }
        }
    }
}

function onPanUp(ctx, e) {
    processKeyboardAction(ctx, onPanUp, e) && pan(ctx, 'up', e);
}

function onPanDown(ctx, e) {
    processKeyboardAction(ctx, onPanDown, e) && pan(ctx, 'down', e);
}

function onPanLeft(ctx, e) {
    processKeyboardAction(ctx, onPanLeft, e) && pan(ctx, 'left', e);
}

function onPanRight(ctx, e) {
    processKeyboardAction(ctx, onPanRight, e) && pan(ctx, 'right', e);
}

function pan(ctx, dir, e) {
    const { paper, paperScroller, keyboardController } = ctx;
    const step = paper.options.gridSize || 1;
    const currentCenter = paperScroller.getVisibleArea().center();
    let dx = 0, dy = 0;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    switch (dir) {
        case 'up':
            dy = -step;
            break;
        case 'down':
            dy = step;
            break;
        case 'left':
            dx = -step;
            break;
        case 'right':
            dx = step;
            break;
    }
    const newCenter = currentCenter.translate(dx, dy);
    // A paperscroller issue: it should receive a point that should be scaled but not translated...
    // ... and NOT a local point as the docs state.
    const scale = paperScroller.zoom();
    paperScroller.scroll(newCenter.x * scale, newCenter.y * scale);
}

function onCyclingModeChange(ctx, e) {
    const KC = KeyboardController;
    const modes = [KC.CYCLE_CELLS, KC.CYCLE_ELEMENTS, KC.CYCLE_LINKS];
    const currMode = ctx.cyclingMode || KC.CYCLE_CELLS;
    const currIndex = modes.indexOf(currMode);
    let index = currIndex + 1;

    if (!processKeyboardAction(ctx, onCyclingModeChange, e)) {
        return;
    }

    ctx.keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    if (index >= modes.length) {
        index = 0;
    }
    ctx.cyclingMode = modes[index];
    buildCellCache(ctx);
    reindex(ctx);
}

function buildCellCache(ctx) {
    const {
        graph,
        cyclingMode = KeyboardController.CYCLE_CELLS
    } = ctx;
    let fnName;

    switch (cyclingMode) {
        case KeyboardController.CYCLE_ELEMENTS:
            fnName = 'getElements';
            break;
        case KeyboardController.CYCLE_LINKS:
            fnName = 'getLinks';
            break;
        default:
            fnName = 'getCells';
    }
    // we need to filter out the unselectable cells
    const filtered = graph[fnName]().filter(cell => cell.isSelectable());
    ctx.cellCache = filtered.sort((a, b) => {
        return a.prop(KEYBOARD_INDEX_KEY) - b.prop(KEYBOARD_INDEX_KEY);
    });
}

function reindex(ctx) {
    const { graph, cyclingMode: mode } = ctx;
    let index = 0;
    // Find nodes which have incoming links. These are top level and we will trickle down.
    const topLevelElements = graph.getElements().filter(el => {
        const outgoing = graph.getConnectedLinks(el, { inbound: true });
        return !outgoing.length;
    });

    topLevelElements.forEach((topEl) => {
        graph.bfs(topEl, (el/*, level */) => {
            if (mode !== KeyboardController.CYCLE_LINKS) {
                el.prop(KEYBOARD_INDEX_KEY, index);
                index += 1;
            }
            else {
                el.unset(KEYBOARD_INDEX_KEY, { silent: true });
            }
            const links = graph.getConnectedLinks(el, { outbound: true });
            links.forEach(link => {
                if (mode !== KeyboardController.CYCLE_ELEMENTS) {
                    link.prop(KEYBOARD_INDEX_KEY, index);
                    index += 1;
                }
                else {
                    link.unset(KEYBOARD_INDEX_KEY, { silent: true });
                }
            });
        });
    });
}

function onCycleUp(ctx, e) {
    const { cellCache } = ctx;

    if (cellCache.length > 0) {
        processKeyboardAction(ctx, onCycleUp, e) && cycle(ctx, 'up', e);
    }
}

function onCycleDown(ctx, e) {
    const { cellCache } = ctx;

    if (cellCache.length > 0) {
        processKeyboardAction(ctx, onCycleDown, e) && cycle(ctx, 'down', e);
    }
}

function cycle(ctx, dir = 'up', e) {
    const {
        selection,
        paperScroller,
        cellCache: cells,
        keyboardController
    } = ctx;
    const { collection } = selection;
    let cell;
    let startingCell;
    let index = 0;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    if (collection.length) {
        startingCell = collection.reduce((prev, curr) => {
            return prev.prop(KEYBOARD_INDEX_KEY) < curr.prop(KEYBOARD_INDEX_KEY) ? curr : prev;
        }, collection.at(0));

        index = cells.indexOf(startingCell) + (dir === 'up' ? 1 : -1);
        index = index >= cells.length ? 0 : (index < 0 ? index = cells.length - 1 : index);

        // If the highest index is selected while the lowest index(es) is(are) selected:
        // (will 'break' on cell == undefined)
        while (collection.has(cell = cells[index])) {
            index += 1;
        }
    }

    if (!cell) {
        cell = dir === 'up' ? cells[0] : cells[cells.length - 1];
    }

    select(selection, cell);
    diaActions.scrollIntoView(paperScroller, cell);
}

function onElementConnectTop(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, 'top', onElementConnectTop, e);
}

function onElementConnectBottom(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, 'bottom', onElementConnectBottom, e);
}

function onElementConnectLeft(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, 'left', onElementConnectLeft, e);
}

function onElementConnectRight(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, 'right', onElementConnectRight, e);
}

function triggerElementConnect(ctx, which, caller, e) {
    const { selection, paper, keyboardController } = ctx;
    const { collection } = selection;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    const model = collection.at(0);
    const view = model.findView(paper);
    const connectTool = toolActions.getToolBy(view, (view, tool) => {
        return tool instanceof Connect && tool.options.position === which;
    });
    if (connectTool && processKeyboardAction(ctx, caller, e)) {
        paper.requireView(model);
        const { position, x, y } = connectTool.options;
        view.notify('element:connectbutton:keyboardtrigger', connectTool, position, { x, y }, e);
    }
}

function onLinkPlaceholderSourceTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, 'source', onLinkPlaceholderSourceTrigger, e);
}

function onLinkPlaceholderTargetTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, 'target', onLinkPlaceholderTargetTrigger, e);
}

function onLinkAddElementButtonTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, 'addelementbutton', onLinkAddElementButtonTrigger, e);
}

function triggerLinkAdd(ctx, which, caller, e) {
    const { paper, selection, keyboardController } = ctx;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    const model = selection.collection.at(0);
    // we can assume that if the correct tool is displayed, source/target modification is allowed
    const Ctor = which === 'source' ? SourcePlaceholder : (which === 'target' ? TargetPlaceholder : AddElementButton);
    const view = model.findView(paper);
    const tool = toolActions.getToolBy(view, (view, tool) => {
        return tool instanceof Ctor;
    });
    if (tool && processKeyboardAction(ctx, caller, e)) {
        paper.requireView(model);
        if (which === 'source' || which === 'target') {
            view.notify('link:placeholder:keyboardtrigger', tool, tool.ratio, tool.getLinkPoint(), e);
        }
        else { // addelement
            view.notify('link:addelement:keyboardtrigger', tool, tool.getLinkPoint(), e);
        }
    }
}

function onRemove(ctx, e) {
    const { graph, selection, keyboardController } = ctx;
    const models = selection.collection.toArray();

    if (!processKeyboardAction(ctx, onRemove, e)) {
        return;
    }

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    if (!models.length) {
        return;
    }

    // selection is link
    if (models[0].isLink()) {
        if (diaActions.canRemoveLinks(models)) {
            diaActions.removeCells(graph, models);
        }
    }
    // selection is element(s) only:
    else if (diaActions.canRemoveElements(models)) {
        diaActions.removeCells(graph, models);
    }
}

// function onCopy(ctx, e) {
//     const { graph, selection, clipboard } = ctx;
//     clipboard.copyElements(selection.collection, graph);
// }

// function onCut(ctx, e) {
//     const { graph, selection, clipboard } = ctx;
//     clipboard.cutElements(selection.collection, graph);
// }

// function onPaste(ctx, e) {
//     const { graph, selection, clipboard } = ctx;
//     const pasted = clipboard.pasteCells(graph);
// }

function onShiftDown(ctx) {
    const { paperScroller } = ctx;
    paperScroller.setCursor('crosshair');
}

function onShiftUp(ctx) {
    const { paperScroller } = ctx;
    paperScroller.setCursor('grab');
}

function onZoomIn(ctx, e) {
    const { paperScroller, maxZoom } = ctx;
    e.preventDefault();
    paperScroller.zoom(0.1, { max: maxZoom, grid: 0.1 });
}

function onZoomOut(ctx, e) {
    const { paperScroller, minZoom } = ctx;
    e.preventDefault();
    paperScroller.zoom(-0.1, { min: minZoom, grid: 0.1 });
}

function onZoomReset(ctx, e) {
    const { paperScroller } = ctx;
    e.preventDefault();
    paperScroller.zoom(1, { absolute: true });
}

function onMenu(ctx, e) {
    const { selection, paper, keyboardController } = ctx;
    const { collection } = selection;

    keyboardController.setUsingKeyboard(true);

    e.preventDefault();

    if (!processKeyboardAction(ctx, onMenu, e)) {
        return;
    }

    if (collection.length === 1) {
        const model = collection.at(0);
        if (!model.hasMenu()) {
            return;
        }
        const view = model.findView(paper);
        const tool = toolActions.getToolBy(view, (view, tool) => {
            return tool instanceof Menu;
        });
        if (tool) {
            paper.requireView(model);
            view.notify('cell:menubutton:keyboardtrigger', tool, e);
        }
    }
}

function selectionIsLink({ selection }) {
    const { collection } = selection;
    return collection.length === 1 && collection.at(0).isLink();
}

function selectionIsElement({ selection }) {
    const { collection } = selection;
    return collection.length === 1 && collection.at(0).isElement();
}

staticConsts(KeyboardController, {
    CYCLE_LINKS: 'cycleLinks',
    CYCLE_ELEMENTS: 'cycleElements',
    CYCLE_CELLS: 'cycleCells'
});