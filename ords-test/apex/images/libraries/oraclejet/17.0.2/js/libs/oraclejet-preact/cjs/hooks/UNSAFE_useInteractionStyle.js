/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var useInteractionStyle = require('../useInteractionStyle-442c6a12.js');
require('../mergeProps-e3da7237.js');
require('../clientHints-9e411b6e.js');
require('../useHover-910b8e32.js');
require('../useToggle-3ebba7d8.js');
require('preact/hooks');
require('../useActive-b15c9e7e.js');

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

exports.useInteractionStyle = useInteractionStyle.useInteractionStyle;
exports.wrapWithActiveSelector = wrapWithActiveSelector;
exports.wrapWithFocusSelector = wrapWithFocusSelector;
exports.wrapWithFocusVisibleSelector = wrapWithFocusVisibleSelector;
exports.wrapWithHoverSelector = wrapWithHoverSelector;
exports.wrapWithNextElementPseudoHoverSelector = wrapWithNextElementPseudoHoverSelector;
exports.wrapWithNotActiveSelector = wrapWithNotActiveSelector;
exports.wrapWithParentNotActiveSelector = wrapWithParentNotActiveSelector;
exports.wrapWithParentPseudoHoverSelector = wrapWithParentPseudoHoverSelector;
exports.wrapWithPseudoHoverSelector = wrapWithPseudoHoverSelector;
exports.wrapWithVisitedSelector = wrapWithVisitedSelector;
//# sourceMappingURL=UNSAFE_useInteractionStyle.js.map
