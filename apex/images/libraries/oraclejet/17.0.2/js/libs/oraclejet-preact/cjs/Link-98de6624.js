/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var usePress = require('./usePress-00deca01.js');
var useComponentTheme = require('./useComponentTheme-082fc8e4.js');
var useInteractionStyle = require('./useInteractionStyle-442c6a12.js');
var UNSAFE_Link_themes_redwood_LinkTheme = require('./UNSAFE_Link/themes/redwood/LinkTheme.js');
require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var useTestId = require('./useTestId-8234ec1e.js');

const noop = () => { };
/**
 * Link component creates a hyperlink.
 */
function Link({ href, variant, placement = 'standalone', target, testId, 'aria-describedby': ariaDescribedBy, 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, children, onClick, isDisabled }) {
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle.useInteractionStyle();
    const { classes } = useComponentTheme.useComponentTheme(UNSAFE_Link_themes_redwood_LinkTheme.LinkRedwoodTheme, {
        needsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        variant,
        placement,
        disabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const linkClasses = classNames.classNames([classes]);
    const { pressProps } = usePress.usePress(onClick ?? noop);
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("a", { tabIndex: isTabbable && !isDisabled ? 0 : -1, href: !isDisabled ? href : undefined, "aria-describedby": ariaDescribedBy, "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, target: target, ...(!isDisabled && pressProps), ...interactionProps, ...testIdProps, class: linkClasses, children: children }));
}

exports.Link = Link;
//# sourceMappingURL=Link-98de6624.js.map
