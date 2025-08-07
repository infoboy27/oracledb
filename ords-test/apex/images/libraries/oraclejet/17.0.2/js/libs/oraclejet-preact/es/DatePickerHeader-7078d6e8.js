/* @oracle/oraclejet-preact: undefined */
import { jsx, jsxs, Fragment } from 'preact/jsx-runtime';
import { F as Flex } from './Flex-24628925.js';
import { I as IconButton } from './IconButton-37310d21.js';
import { S as SvgCaretDown } from './CaretDown-36ae16fe.js';
import { I as Icon } from './Icon-90c3a630.js';
import { S as SvgChevronLeft, a as SvgChevronRight } from './ChevronRight-083aef16.js';
import { T as Text } from './Text-da8588ce.js';
import { T as ToggleButton } from './ToggleButton-d34f976d.js';
import { V as View } from './View-6013acac.js';
import { u as useUser } from './useUser-99920e02.js';
import './getFormatParse-8a357e1c.js';
import './logger-c92f309c.js';
import { g as getLongFormattedYearMonth, a as getNumericFormattedYear } from './calendarDateUtils-d586e25e.js';
import { g as getMonthName } from './maskUtils-4bccc3d0.js';
import { useMemo } from 'preact/compat';
import { styles } from './PRIVATE_DatePickerHeader/themes/DatePickerHeaderStyles.css.js';

const SvgCaretUp = (props) => (jsx(Icon, { viewBox: "0 0 24 24", ...props, children: jsx("g", { fill: "none", children: jsx("path", { d: "M6 15s6.043-6 6-6c-.043 0 6 6 6 6H6z", fill: "currentcolor" }) }) }));

const SvgRadioButtonSmallOn = (props) => (jsx(Icon, { viewBox: "0 0 24 24", ...props, children: jsxs("g", { fill: "none", children: [jsx("path", { d: "M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6z", fill: "currentcolor" }), jsx("path", { d: "M18 12a6 6 0 1 1-12 0 6 6 0 0 1 12 0zm-1.5 0a4.5 4.5 0 1 0-9 0 4.5 4.5 0 0 0 9 0z", fill: "currentcolor" })] }) }));

/**
 * The DatePickerHeader component can be used to render the header for the
 * DatePicker component. It shows the current month, year and some additional
 * elements based on the configuration like previous, today and next navigation
 * buttons.
 */
const DatePickerHeader = ({ isPreviousNavigationButtonHidden = false, isTodayNavigationButtonHidden = false, isNextNavigationButtonHidden = false, month, monthToggleAccessibleLabel, monthYearHeader = 'independentButtons', nextNavigationAccessibleLabel, previousNavigationAccessibleLabel, testId, todayNavigationAccessibleLabel, toggleSelection = 'none', year, yearToggleAccessibleLabel, onMonthToggle, onNextNavigationAction, onPreviousNavigationAction, onTodayNavigationAction, onYearToggle }) => {
    const { locale, direction } = useUser();
    // format month and year to long string
    // { month: 3, year 2024 } -> 'March 2024'
    const longFormattedYearMonth = useMemo(() => getLongFormattedYearMonth(locale, year, month), [locale, month, year]);
    // format month and year to strings
    // { month: 3, year 2024 } -> { monthStr: 'Mar', yearStr: '2024' }
    const { monthStr, yearStr } = useMemo(() => ({
        monthStr: getMonthName(locale, month, year, 'short'),
        yearStr: getNumericFormattedYear(locale, year, month)
    }), [locale, month, year]);
    return (jsxs(Flex, { align: "center", justify: "between", testId: testId, children: [jsxs(Flex, { children: [monthYearHeader === 'independentButtons' && (jsx(Fragment, { children: jsxs("div", { class: styles['monthYearButtonContainer'], children: [jsx(ToggleButton, { "aria-label": monthToggleAccessibleLabel, label: monthStr, endIcon: toggleSelection === 'month' ? jsx(SvgCaretUp, {}) : jsx(SvgCaretDown, {}), isSelected: toggleSelection === 'month', onToggle: onMonthToggle, size: "sm", variant: "borderless" }), jsx(ToggleButton, { "aria-label": yearToggleAccessibleLabel, label: yearStr, endIcon: toggleSelection === 'year' ? jsx(SvgCaretUp, {}) : jsx(SvgCaretDown, {}), isSelected: toggleSelection === 'year', onToggle: onYearToggle, size: "sm", variant: "borderless" })] }) })), monthYearHeader === 'text' && (jsx(View, { paddingInlineStart: "3x", children: jsx(Text, { size: "md", weight: "semiBold", children: longFormattedYearMonth }) }))] }), jsxs(Flex, { children: [!isPreviousNavigationButtonHidden && (jsx(IconButton, { "aria-label": previousNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onPreviousNavigationAction, children: direction === 'ltr' ? jsx(SvgChevronLeft, {}) : jsx(SvgChevronRight, {}) })), !isTodayNavigationButtonHidden && (jsx(IconButton, { "aria-label": todayNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onTodayNavigationAction, children: jsx(SvgRadioButtonSmallOn, {}) })), !isNextNavigationButtonHidden && (jsx(IconButton, { "aria-label": nextNavigationAccessibleLabel, size: "sm", variant: "borderless", onAction: onNextNavigationAction, children: direction === 'ltr' ? jsx(SvgChevronRight, {}) : jsx(SvgChevronLeft, {}) }))] })] }));
};

export { DatePickerHeader as D };
//# sourceMappingURL=DatePickerHeader-7078d6e8.js.map
