/* @oracle/oraclejet-preact: undefined */
import { jsx } from 'preact/jsx-runtime';
import { render } from '@testing-library/preact';
import userEvent from '@testing-library/user-event';
import './LayerHost-45f545d7.js';
import { R as RootEnvironmentProvider } from './EnvironmentProvider-f543a463.js';
import bundle from './resources/nls/en/bundle.js';

const defaultEnvironment = {
    translations: { '@oracle/oraclejet-preact': bundle },
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
    const { rerender: _rerender, ...result } = render(jsx(RootEnvironmentProvider, { environment: mergedEnvironment, children: children }), options);
    const rerender = (children) => _rerender(jsx(RootEnvironmentProvider, { environment: mergedEnvironment, children: children }));
    return { rerender, ...result };
};
const renderAndSetupInEnv = (...args) => ({
    user: userEvent.setup(),
    ...renderInEnv(...args)
});

export { renderAndSetupInEnv as a, renderInEnv as r };
//# sourceMappingURL=render-c90e85c7.js.map
