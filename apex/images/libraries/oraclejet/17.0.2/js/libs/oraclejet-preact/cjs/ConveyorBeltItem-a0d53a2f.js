/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var ButtonLabelLayout = require('./ButtonLabelLayout-3399b9e1.js');
var ChevronRight = require('./ChevronRight-3aa70117.js');
var ChevronUp = require('./ChevronUp-11e9a7d7.js');
var ChevronDown = require('./ChevronDown-ec558844.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css = require('./UNSAFE_ConveyorBelt/themes/ConveyorBeltStyles.css.js');
var useUser = require('./useUser-a6d15333.js');
var clientHints = require('./clientHints-9e411b6e.js');
var ConveyorBeltContext = require('./ConveyorBeltContext-bfe84b44.js');
var useTestId = require('./useTestId-8234ec1e.js');
var compat = require('preact/compat');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme = require('./UNSAFE_ConveyorBelt/themes/redwood/ConveyorBeltTheme.js');
var useConveyorBeltItem = require('./useConveyorBeltItem-eb851d33.js');

/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if runnning on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = clientHints.getClientHints().deviceType;
    return deviceType === 'phone';
}
// utility hook that calculates which conveyorbelt items are visible inside conveyorbelt viewport
// and which are hidden
const useConveyorElementsVisible = (root, orientation, prevBtn, nextBtn, direction) => {
    const observerRef = hooks.useRef();
    const targetsRef = hooks.useRef([]);
    const [targets] = hooks.useState([]);
    const addTarget = hooks.useCallback((target) => {
        if (targetsRef.current !== null) {
            targetsRef.current.push(target);
            targets.push(target);
        }
    }, [targets]);
    hooks.useEffect(() => {
        if (targets && targets.length > 0 && root) {
            // IntersectionObserver calls visibility change only when item is
            // fully visible inside (threshold: 1)
            // conveyorbelt viewport (root),
            // taking arrow buttons into the account
            // and viewport should be smaller by the buttons width (rootMargin)
            const rootMargin = orientation === 'horizontal'
                ? direction === 'ltr'
                    ? `0px ${nextBtn ? -nextBtn.offsetWidth : 0}px 0px ${prevBtn ? -prevBtn.offsetWidth : 0}px`
                    : `0px ${prevBtn ? -prevBtn.offsetWidth : 0}px 0px ${nextBtn ? -nextBtn.offsetWidth : 0}px`
                : `${nextBtn ? -nextBtn.offsetHeight : 0}px 0px ${prevBtn ? -prevBtn.offsetHeight : 0}px 0px`;
            observerRef.current = new IntersectionObserver(onVisibilityChange, {
                root,
                rootMargin: rootMargin,
                threshold: 1
            });
            for (const target of targets) {
                if (target != null)
                    observerRef.current.observe(target.item);
            }
        }
        return () => {
            for (const target of targets) {
                if (observerRef.current && target != null)
                    observerRef.current.unobserve(target.item);
            }
        };
    }, [targets, targets.length, root, nextBtn, prevBtn, direction]);
    // handle visibility changes
    const onVisibilityChange = (entries) => {
        const newItems = targetsRef.current.map((conveyorItem, index) => {
            const foundEntry = entries.find((entry) => entry.target === conveyorItem.item);
            // if visibility changed for the item, change isVisible property,
            // otherwise just return the original
            if (foundEntry) {
                return {
                    item: foundEntry.target,
                    isVisible: foundEntry.isIntersecting,
                    isCurrent: conveyorItem.isCurrent,
                    index: index
                };
            }
            else {
                return conveyorItem;
            }
        });
        targetsRef.current = newItems;
    };
    return hooks.useMemo(() => ({
        itemElementsRef: targetsRef,
        addItem: addTarget
    }), [targetsRef, addTarget]);
};
/**
 * The Conveyor belt component is a container element that manages
 * overflow for its child elements and allows scrolling among them
 */
