/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { render, screen, fireEvent, waitFor } from '@testing-library/preact';
import { expect } from 'chai';
import userEvent from '@testing-library/user-event';
import { p as populateData } from './listViewTestFixtures-0c9576f6.js';
import { g as getRoot, b as getContents } from './testHelpers-d012984d.js';

const testTabbableMode = (TestComponent) => {
    it('acts as single tab stop in composition', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        await userEvent.tab();
        expect(screen.getByText('Preceding Button').matches(':focus')).to.be.true;
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        await userEvent.tab();
        expect(screen.getByText('Following Button').matches(':focus')).to.be.true;
        await userEvent.tab({ shift: true });
        expect(grid.matches(':focus')).to.be.true;
        await userEvent.tab({ shift: true });
        expect(screen.getByText('Preceding Button').matches(':focus')).to.be.true;
    });
    it('enters interactive mode with keyboard via F2', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        // Tab past first button into ListView
        await userEvent.tab();
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        view.rerender(jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = screen.getByTestId('input-0');
        expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        fireEvent.keyDown(grid, { key: 'F2' });
        expect(firstRowInput.getAttribute('tabindex')).equals('0');
    });
    it('leaves interactive mode with keyboard via ESC', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        const firstRowInput = screen.getByTestId('input-0');
        expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent.click(firstRowInput);
        expect(firstRowInput.getAttribute('tabindex')).equals('0');
        fireEvent.keyDown(firstRowInput, { key: 'Escape' });
        await waitFor(() => {
            expect(grid.matches(':focus'), 'active element should be grid').to.be.true;
        });
    });
    it('enters interactive mode again with keyboard via arrow keys and F2', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        const items = await getContents();
        await userEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        const secondRowInput = screen.getByTestId('input-1');
        expect(secondRowInput.getAttribute('tabindex')).equals('-1');
        fireEvent.keyDown(grid, { key: 'F2' });
        expect(secondRowInput.getAttribute('tabindex')).equals('0');
    });
    it('enters interactive mode with click on input', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = render(jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = screen.getByTestId('input-0');
        expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent.click(firstRowInput);
        // NOTE without this rerender the state change doesn't stick
        view.rerender(jsx(TestComponent, { data: dataMetadata }));
        expect(firstRowInput.getAttribute('tabindex')).equals('0');
        expect(firstRowInput.matches(':focus')).to.be.true;
        await userEvent.tab();
        expect(screen.getByTestId('button-0').matches(':focus')).to.be.true;
    });
    // FIXME: reenable this test once  is fixed
    xit('leaves interactive mode with click outside', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = render(jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = screen.getByTestId('input-0');
        expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent.click(firstRowInput);
        // NOTE without this rerender the state change doesn't stick
        view.rerender(jsx(TestComponent, { data: dataMetadata }));
        expect(firstRowInput.getAttribute('tabindex')).equals('0');
        expect(firstRowInput.matches(':focus')).to.be.true;
        const outsideElement = screen.getByText('Preceding Button');
        await userEvent.click(outsideElement);
        expect(outsideElement.matches(':focus')).to.be.true;
        view.rerender(jsx(TestComponent, { data: dataMetadata }));
        expect(firstRowInput.getAttribute('tabindex')).equals('-1');
    });
};

export { testTabbableMode as t };
//# sourceMappingURL=listViewTabbableModeTests-24122487.js.map
