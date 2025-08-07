/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { screen, fireEvent, render, waitFor } from '@testing-library/preact';
import userEvent from '@testing-library/user-event';
import { expect } from 'chai';
import bundle from './resources/nls/en/bundle.js';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { T as Text } from './Text-da8588ce.js';
import { V as View } from './View-6013acac.js';
import { F as Flex } from './Flex-24628925.js';
import './LayerHost-45f545d7.js';
import { R as RootEnvironmentProvider } from './EnvironmentProvider-f543a463.js';
import { C as Center } from './Center-2ffc1dcc.js';
import { D as DragHandle } from './DragHandle-9514fcdc.js';
import { B as Button } from './Button-50c5589f.js';
import { A as Avatar } from './Avatar-b051ab27.js';

const CardContent = ({ context, showButton, isReorderEnabled }) => {
    const dragIcon = isReorderEnabled && (jsx(RootEnvironmentProvider, { environment: { mode: 'test' }, children: jsx(Center, { children: jsx(DragHandle, { testId: `drag-icon-${context.metadata.key}` }) }) }));
    const buttons = showButton && (jsx(View, { paddingBlockStart: '1x', children: jsxs(Flex, { direction: "row", wrap: "wrap", gap: '1x', width: '100%', children: [jsx(Button, { variant: "outlined", size: "md", label: "A" }), jsx(Button, { variant: "outlined", size: "md", label: "B" })] }) }));
    return (jsxs(View, { padding: "6px", children: [dragIcon, jsxs(View, { padding: "10px", paddingBlockEnd: 0, children: [jsx(Avatar, { initials: context.data.initials, size: "xl" }), jsxs(View, { paddingBlockStart: "2x", children: [jsx(Text, { variant: "primary", size: "md", lineClamp: 1, children: context.data.name }), jsx(Text, { variant: "secondary", size: "md", lineClamp: 1, children: context.data.title })] })] }), jsxs(View, { padding: "10px", paddingBlockStart: 0, children: [buttons, context.selector?.()] })] }));
};
const populateData = (count, isNumberKey) => [...Array(count)].map((_, i) => ({
    id: isNumberKey ? i : `${i}`,
    name: `Employee ${i}`,
    title: `Employee title ${i}`,
    initials: `E${i}`
}));
const getRoot = async () => {
    return screen.findByRole('grid');
};
const getItems = async (role = 'row') => {
    return screen.findAllByRole(role);
};
const getContents = async (role = 'gridcell') => {
    return screen.findAllByRole(role);
};
const mouseItemSelection = (element, options) => {
    fireEvent.click(element, options);
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

const testRender = ({ GenericCardGrid, ActionCardGrid, SelectionCardGrid, ContentUpdatableCardGrid }) => {
    it('initial render', async function () {
        const data = populateData(100);
        render(jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        expect(items.length).eq(25);
    });
    it('checking key type - string key', async () => {
        const data = populateData(3);
        render(jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        expect(items[0].dataset['ojKeyType'] === undefined).eq(true);
        expect(items[1].dataset['ojKeyType'] === undefined).eq(true);
        expect(items[2].dataset['ojKeyType'] === undefined).eq(true);
    });
    it('checking key type - numeric key', async () => {
        const data = populateData(3, true);
        render(jsx(GenericCardGrid, { data: data }));
        const items = await getItems('gridcell');
        expect(items[0].dataset['ojKeyType']).eq('number');
        expect(items[1].dataset['ojKeyType']).eq('number');
        expect(items[2].dataset['ojKeyType']).eq('number');
    });
    it('aria attributes - multiselectable and selected, selectionMode is none', async () => {
        const data = populateData(2);
        render(jsx(SelectionCardGrid, { data: data }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        expect(grid.getAttribute('aria-multiselectable')).eq(null);
        expect(items[0].getAttribute('aria-selected')).eq(null);
        expect(items[1].getAttribute('aria-selected')).eq(null);
    });
    it('aria attributes - multiselectable and selected, selectionMode is single', async () => {
        const data = populateData(2);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'single', selectedKeys: new Set(['1']) }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        expect(grid.getAttribute('aria-multiselectable')).eq('false');
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('true');
    });
    it('aria attributes - multiselectable and selected, selectionMode is multiple', async () => {
        const data = populateData(3);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple', selectedKeys: new Set(['1', '2']) }));
        const items = await getItems('gridcell');
        const grid = await getRoot();
        expect(grid.getAttribute('aria-multiselectable')).eq('true');
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
    });
    // skip this test in jest, only run it in karma mocha
    if (typeof jest === typeof undefined) {
        // because jest doesn't show grid layout, the number of focusable elements is not calculated correctly
        it('content focusBehavior - valid case', async () => {
            const data = populateData(3);
            render(jsx(ActionCardGrid, { data: data }));
            const items = await getItems('gridcell');
            await userEvent.tab();
            await waitFor(() => {
                expect(items[0].matches(':focus-within')).to.be.true;
            });
        });
        it('content focusBehavior - invalid case', async () => {
            const data = populateData(3);
            render(jsx(ActionCardGrid, { data: data, showButton: true }));
            const grid = await getRoot();
            await userEvent.tab();
            await waitFor(() => {
                expect(grid.matches(':focus')).to.be.true;
            });
        });
    }
    // JET-61732
    it('memoization - update memoized children', async () => {
        const data = populateData(3);
        const { queryByTestId } = render(jsx(ContentUpdatableCardGrid, { data: data }));
        const elem0 = queryByTestId(data[0].id);
        const elem1 = queryByTestId(data[1].id);
        const elem2 = queryByTestId(data[2].id);
        expect(elem0?.innerHTML, 'the 1st item initial count should be 0').eq('0');
        expect(elem1?.innerHTML, 'the 2nd item initial count should be 0').eq('0');
        expect(elem2?.innerHTML, 'the 3rd item initial count should be 0').eq('0');
        const button = queryByTestId('mybutton');
        await userEvent.click(button);
        expect(elem0?.innerHTML, 'the 1st item new count should be 1').eq('1');
        expect(elem1?.innerHTML, 'the 2nd item new count should be 1').eq('1');
        expect(elem2?.innerHTML, 'the 3rd item new count should be 1').eq('1');
    });
    it('reorder - fire Drag and Drop Event', async () => {
        const data = populateData(5);
        const { queryByTestId } = render(jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        let items = await getItems('gridcell');
        const count = items.length;
        const firstItemDragIcon = queryByTestId('drag-icon-0');
        const thirdItemDragIcon = queryByTestId('drag-icon-2');
        const firstItem = items[0];
        // drag the first item and drop on the third item
        fireDragAndDropEvent(firstItemDragIcon, thirdItemDragIcon);
        await waitFor(async () => {
            items = await getItems('gridcell');
            const updatedThirdItem = items[2];
            expect(firstItem).equals(updatedThirdItem);
            expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the first item to right using keyboard', async () => {
        const data = populateData(5);
        render(jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        const grid = await getRoot();
        let items = await getItems('gridcell');
        const count = items.length;
        const firstItem = items[0];
        // reorder the first item to left
        mouseItemSelection(firstItem);
        keyboardReorder(grid, 'ArrowLeft');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[0];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // reorder the first item to right
        keyboardReorder(grid, 'ArrowRight');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[1];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // continuous reorder the first item to right
        keyboardReorder(grid, 'ArrowRight');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[2];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the last item to left using keyboard', async () => {
        const data = populateData(5);
        render(jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
        const grid = await getRoot();
        let items = await getItems('gridcell');
        const count = items.length;
        const lastItem = items[items.length - 1];
        // reorder the last item to right
        mouseItemSelection(lastItem);
        keyboardReorder(grid, 'ArrowRight');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 1];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // reorder the last item to left
        keyboardReorder(grid, 'ArrowLeft');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 2];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // continuous reorder the last item to left
        keyboardReorder(grid, 'ArrowLeft');
        await waitFor(async () => {
            items = await getItems('gridcell');
            const reorderedItem = items[items.length - 3];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
    });
    if (typeof jest == typeof undefined) {
        it('reorder - instruction text should exist when reorder is enabled', async () => {
            // get instruction text
            const { deviceType, platform } = getClientHints();
            const keyPressed = platform === 'windows' ? bundle.accControlKey() : bundle.accCommandKey();
            const reorderInstructions = deviceType === 'phone' || deviceType === 'tablet'
                ? ''
                : bundle.accReorderInstructions({
                    keyPressed: keyPressed
                });
            // instruction text should exist when reorder is enabled
            const data = populateData(3);
            const { rerender } = render(jsx(GenericCardGrid, { data: data, isReorderEnabled: true }));
            let instructionText = screen.queryByText(reorderInstructions);
            expect(instructionText).not.to.be.null;
            // instruction text should not exist when reorder is disabled
            rerender(jsx(GenericCardGrid, { data: data }));
            instructionText = screen.queryByText(reorderInstructions);
            expect(instructionText).to.be.null;
        });
    }
    // test in karma mocha only since it involves scrolling
    if (typeof jest === typeof undefined) {
        it('scroll into view - when cardview regains focus', async () => {
            const data = populateData(10);
            render(jsx(GenericCardGrid, { data: data, initialCurrentKey: data[9].id }));
            // the initial current item is Employee 9, so the scrollTop is high
            const grid = await getRoot();
            await waitFor(() => {
                expect(grid.scrollTop).to.greaterThanOrEqual(450);
            });
            // scroll cardview up until scrollTop is 0
            grid.scrollTop = 0;
            await waitFor(() => {
                expect(grid.scrollTop).to.eq(0);
            });
            // tab into cardview, should scroll Employee 9 into view
            grid.focus();
            await waitFor(() => {
                expect(grid.scrollTop).to.greaterThanOrEqual(450);
            });
        });
    }
    // test in karma mocha only since it involves rerender
    if (typeof jest === typeof undefined) {
        it('load more on scroll - should fetch data once during keyboard navigation', async () => {
            const data = populateData(21);
            render(jsx(GenericCardGrid, { data: data, fetchSize: 7 }));
            let items = await getItems('gridcell');
            const thirdItem = items[3];
            await userEvent.click(thirdItem);
            const grid = await getRoot();
            expect(grid.matches(':focus')).to.be.true;
            fireEvent.keyDown(grid, { key: 'ArrowDown' });
            await waitFor(async () => {
                items = await getItems('gridcell');
                expect(items.length).to.eq(14);
            });
            // load more should only happen once
            try {
                await waitFor(async () => {
                    items = await getItems('gridcell');
                    expect(items.length).to.eq(21);
                });
            }
            catch (e) {
                expect(e).not.null;
            }
        }, 6000);
    }
};

const testSelectionRender = ({ SelectionCardGrid }) => {
    it('multiple selection - multiple selected items can be preserved', async () => {
        const data = populateData(3);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        mouseItemSelection(items[1]);
        await waitFor(() => {
            expect(items[0].getAttribute('aria-selected')).eq('true');
            expect(items[1].getAttribute('aria-selected')).eq('true');
        });
    });
    it('range selection - space and then shift+space', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // press space to select the 1st item
        fireEvent.keyUp(items[0], { key: ' ' });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow right to the 3rd item, then shift + space the 3rd item
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - click and then shift+space', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // click to select the 1st item
        mouseItemSelection(items[0]);
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow right to the 3rd item, then shift + space the 3rd item
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - space and then shift+click', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // press space to select the 1st item
        fireEvent.keyUp(items[0], { key: ' ' });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 3rd item
        mouseItemSelection(items[2], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - click and then shift+click', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        // click to select the 1st item
        mouseItemSelection(items[0]);
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 3rd item
        mouseItemSelection(items[2], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+click item', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + click the 3rd item
        fireEvent.click(items[2], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+arrow items', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 3rd item
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - from current item to shift+click and then shift+click', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        fireEvent.click(items[1], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 4th item
        fireEvent.click(items[3], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+click and then shift+arrow  ', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        fireEvent.click(items[1], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + arrow to the 4th item
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+click and then shift+space', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + click the 2nd item
        fireEvent.click(items[1], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + space the 4th item
        fireEvent.keyUp(items[3], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+click', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // shift + click the 4th item
        fireEvent.click(items[3], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+arrow', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow to the 3rd item, then shift + arrow to the 4th item
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyDown(grid, { key: 'ArrowRight' });
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - from current item to shift+arrow and then shift+space', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowRight', shiftKey: true });
        await waitFor(() => {
            expect(items[0].getAttribute('aria-selected')).eq('true');
            expect(items[1].getAttribute('aria-selected')).eq('true');
            expect(items[2].getAttribute('aria-selected')).eq('false');
            expect(items[3].getAttribute('aria-selected')).eq('false');
        });
        // shift + space the 4th item
        fireEvent.keyUp(items[3], { key: ' ', shiftKey: true });
        await waitFor(() => {
            expect(items[0].getAttribute('aria-selected')).eq('false');
            expect(items[1].getAttribute('aria-selected')).eq('true');
            expect(items[2].getAttribute('aria-selected')).eq('true');
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
    });
    it('range selection - from current item to shift+space and then shift+space', async () => {
        const data = populateData(4);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + space to select the 1st item
        fireEvent.keyUp(items[0], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow down to the 3rd item, then shift + space the 3rd item
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('range selection - shift+space and then shift+space', async () => {
        const data = populateData(5);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        // shift + space to select the 2nd item
        fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection - deselect selected item by shift+space', async () => {
        const data = populateData(3);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[0]);
        // shift + space to select the 2nd item
        fireEvent.keyUp(items[2], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        fireEvent.keyUp(items[1], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+space and then shift+space', async () => {
        const data = populateData(5);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + space to select the 1st item
        fireEvent.keyUp(items[0], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+click and then shift+space', async () => {
        const data = populateData(5);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + click to select the 1st item
        mouseItemSelection(items[0], { shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
    });
    it('range selection backward - shift+arrow and then shift+space', async () => {
        const data = populateData(5);
        render(jsx(SelectionCardGrid, { data: data, selectionMode: 'multiple' }));
        const grid = await getRoot();
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + arrow to select the 1st item
        fireEvent.keyDown(grid, { key: 'ArrowLeft', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowLeft', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        expect(items[4].getAttribute('aria-selected')).eq('false');
        // shift + space the last item
        fireEvent.keyUp(items[4], { key: ' ', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
    });
};

export { CardContent as C, testSelectionRender as a, getItems as b, getRoot as g, keyboardReorder as k, mouseItemSelection as m, populateData as p, testRender as t };
//# sourceMappingURL=BaseCardViewSelectionTest-6796b2b4.js.map
