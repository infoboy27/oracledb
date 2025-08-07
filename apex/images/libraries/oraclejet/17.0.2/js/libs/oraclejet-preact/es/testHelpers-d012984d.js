/* @oracle/oraclejet-preact: undefined */
import { screen, fireEvent } from '@testing-library/preact';

/**
 * List test Adapters to abstract common unit test actions away from the implementation details.
 */
const mouseItemSelection = (element, options) => {
    fireEvent.click(element, options);
};
const mouseCheckboxSelection = (itemIndex, options) => {
    // we are looking for the checkbox icon when handling click events
    const checkboxes = screen.getAllByRole('img', { hidden: true });
    const checkbox = checkboxes[itemIndex];
    if (checkbox) {
        if (typeof jest !== typeof undefined) {
            fireEvent.click(checkbox, options);
        }
        else {
            setTimeout(() => {
                fireEvent.click(checkbox, options);
            }, 100);
        }
    }
    else {
        throw new Error('Cannot find checkbox!');
    }
};
const getRoot = async (role = 'grid') => {
    return screen.findByRole(role);
};
const getItems = async (role = 'row') => {
    return screen.findAllByRole(role);
};
const getContents = async (role = 'gridcell') => {
    return screen.findAllByRole(role);
};
const fireDragAndDropEvent = (dragElement, dropElement) => {
    fireEvent.dragStart(dragElement);
    fireEvent.dragEnter(dropElement);
    fireEvent.drop(dropElement);
    fireEvent.dragEnd(dragElement);
};
const keyboardReorder = (element, keyCode) => {
    fireEvent.keyDown(element, {
        key: keyCode,
        code: keyCode,
        shiftKey: true,
        metaKey: true
    });
};

export { getItems as a, getContents as b, mouseCheckboxSelection as c, fireDragAndDropEvent as f, getRoot as g, keyboardReorder as k, mouseItemSelection as m };
//# sourceMappingURL=testHelpers-d012984d.js.map
