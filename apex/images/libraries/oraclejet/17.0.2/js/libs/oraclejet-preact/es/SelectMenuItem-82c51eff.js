/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { useContext, useMemo } from 'preact/hooks';
import { u as useId } from './useId-03dbfdf0.js';
import { S as SvgCheck } from './Check-c76fe451.js';
import { B as BaseMenuItem } from './MenuItem-a8f9c954.js';
import { S as SelectMenuGroupContext } from './SelectMenuGroupContext-b56cf5d4.js';

/**
 * @license
 * Copyright (c) %FIRST_YEAR% %CURRENT_YEAR%, Oracle and/or its affiliates.
 * Licensed under The Universal Permissive License (UPL), Version 1.0
 * as shown at https://oss.oracle.com/licenses/upl/
 * @ignore
 */
/**
 * Utility hook for consuming the MenuContext
 *
 * @returns The value of MenuContext provider
 */
function useSelectMenuGroupContext() {
    return useContext(SelectMenuGroupContext);
}

function SelectMenuItem({ value, label, isDisabled, endIcon }) {
    const { isMultiple, value: selectedValue, onCommit } = useSelectMenuGroupContext();
    const uniqueID = useId();
    const id = useMemo(() => `oj-menu-item-${uniqueID}`, [uniqueID]);
    const { isSelected, memoizedOnCommit } = useMemo(() => {
        if (!isMultiple) {
            return {
                isSelected: selectedValue === value,
                memoizedOnCommit: () => {
                    onCommit?.({ value, previousValue: selectedValue });
                }
            };
        }
        return {
            isSelected: !!selectedValue?.includes(value),
            memoizedOnCommit: () => {
                const proposedValue = isSelected
                    ? selectedValue?.filter((val) => val !== value) || []
                    : [...(selectedValue || []), value];
                onCommit?.({ value: proposedValue, previousValue: selectedValue });
            }
        };
    }, [selectedValue, value, onCommit, isMultiple]);
    return (jsx(BaseMenuItem, { id: id, type: "select", role: isMultiple ? 'menuitemcheckbox' : 'menuitemradio', isChecked: isSelected, isDisabled: isDisabled, startIcon: isSelected ? jsx(SvgCheck, {}) : jsx("span", {}), label: label, onAction: memoizedOnCommit, endIcon: endIcon }));
}

export { SelectMenuItem as S };
//# sourceMappingURL=SelectMenuItem-82c51eff.js.map
