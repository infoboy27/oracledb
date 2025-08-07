/* @oracle/oraclejet-preact: undefined */
import { screen } from '@testing-library/preact';

//TODO: JET-63873
function getIcon(menuItem, selector) {
    return menuItem.querySelector(selector);
}
function getAllMenuItemsByRole(role, hidden = true) {
    return screen.getAllByRole(role, { hidden });
}
function getMenuItemByRole(role, hidden = true) {
    return screen.getByRole(role, { hidden });
}
function getLabel(label) {
    return screen.getByText(label);
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

export { getAllMenuItemsByRole as a, getLabel as b, getIcon as c, getMenuItemByRole as g, setObserverConfig as s };
//# sourceMappingURL=menuTestsUtils-c74ce3da.js.map
