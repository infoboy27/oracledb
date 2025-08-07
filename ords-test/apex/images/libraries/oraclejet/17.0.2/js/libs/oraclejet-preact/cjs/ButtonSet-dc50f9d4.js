/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var classNames = require('./classNames-c14c6ef3.js');
var UNSAFE_ButtonSet_themes_ButtonSetStyles_css = require('./UNSAFE_ButtonSet/themes/ButtonSetStyles.css.js');
var useButtonSetContext = require('./useButtonSetContext-a2f31c8e.js');
var preact = require('preact');
var ButtonSetPositionContext = require('./ButtonSetPositionContext-6a358667.js');
var hooks = require('preact/hooks');
var toggleButtonUtils = require('./toggleButtonUtils-0da9d88d.js');
var useTestId = require('./useTestId-8234ec1e.js');
var useRovingTabIndexContainer = require('./useRovingTabIndexContainer-ff6fef9d.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var refUtils = require('./refUtils-915b985d.js');

/**
 * ButtonSetItems renders the ButtonSet children
 */
function ButtonSetItems({ children }) {
    const childrenArray = preact.toChildArray(children);
    return (jsxRuntime.jsx(preact.Fragment, { children: childrenArray.map((value, index) => {
            if (!preact.isValidElement(value))
                return null;
            else
                return (jsxRuntime.jsx(ButtonSetPositionContext.ButtonSetPositionContext.Provider, { value: {
                        position: toggleButtonUtils.indexToPosition(index, childrenArray.length)
                    }, children: value }));
        }) }));
}
ButtonSetItems.displayName = 'ButtonSetItems';

const interpolations = [...Object.values(dimensions.dimensionInterpolations)];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * ButtonSet allow users to select the state of one or more related options.
 */
const ButtonSet = compat.forwardRef(({ children, testId, 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, width }, ref) => {
    const { layoutWidth } = useButtonSetContext.useButtonSetContext();
    const testIdProps = useTestId.useTestId(testId);
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { isRoving } = hooks.useContext(TabbableModeContext.TabbableModeContext);
    const { focusedId, rovingTabIndexContainerProps: { ref: rovingRef, ...rovingProps } } = useRovingTabIndexContainer.useRovingTabIndexContainer(!isTabbable);
    const { class: cls, ...intStyles } = styleInterpolations({ width });
    const rootStyles = classNames.classNames([
        UNSAFE_ButtonSet_themes_ButtonSetStyles_css.styles.base,
        cls,
        layoutWidth === 'equal' ? UNSAFE_ButtonSet_themes_ButtonSetStyles_css.styles.fullWidth : undefined
    ]);
    return (jsxRuntime.jsx("span", { role: "toolbar", class: rootStyles, style: intStyles, ref: isRoving ? ref : refUtils.mergeRefs(ref, rovingRef), "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, "aria-controls": ariaControls, ...testIdProps, ...rovingProps, children: isRoving ? (jsxRuntime.jsx(ButtonSetItems, { children: children })) : (jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: isTabbable, isRoving: true, focusedId: focusedId }, children: jsxRuntime.jsx(ButtonSetItems, { children: children }) })) }));
});
ButtonSet.displayName = 'ButtonSet';

exports.ButtonSet = ButtonSet;
//# sourceMappingURL=ButtonSet-dc50f9d4.js.map
