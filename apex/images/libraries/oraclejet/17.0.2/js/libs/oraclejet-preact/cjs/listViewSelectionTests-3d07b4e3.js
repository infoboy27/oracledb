/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var userEvent = require('@testing-library/user-event');
var chai = require('chai');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var matchTranslationBundle = require('./matchTranslationBundle-99625a42.js');
var useCollectionGestureContext = require('./useCollectionGestureContext-daada886.js');
require('preact/hooks');
require('./Menu-7f8ca235.js');
var MenuItem = require('./MenuItem-9a73694f.js');
require('preact');
var utils = require('./utils-b7099be5.js');
require('./useTooltipControlled-706a3651.js');

require('./SelectMenuGroupContext-bbb4f7e0.js');
require('./logger-2b636482.js');
require('./UNSAFE_Separator/themes/SeparatorStyles.css.js');


require('./UNSAFE_Menu/themes/redwood/MenuSeparatorVariants.css.js');
require('preact/compat');
var resources_nls_en_bundle = require('./resources/nls/en/bundle.js');
var listViewTestFixtures = require('./listViewTestFixtures-fe29420a.js');
var testHelpers = require('./testHelpers-15e6ef95.js');
var menuTestsUtils = require('./menuTestsUtils-9d5d258a.js');
var clientHints = require('./clientHints-9e411b6e.js');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var userEvent__default = /*#__PURE__*/_interopDefaultLegacy(userEvent);

