/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { S as SelectMenuGroupContext } from './SelectMenuGroupContext-b56cf5d4.js';

function SelectMultipleMenuGroup({ value, onCommit, children }) {
    return (jsx(SelectMenuGroupContext.Provider, { value: { isMultiple: true, value, onCommit }, children: children }));
}

export { SelectMultipleMenuGroup as S };
//# sourceMappingURL=SelectMultipleMenuGroup-5242f91a.js.map
