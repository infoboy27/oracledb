/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var compat = require('preact/compat');

const BarTrack = compat.forwardRef(({ id, length = '100%', children, color, orientation = 'horizontal', ariaProps, ...otherProps }, ref) => {
    const isHoriz = orientation === 'horizontal';
    return (jsxRuntime.jsx("div", { id: id, ref: ref, class: otherProps.class, ...ariaProps, style: {
            width: isHoriz ? length : undefined,
            height: isHoriz ? undefined : length,
            backgroundColor: color
        }, children: children }));
});
const BarValue = ({ length, size = '100%', orientation = 'horizontal', color, ...otherProps }) => {
    const isHoriz = orientation === 'horizontal';
    return (jsxRuntime.jsx("div", { class: otherProps.class, style: {
            width: isHoriz ? length : size,
            height: isHoriz ? size : length,
            backgroundColor: color
        } }));
};

exports.BarTrack = BarTrack;
exports.BarValue = BarValue;
//# sourceMappingURL=LinearMeter-3d06349c.js.map
