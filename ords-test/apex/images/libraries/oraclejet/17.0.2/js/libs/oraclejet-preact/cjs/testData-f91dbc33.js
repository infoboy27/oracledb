/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var chai = require('chai');
var clientHints = require('./clientHints-9e411b6e.js');
var matchTranslationBundle = require('./matchTranslationBundle-99625a42.js');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');

function __variableDynamicImportRuntime0__(path) {
  switch (path) {
    case '../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }
/**
 * Constant for timeout for longer running TableView tests
 */
const TABLEVIEW_LONG_TIMEOUT = 10000;
/**
 * Helper method to render a TableView test component with the proper environment setup
 */
const setupTableView = async (TestComponent) => {
    const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
    const { default: translations } = await __variableDynamicImportRuntime0__(`../../resources/nls/${locale}/bundle.ts`);
    const env = {
        translations: { '@oracle/oraclejet-preact': translations }
    };
    return preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: TestComponent }));
};
/**
 * Helper function to get all 'grid' role elements within the given rendered component.
 */
const getInnerGrids = async (tableView) => {
    return tableView.findAllByRole('grid');
};
/**
 * Helper function to get all 'columnheader' role elements within the given rendered component.
 */
const getColumnHeaders = async (tableView) => {
    return tableView.findAllByRole('columnheader');
};
/**
 * Helper function to get all 'row' role elements within the given rendered component.
 */
const getRows = async (tableView) => {
    return tableView.findAllByRole('row');
};
/**
 * Helper function to get all data cell elements within the given data row.
 */
const getDataCells = async (dataRow) => {
    return dataRow.children;
};
/**
 * Helper function to get all footer elements within the given rendered component.
 */
const getColumnFooters = async (tableView) => {
    const rows = await getRows(tableView);
    if (rows.length > 2) {
        return rows[rows.length - 1].children;
    }
    return [];
};
/**
 * Helper method to find the containing cell element of a given element.
 */
const findContainingCell = (rootElement, contentElement) => {
    if (contentElement.dataset['ojCellType'] != null) {
        return contentElement;
    }
    const parentElement = contentElement.parentElement;
    if (parentElement === rootElement || parentElement == null) {
        return null;
    }
    return findContainingCell(rootElement, parentElement);
};
/**
 * Helper function to determine if the current environment is a Mac.
 */
const isMac = () => {
    return clientHints.getClientHints().platform === 'mac';
};
/**
 * Helper function to get the 'rowKey' test element.
 */
const getRowKey = () => {
    return document.getElementById('rowKey');
};
/**
 * Helper function to get the 'columnKey' test element.
 */
const getColumnKey = () => {
    return document.getElementById('columnKey');
};
/**
 * Helper function to get the 'cellType' test element.
 */
const getCellType = () => {
    return document.getElementById('cellType');
};
/**
 * Helper function to verify the values of the Table's internal currentCell.
 */
const verifyCurrentCellValue = async (value) => {
    const expectedRowKey = value?.rowKey != null ? value.rowKey.toString() : '';
    const expectedColumnKey = value?.columnKey != null ? value.columnKey.toString() : '';
    const expectedCellType = value?.type != null ? value.type : '';
    await preact.waitFor(() => {
        chai.expect(getRowKey()?.textContent).to.equal(expectedRowKey);
    });
    await preact.waitFor(() => {
        chai.expect(getColumnKey()?.textContent).to.equal(expectedColumnKey);
    });
    await preact.waitFor(() => {
        chai.expect(getCellType()?.textContent).to.equal(expectedCellType);
    });
};
/**
 * Helper function to verify the values of aria-selected attributes on specific elements.
 */
const verifyAriaSelected = async (selectedElements, unselectedElements) => {
    for (let i = 0; i < selectedElements.length; i++) {
        await preact.waitFor(() => {
            chai.expect(selectedElements[i].getAttribute('aria-selected')).to.equal('true');
        });
    }
    for (let i = 0; i < unselectedElements.length; i++) {
        await preact.waitFor(() => {
            chai.expect(unselectedElements[i].getAttribute('aria-selected')).to.not.equal('true');
        });
    }
};
/**
 * Helper function to verify the width of a Table element.
 */
const verifyElementWidth = async (element, width) => {
    await preact.waitFor(() => {
        chai.expect(element.offsetWidth).to.equal(width);
    });
};
/**
 * Helper function to verify the width of a Table element.
 */
const determineBrowserScrollbarWidth = async (tableView) => {
    const grids = await getInnerGrids(tableView);
    const innerTable = grids[0].children[0].children[0];
    return grids[0].offsetWidth - innerTable.offsetWidth;
};
/**
 * Helper function to apply a longer timeout for tests
 */
const enableLongTimeout = () => {
    if (typeof jest === 'undefined') {
        mocha.timeout(TABLEVIEW_LONG_TIMEOUT);
    }
    else {
        jest.setTimeout(TABLEVIEW_LONG_TIMEOUT);
    }
};

const employeeData = [
    {
        id: '3',
        name: 'Chris Benalamore',
        title: 'Area Business Operations Director EMEA & JAPAC',
        initial: 'CB'
    },
    {
        id: '1',
        name: 'Chris Black',
        title: 'Oracle Cloud Infrastructure GTM Channel Director EMEA',
        initial: 'CB'
    },
    {
        id: '2',
        name: 'Christine Cooper',
        title: 'Senior Principal Escalation Manager',
        initial: 'CC'
    },
    {
        id: '4',
        name: 'Christopher Johnson',
        title: 'Vice-President HCM Application Development',
        initial: 'CJ'
    },
    {
        id: '6',
        name: 'Kurt Marchris',
        title: 'Customer Service Analyst',
        initial: 'KM'
    },
    {
        id: '5',
        name: 'Samire Christian',
        title: 'Consulting Project Technical Manager',
        initial: 'SC'
    },
    {
        id: '7',
        name: 'Zelda Christian Cooperman',
        title: 'Senior Principal Escalation Manager 2',
        initial: 'ZC'
    }
];

exports.determineBrowserScrollbarWidth = determineBrowserScrollbarWidth;
exports.employeeData = employeeData;
exports.enableLongTimeout = enableLongTimeout;
exports.findContainingCell = findContainingCell;
exports.getColumnFooters = getColumnFooters;
exports.getColumnHeaders = getColumnHeaders;
exports.getDataCells = getDataCells;
exports.getInnerGrids = getInnerGrids;
exports.getRows = getRows;
exports.isMac = isMac;
exports.setupTableView = setupTableView;
exports.verifyAriaSelected = verifyAriaSelected;
exports.verifyCurrentCellValue = verifyCurrentCellValue;
exports.verifyElementWidth = verifyElementWidth;
//# sourceMappingURL=testData-f91dbc33.js.map