const ConveyorBelt = compat.forwardRef(({ children, scrollPosition, onScrollPositionChanged, arrowVisibility = 'auto', orientation = 'horizontal', testId }, ref = null) => {
    const [canPaginateNext, setCanPaginateNext] = hooks.useState(false);
    const [canPaginatePrevious, setCanPaginatePrevious] = hooks.useState(false);
    const overflowContainerRef = hooks.useRef(null);
    const contentContainerRef = hooks.useRef(null);
    const nextButtonContainerRef = hooks.useRef(null);
    const prevButtonContainerRef = hooks.useRef(null);
    const baseRef = hooks.useRef(null);
    const leftRef = hooks.useRef(null);
    const rightRef = hooks.useRef(null);
    const observerRef = hooks.useRef(null);
    const currentItemRef = hooks.useRef(null);
    const [currentItem, _setCurrentItem] = hooks.useState(null);
    const [buttonsHidden, setButtonsHidden] = hooks.useState((isMobile() && arrowVisibility === 'auto') || arrowVisibility === 'hidden');
    const { direction } = useUser.useUser();
    const { itemElementsRef, addItem } = useConveyorElementsVisible(overflowContainerRef.current, orientation, prevButtonContainerRef.current, nextButtonContainerRef.current, direction);
    compat.useImperativeHandle(ref, () => ({
        scrollElementIntoView: (element) => {
            scrollIntoView(element);
        },
        scrollPrevious: () => {
            scrollToPreviousPage();
        },
        scrollNext: () => {
            scrollToNextPage();
        }
    }));
    const testIdProps = useTestId.useTestId(testId);
    const leftArrowTestIdProps = 'leftArrow' + testId;
    const rightArrowTestIdProps = 'rightArrow' + testId;
    const { variantClasses } = useComponentTheme.useComponentTheme(UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme.ConveyorBeltRedwoodTheme, {
        orientation
    });
    const { variantClasses: contentClasses } = useComponentTheme.useComponentTheme(UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme.ConveyorBeltRedwoodTheme, {
        content: orientation
    });
    const { variantClasses: overflowClasses } = useComponentTheme.useComponentTheme(UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme.ConveyorBeltRedwoodTheme, {
        pagination: canPaginateNext && canPaginatePrevious
            ? 'both'
            : canPaginateNext
                ? 'next'
                : canPaginatePrevious
                    ? 'previous'
                    : 'none',
        direction,
        orientation,
        overflow: orientation,
        arrowVisibility: buttonsHidden === true ? 'hidden' : 'visible'
    });
    const { classes: nextButtonClasses } = useComponentTheme.useComponentTheme(UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme.ConveyorBeltRedwoodTheme, {
        nextButton: orientation,
        direction
    });
    const { classes: previousButtonClasses } = useComponentTheme.useComponentTheme(UNSAFE_ConveyorBelt_themes_redwood_ConveyorBeltTheme.ConveyorBeltRedwoodTheme, {
        previousButton: orientation,
        direction
    });
    // utility method to get all conveyorbelt items
    const _getConveyorItems = () => {
        const conveyorContentChildren = contentContainerRef.current
            ? Array.from(contentContainerRef.current.querySelectorAll('[data-oj-conveyorbelt-item]'))
            : [];
        if (conveyorContentChildren) {
            let index = -1;
            for (const child of conveyorContentChildren) {
                index++;
                const element = child;
                if (element) {
                    const item = itemElementsRef.current.find((item) => item.item === element);
                    if (item == null) {
                        addItem({
                            item: element,
                            isVisible: false,
                            index: index,
                            isCurrent: false
                        });
                    }
                }
            }
        }
    };
    hooks.useEffect(() => {
        _getConveyorItems();
    });
    const scrollEndHandler = hooks.useCallback(() => {
        if (onScrollPositionChanged)
            onScrollPositionChanged(overflowContainerRef.current?.scrollLeft);
    }, [onScrollPositionChanged]);
    hooks.useEffect(() => {
        setButtonsHidden((isMobile() && arrowVisibility === 'auto') || arrowVisibility === 'hidden');
    }, [arrowVisibility]);
    hooks.useEffect(() => {
        if (!overflowContainerRef.current)
            return;
        overflowContainerRef.current.scrollTo({
            left: scrollPosition
        });
    }, [scrollPosition]);
    // useEffect hook that calculates when arrow buttons should become visible or hidden
    // using IntersectionObserver
    hooks.useEffect(() => {
        const overflowContainer = overflowContainerRef.current;
        const leftGuard = leftRef.current;
        const rightGuard = rightRef.current;
        if (overflowContainer && leftGuard && rightGuard) {
            if (!buttonsHidden) {
                observerRef.current = new IntersectionObserver((entries) => {
                    entries.forEach((entry) => {
                        if (entry.target.getAttribute('data-intersection-id') === 'left') {
                            setCanPaginatePrevious(!entry.isIntersecting);
                        }
                        else {
                            setCanPaginateNext(!entry.isIntersecting);
                        }
                    });
                }, {
                    root: overflowContainer
                });
                observerRef.current.observe(leftGuard);
                observerRef.current.observe(rightGuard);
            }
            overflowContainer.addEventListener('scrollend', scrollEndHandler);
        }
        // Clean-up
        return () => {
            if (!overflowContainer)
                return;
            overflowContainer.removeEventListener('scrollend', scrollEndHandler);
            observerRef.current?.unobserve(leftGuard);
            observerRef.current?.unobserve(rightGuard);
        };
    }, [buttonsHidden, scrollEndHandler]);
    const scrollIntoView = hooks.useCallback((element) => {
        // utility method to check if the element is closer to the end edge of the conveyorbelt
        const _shouldSnapToTheEndEdge = (ltr, orientation, elem, scroller) => {
            if (!elem || !scroller)
                return false;
            let right;
            let left;
            let bottom;
            if (scroller === document.documentElement) {
                left = 0;
                right = document.documentElement.clientWidth;
                bottom = document.documentElement.clientHeight;
            }
            else {
                const scrollerBounds = scroller.getBoundingClientRect();
                right = canPaginateNext
                    ? scrollerBounds.right - nextButtonContainerRef.current?.offsetWidth
                    : scrollerBounds.right;
                left = canPaginateNext
                    ? scrollerBounds.left - nextButtonContainerRef.current?.offsetWidth
                    : scrollerBounds.left;
                bottom = canPaginateNext
                    ? scrollerBounds.bottom - nextButtonContainerRef.current?.offsetHeight
                    : scrollerBounds.bottom;
            }
            const bounds = elem.getBoundingClientRect();
            return orientation === 'horizontal'
                ? ltr
                    ? bounds.right > right
                    : bounds.left < left
                : bounds.bottom > bottom;
        };
        // utility method to check that an element is fully visible inside conveyorbelt
        const _isElementInsideScrollerBounds = (orientation, elem, scroller) => {
            if (!elem || !scroller)
                return false;
            let left;
            let right;
            let top;
            let bottom;
            if (scroller === document.documentElement) {
                left = 0;
                right = document.documentElement.clientWidth;
                top = 0;
                bottom = document.documentElement.clientHeight;
            }
            else {
                const scrollerBounds = scroller.getBoundingClientRect();
                left = canPaginatePrevious
                    ? scrollerBounds.left + prevButtonContainerRef.current?.offsetWidth
                    : scrollerBounds.left;
                right = canPaginateNext
                    ? scrollerBounds.right - nextButtonContainerRef.current?.offsetWidth
                    : scrollerBounds.right;
                top = canPaginatePrevious
                    ? scrollerBounds.top + prevButtonContainerRef.current?.offsetHeight
                    : scrollerBounds.top;
                bottom = canPaginateNext
                    ? scrollerBounds.bottom - nextButtonContainerRef.current?.offsetHeight
                    : scrollerBounds.bottom;
            }
            const bounds = elem.getBoundingClientRect();
            return orientation === 'horizontal'
                ? bounds.left <= right &&
                    bounds.right <= right &&
                    bounds.left >= left &&
                    bounds.right >= left
                : bounds.top <= bottom &&
                    bounds.bottom <= bottom &&
                    bounds.top >= top &&
                    bounds.bottom >= top;
        };
        const _isElementOverflowingScrollerBounds = (orientation, elem, scroller) => {
            if (!elem || !scroller)
                return false;
            const bounds = elem.getBoundingClientRect();
            const scrollerBounds = scroller.getBoundingClientRect();
            return orientation === 'horizontal'
                ? bounds.width > scrollerBounds.width
                : bounds.height > scrollerBounds.height;
        };
        const isElementVisible = _isElementInsideScrollerBounds(orientation, element, overflowContainerRef.current);
        if (isElementVisible) {
            return;
        }
        const isElementOverflowing = _isElementOverflowingScrollerBounds(orientation, element, overflowContainerRef.current);
        if (!overflowContainerRef.current || !contentContainerRef.current)
            return;
        const shouldSnapEnd = _shouldSnapToTheEndEdge(direction === 'ltr', orientation, element, overflowContainerRef.current);
        if (orientation === 'vertical') {
            if (shouldSnapEnd && !isElementOverflowing) {
                overflowContainerRef.current.scrollTo({
                    top: element.offsetTop +
                        element.offsetHeight -
                        overflowContainerRef.current.offsetHeight +
                        (nextButtonContainerRef.current?.offsetHeight
                            ? nextButtonContainerRef.current?.offsetHeight + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
            else {
                overflowContainerRef.current.scrollTo({
                    top: element.offsetTop -
                        (prevButtonContainerRef.current?.offsetHeight
                            ? prevButtonContainerRef.current?.offsetHeight + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
            return;
        }
        if (direction === 'ltr') {
            if (shouldSnapEnd && !isElementOverflowing) {
                overflowContainerRef.current.scrollTo({
                    left: element.offsetLeft +
                        element.offsetWidth -
                        overflowContainerRef.current.offsetWidth +
                        (nextButtonContainerRef.current?.offsetWidth
                            ? nextButtonContainerRef.current?.offsetWidth + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
            else {
                overflowContainerRef.current.scrollTo({
                    left: element.offsetLeft -
                        (prevButtonContainerRef.current?.offsetWidth
                            ? prevButtonContainerRef.current?.offsetWidth + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
        }
        else {
            if (shouldSnapEnd && !isElementOverflowing) {
                overflowContainerRef.current.scrollTo({
                    left: element.offsetLeft -
                        contentContainerRef.current?.offsetWidth +
                        overflowContainerRef.current.offsetWidth -
                        (nextButtonContainerRef.current?.offsetWidth
                            ? nextButtonContainerRef.current?.offsetWidth + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
            else {
                overflowContainerRef.current.scrollTo({
                    left: element.offsetLeft +
                        element.offsetWidth -
                        contentContainerRef.current?.offsetWidth +
                        (prevButtonContainerRef.current?.offsetWidth
                            ? prevButtonContainerRef.current?.offsetWidth + 1
                            : 0),
                    behavior: 'smooth'
                });
            }
        }
    }, [canPaginateNext, canPaginatePrevious, direction]);
    const getNextInvisible = hooks.useCallback(() => {
        const nextInvisible = itemElementsRef.current.find((item) => {
            if (item.isVisible == false &&
                item.index >= 1 &&
                itemElementsRef.current[item.index - 1].isVisible == true) {
                return true;
            }
            return false;
        });
        return nextInvisible?.item;
    }, [itemElementsRef]);
    const getPreviousInvisible = hooks.useCallback(() => {
        const previousInvisible = itemElementsRef.current.find((item) => {
            if (item.isVisible == false &&
                item.index < itemElementsRef.current.length - 1 &&
                itemElementsRef.current[item.index + 1].isVisible == true) {
                return true;
            }
            return false;
        });
        return previousInvisible?.item;
    }, [itemElementsRef]);
    // paginates to the previous partially visible or hidden item in the conveyorbelt,
    // so that it is the last visible of the conveyorbelt view port
    const scrollToPreviousPage = hooks.useCallback(() => {
        const overflowContainer = overflowContainerRef.current;
        const scrollAmount = orientation === 'horizontal'
            ? overflowContainerRef.current?.clientWidth
            : overflowContainerRef.current?.clientHeight;
        if (overflowContainer && scrollAmount) {
            const previousInvisible = getPreviousInvisible();
            if (orientation === 'vertical') {
                if (!previousInvisible) {
                    overflowContainer.scrollTo({
                        top: overflowContainer.scrollTop - scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        top: previousInvisible.offsetTop +
                            previousInvisible.offsetHeight -
                            overflowContainer.offsetHeight +
                            (prevButtonContainerRef.current?.offsetHeight
                                ? prevButtonContainerRef.current?.offsetHeight + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
                return;
            }
            if (direction === 'ltr') {
                if (!previousInvisible) {
                    overflowContainer.scrollTo({
                        left: overflowContainer.scrollLeft - scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        left: previousInvisible.offsetLeft +
                            previousInvisible.offsetWidth -
                            overflowContainer.offsetWidth +
                            (prevButtonContainerRef.current?.offsetWidth
                                ? prevButtonContainerRef.current?.offsetWidth + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
            }
            else {
                if (!previousInvisible) {
                    overflowContainer.scrollTo({
                        left: overflowContainer.scrollLeft + scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        left: previousInvisible.offsetLeft -
                            contentContainerRef.current?.offsetWidth +
                            overflowContainer.offsetWidth -
                            (prevButtonContainerRef.current?.offsetWidth
                                ? prevButtonContainerRef.current?.offsetWidth + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
            }
        }
    }, [direction, orientation, getPreviousInvisible]);
    // paginates to the next partially visible or hidden item in the conveyorbelt,
    // so that it is the first at the start of the conveyorbelt view port
    const scrollToNextPage = hooks.useCallback(() => {
        const overflowContainer = overflowContainerRef.current;
        const scrollAmount = orientation === 'horizontal'
            ? overflowContainerRef.current?.clientWidth
            : overflowContainerRef.current?.clientHeight;
        if (overflowContainer && scrollAmount) {
            const nextInvisible = getNextInvisible();
            if (orientation === 'vertical') {
                if (!nextInvisible) {
                    overflowContainer.scrollTo({
                        top: overflowContainer.scrollTop + scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        top: (nextInvisible?.offsetTop ?? 0) -
                            (nextButtonContainerRef.current?.offsetHeight
                                ? nextButtonContainerRef.current?.offsetHeight + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
                return;
            }
            if (direction === 'ltr') {
                if (!nextInvisible) {
                    overflowContainer.scrollTo({
                        left: overflowContainer.scrollLeft + scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        left: (nextInvisible?.offsetLeft ?? 0) -
                            (nextButtonContainerRef.current?.offsetWidth
                                ? nextButtonContainerRef.current?.offsetWidth + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
            }
            else {
                if (!nextInvisible) {
                    overflowContainer.scrollTo({
                        left: overflowContainer.scrollLeft - scrollAmount,
                        behavior: 'smooth'
                    });
                }
                else {
                    overflowContainer.scrollTo({
                        left: -(contentContainerRef.current?.offsetWidth - (nextInvisible?.offsetLeft ?? 0)) +
                            (nextInvisible?.offsetWidth ?? 0) +
                            (nextButtonContainerRef.current?.offsetWidth
                                ? nextButtonContainerRef.current?.offsetWidth + 1
                                : 0),
                        behavior: 'smooth'
                    });
                }
            }
        }
    }, [direction, orientation, getNextInvisible]);
    const setCurrentItem = hooks.useCallback((node) => {
        if (currentItemRef.current !== node) {
            // this logic below is needed to make sure only one item is current
            const item = itemElementsRef.current.find((item) => item.item === node);
            const currentItem = itemElementsRef.current.find((item) => item.isCurrent === true);
            if (item === currentItem || !item)
                return;
            if (currentItem)
                currentItem.isCurrent = false;
            item.isCurrent = true;
            currentItemRef.current = node;
            _setCurrentItem(node);
        }
    }, [itemElementsRef]);
    hooks.useEffect(() => {
        if (currentItem && currentItemRef.current) {
            scrollIntoView(currentItemRef.current);
        }
    }, [currentItem]); // eslint warning about scrollIntoView should be ignored.
    const onFocus = hooks.useCallback((event) => {
        if (baseRef.current?.isEqualNode(event.target)) {
            return;
        }
        scrollIntoView(event.target);
    }, [scrollIntoView]);
    const previousButtonStyle = classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.buttonContainer, previousButtonClasses]);
    const nextButtonStyle = classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.buttonContainer, nextButtonClasses]);
    return (jsxRuntime.jsx(ConveyorBeltContext.ConveyorBeltContext.Provider, { value: { setCurrentItem }, children: jsxRuntime.jsxs("div", { onFocus: onFocus, ref: baseRef, className: classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.conveyorStyle, variantClasses]), ...testIdProps, children: [canPaginatePrevious && !buttonsHidden && (jsxRuntime.jsx("div", { ref: prevButtonContainerRef, class: previousButtonStyle, children: jsxRuntime.jsx(BaseButton.BaseButton, { elementDetails: { type: 'span', isFocusable: false }, styling: ['min'], size: 'sm', variant: 'ghost', onAction: () => scrollToPreviousPage(), "aria-hidden": true, testId: leftArrowTestIdProps, children: jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { size: 'sm', display: 'icons', startIcon: orientation === 'horizontal' ? (direction === 'ltr' ? (jsxRuntime.jsx(ChevronRight.SvgChevronLeft, {})) : (jsxRuntime.jsx(ChevronRight.SvgChevronRight, {}))) : (jsxRuntime.jsx(ChevronUp.SvgChevronUp, {})) }) }) })), jsxRuntime.jsx("div", { className: classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.overflowContainer, overflowClasses]), ref: overflowContainerRef, children: jsxRuntime.jsxs("div", { className: classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.contentContainer, variantClasses, contentClasses]), ref: contentContainerRef, children: [jsxRuntime.jsx("div", { "data-intersection-id": "left", ref: leftRef, style: { minWidth: 1, minHeight: 1 } }), children, jsxRuntime.jsx("div", { "data-intersection-id": "right", ref: rightRef, style: { minWidth: 1, minHeight: 1 } })] }) }), canPaginateNext && !buttonsHidden && (jsxRuntime.jsx("div", { ref: nextButtonContainerRef, class: nextButtonStyle, children: jsxRuntime.jsx(BaseButton.BaseButton, { elementDetails: { type: 'span', isFocusable: false }, styling: ['min'], size: 'sm', variant: 'ghost', onAction: () => scrollToNextPage(), "aria-hidden": true, testId: rightArrowTestIdProps, children: jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { size: 'sm', display: 'icons', startIcon: orientation === 'horizontal' ? (direction === 'ltr' ? (jsxRuntime.jsx(ChevronRight.SvgChevronRight, {})) : (jsxRuntime.jsx(ChevronRight.SvgChevronLeft, {}))) : (jsxRuntime.jsx(ChevronDown.SvgChevronDown, {})) }) }) }))] }) }));
});

/**
 * A wrapper component for one conveyor belt item/child element.
 * It takes care of correctly mark the child components as conveyor belt items.
 * @param param0 ConveyorBeltItemProps
 * @returns
 */
const ConveyorBeltItem = ({ children, isCurrent }) => {
    const props = useConveyorBeltItem.useConveyorBeltItem({
        isCurrent: isCurrent
    });
    return (jsxRuntime.jsx("div", { className: classNames.classNames([UNSAFE_ConveyorBelt_themes_ConveyorBeltStyles_css.styles.conveyorBeltItemStyle]), ...props, children: children }));
};

exports.ConveyorBelt = ConveyorBelt;
exports.ConveyorBeltItem = ConveyorBeltItem;
//# sourceMappingURL=ConveyorBeltItem-a0d53a2f.js.map
