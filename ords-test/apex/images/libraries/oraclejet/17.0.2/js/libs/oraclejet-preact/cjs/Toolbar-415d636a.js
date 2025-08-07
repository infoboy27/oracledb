/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useRovingTabIndexContainer = require('./useRovingTabIndexContainer-ff6fef9d.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
var useTabbableMode = require('./useTabbableMode-5c8fd9e5.js');
var ButtonLayout = require('./ButtonLayout-821ed00b.js');

/**
 * A toolbar groups a set of controls, such as buttons and menu buttons, into a single tab stop.
 */
const Toolbar = ({ 'aria-controls': ariaControls, 'aria-label': ariaLabel, children, spacing = 'lg' }) => {
    const { isTabbable } = useTabbableMode.useTabbableMode();
    const { focusedId, rovingTabIndexContainerProps } = useRovingTabIndexContainer.useRovingTabIndexContainer(!isTabbable);
    return (jsxRuntime.jsx("div", { "aria-controls": ariaControls, "aria-label": ariaLabel, role: "toolbar", ...rovingTabIndexContainerProps, children: jsxRuntime.jsx(ButtonLayout.ButtonLayout, { spacing: spacing, children: jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: isTabbable, isRoving: true, focusedId: focusedId }, children: children }) }) }));
};

exports.Toolbar = Toolbar;
//# sourceMappingURL=Toolbar-415d636a.js.map
