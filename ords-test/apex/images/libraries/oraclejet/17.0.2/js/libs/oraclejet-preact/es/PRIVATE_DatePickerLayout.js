/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs } from 'preact/jsx-runtime';
import { F as Flex } from './Flex-24628925.js';
import { p as paddingInterpolations } from './padding-01bef196.js';
import { m as mergeInterpolations } from './mergeInterpolations-e2db2a66.js';
import './DatePickerLayoutStyles.styles.css';
import { u as useTestId } from './useTestId-adde554c.js';
import './classNames-4e12b00d.js';
import './boxalignment-486c5ac9.js';
import './size-782ed57a.js';
import './utils-6eab3a64.js';
import './Common/themes/themeContract.css.js';
import './colorUtils-16eb823f.js';
import './_curry1-25297e59.js';
import './arrayUtils-35a58161.js';
import './boxalignment.styles.css';
import './vanilla-extract-sprinkles-createRuntimeSprinkles.esm-2d655d37.js';
import './dimensions-5229d942.js';
import './flexbox-529f25da.js';
import './flexbox.styles.css';
import './flexitem-7b7f7920.js';
import './flexitem.styles.css';
import './FlexStyles.styles.css';
import './mergeDeepWithKey-08531060.js';
import './_curry3-0b4222d7.js';
import './_curry2-34316bcf.js';
import './_isObject-1fab0f5b.js';
import './LayerHost-45f545d7.js';
import 'preact';
import './Common/themes/redwood/theme.js';
import 'preact/compat';
import 'preact/hooks';

var containerStyles = 'DatePickerLayoutStyles_containerStyles__q124vl0';

const interpolations = [...Object.values(paddingInterpolations)];
const mergedInterpolations = mergeInterpolations(interpolations);
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
    const testIdProps = useTestId(testId);
    return (jsx("div", { className: containerStyles, style: styles, ...testIdProps, children: jsxs(Flex, { direction: "column", gap: gap, children: [header, children] }) }));
};

export { DatePickerLayout };
//# sourceMappingURL=PRIVATE_DatePickerLayout.js.map
