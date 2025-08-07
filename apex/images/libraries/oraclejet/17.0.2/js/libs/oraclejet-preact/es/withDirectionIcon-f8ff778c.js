/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { u as useUser } from './useUser-99920e02.js';

// Returns a component that renders one of the given icon components based on reading direction
const withDirectionIcon = (LtrIcon, RtlIcon) => {
    return (props) => {
        const { direction } = useUser();
        return direction === 'ltr' ? jsx(LtrIcon, { ...props }) : jsx(RtlIcon, { ...props });
    };
};

export { withDirectionIcon as w };
//# sourceMappingURL=withDirectionIcon-f8ff778c.js.map
