/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { B as ButtonSetContext } from './useButtonSetContext-6a483d7f.js';
import 'preact/hooks';
import { B as ButtonSet } from './ButtonSet-fa7e8acd.js';
import { p as processGlobals } from './buttonUtils-6f35c4f4.js';
import { u as useId } from './useId-03dbfdf0.js';
import 'preact';
import './dimensions-5229d942.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './Common/themes/themeContract.css.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './mergeInterpolations-e2db2a66.js';
import './classNames-4e12b00d.js';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './UNSAFE_ButtonSet/themes/ButtonSetStyles.css.js';
import './ButtonSetStyles.styles.css';
import './ButtonSetPositionContext-5730d367.js';
import './toggleButtonUtils-039c4eae.js';
import './useTestId-adde554c.js';
import './LayerHost-45f545d7.js';
import './Common/themes/redwood/theme.js';
import './useRovingTabIndexContainer-e7926bd6.js';
import './useUser-99920e02.js';
import './clientHints-c76a913b.js';
import './TabbableModeContext-7d8ad946.js';
import './useTabbableMode-a3a351d0.js';
import './refUtils-b9d8d91a.js';
import './id-83adac50.js';

/**
 * ButtonSet allow users to select the state of one or more related options.
 */
const ButtonSetMultiple = forwardRef(({ children, value: buttonSetItemValue, onCommit, display = 'all', testId, size = 'md', isDisabled = false, variant = 'outlined', layoutWidth = 'auto', 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, width, ...props }, ref) => {
    const { globalEventProps } = processGlobals(props);
    return (jsx(ButtonSetContext.Provider, { value: {
            variant: variant,
            size: size,
            isDisabled: isDisabled,
            layoutWidth: layoutWidth,
            inputType: 'checkbox',
            inputName: useId(),
            display: display,
            width: width,
            buttonSetValue: buttonSetItemValue,
            onCommit: onCommit
        }, children: jsx(ButtonSet, { ref: ref, width: width, testId: testId, "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, "aria-controls": ariaControls, ...globalEventProps, children: children }) }));
});
ButtonSetMultiple.displayName = 'ButtonSetMultiple';

export { ButtonSetMultiple };
//# sourceMappingURL=UNSAFE_ButtonSetMultiple.js.map