function __variableDynamicImportRuntime2__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime1__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime0__$1(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
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
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const items = await testHelpers.getItems();
        chai.expect(items.length).eq(25);
    });
    // skip this test in jest, only run it in karma mocha
    if (typeof jest == typeof undefined) {
        it('initial render with sparkle', async () => {
            const data = listViewTestFixtures.populateData(100);
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
            preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
            const grid = await testHelpers.getRoot();
            const sparkle = getSparkle(grid);
            chai.expect(sparkle !== undefined).eq(true);
            const items = await testHelpers.getItems();
            chai.expect(items?.length).eq(25);
            chai.expect(items[0].dataset['ojSuggestion']).eq('true');
            chai.expect(items[1].dataset['ojSuggestion']).eq('true');
            chai.expect(items[2].dataset['ojSuggestion']).eq('true');
            const sparkleHeight = items[0].offsetHeight + items[1].offsetHeight + items[2].offsetHeight;
            chai.expect(sparkleHeight).eq(sparkle.offsetHeight);
        });
    }
};
const testContextMenu = (TestComponent) => {
    it("Jet context menu appears when there's no text selection", async () => {
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime0__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem2" }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await testHelpers.getContents();
        const grid = await testHelpers.getRoot();
        const firstItem = items[0];
        preact.fireEvent.contextMenu(firstItem, {
            clientX: 50,
            clientY: 50,
            currentTarget: grid
        });
        const menu = menuTestsUtils.getMenuItemByRole('menu');
        const menuItems = menuTestsUtils.getAllMenuItemsByRole('menuitem');
        //With this we check context menu context was set correctly
        const menuItemGotByLabel = menuTestsUtils.getLabel('MenuItemi0');
        chai.expect(menu).not.null;
        chai.expect(menuItems.length).equals(3);
        chai.expect(menuItemGotByLabel).not.null;
    });
    it('ContextMenu on Shift-F10', async () => {
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime1__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem2" }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        const firstItem = items[0];
        //We do the necessary to have firstItem as current item
        preact.fireEvent.click(items[0]);
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(firstItem.id);
        preact.fireEvent.keyDown(grid, { key: 'F10', shiftKey: true });
        const menu = menuTestsUtils.getMenuItemByRole('menu');
        const menuItems = menuTestsUtils.getAllMenuItemsByRole('menuitem');
        //With this we check context menu context was set correctly
        const menuItemGotByLabel = menuTestsUtils.getLabel('MenuItemi0');
        chai.expect(menu).not.null;
        chai.expect(menuItems.length).equals(3);
        chai.expect(menuItemGotByLabel).not.null;
    });
    it("Jet context menu doesn't appear when there is text selection", async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem2" }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await testHelpers.getContents();
        const grid = await testHelpers.getRoot();
        const firstItem = items[0];
        const elem = await preact.screen.findByText(firstItem.textContent || '');
        // Set text selection
        await userEvent__default["default"].pointer([
            { target: elem, offset: 0, keys: '[MouseLeft>]' },
            { offset: 5 },
            { keys: '[/MouseLeft]' }
        ]);
        preact.fireEvent.contextMenu(firstItem, {
            clientX: 50,
            clientY: 50,
            currentTarget: grid
        });
        const menu = preact.screen.queryByRole('menu');
        chai.expect(menu).null;
    });
    it('Ios context menu appears after 1500ms', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, contextMenuConfig: {
                    itemsRenderer: (context) => {
                        const data = context.data;
                        return (jsxRuntime.jsxs(jsxRuntime.Fragment, { children: [jsxRuntime.jsx(MenuItem.MenuItem, { label: `MenuItem${data ? data.id : ''}` }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem2" }), jsxRuntime.jsx(MenuItem.MenuItem, { label: "MenuItem3" })] }));
                    }
                } }) }));
        const items = await testHelpers.getContents();
        const firstItem = items[0];
        if (typeof jest === 'undefined') {
            const { deviceType, platform } = clientHints.getClientHints();
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
                    preact.fireEvent.touchStart(firstItem, {
                        timeStamp: 10406,
                        currentTarget: firstItem,
                        touches: [touch1]
                    });
                }
                await timeout(1550);
                const menu = menuTestsUtils.getMenuItemByRole('menu');
                const menuItems = menuTestsUtils.getAllMenuItemsByRole('menuitem');
                //With this we check context menu context was set correctly
                const menuItemGotByLabel = menuTestsUtils.getLabel('MenuItemi0');
                chai.expect(menu).not.null;
                chai.expect(menuItems.length).equals(3);
                chai.expect(menuItemGotByLabel).not.null;
            }
        }
    });
};
const testAria = (TestComponent) => {
    it('aria structure and properties (select-none)', async function () {
        const data = listViewTestFixtures.populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.getAttribute('aria-rowcount')).eq('10');
        chai.expect(grid.getAttribute('aria-multiselectable')).eq(null);
        const items = await testHelpers.getItems();
        chai.expect(items.length).eq(10);
        chai.expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await testHelpers.getContents();
        chai.expect(cells.length).eq(10);
        chai.expect(cells[0].getAttribute('aria-colindex')).eq('1');
        chai.expect(cells[0].getAttribute('aria-selected')).eq(null);
    });
    it('aria structure and properties (single-select)', async function () {
        const data = listViewTestFixtures.populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "single" }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.getAttribute('aria-rowcount')).eq('10');
        chai.expect(grid.getAttribute('aria-multiselectable')).eq('false');
        const items = await testHelpers.getItems();
        chai.expect(items.length).eq(10);
        chai.expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await testHelpers.getContents();
        chai.expect(cells.length).eq(10);
        chai.expect(cells[0].getAttribute('aria-colindex')).eq('1');
        chai.expect(cells[0].getAttribute('aria-selected')).eq('false');
    });
    it('aria structure and properties (multi-select)', async function () {
        const data = listViewTestFixtures.populateData(10);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime2__$1(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.getAttribute('aria-rowcount')).eq('10');
        chai.expect(grid.getAttribute('aria-multiselectable')).eq('true');
        const items = await testHelpers.getItems();
        chai.expect(items.length).eq(10);
        chai.expect(items[0].getAttribute('aria-rowindex')).eq('1');
        const cells = await testHelpers.getContents();
        chai.expect(cells.length).eq(10);
        chai.expect(cells[0].getAttribute('aria-colindex')).eq('1');
        chai.expect(cells[0].getAttribute('aria-selected')).eq('false');
    });
};
const testKeys = (TestComponent) => {
    it('supports currentKey logic with numeric key', async () => {
        const data = listViewTestFixtures.populateData(100, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await testHelpers.getContents();
        preact.fireEvent.click(items[0]);
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    it('supports currentKey logic with string key', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await testHelpers.getContents();
        preact.fireEvent.click(items[0]);
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    it('checking key type - string key', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const items = await testHelpers.getItems();
        chai.expect(items[0].dataset['ojKeyType'] === undefined).eq(true);
        chai.expect(items[1].dataset['ojKeyType'] === undefined).eq(true);
        chai.expect(items[2].dataset['ojKeyType'] === undefined).eq(true);
    });
    it('checking key type - numeric key', async () => {
        const data = listViewTestFixtures.populateData(3, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const items = await testHelpers.getItems();
        chai.expect(items[0].dataset['ojKeyType']).eq('number');
        chai.expect(items[1].dataset['ojKeyType']).eq('number');
        chai.expect(items[2].dataset['ojKeyType']).eq('number');
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
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const items = await testHelpers.getItems();
        chai.expect(isGridlineHidden(items[0])).to.be.true;
        chai.expect(isGridlineHidden(items[1])).to.be.true;
        chai.expect(isGridlineHidden(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visible = { item: 'visible', bottom: 'visible' };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, gridlines: visible }));
        const items = await testHelpers.getItems();
        chai.expect(isBottomGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[1])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible except for the last list item', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleExceptLast = { item: 'visible' };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, gridlines: visibleExceptLast }));
        const items = await testHelpers.getItems();
        chai.expect(isBottomGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[1])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[2])).to.be.false;
    });
    it('gridlines - bottom gridlines are visible; The top gridlines of the first list item is visible', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleWithFirst = {
            item: 'visible',
            top: 'visible',
            bottom: 'visible'
        };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, gridlines: visibleWithFirst }));
        const items = await testHelpers.getItems();
        chai.expect(isTopGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[1])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[2])).to.be.true;
    });
    it('gridlines - bottom gridlines are visible except for the last list item. The top gridlines of the first list item is visible.', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const visibleWithFirstButNotLast = { item: 'visible', top: 'visible' };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, gridlines: visibleWithFirstButNotLast }));
        const items = await testHelpers.getItems();
        chai.expect(isTopGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[0])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[1])).to.be.true;
        chai.expect(isBottomGridlineVisible(items[2])).to.be.false;
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
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 0) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 1) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }));
        const items = await testHelpers.getItems('row');
        preact.fireEvent.click(items[1]);
        preact.fireEvent.click(items[1]);
        preact.fireEvent.click(items[2]);
        chai.expect(count).eq(3);
    });
    it('ItemAction - test press enter on item', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 3) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getItems('row');
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(items[1], { key: 'Enter' });
        preact.fireEvent.keyDown(items[1], { key: 'Enter' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(items[2], { key: 'Enter' });
        chai.expect(count).eq(4);
    });
    it('ItemAction - test press spacebar on item (Context value is embedded)', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 2) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[1].metadata), 'Context metadata is correct').eq(true);
            }
            else if (count === 3) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                chai.expect(isMetadataEqual(detail.context.metadata, dataMetadata[2].metadata), 'Context metadata is correct').eq(true);
            }
            count++;
        };
        preact.render(jsxRuntime.jsx(useCollectionGestureContext.CollectionGestureContext.Provider, { value: 'embedded', children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getItems('row');
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(items[1], { key: ' ' });
        preact.fireEvent.keyDown(items[1], { key: ' ' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(items[2], { key: ' ' });
        chai.expect(count).eq(4);
    });
    it('ItemAction - test press spacebar on item (Context value is default)', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        let count = 0;
        const onItemAction = (detail) => {
            if (count === 1) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[1].metadata);
            }
            else if (count === 2) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[1].data);
                chai.expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[1].metadata);
            }
            else if (count === 3) {
                chai.expect(detail.context.data, 'Context data is correct').eq(dataMetadata[2].data);
                chai.expect(detail.context.metadata, 'Context metadata is correct').eq(dataMetadata[2].metadata);
            }
            count++;
        };
        preact.render(jsxRuntime.jsx(useCollectionGestureContext.CollectionGestureContext.Provider, { value: 'default', children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, onItemAction: onItemAction }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getItems('row');
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(items[1], { key: ' ' });
        preact.fireEvent.keyDown(items[1], { key: ' ' });
        chai.expect(count).eq(1);
    });
    it('currentItemVariant - highlight', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, initialKey: dataMetadata[1].metadata.key, currentItemVariant: "highlight" }));
        const items = await testHelpers.getItems();
        chai.expect(isFocusHighlight(items[0])).to.be.false;
        preact.fireEvent.click(items[0]);
        chai.expect(isFocusHighlight(items[0])).to.be.true;
    });
    it('currentItemVariant - none', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, initialKey: dataMetadata[1].metadata.key, currentItemVariant: "none" }));
        const items = await testHelpers.getItems();
        chai.expect(isFocusHighlight(items[0])).to.be.false;
        preact.fireEvent.click(items[0]);
        chai.expect(isFocusHighlight(items[0])).to.be.false;
    });
};
const testNavigation = (TestComponent) => {
    it('arrow keys', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
        const grid = await testHelpers.getRoot();
        chai.expect(grid.hasAttribute('aria-activedescendant')).eq(false);
        const items = await testHelpers.getContents();
        preact.fireEvent.click(items[0]);
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[2].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[2].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[1].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp' });
        chai.expect(grid.getAttribute('aria-activedescendant')).eq(items[0].id);
    });
    // test in karma mocha only since it involves scrolling
    if (typeof jest === 'undefined') {
        it('test scroll into view when listview regains focus', async () => {
            const data = listViewTestFixtures.populateData(10);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            // the initial current item is Employee 9
            preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, initialKey: data[9].id }));
            const grid = await testHelpers.getRoot();
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.greaterThanOrEqual(280);
            });
            // scroll listview up until scrollTop is 0
            grid.scrollTop = 0;
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.eq(0);
            });
            // tab into listview, should scroll Employee 9 into view
            await userEvent__default["default"].tab();
            await preact.waitFor(() => {
                chai.expect(grid.scrollTop).to.greaterThanOrEqual(280);
            });
        });
    }
};
const testScrollPosition = (TestComponent) => {
    if (typeof jest === 'undefined') {
        it('Scroll position', async () => {
            const data = listViewTestFixtures.populateData(20);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            preact.render(jsxRuntime.jsx("div", { style: `height: ${utils.xUnits(50)}; overflow: auto`, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, scrollPositionOverride: {
                        key: data[4].id
                    } }) }));
            const position = preact.screen.getByText(data[4].id + ' 200 0');
            chai.expect(position).to.exist;
        });
    }
};
const testReorder = (TestComponent) => {
    it('reorder - fire Drag and Drop Event', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const { queryByTestId } = preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        let items = await testHelpers.getItems();
        const count = items.length;
        const firstItemDragIcon = queryByTestId(`drag-icon-${items[0].dataset['ojKey']}`);
        const thirdItemDragIcon = queryByTestId(`drag-icon-${items[2].dataset['ojKey']}`);
        const firstItem = items[0];
        // drag the first item and drop on the third item
        testHelpers.fireDragAndDropEvent(firstItemDragIcon, thirdItemDragIcon);
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const updatedThirdItem = items[2];
            chai.expect(firstItem).equals(updatedThirdItem);
            chai.expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the first item to down using keyboard', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        const list = await testHelpers.getRoot();
        let items = await testHelpers.getItems();
        const count = items.length;
        const firstItem = items[0];
        // reorder the first item up
        testHelpers.mouseItemSelection(firstItem);
        testHelpers.keyboardReorder(list, 'ArrowUp');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[0];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // reorder the first item down
        testHelpers.keyboardReorder(list, 'ArrowDown');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[1];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // continuous reorder the first item down
        testHelpers.keyboardReorder(list, 'ArrowDown');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[2];
            chai.expect(firstItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
    });
    it('reorder - reorder the last item to up using keyboard', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
        const list = await testHelpers.getRoot();
        let items = await testHelpers.getItems();
        const count = items.length;
        const startIndex = items.length - 1;
        const lastItem = items[startIndex];
        // reorder the last item down
        testHelpers.mouseItemSelection(lastItem.firstElementChild);
        testHelpers.keyboardReorder(list, 'ArrowDown');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[startIndex];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // reorder the last item up
        testHelpers.keyboardReorder(list, 'ArrowUp');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[startIndex - 1];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
        // continuous reorder the last item up
        testHelpers.keyboardReorder(list, 'ArrowUp');
        await preact.waitFor(async () => {
            items = await testHelpers.getItems();
            const reorderedItem = items[startIndex - 2];
            chai.expect(lastItem).equals(reorderedItem);
            chai.expect(items.length).equal(count);
        });
    });
    if (typeof jest == typeof undefined) {
        it('reorder - test instruction text', async () => {
            const data = listViewTestFixtures.populateData(3);
            const dataMetadata = data.map((data) => {
                return { data: data, metadata: { key: data.id } };
            });
            // get instruction text
            const { deviceType, platform } = clientHints.getClientHints();
            const keyPressed = platform === 'windows' ? resources_nls_en_bundle["default"].accControlKey() : resources_nls_en_bundle["default"].accCommandKey();
            const reorderInstructions = deviceType === 'phone' || deviceType === 'tablet'
                ? ''
                : resources_nls_en_bundle["default"].accReorderInstructions({
                    keyPressed: keyPressed
                });
            // instruction text should exist when reorder is enabled
            const { rerender } = preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, isReorderEnabled: true }));
            let instructionText = preact.screen.queryByText(reorderInstructions);
            chai.expect(instructionText).not.to.be.null;
            // instruction text should not exist when reorder is disabled
            rerender(jsxRuntime.jsx(TestComponent, { data: dataMetadata }));
            instructionText = preact.screen.queryByText(reorderInstructions);
            chai.expect(instructionText).to.be.null;
        });
    }
};

