/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { L as List } from './List-9026206d.js';

/**
 * Component that renders items as a flat list.
 * In order to maximize performance, only items that are visible in the viewport are rendered.
 */
function VirtualizedListView(props) {
    return (jsx(List, { isVirtualized: true, ...props, children: props.children }));
}

export { VirtualizedListView as V };
//# sourceMappingURL=VirtualizedListView-1900c71e.js.map
