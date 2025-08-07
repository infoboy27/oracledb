/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var preact = require('@testing-library/preact');
var userEvent = require('@testing-library/user-event');
require('./LayerHost-46e4d858.js');
var EnvironmentProvider = require('./EnvironmentProvider-42b2b998.js');
var resources_nls_en_bundle = require('./resources/nls/en/bundle.js');

function _interopDefaultLegacy (e) { return e && typeof e === 'object' && 'default' in e ? e : { 'default': e }; }

var userEvent__default = /*#__PURE__*/_interopDefaultLegacy(userEvent);

const defaultEnvironment = {
    translations: { '@oracle/oraclejet-preact': resources_nls_en_bundle["default"] },
    mode: 'test'
};
const renderInEnv = (children, environment = defaultEnvironment, options) => {
    // We merge the provided environment with the default environment here. This way tests
    // can override some part of the environment without having to provide the other parts.
    // For example, if a test wants to provide `user.locale`, then it can do:
    //
    // renderInEnv(<SomeComponent />, { user: { locale: 'en-US' } });
    //
    // With this call, the test do not have to provide `translations` and `mode`. The provided
    // `user` object will be merged with the default environment. The final environment object
    // will have `translations`, `mode`, and `user` properties specified in it.
    const mergedEnvironment = { ...defaultEnvironment, ...environment };
    const { rerender: _rerender, ...result } = preact.render(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: mergedEnvironment, children: children }), options);
    const rerender = (children) => _rerender(jsxRuntime.jsx(EnvironmentProvider.RootEnvironmentProvider, { environment: mergedEnvironment, children: children }));
    return { rerender, ...result };
};
const renderAndSetupInEnv = (...args) => ({
    user: userEvent__default["default"].setup(),
    ...renderInEnv(...args)
});

exports.renderAndSetupInEnv = renderAndSetupInEnv;
exports.renderInEnv = renderInEnv;
//# sourceMappingURL=render-7a552b40.js.map
