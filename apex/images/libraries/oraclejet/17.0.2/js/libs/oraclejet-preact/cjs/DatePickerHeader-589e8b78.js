/* @oracle/oraclejet-preact: undefined */
'use strict';

var jsxRuntime = require('preact/jsx-runtime');
var Flex = require('./Flex-fbba4ad6.js');
var IconButton = require('./IconButton-94f8ca5c.js');
var CaretDown = require('./CaretDown-f123fd41.js');
var Icon = require('./Icon-3ffd13dc.js');
var ChevronRight = require('./ChevronRight-3aa70117.js');
var Text = require('./Text-aaacb6a0.js');
var ToggleButton = require('./ToggleButton-d54a249c.js');
var View = require('./View-011404a7.js');
var useUser = require('./useUser-a6d15333.js');
require('./getFormatParse-4a697b8f.js');
require('./logger-2b636482.js');
var calendarDateUtils = require('./calendarDateUtils-ca9bde6d.js');
var maskUtils = require('./maskUtils-f03f9c47.js');
var compat = require('preact/compat');
var PRIVATE_DatePickerHeader_themes_DatePickerHeaderStyles_css = require('./PRIVATE_DatePickerHeader/themes/DatePickerHeaderStyles.css.js');

const SvgCaretUp = (props) => (jsxRuntime.jsx(Icon.Icon, { viewBox: "0 0 24 24", ...props, children: jsxRuntime.jsx("g", { fill: "none", children: jsxRuntime.jsx("path", { d: "M6 15s6.043-6 6-6c-.043 0 6 6 6 6H6z", fill: "currentcolor" }) }) }));

const SvgRadioButtonSmallOn = (props) => (jsxRuntime.jsx(Icon.Icon, { viewBox: "0 0 24 24", ...props, children: jsxRuntime.jsxs("g", { fill: "none", children: [jsxRuntime.jsx("path", { d: "M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6z", fill: "currentcolor" }), jsxRuntime.jsx("path", { d: "M18 12a6 6 0 1 1-12 0 6 6 0 0 1 12 0zm-1.5 0a4.5 4.5 0 1 0-9 0 4.5 4.5 0 0 0 9 0z", fill: "currentcolor" })] }) }));

/**
 * The DatePickerHeader component can be used to render the header for the
 * DatePicker component. It shows the current month, year and some additional
 * elements based on the configuration like previous, today and next navigation
 * buttons.
 */
const DatePickerHeader = ({ isPreviousNavigationButtonHidden = false, isTodayNavigationButtonHidden = false, isNextNavigationButtonHidden = false, month, monthToggleAccessibleLabel, monthYearHeader = 'independentButtons', nextNavigationAccessibleLabel, previousNavigationAccessibleLabel, testId, todayNavigationAccessibleLabel, toggleSelection = 'none', year, yearToggleAccessibleLabel, onMonthToggle, onNextNavigationAction, onPreviousNavigationAction, onTodayNavigationAction, onYearToggle }) => {
    const { locale, direction } = useUser.useUser();
    // format month and year to long string
    // { month: 3, year 2024 } -> 'March 2024'
    const longFormattedYearMonth = compat.useMemo(() => calendarDateUtils.getLongFormattedYearMonth(locale, year, month), [locale, month, year]);
    // format month and year to strings
    // { month: 3, year 2024 } -> { monthStr: 'Mar', yearStr: '2024' }
    const { monthStr, yearStr } = compat.useMemo(() => ({
        monthStr: maskUtils.getMonthName(locale, month, year, 'short'),
        yearStr: calendarDateUtils.getNumericFormattedYear(locale, year, month)
    }), [locale, month, year]);
    return (jsxRuntime.jsxs(Flex.Flex, { align: "center", justify: "between", testId: testId, children: [jsxRuntime.jsxs(Flex.Flex, { children: [monthYearHeader === 'independentButtons' && (jsxRuntime.jsx(jsxRuntime.Fragment, { children: jsxRuntime.jsxs("div", { class: PRIVATE_DatePickerHeader_themes_DatePickerHeaderStyles_css.styles['monthYearButtonContainer'], children: [jsxRuntime.jsx(ToggleButton.ToggleButton, { "aria-label": monthToggleAccessibleLabel, label: monthStr, endIcon: toggleSelection === 'month' ? jsxRuntime.jsx(SvgCaretUp, {}) : jsxRuntime.jsx(CaretDown.SvgCaretDown, {}), isSelected: toggleSelection === 'month', onToggle: onMonthToggle, size: "sm", variant: "borderless" }), jsxRuntime.jsx(ToggleButton.ToggleButton, { "aria-label": yearToggleAccessibleLabel, label: yearStr, endIcon: toggleSelection === 'year' ? jsxRuntime.jsx(SvgCaretUp, {}) : jsxRuntime.jsx(CaretDown.SvgCaretDown, {}), isSelected: toggleSelection === 'year', onToggle: onYearToggle, size: "sm", variant: "borderless" })] }) })), monthYearHeader === 'text' && (jsxRuntime.jsx(View.View, { paddingInlineStart: "3x", children: jsxRuntime.jsx(Text.Text, { size: "md", weight: "semiBold", children: longFormattedYearMonth }) }))] }), jsxRuntime.jsxs(Flex.Flex, { children: [!isPreviousNavigationButtonHidden && (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": previousNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onPreviousNavigationAction, children: direction === 'ltr' ? jsxRuntime.jsx(ChevronRight.SvgChevronLeft, {}) : jsxRuntime.jsx(ChevronRight.SvgChevronRight, {}) })), !isTodayNavigationButtonHidden && (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": todayNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onTodayNavigationAction, children: jsxRuntime.jsx(SvgRadioButtonSmallOn, {}) })), !isNextNavigationButtonHidden && (jsxRuntime.jsx(IconButton.IconButton, { "aria-label": nextNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onNextNavigationAction, children: direction === 'ltr' ? jsxRuntime.jsx(ChevronRight.SvgChevronRight, {}) : jsxRuntime.jsx(ChevronRight.SvgChevronLeft, {}) }))] })] }));
};

exports.DatePickerHeader = DatePickerHeader;
//# sourceMappingURL=DatePickerHeader-589e8b78.js.map
