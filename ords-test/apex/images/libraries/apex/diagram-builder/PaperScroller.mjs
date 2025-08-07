/*!
 * Copyright (c) 2023, 2024, Oracle and/or its affiliates.
 */

/**
 * @file
 * 
 * Extended joint.ui.PaperScroller with additional functionality and/or overrides.
 * 
 * PaperScroller wraps the Paper and enables panning, etc.
 */

const { ui } = joint;

// Used by animateScroll
function swing(t) {
    if (t <= 0) {
        return 0;
    }
    if (t >= 1) {
        return 1;
    }
    return 0.5 - Math.cos(t * Math.PI) / 2;
}

// Override for the Chromium scrollTop/Left subpixel bug. We do not have access to this function
// so we need to redefine it.
function animateScroll(element, target, opt) {
    const {
        duration = 400,
        timingFunction = swing,
        complete
    } = opt;
    const startTime = Date.now();
    const endTime = startTime + duration;

    // get the current scroll position
    const initialScrollLeft = element.scrollLeft;
    const initialScrollTop = element.scrollTop;
    const targetLeft = target.scrollLeft || initialScrollLeft;
    const targetTop = target.scrollTop || initialScrollTop;

    // calculate the difference between the current scroll position and the target
    const horizontalDistance = targetLeft - initialScrollLeft;
    const verticalDistance = targetTop - initialScrollTop;
    let timeoutId;

    // the animation function
    function animate() {
        const now = Date.now();
        const progress = (now - startTime) / (endTime - startTime); // interpolation
        const point = timingFunction(progress);
        const frameLeft = Math.round(initialScrollLeft + horizontalDistance * point);
        const frameTop = Math.round(initialScrollTop + verticalDistance * point);
        element.scrollLeft = frameLeft;
        element.scrollTop = frameTop;

        // check if we're done
        if (now >= endTime) {
            complete && complete();
            return;
        }

        // If we were supposed to scroll but didn't, then we
        // probably hit the limit, so consider it done; not
        // interrupted.
        //
        // FN: element.scrollLeft & scrollTop might be decimal based on the browser zoom (Chrome).
        // We need to round them; frameLeft and frameTop are rounded anyway.
        if (Math.round(element.scrollLeft) !== frameLeft && Math.round(element.scrollTop) !== frameTop) {
            complete && complete();
            return;
        }

        // schedule next frame for execution
        timeoutId = setTimeout(animate, 0);
    }

    // start the animation
    animate();
    return () => clearTimeout(timeoutId);
}

export default class PaperScroller extends ui.PaperScroller {

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

        this.checkElement(element, 'isElementVisible');

        const bbox = element.getBBox();

        if (strict) {
            // keep the padding independent on the zoom level
            bbox.inflate(padding / this.zoom());
            return !!this.getVisibleArea().containsRect(bbox);
        }
        else {
            return !!this.getVisibleArea().intersect(bbox);
        }
    }

    // Override to account for padding
    isPointVisible(point, opt = {}) {
        const { padding = 0 } = opt;
        const visArea = this.getVisibleArea();

        if (padding) {
            // keep the padding independent on the zoom level
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
        }
        else {
            const {
                el
            } = this;
            if (change.scrollLeft !== undefined) {
                el.scrollLeft = change.scrollLeft;
            }
            if (change.scrollTop !== undefined) {
                el.scrollTop = change.scrollTop;
            }
        }
    }

    startAutoResizePaper() {
        const { options } = this;
        const { paper, autoResizePaper } = options;
        if (!autoResizePaper) {
            options.autoResizePaper = true;
            this.listenTo(paper, 'render:done', this.onPaperRenderDone);
            this.adjustPaper();
        }
    }

    stopAutoResizePaper() {
        const { options } = this;
        const { paper, autoResizePaper } = options;
        if (autoResizePaper) {
            options.autoResizePaper = false;
            this.stopListening(paper, 'render:done', this.onPaperRenderDone);
        }
    }
}