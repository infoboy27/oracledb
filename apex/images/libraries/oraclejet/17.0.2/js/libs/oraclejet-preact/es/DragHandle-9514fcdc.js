/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { m as mergeProps } from './mergeProps-88ea8306.js';
import { u as useActive } from './useActive-7d9737a5.js';
import { u as useTestId } from './useTestId-adde554c.js';
import { I as Icon } from './Icon-90c3a630.js';
import { iconStyle, activeStyle, hoverStyle } from './UNSAFE_DragHandle/themes/DragHandleStyles.css.js';

const SvgDragV = (props) => (jsx(Icon, { viewBox: "0 0 24 24", ...props, children: jsx("g", { fill: "none", children: jsx("path", { d: "M20 11H4v-1h16v1zm0 3H4v-1h16v1z", fill: "currentcolor" }) }) }));

/**
 * A draggable icon that shows grab cursor when users hover the mouse on it,
 * and shows grabbing cursor when users click the icon.
 */
function DragHandle({ testId }) {
    const { isActive, activeProps } = useActive();
    const testIdProps = useTestId(testId);
    const classes = classNames([iconStyle, isActive ? activeStyle : hoverStyle]);
    return (jsx("div", { ...mergeProps(activeProps, testIdProps), draggable: true, class: classes, role: "presentation", children: jsx(SvgDragV, {}) }));
}

export { DragHandle as D };
//# sourceMappingURL=DragHandle-9514fcdc.js.map
