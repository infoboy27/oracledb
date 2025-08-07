/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { forwardRef } from 'preact/compat';

const BarTrack = forwardRef(({ id, length = '100%', children, color, orientation = 'horizontal', ariaProps, ...otherProps }, ref) => {
    const isHoriz = orientation === 'horizontal';
    return (jsx("div", { id: id, ref: ref, class: otherProps.class, ...ariaProps, style: {
            width: isHoriz ? length : undefined,
            height: isHoriz ? undefined : length,
            backgroundColor: color
        }, children: children }));
});
const BarValue = ({ length, size = '100%', orientation = 'horizontal', color, ...otherProps }) => {
    const isHoriz = orientation === 'horizontal';
    return (jsx("div", { class: otherProps.class, style: {
            width: isHoriz ? length : size,
            height: isHoriz ? size : length,
            backgroundColor: color
        } }));
};

export { BarTrack as B, BarValue as a };
//# sourceMappingURL=LinearMeter-901ec883.js.map
