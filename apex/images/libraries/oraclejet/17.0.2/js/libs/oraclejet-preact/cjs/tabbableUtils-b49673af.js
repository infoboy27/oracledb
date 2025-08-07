/* @oracle/oraclejet-preact: undefined */
'use strict';

var head = require('./head-68d0992f.js');

/**
 * Returns the last element of the given list or string.
 *
 * @func
 * @memberOf R
 * @since v0.1.4
 * @category List
 * @sig [a] -> a | Undefined
 * @sig String -> String
 * @param {*} list
 * @return {*}
 * @see R.init, R.head, R.tail
 * @example
 *
 *      R.last(['fi', 'fo', 'fum']); //=> 'fum'
 *      R.last([]); //=> undefined
 *
 *      R.last('abc'); //=> 'c'
 *      R.last(''); //=> ''
 */

var last =
/*#__PURE__*/
head.nth(-1);
var last$1 = last;

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Query selector to return all tabbable elements
 * @param allowAllTabIndex This param is optional. The default value is false. To include the element with tabIndex='-1', specify allowAllTabIndex to true.
 */
const findTabbableQuery = (allowAllTabIndex) => {
    const defaultFocusableElements = [
        'button',
        '[href]',
        'input',
        'select',
        'textarea',
        '[tabindex]',
        'video'
    ];
    const selectorSuffix = ':not([tabindex="-1"]):not([disabled]):not([hidden])';
    const elementsCount = defaultFocusableElements.length;
    let safeFocusablesSelector = '';
    // Loop adding suffix
    for (let i = 0; i < elementsCount; i++) {
        const elSelector = `${defaultFocusableElements[i]}${selectorSuffix}`;
        safeFocusablesSelector += `${elSelector}, `;
    }
    // Special cases
    safeFocusablesSelector += "[contenteditable]:not([contenteditable='false'])";
    if (allowAllTabIndex) {
        safeFocusablesSelector += ', [tabIndex]';
    }
    return safeFocusablesSelector;
};
/**
 * Use tabbableQuery selector to determine if an element is tabbable
 * @param element the element
 * @param allowAllTabIndex This param is optional. The default value is false. To include the element with tabIndex='-1', specify allowAllTabIndex to true
 */
const isTabbableElement = (element, allowAllTabIndex) => element.matches(findTabbableQuery(allowAllTabIndex));
/**
 * All tabbable child elements in a node.
 * @param el the node
 * @param includeItself This param is optional. The default value is false. To include the current node, specify includeItself to true
 * @param allowAllTabIndex This param is optional. The default value is false. To include the element with tabIndex='-1', specify allowAllTabIndex to true.
 */
const allTabbableElements = (el, includeItself, allowAllTabIndex) => {
    const tabbableQuery = findTabbableQuery(allowAllTabIndex);
    const tabbable = Array.from(el.querySelectorAll(tabbableQuery)).filter((element) => {
        // @ts-ignore
        return !isHidden(element);
    });
    if (includeItself && isTabbableElement(el, allowAllTabIndex)) {
        tabbable.push(el);
    }
    return tabbable;
};
// All tabbable child elements in a node,  or the container itself if there is none
const tabbablesOrContainer = (element) => {
    const tabbableElements = allTabbableElements(element);
    return tabbableElements.length ? tabbableElements : [element];
};
// First tabbable child element in a node, or the container itself if there is none
const firstTabbableOrContainer = head.pipe(tabbablesOrContainer, head.head);
/**
 * Focus Helpers
 */
// preventScroll safe focus setter
const focusOn = (element) => {
    element.focus({ preventScroll: true });
};
// focus on first tabbable in a container or container itself if there is none
const focusWithin = (element) => {
    const firstTabbable = firstTabbableOrContainer(element);
    focusOn(firstTabbable);
};
// focus on initial tabstop
const focusOnStart = head.pipe(tabbablesOrContainer, head.head, focusOn);
// focus on last tabstop
const focusOnEnd = head.pipe(tabbablesOrContainer, last$1, focusOn);
// get active element from document parent of the node
const getActiveElement = (node) => {
    const conditionalDocument = node?.ownerDocument ?? document;
    return conditionalDocument.activeElement;
};
// get active element from document parent of the node
const getBodyElement = (node) => {
    const conditionalDocument = node?.ownerDocument ?? document;
    return conditionalDocument.body;
};
const isHidden = (element) => {
    // Case: display: 'none'
    // https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/offsetParent
    // Note: offsetParent returns null in the following situations:
    // The element or any ancestor has the display property set to none.
    // The element has the position property set to fixed (Firefox returns <body>).
    // ...
    // To check the latter - whether the element has fixed position
    // we would have to call expensive getComputedStyle()
    // As we have not seen a fixed position tabbable element within a drawer
    // we intentionally don't do that until we got a usecase
    // Most hidden elements are hidden using display none which
    // can be checked cheap using following:
    if (element.offsetParent === null) {
        return true;
    }
    // ...and the Firefox case. Again (see previous comments):
    // The element has the position property set to fixed (Firefox returns <body>).
    // ToDo: Preact version of Firefox condition
    //  if (ojet.AgentUtils.getAgentInfo().browser === ojet.AgentUtils.BROWSER.FIREFOX) {
    //   if (element.offsetParent === document.body) {
    //     return true;
    //   }
    // }
    // Case: visibility: 'hidden'
    // getComputedStyle() correctly computes visibility even it is inherited.
    // https://developer.mozilla.org/en-US/docs/Web/API/Window/getComputedStyle
    // The Window.getComputedStyle() method returns an object containing the values of all CSS properties of an element,
    // after applying active stylesheets and resolving any basic computation those values may contain.
    const style = window.getComputedStyle(element);
    return style.visibility === 'hidden';
};
const getAutofocusFocusables = (element) => {
    const selector = '[autofocus]:not([tabindex="-1"]):not([disabled]):not([hidden])';
    const focusableCandidates = Array.from(element.querySelectorAll(selector));
    const focusables = focusableCandidates.filter((item) => {
        return isHidden(item);
    });
    return focusables;
};

exports.allTabbableElements = allTabbableElements;
exports.focusOn = focusOn;
exports.focusOnEnd = focusOnEnd;
exports.focusOnStart = focusOnStart;
exports.focusWithin = focusWithin;
exports.getActiveElement = getActiveElement;
exports.getAutofocusFocusables = getAutofocusFocusables;
exports.getBodyElement = getBodyElement;
exports.isTabbableElement = isTabbableElement;
//# sourceMappingURL=tabbableUtils-b49673af.js.map
