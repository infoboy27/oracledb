/* @oracle/oraclejet-preact: undefined */
export { u as useInteractionStyle } from '../useInteractionStyle-d65c72b6.js';
import '../mergeProps-88ea8306.js';
import '../clientHints-c76a913b.js';
import '../useHover-d5088fcd.js';
import '../useToggle-8b7fcefe.js';
import 'preact/hooks';
import '../useActive-7d9737a5.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Collection of helper functions for writing your component styles in our theming system.
 * Pass in your style and it will return an object with the appropriate CSS selector wrapping it.
 */
const wrapWithActiveSelector = (style) => ({
    '&:active': style
});
const wrapWithHoverSelector = (style) => ({
    '&:hover': style
});
const wrapWithFocusSelector = (style) => ({
    '&:focus': style
});
const wrapWithFocusVisibleSelector = (style) => ({
    '&:focus-visible': style
});
const wrapWithVisitedSelector = (style) => ({
    '&:visited': style
});
const wrapWithNotActiveSelector = (style) => ({
    '&:not(:active)': style
});
const wrapWithParentNotActiveSelector = (style, parent) => ({
    [`${parent}:not(:active) > &`]: style
});
const wrapWithPseudoHoverSelector = (style) => ({
    '@media': {
        '(hover: hover)': {
            selectors: {
                '&:hover:not(:active)': style
            }
        }
    }
});
const wrapWithParentPseudoHoverSelector = (style, parent) => ({
    '@media': {
        '(hover: hover)': {
            selectors: {
                [`${parent}:hover:not(:active) > &`]: style
            }
        }
    }
});
const wrapWithNextElementPseudoHoverSelector = (style, prevSiblingSelector) => ({
    '@media': {
        '(hover: hover)': {
            selectors: {
                [`${prevSiblingSelector}:hover:not(:active) + &`]: style
            }
        }
    }
});

export { wrapWithActiveSelector, wrapWithFocusSelector, wrapWithFocusVisibleSelector, wrapWithHoverSelector, wrapWithNextElementPseudoHoverSelector, wrapWithNotActiveSelector, wrapWithParentNotActiveSelector, wrapWithParentPseudoHoverSelector, wrapWithPseudoHoverSelector, wrapWithVisitedSelector };
//# sourceMappingURL=UNSAFE_useInteractionStyle.js.map
