(() => {
  // images/libraries/apex/diagram-builder/controllers/Controller.mjs
  var { mvc } = joint;
  var Controller = class extends mvc.Listener {
    constructor(context, cfg) {
      super(context);
      this.context = context;
      this.config = cfg;
    }
    startListening() {
    }
    trigger(evName, ...rest) {
      mvc.Events.trigger.call(this, evName, ...rest);
    }
    on() {
      mvc.Events.on.call(this, ...arguments);
    }
    off() {
      mvc.Events.off.call(this, ...arguments);
    }
    destroy() {
      this.stopListening();
    }
  };
  var Controller_default = Controller;

  // images/libraries/apex/diagram-builder/actions/highlight.mjs
  var { highlighters } = joint;
  var HIGHLIGHT_ID_STR = "cell-highlight-{0}";
  var seq = 0;
  function highlightModel(paper, cell, opt = {}) {
    const view = getView(paper, cell);
    if (view) {
      return highlightView(view, opt);
    }
  }
  function unhighlightModel(paper, cell, highlightId) {
    const view = getView(paper, cell);
    if (view) {
      unhighlightView(view, highlightId);
    }
  }
  function highlightView(view, opt = {}) {
    const {
      duration = 0,
      ...rest
    } = opt;
    const highlightId = HIGHLIGHT_ID_STR.replace("{0}", seq);
    doHighlight(view, highlightId, rest);
    if (duration > 0) {
      ((highlightId2) => setTimeout(() => doUnhighlight(view, highlightId2), duration))(highlightId);
    }
    seq += 1;
    return highlightId;
  }
  function unhighlightView(view, highlightId) {
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
      layer = "back",
      padding = 5,
      className = "cell-highlight",
      attrs = {
        "stroke": "var(--a-diagram-cell-highlight, orange)",
        "stroke-width": 2
      },
      ...rest
    } = opt;
    highlighters.mask.add(view, { selector: "root" }, highlightId, {
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

  // images/libraries/apex/diagram-builder/DiagramBuilderRouter.mjs
  var DiagramBuilderRouter = {
    NORMAL: "normal",
    MANHATTAN: "manhattan",
    ORTHOGONAL: "orthogonal",
    RIGHT_ANGLE: "rightAngle",
    ADVANCED_MANHATTAN: "advancedManhattan",
    ADVANCED_RIGHT_ANGLE: "advancedRightAngle"
  };
  Object.freeze(DiagramBuilderRouter);
  var DiagramBuilderRouter_default = DiagramBuilderRouter;

  // images/libraries/apex/diagram-builder/utils/helpers.mjs
  function staticConst(obj, name, value) {
    return Object.defineProperty(obj, name, {
      configurable: false,
      // explicit
      writable: false,
      // explicit
      enumerable: true,
      value
    });
  }
  function staticConsts(obj, entries) {
    const props = {};
    Object.entries(entries).forEach(([key, value]) => {
      props[key] = {
        configurable: false,
        // explicit
        writable: false,
        // explicit
        enumerable: true,
        value
      };
    });
    return Object.defineProperties(obj, props);
  }

  // images/libraries/apex/diagram-builder/cells/elements/Element.mjs
  var { dia } = joint;
  var Element = class extends dia.Element {
    defaults() {
      return {
        ...super.defaults,
        type: "apex.Base"
      };
    }
    initialize(cfg) {
      super.initialize(...arguments);
      if (cfg?.rtl) {
        this.changeToRtl(this.attributes.attrs);
      }
    }
    changeToRtl() {
    }
    text() {
    }
    glyph(unicode = "") {
      if (arguments.length) {
        return this.attr("glyph/text", unicode);
      }
      return this.attr("glyph/text");
    }
    glyphColor(color = "#ffffff") {
      if (arguments.length) {
        return this.attr("glyph/fill", color);
      }
      return this.attr("glyph/fill");
    }
    isReadOnly() {
      return this.prop("readOnly") === true;
    }
    allow(what) {
      const prop = `allow${what.charAt(0).toUpperCase()}${what.slice(1)}`;
      return this.get(prop) !== false;
    }
    hasMenu() {
      return this.get("hasMenu") !== false;
    }
    isSelectable() {
      return this.get("selectable") !== false;
    }
    statusIcon(icon = "") {
      if (arguments.length) {
        icon = icon == null ? "" : icon;
        return this.attr("statusIcon/text", icon);
      }
      return this.attr("statusIcon/text");
    }
    statusIconColor(color = "#000000") {
      if (arguments.length) {
        return this.attr("statusIcon/fill", color);
      }
      return this.attr("statusIcon/fill");
    }
  };
  staticConsts(Element, {
    ALLOW_LINK_OUT: "linkOut",
    ALLOW_LINK_IN: "linkIn",
    ALLOW_REMOVE: "remove",
    ALLOW_TYPE_CHANGE: "typeChange",
    ALLOW_TEXT_CHANGE: "textChange",
    ALLOW_GLYPH_CHANGE: "glyphChange"
  });

  // images/libraries/apex/diagram-builder/cells/links/Link.mjs
  var { shapes } = joint;
  var Link = class extends shapes.standard.Link {
    static getLabelCfg(text = "", opt = {}) {
      const {
        position = {}
      } = opt;
      const {
        distance = 0.5,
        offset = 0
      } = position;
      let { cls = "" } = opt;
      if (cls) {
        cls = Array.isArray(cls) ? cls : cls.split(" ");
      }
      return {
        cls,
        markup: [{
          tagName: "rect",
          selector: "body"
        }, {
          tagName: "text",
          selector: "label"
        }],
        attrs: {
          label: {
            text,
            textWrap: {
              width: 150,
              height: 100,
              ellipsis: true
            },
            fill: "var(--a-diagram-label-text-color, #000)",
            fontFamily: "var(--a-diagram-label-font-family, sans-serif)",
            fontSize: "var(--a-diagram-label-font-size, 12px)",
            textAnchor: "middle",
            yAlignment: "middle",
            pointerEvents: "none"
          },
          body: {
            ref: "label",
            fill: "var(--a-diagram-label-background-color, #aaa)",
            width: "calc(w + 10)",
            height: "calc(h + 6)",
            x: "calc(w / -2 - 5)",
            y: "calc(h / -2 - 3)",
            rx: 5
          }
        },
        position: {
          distance,
          offset
        }
      };
    }
    static getLabelTextPath() {
      return "attrs/label/text";
    }
    static getLinkDesignationCfg(opt = {}) {
      const {
        glyph = "",
        distance = 0.5,
        designation,
        tooltip = "",
        tooltipPosition = "bottom"
      } = opt;
      let { cls = "" } = opt;
      if (cls) {
        cls = Array.isArray(cls) ? cls : cls.split(" ");
      }
      const cfgObj = {
        designation,
        cls,
        markup: [{
          tagName: "circle",
          selector: "body"
        }, {
          tagName: "text",
          selector: "label"
        }],
        attrs: {
          label: {
            text: glyph,
            fontFamily: "apex-5-icon-font",
            fontSize: "var(--a-diagram-link-icon-font-size, 14px)",
            textAnchor: "middle",
            yAlignment: "middle",
            pointerEvents: "none",
            fill: "var(--a-diagram-link-icon-text-color, #fff)"
          },
          body: {
            ref: "label",
            fill: "var(--a-diagram-link-icon-background-color, #666)",
            r: 13,
            cx: 0,
            cy: 0
          }
        },
        position: {
          distance
        }
      };
      if (tooltip) {
        cfgObj.attrs["."] = {
          "data-tooltip": tooltip,
          "data-tooltip-position": tooltipPosition
        };
      }
      return cfgObj;
    }
    isReadOnly() {
      return this.prop("readOnly") === true;
    }
    allow(what) {
      const prop = `allow${what.charAt(0).toUpperCase()}${what.slice(1)}`;
      return this.get(prop) !== false;
    }
    hasMenu() {
      return this.get("hasMenu") !== false;
    }
    isSelectable() {
      return this.get("selectable") !== false;
    }
    // Override to be able to dispatch an event
    removeVertex(idx, opt) {
      const vertices = this.vertices();
      idx = isFinite(idx) && idx !== null ? idx | 0 : -1;
      const removedVertex = vertices.splice(idx, 1);
      const newVertices = this.vertices(vertices, opt);
      this.trigger("remove:vertex", this, removedVertex[0], idx);
      return newVertices;
    }
  };
  staticConsts(Link, {
    ALLOW_SOURCE_CHANGE: "sourceChange",
    ALLOW_TARGET_CHANGE: "targetChange",
    ALLOW_LABEL_CHANGE: "labelChange",
    ALLOW_DESGINATION_CHANGE: "designationChange",
    ALLOW_REMOVE: "remove"
  });

  // images/libraries/apex/diagram-builder/utils/common.mjs
  function isPoint(o) {
    return typeof o.x === "number" && typeof o.y === "number" && Object.keys(o).length === 2;
  }
  function populateRect(rect) {
    return Object.assign(rect, {
      left: rect.x,
      right: rect.x + rect.width,
      top: rect.y,
      bottom: rect.y + rect.height
    });
  }

  // images/libraries/apex/diagram-builder/utils/graph.mjs
  var { dia: dia2 } = joint;
  function getElementBy(graph, propName, value) {
    return graph.getElements().find((el) => el.get(propName) === value);
  }
  function getElementById(graph, id) {
    return getElementBy(graph, "id", id);
  }
  function getLinkBy(graph, propName, value) {
    return graph.getLinks().find((link) => link.get(propName) === value);
  }
  function getLinkById(graph, id) {
    return getLinkBy(graph, "id", id);
  }
  function getCellBy(graph, propName, value) {
    return graph.getCells().find((cell) => cell.get(propName) === value);
  }
  function getCellById(graph, id) {
    return getCellBy(graph, "id", id);
  }
  function getElementWithRegistrationPoint(graph, p) {
    return graph.getElements().find((el) => {
      const { x, y } = el.position();
      return x === p.x && y === p.y;
    });
  }
  function getFreePosition(graph, p, gridSize) {
    let { x, y } = p;
    while (getElementWithRegistrationPoint(graph, { x, y })) {
      x += gridSize;
      y += gridSize;
    }
    return { x, y };
  }
  function getElement(graph, el) {
    if (el == null) {
      return null;
    }
    if (typeof el === "string") {
      return getElementById(graph, el) || null;
    } else {
      if (el instanceof dia2.Element) {
        return el;
      } else if (el.id != null) {
        return getElementById(graph, el.id) || null;
      }
    }
    return null;
  }
  function getLink(graph, link) {
    if (link == null) {
      return null;
    }
    if (typeof link === "string") {
      return getLinkById(graph, link) || null;
    } else {
      if (link instanceof dia2.Link) {
        return link;
      } else if (link.id != null) {
        return getLinkById(graph, link.id) || null;
      }
    }
    return null;
  }
  function getCell(graph, cell) {
    if (cell == null) {
      return null;
    }
    if (typeof cell === "string") {
      return getCellById(graph, cell) || null;
    } else {
      if (cell instanceof dia2.Link || cell instanceof dia2.Element) {
        return cell;
      } else if (cell.id != null) {
        return getCellById(graph, cell.id) || null;
      }
    }
    return null;
  }
  function getCells(graph, cells) {
    return cells.map((cell) => getCell(graph, cell)).filter((cell) => cell != null);
  }
  function getAnchorCoords(anchor = {}, bbox) {
    const { name = "topLeft", args = {} } = anchor;
    const { dx = "50%", dy = "50%" } = args;
    const fromPoint = (() => {
      let { x, y } = bbox;
      switch (name) {
        case "topRight":
          x += bbox.width;
          break;
        case "modelCenter":
          x += bbox.width / 2;
          y += bbox.height / 2;
          break;
        case "top":
          x += bbox.width / 2;
          break;
        case "bottom":
          x += bbox.width / 2;
          y += bbox.height;
          break;
        case "left":
          y += bbox.height / 2;
          break;
        case "right":
          x += bbox.width;
          y += bbox.height / 2;
          break;
        case "bottomLeft":
          y += bbox.height;
          break;
        case "bottomRight":
          x += bbox.width;
          y += bbox.height;
          break;
      }
      return { x, y };
    })();
    if (typeof dx == "number") {
      return {
        x: fromPoint.x + dx,
        y: fromPoint.y + dy
      };
    }
    return {
      x: fromPoint.x + Math.round(parseFloat(dx) / 100 * bbox.width),
      y: fromPoint.y + Math.round(parseFloat(dy) / 100 * bbox.height)
    };
  }

  // images/libraries/apex/diagram-builder/actions/dia.mjs
  var { g } = joint;
  function scrollIntoView(paperScroller, cell, opt = {}) {
    const {
      padding = 0,
      animation = true,
      strict = true,
      center = true
    } = opt;
    const { paper } = paperScroller.options;
    const visibleArea = populateRect(paperScroller.getVisibleArea());
    const visibleCenter = visibleArea.center();
    let { x: scrollToX, y: scrollToY } = visibleCenter;
    if (cell.isElement()) {
      const bbox = cell.getBBox();
      populateRect(bbox);
      if (!paperScroller.isElementVisible(cell, { strict })) {
        if (center) {
          paperScroller.scrollToElement(cell, { animation });
        } else {
          if (bbox.x < visibleArea.x + padding) {
            scrollToX = scrollToX + (bbox.x - visibleArea.x) - padding;
          } else if (bbox.right > visibleArea.right - padding) {
            scrollToX = scrollToX + bbox.right - visibleArea.right + padding;
          }
          if (bbox.y < visibleArea.y + padding) {
            scrollToY = scrollToY + (bbox.y - visibleArea.y) - padding;
          } else if (bbox.bottom > visibleArea.bottom - padding) {
            scrollToY = scrollToY + bbox.bottom - visibleArea.bottom + padding;
          }
          paperScroller.scroll(scrollToX, scrollToY, { animation });
        }
      }
    } else {
      const { ratio = 0 } = opt;
      const linkView = cell.findView(paper);
      paper.requireView(linkView);
      const point = linkView.getPointAtRatio(ratio);
      const { x, y } = point;
      if (!paperScroller.isPointVisible(point, padding)) {
        if (center) {
          paperScroller.scrollToLink(cell, { animation });
        } else {
          if (x < visibleArea.x + padding) {
            scrollToX = scrollToX + (x - visibleArea.x) - padding;
          } else if (x > visibleArea.right - padding) {
            scrollToX = scrollToX + x - visibleArea.right + padding;
          }
          if (y < visibleArea.y + padding) {
            scrollToY = scrollToY + (y - visibleArea.y) - padding;
          } else if (y > visibleArea.bottom - padding) {
            scrollToY = scrollToY + y - visibleArea.bottom + padding;
          }
          paperScroller.scroll(scrollToX, scrollToY, { animation });
        }
      }
    }
  }
  function updateConnections(paper, links = []) {
    paper.freeze();
    links.forEach((link) => {
      link.findView(paper).requestConnectionUpdate();
    });
    paper.unfreeze();
  }
  function updateAllConnections(paper) {
    updateConnections(paper, paper.model.getLinks());
  }
  function updateAutoRoutedConnections(paper) {
    const R = DiagramBuilderRouter_default;
    const graph = paper.model;
    const defRouterName = paper.options.defaultRouter.name;
    const defRouterIsAuto = defRouterName === R.MANHATTAN || defRouterName === R.ADVANCED_MANHATTAN;
    const links = graph.getLinks().filter((link) => {
      const routerName = link.router()?.name;
      if (routerName == null && defRouterIsAuto) {
        return true;
      }
      if (routerName === R.MANHATTAN || routerName === R.ADVANCED_MANHATTAN) {
        return true;
      }
      return false;
    });
    if (links.length) {
      updateConnections(paper, links);
    }
  }
  function addElementToLinkAtRatio(elementView, linkView, ratio = 0.5) {
    const paper = elementView.paper;
    const graph = paper.model;
    const element = elementView.model;
    const link = linkView.model;
    const { x, y } = linkView.getPointAtRatio(ratio);
    const vertices = link.vertices();
    const target = link.target();
    const source = link.source();
    let elementBBox = element.getBBox();
    if (target.id === element.id || source.id === element.id) {
      return;
    }
    paper.freeze();
    const p = g.Point(x - elementBBox.width / 2, y - elementBBox.height / 2).snapToGrid(paper.options.gridSize);
    element.position(p.x, p.y);
    let vertexRatios = vertices.map((vertex) => {
      return {
        vertex,
        ratio: linkView.getClosestPointRatio(vertex)
      };
    });
    link.target(element);
    const newLink = paper.getDefaultLink();
    newLink.source(element);
    newLink.target(target);
    graph.addCell(newLink);
    paper.requireView(element);
    elementBBox = element.getBBox();
    vertexRatios = vertexRatios.filter((o) => !elementBBox.containsPoint(o.vertex));
    newLink.vertices(vertexRatios.filter((o) => o.ratio > ratio).map((o) => o.vertex));
    link.vertices(vertexRatios.filter((o) => o.ratio <= ratio).map((o) => o.vertex));
    paper.unfreeze();
  }
  function label(graph, link, text = "", opt = {}) {
    const {
      rewrite = false,
      ...restOpt
    } = opt;
    link = getLink(graph, link);
    if (!link) {
      return;
    }
    let labels = link.labels();
    let count = labels.length;
    let hasDesignation = !!labels[0]?.designation;
    let index = 0;
    if (hasDesignation) {
      index = 1;
      if (count === 1) {
        link.label(index, Link.getLabelCfg(text, restOpt));
      } else {
        if (rewrite) {
          link.label(index, Link.getLabelCfg(text, restOpt), { rewrite });
        } else {
          link.prop(`labels/${index}/${Link.getLabelTextPath()}`, text);
        }
      }
    } else {
      if (!count) {
        link.label(index, Link.getLabelCfg(text, restOpt));
      } else {
        if (rewrite) {
          link.label(index, Link.getLabelCfg(text, restOpt), { rewrite });
        } else {
          link.prop(`labels/${index}/${Link.getLabelTextPath()}`, text);
        }
      }
    }
  }
  function removeLabel(graph, link) {
    link = getLink(graph, link);
    if (!link) {
      return;
    }
    removeLabelAt(link, 0, graph);
  }
  function removeLabelAt(graph, link, index) {
    link = getLink(link, graph);
    if (!link) {
      return;
    }
    const first = link.label(index);
    if (first?.designation) {
      index = 1;
    }
    link.removeLabel(index);
  }
  function removeCells(graph, cells) {
    graph[Array.isArray(cells) ? "removeCells" : "removeCell"](cells);
  }
  function changeElementInPlace(graph, elToChange, newEl) {
    const inboundLinks = graph.getConnectedLinks(elToChange, { inbound: true }).map((link) => {
      return {
        target: link.target(),
        vertices: link.vertices(),
        link
      };
    });
    const outboundLinks = graph.getConnectedLinks(elToChange, { outbound: true }).map((link) => {
      return {
        source: link.source(),
        vertices: link.vertices(),
        link
      };
    });
    const newElId = newEl.get("id");
    graph.addCell(newEl, { async: false });
    inboundLinks.forEach(({ link, target, vertices }) => {
      target.id = newElId;
      link.target(target);
      link.vertices(vertices);
    });
    outboundLinks.forEach(({ link, source, vertices }) => {
      source.id = newElId;
      link.source(source);
      link.vertices(vertices);
    });
    elToChange.remove();
  }
  function toFront(cells) {
    cells = Array.isArray(cells) ? cells : [cells];
    cells.forEach((cell) => cell.toFront({ deep: true }));
  }
  function toBack(cells) {
    cells = Array.isArray(cells) ? cells : [cells];
    cells.forEach((cell) => cell.toBack({ deep: true }));
  }
  function canRemoveElements(els = []) {
    els = Array.isArray(els) ? els : [els];
    let canRemove = els.every((el) => el.allow(Element.ALLOW_REMOVE) && !el.isReadOnly());
    if (canRemove) {
      const processedLink = [];
      canRemove = els.every((el) => {
        const { graph } = el;
        const connectedLinks = graph.getConnectedLinks(el);
        return connectedLinks.every((link) => {
          if (processedLink.includes(link.id)) {
            return true;
          }
          processedLink.push(link.id);
          const sourceEl = link.getSourceElement();
          const targetEl = link.getTargetElement();
          const sourceElToBeDeleted = sourceEl ? els.includes(sourceEl) : false;
          const targetElToBeDeleted = targetEl ? els.includes(targetEl) : false;
          if (link.isReadOnly()) {
            return false;
          }
          if (sourceElToBeDeleted && targetElToBeDeleted) {
            return true;
          }
          if (sourceElToBeDeleted && (link.prop("requireSourceElement") || !link.allow(Link.ALLOW_SOURCE_CHANGE))) {
            return false;
          }
          if (targetElToBeDeleted && (link.prop("requireTargetElement") || !link.allow(Link.ALLOW_TARGET_CHANGE))) {
            return false;
          }
          return true;
        });
      });
    }
    return canRemove;
  }
  function canRemoveLinks(links = []) {
    links = Array.isArray(links) ? links : [links];
    return links.every((link) => {
      return !link.isReadOnly() && link.allow(Link.ALLOW_REMOVE);
    });
  }

  // images/libraries/apex/diagram-builder/tools/mixin.mjs
  var POS_RE = /(top|bottom|center)?(right$|left$|center$)?/i;
  var mixin_default = {
    mPosition() {
      if (!Object.hasOwn(this.options, "position")) {
        return;
      }
      let x, y;
      const [, v = "center", h = "center"] = POS_RE.exec(this.options.position);
      switch (v.toLowerCase()) {
        case "top":
          y = 0;
          break;
        case "bottom":
          y = "100%";
          break;
        default:
          y = "50%";
      }
      switch (h.toLowerCase()) {
        case "left":
          x = 0;
          break;
        case "right":
          x = "100%";
          break;
        default:
          x = "50%";
      }
      this.options.x = x;
      this.options.y = y;
    }
  };

  // images/libraries/apex/diagram-builder/tools/elements/Connect.mjs
  var { elementTools, util } = joint;
  var Connect = class extends elementTools.Connect {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "connect-button";
      this.events = {
        mousedown: "mousedown",
        mouseup: "mouseup",
        mouseleave: "mouseleave"
      };
      this.documentEvents = {
        mousemove: "drag",
        touchmove: "drag",
        mouseup: "dragend",
        touchend: "dragend",
        touchcancel: "dragend"
      };
      this.children = [{
        tagName: "circle",
        selector: "button",
        attributes: {
          r: 10,
          fill: "var(--a-diagram-button-background-color, #eee)",
          stroke: "var(--a-diagram-button-border-color, #666)",
          cursor: "pointer"
        }
      }, {
        tagName: "text",
        selector: "label",
        textContent: "\uE069",
        attributes: {
          "font-family": "apex-5-icon-font",
          "dominant-baseline": "central",
          "text-anchor": "middle",
          "pointer-events": "none",
          fill: "#666",
          stroke: "none",
          "style": "user-select: none"
        }
      }];
    }
    constructor() {
      super(...arguments);
      Object.assign(this, mixin_default);
    }
    onRender() {
      this.mPosition();
      super.onRender();
    }
    mousedown(e) {
      this.isMouseDown = true;
      e.stopPropagation();
    }
    mouseup(e) {
      const { position, x, y } = this.options;
      this.isMouseDown = false;
      this.relatedView.notify("element:connectbutton:pointerup", this, position, { x, y }, e);
    }
    mouseleave(e) {
      if (this.isMouseDown && !this.isDragging) {
        this.dragLinkStart(e);
      }
    }
    dragLinkStart(e) {
      const { paper, relatedView } = this;
      const normalizedEvent = util.normalizeEvent(e);
      const { x, y } = paper.clientToLocalPoint(normalizedEvent.clientX, normalizedEvent.clientY);
      this.isDragging = true;
      relatedView.dragLinkStart(normalizedEvent, this.getMagnetNode(), x, y, this.options.position);
      paper.undelegateEvents();
      this.delegateDocumentEvents(null, normalizedEvent.data);
      this.focus();
    }
    dragend(e) {
      const { linkView } = this.relatedView.eventData(e);
      const { model: linkModel } = linkView;
      this.isMouseDown = false;
      this.isDragging = false;
      super.dragend(e);
      if (linkModel.hasLoop()) {
        const { position } = this.options;
        const targetAnchor = linkModel.target().anchor;
        const v1 = {}, v2 = {}, v3 = {};
        const bbox = this.relatedView.model.getBBox();
        const targetPoint = getAnchorCoords(targetAnchor, bbox);
        const offset = 30;
        let targetSide;
        switch (position) {
          case "top":
            targetSide = this.getTargetSide(targetAnchor, bbox, "horizontal");
            v1.x = bbox.x + bbox.width / 2;
            v1.y = v2.y = bbox.y - offset;
            v2.x = v3.x = targetSide === "right" ? bbox.x + bbox.width + offset : bbox.x - offset;
            v3.y = targetPoint.y;
            break;
          case "bottom":
            targetSide = this.getTargetSide(targetAnchor, bbox, "horizontal");
            v1.x = bbox.x + bbox.width / 2;
            v1.y = v2.y = bbox.y + bbox.height + offset;
            v2.x = v3.x = targetSide === "right" ? bbox.x + bbox.width + offset : bbox.x - offset;
            v3.y = targetPoint.y;
            break;
          case "left":
            targetSide = this.getTargetSide(targetAnchor, bbox, "vertical");
            v1.x = v2.x = bbox.x - offset;
            v1.y = bbox.y + bbox.height / 2;
            v2.y = v3.y = targetSide === "top" ? bbox.y - offset : bbox.y + bbox.height + 20;
            v3.x = targetPoint.x;
            break;
          default:
            targetSide = this.getTargetSide(targetAnchor, bbox, "vertical");
            v1.x = v2.x = bbox.x + bbox.width + offset;
            v1.y = bbox.y + bbox.height / 2;
            v2.y = v3.y = targetSide === "top" ? bbox.y - offset : bbox.y + bbox.height + 20;
            v3.x = targetPoint.x;
            break;
        }
        linkModel.vertices([v1, v2, v3]);
      }
    }
    getTargetSide(anchor, bbox, direction) {
      if (direction === "vertical") {
        const { dy } = anchor.args;
        return (typeof dy == "string" ? parseFloat(dy) >= 50 : dy >= bbox.y + bbox.height / 2) ? "bottom" : "top";
      }
      const { dx } = anchor.args;
      return (typeof dx == "string" ? parseFloat(dx) >= 50 : dx >= bbox.x + bbox.width / 2) ? "right" : "left";
    }
  };

  // images/libraries/apex/diagram-builder/tools/Menu.mjs
  var { elementTools: elementTools2 } = joint;
  var Menu = class _Menu extends elementTools2.Button {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "menu-button";
      this.children = _Menu.MARKUP_SHAPE_ELEMENT;
    }
    constructor() {
      super(...arguments);
      Object.assign(this, mixin_default);
    }
    onRender() {
      this.mPosition();
      super.onRender(...arguments);
    }
    onPointerDown(e) {
      super.onPointerDown(...arguments);
      this.relatedView.notify("cell:menubutton:pointerdown", this, e);
    }
  };
  staticConst(Menu, "MARKUP_SHAPE_ELEMENT", [{
    tagName: "rect",
    selector: "button",
    attributes: {
      width: 20,
      height: 20,
      x: -10,
      y: -10,
      rx: 3,
      fill: "var(--a-diagram-element-menu-button-background-color, #fff)",
      cursor: "pointer",
      "user-select": "none"
    }
  }, {
    tagName: "text",
    selector: "label",
    textContent: "\uE259",
    attributes: {
      "font-family": "apex-5-icon-font",
      "font-size": 14,
      "dominant-baseline": "central",
      "text-anchor": "middle",
      "pointer-events": "none",
      fill: "var(--a-diagram-element-menu-button-text-color, #666)",
      stroke: "none",
      "style": "user-select: none"
    }
  }]);
  staticConst(Menu, "MARKUP_TERMINATOR_ELEMENT", [{
    tagName: "circle",
    selector: "button",
    attributes: {
      r: 10,
      fill: "var(--a-diagram-element-terminator-menu-button-background-color, #eee)",
      stroke: "var(--a-diagram-element-terminator-menu-button-border-color, #666)",
      cursor: "pointer"
    }
  }, {
    tagName: "text",
    selector: "label",
    textContent: "\uE259",
    attributes: {
      "font-family": "apex-5-icon-font",
      "dominant-baseline": "central",
      "text-anchor": "middle",
      "pointer-events": "none",
      fill: "var(--a-diagram-element-terminator-menu-button-text-color, #666)",
      stroke: "none",
      "style": "user-select: none"
    }
  }]);
  staticConst(Menu, "MARKUP_LINK", [{
    tagName: "circle",
    selector: "button",
    attributes: {
      r: 10,
      fill: "var(--a-diagram-link-menu-button-background-color, #eee)",
      stroke: "var(--a-diagram-link-menu-button-border-color, #666)",
      cursor: "pointer"
    }
  }, {
    tagName: "text",
    selector: "label",
    textContent: "\uE259",
    attributes: {
      "font-family": "apex-5-icon-font",
      "dominant-baseline": "central",
      "text-anchor": "middle",
      "pointer-events": "none",
      fill: "var(--a-diagram-link-menu-button-text-color, #666)",
      stroke: "none",
      "style": "user-select: none"
    }
  }]);

  // images/libraries/apex/diagram-builder/tools/links/AddElementButton.mjs
  var { linkTools, util: util2 } = joint;
  var COLOR_STROKE = "var(--a-diagram-link-placeholder-border-color, none)";
  var COLOR_FILL = "var(--a-diagram-link-placeholder-background-color, #666)";
  var COLOR_GLYPH = "var(--a-diagram-link-placeholder-text-color, #fff)";
  var AddElementButton = class extends linkTools.Button {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "add-element-button";
      this.events = {
        "mousedown": "onPointerDown",
        "touchstart": "onPointerDown",
        "mouseup": "onPointerUp",
        "touchend": "onPointerUp",
        "touchcancel": "onPointerUp"
      };
      this.children = [{
        tagName: "circle",
        selector: "button",
        attributes: {
          r: 15,
          fill: COLOR_FILL,
          stroke: COLOR_STROKE,
          cursor: "pointer"
        }
      }, {
        tagName: "text",
        selector: "label",
        textContent: "\uE069",
        attributes: {
          "font-family": "apex-5-icon-font",
          "font-size": 20,
          "dominant-baseline": "central",
          "text-anchor": "middle",
          "pointer-events": "none",
          fill: COLOR_GLYPH,
          stroke: "none",
          x: 0,
          style: "user-select: none"
        }
      }];
    }
    onRender() {
      super.onRender();
      this.showOffsetConnector();
    }
    onRemove() {
      super.onRemove();
      this.hideOffsetConnector();
    }
    show() {
      super.show();
      this.showOffsetConnector();
    }
    hide() {
      super.hide();
      this.hideOffsetConnector();
    }
    onPointerDown(e) {
      super.onPointerDown(e);
      this.relatedView.notify("link:addelement:pointerdown", this, this.getLinkPoint(), e);
    }
    onPointerUp(e) {
      this.relatedView.notify("link:addelement:pointerup", this, this.getLinkPoint(), e);
    }
    getLinkPoint() {
      const view = this.relatedView;
      const { model } = view;
      const ratio = model.offsetConnectorRatio();
      const length = ratio == null ? model.offsetConnectorLength() : null;
      return ratio != null ? view.getPointAtRatio(ratio) : view.getPointAtLength(length);
    }
    showOffsetConnector() {
      const {
        toggleOffsetConnector = false,
        offset = -30,
        distance = "50%"
      } = this.options;
      const { relatedView } = this;
      const { model } = relatedView;
      if (toggleOffsetConnector) {
        const distanceIsPerc = util2.isPercentage(distance);
        if (distanceIsPerc) {
          model.offsetConnectorRatio(parseFloat(distance) / 100, offset);
        } else {
          model.offsetConnectorLength(distance, offset);
        }
        relatedView.showOffsetConnector();
      }
    }
    hideOffsetConnector() {
      const {
        toggleOffsetConnector = false
      } = this.options;
      const { relatedView } = this;
      if (toggleOffsetConnector) {
        relatedView.hideOffsetConnector();
      }
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/SourceArrowhead.mjs
  var { linkTools: linkTools2 } = joint;
  var SourceArrowhead = class extends linkTools2.SourceArrowhead {
    preinitialize() {
      super.preinitialize(...arguments);
      const size = 14;
      this.tagName = "rect";
      this.attributes = {
        x: -size / 2,
        y: -size / 2,
        width: size,
        height: size,
        rx: 4,
        "fill": "#33334F",
        "stroke": "#FFFFFF",
        "stroke-width": 2,
        "cursor": "move",
        "class": "source-arrowhead"
      };
    }
    onPointerDown(e) {
      super.onPointerDown(e);
      this.relatedView.notifyPointerdown(...arguments);
      this.relatedView.notify("link:arrowhead:pointerdown", this, this.ratio, e);
    }
    onPointerUp(e) {
      super.onPointerUp(e);
      this.relatedView.notify("link:arrowhead:pointerup", this, this.ratio, e);
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/TargetArrowhead.mjs
  var { linkTools: linkTools3 } = joint;
  var TargetArrowhead = class extends linkTools3.TargetArrowhead {
    onPointerDown(e) {
      super.onPointerDown(e);
      this.relatedView.notifyPointerdown(...arguments);
      this.relatedView.notify("link:arrowhead:pointerdown", this, this.ratio, e);
    }
    onPointerUp(e) {
      super.onPointerUp(e);
      this.relatedView.notify("link:arrowhead:pointerup", this, this.ratio, e);
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/SourceAnchor.mjs
  var { linkTools: linkTools4 } = joint;
  var SourceAnchor = class extends linkTools4.SourceAnchor {
    onPointerUp(e) {
      super.onPointerUp(e);
      const { relatedView } = this;
      relatedView.notify("link:anchor:pointerup", this, "source", relatedView.model.prop(["source", "anchor"]), e);
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/TargetAnchor.mjs
  var { linkTools: linkTools5 } = joint;
  var TargetAnchor = class extends linkTools5.TargetAnchor {
    onPointerUp(e) {
      super.onPointerUp(e);
      const { relatedView } = this;
      relatedView.notify("link:anchor:pointerup", this, "target", relatedView.model.prop(["target", "anchor"]), e);
    }
  };

  // images/libraries/apex/diagram-builder/utils/text.mjs
  var { V } = joint;
  function measureText(svgDocument, text, attrs) {
    const vText = V("text").attr(attrs).text(text);
    vText.appendTo(svgDocument);
    const bbox = vText.getBBox();
    vText.remove();
    return bbox;
  }
  function sanitize(str = "") {
    return str.replace(/</g, "&lt;").replace(/>/g, "&gt;");
  }

  // images/libraries/apex/diagram-builder/utils/browser.mjs
  function isSafari() {
    return !!navigator.userAgent.match(/Version\/[\d.]+.*Safari/);
  }

  // images/libraries/apex/diagram-builder/cells/elements/ShapeElement.mjs
  var { util: util3 } = joint;
  var FONT_FAMILY = "var(--a-diagram-element-font-family, sans-serif)";
  var FONT_SIZE = "var(--a-diagram-element-font-size, 14px)";
  var MAX_LINE_COUNT = 3;
  var ELLIPSIS = true;
  function isCalcAttribute(value) {
    return typeof value === "string" && value.includes("calc");
  }
  var ShapeElement = class _ShapeElement extends Element {
    // In jointjs+ 4.0.1 (jointjs 4.0.2) they changed how the textWrap works:
    // it gets the computed style of the node and doesn't rely anymore on the 'attrs' which are
    // passed in. This actually breaks the first render of the element with textWrap because it
    // doesn't respect the font size, family, etc. if they are set in the attributes coming from
    // defaults(). So the 1st wrapping/breaking of the text happens before these attributes are applied
    // to the node, it doesn't account for them but they will be still set on the text (later) and
    // will cause the text's position to be off, and/or text to overflow the element or be too
    // close to the edge.
    // Override to still rely on the 'attrs' instead of the computed style:
    static attributes = {
      "text-wrap": {
        qualify: util3.isPlainObject,
        set: function(value, refBBox, node, attrs) {
          const size = {};
          const width = value.width || 0;
          if (util3.isPercentage(width)) {
            size.width = refBBox.width * parseFloat(width) / 100;
          } else if (isCalcAttribute(width)) {
            throw new Error("(text-wrap: width) calc attribute is not implemented");
          } else {
            if (value.width === null) {
              size.width = Infinity;
            } else if (width <= 0) {
              size.width = refBBox.width + width;
            } else {
              size.width = width;
            }
          }
          const height = value.height || 0;
          if (util3.isPercentage(height)) {
            size.height = refBBox.height * parseFloat(height) / 100;
          } else if (isCalcAttribute(height)) {
            throw new Error("(text-wrap: height) calc attribute is not implemented");
          } else {
            if (value.height === null) {
            } else if (height <= 0) {
              size.height = refBBox.height + height;
            } else {
              size.height = height;
            }
          }
          let wrappedText;
          let text = value.text;
          if (text === void 0) {
            text = attrs.text;
          }
          if (text !== void 0) {
            const breakTextFn = value.breakText || util3.breakText;
            wrappedText = breakTextFn("" + text, size, {
              "font-weight": attrs["font-weight"],
              "font-size": attrs["font-size"],
              "font-family": attrs["font-family"],
              "lineHeight": attrs["line-height"],
              "letter-spacing": attrs["letter-spacing"]
            }, {
              // Provide an existing SVG Document here
              // instead of creating a temporary one over again.
              svgDocument: this.paper.svg,
              ellipsis: value.ellipsis,
              hyphen: value.hyphen,
              separator: value.separator,
              maxLineCount: value.maxLineCount,
              preserveSpaces: value.preserveSpaces
            });
          } else {
            wrappedText = "";
          }
          _ShapeElement.getAttributeDefinition("text").set.call(this, wrappedText, refBBox, node, attrs);
        }
      }
    };
    preinitialize() {
      super.preinitialize(...arguments);
      this.padding = 10;
      this.markup = [{
        tagName: "rect",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "path",
          selector: "decorationPattern"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }, {
        tagName: "text",
        selector: "label"
      }, {
        tagName: "text",
        selector: "statusIcon"
      }];
      Object.defineProperty(this, "safari", {
        value: isSafari(),
        enumerable: true
      });
    }
    initialize() {
      super.initialize(...arguments);
      this.on("change", this.onAttributeChange);
      this.sizeText(this.attr("label/text"));
    }
    measureText(text, attrs) {
      const svgDocument = document.querySelector("svg");
      return measureText(svgDocument, text, attrs);
    }
    onAttributeChange(model, { propertyPath, propertyValue }) {
      if (propertyPath === "attrs/label/text") {
        this.sizeText(propertyValue);
      }
    }
    sizeText(text) {
      const brokenText = util3.breakText(text, {
        width: this.attr("label/textWrap/width")
        // height: ShapeElement.MAX_TEXT_HEIGHT
      }, {
        "font-size": FONT_SIZE,
        "font-family": FONT_FAMILY
      }, {
        ellipsis: ELLIPSIS,
        maxLineCount: MAX_LINE_COUNT
      });
      const { width, height } = this.size();
      const { height: textHeight } = this.measureText(brokenText, {
        "font-size": FONT_SIZE,
        "font-family": FONT_FAMILY
      });
      let newHeight = textHeight + 2 * this.padding < 60 ? 60 : Math.ceil(textHeight / 10) * 10 + 2 * this.padding;
      if (newHeight % 20 > 0) {
        newHeight += newHeight % 20;
      }
      const labelY = this.safari ? Math.round(newHeight / 2) : Math.round((newHeight - textHeight) / 2);
      this.attr("label/y", labelY);
      if (height !== newHeight) {
        this.resize(width, newHeight);
      }
    }
    defaults() {
      const radius = _ShapeElement.CORNER_RADIUS;
      const bodyX = 26;
      const decoWidth = 60;
      const safari = this.safari;
      return {
        ...super.defaults(),
        type: "apex.Shape",
        size: { width: 220, height: 60 },
        attrs: {
          body: {
            fill: "var(--a-diagram-element-background-color, #fff)",
            x: bodyX,
            rx: radius,
            ry: radius,
            width: `calc(w - ${bodyX})`,
            height: "calc(h)"
          },
          decoration: {
            // NOTE: We cannot use "y" as "g" element doesn't support positioning.
            // If we used "svg" instead of "g", it would work, but would break the mask-highlighting.
            transform: "translate(0 calc(h / 2 - 30))"
          },
          decorationBackground: {
            width: decoWidth,
            height: decoWidth,
            rx: radius,
            ry: radius,
            fill: "var(--a-diagram-element-icon-background-color, #aaa)"
          },
          decorationPattern: {
            width: decoWidth,
            height: decoWidth,
            rx: radius,
            ry: radius,
            fill: "none"
          },
          glyph: {
            ref: "decorationBackground",
            text: "",
            fontFamily: "apex-5-icon-font",
            fontSize: 24,
            x: "calc(w / 2)",
            y: "calc(h / 2)",
            textAnchor: "middle",
            ...!safari && { dominantBaseline: "central" },
            ...safari && { textVerticalAnchor: "middle" },
            fill: "var(--a-diagram-element-icon-color, #000)"
          },
          statusIcon: {
            text: "",
            fontFamily: "apex-5-icon-font",
            fontSize: 16,
            width: "calc(h)",
            x: "calc(w - 4)",
            y: 4,
            textAnchor: "end",
            ...!safari && { dominantBaseline: "text-before-edge" },
            ...safari && { textVerticalAnchor: "top" },
            fill: "#000000"
          },
          label: {
            ...!safari && { dominantBaseline: "text-before-edge" },
            ...safari && { textVerticalAnchor: "middle" },
            textAnchor: "start",
            text: "",
            textWrap: {
              width: 220 - decoWidth - 20,
              // e.g. totalWidth - decoWidth (= visible body) - paddings => width = 140, 10 offset from the shape
              ellipsis: ELLIPSIS,
              // height: ShapeElement.MAX_TEXT_HEIGHT,
              maxLineCount: MAX_LINE_COUNT
            },
            x: decoWidth + 10,
            fontSize: FONT_SIZE,
            fontFamily: FONT_FAMILY,
            fill: "var(--a-diagram-element-text-color, #333)"
          }
        }
      };
    }
    changeToRtl(attrs) {
      attrs.body.x = 0;
      attrs.decoration.transform = "translate(calc(w - 60) calc(h / 2 - 30))";
      attrs.statusIcon.x = 4;
      attrs.label.x = 150;
    }
    text(text = "") {
      if (arguments.length) {
        return this.attr("label/text", text);
      }
      return this.attr("label/text");
    }
    decorationBackgroundColor(fill) {
      if (arguments.length) {
        return this.attr("decorationBackground/fill", fill);
      }
      return this.attr("decorationBackground/fill");
    }
    decorationPattern(fill) {
      if (arguments.length) {
        return this.attr("decorationPattern/fill", fill);
      }
      return this.attr("decorationBackground/fill");
    }
  };
  staticConsts(ShapeElement, {
    // MAX_TEXT_HEIGHT: 120,
    CORNER_RADIUS: 6
  });

  // images/libraries/apex/diagram-builder/tools/links/Placeholder.mjs
  var { dia: dia3, V: V2 } = joint;
  var COLOR_STROKE2 = "var(--a-diagram-link-placeholder-border-color, none)";
  var COLOR_FILL2 = "var(--a-diagram-link-placeholder-background-color, #666)";
  var COLOR_GLYPH2 = "var(--a-diagram-link-placeholder-text-color, #fff)";
  var Placeholder = class extends dia3.ToolView {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "placeholder";
      this.events = {
        mouseenter: "onMouseEnter",
        mouseleave: "onMouseLeave",
        mousedown: "onPointerDown",
        mouseup: "onPointerUp"
      };
      this.radius = 15;
      this.tagName = "g";
      this.children = [{
        tagName: "circle",
        selector: "button",
        attributes: {
          r: this.radius,
          cx: 0,
          fill: COLOR_FILL2,
          stroke: COLOR_STROKE2,
          cursor: "pointer",
          "user-select": "none"
        }
      }, {
        tagName: "text",
        selector: "label",
        textContent: "\uE069",
        attributes: {
          "font-family": "apex-5-icon-font",
          "font-size": 20,
          "dominant-baseline": "central",
          "text-anchor": "middle",
          "pointer-events": "none",
          fill: COLOR_GLYPH2,
          stroke: "none",
          x: 0,
          style: "user-select: none"
        }
      }];
      this.options = {
        scale: null
      };
    }
    constructor(opt) {
      super();
      Object.assign(this.options, opt);
    }
    onRender() {
      this.renderChildren();
      this.update();
    }
    update() {
      const { ratio, translate } = this;
      const view = this.relatedView;
      const tangent = view.getTangentAtRatio(ratio);
      const { scale: scale2 } = this.options;
      let position;
      if (tangent) {
        position = tangent.start;
        if (translate) {
          const dX = tangent.end.x - tangent.start.x;
          const dY = tangent.end.y - tangent.start.y;
          const hypo = Math.sqrt(Math.pow(dX, 2) + Math.pow(dY, 2));
          const sinA = dY / hypo;
          const cosA = dX / hypo;
          const dY2 = sinA * this.radius * (scale2 || 1);
          const dX2 = cosA * this.radius * (scale2 || 1);
          position.x += dX2 * translate;
          position.y += dY2 * translate;
        }
      } else {
        position = view.getPointAtRatio(ratio);
      }
      let matrix = V2.createSVGMatrix().translate(position.x, position.y);
      if (scale2) {
        matrix = matrix.scale(scale2);
      }
      this.vel.transform(matrix, { absolute: true });
      return this;
    }
    setColors({ stroke, fill, glyph, reset = false } = {}) {
      const { button, label: label2 } = this.childNodes;
      if (reset) {
        this.resetColors();
      } else {
        if (stroke) {
          button.setAttribute("stroke", stroke);
        }
        if (fill) {
          button.setAttribute("fill", fill);
        }
        if (glyph) {
          label2.setAttribute("fill", glyph);
        }
      }
    }
    resetColors() {
      this.setColors({
        stroke: COLOR_STROKE2,
        fill: COLOR_FILL2,
        glyph: COLOR_GLYPH2
      });
    }
    getLinkPoint() {
      return this.relatedView.getPointAtRatio(this.ratio);
    }
    onMouseEnter(e) {
      this.relatedView.notify("link:placeholder:mouseenter", this, this.ratio, this.getLinkPoint(), e);
    }
    onMouseLeave(e) {
      this.relatedView.notify("link:placeholder:mouseleave", this, this.ratio, this.getLinkPoint(), e);
    }
    onPointerDown(e) {
      if (this.guard(e)) {
        return;
      }
      this.relatedView.notify("link:placeholder:pointerdown", this, this.ratio, this.getLinkPoint(), e);
    }
    onPointerUp(e) {
      if (this.guard(e)) {
        return;
      }
      this.relatedView.notify("link:placeholder:pointerup", this, this.ratio, this.getLinkPoint(), e);
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/SourcePlaceholder.mjs
  var SourcePlaceholder = class extends Placeholder {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "source-placeholder";
      this.ratio = 0;
      this.translate = -1;
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/TargetPlaceholder.mjs
  var TargetPlaceholder = class extends Placeholder {
    preinitialize() {
      super.preinitialize(...arguments);
      this.name = "target-placeholder";
      this.ratio = 1;
      this.translate = 1;
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/Boundary.mjs
  var { linkTools: linkTools6 } = joint;
  var Boundary = class extends linkTools6.Boundary {
    preinitialize() {
      this.attributes = {
        "fill": "none",
        "stroke": "var(--a-diagram-cell-selection, #333)",
        "stroke-width": 0.5,
        "stroke-dasharray": "5, 5",
        "pointer-events": "none"
      };
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/Vertices.mjs
  var { linkTools: linkTools7, util: util4 } = joint;
  var Vertices = class extends linkTools7.Vertices {
    #changedHandleInitialPosition;
    // Override to be able to save the initial vertex position.
    onHandleWillChange(handle, e) {
      this.focus();
      const {
        relatedView,
        options
      } = this;
      const [normalizedEvt, x, y] = relatedView.paper.getPointerArgs(e);
      relatedView.model.startBatch("vertex-move", {
        ui: true,
        tool: this.cid
      });
      if (!this.eventData(e).vertexAdded) {
        this.#changedHandleInitialPosition = { ...relatedView.model.vertex(handle.options.index) };
      }
      if (!options.stopPropagation) {
        relatedView.notifyPointerdown(normalizedEvt, x, y);
      }
    }
    // Override to be able to dispatch a custom event with the new and the old (initial) vertex position.
    onHandleChanged(handle, e) {
      const {
        options,
        relatedView: linkView
      } = this;
      const { model } = linkView;
      let dispatchPointerUp = true;
      if (options.vertexAdding) {
        this.updatePath();
      }
      if (!options.redundancyRemoval) {
        linkView.checkMouseleave(util4.normalizeEvent(e));
        return;
      }
      const vertex = model.vertex(handle.options.index);
      const verticesRemoved = linkView.removeRedundantLinearVertices({
        ui: true,
        tool: this.cid
      });
      if (verticesRemoved) {
        this.render();
      }
      this.blur();
      linkView.model.stopBatch("vertex-move", {
        ui: true,
        tool: this.cid
      });
      if (this.eventData(e).vertexAdded) {
        linkView.model.stopBatch("vertex-add", {
          ui: true,
          tool: this.cid
        });
        const index = model.vertices().findIndex((v) => v.x === vertex.x && v.y === vertex.y);
        if (index === -1) {
          dispatchPointerUp = false;
        }
      }
      const [normalizedEvt, x, y] = linkView.paper.getPointerArgs(e);
      if (dispatchPointerUp) {
        const { x: vertexNewX, y: vertexNewY } = vertex;
        const { x: vertexOldX, y: vertexOldY } = this.#changedHandleInitialPosition || {};
        linkView.notify("link:vertexhandle:pointerup", this, handle, { x: vertexNewX, y: vertexNewY }, { x: vertexOldX, y: vertexOldY }, normalizedEvt, x, y);
      }
      this.#changedHandleInitialPosition = null;
      if (!options.stopPropagation) {
        linkView.notifyPointerup(normalizedEvt, x, y);
      }
      linkView.checkMouseleave(normalizedEvt);
    }
  };

  // images/libraries/apex/diagram-builder/tools/links/Segments.mjs
  var { linkTools: linkTools8, util: util5 } = joint;
  var Segments = class extends linkTools8.Segments {
    #linkBeforeChangeInitialProps;
    // Override to save the original link props
    onHandleChangeStart(handle, e) {
      const { relatedView: linkView } = this;
      const { model } = linkView;
      this.#linkBeforeChangeInitialProps = {
        vertices: model.vertices(),
        source: util5.cloneDeep(model.source()),
        target: util5.cloneDeep(model.target())
      };
      super.onHandleChangeStart(handle, e);
    }
    // Override to dispatch a custom event with new & original link props
    onHandleChangeEnd(handle, e) {
      const { relatedView: linkView } = this;
      const { model } = linkView;
      super.onHandleChangeEnd(handle, e);
      const [normalizedEvt, x, y] = linkView.paper.getPointerArgs(e);
      const ori = this.#linkBeforeChangeInitialProps;
      const curr = {
        vertices: model.vertices(),
        source: model.source(),
        target: model.target()
      };
      const changes = [];
      const newValues = {};
      const oldValues = {};
      if (curr.vertices.length !== ori.vertices.length || curr.vertices.length && !util5.isEqual(curr.vertices, ori.vertices)) {
        changes.push("vertices");
      }
      if (!util5.isEqual(curr.source, ori.source)) {
        changes.push("source");
      }
      if (!util5.isEqual(curr.target, ori.target)) {
        changes.push("target");
      }
      changes.forEach((change) => {
        newValues[change] = curr[change];
        oldValues[change] = ori[change];
      });
      this.#linkBeforeChangeInitialProps = null;
      linkView.notify("link:segmenthandle:pointerup", this, handle, newValues, oldValues, normalizedEvt, x, y);
    }
  };

  // images/libraries/apex/diagram-builder/actions/tool.mjs
  var { dia: dia4 } = joint;
  var linkToolNames = Object.freeze({
    BOUNDARY: "boundary",
    VERTICES: "vertices",
    SOURCE_PLACEHOLDER: "source-placeholder",
    TARGET_PLACEHOLDER: "target-placeholder",
    SOURCE_ARROWHEAD: "source-arrowhead",
    TARGET_ARROWHEAD: "target-arrowhead",
    SOURCE_ANCHOR: "source-anchor",
    TARGET_ANCHOR: "target-anchor",
    SEGMENTS: "segments",
    MENU_BUTTON: "menu-button",
    REMOVE_BUTTON: "remove-button",
    ADD_ELEMENT_BUTTON: "add-element-button"
  });
  var linkToolSetNames = Object.freeze({
    LINK_HOVERED: "link-hovered",
    LINK_SELECTED: "link-selected"
  });
  var elementToolNames = Object.freeze({
    CONNECT: "connect-button",
    MENU_BUTTON: "menu-button"
  });
  var elementToolSetNames = Object.freeze({
    ELEMENT_SELECTED: "element-selected",
    ELEMENT_SELECTED_HOVERED: "element-selected-hovered",
    ELEMENT_HOVERED: "element-hovered"
  });
  var LINK_PLACEHOLDERS = "link-placeholders";
  var linkToolsOrder = {
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
  var elementToolSets = Object.freeze({
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
          new Connect({ position: "top", scale }),
          new Connect({ position: "right", scale }),
          new Connect({ position: "bottom", scale }),
          new Connect({ position: "left", scale })
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
          new Connect({ position: "top", scale }),
          new Connect({ position: "right", scale }),
          new Connect({ position: "bottom", scale }),
          new Connect({ position: "left", scale })
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
          new Connect({ position: "top", scale }),
          new Connect({ position: "right", scale }),
          new Connect({ position: "bottom", scale }),
          new Connect({ position: "left", scale })
        ]);
      }
      return arr;
    }
  });
  var linkToolSets = Object.freeze({
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
              distance: "50%",
              toggleOffsetConnector: true
            })
          );
        }
        if (model.router()?.name === DiagramBuilderRouter_default.NORMAL || paper.options.defaultRouter.name === DiagramBuilderRouter_default.NORMAL) {
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
            stopPropagation: true
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
  var scale = 1;
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
    if (model.graph == null) {
      return;
    }
    const toolsView = new dia4.ToolsView({
      name,
      tools: arr
    });
    view.addTools(toolsView);
  }
  function snapAnchor(coords, view, magnet, type, relatedView, toolView) {
    const snapRadius = toolView.options.snapRadius;
    const getCoord = (n) => Math.round(n / snapRadius) * snapRadius;
    coords.x = getCoord(coords.x);
    coords.y = getCoord(coords.y);
    return coords;
  }
  function getMenuPosition(model) {
    const rtl = model.get("rtl");
    if (model instanceof ShapeElement) {
      return {
        x: rtl ? 12 : "calc(w - 12)",
        y: "calc(h - 12)"
      };
    } else {
      return {
        x: rtl ? "15%" : "85%",
        y: "85%"
      };
    }
  }
  function getMenuMarkup(model) {
    if (model.isElement()) {
      return model instanceof ShapeElement ? Menu.MARKUP_SHAPE_ELEMENT : Menu.MARKUP_TERMINATOR_ELEMENT;
    }
    return Menu.MARKUP_LINK;
  }
  function addLinkSourcePlaceholder(view) {
    const { model } = view;
    if (hasTool(view, linkToolNames.SOURCE_PLACEHOLDER) || !model.allow(Link.ALLOW_SOURCE_CHANGE)) {
      return;
    }
    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);
    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
      addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
        new SourcePlaceholder({ scale }),
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    } else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
      addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
        new SourcePlaceholder({ scale }),
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    } else {
      addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
        new SourcePlaceholder({ scale }),
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    }
  }
  function removeLinkSourcePlaceholder(view) {
    if (!hasTool(view, linkToolNames.SOURCE_PLACEHOLDER)) {
      return;
    }
    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);
    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
      addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    } else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
      addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    } else {
      addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
        ...tp ? [new TargetPlaceholder({ scale })] : []
      ]));
    }
  }
  function addLinkTargetPlaceholder(view) {
    const { model } = view;
    if (hasTool(view, linkToolNames.TARGET_PLACEHOLDER) || !model.allow(Link.ALLOW_TARGET_CHANGE)) {
      return;
    }
    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
      addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
        new TargetPlaceholder({ scale }),
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    } else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
      addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
        new TargetPlaceholder({ scale }),
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    } else {
      addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
        new TargetPlaceholder({ scale }),
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    }
  }
  function removeLinkTargetPlaceholder(view) {
    if (!hasTool(view, linkToolNames.TARGET_PLACEHOLDER)) {
      return;
    }
    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
    if (view.hasTools(linkToolSetNames.LINK_HOVERED)) {
      addTools(view, linkToolSetNames.LINK_HOVERED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_HOVERED](view),
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    } else if (view.hasTools(linkToolSetNames.LINK_SELECTED)) {
      addTools(view, linkToolSetNames.LINK_SELECTED, sortLinkTools([
        ...linkToolSets[linkToolSetNames.LINK_SELECTED](view),
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    } else {
      addTools(view, LINK_PLACEHOLDERS, sortLinkTools([
        ...sp ? [new SourcePlaceholder({ scale })] : []
      ]));
    }
  }
  function addLinkTools(view, name, readOnly = false) {
    if (!linkToolSets[name] || view.hasTools(name)) {
      return;
    }
    const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
    const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);
    addTools(view, name, sortLinkTools([
      ...linkToolSets[name](view, readOnly),
      ...sp ? [new SourcePlaceholder({ scale })] : [],
      ...tp ? [new TargetPlaceholder({ scale })] : []
    ]));
  }
  function addElementTools(view, name, readOnly = false) {
    if (!elementToolSets[name] || view.hasTools(name)) {
      return;
    }
    addTools(view, name, elementToolSets[name](view.model, readOnly));
  }
  function removeTools(view, keepLinkPlaceholders = true) {
    const { model } = view;
    if (model.isElement() || !keepLinkPlaceholders) {
      view.removeTools();
    } else {
      const hasOtherTools = view.hasTools(linkToolSetNames.LINK_SELECTED) || view.hasTools(linkToolSetNames.LINK_HOVERED);
      if (!hasOtherTools) {
        return;
      }
      const sp = hasTool(view, linkToolNames.SOURCE_PLACEHOLDER);
      const tp = hasTool(view, linkToolNames.TARGET_PLACEHOLDER);
      if (sp || tp) {
        addTools(view, LINK_PLACEHOLDERS, [
          ...sp ? [new SourcePlaceholder({ scale })] : [],
          ...tp ? [new TargetPlaceholder({ scale })] : []
        ]);
      } else {
        view.removeTools();
      }
    }
  }
  function hasToolSet(view, name) {
    return view.hasTools(name);
  }
  function hasTool(view, name) {
    return !!view._toolsView?.tools.some((tool) => tool.name === name);
  }
  function getToolByEl(view, el) {
    return view._toolsView?.tools.find((tool) => tool.el.contains(el));
  }
  function getToolBy(view, fn) {
    return view._toolsView?.tools.find((tool) => fn(view, tool));
  }

  // images/libraries/apex/diagram-builder/actions/ui.mjs
  var { ui } = joint;
  function showToast(msg, opt = {}) {
    const {
      width,
      closeButton = false,
      duration = 2e3,
      target,
      foregroundContainerCls
    } = opt;
    const openAnimation = {
      duration: 0
    };
    const closeAnimation = {
      delay: duration,
      duration: 200,
      properties: {
        opacity: 0
      }
    };
    msg = sanitize(msg);
    ui.FlashMessage.close();
    const toast = new ui.FlashMessage({
      openAnimation,
      closeAnimation,
      closeButton,
      width,
      content: msg
    });
    toast.open(target);
    if (foregroundContainerCls?.length) {
      const cls = Array.isArray(foregroundContainerCls) ? foregroundContainerCls : foregroundContainerCls.split(" ");
      toast.el.querySelector(".fg").classList.add(...cls);
    }
  }

  // images/libraries/apex/diagram-builder/DiagramBuilderLocale.mjs
  var DiagramBuilderLocale = {
    STR_ZOOM_LEVEL: "zoomLevel"
  };
  Object.freeze(DiagramBuilderLocale);
  var DiagramBuilderLocale_default = DiagramBuilderLocale;

  // images/libraries/apex/diagram-builder/controllers/ViewController.mjs
  var oppositeSides = {
    left: "right",
    right: "left",
    top: "bottom",
    bottom: "top"
  };
  var LINK_LENGTH = 160;
  var PLACEHOLDER_ALLOW_DROP_CLS = "allow-drop";
  var PLACEHOLDER_HIGHLIGHT_COLOR_STROKE = "var(--a-diagram-link-placeholder-highlight-border-color, none)";
  var PLACEHOLDER_HIGHLIGHT_COLOR_FILL = "var(--a-diagram-link-placeholder-highlight-background-color, orange)";
  var PLACEHOLDER_HIGHLIGHT_COLOR_GLYPH = "var(--a-diagram-link-placeholder-highlight-text-color, #000)";
  var overCellHighlightId;
  var ViewController = class extends Controller_default {
    #paperScrollerResizeObserver;
    startListening() {
      const {
        graph,
        paper,
        stencil,
        paperScroller,
        navigator: navigator2
      } = this.context;
      Object.assign(this.context, {
        allowDropConnectOnElement: () => {
        },
        allowDropConnectOnLink: () => {
        },
        allowDropConnectOnPlaceholder: () => {
        },
        ...this.context
      });
      this.stopListening();
      this.listenTo(paper, {
        "blank:pointerdown": onPaperBlankPointerDown,
        "cell:mouseenter": onCellMouseEnter,
        "cell:mouseleave": onCellMouseLeave,
        "link:pointerup": onLinkPointerUp,
        "link:placeholder:mouseenter": onLinkPlaceholderMouseEnter,
        "link:placeholder:mouseleave": onLinkPlaceholderMouseLeave,
        "link:placeholder:pointerup": onLinkPlaceholderPointerup,
        "link:placeholder:pointerdown": onLinkPlaceholderPointerdown,
        "element:pointerdown": onElementPointerdown,
        "element:pointerup": onElementPointerup,
        "scale": onPaperScale
      });
      this.listenTo(graph, {
        "readonly": onReadOnlyChange,
        "reset": onGraphReset,
        "add": onCellAdd,
        "remove": onCellRemove,
        "beforeremove": onBeforeRemove,
        "change:position": onPositionChange,
        "change:size": onSizeChange,
        "change:designation": onLinkDesignationChange,
        "change:source": onLinkSourceChange,
        "change:target": onLinkTargetChange
      });
      this.listenTo(stencil, {
        "element:dragstart": onElementDragStart,
        "element:drop": onElementDrop,
        "element:dragend": onElementDragEnd,
        "element:drag": onElementDrag
      });
      this.listenTo(navigator2, {
        "visibility": onNavVisibilityChange
      });
      this.maybeCancelDrag = this.maybeCancelDrag.bind(this);
      document.addEventListener("keydown", this.maybeCancelDrag, true);
      this.#paperScrollerResizeObserver = new ResizeObserver(() => {
        navigator2.updateCurrentView();
      });
      this.#paperScrollerResizeObserver.observe(paperScroller.el);
    }
    maybeCancelDrag(e) {
      const {
        stencil,
        stencilDraggedView
      } = this.context;
      if (stencilDraggedView && e.key === "Escape") {
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
      const isHoveredModelSelected = hoveredModel && selectedModel === hoveredModel;
      this.context.usingKeyboard = bool;
      if (bool) {
        if (hoveredView && !isHoveredModelSelected) {
          removeTools(hoveredView);
        }
        if (selectedModel) {
          const selectedIsEl = selectedModel.isElement();
          const selectedView = selectedModel.findView(paper);
          const toolSetName = selectedIsEl ? elementToolSetNames.ELEMENT_SELECTED_HOVERED : linkToolSetNames.LINK_SELECTED;
          if (!hasToolSet(selectedView, toolSetName)) {
            if (selectedIsEl) {
              addElementTools(selectedView, toolSetName);
            } else {
              addLinkTools(selectedView, toolSetName);
            }
          }
        }
      } else {
        if (selectedModel && selectedModel.isElement() && selectedModel !== hoveredModel) {
          removeTools(selectedModel.findView(paper));
        }
        if (hoveredView) {
          if (hoveredModel.isElement()) {
            addElementTools(hoveredView, isHoveredModelSelected ? elementToolSetNames.ELEMENT_SELECTED_HOVERED : elementToolSetNames.ELEMENT_HOVERED, readOnly || hoveredModel.isReadOnly());
          } else {
            addLinkTools(hoveredView, isHoveredModelSelected ? linkToolSetNames.LINK_SELECTED : linkToolSetNames.LINK_HOVERED, readOnly || hoveredModel.isReadOnly());
          }
        }
      }
    }
    destroy() {
      super.destroy();
      this.#paperScrollerResizeObserver.unobserve(this.context.paperScroller.el);
      document.removeEventListener("keydown", this.maybeCancelDrag);
    }
  };
  function onReadOnlyChange(ctx, readOnly) {
    const { graph, paper, paperScroller } = ctx;
    ctx.readOnly = readOnly;
    graph.getLinks().forEach((link) => {
      const view = link.findView(paper);
      if (view) {
        if (readOnly) {
          removeLinkSourcePlaceholder(view);
          removeLinkTargetPlaceholder(view);
        } else if (!link.isReadOnly()) {
          if (!link.getSourceCell()) {
            addLinkSourcePlaceholder(view);
          }
          if (!link.getTargetCell()) {
            addLinkTargetPlaceholder(view);
          }
        }
      }
    });
    paperScroller.adjustPaper();
  }
  function onNavVisibilityChange(ctx, visibility) {
    const { navigator: navigator2 } = ctx;
    const visible = visibility === "visible";
    ctx.navigatorVisible = visible;
    if (visible) {
      updateAllConnections(navigator2.targetPaper);
    }
  }
  function onPaperScale(ctx, sx) {
    const { locale, style, el } = ctx;
    showToast(`${locale[DiagramBuilderLocale_default.STR_ZOOM_LEVEL].replaceAll("{0}", Math.round(sx * 10) * 10)}`, {
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
      const isPlaceholderTool2 = tool instanceof Placeholder;
      if (isPlaceholderTool2) {
        if (validateDropOnPlaceholder(ctx, hoveredView, view, tool, true) === false) {
          return;
        }
      } else if (!dropConnectOnLinks || validateDropOnLink(ctx, hoveredView, view, true) === false) {
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
        case "left":
          posX = hX - LINK_LENGTH - newElW;
          posY = hY + (hElH - newElH) / 2;
          break;
        case "right":
          posX = hX + hoveredModel.size().width + LINK_LENGTH;
          posY = hY + (hElH - newElH) / 2;
          break;
        case "bottom":
          posX = hX + (hElW - newElW) / 2;
          posY = hY + hoveredModel.size().height + LINK_LENGTH;
          break;
        default:
          posX = hX + (hElW - newElW) / 2;
          posY = hY - LINK_LENGTH - newElH;
      }
      model.position(posX, posY);
      const link = paper.getDefaultLink();
      link.set({
        source: hoveredView.getLinkEnd(hoveredView.el, x, y, link, "source", side),
        target: view.getLinkEnd(view.el, x, y, link, "target", oppositeSides[side])
      });
      graph.addCell(link);
    } else {
      const tool = getToolByEl(hoveredView, e.target);
      if (isPlaceholderTool(tool)) {
        const ratio = tool.ratio;
        if (ratio === 0) {
          hoveredModel.source(model);
        } else if (ratio === 1) {
          hoveredModel.target(model);
        } else {
          addElementToLinkAtRatio(view, hoveredView, ratio);
        }
      } else {
        const ratio = hoveredView.getClosestPointRatio({ x, y });
        addElementToLinkAtRatio(view, hoveredView, ratio);
      }
    }
    snaplines.enable();
  }
  function elementSide(el, x, y) {
    const sides = ["left", "right", "top", "bottom"];
    const { width, height } = el.size();
    const y1 = height * x / width;
    const y2 = height - y1;
    return sides[x < 0 || width <= x || y < 0 || height <= y ? -1 : y < y1 ? y < y2 ? 2 : 1 : y < y2 ? 0 : 3] || "out";
  }
  function onGraphReset(ctx, { models = [] }) {
    const { paper, readOnly } = ctx;
    ctx.hoveredView = null;
    if (!readOnly) {
      models.forEach((model) => {
        if (model.isLink() && !model.isReadOnly()) {
          addLinkPlaceholders(paper, model);
        }
      });
    }
  }
  function onLinkDesignationChange(ctx, link, val) {
    const { linkDesignations, style } = ctx;
    const labels = link.labels();
    const indexDesignation = labels.findIndex((l) => "designation" in l);
    if (indexDesignation > -1 && val == null) {
      link.removeLabel(indexDesignation);
      return;
    }
    if (val) {
      let designation, tooltip, tooltipPosition;
      if (typeof val === "object") {
        ({ typeId: designation, tooltip, tooltipPosition } = val);
      } else {
        designation = val;
      }
      const cfg = linkDesignations.find((cfg2) => cfg2.typeId === designation);
      if (cfg) {
        const newDesCfg = Link.getLinkDesignationCfg({
          distance: 30,
          glyph: cfg.glyph,
          designation,
          tooltip,
          tooltipPosition,
          cls: style.linkDesignationCls || []
        });
        if (indexDesignation > -1) {
          link.label(indexDesignation, newDesCfg);
        } else {
          link.insertLabel(0, newDesCfg);
        }
      } else {
        link.designation(null);
      }
    }
  }
  function onLinkPointerUp(ctx, view, e) {
    const { action, arrowhead } = view.eventData(e);
    if (action === "arrowhead-move") {
      const { model } = view;
      if (arrowhead === "source") {
        if (!model.getSourceCell()) {
          addLinkSourcePlaceholder(view);
        } else if (hasTool(view, linkToolNames.SOURCE_PLACEHOLDER)) {
          removeLinkSourcePlaceholder(view);
        }
      } else {
        if (!model.getTargetCell()) {
          addLinkTargetPlaceholder(view);
        } else if (hasTool(view, linkToolNames.TARGET_PLACEHOLDER)) {
          removeLinkTargetPlaceholder(view);
        }
      }
    }
  }
  function onLinkSourceChange(ctx, model) {
    const { paper, readOnly } = ctx;
    const view = model.findView(paper);
    const action = view._dragData?.action;
    if (action === "arrowhead-move" || readOnly) {
      return;
    }
    if (!model.getSourceCell()) {
      addLinkSourcePlaceholder(view);
    } else if (hasTool(view, linkToolNames.SOURCE_PLACEHOLDER)) {
      removeLinkSourcePlaceholder(view);
    }
  }
  function onLinkTargetChange(ctx, model) {
    const { paper } = ctx;
    const view = model.findView(paper);
    const action = view._dragData?.action;
    if (action === "arrowhead-move") {
      return;
    }
    if (!model.getTargetCell()) {
      addLinkTargetPlaceholder(view);
    } else if (hasTool(view, linkToolNames.TARGET_PLACEHOLDER)) {
      removeLinkTargetPlaceholder(view);
    }
  }
  function onCellAdd(ctx, cell, _, { ui: ui6 }) {
    const {
      paper,
      readOnly,
      elementProps = {},
      linkProps = {}
    } = ctx;
    const props = cell.isElement() ? elementProps : linkProps;
    for (let prop in props) {
      if (Object.hasOwn(props, prop)) {
        const curr = cell.prop(prop);
        if (curr === void 0) {
          cell.prop(prop, elementProps[prop]);
        }
      }
    }
    if (cell.isElement()) {
      updateLinkRouting(ctx);
    } else if (!ui6 && !readOnly && !cell.isReadOnly()) {
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
      const keepOutbound = cell.get("onRemoveKeepOutboundLinks");
      const keepInbound = cell.get("onRemoveKeepInboundLinks");
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
      addLinkSourcePlaceholder(view);
    }
    if (!t) {
      addLinkTargetPlaceholder(view);
    }
  }
  function onPositionChange(ctx) {
    updateLinkRouting(ctx);
  }
  function onSizeChange(ctx) {
    updateLinkRouting(ctx);
  }
  function updateLinkRouting({ paper, navigator: navigator2, navigatorVisible }) {
    updateAutoRoutedConnections(paper);
    if (navigator2 && navigatorVisible) {
      updateAutoRoutedConnections(navigator2.targetPaper);
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
        el.style = "cursor: default";
      } else {
        el.querySelector('[joint-selector="wrapper"]').style = "cursor: default";
      }
    }
    ctx.hoveredView = view;
    if (usingKeyboard) {
      return;
    }
    if (style.hoverCls?.length && !stencilDraggedView) {
      const { hoverCls } = style;
      el.classList.add(...Array.isArray(hoverCls) ? hoverCls : hoverCls.split(" "));
    }
    if (model.isElement()) {
      if (dropConnectOnElements && stencilDraggedView && !model.isReadOnly()) {
        if (validateDropOnElement(ctx, view, stencilDraggedView) !== false) {
          overCellHighlightId = highlightView(view);
          addElementDropConnectDatasetFromEvent(ctx, e);
          snaplines.disable();
          snaplines.hide();
        }
      }
      if (!stencilDraggedView) {
        addElementTools(view, selected ? elementToolSetNames.ELEMENT_SELECTED_HOVERED : elementToolSetNames.ELEMENT_HOVERED, readOnly || model.isReadOnly());
      }
    } else {
      if (!model.isReadOnly()) {
        const tool = getToolByEl(view, e.target);
        if (!isPlaceholderTool(tool) && dropConnectOnLinks && stencilDraggedView) {
          if (validateDropOnLink(ctx, view, stencilDraggedView) !== false) {
            overCellHighlightId = highlightView(view);
            snaplines.disable();
            snaplines.hide();
          }
        }
      }
      if (!stencilDraggedView) {
        addLinkTools(view, selected ? linkToolSetNames.LINK_SELECTED : linkToolSetNames.LINK_HOVERED, readOnly || model.isReadOnly());
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
      } else if (ratio === 1) {
        link.target(paperDraggedElementView.model);
      } else {
        addElementToLinkAtRatio(paperDraggedElementView, view, ratio);
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
    if (draggedView) {
      if (validateDropOnPlaceholder(ctx, view, draggedView, tool) !== false) {
        tool.el.classList.add(PLACEHOLDER_ALLOW_DROP_CLS);
        tool.setColors({
          stroke: PLACEHOLDER_HIGHLIGHT_COLOR_STROKE,
          fill: PLACEHOLDER_HIGHLIGHT_COLOR_FILL,
          glyph: PLACEHOLDER_HIGHLIGHT_COLOR_GLYPH
        });
      }
    }
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
      el.style = "";
    }
    ctx.hoveredView = null;
    if (usingKeyboard) {
      return;
    }
    if (style.hoverCls?.length) {
      const { hoverCls } = style;
      el.classList.remove(...Array.isArray(hoverCls) ? hoverCls : hoverCls.split(" "));
    }
    if (model.isElement()) {
      if (dropConnectOnElements) {
        if (overCellHighlightId != null) {
          unhighlightView(view, overCellHighlightId);
        }
        snaplines.enable();
      }
      removeTools(view);
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
        addLinkTools(view, linkToolSetNames.LINK_SELECTED, readOnly || model.isReadOnly());
      } else {
        removeTools(view, true);
      }
    }
  }
  function onPaperBlankPointerDown(ctx, e, x, y) {
    const { paperScroller, keyboard } = ctx;
    if (!keyboard.isActive("shift", e)) {
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
    if (readOnly || link.isReadOnly() || !link.allow(Link.ALLOW_TARGET_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_IN) || !draggedEl.allow(Element.ALLOW_LINK_OUT)) {
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
    if (readOnly || el.isReadOnly() || !el.allow(Element.ALLOW_LINK_OUT) || !draggedEl.allow(Element.ALLOW_LINK_IN)) {
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
    } else if (ratio === 1) {
      if (!link.allow(Link.ALLOW_TARGET_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_IN)) {
        return false;
      }
    } else {
      if (!link.allow(Link.ALLOW_TARGET_CHANGE) || !draggedEl.allow(Element.ALLOW_LINK_OUT) || !draggedEl.allow(Element.ALLOW_LINK_IN)) {
        return false;
      }
    }
    return allowDropConnectOnPlaceholder(linkView, draggedView, tool, isDrop);
  }

  // images/libraries/apex/diagram-builder/utils/array.mjs
  function difference(a, b) {
    return a.filter((i) => !b.includes(i));
  }
  function unique(arr, key) {
    if (key != null) {
      return [...new Map(arr.filter(Boolean).map((item) => [item[key], item])).values()];
    }
    return [...new Set(arr)];
  }

  // images/libraries/apex/diagram-builder/DiagramBuilderSelectionMode.mjs
  var DiagramBuilderSelectionMode = {
    SINGLE: "single",
    MULTI: "multi",
    NONE: "none"
  };
  Object.freeze(DiagramBuilderSelectionMode);
  var DiagramBuilderSelectionMode_default = DiagramBuilderSelectionMode;

  // images/libraries/apex/diagram-builder/controllers/SelectionController.mjs
  var MULTI_SELECTION_BUILT_IN_ACTIONS = ["remove", "rotate", "resize"];
  var SelectionController = class extends Controller_default {
    startListening() {
      const { graph, selection, paper } = this.context;
      const { collection } = selection;
      this.context.hoveredView = null;
      this.stopListening();
      this.listenTo(graph, {
        "readonly": this.#onReadOnlyChange,
        "remove": onCellRemove2
      });
      this.listenTo(collection, {
        "reset": onSelectionReset,
        "add": onSelectionAdd,
        "remove": onSelectionRemove
      });
      this.listenTo(paper, {
        "blank:pointerdown": onBlankPointerDown,
        "cell:pointerup": onCellPointerUp,
        "cell:mouseenter": this.#onCellMouseEnter,
        "cell:mouseleave": this.#onCellMouseLeave
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
  };
  function onCellRemove2(ctx, cell) {
    const { selection } = ctx;
    const { collection } = selection;
    if (collection.has(cell)) {
      collection.remove(cell);
    }
  }
  function updateSelectionAllowTranslate(ctx) {
    const { selection } = ctx;
    const { collection } = selection;
    const disallowTranslate = collection.models.some((model) => {
      return model.isElement() && model.isReadOnly();
    });
    selection.options.allowTranslate = !disallowTranslate;
  }
  function onSelectionAdd(ctx, model, collection) {
    const { paper, selection } = ctx;
    if (collection.length === 1) {
      const cell = collection.first();
      const cellView = paper.requireView(cell);
      selectPrimaryCell(ctx, cellView);
    } else if (collection.length > 1) {
      clearSelectionTools(paper, collection.models);
      createHandles(ctx, selection, ctx.multiSelectionHandles, MULTI_SELECTION_BUILT_IN_ACTIONS);
    }
    selection.trigger("change", selection, {
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
    selection.trigger("change", selection, {
      added: [],
      removed: Array.isArray(model) ? model : [model]
    });
    updateSelectionAllowTranslate(ctx);
  }
  function onSelectionReset(ctx, collection, { previousModels }) {
    const { paper, selection } = ctx;
    const currSelModels = collection.models;
    const prevSelModels = previousModels;
    const addedModels = difference(currSelModels, prevSelModels);
    const removedModels = difference(prevSelModels, currSelModels);
    if (collection.length === 1) {
      const cell = collection.first();
      const cellView = paper.requireView(cell);
      if (cell.isLink()) {
        selection.destroySelectionBox(cell);
      }
      selectPrimaryCell(ctx, cellView);
    } else if (collection.length > 1) {
      createHandles(ctx, selection, ctx.multiSelectionHandles, MULTI_SELECTION_BUILT_IN_ACTIONS);
    }
    if (!addedModels.length && !removedModels.length) {
      return;
    }
    clearSelectionTools(paper, removedModels);
    selection.trigger("change", selection, {
      added: addedModels,
      removed: removedModels
    });
    updateSelectionAllowTranslate(ctx);
  }
  function clearSelectionTools(paper, models = []) {
    models = Array.isArray(models) ? models : [models];
    models.forEach((model) => {
      if (model.isElement()) {
        removeTools(paper.findViewByModel(model));
      } else {
        removeTools(paper.findViewByModel(model), true);
      }
    });
  }
  function onCellPointerUp(ctx, cellView, e) {
    const { model } = cellView;
    const { selection, keyboard, mode } = ctx;
    const { collection } = selection;
    const containsLink = model.isLink() || collection.find((cell) => cell.isLink());
    const isSelected = collection.includes(model);
    const selectable = model.isSelectable() && model.graph;
    if (!selectable) {
      return;
    }
    if (keyboard.isActive("ctrl meta", e)) {
      if (mode === DiagramBuilderSelectionMode_default.SINGLE) {
        if (isSelected) {
          collection.reset([]);
        } else {
          collection.reset([model]);
        }
      } else {
        if (isSelected) {
          collection.remove(model);
        } else {
          if (containsLink) {
            collection.reset([model]);
          } else {
            collection.add(model);
          }
        }
      }
    } else if (!isSelected) {
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
    if (mode === DiagramBuilderSelectionMode_default.MULTI && keyboard.isActive("shift", e)) {
      selection.startSelecting(e);
    } else {
      clearSelectionTools(paper, selection.collection.models);
      selection.collection.reset([]);
      paperScroller.startPanning(e, x, y);
    }
  }
  function selectPrimaryCell(ctx, view) {
    const { hoveredView, readOnly, paper } = ctx;
    const { model } = view;
    if (model.isElement()) {
      const name = hoveredView === view ? elementToolSetNames.ELEMENT_SELECTED_HOVERED : elementToolSetNames.ELEMENT_SELECTED;
      addElementTools(view, name, readOnly || model.isReadOnly());
    } else {
      paper.requireView(model);
      addLinkTools(view, linkToolSetNames.LINK_SELECTED, readOnly || model.isReadOnly());
    }
  }
  function createHandles(ctx, owner, wanted, builtIn) {
    const removeHandles = difference(builtIn, wanted.map((cfg) => cfg.name));
    removeHandles.forEach((handle) => owner.removeHandle(handle));
    wanted.forEach((handle) => {
      if (hasHandle(owner, handle.name)) {
        const h = getHandle(owner, handle.name);
        if (h.position !== handle.position) {
          owner.changeHandle(handle.name, { position: handle.position });
        }
      } else {
        owner.addHandle({
          name: handle.name,
          position: handle.position
        });
        owner.on(`action:${handle.name}:pointerdown`, (e) => handle.action(ctx, e));
      }
    });
  }
  function hasHandle(owner, name) {
    if (typeof owner.hasHandle === "function") {
      return owner.hasHandle(name);
    } else {
      return owner.handles?.findIndex((handle) => handle.name === name) > -1;
    }
  }
  function getHandle(owner, name) {
    if (typeof owner.getHandle === "function") {
      return owner.getHandle(name);
    } else {
      return owner.handles?.find((handle) => handle.name === name);
    }
  }

  // images/libraries/apex/diagram-builder/actions/selection.mjs
  function select(selection, models, { add = false, scrollTo = false, mode, paperScroller } = {}) {
    if (mode === DiagramBuilderSelectionMode_default.NONE) {
      return;
    }
    const { collection } = selection;
    const current = collection.models;
    models = Array.isArray(models) ? models : [models];
    const containsLink = models.findIndex((model) => model.isLink()) > -1;
    const containsElement = models.findIndex((model) => model.isElement()) > -1;
    if (containsElement && containsLink) {
      models = models.filter((model) => model.isElement());
    } else if (containsLink) {
      collection.reset([models[0]]);
      return;
    }
    if (mode === DiagramBuilderSelectionMode_default.SINGLE) {
      add = false;
      models.length = models.length ? 1 : 0;
    }
    if (add) {
      if (current.length === 1 && current[0].isLink()) {
        collection.reset(models);
      } else {
        collection.add(models);
      }
    } else {
      collection.reset(models);
    }
    if (scrollTo && paperScroller && !paperScroller.isElementVisible(models[0])) {
      paperScroller.scrollToElement(models[0], { animation: true });
    }
  }
  function deselect(selection, models) {
    const { collection } = selection;
    if (!models || !models.length) {
      collection.reset([]);
    } else {
      collection.remove(models);
    }
  }

  // images/libraries/apex/diagram-builder/DiagramBuilderKeyboardAction.mjs
  var DiagramBuilderKeyboardAction = {
    DESELECT: "deselect",
    CYCLE_UP: "cycleUp",
    CYCLE_DOWN: "cycleDown",
    CYCLING_MODE_CHANGE: "cyclingModeChange",
    CELL_MENU_SHOW: "menuShow",
    CELL_REMOVE: "cellRemove",
    SELECTION_MOVE_UP: "selMoveUp",
    SELECTION_MOVE_DOWN: "selMoveDown",
    SELECTION_MOVE_LEFT: "selMoveLeft",
    SELECTION_MOVE_RIGHT: "selMoveRight",
    PAPER_PAN_UP: "paperPanUp",
    PAPER_PAN_DOWN: "paperPanDown",
    PAPER_PAN_LEFT: "paperPanLeft",
    PAPER_PAN_RIGHT: "paperPanRight",
    ELEMENT_CONNECT_TOP_TRIGGER: "elConnectUpTrigger",
    ELEMENT_CONNECT_BOTTOM_TRIGGER: "elConnectDownTrigger",
    ELEMENT_CONNECT_LEFT_TRIGGER: "elConnectLeftTrigger",
    ELEMENT_CONNECT_RIGHT_TRIGGER: "elConnectRightTrigger",
    LINK_PLACEHOLDER_SOURCE_TRIGGER: "linkPlaceholderSourceTrigger",
    LINK_PLACEHOLDER_TARGET_TRIGGER: "linkPlaceholderTargetTrigger",
    LINK_ADD_ELEMENT_BUTTON_TRIGGER: "linkAddElementButtonTrigger",
    ZOOM_IN: "zoomIn",
    ZOOM_OUT: "zoomOut",
    ZOOM_RESET: "zoomReset"
  };
  Object.freeze(DiagramBuilderKeyboardAction);
  var DiagramBuilderKeyboardAction_default = DiagramBuilderKeyboardAction;

  // images/libraries/apex/diagram-builder/controllers/KeyboardController.mjs
  var { g: g2 } = joint;
  var BEFORE_ACTION = "beforeaction";
  var KEYBOARD_INDEX_KEY = "keyboardCycleIndex";
  var A = DiagramBuilderKeyboardAction_default;
  var functionMap = {
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
  var selectionModeNoneEnabledActions = [
    A.PAPER_PAN_DOWN,
    A.PAPER_PAN_LEFT,
    A.PAPER_PAN_RIGHT,
    A.PAPER_PAN_UP,
    A.ZOOM_IN,
    A.ZOOM_OUT,
    A.ZOOM_RESET
  ];
  var KeyboardController = class extends Controller_default {
    #usingKeyboard = false;
    startListening() {
      const {
        graph,
        keyboard,
        selectionMode,
        map = {
          "esc": A.DESELECT,
          "shift+up shift+right": A.CYCLE_UP,
          "shift+down shift+left": A.CYCLE_DOWN,
          "shift+F10": A.CELL_MENU_SHOW,
          "up": A.SELECTION_MOVE_UP,
          "down": A.SELECTION_MOVE_DOWN,
          "left": A.SELECTION_MOVE_LEFT,
          "right": A.SELECTION_MOVE_RIGHT,
          "w": A.PAPER_PAN_UP,
          "s": A.PAPER_PAN_DOWN,
          "a": A.PAPER_PAN_LEFT,
          "d": A.PAPER_PAN_RIGHT,
          "i": [A.ELEMENT_CONNECT_TOP_TRIGGER, A.LINK_ADD_ELEMENT_BUTTON_TRIGGER],
          "k": [A.ELEMENT_CONNECT_BOTTOM_TRIGGER, A.LINK_ADD_ELEMENT_BUTTON_TRIGGER],
          "j": [A.ELEMENT_CONNECT_LEFT_TRIGGER, A.LINK_PLACEHOLDER_SOURCE_TRIGGER],
          "l": [A.ELEMENT_CONNECT_RIGHT_TRIGGER, A.LINK_PLACEHOLDER_TARGET_TRIGGER],
          "delete backspace": A.CELL_REMOVE,
          "shift+c": A.CYCLING_MODE_CHANGE,
          "ctrl+plus meta+plus": A.ZOOM_IN,
          "ctrl+minus meta+minus": A.ZOOM_OUT,
          "ctrl+0 meta+0": A.ZOOM_RESET
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
        "readonly": onReadOnlyChange2,
        "add remove reset": onGraphChange,
        "change:source change:target": onLinkChange
      });
      let finShortcuts = {};
      for (let prop in map) {
        if (Object.hasOwn(map, prop)) {
          let action = map[prop];
          if (Array.isArray(action)) {
            const actions = action.filter((a) => {
              if (selectionMode === "none" && !selectionModeNoneEnabledActions.includes(a)) {
                return false;
              }
              return functionMap[a];
            });
            const len = actions.length;
            if (len === 1) {
              finShortcuts[prop] = functionMap[actions[0]];
            } else if (len > 1) {
              finShortcuts[prop] = (ctx, e) => {
                actions.forEach((action2) => functionMap[action2].call(this, ctx, e));
              };
            }
          } else if (functionMap[action]) {
            if (selectionMode === "none" && !selectionModeNoneEnabledActions.includes(action)) {
              continue;
            }
            finShortcuts[prop] = functionMap[action];
          }
        }
      }
      if (selectionMode === "multi") {
        Object.assign(finShortcuts, {
          "keydown:shift": onShiftDown,
          "keyup:shift": onShiftUp
        });
      }
      this.listenTo(keyboard, finShortcuts);
      this.useMouse = this.useMouse.bind(this);
    }
    setUsingKeyboard(bool) {
      if (this.#usingKeyboard !== bool) {
        this.#usingKeyboard = bool;
        this.trigger("change:usage", this, bool);
        if (bool) {
          document.addEventListener("mousemove", this.useMouse);
        }
      }
    }
    useMouse() {
      this.setUsingKeyboard(false);
      document.removeEventListener("mousemove", this.useMouse);
    }
    destroy() {
      super.destroy();
      document.removeEventListener("mousemove", this.useMouse);
    }
  };
  function onReadOnlyChange2(ctx, readOnly) {
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
    if (action !== "arrowhead-move") {
      reindex(ctx);
    }
  }
  function processKeyboardAction(ctx, fn, e) {
    const { keyboardController } = ctx;
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
    processKeyboardAction(ctx, onSelectionMoveUp, e) && moveSelection(ctx, "up", e);
  }
  function onSelectionMoveDown(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveDown, e) && moveSelection(ctx, "down", e);
  }
  function onSelectionMoveLeft(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveLeft, e) && moveSelection(ctx, "left", e);
  }
  function onSelectionMoveRight(ctx, e) {
    processKeyboardAction(ctx, onSelectionMoveRight, e) && moveSelection(ctx, "right", e);
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
      case "up":
        dy = -step;
        break;
      case "down":
        dy = step;
        break;
      case "left":
        dx = -step;
        break;
      case "right":
        dx = step;
        break;
    }
    if (modelCount) {
      const { models } = collection;
      const stop = models.some((model) => model.isReadOnly());
      if (!stop) {
        const paperScale = paper.scale();
        selection.translateSelectedElements(dx, dy, { keyboard: true });
        const wrapper = selection.$selectionWrapper[0];
        let { left = 0, top = 0 } = wrapper.style;
        left = parseFloat(left);
        top = parseFloat(top);
        wrapper.style.left = `${left + dx * paperScale.sx}px`;
        wrapper.style.top = `${top + dy * paperScale.sy}px`;
        if (modelCount === 1 && !paperScroller.isElementVisible(models[0], { strict: false })) {
          scrollIntoView(paperScroller, models[0], { animation: false, center: false });
        } else {
          const selectionBBox = g2.Rect.fromRectUnion(...models.reduce((all, cell) => {
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
              case "up":
                elsTouchingSelectionEdge = models.filter((model) => {
                  const { y, height } = model.getBBox();
                  return y + height === sy + sHeight;
                });
                break;
              case "down":
                elsTouchingSelectionEdge = models.filter((model) => {
                  const { y } = model.getBBox();
                  return y === sy;
                });
                break;
              case "left":
                elsTouchingSelectionEdge = models.filter((model) => {
                  const { x, width } = model.getBBox();
                  return x + width === sx + sWidth;
                });
                break;
              case "right":
                elsTouchingSelectionEdge = models.filter((model) => {
                  const { x } = model.getBBox();
                  return x === sx;
                });
                break;
            }
            if (elsTouchingSelectionEdge.length) {
              const scrollToEl = elsTouchingSelectionEdge.reduce((prev, curr) => {
                const currDistance = visibleAreaCenter.distance(curr.getBBox().center());
                const prevDistance = visibleAreaCenter.distance(prev.getBBox().center());
                return currDistance < prevDistance ? curr : prev;
              }, elsTouchingSelectionEdge[0]);
              scrollIntoView(paperScroller, scrollToEl, { animation: false, center: false });
            }
          }
        }
      }
    }
  }
  function onPanUp(ctx, e) {
    processKeyboardAction(ctx, onPanUp, e) && pan(ctx, "up", e);
  }
  function onPanDown(ctx, e) {
    processKeyboardAction(ctx, onPanDown, e) && pan(ctx, "down", e);
  }
  function onPanLeft(ctx, e) {
    processKeyboardAction(ctx, onPanLeft, e) && pan(ctx, "left", e);
  }
  function onPanRight(ctx, e) {
    processKeyboardAction(ctx, onPanRight, e) && pan(ctx, "right", e);
  }
  function pan(ctx, dir, e) {
    const { paper, paperScroller, keyboardController } = ctx;
    const step = paper.options.gridSize || 1;
    const currentCenter = paperScroller.getVisibleArea().center();
    let dx = 0, dy = 0;
    keyboardController.setUsingKeyboard(true);
    e.preventDefault();
    switch (dir) {
      case "up":
        dy = -step;
        break;
      case "down":
        dy = step;
        break;
      case "left":
        dx = -step;
        break;
      case "right":
        dx = step;
        break;
    }
    const newCenter = currentCenter.translate(dx, dy);
    const scale2 = paperScroller.zoom();
    paperScroller.scroll(newCenter.x * scale2, newCenter.y * scale2);
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
        fnName = "getElements";
        break;
      case KeyboardController.CYCLE_LINKS:
        fnName = "getLinks";
        break;
      default:
        fnName = "getCells";
    }
    const filtered = graph[fnName]().filter((cell) => cell.isSelectable());
    ctx.cellCache = filtered.sort((a, b) => {
      return a.prop(KEYBOARD_INDEX_KEY) - b.prop(KEYBOARD_INDEX_KEY);
    });
  }
  function reindex(ctx) {
    const { graph, cyclingMode: mode } = ctx;
    let index = 0;
    const topLevelElements = graph.getElements().filter((el) => {
      const outgoing = graph.getConnectedLinks(el, { inbound: true });
      return !outgoing.length;
    });
    topLevelElements.forEach((topEl) => {
      graph.bfs(topEl, (el) => {
        if (mode !== KeyboardController.CYCLE_LINKS) {
          el.prop(KEYBOARD_INDEX_KEY, index);
          index += 1;
        } else {
          el.unset(KEYBOARD_INDEX_KEY, { silent: true });
        }
        const links = graph.getConnectedLinks(el, { outbound: true });
        links.forEach((link) => {
          if (mode !== KeyboardController.CYCLE_ELEMENTS) {
            link.prop(KEYBOARD_INDEX_KEY, index);
            index += 1;
          } else {
            link.unset(KEYBOARD_INDEX_KEY, { silent: true });
          }
        });
      });
    });
  }
  function onCycleUp(ctx, e) {
    const { cellCache } = ctx;
    if (cellCache.length > 0) {
      processKeyboardAction(ctx, onCycleUp, e) && cycle(ctx, "up", e);
    }
  }
  function onCycleDown(ctx, e) {
    const { cellCache } = ctx;
    if (cellCache.length > 0) {
      processKeyboardAction(ctx, onCycleDown, e) && cycle(ctx, "down", e);
    }
  }
  function cycle(ctx, dir = "up", e) {
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
      index = cells.indexOf(startingCell) + (dir === "up" ? 1 : -1);
      index = index >= cells.length ? 0 : index < 0 ? index = cells.length - 1 : index;
      while (collection.has(cell = cells[index])) {
        index += 1;
      }
    }
    if (!cell) {
      cell = dir === "up" ? cells[0] : cells[cells.length - 1];
    }
    select(selection, cell);
    scrollIntoView(paperScroller, cell);
  }
  function onElementConnectTop(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, "top", onElementConnectTop, e);
  }
  function onElementConnectBottom(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, "bottom", onElementConnectBottom, e);
  }
  function onElementConnectLeft(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, "left", onElementConnectLeft, e);
  }
  function onElementConnectRight(ctx, e) {
    selectionIsElement(ctx) && triggerElementConnect(ctx, "right", onElementConnectRight, e);
  }
  function triggerElementConnect(ctx, which, caller, e) {
    const { selection, paper, keyboardController } = ctx;
    const { collection } = selection;
    keyboardController.setUsingKeyboard(true);
    e.preventDefault();
    const model = collection.at(0);
    const view = model.findView(paper);
    const connectTool = getToolBy(view, (view2, tool) => {
      return tool instanceof Connect && tool.options.position === which;
    });
    if (connectTool && processKeyboardAction(ctx, caller, e)) {
      paper.requireView(model);
      const { position, x, y } = connectTool.options;
      view.notify("element:connectbutton:keyboardtrigger", connectTool, position, { x, y }, e);
    }
  }
  function onLinkPlaceholderSourceTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, "source", onLinkPlaceholderSourceTrigger, e);
  }
  function onLinkPlaceholderTargetTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, "target", onLinkPlaceholderTargetTrigger, e);
  }
  function onLinkAddElementButtonTrigger(ctx, e) {
    selectionIsLink(ctx) && triggerLinkAdd(ctx, "addelementbutton", onLinkAddElementButtonTrigger, e);
  }
  function triggerLinkAdd(ctx, which, caller, e) {
    const { paper, selection, keyboardController } = ctx;
    keyboardController.setUsingKeyboard(true);
    e.preventDefault();
    const model = selection.collection.at(0);
    const Ctor = which === "source" ? SourcePlaceholder : which === "target" ? TargetPlaceholder : AddElementButton;
    const view = model.findView(paper);
    const tool = getToolBy(view, (view2, tool2) => {
      return tool2 instanceof Ctor;
    });
    if (tool && processKeyboardAction(ctx, caller, e)) {
      paper.requireView(model);
      if (which === "source" || which === "target") {
        view.notify("link:placeholder:keyboardtrigger", tool, tool.ratio, tool.getLinkPoint(), e);
      } else {
        view.notify("link:addelement:keyboardtrigger", tool, tool.getLinkPoint(), e);
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
    if (models[0].isLink()) {
      if (canRemoveLinks(models)) {
        removeCells(graph, models);
      }
    } else if (canRemoveElements(models)) {
      removeCells(graph, models);
    }
  }
  function onShiftDown(ctx) {
    const { paperScroller } = ctx;
    paperScroller.setCursor("crosshair");
  }
  function onShiftUp(ctx) {
    const { paperScroller } = ctx;
    paperScroller.setCursor("grab");
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
      const tool = getToolBy(view, (view2, tool2) => {
        return tool2 instanceof Menu;
      });
      if (tool) {
        paper.requireView(model);
        view.notify("cell:menubutton:keyboardtrigger", tool, e);
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
    CYCLE_LINKS: "cycleLinks",
    CYCLE_ELEMENTS: "cycleElements",
    CYCLE_CELLS: "cycleCells"
  });

  // images/libraries/apex/diagram-builder/cells/elements/CircleElement.mjs
  var CircleElement = class extends ShapeElement {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "rect",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "circle",
          selector: "decorationBackground"
        }, {
          tagName: "circle",
          selector: "decorationPattern"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }, {
        tagName: "text",
        selector: "label"
      }, {
        tagName: "text",
        selector: "statusIcon"
      }];
    }
    defaults() {
      const superDef = super.defaults();
      return {
        ...superDef,
        type: "apex.Circle",
        attrs: {
          ...superDef.attrs,
          decorationBackground: {
            cx: 30,
            cy: 30,
            r: 30,
            fill: "#aaa"
          },
          decorationPattern: {
            cx: 30,
            cy: 30,
            r: 30,
            fill: "#aaa"
          }
        }
      };
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/ElementView.mjs
  var { dia: dia5, g: g3 } = joint;
  var ElementView = class extends dia5.ElementView {
    initialize() {
      super.initialize(...arguments);
      const model = this.model;
      const typeId = model.prop("typeId");
      const typeLower = model.get("type").toLowerCase();
      const [prefix, elementShape] = typeLower.split(".");
      let cls = model.prop("cls");
      cls = cls ? Array.isArray(cls) ? cls : cls.split(" ") : [];
      cls = cls.map((name) => name.replaceAll("{0}", prefix).replaceAll("{1}", elementShape));
      const el = this.el;
      const classList = el.classList;
      classList.add(`${typeLower.replaceAll(".", "-")}-element`);
      if (cls.length) {
        classList.add(...cls);
      }
      const filters = model.get("filters");
      if (filters?.length) {
        el.setAttribute("filter", filters.reduce((prev, curr) => `${prev} url(#${curr})`, ""));
      }
      el.dataset.typeId = typeId;
    }
    getChildEl(jointSelector) {
      return this.el.querySelector(`[joint-selector="${jointSelector}"]`);
    }
    // override to translate the link whose source == target (this el) together with the el
    drag(e) {
      super.drag(...arguments);
      const { model } = this;
      const { graph } = model;
      const { x, y } = model.position();
      const data = this.eventData(e);
      const { initialPosition, lastPosition } = data;
      const dx = x - (lastPosition != null ? lastPosition.x : initialPosition.x);
      const dy = y - (lastPosition != null ? lastPosition.y : initialPosition.y);
      if (dx || dy) {
        const connectedLinks = graph.getConnectedLinks(model);
        connectedLinks.forEach(function(link) {
          const sourceEl = link.getSourceElement();
          const targetEl = link.getTargetElement();
          if (sourceEl && sourceEl === targetEl) {
            link.translate(dx, dy);
          }
        });
      }
      this.eventData(e, {
        lastPosition: { x, y }
      });
    }
    // override to be able to pass the source of the newly created link (passing down side param)
    dragLinkStart(evt, magnet, x, y, side) {
      this.model.startBatch("add-link");
      const linkView = this.addLinkFromMagnet(magnet, x, y, side);
      linkView.notifyPointerdown(evt, x, y);
      linkView.eventData(evt, linkView.startArrowheadMove("target", { whenNotAllowed: "remove" }));
      this.eventData(evt, { linkView });
    }
    // override to be able to pass the source of the newly created link (passing down side param)
    addLinkFromMagnet(magnet, x, y, side) {
      const paper = this.paper;
      const graph = paper.model;
      const link = paper.getDefaultLink(this, magnet);
      link.set({
        source: this.getLinkEnd(magnet, x, y, link, "source", side),
        target: { x, y }
      }).addTo(graph, {
        async: false,
        ui: true
      });
      return link.findView(paper);
    }
    // getLinkEnd: passes ...args - no need to do anything to pass the side
    // override to be able to pass the source of the newly created link (passing down side param)
    customizeLinkEnd(end, magnet, x, y, link, endType, side) {
      const { paper } = this;
      const { connectionStrategy } = paper.options;
      if (typeof connectionStrategy === "function") {
        const strategy = connectionStrategy.call(paper, end, this, magnet, new g3.Point(x, y), link, endType, paper, side);
        if (strategy) {
          return strategy;
        }
      }
      return end;
    }
  };
  var ElementView_default = ElementView;

  // images/libraries/apex/diagram-builder/cells/elements/ShapeView.mjs
  var ShapeView = class extends ElementView_default {
  };

  // images/libraries/apex/diagram-builder/cells/elements/CircleElementView.mjs
  var CircleView = class extends ShapeView {
  };

  // images/libraries/apex/diagram-builder/cells/elements/RectElement.mjs
  var RectElement = class extends ShapeElement {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "rect",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "path",
          selector: "decorationPattern"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }, {
        tagName: "text",
        selector: "label"
      }, {
        tagName: "text",
        selector: "statusIcon"
      }];
    }
    defaults() {
      const superDef = super.defaults();
      const width = 60;
      const radius = ShapeElement.CORNER_RADIUS;
      const d = `M ${radius} 0 L ${width} 0 L ${width} calc(h) L ${radius} calc(h) C ${radius} calc(h) 0 calc(h) 0 calc(h - ${radius}) L 0 ${radius} C 0 ${radius} 0 0 ${radius} 0`;
      return {
        ...superDef,
        type: "apex.Rect",
        attrs: {
          ...superDef.attrs,
          decoration: {
            height: "calc(h)",
            width
          },
          decorationBackground: {
            ...superDef.attrs.decorationBackground,
            d,
            fill: "var(--a-diagram-element-rect-background-color, #aaa)"
          },
          decorationPattern: {
            ...superDef.attrs.decorationPattern,
            d
          }
        }
      };
    }
    changeToRtl(attrs) {
      super.changeToRtl(attrs);
      const width = 60;
      const radius = ShapeElement.CORNER_RADIUS;
      const d = `M 0 0 L ${width - radius} 0 C ${width} 0 ${width} 6 ${width} 6 L ${width} calc(h - ${radius}) C ${width} calc(h) ${width - radius} calc(h) ${width - radius} calc(h) L 0 calc(h) L 0 0`;
      attrs.decoration.transform = "translate(calc(w - 60) 0)";
      attrs.decorationBackground.d = d;
      attrs.decorationPattern.d = d;
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/RectElementView.mjs
  var RectElementView = class extends ShapeView {
  };

  // images/libraries/apex/diagram-builder/cells/elements/DiamondElement.mjs
  var DiamondElement = class extends ShapeElement {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "rect",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "path",
          selector: "decorationPattern"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }, {
        tagName: "text",
        selector: "label"
      }, {
        tagName: "text",
        selector: "statusIcon"
      }];
    }
    defaults() {
      const superDef = super.defaults();
      const path = "M 34.2 1.9 L 58.1 25.8 C 58.1 25.8 62.4 30 58.1 34.2 L 34.2 58.1 C 34.2 58.1 30 62.4 25.8 58.1 L 1.9 34.2 C 1.9 34.2 -2.4 30 1.9 25.8 L 25.8 1.9 C 25.8 1.9 30 -2.4 34.2 1.9";
      return {
        ...superDef,
        type: "apex.Diamond",
        attrs: {
          ...superDef.attrs,
          decorationBackground: {
            ...superDef.attrs.decorationBackground,
            d: path,
            fill: "var(--a-diagram-element-diamond-background-color, #aaa)"
          },
          decorationPattern: {
            ...superDef.attrs.decorationPattern,
            d: path
          }
        }
      };
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/DiamondElementView.mjs
  var { g: g4, V: V3 } = joint;
  var DiamondElementView = class extends ShapeView {
    // Override. Because our rounded diamond is not EXACTLY sitting at the very edge of the element,
    // the very small decimal numbers are sometimes throwing the orthogonal routing off. We could
    // either use the model-size by returning getBBox({ useModelGeometry: true }) our round the values
    // in getNodeBBox().
    getNodeBBox(magnet) {
      const r = Math.round;
      const { x, y, width, height } = this.getNodeBoundingRect(magnet);
      const rect = new g4.Rect(r(x), r(y), r(width), r(height));
      const transformMatrix = this.getRootTranslateMatrix().multiply(this.getNodeRotateMatrix(magnet));
      const magnetMatrix = this.getNodeMatrix(magnet);
      return V3.transformRect(rect, transformMatrix.multiply(magnetMatrix));
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/TerminatorElement.mjs
  var TerminatorElement = class extends Element {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "circle",
        selector: "body"
      }, {
        tagName: "text",
        selector: "glyph"
      }, {
        tagName: "g",
        selector: "statusIconContainer",
        children: [{
          tagName: "circle",
          selector: "statusIconBackground"
        }, {
          tagName: "text",
          selector: "statusIcon"
        }]
      }];
      Object.defineProperty(this, "safari", {
        value: isSafari(),
        enumerable: true
      });
    }
    defaults() {
      const safari = this.safari;
      return {
        ...super.defaults(),
        type: "apex.Terminator",
        size: { width: 60, height: 60 },
        attrs: {
          body: {
            cx: "calc(h / 2)",
            cy: "calc(h / 2)",
            r: "calc(h / 2)",
            fill: "var(--a-diagram-element-terminator-background-color, #000)"
          },
          glyph: {
            text: "",
            fontFamily: "apex-5-icon-font",
            fontSize: "calc(h / 2)",
            width: "calc(h)",
            x: "calc(h / 2)",
            y: "calc(h / 2)",
            textAnchor: "middle",
            ...!safari && { dominantBaseline: "central" },
            ...safari && { textVerticalAnchor: "middle" },
            fill: "var(--a-diagram-element-terminator-text-color, #fff)"
          },
          statusIconContainer: {
            display: "none",
            transform: "translate(calc(w - 10) 10)"
          },
          statusIconBackground: {
            x: 10,
            y: 10,
            r: 10,
            fill: "var(--a-diagram-element-terminator-text-color, #fff)",
            stroke: "var(--a-diagram-element-terminator-background-color, #000)"
          },
          statusIcon: {
            text: "",
            fontFamily: "apex-5-icon-font",
            fontSize: 14,
            width: 20,
            x: 0,
            y: 0,
            textAnchor: "middle",
            ...!safari && { dominantBaseline: "central" },
            ...safari && { textVerticalAnchor: "middle" },
            fill: "#000000"
          }
        }
      };
    }
    changeToRtl(attrs) {
      attrs.statusIconContainer.transform = "translate(10 10)";
    }
    statusIcon(icon = "") {
      if (arguments.length) {
        icon = icon == null ? "" : icon;
        this.attr("statusIconContainer/display", icon === "" ? "none" : "");
        return this.attr("statusIcon/text", icon);
      }
      return this.attr("statusIcon/text");
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/TerminatorElementView.mjs
  var TerminatorElementView = class extends ElementView_default {
  };

  // images/libraries/apex/diagram-builder/cells/elements/UnconfiguredElement.mjs
  var UnconfiguredElement = class extends ShapeElement {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "rect",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "path",
          selector: "decorationPattern"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }, {
        tagName: "text",
        selector: "label"
      }, {
        tagName: "text",
        selector: "statusIcon"
      }];
    }
    defaults() {
      const superDef = super.defaults();
      const width = 60;
      const radius = ShapeElement.CORNER_RADIUS;
      const d = `M ${radius} 0 L ${width} 0 L ${width} calc(h) L ${radius} calc(h) C ${radius} calc(h) 0 calc(h) 0 calc(h - ${radius}) L 0 ${radius} C 0 ${radius} 0 0 ${radius} 0`;
      return {
        ...superDef,
        type: "apex.Unconfigured",
        attrs: {
          ...superDef.attrs,
          decoration: {
            height: "calc(h)",
            width
          },
          decorationBackground: {
            ...superDef.attrs.decorationBackground,
            d,
            fill: "#eee",
            stroke: "#aaa",
            strokeWidth: 1,
            strokeDasharray: "3,3"
          },
          decorationPattern: {
            ...superDef.attrs.decorationPattern,
            d
          },
          body: {
            ...superDef.attrs.body,
            stroke: "#aaa",
            strokeWidth: 1,
            strokeDasharray: "3,3"
          },
          label: {
            ...superDef.attrs.label,
            fill: "#aaa"
          },
          glyph: {
            ...superDef.attrs.glyph,
            fill: "#aaa"
          }
        }
      };
    }
    changeToRtl(attrs) {
      super.changeToRtl(attrs);
      const width = 60;
      const radius = ShapeElement.CORNER_RADIUS;
      const d = `M 0 0 L ${width - radius} 0 C ${width} 0 ${width} 6 ${width} 6 L ${width} calc(h - ${radius}) C ${width} calc(h) ${width - radius} calc(h) ${width - radius} calc(h) L 0 calc(h) L 0 0`;
      attrs.decoration.transform = "translate(calc(w - 60) 0)";
      attrs.decorationBackground.d = d;
      attrs.decorationPattern.d = d;
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/UnconfiguredElementView.mjs
  var UnconfiguredElementView = class extends ShapeView {
  };

  // images/libraries/apex/diagram-builder/cells/elements/ElementSmall.mjs
  var { dia: dia6 } = joint;
  var ElementSmall = class extends dia6.Element {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }];
    }
    defaults() {
      return {
        ...super.defaults,
        type: "apex.BaseSmall",
        size: {
          width: 60,
          height: 60
        },
        attrs: {
          decorationBackground: {
            width: "calc(h)",
            height: "calc(h)",
            fill: "#aaa"
          },
          glyph: {
            text: "\uEC01",
            fontFamily: "apex-5-icon-font",
            fontSize: "calc(h / 2.5)",
            width: "calc(h)",
            x: "calc(h / 2)",
            y: "calc(h / 2)",
            textAnchor: "middle",
            textVerticalAnchor: "middle",
            fill: "#fff"
          }
        }
      };
    }
    glyph(unicode = "") {
      if (arguments.length) {
        return this.attr("glyph/text", unicode);
      }
      return this.attr("glyph/text");
    }
    glyphColor(color = "#ffffff") {
      if (arguments.length) {
        return this.attr("glyph/fill", color);
      }
      return this.attr("glyph/fill");
    }
    decorationBackgroundColor(color = "#eee") {
      if (arguments.length) {
        return this.attr("decorationBackground/fill", color);
      }
      return this.attr("decorationBackground/fill");
    }
  };
  var ElementSmall_default = ElementSmall;

  // images/libraries/apex/diagram-builder/cells/elements/CircleElementSmall.mjs
  var CircleElementSmall = class extends ElementSmall_default {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "path",
        selector: "body"
      }, {
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "circle",
          selector: "decorationBackground"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }];
    }
    defaults() {
      const superDef = super.defaults();
      return {
        ...superDef,
        type: "apex.CircleSmall",
        attrs: {
          ...superDef.attrs,
          decorationBackground: {
            cx: "calc(h / 2)",
            cy: "calc(h / 2)",
            r: "calc(h / 2)",
            fill: "#aaa"
          }
        }
      };
    }
  };
  var CircleElementSmall_default = CircleElementSmall;

  // images/libraries/apex/diagram-builder/cells/elements/DiamondElementSmall.mjs
  var DiamondElementSmall = class extends ElementSmall_default {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "path",
          selector: "decorationBackground"
        }, {
          tagName: "text",
          selector: "statusIcon"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }];
    }
    defaults() {
      const superDef = super.defaults();
      return {
        ...superDef,
        type: "apex.DiamondSmall",
        attrs: {
          ...superDef.attrs,
          decorationBackground: {
            ...superDef.attrs.decorationBackground,
            d: "M 0 calc(h / 2) L calc(w / 2) 0 L calc(w) calc(h / 2) L calc(w / 2) calc(h) Z"
          }
        }
      };
    }
  };

  // images/libraries/apex/diagram-builder/cells/elements/RectElementSmall.mjs
  var RectElementSmall = class extends ElementSmall_default {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "g",
        selector: "decoration",
        children: [{
          tagName: "rect",
          selector: "decorationBackground"
        }, {
          tagName: "text",
          selector: "statusIcon"
        }, {
          tagName: "text",
          selector: "glyph"
        }]
      }];
    }
    defaults() {
      const superDef = super.defaults();
      return {
        ...superDef,
        type: "apex.RectSmall",
        attrs: {
          ...superDef.attrs,
          decorationBackground: {
            ...superDef.attrs.decorationBackground,
            width: "calc(w)",
            height: "calc(h)"
          }
        }
      };
    }
  };

  // images/libraries/apex/diagram-builder/cells/links/SingleLink.mjs
  var COLOR_NORMAL = "var(--a-diagram-link-border-color, #666)";
  var COLOR_ERROR = "var(--a-palette-danger, #f00)";
  var COLOR_ROUTE = "var(--a-diagram-route-default, #808080)";
  var SingleLink = class extends Link {
    preinitialize() {
      super.preinitialize(...arguments);
      this.markup = [{
        tagName: "path",
        selector: "wrapper",
        attributes: {
          "fill": "none",
          "cursor": "pointer",
          "stroke": "transparent",
          "stroke-linecap": "round"
        }
      }, {
        tagName: "path",
        selector: "line",
        attributes: {
          "fill": "none",
          "pointer-events": "none"
        }
      }, {
        tagName: "path",
        selector: "offsetConnector"
      }];
    }
    constructor() {
      super(...arguments);
      if (this.prop("error")) {
        this.attr("line/stroke", COLOR_ERROR);
        this.attr("line/targetMarker/stroke", COLOR_ERROR);
      }
    }
    defaults() {
      return {
        ...super.defaults,
        type: "apex.SingleLink",
        designation: null,
        attrs: {
          ...super.defaults.attrs,
          line: {
            ...super.defaults.attrs.line,
            stroke: COLOR_NORMAL,
            targetMarker: {
              type: "path",
              stroke: COLOR_NORMAL,
              "stroke-width": 2,
              fill: "none",
              d: "M 6 -6 L 0 0 L 6 6"
            }
          },
          offsetConnector: {
            d: "M 0 0 0 -30",
            stroke: COLOR_NORMAL,
            strokeDasharray: "4 4",
            "stroke-width": 2
          }
        }
      };
    }
    error(b) {
      if (!arguments.length) {
        return this.prop("error") || false;
      } else {
        this.prop("error", b);
        const color = b ? COLOR_ERROR : COLOR_NORMAL;
        this.attr("line/stroke", color);
        this.attr("line/targetMarker/stroke", color);
      }
    }
    route(b, color = COLOR_ROUTE) {
      if (b) {
        this.attr({
          line: {
            stroke: color,
            "stroke-width": 4,
            targetMarker: {
              stroke: color,
              fill: color,
              d: "M 11 -7 L -3 0 L 11 7Z"
            }
          }
        });
      } else {
        this.attr({
          line: {
            "stroke-width": 2,
            targetMarker: {
              fill: "none",
              d: "M 6 -6 L 0 0 L 6 6"
            }
          }
        });
        this.error() ? this.error(true) : this.error(false);
      }
    }
    designation(des) {
      if (!arguments.length) {
        return this.prop("designation");
      } else {
        this.prop("designation", des);
      }
    }
    offsetConnectorRatio(ratio, distance = 0) {
      if (!arguments.length) {
        return this.attr("offsetConnector/atConnectionRatio");
      }
      this.removeAttr("offsetConnector/atConnectionLength");
      this.attr("offsetConnector/atConnectionRatio", ratio);
      this.attr("offsetConnector/d", `M 0 0 0 ${distance}`);
    }
    offsetConnectorLength(length, distance = 0) {
      if (!arguments.length) {
        return this.attr("offsetConnector/atConnectionLength");
      }
      this.removeAttr("offsetConnector/atConnectionRatio");
      this.attr("offsetConnector/atConnectionLength", length);
      this.attr("offsetConnector/d", `M 0 0 0 ${distance}`);
    }
  };

  // images/libraries/apex/diagram-builder/cells/links/SingleLinkView.mjs
  var { dia: dia7, g: g5, util: util6, V: V4 } = joint;
  var Flags = {
    TOOLS: dia7.CellView.Flags.TOOLS,
    RENDER: "RENDER",
    UPDATE: "UPDATE",
    LABELS: "LABELS",
    SOURCE: "SOURCE",
    TARGET: "TARGET",
    CONNECTOR: "CONNECTOR"
  };
  var SingleLinkView = class extends dia7.LinkView {
    initialize() {
      super.initialize(...arguments);
      const model = this.model;
      const typeLower = model.get("type").toLowerCase();
      const [prefix, linkType] = typeLower.split(".");
      let cls = model.prop("cls");
      cls = cls ? Array.isArray(cls) ? cls : cls.split(" ") : [];
      cls = cls.map((name) => name.replaceAll("{0}", prefix).replaceAll("{1}", linkType));
      const el = this.el;
      const classList = el.classList;
      classList.add(`${typeLower.replaceAll(".", "-")}-link`);
      if (cls.length) {
        classList.add(...cls);
      }
      if (isSafari()) {
        this.listenTo(model, "change:attrs", () => {
          el.style.display = "none";
          requestAnimationFrame(() => el.style.display = "");
        });
      }
    }
    onRender() {
      super.onRender(...arguments);
      this.hideOffsetConnector();
    }
    addCls(cls) {
      this.el.classList.add(cls);
    }
    removeCls(cls) {
      this.el.classList.remove(cls);
    }
    showOffsetConnector() {
      const connectorEl = this.findNode("offsetConnector");
      connectorEl.style.display = "";
    }
    hideOffsetConnector() {
      const connectorEl = this.findNode("offsetConnector");
      connectorEl.style.display = "none";
    }
    renderLabels() {
      const cache = this._V;
      const labelCache = this._labelCache = {};
      const labelSelectors = this._labelSelectors = {};
      const model = this.model;
      const labels = model.attributes.labels || [];
      const labelsCount = labels.length;
      let vLabels = cache.labels;
      if (labelsCount === 0) {
        if (vLabels) {
          vLabels.remove();
        }
        return this;
      }
      if (vLabels) {
        vLabels.empty();
      } else {
        vLabels = cache.labels = V4("g").addClass("labels");
        if (this.options.labelsLayer) {
          vLabels.addClass(util6.addClassNamePrefix(util6.result(this, "className")));
          vLabels.attr("model-id", model.id);
        }
      }
      for (let i = 0; i < labelsCount; i++) {
        const label2 = labels[i];
        const labelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(label2.markup));
        let labelNode;
        let selectors;
        if (labelMarkup) {
          labelNode = labelMarkup.node;
          selectors = labelMarkup.selectors;
        } else {
          const builtinDefaultLabel = model._builtins.defaultLabel;
          const builtinDefaultLabelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(builtinDefaultLabel.markup));
          const defaultLabel = model._getDefaultLabel();
          const defaultLabelMarkup = this._normalizeLabelMarkup(this._getLabelMarkup(defaultLabel.markup));
          const defaultMarkup = defaultLabelMarkup || builtinDefaultLabelMarkup;
          labelNode = defaultMarkup.node;
          selectors = defaultMarkup.selectors;
        }
        labelNode.setAttribute("label-idx", i);
        if (label2.cls) {
          const cls = Array.isArray(label2.cls) ? label2.cls : label2.cls.split(" ");
          labelNode.classList.add(...cls);
        }
        if (label2.designation) {
          labelNode.dataset.designation = label2.designation;
        }
        vLabels.append(labelNode);
        labelCache[i] = labelNode;
        const rootSelector = this.selector;
        if (selectors[rootSelector]) {
          throw new Error("dia.LinkView: ambiguous label root selector.");
        }
        selectors[rootSelector] = labelNode;
        labelSelectors[i] = selectors;
      }
      if (!vLabels.parent()) {
        this.mountLabels();
      }
      this.updateLabels();
      return this;
    }
    updateLabels() {
      if (!this._V.labels) {
        return this;
      }
      const model = this.model;
      const labels = model.get("labels") || [];
      const canLabelMove = this.can("labelMove");
      const builtinDefaultLabel = model._builtins.defaultLabel;
      const builtinDefaultLabelAttrs = builtinDefaultLabel.attrs;
      const defaultLabel = model._getDefaultLabel();
      const defaultLabelMarkup = defaultLabel.markup;
      const defaultLabelAttrs = defaultLabel.attrs;
      const defaultLabelSize = defaultLabel.size;
      for (let i = 0, n = labels.length; i < n; i++) {
        const labelNode = this._labelCache[i];
        if (this.isDesignationLabel(labelNode)) {
          labelNode.setAttribute("cursor", "pointer");
        } else {
          labelNode.setAttribute("cursor", canLabelMove ? "move" : "default");
        }
        const selectors = this._labelSelectors[i];
        const label2 = labels[i];
        const labelMarkup = label2.markup;
        const labelAttrs = label2.attrs;
        const labelSize = label2.size;
        const attrs = this._mergeLabelAttrs(
          labelMarkup || defaultLabelMarkup,
          labelAttrs,
          defaultLabelAttrs,
          builtinDefaultLabelAttrs
        );
        const size = this._mergeLabelSize(
          labelSize,
          defaultLabelSize
        );
        this.updateDOMSubtreeAttributes(labelNode, attrs, {
          rootBBox: new g5.Rect(size),
          selectors
        });
      }
      return this;
    }
    // Override to disable dragging of the designation label
    dragLabelStart(e, x, y) {
      const labelEl = e.currentTarget;
      const isDesignation = this.isDesignationLabel(labelEl);
      if (isDesignation) {
        this.eventData(e, { stopPropagation: true });
        this.paper.delegateDragEvents(this, e.data);
      } else {
        super.dragLabelStart(e, x, y);
      }
    }
    // Override to pass drag data to linkAllowed()
    dragArrowheadEnd(evt, x, y) {
      const data = this.eventData(evt);
      const { paper } = this;
      if (paper.options.snapLinks) {
        this._snapArrowheadEnd(data);
      } else {
        this._connectArrowheadEnd(data, x, y);
      }
      if (!paper.linkAllowed(this, data)) {
        this._disallow(data);
      } else {
        this._finishEmbedding(data);
        this._notifyConnectEvent(data, evt);
      }
      this._afterArrowheadMove(data);
    }
    isDesignationLabel(el) {
      return !!el.dataset.designation;
    }
    // Fix for Safari not rendering markers
    // TODO: remove after joint (core) is >=4.0.4 as it won't be needed anymore
    confirmUpdate(flags, opt = {}) {
      if (this.hasFlag(flags, Flags.SOURCE)) {
        if (!this.updateEndProperties("source")) {
          return flags;
        }
        flags = this.removeFlag(flags, Flags.SOURCE);
      }
      if (this.hasFlag(flags, Flags.TARGET)) {
        if (!this.updateEndProperties("target")) {
          return flags;
        }
        flags = this.removeFlag(flags, Flags.TARGET);
      }
      const { paper, sourceView, targetView } = this;
      if (paper && (sourceView && !paper.isViewMounted(sourceView) || targetView && !paper.isViewMounted(targetView))) {
        return flags;
      }
      if (this.hasFlag(flags, Flags.RENDER)) {
        this.render();
        this.updateHighlighters(true);
        this.updateTools(opt);
        flags = this.removeFlag(flags, [Flags.RENDER, Flags.UPDATE, Flags.LABELS, Flags.TOOLS, Flags.CONNECTOR]);
        if (isSafari()) {
          const { el } = this;
          const childNodes = Array.from(el.childNodes);
          const fragment = document.createDocumentFragment();
          for (let i = 0, n = childNodes.length; i < n; i++) {
            el.removeChild(childNodes[i]);
            fragment.appendChild(childNodes[i]);
          }
          el.appendChild(fragment);
        }
        return flags;
      }
      let updateHighlighters = false;
      const { model } = this;
      const { attributes } = model;
      let updateLabels = this.hasFlag(flags, Flags.LABELS);
      if (updateLabels) {
        this.onLabelsChange(model, attributes.labels, opt);
        flags = this.removeFlag(flags, Flags.LABELS);
        updateHighlighters = true;
      }
      const updateAll = this.hasFlag(flags, Flags.UPDATE);
      const updateConnector = this.hasFlag(flags, Flags.CONNECTOR);
      if (updateAll || updateConnector) {
        if (!updateAll) {
          this.updatePath();
          this.updateDOM();
        } else if (opt.translateBy && model.isRelationshipEmbeddedIn(opt.translateBy)) {
          this.translate(opt.tx, opt.ty);
        } else {
          this.update();
        }
        this.updateTools(opt);
        flags = this.removeFlag(flags, [Flags.UPDATE, Flags.TOOLS, Flags.CONNECTOR]);
        updateLabels = false;
        updateHighlighters = true;
      }
      if (updateLabels) {
        this.updateLabelPositions();
      }
      if (updateHighlighters) {
        this.updateHighlighters();
      }
      if (this.hasFlag(flags, Flags.TOOLS)) {
        this.updateTools(opt);
        flags = this.removeFlag(flags, Flags.TOOLS);
      }
      return flags;
    }
  };
  var SingleLinkView_default = SingleLinkView;

  // images/libraries/apex/diagram-builder/Selection.mjs
  var { ui: ui2 } = joint;
  var ConnectedLinksTranslation = {
    NONE: "none",
    SUBGRAPH: "subgraph",
    ALL: "all"
  };
  var CellSelection = class extends ui2.Selection {
    // Override to translate the connected links correctly, see comment /FN/
    translateSelectedElements(dx, dy) {
      const processedCells = {};
      const { collection } = this;
      const { graph, translateConnectedLinks } = this.options;
      collection.toArray().forEach((cell) => {
        if (processedCells[cell.id]) {
          return;
        }
        const opt = {
          selection: this.cid
        };
        cell.translate(dx, dy, opt);
        processedCells[cell.id] = true;
        cell.getEmbeddedCells({ deep: true }).forEach(function(embed) {
          processedCells[embed.id] = true;
        });
        if (translateConnectedLinks !== ConnectedLinksTranslation.NONE) {
          const connectedLinks = graph.getConnectedLinks(cell);
          connectedLinks.forEach(function(link) {
            if (processedCells[link.id]) {
              return;
            }
            if (translateConnectedLinks === ConnectedLinksTranslation.SUBGRAPH) {
              const sourceCell = link.getSourceCell();
              if (sourceCell && !collection.get(sourceCell)) {
                return;
              }
              const targetCell = link.getTargetCell();
              if (targetCell && !collection.get(targetCell)) {
                return;
              }
              if (!sourceCell || !targetCell) {
                return;
              }
              if (sourceCell && sourceCell === targetCell) {
                return;
              }
            }
            link.translate(dx, dy, opt);
            processedCells[link.id] = true;
          });
        }
      });
    }
    //  BELOW SELECTION WITH MASKING OVERRIDES
    onResetElements(elements, { previousModels = [] }) {
      this.destroyAllSelectionBoxes(previousModels);
      elements.toArray().forEach(this.createSelectionBox.bind(this));
      this.updateSelectionWrapper();
    }
    createSelectionBox(element) {
      const elementView = element.findView(this.options.paper);
      if (elementView) {
        elementView.el.classList.add("selected");
        elementView.el.dataset.selectionHighlightId = highlightView(elementView, {
          padding: 1,
          className: "selection-highlight",
          layer: "front",
          attrs: {
            "stroke": "var(--a-diagram-cell-selection, orange)",
            "stroke-width": 2
          }
        });
        this.showSelected();
        this._boxCount += 1;
      }
    }
    destroyAllSelectionBoxes(cells = []) {
      cells.forEach((cell) => {
        const elementView = cell.findView(this.options.paper);
        if (elementView) {
          if (cell.isElement()) {
            unhighlightView(elementView, elementView.el.dataset.selectionHighlightId);
          }
          elementView.el.classList.remove("selected");
        }
      });
      this._boxCount = 0;
      this.hide();
    }
    destroySelectionBox(element) {
      const elementView = element.findView(this.options.paper);
      unhighlightView(elementView, elementView.el.dataset.selectionHighlightId);
      this._boxCount = this._boxCount - 1;
      if (!this._boxCount) {
        this.hide();
      }
    }
    _updateSelectionBoxes() {
      if (this._boxCount) {
        this.showSelected();
        this.updateSelectionWrapper();
      } else {
        this.hide();
      }
    }
  };

  // images/libraries/apex/diagram-builder/DiagramBuilderEvent.mjs
  var DiagramBuilderEvent = {
    BEFORE_KEYBOARD_ACTION: "beforekeyboardaction",
    BLANK_POINTERDOWN: "blankpointerdown",
    BLANK_POINTERUP: "blankpointerup",
    BLANK_CONTEXT_MENU: "blankcontextmenu",
    CELL_Z_INDEX_CHANGE: "zindexchange",
    ELEMENT_ADD: "elementadd",
    ELEMENT_REMOVE: "elementremove",
    ELEMENT_POINTERDOWN: "elementpointerdown",
    ELEMENT_POINTERUP: "elementpointerup",
    ELEMENT_POSITION_CHANGE: "elementpositionchange",
    ELEMENT_MENUBUTTON_POINTERDOWN: "elementmenubuttonpointerdown",
    ELEMENT_MENUBUTTON_KEYBOARDTRIGGER: "elementmenubuttonkeyboardtrigger",
    ELEMENT_CONNECTBUTTON_POINTERUP: "elementconnectbuttonpointerup",
    ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER: "elementconnectbuttonkeyboardtrigger",
    ELEMENT_MOUSEENTER: "elementmouseenter",
    ELEMENT_MOUSELEAVE: "elementmouseleave",
    ELEMENT_DROP: "elementdrop",
    ELEMENT_BEFORE_DROP: "elementbeforedrop",
    LINK_ADD: "linkadd",
    LINK_REMOVE: "linkremove",
    LINK_SOURCE_CHANGE: "linksourcechange",
    LINK_TARGET_CHANGE: "linktargetchange",
    LINK_VERTICES_CHANGE: "linkverticeschange",
    LINK_VERTEX_REMOVE: "linkvertexremove",
    LINK_DESIGNATION_CHANGE: "linkdesignationchange",
    LINK_LABEL_ADD: "linklabeladd",
    LINK_LABEL_REMOVE: "linklabelremove",
    LINK_LABEL_CHANGE: "linklabelchange",
    LINK_POINTERDOWN: "linkpointerdown",
    LINK_POINTERUP: "linkpointerup",
    LINK_MOUSEENTER: "linkmouseenter",
    LINK_MOUSELEAVE: "linkmouseleave",
    LINK_SOURCE_PLACEHOLDER_POINTERDOWN: "linksourceplaceholderpointerdown",
    LINK_SOURCE_PLACEHOLDER_POINTERUP: "linksourceplaceholderpointerup",
    LINK_SOURCE_PLACEHOLDER_KEYBOARDTRIGGER: "linksourceplaceholderkeyboardtrigger",
    LINK_TARGET_PLACEHOLDER_POINTERDOWN: "linktargetplaceholderpointerdown",
    LINK_TARGET_PLACEHOLDER_POINTERUP: "linktargetplaceholderpointerup",
    LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER: "linktargetplaceholderkeyboardtrigger",
    LINK_PLACEHOLDER_POINTERDOWN: "linkplaceholderpointerdown",
    LINK_PLACEHOLDER_POINTERUP: "linkplaceholderpointerup",
    LINK_PLACEHOLDER_KEYBOARDTRIGGER: "linkplaceholderkeyboardtrigger",
    LINK_SOURCE_ANCHOR_POINTERUP: "linksourceanchorpointerup",
    LINK_TARGET_ANCHOR_POINTERUP: "linktargetanchorpointerup",
    LINK_ADDELEMENTBUTTON_POINTERDOWN: "linkaddelementbuttonpointerdown",
    LINK_ADDELEMENTBUTTON_POINTERUP: "linkaddelementbuttonpointerup",
    LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER: "linkaddelementbuttonkeyboardtrigger",
    LINK_MENUBUTTON_POINTERDOWN: "linktmenubuttonpointerdown",
    LINK_MENUBUTTON_KEYBOARDTRIGGER: "linkmenubuttonkeyboardtrigger",
    LINK_VERTEXHANDLE_POINTERUP: "linkvertexhandlepointerup",
    LINK_SEGMENTHANDLE_POINTERUP: "linksegmenthandlepointerup",
    SELECTION_CHANGE: "selectionchange"
  };
  Object.freeze(DiagramBuilderEvent);
  var DiagramBuilderEvent_default = DiagramBuilderEvent;

  // images/libraries/apex/diagram-builder/PaperScroller.mjs
  var { ui: ui3 } = joint;
  function swing(t) {
    if (t <= 0) {
      return 0;
    }
    if (t >= 1) {
      return 1;
    }
    return 0.5 - Math.cos(t * Math.PI) / 2;
  }
  function animateScroll(element, target, opt) {
    const {
      duration = 400,
      timingFunction = swing,
      complete
    } = opt;
    const startTime = Date.now();
    const endTime = startTime + duration;
    const initialScrollLeft = element.scrollLeft;
    const initialScrollTop = element.scrollTop;
    const targetLeft = target.scrollLeft || initialScrollLeft;
    const targetTop = target.scrollTop || initialScrollTop;
    const horizontalDistance = targetLeft - initialScrollLeft;
    const verticalDistance = targetTop - initialScrollTop;
    let timeoutId;
    function animate() {
      const now = Date.now();
      const progress = (now - startTime) / (endTime - startTime);
      const point = timingFunction(progress);
      const frameLeft = Math.round(initialScrollLeft + horizontalDistance * point);
      const frameTop = Math.round(initialScrollTop + verticalDistance * point);
      element.scrollLeft = frameLeft;
      element.scrollTop = frameTop;
      if (now >= endTime) {
        complete && complete();
        return;
      }
      if (Math.round(element.scrollLeft) !== frameLeft && Math.round(element.scrollTop) !== frameTop) {
        complete && complete();
        return;
      }
      timeoutId = setTimeout(animate, 0);
    }
    animate();
    return () => clearTimeout(timeoutId);
  }
  var PaperScroller = class extends ui3.PaperScroller {
    scrollToLink(link, opt = {}) {
      const { ratio = 0, animation } = opt;
      const { paper } = this.options;
      const view = link.findView(paper);
      const point = view.getPointAtRatio(ratio);
      return this.scroll(point.x, point.y, {
        animation
      });
    }
    // Override to account for padding
    isElementVisible(element, opt = {}) {
      const {
        padding = 0,
        strict = false
      } = opt;
      this.checkElement(element, "isElementVisible");
      const bbox = element.getBBox();
      if (strict) {
        bbox.inflate(padding / this.zoom());
        return !!this.getVisibleArea().containsRect(bbox);
      } else {
        return !!this.getVisibleArea().intersect(bbox);
      }
    }
    // Override to account for padding
    isPointVisible(point, opt = {}) {
      const { padding = 0 } = opt;
      const visArea = this.getVisibleArea();
      if (padding) {
        visArea.inflate(-padding / this.zoom());
      }
      return visArea.containsPoint(point);
    }
    // Override to solve Chromium bug where setting scrollLeft/scrollTop properties
    // with browser zoom at != 100% results in these values being decimal and not int.
    // NOTE: This function is the very same (unmodified) original function of the ui.PaperScroller -
    // the override resides in the animateScroll function.
    scroll(x, y, opt) {
      const ctm = this.options.paper.matrix();
      const clientSize = this.getClientSize();
      const change = {};
      const { isNumber } = joint.util;
      if (isNumber(x)) {
        var cx = clientSize.width / 2;
        change.scrollLeft = this.getScrollLeftFromLTR(x * ctm.a - cx + ctm.e + (this._padding.left || 0));
      }
      if (isNumber(y)) {
        var cy = clientSize.height / 2;
        change.scrollTop = y * ctm.d - cy + ctm.f + (this._padding.top || 0);
      }
      if (opt && opt.animation) {
        if (this._cancelAnimation) {
          this._cancelAnimation();
        }
        this._cancelAnimation = animateScroll(this.el, change, opt.animation);
      } else {
        const {
          el
        } = this;
        if (change.scrollLeft !== void 0) {
          el.scrollLeft = change.scrollLeft;
        }
        if (change.scrollTop !== void 0) {
          el.scrollTop = change.scrollTop;
        }
      }
    }
    startAutoResizePaper() {
      const { options } = this;
      const { paper, autoResizePaper } = options;
      if (!autoResizePaper) {
        options.autoResizePaper = true;
        this.listenTo(paper, "render:done", this.onPaperRenderDone);
        this.adjustPaper();
      }
    }
    stopAutoResizePaper() {
      const { options } = this;
      const { paper, autoResizePaper } = options;
      if (autoResizePaper) {
        options.autoResizePaper = false;
        this.stopListening(paper, "render:done", this.onPaperRenderDone);
      }
    }
  };

  // images/libraries/apex/diagram-builder/Graph.mjs
  var { dia: dia8 } = joint;
  var Graph = class extends dia8.Graph {
    disconnectOutboundLinks(model, opt) {
      this.getConnectedLinks(model, { outbound: true }).forEach(function(link) {
        link.set("source", { x: 0, y: 0 }, opt);
      });
    }
    disconnectInboundLinks(model, opt) {
      this.getConnectedLinks(model, { inbound: true }).forEach(function(link) {
        link.set("target", { x: 0, y: 0 }, opt);
      });
    }
    // Override to be able to trigger beforeremove.
    _removeCell(cell, collection, options) {
      options = options || {};
      if (!options.clear) {
        this.trigger("beforeremove", cell, options);
        if (options.disconnectLinks) {
          this.disconnectLinks(cell, options);
        } else {
          this.removeLinks(cell, options);
        }
      }
      this.get("cells").remove(cell, { silent: true });
      if (cell.graph === this) {
        cell.graph = null;
      }
    }
  };

  // images/libraries/apex/diagram-builder/utils/connectionPoint.mjs
  var { V: V5, g: g6 } = joint;
  function createConnectionPoint() {
    return function(pathSegmentLine, view, magnet, opt) {
      const ns = this.paper.options.connectionPointNamespace;
      let conPointFn = ns.boundary;
      if (view.model instanceof ShapeElement) {
        const startPoint = pathSegmentLine.start;
        const endPoint = pathSegmentLine.end;
        const decorationBg = getShape(view, "decorationBackground", "decoration");
        const body = getShape(view, "body");
        const intersections = [];
        let point = new g6.Point(endPoint.x, endPoint.y);
        if (!body || !decorationBg || body.containsPoint(startPoint) || decorationBg.containsPoint(startPoint)) {
          conPointFn = ns.bbox;
        } else {
          intersections.push(...decorationBg.intersectionWithLine(pathSegmentLine) || []);
          intersections.push(...body.intersectionWithLine(pathSegmentLine) || []);
          point = intersections.reduce((prev, curr) => {
            if (prev == null) {
              return curr;
            }
            const currDistance = curr.distance(startPoint);
            const prevDistance = prev.distance(startPoint);
            return currDistance < prevDistance ? curr : prev;
          }, intersections[0]);
          return point;
        }
      } else if (view.model instanceof TerminatorElement) {
        const startPoint = pathSegmentLine.start;
        const endPoint = pathSegmentLine.end;
        const decorationBg = getShape(view, "statusIconBackground", "statusIconContainer");
        const body = getShape(view, "body");
        const intersections = [];
        let point = new g6.Point(endPoint.x, endPoint.y);
        if (!decorationBg || body.containsPoint(startPoint) || decorationBg.containsPoint(startPoint)) {
          conPointFn = ns.boundary;
        } else {
          intersections.push(...decorationBg.intersectionWithLine(pathSegmentLine) || []);
          intersections.push(...body.intersectionWithLine(pathSegmentLine) || []);
          point = intersections.reduce((prev, curr) => {
            if (prev == null) {
              return curr;
            }
            const currDistance = curr.distance(startPoint);
            const prevDistance = prev.distance(startPoint);
            return currDistance < prevDistance ? curr : prev;
          }, intersections[0]);
          return point;
        }
      }
      return conPointFn.call(this, pathSegmentLine, view, magnet, opt);
      function getShape(view2, elSelector, containerElSelector) {
        const el = view2.getChildEl(elSelector);
        const containerEl = view2.getChildEl(containerElSelector);
        if (containerEl?.getAttribute("display") === "none") {
          return;
        }
        const bbox = view2.model.getBBox();
        let shape;
        switch (el.nodeName) {
          case "path":
            shape = g6.Path.parse(el.getAttribute("d"));
            break;
          case "rect":
            shape = new g6.Rect(
              parseFloat(el.getAttribute("x")) || 0,
              parseFloat(el.getAttribute("y")) || 0,
              parseFloat(el.getAttribute("width")),
              parseFloat(el.getAttribute("height"))
            );
            break;
          case "circle": {
            const radius = parseFloat(el.getAttribute("r"));
            shape = new g6.Ellipse(
              new g6.Point(parseFloat(el.getAttribute("cx")) || 0, parseFloat(el.getAttribute("cy")) || 0),
              radius,
              radius
            );
            break;
          }
        }
        if (shape) {
          let offsetY = 0;
          let offsetX = 0;
          if (containerEl) {
            const decMatrix = V5.decomposeMatrix(V5.transformStringToMatrix(containerEl.getAttribute("transform")));
            offsetY = decMatrix.translateY;
            offsetX = decMatrix.translateX;
          }
          if (typeof shape.translate == "function") {
            shape.translate(bbox.x + offsetX, bbox.y + offsetY);
          } else {
            shape.x += bbox.x + offsetX;
            shape.y += bbox.y + offsetY;
          }
          return shape;
        }
      }
    };
  }

  // images/libraries/apex/diagram-builder/utils/router.mjs
  var { routers } = joint;
  function getRouterConfig(name, args) {
    const R = DiagramBuilderRouter_default;
    switch (name) {
      case R.MANHATTAN:
      case R.ADVANCED_MANHATTAN:
      case R.ORTHOGONAL:
        return {
          name,
          args: {
            padding: 20,
            ...args
          }
        };
      default:
        return { name };
    }
  }
  function defineCustomRouters() {
    routers[DiagramBuilderRouter_default.ADVANCED_MANHATTAN] = function(vertices, args, linkView) {
      const { model } = linkView;
      const sourceElement = model.getSourceElement();
      const targetElement = model.getTargetElement();
      if (sourceElement) {
        const sourceElBbox = sourceElement.getBBox();
        const sourceAnchorCoords = getAnchorCoords(model.source().anchor, sourceElBbox);
        args.startDirections = [sourceElBbox.sideNearestToPoint(sourceAnchorCoords)];
      } else {
        delete args.startDirections;
      }
      if (targetElement) {
        const targetElBbox = targetElement.getBBox();
        const targetAnchorCoords = getAnchorCoords(model.target().anchor, targetElBbox);
        args.endDirections = [targetElBbox.sideNearestToPoint(targetAnchorCoords)];
      } else {
        delete args.endDirections;
      }
      return routers.manhattan(vertices, args, linkView);
    };
    routers[DiagramBuilderRouter_default.ADVANCED_RIGHT_ANGLE] = function(vertices, args, linkView) {
      args.useVertices = true;
      return routers.rightAngle(vertices, args, linkView);
    };
  }

  // images/libraries/apex/diagram-builder/Paper.mjs
  var { dia: dia9 } = joint;
  var Paper = class extends dia9.Paper {
    // Override to pass through the drag-data.
    linkAllowed(linkView, dragData) {
      if (!(linkView instanceof dia9.LinkView)) {
        throw new Error("Must provide a linkView.");
      }
      const link = linkView.model;
      const paperOptions = this.options;
      const graph = this.model;
      const ns = graph.constructor.validations;
      if (!paperOptions.multiLinks) {
        if (!ns.multiLinks.call(this, graph, link)) {
          return false;
        }
      }
      if (!paperOptions.linkPinning) {
        if (!ns.linkPinning.call(this, graph, link)) {
          return false;
        }
      }
      if (typeof paperOptions.allowLink === "function") {
        if (!paperOptions.allowLink.call(this, linkView, this, dragData)) {
          return false;
        }
      }
      return true;
    }
  };

  // images/libraries/apex/diagram-builder/Stencil.mjs
  var { dia: dia10, ui: ui4, util: util7 } = joint;
  var Stencil = class extends ui4.Stencil {
    // Override to add before_drop event.
    onDrop(cloneView, evt, point, snapToGrid) {
      const { options } = this;
      const { paper, graph } = options;
      const { embeddingMode } = paper.options;
      const { model: dragClone } = cloneView;
      graph.startBatch("stencil-drag");
      const endClone = options.dragEndClone(dragClone);
      if (dragClone === endClone || !(endClone instanceof dia10.Cell)) {
        throw new Error("ui.Stencil: `dragEndClone` must return a clone of the cell");
      }
      const droppedOverView = paper.findView(evt.target) || null;
      const droppedOverTool = droppedOverView ? getToolByEl(droppedOverView, evt.target) : null;
      this.trigger("element:beforedrop", cloneView, endClone, evt, point.x, point.y, droppedOverView, droppedOverTool);
      this.drop(endClone, point, snapToGrid);
      if (embeddingMode && dragClone.isElement()) {
        cloneView.eventData(evt, {
          model: endClone,
          paper,
          initialParentId: util7.uuid(),
          // dummy parent id
          whenNotAllowed: "remove"
        });
        cloneView.finalizeEmbedding(cloneView.eventData(evt));
      }
      if (graph.getCell(endClone)) {
        this.trigger("element:drop", endClone.findView(paper), evt, point.x, point.y, droppedOverView, droppedOverTool);
        this.removePaperAfterDragging(dragClone);
      } else {
        this.onDropInvalid(cloneView, evt, point, snapToGrid);
      }
      graph.stopBatch("stencil-drag");
    }
  };

  // images/libraries/apex/diagram-builder/DiagramBuilderUtil.mjs
  var { util: util8 } = joint;
  var DiagramBuilderUtil = {
    isEqual: util8.isEqual
  };
  Object.freeze(DiagramBuilderUtil);
  var DiagramBuilderUtil_default = DiagramBuilderUtil;

  // images/libraries/apex/diagram-builder/DiagramBuilder.mjs
  var { dia: dia11, ui: ui5, shapes: shapes2, connectionStrategies, g: g7, util: util9, mvc: mvc2 } = joint;
  var DiagramBuilder = class {
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
      rtl: document.dir?.toLowerCase() === "rtl",
      el: null,
      paperEl: ".paper",
      stencilEl: ".stencil",
      navigatorEl: ".navigator",
      elements: [],
      stencilElements: [],
      selectionMode: DiagramBuilderSelectionMode_default.MULTI,
      linkDesignations: [],
      routeHighlights: [],
      requireLinkSourceElement: false,
      requireLinkTargetElement: false,
      readOnly: false,
      renderStencil: true,
      onElementRemoveKeepOutboundLinks: false,
      onElementRemoveKeepInboundLinks: false,
      dropConnectOnLinks: true,
      allowDropConnectOnLink: () => {
      },
      dropConnectOnElements: true,
      allowDropConnectOnElement: () => {
      },
      allowDropConnectOnPlaceholder: () => {
      },
      paperWidth: 2e3,
      paperHeight: 2e3,
      showNavigator: true,
      navigatorWidth: 192,
      navigatorHeight: 128,
      // initialZoom != 0 sets the zoom level only once - on the startup.
      // initialZoom == 0 zooms out (if necessary) after every load to
      // try to fit the route or the diagram (if no route) in the viewport.
      // However, it never zooms in!
      initialZoom: 1,
      minZoom: 0.5,
      maxZoom: 2,
      defaultRouter: DiagramBuilderRouter_default.NORMAL,
      keyboardNavigation: true,
      keyboardNavigationMap: void 0,
      // defaults created in the controller
      drawGrid: false,
      style: {
        elementCls: [],
        linkCls: [],
        linkLabelCls: [],
        linkDesignationCls: [],
        paperCls: [],
        stencilCls: [],
        navigatorCls: [],
        focusCls: ["is-focused"],
        hoverCls: ["is-hovered"],
        toastForegroundContainerCls: [],
        legacyCls: ["joint-apex-legacy-offset"]
        // used on the app dom el when a used SVG property is not supported
      },
      locale: {
        [DiagramBuilderLocale_default.STR_ZOOM_LEVEL]: "Zoom level {0}%"
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
      util9.assign(this, mvc2.Events);
      util9.assign(shapes2, {
        apex: {
          Circle: CircleElement,
          CircleView,
          Rect: RectElement,
          RectView: RectElementView,
          Diamond: DiamondElement,
          DiamondView: DiamondElementView,
          Terminator: TerminatorElement,
          TerminatorView: TerminatorElementView,
          Unconfigured: UnconfiguredElement,
          UnconfiguredView: UnconfiguredElementView,
          // The views of the small ones are not important (as they have no members)
          CircleSmall: CircleElementSmall_default,
          DiamondSmall: DiamondElementSmall,
          RectSmall: RectElementSmall,
          SingleLink,
          SingleLinkView: SingleLinkView_default
        }
      });
      this.#linkDesignations = cfg.linkDesignations || [];
      const _cfg = util9.merge(this.#config, cfg);
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
      if (cfg.initialZoom !== 0) {
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
      if (cfg.selectionMode === DiagramBuilderSelectionMode_default.MULTI || cfg.selectionMode === DiagramBuilderSelectionMode_default.SINGLE) {
        this.#selectionController = new SelectionController({
          graph: this.#graph,
          paper: this.#paper,
          paperScroller: this.#paperScroller,
          selection: this.#selection,
          multiSelectionHandles: [],
          // currently unused, leaving as placeholder for possible cfg.multiSelectionHandles
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
          "change:usage": this.#keyboardUsageChange
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
          tagName: "image",
          attributes: {
            "xlink:href": imageUrl,
            preserveAspectRatio: "xMinYMin slice"
          }
        }]
      });
    }
    #startEventDispatching() {
      const E = DiagramBuilderEvent_default;
      this.listenTo(this.#graph, {
        "add": (cell) => {
          this.#dispatch(cell.isElement() ? E.ELEMENT_ADD : E.LINK_ADD, cell);
        },
        "remove": (cell, _, { silent = false }) => {
          if (!silent) {
            this.#dispatch(cell.isElement() ? E.ELEMENT_REMOVE : E.LINK_REMOVE, cell);
          }
        },
        "change:position": (element, position, opt = {}) => {
          const { keyboard = false } = opt;
          this.#dispatch(E.ELEMENT_POSITION_CHANGE, element, position, keyboard);
        },
        "change:source": (link, source) => {
          this.#dispatch(E.LINK_SOURCE_CHANGE, link, source);
        },
        "change:target": (link, source) => {
          this.#dispatch(E.LINK_TARGET_CHANGE, link, source);
        },
        "change:vertices": (link, vertices) => {
          this.#dispatch(E.LINK_VERTICES_CHANGE, link, vertices);
        },
        // Note: remove:vertex fires only when the vertex was removed by the user (or using removeVertex call)
        // and not when simplifying the route with removeRedundantLinearVertices (opt.redundancyRemoval on Vertices
        // and Segment tool).
        "remove:vertex": (link, vertex, index) => {
          this.#dispatch(E.LINK_VERTEX_REMOVE, link, vertex, index);
        },
        "change:labels": (link, labels, info) => {
          if ("designation" in link.changed) {
            this.#dispatch(E.LINK_DESIGNATION_CHANGE, link, link.changed.designation);
          } else {
            const hasDesignation = !!link.designation();
            if (hasDesignation) {
              [, ...labels] = labels;
            }
            if (labels.length) {
              const {
                propertyPath,
                propertyValue,
                propertyPathArray,
                rewrite = false
              } = info;
              const keys = Object.keys(propertyValue);
              const index = propertyPathArray[1] - (hasDesignation ? 1 : 0);
              if (propertyPath.includes(Link.getLabelTextPath())) {
                this.#dispatch(E.LINK_LABEL_CHANGE, link, labels, labels[index], "text", propertyValue);
              } else if (keys.length === 1 && keys[0] === "position") {
                this.#dispatch(E.LINK_LABEL_CHANGE, link, labels, labels[index], "position", propertyValue.position);
              } else {
                this.#dispatch(E.LINK_LABEL_ADD, link, labels, labels[index], rewrite);
              }
            } else {
              this.#dispatch(E.LINK_LABEL_REMOVE, link, labels);
            }
          }
        },
        "change:z": (cell, z) => {
          this.#dispatch(E.CELL_Z_INDEX_CHANGE, cell, z);
        }
      });
      this.listenTo(this.#paper, {
        "cell:pointerdown": (view, e, x, y) => {
          const { model } = view;
          this.#dispatch(model.isElement() ? E.ELEMENT_POINTERDOWN : E.LINK_POINTERDOWN, view, { x, y }, e);
        },
        "cell:pointerup": (view, e, x, y) => {
          const { model } = view;
          this.#dispatch(model.isElement() ? E.ELEMENT_POINTERUP : E.LINK_POINTERUP, view, { x, y }, e);
        },
        "cell:menubutton:pointerdown": function(view, tool, e) {
          const evName = E[view.model.isElement() ? "ELEMENT_MENUBUTTON_POINTERDOWN" : "LINK_MENUBUTTON_POINTERDOWN"];
          this.#dispatch(evName, view, tool, e);
        },
        "cell:menubutton:keyboardtrigger": function(view, tool, e) {
          const evName = E[view.model.isElement() ? "ELEMENT_MENUBUTTON_KEYBOARDTRIGGER" : "LINK_MENUBUTTON_KEYBOARDTRIGGER"];
          this.#dispatch(evName, view, tool, e);
        },
        "element:connectbutton:pointerup": function(view, tool, position, coords, e) {
          this.#dispatch(E.ELEMENT_CONNECTBUTTON_POINTERUP, view, tool, position, coords, e);
        },
        "element:connectbutton:keyboardtrigger": function(view, tool, position, coords, e) {
          this.#dispatch(E.ELEMENT_CONNECTBUTTON_KEYBOARDTRIGGER, view, tool, position, coords, e);
        },
        "link:mouseenter": (view, e) => {
          const point = this.clientToLocalPoint(e.clientX, e.clientY);
          this.#dispatch(E.LINK_MOUSEENTER, view, point, e);
        },
        "link:mouseleave": (view, e) => {
          const point = this.clientToLocalPoint(e.clientX, e.clientY);
          this.#dispatch(E.LINK_MOUSELEAVE, view, point, e);
        },
        "link:addelement:pointerdown": function(view, tool, point, e) {
          this.#dispatch(E.LINK_ADDELEMENTBUTTON_POINTERDOWN, view, tool, point, e);
        },
        "link:addelement:pointerup": function(view, tool, point, e) {
          this.#dispatch(E.LINK_ADDELEMENTBUTTON_POINTERUP, view, tool, point, e);
        },
        "link:addelement:keyboardtrigger": function(view, tool, point, e) {
          this.#dispatch(E.LINK_ADDELEMENTBUTTON_KEYBOARDTRIGGER, view, tool, point, e);
        },
        "link:placeholder:pointerdown": (view, tool, ratio, point, e) => {
          point = { ...this.toGridSize(point) };
          if (ratio === 0) {
            this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
          } else if (ratio === 1) {
            this.#dispatch(E.LINK_TARGET_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
          }
          this.#dispatch(E.LINK_PLACEHOLDER_POINTERDOWN, view, tool, ratio, point, e);
        },
        "link:placeholder:pointerup": (view, tool, ratio, point, e) => {
          point = { ...this.toGridSize(point) };
          if (ratio === 0) {
            this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
          } else if (ratio === 1) {
            this.#dispatch(E.LINK_TARGET_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
          }
          this.#dispatch(E.LINK_PLACEHOLDER_POINTERUP, view, tool, ratio, point, e);
        },
        "link:placeholder:keyboardtrigger": (view, tool, ratio, point, e) => {
          point = { ...this.toGridSize(point) };
          if (ratio === 0) {
            this.#dispatch(E.LINK_SOURCE_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
          } else if (ratio === 1) {
            this.#dispatch(E.LINK_TARGET_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
          }
          this.#dispatch(E.LINK_PLACEHOLDER_KEYBOARDTRIGGER, view, tool, ratio, point, e);
        },
        "link:anchor:pointerup": (view, tool, end, anchor, e) => {
          const evName = E[end === "source" ? "LINK_SOURCE_ANCHOR_POINTERUP" : "LINK_TARGET_ANCHOR_POINTERUP"];
          this.#dispatch(evName, view, tool, anchor, e);
        },
        "link:vertexhandle:pointerup": (view, tool, handle, vertexNewCoords, vertexOldCoords, e) => {
          this.#dispatch(E.LINK_VERTEXHANDLE_POINTERUP, view, tool, handle, vertexNewCoords, vertexOldCoords, e);
        },
        "link:segmenthandle:pointerup": (view, tool, handle, newChangedValues, oldChangedValues, e) => {
          this.#dispatch(E.LINK_SEGMENTHANDLE_POINTERUP, view, tool, handle, newChangedValues, oldChangedValues, e);
        },
        "blank:pointerdown": (e, x, y) => {
          this.#dispatch(E.BLANK_POINTERDOWN, { x, y }, e);
        },
        "blank:pointerup": (e, x, y) => {
          this.#dispatch(E.BLANK_POINTERUP, { x, y }, e);
        },
        "blank:contextmenu": (e, x, y) => {
          this.#dispatch(E.BLANK_CONTEXT_MENU, { x, y }, e);
        }
      });
      this.listenTo(this.#selection, {
        "change": (selection, det) => {
          this.#dispatch(DiagramBuilderEvent_default.SELECTION_CHANGE, selection.collection.models, det);
        }
      });
      this.listenTo(this.#stencil, {
        "element:beforedrop": (draggedView, endModel, e, x, y, droppedOverView, droppedOverTool) => {
          this.#dispatch(E.ELEMENT_BEFORE_DROP, draggedView, endModel, { x, y }, droppedOverView, droppedOverTool, e);
        },
        "element:drop": (view, e, x, y) => {
          this.#dispatch(E.ELEMENT_DROP, view, { x, y }, e);
        }
      });
      if (this.#keyboardController) {
        this.listenTo(this.#keyboardController, {
          "beforeaction": (keyboardController, action, e, processObj) => {
            this.#dispatch(E.BEFORE_KEYBOARD_ACTION, action, e, processObj);
          }
        });
      }
    }
    #keyboardUsageChange(controller, usingKeyboard) {
      this.#viewController.useKeyboard(usingKeyboard);
    }
    #dispatch(evName, ...rest) {
      if (!evName || typeof evName != "string") {
        throw new Error("Event name must be specified.");
      }
      if (!this.isEventSuspended(evName)) {
        this.trigger(evName, ...rest);
      }
    }
    #initEls(el) {
      const cfg = this.#config;
      const { paperCls, stencilCls, navigatorCls, legacyCls } = cfg.style;
      this.#el = typeof el == "string" ? document.querySelector(el) : el;
      if (!this.#el) {
        throw new Error('Diagram Builder: Render-to HTML element not found. Fix it by setting the "el" config to an existing element or its selector.');
      }
      if (!this.#el.getAttribute("tabindex")) {
        this.#el.setAttribute("tabindex", 0);
      }
      if (legacyCls?.length && isSafari()) {
        this.#el.classList.add(...Array.isArray(legacyCls) ? legacyCls : legacyCls.split(" "));
      }
      let paperEl = typeof cfg.paperEl == "string" ? this.#el.querySelector(cfg.paperEl) : cfg.paperEl;
      if (!paperEl) {
        paperEl = document.createElement("div");
        this.#el.appendChild(paperEl);
      }
      if (paperCls?.length) {
        paperEl.classList.add(...Array.isArray(paperCls) ? paperCls : paperCls.split(" "));
      }
      this.#paperEl = paperEl;
      const { renderStencil } = cfg;
      if (renderStencil) {
        let stencilEl = typeof cfg.stencilEl == "string" ? this.#el.querySelector(cfg.stencilEl) : cfg.stencilEl;
        if (!stencilEl) {
          stencilEl = document.createElement("div");
          this.#el.appendChild(stencilEl);
        }
        if (stencilCls?.length) {
          stencilEl.classList.add(...Array.isArray(stencilCls) ? stencilCls : stencilCls.split(" "));
        }
        this.#stencilEl = stencilEl;
      }
      let navEl = typeof cfg.navigatorEl == "string" ? this.#el.querySelector(cfg.navigatorEl) : cfg.navigatorEl;
      if (!navEl) {
        navEl = document.createElement("div");
        this.#el.appendChild(navEl);
      }
      if (navigatorCls?.length) {
        navEl.classList.add(...Array.isArray(navigatorCls) ? navigatorCls : navigatorCls.split(" "));
      }
      this.#navigatorEl = navEl;
      this.#el.addEventListener("mousedown", this.#setFocused, true);
      this.#el.addEventListener("touchstart", this.#setFocused, true);
      this.onFocus = this.onFocus.bind(this);
      this.onBlur = this.onBlur.bind(this);
      this.#el.addEventListener("focus", this.onFocus);
      this.#el.addEventListener("blur", this.onBlur);
    }
    #setFocused() {
      this.focus();
    }
    #initGraph() {
      this.#graph = new Graph({}, { cellNamespace: shapes2 });
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
          name: "mesh",
          args: {
            color: drawGrid === true ? "var(--a-diagram-grid-color, #eee)" : drawGrid
          }
        } : false,
        width: paperWidth,
        height: paperHeight,
        sorting: Paper.sorting.APPROX,
        // NOTE: Do NOT use EXACT, it bugs out with async paper
        linkPinning: true,
        model: this.#graph,
        cellViewNamespace: shapes2,
        connectionStrategy: function(end, view, magnet, coords, linkModel, endString, paper2, side) {
          if (side) {
            const distanceFromPoint = 10;
            let dx = 0, dy = 0;
            switch (side) {
              case "top":
                dy = distanceFromPoint;
                break;
              case "bottom":
                dy = -distanceFromPoint;
                break;
              case "right":
                dx = -distanceFromPoint;
                break;
              case "left":
                dx = distanceFromPoint;
            }
            end.anchor = {
              name: side,
              args: {
                dx,
                dy
              }
            };
          } else {
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
          name: "rounded"
        },
        defaultConnectionPoint: createConnectionPoint(),
        defaultLinkAnchor: {
          name: "connectionClosest"
        },
        snapLabels: true,
        interactive: (view) => {
          const { model } = view;
          const cellReadOnly = model.isReadOnly();
          const ro = this.isReadOnly() || cellReadOnly;
          const options = {
            elementMove: !ro,
            linkMove: false,
            labelMove: !ro
          };
          return options;
        },
        // Fires after arrowhead movements
        allowLink: (linkView, paper2, dragData) => {
          const { model } = linkView;
          const end = model[dragData.arrowhead]();
          if (isPoint(end)) {
            const { x, y } = this.#paper.localToClientPoint(end.x, end.y);
            const el = document.elementFromPoint(x, y);
            const viewUnderPointer = this.#paper.findView(el);
            if (viewUnderPointer && viewUnderPointer instanceof dia11.ElementView) {
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
        cursor: "grab",
        padding: 30,
        autoResizePaper: true,
        allowNewOrigin: "any",
        baseWidth: 500,
        baseHeight: 500,
        contentOptions: () => {
          const graphBBox = this.#graph.getBBox();
          if (this.isReadOnly()) {
            return {
              contentArea: graphBBox || new g7.Rect(0, 0, 300, 200),
              allowNewOrigin: "any",
              allowNegativeBottomRight: true,
              padding: 30,
              gridWidth: 0,
              gridHeight: 0
            };
          }
          const minArea = new g7.Rect(0, 0, this.#config.paperWidth, this.#config.paperHeight);
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
      } else {
        this.#paperScroller.center();
      }
    }
    #canLink(sourceModel, targetModel, linkView) {
      const linkModel = linkView.model;
      const requireSource = linkModel.get("requireSourceElement");
      const requireTarget = linkModel.get("requireTargetElement");
      const allowSourceLinkOut = sourceModel?.allow(Element.ALLOW_LINK_OUT) !== false;
      const allowTargetLinkIn = targetModel?.allow(Element.ALLOW_LINK_IN) !== false;
      const cfg = this.#config;
      const readOnly = cfg.readOnly || sourceModel && sourceModel.isReadOnly() || targetModel && targetModel.isReadOnly();
      const { allowConnection } = cfg;
      if (readOnly) {
        return false;
      }
      if (requireSource && !(sourceModel instanceof dia11.Element)) {
        return false;
      }
      if (requireTarget && !(targetModel instanceof dia11.Element)) {
        return false;
      }
      if (!allowSourceLinkOut || !allowTargetLinkIn) {
        return false;
      }
      if (sourceModel instanceof dia11.Link || targetModel instanceof dia11.Link) {
        return false;
      }
      if (typeof allowConnection == "function") {
        return allowConnection(sourceModel, targetModel, linkView) !== false;
      }
      return true;
    }
    #initRouters() {
      defineCustomRouters();
    }
    #initSelection() {
      this.#clipboard = new ui5.Clipboard();
      this.#selection = new CellSelection({
        useModelGeometry: true,
        translateConnectedLinks: ui5.Selection.ConnectedLinksTranslation.SUBGRAPH,
        boxContent: false,
        paper: this.#paper,
        allowCellInteraction: true,
        filter: (cell) => {
          return !cell.isSelectable();
        }
      });
    }
    #initKeyboard() {
      this.#keyboard = new ui5.Keyboard({
        filter: (e) => {
          const { target } = e;
          return this.#el.contains(target);
        }
      });
    }
    #initTooltips() {
      new ui5.Tooltip({
        rootTarget: document.body,
        target: "[data-tooltip]",
        padding: 15,
        animation: {
          delay: "1s"
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
        const mEl = this.#elementMap.find((el) => {
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
        dragStartClone: (el) => {
          const typeId = el.prop("typeId");
          const item = this.#elementMap.find((el2) => el2.typeId === typeId);
          return item.element.clone();
        },
        paperOptions: {
          background: { color: "#eee" }
        }
      });
      this.#stencil = stencil;
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
        this.#stencilEl.style.visibility = "hidden";
      }
    }
    #showStencil() {
      if (this.#stencilEl) {
        this.#stencilEl.style.visibility = "visible";
      }
    }
    #initSnaplines() {
      this.#snaplines = new ui5.Snaplines({
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
      const nav = new ui5.Navigator({
        paperScroller: this.#paperScroller,
        width: this.#config.navigatorWidth,
        height: this.#config.navigatorHeight,
        zoom: false,
        // needs to be set explicitly to false
        padding: 0,
        paperOptions: {
          async: true,
          cellViewNamespace: shapes2,
          sorting: Paper.sorting.APPROX,
          background: {
            color: "#fff"
          },
          defaultRouter: getRouterConfig(this.#config.defaultRouter),
          defaultConnector: {
            name: "rounded"
          },
          defaultConnectionPoint: createConnectionPoint()
        }
      });
      this.#navigator = nav;
      this.#navigatorEl.appendChild(nav.el);
      nav.render();
      if (this.#config.showNavigator) {
        this.#setNavigatorVisibility(true);
      } else {
        this.#setNavigatorVisibility(false);
      }
    }
    #registerElementMap(elements) {
      let elementCls = this.#config.style.elementCls || [];
      elementCls = Array.isArray(elementCls) ? elementCls : elementCls.split(" ");
      const map = elements.map((cfg) => {
        const {
          type,
          typeId,
          tooltip,
          stencilTooltip,
          glyph = "",
          glyphColor,
          decorationPattern
        } = cfg;
        let { cls = "" } = cfg;
        const optionalAttrs = util9.merge({}, this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES);
        const ns = type.split(".");
        const elementConfig = {
          filters: this.#elementFilters,
          rtl: this.#config.rtl
        };
        const stencilElementConfig = {};
        cls = cls || [];
        elementConfig.cls = [...elementCls, ...Array.isArray(cls) ? cls : cls.split(" ")];
        const element = new (ns.reduce((o, i) => o[i], shapes2))(elementConfig);
        element.prop("typeId", typeId);
        const nsStencil = [...ns];
        nsStencil[nsStencil.length - 1] = `${nsStencil[nsStencil.length - 1]}Small`;
        let Ctor = nsStencil.reduce((o, i) => o[i], shapes2);
        if (!Ctor) {
          Ctor = ns.reduce((o, i) => o[i], shapes2);
        }
        const stencilElement = new Ctor(stencilElementConfig);
        stencilElement.prop("typeId", typeId);
        if (decorationPattern) {
          const patternId = this.#definePattern(decorationPattern);
          element.prop("decorationPattern", decorationPattern);
          element.decorationPattern(`url(#${patternId})`);
        }
        if (tooltip) {
          if (typeof element == "string") {
            element.attr("root", {
              dataTooltip: tooltip,
              dataTooltipPosition: "top"
            });
          } else {
            element.attr("root", {
              dataTooltip: tooltip.text || "",
              dataTooltipPosition: tooltip.position || "top"
            });
          }
        }
        if (stencilTooltip) {
          if (typeof stencilTooltip == "string") {
            stencilElement.attr("root", {
              dataTooltip: stencilTooltip,
              dataTooltipPosition: "top"
            });
          } else {
            stencilElement.attr("root", {
              dataTooltip: stencilTooltip.text || "",
              dataTooltipPosition: stencilTooltip.position || "top"
            });
          }
        }
        element.glyph(glyph);
        stencilElement.glyph(glyph);
        if (glyphColor) {
          element.glyphColor(glyphColor);
          stencilElement.glyphColor(glyphColor);
        }
        Object.entries(optionalAttrs).forEach(([key, value]) => {
          if (element.prop(key) !== void 0) {
            return;
          }
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
        text = "",
        x = 0,
        y = 0,
        ...rest
      } = cfg;
      const item = this.#elementMap.find((el) => el.typeId === typeId);
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
        this.#el.classList.add(...Array.isArray(cls) ? cls : cls.split(" "));
      }
    }
    onBlur() {
      let cls = this.#config.style.focusCls;
      this.#focused = false;
      if (cls?.length) {
        this.#el.classList.remove(...Array.isArray(cls) ? cls : cls.split(" "));
      }
    }
    getShapes() {
      return shapes2;
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
        return g7.Point(arguments[0], arguments[1]).snapToGrid(gridSize);
      }
      if (isPoint(n)) {
        return g7.Point(n.x, n.y).snapToGrid(gridSize);
      }
      return g7.snapToGrid(n, gridSize);
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
      addElementToLinkAtRatio(el.findView(paper), linkView, ratio);
    }
    addElement(typeId, opt = {}) {
      if (this.isReadOnly()) {
        return;
      }
      let {
        async = false,
        verticalAlign = "top",
        horizontalAlign = "left",
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
      } else {
        if (x == null || y == null) {
          ({ x, y } = this.toGridSize(centerX - width / 2, centerY - height / 2));
        } else {
          switch (horizontalAlign) {
            case "center":
              x = x - width / 2;
              break;
            case "right":
              x = x - width;
              break;
          }
          switch (verticalAlign) {
            case "center":
              y = y - height / 2;
              break;
            case "bottom":
              y = y - height;
              break;
          }
          ({ x, y } = this.toGridSize(x, y));
        }
        ({ x, y } = getFreePosition(graph, { x, y }, this.#paper.options.gridSize));
        el.position(x, y);
        graph.addCell(el, { async });
      }
      if (highlight) {
        this.highlight(el, { duration: 2e3 });
      }
      return el;
    }
    removeElement(element, opt = {}) {
      const { force = false } = opt;
      const el = this.#getElement(element);
      if (el && !this.isReadOnly() && (force || canRemoveElements(el))) {
        el.remove();
      }
    }
    changeElementType(element, newType) {
      const model = this.#getElement(element);
      if (model && !this.isReadOnly() && !model.isReadOnly() && model.allow(Element.ALLOW_TYPE_CHANGE)) {
        const text = model.text();
        const { x, y } = model.position();
        const filterOut = [
          "attrs",
          "decorationPattern",
          "id",
          "position",
          "size",
          "type",
          "typeId",
          ...Object.keys(this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES)
        ];
        const extraProps = {};
        Object.entries(model.attributes).forEach(([key, value]) => {
          if (!filterOut.includes(key)) {
            extraProps[key] = value;
          }
        });
        const newEl = this.#createElement(newType, { text, x, y, ...extraProps });
        this.#freeze();
        changeElementInPlace(this.#graph, model, newEl);
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
      return getElement(this.#graph, element);
    }
    #getLink(link) {
      return getLink(this.#graph, link);
    }
    #getCell(cell) {
      return getCell(this.#graph, cell);
    }
    #setNavigatorVisibility(b) {
      this.#navigatorEl.style.display = b ? "block" : "none";
      this.#navigator[b ? "unfreeze" : "freeze"]();
      this.#navigatorVisible = b;
      this.#navigator.trigger("visibility", b ? "visible" : "hidden");
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
      const hasRoute = readOnly && data && Object.hasOwn(data, "route");
      const fit = initialZoom === 0;
      if (hasRoute) {
        this.highlightRoute(data.route, fit);
        if (!this.#highlightedRoute) {
          fit && this.#zoomOutToFit();
          this.#centerContent();
        } else if (!fit) {
          this.#centerContent();
        }
      } else {
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
      const sourceIsPoint = isPoint(source);
      const targetIsPoint = isPoint(target);
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
      if (!sourceIsPoint && !sourceEl || !targetIsPoint && !targetEl || requireLinkSourceElement && sourceIsPoint || requireLinkTargetElement && targetIsPoint) {
        return;
      }
      link.source(typeof source === "string" ? sourceEl : source);
      link.target(typeof target === "string" ? targetEl : target);
      this.#graph.addCell(link, { async });
      if (highlight) {
        this.highlight(link, { duration: 2e3 });
      }
      return link;
    }
    removeLink(link, opt = {}) {
      const { force = false } = opt;
      link = this.#getLink(link);
      if (link && !this.isReadOnly() && (force || canRemoveLinks(link))) {
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
        const isPoint2 = isPoint(target);
        const element = this.#getElement(target);
        if (link && (isPoint2 || element)) {
          link.target(typeof target === "string" ? element : target);
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
        const isPoint2 = isPoint(source);
        const element = this.#getElement(source);
        if (link && (isPoint2 || element)) {
          link.source(typeof source === "string" ? element : source);
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
      if (what instanceof dia11.CellView) {
        return highlightView(what, opt);
      } else {
        return highlightModel(this.#paper, what, opt);
      }
    }
    unhighlight(what, highlightId) {
      if (what instanceof dia11.CellView) {
        unhighlightView(what, highlightId);
      } else {
        unhighlightModel(this.#paper, what, highlightId);
      }
    }
    setLinkLabel(link, text, opt = {}) {
      link = this.#getLink(link);
      if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_LABEL_CHANGE)) {
        opt.cls = this.#config.style.linkLabelCls;
        label(this.#graph, link, text, opt);
      }
    }
    removeLinkLabel(link) {
      link = this.#getLink(link);
      if (link && !this.isReadOnly() && !link.isReadOnly() && link.allow(Link.ALLOW_LABEL_CHANGE)) {
        removeLabel(this.#graph, link);
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
      dataCells.forEach((cell) => {
        const { typeId } = cell;
        const cfg = {};
        if (typeId) {
          const def = this.#elementMap.find((def2) => def2.typeId === typeId);
          const {
            text = "",
            statusIcon,
            ...rest
          } = cell;
          if (def) {
            const mapEl = def.element;
            const pattern = mapEl.prop("decorationPattern");
            let patternId;
            if (pattern) {
              patternId = this.#definePattern(pattern);
            }
            cfg.filters = this.#elementFilters;
            cfg.rtl = this.#config.rtl;
            cfg.type = mapEl.get("type");
            Object.keys(this.#ELEMENT_TYPES_OPTIONAL_ATTRIBUTES).forEach((key) => {
              cfg[key] = key in cell ? cell[key] : mapEl.prop(key);
            });
            cfg.cls = [...mapEl.get("cls") || []];
            cfg.attrs = {
              label: {
                text
              },
              glyph: {
                text: mapEl.glyph()
              },
              statusIcon: {
                text: statusIcon?.glyph || "",
                ...statusIcon?.color && { fill: cell.statusIcon.color }
              },
              ...pattern && { decorationPattern: { fill: `url(#${patternId})` } }
            };
            Object.assign(cfg, rest);
            cells.push(cfg);
          }
        } else {
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
          cfg.type = "apex.SingleLink";
          cfg.cls = cls;
          if (designation) {
            let desName = designation, tooltip, tooltipPosition;
            if (typeof designation === "object") {
              ({ typeId: desName, tooltip, tooltipPosition } = designation);
            }
            const d = this.#linkDesignations.find((cfg2) => cfg2.typeId === desName);
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
            cellLabels.forEach((label2) => {
              const labelCfg = Link.getLabelCfg(label2.text || "", {
                ...label2.position && {
                  position: {
                    distance: label2.position.distance || 0.5,
                    offset: label2.position.offset || 0
                  }
                },
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
      } else {
        this.clear();
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
      return getElementById(this.#graph, id);
    }
    getElementBy(prop, value) {
      return getElementBy(this.#graph, prop, value);
    }
    getElementIds() {
      return this.#graph.getElements().map((el) => el.get("id"));
    }
    getLinks() {
      return this.#graph.getLinks();
    }
    getLinkAt(index) {
      return this.#graph.getLinks()[index] || null;
    }
    getLinkBy(prop, value) {
      return getLinkBy(this.#graph, prop, value);
    }
    getLinkById(id) {
      return getLinkById(this.#graph, id);
    }
    select(cells, { add = false, scrollTo = false } = {}) {
      cells = Array.isArray(cells) ? cells : [cells];
      cells = getCells(this.#graph, cells);
      if (cells.length) {
        select(this.#selection, cells, {
          add,
          mode: this.#config.selectionMode
        });
        if (scrollTo) {
          this.scrollIntoView(cells[0]);
        }
      }
    }
    deselect(cells) {
      if (cells) {
        cells = Array.isArray(cells) ? cells : [cells];
        cells = getCells(this.#graph, cells);
      }
      deselect(this.#selection, cells);
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
      const { x, y } = isPoint(p) ? p : { x: arguments[0], y: arguments[1] };
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
      this.graph.trigger("readonly", value);
      if (cfg.renderStencil) {
        if (value) {
          this.#hideStencil();
        } else {
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
      if (isPoint(p)) {
        return bbox.containsPoint(p);
      } else if (Array.isArray(p)) {
        return p.filter((p2) => bbox.containsPoint(p2));
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
      cells = cells.map((cell) => this.#getCell(cell)).filter((cell) => cell);
      if (cells.length) {
        this.#freeze();
        toFront(cells);
        this.#unfreeze();
      }
    }
    toBack(cells) {
      cells = Array.isArray(cells) ? cells : [cells];
      cells = cells.map((cell) => this.#getCell(cell)).filter((cell) => cell);
      if (cells.length) {
        this.#freeze();
        toBack(cells);
        this.#unfreeze();
      }
    }
    drawGrid(color) {
      this.#paper.setGrid({
        name: "mesh",
        args: {
          color
        }
      });
      this.#paper.drawGrid();
    }
    setDefaultRouter(routerName, args = {}) {
      const paper = this.#paper;
      const navPaper = this.#navigator.targetPaper;
      const routerCfg = getRouterConfig(routerName, args);
      paper.options.defaultRouter = navPaper.options.defaultRouter = {
        name: routerCfg.name,
        args: routerCfg.args
      };
      updateAllConnections(paper);
      if (this.#navigatorVisible) {
        updateAllConnections(navPaper);
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
        } else {
          link.unset("router");
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
      scrollIntoView(this.#paperScroller, cell, opt);
    }
    destroy() {
      this.#el.removeEventListener("mousedown", this.#setFocused);
      this.#el.removeEventListener("touchstart", this.#setFocused);
      this.#el.removeEventListener("focus", this.onFocus);
      this.#el.removeEventListener("blur", this.onBlur);
      this.stopListening();
      this.#viewController.destroy();
      if (this.#selectionController) {
        this.#selectionController.destroy();
      }
      this.#keyboardController.destroy();
    }
    getCellZIndex(cell) {
      return this.#getCell(cell)?.get("z");
    }
    setCellZIndex(cell, index) {
      this.#getCell(cell)?.set("z", index);
    }
    suspendEvents(eventNames) {
      eventNames = Array.isArray(eventNames) ? eventNames : [eventNames];
      const existingEvents = Object.values(DiagramBuilderEvent_default);
      eventNames.forEach((name) => {
        if (existingEvents.includes(name) && !this.isEventSuspended(name)) {
          this.#suspendedEvents.push(name);
        }
      });
    }
    resumeEvents(eventNames) {
      eventNames = Array.isArray(eventNames) ? eventNames : [eventNames];
      this.#suspendedEvents = this.#suspendedEvents.filter((name) => !eventNames.includes(name));
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
    showToast(msg, duration = 3e3, closeButton = false) {
      showToast(msg, {
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
        return this.getElementConnectedLinks(el, { outbound: true }).filter((link) => {
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
      if (!cfg.readOnly) {
        return;
      }
      if (this.#highlightedRoute) {
        this.unhighlightRoute();
      }
      const keyedRouteHighlightsCfgs = this.#config.routeHighlights.reduce((prev, curr) => {
        prev[curr.typeId] = curr;
        return prev;
      }, {});
      const routeData = route.map((item) => {
        const highlightTypeId = item.highlightTypeId;
        const highlightCfg = highlightTypeId ? keyedRouteHighlightsCfgs[highlightTypeId] : null;
        const cell = item instanceof dia11.Cell ? item : this.#getCell(typeof item === "string" ? item : item.cellId);
        cells.push(cell);
        const retObj = {
          cell,
          color: item.color ?? highlightCfg?.color ?? "var(--a-diagram-route-default, #808080)",
          glyph: item.glyph ?? highlightCfg?.glyph,
          glyphColor: item.glyphColor ?? highlightCfg?.glyphColor,
          allowHighlightedOutboundLinks: highlightCfg?.allowHighlightedOutboundLinks ?? true
        };
        return retObj;
      }).filter((obj) => obj.cell);
      if (routeData.length) {
        this.#highlightedRoute = routeData.map((obj) => obj.cell);
        this.#routeHighlightsSave = [];
        const save = this.#routeHighlightsSave;
        for (let i = routeData.length; i--; ) {
          const stepObj = routeData[i];
          const { cell, color } = stepObj;
          if (!save.find((item) => item.cell === cell)) {
            const toSave = {
              cell,
              color
            };
            if (cell.isElement()) {
              const prevGlyph = cell.statusIcon();
              const prevGlyphColor = prevGlyph ? cell.statusIconColor() : null;
              const { glyph: newGlyph = "", glyphColor: newGlyphColor = "#000000" } = stepObj;
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
        save.reverse();
        save.forEach((obj) => {
          const { cell } = obj;
          if (cell.isElement()) {
            const highlightCfg = {
              padding: 0,
              className: "route-highlight",
              attrs: {
                "stroke": obj.color,
                "stroke-width": 4
              }
            };
            obj.highlightId = this.highlight(cell, highlightCfg);
            if (navPaper) {
              const cellViewInNavigator = navPaper.findViewByModel(cell);
              const nhId = this.highlight(cellViewInNavigator, highlightCfg);
              obj.navigatorHighlightId = nhId;
            }
            if ("newGlyph" in obj) {
              cell.statusIcon(obj.newGlyph);
              delete obj.newGlyph;
            }
            if ("newGlyphColor" in obj) {
              cell.statusIconColor(obj.newGlyphColor);
              delete obj.newGlyphColor;
            }
          } else {
            cell.findView(paper).addCls("route-link");
            cell.route(true, obj.color);
          }
          delete obj.color;
        });
        const highlightedLinkObjs = routeData.filter((obj) => obj.cell.isLink());
        highlightedLinkObjs.forEach((obj) => {
          const { cell } = obj;
          const sourceElement = cell.getSourceElement();
          const sourceElementHighlightCfg = routeData.find((obj2) => obj2.cell === sourceElement);
          if (sourceElementHighlightCfg && sourceElementHighlightCfg.allowHighlightedOutboundLinks === false) {
            cell.findView(paper).removeCls("route-link");
            cell.route(false);
            this.#routeHighlightsSave.splice(this.#routeHighlightsSave.findIndex((obj2) => obj2.cell === cell), 1);
          }
        });
        if (scrollTo) {
          const { width: availableWidth, height: availableHeight } = paperScroller.getClientSize();
          const visibleArea = paperScroller.getVisibleArea();
          const uniqueEls = unique(this.#highlightedRoute.filter((cell) => cell.isElement()));
          const uniqueElsCount = uniqueEls.length;
          let contentArea;
          let contentAreaAtMinZoom;
          while (uniqueEls.length) {
            contentArea = graph.getCellsBBox(uniqueEls);
            contentAreaAtMinZoom = new g7.Rect(contentArea).scale(cfg.minZoom, cfg.minZoom);
            if (visibleArea.containsRect(contentArea)) {
              break;
            } else if (availableWidth >= contentAreaAtMinZoom.width && availableHeight >= contentAreaAtMinZoom.height) {
              const minScale = cfg.minZoom;
              const maxScale = uniqueEls.length === uniqueElsCount ? paperScroller.zoom() : cfg.minZoom;
              contentArea.inflate(30);
              paperScroller[zoomAnimation ? "transitionToRect" : "zoomToRect"](contentArea, {
                minScale,
                maxScale,
                scaleGrid: 0.1
              });
              break;
            } else {
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
        hl.forEach((obj) => {
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
          } else {
            cell.findView(paper).removeCls("route-link");
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
  };
  staticConsts(DiagramBuilder, {
    Event: DiagramBuilderEvent_default,
    Router: DiagramBuilderRouter_default,
    KeyboardAction: DiagramBuilderKeyboardAction_default,
    SelectionMode: DiagramBuilderSelectionMode_default,
    Locale: DiagramBuilderLocale_default,
    Util: DiagramBuilderUtil_default
  });

  // images/libraries/apex/DiagramBuilder.mjs
  window.DiagramBuilder = DiagramBuilder;
})();
/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */
/*!
 * Copyright (c) 2024, Oracle and/or its affiliates.
 */
