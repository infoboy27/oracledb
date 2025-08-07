/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useRovingTabIndexContainer } from './useRovingTabIndexContainer-e7926bd6.js';
import { T as TabbableModeContext } from './TabbableModeContext-7d8ad946.js';
import { u as useTabbableMode } from './useTabbableMode-a3a351d0.js';
import { B as ButtonLayout } from './ButtonLayout-83aabb56.js';

/**
 * A toolbar groups a set of controls, such as buttons and menu buttons, into a single tab stop.
 */
const Toolbar = ({ 'aria-controls': ariaControls, 'aria-label': ariaLabel, children, spacing = 'lg' }) => {
    const { isTabbable } = useTabbableMode();
    const { focusedId, rovingTabIndexContainerProps } = useRovingTabIndexContainer(!isTabbable);
    return (jsx("div", { "aria-controls": ariaControls, "aria-label": ariaLabel, role: "toolbar", ...rovingTabIndexContainerProps, children: jsx(ButtonLayout, { spacing: spacing, children: jsx(TabbableModeContext.Provider, { value: { isTabbable: isTabbable, isRoving: true, focusedId: focusedId }, children: children }) }) }));
};

export { Toolbar as T };
//# sourceMappingURL=Toolbar-f0e57a9d.js.map
