/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var chai = require('chai');
var userEvent = require('@testing-library/user-event');
var listViewTestFixtures = require('./listViewTestFixtures-fe29420a.js');
var testHelpers = require('./testHelpers-15e6ef95.js');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var userEvent__default = /*#__PURE__*/_interopDefaultLegacy(userEvent);

const testTabbableMode = (TestComponent) => {
    it('acts as single tab stop in composition', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        await userEvent__default["default"].tab();
        chai.expect(preact.screen.getByText('Preceding Button').matches(':focus')).to.be.true;
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        await userEvent__default["default"].tab();
        chai.expect(preact.screen.getByText('Following Button').matches(':focus')).to.be.true;
        await userEvent__default["default"].tab({ shift: true });
        chai.expect(grid.matches(':focus')).to.be.true;
        await userEvent__default["default"].tab({ shift: true });
        chai.expect(preact.screen.getByText('Preceding Button').matches(':focus')).to.be.true;
    });
    it('enters interactive mode with keyboard via F2', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        // Tab past first button into ListView
        await userEvent__default["default"].tab();
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        view.rerender(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = preact.screen.getByTestId('input-0');
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        preact.fireEvent.keyDown(grid, { key: 'F2' });
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('0');
    });
    it('leaves interactive mode with keyboard via ESC', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        const firstRowInput = preact.screen.getByTestId('input-0');
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent__default["default"].click(firstRowInput);
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('0');
        preact.fireEvent.keyDown(firstRowInput, { key: 'Escape' });
        await preact.waitFor(() => {
            chai.expect(grid.matches(':focus'), 'active element should be grid').to.be.true;
        });
    });
    it('enters interactive mode again with keyboard via arrow keys and F2', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        await userEvent__default["default"].click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        const secondRowInput = preact.screen.getByTestId('input-1');
        chai.expect(secondRowInput.getAttribute('tabindex')).equals('-1');
        preact.fireEvent.keyDown(grid, { key: 'F2' });
        chai.expect(secondRowInput.getAttribute('tabindex')).equals('0');
    });
    it('enters interactive mode with click on input', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = preact.screen.getByTestId('input-0');
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent__default["default"].click(firstRowInput);
        // NOTE without this rerender the state change doesn't stick
        view.rerender(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('0');
        chai.expect(firstRowInput.matches(':focus')).to.be.true;
        await userEvent__default["default"].tab();
        chai.expect(preact.screen.getByTestId('button-0').matches(':focus')).to.be.true;
    });
    // FIXME: reenable this test once  is fixed
    xit('leaves interactive mode with click outside', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const view = preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const firstRowInput = preact.screen.getByTestId('input-0');
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('-1');
        await userEvent__default["default"].click(firstRowInput);
        // NOTE without this rerender the state change doesn't stick
        view.rerender(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('0');
        chai.expect(firstRowInput.matches(':focus')).to.be.true;
        const outsideElement = preact.screen.getByText('Preceding Button');
        await userEvent__default["default"].click(outsideElement);
        chai.expect(outsideElement.matches(':focus')).to.be.true;
        view.rerender(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        chai.expect(firstRowInput.getAttribute('tabindex')).equals('-1');
    });
};

exports.testTabbableMode = testTabbableMode;
//# sourceMappingURL=listViewTabbableModeTests-5185dff8.js.map
