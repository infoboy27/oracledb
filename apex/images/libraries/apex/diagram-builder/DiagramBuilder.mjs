/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * The main class of the Diagram Builder widget. It instantiantes the models, the views and
 * their controllers and renders the views into the config-provided HTML element(s).
 * 
 * Markup requirements:
 * The main element (config.el) must wrap all the other elements: the paper (mandatory), stencil (optional),
 * navigator (optional). If it doesn't wrap them, the widget creates new elements for these components
 * inside of the main element. It will not throw an error. The only error it throws is when the main element
 * can't be found. E.g.:
 * 
 * Valid markup (config - el: "#app", navigatorEl: ".my-navigator"):
 * <div id="app">
 *     <div class="paper"></div>
 *     <div class="stencil"></div>
 *     <div class="my-navigator"></div>
 * </div>
 * 
 * Invalid markup - new elements for the paper and navigator will be created (config - el: "#app",
 * navigatorEl: ".my-navigator"):
 * <div id="app">
 *     <div class="stencil"></div>
 * </div>
 * <div class="paper"></div> <!-- OUTSIDE OF THE MAIN ELEMENT! -->
 * <div class="my-navigator"></div> <!-- OUTSIDE OF THE MAIN ELEMENT! -->
 * 
 * Invalid markup - new element for the navigator will be created as the config "navigatorEl" is not
 * passed and the default value (.navigator) doesn't apply (config - el: "#app"):
 * <div id="app">
 *     <div class="paper"></div>
 *     <div class="stencil"></div>
 *     <div class="my-navigator"></div> <!-- CONFIG navigatorEl NOT PASSED! DEFAULT VALUE DOESN'T APPLY -->
 * </div>
 */

import ViewController from './controllers/ViewController.mjs';
import SelectionController from './controllers/SelectionController.mjs';
import KeyboardController from './controllers/KeyboardController.mjs';

import Element from './cells/elements/Element.mjs';
import Circle from './cells/elements/CircleElement.mjs';
import CircleView from './cells/elements/CircleElementView.mjs';
import Rect from './cells/elements/RectElement.mjs';
import RectView from './cells/elements/RectElementView.mjs';
import Diamond from './cells/elements/DiamondElement.mjs';
import DiamondView from './cells/elements/DiamondElementView.mjs';
import Terminator from './cells/elements/TerminatorElement.mjs';
import TerminatorView from './cells/elements/TerminatorElementView.mjs';
import Unconfigured from './cells/elements/UnconfiguredElement.mjs';
import UnconfiguredView from './cells/elements/UnconfiguredElementView.mjs';
import CircleSmall from './cells/elements/CircleElementSmall.mjs';
import DiamondSmall from './cells/elements/DiamondElementSmall.mjs';
import RectSmall from './cells/elements/RectElementSmall.mjs';
import SingleLink from './cells/links/SingleLink.mjs';
import SingleLinkView from './cells/links/SingleLinkView.mjs';

import * as commonUtils from './utils/common.mjs';
import * as graphUtils from './utils/graph.mjs';
import * as highlightActions from './actions/highlight.mjs';
import * as diaActions from './actions/dia.mjs';
import * as uiActions from './actions/ui.mjs';
import CellSelection from './Selection.mjs';
import DiagramBuilderEvent from './DiagramBuilderEvent.mjs';
import { select as selectCells, deselect as deselectCells } from './actions/selection.mjs';
import PaperScroller from './PaperScroller.mjs';
import Graph from './Graph.mjs';
import { createConnectionPoint } from './utils/connectionPoint.mjs';
import { defineCustomRouters, getRouterConfig } from './utils/router.mjs';
import DiagramBuilderRouter from './DiagramBuilderRouter.mjs';
import Link from './cells/links/Link.mjs';
import Paper from './Paper.mjs';
import Stencil from './Stencil.mjs';
import { staticConsts } from './utils/helpers.mjs';
import DiagramBuilderKeyboardAction from './DiagramBuilderKeyboardAction.mjs';
import DiagramBuilderSelectionMode from './DiagramBuilderSelectionMode.mjs';
import DiagramBuilderLocale from './DiagramBuilderLocale.mjs';
import { isSafari } from './utils/browser.mjs';
import DiagramBuilderUtil from './DiagramBuilderUtil.mjs';
import { unique } from './utils/array.mjs';

const { dia, ui, shapes, connectionStrategies, g, util, mvc } = joint;

export default class DiagramBuilder {

    #viewController;
    #selectionController;
    #keyboardController;
    #graph;
    #paper;
    #paperScroller;
    #selection;
    #snaplines;
    #stencil;
    #clipboard;
    #keyboard;
    #navigator;
    #elementMap;
    #elementFilters = [];
    #suspendedEvents = [];
    #navigatorVisible;
    // eslint-disable-next-line no-unused-private-class-members
    #focused = false;
    #highlightedRoute = [];
    #routeHighlightsSave;

    #el;
    #paperEl;
    #stencilEl;
    #navigatorEl;

    #linkDesignations;
    #config = {
        rtl: document.dir?.toLowerCase() === 'rtl',
        el: null,
        paperEl: '.paper',
        stencilEl: '.stencil',
        navigatorEl: '.navigator',
        elements: [],
        stencilElements: [],
        selectionMode: DiagramBuilderSelectionMode.MULTI,
        linkDesignations: [],
        routeHighlights: [],
        requireLinkSourceElement: false,
        requireLinkTargetElement: false,
        readOnly: false,
        renderStencil: true,
        onElementRemoveKeepOutboundLinks: false,
        onElementRemoveKeepInboundLinks: false,
        dropConnectOnLinks: true,
        allowDropConnectOnLink: () => { },
        dropConnectOnElements: true,
        allowDropConnectOnElement: () => { },
        allowDropConnectOnPlaceholder: () => { },
        paperWidth: 2000,
        paperHeight: 2000,
        showNavigator: true,
        navigatorWidth: 192,
        navigatorHeight: 128,
        // initialZoom != 0 sets the zoom level only once - on the startup.
        // initialZoom == 0 zooms out (if necessary) after every load to
        // try to fit the route or the diagram (if no route) in the viewport.
        // However, it never zooms in!
        initialZoom: 1,
        minZoom: .5,
        maxZoom: 2,
        defaultRouter: DiagramBuilderRouter.NORMAL,
        keyboardNavigation: true,
        keyboardNavigationMap: undefined, // defaults created in the controller
        drawGrid: false,

        style: {
            elementCls: [],
            linkCls: [],
            linkLabelCls: [],
            linkDesignationCls: [],
            paperCls: [],
            stencilCls: [],
            navigatorCls: [],
            focusCls: ['is-focused'],
            hoverCls: ['is-hovered'],
            toastForegroundContainerCls: [],
            legacyCls: ['joint-apex-legacy-offset'] // used on the app dom el when a used SVG property is not supported
        },

