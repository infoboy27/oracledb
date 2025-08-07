/* @oracle/oraclejet-preact: undefined */
'use strict';

var preact = require('@testing-library/preact');

/**
 * List test Adapters to abstract common unit test actions away from the implementation details.
 */
const mouseItemSelection = (element, options) => {
    preact.fireEvent.click(element, options);
};
const mouseCheckboxSelection = (itemIndex, options) => {
    // we are looking for the checkbox icon when handling click events
    const checkboxes = preact.screen.getAllByRole('img', { hidden: true });
    const checkbox = checkboxes[itemIndex];
    if (checkbox) {
        if (typeof jest !== typeof undefined) {
            preact.fireEvent.click(checkbox, options);
        }
        else {
            setTimeout(() => {
                preact.fireEvent.click(checkbox, options);
            }, 100);
        }
    }
    else {
        throw new Error('Cannot find checkbox!');
    }
};
const getRoot = async (role = 'grid') => {
    return preact.screen.findByRole(role);
};
const getItems = async (role = 'row') => {
    return preact.screen.findAllByRole(role);
};
const getContents = async (role = 'gridcell') => {
    return preact.screen.findAllByRole(role);
};
const fireDragAndDropEvent = (dragElement, dropElement) => {
    preact.fireEvent.dragStart(dragElement);
    preact.fireEvent.dragEnter(dropElement);
    preact.fireEvent.drop(dropElement);
    preact.fireEvent.dragEnd(dragElement);
};
const keyboardReorder = (element, keyCode) => {
    preact.fireEvent.keyDown(element, {
        key: keyCode,
        code: keyCode,
        shiftKey: true,
        metaKey: true
    });
};

exports.fireDragAndDropEvent = fireDragAndDropEvent;
exports.getContents = getContents;
exports.getItems = getItems;
exports.getRoot = getRoot;
exports.keyboardReorder = keyboardReorder;
exports.mouseCheckboxSelection = mouseCheckboxSelection;
exports.mouseItemSelection = mouseItemSelection;
//# sourceMappingURL=testHelpers-15e6ef95.js.map
