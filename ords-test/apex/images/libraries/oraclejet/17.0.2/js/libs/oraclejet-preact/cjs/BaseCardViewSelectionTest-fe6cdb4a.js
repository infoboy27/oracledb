/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var userEvent = require('@testing-library/user-event');
var chai = require('chai');
var resources_nls_en_bundle = require('./resources/nls/en/bundle.js');
var clientHints = require('./clientHints-9e411b6e.js');
var Text = require('./Text-aaacb6a0.js');
var View = require('./View-011404a7.js');
var Flex = require('./Flex-fbba4ad6.js');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var Center = require('./Center-dce9d477.js');
var DragHandle = require('./DragHandle-d35fc8ac.js');
var Button = require('./Button-b5af1b23.js');
var Avatar = require('./Avatar-c84a09ae.js');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var userEvent__default = /*#__PURE__*/_interopDefaultLegacy(userEvent);

const CardContent = ({ context, showButton, isReorderEnabled }) => {
    const dragIcon = isReorderEnabled && (jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: { mode: 'test' }, children: jsxRuntime.jsx(Center.Center, { children: jsxRuntime.jsx(DragHandle.DragHandle, { testId: `drag-icon-${context.metadata.key}` }) }) }));
    const buttons = showButton && (jsxRuntime.jsx(View.View, { paddingBlockStart: '1x', children: jsxRuntime.jsxs(Flex.Flex, { direction: "row", wrap: "wrap", gap: '1x', width: '100%', children: [jsxRuntime.jsx(Button.Button, { variant: "outlined", size: "md", label: "A" }), jsxRuntime.jsx(Button.Button, { variant: "outlined", size: "md", label: "B" })] }) }));
    return (jsxRuntime.jsxs(View.View, { padding: "6px", children: [dragIcon, jsxRuntime.jsxs(View.View, { padding: "10px", paddingBlockEnd: 0, children: [jsxRuntime.jsx(Avatar.Avatar, { initials: context.data.initials, size: "xl" }), jsxRuntime.jsxs(View.View, { paddingBlockStart: "2x", children: [jsxRuntime.jsx(Text.Text, { variant: "primary", size: "md", lineClamp: 1, children: context.data.name }), jsxRuntime.jsx(Text.Text, { variant: "secondary", size: "md", lineClamp: 1, children: context.data.title })] })] }), jsxRuntime.jsxs(View.View, { padding: "10px", paddingBlockStart: 0, children: [buttons, context.selector?.()] })] }));
};
const populateData = (count, isNumberKey) => [...Array(count)].map((_, i) => ({
    id: isNumberKey ? i : `${i}`,
    name: `Employee ${i}`,
    title: `Employee title ${i}`,
    initials: `E${i}`
}));
const getRoot = async () => {
    return preact.screen.findByRole('grid');
};
const getItems = async (role = 'row') => {
    return preact.screen.findAllByRole(role);
};
const getContents = async (role = 'gridcell') => {
    return preact.screen.findAllByRole(role);
};
const mouseItemSelection = (element, options) => {
    preact.fireEvent.click(element, options);
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

const testRender = ({ GenericCardGrid, ActionCardGrid, SelectionCardGrid, ContentUpdatableCardGrid }) => {
    it('initial render', async function () {
        const data = populateData(100);
        preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        chai.expect(items.length).eq(25);
    });
    it('checking key type - string key', async () => {
        const data = populateData(3);
        preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        chai.expect(items[0].dataset['ojKeyType'] === undefined).eq(true);
        chai.expect(items[1].dataset['ojKeyType'] === undefined).eq(true);
        chai.expect(items[2].dataset['ojKeyType'] === undefined).eq(true);
    });
    it('checking key type - numeric key', async () => {
        const data = populateData(3, true);
        preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        chai.expect(items[0].dataset['ojKeyType']).eq('number');
        chai.expect(items[1].dataset['ojKeyType']).eq('number');
        chai.expect(items[2].dataset['ojKeyType']).eq('number');
    });
    it('aria attributes - multiselectable and selected, selectionMode is none', async () => {
        const data = populateData(2);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        chai.expect(grid.getAttribute('aria-multiselectable')).eq(null);
        chai.expect(items[0].getAttribute('aria-selected')).eq(null);
        chai.expect(items[1].getAttribute('aria-selected')).eq(null);
    });
    it('aria attributes - multiselectable and selected, selectionMode is single', async () => {
        const data = populateData(2);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'single', selectedKeys: new Set(['1']) }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        chai.expect(grid.getAttribute('aria-multiselectable')).eq('false');
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
    });
    it('aria attributes - multiselectable and selected, selectionMode is multiple', async () => {
        const data = populateData(3);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple', selectedKeys: new Set(['1', '2']) }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        chai.expect(grid.getAttribute('aria-multiselectable')).eq('true');
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
    });
    // skip this test in jest, only run it in karma mocha
    if (typeof jest === typeof undefined) {
        // because jest doesn't show grid layout, the number of focusable elements is not calculated correctly
        it('content focusBehavior - valid case', async () => {
            const data = populateData(3);
            preact.render(jsxRuntime.jsx(ActionCardGrid, { data: data }));
            const items = await getItems('gridcell');
            await userEvent__default["default"].tab();
            await preact.waitFor(() => {
                chai.expect(items[0].matches(':focus-within')).to.be.true;
            });
        });
        it('content focusBehavior - invalid case', async () => {
            const data = populateData(3);
            preact.render(jsxRuntime.jsx(ActionCardGrid, { data: data, showButton: true }));
            const grid = await getRoot();
            await userEvent__default["default"].tab();
            await preact.waitFor(() => {
                chai.expect(grid.matches(':focus')).to.be.true;
            });
        });
    }
    // JET-61732
    it('memoization - update memoized children', async () => {
        const data = populateData(3);
        const { queryByTestId } = preact.render(jsxRuntime.jsx(ContentUpdatableCardGrid, { data: data }));
        const elem0 = queryByTestId(data[0].id);
        const elem1 = queryByTestId(data[1].id);
        const elem2 = queryByTestId(data[2].id);
        chai.expect(elem0?.innerHTML, 'the 1st item initial count should be 0').eq('0');
        chai.expect(elem1?.innerHTML, 'the 2nd item initial count should be 0').eq('0');
        chai.expect(elem2?.innerHTML, 'the 3rd item initial count should be 0').eq('0');
        const button = queryByTestId('mybutton');
        await userEvent__default["default"].click(button);
        chai.expect(elem0?.innerHTML, 'the 1st item new count should be 1').eq('1');
        chai.expect(elem1?.innerHTML, 'the 2nd item new count should be 1').eq('1');
        chai.expect(elem2?.innerHTML, 'the 3rd item new count should be 1').eq('1');
    });
    it('reorder - fire Drag and Drop Event', async () => {
        const data = populateData(5);
        const { queryByTestId } = preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        let items = await getItems('gridcell');
        const count = items.length;
        const firstItemDragIcon = queryByTestId('drag-icon-0');
        const thirdItemDragIcon = queryByTestId('drag-icon-2');
        const firstItem = items[0];
        // drag the first item and drop on the third item
        fireDragAndDropEvent(firstItemDragIcon, thirdItemDragIcon);
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const updatedThirdItem = items[2];
            chai.expect(firstItem).equals(updatedThirdItem);
            chai.expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the first item to right using keyboard', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        const grid = await getRoot();
        let items = await getItems('gridcell');
        const count = items.length;
        const firstItem = items[0];
        // reorder the first item to left
        mouseItemSelection(firstItem);
        keyboardReorder(grid, 'ArrowLeft');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[0];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // reorder the first item to right
        keyboardReorder(grid, 'ArrowRight');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[1];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // continuous reorder the first item to right
        keyboardReorder(grid, 'ArrowRight');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[2];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the last item to left using keyboard', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        const grid = await getRoot();
        let items = await getItems('gridcell');
        const count = items.length;
        const lastItem = items[items.length - 1];
        // reorder the last item to right
        mouseItemSelection(lastItem);
        keyboardReorder(grid, 'ArrowRight');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 1];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // reorder the last item to left
        keyboardReorder(grid, 'ArrowLeft');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 2];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // continuous reorder the last item to left
        keyboardReorder(grid, 'ArrowLeft');
        await preact.waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 3];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
    });
    if (typeof jest == typeof undefined) {
        it('reorder - instruction text should exist when reorder is enabled', async () => {
            // get instruction text
            const { deviceType, platform } = clientHints.getClientHints();
            const keyPressed = platform === 'windows' ? resources_nls_en_bundle["default"].accControlKey() : resources_nls_en_bundle["default"].accCommandKey();
            const reorderInstructions = deviceType === 'phone' || deviceType === 'tablet'
                ? ''
                : resources_nls_en_bundle["default"].accReorderInstructions({
                    keyPressed: keyPressed
                });
            // instruction text should exist when reorder is enabled
            const data = populateData(3);
            const { rerender } = preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
            let instructionText = preact.screen.queryByText(reorderInstructions);
            chai.expect(instructionText).not.to.be.null;
            // instruction text should not exist when reorder is disabled
            rerender(jsxRuntime.jsx(GenericCardGrid, { data: data }));
            instructionText = preact.screen.queryByText(reorderInstructions);
            chai.expect(instructionText).to.be.null;
        });
    }
    // test in karma mocha only since it involves scrolling
    if (typeof jest === typeof undefined) {
        it('scroll into view - when cardview regains focus', async () => {
            const data = populateData(10);
            preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, initialCurrentKey: data[9].id }));
            // the initial current item is Employee 9, so the scrollTop is high
            const grid = await getRoot();
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.greaterThanOrEqual(450);
            });
            // scroll cardview up until scrollTop is 0
            grid.scrollTop = 0;
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.eq(0);
            });
            // tab into cardview, should scroll Employee 9 into view
            grid.focus();
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.greaterThanOrEqual(450);
            });
        });
    }
    // test in karma mocha only since it involves rerender
    if (typeof jest === typeof undefined) {
        it('load more on scroll - should fetch data once during keyboard navigation', async () => {
            const data = populateData(21);
            preact.render(jsxRuntime.jsx(GenericCardGrid, { data: data, fetchSize: 7 }));
            let items = await getItems('gridcell');
            const thirdItem = items[3];
            await userEvent__default["default"].click(thirdItem);
            const grid = await getRoot();
            chai.expect(grid.matches(':focus')).to.be.true;
            preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
            await preact.waitFor(async () => {
                items = await getItems('gridcell');
                chai.expect(items.length).to.eq(14);
            });
            // load more should only happen once
            try {
                await preact.waitFor(async () => {
                    items = await getItems('gridcell');
                    chai.expect(items.length).to.eq(21);
                });
            }
            catch (e) {
                chai.expect(e).not.null;
            }
        }, 6000);
    }
};