function __variableDynamicImportRuntime25__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime24__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime23__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime22__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime21__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime20__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime19__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime18__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime17__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime16__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime15__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime14__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime13__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime12__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime11__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime10__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime9__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime8__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime7__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime6__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime5__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime4__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime3__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime2__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime1__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }

function __variableDynamicImportRuntime0__(path) {
  switch (path) {
    case '../../../resources/nls/ar/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar/bundle.js'); });
    case '../../../resources/nls/ar-XB/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ar-XB/bundle.js'); });
    case '../../../resources/nls/bg/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bg/bundle.js'); });
    case '../../../resources/nls/bs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs/bundle.js'); });
    case '../../../resources/nls/bs-Cyrl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/bs-Cyrl/bundle.js'); });
    case '../../../resources/nls/cs/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/cs/bundle.js'); });
    case '../../../resources/nls/da/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/da/bundle.js'); });
    case '../../../resources/nls/de/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/de/bundle.js'); });
    case '../../../resources/nls/el/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/el/bundle.js'); });
    case '../../../resources/nls/en/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en/bundle.js'); });
    case '../../../resources/nls/en-XA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XA/bundle.js'); });
    case '../../../resources/nls/en-XC/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/en-XC/bundle.js'); });
    case '../../../resources/nls/es/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/es/bundle.js'); });
    case '../../../resources/nls/et/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/et/bundle.js'); });
    case '../../../resources/nls/fi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fi/bundle.js'); });
    case '../../../resources/nls/fr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr/bundle.js'); });
    case '../../../resources/nls/fr-CA/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/fr-CA/bundle.js'); });
    case '../../../resources/nls/he/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/he/bundle.js'); });
    case '../../../resources/nls/hr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hr/bundle.js'); });
    case '../../../resources/nls/hu/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/hu/bundle.js'); });
    case '../../../resources/nls/is/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/is/bundle.js'); });
    case '../../../resources/nls/it/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/it/bundle.js'); });
    case '../../../resources/nls/ja/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ja/bundle.js'); });
    case '../../../resources/nls/ko/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ko/bundle.js'); });
    case '../../../resources/nls/lt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lt/bundle.js'); });
    case '../../../resources/nls/lv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/lv/bundle.js'); });
    case '../../../resources/nls/ms/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ms/bundle.js'); });
    case '../../../resources/nls/nl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/nl/bundle.js'); });
    case '../../../resources/nls/no/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/no/bundle.js'); });
    case '../../../resources/nls/pl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pl/bundle.js'); });
    case '../../../resources/nls/pt/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt/bundle.js'); });
    case '../../../resources/nls/pt-PT/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/pt-PT/bundle.js'); });
    case '../../../resources/nls/ro/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ro/bundle.js'); });
    case '../../../resources/nls/ru/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/ru/bundle.js'); });
    case '../../../resources/nls/sk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sk/bundle.js'); });
    case '../../../resources/nls/sl/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sl/bundle.js'); });
    case '../../../resources/nls/sr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr/bundle.js'); });
    case '../../../resources/nls/sr-Latn/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sr-Latn/bundle.js'); });
    case '../../../resources/nls/sv/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/sv/bundle.js'); });
    case '../../../resources/nls/th/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/th/bundle.js'); });
    case '../../../resources/nls/tr/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/tr/bundle.js'); });
    case '../../../resources/nls/uk/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/uk/bundle.js'); });
    case '../../../resources/nls/vi/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/vi/bundle.js'); });
    case '../../../resources/nls/zh-Hans/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hans/bundle.js'); });
    case '../../../resources/nls/zh-Hant/bundle.ts': return Promise.resolve().then(function () { return require('./resources/nls/zh-Hant/bundle.js'); });
    default: return new Promise(function(resolve, reject) {
      (typeof queueMicrotask === 'function' ? queueMicrotask : setTimeout)(
        reject.bind(null, new Error("Unknown variable dynamic import: " + path))
      );
    })
   }
 }
