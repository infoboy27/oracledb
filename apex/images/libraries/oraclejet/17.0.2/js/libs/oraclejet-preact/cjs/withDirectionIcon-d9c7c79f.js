/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var useUser = require('./useUser-a6d15333.js');

// Returns a component that renders one of the given icon components based on reading direction
const withDirectionIcon = (LtrIcon, RtlIcon) => {
    return (props) => {
        const { direction } = useUser.useUser();
        return direction === 'ltr' ? jsxRuntime.jsx(LtrIcon, { ...props }) : jsxRuntime.jsx(RtlIcon, { ...props });
    };
};

exports.withDirectionIcon = withDirectionIcon;
//# sourceMappingURL=withDirectionIcon-d9c7c79f.js.map
