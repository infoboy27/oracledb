/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { useState, useRef, useMemo, useEffect, useCallback } from 'preact/hooks';
import { B as BaseButton } from './BaseButton-5b2791b1.js';
import { B as ButtonLabelLayout } from './ButtonLabelLayout-03cfed16.js';
import { S as SvgChevronLeft, a as SvgChevronRight } from './ChevronRight-083aef16.js';
import { S as SvgChevronUp } from './ChevronUp-8e0ac42c.js';
import { S as SvgChevronDown } from './ChevronDown-d9848cc4.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { styles } from './UNSAFE_ConveyorBelt/themes/ConveyorBeltStyles.css.js';
import { u as useUser } from './useUser-99920e02.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { C as ConveyorBeltContext } from './ConveyorBeltContext-76a29c59.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { forwardRef, useImperativeHandle } from 'preact/compat';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { ConveyorBeltRedwoodTheme } from './UNSAFE_ConveyorBelt/themes/redwood/ConveyorBeltTheme.js';
import { u as useConveyorBeltItem } from './useConveyorBeltItem-ce7d69d6.js';

/**
 * Helper function to determine whether the current device is a mobile device
 * @returns true if runnning on a mobile device, false otherwise
 */
function isMobile() {
    const deviceType = getClientHints().deviceType;
    return deviceType === 'phone';
}
// utility hook that calculates which conveyorbelt items are visible inside conveyorbelt viewport
// and which are hidden
const useConveyorElementsVisible = (root, orientation, prevBtn, nextBtn, direction) => {
    const observerRef = useRef();
    const targetsRef = useRef([]);
    const [targets] = useState([]);
    const addTarget = useCallback((target) => {
        if (targetsRef.current !== null) {
            targetsRef.current.push(target);
            targets.push(target);
        }
    }, [targets]);
    useEffect(() => {
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
    return useMemo(() => ({
        itemElementsRef: targetsRef,
        addItem: addTarget
    }), [targetsRef, addTarget]);
};
/**
 * The Conveyor belt component is a container element that manages
 * overflow for its child elements and allows scrolling among them
 */
const ConveyorBelt = forwardRef(({ children, scrollPosition, onScrollPositionChanged, arrowVisibility = 'auto', orientation = 'horizontal', testId }, ref = null) => {
    const [canPaginateNext, setCanPaginateNext] = useState(false);
    const [canPaginatePrevious, setCanPaginatePrevious] = useState(false);
    const overflowContainerRef = useRef(null);
    const contentContainerRef = useRef(null);
    const nextButtonContainerRef = useRef(null);
    const prevButtonContainerRef = useRef(null);
    const baseRef = useRef(null);
    const leftRef = useRef(null);
    const rightRef = useRef(null);
    const observerRef = useRef(null);
    const currentItemRef = useRef(null);
    const [currentItem, _setCurrentItem] = useState(null);
    const [buttonsHidden, setButtonsHidden] = useState((isMobile() && arrowVisibility === 'auto') || arrowVisibility === 'hidden');
    const { direction } = useUser();
    const { itemElementsRef, addItem } = useConveyorElementsVisible(overflowContainerRef.current, orientation, prevButtonContainerRef.current, nextButtonContainerRef.current, direction);
    useImperativeHandle(ref, () => ({
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
    const testIdProps = useTestId(testId);
    const leftArrowTestIdProps = 'leftArrow' + testId;
    const rightArrowTestIdProps = 'rightArrow' + testId;
    const { variantClasses } = useComponentTheme(ConveyorBeltRedwoodTheme, {
        orientation
    });
    const { variantClasses: contentClasses } = useComponentTheme(ConveyorBeltRedwoodTheme, {
        content: orientation
    });
    const { variantClasses: overflowClasses } = useComponentTheme(ConveyorBeltRedwoodTheme, {
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
    const { classes: nextButtonClasses } = useComponentTheme(ConveyorBeltRedwoodTheme, {
        nextButton: orientation,
        direction
    });
    const { classes: previousButtonClasses } = useComponentTheme(ConveyorBeltRedwoodTheme, {
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
    useEffect(() => {
        _getConveyorItems();
    });
    const scrollEndHandler = useCallback(() => {
        if (onScrollPositionChanged)
            onScrollPositionChanged(overflowContainerRef.current?.scrollLeft);
    }, [onScrollPositionChanged]);
    useEffect(() => {
        setButtonsHidden((isMobile() && arrowVisibility === 'auto') || arrowVisibility === 'hidden');
    }, [arrowVisibility]);
    useEffect(() => {
        if (!overflowContainerRef.current)
            return;
        overflowContainerRef.current.scrollTo({
            left: scrollPosition
        });
    }, [scrollPosition]);
    // useEffect hook that calculates when arrow buttons should become visible or hidden
    // using IntersectionObserver
    useEffect(() => {
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
    const scrollIntoView = useCallback((element) => {
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
    const getNextInvisible = useCallback(() => {
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
    const getPreviousInvisible = useCallback(() => {
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
    const scrollToPreviousPage = useCallback(() => {
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
    const scrollToNextPage = useCallback(() => {
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
    const setCurrentItem = useCallback((node) => {
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
    useEffect(() => {
        if (currentItem && currentItemRef.current) {
            scrollIntoView(currentItemRef.current);
        }
    }, [currentItem]); // eslint warning about scrollIntoView should be ignored.
    const onFocus = useCallback((event) => {
        if (baseRef.current?.isEqualNode(event.target)) {
            return;
        }
        scrollIntoView(event.target);
    }, [scrollIntoView]);
    const previousButtonStyle = classNames([styles.buttonContainer, previousButtonClasses]);
    const nextButtonStyle = classNames([styles.buttonContainer, nextButtonClasses]);
    return (jsx(ConveyorBeltContext.Provider, { value: { setCurrentItem }, children: jsxs("div", { onFocus: onFocus, ref: baseRef, className: classNames([styles.conveyorStyle, variantClasses]), ...testIdProps, children: [canPaginatePrevious && !buttonsHidden && (jsx("div", { ref: prevButtonContainerRef, class: previousButtonStyle, children: jsx(BaseButton, { elementDetails: { type: 'span', isFocusable: false }, styling: ['min'], size: 'sm', variant: 'ghost', onAction: () => scrollToPreviousPage(), "aria-hidden": true, testId: leftArrowTestIdProps, children: jsx(ButtonLabelLayout, { size: 'sm', display: 'icons', startIcon: orientation === 'horizontal' ? (direction === 'ltr' ? (jsx(SvgChevronLeft, {})) : (jsx(SvgChevronRight, {}))) : (jsx(SvgChevronUp, {})) }) }) })), jsx("div", { className: classNames([styles.overflowContainer, overflowClasses]), ref: overflowContainerRef, children: jsxs("div", { className: classNames([styles.contentContainer, variantClasses, contentClasses]), ref: contentContainerRef, children: [jsx("div", { "data-intersection-id": "left", ref: leftRef, style: { minWidth: 1, minHeight: 1 } }), children, jsx("div", { "data-intersection-id": "right", ref: rightRef, style: { minWidth: 1, minHeight: 1 } })] }) }), canPaginateNext && !buttonsHidden && (jsx("div", { ref: nextButtonContainerRef, class: nextButtonStyle, children: jsx(BaseButton, { elementDetails: { type: 'span', isFocusable: false }, styling: ['min'], size: 'sm', variant: 'ghost', onAction: () => scrollToNextPage(), "aria-hidden": true, testId: rightArrowTestIdProps, children: jsx(ButtonLabelLayout, { size: 'sm', display: 'icons', startIcon: orientation === 'horizontal' ? (direction === 'ltr' ? (jsx(SvgChevronRight, {})) : (jsx(SvgChevronLeft, {}))) : (jsx(SvgChevronDown, {})) }) }) }))] }) }));
});

/**
 * A wrapper component for one conveyor belt item/child element.
 * It takes care of correctly mark the child components as conveyor belt items.
 * @param param0 ConveyorBeltItemProps
 * @returns
 */
const ConveyorBeltItem = ({ children, isCurrent }) => {
    const props = useConveyorBeltItem({
        isCurrent: isCurrent
    });
    return (jsx("div", { className: classNames([styles.conveyorBeltItemStyle]), ...props, children: children }));
};

export { ConveyorBeltItem as C, ConveyorBelt as a };
//# sourceMappingURL=ConveyorBeltItem-3d1d7f3c.js.map
