/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { S as SelectMenuGroupContext } from './SelectMenuGroupContext-b56cf5d4.js';

function SelectSingleMenuGroup({ value, onCommit, children }) {
    return (jsx(SelectMenuGroupContext.Provider, { value: { isMultiple: false, value, onCommit }, children: children }));
}

export { SelectSingleMenuGroup as S };
//# sourceMappingURL=SelectSingleMenuGroup-05168f64.js.map
