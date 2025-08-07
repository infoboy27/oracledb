/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var useButtonSetContext = require('./useButtonSetContext-a2f31c8e.js');
require('preact/hooks');
var ButtonSet = require('./ButtonSet-dc50f9d4.js');
var buttonUtils = require('./buttonUtils-252661e7.js');
var useId = require('./useId-6c0eeb27.js');
require('preact');
require('./dimensions-b48bf1ab.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./Common/themes/themeContract.css.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./mergeInterpolations-6727b536.js');
require('./classNames-c14c6ef3.js');
require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('./UNSAFE_ButtonSet/themes/ButtonSetStyles.css.js');

require('./ButtonSetPositionContext-6a358667.js');
require('./toggleButtonUtils-0da9d88d.js');
require('./useTestId-8234ec1e.js');
require('./LayerHost-46e4d858.js');
require('./Common/themes/redwood/theme.js');
require('./useRovingTabIndexContainer-ff6fef9d.js');
require('./useUser-a6d15333.js');
require('./clientHints-9e411b6e.js');
require('./TabbableModeContext-e99d527e.js');
require('./useTabbableMode-5c8fd9e5.js');
require('./refUtils-915b985d.js');
require('./id-86356250.js');

/**
 * ButtonSet allow users to select the state of one or more related options.
 */
const ButtonSetMultiple = compat.forwardRef(({ children, value: buttonSetItemValue, onCommit, display = 'all', testId, size = 'md', isDisabled = false, variant = 'outlined', layoutWidth = 'auto', 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const { globalEventProps } = buttonUtils.processGlobals(props);
    return (jsxRuntime.jsx(useButtonSetContext.ButtonSetContext.Provider, { value: {
            variant: variant,
            size: size,
            isDisabled: isDisabled,
            layoutWidth: layoutWidth,
            inputType: 'checkbox',
            inputName: useId.useId(),
            display: display,
            width: width,
            buttonSetValue: buttonSetItemValue,
            onCommit: onCommit
        }, children: jsxRuntime.jsx(ButtonSet.ButtonSet, { ref: ref, width: width, testId: testId, "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, "aria-controls": ariaControls, ...globalEventProps, children: children }) }));
});
ButtonSetMultiple.displayName = 'ButtonSetMultiple';

exports.ButtonSetMultiple = ButtonSetMultiple;
//# sourceMappingURL=UNSAFE_ButtonSetMultiple.js.map
