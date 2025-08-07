/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { u as usePress } from './usePress-97fc1cf1.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { u as useInteractionStyle } from './useInteractionStyle-d65c72b6.js';
import { LinkRedwoodTheme } from './UNSAFE_Link/themes/redwood/LinkTheme.js';
import './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { u as useTestId } from './useTestId-adde554c.js';

const noop = () => { };
/**
 * Link component creates a hyperlink.
 */
function Link({ href, variant, placement = 'standalone', target, testId, 'aria-describedby': ariaDescribedBy, 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, children, onClick, isDisabled }) {
    const { interactionProps, applyPseudoHoverStyle, applyHoverStyle } = useInteractionStyle();
    const { classes } = useComponentTheme(LinkRedwoodTheme, {
        needsEventsHover: applyHoverStyle ? 'isNeedsEventsHover' : 'notNeedsEventsHover',
        pseudoHover: applyPseudoHoverStyle ? 'isPseudoHover' : 'notPseudoHover',
        variant,
        placement,
        disabled: isDisabled ? 'isDisabled' : 'notDisabled'
    });
    const { isTabbable } = useTabbableMode();
    const linkClasses = classNames([classes]);
    const { pressProps } = usePress(onClick ?? noop);
    const testIdProps = useTestId(testId);
    return (jsx("a", { tabIndex: isTabbable && !isDisabled ? 0 : -1, href: !isDisabled ? href : undefined, "aria-describedby": ariaDescribedBy, "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, target: target, ...(!isDisabled && pressProps), ...interactionProps, ...testIdProps, class: linkClasses, children: children }));
}

export { Link as L };
//# sourceMappingURL=Link-bfa35319.js.map
