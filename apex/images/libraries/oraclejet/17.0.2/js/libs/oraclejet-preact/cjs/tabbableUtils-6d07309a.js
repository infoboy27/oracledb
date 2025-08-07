/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var matchTranslationBundle = require('./matchTranslationBundle-99625a42.js');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var TabbableModeContext = require('./TabbableModeContext-e99d527e.js');
require('preact/hooks');

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
const setupTabbableComponent = async (component, isTabbable) => {
    const locale = matchTranslationBundle.matchTranslationBundle(['en'], new Set(['en-US', 'en']));
    const { default: translations } = await __variableDynamicImportRuntime0__(`../../resources/nls/${locale}/bundle.ts`);
    const env = {
        translations: { '@oracle/oraclejet-preact': translations }
    };
    if (isTabbable !== undefined) {
        return preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: jsxRuntime.jsx(TabbableModeContext.TabbableModeContext.Provider, { value: { isTabbable: isTabbable }, children: component }) }));
    }
    else {
        return preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: env, children: component }));
    }
};

exports.setupTabbableComponent = setupTabbableComponent;
//# sourceMappingURL=tabbableUtils-6d07309a.js.map
