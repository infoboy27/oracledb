/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { styles } from './UNSAFE_ButtonSet/themes/ButtonSetStyles.css.js';
import { u as useButtonSetContext } from './useButtonSetContext-6a483d7f.js';
import { toChildArray, Fragment, isValidElement } from 'preact';
import { B as ButtonSetPositionContext } from './ButtonSetPositionContext-5730d367.js';
import { useContext } from 'preact/hooks';
import { i as indexToPosition } from './toggleButtonUtils-039c4eae.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { u as useRovingTabIndexContainer } from './useRovingTabIndexContainer-e7926bd6.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { m as mergeRefs } from './refUtils-b9d8d91a.js';

/**
 * ButtonSetItems renders the ButtonSet children
 */
function ButtonSetItems({ children }) {
    const childrenArray = toChildArray(children);
    return (jsx(Fragment, { children: childrenArray.map((value, index) => {
            if (!isValidElement(value))
                return null;
            else
                return (jsx(ButtonSetPositionContext.Provider, { value: {
                        position: indexToPosition(index, childrenArray.length)
                    }, children: value }));
        }) }));
}
ButtonSetItems.displayName = 'ButtonSetItems';

const interpolations = [...Object.values(dimensionInterpolations)];
const styleInterpolations = mergeInterpolations(interpolations);
/**
 * ButtonSet allow users to select the state of one or more related options.
 */
const ButtonSet = forwardRef(({ children, testId, 'aria-label': accessibleLabel, 'aria-labelledby': ariaLabelledBy, 'aria-controls': ariaControls, 'aria-describedby': ariaDescribedBy, width }, ref) => {
    const { layoutWidth } = useButtonSetContext();
    const testIdProps = useTestId(testId);
    const { isTabbable } = useTabbableMode();
    const { isRoving } = useContext(TabbableModeContext);
    const { focusedId, rovingTabIndexContainerProps: { ref: rovingRef, ...rovingProps } } = useRovingTabIndexContainer(!isTabbable);
    const { class: cls, ...intStyles } = styleInterpolations({ width });
    const rootStyles = classNames([
        styles.base,
        cls,
        layoutWidth === 'equal' ? styles.fullWidth : undefined
    ]);
    return (jsx("span", { role: "toolbar", class: rootStyles, style: intStyles, ref: isRoving ? ref : mergeRefs(ref, rovingRef), "aria-label": accessibleLabel, "aria-labelledby": ariaLabelledBy, "aria-describedby": ariaDescribedBy, "aria-controls": ariaControls, ...testIdProps, ...rovingProps, children: isRoving ? (jsx(ButtonSetItems, { children: children })) : (jsx(TabbableModeContext.Provider, { value: { isTabbable: isTabbable, isRoving: true, focusedId: focusedId }, children: jsx(ButtonSetItems, { children: children }) })) }));
});
ButtonSet.displayName = 'ButtonSet';

export { ButtonSet as B };
//# sourceMappingURL=ButtonSet-fa7e8acd.js.map
