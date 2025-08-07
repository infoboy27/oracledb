/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useTestId } from './useTestId-adde554c.js';
import { c as classNames } from './classNames-4e12b00d.js';
import { b as boxAlignmentInterpolations } from './boxalignment-486c5ac9.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { f as flexboxInterpolations } from './flexbox-529f25da.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import './FlexStyles.styles.css';

var baseStyles = 'FlexStyles_baseStyles__10p93f60';
var marginZeroStyles = 'FlexStyles_marginZeroStyles__10p93f61';

const interpolations = [
    ...Object.values(dimensionInterpolations),
    ...Object.values(flexboxInterpolations),
    ...Object.values(flexitemInterpolations),
    ...Object.values(boxAlignmentInterpolations)
];
const styleInterpolations = mergeInterpolations(interpolations);
const Flex = ({ children, hasZeroMargins = true, testId, ...props }) => {
    const flexComponentClasses = classNames([baseStyles, hasZeroMargins && marginZeroStyles]);
    const { class: cls, ...styles } = styleInterpolations(props);
    const testIdProps = useTestId(testId);
    return (jsx("div", { class: `${flexComponentClasses} ${cls}`, style: styles, ...testIdProps, children: children }));
};

export { Flex as F, marginZeroStyles as m };
//# sourceMappingURL=Flex-24628925.js.map
