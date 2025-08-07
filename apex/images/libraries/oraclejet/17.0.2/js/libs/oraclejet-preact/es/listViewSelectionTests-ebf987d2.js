/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { render, fireEvent, screen, waitFor } from '@testing-library/preact';
import userEvent from '@testing-library/user-event';
import { expect } from 'chai';
import './LayerHost-45f545d7.js';
import { R as RootEnvironmentProvider } from './EnvironmentProvider-f543a463.js';
import { m as matchTranslationBundle } from './matchTranslationBundle-d9e64706.js';
import { C as CollectionGestureContext } from './useCollectionGestureContext-f18b492f.js';
import 'preact/hooks';
import './Menu-c7ab8412.js';
import { l as MenuItem } from './MenuItem-a8f9c954.js';
import 'preact';
import { x as xUnits } from './utils-6eab3a64.js';
import './useTooltipControlled-2044f639.js';
import './IconStyle.styles.css';
import './SelectMenuGroupContext-b56cf5d4.js';
import './logger-c92f309c.js';
import './UNSAFE_Separator/themes/SeparatorStyles.css.js';
import './MenuSeparatorStyles.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorBaseTheme.styles.css';
import './UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js';
import 'preact/compat';
import bundle from './resources/nls/en/bundle.js';
import { p as populateData } from './listViewTestFixtures-0c9576f6.js';
import { a as getItems, g as getRoot, b as getContents, f as fireDragAndDropEvent, m as mouseItemSelection, k as keyboardReorder, c as mouseCheckboxSelection } from './testHelpers-d012984d.js';
import { g as getMenuItemByRole, a as getAllMenuItemsByRole, b as getLabel } from './menuTestsUtils-c74ce3da.js';
import { g as getClientHints } from './clientHints-c76a913b.js';

