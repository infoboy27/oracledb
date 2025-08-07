/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var classNames = require('./classNames-c14c6ef3.js');
var mergeProps = require('./mergeProps-e3da7237.js');
var useActive = require('./useActive-b15c9e7e.js');
var useTestId = require('./useTestId-8234ec1e.js');
var Icon = require('./Icon-3ffd13dc.js');
var UNSAFE_DragHandle_themes_DragHandleStyles_css = require('./UNSAFE_DragHandle/themes/DragHandleStyles.css.js');

const SvgDragV = (props) => (jsxRuntime.jsx(Icon.Icon, { viewBox: "0 0 24 24", ...props, children: jsxRuntime.jsx("g", { fill: "none", children: jsxRuntime.jsx("path", { d: "M20 11H4v-1h16v1zm0 3H4v-1h16v1z", fill: "currentcolor" }) }) }));

/**
 * A draggable icon that shows grab cursor when users hover the mouse on it,
 * and shows grabbing cursor when users click the icon.
 */
function DragHandle({ testId }) {
    const { isActive, activeProps } = useActive.useActive();
    const testIdProps = useTestId.useTestId(testId);
    const classes = classNames.classNames([UNSAFE_DragHandle_themes_DragHandleStyles_css.iconStyle, isActive ? UNSAFE_DragHandle_themes_DragHandleStyles_css.activeStyle : UNSAFE_DragHandle_themes_DragHandleStyles_css.hoverStyle]);
    return (jsxRuntime.jsx("div", { ...mergeProps.mergeProps(activeProps, testIdProps), draggable: true, class: classes, role: "presentation", children: jsxRuntime.jsx(SvgDragV, {}) }));
}

exports.DragHandle = DragHandle;
//# sourceMappingURL=DragHandle-d35fc8ac.js.map
