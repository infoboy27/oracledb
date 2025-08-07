/* @oracle/oraclejet-preact: undefined */
'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var jsxRuntime = require('preact/jsx-runtime');
var Flex = require('./Flex-fbba4ad6.js');
var padding = require('./padding-b9ee87ac.js');
var mergeInterpolations = require('./mergeInterpolations-6727b536.js');

var useTestId = require('./useTestId-8234ec1e.js');
require('./classNames-c14c6ef3.js');
require('./boxalignment-5ef612ee.js');
require('./size-4e606ce4.js');
require('./utils-b7099be5.js');
require('./Common/themes/themeContract.css.js');
require('./colorUtils-fe6f2fbf.js');
require('./_curry1-e8f0d7ea.js');
require('./arrayUtils-7d8dcfc3.js');

require('./vanilla-extract-sprinkles-createRuntimeSprinkles.esm-d68f3e0f.js');
require('./dimensions-b48bf1ab.js');
require('./flexbox-2cae9a01.js');

require('./flexitem-fee13e26.js');


require('./mergeDeepWithKey-210b024d.js');
require('./_curry3-18677bca.js');
require('./_curry2-c15d89cd.js');
require('./_isObject-28636267.js');
require('./LayerHost-46e4d858.js');
require('preact');
require('./Common/themes/redwood/theme.js');
require('preact/compat');
require('preact/hooks');

var containerStyles = 'DatePickerLayoutStyles_containerStyles__q124vl0';

const interpolations = [...Object.values(padding.paddingInterpolations)];
const mergedInterpolations = mergeInterpolations.mergeInterpolations(interpolations);
/**
 * The DatePickerLayout component can be used to layout the contents
 * of the DatePicker, like header and the main content.
 */
const DatePickerLayout = ({ children, gap = '4x', header, padding, paddingBlockEnd = '4x', paddingBlockStart = '4x', paddingInlineEnd = '4x', paddingInlineStart = '4x', testId }) => {
    const styles = mergedInterpolations({
        padding,
        paddingBlockEnd,
        paddingBlockStart,
        paddingInlineEnd,
        paddingInlineStart
    });
    const testIdProps = useTestId.useTestId(testId);
    return (jsxRuntime.jsx("div", { className: containerStyles, style: styles, ...testIdProps, children: jsxRuntime.jsxs(Flex.Flex, { direction: "column", gap: gap, children: [header, children] }) }));
};

exports.DatePickerLayout = DatePickerLayout;
//# sourceMappingURL=PRIVATE_DatePickerLayout.js.map