function __variableDynamicImportRuntime2__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime1__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime0__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }
//TODO: JET-63873
function getSparkle(grid) {
    return grid.querySelector('.oj-collection-sparkle')?.firstElementChild;
}
const testRender = (TestComponent) => {
    it('initial render', async function () {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const items = await getItems();
        expect(items.length).eq(25);
    });
    // skip this test in jest, only run it in karma mocha
    if (typeof jest == typeof undefined) {
        it('initial render with sparkle', async () => {
            const data = populateData(100);
            let dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            // add suggestions
            dataMetadata[3].metadata.suggestion = { enable: true };
            dataMetadata[7].metadata.suggestion = { enable: true };
            dataMetadata[9].metadata.suggestion = { enable: true };
            const suggestions = dataMetadata.filter((d) => d.metadata.suggestion);
            dataMetadata = dataMetadata.filter((d) => !d.metadata.suggestion);
            dataMetadata.unshift(...suggestions);
            render(jsx(TestComponent, { data: dataMetadata }));
            const grid = await getRoot();
            const sparkle = getSparkle(grid);
            expect(sparkle !== undefined).eq(true);
            const items = await getItems();
            expect(items?.length).eq(25);
            expect(items[0].dataset['ojSuggestion']).eq('true');
            expect(items[1].dataset['ojSuggestion']).eq('true');
            expect(items[2].dataset['ojSuggestion']).eq('true');
            const sparkleHeight = items[0].offsetHeight + items[1].offsetHeight + items[2].offsetHeight;
            expect(sparkleHeight).eq(sparkle.offsetHeight);
        });
    }
};
const testContextMenu = (TestComponent) => {
    it("Jet context menu appears when there's no text selection", async () => {
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime0__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxs(Fragment, { children: [jsx(MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsx(MenuItem, { label: "MenuItem2" }), jsx(MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await getContents();
        const grid = await getRoot();
        const firstItem = items[0];
        fireEvent.contextMenu(firstItem, {
            clientX: 50,
            clientY: 50,
            currentTarget: grid
        });
        const menu = getMenuItemByRole('menu');
        const menuItems = getAllMenuItemsByRole('menuitem');
        //With this we check context menu context was set correctly
        const menuItemGotByLabel = getLabel('MenuItemi0');
        expect(menu).not.null;
        expect(menuItems.length).equals(3);
        expect(menuItemGotByLabel).not.null;
    });
    it('ContextMenu on Shift-F10', async () => {
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime1__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxs(Fragment, { children: [jsx(MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsx(MenuItem, { label: "MenuItem2" }), jsx(MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const grid = await getRoot();
        const items = await getContents();
        const firstItem = items[0];
        //We do the necessary to have firstItem as current item
        fireEvent.click(items[0]);
        expect(grid.getAttribute('aria-activedescendant')).eq(firstItem.id);
        fireEvent.keyDown(grid, { key: 'F10', shiftKey: true });
        const menu = getMenuItemByRole('menu');
        const menuItems = getAllMenuItemsByRole('menuitem');
        //With this we check context menu context was set correctly
        const menuItemGotByLabel = getLabel('MenuItemi0');
        expect(menu).not.null;
        expect(menuItems.length).equals(3);
        expect(menuItemGotByLabel).not.null;
    });
    it("Jet context menu doesn't appear when there is text selection", async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(RootEnvironmentProvider, { children: jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxs(Fragment, { children: [jsx(MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsx(MenuItem, { label: "MenuItem2" }), jsx(MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await getContents();
        const grid = await getRoot();
        const firstItem = items[0];
        const elem = await screen.findByText(firstItem.textContent || '');
        // Set text selection
        await userEvent.pointer([
            { target: elem, offset: 0, keys: '[MouseLeft>]' },
            { offset: 5 },
            { keys: '[/MouseLeft]' }
        ]);
        fireEvent.contextMenu(firstItem, {
            clientX: 50,
            clientY: 50,
            currentTarget: grid
        });
        const menu = screen.queryByRole('menu');
        expect(menu).null;
    });
    it('Ios context menu appears after 1500ms', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(RootEnvironmentProvider, { children: jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxs(Fragment, { children: [jsx(MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsx(MenuItem, { label: "MenuItem2" }), jsx(MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await getContents();
        const firstItem = items[0];
        if (typeof jest === 'undefined') {
            const { deviceType, platform } = getClientHints();
            const isMobile = deviceType === 'phone';
            const isIos = platform === 'ios';
            if (isMobile && isIos) {
                const timeout = (ms) => {
                    return new Promise((resolve) => setTimeout(resolve, ms));
                };
                // Touch objects are created so we can replicate this in fake touch events
                // This stuff is based on what useSwipe triggers and could change depending on the final decision
                // on what events to trigger on useSwipe.
                const touch1 = new Touch({
                    target: firstItem,
                    identifier: 0,
                    pageX: 386,
                    pageY: 224
                });
                if (firstItem) {
                    fireEvent.touchStart(firstItem, {
                        timeStamp: 10406,
                        currentTarget: firstItem,
                        touches: [touch1]
                    });
                }
                await timeout(1550);
                const menu = getMenuItemByRole('menu');
                const menuItems = getAllMenuItemsByRole('menuitem');
                //With this we check context menu context was set correctly
                const menuItemGotByLabel = getLabel('MenuItemi0');
                expect(menu).not.null;
                expect(menuItems.length).equals(3);
                expect(menuItemGotByLabel).not.null;
            }
        }
    });
};
const testAria = (TestComponent) => {
    it('aria structure and properties (select-none)', async function () {
        const data = populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        expect(grid.getAttribute('aria-rowcount')).eq('10');
        expect(grid.getAttribute('aria-multiselectable')).eq(null);
        const items = await getItems();
        expect(items.length).eq(10);
        expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await getContents();
        expect(cells.length).eq(10);
        expect(cells[0].getAttribute('aria-colindex')).eq('1');
        expect(cells[0].getAttribute('aria-selected')).eq(null);
    });
    it('aria structure and properties (single-select)', async function () {
        const data = populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, selectionMode: "single" }));
        const grid = await getRoot();
        expect(grid.getAttribute('aria-rowcount')).eq('10');
        expect(grid.getAttribute('aria-multiselectable')).eq('false');
        const items = await getItems();
        expect(items.length).eq(10);
        expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await getContents();
        expect(cells.length).eq(10);
        expect(cells[0].getAttribute('aria-colindex')).eq('1');
        expect(cells[0].getAttribute('aria-selected')).eq('false');
    });
    it('aria structure and properties (multi-select)', async function () {
        const data = populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime2__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        expect(grid.getAttribute('aria-rowcount')).eq('10');
        expect(grid.getAttribute('aria-multiselectable')).eq('true');
        const items = await getItems();
        expect(items.length).eq(10);
        expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await getContents();
        expect(cells.length).eq(10);
        expect(cells[0].getAttribute('aria-colindex')).eq('1');
        expect(cells[0].getAttribute('aria-selected')).eq('false');
    });
};
const testKeys = (TestComponent) => {
    it('supports currentKey logic with numeric key', async () => {
        const data = populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await getContents();
        fireEvent.click(items[0]);
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        fireEvent.keyDown(grid, { key: 'ArrowUp' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    it('supports currentKey logic with string key', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await getContents();
        fireEvent.click(items[0]);
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        fireEvent.keyDown(grid, { key: 'ArrowUp' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    it('checking key type - string key', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const items = await getItems();
        expect(items[0].dataset['ojKeyType'] === undefined).eq(true);
        expect(items[1].dataset['ojKeyType'] === undefined).eq(true);
        expect(items[2].dataset['ojKeyType'] === undefined).eq(true);
    });
    it('checking key type - numeric key', async () => {
        const data = populateData(3, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const items = await getItems();
        expect(items[0].dataset['ojKeyType']).eq('number');
        expect(items[1].dataset['ojKeyType']).eq('number');
        expect(items[2].dataset['ojKeyType']).eq('number');
    });
};
const testGridlines = (TestComponent) => {
    const isTopGridlineVisible = (item) => {
        const className = item.className;
        return className.indexOf('gridlineTop_visible') > 0;
    };
    const isBottomGridlineVisible = (item) => {
        const className = item.className;
        return className.indexOf('gridlineBottom_visible') > 0;
    };
    const isGridlineHidden = (item) => {
        return !isTopGridlineVisible(item) && !isBottomGridlineVisible(item);
    };
    it('gridlines - gridlines are hidden', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const items = await getItems();
        expect(isGridlineHidden(items[0])).to.be.true;
        expect(isGridlineHidden(items[1])).to.be.true;
        expect(isGridlineHidden(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visible = { item: 'visible', bottom: 'visible' };
        render(jsx(TestComponent, { data: dataMetadata, gridlines: visible }));
        const items = await getItems();
        expect(isBottomGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[1])).to.be.true;
        expect(isBottomGridlineVisible(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible except for the last list item', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleExceptLast = { item: 'visible' };
        render(jsx(TestComponent, { data: dataMetadata, gridlines: visibleExceptLast }));
        const items = await getItems();
        expect(isBottomGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[1])).to.be.true;
        expect(isBottomGridlineVisible(items[2])).to.be.false;
    });
    it('gridlines - bottom gridlines are visible; The top gridlines of the first list item is visible', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleWithFirst = {
            item: 'visible',
            top: 'visible',
            bottom: 'visible'
        };
        render(jsx(TestComponent, { data: dataMetadata, gridlines: visibleWithFirst }));
        const items = await getItems();
        expect(isTopGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[1])).to.be.true;
        expect(isBottomGridlineVisible(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible except for the last list item. The top gridlines of the first list item is visible.', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleWithFirstButNotLast = { item: 'visible', top: 'visible' };
        render(jsx(TestComponent, { data: dataMetadata, gridlines: visibleWithFirstButNotLast }));
        const items = await getItems();
        expect(isTopGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[0])).to.be.true;
        expect(isBottomGridlineVisible(items[1])).to.be.true;
        expect(isBottomGridlineVisible(items[2])).to.be.false;
    });
};
const testItemAction = (TestComponent) => {
    const isMetadataEqual = (metadata1, metadata2) => {
        return metadata1.key === metadata2.key;
    };
    const isFocusHighlight = (item) => {
        const className = item.className;
        return (className.indexOf('focusHighlight_isFocusHighlight') > 0 ||
            className.indexOf('MultiVariantStyles_compound') > 0);
    };
    it('ItemAction - test click on item', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 0) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 1) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        render(jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }));
        const items = await getItems('row');
        fireEvent.click(items[1]);
        fireEvent.click(items[1]);
        fireEvent.click(items[2]);
        expect(count).eq(3);
    });
    it('ItemAction - test press enter on item', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 3) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        render(jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }));
        const grid = await getRoot();
        const items = await getItems('row');
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(items[1], { key: 'Enter' });
        fireEvent.keyDown(items[1], { key: 'Enter' });
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(items[2], { key: 'Enter' });
        expect(count).eq(4);
    });
    it('ItemAction - test press spacebar on item (Context value is embedded)', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 3) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        render(jsx(CollectionGestureContext.Provider, { value: 'embedded', children: jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }) }));
        const grid = await getRoot();
        const items = await getItems('row');
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(items[1], { key: ' ' });
        fireEvent.keyDown(items[1], { key: ' ' });
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(items[2], { key: ' ' });
        expect(count).eq(4);
    });
    it('ItemAction - test press spacebar on item (Context value is default)', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[1].metadata);
            }
            else if (count === 2) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[1].metadata);
            }
            else if (count === 3) {
                expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[2].metadata);
            }
            count++;
        };
        render(jsx(CollectionGestureContext.Provider, { value: 'default', children: jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }) }));
        const grid = await getRoot();
        const items = await getItems('row');
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(items[1], { key: ' ' });
        fireEvent.keyDown(items[1], { key: ' ' });
        expect(count).eq(1);
    });
    it('currentItemVariant - highlight', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, initialKey: dataMetadata[1].metadata.key, currentItemVariant: "highlight" }));
        const items = await getItems();
        expect(isFocusHighlight(items[0])).to.be.false;
        fireEvent.click(items[0]);
        expect(isFocusHighlight(items[0])).to.be.true;
    });
    it('currentItemVariant - none', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, initialKey: dataMetadata[1].metadata.key, currentItemVariant: "none" }));
        const items = await getItems();
        expect(isFocusHighlight(items[0])).to.be.false;
        fireEvent.click(items[0]);
        expect(isFocusHighlight(items[0])).to.be.false;
    });
};
const testNavigation = (TestComponent) => {
    it('arrow keys', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata }));
        const grid = await getRoot();
        expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await getContents();
        fireEvent.click(items[0]);
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[2].id);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[2].id);
        fireEvent.keyDown(grid, { key: 'ArrowUp' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        fireEvent.keyDown(grid, { key: 'ArrowUp' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        fireEvent.keyDown(grid, { key: 'ArrowUp' });
        expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    // test in karma mocha only since it involves scrolling
    if (typeof jest === 'undefined') {
        it('test scroll into view when listview regains focus', async () => {
            const data = populateData(10);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            // the initial current item is Employee 9
            render(jsx(TestComponent, { data: dataMetadata, initialKey: data[9].id }));
            const grid = await getRoot();
            await waitFor(() => {
                expect(grid.scrollTop).to.greaterThanOrEqual(280);
            });
            // scroll listview up until scrollTop is 0
            grid.scrollTop = 0;
            await waitFor(() => {
                expect(grid.scrollTop).to.eq(0);
            });
            // tab into listview, should scroll Employee 9 into view
            await userEvent.tab();
            await waitFor(() => {
                expect(grid.scrollTop).to.greaterThanOrEqual(280);
            });
        });
    }
};
const testScrollPosition = (TestComponent) => {
    if (typeof jest === 'undefined') {
        it('Scroll position', async () => {
            const data = populateData(20);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            render(jsx("div", { style: `height: ${xUnits(50)}; overflow: auto`, children: jsx(TestComponent, { data: dataMetadata, scrollPositionOverride: {
                        key: data[4].id
                    } }) }));
            const position = screen.getByText(data[4].id + ' 200 0');
            expect(position).to.exist;
        });
    }
};
const testReorder = (TestComponent) => {
    it('reorder - fire Drag and Drop Event', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const { queryByTestId } = render(jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        let items = await getItems();
        const count = items.length;
        const firstItemDragIcon = queryByTestId(`drag-icon-${items[0].dataset['ojKey']}`);
        const thirdItemDragIcon = queryByTestId(`drag-icon-${items[2].dataset['ojKey']}`);
        const firstItem = items[0];
        // drag the first item and drop on the third item
        fireDragAndDropEvent(firstItemDragIcon, thirdItemDragIcon);
        await waitFor(async () => {
            items = await getItems();
            const updatedThirdItem = items[2];
            expect(firstItem).equals(updatedThirdItem);
            expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the first item to down using keyboard', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        const list = await getRoot();
        let items = await getItems();
        const count = items.length;
        const firstItem = items[0];
        // reorder the first item up
        mouseItemSelection(firstItem);
        keyboardReorder(list, 'ArrowUp');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[0];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // reorder the first item down
        keyboardReorder(list, 'ArrowDown');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[1];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // continuous reorder the first item down
        keyboardReorder(list, 'ArrowDown');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[2];
            expect(firstItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the last item to up using keyboard', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        const list = await getRoot();
        let items = await getItems();
        const count = items.length;
        const startIndex = items.length - 1;
        const lastItem = items[startIndex];
        // reorder the last item down
        mouseItemSelection(lastItem.firstElementChild);
        keyboardReorder(list, 'ArrowDown');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[startIndex];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // reorder the last item up
        keyboardReorder(list, 'ArrowUp');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[startIndex - 1];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
        // continuous reorder the last item up
        keyboardReorder(list, 'ArrowUp');
        await waitFor(async () => {
            items = await getItems();
            const reorderedItem = items[startIndex - 2];
            expect(lastItem).equals(reorderedItem);
            expect(items.length).equal(count);
        });
    });
    if (typeof jest == typeof undefined) {
        it('reorder - test instruction text', async () => {
            const data = populateData(3);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            // get instruction text
            const { deviceType, platform } = getClientHints();
            const keyPressed = platform === 'windows' ? bundle.accControlKey() : bundle.accCommandKey();
            const reorderInstructions = deviceType === 'phone' || deviceType === 'tablet'
                ? ''
                : bundle.accReorderInstructions({
                    keyPressed: keyPressed
                });
            // instruction text should exist when reorder is enabled
            const { rerender } = render(jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
            let instructionText = screen.queryByText(reorderInstructions);
            expect(instructionText).not.to.be.null;
            // instruction text should not exist when reorder is disabled
            rerender(jsx(TestComponent, { data: dataMetadata }));
            instructionText = screen.queryByText(reorderInstructions);
            expect(instructionText).to.be.null;
        });
    }
};

function __variableDynamicImportRuntime25__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime24__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime23__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime22__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime21__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime20__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime19__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime18__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime17__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime16__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime15__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime14__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime13__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime12__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime11__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime10__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime9__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime8__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime7__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime6__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime5__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime4__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime3__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime2__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime1__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime0__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return import('./resources/nls/ar/bundle.js');
    case '../../../resources/nls/ar-XB/bundle.ts': return import('./resources/nls/ar-XB/bundle.js');
    case '../../../resources/nls/bg/bundle.ts': return import('./resources/nls/bg/bundle.js');
    case '../../../resources/nls/bs/bundle.ts': return import('./resources/nls/bs/bundle.js');
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return import('./resources/nls/bs-Cyrl/bundle.js');
    case '../../../resources/nls/cs/bundle.ts': return import('./resources/nls/cs/bundle.js');
    case '../../../resources/nls/da/bundle.ts': return import('./resources/nls/da/bundle.js');
    case '../../../resources/nls/de/bundle.ts': return import('./resources/nls/de/bundle.js');
    case '../../../resources/nls/el/bundle.ts': return import('./resources/nls/el/bundle.js');
    case '../../../resources/nls/en/bundle.ts': return import('./resources/nls/en/bundle.js');
    case '../../../resources/nls/en-XA/bundle.ts': return import('./resources/nls/en-XA/bundle.js');
    case '../../../resources/nls/en-XC/bundle.ts': return import('./resources/nls/en-XC/bundle.js');
    case '../../../resources/nls/es/bundle.ts': return import('./resources/nls/es/bundle.js');
    case '../../../resources/nls/et/bundle.ts': return import('./resources/nls/et/bundle.js');
    case '../../../resources/nls/fi/bundle.ts': return import('./resources/nls/fi/bundle.js');
    case '../../../resources/nls/fr/bundle.ts': return import('./resources/nls/fr/bundle.js');
    case '../../../resources/nls/fr-CA/bundle.ts': return import('./resources/nls/fr-CA/bundle.js');
    case '../../../resources/nls/he/bundle.ts': return import('./resources/nls/he/bundle.js');
    case '../../../resources/nls/hr/bundle.ts': return import('./resources/nls/hr/bundle.js');
    case '../../../resources/nls/hu/bundle.ts': return import('./resources/nls/hu/bundle.js');
    case '../../../resources/nls/is/bundle.ts': return import('./resources/nls/is/bundle.js');
    case '../../../resources/nls/it/bundle.ts': return import('./resources/nls/it/bundle.js');
    case '../../../resources/nls/ja/bundle.ts': return import('./resources/nls/ja/bundle.js');
    case '../../../resources/nls/ko/bundle.ts': return import('./resources/nls/ko/bundle.js');
    case '../../../resources/nls/lt/bundle.ts': return import('./resources/nls/lt/bundle.js');
    case '../../../resources/nls/lv/bundle.ts': return import('./resources/nls/lv/bundle.js');
    case '../../../resources/nls/ms/bundle.ts': return import('./resources/nls/ms/bundle.js');
    case '../../../resources/nls/nl/bundle.ts': return import('./resources/nls/nl/bundle.js');
    case '../../../resources/nls/no/bundle.ts': return import('./resources/nls/no/bundle.js');
    case '../../../resources/nls/pl/bundle.ts': return import('./resources/nls/pl/bundle.js');
    case '../../../resources/nls/pt/bundle.ts': return import('./resources/nls/pt/bundle.js');
    case '../../../resources/nls/pt-PT/bundle.ts': return import('./resources/nls/pt-PT/bundle.js');
    case '../../../resources/nls/ro/bundle.ts': return import('./resources/nls/ro/bundle.js');
    case '../../../resources/nls/ru/bundle.ts': return import('./resources/nls/ru/bundle.js');
    case '../../../resources/nls/sk/bundle.ts': return import('./resources/nls/sk/bundle.js');
    case '../../../resources/nls/sl/bundle.ts': return import('./resources/nls/sl/bundle.js');
    case '../../../resources/nls/sr/bundle.ts': return import('./resources/nls/sr/bundle.js');
    case '../../../resources/nls/sr-Latn/bundle.ts': return import('./resources/nls/sr-Latn/bundle.js');
    case '../../../resources/nls/sv/bundle.ts': return import('./resources/nls/sv/bundle.js');
    case '../../../resources/nls/th/bundle.ts': return import('./resources/nls/th/bundle.js');
    case '../../../resources/nls/tr/bundle.ts': return import('./resources/nls/tr/bundle.js');
    case '../../../resources/nls/uk/bundle.ts': return import('./resources/nls/uk/bundle.js');
    case '../../../resources/nls/vi/bundle.ts': return import('./resources/nls/vi/bundle.js');
    case '../../../resources/nls/zh-Hans/bundle.ts': return import('./resources/nls/zh-Hans/bundle.js');
    case '../../../resources/nls/zh-Hant/bundle.ts': return import('./resources/nls/zh-Hant/bundle.js');
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }
const testSelection = (TestComponent) => {
    it('select single - numeric key', async () => {
        const data = populateData(10, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        render(jsx(TestComponent, { data: dataMetadata, selectionMode: "single", onClick: () => {
                expect(false, 'Click event should not propagate').to.be.true;
            } }));
        const items = await getContents();
        mouseItemSelection(items[3]);
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        mouseItemSelection(items[5]);
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        mouseItemSelection(items[7]);
        await waitFor(() => {
            expect(items[7].getAttribute('aria-selected')).eq('true');
        });
    });
    it('select multiple items using shift click', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime0__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        mouseItemSelection(items[5], { shiftKey: true });
        // console.log('here');
        // console.log(list.debug());
        await waitFor(() => {
            //TODO: Add a reliable way to use waitFor correctly.JET-63874
            /* eslint-disable */
            expect(items[1].getAttribute('aria-selected')).eq('false');
            expect(items[2].getAttribute('aria-selected')).eq('true');
            expect(items[3].getAttribute('aria-selected')).eq('true');
            expect(items[4].getAttribute('aria-selected')).eq('true');
            expect(items[5].getAttribute('aria-selected')).eq('true');
            expect(items[6].getAttribute('aria-selected')).eq('false');
            /* eslint-enable */
        });
    }, 3000);
    it('select multiple items using shift space bar', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime1__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        fireEvent.keyUp(items[2], { key: ' ' });
        fireEvent.keyUp(items[5], { key: ' ', shiftKey: true });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        expect(items[5].getAttribute('aria-selected')).eq('true');
        expect(items[6].getAttribute('aria-selected')).eq('false');
    });
    it('selects multiple items when clicking on Selector checkboxes', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const selected = { all: false, keys: new Set([data[2].id]) };
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime2__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple", selectedKeys: selected }) }));
        const items = await getContents();
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('false');
        mouseCheckboxSelection(4);
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
    });
    it('correctly modifies range selection when using SPACE to select', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime3__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        fireEvent.keyUp(items[2], { key: ' ' });
        fireEvent.keyUp(items[5], { key: ' ', shiftKey: true });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        expect(items[5].getAttribute('aria-selected')).eq('true');
        expect(items[6].getAttribute('aria-selected')).eq('false');
        // keyboard select to "toggle" one item off
        fireEvent.keyUp(items[3], { key: ' ' });
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        // keyboard select again to "replace" with single selection only
        fireEvent.keyUp(items[3], { key: ' ' });
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('false');
    });
    it('selects single items using space keypress', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime4__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        fireEvent.keyUp(items[2], { key: ' ' });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        fireEvent.keyUp(items[3], { key: ' ' });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    }, 3000);
    it('selects single items using enter keypress (Context value is embedded)', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime5__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(CollectionGestureContext.Provider, { value: 'embedded', children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }) }));
        const items = await getContents();
        fireEvent.keyUp(items[2], { key: 'Enter' });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        fireEvent.keyUp(items[3], { key: 'Enter' });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('selects single items using enter keypress (Context value is default)', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime6__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(CollectionGestureContext.Provider, { value: 'default', children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }) }));
        const items = await getContents();
        fireEvent.keyUp(items[2], { key: 'Enter' });
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('select multiple items then click on a selected items', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime7__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        mouseItemSelection(items[5], { shiftKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        mouseItemSelection(items[3]);
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('false');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('false');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('false');
        });
    });
    it('select multiple items then shift click on a selected items', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime8__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        mouseItemSelection(items[5], { shiftKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        mouseItemSelection(items[3], { shiftKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('false');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('false');
        });
    });
    it('select multiple items then metaKey click on a selected items, to select and unselect', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime9__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await getContents();
        mouseItemSelection(items[2]);
        mouseItemSelection(items[5], { shiftKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // first click to deselect
        mouseItemSelection(items[3], { metaKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('false');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // second click to reselect
        mouseItemSelection(items[3], { metaKey: true });
        await waitFor(() => {
            expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await waitFor(() => {
            expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // click outside of range should be additive too
        mouseItemSelection(items[7], { metaKey: true });
        await waitFor(() => {
            /* eslint-disable */
            expect(items[2].getAttribute('aria-selected')).eq('true');
            expect(items[3].getAttribute('aria-selected')).eq('true');
            expect(items[4].getAttribute('aria-selected')).eq('true');
            expect(items[5].getAttribute('aria-selected')).eq('true');
            expect(items[6].getAttribute('aria-selected')).eq('false');
            expect(items[7].getAttribute('aria-selected')).eq('true');
            /* eslint-enable */
        });
    }, 3000);
    it('supports multi-select (and deselect) via keyboard arrow keys', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime10__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // select items 1-3
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        // deselect 2 and 3 via up-arrow
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // continue up past initial anchor, to select items 0 and 1
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('supports extending mouse initiated range select via arrow keys', async () => {
        const data = populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime11__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // select items 2-5 via click
        mouseItemSelection(items[2]);
        mouseItemSelection(items[5], { shiftKey: true });
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        expect(items[5].getAttribute('aria-selected')).eq('true');
        expect(items[6].getAttribute('aria-selected')).eq('false');
        expect(items[7].getAttribute('aria-selected')).eq('false');
        // now extend by two more rows
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        expect(items[5].getAttribute('aria-selected')).eq('true');
        expect(items[6].getAttribute('aria-selected')).eq('true');
        expect(items[7].getAttribute('aria-selected')).eq('true');
        // now deselect those via up-arrow
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
        expect(items[4].getAttribute('aria-selected')).eq('true');
        expect(items[5].getAttribute('aria-selected')).eq('true');
        expect(items[6].getAttribute('aria-selected')).eq('false');
        expect(items[7].getAttribute('aria-selected')).eq('false');
    });
    it('supports range selection from current item to shift+click item', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime12__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection from current item to shift+arrow items', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime13__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 3rd item
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('supports range selection from current item, shift+click and then shift+click', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime14__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection from current item, shift+click and then shift+arrow  ', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime15__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('supports range selection from current item, shift+click and then shift+space', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime16__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection from current item, shift+arrow and then shift+click  ', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime17__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
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
    it('supports range selection from current item, shift+arrow and then shift+arrow  ', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime18__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('true');
        expect(items[1].getAttribute('aria-selected')).eq('true');
        expect(items[2].getAttribute('aria-selected')).eq('false');
        expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow to the 3rd item, then shift + arrow to the 4th item
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(grid, { key: 'ArrowDown' });
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        expect(items[0].getAttribute('aria-selected')).eq('false');
        expect(items[1].getAttribute('aria-selected')).eq('false');
        expect(items[2].getAttribute('aria-selected')).eq('true');
        expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('supports range selection from current item, shift+arrow and then shift+space', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime19__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        // tab and focus to make the 1st item current
        await userEvent.tab();
        expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        fireEvent.click(items[0]);
        fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
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
    it('supports range selection from current item, shift+space and then shift+space', async () => {
        const data = populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime20__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection shift+space and then shift+space', async () => {
        const data = populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime21__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection and deselect selected item by shift+space', async () => {
        const data = populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime22__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection backward shift+space and then shift+space', async () => {
        const data = populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime23__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection backward shift+click and then shift+space', async () => {
        const data = populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime24__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
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
    it('supports range selection backward shift+arrow and then shift+space', async () => {
        const data = populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime25__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        render(jsx(RootEnvironmentProvider, { environment: env, children: jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await getRoot();
        const items = await getContents();
        mouseItemSelection(items[2]);
        // shift + arrow to select the 1st item
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
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

export { testAria as a, testKeys as b, testGridlines as c, testItemAction as d, testNavigation as e, testScrollPosition as f, testReorder as g, testContextMenu as h, testSelection as i, testRender as t };
//# sourceMappingURL=listViewSelectionTests-ebf987d2.js.map
