/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var hooks = require('preact/hooks');
var useId = require('./useId-6c0eeb27.js');
var Check = require('./Check-f72ac53c.js');
var MenuItem = require('./MenuItem-9a73694f.js');
var SelectMenuGroupContext = require('./SelectMenuGroupContext-bbb4f7e0.js');

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
    return hooks.useContext(SelectMenuGroupContext.SelectMenuGroupContext);
}

function SelectMenuItem({ value, label, isDisabled, endIcon }) {
    const { isMultiple, value: selectedValue, onCommit } = useSelectMenuGroupContext();
    const uniqueID = useId.useId();
    const id = hooks.useMemo(() => `oj-menu-item-${uniqueID}`, [uniqueID]);
    const { isSelected, memoizedOnCommit } = hooks.useMemo(() => {
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
    return (jsxRuntime.jsx(MenuItem.BaseMenuItem, { id: id, type: "select", role: isMultiple ? 'menuitemcheckbox' : 'menuitemradio', isChecked: isSelected, isDisabled: isDisabled, startIcon: isSelected ? jsxRuntime.jsx(Check.SvgCheck, {}) : jsxRuntime.jsx("span", {}), label: label, onAction: memoizedOnCommit, endIcon: endIcon }));
}

exports.SelectMenuItem = SelectMenuItem;
//# sourceMappingURL=SelectMenuItem-fe9e9547.js.map
