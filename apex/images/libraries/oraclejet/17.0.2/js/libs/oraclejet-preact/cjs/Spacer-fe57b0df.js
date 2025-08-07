/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var dimensions = require('./dimensions-b48bf1ab.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');
var flexitem = require('./flexitem-fee13e26.js');

const interpolations = [...Object.values(dimensions.dimensionInterpolations), flexitem.flexitemInterpolations.flex];
const styleInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
const Spacer = ({ ...props }) => {
    const { class: cls, ...styles } = styleInterpolations(props);
    return jsxRuntime.jsx("div", { class: cls, style: styles });
};

exports.Spacer = Spacer;
//# sourceMappingURL=Spacer-fe57b0df.js.map
