/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('@testing-library/preact');

//TODO: JET-63873
function getIcon(menuItem, selector) {
    return menuItem.querySelector(selector);
}
function getAllMenuItemsByRole(role, hidden = true) {
    return preact.screen.getAllByRole(role, { hidden });
}
function getMenuItemByRole(role, hidden = true) {
    return preact.screen.getByRole(role, { hidden });
}
function getLabel(label) {
    return preact.screen.getByText(label);
}
function setObserverConfig() {
    if (!window.ResizeObserver) {
        // ResizeObserver isn't available in test environment
        const MockResizeObserver = jest.fn();
        MockResizeObserver.mockReturnValue({
            observe: () => null,
            unobserve: () => null,
            disconnect: () => null
        });
        Object.defineProperty(global, 'ResizeObserver', {
            writable: true,
            configurable: true,
            value: MockResizeObserver
        });
    }
}

exports.getAllMenuItemsByRole = getAllMenuItemsByRole;
exports.getIcon = getIcon;
exports.getLabel = getLabel;
exports.getMenuItemByRole = getMenuItemByRole;
exports.setObserverConfig = setObserverConfig;
//# sourceMappingURL=menuTestsUtils-9d5d258a.js.map
