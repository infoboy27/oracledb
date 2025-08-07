/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { f as flexitemInterpolations } from './flexitem-7b7f7920.js';

const interpolations = [...Object.values(dimensionInterpolations), flexitemInterpolations.flex];
const styleInterpolations = mergeInterpolations(interpolations);
const Spacer = ({ ...props }) => {
    const { class: cls, ...styles } = styleInterpolations(props);
    return jsx("div", { class: cls, style: styles });
};

export { Spacer as S };
//# sourceMappingURL=Spacer-e49350e7.js.map
