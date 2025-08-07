/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { render, waitFor } from '@testing-library/preact';
import { expect } from 'chai';
import { g as getClientHints } from './clientHints-c76a913b.js';
import { m as matchTranslationBundle } from './matchTranslationBundle-d9e64706.js';
import './LayerHost-45f545d7.js';
import { R as RootEnvironmentProvider } from './EnvironmentProvider-f543a463.js';

function __variableDynamicImportRuntime0__(path) {
  switch (path) {
    case '../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
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
    const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
    const { default: translations } = await __variableDynamicImportRuntime0__(`../../resources/nls/${locale}/bundle.ts`);
    const env = {
        translations: { '@oracle/oraclejet-preact': translations }
    };
    return render(jsx(RootEnvironmentProvider, { environment: env, children: TestComponent }));
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
    return getClientHints().platform === 'mac';
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
    await waitFor(() => {
        expect(getRowKey()?.textContent).to.equal(expectedRowKey);
    });
    await waitFor(() => {
        expect(getColumnKey()?.textContent).to.equal(expectedColumnKey);
    });
    await waitFor(() => {
        expect(getCellType()?.textContent).to.equal(expectedCellType);
    });
};
/**
 * Helper function to verify the values of aria-selected attributes on specific elements.
 */
const verifyAriaSelected = async (selectedElements, unselectedElements) => {
    for (let i = 0; i < selectedElements.length; i++) {
        await waitFor(() => {
            expect(selectedElements[i].getAttribute('aria-selected')).to.equal('true');
        });
    }
    for (let i = 0; i < unselectedElements.length; i++) {
        await waitFor(() => {
            expect(unselectedElements[i].getAttribute('aria-selected')).to.not.equal('true');
        });
    }
};
/**
 * Helper function to verify the width of a Table element.
 */
const verifyElementWidth = async (element, width) => {
    await waitFor(() => {
        expect(element.offsetWidth).to.equal(width);
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

export { getColumnHeaders as a, getRows as b, getColumnFooters as c, employeeData as d, enableLongTimeout as e, getDataCells as f, getInnerGrids as g, determineBrowserScrollbarWidth as h, isMac as i, verifyElementWidth as j, findContainingCell as k, verifyAriaSelected as l, setupTableView as s, verifyCurrentCellValue as v };
//# sourceMappingURL=testData-2998863b.js.map
