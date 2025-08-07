/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { S as SvgChevronLeft, a as SvgChevronRight } from './ChevronRight-083aef16.js';
import { w as withDirectionIcon } from './withDirectionIcon-f8ff778c.js';

const CollapseIcon = (props) => {
    const Component = withDirectionIcon(SvgChevronRight, SvgChevronLeft);
    return jsx(Component, { ...props });
};

export { CollapseIcon as C };
//# sourceMappingURL=CollapseIcon-b6d7cfd6.js.map