        locale: {
            [DiagramBuilderLocale.STR_ZOOM_LEVEL]: 'Zoom level {0}%'
        }
    };

    // The list of properties that can be set on the element-types (note: not instances!) of
    // the 'elements' config and are subsequently stored in element-instance's attributes.
    // These are not custom properties (which we don't care about because they are not tied-in
    // to functionality) but properties which we use in our code.
    // Set to their default values:
    get #ELEMENT_TYPES_OPTIONAL_ATTRIBUTES() {
        return Object.freeze({
            allowLinkIn: true,
            allowLinkOut: true,
            hasMenu: true,
            cls: [],
            onRemoveKeepInboundLinks: this.#config.onElementRemoveKeepInboundLinks,
            onRemoveKeepOutboundLinks: this.#config.onElementRemoveKeepOutboundLinks
        });
    }

    constructor(cfg) {
        // For event dispatching
        util.assign(this, mvc.Events);

        util.assign(shapes, {
            apex: {
                Circle,
                CircleView,
                Rect,
                RectView,
                Diamond,
                DiamondView,
                Terminator,
                TerminatorView,
                Unconfigured,
                UnconfiguredView,

                // The views of the small ones are not important (as they have no members)
                CircleSmall,
                DiamondSmall,
                RectSmall,

                SingleLink,
                SingleLinkView
            }
        });

        this.#linkDesignations = cfg.linkDesignations || [];

        const _cfg = util.merge(this.#config, cfg); // i.e. _cfg === this.#config

        this.#validateConfig();

        this.#initEls(_cfg.el);
        this.#initGraph();
        this.#initPaper();
        this.#initRouters();
        this.#initSelection();
        this.#initKeyboard();
        this.#initSnaplines();
        this.#initTooltips();
        this.#registerElementMap(_cfg.elements);
        this.#initStencil();
        this.#initNavigator();
        this.#initControllers(_cfg);
        this.#startEventDispatching();
    }

    #validateConfig() {
        const cfg = this.#config;
        // initialZoom 0 means it will zoom out to fit after load
        if (cfg.initialZoom !== 0) {
            // make sure the initial zoom is between min and max
            cfg.initialZoom = Math.min(cfg.maxZoom, Math.max(cfg.initialZoom, cfg.minZoom)) || 1;
        }
    }

    #initControllers(cfg) {
        this.#viewController = new ViewController({
            el: this.#el,
            graph: this.#graph,
            paper: this.#paper,
            paperScroller: this.#paperScroller,
            stencil: this.#stencil,
            keyboard: this.#keyboard,
            selection: this.#selection,
            navigator: this.#navigator,
            snaplines: this.#snaplines,
            navigatorVisible: cfg.showNavigator,
            linkDesignations: this.#linkDesignations,
            dropConnectOnLinks: cfg.dropConnectOnLinks,
            allowDropConnectOnLink: cfg.allowDropConnectOnLink,
            dropConnectOnElements: cfg.dropConnectOnElements,
            allowDropConnectOnElement: cfg.allowDropConnectOnElement,
            allowDropConnectOnPlaceholder: cfg.allowDropConnectOnPlaceholder,
            readOnly: cfg.readOnly,
            style: cfg.style,
            locale: cfg.locale,
            elementProps: {
                onRemoveKeepOutboundLinks: !!cfg.onElementRemoveKeepOutboundLinks,
                onRemoveKeepInboundLinks: !!cfg.onElementRemoveKeepInboundLinks
            }
            // as we have only 1 link type, there is no need to have linkProps
        });
        this.#viewController.startListening();
        if (cfg.selectionMode === DiagramBuilderSelectionMode.MULTI || cfg.selectionMode === DiagramBuilderSelectionMode.SINGLE) {
            this.#selectionController = new SelectionController({
                graph: this.#graph,
                paper: this.#paper,
                paperScroller: this.#paperScroller,
                selection: this.#selection,
                multiSelectionHandles: [], // currently unused, leaving as placeholder for possible cfg.multiSelectionHandles
                keyboard: this.#keyboard,
                clipboard: this.#clipboard,
                mode: cfg.selectionMode,
                readOnly: cfg.readOnly
            });
            this.#selectionController.startListening();
        }
        if (cfg.keyboardNavigation) {
            this.#keyboardController = new KeyboardController({
                graph: this.#graph,
                paper: this.#paper,
                selection: this.#selection,
                keyboard: this.#keyboard,
                clipboard: this.#clipboard,
                paperScroller: this.#paperScroller,
                selectionMode: cfg.selectionMode,
                readOnly: cfg.readOnly,
                map: cfg.keyboardNavigationMap,
                minZoom: cfg.minZoom,
                maxZoom: cfg.maxZoom
            });
            this.#keyboardController.startListening();
            this.listenTo(this.#keyboardController, {
                'change:usage': this.#keyboardUsageChange
            });
        }
    }

    #definePattern(imageUrl) {
        return this.#paper.definePattern({
            attrs: {
                width: 60,
                height: 500
            },
            markup: [{
                tagName: 'image',
                attributes: {
                    'xlink:href': imageUrl,
                    preserveAspectRatio: 'xMinYMin slice'
                }
            }]
        });
    }

    #startEventDispatching() {
        const E = DiagramBuilderEvent;
        this.listenTo(this.#graph, {
            'add': (cell) => {
                this.#dispatch(cell.isElement() ? E.ELEMENT_ADD : E.LINK_ADD, cell);
            },
            'remove': (cell, _, { silent = false }) => {
                if (!silent) {
                    this.#dispatch(cell.isElement() ? E.ELEMENT_REMOVE : E.LINK_REMOVE, cell);
                }
            },
            'change:position': (element, position, opt = {}) => {
                const { keyboard = false } = opt;
                this.#dispatch(E.ELEMENT_POSITION_CHANGE, element, position, keyboard);
            },
            'change:source': (link, source) => {
                this.#dispatch(E.LINK_SOURCE_CHANGE, link, source);
            },
            'change:target': (link, source) => {
                this.#dispatch(E.LINK_TARGET_CHANGE, link, source);
            },
            'change:vertices': (link, vertices) => {
                this.#dispatch(E.LINK_VERTICES_CHANGE, link, vertices);
            },
            // Note: remove:vertex fires only when the vertex was removed by the user (or using removeVertex call)
            // and not when simplifying the route with removeRedundantLinearVertices (opt.redundancyRemoval on Vertices
            // and Segment tool).
            'remove:vertex': (link, vertex, index) => {
                this.#dispatch(E.LINK_VERTEX_REMOVE, link, vertex, index);
            },
            'change:labels': (link, labels, info) => {
                if ('designation' in link.changed) {
                    this.#dispatch(E.LINK_DESIGNATION_CHANGE, link, link.changed.designation);
                }
                else {
                    const hasDesignation = !!(link.designation());
                    if (hasDesignation) {
                        // filter designation label out
                        // NOTE: first element (=designation label) unused!
                        [, ...labels] = labels;
                    }

                    if (labels.length) { // will fire even when label is changed
                        const {
                            propertyPath,
                            propertyValue,
                            propertyPathArray,
                            rewrite = false
                        } = info;
                        const keys = Object.keys(propertyValue);
                        const index = propertyPathArray[1] - (hasDesignation ? 1 : 0);

                        // text has changed:
                        if (propertyPath.includes(Link.getLabelTextPath())) {
                            this.#dispatch(E.LINK_LABEL_CHANGE, link, labels, labels[index], 'text', propertyValue);
                        }
                        // position has changed:
                        else if (keys.length === 1 && keys[0] === 'position') {
                            this.#dispatch(E.LINK_LABEL_CHANGE, link, labels, labels[index], 'position', propertyValue.position);
                        }
                        // created or recreated label:
                        else {
                            this.#dispatch(E.LINK_LABEL_ADD, link, labels, labels[index], rewrite);
                        }
                    }
                    else {
                        this.#dispatch(E.LINK_LABEL_REMOVE, link, labels);
                    }
                }
            },
            'change:z': (cell, z) => {
                this.#dispatch(E.CELL_Z_INDEX_CHANGE, cell, z);
            }
        });

        this.listenTo(this.#paper, {
            'cell:pointerdown': (view, e, x, y) => {
                const { model } = view;
                this.#dispatch(model.isElement() ? E.ELEMENT_POINTERDOWN : E.LINK_POINTERDOWN, view, { x, y }, e);
            },
            'cell:pointerup': (view, e, x, y) => {
                const { model } = view;
                this.#dispatch(model.isElement() ? E.ELEMENT_POINTERUP : E.LINK_POINTERUP, view, { x, y }, e);
            },
            'cell:menubutton:pointerdown': function(view, tool, e) {
                const evName = E[view.model.isElement() ? 'ELEMENT_MENUBUTTON_POINTERDOWN' : 'LINK_MENUBUTTON_POINTERDOWN'];
                this.#dispatch(evName, view, tool, e);
            },
            'cell:menubutton:keyboardtrigger': function(view, tool, e) {
                const evName = E[view.model.isElement() ? 'ELEMENT_MENUBUTTON_KEYBOARDTRIGGER' : 'LINK_MENUBUTTON_KEYBOARDTRIGGER'];
                this.#dispatch(evName, view, tool, e);
            },
            'element:connectbutton:pointerup': function(view, tool, position, coords, e) {
                this.#dispatch(E.ELEMENT_CONNECTBUTTON_POINTERUP, view, tool, position, coords, e);
            },
            'element:connectbutton:keyboardtrigger': function(view, tool, position, coords, e) {
                this.#dispatch(E.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER, view, tool, position, coords, e);
            },
            'link:mouseenter': (view, e) => {
                const point = this.clientToLocalPoint(e.clientX, e.clientY);
                this.#dispatch(E.LINK_MOUSEENTER, view, point, e);
            },
            'link:mouseleave': (view, e) => {
                const point = this.clientToLocalPoint(e.clientX, e.clientY);
                this.#dispatch(E.LINK_MOUSELEAVE, view, point, e);
            },
            'link:addelement:pointerdown': function(view, tool, point, e) {
                this.#dispatch(E.LINK_ADDELEMENTBUTTON_POINTERDOWN, view, tool, point, e);
            },
            'link:addelement:pointerup': function(view, tool, point, e) {
                this.#dispatch(E.LINK_ADDELEMENTBUTTON_POINTERUP, view, tool, point, e);
            },
            'link:addelement:keyboardtrigger': function(view, tool, point, e) {
                this.#dispatch(E.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER, view, tool, point, e);
            },
            'link:placeholder:pointerdown': (view, tool, ratio, point, e) => {
                point = { ...this.toGridSize(point) };
                if (ratio === 0) {
                    this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
                }
                else if (ratio === 1) {
                    this.#dispatch(E.LINK_TARGET_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
                }
                this.#dispatch(E.LINK_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
            },
            'link:placeholder:pointerup': (view, tool, ratio, point, e) => {
                point = { ...this.toGridSize(point) };
                if (ratio === 0) {
                    this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
                }
                else if (ratio === 1) {
                    this.#dispatch(E.LINK_TARGET_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
                }
                this.#dispatch(E.LINK_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
            },
            'link:placeholder:keyboardtrigger': (view, tool, ratio, point, e) => {
                point = { ...this.toGridSize(point) };
                if (ratio === 0) {
                    this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
                }
                else if (ratio === 1) {
                    this.#dispatch(E.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
                }
                this.#dispatch(E.LINK_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
            },
            'link:anchor:pointerup': (view, tool, end, anchor, e) => {
                const evName = E[end === 'source' ? 'LINK_SOURCE_ANCHOR_POINTERUP' : 'LINK_TARGET_ANCHOR_POINTERUP'];
                this.#dispatch(evName, view, tool, anchor, e);
            },
            'link:vertexhandle:pointerup': (view, tool, handle, vertexNewCoords, vertexOldCoords, e) => {
                this.#dispatch(E.LINK_VERTEXHANDLE_POINTERUP, view, tool, handle, vertexNewCoords, vertexOldCoords, e);
            },
            'link:segmenthandle:pointerup': (view, tool, handle, newChangedValues, oldChangedValues, e) => {
                this.#dispatch(E.LINK_SEGMENTHANDLE_POINTERUP, view, tool, handle, newChangedValues, oldChangedValues, e);
            },
            'blank:pointerdown': (e, x, y) => {
                this.#dispatch(E.BLANK_POINTERDOWN, { x, y }, e);

            },
            'blank:pointerup': (e, x, y) => {
                this.#dispatch(E.BLANK_POINTERUP, { x, y }, e);
            },
            'blank:contextmenu': (e, x, y) => {
                this.#dispatch(E.BLANK_CONTEXT_MENU, { x, y }, e);
            }
        });

        this.listenTo(this.#selection, {
            'change': (selection, det) => {
                this.#dispatch(DiagramBuilderEvent.SELECTION_CHANGE, selection.collection.models, det);
            }
        });

        this.listenTo(this.#stencil, {
            'element:beforedrop': (draggedView, endModel, e, x, y, droppedOverView, droppedOverTool) => {
                this.#dispatch(E.ELEMENT_BEFORE_DROP, draggedView, endModel, { x, y }, droppedOverView, droppedOverTool, e);
            },
            'element:drop': (view, e, x, y) => {
                this.#dispatch(E.ELEMENT_DROP, view, { x, y }, e);
            }
        });
        if (this.#keyboardController) {
            this.listenTo(this.#keyboardController, {
                'beforeaction': (keyboardController, action, e, processObj) => {
                    this.#dispatch(E.BEFORE_KEYBOARD_ACTION, action, e, processObj);
                }
            });
        }
    }

    #keyboardUsageChange(controller, usingKeyboard) {
        this.#viewController.useKeyboard(usingKeyboard);
    }

    #dispatch(evName, ...rest) {
        if (!evName || typeof evName != 'string') {
            throw new Error('Event name must be specified.');
        }
        if (!this.isEventSuspended(evName)) {
            this.trigger(evName, ...rest);
        }
    }

    #initEls(el) {
        const cfg = this.#config;
        const { paperCls, stencilCls, navigatorCls, legacyCls } = cfg.style;
        this.#el = typeof el == 'string' ? document.querySelector(el) : el;
        if (!this.#el) {
            throw new Error('Diagram Builder: Render-to HTML element not found. Fix it by setting the "el" config to an existing element or its selector.');
        }
        if (!this.#el.getAttribute('tabindex')) {
            this.#el.setAttribute('tabindex', 0);
        }
        if (legacyCls?.length && isSafari()) {
            this.#el.classList.add(...(Array.isArray(legacyCls) ? legacyCls : legacyCls.split(' ')));
        }

        // paper
        let paperEl = typeof cfg.paperEl == 'string' ? this.#el.querySelector(cfg.paperEl) : cfg.paperEl;
        if (!paperEl) {
            paperEl = document.createElement('div');
            this.#el.appendChild(paperEl);
        }
        if (paperCls?.length) {
            paperEl.classList.add(...(Array.isArray(paperCls) ? paperCls : paperCls.split(' ')));
        }
        this.#paperEl = paperEl;

        // stencil
        const { renderStencil } = cfg;
        if (renderStencil) {
            let stencilEl = typeof cfg.stencilEl == 'string' ? this.#el.querySelector(cfg.stencilEl) : cfg.stencilEl;
            if (!stencilEl) {
                stencilEl = document.createElement('div');
                this.#el.appendChild(stencilEl);
            }
            if (stencilCls?.length) {
                stencilEl.classList.add(...(Array.isArray(stencilCls) ? stencilCls : stencilCls.split(' ')));
            }
            this.#stencilEl = stencilEl;
        }

        // navigator
        let navEl = typeof cfg.navigatorEl == 'string' ? this.#el.querySelector(cfg.navigatorEl) : cfg.navigatorEl;
        if (!navEl) {
            navEl = document.createElement('div');
            this.#el.appendChild(navEl);
        }
        if (navigatorCls?.length) {
            navEl.classList.add(...(Array.isArray(navigatorCls) ? navigatorCls : navigatorCls.split(' ')));
        }
        this.#navigatorEl = navEl;

        // capture phase is necessary
        this.#el.addEventListener('mousedown', this.#setFocused, true);
        this.#el.addEventListener('touchstart', this.#setFocused, true);
        this.onFocus = this.onFocus.bind(this);
        this.onBlur = this.onBlur.bind(this);
        this.#el.addEventListener('focus', this.onFocus);
        this.#el.addEventListener('blur', this.onBlur);
    }

    #setFocused() {
        // NOTE: this = e.currentTarget = app dom el
        this.focus();
    }

    #initGraph() {
        this.#graph = new Graph({}, { cellNamespace: shapes });
    }

    #initPaper() {
        const {
            drawGrid,
            initialZoom,
            paperWidth,
            paperHeight,
            requireLinkSourceElement,
            requireLinkTargetElement,
            style,
            defaultRouter
        } = this.#config;
        const paper = new Paper({
            async: true,
            gridSize: 10,
            drawGrid: drawGrid ? {
                name: 'mesh',
                args: {
                    color: drawGrid === true ? 'var(--a-diagram-grid-color, #eee)' : drawGrid
                }
            } : false,
            width: paperWidth,
            height: paperHeight,
            sorting: Paper.sorting.APPROX, // NOTE: Do NOT use EXACT, it bugs out with async paper
            linkPinning: true,
            model: this.#graph,
            cellViewNamespace: shapes,
            connectionStrategy: function(end, view, magnet, coords, linkModel, endString, paper, side) {
                if (side) {
                    const distanceFromPoint = 10;
                    let dx = 0, dy = 0;
                    switch (side) {
                        case 'top':
                            dy = distanceFromPoint;
                            break;
                        case 'bottom':
                            dy = -distanceFromPoint;
                            break;
                        case 'right':
                            dx = -distanceFromPoint;
                            break;
                        case 'left':
                            dx = distanceFromPoint;
                    }
                    end.anchor = {
                        name: side,
                        args: {
                            dx,
                            dy
                        }
                    };
                }
                else {
                    connectionStrategies.pinRelative(end, view, magnet, coords);
                }
            },
            defaultLink: new SingleLink({
                requireSourceElement: !!requireLinkSourceElement,
                requireTargetElement: !!requireLinkTargetElement,
                cls: style.linkCls,
                labelCls: style.linkLabelCls
            }),
            defaultRouter: getRouterConfig(defaultRouter),
            defaultConnector: {
                name: 'rounded'
            },
            defaultConnectionPoint: createConnectionPoint(),
            defaultLinkAnchor: {
                name: 'connectionClosest'
            },
            snapLabels: true,
            interactive: (view) => {
                const { model } = view;
                const cellReadOnly = model.isReadOnly();
                const ro = this.isReadOnly() || cellReadOnly;
                const options = {
                    elementMove: !ro,
                    linkMove: false,
                    labelMove: !ro,
                };
                return options;
            },

            // Fires after arrowhead movements
            allowLink: (linkView, paper, dragData) => {
                const { model } = linkView;
                // If validateConnection returns false, the target will be a point and not a cell that's hovered.
                // We need to check whether there is a cell at that point, if there is, it is not a valid connection
                // and we need to revert it to its original position (source/target)
                const end = model[dragData.arrowhead]();
                if (commonUtils.isPoint(end)) {
                    const { x, y } = this.#paper.localToClientPoint(end.x, end.y);
                    const el = document.elementFromPoint(x, y);
                    const viewUnderPointer = this.#paper.findView(el);
                    // for links we need to run through the #canLink as we may allow releasing the mouse button
                    // over a link (but not to connect to a link)
                    if (viewUnderPointer && viewUnderPointer instanceof dia.ElementView) {
                        return false;
                    }
                }
                return this.#canLink(model.getSourceCell(), model.getTargetCell(), linkView);
            },

            validateConnection: (cellViewS, magnetS, cellViewT, magnetT, end, linkView) => {
                return this.#canLink(cellViewS?.model, cellViewT?.model, linkView);
            }
        });

        this.#paper = paper;

        const paperScroller = new PaperScroller({
            paper,
            scrollWhileDragging: true,
            cursor: 'grab',
            padding: 30,
            autoResizePaper: true,
            allowNewOrigin: 'any',
            baseWidth: 500,
            baseHeight: 500,
            contentOptions: () => {
                const graphBBox = this.#graph.getBBox(); // can be null if no cells!

                if (this.isReadOnly()) {
                    return {
                        contentArea: graphBBox || new g.Rect(0, 0, 300, 200),
                        allowNewOrigin: 'any',
                        allowNegativeBottomRight: true,
                        padding: 30,
                        gridWidth: 0,
                        gridHeight: 0
                    };
                }
                // else:
                const minArea = new g.Rect(0, 0, this.#config.paperWidth, this.#config.paperHeight);
                // inflate so the tools are never outside of the viewport
                graphBBox?.inflate(30);
                const contentArea = minArea.union(graphBBox);
                return {
                    contentArea
                };
            }
        });
        this.#paperEl.appendChild(paperScroller.el);
        paperScroller.render();

        if (initialZoom !== 1 && initialZoom !== 0) {
            paperScroller.zoom(initialZoom, { absolute: true });
        }

        this.#paperScroller = paperScroller;

        this.#centerContent();
    }

    #centerContent() {
        if (this.#graph.getCells().length) {
            this.#paperScroller.centerContent({ useModelGeometry: true });
        }
        else {
            this.#paperScroller.center();
        }
    }

    #canLink(sourceModel, targetModel, linkView) {
        const linkModel = linkView.model;
        const requireSource = linkModel.get('requireSourceElement');
        const requireTarget = linkModel.get('requireTargetElement');
        // When sourceModel or targetModel is not set, we're linking to a Point and the below
        // would eval to 'undefined' (i.e. falsy). We need to allow that thus the comparison with bool.
        const allowSourceLinkOut = sourceModel?.allow(Element.ALLOW_LINK_OUT) !== false;
        const allowTargetLinkIn = targetModel?.allow(Element.ALLOW_LINK_IN) !== false;
        const cfg = this.#config;
        const readOnly = cfg.readOnly || (sourceModel && sourceModel.isReadOnly()) || (targetModel && targetModel.isReadOnly());
        const { allowConnection } = cfg;

        // readonly app or a connection between read-only cell(s)
        if (readOnly) {
            return false;
        }

        // no source el when required
        if (requireSource && !(sourceModel instanceof dia.Element)) {
            return false;
        }

        // no target el when required
        if (requireTarget && !(targetModel instanceof dia.Element)) {
            return false;
        }

        // source doesn't allow link-out or target doesn't allow link-in
        if (!allowSourceLinkOut || !allowTargetLinkIn) {
            return false;
        }

        // link to link
        if (sourceModel instanceof dia.Link || targetModel instanceof dia.Link) {
            return false;
        }
        // config validation
        if (typeof allowConnection == 'function') {
            return allowConnection(sourceModel, targetModel, linkView) !== false;
        }

        return true;
    }

    #initRouters() {
        defineCustomRouters();
    }

    #initSelection() {
        this.#clipboard = new ui.Clipboard();
        this.#selection = new CellSelection({
            useModelGeometry: true,
            translateConnectedLinks: ui.Selection.ConnectedLinksTranslation.SUBGRAPH,
            boxContent: false,
            paper: this.#paper,
            allowCellInteraction: true,
            filter: cell => {
                return !cell.isSelectable();
            }
        });

    }

    #initKeyboard() {
        this.#keyboard = new ui.Keyboard({
            filter: (e) => {
                const { target } = e;
                return this.#el.contains(target);
            }
        });
    }

    #initTooltips() {
        new ui.Tooltip({
            rootTarget: document.body,
            target: '[data-tooltip]',
            padding: 15,
            animation: {
                delay: '1s'
            }
        });
    }

    #initStencil() {
        const { renderStencil: render, rtl } = this.#config;
        let elementIds = this.#config.stencilElements;
        const gap = 5;
        const itemWidth = 30;
        const itemHeight = 30;
        const items = [];
        if (rtl) {
            elementIds = [...elementIds].reverse();
        }
        elementIds.forEach((id) => {
            const mEl = this.#elementMap.find(el => {
                return el.typeId === id;
            });
            if (mEl) {
                const el = mEl.stencilElement.clone();
                el.resize(30, 30);
                items.push(el);
            }
        });
        const itemCount = items.length;
        const stencilWidth = itemWidth * itemCount + gap * (itemCount - 1) + 2 * gap;
        const stencilHeight = itemHeight + 2 * gap;
        const stencil = new Stencil({
            graph: this.#graph,
            paper: this.#paperScroller,
            width: stencilWidth,
            height: stencilHeight,
            dropAnimation: true,
            layout: {
                columnWidth: itemWidth,
                columns: itemCount,
                rowHeight: itemHeight,
                resizeToFit: true,
                columnGap: gap,
                marginX: gap,
                marginY: gap
            },
            snaplines: this.#snaplines,
            canDrag: () => {
                return !this.#config.readOnly;
            },
            dragStartClone: el => {
                const typeId = el.prop('typeId');
                const item = this.#elementMap.find(el => el.typeId === typeId);
                return item.element.clone();
            },
            paperOptions: {
                background: { color: '#eee' }
            }
        });

        this.#stencil = stencil;

        // We always need to render the stencil because otherwise we can't use
        // external drag & drop... as it relies on it.
        const stencilV = stencil.render();
        if (render) {
            this.#stencilEl.style.width = `${stencilWidth}px`;
            this.#stencilEl.style.height = `${stencilHeight}px`;
            if (this.#config.readOnly) {
                this.#hideStencil();
            }
            this.#stencilEl.appendChild(stencilV.el);
            stencil.load(items);
        }
    }

    #hideStencil() {
        if (this.#stencilEl) {
            this.#stencilEl.style.visibility = 'hidden';
        }
    }

    #showStencil() {
        if (this.#stencilEl) {
            this.#stencilEl.style.visibility = 'visible';
        }
    }

    #initSnaplines() {
        this.#snaplines = new ui.Snaplines({
            paper: this.#paper,
            usePaperGrid: true,
            // Setting distance to 5 pixel because the default is 10 -> meaning that a 70px el would show
            // a "center-snap" to a 60px element which obviously wouldn't be aligned because of a 10px grid size.
            // Setting it to small number, e.g. to 1 will cause difficult alignment as the drag element will need
            // to be very close (1px) to the point.
            distance: 5
        });
    }

    #initNavigator() {
        const nav = new ui.Navigator({
            paperScroller: this.#paperScroller,
            width: this.#config.navigatorWidth,
            height: this.#config.navigatorHeight,
            zoom: false, // needs to be set explicitly to false
            padding: 0,
            paperOptions: {
                async: true,
                cellViewNamespace: shapes,
                sorting: Paper.sorting.APPROX,
                background: {
                    color: '#fff'
                },
                defaultRouter: getRouterConfig(this.#config.defaultRouter),
                defaultConnector: {
                    name: 'rounded'
                },
                defaultConnectionPoint: createConnectionPoint()
            }
        });

        this.#navigator = nav;

        this.#navigatorEl.appendChild(nav.el);
        nav.render();

        if (this.#config.showNavigator) {
            this.#setNavigatorVisibility(true);
        }
        else {
            this.#setNavigatorVisibility(false);
        }
    }

    #registerElementMap(elements) {
        let elementCls = this.#config.style.elementCls || []; // if it is empty string, return an empty array
        elementCls = Array.isArray(elementCls) ? elementCls : elementCls.split(' ');

        const map = elements.map(cfg => {
            const {
                type,
                typeId,
                tooltip,
                stencilTooltip,
                glyph = '',
                glyphColor,
                decorationPattern,
            } = cfg;
            let { cls = '' } = cfg;
            const optionalAttrs = util.merge({}, this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES);
            const ns = type.split('.');
            const elementConfig = {
                filters: this.#elementFilters,
                rtl: this.#config.rtl
            };
            const stencilElementConfig = {};

            // TODO: add for the stencil shapes as well - not urgent, we are not using stencil
            cls = cls || [];
            elementConfig.cls = [...elementCls, ...(Array.isArray(cls) ? cls : cls.split(' '))];

            const element = new (ns.reduce((o, i) => o[i], shapes))(elementConfig);
            element.prop('typeId', typeId);
            // creating a copy, if there is no 'small'/stencil version, we will use the original ns
            const nsStencil = [...ns];
            nsStencil[nsStencil.length - 1] = `${nsStencil[nsStencil.length - 1]}Small`;

            // get the stencil-element constructor based on whether there is or there isn't a small version
            let Ctor = nsStencil.reduce((o, i) => o[i], shapes);
            if (!Ctor) {
                Ctor = ns.reduce((o, i) => o[i], shapes);
            }
            const stencilElement = new Ctor(stencilElementConfig);
            stencilElement.prop('typeId', typeId);

            // TODO: add for the stencil shapes as well - not urgent, we are not using stencil
            if (decorationPattern) {
                const patternId = this.#definePattern(decorationPattern);
                element.prop('decorationPattern', decorationPattern);
                element.decorationPattern(`url(#${patternId})`);
            }

            if (tooltip) {
                if (typeof element == 'string') {
                    element.attr('root', {
                        dataTooltip: tooltip,
                        dataTooltipPosition: 'top'
                    });
                }
                else {
                    element.attr('root', {
                        dataTooltip: tooltip.text || '',
                        dataTooltipPosition: tooltip.position || 'top'
                    });
                }
            }

            if (stencilTooltip) {
                if (typeof stencilTooltip == 'string') {
                    stencilElement.attr('root', {
                        dataTooltip: stencilTooltip,
                        dataTooltipPosition: 'top'
                    });
                }
                else {
                    stencilElement.attr('root', {
                        dataTooltip: stencilTooltip.text || '',
                        dataTooltipPosition: stencilTooltip.position || 'top'
                    });
                }
            }

            element.glyph(glyph);
            stencilElement.glyph(glyph);

            if (glyphColor) {
                element.glyphColor(glyphColor);
                stencilElement.glyphColor(glyphColor);
            }

            // At the very end, add the optional
            Object.entries(optionalAttrs).forEach(([key, value]) => {
                // if it is already set on the element, we must have set it above
                if (element.prop(key) !== undefined) {
                    return;
                }
                // otherwise use the one set on the cfg or use the default
                element.prop(key, key in cfg ? cfg[key] : value);
            });

            return {
                typeId,
                element,
                stencilElement,
                cfg
            };
        });

        this.#elementMap = map;
    }

    #createElement(typeId, cfg = {}) {
        const {
            text = '',
            x = 0,
            y = 0,
            ...rest
        } = cfg;

        const item = this.#elementMap.find(el => el.typeId === typeId);
        if (item) {
            const newEl = item.element.clone();
            newEl.text(text);
            for (let prop in rest) {
                if (Object.hasOwn(rest, prop)) {
                    newEl.prop(prop, rest[prop]);
                }
            }
            newEl.position(x, y);
            return newEl;
        }
    }

    get graph() {
        return this.#graph;
    }

    get paper() {
        return this.#paper;
    }

    get paperScroller() {
        return this.#paperScroller;
    }

    get selection() {
        return this.#selection;
    }

    get stencil() {
        return this.#stencil;
    }

    get snaplines() {
        return this.#snaplines;
    }

    get navigator() {
        return this.#navigator;
    }

    onFocus() {
        let cls = this.#config.style.focusCls;
        this.#focused = true;
        if (cls?.length) {
            this.#el.classList.add(...(Array.isArray(cls) ? cls : cls.split(' ')));
        }
    }

    onBlur() {
        let cls = this.#config.style.focusCls;
        this.#focused = false;
        if (cls?.length) {
            this.#el.classList.remove(...(Array.isArray(cls) ? cls : cls.split(' ')));
        }
    }

    getShapes() {
        return shapes;
    }

    getVisibleArea() {
        return this.#paperScroller.getVisibleArea();
    }

    getVisibleAreaCenter() {
        const {
            x,
            y,
            width,
            height
        } = this.#paperScroller.getVisibleArea();
        const centerX = x + width / 2;
        const centerY = y + height / 2;
        return { x: centerX, y: centerY };
    }

    isElementVisible(el, strict = false) {
        el = this.#getElement(el);
        return this.#paperScroller.isElementVisible(el, { strict });
    }

    toGridSize(n) {
        const gridSize = this.#paper.options.gridSize || 1;
        if (arguments.length === 2) {
            return g.Point(arguments[0], arguments[1]).snapToGrid(gridSize);
        }
        if (commonUtils.isPoint(n)) {
            return g.Point(n.x, n.y).snapToGrid(gridSize);
        }
        return g.snapToGrid(n, gridSize);
    }

    attachElementToLink(el, link, opt = {}) {
        const paper = this.#paper;
        el = this.#getElement(el);
        link = this.#getLink(link);

        if (!el || !link) {
            return;
        }

        const linkView = link.findView(paper);
        const { point } = opt;
        let { ratio } = opt;

        if (point) {
            this.requireView(linkView);
            ratio = linkView.getClosestPointRatio(point);
        }
        diaActions.addElementToLinkAtRatio(el.findView(paper), linkView, ratio);
    }

    addElement(typeId, opt = {}) {
        if (this.isReadOnly()) {
            return;
        }
        let {
            async = false,
            verticalAlign = 'top',
            horizontalAlign = 'left',
            x,
            y,
            highlight = false,
            addToLink = null,
            ...rest
        } = opt;
        const graph = this.#graph;
        const el = this.#createElement(typeId, { x, y, ...rest });
        const { x: centerX, y: centerY } = this.getVisibleAreaCenter();

        if (!el) {
            return;
        }

        const { width, height } = el.size();

        if (addToLink) {
            graph.addCell(el, { async });
            this.attachElementToLink(el, addToLink.link, {
                point: addToLink.point,
                ratio: addToLink.ratio
            });
        }
        else {
            // we expect both to be provided, otherwise we will just set both
            if (x == null || y == null) {
                ({ x, y } = this.toGridSize(centerX - width / 2, centerY - height / 2));
            }
            else {
                switch (horizontalAlign) {
                    case 'center':
                        x = x - width / 2;
                        break;
                    case 'right':
                        x = x - width;
                        break;
                }
                switch (verticalAlign) {
                    case 'center':
                        y = y - height / 2;
                        break;
                    case 'bottom':
                        y = y - height;
                        break;
                }
                ({ x, y } = this.toGridSize(x, y));
            }
            // if there is an element at this x, y, move the new element a bit
            ({ x, y } = graphUtils.getFreePosition(graph, { x, y }, this.#paper.options.gridSize));

            el.position(x, y);
            graph.addCell(el, { async });
        }
        if (highlight) {
            this.highlight(el, { duration: 2000 });
        }
        return el;
    }

    removeElement(element, opt = {}) {
        const { force = false } = opt; // force - remove without checking read-only, etc. rules of the cell
        const el = this.#getElement(element);
        if (el && !this.isReadOnly() && (force || diaActions.canRemoveElements(el))) {
            el.remove();
        }
    }

    changeElementType(element, newType) {
        const model = this.#getElement(element);
        if (model && !this.isReadOnly() && !model.isReadOnly() && model.allow(Element.ALLOW_TYPE_CHANGE)) {
            const text = model.text();
            const { x, y } = model.position();
            // copy all the custom properties from the old element to the new one
            const filterOut = [
                'attrs',
                'decorationPattern',
                'id',
                'position',
                'size',
                'type',
                'typeId',
                ...Object.keys(this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES)
            ];
            const extraProps = {};
            Object.entries(model.attributes).forEach(([key, value]) => {
                if (!filterOut.includes(key)) {
                    extraProps[key] = value;
                }
            });

            // create the new element and place it at the same position
            const newEl = this.#createElement(newType, { text, x, y, ...extraProps });
            this.#freeze();
            diaActions.changeElementInPlace(this.#graph, model, newEl);
            this.#unfreeze();
        }
    }

    #freeze() {
        this.#paper.freeze();
        if (this.#navigatorVisible) {
            this.#navigator.targetPaper.freeze();
        }
    }

    #unfreeze() {
        this.#paper.unfreeze();
        if (this.#navigatorVisible) {
            this.#navigator.targetPaper.unfreeze();
        }
    }

    #getElement(element) {
        return graphUtils.getElement(this.#graph, element);
    }

    #getLink(link) {
        return graphUtils.getLink(this.#graph, link);
    }

    #getCell(cell) {
        return graphUtils.getCell(this.#graph, cell);
    }

    #setNavigatorVisibility(b) {
        this.#navigatorEl.style.display = b ? 'block' : 'none';
        this.#navigator[b ? 'unfreeze' : 'freeze']();
        this.#navigatorVisible = b;
        // we will trigger a custom event so the viewcontroller can react to it
        this.#navigator.trigger('visibility', b ? 'visible' : 'hidden');
    }

    #zoomOutToFit() {
        const { minZoom } = this.#config;
        this.#paperScroller.zoomToFit({
            minScale: minZoom,
            maxScale: 1,
            padding: 15
        });
    }

    #afterFromJSON(data) {
        const { initialZoom } = this.#config;
        const readOnly = this.isReadOnly();
        const hasRoute = readOnly && data && Object.hasOwn(data, 'route');
        const fit = initialZoom === 0;
        if (hasRoute) {
            this.highlightRoute(data.route, fit);
            // if the route is invalid, there won't be a higlighted route
            if (!this.#highlightedRoute) {
                fit && this.#zoomOutToFit();
                this.#centerContent();
            }
            // if there is a route but it shouldn't be scrolled to/zoomed onto, still center
            else if (!fit) {
                this.#centerContent();
            }
        }
        else {
            fit && this.#zoomOutToFit();
            this.#centerContent();
        }
    }

    addLink(source, target, opt = {}) {
        const {
            highlight = false,
            async = false,
            ...rest
        } = opt;
        if (this.#config.readOnly) {
            return;
        }
        const link = this.#paper.getDefaultLink();
        const sourceIsPoint = commonUtils.isPoint(source);
        const targetIsPoint = commonUtils.isPoint(target);
        const sourceEl = !sourceIsPoint && this.#getElement(source);
        const targetEl = !targetIsPoint && this.#getElement(target);
        const {
            requireLinkSourceElement = false,
            requireLinkTargetElement = false
        } = this.#config;

        for (let prop in rest) {
            if (Object.hasOwn(rest, prop)) {
                link.prop(prop, rest[prop]);
            }
        }

        if (
            (!sourceIsPoint && !sourceEl) ||
            (!targetIsPoint && !targetEl) ||
            (requireLinkSourceElement && sourceIsPoint) ||
            (requireLinkTargetElement && targetIsPoint)
        ) {
            return;
        }

        link.source(typeof source === 'string' ? sourceEl : source);
        link.target(typeof target === 'string' ? targetEl : target);
        this.#graph.addCell(link, { async });

        if (highlight) {
            this.highlight(link, { duration: 2000 });
        }

        return link;
    }

    removeLink(link, opt = {}) {
        const { force = false } = opt; // force - remove without checking read-only, etc. rules of the cell
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && (force || diaActions.canRemoveLinks(link))) {
            link.remove();
        }
    }

    setLinkDesignation(link, designation) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_DESGINATION_CHANGE)) {
            link.designation(designation);
        }
    }

    setLinkTarget(link, target) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_TARGET_CHANGE)) {
            const isPoint = commonUtils.isPoint(target);
            const element = this.#getElement(target);

            if (link && (isPoint || element)) {
                // we need to pass the param when not a string as it may contain the anchor
                link.target(typeof target === 'string' ? element : target);
            }
        }
    }

    getLinkTarget(link) {
        link = this.#getLink(link);
        return link?.target();
    }

    setLinkTargetAnchor(link, anchor) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly()) {
            const target = link.target();
            if (target) {
                const o = { ...target };
                o.anchor = anchor;
                link.target(o);
            }
        }
    }

    getLinkTargetAnchor(link) {
        link = this.#getLink(link);
        const target = link?.target();

        return target?.anchor || null;
    }

    setLinkSource(link, source) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly()) {
            const isPoint = commonUtils.isPoint(source);
            const element = this.#getElement(source);

            if (link && (isPoint || element)) {
                // we need to pass the param when not a string as it may contain the anchor
                link.source(typeof source === 'string' ? element : source);
            }
        }
    }

    getLinkSource(link) {
        link = this.#getLink(link);
        return link?.source();
    }

    setLinkSourceAnchor(link, anchor) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly()) {
            const source = link.source();
            if (source) {
                const o = { ...source };
                o.anchor = anchor;
                link.source(o);
            }
        }
    }

    getLinkSourceAnchor(link) {
        link = this.#getLink(link);
        const source = link?.source();

        return source?.anchor || null;
    }

    setLinkVertices(link, vertices = []) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly()) {
            link.vertices(vertices);
        }
    }

    getLinkVertices(link) {
        link = this.#getLink(link);
        return link?.vertices();
    }

    highlight(what, opt) {
        if (what instanceof dia.CellView) {
            return highlightActions.highlightView(what, opt);
        }
        else {
            return highlightActions.highlightModel(this.#paper, what, opt);
        }
    }

    unhighlight(what, highlightId) {
        if (what instanceof dia.CellView) {
            highlightActions.unhighlightView(what, highlightId);
        }
        else {
            highlightActions.unhighlightModel(this.#paper, what, highlightId);
        }
    }

    setLinkLabel(link, text, opt = {}) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_LABEL_CHANGE)) {
            // there is currently no reason to set the cls from outside, so we will
            // set only the linkLabelCls
            opt.cls = this.#config.style.linkLabelCls;
            diaActions.label(this.#graph, link, text, opt);
        }
    }

    removeLinkLabel(link) {
        link = this.#getLink(link);
        if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_LABEL_CHANGE)) {
            diaActions.removeLabel(this.#graph, link);
        }
    }

    elementAt(index) {
        return this.#graph.getElements()[index] || null;
    }

    linkAt(index) {
        return this.#graph.getLinks()[index] || null;
    }

    load(data = {}) {
        this.deselect();
        this.unhighlightRoute();

        const { cells: dataCells = [] } = data;
        const cells = [];

        dataCells.forEach(cell => {
            const { typeId } = cell;
            const cfg = {};
            // If it has typeId, it is an element
            if (typeId) {
                const def = this.#elementMap.find(def => def.typeId === typeId);
                const {
                    text = '',
                    statusIcon,
                    ...rest
                } = cell;
                if (def) {
                    const mapEl = def.element;
                    const pattern = mapEl.prop('decorationPattern');
                    let patternId;
                    if (pattern) {
                        patternId = this.#definePattern(pattern);
                    }
                    cfg.filters = this.#elementFilters;
                    cfg.rtl = this.#config.rtl;
                    cfg.type = mapEl.get('type');
                    // add optional
                    Object.keys(this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES).forEach(key => {
                        // if it is set on the loaded cell, use that prop, otherwise use the map-element
                        cfg[key] = (key in cell) ? cell[key] : mapEl.prop(key);
                    });
                    cfg.cls = [...mapEl.get('cls') || []];

                    cfg.attrs = {
                        label: {
                            text
                        },
                        glyph: {
                            text: mapEl.glyph()
                        },
                        statusIcon: {
                            text: statusIcon?.glyph || '',
                            ...(statusIcon?.color && { fill: cell.statusIcon.color })
                        },
                        ...(pattern && { decorationPattern: { fill: `url(#${patternId})` } })
                    };
                    Object.assign(cfg, rest);
                    cells.push(cfg);
                }
            }
            // No typeId means it must be a link
            else {
                const labels = [];
                const {
                    designation,
                    requireSourceElement = !!this.#config.requireLinkSourceElement,
                    requireTargetElement = !!this.#config.requireLinkTargetElement,
                    labels: cellLabels,
                    ...rest
                } = cell;
                let cls = this.#config.style.linkCls || [];
                let labelCls = this.#config.style.linkLabelCls || [];
                let desCls = this.#config.style.linkDesignationCls || [];

                cfg.type = 'apex.SingleLink';
                cfg.cls = cls;
                // If it is a special 'type' label
                if (designation) {
                    let desName = designation,
                        tooltip,
                        tooltipPosition;
                    if (typeof designation === 'object') {
                        ({ typeId: desName, tooltip, tooltipPosition } = designation);
                    }
                    // find the designation in the app's config
                    const d = this.#linkDesignations.find(cfg => cfg.typeId === desName);
                    // if we have a cfg, it is allowed
                    if (d) {
                        const designationCfg = Link.getLinkDesignationCfg({
                            distance: 30,
                            glyph: d.glyph,
                            designation: desName,
                            cls: desCls,
                            tooltip,
                            tooltipPosition
                        });
                        labels.push(designationCfg);
                        cfg.designation = designation;
                    }
                }
                if (cellLabels) {
                    cellLabels.forEach(label => {
                        const labelCfg = Link.getLabelCfg(label.text || '', {
                            ...(label.position && {
                                position: {
                                    distance: label.position.distance || .5,
                                    offset: label.position.offset || 0
                                }
                            }),
                            cls: labelCls
                        });
                        labels.push(labelCfg);
                    });
                }
                if (labels.length) {
                    cfg.labels = labels;
                }
                Object.assign(cfg, {
                    requireSourceElement,
                    requireTargetElement,
                    ...rest
                });
                cells.push(cfg);
            }
        });

        if (cells.length) {
            this.#graph.fromJSON({ cells });
            this.#afterFromJSON(data);
        }
        else {
            this.clear();

            // We need to manually trigger adjustPaper as it won't be called when there are
            // no cells previously - but only in read-only mode, in editable we want to keep
            // paper its default size.
            if (this.isReadOnly()) {
                this.paperScroller.adjustPaper();
            }

            requestAnimationFrame(() => {
                this.#centerContent();
            });
        }
    }

    clear(silent = false, center = true) {
        this.#graph.clear({ silent });
        center && this.#paperScroller.center();
    }

    setElementText(element, text) {
        const el = this.#getElement(element);
        if (el && !this.isReadOnly() && !el.isReadOnly() && el.allow(Element.ALLOW_TEXT_CHANGE)) {
            el.text(text);
        }
    }

    getElementText(element) {
        const el = this.#getElement(element);
        return el && el.text();
    }

    getElements() {
        return this.#graph.getElements();
    }

    getElementAt(index) {
        return this.#graph.getElements()[index] || null;
    }

    getElementById(id) {
        return graphUtils.getElementById(this.#graph, id);
    }

    getElementBy(prop, value) {
        return graphUtils.getElementBy(this.#graph, prop, value);
    }

    getElementIds() {
        return this.#graph.getElements().map(el => el.get('id'));
    }

    getLinks() {
        return this.#graph.getLinks();
    }

    getLinkAt(index) {
        return this.#graph.getLinks()[index] || null;
    }

    getLinkBy(prop, value) {
        return graphUtils.getLinkBy(this.#graph, prop, value);
    }

    getLinkById(id) {
        return graphUtils.getLinkById(this.#graph, id);
    }

    select(cells, { add = false, scrollTo = false } = {}) {
        cells = Array.isArray(cells) ? cells : [cells];
        cells = graphUtils.getCells(this.#graph, cells);
        if (cells.length) {
            selectCells(this.#selection, cells, {
                add,
                mode: this.#config.selectionMode,
            });
            if (scrollTo) {
                this.scrollIntoView(cells[0]);
            }
        }
    }

    deselect(cells) {
        if (cells) {
            cells = Array.isArray(cells) ? cells : [cells];
            cells = graphUtils.getCells(this.#graph, cells);
        }
        deselectCells(this.#selection, cells);
    }

    getSelection() {
        return [...this.#selection.collection.models];
    }

    requireView(cell) {
        cell = this.#getCell(cell);
        if (cell) {
            this.#paper.requireView(cell);
        }
    }

    zoom(amount, absolute = false) {
        if (!arguments.length) {
            return this.getZoom();
        }

        const cfg = this.#config;
        this.#paperScroller.zoom(amount, {
            absolute,
            min: cfg.minZoom,
            max: cfg.maxZoom
        });
    }

    getZoom() {
        return this.#paperScroller.zoom();
    }

    clientToLocalPoint(p) {
        const { x, y } = commonUtils.isPoint(p) ? p : { x: arguments[0], y: arguments[1] };
        return this.#paper.clientToLocalPoint(x, y);
    }

    setReadOnly(value) {
        value = !!value;
        const cfg = this.#config;

        if (cfg.readOnly === value) {
            return;
        }

        cfg.readOnly = value;

        this.deselect();

        // trigger custom event on the graph
        // the controllers listen to it
        this.graph.trigger('readonly', value);

        if (cfg.renderStencil) {
            if (value) {
                this.#hideStencil();
            }
            else {
                this.#showStencil();
            }
        }

        if (!value) {
            this.unhighlightRoute();
        }
    }

    getReadOnly() {
        return this.#config.readOnly;
    }

    isReadOnly() {
        return this.getReadOnly();
    }

    startDragging(typeId, e) {
        const el = this.#createElement(typeId);
        if (!this.isReadOnly()) {
            this.#stencil.startDragging(el, e);
        }
    }

    cancelDrag() {
        this.#stencil.cancelDrag();
    }

    hitTestElement(el, p) {
        el = this.#getElement(el);

        if (!el) {
            return;
        }

        const bbox = el.getBBox({ rotate: true });

        if (commonUtils.isPoint(p)) {
            return bbox.containsPoint(p);
        }
        else if (Array.isArray(p)) {
            return p.filter(p => bbox.containsPoint(p));
        }
        return false;
    }

    showNavigator() {
        this.#setNavigatorVisibility(true);
    }

    hideNavigator() {
        this.#setNavigatorVisibility(false);
    }

    isNavigatorShown() {
        return this.#navigatorVisible;
    }

    toFront(cells) {
        cells = Array.isArray(cells) ? cells : [cells];
        cells = cells.map(cell => this.#getCell(cell)).filter(cell => cell);
        if (cells.length) {
            this.#freeze();
            diaActions.toFront(cells);
            this.#unfreeze();
        }
    }

    toBack(cells) {
        cells = Array.isArray(cells) ? cells : [cells];
        cells = cells.map(cell => this.#getCell(cell)).filter(cell => cell);
        if (cells.length) {
            this.#freeze();
            diaActions.toBack(cells);
            this.#unfreeze();
        }
    }

    drawGrid(color) {
        this.#paper.setGrid({
            name: 'mesh',
            args: {
                color
            }
        });
        this.#paper.drawGrid();
    }

    setDefaultRouter(routerName, args = {}) {
        const paper = this.#paper;
        const navPaper = this.#navigator.targetPaper;
        // merge args so we always get the defaults if not set
        const routerCfg = getRouterConfig(routerName, args);
        paper.options.defaultRouter = navPaper.options.defaultRouter = {
            name: routerCfg.name,
            args: routerCfg.args
        };
        diaActions.updateAllConnections(paper);
        // We can update the navigator only when it is visible, otherwise the nodeCache may
        // cache wrong bbox sizes after render which will result in link anchors at (0, 0).
        if (this.#navigatorVisible) {
            diaActions.updateAllConnections(navPaper);
        }
    }

    getDefaultRouter() {
        return this.#paper.options.defaultRouter;
    }

    setLinkRouter(link, routerName, args = {}) {
        link = this.#getLink(link);

        if (link) {
            if (routerName) {
                const routerCfg = getRouterConfig(routerName, args);
                link.router({
                    name: routerCfg.name,
                    args: routerCfg.args
                });
            }
            else {
                link.unset('router');
            }
        }
    }

    getLinkRouter(link) {
        link = this.#getLink(link);
        if (link) {
            return link.router();
        }
    }

    scrollIntoView(cell, opt = {}) {
        diaActions.scrollIntoView(this.#paperScroller, cell, opt);
    }

    destroy() {
        this.#el.removeEventListener('mousedown', this.#setFocused);
        this.#el.removeEventListener('touchstart', this.#setFocused);
        this.#el.removeEventListener('focus', this.onFocus);
        this.#el.removeEventListener('blur', this.onBlur);

        // Mvc events are mixed in:
        this.stopListening();

        this.#viewController.destroy();
        // ... as no selection mode = no selection controller:
        if (this.#selectionController) {
            this.#selectionController.destroy();
        }
        this.#keyboardController.destroy();
    }

    getCellZIndex(cell) {
        return this.#getCell(cell)?.get('z');
    }

    setCellZIndex(cell, index) {
        this.#getCell(cell)?.set('z', index);
    }

    suspendEvents(eventNames) {
        eventNames = Array.isArray(eventNames) ? eventNames : [eventNames];
        const existingEvents = Object.values(DiagramBuilderEvent);
        eventNames.forEach(name => {
            if (existingEvents.includes(name) && !this.isEventSuspended(name)) {
                this.#suspendedEvents.push(name);
            }
        });
    }

    resumeEvents(eventNames) {
        eventNames = Array.isArray(eventNames) ? eventNames : [eventNames];
        this.#suspendedEvents = this.#suspendedEvents.filter(name => !eventNames.includes(name));
    }

    isEventSuspended(eventName) {
        return this.#suspendedEvents.includes(eventName);
    }

    focus() {
        this.#el.focus();
    }

    hasFocus() {
        return this.#el.contains(document.activeElement);
    }

    showToast(msg, duration = 3000, closeButton = false) {
        uiActions.showToast(msg, {
            foregroundContainerCls: this.#config.style.toastForegroundContainerCls,
            target: this.#el,
            duration,
            closeButton
        });
    }

    getElementConnectedLinks(el, opt = {}) {
        let {
            outbound,
            inbound
        } = opt;
        el = this.#getElement(el);

        if (el) {
            if (!outbound && !inbound) {
                outbound = true;
                inbound = true;
            }
            return this.#graph.getConnectedLinks(el, { outbound: !!outbound, inbound: !!inbound });
        }
    }

    getElementLoopedLinks(el) {
        el = this.#getElement(el);

        if (el) {
            return this.getElementConnectedLinks(el, { outbound: true }).filter(link => {
                const tc = link.getTargetCell();
                const sc = link.getSourceCell();
                return sc && tc === sc;
            });
        }
    }

    setElementsConfig(elements = []) {
        this.#registerElementMap(elements);
    }

    highlightRoute(route = [], scrollTo = true, opt = {}) {
        const paper = this.#paper;
        const graph = this.#graph;
        const paperScroller = this.#paperScroller;
        const cfg = this.#config;
        const cells = [];
        const { zoomAnimation = false } = opt;
        const navPaper = this.#navigator?.targetPaper;

        // we will allow route highlighting only in read-only as any change in the graph
        // would invalidate the route
        if (!cfg.readOnly) {
            return;
        }

        if (this.#highlightedRoute) {
            this.unhighlightRoute();
        }
        // simplify the the highlight config into { key1: { cfg }, key2: { cfg } } so we don't have to array.find in each
        // iteration
        const keyedRouteHighlightsCfgs = this.#config.routeHighlights.reduce((prev, curr) => {
            prev[curr.typeId] = curr;
            return prev;
        }, {});
        // the route can be either ids, or objects with id and highlightId or full config containing color,
        // and/or glyph and/or glyphColor
        const routeData = route.map(item => {
            const highlightTypeId = item.highlightTypeId;
            const highlightCfg = highlightTypeId ? keyedRouteHighlightsCfgs[highlightTypeId] : null;
            const cell = item instanceof dia.Cell ? item : this.#getCell(typeof item === 'string' ? item : item.cellId);

            cells.push(cell);

            const retObj = {
                cell,
                color: item.color ?? highlightCfg?.color ?? 'var(--a-diagram-route-default, #808080)',
                glyph: item.glyph ?? highlightCfg?.glyph,
                glyphColor: item.glyphColor ?? highlightCfg?.glyphColor,
                allowHighlightedOutboundLinks: highlightCfg?.allowHighlightedOutboundLinks ?? true
            };
            return retObj;
        }).filter(obj => obj.cell);

        if (routeData.length) {
            this.#highlightedRoute = routeData.map(obj => obj.cell);
            this.#routeHighlightsSave = [];

            const save = this.#routeHighlightsSave;

            // There is no need to keep the overwritten highlights (e.g. by multiple passes, cycles, etc.) so in reverse order -
            // as we need the latest - filter them out.
            // eslint-disable-next-line no-plusplus
            for (let i = routeData.length; i--;) {
                const stepObj = routeData[i];
                const { cell, color } = stepObj;
                // if we haven't added the cell yet:
                if (!save.find(item => item.cell === cell)) {
                    const toSave = {
                        cell,
                        color
                    };
                    if (cell.isElement()) {
                        const prevGlyph = cell.statusIcon();
                        const prevGlyphColor = prevGlyph ? cell.statusIconColor() : null;
                        const { glyph: newGlyph = '', glyphColor: newGlyphColor = '#000000' } = stepObj;

                        if (newGlyph !== cell.statusIcon()) {
                            toSave.prevGlyph = prevGlyph;
                            toSave.newGlyph = newGlyph;
                        }
                        if (newGlyphColor !== cell.statusIconColor()) {
                            toSave.prevGlyphColor = prevGlyphColor;
                            toSave.newGlyphColor = newGlyphColor;
                        }
                    }
                    save.push(toSave);
                }
            }
            save.reverse(); // unnecessary, but easier to comprehend if we reverse it to original order

            // Go through the highlights and apply them. Drop the unneccessary props (e.g. new glyphs) 
            // as they are not needed for unhighlighting.
            save.forEach(obj => {
                const { cell } = obj;
                if (cell.isElement()) {
                    const highlightCfg = {
                        padding: 0,
                        className: 'route-highlight',
                        attrs: {
                            'stroke': obj.color,
                            'stroke-width': 4
                        }
                    };
                    obj.highlightId = this.highlight(cell, highlightCfg);

                    // Highlights won't be shown in the navigator because they are paper-dependent.
                    // We need to target the view or call it with the correct paper:
                    if (navPaper) {
                        const cellViewInNavigator = navPaper.findViewByModel(cell);
                        const nhId = this.highlight(cellViewInNavigator, highlightCfg);
                        obj.navigatorHighlightId = nhId;
                    }
                    if ('newGlyph' in obj) {
                        cell.statusIcon(obj.newGlyph);
                        delete obj.newGlyph;
                    }
                    if ('newGlyphColor' in obj) {
                        cell.statusIconColor(obj.newGlyphColor);
                        delete obj.newGlyphColor;
                    }
                }
                else {
                    cell.findView(paper).addCls('route-link');
                    cell.route(true, obj.color);
                }

                delete obj.color;
            });

            // The route is highlighted at this point. If it is needed, we can remove the highlight of the outbound
            // link(s) of a particular element (type), e.g. of links of the nodes whose status is not 'completed'.
            // This comes from the highlight settings object, i.e. routeHighlights: { typeId, ... , allowHighlightedOutboundLinks: false}.
            // The default value is true - all outbound links are always highlighted.
            const highlightedLinkObjs = routeData.filter(obj => obj.cell.isLink());
            highlightedLinkObjs.forEach(obj => {
                const { cell } = obj;
                const sourceElement = cell.getSourceElement();
                const sourceElementHighlightCfg = routeData.find(obj => obj.cell === sourceElement);
                if (sourceElementHighlightCfg && sourceElementHighlightCfg.allowHighlightedOutboundLinks === false) {
                    cell.findView(paper).removeCls('route-link');
                    cell.route(false);
                    this.#routeHighlightsSave.splice(this.#routeHighlightsSave.findIndex(obj => obj.cell === cell), 1);
                }
            });

            // Scroll into the view - try to fit all the elements of the route initially. If not possible, drop them
            // one by one and center the ones that are closest (flow-wise) to the last node.
            if (scrollTo) {
                const { width: availableWidth, height: availableHeight } = paperScroller.getClientSize();
                const visibleArea = paperScroller.getVisibleArea();
                const uniqueEls = unique(this.#highlightedRoute.filter(cell => cell.isElement()));
                const uniqueElsCount = uniqueEls.length;
                let contentArea;
                let contentAreaAtMinZoom;

                while (uniqueEls.length) {
                    contentArea = graph.getCellsBBox(uniqueEls);
                    contentAreaAtMinZoom = new g.Rect(contentArea).scale(cfg.minZoom, cfg.minZoom);

                    // if it is all visible, don't do anything (let's ignore padding to prevent unnecessary movement)
                    if (visibleArea.containsRect(contentArea)) {
                        break;
                    }
                    // if it is not in the view or it currently doesn't fit but it fits at min zoom
                    else if (availableWidth >= contentAreaAtMinZoom.width && availableHeight >= contentAreaAtMinZoom.height) {
                        const minScale = cfg.minZoom;
                        // be completely zoomed out when we can't fit it all
                        const maxScale = uniqueEls.length === uniqueElsCount ? paperScroller.zoom() : cfg.minZoom;

                        // zoomToRect seems to be off, looks like it doesn't account for the scrollbars or something similar.
                        // We will inflate the content area a bit so it is not overlapping with the scrollbar.
                        contentArea.inflate(30);

                        paperScroller[zoomAnimation ? 'transitionToRect' : 'zoomToRect'](contentArea, {
                            minScale,
                            maxScale,
                            scaleGrid: .1
                        });
                        break;
                    }
                    // remove the first cell and try again
                    else {
                        uniqueEls.shift();
                    }
                }
            }
        }
    }

    unhighlightRoute() {
        const hl = this.#routeHighlightsSave;
        const paper = this.#paper;
        const navPaper = this.#navigator?.targetPaper;
        if (hl?.length) {
            hl.forEach(obj => {
                const { cell, highlightId, prevGlyph, prevGlyphColor, navigatorHighlightId } = obj;
                if (cell.isElement()) {
                    this.unhighlight(cell, highlightId);
                    if (cell.statusIcon() !== prevGlyph) {
                        cell.statusIcon(prevGlyph);
                    }
                    if (cell.statusIconColor() !== prevGlyphColor) {
                        cell.statusIconColor(prevGlyphColor);
                    }
                    if (navigatorHighlightId) {
                        const cellViewInNavigator = navPaper.findViewByModel(cell);
                        this.unhighlight(cellViewInNavigator, navigatorHighlightId);
                    }
                }
                else {
                    cell.findView(paper).removeCls('route-link');
                    cell.route(false);
                }
            });
        }
        this.#routeHighlightsSave = null;
        this.#highlightedRoute = [];
    }

    hasHighlightedRoute() {
        return !!this.#highlightedRoute.length;
    }

    getHighlightedRoute() {
        return this.#highlightedRoute;
    }
}

// Add consts for events, routers, keyboard actions...
staticConsts(DiagramBuilder, {
    Event: DiagramBuilderEvent,
    Router: DiagramBuilderRouter,
    KeyboardAction: DiagramBuilderKeyboardAction,
    SelectionMode: DiagramBuilderSelectionMode,
    Locale: DiagramBuilderLocale,
    Util: DiagramBuilderUtil
});