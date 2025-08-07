/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('preact');
var BaseButton = require('./BaseButton-ff6f39f2.js');
var ButtonLabelLayout = require('./ButtonLabelLayout-3399b9e1.js');
var compat = require('preact/compat');
var useTooltip = require('./useTooltip-468c1c92.js');
require('./useTooltipControlled-706a3651.js');
var buttonUtils = require('./buttonUtils-252661e7.js');
var mergeProps = require('./mergeProps-e3da7237.js');

/**
 * Icon buttons are buttons that only show an icon and no label. They direct users to initiate or take actions and work with a single tap, click, or keystroke.
 */
const IconButton = compat.forwardRef(({ variant = 'outlined', isDisabled = false, isRepeat = false, size = 'md', type: buttonType = 'button', autofocus, onAction, width, tooltip, testId, 'aria-haspopup': ariaHasPopup, 'aria-label': accessibleLabel, 'aria-describedby': ariaDescribedBy, ...props }, ref) => {
    const { globalEventProps } = buttonUtils.processGlobals(props);
    const { tooltipContent, tooltipProps } = useTooltip.useTooltip({
        text: tooltip ? tooltip : accessibleLabel,
        isDisabled
    });
    const elementDetails = {
        type: 'button',
        buttonType: buttonType
    };
    const ariaProps = ariaDescribedBy ? { 'aria-describedby': ariaDescribedBy } : {};
    return (jsxRuntime.jsxs(preact.Fragment, { children: [jsxRuntime.jsx(BaseButton.BaseButton, { ...mergeProps.mergeProps(tooltipProps, globalEventProps, ariaProps), ref: ref, elementDetails: elementDetails, isDisabled: isDisabled, isRepeat: isRepeat, size: size, autofocus: autofocus, variant: variant, width: width, styling: ['min'], onAction: onAction, "aria-label": accessibleLabel ?? tooltip, "aria-haspopup": ariaHasPopup, testId: testId, children: jsxRuntime.jsx(ButtonLabelLayout.ButtonLabelLayout, { display: 'icons', startIcon: props.children, size: size }) }), tooltipContent] }));
});
IconButton.displayName = 'IconButton';

exports.IconButton = IconButton;
//# sourceMappingURL=IconButton-94f8ca5c.js.map