const testSelectionRender = ({ SelectionCardGrid }) => {
    it('multiple selection - multiple selected items can be preserved', async () => {
        const data = populateData(3);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        mouseItemSelection(items[1]);
        await preact.waitFor(() => {
            chai.expect(items[0].getAttribute('aria-selected')).eq('true');
            chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        });
    });
    it('range selection - space and then shift+space', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // press space to select the 1st item
        preact.fireEvent.keyUp(items[0], { key: ' ' });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow right to the 3rd item, then shift + space the 3rd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - click and then shift+space', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // click to select the 1st item
        mouseItemSelection(items[0]);
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow right to the 3rd item, then shift + space the 3rd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - space and then shift+click', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // press space to select the 1st item
        preact.fireEvent.keyUp(items[0], { key: ' ' });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 3rd item
        mouseItemSelection(items[2], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - click and then shift+click', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        // click to select the 1st item
        mouseItemSelection(items[0]);
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 3rd item
        mouseItemSelection(items[2], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+click item', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + click the 3rd item
        preact.fireEvent.click(items[2], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+arrow items', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 3rd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+click and then shift+click', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        preact.fireEvent.click(items[1], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 4th item
        preact.fireEvent.click(items[3], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+click and then shift+arrow  ', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        preact.fireEvent.click(items[1], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + arrow to the 4th item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+click and then shift+space', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        preact.fireEvent.click(items[1], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + space the 4th item
        preact.fireEvent.keyUp(items[3], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+click', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 4th item
        preact.fireEvent.click(items[3], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+arrow', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow to the 3rd item, then shift + arrow to the 4th item
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+space', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[0].getAttribute('aria-selected')).eq('true');
            chai.expect(items[1].getAttribute('aria-selected')).eq('true');
            chai.expect(items[2].getAttribute('aria-selected')).eq('false');
            chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        });
        // shift + space the 4th item
        preact.fireEvent.keyUp(items[3], { key: ' ', shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[0].getAttribute('aria-selected')).eq('false');
            chai.expect(items[1].getAttribute('aria-selected')).eq('true');
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
    });
    it('range selection - from current item to shift+space and then shift+space', async () => {
        const data = populateData(4);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + space to select the 1st item
        preact.fireEvent.keyUp(items[0], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow down to the 3rd item, then shift + space the 3rd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - shift+space and then shift+space', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        // shift + space to select the 2nd item
        preact.fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        preact.fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - deselect selected item by shift+space', async () => {
        const data = populateData(3);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        // shift + space to select the 2nd item
        preact.fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        preact.fireEvent.keyUp(items[1], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+space and then shift+space', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + space to select the 1st item
        preact.fireEvent.keyUp(items[0], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        preact.fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+click and then shift+space', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + click to select the 1st item
        mouseItemSelection(items[0], { shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        preact.fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+arrow and then shift+space', async () => {
        const data = populateData(5);
        preact.render(jsxRuntime.jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + arrow to select the 1st item
        preact.fireEvent.keyDown(grid, { key: 'ArrowLeft', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowLeft', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        preact.fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
    });
};

exports.CardContent = CardContent;
exports.getItems = getItems;
exports.getRoot = getRoot;
exports.keyboardReorder = keyboardReorder;
exports.mouseItemSelection = mouseItemSelection;
exports.populateData = populateData;
exports.testRender = testRender;
exports.testSelectionRender = testSelectionRender;
//# sourceMappingURL=BaseCardViewSelectionTest-fe6cdb4a.js.map