const testSelection = (TestComponent) => {
    it('select single - numeric key', async () => {
        const data = listViewTestFixtures.populateData(10, true);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        preact.render(jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "single", onClick: () => {
                chai.expect(false, 'Click event should not propagate').to.be.true;
            } }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[3]);
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        testHelpers.mouseItemSelection(items[5]);
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        testHelpers.mouseItemSelection(items[7]);
        await preact.waitFor(() => {
            chai.expect(items[7].getAttribute('aria-selected')).eq('true');
        });
    });
    it('select multiple items using shift click', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime0__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        testHelpers.mouseItemSelection(items[5], { shiftKey: true });
        // console.log('here');
        // console.log(list.debug());
        await preact.waitFor(() => {
            //TODO: Add a reliable way to use waitFor correctly.JET-63874
            /* eslint-disable */
            chai.expect(items[1].getAttribute('aria-selected')).eq('false');
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
            chai.expect(items[6].getAttribute('aria-selected')).eq('false');
            /* eslint-enable */
        });
    }, 3000);
    it('select multiple items using shift space bar', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime1__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        preact.fireEvent.keyUp(items[2], { key: ' ' });
        preact.fireEvent.keyUp(items[5], { key: ' ', shiftKey: true });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        chai.expect(items[6].getAttribute('aria-selected')).eq('false');
    });
    it('selects multiple items when clicking on Selector checkboxes', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const selected = { all: false, keys: new Set([data[2].id]) };
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime2__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple", selectedKeys: selected }) }));
        const items = await testHelpers.getContents();
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        testHelpers.mouseCheckboxSelection(4);
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
    });
    it('correctly modifies range selection when using SPACE to select', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime3__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        preact.fireEvent.keyUp(items[2], { key: ' ' });
        preact.fireEvent.keyUp(items[5], { key: ' ', shiftKey: true });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        chai.expect(items[6].getAttribute('aria-selected')).eq('false');
        // keyboard select to "toggle" one item off
        preact.fireEvent.keyUp(items[3], { key: ' ' });
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        // keyboard select again to "replace" with single selection only
        preact.fireEvent.keyUp(items[3], { key: ' ' });
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('false');
    });
    it('selects single items using space keypress', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime4__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        preact.fireEvent.keyUp(items[2], { key: ' ' });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        preact.fireEvent.keyUp(items[3], { key: ' ' });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    }, 3000);
    it('selects single items using enter keypress (Context value is embedded)', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime5__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(useCollectionGestureContext.CollectionGestureContext.Provider, { value: 'embedded', children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }) }));
        const items = await testHelpers.getContents();
        preact.fireEvent.keyUp(items[2], { key: 'Enter' });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        preact.fireEvent.keyUp(items[3], { key: 'Enter' });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('selects single items using enter keypress (Context value is default)', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime6__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(useCollectionGestureContext.CollectionGestureContext.Provider, { value: 'default', children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }) }));
        const items = await testHelpers.getContents();
        preact.fireEvent.keyUp(items[2], { key: 'Enter' });
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('select multiple items then click on a selected items', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime7__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        testHelpers.mouseItemSelection(items[5], { shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        testHelpers.mouseItemSelection(items[3]);
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('false');
        });
    });
    it('select multiple items then shift click on a selected items', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime8__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        testHelpers.mouseItemSelection(items[5], { shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        testHelpers.mouseItemSelection(items[3], { shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('false');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('false');
        });
    });
    it('select multiple items then metaKey click on a selected items, to select and unselect', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime9__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        testHelpers.mouseItemSelection(items[5], { shiftKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // first click to deselect
        testHelpers.mouseItemSelection(items[3], { metaKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // second click to reselect
        testHelpers.mouseItemSelection(items[3], { metaKey: true });
        await preact.waitFor(() => {
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        });
        await preact.waitFor(() => {
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        });
        // click outside of range should be additive too
        testHelpers.mouseItemSelection(items[7], { metaKey: true });
        await preact.waitFor(() => {
            /* eslint-disable */
            chai.expect(items[2].getAttribute('aria-selected')).eq('true');
            chai.expect(items[3].getAttribute('aria-selected')).eq('true');
            chai.expect(items[4].getAttribute('aria-selected')).eq('true');
            chai.expect(items[5].getAttribute('aria-selected')).eq('true');
            chai.expect(items[6].getAttribute('aria-selected')).eq('false');
            chai.expect(items[7].getAttribute('aria-selected')).eq('true');
            /* eslint-enable */
        });
    }, 3000);
    it('supports multi-select (and deselect) via keyboard arrow keys', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime10__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // select items 1-3
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        // deselect 2 and 3 via up-arrow
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // continue up past initial anchor, to select items 0 and 1
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('supports extending mouse initiated range select via arrow keys', async () => {
        const data = listViewTestFixtures.populateData(100);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime11__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // select items 2-5 via click
        testHelpers.mouseItemSelection(items[2]);
        testHelpers.mouseItemSelection(items[5], { shiftKey: true });
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        chai.expect(items[6].getAttribute('aria-selected')).eq('false');
        chai.expect(items[7].getAttribute('aria-selected')).eq('false');
        // now extend by two more rows
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        chai.expect(items[6].getAttribute('aria-selected')).eq('true');
        chai.expect(items[7].getAttribute('aria-selected')).eq('true');
        // now deselect those via up-arrow
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
        chai.expect(items[4].getAttribute('aria-selected')).eq('true');
        chai.expect(items[5].getAttribute('aria-selected')).eq('true');
        chai.expect(items[6].getAttribute('aria-selected')).eq('false');
        chai.expect(items[7].getAttribute('aria-selected')).eq('false');
    });
    it('supports range selection from current item to shift+click item', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime12__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
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
    it('supports range selection from current item to shift+arrow items', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime13__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 3rd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
    });
    it('supports range selection from current item, shift+click and then shift+click', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime14__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
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
    it('supports range selection from current item, shift+click and then shift+arrow  ', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime15__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
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
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('supports range selection from current item, shift+click and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime16__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
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
    it('supports range selection from current item, shift+arrow and then shift+click  ', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime17__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
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
    it('supports range selection from current item, shift+arrow and then shift+arrow  ', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime18__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('true');
        chai.expect(items[1].getAttribute('aria-selected')).eq('true');
        chai.expect(items[2].getAttribute('aria-selected')).eq('false');
        chai.expect(items[3].getAttribute('aria-selected')).eq('false');
        // arrow to the 3rd item, then shift + arrow to the 4th item
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown' });
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
        chai.expect(items[0].getAttribute('aria-selected')).eq('false');
        chai.expect(items[1].getAttribute('aria-selected')).eq('false');
        chai.expect(items[2].getAttribute('aria-selected')).eq('true');
        chai.expect(items[3].getAttribute('aria-selected')).eq('true');
    });
    it('supports range selection from current item, shift+arrow and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime19__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        // tab and focus to make the 1st item current
        await userEvent__default["default"].tab();
        chai.expect(grid.matches(':focus')).to.be.true;
        // shift + arrow to the 2nd item
        preact.fireEvent.click(items[0]);
        preact.fireEvent.keyDown(grid, { key: 'ArrowDown', shiftKey: true });
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
    it('supports range selection from current item, shift+space and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(4);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime20__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
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
    it('supports range selection shift+space and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime21__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[0]);
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
    it('supports range selection and deselect selected item by shift+space', async () => {
        const data = listViewTestFixtures.populateData(3);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime22__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[0]);
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
    it('supports range selection backward shift+space and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime23__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
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
    it('supports range selection backward shift+click and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime24__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        // shift + click to select the 1st item
        testHelpers.mouseItemSelection(items[0], { shiftKey: true });
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
    it('supports range selection backward shift+arrow and then shift+space', async () => {
        const data = listViewTestFixtures.populateData(5);
        const dataMetadata = data.map((data) => {
            return { data: data, metadata: { key: data.id } };
        });
        const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
        const { default: translations } = await __variableDynamicImportRuntime25__(`../../../resources/nls/${locale}/bundle.ts`);
        const env = {
            translations: { '@oracle/oraclejet-preact': translations }
        };
        preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TestComponent, { data: dataMetadata, selectionMode: "multiple" }) }));
        const grid = await testHelpers.getRoot();
        const items = await testHelpers.getContents();
        testHelpers.mouseItemSelection(items[2]);
        // shift + arrow to select the 1st item
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
        preact.fireEvent.keyDown(grid, { key: 'ArrowUp', shiftKey: true });
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

exports.testAria = testAria;
exports.testContextMenu = testContextMenu;
exports.testGridlines = testGridlines;
exports.testItemAction = testItemAction;
exports.testKeys = testKeys;
exports.testNavigation = testNavigation;
exports.testRender = testRender;
exports.testReorder = testReorder;
exports.testScrollPosition = testScrollPosition;
exports.testSelection = testSelection;
//# sourceMappingURL=listViewSelectionTests-3d07b4e3.js.map
