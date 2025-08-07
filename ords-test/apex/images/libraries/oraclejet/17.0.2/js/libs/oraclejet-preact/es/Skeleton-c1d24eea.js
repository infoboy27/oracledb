/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { c as classNames } from './classNames-4e12b00d.js';
import { d as dimensionInterpolations } from './dimensions-5229d942.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import { b as borderInterpolations } from './borders-98a63040.js';
import { u as useComponentTheme } from './useComponentTheme-d2f9e47f.js';
import { SkeletonRedwoodTheme } from './UNSAFE_Skeleton/themes/redwood/SkeletonTheme.js';

const dimensions = ['height', 'width'];
const border = ['borderRadius'];
// Create an array [dimensionInterpolations['height'], dimensionInterpolations['width']]
const skeletonDimensionInterpolation = Array.from(dimensions, (x) => dimensionInterpolations[x]);
const borderRadiusInterpolation = Array.from(border, (x) => borderInterpolations[x]);
const interpolations = [
    ...Object.values(borderRadiusInterpolation),
    ...Object.values(skeletonDimensionInterpolation)
];
const SkeletonInterpolations = mergeInterpolations(interpolations);
/**
 * Skeleton component allows the appropriate skeleton to be rendered based on the
 * property values
 **/
function Skeleton({ ...props }) {
    const { classes: skeletonBase } = useComponentTheme(SkeletonRedwoodTheme);
    const classes = classNames([skeletonBase]);
    const skeletonDimensions = SkeletonInterpolations({ width: '100%', borderRadius: 0, ...props });
    return jsx("div", { style: skeletonDimensions, class: classes });
}

export { Skeleton as S };
//# sourceMappingURL=Skeleton-c1d24eea.js.map
