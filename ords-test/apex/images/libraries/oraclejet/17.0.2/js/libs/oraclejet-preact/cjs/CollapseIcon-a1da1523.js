/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var ChevronRight = require('./ChevronRight-3aa70117.js');
var withDirectionIcon = require('./withDirectionIcon-d9c7c79f.js');

const CollapseIcon = (props) => {
    const Component = withDirectionIcon.withDirectionIcon(ChevronRight.SvgChevronRight, ChevronRight.SvgChevronLeft);
    return jsxRuntime.jsx(Component, { ...props });
};

exports.CollapseIcon = CollapseIcon;
//# sourceMappingURL=CollapseIcon-a1da1523.js.map
